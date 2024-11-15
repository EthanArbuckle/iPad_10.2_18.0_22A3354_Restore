@implementation SXComponentLayoutAttributeDescriptor

+ (SXComponentLayoutAttributeDescriptor)descriptorWithFromLayoutAttribute:(int)a3 toLayoutAttribute:(BOOL)a4 ignoreMargin:
{
  SXComponentLayoutAttributeDescriptor *v7;
  objc_super v9;

  objc_opt_self();
  v7 = [SXComponentLayoutAttributeDescriptor alloc];
  if (v7)
  {
    v9.receiver = v7;
    v9.super_class = (Class)SXComponentLayoutAttributeDescriptor;
    v7 = (SXComponentLayoutAttributeDescriptor *)objc_msgSendSuper2(&v9, sel_init);
    if (v7)
    {
      v7->_fromLayoutAttribute = a2;
      v7->_toLayoutAttribute = a3;
      v7->_ignoreMargins = a4;
    }
  }
  return v7;
}

- (id)initWithFromLayoutAttribute:(int)a3 toLayoutAttribute:(char)a4 ignoreMargin:
{
  objc_super v7;

  if (result)
  {
    v7.receiver = result;
    v7.super_class = (Class)SXComponentLayoutAttributeDescriptor;
    result = objc_msgSendSuper2(&v7, sel_init);
    if (result)
    {
      *((_DWORD *)result + 3) = a2;
      *((_DWORD *)result + 4) = a3;
      *((_BYTE *)result + 8) = a4;
    }
  }
  return result;
}

- (uint64_t)fromLayoutAttribute
{
  if (result)
    return *(unsigned int *)(result + 12);
  return result;
}

- (uint64_t)toLayoutAttribute
{
  if (result)
    return *(unsigned int *)(result + 16);
  return result;
}

- (BOOL)ignoreMargins
{
  if (result)
    return *(_BYTE *)(result + 8) != 0;
  return result;
}

@end
