@implementation IMPopoverPresentationAction

- (void)prepareForPopoverPresentation:(id)a3
{
  void *v4;
  Class v5;
  uint64_t v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  char v12;
  void *v13;
  uint64_t v14;
  char v15;
  id v16;

  v16 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMPopoverPresentationAction presentingButton](self, "presentingButton"));
  v5 = NSClassFromString(CFSTR("MPUTransportButton"));
  v6 = objc_opt_class(v5);
  isKindOfClass = objc_opt_isKindOfClass(v4, v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMPopoverPresentationAction presentingButton](self, "presentingButton"));
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v16, "setSourceView:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[IMPopoverPresentationAction presentingButton](self, "presentingButton"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[IMPopoverPresentationAction presentingButton](self, "presentingButton"));
    objc_msgSend(v10, "bounds");
    objc_msgSend(v9, "imageRectForContentRect:");
    objc_msgSend(v16, "setSourceRect:");

LABEL_7:
    goto LABEL_8;
  }
  v11 = objc_opt_class(UIView);
  v12 = objc_opt_isKindOfClass(v8, v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[IMPopoverPresentationAction presentingButton](self, "presentingButton"));
  if ((v12 & 1) != 0)
  {
    objc_msgSend(v16, "setSourceView:", v13);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[IMPopoverPresentationAction presentingButton](self, "presentingButton"));
    objc_msgSend(v9, "bounds");
    objc_msgSend(v16, "setSourceRect:");
    goto LABEL_7;
  }
  v14 = objc_opt_class(UIBarButtonItem);
  v15 = objc_opt_isKindOfClass(v13, v14);

  if ((v15 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[IMPopoverPresentationAction presentingButton](self, "presentingButton"));
    objc_msgSend(v16, "setBarButtonItem:", v9);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5
{
  void *v8;
  Class v9;
  uint64_t v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  uint64_t v18;
  char v19;
  void *v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  uint64_t v25;
  char v26;
  void *v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  id v32;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMPopoverPresentationAction presentingButton](self, "presentingButton", a3));
  v9 = NSClassFromString(CFSTR("MPUTransportButton"));
  v10 = objc_opt_class(v9);
  isKindOfClass = objc_opt_isKindOfClass(v8, v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[IMPopoverPresentationAction presentingButton](self, "presentingButton"));
  if ((isKindOfClass & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[IMPopoverPresentationAction presentingButton](self, "presentingButton"));
    objc_msgSend(v13, "bounds");
    objc_msgSend(v12, "imageRectForContentRect:");
    a4->origin.x = v14;
    a4->origin.y = v15;
    a4->size.width = v16;
    a4->size.height = v17;

LABEL_5:
    *a5 = (id)objc_claimAutoreleasedReturnValue(-[IMPopoverPresentationAction presentingButton](self, "presentingButton"));
    return;
  }
  v18 = objc_opt_class(UIView);
  v19 = objc_opt_isKindOfClass(v12, v18);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[IMPopoverPresentationAction presentingButton](self, "presentingButton"));
  v12 = v20;
  if ((v19 & 1) != 0)
  {
    objc_msgSend(v20, "bounds");
    a4->origin.x = v21;
    a4->origin.y = v22;
    a4->size.width = v23;
    a4->size.height = v24;
    goto LABEL_5;
  }
  v25 = objc_opt_class(UIBarButtonItem);
  v26 = objc_opt_isKindOfClass(v12, v25);

  if ((v26 & 1) != 0)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[IMPopoverPresentationAction presentingButton](self, "presentingButton"));
    v32 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "_toolbarButton"));

    if (v32)
    {
      objc_msgSend(v32, "bounds");
      a4->origin.x = v28;
      a4->origin.y = v29;
      a4->size.width = v30;
      a4->size.height = v31;
      *a5 = objc_retainAutorelease(v32);
    }

  }
}

- (id)presentingButton
{
  return self->_presentingButton;
}

- (void)setPresentingButton:(id)a3
{
  objc_storeStrong(&self->_presentingButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_presentingButton, 0);
}

@end
