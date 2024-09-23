@implementation PRZhuyinModification

- (PRZhuyinModification)initWithRange:(_NSRange)a3 replacementString:(id)a4 modificationType:(unint64_t)a5 syllableRange:(_NSRange)a6 additionalSyllableRange:(_NSRange)a7 modificationScore:(double)a8 syllableCountScore:(unint64_t)a9 syllableLetters:(const char *)a10 producesPartialSyllable:(BOOL)a11
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v16;
  NSUInteger v17;
  PRZhuyinModification *v19;
  unsigned __int8 *letters;
  size_t v21;
  uint64_t v23;
  objc_super v24;

  length = a6.length;
  location = a6.location;
  v16 = a3.length;
  v17 = a3.location;
  v23 = objc_msgSend(a4, "length");
  v24.receiver = self;
  v24.super_class = (Class)PRZhuyinModification;
  v19 = -[PRZhuyinModification init](&v24, sel_init);
  v19->_range.location = v17;
  v19->_range.length = v16;
  v19->_replacementString = (NSString *)objc_msgSend(a4, "copy");
  v19->_modificationType = a5;
  v19->_syllableRange.location = location;
  v19->_syllableRange.length = length;
  v19->_additionalSyllableRange = a7;
  v19->_modificationScore = a8;
  letters = v19->_letters;
  v19->_syllableCountScore = a9;
  if (a10)
  {
    v21 = length - v16 + v23;
    if (v21 <= 4)
    {
      memmove(v19->_letters, a10, v21);
      letters += v21;
    }
  }
  *letters = 0;
  v19->_producesPartialSyllable = a11;
  return v19;
}

- (PRZhuyinModification)initWithRange:(_NSRange)a3 replacementString:(id)a4 modificationType:(unint64_t)a5 syllableRange:(_NSRange)a6 modificationScore:(double)a7 syllableCountScore:(unint64_t)a8 syllableLetters:(const char *)a9 producesPartialSyllable:(BOOL)a10
{
  uint64_t v11;

  LOBYTE(v11) = a10;
  return -[PRZhuyinModification initWithRange:replacementString:modificationType:syllableRange:additionalSyllableRange:modificationScore:syllableCountScore:syllableLetters:producesPartialSyllable:](self, "initWithRange:replacementString:modificationType:syllableRange:additionalSyllableRange:modificationScore:syllableCountScore:syllableLetters:producesPartialSyllable:", a3.location, a3.length, a4, a5, a6.location, a6.length, a7, 0x7FFFFFFFFFFFFFFFLL, 0, a8, a9, v11);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRZhuyinModification;
  -[PRZhuyinModification dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  _BOOL4 v5;
  uint64_t v6;
  BOOL v7;
  unint64_t modificationType;
  double modificationScore;
  double v10;
  unint64_t syllableCountScore;
  uint64_t v12;
  uint64_t v13;
  _NSRange *p_additionalSyllableRange;
  uint64_t v15;

  if (self == a3)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_20;
    v5 = -[NSString isEqualToString:](self->_replacementString, "isEqualToString:", objc_msgSend(a3, "replacementString"));
    if (!v5)
      return v5;
    v7 = self->_range.location == objc_msgSend(a3, "range") && self->_range.length == v6;
    if (!v7
      || (modificationType = self->_modificationType, modificationType != objc_msgSend(a3, "modificationType"))
      || (modificationScore = self->_modificationScore, objc_msgSend(a3, "modificationScore"), modificationScore != v10)
      || (syllableCountScore = self->_syllableCountScore, syllableCountScore != objc_msgSend(a3, "syllableCountScore")))
    {
LABEL_20:
      LOBYTE(v5) = 0;
      return v5;
    }
    v13 = objc_msgSend(a3, "syllableRange");
    LOBYTE(v5) = 0;
    if (self->_syllableRange.location == v13 && self->_syllableRange.length == v12)
    {
      p_additionalSyllableRange = &self->_additionalSyllableRange;
      LOBYTE(v5) = p_additionalSyllableRange->location == objc_msgSend(a3, "additionalSyllableRange")
                && p_additionalSyllableRange->length == v15;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  return self->_range.location ^ self->_range.length ^ -[NSString hash](self->_replacementString, "hash");
}

- (id)description
{
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  NSString *v13;
  NSString *v14;
  unint64_t v15;
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
  id v28;
  NSRange v29;
  NSRange v30;
  NSRange v31;
  NSRange v32;

  v28 = -[PRZhuyinModification replacementString](self, "replacementString");
  v3 = -[PRZhuyinModification modificationType](self, "modificationType");
  v4 = -[PRZhuyinModification range](self, "range");
  v6 = v5;
  v7 = -[PRZhuyinModification syllableRange](self, "syllableRange");
  v9 = v8;
  v10 = -[PRZhuyinModification additionalSyllableRange](self, "additionalSyllableRange");
  v12 = v11;
  -[PRZhuyinModification modificationScore](self, "modificationScore");
  v14 = v13;
  v15 = -[PRZhuyinModification syllableCountScore](self, "syllableCountScore");
  v16 = -[PRZhuyinModification producesPartialSyllable](self, "producesPartialSyllable");
  v17 = (void *)MEMORY[0x1E0CB3940];
  v29.location = v4;
  v29.length = v6;
  v18 = NSStringFromRange(v29);
  if (v10 != 0x7FFFFFFFFFFFFFFFLL || v12)
  {
    v31.location = v10;
    v31.length = v12;
    v20 = NSStringFromRange(v31);
    v32.location = v7;
    v32.length = v9;
    v26 = v15;
    v27 = v16;
    v25 = (unint64_t)v14;
    v23 = v20;
    v24 = NSStringFromRange(v32);
    v22 = v3;
    v19 = CFSTR("range %@ -> <%@>, type %lu, syllables %@ %@, score %g, scs %lu, pps %d");
  }
  else
  {
    v30.location = v7;
    v30.length = v9;
    v25 = v15;
    v26 = v16;
    v24 = v14;
    v22 = v3;
    v23 = NSStringFromRange(v30);
    v19 = CFSTR("range %@ -> <%@>, type %lu, syllable %@, score %g, scs %lu, pps %d");
  }
  return (id)objc_msgSend(v17, "stringWithFormat:", v19, v18, v28, v22, v23, v24, v25, v26, v27);
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

- (BOOL)_shouldAppendLetter:(unsigned __int8)a3
{
  unsigned int v3;
  unsigned __int8 *letters;
  size_t v5;
  BOOL result;
  unint64_t v7;
  unsigned __int8 *v8;
  BOOL v9;
  unsigned __int8 *v10;

  v3 = a3;
  letters = self->_letters;
  v5 = strnlen((const char *)self->_letters, 4uLL);
  v10 = 0;
  if (v3 == 39)
    return 1;
  v7 = v5;
  if (v3 > 0xF7 || v3 - 97 < 0x1A || v3 - 223 < 0x18 || (result = 0, v3 - 154 <= 4) && ((1 << (v3 + 102)) & 0x15) != 0)
  {
    if (v7 > 3)
    {
      return 0;
    }
    else
    {
      letters[v7] = v3;
      v8 = next_zhuyin(letters, v7 + 1, 0, 1, &v10, 0);
      if (v8)
        v9 = v10 == &v8[v7 + 1];
      else
        v9 = 0;
      result = v9;
      letters[v7] = 0;
    }
  }
  return result;
}

@end
