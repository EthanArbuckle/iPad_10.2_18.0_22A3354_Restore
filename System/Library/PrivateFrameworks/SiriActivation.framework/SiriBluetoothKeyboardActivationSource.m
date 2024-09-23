@implementation SiriBluetoothKeyboardActivationSource

- (void)activateFromSource:(int64_t)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;

  p_lock = &self->super.super._lock;
  os_unfair_lock_lock(&self->super.super._lock);
  -[BSServiceConnection remoteTarget](self->super.super._connection, "remoteTarget");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activationRequestFromBluetoothKeyboardActivation:", v7);

  os_unfair_lock_unlock(p_lock);
}

- (void)_setConnection:(id)a3
{
  objc_storeStrong((id *)&self->super.super._connection, a3);
}

@end
