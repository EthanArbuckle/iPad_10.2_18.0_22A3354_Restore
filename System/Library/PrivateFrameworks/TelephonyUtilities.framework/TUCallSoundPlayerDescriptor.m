@implementation TUCallSoundPlayerDescriptor

- (TUCallSoundPlayerDescriptor)initWithSoundType:(int64_t)a3 sound:(id)a4 iterations:(unint64_t)a5 pauseDuration:(double)a6 audioPlayingWarmupNeeded:(BOOL)a7
{
  id v13;
  TUCallSoundPlayerDescriptor *v14;
  TUCallSoundPlayerDescriptor *v15;
  objc_super v17;

  v13 = a4;
  v17.receiver = self;
  v17.super_class = (Class)TUCallSoundPlayerDescriptor;
  v14 = -[TUCallSoundPlayerDescriptor init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_soundType = a3;
    objc_storeStrong((id *)&v14->_sound, a4);
    v15->_iterations = a5;
    v15->_pauseDuration = a6;
    v15->_audioPlayingWarmupNeeded = a7;
  }

  return v15;
}

- (TUCallSoundPlayerDescriptor)initWithSoundType:(int64_t)a3 call:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  TUCallSoundPlayerDescriptor *v10;

  v6 = a4;
  objc_msgSend(v6, "provider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isVideo");
  v9 = objc_msgSend(v6, "soundRegion");

  v10 = -[TUCallSoundPlayerDescriptor initWithSoundType:provider:video:region:audioPlayingWarmupNeeded:](self, "initWithSoundType:provider:video:region:audioPlayingWarmupNeeded:", a3, v7, v8, v9, 0);
  return v10;
}

- (TUCallSoundPlayerDescriptor)initWithSoundType:(int64_t)a3 provider:(id)a4 video:(BOOL)a5 region:(int64_t)a6
{
  return -[TUCallSoundPlayerDescriptor initWithSoundType:provider:video:region:audioPlayingWarmupNeeded:](self, "initWithSoundType:provider:video:region:audioPlayingWarmupNeeded:", a3, a4, a5, a6, 0);
}

- (TUCallSoundPlayerDescriptor)initWithSoundType:(int64_t)a3 provider:(id)a4 video:(BOOL)a5 region:(int64_t)a6 audioPlayingWarmupNeeded:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  void *v13;
  double v14;
  void *v15;
  uint64_t v16;
  TUCallSoundPlayerDescriptor *v17;

  v7 = a7;
  v12 = a4;
  v13 = v12;
  v14 = 0.0;
  v15 = &unk_1E38E9298;
  v16 = 1;
  switch(a3)
  {
    case 1:
      v16 = -1;
      if ((objc_msgSend(v12, "isFaceTimeProvider") & 1) == 0)
      {
        v15 = &unk_1E38E9178;
        switch(a6)
        {
          case 0:
          case 1:
            goto LABEL_30;
          case 2:
            v15 = &unk_1E38E9190;
            goto LABEL_30;
          case 3:
            v15 = &unk_1E38E91A8;
            goto LABEL_30;
          case 4:
            v15 = &unk_1E38E91C0;
            goto LABEL_30;
          case 5:
            v15 = &unk_1E38E91D8;
            goto LABEL_30;
          default:
            goto LABEL_34;
        }
      }
      v15 = &unk_1E38E9160;
      goto LABEL_30;
    case 2:
      if ((objc_msgSend(v12, "isFaceTimeProvider") & 1) != 0)
        goto LABEL_9;
      goto LABEL_34;
    case 3:
      if ((objc_msgSend(v12, "isTelephonyProvider") & 1) == 0)
        goto LABEL_34;
      v15 = &unk_1E38E9208;
      v16 = 3;
      goto LABEL_30;
    case 4:
      if (objc_msgSend(v12, "isFaceTimeProvider"))
        v15 = &unk_1E38E9220;
      else
        v15 = &unk_1E38E9238;
      v14 = 3.0;
      goto LABEL_19;
    case 5:
      if (!objc_msgSend(v12, "isFaceTimeProvider") || !a5)
        goto LABEL_34;
      v14 = 3.0;
      v15 = &unk_1E38E9250;
LABEL_19:
      v16 = 2;
      goto LABEL_30;
    case 6:
    case 7:
      if (objc_msgSend(v12, "isFaceTimeProvider"))
        v15 = &unk_1E38E9268;
      else
        v15 = &unk_1E38E9280;
      goto LABEL_29;
    case 8:
      goto LABEL_30;
    case 9:
      v15 = &unk_1E38E92B0;
      goto LABEL_29;
    case 10:
      v15 = &unk_1E38E92C8;
      goto LABEL_29;
    case 11:
      v15 = &unk_1E38E92E0;
      goto LABEL_29;
    case 12:
      v15 = &unk_1E38E92F8;
      goto LABEL_29;
    case 13:
    case 16:
    case 17:
      v15 = &unk_1E38E9310;
      goto LABEL_29;
    case 15:
LABEL_9:
      v15 = &unk_1E38E91F0;
      goto LABEL_29;
    case 18:
      v15 = &unk_1E38E9328;
      goto LABEL_29;
    case 19:
      v15 = &unk_1E38E9340;
      goto LABEL_29;
    case 20:
      v15 = &unk_1E38E9358;
      goto LABEL_29;
    case 21:
      v15 = &unk_1E38E9370;
      goto LABEL_29;
    case 22:
      v15 = &unk_1E38E9388;
LABEL_29:
      v16 = 1;
LABEL_30:
      v17 = -[TUCallSoundPlayerDescriptor initWithSoundType:sound:iterations:pauseDuration:audioPlayingWarmupNeeded:](self, "initWithSoundType:sound:iterations:pauseDuration:audioPlayingWarmupNeeded:", a3, v15, v16, v7, v14);
      break;
    default:
LABEL_34:

      v17 = 0;
      break;
  }

  return v17;
}

- (id)description
{
  __CFString *v3;
  void *v4;
  uint64_t v5;
  int64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  if (-[TUCallSoundPlayerDescriptor iterations](self, "iterations") == -1)
  {
    v3 = CFSTR("Infinite");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), -[TUCallSoundPlayerDescriptor iterations](self, "iterations"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = objc_opt_class();
  v6 = -[TUCallSoundPlayerDescriptor soundType](self, "soundType");
  -[TUCallSoundPlayerDescriptor sound](self, "sound");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallSoundPlayerDescriptor pauseDuration](self, "pauseDuration");
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@ %p soundType=%lu sound=%@ iterations=%@ pauseDuration=%f>"), v5, self, v6, v7, v3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int64_t)soundType
{
  return self->_soundType;
}

- (void)setSoundType:(int64_t)a3
{
  self->_soundType = a3;
}

- (BOOL)audioPlayingWarmupNeeded
{
  return self->_audioPlayingWarmupNeeded;
}

- (void)setAudioPlayingWarmupNeeded:(BOOL)a3
{
  self->_audioPlayingWarmupNeeded = a3;
}

- (NSNumber)sound
{
  return self->_sound;
}

- (void)setSound:(id)a3
{
  objc_storeStrong((id *)&self->_sound, a3);
}

- (unint64_t)iterations
{
  return self->_iterations;
}

- (void)setIterations:(unint64_t)a3
{
  self->_iterations = a3;
}

- (double)pauseDuration
{
  return self->_pauseDuration;
}

- (void)setPauseDuration:(double)a3
{
  self->_pauseDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sound, 0);
}

@end
