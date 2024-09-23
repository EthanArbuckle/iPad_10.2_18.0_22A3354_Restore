@implementation PXCMMPosterHeaderViewModel

- (PXCMMPosterHeaderViewModel)init
{
  PXCMMPosterHeaderViewModel *v2;
  PXCMMPosterHeaderViewModel *v3;
  NSString *title;
  NSString *subtitle;
  NSString *statusString;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXCMMPosterHeaderViewModel;
  v2 = -[PXCMMPosterHeaderViewModel init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    title = v2->_title;
    v2->_title = (NSString *)&stru_1E5149688;

    subtitle = v3->_subtitle;
    v3->_subtitle = (NSString *)&stru_1E5149688;

    statusString = v3->_statusString;
    v3->_statusString = (NSString *)&stru_1E5149688;

  }
  return v3;
}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXCMMPosterHeaderViewModel;
  -[PXCMMPosterHeaderViewModel performChanges:](&v3, sel_performChanges_, a3);
}

- (void)setTitle:(id)a3
{
  NSString *v5;
  BOOL v6;
  NSString *v7;
  NSString *title;
  void *v9;
  NSString *v10;

  v10 = (NSString *)a3;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMPosterHeaderViewModel.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("title"));

  }
  v5 = self->_title;
  if (v5 == v10)
  {

  }
  else
  {
    v6 = -[NSString isEqualToString:](v10, "isEqualToString:", v5);

    if (!v6)
    {
      v7 = (NSString *)-[NSString copy](v10, "copy");
      title = self->_title;
      self->_title = v7;

      -[PXCMMPosterHeaderViewModel signalChange:](self, "signalChange:", 1);
    }
  }

}

- (void)setSubtitle:(id)a3
{
  NSString *v5;
  BOOL v6;
  NSString *v7;
  NSString *subtitle;
  void *v9;
  NSString *v10;

  v10 = (NSString *)a3;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMPosterHeaderViewModel.m"), 52, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("subtitle"));

  }
  v5 = self->_subtitle;
  if (v5 == v10)
  {

  }
  else
  {
    v6 = -[NSString isEqualToString:](v10, "isEqualToString:", v5);

    if (!v6)
    {
      v7 = (NSString *)-[NSString copy](v10, "copy");
      subtitle = self->_subtitle;
      self->_subtitle = v7;

      -[PXCMMPosterHeaderViewModel signalChange:](self, "signalChange:", 2);
    }
  }

}

- (void)setStatusString:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *statusString;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_statusString;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v8, "isEqualToString:", v4);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      statusString = self->_statusString;
      self->_statusString = v6;

      -[PXCMMPosterHeaderViewModel signalChange:](self, "signalChange:", 4);
    }
  }

}

- (void)setShowStatusCheckmark:(BOOL)a3
{
  if (self->_showStatusCheckmark != a3)
  {
    self->_showStatusCheckmark = a3;
    -[PXCMMPosterHeaderViewModel signalChange:](self, "signalChange:", 8);
  }
}

- (void)setAsset:(id)a3
{
  PXDisplayAsset *v5;
  PXDisplayAsset *v6;

  v5 = (PXDisplayAsset *)a3;
  if (self->_asset != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_asset, a3);
    -[PXCMMPosterHeaderViewModel signalChange:](self, "signalChange:", 16);
    v5 = v6;
  }

}

- (void)setMediaProvider:(id)a3
{
  PXUIImageProvider *v5;
  PXUIImageProvider *v6;

  v5 = (PXUIImageProvider *)a3;
  if (self->_mediaProvider != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_mediaProvider, a3);
    -[PXCMMPosterHeaderViewModel signalChange:](self, "signalChange:", 32);
    v5 = v6;
  }

}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    -[PXCMMPosterHeaderViewModel signalChange:](self, "signalChange:", 64);
  }
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)statusString
{
  return self->_statusString;
}

- (BOOL)showStatusCheckmark
{
  return self->_showStatusCheckmark;
}

- (PXDisplayAsset)asset
{
  return self->_asset;
}

- (PXUIImageProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_statusString, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
