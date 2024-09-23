@implementation PXUIOverlayBadgesView

- (PXUIOverlayBadgesView)initWithBadges:(id)a3 order:(id)a4
{
  id v7;
  id v8;
  PXUIOverlayBadgesView *v9;
  void *v10;
  UIStackView *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  UIStackView *stackView;
  UIStackView *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id obj;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void *v44;
  id v45;
  objc_super v46;
  _QWORD v47[4];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v46.receiver = self;
  v46.super_class = (Class)PXUIOverlayBadgesView;
  v9 = -[PXUIOverlayBadgesView initWithFrame:](&v46, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v9)
  {
    obj = a3;
    v41 = MEMORY[0x1E0C809B0];
    v42 = 3221225472;
    v43 = __46__PXUIOverlayBadgesView_initWithBadges_order___block_invoke;
    v44 = &unk_1E5118390;
    v36 = v7;
    v45 = v7;
    v35 = v8;
    PXMap();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (UIStackView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3CA8]), "initWithArrangedSubviews:", v10);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](v11, "setAxis:", 0);
    -[UIStackView setAlignment:](v11, "setAlignment:", 2);
    -[UIStackView setDistribution:](v11, "setDistribution:", 3);
    -[UIStackView setSpacing:](v11, "setSpacing:", 2.0);
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v12 = v10;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v38;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v38 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v16++), "setHidden:", 1);
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
      }
      while (v14);
    }

    -[PXUIOverlayBadgesView addSubview:](v9, "addSubview:", v11);
    v28 = (void *)MEMORY[0x1E0CB3718];
    -[UIStackView topAnchor](v11, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXUIOverlayBadgesView topAnchor](v9, "topAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v32);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v31;
    -[UIStackView bottomAnchor](v11, "bottomAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXUIOverlayBadgesView bottomAnchor](v9, "bottomAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v29);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v47[1] = v27;
    -[UIStackView leadingAnchor](v11, "leadingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXUIOverlayBadgesView leadingAnchor](v9, "leadingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v47[2] = v19;
    -[UIStackView trailingAnchor](v11, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXUIOverlayBadgesView trailingAnchor](v9, "trailingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v47[3] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "activateConstraints:", v23);

    stackView = v9->_stackView;
    v9->_stackView = v11;
    v25 = v11;

    objc_storeStrong((id *)&v9->_badges, obj);
    v8 = v35;
    v7 = v36;
  }

  return v9;
}

- (id)createWeaklyReferencedBackgroundView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0DC3890]);
  -[PXUIOverlayBadgesView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXBadgeHelper leadingCornerGradientBackgroundImageForLayoutDirection:](PXBadgeHelper, "leadingCornerGradientBackgroundImageForLayoutDirection:", objc_msgSend(v4, "layoutDirection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithImage:", v5);

  objc_msgSend(v6, "setHidden:", -[PXUIOverlayBadgesView isShowingAnyBadge](self, "isShowingAnyBadge") ^ 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTintColor:", v7);

  -[PXUIOverlayBadgesView setBackgroundView:](self, "setBackgroundView:", v6);
  return v6;
}

- (void)showBadges:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  objc_class *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  objc_class *v24;
  objc_class *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  -[PXUIOverlayBadgesView badges](self, "badges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v39 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "setHidden:", 1);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v8);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v11 = v4;
  v33 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v33)
  {
    v12 = *(_QWORD *)v35;
    v13 = v33;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v35 != v12)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v14);
        -[PXUIOverlayBadgesView badges](self, "badges");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "setHidden:", 0);
        if (objc_msgSend(v15, "integerValue") == 4)
        {
          v18 = v17;
          if (v18)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              goto LABEL_16;
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = (objc_class *)objc_opt_class();
            NSStringFromClass(v24);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "px_descriptionForAssertionMessage");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUIOverlayBadgesView.m"), 90, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("badge"), v21, v28);

          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = (objc_class *)objc_opt_class();
            NSStringFromClass(v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUIOverlayBadgesView.m"), 90, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("badge"), v21);
          }

LABEL_16:
          objc_msgSend(v11, "objectForKeyedSubscript:", v15);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
LABEL_18:
              objc_msgSend(v18, "setText:", v19);

              goto LABEL_19;
            }
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = (objc_class *)objc_opt_class();
            NSStringFromClass(v25);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "px_descriptionForAssertionMessage");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUIOverlayBadgesView.m"), 91, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("badgesToShow[badgeNumber]"), v23, v29);

          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = (objc_class *)objc_opt_class();
            NSStringFromClass(v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUIOverlayBadgesView.m"), 91, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("badgesToShow[badgeNumber]"), v23);
          }

          goto LABEL_18;
        }
LABEL_19:

        ++v14;
      }
      while (v13 != v14);
      v26 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      v13 = v26;
    }
    while (v26);
  }

  -[PXUIOverlayBadgesView setIsShowingAnyBadge:](self, "setIsShowingAnyBadge:", v33 != 0);
  -[PXUIOverlayBadgesView backgroundView](self, "backgroundView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setHidden:", v33 == 0);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PXUIOverlayBadgesView;
  v4 = a3;
  -[PXUIOverlayBadgesView traitCollectionDidChange:](&v11, sel_traitCollectionDidChange_, v4);
  -[PXUIOverlayBadgesView traitCollection](self, "traitCollection", v11.receiver, v11.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "layoutDirection");
  v7 = objc_msgSend(v4, "layoutDirection");

  if (v6 != v7)
  {
    -[PXUIOverlayBadgesView traitCollection](self, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXBadgeHelper leadingCornerGradientBackgroundImageForLayoutDirection:](PXBadgeHelper, "leadingCornerGradientBackgroundImageForLayoutDirection:", objc_msgSend(v8, "layoutDirection"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXUIOverlayBadgesView backgroundView](self, "backgroundView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setImage:", v9);

  }
}

- (PXUIOverlayBadgesView)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUIOverlayBadgesView.m"), 150, CFSTR("%s is not available as initializer"), "-[PXUIOverlayBadgesView init]");

  abort();
}

- (PXUIOverlayBadgesView)initWithFrame:(CGRect)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUIOverlayBadgesView.m"), 154, CFSTR("%s is not available as initializer"), "-[PXUIOverlayBadgesView initWithFrame:]");

  abort();
}

- (PXUIOverlayBadgesView)initWithCoder:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUIOverlayBadgesView.m"), 158, CFSTR("%s is not available as initializer"), "-[PXUIOverlayBadgesView initWithCoder:]");

  abort();
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (NSDictionary)badges
{
  return self->_badges;
}

- (UIImageView)backgroundView
{
  return (UIImageView *)objc_loadWeakRetained((id *)&self->_backgroundView);
}

- (void)setBackgroundView:(id)a3
{
  objc_storeWeak((id *)&self->_backgroundView, a3);
}

- (BOOL)isShowingAnyBadge
{
  return self->_isShowingAnyBadge;
}

- (void)setIsShowingAnyBadge:(BOOL)a3
{
  self->_isShowingAnyBadge = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_backgroundView);
  objc_storeStrong((id *)&self->_badges, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

uint64_t __46__PXUIOverlayBadgesView_initWithBadges_order___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
}

+ (id)badgesViewWithDefaultBadgesAndOrder
{
  PXUIOverlayBadgesView *v3;
  void *v4;
  void *v5;
  PXUIOverlayBadgesView *v6;

  v3 = [PXUIOverlayBadgesView alloc];
  objc_msgSend(a1, "defaultBadges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "defaultOrder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXUIOverlayBadgesView initWithBadges:order:](v3, "initWithBadges:order:", v4, v5);

  return v6;
}

+ (id)defaultBadges
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v8[0] = &unk_1E53EAF38;
  objc_msgSend(a1, "defaultViewForBadge:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = &unk_1E53EAF50;
  objc_msgSend(a1, "defaultViewForBadge:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v8[2] = &unk_1E53EAF68;
  objc_msgSend(a1, "defaultViewForBadge:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)defaultOrder
{
  return &unk_1E53E8628;
}

+ (id)defaultViewForBadge:(int64_t)a3
{
  id v3;
  __CFString *v4;
  void *v5;
  void *v6;

  switch(a3)
  {
    case 1:
      v4 = CFSTR("heart.fill");
      goto LABEL_5;
    case 2:
      v4 = CFSTR("pano.fill");
      goto LABEL_5;
    case 3:
      v4 = CFSTR("icloud.fill");
LABEL_5:
      PXUIOverlayBadgesViewCreateDefaultSystemImageBadgeView(v4);
      v3 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      v3 = objc_alloc_init(MEMORY[0x1E0DC3990]);
      objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 12.0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setFont:", v5);

      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setTextColor:", v6);

      break;
    default:
      return v3;
  }
  return v3;
}

- (void)showBadgesForPHAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (objc_msgSend(v7, "isFavorite"))
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], &unk_1E53EF708);
  if (objc_msgSend(v7, "isMediaSubtype:", 1))
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], &unk_1E53EF720);
  if (objc_msgSend(v7, "isVideo"))
  {
    objc_msgSend(v7, "duration");
    PXLocalizedVideoDuration();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, &unk_1E53EF738);

  }
  v6 = (void *)objc_msgSend(v4, "copy");
  -[PXUIOverlayBadgesView showBadges:](self, "showBadges:", v6);

}

@end
