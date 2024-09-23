@implementation WBSPrivateBrowsingExplanationItem

+ (id)itemsForConfiguration:(id)a3
{
  id v3;
  WBSPrivateBrowsingExplanationItem *v4;
  uint64_t v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  id v10;
  WBSPrivateBrowsingExplanationItem *v11;
  void *v12;
  void *v13;
  id v14;
  WBSPrivateBrowsingExplanationItem *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  WBSPrivateBrowsingExplanationItem *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  WBSPrivateBrowsingExplanationItem *v29;
  void *v30;
  void *v31;
  void *v33;
  uint64_t v34;
  void *v35;
  _QWORD v36[4];

  v36[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v33 = (void *)MEMORY[0x1E0C99DE8];
  v35 = v3;
  v4 = [WBSPrivateBrowsingExplanationItem alloc];
  v5 = objc_msgSend(v3, "biometryType");
  v6 = CFSTR("lock.fill");
  if (v5 == 1)
    v6 = CFSTR("touchid");
  if (v5 == 2)
    v6 = CFSTR("faceid");
  v7 = v6;
  _WBSLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[WBSPrivateBrowsingExplanationItem _initWithSymbolName:title:message:limitedToPrivateBrowsing:](v4, "_initWithSymbolName:title:message:limitedToPrivateBrowsing:", v7, v8, v9, 1);

  v36[0] = v10;
  v11 = [WBSPrivateBrowsingExplanationItem alloc];
  _WBSLocalizedString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[WBSPrivateBrowsingExplanationItem _initWithSymbolName:title:message:limitedToPrivateBrowsing:](v11, "_initWithSymbolName:title:message:limitedToPrivateBrowsing:", CFSTR("clock"), v12, v13, 1);
  v36[1] = v14;
  v15 = [WBSPrivateBrowsingExplanationItem alloc];
  _WBSLocalizedString();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[WBSPrivateBrowsingExplanationItem _initWithSymbolName:title:message:limitedToPrivateBrowsing:](v15, "_initWithSymbolName:title:message:limitedToPrivateBrowsing:", CFSTR("puzzlepiece.extension"), v16, v17, 0);
  v36[2] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "arrayWithArray:", v19);
  v34 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v35, "privateBrowsingSearchEngine");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "shortName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v21, "isEqualToString:", CFSTR("Google"));

  if ((_DWORD)v8)
  {
    v22 = [WBSPrivateBrowsingExplanationItem alloc];
    _WBSLocalizedString();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    _WBSLocalizedString();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[WBSPrivateBrowsingExplanationItem _initWithSymbolName:title:message:limitedToPrivateBrowsing:](v22, "_initWithSymbolName:title:message:limitedToPrivateBrowsing:", CFSTR("sparkle.magnifyingglass"), v23, v24, 1);

    v26 = (void *)v34;
    v27 = (void *)v34;
  }
  else
  {
    objc_msgSend(v35, "privacyProxyAvailabilityManager");
    v28 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v28, "isPrivacyProxyPaidTierUnavailableInUserCountry") & 1) == 0
      && objc_msgSend(v28, "isUserAccountInSubscriberTierForPrivacyProxy")
      && objc_msgSend(v28, "isPrivacyProxyOnInICloudSettings"))
    {
      v29 = [WBSPrivateBrowsingExplanationItem alloc];
      _WBSLocalizedString();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      _WBSLocalizedString();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[WBSPrivateBrowsingExplanationItem _initWithSymbolName:title:message:limitedToPrivateBrowsing:](v29, "_initWithSymbolName:title:message:limitedToPrivateBrowsing:", CFSTR("network.badge.shield.half.filled"), v30, v31, 0);

    }
    else
    {
      v25 = 0;
    }

    if (!v25)
    {
      v26 = (void *)v34;
      goto LABEL_15;
    }
    v26 = (void *)v34;
    v27 = (void *)v34;
  }
  objc_msgSend(v27, "addObject:", v25, v34);
LABEL_15:

  return v26;
}

+ (id)lockedPrivateBrowsingPromptForConfiguration:(id)a3
{
  id v3;
  void *v4;
  const __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  id v22;

  v3 = a3;
  if (objc_msgSend(v3, "biometryType") == 2)
  {
    v4 = (void *)MEMORY[0x1E0CEA638];
    v5 = CFSTR("hand.raised.badge.faceid.fill");
LABEL_5:
    objc_msgSend(v4, "imageNamed:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v6 = objc_msgSend(v3, "biometryType");
  v4 = (void *)MEMORY[0x1E0CEA638];
  if (v6 == 1)
  {
    v5 = CFSTR("hand.raised.badge.touchid.fill");
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("hand.raised.fill"));
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v8 = (void *)v7;
  _WBSLocalizedString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB3940];
  _WBSLocalizedString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  WBSLocalizedDeviceName();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringWithFormat:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v3, "biometryType");
  if (v14)
  {
    v15 = v14;
    v16 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15 == 1 || v15 == 2)
    {
      _WBSLocalizedString();
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = &stru_1E5449658;
    }
    objc_msgSend(v16, "localizedStringWithFormat:", v17, v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _WBSLocalizedString();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  _WBSLocalizedString();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n\n%@\n\n%@"), v13, v18, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[WBSPrivateBrowsingExplanationItem _initWithImage:title:message:limitedToPrivateBrowsing:]([WBSPrivateBrowsingExplanationItem alloc], "_initWithImage:title:message:limitedToPrivateBrowsing:", v8, v9, v21, 1);

  return v22;
}

- (id)_initWithSymbolName:(id)a3 title:(id)a4 message:(id)a5 limitedToPrivateBrowsing:(BOOL)a6
{
  _BOOL8 v6;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  v6 = a6;
  v10 = (void *)MEMORY[0x1E0CEA638];
  v11 = a5;
  v12 = a4;
  objc_msgSend(v10, "_systemImageNamed:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[WBSPrivateBrowsingExplanationItem _initWithImage:title:message:limitedToPrivateBrowsing:](self, "_initWithImage:title:message:limitedToPrivateBrowsing:", v13, v12, v11, v6);

  return v14;
}

- (id)_initWithImage:(id)a3 title:(id)a4 message:(id)a5 limitedToPrivateBrowsing:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  WBSPrivateBrowsingExplanationItem *v14;
  WBSPrivateBrowsingExplanationItem *v15;
  uint64_t v16;
  NSString *title;
  uint64_t v18;
  NSString *message;
  WBSPrivateBrowsingExplanationItem *v20;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v22.receiver = self;
  v22.super_class = (Class)WBSPrivateBrowsingExplanationItem;
  v14 = -[WBSPrivateBrowsingExplanationItem init](&v22, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_image, a3);
    v16 = objc_msgSend(v12, "copy");
    title = v15->_title;
    v15->_title = (NSString *)v16;

    v18 = objc_msgSend(v13, "copy");
    message = v15->_message;
    v15->_message = (NSString *)v18;

    v15->_limitedToPrivateBrowsing = a6;
    v20 = v15;
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  WBSPrivateBrowsingExplanationItem *v4;
  unsigned __int8 *v5;
  BOOL v6;

  v4 = (WBSPrivateBrowsingExplanationItem *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = WBSIsEqual()
        && WBSIsEqual()
        && WBSIsEqual()
        && self->_limitedToPrivateBrowsing == v5[8];

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;

  v3 = -[UIImage hash](self->_image, "hash");
  v4 = -[NSString hash](self->_message, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_title, "hash");
}

- (UIImage)image
{
  return self->_image;
}

- (BOOL)isLimitedToPrivateBrowsing
{
  return self->_limitedToPrivateBrowsing;
}

- (NSString)message
{
  return self->_message;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
