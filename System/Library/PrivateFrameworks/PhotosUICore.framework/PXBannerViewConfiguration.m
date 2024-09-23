@implementation PXBannerViewConfiguration

- (PXBannerViewConfiguration)initWithTitle:(id)a3 subtitle:(id)a4 actionButtonTitle:(id)a5 cancelButtonTitle:(id)a6 actionButtonHandler:(id)a7 cancelButtonHandler:(id)a8 primaryActionIdentifier:(id)a9 cancelActionIdentifier:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  PXBannerViewConfiguration *v25;
  uint64_t v26;
  NSString *title;
  uint64_t v28;
  NSString *subtitle;
  uint64_t v30;
  NSString *actionButtonTitle;
  uint64_t v32;
  NSString *cancelButtonTitle;
  uint64_t v34;
  id actionButtonHandler;
  uint64_t v36;
  id cancelButtonHandler;
  uint64_t v38;
  NSString *primaryActionIdentifier;
  uint64_t v40;
  NSString *cancelActionIdentifier;
  void *v43;
  void *v44;
  void *v45;
  objc_super v46;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  v24 = a10;
  v46.receiver = self;
  v46.super_class = (Class)PXBannerViewConfiguration;
  v25 = -[PXBannerViewConfiguration init](&v46, sel_init);
  if (!v25)
    goto LABEL_7;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, v25, CFSTR("PXBannerView.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("title != nil"));

    if (v18)
      goto LABEL_4;
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, v25, CFSTR("PXBannerView.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("subtitle != nil"));

    goto LABEL_4;
  }
  if (!v18)
    goto LABEL_9;
LABEL_4:
  if ((v19 == 0) != (v21 == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, v25, CFSTR("PXBannerView.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(actionButtonTitle == nil) == (actionButtonHandler == nil)"));

  }
  v26 = objc_msgSend(v17, "copy");
  title = v25->_title;
  v25->_title = (NSString *)v26;

  v28 = objc_msgSend(v18, "copy");
  subtitle = v25->_subtitle;
  v25->_subtitle = (NSString *)v28;

  v30 = objc_msgSend(v19, "copy");
  actionButtonTitle = v25->_actionButtonTitle;
  v25->_actionButtonTitle = (NSString *)v30;

  v32 = objc_msgSend(v20, "copy");
  cancelButtonTitle = v25->_cancelButtonTitle;
  v25->_cancelButtonTitle = (NSString *)v32;

  v34 = objc_msgSend(v21, "copy");
  actionButtonHandler = v25->_actionButtonHandler;
  v25->_actionButtonHandler = (id)v34;

  v36 = objc_msgSend(v22, "copy");
  cancelButtonHandler = v25->_cancelButtonHandler;
  v25->_cancelButtonHandler = (id)v36;

  v38 = objc_msgSend(v23, "copy");
  primaryActionIdentifier = v25->_primaryActionIdentifier;
  v25->_primaryActionIdentifier = (NSString *)v38;

  v40 = objc_msgSend(v24, "copy");
  cancelActionIdentifier = v25->_cancelActionIdentifier;
  v25->_cancelActionIdentifier = (NSString *)v40;

LABEL_7:
  return v25;
}

- (PXBannerViewConfiguration)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXBannerView.m"), 58, CFSTR("%s is not available as initializer"), "-[PXBannerViewConfiguration init]");

  abort();
}

- (BOOL)wantsCancelButton
{
  void *v2;
  BOOL v3;

  -[PXBannerViewConfiguration cancelButtonHandler](self, "cancelButtonHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)wantsActionButton
{
  void *v3;
  void *v4;
  BOOL v5;

  -[PXBannerViewConfiguration actionButtonTitle](self, "actionButtonTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PXBannerViewConfiguration actionButtonHandler](self, "actionButtonHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)actionButtonTitle
{
  return self->_actionButtonTitle;
}

- (NSString)cancelButtonTitle
{
  return self->_cancelButtonTitle;
}

- (id)actionButtonHandler
{
  return self->_actionButtonHandler;
}

- (id)cancelButtonHandler
{
  return self->_cancelButtonHandler;
}

- (NSString)primaryActionIdentifier
{
  return self->_primaryActionIdentifier;
}

- (NSString)cancelActionIdentifier
{
  return self->_cancelActionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelActionIdentifier, 0);
  objc_storeStrong((id *)&self->_primaryActionIdentifier, 0);
  objc_storeStrong(&self->_cancelButtonHandler, 0);
  objc_storeStrong(&self->_actionButtonHandler, 0);
  objc_storeStrong((id *)&self->_cancelButtonTitle, 0);
  objc_storeStrong((id *)&self->_actionButtonTitle, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
