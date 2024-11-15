@implementation RBDecodedFontMetadata

- (uint64_t)fontUID
{
  if (result)
    return *(_QWORD *)(result + 8);
  return result;
}

+ (id)fontMetadata:(uint64_t)a1
{
  id AssociatedObject;
  id v4;

  objc_opt_self();
  AssociatedObject = objc_getAssociatedObject(a2, "RBDecodedFontMetadata");
  if (!AssociatedObject)
    return 0;
  v4 = AssociatedObject;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  return v4;
}

- (_QWORD)initWithFontUID:(const void *)a3 glyphMap:
{
  _QWORD *v5;
  _QWORD *v6;
  const void *v7;
  CFTypeRef v8;
  const void *v9;
  CFTypeRef v10;
  objc_super v12;

  if (!a1)
    return 0;
  v12.receiver = a1;
  v12.super_class = (Class)RBDecodedFontMetadata;
  v5 = objc_msgSendSuper2(&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    v7 = (const void *)v5[1];
    if (v7 != a2)
    {
      if (v7)
        CFRelease(v7);
      if (a2)
        v8 = CFRetain(a2);
      else
        v8 = 0;
      v6[1] = v8;
    }
    v9 = (const void *)v6[2];
    if (v9 != a3)
    {
      if (v9)
        CFRelease(v9);
      if (a3)
        v10 = CFRetain(a3);
      else
        v10 = 0;
      v6[2] = v10;
    }
  }
  return v6;
}

- (uint64_t)glyphMap
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

- (void).cxx_destruct
{
  __CFDictionary *p;
  __CFString *v4;

  p = self->_glyph_map._p;
  if (p)
    CFRelease(p);
  v4 = self->_uid._p;
  if (v4)
    CFRelease(v4);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
