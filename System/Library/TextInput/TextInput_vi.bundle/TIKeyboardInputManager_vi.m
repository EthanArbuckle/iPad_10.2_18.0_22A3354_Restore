@implementation TIKeyboardInputManager_vi

- (TIKeyboardInputManager_vi)initWithConfig:(id)a3 keyboardState:(id)a4
{
  id v6;
  id v7;
  TIKeyboardInputManager_vi *v8;
  objc_super v10;

  v6 = a4;
  v7 = a3;
  +[TIKeyboardInputManager_vi setupUnikey](TIKeyboardInputManager_vi, "setupUnikey");
  v10.receiver = self;
  v10.super_class = (Class)TIKeyboardInputManager_vi;
  v8 = -[TIKeyboardInputManager_mul initWithConfig:keyboardState:](&v10, sel_initWithConfig_keyboardState_, v7, v6);

  if (v8)
    (*(_BYTE **)((char *)&v8->super.super.super.super.isa + (int)*MEMORY[0x24BEB5498]))[689] = 0;
  else
    +[TIKeyboardInputManager_vi cleanupUnikey](TIKeyboardInputManager_vi, "cleanupUnikey");
  return v8;
}

- (void)initImplementation
{
  id WeakRetained;
  const KB::String *v4;
  void *v5;
  NSString *v6;
  KB *v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  KB::ns_string(a2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "internalStringToExternal:", v5);
  v7 = (KB *)objc_claimAutoreleasedReturnValue();

  KB::utf8_string(v7, v6);
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_opt_class(), "cleanupUnikey");
  if (self->m_transliterator)
  {
    utrans_close();
    self->m_transliterator = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardInputManager_vi;
  -[TIKeyboardInputManager_vi dealloc](&v3, sel_dealloc);
}

- (unsigned)lexiconID
{
  NSNumber *m_lexiconID;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSNumber *v8;
  NSNumber *v9;

  m_lexiconID = self->m_lexiconID;
  if (!m_lexiconID)
  {
    v4 = (void *)MEMORY[0x24BDD16E0];
    -[TIKeyboardInputManagerBase inputMode](self, "inputMode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "locale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localeIdentifier");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v7, "UTF8String");
    objc_msgSend(v4, "numberWithUnsignedInt:", TILexiconIDForLocaleIdentifier());
    v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v9 = self->m_lexiconID;
    self->m_lexiconID = v8;

    m_lexiconID = self->m_lexiconID;
  }
  return -[NSNumber unsignedIntValue](m_lexiconID, "unsignedIntValue");
}

- (BOOL)usesRetrocorrection
{
  return !-[TIKeyboardInputManager_mul isUsingMultilingual](self, "isUsingMultilingual");
}

- (BOOL)emphasizesAlternativeInput
{
  return 0;
}

+ (void)setupUnikey
{
  id v2;

  v2 = a1;
  objc_sync_enter(v2);
  if (!__UnikeyRefCount++)
  {
    UnikeySetup();
    UnikeySetInputMethod();
    UnikeyGetOptions();
    UnikeySetOptions();
  }
  objc_sync_exit(v2);

}

+ (void)cleanupUnikey
{
  id obj;

  obj = a1;
  objc_sync_enter(obj);
  if (__UnikeyRefCount)
  {
    if (!--__UnikeyRefCount)
      UnikeyCleanup();
  }
  objc_sync_exit(obj);

}

- (BOOL)doesComposeText
{
  return 1;
}

- (void)createTransliterator
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  unsigned __int16 *v7;
  uint64_t v8;
  BOOL v9;
  void **v10;
  uint64_t v11;
  UErrorCode v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  int v25;
  int v26;
  _BYTE v27[32];
  int v28;
  id v29[2];

  v29[1] = *(id *)MEMORY[0x24BDAC8D0];
  TIBundleForInputMode();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathForResource:ofType:", CFSTR("vi_TelexTransliterator"), CFSTR("txt"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v29[0] = 0;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfFile:encoding:error:", v3, 4, v29);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v29[0];
    v6 = v5;
    if (!v4)
    {
      if (v5)
        NSLog(CFSTR("Error opening transliterator file %@"), v5);
      v10 = 0;
      goto LABEL_29;
    }
    v7 = (unsigned __int16 *)malloc_type_malloc(2 * (int)objc_msgSend(v4, "length"), 0x1000040BDFB0063uLL);
    v8 = objc_msgSend(CFSTR("vi_TelexTransliterator"), "length");
    if (v7)
      v9 = (int)v8 < 1;
    else
      v9 = 1;
    if (v9)
    {
      v10 = 0;
      if (!v7)
        goto LABEL_29;
    }
    else
    {
      v28 = 0;
      MEMORY[0x24BDAC7A8](v8);
      objc_msgSend(CFSTR("vi_TelexTransliterator"), "getCharacters:range:", (char *)&v21 - ((v11 + 15) & 0x3FFFFFFF0), 0);
      objc_msgSend(v4, "getCharacters:", v7);
      v10 = (void **)utrans_openU();
      v12 = v28;
      if (v28 >= 1)
      {
        v13 = 32;
        if (v26 >= 1 && v25 <= 0)
          v13 = v7[v26];
        v14 = 8;
        v23 = v26;
        v24 = &v21;
        v22 = v13;
        do
        {
          if (!*(_WORD *)((char *)&v25 + v14))
            break;
          v14 += 2;
        }
        while (v14 != 40);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = &v28;
        v17 = 40;
        while (*(_WORD *)((char *)&v25 + v17))
        {
          v17 += 2;
          if (v17 == 72)
            goto LABEL_26;
        }
        v16 = (int *)((char *)&v25 + v17);
LABEL_26:
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", v27, ((unint64_t)((char *)v16 - v27) >> 1));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = u_errorName(v12);
        NSLog(CFSTR("Parse error %s for %@ at line %d, offset %d %@ >>> %#x <<< %@"), v19, CFSTR("vi_TelexTransliterator"), v25, v23, v15, v22, v18);

      }
      if (!v7)
        goto LABEL_29;
    }
    free(v7);
LABEL_29:

    goto LABEL_30;
  }
  NSLog(CFSTR("Can't find transliterator file: vi_TelexTransliterator"));
  v10 = 0;
LABEL_30:

  return v10;
}

- (id)decomposeTelex:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v9;

  v4 = a3;
  if (!self->m_transliterator)
    self->m_transliterator = -[TIKeyboardInputManager_vi createTransliterator](self, "createTransliterator");
  v9 = objc_msgSend(v4, "length");
  v5 = malloc_type_malloc(6 * v9, 0x1000040BDFB0063uLL);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v4, "getCharacters:range:", v5, 0, objc_msgSend(v4, "length"));
    utrans_transUChars();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", v6, v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    free(v6);
  }
  else
  {
    NSLog(CFSTR("couldn't create UniChars buffer"));
    v7 = 0;
  }

  return v7;
}

- (id)addInput:(id)a3 flags:(unsigned int)a4 point:(CGPoint)a5 firstDelete:(unint64_t *)a6
{
  double y;
  double x;
  uint64_t v9;
  id v11;
  BOOL v12;
  int *v13;
  unint64_t v14;
  const KB::String *v15;
  void *v16;
  BOOL v17;
  KB *v18;
  NSString *v19;
  objc_super v21;
  _BYTE v22[32];
  uint64_t v23;

  y = a5.y;
  x = a5.x;
  v9 = *(_QWORD *)&a4;
  v23 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = -[TIKeyboardInputManager_vi compositionDisabled](self, "compositionDisabled");
  v13 = *(int **)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BEB5498]);
  v14 = v13[24];
  TIInputManager::input_string((TIInputManager *)v13);
  KB::ns_string((KB *)v22, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  KB::String::~String((KB::String *)v22);
  if (v12)
  {
    -[TIKeyboardInputManager_vi setCompositionDisabled:](self, "setCompositionDisabled:", 1);
    if (!-[TIKeyboardInputManager_vi compositionDisabled](self, "compositionDisabled"))
    {
      v17 = *(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BEB5490]) != 0;
      goto LABEL_6;
    }
  }
  else
  {
    -[TIKeyboardInputManager_vi setCompositionDisabled:](self, "setCompositionDisabled:", objc_msgSend(v16, "length") > v14);
  }
  v17 = 0;
LABEL_6:
  self->m_useInternalIndex = v17;
  if ((v9 & 0x80) != 0)
  {
    v18 = (KB *)v11;
    KB::utf8_string(v18, v19);
    TIInputManager::add_input();
    KB::String::~String((KB::String *)v22);
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BEB5490]), "setString:", v18);
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)TIKeyboardInputManager_vi;
    -[TIKeyboardInputManager_vi addInput:flags:point:firstDelete:](&v21, sel_addInput_flags_point_firstDelete_, v11, v9, a6, x, y);
    v18 = (KB *)objc_claimAutoreleasedReturnValue();
  }
  self->m_useInternalIndex = 0;
  if (objc_msgSend(v11, "isEqualToString:", CFSTR(" ")))
    -[TIKeyboardInputManager_vi setCompositionDisabled:](self, "setCompositionDisabled:", 0);

  return v18;
}

- (BOOL)canHandleCharacter:(unsigned __int16)a3
{
  uint64_t v3;
  void *v5;
  char v6;
  int v8;
  void *v9;
  void *v10;
  char v11;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD14A8], "letterCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "characterIsMember:", v3);

  if ((v6 & 1) != 0)
    return 1;
  v8 = -[TIKeyboardInputManager_vi vietnameseType](self, "vietnameseType");
  switch(v8)
  {
    case 3:
      objc_msgSend(MEMORY[0x24BDD14A8], "TI_vietnameseVIQRSpecialsCharacterSet");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 2:
      objc_msgSend(MEMORY[0x24BDD14A8], "TI_vietnameseVNISpecialsCharacterSet");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 1:
      objc_msgSend(MEMORY[0x24BDD14A8], "TI_vietnameseTelexSpecialsCharacterSet");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
      v10 = v9;
      v11 = objc_msgSend(v9, "characterIsMember:", v3);

      return v11;
  }
  return 0;
}

- (id)externalStringToInternal:(id)a3
{
  return -[TIKeyboardInputManager_vi externalStringToInternal:ignoreCompositionDisabled:](self, "externalStringToInternal:ignoreCompositionDisabled:", a3, 0);
}

- (id)externalStringToInternal:(id)a3 ignoreCompositionDisabled:(BOOL)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = v6;
  if (-[TIKeyboardInputManager_vi inputTypeSupportsDecomposition](self, "inputTypeSupportsDecomposition"))
  {
    if (a4 || (v7 = v6, !-[TIKeyboardInputManager_vi compositionDisabled](self, "compositionDisabled")))
    {
      -[TIKeyboardInputManager_vi decomposeTelex:](self, "decomposeTelex:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v7;
}

- (id)internalStringToExternal:(id)a3
{
  return -[TIKeyboardInputManager_vi internalStringToExternal:ignoreCompositionDisabled:](self, "internalStringToExternal:ignoreCompositionDisabled:", a3, 0);
}

- (id)internalStringToExternal:(id)a3 ignoreCompositionDisabled:(BOOL)a4
{
  id v6;
  __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  UniChar chars;

  v6 = a3;
  if (a4 || !-[TIKeyboardInputManager_vi compositionDisabled](self, "compositionDisabled"))
  {
    v8 = objc_msgSend(v6, "length");
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", v8);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    UnikeyResetBuf();
    -[TIKeyboardInputManager_vi updateUnikeyWithVietnameseType:](self, "updateUnikeyWithVietnameseType:", -[TIKeyboardInputManager_vi vietnameseType](self, "vietnameseType"));
    if (v8)
    {
      v9 = 0;
      v10 = (int *)MEMORY[0x24BEB5588];
      v11 = (int *)MEMORY[0x24BEB5578];
      v12 = MEMORY[0x24BEB5580];
      do
      {
        chars = 0;
        v13 = objc_msgSend(v6, "characterAtIndex:", v9);
        chars = v13;
        if (-[TIKeyboardInputManager_vi canHandleCharacter:](self, "canHandleCharacter:", v13))
        {
          UnikeySetCapsState();
          UnikeyFilter();
          v14 = *v10;
          if (v14 | *v11)
          {
            if ((_DWORD)v14)
              v15 = *v11 < 1;
            else
              v15 = 1;
            if (v15)
            {
              if ((_DWORD)v14)
              {
                *(_BYTE *)(v12 + v14) = 0;
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v12);
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                -[__CFString appendString:](v7, "appendString:", v16);

              }
            }
            else
            {
              *(_BYTE *)(v12 + v14) = 0;
              if (-[__CFString length](v7, "length") >= (unint64_t)*v11)
                v17 = -[__CFString length](v7, "length") - *v11;
              else
                v17 = 0;
              v18 = -[__CFString length](v7, "length") - v17;
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v12);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              -[__CFString replaceCharactersInRange:withString:](v7, "replaceCharactersInRange:withString:", v17, v18, v19);

              v10 = (int *)MEMORY[0x24BEB5588];
            }
          }
          else
          {
            CFStringAppendCharacters(v7, &chars, 1);
          }
        }
        else
        {
          CFStringAppendCharacters(v7, &chars, 1);
          UnikeyResetBuf();
        }
        ++v9;
      }
      while (v8 != v9);
    }
  }
  else
  {
    v7 = (__CFString *)v6;
  }

  return v7;
}

- (void)acceptInput
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)TIKeyboardInputManager_vi;
  -[TIKeyboardInputManager_vi acceptInput](&v2, sel_acceptInput);
}

- (void)setInput:(id)a3 withIndex:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  objc_super v7;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  if (!-[TIKeyboardInputManager_vi compositionDisabled](self, "compositionDisabled"))
    -[TIKeyboardInputManager_vi setCompositionDisabled:](self, "setCompositionDisabled:", objc_msgSend(v6, "length") > (unint64_t)v4);
  v7.receiver = self;
  v7.super_class = (Class)TIKeyboardInputManager_vi;
  -[TIKeyboardInputManager_vi setInput:withIndex:](&v7, sel_setInput_withIndex_, v6, v4);

}

- (void)setInputIndex:(unsigned int)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardInputManager_vi;
  -[TIKeyboardInputManager_vi setInputIndex:](&v3, sel_setInputIndex_, *(_QWORD *)&a3);
}

- (unsigned)inputIndex
{
  uint64_t v2;
  objc_super v4;

  if (self->m_useInternalIndex)
  {
    v2 = *(uint64_t *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BEB5498]);
    if (v2)
      return *(_DWORD *)(v2 + 96);
  }
  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManager_vi;
  return -[TIKeyboardInputManager_vi inputIndex](&v4, sel_inputIndex);
}

- (unint64_t)deleteLengthForString:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  const KB::String *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  int v12;
  _BYTE v14[32];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  v6 = v5 != 0;
  v7 = (int)*MEMORY[0x24BEB5498];
  TIInputManager::input_string(*(TIInputManager **)((char *)&self->super.super.super.super.isa + v7));
  KB::ns_string((KB *)v14, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  KB::String::~String((KB::String *)v14);
  v10 = (*(unsigned int **)((char *)&self->super.super.super.super.isa + v7))[24];
  if (v10 >= v5 && objc_msgSend(v9, "length") >= v10)
  {
    objc_msgSend(v9, "substringWithRange:", v10 - v5, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v4, "isEqualToString:", v11);

    if (v12)
      v6 = v5;
  }

  return v6;
}

- (id)deleteFromInput:(unint64_t *)a3
{
  uint64_t v5;
  unsigned int v6;
  BOOL v7;
  unsigned int v8;
  uint64_t v9;
  const KB::String *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  unsigned int v20;
  const KB::String *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  objc_super v29;
  _BYTE v30[32];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  if (a3)
    *a3 = 1;
  v5 = (int)*MEMORY[0x24BEB5498];
  if (!*(Class *)((char *)&self->super.super.super.super.isa + v5))
    return 0;
  v6 = -[TIKeyboardInputManager_vi inputIndex](self, "inputIndex");
  if (*(Class *)((char *)&self->super.super.super.super.isa + v5))
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7
    || (v8 = v6,
        v9 = (int)*MEMORY[0x24BEB5490],
        objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v9), "length") < (unint64_t)v6))
  {
    v29.receiver = self;
    v29.super_class = (Class)TIKeyboardInputManager_vi;
    -[TIKeyboardInputManager_vi deleteFromInput:](&v29, sel_deleteFromInput_, a3);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v28 = v8;
    TIInputManager::input_string(*(TIInputManager **)((char *)&self->super.super.super.super.isa + v5));
    KB::ns_string((KB *)v30, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager_vi internalStringToExternal:](self, "internalStringToExternal:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    KB::String::~String((KB::String *)v30);
    v14 = objc_msgSend(v13, "rangeOfComposedCharacterSequenceAtIndex:", v8 - 1);
    objc_msgSend(v13, "substringWithRange:", v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager_vi externalStringToInternal:](self, "externalStringToInternal:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[TIKeyboardInputManager_vi deleteLengthForString:](self, "deleteLengthForString:", v17);
    if (v18)
    {
      v19 = v18;
      v20 = 1;
      do
      {
        TIInputManager::delete_from_input(*(TIInputManager **)((char *)&self->super.super.super.super.isa + v5));
        if (v20 != 1)
          TIInputManager::delete_from_favonius_stroke_history(*(TIInputManager **)((char *)&self->super.super.super.super.isa
                                                                                 + v5));
      }
      while (v19 > v20++);
    }
    TIInputManager::input_string(*(TIInputManager **)((char *)&self->super.super.super.super.isa + v5));
    KB::ns_string((KB *)v30, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    KB::String::~String((KB::String *)v30);
    -[TIKeyboardInputManager_vi internalStringToExternal:](self, "internalStringToExternal:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "substringToIndex:", (*(unsigned int **)((char *)&self->super.super.super.super.isa + v5))[24]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager_vi internalStringToExternal:](self, "internalStringToExternal:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    -[TIKeyboardInputManager_vi suffixOfDesiredString:toAppendToInputString:withInputIndex:afterDeletionCount:](self, "suffixOfDesiredString:toAppendToInputString:withInputIndex:afterDeletionCount:", v26, *(Class *)((char *)&self->super.super.super.super.isa + v9), v28, a3);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v9), "setString:", v24);
    if (!objc_msgSend(v27, "length"))
    {

      v27 = 0;
    }

    return v27;
  }
}

- (void)updateUnikeyWithVietnameseType:(int)a3
{
  if (a3 <= 3)
    UnikeySetInputMethod();
}

- (int)vietnameseType
{
  return 0;
}

- (BOOL)inputTypeSupportsDecomposition
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_lexiconID, 0);
}

- (uint64_t)initImplementation
{
  objc_destroyWeak((id *)(a1 + 8));
  return a1;
}

- (id)initImplementation
{
  id *v1;
  id *v2;

  v1 = (id *)(a1 + 8);
  v2 = (id *)operator new(0x10uLL);
  *v2 = &off_25012DBB0;
  objc_copyWeak(v2 + 1, v1);
  return v2;
}

@end
