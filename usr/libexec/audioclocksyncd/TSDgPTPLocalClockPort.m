@implementation TSDgPTPLocalClockPort

- (int)_localFrequencyToleranceLower
{
  void *v2;
  void *v3;
  int v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("LocalFrequencyToleranceLower")));

  if (v3)
    v4 = objc_msgSend(v3, "intValue");
  else
    v4 = 0;

  return v4;
}

- (int)_localFrequencyStabilityUpper
{
  void *v2;
  void *v3;
  int v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("LocalFrequencyStabilityUpper")));

  if (v3)
    v4 = objc_msgSend(v3, "intValue");
  else
    v4 = 0;

  return v4;
}

- (int)_localFrequencyStabilityLower
{
  void *v2;
  void *v3;
  int v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("LocalFrequencyStabilityLower")));

  if (v3)
    v4 = objc_msgSend(v3, "intValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)_hasLocalFrequencyToleranceLower
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("LocalFrequencyToleranceLower")));

  return v3 != 0;
}

- (BOOL)_hasLocalFrequencyStabilityUpper
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("LocalFrequencyStabilityUpper")));

  return v3 != 0;
}

- (unsigned)_localOscillatorType
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("LocalOscillatorType")));

  if (v3)
    v4 = objc_msgSend(v3, "unsignedCharValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)_hasLocalFrequencyToleranceUpper
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("LocalFrequencyToleranceUpper")));

  return v3 != 0;
}

- (BOOL)_hasLocalFrequencyStabilityLower
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("LocalFrequencyStabilityLower")));

  return v3 != 0;
}

- (int)_localFrequencyToleranceUpper
{
  void *v2;
  void *v3;
  int v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("LocalFrequencyToleranceUpper")));

  if (v3)
    v4 = objc_msgSend(v3, "intValue");
  else
    v4 = 0;

  return v4;
}

- (TSDgPTPLocalClockPort)initWithService:(id)a3 pid:(int)a4
{
  TSDgPTPLocalClockPort *v4;
  TSDgPTPLocalClockPort *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSDgPTPLocalClockPort;
  v4 = -[TSDgPTPPort initWithService:pid:](&v7, "initWithService:pid:", a3, *(_QWORD *)&a4);
  v5 = v4;
  if (v4)
  {
    v4->_localOscillatorType = -[TSDgPTPLocalClockPort _localOscillatorType](v4, "_localOscillatorType");
    v5->_hasLocalFrequencyToleranceLower = -[TSDgPTPLocalClockPort _hasLocalFrequencyToleranceLower](v5, "_hasLocalFrequencyToleranceLower");
    v5->_localFrequencyToleranceLower = -[TSDgPTPLocalClockPort _localFrequencyToleranceLower](v5, "_localFrequencyToleranceLower");
    v5->_hasLocalFrequencyToleranceUpper = -[TSDgPTPLocalClockPort _hasLocalFrequencyToleranceUpper](v5, "_hasLocalFrequencyToleranceUpper");
    v5->_localFrequencyToleranceUpper = -[TSDgPTPLocalClockPort _localFrequencyToleranceUpper](v5, "_localFrequencyToleranceUpper");
    v5->_hasLocalFrequencyStabilityLower = -[TSDgPTPLocalClockPort _hasLocalFrequencyStabilityLower](v5, "_hasLocalFrequencyStabilityLower");
    v5->_localFrequencyStabilityLower = -[TSDgPTPLocalClockPort _localFrequencyStabilityLower](v5, "_localFrequencyStabilityLower");
    v5->_hasLocalFrequencyStabilityUpper = -[TSDgPTPLocalClockPort _hasLocalFrequencyStabilityUpper](v5, "_hasLocalFrequencyStabilityUpper");
    v5->_localFrequencyStabilityUpper = -[TSDgPTPLocalClockPort _localFrequencyStabilityUpper](v5, "_localFrequencyStabilityUpper");
  }
  return v5;
}

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
  _QWORD v13[2];

  v13[0] = CFSTR("IOTimeSyncLocalClockPort");
  v12[0] = CFSTR("IOProviderClass");
  v12[1] = CFSTR("IOParentMatch");
  v10[0] = CFSTR("IOProviderClass");
  v10[1] = CFSTR("IOPropertyMatch");
  v11[0] = CFSTR("IOTimeSyncDomain");
  v8 = CFSTR("ClockIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  v9 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
  v11[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 2));
  v13[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 2));

  return v6;
}

- (int)portType
{
  return 8;
}

+ (id)diagnosticInfoForService:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___TSDgPTPLocalClockPort;
  v3 = objc_msgSendSuper2(&v7, "diagnosticInfoForService:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 8));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("PortType"));

  return v4;
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
