@implementation NCNotificationRichShortLookView

- (BOOL)isAttachmentImageFeatured
{
  void *v2;
  char v3;

  -[NCNotificationRichShortLookView _richContentView](self, "_richContentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAttachmentImageFeatured");

  return v3;
}

- (void)setAttachmentImageFeatured:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[NCNotificationRichShortLookView _richContentView](self, "_richContentView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAttachmentImageFeatured:", v3);

}

- (id)_newNotificationContentView
{
  return objc_alloc_init(NCNotificationRichContentView);
}

- (void)_layoutNotificationContentView
{
  void *v3;
  void *v4;
  id v5;

  -[NCNotificationRichShortLookView _richContentView](self, "_richContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NCNotificationShortLookView customContentView](self, "customContentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");

    -[NCNotificationRichShortLookView _richContentView](self, "_richContentView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    _NCMainScreenScale();
    UIRectIntegralWithScale();
    objc_msgSend(v5, "setFrame:");

  }
}

- (id)_richContentView
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  -[NCNotificationShortLookView notificationContentView](self, "notificationContentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  v4 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  return v6;
}

@end
