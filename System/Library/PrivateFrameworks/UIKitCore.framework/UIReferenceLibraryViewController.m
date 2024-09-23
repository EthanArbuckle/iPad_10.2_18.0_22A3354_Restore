@implementation UIReferenceLibraryViewController

- (UIReferenceLibraryViewController)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("-[UIReferenceLibraryViewController initWithNibName:bundle:] is not a valid initializer. You must call -[UIReferenceLibraryViewController initWithTerm:]."));

  return 0;
}

- (UIReferenceLibraryViewController)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[UIReferenceLibraryViewController init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("Don't call %@."), v5);

  return 0;
}

- (UIReferenceLibraryViewController)initWithTerm:(NSString *)term
{
  NSString *v5;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  void *v9;
  UIReferenceLibraryViewController *v10;
  uint64_t v11;
  NSString *v12;
  void *v13;
  uint64_t v14;
  NSArray *definitionValues;
  objc_super v17;

  v5 = term;
  if (!v5)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "raise:format:", v7, CFSTR("-[%@ %s] does not accept nil as an argument."), v9, sel_getName(a2));

  }
  v17.receiver = self;
  v17.super_class = (Class)UIReferenceLibraryViewController;
  v10 = -[UIViewController initWithNibName:bundle:](&v17, sel_initWithNibName_bundle_, 0, 0);
  if (v10)
  {
    v11 = -[NSString copy](v5, "copy");
    v12 = v10->_term;
    v10->_term = (NSString *)v11;

    +[_UIDictionaryManager assetManager](_UIDictionaryManager, "assetManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_definitionValuesForTerm:", v5);
    v14 = objc_claimAutoreleasedReturnValue();
    definitionValues = v10->_definitionValues;
    v10->_definitionValues = (NSArray *)v14;

    -[UIViewController setPreferredContentSize:](v10, "setPreferredContentSize:", 320.0, 420.0);
  }

  return v10;
}

- (UIReferenceLibraryViewController)initWithCoder:(NSCoder *)coder
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIReferenceLibraryViewController;
  return -[UIViewController initWithCoder:](&v4, sel_initWithCoder_, coder);
}

+ (BOOL)_shouldShowDefineForTerm:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  v4 = v3;
  v5 = v3 && objc_msgSend(v3, "length") && (unint64_t)objc_msgSend(v4, "length") < 0xC9;

  return v5;
}

+ (BOOL)_shouldShowDefineForTermOfLength:(int64_t)a3
{
  return a3 && a3 < 201;
}

+ (BOOL)dictionaryHasDefinitionForTerm:(NSString *)term
{
  NSString *v3;
  NSString *v4;
  uint64_t v5;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = term;
  v4 = v3;
  if (v3 && -[NSString length](v3, "length") && -[NSString length](v4, "length") <= 0xC8)
  {
    +[_UIDictionaryManager assetManager](_UIDictionaryManager, "assetManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_allAvailableDefinitionDictionaries");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v9 = v8;
    v5 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v10 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v9);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "_hasDefinitionForTerm:", v4, (_QWORD)v12) & 1) != 0)
          {
            LOBYTE(v5) = 1;
            goto LABEL_16;
          }
        }
        v5 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_16:

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)_searchWeb:(id)a3
{
  NSString *term;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  term = self->_term;
  v5 = (void *)MEMORY[0x1E0CB3500];
  v6 = a3;
  objc_msgSend(v5, "URLQueryAllowedCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString stringByAddingPercentEncodingWithAllowedCharacters:](term, "stringByAddingPercentEncodingWithAllowedCharacters:", v7);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("x-web-search://?%@"), v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLWithString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)UIApp, "openURL:options:completionHandler:", v10, MEMORY[0x1E0C9AA70], &__block_literal_global_133);
  -[UIReferenceLibraryViewController _dismissModalReferenceView:](self, "_dismissModalReferenceView:", v6);

}

- (void)_dismissModalReferenceView:(id)a3
{
  void *v4;
  void *v5;

  -[UIReferenceLibraryViewController dismissCompletionHandler](self, "dismissCompletionHandler", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UIReferenceLibraryViewController dismissCompletionHandler](self, "dismissCompletionHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v5);

    -[UIReferenceLibraryViewController setDismissCompletionHandler:](self, "setDismissCompletionHandler:", 0);
    -[UIReferenceLibraryViewController setEnableRotation:](self, "setEnableRotation:", 0);
  }
  else
  {
    -[UIViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }
}

- (void)_installRequiredElementsOnViewController:(id)a3
{
  id v4;
  UIBarButtonItem *v5;
  void *v6;
  UIBarButtonItem *v7;
  UIBarButtonItem *v8;
  UIBarButtonItem *v9;
  void *v10;
  UIBarButtonItem *v11;
  void *v12;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = [UIBarButtonItem alloc];
  _UINSLocalizedStringWithDefaultValue(CFSTR("Manage"), CFSTR("Manage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[UIBarButtonItem initWithTitle:style:target:action:](v5, "initWithTitle:style:target:action:", v6, 0, self, sel_pushDownloadManager_);

  v8 = -[UIBarButtonItem initWithBarButtonSystemItem:target:action:]([UIBarButtonItem alloc], "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  v9 = [UIBarButtonItem alloc];
  _UINSLocalizedStringWithDefaultValue(CFSTR("Search Web"), CFSTR("Search Web"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[UIBarButtonItem initWithTitle:style:target:action:](v9, "initWithTitle:style:target:action:", v10, 0, self, sel__searchWeb_);

  v13[0] = v7;
  v13[1] = v8;
  v13[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setToolbarItems:", v12);
  -[UIReferenceLibraryViewController _installDoneButtonOnViewControllerIfNeeded:](self, "_installDoneButtonOnViewControllerIfNeeded:", v4);

}

- (void)_installDoneButtonOnViewControllerIfNeeded:(id)a3
{
  UIReferenceLibraryViewController *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  UIBarButtonItem *v8;
  void *v9;
  void *v10;
  UIBarButtonItem *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v4 = self;
  -[UIViewController _existingPresentationControllerImmediate:effective:](v4, "_existingPresentationControllerImmediate:effective:", 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {

LABEL_4:
    objc_msgSend(v14, "navigationItem");
    v8 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setRightBarButtonItem:](v8, "setRightBarButtonItem:", 0);
    goto LABEL_5;
  }
  -[UIViewController _popoverController](v4, "_popoverController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    goto LABEL_4;
  objc_msgSend(v14, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rightBarButtonItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    goto LABEL_6;
  v11 = [UIBarButtonItem alloc];
  _UINSLocalizedStringWithDefaultValue(CFSTR("Done"), CFSTR("Done"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[UIBarButtonItem initWithTitle:style:target:action:](v11, "initWithTitle:style:target:action:", v12, 0, v4, sel__dismissModalReferenceView_);

  objc_msgSend(v14, "navigationItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setRightBarButtonItem:", v8);

LABEL_5:
LABEL_6:

}

- (void)pushDownloadManager:(id)a3
{
  _UIRemoteDictionaryViewController *v4;

  v4 = -[_UIRemoteDictionaryViewController initWithStyle:]([_UIRemoteDictionaryViewController alloc], "initWithStyle:", 0);
  -[UINavigationController pushViewController:animated:](self->_baseNavController, "pushViewController:animated:", v4, 1);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[NSArray count](self->_definitionValues, "count", a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  UITableViewCell *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _UIShortDefinitionView *v14;
  void *v15;
  _UIShortDefinitionView *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("definition_cell"));
  v7 = (UITableViewCell *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = -[UITableViewCell initWithStyle:reuseIdentifier:]([UITableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("definition_cell"));
    -[UITableViewCell setAccessoryType:](v7, "setAccessoryType:", 1);
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[UITableViewCell contentView](v7, "contentView", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subviews");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v13++), "removeFromSuperview");
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }

  v14 = [_UIShortDefinitionView alloc];
  -[UITableViewCell contentView](v7, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  v16 = -[_UIShortDefinitionView initWithFrame:](v14, "initWithFrame:");

  -[NSArray objectAtIndex:](self->_definitionValues, "objectAtIndex:", objc_msgSend(v6, "section"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIShortDefinitionView setDefinitionValue:](v16, "setDefinitionValue:", v17);

  -[UITableViewCell contentView](v7, "contentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addSubview:", v16);

  return v7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[NSArray objectAtIndex:](self->_definitionValues, "objectAtIndex:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedDictionaryName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uppercaseStringWithLocale:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 120.0;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5;
  _UILongDefinitionViewController *v6;
  void *v7;
  _UILongDefinitionViewController *v8;

  v5 = a4;
  v6 = [_UILongDefinitionViewController alloc];
  -[NSArray objectAtIndex:](self->_definitionValues, "objectAtIndex:", objc_msgSend(v5, "section"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_UILongDefinitionViewController initWithDefinitionValue:](v6, "initWithDefinitionValue:", v7);

  -[UIReferenceLibraryViewController _installRequiredElementsOnViewController:](self, "_installRequiredElementsOnViewController:", v8);
  -[UINavigationController pushViewController:animated:](self->_baseNavController, "pushViewController:animated:", v8, 1);

  return v5;
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  void *v6;
  _BOOL8 v7;
  id v8;

  v8 = a3;
  objc_msgSend(a4, "toolbarItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count") == 0;

  objc_msgSend(v8, "setToolbarHidden:", v7);
}

+ (id)_backgroundColor
{
  return +[UIColor clearColor](UIColor, "clearColor");
}

- (id)_backgroundColor
{
  return (id)objc_msgSend((id)objc_opt_class(), "_backgroundColor");
}

+ (id)_foregroundColor
{
  return +[UIColor labelColor](UIColor, "labelColor");
}

- (id)_foregroundColor
{
  return (id)objc_msgSend((id)objc_opt_class(), "_foregroundColor");
}

+ (id)_diddlyDoViewLineColor
{
  return +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.776470588, 1.0);
}

- (id)_diddlyDoViewLineColor
{
  return (id)objc_msgSend((id)objc_opt_class(), "_diddlyDoViewLineColor");
}

+ (id)_defaultButtonImage
{
  void *v2;
  void *v3;

  _UIImageWithName(CFSTR("UIReferenceLibraryViewControllerButtonNormal"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stretchableImageWithLeftCapWidth:topCapHeight:", 5, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_defaultButtonImage
{
  return (id)objc_msgSend((id)objc_opt_class(), "_defaultButtonImage");
}

+ (id)_pressedButtonImage
{
  void *v2;
  void *v3;

  _UIImageWithName(CFSTR("UIReferenceLibraryViewControllerButtonPressed"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stretchableImageWithLeftCapWidth:topCapHeight:", 5, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_pressedButtonImage
{
  return (id)objc_msgSend((id)objc_opt_class(), "_pressedButtonImage");
}

+ (id)_localizedDictionaryTitleAttributes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v8[0] = *(_QWORD *)off_1E1678D90;
  objc_msgSend(off_1E167A828, "fontWithName:size:", CFSTR("Helvetica-Bold"), 14.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = *(_QWORD *)off_1E1678D98;
  objc_msgSend(a1, "_foregroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v8[2] = *(_QWORD *)off_1E1678C50;
  objc_msgSend(a1, "_backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_localizedDictionaryTitleAttributes
{
  return (id)objc_msgSend((id)objc_opt_class(), "_localizedDictionaryTitleAttributes");
}

+ (id)_dictionaryDefinitionAttributes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v8[0] = *(_QWORD *)off_1E1678D90;
  objc_msgSend(off_1E167A828, "fontWithName:size:", CFSTR("Baskerville"), 16.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = *(_QWORD *)off_1E1678D98;
  objc_msgSend(a1, "_foregroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v8[2] = *(_QWORD *)off_1E1678C50;
  objc_msgSend(a1, "_backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_dictionaryDefinitionAttributes
{
  return (id)objc_msgSend((id)objc_opt_class(), "_dictionaryDefinitionAttributes");
}

+ (id)_colorAttributes
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = *(_QWORD *)off_1E1678D98;
  objc_msgSend(a1, "_foregroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  v7[1] = *(_QWORD *)off_1E1678C50;
  objc_msgSend(a1, "_backgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_colorAttributes
{
  return (id)objc_msgSend((id)objc_opt_class(), "_colorAttributes");
}

- (void)viewDidLoad
{
  UINavigationController *v3;
  UINavigationController *baseNavController;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UINavigationController *v9;
  void *v10;
  void *v11;
  id v12;
  objc_super v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)UIReferenceLibraryViewController;
  -[UIViewController viewDidLoad](&v13, sel_viewDidLoad);
  v3 = (UINavigationController *)objc_msgSend(objc_alloc((Class)DataDetectorsUIGetClass(CFSTR("DDParsecCollectionViewController"))), "initWithString:range:dictionaryOnly:", self->_term, 0, -[NSString length](self->_term, "length"), 1);
  baseNavController = self->_baseNavController;
  self->_baseNavController = v3;

  -[UIViewController addChildViewController:](self, "addChildViewController:", self->_baseNavController);
  -[UIViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self->_baseNavController, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v6);

  -[UIViewController view](self->_baseNavController, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  objc_msgSend(v7, "setFrame:");

  -[UINavigationController setToolbarHidden:](self->_baseNavController, "setToolbarHidden:", 0);
  -[UINavigationController setDelegate:](self->_baseNavController, "setDelegate:", self);
  v9 = self->_baseNavController;
  -[UIViewController presentationController](self, "presentationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDelegate:", v9);

  v14[0] = 0x1E1A99660;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[UIViewController _registerForTraitTokenChanges:withTarget:action:](self, "_registerForTraitTokenChanges:withTarget:action:", v11, self, sel__semanticContextTraitChanged);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIReferenceLibraryViewController;
  -[UIViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  -[UIViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIColor clearColor](UIColor, "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

}

- (void)_setPopoverController:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIReferenceLibraryViewController;
  -[UIViewController _setPopoverController:](&v3, sel__setPopoverController_, a3);
}

- (void)_willBecomeContentViewControllerOfPopover:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[UIReferenceLibraryViewController _setPopoverController:](self, "_setPopoverController:", v4);
  self->_oldPopoverStyle = objc_msgSend(v4, "_popoverBackgroundStyle");
  objc_msgSend(v4, "_setPopoverBackgroundStyle:", 2);
  v5.receiver = self;
  v5.super_class = (Class)UIReferenceLibraryViewController;
  -[UIViewController _willBecomeContentViewControllerOfPopover:](&v5, sel__willBecomeContentViewControllerOfPopover_, v4);

}

- (void)_didResignContentViewControllerOfPopover:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[UIReferenceLibraryViewController _setPopoverController:](self, "_setPopoverController:", 0);
  objc_msgSend(v4, "_setPopoverBackgroundStyle:", self->_oldPopoverStyle);
  v5.receiver = self;
  v5.super_class = (Class)UIReferenceLibraryViewController;
  -[UIViewController _didResignContentViewControllerOfPopover:](&v5, sel__didResignContentViewControllerOfPopover_, v4);

}

- (void)_semanticContextTraitChanged
{
  -[UIReferenceLibraryViewController _installDoneButtonOnViewControllerIfNeeded:](self, "_installDoneButtonOnViewControllerIfNeeded:", self);
}

- (void)setEnableRotation:(BOOL)a3
{
  _BOOL8 previousIgnoreOrientation;

  if (self->_enableRotation != a3)
  {
    if (a3)
    {
      self->_previousIgnoreOrientation = -[UIViewController _ignoreAppSupportedOrientations](self, "_ignoreAppSupportedOrientations");
      previousIgnoreOrientation = 1;
    }
    else
    {
      previousIgnoreOrientation = self->_previousIgnoreOrientation;
    }
    -[UIViewController _setIgnoreAppSupportedOrientations:](self, "_setIgnoreAppSupportedOrientations:", previousIgnoreOrientation);
    self->_enableRotation = a3;
  }
}

- (BOOL)enableRotation
{
  return self->_enableRotation;
}

- (unint64_t)supportedInterfaceOrientations
{
  objc_class *v4;
  IMP MethodImplementation;
  objc_super v7;

  if (self->_enableRotation)
  {
    v4 = (objc_class *)objc_opt_class();
    MethodImplementation = class_getMethodImplementation(v4, a2);
    return ((uint64_t (*)(UIReferenceLibraryViewController *, SEL))MethodImplementation)(self, a2);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIReferenceLibraryViewController;
    return -[UIViewController supportedInterfaceOrientations](&v7, sel_supportedInterfaceOrientations);
  }
}

- (BOOL)shouldAutorotate
{
  objc_class *v4;
  IMP MethodImplementation;
  objc_super v7;

  if (self->_enableRotation)
  {
    v4 = (objc_class *)objc_opt_class();
    MethodImplementation = class_getMethodImplementation(v4, a2);
    return ((uint64_t (*)(UIReferenceLibraryViewController *, SEL))MethodImplementation)(self, a2);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIReferenceLibraryViewController;
    return -[UIViewController shouldAutorotate](&v7, sel_shouldAutorotate);
  }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  objc_class *v6;
  IMP MethodImplementation;
  objc_super v9;

  if (self->_enableRotation)
  {
    v6 = (objc_class *)objc_opt_class();
    MethodImplementation = class_getMethodImplementation(v6, a2);
    return ((uint64_t (*)(UIReferenceLibraryViewController *, SEL, int64_t))MethodImplementation)(self, a2, a3);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)UIReferenceLibraryViewController;
    return -[UIViewController shouldAutorotateToInterfaceOrientation:](&v9, sel_shouldAutorotateToInterfaceOrientation_, a3);
  }
}

- (int64_t)_preferredInterfaceOrientationGivenCurrentOrientation:(int64_t)a3
{
  objc_class *v6;
  IMP MethodImplementation;
  objc_super v9;

  if (self->_enableRotation)
  {
    v6 = (objc_class *)objc_opt_class();
    MethodImplementation = class_getMethodImplementation(v6, a2);
    return ((uint64_t (*)(UIReferenceLibraryViewController *, SEL, int64_t))MethodImplementation)(self, a2, a3);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)UIReferenceLibraryViewController;
    return -[UIViewController _preferredInterfaceOrientationGivenCurrentOrientation:](&v9, sel__preferredInterfaceOrientationGivenCurrentOrientation_, a3);
  }
}

- (void)window:(id)a3 setupWithInterfaceOrientation:(int64_t)a4
{
  id v8;
  objc_class *v9;
  IMP MethodImplementation;
  objc_super v11;

  if (self->_enableRotation)
  {
    v8 = a3;
    v9 = (objc_class *)objc_opt_class();
    MethodImplementation = class_getMethodImplementation(v9, a2);
    ((void (*)(UIReferenceLibraryViewController *, SEL, id, int64_t))MethodImplementation)(self, a2, v8, a4);
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)UIReferenceLibraryViewController;
    -[UIViewController window:setupWithInterfaceOrientation:](&v11, sel_window_setupWithInterfaceOrientation_, a3, a4);
  }

}

- (id)dismissCompletionHandler
{
  return self->_dismissCompletionHandler;
}

- (void)setDismissCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1024);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dismissCompletionHandler, 0);
  objc_storeStrong((id *)&self->_longDefViewController, 0);
  objc_storeStrong((id *)&self->_multiDefViewController, 0);
  objc_storeStrong((id *)&self->_baseNavController, 0);
  objc_storeStrong((id *)&self->_definitionValues, 0);
  objc_storeStrong((id *)&self->_term, 0);
}

@end
