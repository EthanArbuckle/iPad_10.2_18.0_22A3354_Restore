@implementation _UIFeedback

- (_UIFeedbackPlayer)_player
{
  return self->_player;
}

- (_UIFeedbackParameters)hapticParameters
{
  return self->_hapticParameters;
}

- (_UIFeedback)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  _UIFeedback *v5;
  void *v6;
  uint64_t v7;
  _UIFeedbackParameters *audioParameters;
  void *v9;
  uint64_t v10;
  _UIFeedbackParameters *hapticParameters;
  void *v12;
  double v13;
  void *v14;
  uint64_t v15;
  NSString *name;
  _UIFeedback *v17;

  v4 = a3;
  v5 = -[_UIFeedback init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioParameters"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "_parametersClass")), "initWithDictionaryRepresentation:feedback:", v6, v5);
      audioParameters = v5->_audioParameters;
      v5->_audioParameters = (_UIFeedbackParameters *)v7;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hapticParameters"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "_parametersClass")), "initWithDictionaryRepresentation:feedback:", v9, v5);
      hapticParameters = v5->_hapticParameters;
      v5->_hapticParameters = (_UIFeedbackParameters *)v10;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("delay"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    v5->_delay = v13;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");
    name = v5->_name;
    v5->_name = (NSString *)v15;

    v17 = v5;
  }

  return v5;
}

- (_UIFeedback)init
{
  _UIFeedback *v2;
  uint64_t v3;
  _UIFeedbackParameters *audioParameters;
  uint64_t v5;
  _UIFeedbackParameters *hapticParameters;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIFeedback;
  v2 = -[_UIFeedback init](&v8, sel_init);
  v3 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "_parametersClass")), "initWithFeedback:", v2);
  audioParameters = v2->_audioParameters;
  v2->_audioParameters = (_UIFeedbackParameters *)v3;

  v5 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "_parametersClass")), "initWithFeedback:", v2);
  hapticParameters = v2->_hapticParameters;
  v2->_hapticParameters = (_UIFeedbackParameters *)v5;

  *(int64x2_t *)&v2->_audioOutputMode = vdupq_n_s64(1uLL);
  v2->_peripheralOutputMode = 1;
  v2->_position = 0.0;
  v2->_location = (CGPoint)_UICGPointNull_0;
  return v2;
}

+ (Class)_parametersClass
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id WeakRetained;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = -[_UIFeedbackParameters copy](self->_audioParameters, "copy");
  v6 = (void *)*((_QWORD *)v4 + 2);
  *((_QWORD *)v4 + 2) = v5;

  objc_msgSend(*((id *)v4 + 2), "setFeedback:", v4);
  v7 = -[_UIFeedbackParameters copy](self->_hapticParameters, "copy");
  v8 = (void *)*((_QWORD *)v4 + 3);
  *((_QWORD *)v4 + 3) = v7;

  objc_msgSend(*((id *)v4 + 3), "setFeedback:", v4);
  *((_DWORD *)v4 + 3) = LODWORD(self->_position);
  *((_QWORD *)v4 + 12) = *(_QWORD *)&self->_delay;
  v9 = -[NSString copy](self->_name, "copy");
  v10 = (void *)*((_QWORD *)v4 + 9);
  *((_QWORD *)v4 + 9) = v9;

  *((_QWORD *)v4 + 4) = self->_audioOutputMode;
  *((_QWORD *)v4 + 5) = self->_hapticOutputMode;
  *((_QWORD *)v4 + 6) = self->_peripheralOutputMode;
  v11 = -[NSString copy](self->_category, "copy");
  v12 = (void *)*((_QWORD *)v4 + 10);
  *((_QWORD *)v4 + 10) = v11;

  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_storeWeak((id *)v4 + 11, WeakRetained);

  *((_OWORD *)v4 + 7) = self->_location;
  return v4;
}

- (unint64_t)_effectiveEnabledFeedbackTypes
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  _UIFeedbackPattern **p_parentPattern;
  id WeakRetained;
  id v14;

  +[_UIFeedbackPreferences sharedPreferences](_UIFeedbackPreferences, "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "enabledFeedbackTypesForCategory:", self->_category);

  v5 = -[_UIFeedback audioOutputMode](self, "audioOutputMode") & 1;
  v6 = v5 & 0xFFFFFFFFFFFFFFFDLL | (2 * (-[_UIFeedback hapticOutputMode](self, "hapticOutputMode") & 1));
  if ((-[_UIFeedback peripheralOutputMode](self, "peripheralOutputMode") & 1) != 0)
    v6 |= 0xCuLL;
  if ((~-[_UIFeedback audioOutputMode](self, "audioOutputMode") & 3) != 0)
    v7 = v4 | 0xE;
  else
    v7 = -1;
  v8 = v6 & v7;
  if ((~-[_UIFeedback hapticOutputMode](self, "hapticOutputMode") & 3) != 0)
    v9 = v8 & 0xFFFFFFFFFFFFFFFDLL | v4 & 2u & v6;
  else
    v9 = v8;
  if ((~-[_UIFeedback peripheralOutputMode](self, "peripheralOutputMode") & 3) != 0)
    v10 = v4 | 0xFFFFFFFFFFFFFFF3;
  else
    v10 = -1;
  v11 = v9 & v10;
  p_parentPattern = &self->_parentPattern;
  WeakRetained = objc_loadWeakRetained((id *)p_parentPattern);

  if (WeakRetained)
  {
    v14 = objc_loadWeakRetained((id *)p_parentPattern);
    v11 |= objc_msgSend(v14, "_effectiveEnabledFeedbackTypes");

  }
  return v11;
}

- (int64_t)hapticOutputMode
{
  return self->_hapticOutputMode;
}

- (int64_t)peripheralOutputMode
{
  return self->_peripheralOutputMode;
}

- (int64_t)audioOutputMode
{
  return self->_audioOutputMode;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)_UIFeedback;
  -[_UIFeedback dealloc](&v2, sel_dealloc);
}

- (void)_setPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_player, a3);
}

- (void)_playedAtTime:(double)a3 engine:(id)a4
{
  id v6;
  unint64_t v7;
  NSObject *v8;
  void *v9;
  _UIFeedback *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (!_UIFeedbackLoggingDisabled)
  {
    v7 = _playedAtTime_engine____s_category;
    if (!_playedAtTime_engine____s_category)
    {
      v7 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v7, (unint64_t *)&_playedAtTime_engine____s_category);
    }
    v8 = *(NSObject **)(v7 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)MEMORY[0x1E0CB3940];
      v10 = self;
      v11 = v8;
      objc_msgSend(v9, "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v10), v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = (void *)MEMORY[0x1E0CB3940];
      v14 = v6;
      v15 = v12;
      objc_msgSend(v13, "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v14), v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138412802;
      v18 = v12;
      v19 = 2112;
      v20 = v16;
      v21 = 2048;
      v22 = a3;
      _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_DEFAULT, "played feedback %@ with engine %@ at time %f", buf, 0x20u);

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_player, 0);
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_debugDictionary, 0);
  objc_destroyWeak((id *)&self->_parentPattern);
  objc_storeStrong((id *)&self->_hapticParameters, 0);
  objc_storeStrong((id *)&self->_audioParameters, 0);
}

- (void)_setView:(id)a3
{
  objc_storeWeak((id *)&self->_view, a3);
}

- (void)_setLocation:(CGPoint)a3
{
  self->_location = a3;
}

+ (_UIFeedback)feedbackWithDictionaryRepresentation:(id)a3
{
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v10;
  void *v11;

  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIFeedback.m"), 461, CFSTR("No type found in %@"), v5);

  }
  v7 = (objc_class *)objc_msgSend((id)objc_opt_class(), "classForType:", v6);
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIFeedback.m"), 463, CFSTR("No class found for type %@"), v6);

  }
  v8 = (void *)objc_msgSend([v7 alloc], "initWithDictionaryRepresentation:", v5);

  return (_UIFeedback *)v8;
}

+ (Class)classForType:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("discrete")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("continuous")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("pattern")) & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", CFSTR("custom")))
  {
    objc_opt_class();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (Class)v4;
}

- (NSArray)_effectiveFeedbackData
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v16;
  id obj;
  uint64_t v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[_UIFeedback _individualFeedbacks](self, "_individualFeedbacks");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v16, "count"));
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[_UIFeedback _individualFeedbacks](self, "_individualFeedbacks");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v3)
  {
    v4 = v3;
    v18 = *(_QWORD *)v21;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v5);
        v7 = (void *)objc_opt_new();
        objc_msgSend(v7, "_setEffectiveEventType:", objc_msgSend(v6, "_effectiveEventType"));
        objc_msgSend(v6, "_effectiveDuration");
        objc_msgSend(v7, "_setEffectiveDuration:");
        objc_msgSend(v6, "_effectiveDelay");
        objc_msgSend(v7, "_setEffectiveDelay:");
        objc_msgSend(v6, "hapticParameters");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "_setHapticParameters:", v8);

        objc_msgSend(v6, "audioParameters");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "_setAudioParameters:", v9);

        objc_msgSend(v7, "_setEffectiveEnabledFeedbackTypes:", objc_msgSend(v6, "_effectiveEnabledFeedbackTypes"));
        objc_msgSend(v7, "_setEffectiveSystemSoundID:", objc_msgSend(v6, "_effectiveSystemSoundID"));
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v6, "pattern");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "_setPattern:", v10);

        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v6, "hidRequest");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "_setHIDRequest:", v11);

        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v6, "fileURL");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "_setFileURL:", v12);

          objc_msgSend(v7, "_setFileFeedbackType:", objc_msgSend(v6, "_effectivePlayableFeedbackTypes"));
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v7, "_setIsTransientHaptic:", 1);
          objc_msgSend(v6, "intensity");
          objc_msgSend(v7, "_setIntensity:");
          objc_msgSend(v6, "sharpness");
          objc_msgSend(v7, "_setSharpness:");
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v13 = objc_msgSend(v6, "canReuseCoreHapticsPlayer");
        else
          v13 = 0;
        objc_msgSend(v7, "_setCanReuseCoreHapticsPlayer:", v13);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v14 = objc_msgSend(v6, "disableEventUseVolumeEnvelope");
        else
          v14 = 0;
        objc_msgSend(v7, "_setDisableEventUseVolumeEnvelope:", v14);
        objc_msgSend(v19, "addObject:", v7);

        ++v5;
      }
      while (v4 != v5);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v4);
  }

  return (NSArray *)v19;
}

- (NSArray)_individualFeedbacks
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)_effectivePlayableFeedbackTypes
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unsigned int v7;
  unint64_t v8;
  uint64_t v10;
  unint64_t v11;

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_feedbackSupportLevel");

  v5 = -[_UIFeedback _effectiveEventType](self, "_effectiveEventType");
  if (v4 < 2 || v5 == 0)
  {
    v7 = -[_UIFeedback _effectiveSystemSoundID](self, "_effectiveSystemSoundID");
    v8 = 3;
    if (v4 < 1)
      v8 = 1;
    if (v7 == _UISystemSoundIDNone)
      return 0;
    else
      return v8;
  }
  else
  {
    v10 = 2;
    if (v5 < 0x55uLL)
      v10 = 3;
    if (v5 < 0x2DuLL)
      v11 = 1;
    else
      v11 = v10;
    if (v5 == 32556)
      return 3;
    else
      return v11;
  }
}

- (unint64_t)_effectiveFeedbackTypes
{
  unint64_t v3;

  v3 = -[_UIFeedback _effectiveEnabledFeedbackTypes](self, "_effectiveEnabledFeedbackTypes");
  return -[_UIFeedback _effectivePlayableFeedbackTypes](self, "_effectivePlayableFeedbackTypes") & v3;
}

- (_UIFeedbackParameters)audioParameters
{
  return self->_audioParameters;
}

- (void)play
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  unint64_t v8;
  NSObject *v9;
  void *v10;
  _UIFeedback *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  double v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  +[_UIFeedbackEngine engineForFeedback:](_UIFeedbackEngine, "engineForFeedback:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "currentTime");
    v6 = v5;
    -[_UIFeedback _effectiveDelay](self, "_effectiveDelay");
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __19___UIFeedback_play__block_invoke;
    v14[3] = &unk_1E16C5630;
    v14[4] = self;
    v16 = v6 + v7;
    v15 = v4;
    objc_msgSend(v15, "_playFeedback:atTime:withCompletionBlock:", self, v14, v16);

  }
  else if (!_UIFeedbackLoggingDisabled)
  {
    v8 = play___s_category;
    if (!play___s_category)
    {
      v8 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v8, (unint64_t *)&play___s_category);
    }
    v9 = *(NSObject **)(v8 + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      v11 = self;
      v12 = v9;
      objc_msgSend(v10, "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v11), v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138412290;
      v18 = v13;
      _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_DEFAULT, "no engine for feedback %@, dropping it", buf, 0xCu);

    }
  }

}

- (double)_effectiveDelay
{
  double delay;
  _UIFeedbackPattern **p_parentPattern;
  id WeakRetained;
  id v5;
  double v6;

  delay = self->_delay;
  p_parentPattern = &self->_parentPattern;
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentPattern);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_parentPattern);
    objc_msgSend(v5, "_effectiveDelay");
    delay = delay + v6;

  }
  return delay;
}

- (double)_effectiveDuration
{
  return 0.0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)type
{
  return 0;
}

- (_UIFeedback)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _UIFeedback *v9;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("dictionaryRepresentation"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[_UIFeedback feedbackWithDictionaryRepresentation:](_UIFeedback, "feedbackWithDictionaryRepresentation:", v8);
  v9 = (_UIFeedback *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UIFeedback dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("dictionaryRepresentation"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;
  float *v7;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v7 = (float *)v4;
    v6 = -[_UIFeedbackParameters isEqual:](self->_audioParameters, "isEqual:", *((_QWORD *)v7 + 2))
      && -[_UIFeedbackParameters isEqual:](self->_hapticParameters, "isEqual:", *((_QWORD *)v7 + 3))
      && self->_position == v7[3]
      && self->_delay == *((double *)v7 + 12);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *name;
  _QWORD v11[4];
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("type");
  objc_msgSend((id)objc_opt_class(), "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  v11[1] = CFSTR("audioParameters");
  -[_UIFeedbackParameters dictionaryRepresentation](self->_audioParameters, "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v4;
  v11[2] = CFSTR("hapticParameters");
  -[_UIFeedbackParameters dictionaryRepresentation](self->_hapticParameters, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v5;
  v11[3] = CFSTR("delay");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_delay);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  name = self->_name;
  if (name)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", name, CFSTR("name"));
  return (NSDictionary *)v8;
}

- (Protocol)_playableProtocol
{
  return 0;
}

- (unint64_t)_effectiveEventType
{
  return 0;
}

- (unsigned)_effectiveSystemSoundID
{
  return _UISystemSoundIDNone;
}

- (NSIndexSet)_allEventTypes
{
  if (-[_UIFeedback _effectiveEventType](self, "_effectiveEventType"))
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:");
  else
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
  return (NSIndexSet *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSIndexSet)_allSystemSoundIDs
{
  unsigned int v2;

  v2 = -[_UIFeedback _effectiveSystemSoundID](self, "_effectiveSystemSoundID");
  if (v2 == _UISystemSoundIDNone)
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
  else
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v2);
  return (NSIndexSet *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)_setDelay:(double)a3
{
  self->_delay = a3;
}

- (void)stop
{
  unint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  _UIFeedback *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!_UIFeedbackLoggingDisabled)
  {
    v3 = stop___s_category;
    if (!stop___s_category)
    {
      v3 = __UILogCategoryGetNode("FeedbackDebug", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v3, (unint64_t *)&stop___s_category);
    }
    if ((*(_BYTE *)v3 & 1) != 0)
    {
      v6 = *(NSObject **)(v3 + 8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v9 = self;
        _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "stop feedback %@", buf, 0xCu);
      }
    }
  }
  -[_UIFeedback _player](self, "_player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_UIFeedback _player](self, "_player");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_stopFeedback:", self);
  }
  else
  {
    +[_UIFeedbackEngine engineForFeedback:](_UIFeedbackEngine, "engineForFeedback:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __19___UIFeedback_stop__block_invoke;
    v7[3] = &unk_1E16C5658;
    v7[4] = self;
    objc_msgSend(v5, "_dequeueReusableFeedbackPlayerWithCompletionBlock:", v7);
  }

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFeedback _player](self, "_player");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p; player: %p; delay: %.3f"),
    v5,
    self,
    v6,
    *(_QWORD *)&self->_delay);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_name)
    objc_msgSend(v7, "appendFormat:", CFSTR("; name: %@"), self->_name);
  -[_UIFeedback _debugDictionary](self, "_debugDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __26___UIFeedback_description__block_invoke;
  v11[3] = &unk_1E16B4FF0;
  v9 = v7;
  v12 = v9;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v11);

  objc_msgSend(v9, "appendString:", CFSTR(">"));
  return v9;
}

- (void)setAudioOutputMode:(int64_t)a3
{
  self->_audioOutputMode = a3;
}

- (void)setHapticOutputMode:(int64_t)a3
{
  self->_hapticOutputMode = a3;
}

- (void)setPeripheralOutputMode:(int64_t)a3
{
  self->_peripheralOutputMode = a3;
}

- (float)position
{
  return self->_position;
}

- (void)setPosition:(float)a3
{
  self->_position = a3;
}

- (BOOL)isPlaying
{
  return self->_playing;
}

- (_UIFeedbackPattern)_parentPattern
{
  return (_UIFeedbackPattern *)objc_loadWeakRetained((id *)&self->_parentPattern);
}

- (void)_setParentPattern:(id)a3
{
  objc_storeWeak((id *)&self->_parentPattern, a3);
}

- (NSDictionary)_debugDictionary
{
  return self->_debugDictionary;
}

- (NSString)_name
{
  return self->_name;
}

- (void)_setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)_category
{
  return self->_category;
}

- (void)_setCategory:(id)a3
{
  objc_storeStrong((id *)&self->_category, a3);
}

- (UIView)_view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (CGPoint)_location
{
  double x;
  double y;
  CGPoint result;

  x = self->_location.x;
  y = self->_location.y;
  result.y = y;
  result.x = x;
  return result;
}

- (double)_delay
{
  return self->_delay;
}

- (NSMutableArray)systemSoundSources
{
  void *v3;

  objc_getAssociatedObject(self, &_UIFeedbackSystemSoundEngineSourcesKey);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(self, &_UIFeedbackSystemSoundEngineSourcesKey, v3, (void *)1);
  }
  return (NSMutableArray *)v3;
}

- (NSMutableArray)visualizerSources
{
  void *v3;

  objc_getAssociatedObject(self, &_UIFeedbackVisualizerSourcesKey);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(self, &_UIFeedbackVisualizerSourcesKey, v3, (void *)1);
  }
  return (NSMutableArray *)v3;
}

@end
