@implementation PRPinyinModification

+ (id)modificationsForInputString:(id)a3
{
  AppleSpell *v4;

  v4 = (AppleSpell *)_sharedChecker;
  if (!_sharedChecker)
  {
    v4 = objc_alloc_init(AppleSpell);
    _sharedChecker = (uint64_t)v4;
  }
  return -[AppleSpell spellServer:modificationsForPinyinInputString:](v4, "spellServer:modificationsForPinyinInputString:", 0, a3);
}

+ (id)finalModificationsForInputString:(id)a3
{
  AppleSpell *v4;

  v4 = (AppleSpell *)_sharedChecker;
  if (!_sharedChecker)
  {
    v4 = objc_alloc_init(AppleSpell);
    _sharedChecker = (uint64_t)v4;
  }
  return -[AppleSpell spellServer:finalModificationsForPinyinInputString:](v4, "spellServer:finalModificationsForPinyinInputString:", 0, a3);
}

- (PRPinyinModification)initWithRange:(_NSRange)a3 replacementString:(id)a4 modificationType:(unint64_t)a5 syllableRange:(_NSRange)a6 additionalSyllableRange:(_NSRange)a7 modificationScore:(double)a8 syllableCountScore:(unint64_t)a9 syllableLetters:(const char *)a10 producesPartialSyllable:(BOOL)a11 isTemporary:(BOOL)a12
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v17;
  NSUInteger v18;
  PRPinyinModification *v20;
  unsigned __int8 *letters;
  size_t v22;
  uint64_t v24;
  objc_super v25;

  length = a6.length;
  location = a6.location;
  v17 = a3.length;
  v18 = a3.location;
  v24 = objc_msgSend(a4, "length");
  v25.receiver = self;
  v25.super_class = (Class)PRPinyinModification;
  v20 = -[PRPinyinModification init](&v25, sel_init);
  v20->_range.location = v18;
  v20->_range.length = v17;
  v20->_replacementString = (NSString *)objc_msgSend(a4, "copy");
  v20->_modificationType = a5;
  v20->_syllableRange.location = location;
  v20->_syllableRange.length = length;
  v20->_additionalSyllableRange = a7;
  v20->_modificationScore = a8;
  letters = v20->_letters;
  v20->_syllableCountScore = a9;
  if (a5 != 5)
  {
    if (a10)
    {
      v22 = length - v17 + v24;
      if (v22 <= 6)
      {
        memmove(v20->_letters, a10, v22);
        letters += v22;
      }
    }
  }
  *letters = 0;
  v20->_producesPartialSyllable = a11;
  v20->_isTemporary = a12;
  return v20;
}

- (PRPinyinModification)initWithRange:(_NSRange)a3 replacementString:(id)a4 modificationType:(unint64_t)a5 syllableRange:(_NSRange)a6 additionalSyllableRange:(_NSRange)a7 modificationScore:(double)a8 syllableCountScore:(unint64_t)a9 syllableLetters:(const char *)a10 producesPartialSyllable:(BOOL)a11
{
  uint64_t v12;

  LOWORD(v12) = a11;
  return -[PRPinyinModification initWithRange:replacementString:modificationType:syllableRange:additionalSyllableRange:modificationScore:syllableCountScore:syllableLetters:producesPartialSyllable:isTemporary:](self, "initWithRange:replacementString:modificationType:syllableRange:additionalSyllableRange:modificationScore:syllableCountScore:syllableLetters:producesPartialSyllable:isTemporary:", a3.location, a3.length, a4, a5, a6.location, a6.length, a8, a7.location, a7.length, a9, a10, v12);
}

- (PRPinyinModification)initWithRange:(_NSRange)a3 replacementString:(id)a4 modificationType:(unint64_t)a5 syllableRange:(_NSRange)a6 additionalSyllableRange:(_NSRange)a7 modificationScore:(double)a8
{
  uint64_t v9;

  LOWORD(v9) = 0;
  return -[PRPinyinModification initWithRange:replacementString:modificationType:syllableRange:additionalSyllableRange:modificationScore:syllableCountScore:syllableLetters:producesPartialSyllable:isTemporary:](self, "initWithRange:replacementString:modificationType:syllableRange:additionalSyllableRange:modificationScore:syllableCountScore:syllableLetters:producesPartialSyllable:isTemporary:", a3.location, a3.length, a4, a5, a6.location, a6.length, a8, a7.location, a7.length, 0, 0, v9);
}

- (PRPinyinModification)initWithRange:(_NSRange)a3 replacementString:(id)a4 modificationType:(unint64_t)a5 syllableRange:(_NSRange)a6 modificationScore:(double)a7 syllableCountScore:(unint64_t)a8 syllableLetters:(const char *)a9 producesPartialSyllable:(BOOL)a10 isTemporary:(BOOL)a11
{
  uint64_t v12;

  LOWORD(v12) = __PAIR16__(a11, a10);
  return -[PRPinyinModification initWithRange:replacementString:modificationType:syllableRange:additionalSyllableRange:modificationScore:syllableCountScore:syllableLetters:producesPartialSyllable:isTemporary:](self, "initWithRange:replacementString:modificationType:syllableRange:additionalSyllableRange:modificationScore:syllableCountScore:syllableLetters:producesPartialSyllable:isTemporary:", a3.location, a3.length, a4, a5, a6.location, a6.length, a7, 0x7FFFFFFFFFFFFFFFLL, 0, a8, a9, v12);
}

- (PRPinyinModification)initWithRange:(_NSRange)a3 replacementString:(id)a4 modificationType:(unint64_t)a5 syllableRange:(_NSRange)a6 modificationScore:(double)a7 syllableCountScore:(unint64_t)a8 syllableLetters:(const char *)a9 producesPartialSyllable:(BOOL)a10
{
  uint64_t v11;

  LOWORD(v11) = a10;
  return -[PRPinyinModification initWithRange:replacementString:modificationType:syllableRange:additionalSyllableRange:modificationScore:syllableCountScore:syllableLetters:producesPartialSyllable:isTemporary:](self, "initWithRange:replacementString:modificationType:syllableRange:additionalSyllableRange:modificationScore:syllableCountScore:syllableLetters:producesPartialSyllable:isTemporary:", a3.location, a3.length, a4, a5, a6.location, a6.length, a7, 0x7FFFFFFFFFFFFFFFLL, 0, a8, a9, v11);
}

- (PRPinyinModification)initWithRange:(_NSRange)a3 replacementString:(id)a4 modificationType:(unint64_t)a5 syllableRange:(_NSRange)a6 modificationScore:(double)a7 isTemporary:(BOOL)a8
{
  uint64_t v9;

  BYTE1(v9) = a8;
  LOBYTE(v9) = 0;
  return -[PRPinyinModification initWithRange:replacementString:modificationType:syllableRange:additionalSyllableRange:modificationScore:syllableCountScore:syllableLetters:producesPartialSyllable:isTemporary:](self, "initWithRange:replacementString:modificationType:syllableRange:additionalSyllableRange:modificationScore:syllableCountScore:syllableLetters:producesPartialSyllable:isTemporary:", a3.location, a3.length, a4, a5, a6.location, a6.length, a7, 0x7FFFFFFFFFFFFFFFLL, 0, 0, 0, v9);
}

- (PRPinyinModification)initWithRange:(_NSRange)a3 replacementString:(id)a4 modificationType:(unint64_t)a5 syllableRange:(_NSRange)a6 modificationScore:(double)a7
{
  uint64_t v8;

  LOWORD(v8) = 0;
  return -[PRPinyinModification initWithRange:replacementString:modificationType:syllableRange:additionalSyllableRange:modificationScore:syllableCountScore:syllableLetters:producesPartialSyllable:isTemporary:](self, "initWithRange:replacementString:modificationType:syllableRange:additionalSyllableRange:modificationScore:syllableCountScore:syllableLetters:producesPartialSyllable:isTemporary:", a3.location, a3.length, a4, a5, a6.location, a6.length, a7, 0x7FFFFFFFFFFFFFFFLL, 0, 0, 0, v8);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRPinyinModification;
  -[PRPinyinModification dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v13;
  uint64_t v14;
  unint64_t modificationType;
  double modificationScore;
  double v18;
  unint64_t syllableCountScore;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  if (self == a3)
  {
    LOBYTE(v13) = 1;
  }
  else
  {
    v25 = v9;
    v26 = v5;
    v27 = v4;
    v28 = v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_20:
      LOBYTE(v13) = 0;
      return v13;
    }
    v13 = -[NSString isEqualToString:](self->_replacementString, "isEqualToString:", objc_msgSend(a3, "replacementString"));
    if (v13)
    {
      if (self->_range.location != objc_msgSend(a3, "range") || self->_range.length != v14)
        goto LABEL_20;
      modificationType = self->_modificationType;
      if (modificationType != objc_msgSend(a3, "modificationType"))
        goto LABEL_20;
      modificationScore = self->_modificationScore;
      objc_msgSend(a3, "modificationScore");
      if (modificationScore != v18)
        goto LABEL_20;
      syllableCountScore = self->_syllableCountScore;
      if (syllableCountScore != objc_msgSend(a3, "syllableCountScore"))
        goto LABEL_20;
      v21 = objc_msgSend(a3, "syllableRange");
      LOBYTE(v13) = 0;
      if (self->_syllableRange.location == v21 && self->_syllableRange.length == v20)
      {
        v23 = objc_msgSend(a3, "additionalSyllableRange");
        LOBYTE(v13) = 0;
        if (self->_additionalSyllableRange.location == v23 && self->_additionalSyllableRange.length == v22)
        {
          if (!self->_isTemporary)
            goto LABEL_19;
          v13 = objc_msgSend(a3, "isTemporary");
          if (!v13)
            return v13;
          if (!self->_isTemporary)
          {
LABEL_19:
            if ((objc_msgSend(a3, "isTemporary", v10, v25, v6, v26, v27, v28, v7, v8) & 1) != 0)
              goto LABEL_20;
          }
          LOBYTE(v13) = 1;
        }
      }
    }
  }
  return v13;
}

- (unint64_t)hash
{
  return self->_range.location ^ self->_range.length ^ -[NSString hash](self->_replacementString, "hash");
}

- (id)description
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  NSString *v12;
  NSString *v13;
  unint64_t v14;
  _BOOL4 v15;
  _BOOL4 v16;
  void *v17;
  NSString *v18;
  const __CFString *v19;
  NSString *v20;
  unint64_t v22;
  NSString *v23;
  NSString *v24;
  unint64_t v25;
  unint64_t v26;
  _BOOL8 v27;
  _BOOL8 v28;
  unint64_t v29;
  id v30;
  NSRange v31;
  NSRange v32;
  NSRange v33;
  NSRange v34;

  v30 = -[PRPinyinModification replacementString](self, "replacementString");
  v29 = -[PRPinyinModification modificationType](self, "modificationType");
  v3 = -[PRPinyinModification range](self, "range");
  v5 = v4;
  v6 = -[PRPinyinModification syllableRange](self, "syllableRange");
  v8 = v7;
  v9 = -[PRPinyinModification additionalSyllableRange](self, "additionalSyllableRange");
  v11 = v10;
  -[PRPinyinModification modificationScore](self, "modificationScore");
  v13 = v12;
  v14 = -[PRPinyinModification syllableCountScore](self, "syllableCountScore");
  v15 = -[PRPinyinModification producesPartialSyllable](self, "producesPartialSyllable");
  v16 = -[PRPinyinModification isTemporary](self, "isTemporary");
  v17 = (void *)MEMORY[0x1E0CB3940];
  v31.location = v3;
  v31.length = v5;
  v18 = NSStringFromRange(v31);
  if (v9 != 0x7FFFFFFFFFFFFFFFLL || v11)
  {
    v33.location = v9;
    v33.length = v11;
    v20 = NSStringFromRange(v33);
    v34.location = v6;
    v34.length = v8;
    v27 = v15;
    v28 = v16;
    v26 = v14;
    v25 = (unint64_t)v13;
    v23 = v20;
    v24 = NSStringFromRange(v34);
    v22 = v29;
    v19 = CFSTR("range %@ -> <%@>, type %lu, syllables %@ %@, score %g, scs %lu, pps %d temp %d");
  }
  else
  {
    v32.location = v6;
    v32.length = v8;
    v26 = v15;
    v27 = v16;
    v25 = v14;
    v24 = v13;
    v22 = v29;
    v23 = NSStringFromRange(v32);
    v19 = CFSTR("range %@ -> <%@>, type %lu, syllable %@, score %g, scs %lu, pps %d temp %d");
  }
  return (id)objc_msgSend(v17, "stringWithFormat:", v19, v18, v30, v22, v23, v24, v25, v26, v27, v28);
}

- (_NSRange)range
{
  _NSRange *p_range;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_range = &self->_range;
  location = self->_range.location;
  length = p_range->length;
  result.length = length;
  result.location = location;
  return result;
}

- (id)replacementString
{
  return self->_replacementString;
}

- (unint64_t)modificationType
{
  return self->_modificationType;
}

- (_NSRange)syllableRange
{
  _NSRange *p_syllableRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_syllableRange = &self->_syllableRange;
  location = self->_syllableRange.location;
  length = p_syllableRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (_NSRange)additionalSyllableRange
{
  _NSRange *p_additionalSyllableRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_additionalSyllableRange = &self->_additionalSyllableRange;
  location = self->_additionalSyllableRange.location;
  length = p_additionalSyllableRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (_NSRange)combinedSyllableRange
{
  NSRange additionalSyllableRange;
  BOOL v3;
  NSRange syllableRange;

  additionalSyllableRange = self->_additionalSyllableRange;
  v3 = additionalSyllableRange.location == 0x7FFFFFFFFFFFFFFFLL && additionalSyllableRange.length == 0;
  syllableRange = self->_syllableRange;
  if (!v3)
    return NSUnionRange(syllableRange, additionalSyllableRange);
  return syllableRange;
}

- (double)modificationScore
{
  return self->_modificationScore;
}

- (unint64_t)syllableCountScore
{
  return self->_syllableCountScore;
}

- (BOOL)producesPartialSyllable
{
  return self->_producesPartialSyllable;
}

- (BOOL)isTemporary
{
  return self->_isTemporary;
}

- (BOOL)_shouldAppendLetter:(unsigned __int8)a3 romanization:(int)a4
{
  unsigned int v5;
  unsigned __int8 *letters;
  size_t v8;
  BOOL result;
  unint64_t v10;
  unsigned __int8 *v11;
  BOOL v12;
  unsigned __int8 *v13;

  v5 = a3;
  letters = self->_letters;
  v8 = strnlen((const char *)self->_letters, 6uLL);
  v13 = 0;
  if (v5 == 39)
    return 1;
  v10 = v8;
  if (v5 > 0xF7 || v5 - 97 < 0x1A || v5 - 223 < 0x18 || (result = 0, v5 - 154 <= 4) && ((1 << (v5 + 102)) & 0x15) != 0)
  {
    if (v10 > 5 || self->_modificationType == 5)
    {
      return 0;
    }
    else
    {
      letters[v10] = v5;
      v11 = next_pinyin(letters, v10 + 1, a4, 0, &v13, 0);
      if (v11)
        v12 = v13 == &v11[v10 + 1];
      else
        v12 = 0;
      result = v12;
      letters[v10] = 0;
    }
  }
  return result;
}

@end
