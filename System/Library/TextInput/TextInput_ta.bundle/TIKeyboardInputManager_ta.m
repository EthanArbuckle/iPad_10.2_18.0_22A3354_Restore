@implementation TIKeyboardInputManager_ta

- (void)syncToLayoutState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TIKeyboardInputManager_ta;
  -[TIKeyboardInputManagerIndic syncToLayoutState:](&v8, sel_syncToLayoutState_, v4);
  if (!-[TIKeyboardInputManagerIndic alphabeticLayout](self, "alphabeticLayout"))
  {
    objc_msgSend(v4, "softwareLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("QWERTY-Tamil")))
    {
      self->_isQWERTYLayout = 1;
    }
    else
    {
      -[TIKeyboardInputManager_ta keyboardState](self, "keyboardState");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "hardwareKeyboardMode"))
      {
        objc_msgSend(v4, "hardwareLayout");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        self->_isQWERTYLayout = objc_msgSend(v7, "isEqualToString:", CFSTR("Tamil99")) ^ 1;

      }
      else
      {
        self->_isQWERTYLayout = 0;
      }

    }
    -[TIKeyboardInputManager_ta configureTransliterators](self, "configureTransliterators");
  }

}

- (id)keyboardFeatureSpecialization
{
  objc_class *v3;
  TIKeyboardFeatureSpecialization_ta *tamilFeatureSpecialization;
  id v5;
  void *v6;
  TIKeyboardFeatureSpecialization_ta *v7;
  TIKeyboardFeatureSpecialization_ta *v8;
  void *v9;
  void *v10;

  -[TIKeyboardInputManagerIndic alphabeticLayout](self, "alphabeticLayout");
  v3 = (objc_class *)objc_opt_class();
  tamilFeatureSpecialization = self->_tamilFeatureSpecialization;
  if (!tamilFeatureSpecialization)
  {
    v5 = [v3 alloc];
    -[TIKeyboardInputManagerBase inputMode](self, "inputMode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (TIKeyboardFeatureSpecialization_ta *)objc_msgSend(v5, "initWithInputMode:", v6);
    v8 = self->_tamilFeatureSpecialization;
    self->_tamilFeatureSpecialization = v7;

    -[TIKeyboardInputManager_ta config](self, "config");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardFeatureSpecialization setUseRelaxedOVSPolicy:](self->_tamilFeatureSpecialization, "setUseRelaxedOVSPolicy:", objc_msgSend(v9, "allowRelaxedOVSPolicy"));

    -[TIKeyboardInputManager_ta config](self, "config");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardFeatureSpecialization setSkipCandidateQualityFilter:](self->_tamilFeatureSpecialization, "setSkipCandidateQualityFilter:", objc_msgSend(v10, "skipCandidateQualityFilter"));

    tamilFeatureSpecialization = self->_tamilFeatureSpecialization;
  }
  return tamilFeatureSpecialization;
}

- (void)dealloc
{
  objc_super v3;

  -[TIKeyboardInputManager_ta closeTransliterators](self, "closeTransliterators");
  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardInputManager_ta;
  -[TIKeyboardInputManager_ta dealloc](&v3, sel_dealloc);
}

- (void)closeTransliterators
{
  if (self->_internalToExternalTransliterator)
  {
    utrans_close();
    self->_internalToExternalTransliterator = 0;
  }
  if (self->_externalToInternalTransliterator)
  {
    utrans_close();
    self->_externalToInternalTransliterator = 0;
  }
}

- (void)configureTransliterators
{
  const __CFString *v3;

  -[TIKeyboardInputManager_ta closeTransliterators](self, "closeTransliterators");
  if (self->_isQWERTYLayout)
    v3 = CFSTR("AnjalTransliterator");
  else
    v3 = CFSTR("Tamil99Transliterator");
  -[TIKeyboardInputManager_ta initTransliteratorsWithID:](self, "initTransliteratorsWithID:", v3);
}

- (void)initTransliteratorsWithID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  _QWORD v13[2];
  int v14;
  id v15[2];

  v15[1] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = a3;
  TIBundleForInputMode();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathForResource:ofType:", v4, CFSTR("txt"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v15[0] = 0;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfFile:encoding:error:", v6, 4, v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v15[0];
    if (v7)
    {
      v9 = malloc_type_malloc(2 * (int)objc_msgSend(v7, "length"), 0x1000040BDFB0063uLL);
      v10 = objc_msgSend(v4, "length");
      if (v9)
        v11 = (int)v10 < 1;
      else
        v11 = 1;
      if (v11)
      {
        if (!v9)
          goto LABEL_14;
      }
      else
      {
        v13[1] = v13;
        v14 = 0;
        MEMORY[0x24BDAC7A8](v10);
        objc_msgSend(v4, "getCharacters:range:", (char *)v13 - ((v12 + 15) & 0x3FFFFFFF0), 0);
        objc_msgSend(v7, "getCharacters:", v9);
        self->_internalToExternalTransliterator = (void **)utrans_openU();
        if (v14 <= 0)
        {
          self->_externalToInternalTransliterator = (void **)utrans_openU();
          if (v14 >= 1)
          {
            utrans_close();
            self->_internalToExternalTransliterator = 0;
          }
        }
      }
      free(v9);
    }
LABEL_14:

  }
}

- (id)externalStringToInternal:(id)a3
{
  NSString *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v4 = (NSString *)a3;
  if (-[TIKeyboardInputManagerIndic alphabeticLayout](self, "alphabeticLayout"))
  {
    v8.receiver = self;
    v8.super_class = (Class)TIKeyboardInputManager_ta;
    -[TIKeyboardInputManager_ta externalStringToInternal:](&v8, sel_externalStringToInternal_, v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    Transliterate(v4, self->_externalToInternalTransliterator);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (id)internalStringToExternal:(id)a3
{
  NSString *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v4 = (NSString *)a3;
  if (-[TIKeyboardInputManagerIndic alphabeticLayout](self, "alphabeticLayout"))
  {
    v8.receiver = self;
    v8.super_class = (Class)TIKeyboardInputManager_ta;
    -[TIKeyboardInputManager_ta internalStringToExternal:](&v8, sel_internalStringToExternal_, v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    Transliterate(v4, self->_internalToExternalTransliterator);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (id)addInput:(id)a3 flags:(unsigned int)a4 point:(CGPoint)a5 firstDelete:(unint64_t *)a6
{
  double y;
  double x;
  uint64_t v9;
  id v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  y = a5.y;
  x = a5.x;
  v9 = *(_QWORD *)&a4;
  v11 = a3;
  if (!-[TIKeyboardInputManagerIndic alphabeticLayout](self, "alphabeticLayout")
    && !self->_isQWERTYLayout
    && objc_msgSend(v11, "isEqualToString:", CFSTR("க்ஷ")))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "_stringWithUnichar:", 3005);
    v12 = objc_claimAutoreleasedReturnValue();

    v11 = (id)v12;
  }
  v15.receiver = self;
  v15.super_class = (Class)TIKeyboardInputManager_ta;
  -[TIKeyboardInputManager_ta addInput:flags:point:firstDelete:](&v15, sel_addInput_flags_point_firstDelete_, v11, v9, a6, x, y);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (unint64_t)prefixLengthOfInput:(id)a3 sharedWithCandidate:(const void *)a4
{
  return 0;
}

- (id)deleteFromInput:(unint64_t *)a3
{
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v13;
  char v14;
  TIInputManager *v15;
  const KB::String *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  char v23;
  int v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  SEL v28;
  uint64_t v29;
  objc_super v30;
  objc_super v31;
  _BYTE v32[32];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  if (-[TIKeyboardInputManagerIndic alphabeticLayout](self, "alphabeticLayout"))
  {
    v31.receiver = self;
    v31.super_class = (Class)TIKeyboardInputManager_ta;
    -[TIKeyboardInputManager_ta deleteFromInput:](&v31, sel_deleteFromInput_, a3);
LABEL_11:
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    return v11;
  }
  if (a3)
    *a3 = 0;
  v6 = -[TIKeyboardInputManager_ta inputIndex](self, "inputIndex");
  v7 = (int)*MEMORY[0x24BEB5498];
  if (*(Class *)((char *)&self->super.super.super.super.isa + v7))
    v8 = (_DWORD)v6 == 0;
  else
    v8 = 1;
  if (v8
    || (v9 = v6,
        v10 = (int)*MEMORY[0x24BEB5490],
        objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v10), "length") < (unint64_t)v6))
  {
    v30.receiver = self;
    v30.super_class = (Class)TIKeyboardInputManager_ta;
    -[TIKeyboardInputManager_ta deleteFromInput:](&v30, sel_deleteFromInput_, a3);
    goto LABEL_11;
  }
  v27 = v9;
  v28 = a2;
  v29 = v9;
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v10), "substringToIndex:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v11 = 0;
  v15 = *(Class *)((char *)&self->super.super.super.super.isa + v7);
  do
  {
    TIInputManager::delete_from_input(v15);
    if ((v14 & 1) != 0)
      TIInputManager::delete_from_favonius_stroke_history(*(TIInputManager **)((char *)&self->super.super.super.super.isa
                                                                             + v7));
    TIInputManager::input_string(*(TIInputManager **)((char *)&self->super.super.super.super.isa + v7));
    KB::ns_string((KB *)v32, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    KB::String::~String((KB::String *)v32);
    objc_msgSend(v17, "substringToIndex:", (*(unsigned int **)((char *)&self->super.super.super.super.isa + v7))[24]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager_ta internalStringToExternal:](self, "internalStringToExternal:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19
      && (v20 = objc_msgSend(v13, "length"), v20 > objc_msgSend(v19, "length"))
      && objc_msgSend(v13, "hasPrefix:", v19))
    {
      -[TIKeyboardInputManager_ta suffixOfDesiredString:toAppendToInputString:withInputIndex:afterDeletionCount:](self, "suffixOfDesiredString:toAppendToInputString:withInputIndex:afterDeletionCount:", v19, *(Class *)((char *)&self->super.super.super.super.isa + v10), v29, a3);
      v21 = objc_claimAutoreleasedReturnValue();

      -[TIKeyboardInputManager_ta internalStringToExternal:](self, "internalStringToExternal:", v17);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v10), "setString:", v22);

      v23 = 1;
      v11 = (void *)v21;
    }
    else
    {
      v23 = 0;
    }

    v15 = *(Class *)((char *)&self->super.super.super.super.isa + v7);
    v24 = *((_DWORD *)v15 + 24);
    if ((v23 & 1) != 0)
      break;
    v14 = 1;
  }
  while (v24);
  if ((v23 & 1) == 0)
  {
    if (v24)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", v28, self, CFSTR("TIKeyboardInputManager_ta.mm"), 298, CFSTR("Wrong deletion for Tamil input %@ from index %d"), *(Class *)((char *)&self->super.super.super.super.isa + v10), v27);

    }
    -[TIKeyboardInputManager_ta suffixOfDesiredString:toAppendToInputString:withInputIndex:afterDeletionCount:](self, "suffixOfDesiredString:toAppendToInputString:withInputIndex:afterDeletionCount:", &stru_25012C428, *(Class *)((char *)&self->super.super.super.super.isa + v10), v29, a3);
    v25 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v25;
  }

  return v11;
}

- (Class)scriptComposerClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tamilFeatureSpecialization, 0);
}

@end
