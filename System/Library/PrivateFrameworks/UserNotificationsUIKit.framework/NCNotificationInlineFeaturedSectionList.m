@implementation NCNotificationInlineFeaturedSectionList

- (NSArray)featuredNotificationContentProviders
{
  return self->_featuredNotificationContentProviders;
}

- (void)setFeaturedNotificationContentProviders:(id)a3
{
  NSArray **p_featuredNotificationContentProviders;
  uint64_t v6;
  NSArray *v7;
  NSMutableDictionary *richContentProviders;
  id v9;
  _QWORD v10[5];
  _QWORD v11[5];

  p_featuredNotificationContentProviders = &self->_featuredNotificationContentProviders;
  v9 = a3;
  if ((BSEqualArrays() & 1) != 0)
  {
    -[NCNotificationInlineFeaturedSectionList updateContent](self, "updateContent");
  }
  else
  {
    v6 = MEMORY[0x1E0C809B0];
    v7 = *p_featuredNotificationContentProviders;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __83__NCNotificationInlineFeaturedSectionList_setFeaturedNotificationContentProviders___block_invoke;
    v11[3] = &unk_1E8D1E8A0;
    v11[4] = self;
    -[NSArray enumerateObjectsUsingBlock:](v7, "enumerateObjectsUsingBlock:", v11);
    richContentProviders = self->_richContentProviders;
    self->_richContentProviders = 0;

    objc_storeStrong((id *)&self->_featuredNotificationContentProviders, a3);
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __83__NCNotificationInlineFeaturedSectionList_setFeaturedNotificationContentProviders___block_invoke_2;
    v10[3] = &unk_1E8D1E8A0;
    v10[4] = self;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v10);
  }

}

void __83__NCNotificationInlineFeaturedSectionList_setFeaturedNotificationContentProviders___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "notificationRequest");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeNotificationRequest:", v3);

}

void __83__NCNotificationInlineFeaturedSectionList_setFeaturedNotificationContentProviders___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "notificationRequest");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "insertNotificationRequest:", v3);

}

- (void)updateContent
{
  void *v3;
  uint64_t v4;
  NSMutableDictionary *richContentProviders;
  uint64_t v6;
  NSArray *featuredNotificationContentProviders;
  _QWORD v8[5];
  _QWORD v9[4];
  char v10;

  -[NSArray firstObject](self->_featuredNotificationContentProviders, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isDeviceAuthenticated");

  -[NCNotificationStructuredSectionList setDeviceAuthenticated:](self, "setDeviceAuthenticated:", v4);
  richContentProviders = self->_richContentProviders;
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__NCNotificationInlineFeaturedSectionList_updateContent__block_invoke;
  v9[3] = &__block_descriptor_33_e80_v32__0__NCNotificationRequest_8__NCNotificationRequestRichContentProvider_16_B24l;
  v10 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](richContentProviders, "enumerateKeysAndObjectsUsingBlock:", v9);
  featuredNotificationContentProviders = self->_featuredNotificationContentProviders;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __56__NCNotificationInlineFeaturedSectionList_updateContent__block_invoke_2;
  v8[3] = &unk_1E8D1E8A0;
  v8[4] = self;
  -[NSArray enumerateObjectsUsingBlock:](featuredNotificationContentProviders, "enumerateObjectsUsingBlock:", v8);
}

uint64_t __56__NCNotificationInlineFeaturedSectionList_updateContent__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setDeviceAuthenticated:", *(unsigned __int8 *)(a1 + 32));
}

void __56__NCNotificationInlineFeaturedSectionList_updateContent__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "notificationRequest");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadNotificationRequest:", v3);

}

- (id)headerViewForNotificationList:(id)a3
{
  return 0;
}

- (double)headerViewHeightForNotificationList:(id)a3 withWidth:(double)a4
{
  return 0.0;
}

- (id)footerViewForNotificationList:(id)a3
{
  return 0;
}

- (double)footerViewHeightForNotificationList:(id)a3 withWidth:(double)a4
{
  return 0.0;
}

- (BOOL)isRichNotificationContentViewForNotificationGroupList:(id)a3
{
  return 1;
}

- (id)notificationGroupList:(id)a3 requestsContentProviderForNotificationRequest:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *richContentProviders;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  NCNotificationRequestRichContentProvider *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  richContentProviders = self->_richContentProviders;
  if (!richContentProviders)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v10 = self->_richContentProviders;
    self->_richContentProviders = v9;

    richContentProviders = self->_richContentProviders;
  }
  -[NSMutableDictionary objectForKey:](richContentProviders, "objectForKey:", v7);
  v11 = (NCNotificationRequestRichContentProvider *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v11 = -[NCNotificationRequestCoalescingContentProvider initWithNotificationRequest:]([NCNotificationRequestRichContentProvider alloc], "initWithNotificationRequest:", v7);
    -[NCNotificationRequestRichContentProvider setIconVisible:](v11, "setIconVisible:", 1);
    -[NSArray firstObject](self->_featuredNotificationContentProviders, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationRequestCoalescingContentProvider setDeviceAuthenticated:](v11, "setDeviceAuthenticated:", objc_msgSend(v12, "isDeviceAuthenticated"));

    -[NSMutableDictionary bs_setSafeObject:forKey:](self->_richContentProviders, "bs_setSafeObject:forKey:", v11, v7);
  }

  return v11;
}

- (BOOL)shouldNotificationGroupListPanHorizontally:(id)a3
{
  return 0;
}

- (void)notificationListComponent:(id)a3 requestsExecuteAction:(id)a4 forNotificationRequest:(id)a5 requestAuthentication:(BOOL)a6 withParameters:(id)a7 completion:(id)a8
{
  _BOOL8 v10;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v10 = a6;
  v20 = a4;
  v13 = a7;
  v14 = a8;
  v15 = a5;
  objc_msgSend(v15, "defaultAction");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  if (v16 == v20)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v18, CFSTR("NCNotificationActionDeferClearForNotificationSummaryKey"));

    v13 = v17;
  }
  -[NCNotificationStructuredSectionList delegate](self, "delegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "notificationListComponent:requestsExecuteAction:forNotificationRequest:requestAuthentication:withParameters:completion:", self, v20, v15, v10, v13, v14);

}

- (BOOL)_shouldHideNotificationRequest:(id)a3
{
  return 0;
}

- (BOOL)_shouldHideNotificationGroupList:(id)a3
{
  return 0;
}

- (void)_configureSectionListView:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NCNotificationInlineFeaturedSectionList;
  v3 = a3;
  -[NCNotificationStructuredSectionList _configureSectionListView:](&v4, sel__configureSectionListView_, v3);
  objc_msgSend(v3, "setRevealed:", 1, v4.receiver, v4.super_class);
  objc_msgSend(v3, "setRevealPercentage:", 1.0);
  objc_msgSend(v3, "setGroupingAnimationStyle:", 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_richContentProviders, 0);
  objc_storeStrong((id *)&self->_featuredNotificationContentProviders, 0);
}

@end
