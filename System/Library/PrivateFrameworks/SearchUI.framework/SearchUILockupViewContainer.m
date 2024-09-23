@implementation SearchUILockupViewContainer

- (SearchUILockupViewContainer)initWithLockupView:(id)a3
{
  id v5;
  void *v6;
  SearchUILockupViewContainer *v7;
  objc_super v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)SearchUILockupViewContainer;
  v7 = -[NUIContainerBoxView initWithArrangedSubviews:](&v9, sel_initWithArrangedSubviews_, v6);

  if (v7)
    objc_storeStrong((id *)&v7->_lockupView, a3);

  return v7;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SearchUILockupViewContainer;
  -[SearchUILockupViewContainer traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  -[SearchUILockupViewContainer traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hasDifferentColorAppearanceComparedToTraitCollection:", v4))
  {

LABEL_4:
    -[SearchUILockupViewContainer tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
    goto LABEL_5;
  }
  -[SearchUILockupViewContainer traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_vibrancy");
  v8 = objc_msgSend(v4, "_vibrancy");

  if (v7 != v8)
    goto LABEL_4;
LABEL_5:

}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SearchUILockupViewContainer;
  -[SearchUILockupViewContainer didMoveToWindow](&v3, sel_didMoveToWindow);
  -[SearchUILockupViewContainer tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
}

- (void)tlk_updateForAppearance:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v9;
  int v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SearchUILockupViewContainer;
  -[SearchUILockupViewContainer tlk_updateForAppearance:](&v15, sel_tlk_updateForAppearance_, v9);
  v10 = objc_msgSend(v9, "isVibrant");
  if (v10)
  {
    v11 = objc_alloc(MEMORY[0x1E0CF9BE8]);
    objc_msgSend(v9, "quaternaryColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "secondaryButtonColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "secondaryColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "secondaryButtonColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "tertiaryColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "initWithTitleBackgroundColor:titleTextColor:subtitleTextColor:iconTintColor:progressColor:", v3, v4, v5, v6, v7);
  }
  else
  {
    v12 = 0;
  }
  -[SearchUILockupViewContainer lockupView](self, "lockupView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setOfferTheme:", v12);

  if (v10)
  {

  }
  -[SearchUILockupViewContainer lockupView](self, "lockupView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "enableAppearanceForView:", v14);

}

- (ASCLockupView)lockupView
{
  return self->_lockupView;
}

- (void)setLockupView:(id)a3
{
  objc_storeStrong((id *)&self->_lockupView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockupView, 0);
}

@end
