@implementation _UIKeyShortcutHUDShortcut

+ (_UIKeyShortcutHUDShortcut)shortcutWithUIKeyCommand:(id)a3
{
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS____UIKeyShortcutHUDShortcut;
  objc_msgSendSuper2(&v5, sel_elementWithUIMenuElement_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_updateOverrideTitle");
  return (_UIKeyShortcutHUDShortcut *)v3;
}

- (_UIKeyShortcutHUDShortcut)init
{
  _UIKeyShortcutHUDShortcut *v2;
  uint64_t v3;
  NSMutableArray *displayableAlternates;
  uint64_t v5;
  NSMutableDictionary *alternatesMap;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIKeyShortcutHUDShortcut;
  v2 = -[_UIKeyShortcutHUDShortcut init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    displayableAlternates = v2->_displayableAlternates;
    v2->_displayableAlternates = (NSMutableArray *)v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    alternatesMap = v2->_alternatesMap;
    v2->_alternatesMap = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (NSString)discoverabilityTitle
{
  void *v2;
  void *v3;

  -[_UIKeyShortcutHUDShortcut uiKeyCommand](self, "uiKeyCommand");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "discoverabilityTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)hudTitle
{
  __CFString *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  if (-[NSString length](self->_overrideTitle, "length"))
  {
    v3 = self->_overrideTitle;
  }
  else
  {
    -[_UIKeyShortcutHUDShortcut discoverabilityTitle](self, "discoverabilityTitle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length");

    if (v5)
    {
      -[_UIKeyShortcutHUDShortcut discoverabilityTitle](self, "discoverabilityTitle");
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[_UIKeyShortcutHUDMenuElement title](self, "title");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "length");

      if (v7)
      {
        -[_UIKeyShortcutHUDMenuElement title](self, "title");
        v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v3 = CFSTR("No Title");
      }
    }
  }
  return (NSString *)v3;
}

- (void)_updateOverrideTitle
{
  char *v3;
  NSString *v4;
  NSString *v5;
  NSString *overrideTitle;
  void *v7;

  if (-[_UIKeyShortcutHUDShortcut _isEquivalentToPasteShortcut](self, "_isEquivalentToPasteShortcut"))
  {
    v3 = sel_paste_;
  }
  else
  {
    if (!-[_UIKeyShortcutHUDShortcut _isEquivalentToPasteAndMatchStyleShortcut](self, "_isEquivalentToPasteAndMatchStyleShortcut"))
    {
      overrideTitle = self->_overrideTitle;
      self->_overrideTitle = 0;
      goto LABEL_7;
    }
    v3 = sel_pasteAndMatchStyle_;
  }
  +[UICommand _defaultCommandForAction:](UIKeyCommand, "_defaultCommandForAction:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "title");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  v5 = self->_overrideTitle;
  self->_overrideTitle = v4;

  overrideTitle = (NSString *)v7;
LABEL_7:

}

- (int64_t)modifierFlags
{
  void *v3;
  void *v4;
  int64_t v5;

  -[_UIKeyShortcutHUDShortcut discoverabilityUIKeyCommand](self, "discoverabilityUIKeyCommand");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    -[_UIKeyShortcutHUDShortcut discoverabilityUIKeyCommand](self, "discoverabilityUIKeyCommand");
  else
    -[_UIKeyShortcutHUDShortcut uiKeyCommand](self, "uiKeyCommand");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_layoutAwareModifierFlags");

  return v5;
}

- (NSString)input
{
  void *v3;
  void *v4;
  void *v5;

  -[_UIKeyShortcutHUDShortcut discoverabilityUIKeyCommand](self, "discoverabilityUIKeyCommand");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    -[_UIKeyShortcutHUDShortcut discoverabilityUIKeyCommand](self, "discoverabilityUIKeyCommand");
  else
    -[_UIKeyShortcutHUDShortcut uiKeyCommand](self, "uiKeyCommand");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_layoutAwareInput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (unint64_t)attributes
{
  void *v2;
  unint64_t v3;

  -[_UIKeyShortcutHUDShortcut uiKeyCommand](self, "uiKeyCommand");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "attributes");

  return v3;
}

- (NSArray)shortcutAlternates
{
  void *v2;
  void *v3;

  -[_UIKeyShortcutHUDShortcut alternatesMap](self, "alternatesMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)shortcutToDisplayForModifierFlags:(int64_t)a3
{
  _UIKeyShortcutHUDShortcut *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _UIKeyShortcutHUDShortcut *v9;

  v4 = self;
  -[_UIKeyShortcutHUDShortcut uiKeyCommand](v4, "uiKeyCommand");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_alternateForModifierFlags:usingAlternates:", a3, v4->_displayableAlternates);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](v4->_alternatesMap, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;

      v4 = v9;
    }

  }
  return v4;
}

- (BOOL)isPasteShortcut
{
  return -[_UIKeyShortcutHUDShortcut _isEquivalentToPasteShortcut](self, "_isEquivalentToPasteShortcut")
      || -[_UIKeyShortcutHUDShortcut _isEquivalentToPasteAndMatchStyleShortcut](self, "_isEquivalentToPasteAndMatchStyleShortcut");
}

- (BOOL)_isEquivalentToPasteShortcut
{
  void *v2;
  BOOL v3;

  -[_UIKeyShortcutHUDShortcut uiKeyCommand](self, "uiKeyCommand");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "action") == (_QWORD)sel_paste_;

  return v3;
}

- (BOOL)_isEquivalentToPasteAndMatchStyleShortcut
{
  void *v2;
  BOOL v3;

  -[_UIKeyShortcutHUDShortcut uiKeyCommand](self, "uiKeyCommand");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "action") == (_QWORD)sel_pasteAndMatchStyle_;

  return v3;
}

- (void)_acceptMenuVisit:(id)a3 shortcutVisit:(id)a4
{
  if (a4)
    (*((void (**)(id, _UIKeyShortcutHUDShortcut *))a4 + 2))(a4, self);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIKeyShortcutHUDShortcut;
  v4 = a3;
  -[_UIKeyShortcutHUDMenuElement encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_displayableAlternates, CFSTR("displayableAlternates"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_alternatesMap, CFSTR("alternatesMap"));

}

- (_UIKeyShortcutHUDShortcut)initWithCoder:(id)a3
{
  id v4;
  _UIKeyShortcutHUDShortcut *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSMutableArray *displayableAlternates;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSMutableDictionary *alternatesMap;
  NSMutableDictionary *v19;
  _UIKeyShortcutHUDShortcut *v20;
  _QWORD v22[4];
  _UIKeyShortcutHUDShortcut *v23;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)_UIKeyShortcutHUDShortcut;
  v5 = -[_UIKeyShortcutHUDMenuElement initWithCoder:](&v24, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    objc_opt_self();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithObjects:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("displayableAlternates"));
    v10 = objc_claimAutoreleasedReturnValue();
    displayableAlternates = v5->_displayableAlternates;
    v5->_displayableAlternates = (NSMutableArray *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    objc_opt_self();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithObjects:", v13, v14, v15, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("alternatesMap"));
    v17 = objc_claimAutoreleasedReturnValue();
    alternatesMap = v5->_alternatesMap;
    v5->_alternatesMap = (NSMutableDictionary *)v17;

    objc_storeWeak((id *)&v5->_baseShortcutForAlternate, v5);
    v19 = v5->_alternatesMap;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __43___UIKeyShortcutHUDShortcut_initWithCoder___block_invoke;
    v22[3] = &unk_1E16E3A68;
    v20 = v5;
    v23 = v20;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v19, "enumerateKeysAndObjectsUsingBlock:", v22);
    -[_UIKeyShortcutHUDShortcut _updateOverrideTitle](v20, "_updateOverrideTitle");

  }
  return v5;
}

- (UIKeyCommand)discoverabilityUIKeyCommand
{
  return self->_discoverabilityUIKeyCommand;
}

- (void)setDiscoverabilityUIKeyCommand:(id)a3
{
  objc_storeStrong((id *)&self->_discoverabilityUIKeyCommand, a3);
}

- (NSMutableArray)displayableAlternates
{
  return self->_displayableAlternates;
}

- (NSMutableDictionary)alternatesMap
{
  return self->_alternatesMap;
}

- (_UIKeyShortcutHUDShortcut)baseShortcutForAlternate
{
  return (_UIKeyShortcutHUDShortcut *)objc_loadWeakRetained((id *)&self->_baseShortcutForAlternate);
}

- (void)setBaseShortcutForAlternate:(id)a3
{
  objc_storeWeak((id *)&self->_baseShortcutForAlternate, a3);
}

- (UICommandAlternate)alternateForBaseShortcut
{
  return (UICommandAlternate *)objc_loadWeakRetained((id *)&self->_alternateForBaseShortcut);
}

- (void)setAlternateForBaseShortcut:(id)a3
{
  objc_storeWeak((id *)&self->_alternateForBaseShortcut, a3);
}

- (id)originalTarget
{
  return objc_loadWeakRetained(&self->_originalTarget);
}

- (void)setOriginalTarget:(id)a3
{
  objc_storeWeak(&self->_originalTarget, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_originalTarget);
  objc_destroyWeak((id *)&self->_alternateForBaseShortcut);
  objc_destroyWeak((id *)&self->_baseShortcutForAlternate);
  objc_storeStrong((id *)&self->_alternatesMap, 0);
  objc_storeStrong((id *)&self->_displayableAlternates, 0);
  objc_storeStrong((id *)&self->_discoverabilityUIKeyCommand, 0);
  objc_storeStrong((id *)&self->_overrideTitle, 0);
}

@end
