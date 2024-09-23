@implementation UICTFont

- (unint64_t)hash
{
  unint64_t v3;
  void *ExtraData;

  v3 = _CFNonObjCHash();
  ExtraData = (void *)__CTFontGetExtraData((const __CTFont *)self);
  if (ExtraData)
    v3 ^= objc_msgSend(ExtraData, "hash");
  return v3;
}

- (UICTFont)retain
{
  _CFNonObjCRetain();
  return self;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  void *ExtraData;
  uint64_t v7;

  if (!a3)
  {
    LOBYTE(v5) = 0;
    return v5;
  }
  if (self == a3)
    goto LABEL_7;
  v5 = _CFNonObjCEqual();
  if (v5)
  {
    ExtraData = (void *)__CTFontGetExtraData((const __CTFont *)self);
    v7 = __CTFontGetExtraData((const __CTFont *)a3);
    if (ExtraData != (void *)v7)
    {
      LOBYTE(v5) = objc_msgSend(ExtraData, "isEqualToExtraData:", v7);
      return v5;
    }
LABEL_7:
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (BOOL)retainWeakReference
{
  return _CFTryRetain() != 0;
}

- (BOOL)allowsWeakReference
{
  return _CFIsDeallocating() == 0;
}

@end
