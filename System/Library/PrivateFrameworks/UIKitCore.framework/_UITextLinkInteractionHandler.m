@implementation _UITextLinkInteractionHandler

+ (id)handlerForItem:(id)a3 textContentView:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  char v12;
  char v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _UITextDataDetectedLinkInteractionHandler *v19;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "link");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scheme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasPrefix:", CFSTR("http"));

  if ((v9 & 1) != 0)
    goto LABEL_9;
  v10 = v7;
  objc_msgSend(v10, "scheme");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hasPrefix:", CFSTR("x-apple-data-detectors"));

  if ((v12 & 1) != 0)
  {
LABEL_5:

    goto LABEL_9;
  }
  if (!DataDetectorsUILibrary())
  {

LABEL_8:
    v14 = v6;
    objc_msgSend(v5, "range");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "asRange");

    objc_msgSend(v14, "textStorage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "attribute:atIndex:effectiveRange:", CFSTR("DDResultAttributeName"), v16, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
LABEL_10:
      v19 = -[_UITextItemInteractionHandler initWithItem:textContentView:]([_UITextLinkInteractionHandler alloc], "initWithItem:textContentView:", v5, v6);
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  if (objc_msgSend(v10, "dd_isMaps:", 1))
    goto LABEL_5;
  v13 = objc_msgSend(v10, "dd_isAnySimpleTelephonyScheme");

  if ((v13 & 1) == 0)
    goto LABEL_8;
LABEL_9:
  v19 = -[_UITextDataDetectedLinkInteractionHandler initWithItem:textContentView:]([_UITextDataDetectedLinkInteractionHandler alloc], "initWithItem:textContentView:", v5, v6);
  if (!v19)
    goto LABEL_10;
LABEL_11:

  return v19;
}

- (id)link
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  id v10;

  -[_UITextItemInteractionHandler textContentView](self, "textContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attribute:atIndex:effectiveRange:", *(_QWORD *)off_1E1678EB8, -[_UITextItemInteractionHandler range](self, "range"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:encodingInvalidCharacters:", v5, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  objc_msgSend(v6, "scheme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasPrefix:", CFSTR("x-apple-data-detectors"));

  if ((v9 & 1) != 0)
    v10 = 0;
  else
    v10 = v7;

  return v10;
}

- (id)_defaultPrimaryActionForInteractableItem
{
  void *v3;
  void *v4;
  void *v5;

  -[_UITextLinkInteractionHandler link](self, "link");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "compare:options:", CFSTR("http"), 1)
    && objc_msgSend(v4, "compare:options:", CFSTR("https"), 1)
    || IsWebBrowserAvailable())
  {
    -[_UITextLinkInteractionHandler _openURLAction:](self, "_openURLAction:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_defaultMenuForInteractableItem
{
  void *v3;
  void *v4;
  id v5;
  void (**v6)(void *, void *);
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD aBlock[4];
  id v18;

  -[_UITextLinkInteractionHandler link](self, "link");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)objc_opt_new();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __64___UITextLinkInteractionHandler__defaultMenuForInteractableItem__block_invoke;
    aBlock[3] = &unk_1E16B2C10;
    v18 = v4;
    v5 = v4;
    v6 = (void (**)(void *, void *))_Block_copy(aBlock);
    if (_UIApplicationHasAppLinkEntitlements()
      && (_UIAppLinkForURL(v3), (v7 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v8 = (void *)v7;
      -[_UITextLinkInteractionHandler _openAppLinkInExternalApplicationAction:](self, "_openAppLinkInExternalApplicationAction:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, v9);

      -[_UITextLinkInteractionHandler _openAppLinkInDefaultBrowserAction:](self, "_openAppLinkInDefaultBrowserAction:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, v10);

    }
    else
    {
      -[_UITextLinkInteractionHandler _openURLAction:](self, "_openURLAction:", v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, v8);
    }

    -[_UITextLinkInteractionHandler _addLinkToReadingListAction:](self, "_addLinkToReadingListAction:", v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v11);

    v12 = -[_UITextLinkInteractionHandler _copyLinkAction:](self, "_copyLinkAction:", v3);
    v6[2](v6, v12);

    -[_UITextLinkInteractionHandler _shareLinkAction:](self, "_shareLinkAction:", v3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v13);

    -[_UITextLinkInteractionHandler _titleForLink:](self, "_titleForLink:", v3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", v14, 0, CFSTR("UITextItemDefaultMenuIdentifier"), 0, v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)_titleForLink:(id)a3
{
  return (id)objc_msgSend(a3, "_web_userVisibleString");
}

- (id)_handlerRequiringUnlockedDevice:(BOOL)a3 handler:(id)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  uint64_t *v7;
  id v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  v5 = a4;
  if ((objc_msgSend((id)UIApp, "isFrontBoard") & 1) != 0 || !v4)
  {
    v11 = MEMORY[0x1E0C809B0];
    v6 = __73___UITextLinkInteractionHandler__handlerRequiringUnlockedDevice_handler___block_invoke_3;
    v7 = &v11;
  }
  else
  {
    v12 = MEMORY[0x1E0C809B0];
    v6 = __73___UITextLinkInteractionHandler__handlerRequiringUnlockedDevice_handler___block_invoke;
    v7 = &v12;
  }
  v7[1] = 3221225472;
  v7[2] = (uint64_t)v6;
  v7[3] = (uint64_t)&unk_1E16B2C60;
  v7[4] = (uint64_t)v5;
  v8 = v5;
  v9 = _Block_copy(v7);

  return v9;
}

- (id)_openURLAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  id v23;
  id v24;

  v4 = a3;
  objc_msgSend(v4, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && IsWebBrowserAvailable())
  {
    -[_UITextItemInteractionHandler textContentView](self, "textContentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_windowHostingScene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_currentOpenApplicationEndpoint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "instance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.SpringBoard.continuity-display")) ^ 1;

    _UIKitBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Open Link"), CFSTR("Open"), CFSTR("Localizable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("safari"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __48___UITextLinkInteractionHandler__openURLAction___block_invoke;
    v22 = &unk_1E16B1B50;
    v23 = v4;
    v24 = v6;
    v15 = v6;
    -[_UITextLinkInteractionHandler _handlerRequiringUnlockedDevice:handler:](self, "_handlerRequiringUnlockedDevice:handler:", v11, &v19);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v13, v14, 0, v16, v19, v20, v21, v22);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)_copyLinkAction:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  objc_msgSend(a3, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    _UIKitBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Copy Link"), CFSTR("Copy"), CFSTR("Localizable"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("link"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __49___UITextLinkInteractionHandler__copyLinkAction___block_invoke;
    v9[3] = &unk_1E16B2C10;
    v10 = v3;
    +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v5, v6, 0, v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_shareLinkAction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  _UITextLinkInteractionHandler *v15;
  id v16;

  objc_msgSend(a3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    _UIKitBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Share…"), CFSTR("Share…"), CFSTR("Localizable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("square.and.arrow.up"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __50___UITextLinkInteractionHandler__shareLinkAction___block_invoke;
    v14 = &unk_1E16B1B50;
    v15 = self;
    v16 = v4;
    -[_UITextLinkInteractionHandler _handlerRequiringUnlockedDevice:handler:](self, "_handlerRequiringUnlockedDevice:handler:", 1, &v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v6, v7, 0, v8, v11, v12, v13, v14, v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_openAppLinkInDefaultBrowserAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;

  v4 = a3;
  if (v4 && IsWebBrowserAvailable())
  {
    -[_UITextItemInteractionHandler textContentView](self, "textContentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _UINSLocalizedStringWithDefaultValue(CFSTR("Open in Safari"), CFSTR("Open in Safari"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("safari"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __68___UITextLinkInteractionHandler__openAppLinkInDefaultBrowserAction___block_invoke;
    v15 = &unk_1E16B1B50;
    v16 = v4;
    v17 = v5;
    v8 = v5;
    -[_UITextLinkInteractionHandler _handlerRequiringUnlockedDevice:handler:](self, "_handlerRequiringUnlockedDevice:handler:", 1, &v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v6, v7, 0, v9, v12, v13, v14, v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_openAppLinkInExternalApplicationAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;

  v4 = a3;
  objc_msgSend(v4, "targetApplicationProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedNameForContext:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    _UIKitBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Open in %@ (Link Element Action Sheet Button)"), CFSTR("Open in %@"), CFSTR("Localizable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UITextItemInteractionHandler textContentView](self, "textContentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("arrow.up.forward.square"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __73___UITextLinkInteractionHandler__openAppLinkInExternalApplicationAction___block_invoke;
    v17[3] = &unk_1E16B1B50;
    v18 = v4;
    v19 = v11;
    v13 = v11;
    -[_UITextLinkInteractionHandler _handlerRequiringUnlockedDevice:handler:](self, "_handlerRequiringUnlockedDevice:handler:", 1, v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v10, v12, 0, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)_addLinkToReadingListAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;

  v4 = a3;
  if (IsWebBrowserAvailable() && objc_msgSend(getSSReadingListClass(), "supportsURL:", v4))
  {
    -[_UITextLinkInteractionHandler _titleForLink:](self, "_titleForLink:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _UINSLocalizedStringWithDefaultValue(CFSTR("Add to Reading List"), CFSTR("Add to Reading List"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("book"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __61___UITextLinkInteractionHandler__addLinkToReadingListAction___block_invoke;
    v15 = &unk_1E16B1B50;
    v16 = v4;
    v17 = v5;
    v8 = v5;
    -[_UITextLinkInteractionHandler _handlerRequiringUnlockedDevice:handler:](self, "_handlerRequiringUnlockedDevice:handler:", 1, &v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v6, v7, 0, v9, v12, v13, v14, v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
