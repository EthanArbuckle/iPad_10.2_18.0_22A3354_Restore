@implementation SCDAFFeedbackService

- (id)_init
{
  SCDAFFeedbackService *v2;
  uint64_t v3;
  _TtC34SiriCrossDeviceArbitrationFeedback19FeedbackServiceImpl *feedbackService;
  uint64_t v5;
  _TtP34SiriCrossDeviceArbitrationFeedback7Globals_ *globals;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SCDAFFeedbackService;
  v2 = -[SCDAFFeedbackService init](&v8, sel_init);
  if (v2)
  {
    +[FeedbackServiceImpl sharedService](_TtC34SiriCrossDeviceArbitrationFeedback19FeedbackServiceImpl, "sharedService");
    v3 = objc_claimAutoreleasedReturnValue();
    feedbackService = v2->_feedbackService;
    v2->_feedbackService = (_TtC34SiriCrossDeviceArbitrationFeedback19FeedbackServiceImpl *)v3;

    -[FeedbackServiceImpl setDelegate:](v2->_feedbackService, "setDelegate:", v2);
    +[GlobalsImpl shared](_TtC34SiriCrossDeviceArbitrationFeedback11GlobalsImpl, "shared");
    v5 = objc_claimAutoreleasedReturnValue();
    globals = v2->_globals;
    v2->_globals = (_TtP34SiriCrossDeviceArbitrationFeedback7Globals_ *)v5;

  }
  return v2;
}

- (void)handleReceivedArbitrationParticipation:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[SCDAFFeedbackService isUserFeedbackFeatureEnabled](self, "isUserFeedbackFeatureEnabled"))
  {
    -[SCDAFFeedbackService feedbackService](self, "feedbackService");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "add:", v5);

  }
}

- (void)handleAssistantDismissed
{
  id v3;

  if (-[SCDAFFeedbackService isUserFeedbackFeatureEnabled](self, "isUserFeedbackFeatureEnabled"))
  {
    -[SCDAFFeedbackService feedbackService](self, "feedbackService");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleAssistantDismissed");

  }
}

- (void)setLocalDeviceAssistantIdentifier:(id)a3
{
  id v5;

  v5 = a3;
  objc_storeStrong((id *)&self->_localDeviceAssistantIdentifier, a3);
  if (-[SCDAFFeedbackService isUserFeedbackFeatureEnabled](self, "isUserFeedbackFeatureEnabled"))
    -[Globals setLocalDeviceAssistantIdentifier:](self->_globals, "setLocalDeviceAssistantIdentifier:", v5);

}

- (SCDAFFeedbackService)initWithServiceImpl:(id)a3 globals:(id)a4
{
  id v7;
  id v8;
  SCDAFFeedbackService *v9;
  SCDAFFeedbackService *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SCDAFFeedbackService;
  v9 = -[SCDAFFeedbackService init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_feedbackService, a3);
    -[FeedbackServiceImpl setDelegate:](v10->_feedbackService, "setDelegate:", v10);
    if (objc_msgSend(v8, "conformsToProtocol:", &unk_25756B710))
      objc_storeStrong((id *)&v10->_globals, a4);
  }

  return v10;
}

- (void)handleNotificationSCDAFAction:(int64_t)a3
{
  if (-[SCDAFFeedbackService isUserFeedbackFeatureEnabled](self, "isUserFeedbackFeatureEnabled"))
    -[SCDAFFeedbackService handleNotificationAction:](self, "handleNotificationAction:", -[SCDAFFeedbackService _actionFromSCDAFFeedbackAction:](self, "_actionFromSCDAFFeedbackAction:", a3));
}

- (BOOL)isUserFeedbackFeatureEnabled
{
  return _os_feature_enabled_impl();
}

- (void)handleNotificationAction:(int64_t)a3
{
  void *v5;
  int v6;
  int64_t v7;
  id v8;

  +[GlobalsImpl shared](_TtC34SiriCrossDeviceArbitrationFeedback11GlobalsImpl, "shared");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isInternalInstall");

  if (v6)
  {
    if (-[SCDAFFeedbackService isUserFeedbackFeatureEnabled](self, "isUserFeedbackFeatureEnabled"))
    {
      v7 = -[SCDAFFeedbackService _scdaFeedbackActionFrom:](self, "_scdaFeedbackActionFrom:", a3);
      -[SCDAFFeedbackService delegate](self, "delegate");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleUserFeedbackAction:", v7);

    }
  }
}

- (int64_t)_scdaFeedbackActionFrom:(int64_t)a3
{
  if (a3 == 2)
    return 1;
  else
    return 2 * (a3 == 1);
}

- (int64_t)_actionFromSCDAFFeedbackAction:(int64_t)a3
{
  if (a3 == 1)
    return 2;
  else
    return a3 == 2;
}

- (SCDAFFeedbackServiceDelegate)delegate
{
  return (SCDAFFeedbackServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)localDeviceAssistantIdentifier
{
  return self->_localDeviceAssistantIdentifier;
}

- (_TtP34SiriCrossDeviceArbitrationFeedback7Globals_)globals
{
  return self->_globals;
}

- (void)setGlobals:(id)a3
{
  objc_storeStrong((id *)&self->_globals, a3);
}

- (_TtC34SiriCrossDeviceArbitrationFeedback19FeedbackServiceImpl)feedbackService
{
  return self->_feedbackService;
}

- (void)setFeedbackService:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackService, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackService, 0);
  objc_storeStrong((id *)&self->_globals, 0);
  objc_storeStrong((id *)&self->_localDeviceAssistantIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

+ (id)sharedService
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__SCDAFFeedbackService_sharedService__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedService_onceToken != -1)
    dispatch_once(&sharedService_onceToken, block);
  return (id)sharedService_service;
}

void __37__SCDAFFeedbackService_sharedService__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  v2 = (void *)sharedService_service;
  sharedService_service = v1;

}

@end
