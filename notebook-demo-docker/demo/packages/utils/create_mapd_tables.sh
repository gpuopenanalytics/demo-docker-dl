set -e
# Create tables
cat ./create_adult_numeric_train.sql | ~/mapd/bin/mapdql -p HyperInteractive
cat ./create_adult_numeric_test.sql | ~/mapd/bin/mapdql -p HyperInteractive
# Import Data
echo "COPY adult_numeric_train FROM '~/data/adult_numeric_train.csv';" | ~/mapd/bin/mapdql -p HyperInteractive
echo "COPY adult_numeric_test FROM '~/data/adult_numeric_test.csv';" | ~/mapd/bin/mapdql -p HyperInteractive

