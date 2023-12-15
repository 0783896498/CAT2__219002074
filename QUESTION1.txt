#!/bin/bash

# Function to check if a number is prime
is_prime() {
    num=$1
    if [ $num -eq 1 ]; then
        echo "$num is not a prime number."
        return
    fi
    for((i=2; i<=num/2; i++))
    do
        if [ $(($num%i)) -eq 0 ]
        then
            echo "$num is not a prime number."
            return
        fi
    done
    echo "$num is a prime number."
}

# Function to check if a number is palindrome
is_palindrome() {
    num=$1
    reverse=$(echo $num | rev)
    if [ $num -eq $reverse ]; then
        echo "$num is a palindrome."
    else
        echo "$num is not a palindrome."
    fi
}

# Function to calculate sum and product of digits
sum_and_product() {
    num=$1
    sum=0
    prod=1
    while [ $num -gt 0 ]
    do
        digit=$(($num%10))
        sum=$(($sum+$digit))
        prod=$(($prod*$digit))
        num=$(($num/10))
    done
    echo "Sum of digits: $sum"
    echo "Product of digits: $prod"
}

# Check if there are not exactly 2 command line arguments
if [ $# -ne 2 ]; then
    echo "Please provide one positive integer and one choice (1-3)."
    exit 1
fi

# Check if the first argument is not a positive integer
if ! [[ $1 =~ ^[0-9]+$ ]]; then
    echo "The first argument is not a positive integer."
    exit 1
fi

# Check if the second argument is not between 1 and 3
if ! [[ $2 =~ ^[1-3]$ ]]; then
    echo "The second argument is not a valid choice (1-3)."
    exit 1
fi

# Perform the operation based on the user's choice
case $2 in
    1)
        sum_and_product $1
        ;;
    2)
        is_palindrome $1
        ;;
    3)
        is_prime $1
        ;;
esac
