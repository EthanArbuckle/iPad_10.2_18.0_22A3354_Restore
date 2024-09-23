@implementation SCRCComposedCharacter

- (id)_initWithCharacter:(int)a3
{
  SCRCComposedCharacter *v4;
  int *v5;
  CFStringEncoding v6;
  CFStringRef v7;
  uint64_t v8;
  UInt8 bytes[4];

  *(_DWORD *)bytes = a3;
  v4 = -[SCRCComposedCharacter init](self, "init");
  if (v4)
  {
    v5 = (int *)malloc_type_malloc(4uLL, 0x100004052888210uLL);
    v4->_originalRepresentation = v5;
    *v5 = a3;
    v6 = SCRCUTF32Encoding();
    v7 = CFStringCreateWithBytes(0, bytes, 4, v6, 0);
    if (*(int *)bytes < 0x10000)
      v8 = 1;
    else
      v8 = 2;
    v4->_originalCombinedCharacterLength = v8;
    v4->_originalCombinedCharacter = (__CFString *)v7;
    v4->_originalRepresentationLength = 1;
  }
  return v4;
}

- (id)_initWithSimpleCharacter:(int)a3
{
  id result;
  uint64_t v4;
  uint64_t v5;

  result = -[SCRCComposedCharacter _initWithCharacter:](self, "_initWithCharacter:", *(_QWORD *)&a3);
  if (result)
  {
    v4 = *((_QWORD *)result + 4);
    *((_QWORD *)result + 5) = v4;
    *((_QWORD *)result + 6) = v4;
    v5 = *((_QWORD *)result + 1);
    *((_QWORD *)result + 2) = v5;
    *((_QWORD *)result + 3) = v5;
  }
  return result;
}

- (SCRCComposedCharacter)initWithCharacter:(int)a3
{
  id v3;
  SCRCComposedCharacter *v4;

  if (a3 > 127)
    v3 = -[SCRCComposedCharacter _initWithCharacter:](self, "_initWithCharacter:");
  else
    v3 = -[SCRCComposedCharacter _initWithSimpleCharacter:](self, "_initWithSimpleCharacter:");
  v4 = (SCRCComposedCharacter *)v3;

  return v4;
}

- (id)_initWithComposedCharacter:(__CFString *)a3
{
  SCRCComposedCharacter *v4;
  SCRCComposedCharacter *v5;

  v4 = -[SCRCComposedCharacter init](self, "init");
  v5 = v4;
  if (a3 && v4)
  {
    CFRetain(a3);
    v5->_originalCombinedCharacter = a3;
    v5->_originalCombinedCharacterLength = CFStringGetLength(a3);
    v5->_originalRepresentation = (int *)SCRCCopyStringToUChar32Array(v5->_originalCombinedCharacter, &v5->_originalRepresentationLength);
  }
  return v5;
}

- (SCRCComposedCharacter)initWithComposedCharacter:(__CFString *)a3
{
  SCRCComposedCharacter *v5;

  if (-[__CFString scrc_containsOnlyOneGlyph](a3, "scrc_containsOnlyOneGlyph"))
  {
    self = (SCRCComposedCharacter *)-[SCRCComposedCharacter _initWithComposedCharacter:](self, "_initWithComposedCharacter:", a3);
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)dealloc
{
  __CFString *originalCombinedCharacter;
  int *originalRepresentation;
  int *normalFormDRepresentation;
  int *normalFormKCRepresentation;
  objc_super v7;

  originalCombinedCharacter = self->_originalCombinedCharacter;
  if (originalCombinedCharacter)
    CFRelease(originalCombinedCharacter);
  originalRepresentation = self->_originalRepresentation;
  if (originalRepresentation)
  {
    if (originalRepresentation == self->_normalFormDRepresentation)
      self->_normalFormDRepresentation = 0;
    if (originalRepresentation == self->_normalFormKCRepresentation)
      self->_normalFormKCRepresentation = 0;
    free(originalRepresentation);
    self->_originalRepresentation = 0;
    self->_originalRepresentationLength = 0;
  }
  normalFormDRepresentation = self->_normalFormDRepresentation;
  if (normalFormDRepresentation)
  {
    free(normalFormDRepresentation);
    self->_normalFormDRepresentation = 0;
    self->_normalFormDRepresentationLength = 0;
  }
  normalFormKCRepresentation = self->_normalFormKCRepresentation;
  if (normalFormKCRepresentation)
  {
    free(normalFormKCRepresentation);
    self->_normalFormKCRepresentation = 0;
    self->_normalFormKCRepresentationLength = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)SCRCComposedCharacter;
  -[SCRCComposedCharacter dealloc](&v7, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  SCRCComposedCharacter *v4;
  __CFString *originalCombinedCharacter;
  const __CFString *v6;
  unsigned __int8 v7;
  objc_super v9;

  v4 = (SCRCComposedCharacter *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self == v4)
    {
      v7 = 1;
    }
    else
    {
      originalCombinedCharacter = self->_originalCombinedCharacter;
      v7 = originalCombinedCharacter
        && (v6 = v4->_originalCombinedCharacter) != 0
        && CFStringCompare(originalCombinedCharacter, v6, 0x10uLL) == kCFCompareEqualTo;
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SCRCComposedCharacter;
    v7 = -[SCRCComposedCharacter isEqual:](&v9, sel_isEqual_, v4);
  }

  return v7;
}

- (BOOL)isEqualToUChar32:(int)a3
{
  SCRCComposedCharacter *v4;

  v4 = -[SCRCComposedCharacter initWithCharacter:]([SCRCComposedCharacter alloc], "initWithCharacter:", *(_QWORD *)&a3);
  LOBYTE(self) = -[SCRCComposedCharacter isEqual:](self, "isEqual:", v4);

  return (char)self;
}

- (__CFString)originalString
{
  return self->_originalCombinedCharacter;
}

- (__CFString)copyUnicodeDescriptionString
{
  __CFString *Mutable;
  unint64_t v4;
  char v5;
  uint64_t v6;
  const __CFString *v7;
  __CFString *v8;
  __CFString *v9;

  Mutable = CFStringCreateMutable(0, 0);
  if (self->_normalFormKCRepresentationLength
    || (-[SCRCComposedCharacter _buildFormKC](self, "_buildFormKC"), self->_normalFormKCRepresentationLength))
  {
    v4 = 0;
    v5 = 0;
    do
    {
      if ((v5 & 1) != 0)
      {
        v6 = objc_msgSend(MEMORY[0x24BDD1488], "localizedCoreStringForKey:", CFSTR("with"));
        if (v6)
        {
          v7 = (const __CFString *)v6;
          CFStringAppend(Mutable, CFSTR(" "));
          CFStringAppend(Mutable, v7);
          CFStringAppend(Mutable, CFSTR(" "));
        }
      }
      v8 = _CopyUnicodeDescriptionStringForCharacter(self->_normalFormKCRepresentation[v4]);
      if (v8)
      {
        v9 = v8;
        CFStringAppend(Mutable, v8);
        CFRelease(v9);
      }
      ++v4;
      v5 = 1;
    }
    while (v4 < self->_normalFormKCRepresentationLength);
  }
  return Mutable;
}

- (void)_buildFormD
{
  SCRCComposedCharacter *v3;
  SCRCComposedCharacter *v4;
  const __CFString *originalCombinedCharacter;
  __CFString *MutableCopy;
  const __CFString *v7;
  UInt8 *v8;

  v3 = self;
  v4 = v3;
  originalCombinedCharacter = v3->_originalCombinedCharacter;
  if (originalCombinedCharacter
    && (MutableCopy = CFStringCreateMutableCopy(0, v3->_originalCombinedCharacterLength, originalCombinedCharacter)) != 0)
  {
    v7 = MutableCopy;
    CFStringNormalize(MutableCopy, kCFStringNormalizationFormD);
    v8 = SCRCCopyStringToUChar32Array(v7, &self->_normalFormDRepresentationLength);
    CFRelease(v7);
  }
  else
  {
    v8 = 0;
  }

  v4->_normalFormDRepresentation = (int *)v8;
}

- (void)_buildFormKC
{
  SCRCComposedCharacter *v3;
  SCRCComposedCharacter *v4;
  const __CFString *originalCombinedCharacter;
  __CFString *MutableCopy;
  const __CFString *v7;
  UInt8 *v8;

  v3 = self;
  v4 = v3;
  originalCombinedCharacter = v3->_originalCombinedCharacter;
  if (originalCombinedCharacter
    && (MutableCopy = CFStringCreateMutableCopy(0, v3->_originalCombinedCharacterLength, originalCombinedCharacter)) != 0)
  {
    v7 = MutableCopy;
    CFStringNormalize(MutableCopy, kCFStringNormalizationFormKC);
    v8 = SCRCCopyStringToUChar32Array(v7, &self->_normalFormKCRepresentationLength);
    CFRelease(v7);
  }
  else
  {
    v8 = 0;
  }

  v4->_normalFormKCRepresentation = (int *)v8;
}

- (int)formDCharAtIndex:(unint64_t)a3
{
  unint64_t normalFormDRepresentationLength;

  normalFormDRepresentationLength = self->_normalFormDRepresentationLength;
  if (!normalFormDRepresentationLength)
  {
    -[SCRCComposedCharacter _buildFormD](self, "_buildFormD");
    normalFormDRepresentationLength = self->_normalFormDRepresentationLength;
  }
  if (normalFormDRepresentationLength <= a3)
    return 0;
  else
    return self->_normalFormDRepresentation[a3];
}

- (int)formKCCharAtIndex:(unint64_t)a3
{
  unint64_t normalFormKCRepresentationLength;

  normalFormKCRepresentationLength = self->_normalFormKCRepresentationLength;
  if (!normalFormKCRepresentationLength)
  {
    -[SCRCComposedCharacter _buildFormKC](self, "_buildFormKC");
    normalFormKCRepresentationLength = self->_normalFormKCRepresentationLength;
  }
  if (normalFormKCRepresentationLength <= a3)
    return 0;
  else
    return self->_normalFormKCRepresentation[a3];
}

- (int)originalFromCharAtIndex:(unint64_t)a3
{
  int *originalRepresentation;

  originalRepresentation = self->_originalRepresentation;
  if (originalRepresentation && self->_originalRepresentationLength > a3)
    return originalRepresentation[a3];
  else
    return 0;
}

- (BOOL)_formKCContaintsUpperCase
{
  void *v3;
  unint64_t v4;
  int v5;

  if (!self->_normalFormKCRepresentationLength)
    -[SCRCComposedCharacter _buildFormKC](self, "_buildFormKC");
  objc_msgSend(MEMORY[0x24BDD14A8], "uppercaseLetterCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_normalFormKCRepresentationLength)
  {
    v4 = 0;
    do
    {
      v5 = objc_msgSend(v3, "longCharacterIsMember:", self->_normalFormKCRepresentation[v4]);
      if (v5)
        break;
      ++v4;
    }
    while (v4 < self->_normalFormKCRepresentationLength);
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (unint64_t)originalLength
{
  return self->_originalCombinedCharacterLength;
}

- (unint64_t)formDLength
{
  unint64_t result;

  result = self->_normalFormDRepresentationLength;
  if (!result)
  {
    -[SCRCComposedCharacter _buildFormD](self, "_buildFormD");
    return self->_normalFormDRepresentationLength;
  }
  return result;
}

- (unint64_t)formKCLength
{
  unint64_t result;

  result = self->_normalFormKCRepresentationLength;
  if (!result)
  {
    -[SCRCComposedCharacter _buildFormKC](self, "_buildFormKC");
    return self->_normalFormKCRepresentationLength;
  }
  return result;
}

@end
