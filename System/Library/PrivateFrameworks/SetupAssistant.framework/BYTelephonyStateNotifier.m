@implementation BYTelephonyStateNotifier

- (BYTelephonyStateNotifier)initWithNotificationQueue:(id)a3 notificationBlock:(id)a4
{
  id v6;
  id v7;
  BYTelephonyStateNotifier *v8;
  BYTelephonyStateNotifier *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BYTelephonyStateNotifier;
  v8 = -[BYTelephonyStateNotifier init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_simUnlockNotificationToken = -1;
    if (v6)
    {
      if (v7)
        -[BYTelephonyStateNotifier _beginObservingWithNotificationQueue:notificationBlock:](v8, "_beginObservingWithNotificationQueue:notificationBlock:", v6, v7);
    }
  }

  return v9;
}

- (id)initForNotifying
{
  BYTelephonyStateNotifier *v2;
  NSObject *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BYTelephonyStateNotifier;
  v2 = -[BYTelephonyStateNotifier init](&v5, sel_init);
  if (v2 && notify_register_check("com.apple.purplebuddy.simUnlockStateChanged", &v2->_simUnlockNotificationToken))
  {
    _BYLoggingFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[BYTelephonyStateNotifier initForNotifying].cold.1();

    v2->_simUnlockNotificationToken = -1;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[BYTelephonyStateNotifier _endObservingState](self, "_endObservingState");
  v3.receiver = self;
  v3.super_class = (Class)BYTelephonyStateNotifier;
  -[BYTelephonyStateNotifier dealloc](&v3, sel_dealloc);
}

- (unint64_t)currentSIMUnlockState
{
  return objc_msgSend((id)objc_opt_class(), "retrieveSIMUnlockStateFromToken:", -[BYTelephonyStateNotifier simUnlockNotificationToken](self, "simUnlockNotificationToken"));
}

- (void)notifySIMUnlockStateChangedTo:(unint64_t)a3
{
  BOOL is_valid_token;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  is_valid_token = notify_is_valid_token(-[BYTelephonyStateNotifier simUnlockNotificationToken](self, "simUnlockNotificationToken"));
  _BYLoggingFacility();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!is_valid_token)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[BYTelephonyStateNotifier notifySIMUnlockStateChangedTo:].cold.4(v7, v9, v10, v11, v12, v13, v14, v15);
    goto LABEL_13;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[BYTelephonyStateNotifier notifySIMUnlockStateChangedTo:].cold.3(v7);

  if (notify_set_state(-[BYTelephonyStateNotifier simUnlockNotificationToken](self, "simUnlockNotificationToken"), a3))
  {
    _BYLoggingFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[BYTelephonyStateNotifier notifySIMUnlockStateChangedTo:].cold.2();

  }
  if (notify_post("com.apple.purplebuddy.simUnlockStateChanged"))
  {
    _BYLoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[BYTelephonyStateNotifier notifySIMUnlockStateChangedTo:].cold.1();
LABEL_13:

  }
}

- (void)_beginObservingWithNotificationQueue:(id)a3 notificationBlock:(id)a4
{
  id v6;
  int *p_simUnlockNotificationToken;
  id v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  p_simUnlockNotificationToken = &self->_simUnlockNotificationToken;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __83__BYTelephonyStateNotifier__beginObservingWithNotificationQueue_notificationBlock___block_invoke;
  v10[3] = &unk_1E4E27F30;
  v10[4] = self;
  v11 = v6;
  v8 = v6;
  if (notify_register_dispatch("com.apple.purplebuddy.simUnlockStateChanged", p_simUnlockNotificationToken, (dispatch_queue_t)a3, v10))
  {
    _BYLoggingFacility();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[BYTelephonyStateNotifier initForNotifying].cold.1();

  }
}

uint64_t __83__BYTelephonyStateNotifier__beginObservingWithNotificationQueue_notificationBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;

  v3 = objc_msgSend((id)objc_opt_class(), "retrieveSIMUnlockStateFromToken:", a2);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v3);
  return result;
}

- (void)_endObservingState
{
  if (notify_is_valid_token(-[BYTelephonyStateNotifier simUnlockNotificationToken](self, "simUnlockNotificationToken")))
    notify_cancel(-[BYTelephonyStateNotifier simUnlockNotificationToken](self, "simUnlockNotificationToken"));
  -[BYTelephonyStateNotifier setSimUnlockNotificationToken:](self, "setSimUnlockNotificationToken:", 0xFFFFFFFFLL);
}

+ (unint64_t)retrieveSIMUnlockStateFromToken:(int)a3
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t state64;

  if (!notify_is_valid_token(a3))
  {
    _BYLoggingFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[BYTelephonyStateNotifier retrieveSIMUnlockStateFromToken:].cold.2(v5, v6, v7, v8, v9, v10, v11, v12);

    return 0;
  }
  state64 = 0;
  if (notify_get_state(a3, &state64))
  {
    _BYLoggingFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      +[BYTelephonyStateNotifier retrieveSIMUnlockStateFromToken:].cold.1();

    return 0;
  }
  return state64;
}

- (int)simUnlockNotificationToken
{
  return self->_simUnlockNotificationToken;
}

- (void)setSimUnlockNotificationToken:(int)a3
{
  self->_simUnlockNotificationToken = a3;
}

- (void)initForNotifying
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A4E92000, v0, v1, "Failed to register for the SIM unlock state notification: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)notifySIMUnlockStateChangedTo:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A4E92000, v0, v1, "Failed to post SIM unlock state notification: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)notifySIMUnlockStateChangedTo:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A4E92000, v0, v1, "Failed to update SIM unlock state notification: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)notifySIMUnlockStateChangedTo:(os_log_t)log .cold.3(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A4E92000, log, OS_LOG_TYPE_DEBUG, "Updating SIM unlock state notification...", v1, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)notifySIMUnlockStateChangedTo:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1A4E92000, a1, a3, "Unable to update SIM unlock state notification; notification token is invalid!",
    a5,
    a6,
    a7,
    a8,
    0);
  OUTLINED_FUNCTION_1();
}

+ (void)retrieveSIMUnlockStateFromToken:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A4E92000, v0, v1, "Failed to get the state of the SIM unlock state notification: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)retrieveSIMUnlockStateFromToken:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1A4E92000, a1, a3, "Failed to get the state of the SIM unlock state notification; notification token is invalid!",
    a5,
    a6,
    a7,
    a8,
    0);
  OUTLINED_FUNCTION_1();
}

@end
