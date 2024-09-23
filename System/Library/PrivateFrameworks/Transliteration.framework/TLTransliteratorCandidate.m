@implementation TLTransliteratorCandidate

+ (id)createWithCompositeTransliteratorCandidate:(const void *)a3
{
  int v4;
  const UInt8 *v5;
  CFIndex v6;
  CFStringRef v7;
  CFStringRef v8;
  int v9;
  const UInt8 *v10;
  CFIndex v11;
  CFStringRef v12;
  TLTransliteratorCandidate *v13;
  void *exception;
  void *v16;
  CFStringRef v17;

  v4 = *((char *)a3 + 23);
  if (v4 >= 0)
    v5 = (const UInt8 *)a3;
  else
    v5 = *(const UInt8 **)a3;
  if (v4 >= 0)
    v6 = *((unsigned __int8 *)a3 + 23);
  else
    v6 = *((_QWORD *)a3 + 1);
  v7 = CFStringCreateWithBytes(0, v5, v6, 0x8000100u, 0);
  v17 = v7;
  if (!v7)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x2495AF904](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  v8 = v7;
  v9 = *((char *)a3 + 47);
  if (v9 >= 0)
    v10 = (const UInt8 *)a3 + 24;
  else
    v10 = (const UInt8 *)*((_QWORD *)a3 + 3);
  if (v9 >= 0)
    v11 = *((unsigned __int8 *)a3 + 47);
  else
    v11 = *((_QWORD *)a3 + 4);
  v12 = CFStringCreateWithBytes(0, v10, v11, 0x8000100u, 0);
  if (!v12)
  {
    v16 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x2495AF904](v16, "Could not construct");
    __cxa_throw(v16, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  v13 = -[TLTransliteratorCandidate initWithInputWord:transliteratedWord:lmScore:seq2seqScore:isExtensionCandidate:type:]([TLTransliteratorCandidate alloc], "initWithInputWord:transliteratedWord:lmScore:seq2seqScore:isExtensionCandidate:type:", v8, v12, *((unsigned __int8 *)a3 + 72), *((_QWORD *)a3 + 8), *((double *)a3 + 6), *((double *)a3 + 7), v12, v17);
  CFRelease(v12);
  CFRelease(v8);
  return v13;
}

- (TLTransliteratorCandidate)initWithInputWord:(id)a3 transliteratedWord:(id)a4 lmScore:(double)a5 seq2seqScore:(double)a6 isExtensionCandidate:(BOOL)a7 type:(int64_t)a8
{
  id v14;
  id v15;
  TLTransliteratorCandidate *v16;
  uint64_t v17;
  NSString *inputWord;
  uint64_t v19;
  NSString *transliteratedWord;
  objc_super v22;

  v14 = a3;
  v15 = a4;
  v22.receiver = self;
  v22.super_class = (Class)TLTransliteratorCandidate;
  v16 = -[TLTransliteratorCandidate init](&v22, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v14, "copy");
    inputWord = v16->_inputWord;
    v16->_inputWord = (NSString *)v17;

    v19 = objc_msgSend(v15, "copy");
    transliteratedWord = v16->_transliteratedWord;
    v16->_transliteratedWord = (NSString *)v19;

    v16->_lmScore = a5;
    v16->_seq2seqScore = a6;
    v16->_isExtensionCandidate = a7;
    v16->_type = a8;
  }

  return v16;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v3 = (void *)MEMORY[0x24BDD16E0];
  -[TLTransliteratorCandidate lmScore](self, "lmScore");
  objc_msgSend(v3, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");

  v6 = (void *)MEMORY[0x24BDD16E0];
  -[TLTransliteratorCandidate seq2seqScore](self, "seq2seqScore");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");

  -[TLTransliteratorCandidate inputWord](self, "inputWord");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash");

  -[TLTransliteratorCandidate transliteratedWord](self, "transliteratedWord");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v8 ^ v5;
  v13 = v10 ^ objc_msgSend(v11, "hash");

  return v12 ^ v13 ^ -[TLTransliteratorCandidate type](self, "type");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  BOOL v18;
  int64_t v19;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6
    && (-[TLTransliteratorCandidate lmScore](self, "lmScore"), v8 = v7, objc_msgSend(v6, "lmScore"), v8 == v9)
    && (-[TLTransliteratorCandidate seq2seqScore](self, "seq2seqScore"),
        v11 = v10,
        objc_msgSend(v6, "seq2seqScore"),
        v11 == v12))
  {
    -[TLTransliteratorCandidate inputWord](self, "inputWord");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "inputWord");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isEqualToString:", v14))
    {
      -[TLTransliteratorCandidate transliteratedWord](self, "transliteratedWord");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "transliteratedWord");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "isEqualToString:", v16)
        && (v17 = -[TLTransliteratorCandidate isExtensionCandidate](self, "isExtensionCandidate"),
            v17 == objc_msgSend(v6, "isExtensionCandidate")))
      {
        v19 = -[TLTransliteratorCandidate type](self, "type");
        v18 = v19 == objc_msgSend(v6, "type");
      }
      else
      {
        v18 = 0;
      }

    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[6];
  _QWORD v16[7];

  v16[6] = *MEMORY[0x24BDAC8D0];
  v15[0] = CFSTR("Input Word");
  -[TLTransliteratorCandidate inputWord](self, "inputWord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v15[1] = CFSTR("Transliterated Word");
  -[TLTransliteratorCandidate transliteratedWord](self, "transliteratedWord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v4;
  v15[2] = CFSTR("LM Score");
  v5 = (void *)MEMORY[0x24BDD16E0];
  -[TLTransliteratorCandidate lmScore](self, "lmScore");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v6;
  v15[3] = CFSTR("Seq2Seq Score");
  v7 = (void *)MEMORY[0x24BDD16E0];
  -[TLTransliteratorCandidate seq2seqScore](self, "seq2seqScore");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v8;
  v15[4] = CFSTR("Is Extension Candidate");
  v9 = -[TLTransliteratorCandidate isExtensionCandidate](self, "isExtensionCandidate");
  v10 = CFSTR("NO");
  if (v9)
    v10 = CFSTR("YES");
  v16[4] = v10;
  v15[5] = CFSTR("Type");
  TLTransliterationCandidateTypeAsString(-[TLTransliteratorCandidate type](self, "type"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[5] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "description");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSString)inputWord
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)transliteratedWord
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (double)lmScore
{
  return self->_lmScore;
}

- (double)seq2seqScore
{
  return self->_seq2seqScore;
}

- (BOOL)isExtensionCandidate
{
  return self->_isExtensionCandidate;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transliteratedWord, 0);
  objc_storeStrong((id *)&self->_inputWord, 0);
}

@end
