@implementation TLSystemSound

- (TLSystemSound)initWithSoundFileURL:(id)a3 soundID:(unsigned int)a4 requiresLongFormPlayback:(BOOL)a5
{
  id v8;
  TLSystemSound *v9;
  TLSystemSound *v10;
  uint64_t v11;
  NSURL *soundFileURL;
  objc_super v14;

  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TLSystemSound;
  v9 = -[TLSystemSound init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    v11 = objc_msgSend(v8, "copy");
    soundFileURL = v10->_soundFileURL;
    v10->_soundFileURL = (NSURL *)v11;

    v10->_soundID = a4;
    v10->_requiresLongFormPlayback = a5;
  }

  return v10;
}

- (void)dealloc
{
  os_unfair_lock_s *p_lock;
  objc_super v4;

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  -[TLSystemSound _prepareForDealloc](self, "_prepareForDealloc");
  os_unfair_lock_unlock(p_lock);
  v4.receiver = self;
  v4.super_class = (Class)TLSystemSound;
  -[TLSystemSound dealloc](&v4, sel_dealloc);
}

- (void)_prepareForDealloc
{
  OSStatus v3;
  NSObject *v4;
  void *v5;
  uint64_t soundID;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_shouldDisposeOfSoundID)
  {
    v3 = AudioServicesDisposeSystemSoundID(self->_soundID);
    TLLogPlayback();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      -[TLSystemSound _description](self, "_description");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      soundID = self->_soundID;
      v7 = 138543874;
      v8 = v5;
      v9 = 2048;
      v10 = soundID;
      v11 = 2048;
      v12 = v3;
      _os_log_impl(&dword_1D33D5000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: -_prepareForDealloc. AudioServicesDisposeSystemSoundID for soundID = %lu returned %ld.", (uint8_t *)&v7, 0x20u);

    }
  }
}

- (id)description
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  -[TLSystemSound _description](self, "_description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)_description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  unsigned int soundID;
  const __CFString *v8;

  os_unfair_lock_assert_owner(&self->_lock);
  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_soundFileURL)
    objc_msgSend(v6, "appendFormat:", CFSTR("; soundFileURL = %@"), self->_soundFileURL);
  soundID = self->_soundID;
  if (soundID == kSystemSoundID_InvalidTone)
  {
    v8 = CFSTR("; wasSoundCreated = NO");
LABEL_7:
    objc_msgSend(v6, "appendString:", v8);
    goto LABEL_9;
  }
  if (soundID == kSystemSoundID_NoneTone)
  {
    v8 = CFSTR("; soundID = kSystemSoundID_NoneTone");
    goto LABEL_7;
  }
  objc_msgSend(v6, "appendFormat:", CFSTR("; soundID = %lu"), self->_soundID);
LABEL_9:
  if (self->_requiresLongFormPlayback)
    objc_msgSend(v6, "appendString:", CFSTR("; requiresLongFormPlayback = YES"));
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (BOOL)isValid
{
  unsigned int v3;

  os_unfair_lock_assert_not_owner(&self->_lock);
  v3 = -[TLSystemSound soundID](self, "soundID");
  return v3 != kSystemSoundID_NoneTone && v3 != kSystemSoundID_InvalidTone;
}

- (unsigned)soundID
{
  TLSystemSound *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  -[TLSystemSound _ensureUnderlyingSoundCreated](v2, "_ensureUnderlyingSoundCreated");
  LODWORD(v2) = v2->_soundID;
  os_unfair_lock_unlock(p_lock);
  return v2;
}

- (void)beginRequiringUnderlyingSoundLoaded
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_debug_impl(&dword_1D33D5000, a2, OS_LOG_TYPE_DEBUG, "%{public}@: -beginRequiringUnderlyingSoundLoaded.", (uint8_t *)&v4, 0xCu);

}

- (void)endRequiringUnderlyingSoundLoaded
{
  os_unfair_lock_assert_not_owner(&self->_lock);
}

- (void)_ensureUnderlyingSoundCreated
{
  id v3;
  void *v4;
  NSURL *soundFileURL;
  int SystemSoundIDWithOptions;
  NSObject *v7;
  void *v8;
  NSURL *v9;
  uint64_t soundID;
  int v11;
  void *v12;
  __int16 v13;
  NSURL *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_soundID == kSystemSoundID_InvalidTone)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = v3;
    soundFileURL = self->_soundFileURL;
    if (soundFileURL)
      objc_msgSend(v3, "setObject:forKey:", soundFileURL, *MEMORY[0x1E0C92500]);
    if (self->_requiresLongFormPlayback)
      objc_msgSend(v4, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C92508]);
    if (!objc_msgSend(v4, "count"))
      goto LABEL_10;
    SystemSoundIDWithOptions = AudioServicesCreateSystemSoundIDWithOptions();
    TLLogPlayback();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[TLSystemSound _description](self, "_description");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = self->_soundFileURL;
      soundID = self->_soundID;
      v11 = 138544130;
      v12 = v8;
      v13 = 2114;
      v14 = v9;
      v15 = 2048;
      v16 = soundID;
      v17 = 2048;
      v18 = SystemSoundIDWithOptions;
      _os_log_impl(&dword_1D33D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: -_ensureUnderlyingSoundCreated. AudioServicesCreateSystemSoundIDWithOptions for URL %{public}@ produced soundID = %lu and returned %ld.", (uint8_t *)&v11, 0x2Au);

    }
    if (!SystemSoundIDWithOptions)
      self->_shouldDisposeOfSoundID = 1;
    else
LABEL_10:
      self->_soundID = kSystemSoundID_NoneTone;

  }
}

- (NSURL)soundFileURL
{
  return self->_soundFileURL;
}

- (BOOL)requiresLongFormPlayback
{
  return self->_requiresLongFormPlayback;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_soundFileURL, 0);
}

@end
