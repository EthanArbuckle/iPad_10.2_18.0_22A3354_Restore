@implementation NCNotificationRequestRichContentProvider

+ (id)featuredImageFetchQueue
{
  if (featuredImageFetchQueue_onceToken != -1)
    dispatch_once(&featuredImageFetchQueue_onceToken, &__block_literal_global_1);
  return (id)featuredImageFetchQueue___queue;
}

void __67__NCNotificationRequestRichContentProvider_featuredImageFetchQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.UserNotificationsUI.NCNotificationRequestRichContentProvider", v2);
  v1 = (void *)featuredImageFetchQueue___queue;
  featuredImageFetchQueue___queue = (uint64_t)v0;

}

- (id)thumbnail
{
  UIImage *cachedAttachmentImage;
  objc_super v4;

  cachedAttachmentImage = self->_cachedAttachmentImage;
  if (cachedAttachmentImage)
    return cachedAttachmentImage;
  v4.receiver = self;
  v4.super_class = (Class)NCNotificationRequestRichContentProvider;
  -[NCNotificationRequestCoalescingContentProvider thumbnail](&v4, sel_thumbnail);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)hasAttachmentImage
{
  void *v2;
  void *v3;
  void *v4;
  int v5;

  -[NCNotificationRequestCoalescingContentProvider notificationRequest](self, "notificationRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attachmentImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(v4, "isSymbolImage") ^ 1;
  else
    LOBYTE(v5) = 0;

  return v5;
}

- (BOOL)hasLoadedRichAttachmentImage
{
  return self->_cachedAttachmentImage != 0;
}

- (void)fetchRichAttachmentImageIsFeatured:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL4 v4;
  void (**v6)(id, UIImage *, uint64_t);
  double v7;
  NSObject *v8;
  _QWORD block[5];
  void (**v10)(id, UIImage *, uint64_t);
  id v11[3];
  BOOL v12;
  id location;

  v4 = a3;
  v6 = (void (**)(id, UIImage *, uint64_t))a4;
  if (-[NCNotificationRequestRichContentProvider _shouldShowContent](self, "_shouldShowContent"))
  {
    if (self->_cachedAttachmentImage
      && -[NCNotificationRequestRichContentProvider isCachedAttachmentedImageFeatured](self, "isCachedAttachmentedImageFeatured") == v4)
    {
      v6[2](v6, self->_cachedAttachmentImage, 1);
    }
    else
    {
      objc_initWeak(&location, self);
      if (v4)
        v7 = 300.0;
      else
        v7 = 200.0;
      objc_msgSend((id)objc_opt_class(), "featuredImageFetchQueue");
      v8 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __94__NCNotificationRequestRichContentProvider_fetchRichAttachmentImageIsFeatured_withCompletion___block_invoke;
      block[3] = &unk_1E8D1B488;
      block[4] = self;
      v11[1] = *(id *)&v7;
      v11[2] = (id)0x4069000000000000;
      objc_copyWeak(v11, &location);
      v12 = v4;
      v10 = v6;
      dispatch_async(v8, block);

      objc_destroyWeak(v11);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    v6[2](v6, 0, 0);
  }

}

void __94__NCNotificationRequestRichContentProvider_fetchRichAttachmentImageIsFeatured_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id *WeakRetained;
  id *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  BOOL v15;

  objc_msgSend(*(id *)(a1 + 32), "notificationRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bulletin");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _NCQuickLooksAttachmentImageForNotificationRequest(v3, *(double *)(a1 + 56), *(double *)(a1 + 64), 5.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v6 = WeakRetained + 16;
  if (v4)
  {
    objc_storeStrong(v6, v4);
    objc_msgSend(WeakRetained, "setCachedAttachmentImageFeatured:", *(unsigned __int8 *)(a1 + 72));
    v7 = v4;
  }
  else if (*v6)
  {
    v7 = *v6;
  }
  else
  {
    objc_msgSend(WeakRetained, "notificationRequest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "content");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "attachmentImage");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __94__NCNotificationRequestRichContentProvider_fetchRichAttachmentImageIsFeatured_withCompletion___block_invoke_2;
  block[3] = &unk_1E8D1B460;
  v10 = *(id *)(a1 + 40);
  v13 = v7;
  v14 = v10;
  v15 = v4 != 0;
  v11 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __94__NCNotificationRequestRichContentProvider_fetchRichAttachmentImageIsFeatured_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
}

- (BOOL)_shouldShowContent
{
  void *v3;
  void *v4;
  uint64_t v5;

  -[NCNotificationRequestCoalescingContentProvider notificationRequest](self, "notificationRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "contentPreviewSetting");

  if (!v5)
    return 1;
  if (v5 == 1)
    return -[NCNotificationRequestCoalescingContentProvider isDeviceAuthenticated](self, "isDeviceAuthenticated");
  return 0;
}

- (BOOL)isIconVisible
{
  return self->_iconVisible;
}

- (void)setIconVisible:(BOOL)a3
{
  self->_iconVisible = a3;
}

- (BOOL)isCachedAttachmentedImageFeatured
{
  return self->_cachedAttachmentImageFeatured;
}

- (void)setCachedAttachmentImageFeatured:(BOOL)a3
{
  self->_cachedAttachmentImageFeatured = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedAttachmentImage, 0);
}

@end
