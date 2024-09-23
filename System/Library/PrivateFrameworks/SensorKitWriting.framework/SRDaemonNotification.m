@implementation SRDaemonNotification

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    SRLogDaemonNotification = (uint64_t)os_log_create("com.apple.SensorKit", "SRLogDaemonNotification");
}

- (id)initWithSensor:(void *)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  objc_super v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  if (!a1)
    return 0;
  v7.receiver = a1;
  v7.super_class = (Class)SRDaemonNotification;
  v3 = objc_msgSendSuper2(&v7, sel_init);
  if (v3)
  {
    *((_QWORD *)v3 + 4) = objc_msgSend(a2, "copy");
    objc_initWeak(&location, v3);
    v4 = (void *)*((_QWORD *)v3 + 4);
    v5 = MEMORY[0x24BDAC760];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __53__SRDaemonNotification_registerForDaemonNotification__block_invoke;
    v12[3] = &unk_2516F2190;
    objc_copyWeak(&v13, &location);
    SRRegisterForDarwinNotification(v4, (int *)v3 + 2, v12);
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __53__SRDaemonNotification_registerForDaemonNotification__block_invoke_5;
    v10[3] = &unk_2516F2190;
    objc_copyWeak(&v11, &location);
    SRRegisterForDarwinNotification(CFSTR("com.apple.SensorKit.significantTimeChange"), (int *)v3 + 3, v10);
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __53__SRDaemonNotification_registerForDaemonNotification__block_invoke_8;
    v8[3] = &unk_2516F2190;
    objc_copyWeak(&v9, &location);
    SRRegisterForDarwinNotification(CFSTR("com.apple.SensorKit.resetDatastore"), (int *)v3 + 4, v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  if (self)
  {
    SRUnregisterForNotification((uint64_t)self->_sensorIdentifier, &self->_registrationToken);
    SRUnregisterForNotification((uint64_t)CFSTR("com.apple.SensorKit.significantTimeChange"), &self->_significantTimeChangeToken);
    SRUnregisterForNotification((uint64_t)CFSTR("com.apple.SensorKit.resetDatastore"), &self->_resetDatastoreToken);
  }

  self->_sensorIdentifier = 0;
  v3.receiver = self;
  v3.super_class = (Class)SRDaemonNotification;
  -[SRDaemonNotification dealloc](&v3, sel_dealloc);
}

uint64_t __53__SRDaemonNotification_registerForDaemonNotification__block_invoke(uint64_t a1)
{
  id Weak;
  NSObject *v2;
  id v3;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  Weak = objc_loadWeak((id *)(a1 + 32));
  v2 = SRLogDaemonNotification;
  if (os_log_type_enabled((os_log_t)SRLogDaemonNotification, OS_LOG_TYPE_DEBUG))
  {
    if (Weak)
      v5 = *((_QWORD *)Weak + 4);
    else
      v5 = 0;
    v6 = 138543362;
    v7 = v5;
    _os_log_debug_impl(&dword_245CD7000, v2, OS_LOG_TYPE_DEBUG, "Got a notification for %{public}@ to re-connect to the daemon", (uint8_t *)&v6, 0xCu);
    if (Weak)
      goto LABEL_3;
LABEL_8:
    v3 = 0;
    return objc_msgSend(v3, "daemonNotificationDaemonDidStart:", Weak);
  }
  if (!Weak)
    goto LABEL_8;
LABEL_3:
  v3 = objc_loadWeak((id *)Weak + 3);
  return objc_msgSend(v3, "daemonNotificationDaemonDidStart:", Weak);
}

uint64_t __53__SRDaemonNotification_registerForDaemonNotification__block_invoke_5(uint64_t a1)
{
  id *Weak;
  NSObject *v2;
  id v3;
  uint64_t result;
  int v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  Weak = (id *)objc_loadWeak((id *)(a1 + 32));
  v2 = SRLogDaemonNotification;
  if (os_log_type_enabled((os_log_t)SRLogDaemonNotification, OS_LOG_TYPE_DEBUG))
  {
    v5 = 138543362;
    v6 = CFSTR("com.apple.SensorKit.significantTimeChange");
    _os_log_debug_impl(&dword_245CD7000, v2, OS_LOG_TYPE_DEBUG, "Got a notification for %{public}@", (uint8_t *)&v5, 0xCu);
    if (Weak)
      goto LABEL_3;
  }
  else if (Weak)
  {
LABEL_3:
    v3 = objc_loadWeak(Weak + 3);
    goto LABEL_4;
  }
  v3 = 0;
LABEL_4:
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(v3, "daemonNotificationDaemonDidChangeTimeSignificantly:", Weak);
  return result;
}

uint64_t __53__SRDaemonNotification_registerForDaemonNotification__block_invoke_8(uint64_t a1)
{
  id *Weak;
  NSObject *v2;
  id v3;
  uint64_t result;
  int v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  Weak = (id *)objc_loadWeak((id *)(a1 + 32));
  v2 = SRLogDaemonNotification;
  if (os_log_type_enabled((os_log_t)SRLogDaemonNotification, OS_LOG_TYPE_DEBUG))
  {
    v5 = 138543362;
    v6 = CFSTR("com.apple.SensorKit.resetDatastore");
    _os_log_debug_impl(&dword_245CD7000, v2, OS_LOG_TYPE_DEBUG, "Got a notification for %{public}@", (uint8_t *)&v5, 0xCu);
    if (Weak)
      goto LABEL_3;
  }
  else if (Weak)
  {
LABEL_3:
    v3 = objc_loadWeak(Weak + 3);
    goto LABEL_4;
  }
  v3 = 0;
LABEL_4:
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(v3, "daemonNotificationDaemonDidResetDatastore:", Weak);
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
