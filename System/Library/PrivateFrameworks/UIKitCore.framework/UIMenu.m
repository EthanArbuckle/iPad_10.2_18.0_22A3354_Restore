@implementation UIMenu

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_forcedAutomaticSelectionDelegate);
  objc_storeStrong(&self->_headerViewProvider, 0);
  objc_storeStrong((id *)&self->_displayPreferences, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
}

- (void)setPreferredElementSize:(UIMenuElementSize)preferredElementSize
{
  self->_preferredElementSize = preferredElementSize;
  self->_resolvedElementSize = preferredElementSize;
}

+ (UIMenu)menuWithTitle:(NSString *)title image:(UIImage *)image identifier:(UIMenuIdentifier)identifier options:(UIMenuOptions)options children:(NSArray *)children
{
  NSArray *v11;
  NSString *v12;
  UIImage *v13;
  NSString *v14;
  UIMenu *v15;

  v11 = children;
  v12 = identifier;
  v13 = image;
  v14 = title;
  v15 = -[UIMenu initWithTitle:image:imageName:identifier:options:children:]([UIMenu alloc], "initWithTitle:image:imageName:identifier:options:children:", v14, v13, 0, v12, options, v11);

  return v15;
}

+ (id)_defaultMenuWithIdentifier:(id)a3 options:(unint64_t)a4 children:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;

  v8 = a5;
  v9 = a3;
  objc_msgSend(a1, "_defaultMenuTitles");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v9);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (const __CFString *)v11;
  else
    v13 = &stru_1E16EDF20;
  objc_msgSend(a1, "_defaultMenuImageNames");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "menuWithTitle:imageName:identifier:options:children:", v13, v15, v9, a4, v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setBehaviorOptions:", 1);
  return v16;
}

- (void)setBehaviorOptions:(unint64_t)a3
{
  self->_behaviorOptions = a3;
}

+ (id)_defaultMenuTitles
{
  if (_MergedGlobals_1273 != -1)
    dispatch_once(&_MergedGlobals_1273, &__block_literal_global_587);
  return (id)qword_1ECD81D78;
}

+ (id)_defaultMenuImageNames
{
  if (qword_1ECD81D80 != -1)
    dispatch_once(&qword_1ECD81D80, &__block_literal_global_65_3);
  return (id)qword_1ECD81D88;
}

+ (UIMenu)menuWithTitle:(id)a3 imageName:(id)a4 identifier:(id)a5 options:(unint64_t)a6 children:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  UIMenu *v15;

  v11 = a7;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = -[UIMenu initWithTitle:image:imageName:identifier:options:children:]([UIMenu alloc], "initWithTitle:image:imageName:identifier:options:children:", v14, 0, v13, v12, a6, v11);

  return v15;
}

+ (id)_defaultInlineMenuWithIdentifier:(id)a3 children:(id)a4
{
  return (id)objc_msgSend(a1, "_defaultMenuWithIdentifier:options:children:", a3, 1, a4);
}

- (UIMenuIdentifier)identifier
{
  return self->_identifier;
}

- (id)_mutableCopy
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[UIMenu children](self, "children");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "_mutableCopy", (_QWORD)v13);
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  -[UIMenu menuByReplacingChildren:](self, "menuByReplacingChildren:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSArray)children
{
  return self->_children;
}

- (UIMenu)menuByReplacingChildren:(NSArray *)newChildren
{
  NSArray *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = newChildren;
  v5 = objc_alloc((Class)objc_opt_class());
  v6 = (void *)-[NSArray copy](v4, "copy");

  v7 = (void *)objc_msgSend(v5, "initWithMenu:overrideChildren:", self, v6);
  return (UIMenu *)v7;
}

- (UIMenu)initWithMenu:(id)a3 overrideChildren:(id)a4
{
  _QWORD *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UIMenu *v12;
  uint64_t v13;
  NSAttributedString *attributedTitle;
  uint64_t v15;
  NSString *subtitle;
  uint64_t v17;
  NSString *identifier;
  void *v19;
  uint64_t v20;
  NSString *accessibilityIdentifier;
  uint64_t v22;
  id headerViewProvider;
  void *v24;
  void *v25;
  objc_super v27;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "_imageOrName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_asMenuElementImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_asMenuElementImageName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27.receiver = self;
  v27.super_class = (Class)UIMenu;
  v12 = -[UIMenuElement initWithTitle:image:imageName:](&v27, sel_initWithTitle_image_imageName_, v9, v10, v11);

  if (v12)
  {
    objc_msgSend(v6, "attributedTitle");
    v13 = objc_claimAutoreleasedReturnValue();
    attributedTitle = v12->super._attributedTitle;
    v12->super._attributedTitle = (NSAttributedString *)v13;

    objc_msgSend(v6, "subtitle");
    v15 = objc_claimAutoreleasedReturnValue();
    subtitle = v12->super._subtitle;
    v12->super._subtitle = (NSString *)v15;

    objc_msgSend(v6, "identifier");
    v17 = objc_claimAutoreleasedReturnValue();
    identifier = v12->_identifier;
    v12->_identifier = (NSString *)v17;

    v12->_options = objc_msgSend(v6, "options");
    v19 = v7;
    if (!v7)
    {
      objc_msgSend(v6, "children");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v12->_children, v19);
    if (!v7)

    objc_msgSend(v6, "accessibilityIdentifier");
    v20 = objc_claimAutoreleasedReturnValue();
    accessibilityIdentifier = v12->super._accessibilityIdentifier;
    v12->super._accessibilityIdentifier = (NSString *)v20;

    v12->_forceAutomaticSelection = objc_msgSend(v6, "forceAutomaticSelection");
    v12->_behaviorOptions = objc_msgSend(v6, "behaviorOptions");
    objc_msgSend(v6, "headerViewProvider");
    v22 = objc_claimAutoreleasedReturnValue();
    headerViewProvider = v12->_headerViewProvider;
    v12->_headerViewProvider = (id)v22;

    v12->_preferredElementSize = objc_msgSend(v6, "preferredElementSize");
    v12->_resolvedElementSize = v6[11];
    v12->super.__preferredDisplayMode = objc_msgSend(v6, "_preferredDisplayMode");
    v12->__surfacesSelectionState = objc_msgSend(v6, "_surfacesSelectionState");
    objc_msgSend(v6, "_internalIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIMenuElement set_internalIdentifier:](v12, "set_internalIdentifier:", v24);

    objc_msgSend(v6, "displayPreferences");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIMenu setDisplayPreferences:](v12, "setDisplayPreferences:", v25);

    if ((v12->_options & 0x20) != 0 || v12->_forceAutomaticSelection)
    {
      -[UIMenu addAsStateObserver](v12, "addAsStateObserver");
      -[UIMenu establishInitialDefaultSingleSelection](v12, "establishInitialDefaultSingleSelection");
    }
  }

  return v12;
}

- (UIMenu)initWithTitle:(id)a3 image:(id)a4 imageName:(id)a5 identifier:(id)a6 options:(unint64_t)a7 children:(id)a8
{
  id v14;
  id v15;
  UIMenu *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSArray *children;
  uint64_t v21;
  UIMenuDisplayPreferences *v22;
  UIMenuDisplayPreferences *v23;
  UIMenuDisplayPreferences *displayPreferences;
  objc_super v26;

  v14 = a6;
  v15 = a8;
  v26.receiver = self;
  v26.super_class = (Class)UIMenu;
  v16 = -[UIMenuElement initWithTitle:image:imageName:](&v26, sel_initWithTitle_image_imageName_, a3, a4, a5);
  if (v16)
  {
    if (v14)
    {
      v17 = (void *)objc_msgSend(v14, "copy");
    }
    else
    {
      v18 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      a4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("com.apple.menu.dynamic.%@"), a4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v16->_identifier, v17);
    if (!v14)
    {

      v17 = a4;
    }

    v16->_options = a7;
    v19 = objc_msgSend(v15, "copy");
    children = v16->_children;
    v16->_children = (NSArray *)v19;

    v21 = ((v16->_options >> 2) & 1) - 1;
    v16->_preferredElementSize = v21;
    v16->_resolvedElementSize = v21;
    if ((v16->_options & 0x20) != 0)
    {
      -[UIMenu addAsStateObserver](v16, "addAsStateObserver");
      -[UIMenu establishInitialDefaultSingleSelection](v16, "establishInitialDefaultSingleSelection");
    }
    v22 = (UIMenuDisplayPreferences *)objc_opt_new();
    v23 = v22;
    if ((a7 & 8) != 0)
    {
      v16->_hasCustomizedDisplayPreferences = 1;
      -[UIMenuDisplayPreferences setMaximumNumberOfTitleLines:](v22, "setMaximumNumberOfTitleLines:", 1);
    }
    if ((a7 & 0x40) != 0)
    {
      v16->_hasCustomizedDisplayPreferences = 1;
      -[UIMenuDisplayPreferences setMaximumNumberOfTitleLines:](v23, "setMaximumNumberOfTitleLines:", 0);
    }
    displayPreferences = v16->_displayPreferences;
    v16->_displayPreferences = v23;

  }
  return v16;
}

- (void)setDisplayPreferences:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

+ (UIMenu)menuWithTitle:(NSString *)title children:(NSArray *)children
{
  NSArray *v5;
  NSString *v6;
  UIMenu *v7;

  v5 = children;
  v6 = title;
  v7 = -[UIMenu initWithTitle:image:imageName:identifier:options:children:]([UIMenu alloc], "initWithTitle:image:imageName:identifier:options:children:", v6, 0, 0, 0, 0, v5);

  return v7;
}

+ (UIMenu)menuWithChildren:(NSArray *)children
{
  return +[UIMenu menuWithTitle:children:](UIMenu, "menuWithTitle:children:", &stru_1E16EDF20, children);
}

- (UIMenuElementSize)preferredElementSize
{
  return self->_preferredElementSize;
}

- (UIMenuOptions)options
{
  return self->_options;
}

- (id)headerViewProvider
{
  return self->_headerViewProvider;
}

- (BOOL)forceAutomaticSelection
{
  return self->_forceAutomaticSelection;
}

- (UIMenuDisplayPreferences)displayPreferences
{
  return self->_displayPreferences;
}

- (unint64_t)behaviorOptions
{
  return self->_behaviorOptions;
}

- (BOOL)_surfacesSelectionState
{
  return self->__surfacesSelectionState;
}

- (BOOL)_acceptBoolMenuVisit:(id)a3 commandVisit:(id)a4 actionVisit:(id)a5
{
  if (a3)
    return (*((uint64_t (**)(id, UIMenu *))a3 + 2))(a3, self);
  else
    return 0;
}

+ (id)_defaultMenuWithIdentifier:(id)a3 children:(id)a4
{
  return (id)objc_msgSend(a1, "_defaultMenuWithIdentifier:options:children:", a3, 0, a4);
}

- (void)setForceAutomaticSelection:(BOOL)a3
{
  _BOOL4 v3;
  char v5;

  if (self->_forceAutomaticSelection != a3)
  {
    v3 = a3;
    self->_forceAutomaticSelection = a3;
    v5 = -[UIMenu options](self, "options");
    if (v3)
    {
      if ((v5 & 0x20) == 0)
        -[UIMenu addAsStateObserver](self, "addAsStateObserver");
      -[UIMenu establishInitialDefaultSingleSelection](self, "establishInitialDefaultSingleSelection");
    }
    else if ((v5 & 0x20) == 0)
    {
      -[UIMenu removeAsStateObserver](self, "removeAsStateObserver");
    }
  }
}

- (void)setForcedAutomaticSelectionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_forcedAutomaticSelectionDelegate, a3);
}

- (void)setHeaderViewProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

void __46__UIMenu_DefaultMenus___defaultMenuImageNames__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("com.apple.menu.format");
  v2[1] = CFSTR("com.apple.menu.autofill");
  v3[0] = CFSTR("bold.italic.underline");
  v3[1] = CFSTR("text.insert");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD81D88;
  qword_1ECD81D88 = v0;

}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[NSString isEqualToString:](self->_identifier, "isEqualToString:", v4[12]);

  return v5;
}

void __42__UIMenu_DefaultMenus___defaultMenuTitles__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[17];
  _QWORD v20[19];

  v20[17] = *MEMORY[0x1E0C80C00];
  v19[0] = CFSTR("com.apple.menu.application");
  +[UIApplication _applicationNameForMenus](UIApplication, "_applicationNameForMenus");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v18;
  v19[1] = CFSTR("com.apple.menu.services");
  _UINSLocalizedStringWithDefaultValue(CFSTR("KEYSHORTCUTHUDITEM_APP_SERVICES"), CFSTR("Services"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v17;
  v19[2] = CFSTR("com.apple.menu.file");
  _UINSLocalizedStringWithDefaultValue(CFSTR("KEYSHORTCUTHUD_FILE"), CFSTR("File"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v16;
  v19[3] = CFSTR("com.apple.menu.edit");
  _UINSLocalizedStringWithDefaultValue(CFSTR("KEYSHORTCUTHUD_EDIT"), CFSTR("Edit"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v15;
  v19[4] = CFSTR("com.apple.menu.spelling");
  _UINSLocalizedStringWithDefaultValue(CFSTR("KEYSHORTCUTHUDITEM_EDIT_SPELLING_AND_GRAMMAR"), CFSTR("Spelling and Grammar"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v14;
  v19[5] = CFSTR("com.apple.menu.substitutions");
  _UINSLocalizedStringWithDefaultValue(CFSTR("KEYSHORTCUTHUDITEM_EDIT_SUBSTITUTIONS"), CFSTR("Substitutions"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[5] = v13;
  v19[6] = CFSTR("com.apple.menu.transformations");
  _UINSLocalizedStringWithDefaultValue(CFSTR("KEYSHORTCUTHUDITEM_EDIT_TRANSFORMATIONS"), CFSTR("Transformations"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[6] = v12;
  v19[7] = CFSTR("com.apple.command.speech");
  _UINSLocalizedStringWithDefaultValue(CFSTR("KEYSHORTCUTHUDITEM_EDIT_SPEECH"), CFSTR("Speech"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v20[7] = v0;
  v19[8] = CFSTR("com.apple.menu.format");
  _UINSLocalizedStringWithDefaultValue(CFSTR("KEYSHORTCUTHUD_FORMAT"), CFSTR("Format"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v20[8] = v1;
  v19[9] = CFSTR("com.apple.menu.font");
  _UINSLocalizedStringWithDefaultValue(CFSTR("KEYSHORTCUTHUDITEM_FORMAT_FONT"), CFSTR("Font"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v20[9] = v2;
  v19[10] = CFSTR("com.apple.menu.text");
  _UINSLocalizedStringWithDefaultValue(CFSTR("KEYSHORTCUTHUDITEM_FORMAT_TEXT"), CFSTR("Text"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20[10] = v3;
  v19[11] = CFSTR("com.apple.menu.writing-direction");
  _UINSLocalizedStringWithDefaultValue(CFSTR("KEYSHORTCUTHUDITEM_FORMAT_TEXT_WRITING_DIRECTION"), CFSTR("Writing Direction"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[11] = v4;
  v19[12] = CFSTR("com.apple.menu.view");
  _UINSLocalizedStringWithDefaultValue(CFSTR("KEYSHORTCUTHUD_VIEW"), CFSTR("View"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20[12] = v5;
  v19[13] = CFSTR("com.apple.menu.window");
  _UINSLocalizedStringWithDefaultValue(CFSTR("KEYSHORTCUTHUD_WINDOW"), CFSTR("Window"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[13] = v6;
  v19[14] = CFSTR("com.apple.menu.help");
  _UINSLocalizedStringWithDefaultValue(CFSTR("KEYSHORTCUTHUD_HELP"), CFSTR("Help"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[14] = v7;
  v19[15] = CFSTR("com.apple.menu.text-style");
  _UINSLocalizedStringWithDefaultValue(CFSTR("KEYSHORTCUTHUDITEM_FORMAT_TEXT_STYLE"), CFSTR("Text Style"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[15] = v8;
  v19[16] = CFSTR("com.apple.menu.autofill");
  _UINSLocalizedStringWithDefaultValue(CFSTR("KEYSHORTCUTHUD_AUTOFILL"), CFSTR("AutoFill"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[16] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 17);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)qword_1ECD81D78;
  qword_1ECD81D78 = v10;

}

- (void)_setSurfacesSelectionState:(BOOL)a3
{
  _BOOL4 v3;
  void *v6;

  v3 = a3;
  if ((_UIApplicationProcessIsSpringBoard() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIMenu.m"), 239, CFSTR("This may only be used by SpringBoard."));

  }
  if (self->__surfacesSelectionState != v3)
    self->__surfacesSelectionState = v3;
}

- (UIView)headerView
{
  void (**headerView)(void *, UIMenu *);
  UIView *v4;
  UIView *v5;

  headerView = (void (**)(void *, UIMenu *))self->_headerView;
  if (!headerView)
  {
    headerView = (void (**)(void *, UIMenu *))self->_headerViewProvider;
    if (headerView)
    {
      headerView[2](headerView, self);
      v4 = (UIView *)objc_claimAutoreleasedReturnValue();
      v5 = self->_headerView;
      self->_headerView = v4;

      headerView = (void (**)(void *, UIMenu *))self->_headerView;
    }
  }
  return (UIView *)headerView;
}

- (void)_setResolvedElementSize:(int64_t)a3
{
  void *v6;

  if (a3 == -1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIMenu.m"), 263, CFSTR("Cannot set the resolved element size to be .automatic"));

  }
  self->_resolvedElementSize = a3;
}

- (int64_t)_resolvedElementSize
{
  int64_t result;
  void *v5;

  result = self->_resolvedElementSize;
  if (result == -1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIMenu.m"), 269, CFSTR("UIMenu._resolvedElementSize cannot be called before the menu has been prepared for display"));

    return self->_resolvedElementSize;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  unint64_t behaviorOptions;
  $1FE16939D5FD5624FB4B9D09B9AC0BB3 *p_metadata;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UIMenu;
  -[UIMenuElement encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_options, CFSTR("options"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_preferredElementSize, CFSTR("preferredElementSize"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_resolvedElementSize, CFSTR("resolvedElementSize"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_children, CFSTR("children"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_displayPreferences, CFSTR("displayPreferences"));
  if (self->_forceAutomaticSelection)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("automaticSelection"));
  behaviorOptions = self->_behaviorOptions;
  if (behaviorOptions)
    objc_msgSend(v4, "encodeInteger:forKey:", behaviorOptions, CFSTR("behaviorOptions"));
  if (self->__surfacesSelectionState)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("surfacesSelectionState"));
  p_metadata = &self->_metadata;
  if (p_metadata->isPreparedForDisplay)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("metadata.isPreparedForDisplay"));
  if (p_metadata->hasVisibleSelectedItem)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("metadata.hasVisibleSelectedItem"));
  if (p_metadata->hasDeepHierarchy)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("metadata.hasDeepHierarchy"));
  if (p_metadata->hasAtLeastOneVisibleItem)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("metadata.hasAtLeastOneVisibleItem"));

}

- (UIMenu)initWithCoder:(NSCoder *)coder
{
  NSCoder *v4;
  UIMenu *v5;
  uint64_t v6;
  NSString *identifier;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *children;
  uint64_t v13;
  UIMenuDisplayPreferences *displayPreferences;
  objc_super v16;

  v4 = coder;
  v16.receiver = self;
  v16.super_class = (Class)UIMenu;
  v5 = -[UIMenuElement initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (v5)
  {
    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_options = -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("options"));
    v5->_preferredElementSize = -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("preferredElementSize"));
    v5->_resolvedElementSize = -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("resolvedElementSize"));
    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCoder decodeObjectOfClasses:forKey:](v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("children"));
    v11 = objc_claimAutoreleasedReturnValue();
    children = v5->_children;
    v5->_children = (NSArray *)v11;

    v5->_forceAutomaticSelection = -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("automaticSelection"));
    v5->_behaviorOptions = -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("behaviorOptions"));
    v5->__surfacesSelectionState = -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("surfacesSelectionState"));
    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayPreferences"));
    v13 = objc_claimAutoreleasedReturnValue();
    displayPreferences = v5->_displayPreferences;
    v5->_displayPreferences = (UIMenuDisplayPreferences *)v13;

    v5->_metadata.isPreparedForDisplay = -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("metadata.isPreparedForDisplay"));
    v5->_metadata.hasVisibleSelectedItem = -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("metadata.hasVisibleSelectedItem"));
    v5->_metadata.hasDeepHierarchy = -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("metadata.hasDeepHierarchy"));
    v5->_metadata.hasAtLeastOneVisibleItem = -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("metadata.hasAtLeastOneVisibleItem"));
    if ((v5->_options & 0x20) != 0 || v5->_forceAutomaticSelection)
    {
      -[UIMenu addAsStateObserver](v5, "addAsStateObserver");
      -[UIMenu establishInitialDefaultSingleSelection](v5, "establishInitialDefaultSingleSelection");
    }
  }

  return v5;
}

- (void)_acceptMenuVisit:(id)a3 commandVisit:(id)a4 actionVisit:(id)a5 deferredElementVisit:(id)a6
{
  if (a3)
    (*((void (**)(id, UIMenu *))a3 + 2))(a3, self);
}

- (void)_acceptMenuVisit:(id)a3 leafVisit:(id)a4
{
  if (a3)
    (*((void (**)(id, UIMenu *))a3 + 2))(a3, self);
}

- (BOOL)_acceptBoolMenuVisit:(id)a3 leafVisit:(id)a4
{
  if (a3)
    return (*((uint64_t (**)(id, UIMenu *))a3 + 2))(a3, self);
  else
    return 0;
}

- (id)_immutableCopy
{
  _BOOL8 v3;

  v3 = (-[UIMenu options](self, "options") & 0x20) != 0
    || -[UIMenu forceAutomaticSelection](self, "forceAutomaticSelection");
  return -[UIMenu _immutableCopySharingLeafObservers:](self, "_immutableCopySharingLeafObservers:", v3);
}

- (id)_immutableCopySharingLeafObservers:(BOOL)a3
{
  _BOOL4 v3;
  UIMenu *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  UIMenu *v17;
  UIMenu *v19;
  _QWORD aBlock[4];
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v3 = a3;
  v4 = self;
  v27 = *MEMORY[0x1E0C80C00];
  -[UIMenu children](self, "children");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (!v6)
    goto LABEL_22;
  v7 = v6;
  v19 = v4;
  v8 = 0;
  v9 = 0;
  v10 = *(_QWORD *)v23;
  do
  {
    v11 = 0;
    do
    {
      if (*(_QWORD *)v23 != v10)
        objc_enumerationMutation(v5);
      v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v11);
      if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        objc_msgSend(v12, "_immutableCopySharingLeafObservers:", 1);
        v13 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v12, "_immutableCopy", v19);
        v13 = objc_claimAutoreleasedReturnValue();
      }
      v14 = (void *)v13;
      if ((void *)v13 != v12)
      {
        if (v9)
        {
          if (v3)
            goto LABEL_13;
        }
        else
        {
          v9 = (void *)objc_msgSend(v5, "mutableCopy");
          if (v3)
          {
LABEL_13:
            aBlock[0] = MEMORY[0x1E0C809B0];
            aBlock[1] = 3221225472;
            aBlock[2] = __45__UIMenu__immutableCopySharingLeafObservers___block_invoke;
            aBlock[3] = &unk_1E16BC6F0;
            v21 = v14;
            v15 = _Block_copy(aBlock);
            objc_msgSend(v12, "_acceptMenuVisit:commandVisit:actionVisit:deferredElementVisit:", 0, v15, v15, 0);

          }
        }
        objc_msgSend(v9, "setObject:atIndexedSubscript:", v14, v8 + v11, v19);
      }

      ++v11;
    }
    while (v7 != v11);
    v16 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    v7 = v16;
    v8 += v11;
  }
  while (v16);
  v4 = v19;
  if (!v9)
  {
LABEL_22:
    v17 = v4;
    v9 = 0;
    goto LABEL_23;
  }
  -[UIMenu menuByReplacingChildren:](v19, "menuByReplacingChildren:", v9);
  v17 = (UIMenu *)objc_claimAutoreleasedReturnValue();
  -[UIMenu setMetadata:](v17, "setMetadata:", -[UIMenu metadata](v19, "metadata") & 0xFFFFFFFFFFLL);
LABEL_23:

  return v17;
}

void __45__UIMenu__immutableCopySharingLeafObservers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = *(id *)(a1 + 32);
  objc_msgSend(a2, "_getStateObservers");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setStateObservers:", v4);

}

- (id)_copyWithOptions:(unint64_t)a3
{
  id result;

  result = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithMenu:overrideChildren:", self, 0);
  *((_QWORD *)result + 13) = a3;
  return result;
}

- (NSString)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  UIMenuElementSize v18;
  void *v19;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIMenuElement title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    -[UIMenuElement title](self, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; title = %@"), v6);

  }
  -[UIMenu identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; identifier = %@"), v7);

  -[UIMenuElement image](self, "image");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("; image = <%@: %p"), objc_opt_class(), v8);
    if (objc_msgSend(v8, "isSymbolImage"))
    {
      _UIImageName(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("; symbol = (%@)"), v9);

    }
    objc_msgSend(v3, "appendString:", CFSTR(">"));
  }
  if (-[UIMenu options](self, "options"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((-[UIMenu options](self, "options") & 1) != 0)
      objc_msgSend(v10, "addObject:", CFSTR("Inline"));
    if ((-[UIMenu options](self, "options") & 2) != 0)
      objc_msgSend(v10, "addObject:", CFSTR("Destructive"));
    if ((-[UIMenu options](self, "options") & 4) != 0)
      objc_msgSend(v10, "addObject:", CFSTR("Compact"));
    if ((-[UIMenu options](self, "options") & 0x10) != 0)
      objc_msgSend(v10, "addObject:", CFSTR("AlwaysDisplayChildImages"));
    if ((-[UIMenu options](self, "options") & 0x20) != 0)
      objc_msgSend(v10, "addObject:", CFSTR("SingleSelection"));
    if ((-[UIMenu options](self, "options") & 0x80) != 0)
      objc_msgSend(v10, "addObject:", CFSTR("Palette"));
    objc_msgSend(v10, "componentsJoinedByString:", CFSTR("|"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; options = (%@)"), v11);

  }
  if (-[UIMenu forceAutomaticSelection](self, "forceAutomaticSelection"))
    objc_msgSend(v3, "appendString:", CFSTR("; forcesAutomaticSelection"));
  -[UIMenu selectedElements](self, "selectedElements");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13)
  {
    -[UIMenu selectedElements](self, "selectedElements");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; currentSelection = <NSArray: %p>"), v14);

  }
  if (self->_hasCustomizedDisplayPreferences)
  {
    -[UIMenu displayPreferences](self, "displayPreferences");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_opt_class();
    -[UIMenu displayPreferences](self, "displayPreferences");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; displayPreferences = <%@: %p>"), v16, v17);

  }
  v18 = -[UIMenu preferredElementSize](self, "preferredElementSize");
  if ((unint64_t)v18 <= UIMenuElementSizeLarge)
    objc_msgSend(v3, "appendString:", off_1E16BC8A0[v18]);
  -[UIMenu children](self, "children");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; children = <NSArray: %p>>"), v19);

  return (NSString *)v3;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_identifier, "hash");
}

- (void)addAsStateObserver
{
  recursivelyObserveChildrenState(self, self, 1);
}

- (void)removeAsStateObserver
{
  recursivelyObserveChildrenState(self, self, 0);
}

- (void)establishInitialDefaultSingleSelection
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  SEL v13;
  _QWORD v14[5];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD aBlock[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v13 = a2;
  v27 = *MEMORY[0x1E0C80C00];
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__38;
  v24 = __Block_byref_object_dispose__38;
  v3 = MEMORY[0x1E0C809B0];
  v25 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__UIMenu_establishInitialDefaultSingleSelection__block_invoke;
  aBlock[3] = &unk_1E16BC718;
  aBlock[4] = &v20;
  v4 = _Block_copy(aBlock);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[UIMenu children](self, "children");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v26, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v8);
        v14[0] = v3;
        v14[1] = 3221225472;
        v14[2] = __48__UIMenu_establishInitialDefaultSingleSelection__block_invoke_2;
        v14[3] = &unk_1E16BC740;
        v14[4] = &v20;
        objc_msgSend(v9, "_acceptMenuVisit:commandVisit:actionVisit:deferredElementVisit:", v14, v4, v4, 0, v13);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v26, 16);
    }
    while (v6);
  }

  if (-[UIMenu forceAutomaticSelection](self, "forceAutomaticSelection"))
  {
    if (!v21[5])
    {
      -[UIMenu recursivelySelectDefaultForcedSelection:](self, "recursivelySelectDefaultForcedSelection:", 1);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v21[5];
      v21[5] = v10;

      if (!v21[5])
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", v13, self, CFSTR("UIMenu.m"), 612, CFSTR("Menu does not have a valid element for default selection"));

      }
    }
  }

  _Block_object_dispose(&v20, 8);
}

void __48__UIMenu_establishInitialDefaultSingleSelection__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  id *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "state") == 1)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = *(_QWORD *)(v4 + 40);
    v5 = (id *)(v4 + 40);
    if (v6)
      objc_msgSend(v7, "_setState:notifyingObservers:", 0, 0);
    else
      objc_storeStrong(v5, a2);
  }

}

void __48__UIMenu_establishInitialDefaultSingleSelection__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    objc_msgSend(v3, "updateChildrenForSingleSelectedElement:", 0);
  }
  else
  {
    objc_msgSend(v3, "selectedElements");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v6, "updateChildrenForSingleSelectedElement:", v5);
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v5);
    }

  }
}

- (NSArray)selectedElements
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  recursivelyPopulateSelectedElements(self, v3);
  objc_msgSend(v3, "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (id)childElementForElement:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__38;
  v27 = __Block_byref_object_dispose__38;
  v28 = 0;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[UIMenu children](self, "children");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
  if (v6)
  {
    v7 = MEMORY[0x1E0C809B0];
    v8 = *(_QWORD *)v20;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v9);
      v16[0] = v7;
      v16[1] = 3221225472;
      v16[2] = __33__UIMenu_childElementForElement___block_invoke;
      v16[3] = &unk_1E16BC768;
      v17 = v4;
      v18 = &v23;
      v13[0] = v7;
      v13[1] = 3221225472;
      v13[2] = __33__UIMenu_childElementForElement___block_invoke_2;
      v13[3] = &unk_1E16BC790;
      v14 = v17;
      v15 = &v23;
      objc_msgSend(v10, "_acceptMenuVisit:leafVisit:", v16, v13);
      LOBYTE(v10) = v24[5] == 0;

      if ((v10 & 1) == 0)
        break;
      if (v6 == ++v9)
      {
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }

  v11 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  return v11;
}

void __33__UIMenu_childElementForElement___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "childElementForElement:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
    v3 = v4;
  }

}

void __33__UIMenu_childElementForElement___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32)))
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);

}

- (void)_elementWillPerformAction:(id)a3
{
  id v3;

  v3 = a3;
  if (objc_msgSend(v3, "state") != 1)
    objc_msgSend(v3, "_setState:notifyingObservers:", 1, 1);

}

- (void)_elementStateDidChange:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if ((-[UIMenu options](self, "options") & 0x20) != 0
    || -[UIMenu forceAutomaticSelection](self, "forceAutomaticSelection"))
  {
    -[UIMenu childElementForElement:](self, "childElementForElement:", v11);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 != v11)
      objc_msgSend(v5, "_setState:notifyingObservers:", objc_msgSend(v11, "state"), 0);
    -[UIMenu updateChildrenForSingleSelectedElement:](self, "updateChildrenForSingleSelectedElement:", v6);
    if (-[UIMenu forceAutomaticSelection](self, "forceAutomaticSelection"))
    {
      if (objc_msgSend(v6, "state") != 1)
      {
        -[UIMenu recursivelySelectDefaultForcedSelection:](self, "recursivelySelectDefaultForcedSelection:", 0);
        v7 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v7;
        if (!v7)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIMenu.m"), 691, CFSTR("Menu does not have a valid element for default selection"));

          v6 = 0;
        }
      }
      -[UIMenu forcedAutomaticSelectionDelegate](self, "forcedAutomaticSelectionDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        -[UIMenu forcedAutomaticSelectionDelegate](self, "forcedAutomaticSelectionDelegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "forcedSelectionOfMenu:willChangeTo:", self, v6);

      }
    }

  }
}

- (void)updateChildrenForSingleSelectedElement:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD aBlock[4];
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__UIMenu_updateChildrenForSingleSelectedElement___block_invoke;
  aBlock[3] = &unk_1E16BC6F0;
  v6 = v4;
  v21 = v6;
  v7 = _Block_copy(aBlock);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[UIMenu children](self, "children");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v12);
        v14[0] = v5;
        v14[1] = 3221225472;
        v14[2] = __49__UIMenu_updateChildrenForSingleSelectedElement___block_invoke_2;
        v14[3] = &unk_1E16BC7B8;
        v15 = v6;
        objc_msgSend(v13, "_acceptMenuVisit:commandVisit:actionVisit:deferredElementVisit:", v14, v7, v7, 0);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v10);
  }

}

void __49__UIMenu_updateChildrenForSingleSelectedElement___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32)) & 1) == 0 && objc_msgSend(v3, "state") == 1)
    objc_msgSend(v3, "_setState:notifyingObservers:", 0, 0);

}

uint64_t __49__UIMenu_updateChildrenForSingleSelectedElement___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateChildrenForSingleSelectedElement:", *(_QWORD *)(a1 + 32));
}

- (id)recursivelySelectDefaultForcedSelection:(BOOL)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  BOOL v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD aBlock[5];
  BOOL v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__38;
  v26 = __Block_byref_object_dispose__38;
  v27 = 0;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__UIMenu_recursivelySelectDefaultForcedSelection___block_invoke;
  aBlock[3] = &unk_1E16BC7E0;
  v21 = a3;
  aBlock[4] = &v22;
  v6 = _Block_copy(aBlock);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[UIMenu children](self, "children");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v28, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v17;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v9)
        objc_enumerationMutation(v7);
      v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10);
      v14[0] = v5;
      v14[1] = 3221225472;
      v14[2] = __50__UIMenu_recursivelySelectDefaultForcedSelection___block_invoke_2;
      v14[3] = &unk_1E16BC808;
      v14[4] = &v22;
      v15 = a3;
      objc_msgSend(v11, "_acceptMenuVisit:commandVisit:actionVisit:deferredElementVisit:", v14, v6, v6, 0);
      if (v23[5])
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v28, 16);
        if (v8)
          goto LABEL_3;
        break;
      }
    }
  }

  v12 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v12;
}

void __50__UIMenu_recursivelySelectDefaultForcedSelection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  objc_msgSend(v3, "_setState:notifyingObservers:", 1, *(unsigned __int8 *)(a1 + 40));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __50__UIMenu_recursivelySelectDefaultForcedSelection___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "recursivelySelectDefaultForcedSelection:", *(unsigned __int8 *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- ($9BEB610D0CE1B1EDC3D89DA2464F985F)metadata
{
  return ($9BEB610D0CE1B1EDC3D89DA2464F985F)(*(unsigned int *)&self->_metadata.isPreparedForDisplay | ((unint64_t)self->_metadata.hasVisibleLargePalette << 32));
}

- (void)setMetadata:(id)a3
{
  self->_metadata = ($1FE16939D5FD5624FB4B9D09B9AC0BB3)a3;
}

- (UIMenuForcedAutomaticSelectionDelegate)forcedAutomaticSelectionDelegate
{
  return (UIMenuForcedAutomaticSelectionDelegate *)objc_loadWeakRetained((id *)&self->_forcedAutomaticSelectionDelegate);
}

- (BOOL)_hasGlobalHeader
{
  void *v3;
  BOOL v4;
  void *v5;

  -[UIMenuElement title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = 1;
  }
  else
  {
    -[UIMenu headerView](self, "headerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

- (BOOL)_shouldShowSelectionState
{
  void *v3;
  BOOL v4;

  if (!-[UIMenu _surfacesSelectionState](self, "_surfacesSelectionState"))
    return 0;
  -[UIMenu selectedElements](self, "selectedElements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (void)_resolveElementSizeWithContext:(id)a3
{
  uint64_t (**v4)(id, UIMenu *);

  objc_msgSend(a3, "elementSizeSolver");
  v4 = (uint64_t (**)(id, UIMenu *))objc_claimAutoreleasedReturnValue();
  -[UIMenu _setResolvedElementSize:](self, "_setResolvedElementSize:", v4[2](v4, self));

}

@end
