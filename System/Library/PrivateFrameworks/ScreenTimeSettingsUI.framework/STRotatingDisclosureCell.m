@implementation STRotatingDisclosureCell

- (STRotatingDisclosureCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  STRotatingDisclosureCell *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  UILongPressGestureRecognizer *longPressGestureRecognizer;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)STRotatingDisclosureCell;
  v4 = -[STRotatingDisclosureCell initWithStyle:reuseIdentifier:](&v18, sel_initWithStyle_reuseIdentifier_, a3, a4);
  objc_msgSend(MEMORY[0x24BEBB528], "defaultFontDescriptorWithTextStyle:", *MEMORY[0x24BEBE1D0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fontDescriptorWithSymbolicTraits:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v6, 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD660], "configurationWithFont:scale:", v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("chevron.forward"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageWithConfiguration:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD4B8], "tertiaryLabelColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "imageWithTintColor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "imageWithRenderingMode:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v13);
  objc_msgSend(v14, "setContentMode:", 4);
  -[STRotatingDisclosureCell setEditingAccessoryView:](v4, "setEditingAccessoryView:", v14);
  v15 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD740]), "initWithTarget:action:", v4, sel__userPressed_);
  longPressGestureRecognizer = v4->_longPressGestureRecognizer;
  v4->_longPressGestureRecognizer = (UILongPressGestureRecognizer *)v15;

  -[UILongPressGestureRecognizer setDelegate:](v4->_longPressGestureRecognizer, "setDelegate:", v4);
  -[UILongPressGestureRecognizer setMinimumPressDuration:](v4->_longPressGestureRecognizer, "setMinimumPressDuration:", 0.0);

  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)STRotatingDisclosureCell;
  -[PSTableCell layoutSubviews](&v9, sel_layoutSubviews);
  -[STRotatingDisclosureCell longPressGestureRecognizer](self, "longPressGestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STRotatingDisclosureCell gestureRecognizers](self, "gestureRecognizers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  if ((v5 & 1) == 0)
    -[STRotatingDisclosureCell addGestureRecognizer:](self, "addGestureRecognizer:", v3);
  -[PSTableCell specifier](self, "specifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "performGetter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[STRotatingDisclosureCell detailTextLabel](self, "detailTextLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v7);

}

- (void)setSpecifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  CGAffineTransform *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  CGAffineTransform v17;
  CGAffineTransform v18;
  CGAffineTransform t2;
  CGAffineTransform t1;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)STRotatingDisclosureCell;
  v4 = a3;
  -[PSTableCell setSpecifier:](&v21, sel_setSpecifier_, v4);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RotationDirection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "integerValue");
  -[STRotatingDisclosureCell editingAccessoryView](self, "editingAccessoryView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "transform");
  else
    memset(&t1, 0, sizeof(t1));
  v9 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v13 = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&t2.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&t2.c = v9;
  v11 = v9;
  v12 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  *(_OWORD *)&t2.tx = v12;
  if (CGAffineTransformEqualToTransform(&t1, &t2))
  {
    if (v6 == 1)
    {
      CGAffineTransformMakeRotation(&v18, dbl_219BA4D50[-[STRotatingDisclosureCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1]);
      v17 = v18;
      v10 = &v17;
LABEL_9:
      objc_msgSend(v8, "setTransform:", v10, v11, v12, v13, v14, v15, v16, *(_OWORD *)&v17.a, *(_OWORD *)&v17.c, *(_OWORD *)&v17.tx);
    }
  }
  else if (!v6)
  {
    v14 = v13;
    v15 = v11;
    v10 = (CGAffineTransform *)&v14;
    v16 = v12;
    goto LABEL_9;
  }

}

- (void)_userPressed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  _BOOL4 v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (**v20)(_QWORD, _QWORD);
  __int128 v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  STRotatingDisclosureCell *v26;
  uint64_t v27;
  _QWORD v28[5];
  CGAffineTransform v29;
  CGAffineTransform v30;

  v4 = a3;
  if (objc_msgSend(v4, "state") == 3)
  {
    -[PSTableCell specifier](self, "specifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HidesEditControl"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

    v8 = -[STRotatingDisclosureCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
    objc_msgSend(v4, "locationInView:", self);
    v10 = v9;
    -[STRotatingDisclosureCell imageView](self, "imageView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "frame");
    if (v8 == 1)
      v16 = v10 > CGRectGetMinX(*(CGRect *)&v12);
    else
      v16 = v10 < CGRectGetMaxX(*(CGRect *)&v12);

    if (((v7 | !v16) & 1) != 0)
    {
      memset(&v30, 0, sizeof(v30));
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("RotationDirection"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "integerValue");

      if (v18 == 1)
      {
        v19 = 0;
        v21 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
        *(_OWORD *)&v30.a = *MEMORY[0x24BDBD8B8];
        *(_OWORD *)&v30.c = v21;
        *(_OWORD *)&v30.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
      }
      else if (v18)
      {
        v19 = 0;
      }
      else
      {
        CGAffineTransformMakeRotation(&v30, dbl_219BA4D50[v8 == 1]);
        v19 = 1;
      }
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v22, CFSTR("RotationDirection"));

      v23 = (void *)MEMORY[0x24BEBDB00];
      v28[0] = MEMORY[0x24BDAC760];
      v29 = v30;
      v28[1] = 3221225472;
      v28[2] = __41__STRotatingDisclosureCell__userPressed___block_invoke;
      v28[3] = &unk_24DB87BB0;
      v28[4] = self;
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __41__STRotatingDisclosureCell__userPressed___block_invoke_2;
      v24[3] = &unk_24DB87BD8;
      v26 = self;
      v27 = v19;
      v25 = v5;
      objc_msgSend(v23, "animateWithDuration:animations:completion:", v28, v24, 0.1);

    }
    else
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("SelectionHandler"));
      v20 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      if (v20)
        v20[2](v20, -[STRotatingDisclosureCell isSelected](self, "isSelected") ^ 1);

    }
  }

}

void __41__STRotatingDisclosureCell__userPressed___block_invoke(uint64_t a1)
{
  void *v1;
  __int128 v2;

  objc_msgSend(*(id *)(a1 + 32), "editingAccessoryView", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setTransform:", &v2);

}

void __41__STRotatingDisclosureCell__userPressed___block_invoke_2(uint64_t a1)
{
  void (**v2)(id, _QWORD, uint64_t);

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("RotationHandler"));
  v2 = (void (**)(id, _QWORD, uint64_t))objc_claimAutoreleasedReturnValue();
  if (v2)
    v2[2](v2, *(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 40), "isSelected"));

}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  return 1;
}

- (UILongPressGestureRecognizer)longPressGestureRecognizer
{
  return (UILongPressGestureRecognizer *)objc_getProperty(self, a2, 1200, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
}

@end
