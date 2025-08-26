
```bash
#!/bin/bash

# Allergy values and their names
declare -A ALLERGENS=(
    [1]="eggs"
    [2]="peanuts"
    [4]="shellfish"
    [8]="strawberries"
    [16]="tomatoes"
    [32]="chocolate"
    [64]="pollen"
    [128]="cats"
)

# Function to check if allergic to a specific item
allergic_to() {
    local score=$1
    local allergen=$2
    
    for value in "${!ALLERGENS[@]}"; do
        if [ "${ALLERGENS[$value]}" = "$allergen" ]; then
            if [ $((score & value)) -ne 0 ]; then
                echo "true"
                return 0
            else
                echo "false"
                return 0
            fi
        fi
    done
    
    echo "false"
}

# Function to list all allergies
list_allergies() {
    local score=$1
    local allergies=()
    
    for value in 1 2 4 8 16 32 64 128; do
        if [ $((score & value)) -ne 0 ]; then
            allergies+=("${ALLERGENS[$value]}")
        fi
    done
    
    echo "${allergies[@]}"
}

# Main execution
if [ $# -lt 2 ]; then
    echo "Usage: $0 <score> allergic_to <allergen>"
    echo "       $0 <score> list"
    exit 1
fi

score=$1
command=$2
allergen=$3

# Validate input is a number
if ! [[ "$score" =~ ^[0-9]+$ ]]; then
    echo "Error: Score must be a positive integer"
    exit 1
fi

case "$command" in
    "allergic_to")
        if [ -z "$allergen" ]; then
            echo "Error: Must specify an allergen for 'allergic_to' command"
            exit 1
        fi
        
        # Validate allergen exists
        valid_allergen=false
        for value in "${!ALLERGENS[@]}"; do
            if [ "${ALLERGENS[$value]}" = "$allergen" ]; then
                valid_allergen=true
                break
            fi
        done
        
        if [ "$valid_allergen" = "false" ]; then
            echo "Error: Unknown allergen '$allergen'"
            exit 1
        fi
        
        allergic_to "$score" "$allergen"
        ;;
        
    "list")
        list_allergies "$score"
        ;;
        
    *)
        echo "Error: Unknown command '$command'"
        exit 1
        ;;
esac
