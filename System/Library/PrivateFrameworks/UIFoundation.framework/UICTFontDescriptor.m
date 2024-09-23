@implementation UICTFontDescriptor

- (id)copyWithZone:(_NSZone *)a3
{
  UICTFontDescriptor *v4;

  v4 = self;
  return self;
}

- (BOOL)isEqual:(id)a3
{
  if (!a3)
    return 0;
  if (self == a3)
    return 1;
  return _CFNonObjCEqual() != 0;
}

- (id)objectForKey:(id)a3
{
  return (id)(id)CTFontDescriptorCopyAttribute((CTFontDescriptorRef)self, (CFStringRef)a3);
}

- (id)fontDescriptorByAddingAttributes:(id)a3
{
  const __CFDictionary *v4;
  CTFontDescriptorRef CopyWithAttributes;

  v4 = +[UIFontDescriptor _createMungledDictionary:](UIFontDescriptor, "_createMungledDictionary:", a3);
  CopyWithAttributes = CTFontDescriptorCreateCopyWithAttributes((CTFontDescriptorRef)self, v4);

  return CopyWithAttributes;
}

- (id)fontAttributes
{
  return CTFontDescriptorCopyAttributes((CTFontDescriptorRef)self);
}

- (BOOL)allowsWeakReference
{
  return _CFIsDeallocating() == 0;
}

- (BOOL)retainWeakReference
{
  return _CFTryRetain() != 0;
}

+ (id)fontDescriptorWithFontAttributes:(id)a3
{
  const __CFDictionary *v3;
  CTFontDescriptorRef v4;

  v3 = +[UIFontDescriptor _createMungledDictionary:](UIFontDescriptor, "_createMungledDictionary:", a3);
  v4 = CTFontDescriptorCreateWithAttributes(v3);

  return v4;
}

+ (id)fontDescriptorWithName:(id)a3 size:(double)a4
{
  return CTFontDescriptorCreateWithNameAndSize((CFStringRef)a3, a4);
}

+ (id)fontDescriptorWithName:(id)a3 matrix:(CGAffineTransform *)a4
{
  __int128 v6;
  uint64_t v7;
  _OWORD v9[3];

  v6 = *(_OWORD *)&a4->c;
  v9[0] = *(_OWORD *)&a4->a;
  v9[1] = v6;
  v9[2] = *(_OWORD *)&a4->tx;
  v7 = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGAffineTransform:", v9);
  return (id)objc_msgSend(a1, "fontDescriptorWithFontAttributes:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", a3, CFSTR("NSFontNameAttribute"), v7, CFSTR("NSFontMatrixAttribute"), 0));
}

- (id)matchingFontDescriptorsWithMandatoryKeys:(id)a3
{
  return CTFontDescriptorCreateMatchingFontDescriptors((CTFontDescriptorRef)self, (CFSetRef)a3);
}

- (id)matchingFontDescriptorWithMandatoryKeys:(id)a3
{
  return CTFontDescriptorCreateMatchingFontDescriptor((CTFontDescriptorRef)self, (CFSetRef)a3);
}

@end
