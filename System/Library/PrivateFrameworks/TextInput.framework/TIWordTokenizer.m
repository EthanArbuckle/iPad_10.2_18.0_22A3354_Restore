@implementation TIWordTokenizer

- (id)allTokensForString:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;

  v4 = a3;
  -[TIWordTokenizer setString:withSearchRange:](self, "setString:withSearchRange:", v4, 0, objc_msgSend(v4, "length"));
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TIWordTokenizer advanceToNextToken](self, "advanceToNextToken");
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (i = v6; i != 0x7FFFFFFFFFFFFFFFLL; i = -[TIWordTokenizer advanceToNextToken](self, "advanceToNextToken"))
    {
      objc_msgSend(v4, "substringWithRange:", i, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v9);

    }
  }

  return v5;
}

- (_NSRange)advanceToNextToken
{
  NSUInteger location;
  NSUInteger v4;
  unint64_t m_bufferOffset;
  NSUInteger length;
  unint64_t v7;
  uint64_t v8;
  $3A1256B6537AF86D915E2F51456CC233 *p_m_inlineBuffer;
  unint64_t v10;
  unint64_t v11;
  unsigned __int16 *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  NSUInteger v16;
  int64_t v17;
  uint64_t v18;
  int64_t v19;
  unsigned __int16 *directUniCharBuffer;
  UniChar v21;
  uint64_t v22;
  char *directCStringBuffer;
  int64_t bufferedRangeStart;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  int64_t v28;
  int64_t v29;
  $3A1256B6537AF86D915E2F51456CC233 *v30;
  unsigned int v31;
  BOOL v32;
  int v33;
  int IsCharacterMember;
  NSUInteger v36;
  NSUInteger v37;
  NSUInteger v38;
  $3A1256B6537AF86D915E2F51456CC233 *v39;
  const __CFCharacterSet *Predefined;
  NSUInteger v41;
  const __CFCharacterSet *theSet;
  unsigned __int16 *v43;
  unsigned __int16 *v44;
  NSUInteger v45;
  NSUInteger v46;
  _NSRange result;
  CFRange v48;

  if (!self->m_string || (location = self->m_searchRange.location, location == 0x7FFFFFFFFFFFFFFFLL))
  {
    v4 = 0;
    self->m_tokenRange = (_NSRange)xmmword_18C5E7790;
    goto LABEL_69;
  }
  length = self->m_searchRange.length;
  m_bufferOffset = self->m_bufferOffset;
  v7 = location - m_bufferOffset;
  if (location - m_bufferOffset >= location - m_bufferOffset + length)
  {
    v4 = 0;
    v16 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_66;
  }
  Predefined = 0;
  v41 = location - m_bufferOffset + length;
  v8 = 0;
  theSet = 0;
  p_m_inlineBuffer = &self->m_inlineBuffer;
  v10 = m_bufferOffset - location;
  v11 = v7 + 64;
  v12 = &self->m_inlineBuffer.buffer[location - m_bufferOffset];
  v13 = 0x7FFFFFFFFFFFFFFFLL;
  v14 = 0x7FFFFFFFFFFFFFFFLL;
  v15 = v7;
  do
  {
    v16 = v14;
    v17 = v7 + v8;
    if (v15 >= 4)
      v18 = 4;
    else
      v18 = v15;
    if (v17 < 0 || (v19 = self->m_inlineBuffer.rangeToBuffer.length, v19 <= v17))
    {
      v21 = 0;
LABEL_14:
      v22 = wordRangeInRange_simpleTokenCategories[v21];
      if (v22 == 50)
        goto LABEL_37;
      if (v22 == 49)
        goto LABEL_51;
      if (v22 != 48)
        goto LABEL_41;
      goto LABEL_30;
    }
    directUniCharBuffer = self->m_inlineBuffer.directUniCharBuffer;
    if (directUniCharBuffer)
    {
      v21 = directUniCharBuffer[v7 + v8 + self->m_inlineBuffer.rangeToBuffer.location];
    }
    else
    {
      directCStringBuffer = self->m_inlineBuffer.directCStringBuffer;
      if (directCStringBuffer)
      {
        v21 = directCStringBuffer[self->m_inlineBuffer.rangeToBuffer.location + v7 + v8];
      }
      else
      {
        if (self->m_inlineBuffer.bufferedRangeEnd <= v17
          || (bufferedRangeStart = self->m_inlineBuffer.bufferedRangeStart, bufferedRangeStart > v17))
        {
          v25 = v18 + v10;
          v26 = v11 - v18;
          v43 = v12;
          v45 = length;
          v27 = -v18;
          v28 = v8 + v7 - v18;
          v29 = v28 + 64;
          if (v28 + 64 >= v19)
            v29 = self->m_inlineBuffer.rangeToBuffer.length;
          self->m_inlineBuffer.bufferedRangeStart = v28;
          self->m_inlineBuffer.bufferedRangeEnd = v29;
          if (v19 >= v26)
            v19 = v26;
          v48.length = v19 + v25;
          v30 = p_m_inlineBuffer;
          v48.location = v7 + v8 + v27 + self->m_inlineBuffer.rangeToBuffer.location;
          CFStringGetCharacters(self->m_inlineBuffer.theString, v48, p_m_inlineBuffer->buffer);
          v12 = v43;
          length = v45;
          p_m_inlineBuffer = v30;
          bufferedRangeStart = self->m_inlineBuffer.bufferedRangeStart;
        }
        v21 = v12[v8 - bufferedRangeStart];
      }
    }
    if (v21 < 0x100u)
      goto LABEL_14;
    if ((unsigned __int16)(v21 >> 3) <= 0x404u)
    {
      v31 = v21 - 8216;
      v32 = v31 > 0xF;
      v33 = (1 << v31) & 0x9003;
      if (!v32 && v33 != 0)
      {
LABEL_37:
        if (v13 != 0x7FFFFFFFFFFFFFFFLL)
        {
LABEL_62:
          v4 = v13 - v16;
          goto LABEL_66;
        }
        if (v16 == 0x7FFFFFFFFFFFFFFFLL)
          v13 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v13 = v7 + v8;
LABEL_41:
        v14 = v16;
        goto LABEL_54;
      }
      if ((unsigned __int16)(v21 - 1024) < 0x82u || (unsigned __int16)(v21 - 1162) < 0x76u)
        goto LABEL_51;
      if ((unsigned __int16)(v21 - 1155) < 7u)
        goto LABEL_41;
      v44 = v12;
      v46 = length;
      v39 = p_m_inlineBuffer;
      if (!theSet)
        theSet = CFCharacterSetGetPredefined(kCFCharacterSetAlphaNumeric);
      if (!Predefined)
        Predefined = CFCharacterSetGetPredefined(kCFCharacterSetNonBase);
      if (CFCharacterSetIsCharacterMember(theSet, v21))
      {
        v12 = v44;
        length = v46;
        p_m_inlineBuffer = v39;
LABEL_51:
        v13 = 0x7FFFFFFFFFFFFFFFLL;
        if (v16 == 0x7FFFFFFFFFFFFFFFLL)
          v14 = v7 + v8;
        else
          v14 = v16;
        goto LABEL_54;
      }
      IsCharacterMember = CFCharacterSetIsCharacterMember(Predefined, v21);
      v12 = v44;
      length = v46;
      p_m_inlineBuffer = v39;
      if (IsCharacterMember)
        goto LABEL_41;
    }
LABEL_30:
    if (v13 != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_62;
    v14 = 0x7FFFFFFFFFFFFFFFLL;
    v13 = 0x7FFFFFFFFFFFFFFFLL;
    if (v16 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v4 = v17 - v16;
      goto LABEL_66;
    }
LABEL_54:
    ++v15;
    ++v8;
    --v10;
    ++v11;
  }
  while (length != v8);
  v16 = 0x7FFFFFFFFFFFFFFFLL;
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v14 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v4 = 0;
      goto LABEL_66;
    }
    v4 = v41 - v14;
  }
  else
  {
    v4 = v13 - v14;
  }
  v16 = v14;
LABEL_66:
  self->m_tokenRange.location = v16;
  self->m_tokenRange.length = v4;
  if (v16 == 0x7FFFFFFFFFFFFFFFLL
    || (v36 = self->m_bufferOffset + v16, self->m_tokenRange.location = v36, v36 == 0x7FFFFFFFFFFFFFFFLL))
  {
    self->m_searchRange = (_NSRange)xmmword_18C5E7790;
LABEL_69:
    v36 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v37 = self->m_searchRange.length + self->m_searchRange.location;
    v32 = v37 > v36 + v4;
    v38 = v37 - (v36 + v4);
    if (v32)
    {
      self->m_searchRange.location = v36 + v4;
      self->m_searchRange.length = v38;
    }
    else
    {
      self->m_searchRange = (_NSRange)xmmword_18C5E7790;
    }
  }
  result.length = v4;
  result.location = v36;
  return result;
}

- (void)setString:(id)a3 withSearchRange:(_NSRange)a4
{
  NSUInteger length;
  unint64_t location;
  NSString *v7;
  NSString *v8;
  uint64_t v9;
  NSUInteger v10;
  NSString *m_string;
  _NSRange v12;
  void *v13;
  __CFString *v14;
  NSUInteger v15;
  unsigned __int16 *CharactersPtr;
  char *CStringPtr;
  id v18;

  length = a4.length;
  location = a4.location;
  v18 = a3;
  if (!v18)
  {
    m_string = self->m_string;
    self->m_string = 0;

    v12 = (_NSRange)xmmword_18C5E7790;
    self->m_tokenRange = (_NSRange)xmmword_18C5E7790;
LABEL_7:
    self->m_searchRange = v12;
    v13 = v18;
    goto LABEL_8;
  }
  v7 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", v18);
  v8 = self->m_string;
  self->m_string = v7;

  self->m_tokenRange = (_NSRange)xmmword_18C5E7790;
  if (location >= objc_msgSend(v18, "length"))
  {
    v12 = (_NSRange)xmmword_18C5E7790;
    goto LABEL_7;
  }
  self->m_searchRange.location = location;
  self->m_searchRange.length = length;
  if (location + length <= objc_msgSend(v18, "length"))
  {
    v10 = self->m_searchRange.location;
  }
  else
  {
    v9 = objc_msgSend(v18, "length");
    v10 = self->m_searchRange.location;
    self->m_searchRange.length = v9 - v10;
  }
  v13 = v18;
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = (__CFString *)self->m_string;
    v15 = self->m_searchRange.length;
    self->m_inlineBuffer.theString = v14;
    self->m_inlineBuffer.rangeToBuffer.location = v10;
    self->m_inlineBuffer.rangeToBuffer.length = v15;
    CharactersPtr = (unsigned __int16 *)CFStringGetCharactersPtr(v14);
    self->m_inlineBuffer.directUniCharBuffer = CharactersPtr;
    if (CharactersPtr)
      CStringPtr = 0;
    else
      CStringPtr = (char *)CFStringGetCStringPtr(v14, 0x600u);
    v13 = v18;
    self->m_inlineBuffer.directCStringBuffer = CStringPtr;
    self->m_inlineBuffer.bufferedRangeStart = 0;
    self->m_inlineBuffer.bufferedRangeEnd = 0;
    self->m_bufferOffset = self->m_searchRange.location;
  }
LABEL_8:

}

- (TIWordTokenizer)init
{
  TIWordTokenizer *v2;
  TIWordTokenizer *v3;
  NSString *m_string;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TIWordTokenizer;
  v2 = -[TIWordTokenizer init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    m_string = v2->m_string;
    v2->m_string = 0;

    v3->m_tokenRange = (_NSRange)xmmword_18C5E7790;
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_string, 0);
}

- (_NSRange)rangeOfCurrentToken
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->m_tokenRange.length;
  location = self->m_tokenRange.location;
  result.length = length;
  result.location = location;
  return result;
}

@end
