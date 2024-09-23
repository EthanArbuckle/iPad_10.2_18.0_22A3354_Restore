@implementation NCNotificationRequestFullScreenContentProvider

- (void)loadImageAssetsWithCompletion:(id)a3
{
  id v4;
  NCNotificationRequestFullScreenContentProvider *v5;
  NSObject *Serial;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!v5->_imageAssetLoadingComplete)
  {
    v5->_imageAssetLoadingComplete = 1;
    Serial = BSDispatchQueueCreateSerial();
    objc_initWeak(&location, v5);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__NCNotificationRequestFullScreenContentProvider_loadImageAssetsWithCompletion___block_invoke;
    block[3] = &unk_1E8D1B300;
    objc_copyWeak(&v9, &location);
    v8 = v4;
    dispatch_async(Serial, block);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);

  }
  objc_sync_exit(v5);

}

void __80__NCNotificationRequestFullScreenContentProvider_loadImageAssetsWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "notificationRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attachmentImageWithDimension:", 84.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_setFullScreenThumbnail:", v4);

  if (*(_QWORD *)(a1 + 32))
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __80__NCNotificationRequestFullScreenContentProvider_loadImageAssetsWithCompletion___block_invoke_2;
    v6[3] = &unk_1E8D1CE08;
    v5 = *(id *)(a1 + 32);
    v6[4] = WeakRetained;
    v7 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], v6);

  }
}

void __80__NCNotificationRequestFullScreenContentProvider_loadImageAssetsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_fullScreenThumbnail");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, BOOL))(v1 + 16))(v1, v2 != 0);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NCNotificationRequestFullScreenContentProvider;
  v4 = -[NCNotificationRequestCoalescingContentProvider copyWithZone:](&v8, sel_copyWithZone_, a3);
  v4[128] = self->_imageAssetLoadingComplete;
  v5 = -[UIImage copy](self->_fullScreenThumbnail, "copy");
  v6 = (void *)*((_QWORD *)v4 + 17);
  *((_QWORD *)v4 + 17) = v5;

  return v4;
}

- (id)icons
{
  void *v2;
  void *v3;
  void *v4;

  -[NCNotificationRequestCoalescingContentProvider notificationRequest](self, "notificationRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fullScreenIcons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)importantText
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  -[NCNotificationRequestCoalescingContentProvider notificationRequest](self, "notificationRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "interruptionLevel");

  if (v4 == 2)
  {
    NCUserNotificationsUIKitFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("TIME_SENSITIVE_TEXT");
  }
  else
  {
    -[NCNotificationRequestCoalescingContentProvider notificationRequest](self, "notificationRequest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "interruptionLevel");

    if (v9 != 3)
    {
      v11 = 0;
      return v11;
    }
    NCUserNotificationsUIKitFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("CRITICAL_TEXT");
  }
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_1E8D21F60, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedLowercaseString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)importantAttributedTextWithImageConfiguration:(id)a3 importantAdornmentEligibleOptions:(unint64_t)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = a3;
  -[NCNotificationRequestCoalescingContentProvider notificationRequest](self, "notificationRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "interruptionLevel");

  if (v7 == 3)
  {
    -[NCNotificationRequestContentProvider _criticalAlertIconAttributedStringWithImageConfiguration:](self, "_criticalAlertIconAttributedStringWithImageConfiguration:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)thumbnail
{
  NCNotificationRequestFullScreenContentProvider *v2;
  UIImage *v3;
  UIImage *v4;
  objc_super v6;

  v2 = self;
  objc_sync_enter(v2);
  if (v2->_imageAssetLoadingComplete)
  {
    v3 = v2->_fullScreenThumbnail;
  }
  else
  {
    v6.receiver = v2;
    v6.super_class = (Class)NCNotificationRequestFullScreenContentProvider;
    -[NCNotificationRequestCoalescingContentProvider thumbnail](&v6, sel_thumbnail);
    v3 = (UIImage *)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  objc_sync_exit(v2);

  return v4;
}

- (id)_newAvatarView
{
  void *v3;
  void *v4;
  NCAvatarView *v5;
  void *v6;
  NCAvatarView *v7;

  -[NCNotificationRequestContentProvider delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "contentProviderTraitCollection:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = [NCAvatarView alloc];
  -[NCNotificationRequestCoalescingContentProvider notificationRequest](self, "notificationRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NCAvatarView initWithNotificationRequest:pointSize:compatibleWithInitialTraitCollection:](v5, "initWithNotificationRequest:pointSize:compatibleWithInitialTraitCollection:", v6, v4, 176.0);

  return v7;
}

- (BOOL)isImageAssetLoadingComplete
{
  return self->_imageAssetLoadingComplete;
}

- (UIImage)_fullScreenThumbnail
{
  return self->_fullScreenThumbnail;
}

- (void)_setFullScreenThumbnail:(id)a3
{
  objc_storeStrong((id *)&self->_fullScreenThumbnail, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullScreenThumbnail, 0);
}

@end
