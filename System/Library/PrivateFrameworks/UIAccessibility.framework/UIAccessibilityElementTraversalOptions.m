@implementation UIAccessibilityElementTraversalOptions

+ (id)options
{
  return objc_alloc_init((Class)a1);
}

+ (id)defaultVoiceOverOptions
{
  return (id)objc_msgSend(a1, "voiceOverOptionsIncludingElementsFromOpaqueProviders:honorsGroups:", 0, 0);
}

+ (id)defaultVoiceOverOptionsHonoringGroups
{
  return (id)objc_msgSend(a1, "voiceOverOptionsIncludingElementsFromOpaqueProviders:honorsGroups:", 0, 1);
}

+ (id)voiceOverOptionsIncludingElementsFromOpaqueProviders:(BOOL)a3 honorsGroups:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  _QWORD v9[5];
  BOOL v10;
  BOOL v11;

  v4 = a4;
  objc_msgSend(a1, "options");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHonorsElementGrouping:", v4);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __108__UIAccessibilityElementTraversalOptions_voiceOverOptionsIncludingElementsFromOpaqueProviders_honorsGroups___block_invoke;
  v9[3] = &__block_descriptor_42_e8_B16__0_8l;
  v9[4] = a1;
  v10 = a3;
  v11 = v4;
  objc_msgSend(v7, "setLeafNodePredicate:", v9);
  return v7;
}

uint64_t __108__UIAccessibilityElementTraversalOptions_voiceOverOptionsIncludingElementsFromOpaqueProviders_honorsGroups___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a2;
  if (objc_msgSend(v3, "isAccessibilityElement")
    && (v4 = objc_msgSend(*(id *)(a1 + 32), "accessibilityTraits"), (UIAccessibilityTraitSpacer & ~v4) != 0)
    || !*(_BYTE *)(a1 + 40) && (objc_msgSend(v3, "isAccessibilityOpaqueElementProvider") & 1) != 0)
  {
    v5 = 1;
  }
  else if (*(_BYTE *)(a1 + 41))
  {
    v5 = objc_msgSend(v3, "_accessibilityIsGroupedParent");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)defaultSwitchControlOptions
{
  void *v2;

  objc_msgSend(a1, "options");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShouldReturnScannerGroups:", 1);
  objc_msgSend(v2, "setShouldOnlyIncludeElementsWithVisibleFrame:", 1);
  objc_msgSend(v2, "setShouldIncludeStatusBarWindow:", 1);
  objc_msgSend(v2, "setLeafNodePredicate:", &__block_literal_global_3);
  return v2;
}

uint64_t __69__UIAccessibilityElementTraversalOptions_defaultSwitchControlOptions__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "isAccessibilityElement"))
    v3 = objc_msgSend(v2, "accessibilityRespondsToUserInteraction");
  else
    v3 = 0;

  return v3;
}

+ (id)defaultSpeakScreenOptions
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  +[UIAccessibilityElementTraversalOptions options](UIAccessibilityElementTraversalOptions, "options");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLeafNodePredicate:", &__block_literal_global_176);
  objc_msgSend(v2, "setForSpeakScreen:", 1);
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilitySpeakThisRootElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  AXLogSpeakScreen();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    +[UIAccessibilityElementTraversalOptions defaultSpeakScreenOptions].cold.2();

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_accessibilitySpeakThisViewsFromSceneRequestedForActiveSpeakScreenSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  AXLogSpeakScreen();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    +[UIAccessibilityElementTraversalOptions defaultSpeakScreenOptions].cold.1();

  if (v4)
  {
    v13[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setAllowedElementsForTraversal:", v9);
  }
  else
  {
    if (v7)
    {
      objc_msgSend(v2, "setAllowedElementsForTraversal:", v7);
      goto LABEL_10;
    }
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_accessibilitySpeakThisViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_accessibilitySpeakThisViews");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setAllowedElementsForTraversal:", v12);

  }
LABEL_10:

  return v2;
}

uint64_t __67__UIAccessibilityElementTraversalOptions_defaultSpeakScreenOptions__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_msgSend(v2, "_accessibilitySpeakThisIgnoresAccessibilityElementStatus") & 1) != 0
    || objc_msgSend(v2, "_accessibilityIsSpeakThisElement")
    && (objc_msgSend(v2, "isAccessibilityElement") & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    v3 = objc_msgSend(v2, "isAccessibilityOpaqueElementProvider");
  }

  return v3;
}

+ (id)defaultFullKeyboardAccessOptions
{
  void *v2;

  objc_msgSend(a1, "options");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShouldIncludeStatusBarWindow:", 1);
  objc_msgSend(v2, "setLeafNodePredicate:", &__block_literal_global_179);
  return v2;
}

uint64_t __74__UIAccessibilityElementTraversalOptions_defaultFullKeyboardAccessOptions__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_accessibilityCanBecomeNativeFocused");
}

- (UIAccessibilityElementTraversalOptions)init
{
  UIAccessibilityElementTraversalOptions *v2;
  UIAccessibilityElementTraversalOptions *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIAccessibilityElementTraversalOptions;
  v2 = -[UIAccessibilityElementTraversalOptions init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[UIAccessibilityElementTraversalOptions setDirection:](v2, "setDirection:", 1);
    -[UIAccessibilityElementTraversalOptions setSorted:](v3, "setSorted:", 1);
  }
  return v3;
}

- (id)description
{
  int64_t v3;
  __CFString *v4;
  __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  objc_super v26;

  v3 = -[UIAccessibilityElementTraversalOptions direction](self, "direction");
  v4 = CFSTR("previous");
  if (v3 == 1)
    v4 = CFSTR("next");
  v5 = v4;
  if (-[UIAccessibilityElementTraversalOptions shouldOnlyIncludeElementsWithVisibleFrame](self, "shouldOnlyIncludeElementsWithVisibleFrame"))
  {
    v16 = CFSTR("only include elements with visible frame");
    v21 = CFSTR("__AXStringForVariablesSentinel");
    __UIAXStringForVariables();
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (__CFString *)v6;
  }
  if (-[UIAccessibilityElementTraversalOptions shouldReturnScannerGroups](self, "shouldReturnScannerGroups", v16, v21))
  {
    v17 = CFSTR("scanner groups");
    v22 = CFSTR("__AXStringForVariablesSentinel");
    __UIAXStringForVariables();
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (__CFString *)v7;
  }
  -[UIAccessibilityElementTraversalOptions leafNodePredicate](self, "leafNodePredicate", v17, v22);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v18 = CFSTR("has predicate");
    v23 = CFSTR("__AXStringForVariablesSentinel");
    __UIAXStringForVariables();
    v9 = objc_claimAutoreleasedReturnValue();

    v5 = (__CFString *)v9;
  }
  if (-[UIAccessibilityElementTraversalOptions forSpeakScreen](self, "forSpeakScreen", v18, v23))
  {
    v19 = CFSTR("for Speak Screen");
    v24 = CFSTR("__AXStringForVariablesSentinel");
    __UIAXStringForVariables();
    v10 = objc_claimAutoreleasedReturnValue();

    v5 = (__CFString *)v10;
  }
  if (-[UIAccessibilityElementTraversalOptions shouldUseAllSubviews](self, "shouldUseAllSubviews", v19, v24))
  {
    v20 = CFSTR("use all subviews");
    v25 = CFSTR("__AXStringForVariablesSentinel");
    __UIAXStringForVariables();
    v11 = objc_claimAutoreleasedReturnValue();

    v5 = (__CFString *)v11;
  }
  v12 = (void *)MEMORY[0x1E0CB3940];
  v26.receiver = self;
  v26.super_class = (Class)UIAccessibilityElementTraversalOptions;
  -[UIAccessibilityElementTraversalOptions description](&v26, sel_description, v20, v25);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("%@ - %@"), v13, v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)setAllowedElementsForTraversal:(id)a3
{
  NSArray *v5;
  NSArray **p_allowedElementsForTraversal;
  NSArray *allowedElementsForTraversal;
  NSArray *v8;

  v5 = (NSArray *)a3;
  allowedElementsForTraversal = self->_allowedElementsForTraversal;
  p_allowedElementsForTraversal = &self->_allowedElementsForTraversal;
  if (allowedElementsForTraversal != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_allowedElementsForTraversal, a3);
    v5 = v8;
  }

}

- (BOOL)shouldReturnScannerGroups
{
  return self->_shouldReturnScannerGroups;
}

- (void)setShouldReturnScannerGroups:(BOOL)a3
{
  self->_shouldReturnScannerGroups = a3;
}

- (int64_t)direction
{
  return self->_direction;
}

- (void)setDirection:(int64_t)a3
{
  self->_direction = a3;
}

- (id)leafNodePredicate
{
  return self->_leafNodePredicate;
}

- (void)setLeafNodePredicate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)shouldOnlyIncludeElementsWithVisibleFrame
{
  return self->_shouldOnlyIncludeElementsWithVisibleFrame;
}

- (void)setShouldOnlyIncludeElementsWithVisibleFrame:(BOOL)a3
{
  self->_shouldOnlyIncludeElementsWithVisibleFrame = a3;
}

- (BOOL)shouldIncludeKeyboardObscuredElements
{
  return self->_shouldIncludeKeyboardObscuredElements;
}

- (void)setShouldIncludeKeyboardObscuredElements:(BOOL)a3
{
  self->_shouldIncludeKeyboardObscuredElements = a3;
}

- (BOOL)shouldUseAllSubviews
{
  return self->_shouldUseAllSubviews;
}

- (void)setShouldUseAllSubviews:(BOOL)a3
{
  self->_shouldUseAllSubviews = a3;
}

- (BOOL)includeHiddenViews
{
  return self->_includeHiddenViews;
}

- (void)setIncludeHiddenViews:(BOOL)a3
{
  self->_includeHiddenViews = a3;
}

- (BOOL)includeWindowlessViews
{
  return self->_includeWindowlessViews;
}

- (void)setIncludeWindowlessViews:(BOOL)a3
{
  self->_includeWindowlessViews = a3;
}

- (BOOL)sorted
{
  return self->_sorted;
}

- (void)setSorted:(BOOL)a3
{
  self->_sorted = a3;
}

- (BOOL)includeAncestorsOfSelfInSiblingMatch
{
  return self->_includeAncestorsOfSelfInSiblingMatch;
}

- (void)setIncludeAncestorsOfSelfInSiblingMatch:(BOOL)a3
{
  self->_includeAncestorsOfSelfInSiblingMatch = a3;
}

- (BOOL)honorsElementGrouping
{
  return self->_honorsElementGrouping;
}

- (void)setHonorsElementGrouping:(BOOL)a3
{
  self->_honorsElementGrouping = a3;
}

- (NSArray)allowedElementsForTraversal
{
  return self->_allowedElementsForTraversal;
}

- (BOOL)shouldExcludeSupplementaryViews
{
  return self->_shouldExcludeSupplementaryViews;
}

- (void)setShouldExcludeSupplementaryViews:(BOOL)a3
{
  self->_shouldExcludeSupplementaryViews = a3;
}

- (BOOL)forSpeakScreen
{
  return self->_forSpeakScreen;
}

- (void)setForSpeakScreen:(BOOL)a3
{
  self->_forSpeakScreen = a3;
}

- (BOOL)shouldIncludeStatusBarWindow
{
  return self->_shouldIncludeStatusBarWindow;
}

- (void)setShouldIncludeStatusBarWindow:(BOOL)a3
{
  self->_shouldIncludeStatusBarWindow = a3;
}

- (id)alternateViewChildrenHandler
{
  return self->_alternateViewChildrenHandler;
}

- (void)setAlternateViewChildrenHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_alternateViewChildrenHandler, 0);
  objc_storeStrong((id *)&self->_allowedElementsForTraversal, 0);
  objc_storeStrong(&self->_leafNodePredicate, 0);
}

+ (void)defaultSpeakScreenOptions
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_19D0DD000, v0, v1, "SpeakScreen root element is %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
