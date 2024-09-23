@implementation _UIFocusHapticFeedbackGenerator

- (_UIFocusHapticFeedbackGenerator)initWithScreen:(id)a3
{
  id v4;
  _UIFocusHapticFeedbackGenerator *v5;
  uint64_t v6;
  CARSessionStatus *sessionStatus;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIFocusHapticFeedbackGenerator;
  v5 = -[_UIFocusHapticFeedbackGenerator init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "_carSessionStatus");
    v6 = objc_claimAutoreleasedReturnValue();
    sessionStatus = v5->_sessionStatus;
    v5->_sessionStatus = (CARSessionStatus *)v6;

  }
  return v5;
}

- (void)performHapticFeedbackForFocusUpdateInContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  CARInputDeviceTouchpad *v13;
  CARInputDeviceTouchpad *currentTouchpad;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "_request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inputDeviceInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v15;
  if (v5)
  {
    objc_msgSend(v15, "_request");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "inputDeviceInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "senderID");

    v6 = v15;
    if (v9)
    {
      if (-[_UIFocusHapticFeedbackGenerator currentSenderID](self, "currentSenderID") != v9)
      {
        -[CARSessionStatus currentSession](self->_sessionStatus, "currentSession");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "inputDeviceManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "touchpadWithSenderID:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v12, "feedbackSupported"))
        {
          v13 = v12;
        }
        else
        {
          v13 = 0;
          v9 = 0;
        }
        currentTouchpad = self->_currentTouchpad;
        self->_currentTouchpad = v13;

        self->_currentSenderID = v9;
      }
      -[CARInputDeviceTouchpad performFeedbackOfType:](self->_currentTouchpad, "performFeedbackOfType:", 1);
      v6 = v15;
    }
  }

}

- (CARSessionStatus)sessionStatus
{
  return self->_sessionStatus;
}

- (void)setSessionStatus:(id)a3
{
  objc_storeStrong((id *)&self->_sessionStatus, a3);
}

- (CARInputDeviceTouchpad)currentTouchpad
{
  return self->_currentTouchpad;
}

- (void)setCurrentTouchpad:(id)a3
{
  objc_storeStrong((id *)&self->_currentTouchpad, a3);
}

- (unint64_t)currentSenderID
{
  return self->_currentSenderID;
}

- (void)setCurrentSenderID:(unint64_t)a3
{
  self->_currentSenderID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTouchpad, 0);
  objc_storeStrong((id *)&self->_sessionStatus, 0);
}

@end
