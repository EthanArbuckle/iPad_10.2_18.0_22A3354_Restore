@implementation PKSharingMessageExtensionAppViewController

- (PKSharingMessageExtensionAppViewController)init
{
  PKSharingMessageExtensionAppViewController *v3;
  BOOL v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v8.receiver = self;
  v8.super_class = (Class)PKSharingMessageExtensionAppViewController;
  v3 = -[MSMessagesAppViewController init](&v8, sel_init);
  if (v3)
    v4 = _messageBubbleViewControllers == 0;
  else
    v4 = 0;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "pk_copiedToWeakObjectsMapTable");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)_messageBubbleViewControllers;
    _messageBubbleViewControllers = v5;

  }
  return v3;
}

- (CGSize)contentSizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;
  CGSize result;

  if (self->_messageBubbleViewController)
  {
    -[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts");
    PKFloatRoundToPixel();
    v5 = fmin(v4, 600.0);
    -[PKMessageExtensionMessageBubbleViewController heightThatFitsWidth:](self->_messageBubbleViewController, "heightThatFitsWidth:", v5);
    v7 = v6;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)PKSharingMessageExtensionAppViewController;
    -[MSMessagesAppViewController contentSizeThatFits:](&v10, sel_contentSizeThatFits_, a3.width, a3.height);
    v5 = v8;
  }
  v9 = v5;
  result.height = v7;
  result.width = v9;
  return result;
}

- (void)willBecomeActiveWithConversation:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "recipientAddresses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v10 = v4;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Will become active with conversation: %@, recipientAddresses:%@", buf, 0x16u);

  }
  v8.receiver = self;
  v8.super_class = (Class)PKSharingMessageExtensionAppViewController;
  -[MSMessagesAppViewController willBecomeActiveWithConversation:](&v8, sel_willBecomeActiveWithConversation_, v4);
  -[PKSharingMessageExtensionAppViewController _viewControllerForPresentationStyle:withConversation:](self, "_viewControllerForPresentationStyle:withConversation:", -[MSMessagesAppViewController presentationStyle](self, "presentationStyle"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    -[PKSharingMessageExtensionAppViewController _setContentViewController:](self, "_setContentViewController:", v7);
  -[PKSharingMessageExtensionPresenter extensionWillAppear](self->_presenter, "extensionWillAppear");

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKSharingMessageExtensionAppViewController;
  -[MSMessagesAppViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[PKSharingMessageExtensionAppViewController _requestResizeIfNeeded](self, "_requestResizeIfNeeded");
}

- (id)_viewControllerForPresentationStyle:(unint64_t)a3 withConversation:(id)a4
{
  void *v5;
  PKMessageExtensionMessageBubbleViewController *v6;
  PKMessageExtensionMessageBubbleViewController *messageBubbleViewController;
  void *v8;
  PKMessageExtensionMessageBubbleViewController *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  int v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  PKMessageExtensionMessageBubbleViewController *v27;

  if (a3 != 2)
    return 0;
  objc_msgSend(a4, "selectedMessage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSharingMessageExtensionAppViewController _configureCurrentStateForMessage:](self, "_configureCurrentStateForMessage:", v5);

  v6 = -[PKMessageExtensionMessageBubbleViewController initWithDelegate:]([PKMessageExtensionMessageBubbleViewController alloc], "initWithDelegate:", self);
  messageBubbleViewController = self->_messageBubbleViewController;
  self->_messageBubbleViewController = v6;

  v8 = (void *)_messageBubbleViewControllers;
  v9 = self->_messageBubbleViewController;
  -[MSMessage URL](self->_currentMessage, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v9, v10);

  -[MSMessagesAppViewController _balloonMaskEdgeInsets](self, "_balloonMaskEdgeInsets");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v19 = -[MSMessage isFromMe](self->_currentMessage, "isFromMe");
  if (v19)
    v20 = 0.0;
  else
    v20 = v14;
  v21 = -0.0;
  if (v19)
    v21 = v14;
  v22 = v18 + v21;
  -[PKMessageExtensionMessageBubbleViewController bubbleView](self->_messageBubbleViewController, "bubbleView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setContentInset:", v12, v20, v16, v22);
  v24 = (void *)objc_opt_class();
  -[PKSharingMessageExtensionPresenter message](self->_presenter, "message");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "propertiesForMessage:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setProperties:", v26);

  v27 = self->_messageBubbleViewController;
  return v27;
}

- (void)_setContentViewController:(id)a3
{
  id v4;
  void *v5;
  id v6;

  if (a3)
  {
    v4 = a3;
    -[PKSharingMessageExtensionAppViewController addChildViewController:](self, "addChildViewController:", v4);
    -[PKSharingMessageExtensionAppViewController view](self, "view");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    objc_msgSend(v5, "setFrame:");
    objc_msgSend(v5, "setAutoresizingMask:", 18);
    objc_msgSend(v6, "addSubview:", v5);
    objc_msgSend(v4, "didMoveToParentViewController:", self);

  }
}

- (void)_requestResizeIfNeeded
{
  PKMessageExtensionMessageBubbleViewController *messageBubbleViewController;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  messageBubbleViewController = self->_messageBubbleViewController;
  if (messageBubbleViewController)
  {
    -[PKMessageExtensionMessageBubbleViewController view](messageBubbleViewController, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v6 = v5;
    v8 = v7;

    -[PKMessageExtensionMessageBubbleViewController heightThatFitsWidth:](self->_messageBubbleViewController, "heightThatFitsWidth:", v6);
    if (round(vabdd_f64(v8, v9)) > 0.0)
      -[MSMessagesAppViewController requestResize](self, "requestResize");
  }
}

- (void)_validateMessageForSending:(id)a3 conversation:(id)a4 associatedText:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  PKSharingMessageExtensionPresenter *presenter;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint8_t buf[16];

  v9 = a3;
  v10 = a4;
  v11 = a6;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  PKLogFacilityTypeGetObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Validating message for sending", buf, 2u);
  }

  objc_msgSend(v10, "recipientAddresses");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13 && objc_msgSend(v13, "count"))
  {
    -[PKSharingMessageExtensionAppViewController _configureCurrentStateForMessage:](self, "_configureCurrentStateForMessage:", v9);
    -[PKMessageExtensionMessageBubbleViewController bubbleView](self->_messageBubbleViewController, "bubbleView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "beginValidateMessage");
    presenter = self->_presenter;
    objc_msgSend(v10, "senderAddress");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __119__PKSharingMessageExtensionAppViewController__validateMessageForSending_conversation_associatedText_completionHandler___block_invoke;
    v19[3] = &unk_1E3E62978;
    v20 = v15;
    v21 = v11;
    v18 = v15;
    -[PKSharingMessageExtensionPresenter validateForRecipients:senderAddress:completion:](presenter, "validateForRecipients:senderAddress:completion:", v14, v17, v19);

  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, "iMessage Extension: no recipients to validate", buf, 2u);
    }

    (*((void (**)(id, _QWORD, _QWORD))v11 + 2))(v11, 0, 0);
  }

}

void __119__PKSharingMessageExtensionAppViewController__validateMessageForSending_conversation_associatedText_completionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  void *v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  const char *v9;
  uint8_t *v10;
  __CFNotificationCenter *DarwinNotifyCenter;
  __int16 v12;
  uint8_t buf[2];

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "completeValidateMessage");
  PKLogFacilityTypeGetObject();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if ((a2 & 1) != 0)
  {
    if (v8)
    {
      v12 = 0;
      v9 = "iMessage Extension: Message sending!";
      v10 = (uint8_t *)&v12;
LABEL_6:
      _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
    }
  }
  else if (v8)
  {
    *(_WORD *)buf = 0;
    v9 = "iMessage Extension: Message failed validation, not sending";
    v10 = buf;
    goto LABEL_6;
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x1E0D69CC0], 0, 0, 1u);
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));

}

- (void)_configureCurrentStateForMessage:(id)a3
{
  PKSharingMessageExtensionPresenter *v5;
  PKSharingMessageExtensionPresenter *presenter;
  PKSharingMessageExtensionPresenter *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  PKMessageExtensionMessageBubbleViewController *v18;
  PKMessageExtensionMessageBubbleViewController *messageBubbleViewController;
  id v20;

  v20 = a3;
  objc_storeStrong((id *)&self->_currentMessage, a3);
  -[PKSharingMessageExtensionAppViewController presenterForMessage:](self, "presenterForMessage:", v20);
  v5 = (PKSharingMessageExtensionPresenter *)objc_claimAutoreleasedReturnValue();
  presenter = self->_presenter;
  self->_presenter = v5;

  v7 = self->_presenter;
  if (!v7)
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99768];
    objc_msgSend(v20, "URL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "raise:format:", v9, CFSTR("Sharing message URL must always resolve to presenter! URL: %@"), v10);

    v7 = self->_presenter;
  }
  -[PKSharingMessageExtensionPresenter setRenderer:](v7, "setRenderer:", self);
  v11 = objc_msgSend(v20, "isPending");
  if ((v11 & 1) != 0)
    goto LABEL_6;
  +[PKMessagesAppSharedContext sharedContext](PKMessagesAppSharedContext, "sharedContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "session");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "externalizedControllerStateForMessageIdentifier:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15
    || (v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithDataRepresentation:relativeToURL:", v15, 0), v15, !v16))
  {
LABEL_6:
    -[MSMessage URL](self->_currentMessage, "URL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "messageClass")), "initWithURL:", v16);
  objc_msgSend(v17, "setIsFromMe:", objc_msgSend(v20, "isFromMe"));
  objc_msgSend(v17, "setIsPending:", v11);
  -[PKSharingMessageExtensionPresenter setMessage:](self->_presenter, "setMessage:", v17);
  if (!self->_messageBubbleViewController)
  {
    objc_msgSend((id)_messageBubbleViewControllers, "objectForKey:", v16);
    v18 = (PKMessageExtensionMessageBubbleViewController *)objc_claimAutoreleasedReturnValue();
    messageBubbleViewController = self->_messageBubbleViewController;
    self->_messageBubbleViewController = v18;

  }
}

- (id)presenterForMessage:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKSharingMessageExtensionPresenterForURL(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)messageExtensionMessageBubbleViewControllerDidTapMessage:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Subcredential invitation message view controller: %@ did tap message", (uint8_t *)&v6, 0xCu);
  }

  -[PKSharingMessageExtensionPresenter didTapMessage](self->_presenter, "didTapMessage");
}

- (NSString)presentationSceneIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PKSharingMessageExtensionAppViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_sceneIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)messageDidUpdate
{
  void *v3;
  PKMessageExtensionMessageBubbleViewController *messageBubbleViewController;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v3 = (void *)_messageBubbleViewControllers;
  messageBubbleViewController = self->_messageBubbleViewController;
  -[MSMessage URL](self->_currentMessage, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", messageBubbleViewController, v5);

  -[PKSharingMessageExtensionPresenter message](self->_presenter, "message");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "propertiesForMessage:", v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMessageExtensionMessageBubbleViewController bubbleView](self->_messageBubbleViewController, "bubbleView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProperties:", v6);
  -[PKSharingMessageExtensionAppViewController _requestResizeIfNeeded](self, "_requestResizeIfNeeded");
  v8 = (void *)_messageBubbleViewControllers;
  -[MSMessage URL](self->_currentMessage, "URL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObjectForKey:", v9);

  objc_msgSend(v15, "urlRepresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSMessage setURL:](self->_currentMessage, "setURL:", v10);
  if (!-[MSMessage isPending](self->_currentMessage, "isPending"))
  {
    +[PKMessagesAppSharedContext sharedContext](PKMessagesAppSharedContext, "sharedContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dataRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSMessage session](self->_currentMessage, "session");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "persistExternalizedControllerState:forMessageIdentifier:", v12, v14);

  }
  objc_msgSend((id)_messageBubbleViewControllers, "setObject:forKey:", self->_messageBubbleViewController, v10);

}

- (void)showAlertWithTitle:(id)a3 message:(id)a4 button:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  uint64_t v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  PKLogFacilityTypeGetObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (v7)
      v11 = v7;
    else
      v11 = v8;
    v14 = 138412290;
    v15 = v11;
    _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "iMessage Extension: showing alert with title \"%@\", (uint8_t *)&v14, 0xCu);
  }

  v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v13 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v12, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D6BC20]);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D6BC18]);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0C9B800]);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0C9B810]);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0C9B838]);
  objc_msgSend(MEMORY[0x1E0D67760], "presentNotificationWithParameters:responseHandler:", v12, &__block_literal_global_9);

}

- (void)showAlertWithTitle:(id)a3 message:(id)a4 button:(id)a5 destructiveButton:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  PKLogFacilityTypeGetObject();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    if (v11)
      v17 = v11;
    else
      v17 = v12;
    *(_DWORD *)buf = 138412290;
    v25 = v17;
    _os_log_impl(&dword_19D178000, v16, OS_LOG_TYPE_DEFAULT, "iMessage Extension: showing confirmation alert with title \"%@\", buf, 0xCu);
  }

  v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v19 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v18, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D6BC20]);
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0D6BC18]);
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0C9B800]);
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0C9B810]);
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0C9B838]);
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0C9B868]);
  v20 = (void *)MEMORY[0x1E0D67760];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __109__PKSharingMessageExtensionAppViewController_showAlertWithTitle_message_button_destructiveButton_completion___block_invoke;
  v22[3] = &unk_1E3E629E0;
  v23 = v15;
  v21 = v15;
  objc_msgSend(v20, "presentNotificationWithParameters:responseHandler:", v18, v22);

}

uint64_t __109__PKSharingMessageExtensionAppViewController_showAlertWithTitle_message_button_destructiveButton_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a3 != 0);
}

- (void)openAppURL:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  v4 = a3;
  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "iMessage Extension: opening url", v10, 2u);
  }

  if (PKPassbookIsCurrentlyDeletedByUser())
  {
    PKLocalizedDeletableString(CFSTR("WALLET_UNINSTALLED_ALERT_TITLE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedDeletableString(CFSTR("WALLET_UNINSTALLED_ALERT_MESSAGE"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedDeletableString(CFSTR("WALLET_UNINSTALLED_CANCEL_BUTTON"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedDeletableString(CFSTR("WALLET_UNINSTALLED_SHOW_APP_STORE_BUTTON"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSharingMessageExtensionAppViewController showAlertWithTitle:message:button:destructiveButton:completion:](self, "showAlertWithTitle:message:button:destructiveButton:completion:", v6, v7, v8, v9, &__block_literal_global_44);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "openSensitiveURL:withOptions:", v4, 0);
  }

}

uint64_t __57__PKSharingMessageExtensionAppViewController_openAppURL___block_invoke(uint64_t a1, int a2)
{
  uint64_t result;

  if (a2)
    return PKOpenInstallWallet();
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentMessage, 0);
  objc_storeStrong((id *)&self->_messageBubbleViewController, 0);
  objc_storeStrong((id *)&self->_presenter, 0);
}

@end
