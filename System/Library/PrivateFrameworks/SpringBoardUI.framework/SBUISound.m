@implementation SBUISound

- (SBUISound)initWithSystemSoundID:(unsigned int)a3 behavior:(unint64_t)a4 vibrationPattern:(id)a5
{
  uint64_t v6;
  id v8;
  SBUISound *v9;
  SBUISound *v10;
  objc_super v12;

  v6 = *(_QWORD *)&a3;
  v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)SBUISound;
  v9 = -[SBUISound init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    -[SBUISound setSoundType:](v9, "setSoundType:", 0);
    -[SBUISound setSystemSoundID:](v10, "setSystemSoundID:", v6);
    -[SBUISound setSoundBehavior:](v10, "setSoundBehavior:", a4);
    -[SBUISound setVibrationPattern:](v10, "setVibrationPattern:", v8);
  }

  return v10;
}

- (SBUISound)initWithSystemSoundPath:(id)a3 behavior:(unint64_t)a4 vibrationPattern:(id)a5
{
  id v8;
  id v9;
  SBUISound *v10;
  SBUISound *v11;
  objc_super v13;

  v8 = a3;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)SBUISound;
  v10 = -[SBUISound init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    -[SBUISound setSoundType:](v10, "setSoundType:", 0);
    -[SBUISound setSongPath:](v11, "setSongPath:", v8);
    -[SBUISound setSoundBehavior:](v11, "setSoundBehavior:", a4);
    -[SBUISound setVibrationPattern:](v11, "setVibrationPattern:", v9);
  }

  return v11;
}

- (SBUISound)initWithToneAlert:(int64_t)a3 accountIdentifier:(id)a4 toneIdentifier:(id)a5 vibrationIdentifier:(id)a6
{
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  SBUISound *v15;

  v10 = (objc_class *)MEMORY[0x24BEB8CA8];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = (void *)objc_msgSend([v10 alloc], "initWithType:", a3);
  objc_msgSend(v14, "setTopic:", v13);

  objc_msgSend(v14, "setToneIdentifier:", v12);
  objc_msgSend(v14, "setVibrationIdentifier:", v11);

  v15 = -[SBUISound initWithToneAlertConfiguration:](self, "initWithToneAlertConfiguration:", v14);
  return v15;
}

- (SBUISound)initWithToneAlertConfiguration:(id)a3
{
  void *v4;
  SBUISound *v5;

  objc_msgSend(MEMORY[0x24BEB8CA0], "alertWithConfiguration:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SBUISound initWithToneAlert:](self, "initWithToneAlert:", v4);

  return v5;
}

- (SBUISound)initWithToneAlert:(id)a3
{
  id v4;
  SBUISound *v5;
  SBUISound *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBUISound;
  v5 = -[SBUISound init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[SBUISound setSoundType:](v5, "setSoundType:", 3);
    -[SBUISound setToneAlert:](v6, "setToneAlert:", v4);
  }

  return v6;
}

- (SBUISound)initWithFeedbackEventType:(int64_t)a3
{
  SBUISound *v4;
  SBUISound *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBUISound;
  v4 = -[SBUISound init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    -[SBUISound setSoundType:](v4, "setSoundType:", 5);
    -[SBUISound setEventType:](v5, "setEventType:", a3);
  }
  return v5;
}

+ (id)soundWithFeedbackEventType:(int64_t)a3
{
  return -[SBUISound initWithFeedbackEventType:]([SBUISound alloc], "initWithFeedbackEventType:", a3);
}

- (BOOL)isPlaying
{
  void *v3;

  -[objc_class sharedInstance](NSClassFromString(CFSTR("SBSoundController")), "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v3, "isPlaying:", self);

  return (char)self;
}

- (BOOL)playInEvironments:(int64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  -[objc_class sharedInstance](NSClassFromString(CFSTR("SBSoundController")), "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v7, "playSound:environments:completion:", self, a3, v6);

  return a3;
}

- (void)stop
{
  id v3;

  -[objc_class sharedInstance](NSClassFromString(CFSTR("SBSoundController")), "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopSound:", self);

}

- (id)_completionBlock
{
  return (id)objc_msgSend(self->_completionBlock, "copy");
}

- (void)_setCompletionBlock:(id)a3
{
  void *v4;
  id completionBlock;

  if (self->_completionBlock != a3)
  {
    v4 = (void *)objc_msgSend(a3, "copy");
    completionBlock = self->_completionBlock;
    self->_completionBlock = v4;

  }
}

- (id)description
{
  void *v3;
  const __CFString *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  switch(-[SBUISound soundType](self, "soundType"))
  {
    case 0:
      v3 = (void *)MEMORY[0x24BDD17C8];
      if (self->_completionBlock)
        v4 = CFSTR("YES");
      else
        v4 = CFSTR("NO");
      v5 = -[SBUISound systemSoundID](self, "systemSoundID");
      -[SBUISound songPath](self, "songPath");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[SBUISound soundBehavior](self, "soundBehavior");
      -[SBUISound vibrationPattern](self, "vibrationPattern");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stringWithFormat:", CFSTR("\n   hasCompletionBlock: %@\n   SoundID: %lu\n   Path: %@\n Behavior: %lu\n   Vibration Pattern: %@"), v4, v5, v6, v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = CFSTR("SystemSound");
      break;
    case 1:
      v9 = 0;
      v10 = CFSTR("Ringtone (deprecated)");
      break;
    case 2:
      v9 = 0;
      v10 = CFSTR("AVItem (deprecated)");
      break;
    case 3:
      v11 = (void *)MEMORY[0x24BDD17C8];
      if (self->_completionBlock)
        v12 = CFSTR("YES");
      else
        v12 = CFSTR("NO");
      -[SBUISound toneAlert](self, "toneAlert");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("\n   hasCompletionBlock: %@\n    Tone Alert: %@\n"), v12, v13);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = CFSTR("ToneAlert");
      break;
    case 4:
      v9 = 0;
      v10 = CFSTR("Song (deprecated)");
      break;
    case 5:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\n   eventType: %ld"), self->_eventType);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("Feedback");
      break;
    default:
      v10 = 0;
      v9 = 0;
      break;
  }
  v17.receiver = self;
  v17.super_class = (Class)SBUISound;
  -[SBUISound description](&v17, sel_description);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringByAppendingFormat:", CFSTR("\n{  SoundType: %@%@\n}"), v10, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (int64_t)soundType
{
  return self->_soundType;
}

- (void)setSoundType:(int64_t)a3
{
  self->_soundType = a3;
}

- (unsigned)systemSoundID
{
  return self->_systemSoundID;
}

- (void)setSystemSoundID:(unsigned int)a3
{
  self->_systemSoundID = a3;
}

- (unsigned)_resolvedSystemSoundID
{
  return self->_resolvedSystemSoundID;
}

- (void)_setResolvedSoundID:(unsigned int)a3
{
  self->_resolvedSystemSoundID = a3;
}

- (unint64_t)soundBehavior
{
  return self->_soundBehavior;
}

- (void)setSoundBehavior:(unint64_t)a3
{
  self->_soundBehavior = a3;
}

- (NSDictionary)vibrationPattern
{
  return self->_vibrationPattern;
}

- (void)setVibrationPattern:(id)a3
{
  objc_storeStrong((id *)&self->_vibrationPattern, a3);
}

- (TLAlert)toneAlert
{
  return self->_toneAlert;
}

- (void)setToneAlert:(id)a3
{
  objc_storeStrong((id *)&self->_toneAlert, a3);
}

- (NSString)songPath
{
  return self->_songPath;
}

- (void)setSongPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(int64_t)a3
{
  self->_eventType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_songPath, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_toneAlert, 0);
  objc_storeStrong((id *)&self->_vibrationPattern, 0);
}

@end
