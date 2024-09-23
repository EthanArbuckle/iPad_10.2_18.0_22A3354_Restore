@implementation _UIFeedbackPattern

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)type
{
  return CFSTR("pattern");
}

+ (id)feedbackPattern
{
  return objc_alloc_init((Class)a1);
}

+ (Class)_parametersClass
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)_UIFeedbackPattern;
  v4 = -[_UIFeedback copyWithZone:](&v16, sel_copyWithZone_, a3);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[_UIFeedbackPattern feedbacks](self, "feedbacks", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v10, "_delay");
        objc_msgSend(v4, "addFeedback:atTime:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v7);
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIFeedbackPattern;
  if (-[_UIFeedback isEqual:](&v7, sel_isEqual_, v4))
    v5 = -[NSMutableArray isEqual:](self->_feedbacks, "isEqual:", v4[18]);
  else
    v5 = 0;

  return v5;
}

- (_UIFeedbackPattern)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  _UIFeedbackPattern *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _UIFeedbackPattern *v20;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)_UIFeedbackPattern;
  v5 = -[_UIFeedback initWithDictionaryRepresentation:](&v27, sel_initWithDictionaryRepresentation_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("duration"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v5->_duration = v7;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v22 = v4;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("feedbacks"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v24;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v24 != v12)
            objc_enumerationMutation(v9);
          +[_UIFeedback feedbackWithDictionaryRepresentation:](_UIFeedback, "feedbackWithDictionaryRepresentation:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v13));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            -[_UIFeedback audioParameters](v5, "audioParameters");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "audioParameters");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setParentParameters:", v15);

            -[_UIFeedback hapticParameters](v5, "hapticParameters");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "hapticParameters");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setParentParameters:", v17);

            objc_msgSend(v8, "addObject:", v14);
          }

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v11);
    }

    -[_UIFeedbackPattern setFeedbacks:](v5, "setFeedbacks:", v8);
    v4 = v22;
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("canReuseCoreHapticsPlayer"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_canReuseCoreHapticsPlayer = objc_msgSend(v19, "BOOLValue");

    v20 = v5;
  }

  return v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)_UIFeedbackPattern;
  -[_UIFeedback dictionaryRepresentation](&v19, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_duration);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("duration"));

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[_UIFeedbackPattern feedbacks](self, "feedbacks", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11), "dictionaryRepresentation");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v9);
  }

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("feedbacks"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_canReuseCoreHapticsPlayer);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("canReuseCoreHapticsPlayer"));

  return v4;
}

- (id)_playableProtocol
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_duration <= 0.0)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[_UIFeedbackPattern feedbacks](self, "feedbacks", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "_playableProtocol");
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          if (v8 == &unk_1EDF1A2E8)
          {
            v10 = &unk_1EDF1A2E8;

            return v10;
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v5)
          continue;
        break;
      }
    }

    v2 = &unk_1EDF1A0F0;
  }
  else
  {
    v2 = &unk_1EDF1A2E8;
  }
  return v2;
}

- (NSMutableArray)feedbacks
{
  NSMutableArray *feedbacks;
  NSMutableArray *v4;
  NSMutableArray *v5;

  feedbacks = self->_feedbacks;
  if (!feedbacks)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_feedbacks;
    self->_feedbacks = v4;

    feedbacks = self->_feedbacks;
  }
  return feedbacks;
}

- (void)addFeedback:(id)a3 atTime:(double)a4
{
  _UIFeedbackPattern *v7;
  _UIFeedbackPattern *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _UIFeedbackPattern *v14;

  v7 = (_UIFeedbackPattern *)a3;
  v14 = v7;
  if (v7 == self)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, v14, CFSTR("_UIFeedback.m"), 1281, CFSTR("Cannot add a feedback pattern to itself."));
  }
  else
  {
    v8 = (_UIFeedbackPattern *)-[_UIFeedbackPattern copy](v7, "copy");

    -[_UIFeedback audioParameters](self, "audioParameters");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFeedback audioParameters](v8, "audioParameters");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setParentParameters:", v9);

    -[_UIFeedback hapticParameters](self, "hapticParameters");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFeedback hapticParameters](v8, "hapticParameters");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setParentParameters:", v11);

    -[_UIFeedback _setParentPattern:](v8, "_setParentPattern:", self);
    -[_UIFeedback _setDelay:](v8, "_setDelay:", a4);
    -[_UIFeedbackPattern feedbacks](self, "feedbacks");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v8);
    v14 = v8;
  }

}

- (unint64_t)_effectivePlayableFeedbackTypes
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_feedbacks;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 |= objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "_effectivePlayableFeedbackTypes", (_QWORD)v9);
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_individualFeedbacks
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableArray count](self->_feedbacks, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_feedbacks;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "_individualFeedbacks", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)_allEventTypes
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_feedbacks;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "_allEventTypes", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addIndexes:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)_allSystemSoundIDs
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_feedbacks;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "_allSystemSoundIDs", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addIndexes:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)play
{
  void *v3;

  if (self->_duration > 0.0)
  {
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__playPattern, 0, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFeedbackPattern setRepeatTimer:](self, "setRepeatTimer:", v3);

  }
  -[_UIFeedbackPattern _playPattern](self, "_playPattern");
}

- (void)_playPattern
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  objc_super v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  +[_UIFeedbackEngine engineForFeedback:](_UIFeedbackEngine, "engineForFeedback:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)objc_opt_class(), "_supportsPlayingFeedbackPatternsDirectly"))
  {
    v13.receiver = self;
    v13.super_class = (Class)_UIFeedbackPattern;
    -[_UIFeedback play](&v13, sel_play);
  }
  else
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    -[_UIFeedbackPattern feedbacks](self, "feedbacks", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "play");
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
      }
      while (v6);
    }

  }
}

- (void)stop
{
  NSTimer *repeatTimer;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  repeatTimer = self->_repeatTimer;
  if (repeatTimer)
  {
    -[NSTimer invalidate](repeatTimer, "invalidate");
    -[_UIFeedbackPattern setRepeatTimer:](self, "setRepeatTimer:", 0);
  }
  +[_UIFeedbackEngine engineForFeedback:](_UIFeedbackEngine, "engineForFeedback:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)objc_opt_class(), "_supportsPlayingFeedbackPatternsDirectly"))
  {
    v14.receiver = self;
    v14.super_class = (Class)_UIFeedbackPattern;
    -[_UIFeedback stop](&v14, sel_stop);
  }
  else
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    -[_UIFeedbackPattern feedbacks](self, "feedbacks", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "stop");
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
      }
      while (v7);
    }

  }
}

- (BOOL)isPlaying
{
  void *v3;
  BOOL v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  +[_UIFeedbackEngine engineForFeedback:](_UIFeedbackEngine, "engineForFeedback:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)objc_opt_class(), "_supportsPlayingFeedbackPatternsDirectly"))
  {
    v15.receiver = self;
    v15.super_class = (Class)_UIFeedbackPattern;
    v4 = -[_UIFeedback isPlaying](&v15, sel_isPlaying);
  }
  else
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[_UIFeedbackPattern feedbacks](self, "feedbacks", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "isPlaying") & 1) != 0)
          {

            v4 = 1;
            goto LABEL_13;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
        if (v7)
          continue;
        break;
      }
    }

    v4 = 0;
  }
LABEL_13:

  return v4;
}

- (void)setPosition:(float)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIFeedbackPattern;
  -[_UIFeedback setPosition:](&v3, sel_setPosition_);
}

- (id)_debugDictionary
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("feedbacks");
  -[_UIFeedbackPattern feedbacks](self, "feedbacks");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setCanReuseCoreHapticsPlayer:(BOOL)a3
{
  self->_canReuseCoreHapticsPlayer = a3;
}

- (BOOL)canReuseCoreHapticsPlayer
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!self->_canReuseCoreHapticsPlayer)
    return 0;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[_UIFeedbackPattern feedbacks](self, "feedbacks", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) == 0 || !objc_msgSend(v7, "canReuseCoreHapticsPlayer"))
        {
          v8 = 0;
          goto LABEL_15;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v8 = 1;
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v8 = 1;
  }
LABEL_15:

  return v8;
}

- (CGPoint)_location
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  CGPoint result;

  -[_UIFeedbackPattern feedbacks](self, "feedbacks");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "_location");
    v5 = v4;
    v7 = v6;
  }
  else
  {
    v5 = 0x7FEFFFFFFFFFFFFFLL;
    v7 = 0x7FEFFFFFFFFFFFFFLL;
  }

  v8 = *(double *)&v5;
  v9 = *(double *)&v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (void)_setLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  y = a3.y;
  x = a3.x;
  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[_UIFeedbackPattern feedbacks](self, "feedbacks", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "_setLocation:", x, y);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (id)_view
{
  void *v2;
  void *v3;
  void *v4;

  -[_UIFeedbackPattern feedbacks](self, "feedbacks");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_setView:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[_UIFeedbackPattern feedbacks](self, "feedbacks", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "_setView:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (BOOL)isHighPriority
{
  return self->_highPriority;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (void)setFeedbacks:(id)a3
{
  objc_storeStrong((id *)&self->_feedbacks, a3);
}

- (BOOL)isRepeating
{
  return self->_isRepeating;
}

- (NSTimer)repeatTimer
{
  return self->_repeatTimer;
}

- (void)setRepeatTimer:(id)a3
{
  objc_storeStrong((id *)&self->_repeatTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_repeatTimer, 0);
  objc_storeStrong((id *)&self->_feedbacks, 0);
}

@end
