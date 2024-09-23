@implementation _UICarPlaySession

+ (id)sharedInstance
{
  objc_opt_self();
  if (qword_1ECD80260 != -1)
    dispatch_once(&qword_1ECD80260, &__block_literal_global_478);
  return (id)_MergedGlobals_1211;
}

- (id)carSessionStatus
{
  os_unfair_lock_s *v2;
  id v3;
  void *v4;
  objc_class *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  if (!a1)
    return 0;
  v2 = (os_unfair_lock_s *)(a1 + 8);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
  v3 = *(id *)(a1 + 16);
  if (!v3)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v4 = (void *)getCARSessionStatusClass_softClass;
    v13 = getCARSessionStatusClass_softClass;
    if (!getCARSessionStatusClass_softClass)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __getCARSessionStatusClass_block_invoke;
      v9[3] = &unk_1E16B14C0;
      v9[4] = &v10;
      __getCARSessionStatusClass_block_invoke((uint64_t)v9);
      v4 = (void *)v11[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v10, 8);
    v6 = objc_msgSend([v5 alloc], "initAndWaitUntilSessionUpdated");
    v7 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v6;

    objc_msgSend(*(id *)(a1 + 16), "addSessionObserver:", a1);
    v3 = *(id *)(a1 + 16);
  }
  os_unfair_lock_unlock(v2);
  return v3;
}

- (void)sessionDidDisconnect:(id)a3
{
  os_unfair_lock_s *p_lock;
  CARSessionStatus *carSessionStatus;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[CARSessionStatus removeSessionObserver:](self->_carSessionStatus, "removeSessionObserver:", self);
  carSessionStatus = self->_carSessionStatus;
  self->_carSessionStatus = 0;

  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carSessionStatus, 0);
}

@end
