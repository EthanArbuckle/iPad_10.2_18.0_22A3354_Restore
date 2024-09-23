@implementation NSOrderedSet(SBFloatingDockSuggestions)

- (BOOL)sb_containsFloatingDockSuggestionDisplayItem:()SBFloatingDockSuggestions
{
  return objc_msgSend(a1, "sb_indexOfFloatingDockSuggestionDisplayItem:") != 0x7FFFFFFFFFFFFFFFLL;
}

- (uint64_t)sb_indexOfFloatingDockSuggestionDisplayItem:()SBFloatingDockSuggestions
{
  id v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __87__NSOrderedSet_SBFloatingDockSuggestions__sb_indexOfFloatingDockSuggestionDisplayItem___block_invoke;
  v8[3] = &unk_1E8EA2408;
  v9 = v4;
  v5 = v4;
  v6 = objc_msgSend(a1, "indexOfObjectPassingTest:", v8);

  return v6;
}

@end
