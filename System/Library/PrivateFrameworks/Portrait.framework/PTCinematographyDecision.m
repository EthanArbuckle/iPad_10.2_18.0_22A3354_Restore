@implementation PTCinematographyDecision

+ (PTCinematographyTransition)defaultTransition
{
  if (defaultTransition_onceToken != -1)
    dispatch_once(&defaultTransition_onceToken, &__block_literal_global_10);
  return (PTCinematographyTransition *)(id)defaultTransition_sDefaultTransition;
}

void __45__PTCinematographyDecision_defaultTransition__block_invoke()
{
  PTCinematographyTransition *v0;
  void *v1;

  v0 = -[PTCinematographyTransition initWithKind:]([PTCinematographyTransition alloc], "initWithKind:", 1);
  v1 = (void *)defaultTransition_sDefaultTransition;
  defaultTransition_sDefaultTransition = (uint64_t)v0;

}

- (PTCinematographyDecision)initWithTime:(id *)a3 trackIdentifier:(int64_t)a4
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;

  v5 = *a3;
  return -[PTCinematographyDecision initWithTime:trackIdentifier:options:](self, "initWithTime:trackIdentifier:options:", &v5, a4, 0);
}

- (PTCinematographyDecision)initWithTime:(id *)a3 trackIdentifier:(int64_t)a4 options:(unint64_t)a5
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6;

  v6 = *a3;
  return (PTCinematographyDecision *)-[PTCinematographyDecision _initWithTime:trackIdentifier:groupIdentifier:transition:options:](self, "_initWithTime:trackIdentifier:groupIdentifier:transition:options:", &v6, a4, -1, 0, a5);
}

- (PTCinematographyDecision)initWithTime:(id *)a3 groupIdentifier:(int64_t)a4 options:(unint64_t)a5
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6;

  v6 = *a3;
  return (PTCinematographyDecision *)-[PTCinematographyDecision _initWithTime:trackIdentifier:groupIdentifier:transition:options:](self, "_initWithTime:trackIdentifier:groupIdentifier:transition:options:", &v6, -1, a4, 0, a5);
}

- (id)_initWithTime:(id *)a3 trackIdentifier:(int64_t)a4 groupIdentifier:(int64_t)a5 transition:(id)a6 options:(unint64_t)a7
{
  id v12;
  PTCinematographyDecision *v13;
  PTCinematographyDecision *v14;
  __int128 v15;
  PTCinematographyTransition *v16;
  PTCinematographyTransition *transition;
  objc_super v19;

  v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)PTCinematographyDecision;
  v13 = -[PTCinematographyDecision init](&v19, sel_init);
  v14 = v13;
  if (v13)
  {
    v15 = *(_OWORD *)&a3->var0;
    v13->_time.epoch = a3->var3;
    *(_OWORD *)&v13->_time.value = v15;
    v13->_trackIdentifier = a4;
    v13->_groupIdentifier = a5;
    if (v12)
    {
      v16 = (PTCinematographyTransition *)v12;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "defaultTransition");
      v16 = (PTCinematographyTransition *)objc_claimAutoreleasedReturnValue();
    }
    transition = v14->_transition;
    v14->_transition = v16;

    v14->_options = a7;
    v14->_type = 1;
  }

  return v14;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  PTCinematographyDecision *v4;
  int64_t trackIdentifier;
  int64_t groupIdentifier;
  PTCinematographyTransition *transition;
  unint64_t options;
  id result;
  $95D729B680665BEAEFA1D6FCA8238556 time;

  v4 = [PTCinematographyDecision alloc];
  trackIdentifier = self->_trackIdentifier;
  groupIdentifier = self->_groupIdentifier;
  transition = self->_transition;
  options = self->_options;
  time = self->_time;
  result = -[PTCinematographyDecision _initWithTime:trackIdentifier:groupIdentifier:transition:options:](v4, "_initWithTime:trackIdentifier:groupIdentifier:transition:options:", &time, trackIdentifier, groupIdentifier, transition, options);
  *((_QWORD *)result + 4) = self->_type;
  return result;
}

- (BOOL)hasMinimumDuration
{
  char v3;

  -[PTCinematographyDecision minimumDuration](self, "minimumDuration");
  return v3 & 1;
}

- (BOOL)hasMaximumDuration
{
  char v3;

  -[PTCinematographyDecision maximumDuration](self, "maximumDuration");
  return v3 & 1;
}

- (id)_decisionByChangingTime:(id *)a3
{
  uint64_t v4;
  int64_t var3;

  v4 = -[PTCinematographyDecision mutableCopy](self, "mutableCopy");
  var3 = a3->var3;
  *(_OWORD *)(v4 + 48) = *(_OWORD *)&a3->var0;
  *(_QWORD *)(v4 + 64) = var3;
  return (id)v4;
}

- (id)_decisionByRemovingOptions:(unint64_t)a3
{
  _QWORD *v4;

  v4 = (_QWORD *)-[PTCinematographyDecision mutableCopy](self, "mutableCopy");
  v4[3] &= ~a3;
  return v4;
}

- (BOOL)isUserDecision
{
  return -[PTCinematographyDecision type](self, "type") == 1;
}

- (BOOL)isStrongDecision
{
  return -[PTCinematographyDecision options](self, "options") & 1;
}

- (BOOL)isGroupDecision
{
  return (-[PTCinematographyDecision options](self, "options") >> 1) & 1;
}

- (id)description
{
  int64_t v3;
  const __CFString *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  int64_t v8;
  __CFString *v9;
  int64_t v10;
  __CFString *v11;
  const __CFString *v12;
  _BOOL4 v13;
  const __CFString *v14;
  void *v15;
  CMTime v17;

  v3 = -[PTCinematographyDecision type](self, "type");
  v4 = CFSTR("Unknown");
  if (v3 == 1)
    v4 = CFSTR("User");
  if (v3)
    v5 = v4;
  else
    v5 = CFSTR("Base");
  v6 = (void *)MEMORY[0x1E0CB3940];
  -[PTCinematographyDecision time](self, "time");
  NSStringFromCMTime(&v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PTCinematographyDecision trackIdentifier](self, "trackIdentifier");
  if (v8 == -1)
  {
    v9 = CFSTR("?");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PTCinematographyDecision trackIdentifier](self, "trackIdentifier"));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v10 = -[PTCinematographyDecision groupIdentifier](self, "groupIdentifier");
  if (v10 == -1)
  {
    v11 = CFSTR("?");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PTCinematographyDecision groupIdentifier](self, "groupIdentifier"));
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (-[PTCinematographyDecision isGroupDecision](self, "isGroupDecision"))
    v12 = CFSTR("g");
  else
    v12 = &stru_1E822B200;
  v13 = -[PTCinematographyDecision isStrongDecision](self, "isStrongDecision");
  v14 = CFSTR("+");
  if (!v13)
    v14 = &stru_1E822B200;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@: [%@] T%@ G%@ %@%@"), v7, v5, v9, v11, v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 != -1)

  if (v8 != -1)
  return v15;
}

- (BOOL)isEqual:(id)a3
{
  PTCinematographyDecision *v4;
  PTCinematographyDecision *v5;
  int64_t v6;
  int64_t v7;
  unint64_t v8;
  int64_t v9;
  BOOL v10;
  CMTime v12;
  CMTime time1;

  v4 = (PTCinematographyDecision *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[PTCinematographyDecision trackIdentifier](self, "trackIdentifier");
      if (v6 == -[PTCinematographyDecision trackIdentifier](v5, "trackIdentifier")
        && (v7 = -[PTCinematographyDecision groupIdentifier](self, "groupIdentifier"),
            v7 == -[PTCinematographyDecision groupIdentifier](v5, "groupIdentifier"))
        && (v8 = -[PTCinematographyDecision options](self, "options"),
            v8 == -[PTCinematographyDecision options](v5, "options"))
        && (v9 = -[PTCinematographyDecision type](self, "type"), v9 == -[PTCinematographyDecision type](v5, "type")))
      {
        -[PTCinematographyDecision time](self, "time");
        if (v5)
          -[PTCinematographyDecision time](v5, "time");
        else
          memset(&v12, 0, sizeof(v12));
        v10 = CMTimeCompare(&time1, &v12) == 0;
      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  int64_t v3;
  int64_t v4;
  unint64_t v5;
  double v6;
  CMTime time;

  v3 = -[PTCinematographyDecision trackIdentifier](self, "trackIdentifier");
  v4 = -[PTCinematographyDecision groupIdentifier](self, "groupIdentifier") + v3;
  v5 = -[PTCinematographyDecision options](self, "options");
  v6 = (double)(v4 + v5 + -[PTCinematographyDecision type](self, "type"));
  -[PTCinematographyDecision time](self, "time");
  return (unint64_t)(v6 + CMTimeGetSeconds(&time) * 600.0);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[2];
  return self;
}

- (int64_t)trackIdentifier
{
  return self->_trackIdentifier;
}

- (void)setTrackIdentifier:(int64_t)a3
{
  self->_trackIdentifier = a3;
}

- (int64_t)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)setGroupIdentifier:(int64_t)a3
{
  self->_groupIdentifier = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minimumDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[3];
  return self;
}

- (void)setMinimumDuration:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_minimumDuration.epoch = a3->var3;
  *(_OWORD *)&self->_minimumDuration.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maximumDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[4];
  return self;
}

- (void)setMaximumDuration:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_maximumDuration.epoch = a3->var3;
  *(_OWORD *)&self->_maximumDuration.value = v3;
}

- (PTCinematographyTransition)transition
{
  return self->_transition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transition, 0);
}

+ (id)_decisionsWithCinematographyDictionaries:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "_mutableDecisionsWithCinematographyDictionaries:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

+ (id)_mutableDecisionsWithCinematographyDictionaries:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  PTCinematographyDecision *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v11 = [PTCinematographyDecision alloc];
        v12 = -[PTCinematographyDecision _initWithCinematographyDictionary:](v11, "_initWithCinematographyDictionary:", v10, (_QWORD)v14);
        objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_initWithCinematographyDictionary:(id)a3
{
  id v4;
  PTCinematographyDecision *v5;
  const __CFDictionary *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  PTCinematographyTransition *transition;
  void *v11;
  void *v12;
  unsigned int v13;
  const __CFDictionary *v14;
  const __CFDictionary *v15;
  const __CFDictionary *v16;
  const __CFDictionary *v17;
  CMTime v19;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PTCinematographyDecision;
  v5 = -[PTCinematographyDecision init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ptime"));
    v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CMTimeFromPTCinematographyDictionary(&v19, v6);
    v5->_time = ($95D729B680665BEAEFA1D6FCA8238556)v19;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("track_id"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_trackIdentifier = objc_msgSend(v7, "integerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("group_id"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_groupIdentifier = objc_msgSend(v8, "integerValue");

    objc_msgSend((id)objc_opt_class(), "defaultTransition");
    v9 = objc_claimAutoreleasedReturnValue();
    transition = v5->_transition;
    v5->_transition = (PTCinematographyTransition *)v9;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("options"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_options = objc_msgSend(v11, "unsignedIntegerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("is_user"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "BOOLValue");

    v5->_type = v13;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("min_duration"));
    v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      CMTimeFromPTCinematographyDictionary(&v19, v14);
      v5->_minimumDuration = ($95D729B680665BEAEFA1D6FCA8238556)v19;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("max_duration"));
    v16 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      CMTimeFromPTCinematographyDictionary(&v19, v16);
      v5->_maximumDuration = ($95D729B680665BEAEFA1D6FCA8238556)v19;
    }

  }
  return v5;
}

- (id)_asCinematographyDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BYTE v13[24];
  _BYTE v14[24];
  _BYTE v15[24];

  v3 = (void *)objc_opt_new();
  -[PTCinematographyDecision time](self, "time");
  PTCinematographyDictionaryFromCMTime((uint64_t)v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("ptime"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PTCinematographyDecision trackIdentifier](self, "trackIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("track_id"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PTCinematographyDecision groupIdentifier](self, "groupIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("group_id"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PTCinematographyDecision options](self, "options"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("options"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PTCinematographyDecision isUserDecision](self, "isUserDecision"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("is_user"));

  if (-[PTCinematographyDecision hasMinimumDuration](self, "hasMinimumDuration"))
  {
    -[PTCinematographyDecision minimumDuration](self, "minimumDuration");
    PTCinematographyDictionaryFromCMTime((uint64_t)v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("min_duration"));

  }
  if (-[PTCinematographyDecision hasMaximumDuration](self, "hasMaximumDuration"))
  {
    -[PTCinematographyDecision maximumDuration](self, "maximumDuration");
    PTCinematographyDictionaryFromCMTime((uint64_t)v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("max_duration"));

  }
  v11 = (void *)objc_msgSend(v3, "copy");

  return v11;
}

@end
