CXX = clang++
CXXFLAGS = -std=c++23 -Wall -Wextra -O2
BINDIR = bin

# Build targets
$(BINDIR)/secretEntrance: day1/secretEntrance.cpp
	@mkdir -p $(BINDIR)
	$(CXX) $(CXXFLAGS) $< -o $@

$(BINDIR)/giftShop: day2/giftShop.cpp
	@mkdir -p $(BINDIR)
	$(CXX) $(CXXFLAGS) $< -o $@

# Detect .in files
DAY1_INS := $(wildcard day1/*.in)
DAY2_INS := $(wildcard day2/*.in)
DAY1_NAMES := $(notdir $(DAY1_INS))
DAY2_NAMES := $(notdir $(DAY2_INS))

# Dynamic run targets for day1 inputs
$(addprefix run-day1-,$(DAY1_NAMES)): run-day1-%: $(BINDIR)/secretEntrance
	./$(BINDIR)/secretEntrance < day1/$*.in && echo "✓ day1/$*.in" || echo "✗ day1/$*.in"

# Dynamic run targets for day2 inputs
$(addprefix run-day2-,$(DAY2_NAMES)): run-day2-%: $(BINDIR)/giftShop
	./$(BINDIR)/giftShop < day2/$*.in && echo "✓ day2/$*.in" || echo "✗ day2/$*.in"

# Run all inputs tests
test: $(BINDIR)/secretEntrance $(BINDIR)/giftShop
	$(foreach file,$(DAY1_NAMES),./$(BINDIR)/secretEntrance < day1/$(file) && echo "✓ day1/$(file)" || echo "✗ day1/$(file)";)
	$(foreach file,$(DAY2_NAMES),./$(BINDIR)/giftShop < day2/$(file) && echo "✓ day2/$(file)" || echo "✗ day2/$(file)";)

# Convenience targets
run-day1: run-day1-1.in
run-day2: run-day2-1.in

all: $(BINDIR)/secretEntrance $(BINDIR)/giftShop

clean:
	rm -rf $(BINDIR)

.PHONY: all clean test run-day1 run-day2 $(addprefix run-day1-,$(DAY1_NAMES)) $(addprefix run-day2-,$(DAY2_NAMES))

