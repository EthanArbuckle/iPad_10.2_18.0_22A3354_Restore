@implementation PGPlaybackState

+ (id)keysForEqualityOfNumberValues
{
  if (keysForEqualityOfNumberValues_onceToken != -1)
    dispatch_once(&keysForEqualityOfNumberValues_onceToken, &__block_literal_global_11);
  return (id)keysForEqualityOfNumberValues_keysForEquality;
}

void __48__PGPlaybackState_keysForEqualityOfNumberValues__block_invoke()
{
  void *v0;

  v0 = (void *)keysForEqualityOfNumberValues_keysForEquality;
  keysForEqualityOfNumberValues_keysForEquality = (uint64_t)&unk_1E6242A88;

}

+ (id)defaultValueForKey:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  id result;
  void *v8;

  v5 = objc_msgSend(a3, "integerValue");
  if (v5 > 1001)
  {
    if ((unint64_t)(v5 - 1003) >= 3)
    {
      if (v5 == 1002 || v5 == 2001)
      {
        return (id)MEMORY[0x1E0C9AAB0];
      }
      else
      {
LABEL_10:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PGPlaybackState.m"), 114, CFSTR("No invalid key."));

        return 0;
      }
    }
    else
    {
      return (id)MEMORY[0x1E0C9AAA0];
    }
  }
  else
  {
    v6 = v5 - 1;
    result = 0;
    switch(v6)
    {
      case 0:
      case 1:
      case 3:
      case 5:
        result = &unk_1E62429F8;
        break;
      case 2:
      case 4:
      case 10:
        result = &unk_1E62428D0;
        break;
      case 6:
      case 7:
      case 9:
        return (id)MEMORY[0x1E0C9AAA0];
      case 8:
        return result;
      default:
        goto LABEL_10;
    }
  }
  return result;
}

- (PGPlaybackState)initWithDictionary:(id)a3
{
  id v4;
  PGPlaybackState *v5;
  uint64_t v6;
  NSMutableDictionary *mutableDictionary;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGPlaybackState;
  v5 = -[PGPlaybackState init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "mutableCopy");
    mutableDictionary = v5->_mutableDictionary;
    v5->_mutableDictionary = (NSMutableDictionary *)v6;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PGPlaybackState *v4;
  void *v5;
  PGPlaybackState *v6;

  v4 = [PGPlaybackState alloc];
  -[PGPlaybackState dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PGPlaybackState initWithDictionary:](v4, "initWithDictionary:", v5);

  return v6;
}

- (void)updatePlaybackStateWithDiff:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[PGPlaybackState _ensureMutableDictionary](self, "_ensureMutableDictionary");
    -[PGPlaybackState mutableDictionary](self, "mutableDictionary");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addEntriesFromDictionary:", v4);

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  objc_msgSend(v5, "dictionaryRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGPlaybackState dictionaryRepresentation](self, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToDictionary:", v7);

  return v8;
}

- (BOOL)isEquivalentToPlaybackState:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  uint64_t v19;
  int v20;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PGPlaybackState elapsedTime](self, "elapsedTime");
  v6 = v5;
  objc_msgSend(v4, "elapsedTime");
  v8 = v6 - v7;
  if (v8 >= 0.0)
    v9 = v8;
  else
    v9 = -v8;
  if (v9 < 0.01)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    +[PGPlaybackState keysForEqualityOfNumberValues](PGPlaybackState, "keysForEqualityOfNumberValues", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v28;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v28 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v4, "_numberForKey:", objc_msgSend(v15, "integerValue"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[PGPlaybackState _numberForKey:](self, "_numberForKey:", objc_msgSend(v15, "integerValue"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v16, "isEqualToNumber:", v17);

          if ((v18 & 1) == 0 && v16 != v17)
          {
            LOBYTE(v20) = 0;
            goto LABEL_19;
          }

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v12)
          continue;
        break;
      }
    }

    objc_msgSend(v4, "prerollAttributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGPlaybackState prerollAttributes](self, "prerollAttributes");
    v19 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v19;
    if (v10 == (void *)v19)
    {
      v20 = 1;
      if (!v19)
      {
LABEL_19:

        goto LABEL_20;
      }
    }
    else
    {
      v20 = objc_msgSend(v10, "isEqual:", v19);
      if (!v16)
        goto LABEL_19;
    }
    if (v20)
    {
      -[PGPlaybackState playbackRate](self, "playbackRate");
      if (v22 == 0.0)
      {
        -[PGPlaybackState elapsedTime](self, "elapsedTime");
        v24 = v23;
        objc_msgSend(v16, "requiredLinearPlaybackEndTime");
        v26 = v24 - v25;
        if (v26 < 0.0)
          v26 = -v26;
        LOBYTE(v20) = v26 > 0.01 || v9 == 0.0;
      }
      else
      {
        LOBYTE(v20) = 1;
      }
    }
    goto LABEL_19;
  }
  -[PGPlaybackState elapsedTime](self, "elapsedTime");
  LOBYTE(v20) = 0;
LABEL_20:

  return v20;
}

- (id)diffFromPlaybackState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[PGPlaybackState isEquivalentToPlaybackState:](self, "isEquivalentToPlaybackState:", v4))
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(v4, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (!v8)
    {
      v5 = 0;
      goto LABEL_29;
    }
    v9 = v8;
    v5 = 0;
    v10 = *(_QWORD *)v23;
    v21 = v7;
    while (1)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v11);
        v13 = objc_msgSend(v12, "integerValue");
        v14 = v13;
        if (v13 <= 0xB)
        {
          if (((1 << v13) & 0xDFE) != 0)
            goto LABEL_17;
          if (v13 == 9)
          {
            -[PGPlaybackState mutableDictionary](self, "mutableDictionary");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "objectForKeyedSubscript:", v12);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v4, "mutableDictionary");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "objectForKeyedSubscript:", v12);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if ((objc_msgSend(v16, "isEqual:", v18) & 1) == 0)
            {
              if (!v5)
              {
                objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
                v5 = (void *)objc_claimAutoreleasedReturnValue();
              }
              objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, v12);
            }
            v7 = v21;
LABEL_21:

            goto LABEL_22;
          }
        }
        if (v13 - 1001 < 5 || v13 == 2001)
        {
LABEL_17:
          -[PGPlaybackState _numberForKey:](self, "_numberForKey:", v13);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "_numberForKey:", v14);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v16, "isEqualToNumber:", v18) & 1) == 0)
          {
            if (!v5)
            {
              objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
              v5 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, v12);
          }
          goto LABEL_21;
        }
LABEL_22:
        ++v11;
      }
      while (v9 != v11);
      v19 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      v9 = v19;
      if (!v19)
      {
LABEL_29:

        goto LABEL_30;
      }
    }
  }
  v5 = 0;
LABEL_30:

  return v5;
}

- (double)normalizedProgress
{
  BOOL v3;
  double v4;
  int64_t v5;
  double v6;
  double v7;
  double v8;

  v3 = -[PGPlaybackState hasInvalidTiming](self, "hasInvalidTiming");
  v4 = 1.0;
  if (!v3)
  {
    v5 = -[PGPlaybackState contentType](self, "contentType", 1.0);
    v4 = 1.0;
    if (v5 != 2)
    {
      -[PGPlaybackState elapsedTime](self, "elapsedTime", 1.0);
      v7 = v6;
      -[PGPlaybackState contentDuration](self, "contentDuration");
      v4 = v7 / v8;
    }
  }
  return fmin(fmax(v4, 0.0), 1.0);
}

- (int64_t)contentType
{
  return -[PGPlaybackState _integerForKey:](self, "_integerForKey:", 3);
}

- (double)anchorContentTime
{
  double result;

  -[PGPlaybackState _doubleForKey:](self, "_doubleForKey:", 1);
  return result;
}

- (double)anchorWallTime
{
  double result;

  -[PGPlaybackState _doubleForKey:](self, "_doubleForKey:", 2);
  return result;
}

- (double)elapsedTime
{
  double v3;
  double v4;
  double v5;
  double v6;
  double Current;
  double v8;
  double v9;
  double result;

  -[PGPlaybackState anchorContentTime](self, "anchorContentTime");
  v4 = v3;
  if (-[PGPlaybackState timeControlStatus](self, "timeControlStatus") == 2)
  {
    -[PGPlaybackState playbackRate](self, "playbackRate");
    if (v5 != 0.0)
    {
      v6 = v5;
      Current = CFAbsoluteTimeGetCurrent();
      -[PGPlaybackState anchorWallTime](self, "anchorWallTime");
      v4 = v4 + v6 * (Current - v8);
    }
  }
  v9 = fmax(v4, 0.0);
  -[PGPlaybackState contentDuration](self, "contentDuration");
  if (v9 < result)
    return v9;
  return result;
}

- (double)contentDuration
{
  double result;

  -[PGPlaybackState _doubleForKey:](self, "_doubleForKey:", 4);
  return result;
}

- (int64_t)timeControlStatus
{
  return -[PGPlaybackState _integerForKey:](self, "_integerForKey:", 5);
}

- (double)playbackRate
{
  double result;

  -[PGPlaybackState _doubleForKey:](self, "_doubleForKey:", 6);
  return result;
}

- (BOOL)isMuted
{
  return -[PGPlaybackState _BOOLForKey:](self, "_BOOLForKey:", 7);
}

- (BOOL)requiresLinearPlayback
{
  return -[PGPlaybackState _BOOLForKey:](self, "_BOOLForKey:", 8);
}

- (BOOL)isRoutingVideoToHostedWindow
{
  return -[PGPlaybackState _BOOLForKey:](self, "_BOOLForKey:", 10);
}

- (int64_t)backgroundAudioPolicy
{
  return -[PGPlaybackState _integerForKey:](self, "_integerForKey:", 11);
}

- (BOOL)hasInvalidTiming
{
  unint64_t v3;
  double v4;

  v3 = -[PGPlaybackState contentType](self, "contentType");
  if (v3 > 5)
    return 0;
  if (((1 << v3) & 0x39) != 0)
    return 1;
  -[PGPlaybackState contentDuration](self, "contentDuration");
  if (v4 <= 0.0)
    return 1;
  -[PGPlaybackState contentDuration](self, "contentDuration");
  -[PGPlaybackState elapsedTime](self, "elapsedTime");
  return 0;
}

- (void)setContentType:(int64_t)a3
{
  -[PGPlaybackState _setInteger:forKey:](self, "_setInteger:forKey:", a3, 3);
}

- (void)setContentDuration:(double)a3
{
  -[PGPlaybackState _setDouble:forKey:](self, "_setDouble:forKey:", 4, a3);
}

- (void)setMuted:(BOOL)a3
{
  -[PGPlaybackState _setBool:forKey:](self, "_setBool:forKey:", a3, 7);
}

- (void)setRequiresLinearPlayback:(BOOL)a3
{
  -[PGPlaybackState _setBool:forKey:](self, "_setBool:forKey:", a3, 8);
}

- (void)setRoutingVideoToHostedWindow:(BOOL)a3
{
  -[PGPlaybackState _setBool:forKey:](self, "_setBool:forKey:", a3, 10);
}

- (void)setBackgroundAudioPolicy:(int64_t)a3
{
  if (dyld_program_sdk_at_least())
    -[PGPlaybackState _setInteger:forKey:](self, "_setInteger:forKey:", a3, 11);
}

- (void)setPlaybackRate:(double)a3 elapsedTime:(double)a4 timeControlStatus:(int64_t)a5
{
  -[PGPlaybackState _setInteger:forKey:](self, "_setInteger:forKey:", a5, 5);
  -[PGPlaybackState _setDouble:forKey:](self, "_setDouble:forKey:", 6, a3);
  -[PGPlaybackState _setDouble:forKey:](self, "_setDouble:forKey:", 1, fmax(a4, 0.0));
  -[PGPlaybackState _setDouble:forKey:](self, "_setDouble:forKey:", 2, CFAbsoluteTimeGetCurrent());
}

- (PGPlaybackStatePrerollAttributes)prerollAttributes
{
  void *v3;
  void *v4;
  char v5;
  PGPlaybackStatePrerollAttributes *v6;
  PGPlaybackStatePrerollAttributes *prerollAttributes;
  PGPlaybackStatePrerollAttributes *v8;

  -[PGPlaybackState _dictionaryForKey:](self, "_dictionaryForKey:", 9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGPlaybackStatePrerollAttributes dictionaryRepresentation](self->_prerollAttributes, "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToDictionary:", v4);

  if ((v5 & 1) == 0)
  {
    if (v3)
      v6 = -[PGPlaybackStatePrerollAttributes initWithDictionary:]([PGPlaybackStatePrerollAttributes alloc], "initWithDictionary:", v3);
    else
      v6 = 0;
    prerollAttributes = self->_prerollAttributes;
    self->_prerollAttributes = v6;

  }
  v8 = self->_prerollAttributes;

  return v8;
}

- (void)setPrerollAttributes:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "dictionaryRepresentation");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = &unk_1E62428E8;
  if (v4)
    v6 = (void *)v4;
  v7 = v6;

  -[PGPlaybackState _setDictionaryOrNotFound:forKey:](self, "_setDictionaryOrNotFound:forKey:", v7, 9);
}

- (BOOL)supportsMicroPIP
{
  if (-[PGPlaybackState contentType](self, "contentType") == 4)
    return _os_feature_enabled_impl();
  else
    return 0;
}

- (id)_numberForKey:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  -[PGPlaybackState mutableDictionary](self, "mutableDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    v9 = (void *)objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "defaultValueForKey:", v10);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (int64_t)_integerForKey:(int64_t)a3
{
  void *v3;
  int64_t v4;

  -[PGPlaybackState _numberForKey:](self, "_numberForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (double)_doubleForKey:(int64_t)a3
{
  void *v3;
  double v4;
  double v5;

  -[PGPlaybackState _numberForKey:](self, "_numberForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (BOOL)_BOOLForKey:(int64_t)a3
{
  void *v3;
  char v4;

  -[PGPlaybackState _numberForKey:](self, "_numberForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (id)_dictionaryForKey:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[PGPlaybackState mutableDictionary](self, "mutableDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    v9 = (void *)objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "defaultValueForKey:", v10);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v8;
  else
    v11 = 0;
  v12 = v11;

  return v12;
}

- (id)_stringForKey:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[PGPlaybackState mutableDictionary](self, "mutableDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    v9 = (void *)objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "defaultValueForKey:", v10);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v8;
  else
    v11 = 0;
  v12 = v11;

  return v12;
}

- (void)_setInteger:(int64_t)a3 forKey:(int64_t)a4
{
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PGPlaybackState _setStateValue:forKey:](self, "_setStateValue:forKey:", v6, a4);

}

- (void)_setDouble:(double)a3 forKey:(int64_t)a4
{
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PGPlaybackState _setStateValue:forKey:](self, "_setStateValue:forKey:", v6, a4);

}

- (void)_setBool:(BOOL)a3 forKey:(int64_t)a4
{
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PGPlaybackState _setStateValue:forKey:](self, "_setStateValue:forKey:", v6, a4);

}

- (void)_setStateValue:(id)a3 forKey:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  -[PGPlaybackState _ensureMutableDictionary](self, "_ensureMutableDictionary");
  -[PGPlaybackState mutableDictionary](self, "mutableDictionary");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)_setDictionaryOrNotFound:(id)a3 forKey:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  -[PGPlaybackState _ensureMutableDictionary](self, "_ensureMutableDictionary");
  -[PGPlaybackState mutableDictionary](self, "mutableDictionary");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)_ensureMutableDictionary
{
  NSMutableDictionary *v3;
  NSMutableDictionary *mutableDictionary;

  if (!self->_mutableDictionary)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    mutableDictionary = self->_mutableDictionary;
    self->_mutableDictionary = v3;

  }
}

- (NSString)description
{
  return (NSString *)-[PGPlaybackState descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[PGPlaybackState succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[PGPlaybackState descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)appendDescriptionForKey:(int64_t)a3 value:(id)a4 toBuilder:(id)a5
{
  id v8;
  int64_t v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  unint64_t v13;
  const __CFString *v14;
  unint64_t v15;
  id v16;
  unint64_t v17;
  id v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  id v22;

  v22 = a4;
  v8 = a5;
  v9 = a3 - 1;
  v10 = CFSTR("Muted");
  v11 = CFSTR("AnchorContentTime");
  v12 = v22;
  switch(v9)
  {
    case 0:
      goto LABEL_13;
    case 1:
      v11 = CFSTR("AnchorWallTime");
      goto LABEL_13;
    case 2:
      v13 = objc_msgSend(v22, "integerValue");
      if (v13 >= 6)
        v14 = CFSTR("invalid");
      else
        v14 = off_1E6230778[v13];
      v21 = CFSTR("ContentType");
      goto LABEL_31;
    case 3:
      v11 = CFSTR("ContentDuration");
      goto LABEL_13;
    case 4:
      v15 = objc_msgSend(v22, "integerValue");
      if (v15 >= 3)
        v14 = CFSTR("invalid");
      else
        v14 = off_1E62307A8[v15];
      v21 = CFSTR("TimeControlStatus");
      goto LABEL_31;
    case 5:
      v11 = CFSTR("PlaybackRate");
LABEL_13:
      objc_msgSend(v22, "doubleValue");
      v16 = (id)objc_msgSend(v8, "appendDouble:withName:decimalPrecision:", v11, 2);
      goto LABEL_32;
    case 6:
      goto LABEL_23;
    case 7:
      v10 = CFSTR("RequiresLinearPlayback");
      goto LABEL_23;
    case 8:
      -[PGPlaybackState prerollAttributes](self, "prerollAttributes");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "description");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "appendString:withName:skipIfEmpty:", v20, CFSTR("PrerollAttributes"), 1);

      goto LABEL_32;
    case 9:
      v10 = CFSTR("RoutingVideoToHostedWindow");
      goto LABEL_23;
    case 10:
      v17 = objc_msgSend(v22, "integerValue");
      if (v17 >= 4)
        v14 = CFSTR("invalid");
      else
        v14 = off_1E62307C0[v17];
      v21 = CFSTR("BackgroundAudioPolicy");
LABEL_31:
      objc_msgSend(v8, "appendString:withName:", v14, v21);
      goto LABEL_32;
    default:
      switch((unint64_t)CFSTR("Muted"))
      {
        case 0x3E9uLL:
          v10 = CFSTR("FaceTime-SupportsActions");
          goto LABEL_22;
        case 0x3EAuLL:
          v10 = CFSTR("FaceTime-CameraActive");
          goto LABEL_22;
        case 0x3EBuLL:
          v10 = CFSTR("FaceTime-MicrophoneMuted");
          goto LABEL_22;
        case 0x3ECuLL:
          v10 = CFSTR("FaceTime-CanSwitchCamera");
          goto LABEL_22;
        case 0x3EDuLL:
          v10 = CFSTR("FaceTime-DisablesLayerCloning");
          goto LABEL_22;
        default:
          if (CFSTR("Muted") != (__CFString *)2001)
            goto LABEL_32;
          v10 = CFSTR("SecurityCam-HasMicrophone");
LABEL_22:
          v12 = v22;
          break;
      }
LABEL_23:
      v18 = (id)objc_msgSend(v8, "appendBool:withName:", objc_msgSend(v12, "BOOLValue"), v10);
LABEL_32:

      return;
  }
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  PGPlaybackState *v12;
  objc_super v13;

  v4 = a3;
  -[PGPlaybackState succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)PGPlaybackState;
  -[PGPlaybackState description](&v13, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__PGPlaybackState_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E622F898;
  v7 = v5;
  v11 = v7;
  v12 = self;
  objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", v6, v4, v10);

  v8 = v7;
  return v8;
}

void __57__PGPlaybackState_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  int8x16_t v6;
  _QWORD v7[4];
  int8x16_t v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "elapsedTime");
  v3 = (id)objc_msgSend(v2, "appendDouble:withName:decimalPrecision:", CFSTR("Elapsed Time"), 2);
  objc_msgSend(*(id *)(a1 + 40), "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__PGPlaybackState_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v7[3] = &unk_1E6230758;
  v6 = *(int8x16_t *)(a1 + 32);
  v5 = (id)v6.i64[0];
  v8 = vextq_s8(v6, v6, 8uLL);
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __57__PGPlaybackState_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "appendDescriptionForKey:value:toBuilder:", objc_msgSend(a2, "integerValue"), v5, *(_QWORD *)(a1 + 40));

}

- (NSMutableDictionary)mutableDictionary
{
  return self->_mutableDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableDictionary, 0);
  objc_storeStrong((id *)&self->_prerollAttributes, 0);
}

- (BOOL)supportsFaceTimeActions
{
  return -[PGPlaybackState _BOOLForKey:](self, "_BOOLForKey:", 1001);
}

- (void)setSupportsFaceTimeActions:(BOOL)a3
{
  -[PGPlaybackState _setBool:forKey:](self, "_setBool:forKey:", a3, 1001);
}

- (BOOL)isCameraActive
{
  return -[PGPlaybackState _BOOLForKey:](self, "_BOOLForKey:", 1002);
}

- (void)setCameraActive:(BOOL)a3
{
  -[PGPlaybackState _setBool:forKey:](self, "_setBool:forKey:", a3, 1002);
}

- (BOOL)canSwitchCamera
{
  return -[PGPlaybackState _BOOLForKey:](self, "_BOOLForKey:", 1004);
}

- (void)setCanSwitchCamera:(BOOL)a3
{
  -[PGPlaybackState _setBool:forKey:](self, "_setBool:forKey:", a3, 1004);
}

- (BOOL)isMicrophoneMuted
{
  return -[PGPlaybackState _BOOLForKey:](self, "_BOOLForKey:", 1003);
}

- (void)setMicrophoneMuted:(BOOL)a3
{
  -[PGPlaybackState _setBool:forKey:](self, "_setBool:forKey:", a3, 1003);
}

- (BOOL)disablesLayerCloning
{
  return -[PGPlaybackState _BOOLForKey:](self, "_BOOLForKey:", 1005);
}

- (void)setDisablesLayerCloning:(BOOL)a3
{
  -[PGPlaybackState _setBool:forKey:](self, "_setBool:forKey:", a3, 1005);
}

- (BOOL)cameraHasMicrophone
{
  return -[PGPlaybackState _BOOLForKey:](self, "_BOOLForKey:", 2001);
}

- (void)setCameraHasMicrophone:(BOOL)a3
{
  -[PGPlaybackState _setBool:forKey:](self, "_setBool:forKey:", a3, 2001);
}

@end
