#!/bin/bash

# Test function
run_test() {
    local score=$1
    local command=$2
    local allergen=$3
    local expected=$4
    
    result=$(./allergy_checker.sh $score $command $allergen)
    
    if [ "$result" = "$expected" ]; then
        echo "✓ PASS: Score $score $command $allergen = $result"
    else
        echo "✗ FAIL: Score $score $command $allergen"
        echo "  Expected: $expected"
        echo "  Got: $result"
    fi
}

# Make script executable
chmod +x allergy_checker.sh

# Test cases
echo "Running allergy tests..."

# Test allergic_to command
run_test 0 allergic_to peanuts "false"
run_test 0 allergic_to cats "false"
run_test 0 allergic_to strawberries "false"

run_test 5 allergic_to eggs "true"
run_test 5 allergic_to shellfish "true"
run_test 5 allergic_to strawberries "false"

# Test list command
echo ""
echo "Testing list command..."
echo "Score 0: $(./allergy_checker.sh 0 list)"
echo "Score 3: $(./allergy_checker.sh 3 list)"
echo "Score 34: $(./allergy_checker.sh 34 list)"
