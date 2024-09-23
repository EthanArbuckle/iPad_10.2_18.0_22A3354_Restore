@implementation WBSStartPageBanner

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_title, "hash");
  return -[NSString hash](self->_message, "hash") ^ v3 ^ self->_numberOfTrackers ^ self->_contentVariant;
}

- (int64_t)contentVariant
{
  return self->_contentVariant;
}

- (NSString)title
{
  return self->_title;
}

- (int64_t)numberOfTrackers
{
  return self->_numberOfTrackers;
}

- (NSString)message
{
  return self->_message;
}

- (BOOL)isPrivateBrowsingEnabled
{
  return self->_privateBrowsingEnabled;
}

- (UIImage)image
{
  return self->_image;
}

- (id)action
{
  return self->_action;
}

- (WBSStartPageBanner)initWithContentVariant:(int64_t)a3 action:(id)a4
{
  id v6;
  WBSStartPageBanner *v7;
  uint64_t v8;
  id action;
  NSArray *privateBrowsingExplanationItems;
  WBSStartPageBanner *v11;
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WBSStartPageBanner;
  v7 = -[WBSStartPageBanner init](&v13, sel_init);
  if (v7)
  {
    v8 = MEMORY[0x1A85D45E4](v6);
    action = v7->_action;
    v7->_action = (id)v8;

    v7->_contentVariant = a3;
    privateBrowsingExplanationItems = v7->_privateBrowsingExplanationItems;
    v7->_privateBrowsingExplanationItems = (NSArray *)MEMORY[0x1E0C9AA60];

    v11 = v7;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  WBSStartPageBanner *v4;
  WBSStartPageBanner *v5;
  BOOL v6;

  v4 = (WBSStartPageBanner *)a3;
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
        && self->_numberOfTrackers == v5->_numberOfTrackers
        && self->_contentVariant == v5->_contentVariant;

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_privateBrowsingExplanationDismissHandler, 0);
  objc_storeStrong((id *)&self->_privateBrowsingExplanationItems, 0);
  objc_storeStrong(&self->_dismissHandler, 0);
  objc_storeStrong(&self->_messageTextItemHandler, 0);
  objc_storeStrong(&self->_secondaryButtonHandler, 0);
  objc_storeStrong(&self->_primaryButtonHandler, 0);
  objc_storeStrong((id *)&self->_secondaryButtonTitle, 0);
  objc_storeStrong((id *)&self->_primaryButtonTitle, 0);
  objc_storeStrong((id *)&self->_privacyReportData, 0);
  objc_storeStrong((id *)&self->_attributedMessage, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong(&self->_action, 0);
}

+ (id)privacyReportBannerWithNumberOfTrackers:(int64_t)a3 privateBrowsingEnabled:(BOOL)a4 privacyReportData:(id)a5 selectionHandler:(id)a6
{
  id v10;
  id v11;
  uint64_t v12;
  void *v13;

  v10 = a5;
  v11 = a6;
  v12 = objc_msgSend(objc_alloc((Class)a1), "initWithContentVariant:action:", 2, v11);

  *(_BYTE *)(v12 + 8) = a4;
  v13 = *(void **)(v12 + 80);
  *(_QWORD *)(v12 + 72) = a3;
  *(_QWORD *)(v12 + 80) = v10;

  return (id)v12;
}

+ (id)bannerWithTitle:(id)a3 message:(id)a4 dismissHandler:(id)a5
{
  return (id)objc_msgSend(a1, "bannerWithImage:title:message:interactive:dismissHandler:", 0, a3, a4, 0, a5);
}

+ (id)bannerWithImage:(id)a3 title:(id)a4 message:(id)a5 interactive:(BOOL)a6 dismissHandler:(id)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;

  v8 = a6;
  v12 = a3;
  v13 = a7;
  v14 = a5;
  v15 = a4;
  v16 = (_QWORD *)objc_msgSend(objc_alloc((Class)a1), "initWithContentVariant:action:", v8, v13);

  v17 = (void *)v16[5];
  v16[5] = v12;
  v18 = v12;

  v19 = objc_msgSend(v14, "copy");
  v20 = (void *)v16[7];
  v16[7] = v19;

  v21 = objc_msgSend(v15, "copy");
  v22 = (void *)v16[6];
  v16[6] = v21;

  return v16;
}

+ (id)privateRelayPromptBannerWithImage:(id)a3 title:(id)a4 message:(id)a5 dismissHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;

  v10 = a3;
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = (_QWORD *)objc_msgSend(objc_alloc((Class)a1), "initWithContentVariant:action:", 3, 0);
  v15 = (void *)v14[5];
  v14[5] = v10;
  v16 = v10;

  v17 = objc_msgSend(v12, "copy");
  v18 = (void *)v14[7];
  v14[7] = v17;

  v19 = objc_msgSend(v13, "copy");
  v20 = (void *)v14[6];
  v14[6] = v19;

  v21 = MEMORY[0x1A85D45E4](v11);
  v22 = (void *)v14[16];
  v14[16] = v21;

  return v14;
}

+ (id)privateBrowsingPersistentModule
{
  _QWORD *v2;

  v2 = (_QWORD *)objc_msgSend(objc_alloc((Class)a1), "initWithContentVariant:action:", 4, 0);
  v2[18] = 1;
  return v2;
}

+ (id)privateBrowsingExplanationBannerWithState:(int64_t)a3 explanationItems:(id)a4 dismissHandler:(id)a5
{
  id v8;
  id v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v8 = a5;
  v9 = a4;
  v10 = (_QWORD *)objc_msgSend(objc_alloc((Class)a1), "initWithContentVariant:action:", 5, 0);
  v11 = objc_msgSend(v9, "copy");

  v12 = (void *)v10[17];
  v10[17] = v11;

  v10[18] = a3;
  v13 = MEMORY[0x1A85D45E4](v8);

  v14 = (void *)v10[19];
  v10[19] = v13;

  return v10;
}

+ (id)bannerWithTitle:(id)a3 attributedMessage:(id)a4 primaryButtonTitle:(id)a5 secondaryButtonTitle:(id)a6 primaryButtonHandler:(id)a7 secondaryButtonHandler:(id)a8 messageTextItemHandler:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD *v22;
  void *v23;
  id v24;
  void *v25;

  v15 = a3;
  v16 = a4;
  v17 = a9;
  v18 = a8;
  v19 = a7;
  v20 = a6;
  v21 = a5;
  v22 = (_QWORD *)objc_msgSend(objc_alloc((Class)a1), "initWithContentVariant:action:", 6, 0);
  v23 = (void *)v22[6];
  v22[6] = v15;
  v24 = v15;

  v25 = (void *)v22[8];
  v22[8] = v16;

  objc_msgSend(v22, "setPrimaryButtonTitle:", v21);
  objc_msgSend(v22, "setSecondaryButtonTitle:", v20);

  objc_msgSend(v22, "setPrimaryButtonHandler:", v19);
  objc_msgSend(v22, "setSecondaryButtonHandler:", v18);

  objc_msgSend(v22, "setMessageTextItemHandler:", v17);
  return v22;
}

- (id)description
{
  void *v3;
  void *v4;
  NSString *message;
  void *v6;
  NSArray *privateBrowsingExplanationItems;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  switch(self->_contentVariant)
  {
    case 0:
    case 1:
    case 3:
      v12 = *(_OWORD *)&self->_image;
      message = self->_message;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_userInterfaceStyle);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendFormat:", CFSTR("image = %@; title = %@; message = %@; userInterfaceStyle = %@>"),
        v12,
        message,
        v6);
      goto LABEL_5;
    case 2:
      objc_msgSend(v3, "appendFormat:", CFSTR("numberOfTrackers = %zd"), self->_numberOfTrackers, v9, v10, v11);
      break;
    case 4:
      objc_msgSend(v3, "appendString:", CFSTR(">"));
      break;
    case 5:
      privateBrowsingExplanationItems = self->_privateBrowsingExplanationItems;
      WBSStringFromPrivateBrowsingExplanationState(self->_privateBrowsingExplanationState);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendFormat:", CFSTR("explanationItems = %@; state = %@>"),
        privateBrowsingExplanationItems,
        v6,
        v10,
        v11);
LABEL_5:

      break;
    case 6:
      objc_msgSend(v3, "appendFormat:", CFSTR("title = %@, message = %@, primaryButton = %@, secondaryButton = %@"), self->_title, self->_message, self->_primaryButtonTitle, self->_secondaryButtonTitle);
      break;
    default:
      return v4;
  }
  return v4;
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  self->_userInterfaceStyle = a3;
}

- (NSAttributedString)attributedMessage
{
  return self->_attributedMessage;
}

- (WBSPrivacyReportData)privacyReportData
{
  return self->_privacyReportData;
}

- (NSString)primaryButtonTitle
{
  return self->_primaryButtonTitle;
}

- (void)setPrimaryButtonTitle:(id)a3
{
  objc_storeStrong((id *)&self->_primaryButtonTitle, a3);
}

- (NSString)secondaryButtonTitle
{
  return self->_secondaryButtonTitle;
}

- (void)setSecondaryButtonTitle:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryButtonTitle, a3);
}

- (id)primaryButtonHandler
{
  return self->_primaryButtonHandler;
}

- (void)setPrimaryButtonHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (id)secondaryButtonHandler
{
  return self->_secondaryButtonHandler;
}

- (void)setSecondaryButtonHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (id)messageTextItemHandler
{
  return self->_messageTextItemHandler;
}

- (void)setMessageTextItemHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (id)dismissHandler
{
  return self->_dismissHandler;
}

- (NSArray)privateBrowsingExplanationItems
{
  return self->_privateBrowsingExplanationItems;
}

- (int64_t)privateBrowsingExplanationState
{
  return self->_privateBrowsingExplanationState;
}

- (id)privateBrowsingExplanationDismissHandler
{
  return self->_privateBrowsingExplanationDismissHandler;
}

- (void)setPrivateBrowsingExplanationDismissHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

@end
