
# Bash Allergy Checker
A bash script to determine allergies based on a numeric allergy score.

## Allergens and Their Values

- eggs: 1
- peanuts: 2
- shellfish: 4
- strawberries: 8
- tomatoes: 16
- chocolate: 32
- pollen: 64
- cats: 128

## Usage

```bash
# Check specific allergy
./allergy_checker.sh <score> allergic_to <allergen>

# List all allergies
./allergy_checker.sh <score> list

# Examples
./allergy_checker.sh 34 allergic_to peanuts  # true
./allergy_checker.sh 34 list                 # peanuts chocolate
