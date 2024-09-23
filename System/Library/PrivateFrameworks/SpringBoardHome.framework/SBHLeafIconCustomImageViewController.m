@implementation SBHLeafIconCustomImageViewController

- (SBHLeafIconCustomImageViewController)initWithIcon:(id)a3 iconImageCache:(id)a4
{
  id v7;
  id v8;
  SBHLeafIconCustomImageViewController *v9;
  SBHLeafIconCustomImageViewController *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  objc_super v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SBHLeafIconCustomImageViewController;
  v9 = -[SBHLeafIconCustomImageViewController initWithNibName:bundle:](&v16, sel_initWithNibName_bundle_, 0, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_icon, a3);
    objc_storeStrong((id *)&v10->_iconImageCache, a4);
    objc_opt_self();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v11;
    objc_opt_self();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)-[SBHLeafIconCustomImageViewController registerForTraitChanges:withAction:](v10, "registerForTraitChanges:withAction:", v13, sel_updateImage);

  }
  return v10;
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[SBHLeafIconCustomImageViewController icon](self, "icon");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SBHLeafIconCustomImageViewController iconImageCache](self, "iconImageCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHLeafIconCustomImageViewController traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageForIcon:compatibleWithTraitCollection:options:", v7, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v5);
  -[SBHLeafIconCustomImageViewController setView:](self, "setView:", v6);

}

- (void)updateImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[SBHLeafIconCustomImageViewController icon](self, "icon");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SBHLeafIconCustomImageViewController iconImageCache](self, "iconImageCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHLeafIconCustomImageViewController traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageForIcon:compatibleWithTraitCollection:options:", v7, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHLeafIconCustomImageViewController imageView](self, "imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v5);

}

- (SBIcon)icon
{
  return self->_icon;
}

- (SBHIconImageCache)iconImageCache
{
  return self->_iconImageCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconImageCache, 0);
  objc_storeStrong((id *)&self->_icon, 0);
}

@end
