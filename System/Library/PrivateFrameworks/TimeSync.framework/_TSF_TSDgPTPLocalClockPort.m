@implementation _TSF_TSDgPTPLocalClockPort

+ (id)iokitMatchingDictionaryForClockIdentifier:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("IOTimeSyncLocalClockPort");
  v12[0] = CFSTR("IOProviderClass");
  v12[1] = CFSTR("IOParentMatch");
  v10[0] = CFSTR("IOProviderClass");
  v10[1] = CFSTR("IOPropertyMatch");
  v11[0] = CFSTR("IOTimeSyncDomain");
  v8 = CFSTR("ClockIdentifier");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (_TSF_TSDgPTPLocalClockPort)initWithService:(id)a3 pid:(int)a4
{
  _TSF_TSDgPTPLocalClockPort *v4;
  _TSF_TSDgPTPLocalClockPort *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_TSF_TSDgPTPLocalClockPort;
  v4 = -[_TSF_TSDgPTPPort initWithService:pid:](&v7, sel_initWithService_pid_, a3, *(_QWORD *)&a4);
  v5 = v4;
  if (v4)
  {
    v4->_localOscillatorType = -[_TSF_TSDgPTPLocalClockPort _localOscillatorType](v4, "_localOscillatorType");
    v5->_hasLocalFrequencyToleranceLower = -[_TSF_TSDgPTPLocalClockPort _hasLocalFrequencyToleranceLower](v5, "_hasLocalFrequencyToleranceLower");
    v5->_localFrequencyToleranceLower = -[_TSF_TSDgPTPLocalClockPort _localFrequencyToleranceLower](v5, "_localFrequencyToleranceLower");
    v5->_hasLocalFrequencyToleranceUpper = -[_TSF_TSDgPTPLocalClockPort _hasLocalFrequencyToleranceUpper](v5, "_hasLocalFrequencyToleranceUpper");
    v5->_localFrequencyToleranceUpper = -[_TSF_TSDgPTPLocalClockPort _localFrequencyToleranceUpper](v5, "_localFrequencyToleranceUpper");
    v5->_hasLocalFrequencyStabilityLower = -[_TSF_TSDgPTPLocalClockPort _hasLocalFrequencyStabilityLower](v5, "_hasLocalFrequencyStabilityLower");
    v5->_localFrequencyStabilityLower = -[_TSF_TSDgPTPLocalClockPort _localFrequencyStabilityLower](v5, "_localFrequencyStabilityLower");
    v5->_hasLocalFrequencyStabilityUpper = -[_TSF_TSDgPTPLocalClockPort _hasLocalFrequencyStabilityUpper](v5, "_hasLocalFrequencyStabilityUpper");
    v5->_localFrequencyStabilityUpper = -[_TSF_TSDgPTPLocalClockPort _localFrequencyStabilityUpper](v5, "_localFrequencyStabilityUpper");
  }
  return v5;
}

- (int)portType
{
  return 8;
}

- (unsigned)_localOscillatorType
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  -[_TSF_TSDgPTPPort service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("LocalOscillatorType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "unsignedCharValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)_hasLocalFrequencyToleranceLower
{
  void *v2;
  void *v3;

  -[_TSF_TSDgPTPPort service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("LocalFrequencyToleranceLower"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3 != 0;
}

- (int)_localFrequencyToleranceLower
{
  void *v2;
  void *v3;
  int v4;

  -[_TSF_TSDgPTPPort service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("LocalFrequencyToleranceLower"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "intValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)_hasLocalFrequencyToleranceUpper
{
  void *v2;
  void *v3;

  -[_TSF_TSDgPTPPort service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("LocalFrequencyToleranceUpper"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3 != 0;
}

- (int)_localFrequencyToleranceUpper
{
  void *v2;
  void *v3;
  int v4;

  -[_TSF_TSDgPTPPort service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("LocalFrequencyToleranceUpper"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "intValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)_hasLocalFrequencyStabilityLower
{
  void *v2;
  void *v3;

  -[_TSF_TSDgPTPPort service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("LocalFrequencyStabilityLower"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3 != 0;
}

- (int)_localFrequencyStabilityLower
{
  void *v2;
  void *v3;
  int v4;

  -[_TSF_TSDgPTPPort service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("LocalFrequencyStabilityLower"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "intValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)_hasLocalFrequencyStabilityUpper
{
  void *v2;
  void *v3;

  -[_TSF_TSDgPTPPort service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("LocalFrequencyStabilityUpper"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3 != 0;
}

- (int)_localFrequencyStabilityUpper
{
  void *v2;
  void *v3;
  int v4;

  -[_TSF_TSDgPTPPort service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("LocalFrequencyStabilityUpper"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "intValue");
  else
    v4 = 0;

  return v4;
}

+ (id)diagnosticInfoForService:(id)a3
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS____TSF_TSDgPTPLocalClockPort;
  objc_msgSendSuper2(&v6, sel_diagnosticInfoForService_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("PortType"));

  return v3;
}

- (unsigned)localOscillatorType
{
  return self->_localOscillatorType;
}

- (void)setLocalOscillatorType:(unsigned __int8)a3
{
  self->_localOscillatorType = a3;
}

- (BOOL)hasLocalFrequencyToleranceLower
{
  return self->_hasLocalFrequencyToleranceLower;
}

- (void)setHasLocalFrequencyToleranceLower:(BOOL)a3
{
  self->_hasLocalFrequencyToleranceLower = a3;
}

- (int)localFrequencyToleranceLower
{
  return self->_localFrequencyToleranceLower;
}

- (void)setLocalFrequencyToleranceLower:(int)a3
{
  self->_localFrequencyToleranceLower = a3;
}

- (BOOL)hasLocalFrequencyToleranceUpper
{
  return self->_hasLocalFrequencyToleranceUpper;
}

- (void)setHasLocalFrequencyToleranceUpper:(BOOL)a3
{
  self->_hasLocalFrequencyToleranceUpper = a3;
}

- (int)localFrequencyToleranceUpper
{
  return self->_localFrequencyToleranceUpper;
}

- (void)setLocalFrequencyToleranceUpper:(int)a3
{
  self->_localFrequencyToleranceUpper = a3;
}

- (BOOL)hasLocalFrequencyStabilityLower
{
  return self->_hasLocalFrequencyStabilityLower;
}

- (void)setHasLocalFrequencyStabilityLower:(BOOL)a3
{
  self->_hasLocalFrequencyStabilityLower = a3;
}

- (int)localFrequencyStabilityLower
{
  return self->_localFrequencyStabilityLower;
}

- (void)setLocalFrequencyStabilityLower:(int)a3
{
  self->_localFrequencyStabilityLower = a3;
}

- (BOOL)hasLocalFrequencyStabilityUpper
{
  return self->_hasLocalFrequencyStabilityUpper;
}

- (void)setHasLocalFrequencyStabilityUpper:(BOOL)a3
{
  self->_hasLocalFrequencyStabilityUpper = a3;
}

- (int)localFrequencyStabilityUpper
{
  return self->_localFrequencyStabilityUpper;
}

- (void)setLocalFrequencyStabilityUpper:(int)a3
{
  self->_localFrequencyStabilityUpper = a3;
}

@end
