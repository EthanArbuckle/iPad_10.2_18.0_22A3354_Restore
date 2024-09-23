@implementation NCDigestFeaturedNotificationContentProvider

- (NCDigestFeaturedNotificationContentProvider)initWithNotificationRequest:(id)a3
{
  return -[NCDigestFeaturedNotificationContentProvider initWithNotificationRequest:groupCount:](self, "initWithNotificationRequest:groupCount:", a3, 1);
}

- (NCDigestFeaturedNotificationContentProvider)initWithNotificationRequest:(id)a3 groupCount:(unint64_t)a4
{
  NCDigestFeaturedNotificationContentProvider *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NCDigestFeaturedNotificationContentProvider;
  result = -[NCNotificationRequestCoalescingContentProvider initWithNotificationRequest:](&v6, sel_initWithNotificationRequest_, a3);
  if (result)
    result->_groupCount = a4;
  return result;
}

+ (id)featuredImageFetchQueue
{
  if (featuredImageFetchQueue_onceToken_0 != -1)
    dispatch_once(&featuredImageFetchQueue_onceToken_0, &__block_literal_global_7);
  return (id)featuredImageFetchQueue___queue_0;
}

void __70__NCDigestFeaturedNotificationContentProvider_featuredImageFetchQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.UserNotificationsUI.NCDigestFeaturedNotificationContentProvider", v2);
  v1 = (void *)featuredImageFetchQueue___queue_0;
  featuredImageFetchQueue___queue_0 = (uint64_t)v0;

}

- (id)primaryText
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NCDigestFeaturedNotificationContentProvider;
  -[NCNotificationRequestCoalescingContentProvider primaryText](&v9, sel_primaryText);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[NCNotificationRequestCoalescingContentProvider notificationRequest](self, "notificationRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "content");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "defaultHeader");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)thumbnail
{
  UIImage *cachedFeaturedAttachmentImage;
  objc_super v4;

  cachedFeaturedAttachmentImage = self->_cachedFeaturedAttachmentImage;
  if (cachedFeaturedAttachmentImage)
    return cachedFeaturedAttachmentImage;
  v4.receiver = self;
  v4.super_class = (Class)NCDigestFeaturedNotificationContentProvider;
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

- (void)fetchFeaturedAttachmentImageWithSizeRatio:(double)a3 completion:(id)a4
{
  void (**v6)(id, UIImage *);
  double v7;
  NSObject *v8;
  _QWORD block[5];
  void (**v10)(id, UIImage *);
  id v11[2];
  id location;

  v6 = (void (**)(id, UIImage *))a4;
  if (-[NCDigestFeaturedNotificationContentProvider _shouldShowContent](self, "_shouldShowContent"))
  {
    if (self->_cachedFeaturedAttachmentImage
      && (-[NCDigestFeaturedNotificationContentProvider cachedImageSizeRatio](self, "cachedImageSizeRatio"), v7 == a3))
    {
      v6[2](v6, self->_cachedFeaturedAttachmentImage);
    }
    else
    {
      objc_initWeak(&location, self);
      objc_msgSend((id)objc_opt_class(), "featuredImageFetchQueue");
      v8 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __100__NCDigestFeaturedNotificationContentProvider_fetchFeaturedAttachmentImageWithSizeRatio_completion___block_invoke;
      block[3] = &unk_1E8D1CE30;
      v11[1] = *(id *)&a3;
      block[4] = self;
      objc_copyWeak(v11, &location);
      v10 = v6;
      dispatch_async(v8, block);

      objc_destroyWeak(v11);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    v6[2](v6, 0);
  }

}

void __100__NCDigestFeaturedNotificationContentProvider_fetchFeaturedAttachmentImageWithSizeRatio_completion___block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  void *v4;
  id v5;
  id *WeakRetained;
  id *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v2 = *(double *)(a1 + 56) * 300.0;
  objc_msgSend(*(id *)(a1 + 32), "notificationRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bulletin");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _NCQuickLooksAttachmentImageForNotificationRequest(v4, 300.0, v2, 5.0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v7 = WeakRetained;
  if (v5)
  {
    objc_msgSend(WeakRetained, "setCachedImageSizeRatio:", *(double *)(a1 + 56));
    objc_storeStrong(v7 + 17, v5);
  }
  else
  {
    v8 = WeakRetained[17];
    if (v8)
    {
      v5 = v8;
    }
    else
    {
      objc_msgSend(WeakRetained, "notificationRequest");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "content");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "attachmentImage");
      v5 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __100__NCDigestFeaturedNotificationContentProvider_fetchFeaturedAttachmentImageWithSizeRatio_completion___block_invoke_2;
  v13[3] = &unk_1E8D1CE08;
  v11 = *(id *)(a1 + 40);
  v14 = v5;
  v15 = v11;
  v12 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v13);

}

uint64_t __100__NCDigestFeaturedNotificationContentProvider_fetchFeaturedAttachmentImageWithSizeRatio_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
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

- (id)defaultActionBlock
{
  return self->_defaultActionBlock;
}

- (void)setDefaultActionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NCNotificationListComponentDelegate)listComponentDelegate
{
  return (NCNotificationListComponentDelegate *)objc_loadWeakRetained((id *)&self->_listComponentDelegate);
}

- (void)setListComponentDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_listComponentDelegate, a3);
}

- (unint64_t)appNotificationCount
{
  return self->_appNotificationCount;
}

- (void)setAppNotificationCount:(unint64_t)a3
{
  self->_appNotificationCount = a3;
}

- (double)cachedImageSizeRatio
{
  return self->_cachedImageSizeRatio;
}

- (void)setCachedImageSizeRatio:(double)a3
{
  self->_cachedImageSizeRatio = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_listComponentDelegate);
  objc_storeStrong(&self->_defaultActionBlock, 0);
  objc_storeStrong((id *)&self->_cachedFeaturedAttachmentImage, 0);
}

@end
