@implementation SBFMotionAlarmController

- (SBFMotionAlarmController)init
{
  SBFMotionAlarmController *v2;
  uint64_t v3;
  CMMotionAlarmManager *motionAlarmManager;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBFMotionAlarmController;
  v2 = -[SBFMotionAlarmController init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA5668]), "initWithName:", CFSTR("com.apple.SpringBoard.MotionAlarmController"));
    motionAlarmManager = v2->_motionAlarmManager;
    v2->_motionAlarmManager = (CMMotionAlarmManager *)v3;

    -[CMMotionAlarmManager setDelegate:](v2->_motionAlarmManager, "setDelegate:", v2);
  }
  return v2;
}

- (void)dealloc
{
  CMMotionAlarmManager *motionAlarmManager;
  objc_super v4;

  -[SBFMotionAlarmController _unregisterMotionAlarm](self, "_unregisterMotionAlarm");
  motionAlarmManager = self->_motionAlarmManager;
  self->_motionAlarmManager = 0;

  objc_storeWeak((id *)&self->_delegate, 0);
  v4.receiver = self;
  v4.super_class = (Class)SBFMotionAlarmController;
  -[SBFMotionAlarmController dealloc](&v4, sel_dealloc);
}

- (void)_notifyDelegate
{
  id WeakRetained;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    SBLogMotionAlarm();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 138412290;
      v5 = WeakRetained;
      _os_log_impl(&dword_18AB69000, v3, OS_LOG_TYPE_DEFAULT, "Notifying delegate: %@ of device motion", (uint8_t *)&v4, 0xCu);
    }

    objc_msgSend(WeakRetained, "didDetectDeviceMotion");
  }

}

- (void)_registerMotionAlarm
{
  NSObject *v3;
  uint8_t v4[16];

  SBLogMotionAlarm();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18AB69000, v3, OS_LOG_TYPE_DEFAULT, "Registering motion alarms", v4, 2u);
  }

  -[CMMotionAlarmManager registerAlarmWithName:type:duration:repeats:error:](self->_motionAlarmManager, "registerAlarmWithName:type:duration:repeats:error:", CFSTR("com.apple.SpringBoard.MotionAlarmTypePickUp"), 8, 0, 0, 0);
  -[CMMotionAlarmManager registerAlarmWithName:type:duration:repeats:error:](self->_motionAlarmManager, "registerAlarmWithName:type:duration:repeats:error:", CFSTR("com.apple.SpringBoard.MotionAlarmTypeMoving"), 1, 0, 0, 0);
}

- (void)_unregisterMotionAlarm
{
  NSObject *v3;
  uint8_t v4[16];

  SBLogMotionAlarm();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18AB69000, v3, OS_LOG_TYPE_DEFAULT, "Unregistering motion alarms", v4, 2u);
  }

  -[CMMotionAlarmManager unregisterAlarmWithName:error:](self->_motionAlarmManager, "unregisterAlarmWithName:error:", CFSTR("com.apple.SpringBoard.MotionAlarmTypePickUp"), 0);
  -[CMMotionAlarmManager unregisterAlarmWithName:error:](self->_motionAlarmManager, "unregisterAlarmWithName:error:", CFSTR("com.apple.SpringBoard.MotionAlarmTypeMoving"), 0);
}

- (void)alarmDidFire:(id)a3 error:(id)a4
{
  int v5;
  NSObject *v6;
  uint8_t v7[16];

  v5 = objc_msgSend(a3, "type");
  if (v5 == 8 || v5 == 1)
  {
    SBLogMotionAlarm();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_18AB69000, v6, OS_LOG_TYPE_DEFAULT, "Motion alarm detected", v7, 2u);
    }

    -[SBFMotionAlarmController _notifyDelegate](self, "_notifyDelegate");
  }
}

- (void)alarmDidRegister:(id)a3 error:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a3;
  v6 = a4;
  SBLogMotionAlarm();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[SBFMotionAlarmController alarmDidRegister:error:].cold.1(v5, v6);

}

- (void)alarmDidUnregister:(id)a3 error:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a3;
  v6 = a4;
  SBLogMotionAlarm();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[SBFMotionAlarmController alarmDidUnregister:error:].cold.1(v5, v6);

}

- (SBFMotionAlarmDelegate)delegate
{
  return (SBFMotionAlarmDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CMMotionAlarmManager)motionAlarmManager
{
  return self->_motionAlarmManager;
}

- (void)setMotionAlarmManager:(id)a3
{
  objc_storeStrong((id *)&self->_motionAlarmManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionAlarmManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)alarmDidRegister:(void *)a1 error:(void *)a2 .cold.1(void *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend(a1, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_18AB69000, v5, v6, "Motion alarm registered: %@, error: %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1();
}

- (void)alarmDidUnregister:(void *)a1 error:(void *)a2 .cold.1(void *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend(a1, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_18AB69000, v5, v6, "Motion alarm unregistered: %@, error: %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1();
}

@end
