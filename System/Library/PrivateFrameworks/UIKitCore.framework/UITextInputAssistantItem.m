@implementation UITextInputAssistantItem

- (UITextInputAssistantItem)init
{
  UITextInputAssistantItem *v2;
  UITextInputAssistantItem *v3;
  NSArray *v4;
  NSArray *leadingBarButtonGroups;
  NSArray *v6;
  NSArray *trailingBarButtonGroups;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UITextInputAssistantItem;
  v2 = -[UITextInputAssistantItem init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_allowsHidingShortcuts = 1;
    v2->_marginOverride = -1.0;
    v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    leadingBarButtonGroups = v3->_leadingBarButtonGroups;
    v3->_leadingBarButtonGroups = v4;

    v6 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    trailingBarButtonGroups = v3->_trailingBarButtonGroups;
    v3->_trailingBarButtonGroups = v6;

  }
  return v3;
}

- (BOOL)_isSystemItem
{
  return 0;
}

- (BOOL)_hasItemsToDisplay
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSArray count](self->_leadingBarButtonGroups, "count");
  v4 = -[NSArray count](self->_centerBarButtonGroups, "count") + v3;
  return v4 + -[NSArray count](self->_trailingBarButtonGroups, "count") != 0;
}

- (BOOL)_requiresPredictionDisabled
{
  return -[NSArray count](self->_centerBarButtonGroups, "count") != 0;
}

- (void)setLeadingBarButtonGroups:(NSArray *)leadingBarButtonGroups
{
  NSArray *v4;
  NSArray *v5;
  NSArray *v6;

  if (self->_leadingBarButtonGroups != leadingBarButtonGroups)
  {
    if (leadingBarButtonGroups)
      v4 = leadingBarButtonGroups;
    else
      v4 = (NSArray *)MEMORY[0x1E0C9AA60];
    v5 = (NSArray *)-[NSArray copy](v4, "copy");
    v6 = self->_leadingBarButtonGroups;
    self->_leadingBarButtonGroups = v5;

  }
}

- (void)setTrailingBarButtonGroups:(NSArray *)trailingBarButtonGroups
{
  NSArray *v4;
  NSArray *v5;
  NSArray *v6;

  if (self->_trailingBarButtonGroups != trailingBarButtonGroups)
  {
    if (trailingBarButtonGroups)
      v4 = trailingBarButtonGroups;
    else
      v4 = (NSArray *)MEMORY[0x1E0C9AA60];
    v5 = (NSArray *)-[NSArray copy](v4, "copy");
    v6 = self->_trailingBarButtonGroups;
    self->_trailingBarButtonGroups = v5;

  }
}

- (void)_setCenterBarButtonGroups:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *centerBarButtonGroups;

  if (self->_centerBarButtonGroups != a3)
  {
    if (a3)
      v4 = a3;
    else
      v4 = (id)MEMORY[0x1E0C9AA60];
    v5 = (NSArray *)objc_msgSend(v4, "copy");
    centerBarButtonGroups = self->_centerBarButtonGroups;
    self->_centerBarButtonGroups = v5;

  }
}

- (void)_setIndependentGroupSizes:(BOOL)a3
{
  if (self->_independentGroupSizes != a3)
    self->_independentGroupSizes = a3;
}

- (void)_setDictationReplacementAction:(id)a3
{
  UIAction *v5;
  UIAction **p_dictationReplacementAction;
  UIAction *dictationReplacementAction;
  void *v8;
  void *v9;
  char v10;
  unint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = (UIAction *)a3;
  dictationReplacementAction = self->_dictationReplacementAction;
  p_dictationReplacementAction = &self->_dictationReplacementAction;
  if (dictationReplacementAction == v5)
    goto LABEL_4;
  objc_storeStrong((id *)p_dictationReplacementAction, a3);
  -[UIMenuElement image](v5, "image");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_4;
  -[UIMenuElement image](v5, "image");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isSymbolImage");

  if ((v10 & 1) != 0)
    goto LABEL_4;
  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      goto LABEL_11;
    -[UIMenuElement image](v5, "image");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412290;
    v16 = v14;
    _os_log_fault_impl(&dword_185066000, v13, OS_LOG_TYPE_FAULT, "The dictationReplacementAction's image must be a symbol image %@", (uint8_t *)&v15, 0xCu);
LABEL_10:

LABEL_11:
    goto LABEL_4;
  }
  v11 = _setDictationReplacementAction____s_category;
  if (!_setDictationReplacementAction____s_category)
  {
    v11 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v11, (unint64_t *)&_setDictationReplacementAction____s_category);
  }
  v12 = *(NSObject **)(v11 + 8);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v13 = v12;
    -[UIMenuElement image](v5, "image");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412290;
    v16 = v14;
    _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "The dictationReplacementAction's image must be a symbol image %@", (uint8_t *)&v15, 0xCu);
    goto LABEL_10;
  }
LABEL_4:

}

- (void)_setMarginOverride:(double)a3
{
  if (a3 < 0.0)
    a3 = 0.0;
  if (self->_marginOverride != a3)
    self->_marginOverride = a3;
}

- (void)_itemStandardViewNeedsUpdate:(id)a3
{
  void *v3;
  id v4;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteTextInputPartner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "documentTraitsChanged");

}

- (void)_itemDidChangeEnabledState:(id)a3
{
  void *v3;
  id v4;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteTextInputPartner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "documentTraitsChanged");

}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UITextInputAssistantItem;
  -[UITextInputAssistantItem description](&v9, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (!self->_allowsHidingShortcuts)
    objc_msgSend(v4, "appendString:", CFSTR(" requiresShortcuts"));
  if (-[NSArray count](self->_leadingBarButtonGroups, "count"))
  {
    -[NSArray componentsJoinedByString:](self->_leadingBarButtonGroups, "componentsJoinedByString:", CFSTR("\n\t"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("\nleadingBarButtonGroups={\n\t%@\n}"), v5);

  }
  if (-[NSArray count](self->_trailingBarButtonGroups, "count"))
  {
    -[NSArray componentsJoinedByString:](self->_trailingBarButtonGroups, "componentsJoinedByString:", CFSTR("\n\t"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("\ntrailingBarButtonGroups={\n\t%@\n}"), v6);

  }
  if (-[NSArray count](self->_centerBarButtonGroups, "count"))
  {
    -[NSArray componentsJoinedByString:](self->_centerBarButtonGroups, "componentsJoinedByString:", CFSTR("\n\t"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("\ncenterBarButtonGroups={\n\t%@\n}"), v7);

  }
  return (NSString *)v4;
}

- (BOOL)allowsHidingShortcuts
{
  return self->_allowsHidingShortcuts;
}

- (void)setAllowsHidingShortcuts:(BOOL)allowsHidingShortcuts
{
  self->_allowsHidingShortcuts = allowsHidingShortcuts;
}

- (NSArray)leadingBarButtonGroups
{
  return self->_leadingBarButtonGroups;
}

- (NSArray)trailingBarButtonGroups
{
  return self->_trailingBarButtonGroups;
}

- (UIBarButtonItem)keyboardActionButtonItem
{
  return self->_keyboardActionButtonItem;
}

- (void)setKeyboardActionButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardActionButtonItem, a3);
}

- (BOOL)_showsBarButtonItemsInline
{
  return self->_showsBarButtonItemsInline;
}

- (void)_setShowsBarButtonItemsInline:(BOOL)a3
{
  self->_showsBarButtonItemsInline = a3;
}

- (BOOL)_isVisibleWhenMinimized
{
  return self->_visibleWhenMinimized;
}

- (void)_setVisibleWhenMinimized:(BOOL)a3
{
  self->_visibleWhenMinimized = a3;
}

- (NSArray)_centerBarButtonGroups
{
  return self->_centerBarButtonGroups;
}

- (BOOL)_independentGroupSizes
{
  return self->_independentGroupSizes;
}

- (double)_marginOverride
{
  return self->_marginOverride;
}

- (UIColor)_detachedBackgroundColor
{
  return self->_detachedBackgroundColor;
}

- (void)_setDetachedBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_detachedBackgroundColor, a3);
}

- (UIBlurEffect)_detachedBackgroundEffect
{
  return self->_detachedBackgroundEffect;
}

- (void)_setDetachedBackgroundEffect:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (UIColor)_detachedTintColor
{
  return self->_detachedTintColor;
}

- (void)_setDetachedTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_detachedTintColor, a3);
}

- (UIAction)_dictationReplacementAction
{
  return self->_dictationReplacementAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictationReplacementAction, 0);
  objc_storeStrong((id *)&self->_detachedTintColor, 0);
  objc_storeStrong((id *)&self->_detachedBackgroundEffect, 0);
  objc_storeStrong((id *)&self->_detachedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_centerBarButtonGroups, 0);
  objc_storeStrong((id *)&self->_keyboardActionButtonItem, 0);
  objc_storeStrong((id *)&self->_trailingBarButtonGroups, 0);
  objc_storeStrong((id *)&self->_leadingBarButtonGroups, 0);
}

+ (id)_keyboardDeleteItem
{
  return +[UIAssistantBarButtonItemProvider barButtonItemForAssistantItemStyle:target:](UIAssistantBarButtonItemProvider, "barButtonItemForAssistantItemStyle:target:", 19, 0);
}

@end
