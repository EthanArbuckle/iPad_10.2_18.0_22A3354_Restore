@implementation OADPresetTextWarp

- (void)setPresetTextWarpType:(unsigned __int8)a3
{
  self->mPresetTextWarpType = a3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int mPresetTextWarpType;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (mPresetTextWarpType = self->mPresetTextWarpType,
        mPresetTextWarpType == objc_msgSend(v4, "presetTextWarpType")))
  {
    v8.receiver = self;
    v8.super_class = (Class)OADPresetTextWarp;
    v6 = -[OADTextWarp isEqual:](&v8, sel_isEqual_, v4);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unsigned)presetTextWarpType
{
  return self->mPresetTextWarpType;
}

- (unint64_t)hash
{
  uint64_t mPresetTextWarpType;
  objc_super v4;

  mPresetTextWarpType = self->mPresetTextWarpType;
  v4.receiver = self;
  v4.super_class = (Class)OADPresetTextWarp;
  return -[OADTextWarp hash](&v4, sel_hash) ^ mPresetTextWarpType;
}

+ (id)stringWithPresetTextWarpType:(unsigned __int8)a3
{
  if (a3 > 0x27u)
    return CFSTR("textPlain");
  else
    return off_24F39DF70[(char)a3];
}

@end
