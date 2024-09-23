@implementation BKHIDHapticFeedbackController

- (BKHIDHapticFeedbackController)initWithHIDHapticFeedbackInterface:(id)a3
{
  id v5;
  BKHIDHapticFeedbackController *v6;
  BKHIDHapticFeedbackController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKHIDHapticFeedbackController;
  v6 = -[BKHIDHapticFeedbackController init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_HIDHapticFeedbackInterface, a3);

  return v7;
}

- (void)postHapticFeedbackRequest:(id)a3 forAuditToken:(id *)a4
{
  id v5;

  v5 = a3;
  if (-[BKHIDHapticFeedbackController _validateHapticFeedbackRequest:forAuditToken:](self, "_validateHapticFeedbackRequest:forAuditToken:"))
  {
    -[BKHIDHapticFeedbackInterface playHapticFeedbackRequest:](self->_HIDHapticFeedbackInterface, "playHapticFeedbackRequest:", v5);
  }

}

- (BOOL)_validateHapticFeedbackRequest:(id)a3 forAuditToken:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  unsigned __int8 v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  const char *v14;
  id v15;
  int v17;
  id v18;
  __int16 v19;
  int v20;

  v6 = a3;
  v7 = BSPIDForAuditToken(a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "powerSourceID"));
  v9 = objc_msgSend(v6, "deviceType");
  v10 = +[BKSecurityManager hasEntitlement:forAuditToken:](BKSecurityManager, "hasEntitlement:forAuditToken:", BKRequestHapticFeedbackEntitlement, a4);
  if (!v8)
  {
    if (v9)
    {
      if (v9 == (id)1
        && -[BKHIDHapticFeedbackController _validateTrackpadHapticFeedbackRequest:forPID:](self, "_validateTrackpadHapticFeedbackRequest:forPID:", v6, v7))
      {
        goto LABEL_3;
      }
    }
    else if (-[BKHIDHapticFeedbackController _validatePencilHapticFeedbackRequest:forPID:](self, "_validatePencilHapticFeedbackRequest:forPID:", v6, v7))
    {
      goto LABEL_3;
    }
    v15 = sub_100059AFC();
    v13 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v17 = 138543618;
      v18 = v6;
      v19 = 1024;
      v20 = v7;
      v14 = "Haptic feedback request %{public}@ from pid %d could not be validated due to destination mismatch";
      goto LABEL_15;
    }
LABEL_12:

    v11 = 0;
    goto LABEL_13;
  }
  if ((v10 & 1) == 0)
  {
    v12 = sub_100059AFC();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v17 = 138543618;
      v18 = v6;
      v19 = 1024;
      v20 = v7;
      v14 = "Haptic feedback request %{public}@ from pid %d could not be validated due to missing entitlement";
LABEL_15:
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v17, 0x12u);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
LABEL_3:
  v11 = 1;
LABEL_13:

  return v11;
}

- (BOOL)_validatePencilHapticFeedbackRequest:(id)a3 forPID:(int)a4
{
  uint64_t v4;
  BKTouchDeliveryGenericGestureFocusObserver *genericGestureFocusObserver;
  BKTouchDeliveryGenericGestureFocusObserver *v7;
  BKTouchDeliveryGenericGestureFocusObserver *v8;

  v4 = *(_QWORD *)&a4;
  genericGestureFocusObserver = self->_genericGestureFocusObserver;
  if (!genericGestureFocusObserver)
  {
    v7 = (BKTouchDeliveryGenericGestureFocusObserver *)objc_claimAutoreleasedReturnValue(+[BKTouchDeliveryGenericGestureFocusObserver sharedInstance](BKTouchDeliveryGenericGestureFocusObserver, "sharedInstance", a3));
    v8 = self->_genericGestureFocusObserver;
    self->_genericGestureFocusObserver = v7;

    genericGestureFocusObserver = self->_genericGestureFocusObserver;
  }
  return -[BKTouchDeliveryGenericGestureFocusObserver destinationPIDMatchesHapticFeedbackRequestPID:](genericGestureFocusObserver, "destinationPIDMatchesHapticFeedbackRequestPID:", v4);
}

- (BOOL)_validateTrackpadHapticFeedbackRequest:(id)a3 forPID:(int)a4
{
  uint64_t v4;
  BKMousePointerController *mousePointerController;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  BKMousePointerController *v11;
  BKMousePointerController *v12;

  v4 = *(_QWORD *)&a4;
  mousePointerController = self->_mousePointerController;
  if (!mousePointerController)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKHIDEventProcessorRegistry sharedInstance](BKHIDEventProcessorRegistry, "sharedInstance", a3));
    v9 = objc_msgSend(v7, "eventProcessorOfClass:", objc_opt_class(BKHIDMousePointerEventProcessor, v8));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (BKMousePointerController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mousePointerController"));
    v12 = self->_mousePointerController;
    self->_mousePointerController = v11;

    mousePointerController = self->_mousePointerController;
  }
  return -[BKMousePointerController destinationPIDMatchesHapticFeedbackRequestPID:](mousePointerController, "destinationPIDMatchesHapticFeedbackRequestPID:", v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_HIDHapticFeedbackInterface, 0);
  objc_storeStrong((id *)&self->_genericGestureFocusObserver, 0);
  objc_storeStrong((id *)&self->_mousePointerController, 0);
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006D968;
  block[3] = &unk_1000EBC38;
  block[4] = a1;
  if (qword_1001174D8 != -1)
    dispatch_once(&qword_1001174D8, block);
  return (id)qword_1001174E0;
}

@end
