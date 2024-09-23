@implementation CHChannelEnum

+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3
{
  return a3
}

+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5
{
  OZChannelEnum *v8;
  PCString v10;
  PCString v11;

  v8 = (OZChannelEnum *)operator new();
  PCString::PCString(&v11, "");
  v10.var0 = 0;
  PCString::set(&v10, (CFStringRef)a3);
  OZChannelEnum::OZChannelEnum(v8, &v11, &v10, 0, a4, a5, 0, 0);
  PCString::~PCString(&v10);
  PCString::~PCString(&v11);
  return (OZChannelBase *)v8;
}

- (void)ozChannel
{
  void *result;

  result = self->super.super._pOZChannel;
  if (result)
  return result;
}

- (int)intValueAtTime:(id *)a3
{
  OZChannel *v4;
  CMTime v6;

  (*((void (**)(CMTime *__return_ptr, OZChannel *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))v4->var0 + 42))(&v6, v4, a3);
  return OZChannel::getValueAsInt(v4, &v6, 0.0);
}

- (int)intValue
{
  OZChannel *pOZChannel;

  pOZChannel = (OZChannel *)self->super.super._pOZChannel;
  if (pOZChannel)
  return (int)OZChannel::getInitialValue(pOZChannel);
}

- (int)intValueForIndex:(int)a3
{
  OZChannelEnum *v4;

  if (*((_QWORD *)v4 + 22) == *((_QWORD *)v4 + 21))
    return a3;
  else
    return OZChannelEnum::getTag(v4, a3);
}

- (id)stringValueAtTime:(id *)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10;

  v5 = -[CHChannelEnum intValuesForStrings](self, "intValuesForStrings");
  v10 = *a3;
  v6 = -[CHChannelEnum intValueAtTime:](self, "intValueAtTime:", &v10);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", v6);
  v8 = (void *)objc_msgSend(v5, "allKeysForObject:", v7);

  return (id)objc_msgSend(v8, "lastObject");
}

- (id)stringValue
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = -[CHChannelEnum intValuesForStrings](self, "intValuesForStrings");
  v4 = -[CHChannelEnum intValue](self, "intValue");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", v4);
  v6 = (void *)objc_msgSend(v3, "allKeysForObject:", v5);

  return (id)objc_msgSend(v6, "lastObject");
}

- (void)setCurveIntValue:(int)a3 atTime:(id *)a4 options:(unsigned int)a5
{
  char v5;
  OZCoreGlobals *Instance;
  char v10;
  OZChannelBase *pOZChannel;
  OZChannel *v12;
  OZCoreGlobals *v13;
  _QWORD v14[3];

  v5 = a5;
  Instance = (OZCoreGlobals *)OZCoreGlobals::getInstance((OZCoreGlobals *)self);
  v10 = *((_BYTE *)Instance + 8);
  *(_BYTE *)(OZCoreGlobals::getInstance(Instance) + 8) = v5 & 1;
  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel)
  else
    v12 = 0;
  if ((~a4->var2 & 0x11) != 0)
  {
    (*((void (**)(_QWORD *__return_ptr, OZChannel *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))v12->var0 + 42))(v14, v12, a4);
    v13 = (OZCoreGlobals *)(*((uint64_t (**)(OZChannel *, _QWORD *, _QWORD, double))v12->var0 + 89))(v12, v14, 0, (double)a3);
  }
  else
  {
    v13 = (OZCoreGlobals *)OZChannel::setInitialValue(v12, (double)a3, 0);
  }
  *(_BYTE *)(OZCoreGlobals::getInstance(v13) + 8) = v10;
}

- (void)setIntValue:(int)a3
{
  __int128 v3;
  uint64_t v4;

  v3 = *MEMORY[0x1E0CA2E10];
  v4 = *(_QWORD *)(MEMORY[0x1E0CA2E10] + 16);
  -[CHChannelEnum setCurveIntValue:atTime:options:](self, "setCurveIntValue:atTime:options:", *(_QWORD *)&a3, &v3, 0);
}

- (void)setCurveStringValue:(id)a3 atTime:(id *)a4 options:(unsigned int)a5
{
  uint64_t v5;
  void *v8;
  uint64_t v9;
  __int128 v10;
  int64_t var3;

  v5 = *(_QWORD *)&a5;
  v8 = (void *)objc_msgSend(-[CHChannelEnum intValuesForStrings](self, "intValuesForStrings"), "objectForKey:", a3);
  if (v8)
  {
    v9 = objc_msgSend(v8, "intValue");
    v10 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    -[CHChannelEnum setCurveIntValue:atTime:options:](self, "setCurveIntValue:atTime:options:", v9, &v10, v5);
  }
}

- (void)setStringValue:(id)a3
{
  __int128 v3;
  uint64_t v4;

  v3 = *MEMORY[0x1E0CA2E10];
  v4 = *(_QWORD *)(MEMORY[0x1E0CA2E10] + 16);
  -[CHChannelEnum setCurveStringValue:atTime:options:](self, "setCurveStringValue:atTime:options:", a3, &v3, 0);
}

- (int)defaultIntValue
{
  OZChannel *pOZChannel;

  pOZChannel = (OZChannel *)self->super.super._pOZChannel;
  if (pOZChannel)
  return (int)OZChannel::getDefaultValue(pOZChannel);
}

- (void)setDefaultIntValue:(int)a3
{
  OZChannelBase *pOZChannel;
  OZChannel *v5;
  int v6;
  void **var0;

  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel)
  else
    v5 = 0;
  OZChannel::setDefaultValue(v5, (double)a3);
  v6 = (*((uint64_t (**)(OZChannel *))v5->var0 + 64))(v5);
  var0 = v5->var0;
  if (v6)
  {
    if (((unsigned int (*)(OZChannel *))var0[104])(v5))
      return;
LABEL_8:
    (*((void (**)(OZChannel *, _QWORD))v5->var0 + 36))(v5, 0);
    return;
  }
  if ((((uint64_t (*)(OZChannel *, uint64_t))var0[62])(v5, 1) & 1) == 0)
    goto LABEL_8;
}

- (unint64_t)stringCount
{
  void *pOZChannel;

  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel)
  return OZChannelEnum::getNumberOfStrings((OZChannelEnum *)pOZChannel);
}

- (id)stringAtIndex:(unint64_t)a3
{
  unsigned int v3;
  void *pOZChannel;
  PCString *String;

  v3 = a3;
  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel)
  String = (PCString *)OZChannelEnum::getString((OZChannelEnum *)pOZChannel, v3);
  return (id)PCString::ns_str(String);
}

- (id)strings
{
  OZChannelBase *pOZChannel;
  OZChannelEnum *v3;
  unsigned int NumberOfStrings;
  void *v5;
  unsigned int i;
  PCString *String;

  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel)
  else
    v3 = 0;
  NumberOfStrings = OZChannelEnum::getNumberOfStrings(v3);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", NumberOfStrings);
  if (NumberOfStrings)
  {
    for (i = 0; i != NumberOfStrings; ++i)
    {
      String = (PCString *)OZChannelEnum::getString(v3, i);
      objc_msgSend(v5, "addObject:", PCString::ns_str(String));
    }
  }
  return v5;
}

- (void)setStringsWithArray:(id)a3
{
  OZChannelBase *pOZChannel;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  PCString v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  PCSharedCount v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel)
  else
    v5 = 0;
  PCSharedCount::PCSharedCount(&v15);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(a3);
        v9 = *(const __CFString **)(*((_QWORD *)&v11 + 1) + 8 * v8);
        if (!PCString::empty((PCString *)&v15))
          PCString::append((PCString *)&v15, ";");
        v10.var0 = 0;
        PCString::set(&v10, v9);
        PCString::append((PCString *)&v15, &v10);
        PCString::~PCString(&v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v6);
  }
  (*(void (**)(void *, PCSharedCount *, uint64_t))(*(_QWORD *)v5 + 848))(v5, &v15, 1);
  PCString::~PCString((PCString *)&v15);
}

- (void)setStrings:(id)a3
{
  OZChannelBase *pOZChannel;
  void *v5;
  PCString v6;

  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel)
  else
    v5 = 0;
  v6.var0 = 0;
  PCString::set(&v6, (CFStringRef)a3);
  (*(void (**)(void *, PCString *, uint64_t))(*(_QWORD *)v5 + 848))(v5, &v6, 1);
  PCString::~PCString(&v6);
}

- (void)setStringsFromChannel:(id)a3
{
  OZChannelBase *pOZChannel;
  void *v5;

  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel)
  else
    v5 = 0;
  (*(void (**)(void *, uint64_t))(*(_QWORD *)v5 + 856))(v5, objc_msgSend(a3, "ozChannel"));
}

- (BOOL)stringValuesRemapped
{
  _QWORD *v2;

  return v2[22] != v2[21];
}

- (id)intValuesForStrings
{
  OZChannelBase *pOZChannel;
  OZChannelEnum *v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t Tag;
  void *v13;

  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel)
  else
    v4 = 0;
  v5 = -[CHChannelEnum stringCount](self, "stringCount");
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v5);
  if (v5)
  {
    v7 = 0;
    v8 = 0;
    v10 = *((_QWORD *)v4 + 21);
    v9 = *((_QWORD *)v4 + 22);
    do
    {
      v11 = -[CHChannelEnum stringAtIndex:](self, "stringAtIndex:", v7);
      Tag = v8;
      if (v9 != v10)
        Tag = OZChannelEnum::getTag(v4, v8);
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", Tag);
      objc_msgSend(v6, "setObject:forKey:", v13, v11);

      v7 = (v8 + 1);
      v8 = v7;
    }
    while (v5 > v7);
  }
  return v6;
}

- (void)setIntValuesForStrings:(id)a3
{
  OZChannelBase *pOZChannel;
  OZChannelEnum *v6;
  unint64_t v7;
  char *v8;
  uint64_t i;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel)
  else
    v6 = 0;
  v7 = -[CHChannelEnum stringCount](self, "stringCount");
  v8 = (char *)v10 - ((4 * v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v7)
  {
    for (i = 0; i != v7; ++i)
      *(_DWORD *)&v8[4 * i] = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", -[CHChannelEnum stringAtIndex:](self, "stringAtIndex:", i)), "intValue");
  }
  OZChannelEnum::setTags(v6, v8, v7);
}

- (id)enabledStateForStrings
{
  OZChannelBase *pOZChannel;
  OZChannelEnum *v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  unsigned int v9;
  id v10;
  uint64_t EnabledState;
  void *v12;

  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel)
  else
    v4 = 0;
  v5 = -[CHChannelEnum stringCount](self, "stringCount");
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v5);
  if (v5)
  {
    v7 = 0;
    v8 = *((_QWORD *)v4 + 25);
    v9 = 1;
    do
    {
      v10 = -[CHChannelEnum stringAtIndex:](self, "stringAtIndex:", v7);
      if (v8)
        EnabledState = OZChannelEnum::getEnabledState(v4, v7);
      else
        EnabledState = 1;
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", EnabledState);
      objc_msgSend(v6, "setObject:forKey:", v12, v10);

      v7 = v9;
    }
    while (v5 > v9++);
  }
  return v6;
}

- (void)setEnabledStateForStrings:(id)a3
{
  OZChannelBase *pOZChannel;
  OZChannelEnum *v6;
  unint64_t v7;
  BOOL *v8;
  uint64_t i;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel)
  else
    v6 = 0;
  v7 = -[CHChannelEnum stringCount](self, "stringCount");
  v8 = (BOOL *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v7)
  {
    for (i = 0; i != v7; ++i)
      v8[i] = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", -[CHChannelEnum stringAtIndex:](self, "stringAtIndex:", i)), "BOOLValue");
  }
  OZChannelEnum::setEnabledStates(v6, v8, v7);
}

@end
