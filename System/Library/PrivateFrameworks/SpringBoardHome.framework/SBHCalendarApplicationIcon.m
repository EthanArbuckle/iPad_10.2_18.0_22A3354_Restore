@implementation SBHCalendarApplicationIcon

- (SBHCalendarApplicationIcon)initWithLeafIdentifier:(id)a3 applicationBundleID:(id)a4
{
  SBHCalendarApplicationIcon *v4;
  SBCalendarIconImageProvider *v5;
  SBCalendarIconImageProvider *imageProvider;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBHCalendarApplicationIcon;
  v4 = -[SBLeafIcon initWithLeafIdentifier:applicationBundleID:](&v9, sel_initWithLeafIdentifier_applicationBundleID_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(SBCalendarIconImageProvider);
    imageProvider = v4->_imageProvider;
    v4->_imageProvider = v5;

    -[SBCalendarIconImageProvider setDelegate:](v4->_imageProvider, "setDelegate:", v4);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v4, sel__boldTextStatusDidChange_, *MEMORY[0x1E0DC44D0], 0);

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SBHCalendarApplicationIcon;
  -[SBLeafIcon dealloc](&v4, sel_dealloc);
}

- (void)localeChanged
{
  objc_super v3;

  -[SBIcon reloadIconImage](self, "reloadIconImage");
  v3.receiver = self;
  v3.super_class = (Class)SBHCalendarApplicationIcon;
  -[SBIcon localeChanged](&v3, sel_localeChanged);
}

+ (BOOL)canGenerateIconsInBackground
{
  return 0;
}

- (id)generateIconImageWithInfo:(SBIconImageInfo *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;

  v7 = v6;
  v8 = v5;
  v9 = v4;
  v10 = v3;
  -[SBHCalendarApplicationIcon imageProvider](self, "imageProvider", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "iconImageWithInfo:", v10, v9, v8, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)unmaskedIconImageWithInfo:(SBIconImageInfo *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;

  v7 = v6;
  v8 = v5;
  v9 = v4;
  v10 = v3;
  -[SBHCalendarApplicationIcon imageProvider](self, "imageProvider", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unmaskedIconImageWithInfo:", v10, v9, v8, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)makeIconImageWithInfo:(SBIconImageInfo *)a3 traitCollection:(id)a4 options:(unint64_t)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v10;
  double v11;
  double v12;
  double v13;
  SBIconImageInfo *v15;
  void *v16;
  void *v17;

  v10 = v8;
  v11 = v7;
  v12 = v6;
  v13 = v5;
  v15 = a3;
  -[SBHCalendarApplicationIcon imageProvider](self, "imageProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "iconImageWithInfo:traitCollection:options:", v15, a4, v13, v12, v11, v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)makeIconLayerWithInfo:(SBIconImageInfo *)a3 traitCollection:(id)a4 options:(unint64_t)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v10;
  double v11;
  double v12;
  double v13;
  SBIconImageInfo *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  id v23;

  v10 = v8;
  v11 = v7;
  v12 = v6;
  v13 = v5;
  v15 = a3;
  -[SBHCalendarApplicationIcon imageProvider](self, "imageProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "iconImageWithInfo:traitCollection:options:", v15, a4, v13, v12, v11, v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "size");
  v19 = v18;
  v21 = v20;
  v22 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
  objc_msgSend(v22, "setBounds:", 0.0, 0.0, v19, v21);
  v23 = objc_retainAutorelease(v17);
  objc_msgSend(v22, "setContents:", objc_msgSend(v23, "CGImage"));

  return v22;
}

- (BOOL)canMakeIconLayerQuicklyWithInfo:(SBIconImageInfo *)a3 traitCollection:(id)a4 options:(unint64_t)a5
{
  return 1;
}

- (SBCalendarIconImageProvider)imageProvider
{
  return self->_imageProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageProvider, 0);
}

@end
