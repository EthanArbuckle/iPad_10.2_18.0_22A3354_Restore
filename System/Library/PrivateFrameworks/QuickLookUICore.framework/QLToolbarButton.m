@implementation QLToolbarButton

- (QLToolbarButton)init
{

  return 0;
}

- (QLToolbarButton)initWithIdentifier:(id)a3
{
  id v5;
  QLToolbarButton *v6;
  QLToolbarButton *v7;
  QLToolbarButton *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)QLToolbarButton;
  v6 = -[QLToolbarButton init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    v7->_placement = 1;
    v7->_enabled = 1;
    v8 = v7;
  }

  return v7;
}

- (id)_barButtonImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0CEA650], "unspecifiedConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_configurationIgnoringDynamicType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[QLToolbarButton useBundleImage](self, "useBundleImage"))
  {
    v5 = (void *)MEMORY[0x1E0CEA638];
    -[QLToolbarButton symbolImageName](self, "symbolImageName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    QLFrameworkBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageNamed:inBundle:withConfiguration:", v6, v7, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
    goto LABEL_9;
  }
  if (-[QLToolbarButton useInternalSymbolImage](self, "useInternalSymbolImage"))
  {
    v9 = (void *)MEMORY[0x1E0CEA638];
    -[QLToolbarButton symbolImageName](self, "symbolImageName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_systemImageNamed:withConfiguration:", v6, v4);
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v8 = (void *)v10;
    goto LABEL_8;
  }
  -[QLToolbarButton symbolImageName](self, "symbolImageName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v11 = (void *)MEMORY[0x1E0CEA638];
    -[QLToolbarButton symbolImageName](self, "symbolImageName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "systemImageNamed:withConfiguration:", v6, v4);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
LABEL_9:

  return v8;
}

- (QLToolbarButton)barButtonWithTarget:(id)a3 action:(SEL)a4 maxSize:(CGSize)a5
{
  id v7;
  void *v8;
  QLToolbarButtonItemRepresentation *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  QLToolbarButtonItemRepresentation *v13;
  QLToolbarButtonItemRepresentation *v14;
  QLToolbarButtonItemRepresentation *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v7 = a3;
  -[QLToolbarButton symbolImageName](self, "symbolImageName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = [QLToolbarButtonItemRepresentation alloc];
    -[QLToolbarButton _barButtonImage](self, "_barButtonImage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[QLToolbarButtonItemRepresentation initWithImage:style:target:action:](v9, "initWithImage:style:target:action:", v10, 0, v7, a4);
LABEL_5:
    v15 = (QLToolbarButtonItemRepresentation *)v11;

    goto LABEL_6;
  }
  -[QLToolbarButton title](self, "title");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = [QLToolbarButtonItemRepresentation alloc];
  v14 = v13;
  if (v12)
  {
    -[QLToolbarButton title](self, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[QLToolbarButtonItemRepresentation initWithTitle:style:target:action:](v14, "initWithTitle:style:target:action:", v10, 0, v7, a4);
    goto LABEL_5;
  }
  v15 = -[QLToolbarButtonItemRepresentation initWithBarButtonSystemItem:target:action:](v13, "initWithBarButtonSystemItem:target:action:", self->_systemItem, v7, a4);
LABEL_6:
  -[QLToolbarButton options](self, "options");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    -[QLToolbarButtonItemRepresentation setLongPressTarget:action:](v15, "setLongPressTarget:action:", self, sel_handleLongPress_);
  -[QLToolbarButtonItemRepresentation setSelected:](v15, "setSelected:", -[QLToolbarButton selected](self, "selected"));
  -[QLToolbarButton _additionalSelectionInsets](self, "_additionalSelectionInsets");
  -[QLToolbarButtonItemRepresentation _setAdditionalSelectionInsets:](v15, "_setAdditionalSelectionInsets:");
  -[QLToolbarButtonItemRepresentation setEnabled:](v15, "setEnabled:", -[QLToolbarButton enabled](self, "enabled"));
  -[QLToolbarButton identifier](self, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLToolbarButtonItemRepresentation setIdentifier:](v15, "setIdentifier:", v17);

  -[QLToolbarButtonItemRepresentation setPlacement:](v15, "setPlacement:", -[QLToolbarButton placement](self, "placement"));
  -[QLToolbarButtonItemRepresentation setPresentingViewController:](v15, "setPresentingViewController:", v7);
  -[QLToolbarButtonItemRepresentation setOriginalButton:](v15, "setOriginalButton:", self);
  -[QLToolbarButtonItemRepresentation setDisappearsOnTap:](v15, "setDisappearsOnTap:", -[QLToolbarButton disappearsOnTap](self, "disappearsOnTap"));
  -[QLToolbarButton accessibilityIdentifier](self, "accessibilityIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[QLToolbarButton accessibilityIdentifier](self, "accessibilityIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLToolbarButtonItemRepresentation setAccessibilityIdentifier:](v15, "setAccessibilityIdentifier:", v19);

  }
  objc_storeStrong((id *)&self->_currentItemRepresentation, v15);
  objc_storeWeak(&self->_target, v7);
  self->_action = a4;

  return (QLToolbarButton *)v15;
}

- (void)handleLongPress:(id)a3
{
  QLToolbarButtonItemRepresentation *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  uint64_t v20;
  char **__ptr32 *v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  void *v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  QLToolbarButtonItemRepresentation *v39;
  _QWORD v40[4];
  id v41;
  id v42;
  QLToolbarButton *v43;
  _QWORD v44[6];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "state") == 1)
  {
    v4 = self->_currentItemRepresentation;
    -[QLToolbarButtonItemRepresentation presentingViewController](v4, "presentingViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLToolbarButtonItemRepresentation customView](v4, "customView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "popoverPresentationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSourceView:", v7);

    -[QLToolbarButtonItemRepresentation customView](v4, "customView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    objc_msgSend(v6, "popoverPresentationController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setSourceRect:", v11, v13, v15, v17);

    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    -[QLToolbarButton options](self, "options");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    v21 = &off_1D9392000;
    if (v20)
    {
      v22 = v20;
      v38 = v5;
      v39 = v4;
      v23 = *(_QWORD *)v46;
      v24 = 1;
      do
      {
        v25 = v19;
        for (i = 0; i != v22; ++i)
        {
          v27 = v6;
          if (*(_QWORD *)v46 != v23)
            objc_enumerationMutation(v25);
          v28 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          v29 = (void *)MEMORY[0x1E0CEA2E0];
          objc_msgSend(v28, "title");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v28, "style");
          v44[0] = MEMORY[0x1E0C809B0];
          v44[1] = 3221225472;
          v44[2] = __35__QLToolbarButton_handleLongPress___block_invoke;
          v44[3] = &unk_1E9EFBF78;
          v44[4] = self;
          v44[5] = v28;
          objc_msgSend(v29, "actionWithTitle:style:handler:", v30, v31, v44);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          v6 = v27;
          objc_msgSend(v27, "addAction:", v32);
          v24 &= objc_msgSend(v28, "isCancel") ^ 1;

        }
        v19 = v25;
        v22 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      }
      while (v22);

      v5 = v38;
      v4 = v39;
      v21 = &off_1D9392000;
      if ((v24 & 1) == 0)
        goto LABEL_13;
    }
    else
    {

    }
    v33 = (void *)MEMORY[0x1E0CEA2E0];
    QLLocalizedString(CFSTR("Cancel"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "actionWithTitle:style:handler:", v34, 1, 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addAction:", v35);

LABEL_13:
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = *((_QWORD *)v21 + 144);
    v40[2] = __35__QLToolbarButton_handleLongPress___block_invoke_2;
    v40[3] = &unk_1E9EFBFA0;
    v41 = v5;
    v42 = v6;
    v43 = self;
    v36 = v6;
    v37 = v5;
    objc_msgSend(v37, "prepareForActionSheetPresentationWithCompletionHandler:", v40);

  }
}

void __35__QLToolbarButton_handleLongPress___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(WeakRetained, "performSelector:withObject:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), *(_QWORD *)(a1 + 40));

}

void __35__QLToolbarButton_handleLongPress___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;
  uint64_t v7;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __35__QLToolbarButton_handleLongPress___block_invoke_3;
  v4[3] = &unk_1E9EFBFA0;
  v5 = *(id *)(a1 + 32);
  v2 = *(id *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v6 = v2;
  v7 = v3;
  QLRunInMainThread(v4);

}

id __35__QLToolbarButton_handleLongPress___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 48) + 16), *(id *)(a1 + 40));
}

- (void)invalidateCurrentState
{
  UIAlertController **p_alertController;
  id WeakRetained;
  id v4;

  p_alertController = &self->_alertController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_alertController);

  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained((id *)p_alertController);
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 0, 0);

    objc_storeWeak((id *)p_alertController, 0);
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  int v29;
  int v30;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  int64_t v44;
  unint64_t v45;
  int v46;
  int v47;
  int v48;
  void *v49;
  void *v50;
  int v51;
  int v52;
  _BOOL4 v53;

  v4 = a3;
  -[QLToolbarButton identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v5 == (void *)v6)
  {

  }
  else
  {
    v7 = (void *)v6;
    -[QLToolbarButton identifier](self, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if (!v10)
      goto LABEL_18;
  }
  -[QLToolbarButton title](self, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v11 == (void *)v12)
  {

  }
  else
  {
    v13 = (void *)v12;
    -[QLToolbarButton title](self, "title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_18;
  }
  -[QLToolbarButton accessibilityIdentifier](self, "accessibilityIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityIdentifier");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v17 == (void *)v18)
  {

  }
  else
  {
    v19 = (void *)v18;
    -[QLToolbarButton accessibilityIdentifier](self, "accessibilityIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessibilityIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_18;
  }
  -[QLToolbarButton options](self, "options");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "options");
  v24 = objc_claimAutoreleasedReturnValue();
  if (v23 == (void *)v24)
  {

  }
  else
  {
    v25 = (void *)v24;
    -[QLToolbarButton options](self, "options");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "options");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "isEqual:", v27);

    if (!v28)
      goto LABEL_18;
  }
  v29 = -[QLToolbarButton selected](self, "selected");
  if (v29 != objc_msgSend(v4, "selected"))
  {
LABEL_18:
    LOBYTE(v30) = 0;
    goto LABEL_19;
  }
  -[QLToolbarButton _additionalSelectionInsets](self, "_additionalSelectionInsets");
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v39 = v38;
  objc_msgSend(v4, "_additionalSelectionInsets");
  LOBYTE(v30) = 0;
  if (v35 == v43 && v33 == v40 && v39 == v42 && v37 == v41)
  {
    v44 = -[QLToolbarButton systemItem](self, "systemItem");
    if (v44 == objc_msgSend(v4, "systemItem"))
    {
      v45 = -[QLToolbarButton placement](self, "placement");
      if (v45 == objc_msgSend(v4, "placement"))
      {
        v46 = -[QLToolbarButton forceToNavBar](self, "forceToNavBar");
        if (v46 == objc_msgSend(v4, "forceToNavBar"))
        {
          v47 = -[QLToolbarButton useBundleImage](self, "useBundleImage");
          if (v47 == objc_msgSend(v4, "useBundleImage"))
          {
            v48 = -[QLToolbarButton useInternalSymbolImage](self, "useInternalSymbolImage");
            if (v48 == objc_msgSend(v4, "useInternalSymbolImage"))
            {
              -[QLToolbarButton symbolImageName](self, "symbolImageName");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "symbolImageName");
              v50 = (void *)objc_claimAutoreleasedReturnValue();

              if (v49 == v50)
              {
                v51 = -[QLToolbarButton enabled](self, "enabled");
                if (v51 == objc_msgSend(v4, "enabled"))
                {
                  v52 = -[QLToolbarButton roundedSelectedIndicator](self, "roundedSelectedIndicator");
                  if (v52 == objc_msgSend(v4, "roundedSelectedIndicator"))
                  {
                    v53 = -[QLToolbarButton disappearsOnTap](self, "disappearsOnTap");
                    v30 = v53 ^ objc_msgSend(v4, "disappearsOnTap") ^ 1;
                    goto LABEL_19;
                  }
                }
              }
            }
          }
        }
      }
    }
    goto LABEL_18;
  }
LABEL_19:

  return v30;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[QLToolbarButton identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[QLToolbarButton identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "encodeObject:forKey:", v5, CFSTR("identifier"));

  }
  -[QLToolbarButton symbolImageName](self, "symbolImageName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[QLToolbarButton symbolImageName](self, "symbolImageName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "encodeObject:forKey:", v7, CFSTR("symbolImageName"));

  }
  objc_msgSend(v11, "encodeInteger:forKey:", -[QLToolbarButton systemItem](self, "systemItem"), CFSTR("systemItem"));
  objc_msgSend(v11, "encodeInteger:forKey:", -[QLToolbarButton placement](self, "placement"), CFSTR("placement"));
  objc_msgSend(v11, "encodeBool:forKey:", -[QLToolbarButton forceToNavBar](self, "forceToNavBar"), CFSTR("forceToNavBar"));
  objc_msgSend(v11, "encodeBool:forKey:", -[QLToolbarButton useBundleImage](self, "useBundleImage"), CFSTR("useBundleImage"));
  objc_msgSend(v11, "encodeBool:forKey:", -[QLToolbarButton useInternalSymbolImage](self, "useInternalSymbolImage"), CFSTR("useInternalSymbolImage"));
  objc_msgSend(v11, "encodeBool:forKey:", -[QLToolbarButton enabled](self, "enabled"), CFSTR("enabled"));
  objc_msgSend(v11, "encodeBool:forKey:", -[QLToolbarButton selected](self, "selected"), CFSTR("selected"));
  -[QLToolbarButton _additionalSelectionInsets](self, "_additionalSelectionInsets");
  objc_msgSend(v11, "encodeUIEdgeInsets:forKey:", CFSTR("_additionalSelectionInsets"));
  objc_msgSend(v11, "encodeBool:forKey:", -[QLToolbarButton roundedSelectedIndicator](self, "roundedSelectedIndicator"), CFSTR("roundedSelectedIndicator"));
  objc_msgSend(v11, "encodeBool:forKey:", -[QLToolbarButton disappearsOnTap](self, "disappearsOnTap"), CFSTR("disappearsOnTap"));
  -[QLToolbarButton title](self, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v8, CFSTR("title"));

  -[QLToolbarButton accessibilityIdentifier](self, "accessibilityIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v9, CFSTR("accessibilityIdentifier"));

  -[QLToolbarButton options](self, "options");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v10, CFSTR("options"));

}

- (QLToolbarButton)initWithCoder:(id)a3
{
  id v4;
  QLToolbarButton *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *symbolImageName;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  uint64_t v14;
  NSString *title;
  uint64_t v16;
  NSString *accessibilityIdentifier;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSArray *options;
  QLToolbarButton *v23;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)QLToolbarButton;
  v5 = -[QLToolbarButton init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("symbolImageName"));
    v8 = objc_claimAutoreleasedReturnValue();
    symbolImageName = v5->_symbolImageName;
    v5->_symbolImageName = (NSString *)v8;

    v5->_systemItem = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("systemItem"));
    v5->_placement = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("placement"));
    v5->_forceToNavBar = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("forceToNavBar"));
    v5->_useBundleImage = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useBundleImage"));
    v5->_useInternalSymbolImage = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useInternalSymbolImage"));
    v5->_selected = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("selected"));
    objc_msgSend(v4, "decodeUIEdgeInsetsForKey:", CFSTR("_additionalSelectionInsets"));
    v5->__additionalSelectionInsets.top = v10;
    v5->__additionalSelectionInsets.left = v11;
    v5->__additionalSelectionInsets.bottom = v12;
    v5->__additionalSelectionInsets.right = v13;
    v5->_roundedSelectedIndicator = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("roundedSelectedIndicator"));
    v5->_disappearsOnTap = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("disappearsOnTap"));
    v5->_enabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enabled"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v14 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessibilityIdentifier"));
    v16 = objc_claimAutoreleasedReturnValue();
    accessibilityIdentifier = v5->_accessibilityIdentifier;
    v5->_accessibilityIdentifier = (NSString *)v16;

    v18 = (void *)MEMORY[0x1E0C99E60];
    v19 = objc_opt_class();
    objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("options"));
    v21 = objc_claimAutoreleasedReturnValue();
    options = v5->_options;
    v5->_options = (NSArray *)v21;

    v23 = v5;
  }

  return v5;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)symbolImageName
{
  return self->_symbolImageName;
}

- (void)setSymbolImageName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (int64_t)systemItem
{
  return self->_systemItem;
}

- (void)setSystemItem:(int64_t)a3
{
  self->_systemItem = a3;
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (NSString)accessibilityIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setAccessibilityIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (NSArray)options
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setOptions:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (unint64_t)placement
{
  return self->_placement;
}

- (void)setPlacement:(unint64_t)a3
{
  self->_placement = a3;
}

- (BOOL)useBundleImage
{
  return self->_useBundleImage;
}

- (void)setUseBundleImage:(BOOL)a3
{
  self->_useBundleImage = a3;
}

- (BOOL)useInternalSymbolImage
{
  return self->_useInternalSymbolImage;
}

- (void)setUseInternalSymbolImage:(BOOL)a3
{
  self->_useInternalSymbolImage = a3;
}

- (BOOL)forceToNavBar
{
  return self->_forceToNavBar;
}

- (void)setForceToNavBar:(BOOL)a3
{
  self->_forceToNavBar = a3;
}

- (BOOL)selected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (UIEdgeInsets)_additionalSelectionInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  UIEdgeInsets result;

  objc_copyStruct(v6, &self->__additionalSelectionInsets, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)set_additionalSelectionInsets:(UIEdgeInsets)a3
{
  UIEdgeInsets v3;

  v3 = a3;
  objc_copyStruct(&self->__additionalSelectionInsets, &v3, 32, 1, 0);
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)roundedSelectedIndicator
{
  return self->_roundedSelectedIndicator;
}

- (void)setRoundedSelectedIndicator:(BOOL)a3
{
  self->_roundedSelectedIndicator = a3;
}

- (BOOL)disappearsOnTap
{
  return self->_disappearsOnTap;
}

- (void)setDisappearsOnTap:(BOOL)a3
{
  self->_disappearsOnTap = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_accessibilityIdentifier, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_symbolImageName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak(&self->_target);
  objc_destroyWeak((id *)&self->_alertController);
  objc_storeStrong((id *)&self->_currentItemRepresentation, 0);
}

@end
