@implementation NIAcwgM3Msg

- (NIAcwgM3Msg)initWithSelectedRanMultiplier:(unsigned __int8)a3 selectedNumChapsPerSlot:(unsigned __int8)a4 numResponders:(unsigned __int8)a5 numSlotsPerRound:(unsigned __int8)a6 supportedSyncCodeIndexBitmask:(unsigned int)a7 selectedHoppingConfigBitmask:(unsigned __int8)a8 macMode:(unsigned __int8)a9
{
  NIAcwgM3Msg *result;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)NIAcwgM3Msg;
  result = -[NIAcwgM3Msg init](&v16, "init");
  if (result)
  {
    result->_selectedRanMultiplier = a3;
    result->_selectedNumChapsPerSlot = a4;
    result->_numResponders = a5;
    result->_numSlotsPerRound = a6;
    result->_supportedSyncCodeIndexBitmask = a7;
    result->_selectedHoppingConfigBitmask = a8;
    result->_macMode = a9;
  }
  return result;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("<%@:\n"), v5));

  objc_msgSend(v6, "appendFormat:", CFSTR("selectedRanMultiplier:%u\n"), self->_selectedRanMultiplier);
  objc_msgSend(v6, "appendFormat:", CFSTR("selectedNumChapsPerSlot:%u\n"), self->_selectedNumChapsPerSlot);
  objc_msgSend(v6, "appendFormat:", CFSTR("numResponders:%u\n"), self->_numResponders);
  objc_msgSend(v6, "appendFormat:", CFSTR("numSlotsPerRound:%u\n"), self->_numSlotsPerRound);
  objc_msgSend(v6, "appendFormat:", CFSTR("supportedSyncCodeIndexBitmask:0x%08x\n"), self->_supportedSyncCodeIndexBitmask);
  objc_msgSend(v6, "appendFormat:", CFSTR("selectedHoppingConfigBitmask:0x%02x\n"), self->_selectedHoppingConfigBitmask);
  objc_msgSend(v6, "appendFormat:", CFSTR("macMode:%u>"), self->_macMode);
  return v6;
}

- (AcwgM3MsgStruct)toStruct
{
  int v2;
  unint64_t v3;
  AcwgM3MsgStruct result;

  v2 = *(unsigned __int16 *)&self->_selectedHoppingConfigBitmask;
  v3 = *(unsigned int *)&self->_selectedRanMultiplier | ((unint64_t)self->_supportedSyncCodeIndexBitmask << 32);
  result.var0 = v3;
  result.var1 = BYTE1(v3);
  result.var2 = BYTE2(v3);
  result.var3 = BYTE3(v3);
  result.var4 = HIDWORD(v3);
  result.var5 = v2;
  result.var6 = BYTE1(v2);
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  uint64_t v6;

  v4 = objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3);
  LOBYTE(v6) = self->_macMode;
  return objc_msgSend(v4, "initWithSelectedRanMultiplier:selectedNumChapsPerSlot:numResponders:numSlotsPerRound:supportedSyncCodeIndexBitmask:selectedHoppingConfigBitmask:macMode:", self->_selectedRanMultiplier, self->_selectedNumChapsPerSlot, self->_numResponders, self->_numSlotsPerRound, self->_supportedSyncCodeIndexBitmask, self->_selectedHoppingConfigBitmask, v6);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", self->_selectedRanMultiplier, CFSTR("selectedRanMultiplier"));
  objc_msgSend(v4, "encodeInt:forKey:", self->_selectedNumChapsPerSlot, CFSTR("selectedNumChapsPerSlot"));
  objc_msgSend(v4, "encodeInt:forKey:", self->_numResponders, CFSTR("numResponders"));
  objc_msgSend(v4, "encodeInt:forKey:", self->_numSlotsPerRound, CFSTR("numSlotsPerRound"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_supportedSyncCodeIndexBitmask, CFSTR("supportedSyncCodeIndexBitmask"));
  objc_msgSend(v4, "encodeInt:forKey:", self->_selectedHoppingConfigBitmask, CFSTR("selectedHoppingConfigBitmask"));
  objc_msgSend(v4, "encodeInt:forKey:", self->_macMode, CFSTR("macMode"));

}

- (NIAcwgM3Msg)initWithCoder:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = v4;
  if (self)
  {
    self->_selectedRanMultiplier = objc_msgSend(v4, "decodeIntForKey:", CFSTR("selectedRanMultiplier"));
    self->_selectedNumChapsPerSlot = objc_msgSend(v5, "decodeIntForKey:", CFSTR("selectedNumChapsPerSlot"));
    self->_numResponders = objc_msgSend(v5, "decodeIntForKey:", CFSTR("numResponders"));
    self->_numSlotsPerRound = objc_msgSend(v5, "decodeIntForKey:", CFSTR("numSlotsPerRound"));
    self->_supportedSyncCodeIndexBitmask = objc_msgSend(v5, "decodeInt64ForKey:", CFSTR("supportedSyncCodeIndexBitmask"));
    self->_selectedHoppingConfigBitmask = objc_msgSend(v5, "decodeIntForKey:", CFSTR("selectedHoppingConfigBitmask"));
    self->_macMode = objc_msgSend(v5, "decodeIntForKey:", CFSTR("macMode"));
  }

  return self;
}

- (unsigned)selectedRanMultiplier
{
  return self->_selectedRanMultiplier;
}

- (unsigned)selectedNumChapsPerSlot
{
  return self->_selectedNumChapsPerSlot;
}

- (unsigned)numResponders
{
  return self->_numResponders;
}

- (unsigned)numSlotsPerRound
{
  return self->_numSlotsPerRound;
}

- (unsigned)supportedSyncCodeIndexBitmask
{
  return self->_supportedSyncCodeIndexBitmask;
}

- (unsigned)selectedHoppingConfigBitmask
{
  return self->_selectedHoppingConfigBitmask;
}

- (unsigned)macMode
{
  return self->_macMode;
}

@end
