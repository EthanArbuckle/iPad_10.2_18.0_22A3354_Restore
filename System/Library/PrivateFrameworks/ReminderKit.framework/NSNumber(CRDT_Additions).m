@implementation NSNumber(CRDT_Additions)

- (void)mergeWith:()CRDT_Additions
{
  id v4;
  id v5;

  v5 = a3;
  if ((objc_msgSend(a1, "isEqual:") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Cannot merge NSNumber with different value."), 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v4);
  }

}

- (uint64_t)initWithCRCoder:()CRDT_Additions
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  if (objc_msgSend(v4, "hasDecodableValueForKey:", CFSTR("integerValue")))
  {
    v5 = objc_msgSend(a1, "initWithInteger:", (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("integerValue")));
  }
  else if (objc_msgSend(v4, "hasDecodableValueForKey:", CFSTR("doubleValue")))
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("doubleValue"));
    v5 = objc_msgSend(a1, "initWithDouble:");
  }
  else
  {
    v5 = objc_msgSend(a1, "init");
  }
  v6 = v5;

  return v6;
}

- (void)encodeWithCRCoder:()CRDT_Additions
{
  CFNumberType Type;
  id v5;

  v5 = a3;
  Type = CFNumberGetType(a1);
  if ((unint64_t)Type <= kCFNumberCGFloatType)
  {
    if (((1 << Type) & 0xCF9E) != 0)
    {
      objc_msgSend(v5, "encodeInt64:forKey:", -[__CFNumber integerValue](a1, "integerValue"), CFSTR("integerValue"));
    }
    else if (((1 << Type) & 0x13060) != 0)
    {
      -[__CFNumber doubleValue](a1, "doubleValue");
      objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("doubleValue"));
    }
  }

}

- (uint64_t)deltaSince:()CRDT_Additions in:
{
  return 0;
}

@end
