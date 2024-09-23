@implementation SBControlCenterPresentationObservationToken

- (SBControlCenterPresentationObservationToken)initWithControlCenterController:(id)a3 scene:(id)a4
{
  id v7;
  SBControlCenterPresentationObservationToken *v8;
  SBControlCenterPresentationObservationToken *v9;
  SBControlCenterController **p_controlCenterController;
  void *v11;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBControlCenterPresentationObservationToken;
  v8 = -[SBPresentationObservationToken initWithScene:](&v13, sel_initWithScene_, a4);
  v9 = v8;
  if (v8)
  {
    p_controlCenterController = &v8->_controlCenterController;
    objc_storeStrong((id *)&v8->_controlCenterController, a3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v9, sel_willPresent, CFSTR("SBControlCenterControllerWillPresentNotification"), *p_controlCenterController);
    objc_msgSend(v11, "addObserver:selector:name:object:", v9, sel_didPresent, CFSTR("SBControlCenterControllerDidPresentNotification"), *p_controlCenterController);
    objc_msgSend(v11, "addObserver:selector:name:object:", v9, sel_willDismiss, CFSTR("SBControlCenterControllerWillDismissNotification"), *p_controlCenterController);
    objc_msgSend(v11, "addObserver:selector:name:object:", v9, sel_didDismiss, CFSTR("SBControlCenterControllerDidDismissNotification"), *p_controlCenterController);

  }
  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SBControlCenterControllerWillPresentNotification"), self->_controlCenterController);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SBControlCenterControllerDidPresentNotification"), self->_controlCenterController);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SBControlCenterControllerWillDismissNotification"), self->_controlCenterController);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SBControlCenterControllerDidDismissNotification"), self->_controlCenterController);

  v4.receiver = self;
  v4.super_class = (Class)SBControlCenterPresentationObservationToken;
  -[SBControlCenterPresentationObservationToken dealloc](&v4, sel_dealloc);
}

- (int64_t)state
{
  void *v2;
  unint64_t v3;

  -[SBControlCenterController viewController](self->_controlCenterController, "viewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "presentationState");

  if (v3 > 3)
    return 2;
  else
    return qword_1D0E8B358[v3];
}

- (SBControlCenterController)controlCenterController
{
  return self->_controlCenterController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controlCenterController, 0);
}

@end
