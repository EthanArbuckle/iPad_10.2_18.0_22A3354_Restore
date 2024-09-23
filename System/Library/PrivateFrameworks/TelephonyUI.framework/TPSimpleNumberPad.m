@implementation TPSimpleNumberPad

+ (id)_numberPadCharacters
{
  if (_numberPadCharacters_onceToken != -1)
    dispatch_once(&_numberPadCharacters_onceToken, &__block_literal_global_9);
  return (id)_numberPadCharacters_numberPadCharacters;
}

void __41__TPSimpleNumberPad__numberPadCharacters__block_invoke()
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
  _QWORD v14[13];

  v14[12] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v13;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v12;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[5] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[6] = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[7] = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[8] = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[9] = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[10] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[11] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 12);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)_numberPadCharacters_numberPadCharacters;
  _numberPadCharacters_numberPadCharacters = v10;

}

- (TPSimpleNumberPad)initWithButtons:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Please call -[PHVoicemailSetupPINNumberPad initWithFrame:]"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("** TUAssertion failure: %@"), v5);

  if (_TUAssertShouldCrashApplication())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TPSimpleNumberPad.m"), 59, CFSTR("Please call -[PHVoicemailSetupPINNumberPad initWithFrame:]"));

  }
  return 0;
}

- (TPSimpleNumberPad)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  TPSimpleNumberPad *v18;
  TPSimpleNumberPad *v19;
  uint64_t v20;
  UIButton *deleteButton;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  UIButton *v29;
  void *v30;
  void *v31;
  UIButton *v32;
  void *v33;
  UIButton *v34;
  void *v35;
  void *v36;
  UIButton *v37;
  void *v38;
  void *v39;
  void *v40;
  UIButton *v41;
  void *v42;
  void *v43;
  objc_super v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v51 = *MEMORY[0x1E0C80C00];
  +[TPSimpleNumberPad _numberPadCharacters](TPSimpleNumberPad, "_numberPadCharacters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v10, "count"));
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v47;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v47 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_msgSend(objc_alloc(-[TPSimpleNumberPad numberPadButtonClass](self, "numberPadButtonClass")), "initForCharacter:style:", (int)objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * v16), "intValue"), a4);
        objc_msgSend(v11, "addObject:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    }
    while (v14);
  }

  v45.receiver = self;
  v45.super_class = (Class)TPSimpleNumberPad;
  v18 = -[TPNumberPad initWithButtons:](&v45, sel_initWithButtons_, v11);
  v19 = v18;
  if (v18)
  {
    -[TPSimpleNumberPad setFrame:](v18, "setFrame:", x, y, width, height);
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
    v20 = objc_claimAutoreleasedReturnValue();
    deleteButton = v19->_deleteButton;
    v19->_deleteButton = (UIButton *)v20;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v19->_deleteButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setBackgroundColor:](v19->_deleteButton, "setBackgroundColor:", v22);

    LODWORD(v23) = 1148846080;
    -[UIButton setContentCompressionResistancePriority:forAxis:](v19->_deleteButton, "setContentCompressionResistancePriority:forAxis:", 0, v23);
    LODWORD(v24) = 1148846080;
    -[UIButton setContentCompressionResistancePriority:forAxis:](v19->_deleteButton, "setContentCompressionResistancePriority:forAxis:", 1, v24);
    LODWORD(v25) = 1148846080;
    -[UIButton setContentHuggingPriority:forAxis:](v19->_deleteButton, "setContentHuggingPriority:forAxis:", 0, v25);
    LODWORD(v26) = 1148846080;
    -[UIButton setContentHuggingPriority:forAxis:](v19->_deleteButton, "setContentHuggingPriority:forAxis:", 1, v26);
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 18.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton titleLabel](v19->_deleteButton, "titleLabel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setFont:", v27);

    v29 = v19->_deleteButton;
    TelephonyUIBundle();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("DELETE"), &stru_1E75FDD38, CFSTR("General"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v29, "setTitle:forState:", v31, 0);

    v32 = v19->_deleteButton;
    objc_msgSend(MEMORY[0x1E0DC3658], "dynamicLabelColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](v32, "setTintColor:", v33);

    v34 = v19->_deleteButton;
    objc_msgSend(MEMORY[0x1E0DC3658], "dynamicLabelColor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forState:](v34, "setTitleColor:forState:", v35, 0);

    -[UIButton addTarget:action:forControlEvents:](v19->_deleteButton, "addTarget:action:forControlEvents:", v19, sel__deleteButtonClicked_withEvent_, 64);
    -[TPSimpleNumberPad addSubview:](v19, "addSubview:", v19->_deleteButton);
    v36 = (void *)MEMORY[0x1E0CB3718];
    v37 = v19->_deleteButton;
    objc_msgSend(v11, "objectAtIndexedSubscript:", 8);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v37, 9, 0, v38, 9, 1.0, 0.0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSimpleNumberPad addConstraint:](v19, "addConstraint:", v39);

    v40 = (void *)MEMORY[0x1E0CB3718];
    v41 = v19->_deleteButton;
    objc_msgSend(v11, "objectAtIndexedSubscript:", 10);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v41, 10, 0, v42, 10, 1.0, 0.0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSimpleNumberPad addConstraint:](v19, "addConstraint:", v43);

    -[TPSimpleNumberPad _updateDeleteButton](v19, "_updateDeleteButton");
  }

  return v19;
}

- (Class)numberPadButtonClass
{
  return (Class)objc_opt_class();
}

- (void)buttonUp:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[TPSimpleNumberPad delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[TPSimpleNumberPad delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    TPStringForNumberPadCharacter(objc_msgSend(v7, "character"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "simpleNumberPad:buttonPressedWithCharacter:", self, v6);

  }
}

- (void)_deleteButtonClicked:(id)a3 withEvent:(id)a4
{
  void *v5;
  id v6;

  -[TPSimpleNumberPad delegate](self, "delegate", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[TPSimpleNumberPad delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "simpleNumberPadDeletePressed:", self);

  }
}

- (void)_updateDeleteButton
{
  UIButton *deleteButton;
  _BOOL4 v4;
  double v5;

  deleteButton = self->_deleteButton;
  v4 = -[TPSimpleNumberPad showsDeleteButton](self, "showsDeleteButton");
  v5 = 0.0;
  if (v4)
    v5 = 1.0;
  -[UIButton setAlpha:](deleteButton, "setAlpha:", v5);
  -[UIButton setEnabled:](self->_deleteButton, "setEnabled:", -[TPSimpleNumberPad showsDeleteButton](self, "showsDeleteButton"));
}

- (void)setShowsDeleteButton:(BOOL)a3
{
  if (self->_showsDeleteButton != a3)
  {
    self->_showsDeleteButton = a3;
    -[TPSimpleNumberPad _updateDeleteButton](self, "_updateDeleteButton");
  }
}

- (void)setNumberButtonsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  if (-[TPNumberPad numberButtonsEnabled](self, "numberButtonsEnabled") != a3)
  {
    v15.receiver = self;
    v15.super_class = (Class)TPSimpleNumberPad;
    -[TPNumberPad setNumberButtonsEnabled:](&v15, sel_setNumberButtonsEnabled_, v3);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[TPNumberPad buttons](self, "buttons", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      v9 = v3 ^ 1;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "setGreyedOut:", v9);
        }
        while (v7 != v10);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
      }
      while (v7);
    }

  }
}

- (TPSimpleNumberPadDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (TPSimpleNumberPadDelegate *)a3;
}

- (BOOL)showsDeleteButton
{
  return self->_showsDeleteButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deleteButton, 0);
}

@end
