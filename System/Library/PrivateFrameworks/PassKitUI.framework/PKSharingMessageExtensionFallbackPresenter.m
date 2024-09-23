@implementation PKSharingMessageExtensionFallbackPresenter

- (PKSharingMessageExtensionFallbackPresenter)initWithTargetDevice:(id)a3 passLibrary:(id)a4
{
  id v7;
  id v8;
  PKSharingMessageExtensionFallbackPresenter *v9;
  PKSharingMessageExtensionFallbackPresenter *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKSharingMessageExtensionFallbackPresenter;
  v9 = -[PKSharingMessageExtensionFallbackPresenter init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_targetDevice, a3);
    objc_storeStrong((id *)&v10->_passLibrary, a4);
  }

  return v10;
}

+ (Class)messageClass
{
  return (Class)objc_opt_class();
}

- (PKSharingMessageExtensionMessage)message
{
  return (PKSharingMessageExtensionMessage *)self->_message;
}

- (void)setMessage:(id)a3
{
  id v5;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_storeStrong((id *)&self->_message, a3);

}

- (void)validateForRecipients:(id)a3 senderAddress:(id)a4 completion:(id)a5
{
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v5 = a5;
  PKLogFacilityTypeGetObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "iMessage Extension: validateForRecipients called for fallback template presenter. This shouldn't happen.", v7, 2u);
  }

  (*((void (**)(id, _QWORD, _QWORD))v5 + 2))(v5, 0, 0);
}

- (void)didTapMessage
{
  id WeakRetained;
  id v4;

  if (!-[PKSharingMessageExtensionCommonMessage isFromMe](self->_message, "isFromMe"))
  {
    -[PKSharingMessageExtensionCommonMessage actionURL](self->_message, "actionURL");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_renderer);
      objc_msgSend(WeakRetained, "openAppURL:", v4);

    }
  }
}

+ (id)propertiesForMessage:(id)a3
{
  id v3;
  PKSharingMessageExtensionViewProperties *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = objc_alloc_init(PKSharingMessageExtensionViewProperties);
  objc_msgSend(v3, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSharingMessageExtensionViewProperties setTitle:](v4, "setTitle:", v5);

  objc_msgSend(v3, "topLeftTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSharingMessageExtensionViewProperties setLeftTitleText:](v4, "setLeftTitleText:", v6);

  objc_msgSend(v3, "topRightTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSharingMessageExtensionViewProperties setRightTitleText:](v4, "setRightTitleText:", v7);

  objc_msgSend(v3, "subtitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSharingMessageExtensionViewProperties setSubtitle:](v4, "setSubtitle:", v8);

  objc_msgSend(v3, "thumbnail");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSharingMessageExtensionViewProperties setCardImage:](v4, "setCardImage:", v9);

  objc_msgSend(v3, "buttonTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKSharingMessageExtensionViewProperties setButtonText:](v4, "setButtonText:", v10);
  return v4;
}

- (PKSharingMessageExtensionRenderer)renderer
{
  return (PKSharingMessageExtensionRenderer *)objc_loadWeakRetained((id *)&self->_renderer);
}

- (void)setRenderer:(id)a3
{
  objc_storeWeak((id *)&self->_renderer, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_renderer);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_passLibrary, 0);
  objc_storeStrong((id *)&self->_targetDevice, 0);
}

@end
