@implementation SearchUIRequestButton

- (BOOL)shouldTopAlignForAccessibilityContentSizes
{
  return 1;
}

- (void)buttonPressed
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[SearchUIAccessoryViewController feedbackDelegate](self, "feedbackDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIUtilities environmentForDelegate:](SearchUIUtilities, "environmentForDelegate:", v3);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[SearchUIAccessoryViewController rowModel](self, "rowModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "buttonItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIAccessoryViewController rowModel](self, "rowModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUICommandHandler handlerForButton:rowModel:environment:](SearchUICommandHandler, "handlerForButton:rowModel:environment:", v6, v7, v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "executeWithTriggerEvent:", 2);

}

- (id)setupView
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  -[SearchUIRequestButton setLastState:](self, "setLastState:", 0);
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "addTarget:action:forControlEvents:", self, sel_buttonPressed, 64);
  -[SearchUIRequestButton setViewButton:](self, "setViewButton:", v3);
  v4 = objc_alloc_init(MEMORY[0x1E0DBD978]);
  -[SearchUIRequestButton setImageView:](self, "setImageView:", v4);

  -[SearchUIRequestButton imageView](self, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProminence:", 0);

  v6 = (void *)MEMORY[0x1E0DBDA08];
  -[SearchUIRequestButton viewButton](self, "viewButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  -[SearchUIRequestButton imageView](self, "imageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "verticalContainerStackViewWithArrangedSubviews:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIRequestButton setStackView:](self, "setStackView:", v10);

  -[SearchUIRequestButton stackView](self, "stackView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)imageWithSymbolName:(id)a3 accessibilityDescription:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  +[SearchUISymbolImage uiImageWithSymbolName:](SearchUISymbolImage, "uiImageWithSymbolName:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityLabel:", v5);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBD970]), "initWithImage:", v6);
  return v7;
}

- (void)_updateButtonState:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v3 = *(_QWORD *)&a3;
  if (-[SearchUIRequestButton lastState](self, "lastState") != a3)
  {
    -[SearchUIRequestButton setLastState:](self, "setLastState:", v3);
    if ((_DWORD)v3 == 3)
    {
      -[SearchUIRequestButton viewButton](self, "viewButton");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setHidden:", 1);

      +[SearchUIUtilities localizedStringForKey:](SearchUIUtilities, "localizedStringForKey:", CFSTR("DENIED"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = CFSTR("x.circle");
    }
    else
    {
      if ((_DWORD)v3 != 2)
      {
        -[SearchUIRequestButton viewButton](self, "viewButton");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setHidden:", 0);

        -[SearchUIRequestButton imageView](self, "imageView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v11;
        v12 = 1;
        goto LABEL_8;
      }
      -[SearchUIRequestButton viewButton](self, "viewButton");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setHidden:", 1);

      +[SearchUIUtilities localizedStringForKey:](SearchUIUtilities, "localizedStringForKey:", CFSTR("APPROVED"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = CFSTR("checkmark.circle");
    }
    -[SearchUIRequestButton imageWithSymbolName:accessibilityDescription:](self, "imageWithSymbolName:accessibilityDescription:", v7, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIRequestButton imageView](self, "imageView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTlkImage:", v9);

    -[SearchUIRequestButton imageView](self, "imageView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v11;
    v12 = 0;
LABEL_8:
    objc_msgSend(v11, "setHidden:", v12);

  }
}

- (void)updateButtonState:(BOOL)a3 withState:(int)a4
{
  _QWORD v4[5];
  int v5;

  if (a3)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __53__SearchUIRequestButton_updateButtonState_withState___block_invoke;
    v4[3] = &unk_1EA1F8470;
    v4[4] = self;
    v5 = a4;
    +[SearchUIUtilities performAnimatableChanges:](SearchUIUtilities, "performAnimatableChanges:", v4);
  }
  else
  {
    -[SearchUIRequestButton _updateButtonState:](self, "_updateButtonState:", *(_QWORD *)&a4);
  }
}

uint64_t __53__SearchUIRequestButton_updateButtonState_withState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateButtonState:", *(unsigned int *)(a1 + 40));
}

- (TLKStoreButton)viewButton
{
  return self->_viewButton;
}

- (void)setViewButton:(id)a3
{
  objc_storeStrong((id *)&self->_viewButton, a3);
}

- (TLKImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (TLKStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (int)lastState
{
  return self->_lastState;
}

- (void)setLastState:(int)a3
{
  self->_lastState = a3;
}

- (SFCommand)command
{
  return self->_command;
}

- (void)setCommand:(id)a3
{
  objc_storeStrong((id *)&self->_command, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_command, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_viewButton, 0);
}

@end
