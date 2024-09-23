@implementation PKDashboardPassMessage

+ (id)messageFromDialogRequest:(id)a3 withAction:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  PKDashboardPassMessage *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "buttonActions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pk_firstObjectPassingTest:", &__block_literal_global_10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(PKDashboardPassMessage);
  -[PKDashboardPassMessage setType:](v9, "setType:", 2);
  objc_msgSend(v5, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[PKDashboardPassMessage setIdentifier:](v9, "setIdentifier:", v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardPassMessage setIdentifier:](v9, "setIdentifier:", v12);

  }
  -[PKDashboardPassMessage setDialogRequest:](v9, "setDialogRequest:", v5);
  objc_msgSend(v8, "deepLink");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __62__PKDashboardPassMessage_messageFromDialogRequest_withAction___block_invoke_2;
    v15[3] = &unk_1E3E618A0;
    v17 = v6;
    v16 = v13;
    -[PKDashboardPassMessage setActionOnButtonPress:](v9, "setActionOnButtonPress:", v15);

  }
  return v9;
}

BOOL __62__PKDashboardPassMessage_messageFromDialogRequest_withAction___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;
  void *v4;

  v2 = a2;
  if (objc_msgSend(v2, "style") == 2)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(v2, "deepLink");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v4 != 0;

  }
  return v3;
}

uint64_t __62__PKDashboardPassMessage_messageFromDialogRequest_withAction___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (PKDashboardPassMessage)init
{
  PKDashboardPassMessage *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKDashboardPassMessage;
  result = -[PKDashboardPassMessage init](&v3, sel_init);
  if (result)
    result->_imageContentMode = 1;
  return result;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)secondaryTitle
{
  return self->_secondaryTitle;
}

- (void)setSecondaryTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (UIImage)messageImage
{
  return self->_messageImage;
}

- (void)setMessageImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)secondaryMessage
{
  return self->_secondaryMessage;
}

- (void)setSecondaryMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)actionOnMessagePress
{
  return self->_actionOnMessagePress;
}

- (void)setActionOnMessagePress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)buttonTitle
{
  return self->_buttonTitle;
}

- (void)setButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)actionOnButtonPress
{
  return self->_actionOnButtonPress;
}

- (void)setActionOnButtonPress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (BOOL)isDestructiveAction
{
  return self->_isDestructiveAction;
}

- (void)setIsDestructiveAction:(BOOL)a3
{
  self->_isDestructiveAction = a3;
}

- (id)actionOnViewed
{
  return self->_actionOnViewed;
}

- (void)setActionOnViewed:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (id)actionOnDismiss
{
  return self->_actionOnDismiss;
}

- (void)setActionOnDismiss:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (UIColor)imageTintColor
{
  return self->_imageTintColor;
}

- (void)setImageTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_imageTintColor, a3);
}

- (UIColor)imageBackgroundColor
{
  return self->_imageBackgroundColor;
}

- (void)setImageBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_imageBackgroundColor, a3);
}

- (int64_t)imageContentMode
{
  return self->_imageContentMode;
}

- (void)setImageContentMode:(int64_t)a3
{
  self->_imageContentMode = a3;
}

- (BOOL)strokeImage
{
  return self->_strokeImage;
}

- (void)setStrokeImage:(BOOL)a3
{
  self->_strokeImage = a3;
}

- (BOOL)imageOnTrailingEdge
{
  return self->_imageOnTrailingEdge;
}

- (void)setImageOnTrailingEdge:(BOOL)a3
{
  self->_imageOnTrailingEdge = a3;
}

- (BOOL)imageRequestExtraLarge
{
  return self->_imageRequestExtraLarge;
}

- (void)setImageRequestExtraLarge:(BOOL)a3
{
  self->_imageRequestExtraLarge = a3;
}

- (CNContact)avatarContact
{
  return self->_avatarContact;
}

- (void)setAvatarContact:(id)a3
{
  objc_storeStrong((id *)&self->_avatarContact, a3);
}

- (BOOL)showDisclosure
{
  return self->_showDisclosure;
}

- (void)setShowDisclosure:(BOOL)a3
{
  self->_showDisclosure = a3;
}

- (BOOL)showSpinner
{
  return self->_showSpinner;
}

- (void)setShowSpinner:(BOOL)a3
{
  self->_showSpinner = a3;
}

- (NSString)analyticsReporterSubject
{
  return self->_analyticsReporterSubject;
}

- (void)setAnalyticsReporterSubject:(id)a3
{
  self->_analyticsReporterSubject = (NSString *)a3;
}

- (NSString)analyticsIdentifier
{
  return self->_analyticsIdentifier;
}

- (void)setAnalyticsIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (BOOL)canReportToAnalytics
{
  return self->_reportToAnalytics;
}

- (void)setReportToAnalytics:(BOOL)a3
{
  self->_reportToAnalytics = a3;
}

- (NSDictionary)additionalEventAnalyticsOnButtonPress
{
  return self->_additionalEventAnalyticsOnButtonPress;
}

- (void)setAdditionalEventAnalyticsOnButtonPress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (AMSDialogRequest)dialogRequest
{
  return self->_dialogRequest;
}

- (void)setDialogRequest:(id)a3
{
  objc_storeStrong((id *)&self->_dialogRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dialogRequest, 0);
  objc_storeStrong((id *)&self->_additionalEventAnalyticsOnButtonPress, 0);
  objc_storeStrong((id *)&self->_analyticsIdentifier, 0);
  objc_storeStrong((id *)&self->_avatarContact, 0);
  objc_storeStrong((id *)&self->_imageBackgroundColor, 0);
  objc_storeStrong((id *)&self->_imageTintColor, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong(&self->_actionOnDismiss, 0);
  objc_storeStrong(&self->_actionOnViewed, 0);
  objc_storeStrong(&self->_actionOnButtonPress, 0);
  objc_storeStrong((id *)&self->_buttonTitle, 0);
  objc_storeStrong(&self->_actionOnMessagePress, 0);
  objc_storeStrong((id *)&self->_secondaryMessage, 0);
  objc_storeStrong((id *)&self->_messageImage, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_secondaryTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
