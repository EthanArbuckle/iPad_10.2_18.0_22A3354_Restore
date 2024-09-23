@implementation _UIDefaultFocusSoundPlayer

- (id)_init
{
  _UIDefaultFocusSoundPlayer *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *urlPools;
  NSMutableDictionary *v5;
  NSMutableDictionary *focusSoundPools;
  _UIFocusSoundPool *v7;
  _UIFocusSoundPool *v8;
  _UIFocusSoundPool *v9;
  _UIFocusSoundPool *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *soundQueue;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)_UIDefaultFocusSoundPlayer;
  v2 = -[_UIDefaultFocusSoundPlayer init](&v15, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    urlPools = v2->_urlPools;
    v2->_urlPools = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    focusSoundPools = v2->_focusSoundPools;
    v2->_focusSoundPools = v5;

    v7 = -[_UIFocusSoundPool initWithSystemSoundID:]([_UIFocusSoundPool alloc], "initWithSystemSoundID:", 1125);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_focusSoundPools, "setObject:forKeyedSubscript:", v7, &unk_1E1A97B60);

    v8 = -[_UIFocusSoundPool initWithSystemSoundID:]([_UIFocusSoundPool alloc], "initWithSystemSoundID:", 1127);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_focusSoundPools, "setObject:forKeyedSubscript:", v8, &unk_1E1A97B78);

    v9 = -[_UIFocusSoundPool initWithSystemSoundID:]([_UIFocusSoundPool alloc], "initWithSystemSoundID:", 1126);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_focusSoundPools, "setObject:forKeyedSubscript:", v9, &unk_1E1A97B90);

    v10 = -[_UIFocusSoundPool initWithSystemSoundID:]([_UIFocusSoundPool alloc], "initWithSystemSoundID:", 1124);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_focusSoundPools, "setObject:forKeyedSubscript:", v10, &unk_1E1A97BA8);

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.UIKit.FocusSounds", v11);
    soundQueue = v2->_soundQueue;
    v2->_soundQueue = (OS_dispatch_queue *)v12;

    -[_UIDefaultFocusSoundPlayer _registerForSystemSoundsIfNecessary](v2, "_registerForSystemSoundsIfNecessary");
  }
  return v2;
}

- (void)_registerForSystemSoundsIfNecessary
{
  NSTimer *unregisterTimer;
  void *v4;
  void *v5;
  NSTimer *v6;
  NSTimer *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;

  unregisterTimer = self->_unregisterTimer;
  if (unregisterTimer)
  {
    -[NSTimer invalidate](unregisterTimer, "invalidate");
    v4 = self->_unregisterTimer;
    self->_unregisterTimer = 0;
  }
  else
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_registerForSystemSounds:", self);
  }

  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x1E0C99E88];
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __65___UIDefaultFocusSoundPlayer__registerForSystemSoundsIfNecessary__block_invoke;
  v12 = &unk_1E16B26E0;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v5, "timerWithTimeInterval:repeats:block:", 0, &v9, 10.0);
  v6 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  v7 = self->_unregisterTimer;
  self->_unregisterTimer = v6;

  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop", v9, v10, v11, v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addTimer:forMode:", self->_unregisterTimer, *MEMORY[0x1E0C99860]);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

+ (id)sharedInstance
{
  if (_MergedGlobals_1044 != -1)
    dispatch_once(&_MergedGlobals_1044, &__block_literal_global_209);
  return (id)qword_1ECD7DB90;
}

- (void)dealloc
{
  NSTimer *unregisterTimer;
  NSTimer *v4;
  void *v5;
  objc_super v6;

  unregisterTimer = self->_unregisterTimer;
  if (unregisterTimer)
  {
    -[NSTimer invalidate](unregisterTimer, "invalidate");
    v4 = self->_unregisterTimer;
    self->_unregisterTimer = 0;

  }
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_unregisterForSystemSounds:", self);

  v6.receiver = self;
  v6.super_class = (Class)_UIDefaultFocusSoundPlayer;
  -[_UIDefaultFocusSoundPlayer dealloc](&v6, sel_dealloc);
}

- (void)playSoundWithURL:(id)a3 volume:(double)a4 pan:(double)a5
{
  id v9;
  _UIFocusSoundPool *v10;
  void *v11;
  id v12;

  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusSoundGenerator.m"), 368, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("url"));

    v9 = 0;
  }
  if (fabs(a4) >= 2.22044605e-16)
  {
    v12 = v9;
    -[NSMutableDictionary objectForKeyedSubscript:](self->_urlPools, "objectForKeyedSubscript:", v9);
    v10 = (_UIFocusSoundPool *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v10 = -[_UIFocusSoundPool initWithSoundFileURL:]([_UIFocusSoundPool alloc], "initWithSoundFileURL:", v12);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_urlPools, "setObject:forKeyedSubscript:", v10, v12);
    }
    -[_UIDefaultFocusSoundPlayer _playSystemSound:behavior:withVolume:pan:](self, "_playSystemSound:behavior:withVolume:pan:", -[_UIFocusSoundPool playableSystemSoundID](v10, "playableSystemSoundID"), -[_UIFocusSoundPool originalSystemSoundID](v10, "originalSystemSoundID"), a4, a5);

    v9 = v12;
  }

}

- (void)playSoundWithFocusSound:(int64_t)a3 volume:(double)a4 pan:(double)a5
{
  NSMutableDictionary *focusSoundPools;
  void *v9;
  id v10;

  if (a3)
  {
    if (fabs(a4) >= 2.22044605e-16)
    {
      focusSoundPools = self->_focusSoundPools;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](focusSoundPools, "objectForKeyedSubscript:", v9);
      v10 = (id)objc_claimAutoreleasedReturnValue();

      -[_UIDefaultFocusSoundPlayer _playSystemSound:behavior:withVolume:pan:](self, "_playSystemSound:behavior:withVolume:pan:", objc_msgSend(v10, "playableSystemSoundID"), objc_msgSend(v10, "originalSystemSoundID"), a4, a5);
    }
  }
}

- (void)_playSystemSound:(unsigned int)a3 behavior:(unsigned int)a4 withVolume:(double)a5 pan:(double)a6
{
  void *v11;
  int v12;
  NSObject *soundQueue;
  _QWORD block[6];
  unsigned int v15;
  unsigned int v16;

  -[_UIDefaultFocusSoundPlayer _registerForSystemSoundsIfNecessary](self, "_registerForSystemSoundsIfNecessary");
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "_isSystemSoundEnabled");

  if (v12)
  {
    soundQueue = self->_soundQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71___UIDefaultFocusSoundPlayer__playSystemSound_behavior_withVolume_pan___block_invoke;
    block[3] = &__block_descriptor_56_e5_v8__0l;
    *(double *)&block[4] = a5;
    *(double *)&block[5] = a6;
    v15 = a4;
    v16 = a3;
    dispatch_async(soundQueue, block);
  }
}

- (NSMutableDictionary)urlPools
{
  return self->_urlPools;
}

- (void)setUrlPools:(id)a3
{
  objc_storeStrong((id *)&self->_urlPools, a3);
}

- (NSMutableDictionary)focusSoundPools
{
  return self->_focusSoundPools;
}

- (void)setFocusSoundPools:(id)a3
{
  objc_storeStrong((id *)&self->_focusSoundPools, a3);
}

- (OS_dispatch_queue)soundQueue
{
  return self->_soundQueue;
}

- (void)setSoundQueue:(id)a3
{
  objc_storeStrong((id *)&self->_soundQueue, a3);
}

- (NSTimer)unregisterTimer
{
  return self->_unregisterTimer;
}

- (void)setUnregisterTimer:(id)a3
{
  objc_storeStrong((id *)&self->_unregisterTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unregisterTimer, 0);
  objc_storeStrong((id *)&self->_soundQueue, 0);
  objc_storeStrong((id *)&self->_focusSoundPools, 0);
  objc_storeStrong((id *)&self->_urlPools, 0);
}

@end
