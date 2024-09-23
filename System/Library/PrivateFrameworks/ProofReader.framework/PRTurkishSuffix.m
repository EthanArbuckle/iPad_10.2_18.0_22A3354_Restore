@implementation PRTurkishSuffix

- (void)_fillPatternBuffer
{
  CFIndex v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t patternBufferLength;
  int v7;
  uint64_t v8;
  CFIndex usedBufLen;
  UInt8 buffer[48];
  uint64_t v11;
  CFRange v12;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = -[NSString length](self->_pattern, "length");
  usedBufLen = 0;
  self->_patternBufferLength = 0;
  v12.location = 0;
  v12.length = v3;
  if (v3 == CFStringGetBytes((CFStringRef)self->_pattern, v12, 0x504u, 0x5Fu, 0, buffer, 16, &usedBufLen))
  {
    v4 = usedBufLen;
    if (usedBufLen)
    {
      v5 = 0;
      do
      {
        patternBufferLength = self->_patternBufferLength;
        if (patternBufferLength > 0xF)
          break;
        v7 = buffer[v5];
        if (v7 == 40 && v5 + 2 < v4 && buffer[v5 + 2] == 41)
        {
          self->_isOptional[patternBufferLength] = 1;
          LOBYTE(v7) = buffer[v5 + 1];
          patternBufferLength = self->_patternBufferLength;
          v8 = 3;
        }
        else
        {
          v8 = 1;
        }
        self->_patternBufferLength = patternBufferLength + 1;
        self->_patternBuffer[patternBufferLength] = v7;
        v5 += v8;
      }
      while (v5 < v4);
    }
  }
}

- (PRTurkishSuffix)initWithPattern:(id)a3 name:(id)a4 type:(int)a5 postponesApostrophe:(BOOL)a6
{
  PRTurkishSuffix *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PRTurkishSuffix;
  v10 = -[PRTurkishSuffix init](&v12, sel_init);
  if (v10)
  {
    v10->_pattern = (NSString *)objc_msgSend(a3, "copy");
    v10->_name = (NSString *)objc_msgSend(a4, "copy");
    v10->_suffixType = a5;
    v10->_postponesApostrophe = a6;
    -[PRTurkishSuffix _fillPatternBuffer](v10, "_fillPatternBuffer");
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRTurkishSuffix;
  -[PRTurkishSuffix dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%lu"), -[PRTurkishSuffix pattern](self, "pattern"), -[PRTurkishSuffix suffixType](self, "suffixType"));
}

- (id)pattern
{
  return self->_pattern;
}

- (id)name
{
  return self->_name;
}

- (int)suffixType
{
  return self->_suffixType;
}

- (BOOL)postponesApostrophe
{
  return self->_postponesApostrophe;
}

- (unint64_t)matchingIndexInBuffer:(char *)a3 length:(unint64_t)a4 followedByLetter:(unsigned __int8)a5 matchWithNameOnly:(BOOL *)a6
{
  unint64_t patternBufferLength;
  int v9;
  unint64_t v10;
  unint64_t v11;
  int v12;
  int v13;
  unsigned int v14;
  int v17;
  BOOL v18;
  int v19;
  BOOL v20;
  BOOL *v21;
  _BOOL4 isTurkishVowel;
  BOOL v23;
  BOOL v24;
  BOOL v25;
  unint64_t v26;
  unint64_t v27;
  int v28;
  BOOL v29;
  BOOL v30;
  BOOL v31;
  BOOL v33;
  unsigned int v35;
  int v36;
  unint64_t v37;
  unint64_t v38;
  unsigned int v39;
  BOOL v40;
  unsigned int v42;
  BOOL v43;
  int v44;
  uint64_t v46;
  char *v47;
  int v48;
  BOOL v51;
  unsigned int v52;
  unsigned int v53;
  unsigned int v54;
  unsigned int v55;
  unsigned int v56;
  unsigned int v57;
  int v59;
  char *v61;
  BOOL v62;
  unint64_t v63;
  uint64_t v64;
  unsigned __int8 *isOptional;
  unsigned __int8 *patternBuffer;
  int v68;
  char v69;
  char v70;
  unsigned __int8 v71;
  __int16 v72;

  v68 = a5;
  patternBufferLength = self->_patternBufferLength;
  v72 = 0;
  v71 = 0;
  if (a4)
  {
    v9 = 0;
    v69 = 0;
    v70 = 0;
    v62 = 0;
    patternBuffer = self->_patternBuffer;
    v64 = 0;
    isOptional = self->_isOptional;
    v61 = a3 - 1;
    v63 = 0x7FFFFFFFFFFFFFFFLL;
    v10 = a4;
    while (1)
    {
      if (!patternBufferLength)
        goto LABEL_224;
      v11 = v10 - 1;
      if (v10 == 1)
        v12 = 0;
      else
        v12 = a3[v10 - 2];
      v13 = v68;
      if (v10 < a4)
        v13 = a3[v10];
      v14 = a3[v11];
      if (v14 - 65 < 0x1A || v14 - 192 < 0x17)
        break;
      if (a3[v11] <= 0xD7u)
      {
        v18 = v14 - 138 > 0x15 || ((1 << (v14 + 118)) & 0x200015) == 0;
        v17 = a3[v11];
        if (!v18)
          goto LABEL_27;
      }
      else
      {
        if (v14 - 216 < 5)
          goto LABEL_22;
        if (v14 == 221)
        {
          v17 = 105;
        }
        else
        {
          v17 = a3[v11];
          if (v14 == 222)
            goto LABEL_22;
        }
      }
LABEL_30:
      v19 = patternBuffer[--patternBufferLength];
      if (v19 == v17)
        goto LABEL_105;
      if (v19 == 65)
      {
        if ((v17 & 0xFB) == 0x61)
          goto LABEL_105;
        goto LABEL_116;
      }
      if ((v19 - 67) <= 1)
      {
        v20 = 1;
        if (v12 <= 0xF7 && (v12 - 97) >= 0x1A && (v12 - 223) >= 0x18)
          v20 = (v12 + 102) <= 4u && (v12 & 1) == 0;
        if ((v12 - 65) >= 0x1A && (v12 - 192) >= 0x17)
        {
          if (v12 > 215)
          {
            if ((v12 - 216) < 5)
              goto LABEL_69;
            if (v12 != 221)
            {
              if (v12 != 222)
                goto LABEL_75;
LABEL_69:
              LOBYTE(v12) = v12 + 32;
              goto LABEL_75;
            }
            LOBYTE(v12) = 105;
LABEL_80:
            v26 = 0;
            do
            {
              v27 = v26;
              if (v26 == 7)
                break;
              v28 = byte_1DE2F0000[++v26];
            }
            while (v28 != v12);
            v25 = v27 < 7;
LABEL_84:
            v29 = !v20 || !v25;
            if (v19 == 67 && v17 == 99 && (!v20 || !v25))
              goto LABEL_105;
            v30 = v25 || !v20;
            v31 = v19 == 67 && v17 == 231;
            if (v31 && v30)
              goto LABEL_105;
            v33 = v17 == 100 && v29;
            if (v19 == 68 && v33)
              goto LABEL_105;
            if (v19 != 68 || v17 != 116)
              v30 = 0;
            if (v30)
            {
LABEL_105:
              if (v10 != 1)
              {
                if (isOptional[patternBufferLength])
                {
                  if (!patternBufferLength)
                  {
                    v35 = a3[v10 - 2];
                    if (v35 > 0xF7
                      || v35 - 97 < 0x1A
                      || v35 - 223 < 0x18
                      || v35 - 154 <= 4 && ((1 << (v35 + 102)) & 0x15) != 0)
                    {
                      if (_isTurkishVowel(v35, 0, 0, 0))
                      {
                        if (v19 == 73)
                          goto LABEL_224;
                      }
                      else if ((v19 - 110) <= 0xB && ((1 << (v19 - 110)) & 0x821) != 0)
                      {
                        goto LABEL_224;
                      }
                    }
                  }
                }
              }
              if (!_isTurkishVowel(v14, &v72, (BOOL *)&v72 + 1, &v71))
                goto LABEL_139;
              if (v70 & 1 | ((v69 & 1) == 0))
              {
                v36 = v71;
              }
              else
              {
                if (v72 != (BYTE4(v64) & 1))
                  goto LABEL_224;
                v36 = v71;
                if (v62 && v71 != (v64 & 1))
                  goto LABEL_224;
              }
              v62 = HIBYTE(v72) != 0;
              LOBYTE(v64) = v36 != 0;
              BYTE4(v64) = v72 != 0;
              v69 = 1;
              v70 = 0;
              if ((v19 - 65) >= 0x1A
                && (v19 - 192) >= 0x17
                && (v69 = 1, v70 = 0, (v19 - 216) >= 7)
                && ((v19 - 138) > 0x15 || ((1 << (v19 + 118)) & 0x200015) == 0))
              {
                v69 = 1;
                v70 = 1;
                if (patternBufferLength)
                {
LABEL_140:
                  --v10;
                  goto LABEL_206;
                }
              }
              else
              {
LABEL_139:
                if (patternBufferLength)
                  goto LABEL_140;
              }
              goto LABEL_144;
            }
            goto LABEL_116;
          }
          if ((v12 - 138) <= 0x15 && ((1 << (v12 + 118)) & 0x200015) != 0)
          {
LABEL_72:
            if (v12 == 159)
              LOBYTE(v12) = -1;
            else
              LOBYTE(v12) = v12 + 16;
          }
LABEL_75:
          if (v12 != 231)
            goto LABEL_80;
          v25 = 1;
          goto LABEL_84;
        }
        if ((v12 - 138) > 0x15 || ((1 << (v12 + 118)) & 0x200015) == 0)
        {
          if (v12 != 73)
            goto LABEL_69;
          LOBYTE(v12) = -3;
          goto LABEL_80;
        }
        goto LABEL_72;
      }
      if (v19 == 75)
      {
        v59 = v9;
        v21 = a6;
        isTurkishVowel = _isTurkishVowel(v12, 0, 0, 0);
        v23 = _isTurkishVowel(v13, 0, 0, 0);
        if (v17 == 107 || !isTurkishVowel)
        {
          a6 = v21;
          v9 = v59;
          if (v17 == 107)
            goto LABEL_105;
        }
        else
        {
          v24 = v17 == 240 && v23;
          a6 = v21;
          v9 = v59;
          if (v24)
            goto LABEL_105;
        }
      }
      else if (v19 == 73 && ((v17 - 252) < 2 || v17 == 105 || v17 == 117))
      {
        goto LABEL_105;
      }
LABEL_116:
      if (!isOptional[patternBufferLength])
        goto LABEL_224;
      if (patternBufferLength)
        goto LABEL_206;
      if (v14 <= 0xF7 && v14 - 97 >= 0x1A && v14 - 223 >= 0x18 && (v14 - 154 > 4 || ((1 << (v14 + 102)) & 0x15) == 0))
      {
LABEL_143:
        v11 = v10;
        goto LABEL_144;
      }
      if (_isTurkishVowel(v14, 0, 0, 0))
      {
        if ((v19 - 110) > 0xB)
          goto LABEL_143;
        v11 = v10;
        if (((1 << (v19 - 110)) & 0x821) != 0)
          goto LABEL_224;
      }
      else
      {
        v11 = v10;
        if (v19 == 73)
          goto LABEL_224;
      }
LABEL_144:
      v37 = v11;
      do
      {
        v38 = v37;
        if (!v37)
          break;
        v39 = a3[v37 - 1];
        v40 = v39 <= 0xF7 && v39 - 97 >= 0x1A;
        if (!v40 || v39 - 223 < 0x18)
          break;
        --v37;
        v42 = v39 - 154;
        v43 = v42 > 4;
        v44 = (1 << v42) & 0x15;
      }
      while (v43 || v44 == 0);
      v10 = v11;
      if (!(v70 & 1 | ((v69 & 1) == 0)))
      {
        if (v11)
        {
          v46 = 0;
          v47 = v61;
          while (1)
          {
            v48 = v47[v11];
            if (v48 == 97 && v11 - 3 == v46)
            {
              v48 = *a3 == 105 && a3[1] == 80 && a3[3] == 100 ? 105 : 97;
            }
            else if (v48 == 101 && v11 - 6 == v46)
            {
              if (*a3 == 105 && a3[1] == 80 && a3[2] == 104 && a3[3] == 111)
              {
                if (a3[4] == 110)
                  v48 = 117;
                else
                  v48 = 101;
              }
              else
              {
                v48 = 101;
              }
            }
            if (_isTurkishVowel(v48, &v72, (BOOL *)&v72 + 1, &v71))
              break;
            --v47;
            if (v11 == ++v46)
            {
              v10 = -1;
              goto LABEL_187;
            }
          }
          v51 = v72 == (BYTE4(v64) & 1) && (!v62 || v71 == (v64 & 1));
          v10 = ~v46 + v11;
          if (v38 && !v51)
          {
            v70 = 0;
            if (!a6 || v11 < 2)
              goto LABEL_206;
            if (a3[v11 - 1] != 39)
              goto LABEL_219;
            v70 = 0;
            v56 = *a3;
            if (v56 > 0xF7 || v56 - 97 < 0x1A || v56 - 223 < 0x18)
              goto LABEL_206;
            v57 = v56 - 154;
            if (v57 > 4 || ((1 << v57) & 0x15) == 0)
            {
              v70 = 0;
              v9 = 1;
              v63 = v11 - 1;
            }
            else
            {
LABEL_219:
              v70 = 0;
            }
            goto LABEL_206;
          }
        }
        else
        {
          v10 = -1;
        }
      }
LABEL_187:
      if (v11)
      {
        if (a3[v11 - 1] == 39)
        {
          v63 = v11 - 1;
          if (-[PRTurkishSuffix postponesApostrophe](self, "postponesApostrophe"))
          {
            if (!v38)
              goto LABEL_206;
          }
          else
          {
            v52 = *a3;
            if (v52 <= 0xF7 && v52 - 97 >= 0x1A && v52 - 223 >= 0x18)
            {
              v53 = v52 - 154;
              if (v53 > 4 || ((1 << v53) & 0x15) == 0)
                goto LABEL_206;
            }
            v54 = a3[1];
            if (v54 <= 0xF7 && v54 - 97 >= 0x1A && v54 - 223 >= 0x18)
            {
              v55 = v54 - 154;
              if (v55 > 4 || ((1 << v55) & 0x15) == 0)
                goto LABEL_206;
            }
          }
        }
        v63 = v11;
      }
      else
      {
        v63 = 0;
      }
LABEL_206:
      if (!v10)
        goto LABEL_224;
    }
    if (v14 - 138 > 0x15 || ((1 << (v14 + 118)) & 0x200015) == 0)
    {
      if (v14 == 73)
      {
        v17 = 253;
        goto LABEL_30;
      }
LABEL_22:
      v17 = v14 + 32;
      goto LABEL_30;
    }
LABEL_27:
    if (v14 == 159)
      v17 = 255;
    else
      v17 = v14 + 16;
    goto LABEL_30;
  }
  LOBYTE(v9) = 0;
  v63 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_224:
  if (a6)
    *a6 = v9 & 1;
  return v63;
}

+ (id)standardTurkishNounSuffixes
{
  id v2;
  void *v3;
  void *v4;
  uint64_t i;
  PRTurkishSuffix *v6;
  _OWORD v8[2];
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (id)standardTurkishNounSuffixes_standardTurkishNounSuffixes;
  if (!standardTurkishNounSuffixes_standardTurkishNounSuffixes)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("(y)Im"), CFSTR("sIn"), CFSTR("DIr"), CFSTR("(y)Iz"), CFSTR("sInIz"), CFSTR("DIrlAr"), CFSTR("(y)DIm"), CFSTR("(y)DIn"), CFSTR("(y)DI"), CFSTR("(y)DIk"), CFSTR("(y)DInIz"), CFSTR("(y)DIlAr"), CFSTR("(y)sAm"), CFSTR("(y)sAn"), CFSTR("(y)sA"), CFSTR("(y)sAk"), CFSTR("(y)sAnIz"),
                   CFSTR("(y)sAlAr"),
                   CFSTR("(y)DIysAm"),
                   CFSTR("(y)DIysAn"),
                   CFSTR("(y)DIysA"),
                   CFSTR("(y)DIysAk"),
                   CFSTR("(y)DIysAnIz"),
                   CFSTR("(y)DIysAlAr"),
                   CFSTR("(y)DImsA"),
                   CFSTR("(y)DInsA"),
                   CFSTR("(y)DIysA"),
                   CFSTR("(y)DIksA"),
                   CFSTR("(y)DInIzsA"),
                   CFSTR("(y)DIysAlAr"),
                   CFSTR("(y)mIşIm"),
                   CFSTR("(y)mIşsIn"),
                   CFSTR("(y)mIş"),
                   CFSTR("(y)mIşIz"),
                   CFSTR("(y)mIşsInIz"),
                   CFSTR("(y)mIşlAr"),
                   CFSTR("(y)mIşsAm"),
                   CFSTR("(y)mIşsAn"),
                   CFSTR("(y)mIşsA"),
                   CFSTR("(y)mIşsAk"),
                   CFSTR("(y)mIşsAnIz"),
                   CFSTR("(y)mIşsAlAr"),
                   CFSTR("(y)A"),
                   CFSTR("DA"),
                   CFSTR("DAn"),
                   CFSTR("(y)I"),
                   CFSTR("(n)In"),
                   CFSTR("lAr"),
                   CFSTR("(s)I(n)"),
                   CFSTR("(I)m"),
                   CFSTR("(I)mIz"),
                   CFSTR("(I)n"),
                   CFSTR("(I)nIz"),
                   CFSTR("lArI(n)"),
                   CFSTR("sIz"),
                   CFSTR("(y)lA"),
                   CFSTR("lI"),
                   CFSTR("lIK"),
                   CFSTR("CI"),
                   CFSTR("ki(n)"),
                   CFSTR("Daş"));
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("I-am"), CFSTR("you-are"), CFSTR("it-is"), CFSTR("we-are"), CFSTR("you-are"), CFSTR("they-are"), CFSTR("I-was"), CFSTR("you-were"), CFSTR("it-was"), CFSTR("we-were"), CFSTR("you-were"), CFSTR("they-were"), CFSTR("if-I-am"), CFSTR("if-you-are"), CFSTR("if-it-is"), CFSTR("if-we-are"), CFSTR("if-you-are"),
                   CFSTR("if-they-are"),
                   CFSTR("if-I-was"),
                   CFSTR("if-you-were"),
                   CFSTR("if-it-was"),
                   CFSTR("if-we-were"),
                   CFSTR("if-you-were"),
                   CFSTR("if-they-were"),
                   CFSTR("if-I-was"),
                   CFSTR("if-you-were"),
                   CFSTR("if-it-was"),
                   CFSTR("if-we-were"),
                   CFSTR("if-you-were"),
                   CFSTR("if-they-were"),
                   CFSTR("apparently-I-am"),
                   CFSTR("apparently-you-are"),
                   CFSTR("apparently-it-is"),
                   CFSTR("apparently-we-are"),
                   CFSTR("apparently-you-are"),
                   CFSTR("apparently-they-are"),
                   CFSTR("if-apparently-I-am"),
                   CFSTR("if-apparently-you-are"),
                   CFSTR("if-apparently-it-is"),
                   CFSTR("if-apparently-we-are"),
                   CFSTR("if-apparently-you-are"),
                   CFSTR("if-apparently-they-are"),
                   CFSTR("to"),
                   CFSTR("at"),
                   CFSTR("from"),
                   CFSTR("acc."),
                   CFSTR("of"),
                   CFSTR("pl."),
                   CFSTR("its"),
                   CFSTR("my"),
                   CFSTR("our"),
                   CFSTR("your"),
                   CFSTR("your"),
                   CFSTR("their"),
                   CFSTR("-less"),
                   CFSTR("with"),
                   CFSTR("having"),
                   CFSTR("-ness"),
                   CFSTR("-er"),
                   CFSTR("which-is"),
                   CFSTR("fellow"));
    v9 = 0u;
    v10 = 0u;
    v11 = 1;
    memset(v8, 0, sizeof(v8));
    HIBYTE(v9) = 1;
    BYTE8(v10) = 1;
    BYTE10(v10) = 1;
    BYTE14(v10) = 1;
    v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    for (i = 0; i != 72; ++i)
    {
      v6 = -[PRTurkishSuffix initWithPattern:name:type:postponesApostrophe:]([PRTurkishSuffix alloc], "initWithPattern:name:type:postponesApostrophe:", objc_msgSend(v3, "objectAtIndex:", i), objc_msgSend(v4, "objectAtIndex:", i), byte_1DE2F0010[i], *((_BYTE *)v8 + i) != 0);
      objc_msgSend(v2, "addObject:", v6);

    }
    standardTurkishNounSuffixes_standardTurkishNounSuffixes = (uint64_t)v2;
  }
  return v2;
}

+ (id)standardTurkishVerbSuffixes
{
  id v2;
  void *v3;
  void *v4;
  uint64_t i;
  PRTurkishSuffix *v6;

  v2 = (id)standardTurkishVerbSuffixes_standardTurkishVerbSuffixes;
  if (!standardTurkishVerbSuffixes_standardTurkishVerbSuffixes)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("(I)n"), CFSTR("(I)ş"), CFSTR("DIr"), CFSTR("t"), CFSTR("Il"), CFSTR("mA"), CFSTR("(y)Abil"), CFSTR("(y)AmA"), CFSTR("mAyAbil"), CFSTR("mIyAbil"), CFSTR("(y)AmIyAbil"), CFSTR("(y)AmAyAbil"), CFSTR("(y)Iver"), CFSTR("mAyIver"), CFSTR("(y)IvermA"), CFSTR("(y)An"), CFSTR("(y)AcAK"),
                   CFSTR("(I)r"),
                   CFSTR("mIş"),
                   CFSTR("DIK"),
                   CFSTR("mAK"),
                   CFSTR("mAklIK"),
                   CFSTR("mA"),
                   CFSTR("(y)Iş"),
                   CFSTR("mAzlIK"),
                   CFSTR("mAmAzlIK"),
                   CFSTR("(y)IcI"),
                   CFSTR("lA"),
                   CFSTR("lAn"),
                   CFSTR("lAş"),
                   CFSTR("lAt"),
                   CFSTR("(I)yorum"),
                   CFSTR("(I)yorsun"),
                   CFSTR("(I)yor"),
                   CFSTR("(I)yoruz"),
                   CFSTR("(I)yorsunuz"),
                   CFSTR("(I)yorlar"),
                   CFSTR("(I)yordum"),
                   CFSTR("(I)yordun"),
                   CFSTR("(I)yordu"),
                   CFSTR("(I)yorduk"),
                   CFSTR("(I)yordunuz"),
                   CFSTR("(I)yordular"),
                   CFSTR("(I)yorlardı"),
                   CFSTR("(I)yorsam"),
                   CFSTR("(I)yorsan"),
                   CFSTR("(I)yorsa"),
                   CFSTR("(I)yorsak"),
                   CFSTR("(I)yorsanız"),
                   CFSTR("(I)yorsalar"),
                   CFSTR("(I)yorlarsa"),
                   CFSTR("(I)yorduysam"),
                   CFSTR("(I)yorduysan"),
                   CFSTR("(I)yorduysa"),
                   CFSTR("(I)yorduysak"),
                   CFSTR("(I)yorduysanız"),
                   CFSTR("(I)yorduysalar"),
                   CFSTR("(I)yorlardıysa"),
                   CFSTR("(I)yormuşum"),
                   CFSTR("(I)yormuşsun"),
                   CFSTR("(I)yormuş"));
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("refl."), CFSTR("recip."), CFSTR("caus."), CFSTR("caus."), CFSTR("pass."), CFSTR("neg."), CFSTR("pot."), CFSTR("impot."), CFSTR("negpot."), CFSTR("negpot."), CFSTR("negimpot."), CFSTR("negimpot."), CFSTR("quick"), CFSTR("negquick"), CFSTR("quickneg"), CFSTR("prespart."), CFSTR("futpart."),
                   CFSTR("aorpart."),
                   CFSTR("pastpart."),
                   CFSTR("pastpart."),
                   CFSTR("inf."),
                   CFSTR("verbal"),
                   CFSTR("verbal"),
                   CFSTR("verbal"),
                   CFSTR("negverbal"),
                   CFSTR("negverbal"),
                   CFSTR("nominalizer"),
                   CFSTR("verbalizer"),
                   CFSTR("verbalizer"),
                   CFSTR("verbalizer"),
                   CFSTR("verbalizer"),
                   CFSTR("1spres"),
                   CFSTR("2spres"),
                   CFSTR("3spres"),
                   CFSTR("1ppres"),
                   CFSTR("2ppres"),
                   CFSTR("3ppres"),
                   CFSTR("1spast"),
                   CFSTR("2spast"),
                   CFSTR("3spast"),
                   CFSTR("1ppast"),
                   CFSTR("2ppast"),
                   CFSTR("3ppast"),
                   CFSTR("3ppast"),
                   CFSTR("1sprescond"),
                   CFSTR("2sprescond"),
                   CFSTR("3sprescond"),
                   CFSTR("1pprescond"),
                   CFSTR("2pprescond"),
                   CFSTR("3pprescond"),
                   CFSTR("3pprescond"),
                   CFSTR("1spastcond"),
                   CFSTR("2spastcond"),
                   CFSTR("3spastcond"),
                   CFSTR("1ppastcond"),
                   CFSTR("2ppastcond"),
                   CFSTR("3ppastcond"),
                   CFSTR("3ppastcond"),
                   CFSTR("1sinf"),
                   CFSTR("2sinf"),
                   CFSTR("3sinf"));
    v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    for (i = 0; i != 241; ++i)
    {
      v6 = -[PRTurkishSuffix initWithPattern:name:type:postponesApostrophe:]([PRTurkishSuffix alloc], "initWithPattern:name:type:postponesApostrophe:", objc_msgSend(v3, "objectAtIndex:", i), objc_msgSend(v4, "objectAtIndex:", i), byte_1DE2F0058[i], 0);
      objc_msgSend(v2, "addObject:", v6);

    }
    standardTurkishVerbSuffixes_standardTurkishVerbSuffixes = (uint64_t)v2;
  }
  return v2;
}

+ (id)standardTurkishSuffixes
{
  id result;

  result = (id)standardTurkishSuffixes_standardTurkishSuffixes;
  if (!standardTurkishSuffixes_standardTurkishSuffixes)
  {
    result = (id)objc_msgSend((id)objc_msgSend(a1, "standardTurkishNounSuffixes"), "arrayByAddingObjectsFromArray:", objc_msgSend(a1, "standardTurkishVerbSuffixes"));
    standardTurkishSuffixes_standardTurkishSuffixes = (uint64_t)result;
  }
  return result;
}

+ (void)_enumerateSuffixMatchesForBuffer:(char *)a3 length:(unint64_t)a4 followedByLetter:(unsigned __int8)a5 options:(unint64_t)a6 depth:(unint64_t)a7 matchState:(int)a8 suffixStack:(id *)a9 suffixRangeStack:(_NSRange *)a10 usingBlock:(id)a11
{
  uint64_t v13;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  NSUInteger v21;
  BOOL v22;
  void *v23;
  void *v24;
  unint64_t v25;
  NSUInteger *p_length;
  uint64_t v27;
  unint64_t v29;
  unsigned int v30;
  char *v31;
  unint64_t v32;
  unsigned int v33;
  _NSRange *v34;
  unint64_t v35;
  id obj;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  __int16 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v13 = a5;
  v47 = *MEMORY[0x1E0C80C00];
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = +[PRTurkishSuffix standardTurkishSuffixes](PRTurkishSuffix, "standardTurkishSuffixes");
  v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v40)
  {
    v34 = &a10[a7];
    v35 = a7 + 1;
    v29 = a7;
    v38 = (char *)&_turkishSuffixMatchTable + 60 * a8;
    v39 = *(_QWORD *)v43;
    v33 = v13;
    v31 = a3;
    v32 = a4;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v43 != v39)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v16);
        v41 = 0;
        LODWORD(v18) = *(_DWORD *)&v38[4 * objc_msgSend(v17, "suffixType")];
        if ((_DWORD)v18)
        {
          v19 = objc_msgSend(v17, "matchingIndexInBuffer:length:followedByLetter:matchWithNameOnly:", a3, a4, v13, &v41);
          if (v19 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v20 = v19;
            v21 = a4 - v19;
            v22 = v41 == 0;
            a9[a7] = v17;
            if (v22)
              v18 = v18;
            else
              v18 = 12;
            v34->location = v19;
            v34->length = v21;
            if ((a6 & 2) != 0)
            {
              v23 = 0;
              v24 = 0;
            }
            else
            {
              v30 = v18;
              v23 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v24 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              if (v35)
              {
                v25 = a7;
                p_length = &v34->length;
                do
                {
                  objc_msgSend(v23, "addObject:", a9[v25]);
                  objc_msgSend(v24, "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", *(p_length - 1), *p_length));
                  --v25;
                  p_length -= 2;
                }
                while (v25 != -1);
                a7 = v29;
              }
              v18 = v30;
            }
            (*((void (**)(id, unint64_t, void *, unint64_t, NSUInteger, uint64_t, void *, void *, char *))a11
             + 2))(a11, v20, v17, v20, v21, v18, v23, v24, (char *)&v41 + 1);
            if (HIBYTE(v41))
              return;
            v13 = v33;
            a3 = v31;
            a4 = v32;
            if (v20 && v32 > v20 && v35 <= 0xF && !(_BYTE)v41)
              objc_msgSend(a1, "_enumerateSuffixMatchesForBuffer:length:followedByLetter:options:depth:matchState:suffixStack:suffixRangeStack:usingBlock:", v31, v20, v31[v20], a6, v35, v18, a9, a10, a11);
          }
        }
        ++v16;
      }
      while (v16 != v40);
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      v40 = v27;
    }
    while (v27);
  }
}

+ (void)enumerateSuffixMatchesForBuffer:(char *)a3 length:(unint64_t)a4 options:(unint64_t)a5 usingBlock:(id)a6
{
  id v11;
  uint64_t v12;
  _OWORD *v13;
  _BYTE v14[256];
  _OWORD v15[8];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v12 = 0;
  memset(v15, 0, sizeof(v15));
  do
  {
    v13 = &v14[v12];
    *v13 = xmmword_1DE2EC5B0;
    v13[1] = xmmword_1DE2EC5B0;
    v12 += 32;
  }
  while (v12 != 256);
  objc_msgSend(a1, "_enumerateSuffixMatchesForBuffer:length:followedByLetter:options:depth:matchState:suffixStack:suffixRangeStack:usingBlock:", a3, a4, 0, a5, 0, 13, NAN, v15, v14, a6);

}

+ (void)enumerateSuffixMatchesForWord:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  __CFString *v8;
  uint64_t v9;
  CFIndex usedBufLen;
  UInt8 buffer[72];
  uint64_t v12;
  CFRange v13;

  v12 = *MEMORY[0x1E0C80C00];
  usedBufLen = 0;
  v8 = (__CFString *)objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("’"), CFSTR("'"));
  v9 = -[__CFString length](v8, "length");
  v13.length = -[__CFString length](v8, "length");
  v13.location = 0;
  if (v9 == CFStringGetBytes(v8, v13, 0x504u, 0x5Fu, 0, buffer, 72, &usedBufLen))
    objc_msgSend(a1, "enumerateSuffixMatchesForBuffer:length:options:usingBlock:", buffer, usedBufLen, a4, a5);
}

@end
