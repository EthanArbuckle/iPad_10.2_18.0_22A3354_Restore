@implementation PGInterruptionAssistant

- (void)addReason:(int64_t)a3 attribution:(id)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  NSMutableDictionary *lock_interruptions;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _PGInterruption *v14;

  p_lock = &self->_lock;
  v7 = a4;
  os_unfair_lock_lock(p_lock);
  if (self->_lock_isInterrupted)
  {
    if (a3 == 1)
      self->_lock_allowsResumingAfterInterruptionEnds = 0;
  }
  else
  {
    self->_lock_allowsResumingAfterInterruptionEnds = a3 != 1;
  }
  v14 = -[_PGInterruption initWithReason:attribution:]([_PGInterruption alloc], "initWithReason:attribution:", a3, v7);

  lock_interruptions = self->_lock_interruptions;
  if (!lock_interruptions)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v10 = self->_lock_interruptions;
    self->_lock_interruptions = v9;

    lock_interruptions = self->_lock_interruptions;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](lock_interruptions, "objectForKeyedSubscript:", v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "integerValue");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12 + 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_lock_interruptions, "setObject:forKeyedSubscript:", v13, v14);

  self->_lock_isInterrupted = -[PGInterruptionAssistant _lock_calculateIsInterrupted](self, "_lock_calculateIsInterrupted");
  os_unfair_lock_unlock(p_lock);

}

- (BOOL)_lock_calculateIsInterrupted
{
  PGInterruptionAssistant *v2;
  void *v3;
  _QWORD v5[5];

  v2 = self;
  -[NSMutableDictionary allKeys](self->_lock_interruptions, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__PGInterruptionAssistant__lock_calculateIsInterrupted__block_invoke;
  v5[3] = &unk_1E622F9D0;
  v5[4] = v2;
  LOBYTE(v2) = objc_msgSend(v3, "bs_containsObjectPassingTest:", v5);

  return (char)v2;
}

uint64_t __55__PGInterruptionAssistant__lock_calculateIsInterrupted__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  v4 = objc_msgSend(v3, "reason");
  if (v4 == 2)
  {
    objc_msgSend(v3, "attribution");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16)) ^ 1;

  }
  else
  {
    v6 = v4 != 1 || (v5 = *(_QWORD *)(a1 + 32), !*(_BYTE *)(v5 + 27)) || *(unsigned __int8 *)(v5 + 28) == 0;
  }

  return v6;
}

- (PGInterruptionAssistant)init
{
  PGInterruptionAssistant *v2;
  PGInterruptionAssistant *v3;
  id v4;
  void *v5;
  uint64_t v6;
  BSInvalidatable *stateDumpInvalidatable;
  id v9;
  id location;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PGInterruptionAssistant;
  v2 = -[PGInterruptionAssistant init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    objc_initWeak(&location, v2);
    v4 = MEMORY[0x1E0C80D38];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PictureInPicture - PGInterruptionAssistant - %p"), v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_copyWeak(&v9, &location);
    BSLogAddStateCaptureBlockWithTitle();
    v6 = objc_claimAutoreleasedReturnValue();
    stateDumpInvalidatable = v3->_stateDumpInvalidatable;
    v3->_stateDumpInvalidatable = (BSInvalidatable *)v6;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  return v3;
}

__CFString *__31__PGInterruptionAssistant_init__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  __CFString *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "description");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_1E6231540;
  }

  return v3;
}

- (id)description
{
  void *v3;
  const __CFString *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  if (self->_lock_isInterrupted)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  -[PGInterruptionAssistant _interruptionsDescription](self, "_interruptionsDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("isInterrupted:%@; interruptions: %@; exempt attribution:%@;"),
    v4,
    v5,
    self->_lock_exemptAttribution);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[BSInvalidatable invalidate](self->_stateDumpInvalidatable, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PGInterruptionAssistant;
  -[PGInterruptionAssistant dealloc](&v3, sel_dealloc);
}

- (id)copyWithExemptAttribution:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  v5 = objc_alloc_init((Class)objc_opt_class());
  os_unfair_lock_lock(&self->_lock);
  v6 = -[NSMutableDictionary mutableCopy](self->_lock_interruptions, "mutableCopy");
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = objc_msgSend(v4, "copy");
  v9 = (void *)v5[2];
  v5[2] = v8;

  *((_BYTE *)v5 + 24) = self->_lock_allowsResumingAfterInterruptionEnds;
  *((_BYTE *)v5 + 25) = objc_msgSend(v5, "_lock_calculateIsInterrupted");
  os_unfair_lock_unlock(&self->_lock);
  return v5;
}

- (id)exemptAttribution
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_exemptAttribution;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setExemptAttribution:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  NSString *v6;
  NSString *lock_exemptAttribution;
  _BOOL4 v8;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = (NSString *)objc_msgSend(v5, "copy");

  lock_exemptAttribution = self->_lock_exemptAttribution;
  self->_lock_exemptAttribution = v6;

  LODWORD(v5) = self->_lock_isInterrupted;
  v8 = -[PGInterruptionAssistant _lock_calculateIsInterrupted](self, "_lock_calculateIsInterrupted");
  self->_lock_isInterrupted = v8;
  if (!(_DWORD)v5 && v8)
    self->_lock_allowsResumingAfterInterruptionEnds = 1;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isProxyActive
{
  PGInterruptionAssistant *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_isProxyActive;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setProxyActive:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_isProxyActive = a3;
  self->_lock_isInterrupted = -[PGInterruptionAssistant _lock_calculateIsInterrupted](self, "_lock_calculateIsInterrupted");
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isExemptFromUILockInterruptionsWhenActive
{
  PGInterruptionAssistant *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_exemptFromUILockInterruptionsWhenActive;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setExemptFromUILockInterruptionsWhenActive:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_exemptFromUILockInterruptionsWhenActive = a3;
  self->_lock_isInterrupted = -[PGInterruptionAssistant _lock_calculateIsInterrupted](self, "_lock_calculateIsInterrupted");
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isInterrupted
{
  PGInterruptionAssistant *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_isInterrupted;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (id)_interruptionsDescription
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary allKeys](self->_lock_interruptions, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_map:", &__block_literal_global_2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(","));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __52__PGInterruptionAssistant__interruptionsDescription__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "description");
}

- (BOOL)shouldNotifyProxyOfInterruptionBegan
{
  os_unfair_lock_s *p_lock;
  BOOL v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_isInterrupted && self->_lock_isProxyActive && !self->_lock_isInterruptedAccordingToProxy;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)noteDidNotifyProxyOfInterruptionBegan
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_isInterruptedAccordingToProxy = 1;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)shouldNotifyProxyOfInterruptionEnded
{
  os_unfair_lock_s *p_lock;
  BOOL v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (!self->_lock_isInterrupted || !self->_lock_isProxyActive) && self->_lock_isInterruptedAccordingToProxy;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)noteDidNotifyProxyOfInterruptionEnded
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_isInterruptedAccordingToProxy = 0;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)allowsResumingAfterInterruptionEnds
{
  PGInterruptionAssistant *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_allowsResumingAfterInterruptionEnds;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)removeReason:(int64_t)a3 attribution:(id)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSMutableDictionary *lock_interruptions;
  _PGInterruption *v12;

  p_lock = &self->_lock;
  v7 = a4;
  os_unfair_lock_lock(p_lock);
  v12 = -[_PGInterruption initWithReason:attribution:]([_PGInterruption alloc], "initWithReason:attribution:", a3, v7);

  -[NSMutableDictionary objectForKeyedSubscript:](self->_lock_interruptions, "objectForKeyedSubscript:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  if (v9 <= 1)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_lock_interruptions, "setObject:forKeyedSubscript:", 0, v12);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9 - 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_lock_interruptions, "setObject:forKeyedSubscript:", v10, v12);

  }
  if (!-[NSMutableDictionary count](self->_lock_interruptions, "count"))
  {
    lock_interruptions = self->_lock_interruptions;
    self->_lock_interruptions = 0;

  }
  self->_lock_isInterrupted = -[PGInterruptionAssistant _lock_calculateIsInterrupted](self, "_lock_calculateIsInterrupted");
  os_unfair_lock_unlock(p_lock);

}

- (BOOL)hasInterruptionReason:(int64_t)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;
  _QWORD v8[6];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary allKeys](self->_lock_interruptions, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__PGInterruptionAssistant_hasInterruptionReason___block_invoke;
  v8[3] = &unk_1E622F9A8;
  v8[4] = self;
  v8[5] = a3;
  LOBYTE(a3) = objc_msgSend(v6, "bs_containsObjectPassingTest:", v8);

  os_unfair_lock_unlock(p_lock);
  return a3;
}

uint64_t __49__PGInterruptionAssistant_hasInterruptionReason___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  if (objc_msgSend(v3, "reason") == *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v3, "attribution");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16)) ^ 1;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)cameraInterruptionAttributions
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary allKeys](self->_lock_interruptions, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_map:", &__block_literal_global_50);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  if (v5)
    v6 = v5;
  else
    v6 = (void *)MEMORY[0x1E0C9AA60];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __57__PGInterruptionAssistant_cameraInterruptionAttributions__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (objc_msgSend(v2, "reason") == 2)
  {
    objc_msgSend(v2, "attribution");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateDumpInvalidatable, 0);
  objc_storeStrong((id *)&self->_lock_exemptAttribution, 0);
  objc_storeStrong((id *)&self->_lock_interruptions, 0);
}

@end
