@implementation TIKeyboardInputManagerMecabra

- (TIKeyboardInputManagerMecabra)initWithConfig:(id)a3 keyboardState:(id)a4
{
  TIKeyboardInputManagerMecabra *v4;
  void *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *touchUpEvents;
  objc_class *v8;
  Class isa;
  MCDrawInput *cancelledDrawInput;
  NSString *currentRecipientIdentifier;
  uint64_t v12;
  KeyboardLayout *m_ptr;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)TIKeyboardInputManagerMecabra;
  v4 = -[TIKeyboardInputManager_mul initWithConfig:keyboardState:](&v15, sel_initWithConfig_keyboardState_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel_handlePerformBackgroundMaintenanceNotification, CFSTR("TILanguageModelPerformBackgroundMaintenanceNotification"), 0);

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    touchUpEvents = v4->_touchUpEvents;
    v4->_touchUpEvents = v6;

    v8 = (objc_class *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    isa = v4[1].super.super.super.super.isa;
    v4[1].super.super.super.super.isa = v8;

    cancelledDrawInput = v4->_cancelledDrawInput;
    v4->_cancelledDrawInput = (MCDrawInput *)&stru_1EA1081D0;

    currentRecipientIdentifier = v4->_currentRecipientIdentifier;
    v4->_currentRecipientIdentifier = (NSString *)&stru_1EA1081D0;

    v12 = objc_opt_new();
    m_ptr = v4->_baseCharacterKeysLayout.m_ptr;
    v4->_baseCharacterKeysLayout.m_ptr = (KeyboardLayout *)v12;

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManagerMecabra;
  -[TIKeyboardInputManager dealloc](&v4, sel_dealloc);
}

- (void)setKeyboardState:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  objc_super v15;
  _QWORD v16[4];
  id v17;
  char v18;

  v4 = a3;
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "canSuggestSupplementalItemsForCurrentSelection");

  v7 = objc_msgSend(v4, "canSuggestSupplementalItemsForCurrentSelection");
  if (v6 != v7)
  {
    v8 = v7;
    -[TIKeyboardInputManagerMecabra wordSearch](self, "wordSearch");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mecabraEnvironment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[TIKeyboardInputManagerMecabra wordSearch](self, "wordSearch");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CB34C8];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __50__TIKeyboardInputManagerMecabra_setKeyboardState___block_invoke;
    v16[3] = &unk_1EA100538;
    v17 = v10;
    v18 = v8;
    v13 = v10;
    objc_msgSend(v12, "blockOperationWithBlock:", v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "performOperationAsync:", v14);

  }
  v15.receiver = self;
  v15.super_class = (Class)TIKeyboardInputManagerMecabra;
  -[TIKeyboardInputManager setKeyboardState:](&v15, sel_setKeyboardState_, v4);

}

- (BOOL)usesFavonius
{
  return 0;
}

- (MCKeyboardInput)composingInput
{
  KeyboardLayout *m_ptr;

  if (-[TIKeyboardInputManagerMecabra usesComposingInput](self, "usesComposingInput"))
    m_ptr = self->_baseCharacterKeysLayout.m_ptr;
  else
    m_ptr = 0;
  return (MCKeyboardInput *)m_ptr;
}

- (BOOL)usesContinuousPath
{
  void *v3;
  BOOL v4;

  -[TIKeyboardInputManager config](self, "config");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "usesContinuousPath"))
    v4 = -[TIKeyboardInputManagerMecabra usesComposingInput](self, "usesComposingInput");
  else
    v4 = 0;

  return v4;
}

- (BOOL)usesComposingInput
{
  return 0;
}

- (BOOL)isProgressivelyPathing
{
  void *v3;
  void *v4;
  char v5;

  if (!-[TIKeyboardInputManagerMecabra usesComposingInput](self, "usesComposingInput"))
    return 0;
  -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "composingInput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = objc_msgSend(v4, "isDrawing");
  else
    v5 = 0;

  return v5;
}

- (BOOL)shouldDelayUpdateComposedText
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[TIKeyboardInputManagerMecabra usesComposingInput](self, "usesComposingInput");
  if (v3)
  {
    -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hasDrawInput");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)shouldClearInputOnMarkedTextOutOfSync
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  if (!-[TIKeyboardInputManagerMecabra usesComposingInput](self, "usesComposingInput"))
    return 1;
  -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasDrawInput"))
  {
    -[TIKeyboardInputManager keyboardState](self, "keyboardState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "inputForMarkedText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length") == 0;

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (unint64_t)autoquoteType
{
  return 1;
}

- (__Mecabra)mecabra
{
  void *v2;
  __Mecabra *v3;

  -[TIKeyboardInputManagerMecabra wordSearch](self, "wordSearch");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (__Mecabra *)objc_msgSend(v2, "mecabra");

  return v3;
}

- (NSMutableArray)touchDataArray
{
  MCKeyboardInput *composingInput;
  MCKeyboardInput *v4;
  MCKeyboardInput *v5;

  composingInput = self->_composingInput;
  if (!composingInput)
  {
    v4 = (MCKeyboardInput *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = self->_composingInput;
    self->_composingInput = v4;

    composingInput = self->_composingInput;
  }
  return (NSMutableArray *)composingInput;
}

- (NSMutableArray)geometryDataArray
{
  TIKeyboardInputManagerMecabra *v3;
  TIKeyboardInputManagerMecabra *composingKeyboardInputManager;
  TIKeyboardInputManagerMecabra *v5;
  TIKeyboardInputManagerMecabra *v6;

  if (-[TIKeyboardInputManagerMecabra usesComposingInput](self, "usesComposingInput"))
  {
    v3 = 0;
  }
  else
  {
    composingKeyboardInputManager = self->_composingKeyboardInputManager;
    if (!composingKeyboardInputManager)
    {
      v5 = (TIKeyboardInputManagerMecabra *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = self->_composingKeyboardInputManager;
      self->_composingKeyboardInputManager = v5;

      composingKeyboardInputManager = self->_composingKeyboardInputManager;
    }
    v3 = composingKeyboardInputManager;
  }
  return (NSMutableArray *)v3;
}

- (id)geometryModelData
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;

  if (-[TIKeyboardInputManagerMecabra usesComposingInput](self, "usesComposingInput"))
  {
    v3 = 0;
  }
  else
  {
    v4 = -[TIKeyboardInputManagerMecabra analysisStringRange](self, "analysisStringRange");
    v6 = v5;
    -[TIKeyboardInputManagerMecabra geometryDataArray](self, "geometryDataArray");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    v3 = 0;
    if (v4 != 0x7FFFFFFFFFFFFFFFLL && v6 && v4 < v8 && v4 + v6 <= v8)
    {
      -[TIKeyboardInputManagerMecabra geometryDataArray](self, "geometryDataArray");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "subarrayWithRange:", v4, v6);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  return v3;
}

- (_NSRange)analysisStringRange
{
  void *v2;
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  _NSRange result;

  -[TIKeyboardInputManager rawInputString](self, "rawInputString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  v4 = 0;
  v5 = v3;
  result.length = v5;
  result.location = v4;
  return result;
}

- (NSCharacterSet)validCharacterSetForAutocorrection
{
  if (-[TIKeyboardInputManagerMecabra validCharacterSetForAutocorrection]::__onceToken != -1)
    dispatch_once(&-[TIKeyboardInputManagerMecabra validCharacterSetForAutocorrection]::__onceToken, &__block_literal_global_77);
  return (NSCharacterSet *)(id)-[TIKeyboardInputManagerMecabra validCharacterSetForAutocorrection]::__validCharSet;
}

- (NSCharacterSet)validCharacterSetForSegmentation
{
  return (NSCharacterSet *)objc_msgSend(MEMORY[0x1E0CB3500], "pinyinInputCharacterSet");
}

- (USet)validUSetForAutocorrection
{
  return 0;
}

- (void)keyLayoutWillChangeTo:(id)a3 from:(id)a4
{
  id v6;
  void *v7;
  objc_super v8;

  v6 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TIKeyboardInputManagerMecabra;
  -[TIKeyboardInputManager keyLayoutWillChangeTo:from:](&v8, sel_keyLayoutWillChangeTo_from_, v6, a4);
  if (-[TIKeyboardInputManagerMecabra usesComposingInput](self, "usesComposingInput")
    && !-[TIKeyboardInputManagerMecabra shouldRescaleTouchPoints](self, "shouldRescaleTouchPoints"))
  {
    -[TIKeyboardInputManagerMecabra wordSearch](self, "wordSearch");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setKeyboardLayout:", v6);

  }
}

- (void)saveGeometryForInput:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  int v10;
  float v11;
  void *v12;
  USet *v13;
  USet *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  int v22;
  _QWORD *v23;
  _QWORD *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  uint64_t v28;
  int v29;
  int v30;
  unsigned int v31;
  _QWORD v32[12];

  v32[11] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!-[TIKeyboardInputManagerMecabra usesComposingInput](self, "usesComposingInput"))
  {
    v7 = (*(uint64_t (**)(_QWORD, _QWORD))(**((_QWORD **)self->super.super.m_impl + 23) + 240))(*((_QWORD *)self->super.super.m_impl + 23), (*((_DWORD *)self->super.super.m_impl + 24) - 1));
    if (!v7)
    {
LABEL_6:
      -[TIKeyboardInputManagerMecabra restoreGeometryForInput:atIndex:](self, "restoreGeometryForInput:atIndex:", v6, a4);
      goto LABEL_7;
    }
    v8 = (_QWORD *)v7;
    -[TIKeyboardInputManager keyboardState](self, "keyboardState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "hardwareKeyboardMode") & 1) != 0 || objc_msgSend(v6, "isPopupVariant"))
    {

      goto LABEL_6;
    }
    v10 = objc_msgSend(v6, "isGesture");

    if (v10)
      goto LABEL_6;
    if (s_interface_idiom_is_pad)
      v11 = -3.0;
    else
      v11 = -2.0;
    -[TIKeyboardInputManagerMecabra validCharacterSetForAutocorrection](self, "validCharacterSetForAutocorrection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[TIKeyboardInputManagerMecabra validUSetForAutocorrection](self, "validUSetForAutocorrection");
    if (*v8)
    {
      v14 = v13;
      v15 = 0;
      v16 = v8[1];
      v17 = 8 * *v8;
      while (1)
      {
        if (*(float *)(*(_QWORD *)v16 + 32) < v11)
          goto LABEL_27;
        v18 = *(_QWORD *)(*(_QWORD *)v16 + 8);
        v19 = *(_QWORD *)(v18 + 16);
        if (!v19)
          v19 = v18 + 24;
        v28 = v19;
        v20 = *(unsigned __int16 *)(v18 + 8);
        v29 = 0;
        v30 = v20;
        v31 = 0;
        KB::String::iterator::initialize(&v28);
        v21 = v31;
        if ((objc_msgSend(v12, "characterIsMember:", (unsigned __int16)v31) & 1) != 0)
        {
          if ((_WORD)v21)
            goto LABEL_23;
        }
        else if (v14)
        {
          v22 = MEMORY[0x1DF0A2DEC](v14, v21);
          if ((_WORD)v21)
          {
            if (v22)
            {
LABEL_23:
              v23 = &v32[v15];
              *(_WORD *)v23 = v21;
              *((_DWORD *)v23 + 1) = *(_DWORD *)(*(_QWORD *)v16 + 32);
              if (++v15 == 10)
                goto LABEL_27;
            }
          }
        }
        v16 += 8;
        v17 -= 8;
        if (!v17)
          goto LABEL_27;
      }
    }
    v15 = 0;
LABEL_27:
    v24 = &v32[v15];
    *(_WORD *)v24 = 0;
    *((_DWORD *)v24 + 1) = 0;
    -[TIKeyboardInputManagerMecabra padGeometryForInput:atIndex:](self, "padGeometryForInput:atIndex:", v6, a4);
    -[TIKeyboardInputManagerMecabra geometryDataArray](self, "geometryDataArray");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v32, 8 * (v15 + 1));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = a4 - 1;
    objc_msgSend(v25, "insertObject:atIndex:", v26, v27);

    if (-[TIKeyboardInputManager isTypologyEnabled](self, "isTypologyEnabled"))
      -[TIKeyboardInputManagerMecabra saveTouchDataForEvent:atIndex:](self, "saveTouchDataForEvent:atIndex:", v6, v27);

  }
LABEL_7:

}

- (void)restoreGeometryForInput:(id)a3 atIndex:(unint64_t)a4
{
  BOOL v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unint64_t v29;
  void *v30;
  unint64_t v31;
  void *v32;
  void *v33;
  _BOOL4 v34;
  void *v35;
  unint64_t v36;
  id v37;

  v37 = a3;
  v6 = -[TIKeyboardInputManagerMecabra usesComposingInput](self, "usesComposingInput");
  v7 = v37;
  if (!v6)
  {
    objc_msgSend(v37, "string");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");

    -[TIKeyboardInputManagerMecabra geometryDataArray](self, "geometryDataArray");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11 < a4)
    {
      -[TIKeyboardInputManagerMecabra clearedGeometryDataArray](self, "clearedGeometryDataArray");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        -[TIKeyboardInputManagerMecabra clearedGeometryDataArray](self, "clearedGeometryDataArray");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "count");

        if (v14 >= v9)
        {
          -[TIKeyboardInputManagerMecabra geometryDataArray](self, "geometryDataArray");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[TIKeyboardInputManagerMecabra clearedGeometryDataArray](self, "clearedGeometryDataArray");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[TIKeyboardInputManagerMecabra clearedGeometryDataArray](self, "clearedGeometryDataArray");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "subarrayWithRange:", objc_msgSend(v17, "count") - v9, v9);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObjectsFromArray:", v18);

        }
        -[TIKeyboardInputManagerMecabra setClearedGeometryDataArray:](self, "setClearedGeometryDataArray:", 0);
      }
    }
    if (-[TIKeyboardInputManager isTypologyEnabled](self, "isTypologyEnabled"))
    {
      -[TIKeyboardInputManagerMecabra touchDataArray](self, "touchDataArray");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "count");

      if (v20 < a4)
      {
        -[TIKeyboardInputManagerMecabra clearedTouchDataArray](self, "clearedTouchDataArray");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          -[TIKeyboardInputManagerMecabra clearedTouchDataArray](self, "clearedTouchDataArray");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "count");

          if (v23 >= v9)
          {
            -[TIKeyboardInputManagerMecabra touchDataArray](self, "touchDataArray");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[TIKeyboardInputManagerMecabra clearedTouchDataArray](self, "clearedTouchDataArray");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[TIKeyboardInputManagerMecabra clearedTouchDataArray](self, "clearedTouchDataArray");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "subarrayWithRange:", objc_msgSend(v26, "count") - v9, v9);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "addObjectsFromArray:", v27);

          }
          -[TIKeyboardInputManagerMecabra setClearedTouchDataArray:](self, "setClearedTouchDataArray:", 0);
        }
      }
    }
    -[TIKeyboardInputManagerMecabra padGeometryForInput:atIndex:](self, "padGeometryForInput:atIndex:", v37, a4);
    -[TIKeyboardInputManager rawInputString](self, "rawInputString");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "length");

    -[TIKeyboardInputManagerMecabra geometryDataArray](self, "geometryDataArray");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "count");

    if (v31 < v29)
    {
      -[TIKeyboardInputManagerMecabra geometryDataArray](self, "geometryDataArray");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (a4 - 1 >= objc_msgSend(v32, "count"))
      {
        -[TIKeyboardInputManagerMecabra geometryDataArray](self, "geometryDataArray");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIKeyboardInputManagerMecabra insertDummyGeometryDataAtIndex:](self, "insertDummyGeometryDataAtIndex:", objc_msgSend(v33, "count"));

      }
      else
      {
        -[TIKeyboardInputManagerMecabra insertDummyGeometryDataAtIndex:](self, "insertDummyGeometryDataAtIndex:", a4 - 1);
      }

    }
    v34 = -[TIKeyboardInputManager isTypologyEnabled](self, "isTypologyEnabled");
    v7 = v37;
    if (v34)
    {
      -[TIKeyboardInputManagerMecabra touchDataArray](self, "touchDataArray");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "count");

      v7 = v37;
      if (v36 < v29)
      {
        -[TIKeyboardInputManagerMecabra saveTouchDataForEvent:atIndex:](self, "saveTouchDataForEvent:atIndex:", v37, a4 - 1);
        v7 = v37;
      }
    }
  }

}

- (void)padGeometryForInput:(id)a3 atIndex:(unint64_t)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;

  if (!-[TIKeyboardInputManagerMecabra usesComposingInput](self, "usesComposingInput", a3))
  {
    -[TIKeyboardInputManager rawInputString](self, "rawInputString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    if (v7)
    {
      -[TIKeyboardInputManager rawInputString](self, "rawInputString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "length");

      -[TIKeyboardInputManagerMecabra geometryDataArray](self, "geometryDataArray");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");
      v12 = v9 - 1;

      if (v11 < v9 - 1)
      {
        do
        {
          -[TIKeyboardInputManagerMecabra geometryDataArray](self, "geometryDataArray");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (a4 - 1 >= objc_msgSend(v13, "count"))
          {
            -[TIKeyboardInputManagerMecabra geometryDataArray](self, "geometryDataArray");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[TIKeyboardInputManagerMecabra insertDummyGeometryDataAtIndex:](self, "insertDummyGeometryDataAtIndex:", objc_msgSend(v14, "count"));

          }
          else
          {
            -[TIKeyboardInputManagerMecabra insertDummyGeometryDataAtIndex:](self, "insertDummyGeometryDataAtIndex:", a4 - 1);
          }

          -[TIKeyboardInputManagerMecabra geometryDataArray](self, "geometryDataArray");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "count");

        }
        while (v16 < v12);
      }
      if (-[TIKeyboardInputManager isTypologyEnabled](self, "isTypologyEnabled"))
      {
        -[TIKeyboardInputManagerMecabra touchDataArray](self, "touchDataArray");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "count");

        if (v18 < v12)
        {
          v19 = a4 - 1;
          do
          {
            -[TIKeyboardInputManagerMecabra touchDataArray](self, "touchDataArray");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (v19 >= objc_msgSend(v20, "count"))
            {
              -[TIKeyboardInputManagerMecabra touchDataArray](self, "touchDataArray");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              -[TIKeyboardInputManagerMecabra insertDummyTouchDataAtIndex:](self, "insertDummyTouchDataAtIndex:", objc_msgSend(v21, "count"));

            }
            else
            {
              -[TIKeyboardInputManagerMecabra insertDummyTouchDataAtIndex:](self, "insertDummyTouchDataAtIndex:", v19);
            }

            -[TIKeyboardInputManagerMecabra touchDataArray](self, "touchDataArray");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "count");

          }
          while (v23 < v12);
        }
      }
    }
  }
}

- (void)savePartialGeometryData
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (!-[TIKeyboardInputManagerMecabra usesComposingInput](self, "usesComposingInput"))
  {
    -[TIKeyboardInputManagerMecabra geometryDataArray](self, "geometryDataArray");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "copy");
    -[TIKeyboardInputManagerMecabra setClearedGeometryDataArray:](self, "setClearedGeometryDataArray:", v4);

    if (-[TIKeyboardInputManager isTypologyEnabled](self, "isTypologyEnabled"))
    {
      -[TIKeyboardInputManagerMecabra touchDataArray](self, "touchDataArray");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      v5 = (void *)objc_msgSend(v6, "copy");
      -[TIKeyboardInputManagerMecabra setClearedTouchDataArray:](self, "setClearedTouchDataArray:", v5);

    }
  }
}

- (void)updateComposedText
{
  void *v3;
  void *v4;
  id v5;
  objc_super v6;

  if (-[TIKeyboardInputManagerMecabra usesComposingInput](self, "usesComposingInput"))
  {
    -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "asInlineText");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    -[TIKeyboardInputManager_mul internalStringToExternal:](self, "internalStringToExternal:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableString setString:](self->super.super.m_composedText, "setString:", v4);

  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)TIKeyboardInputManagerMecabra;
    -[TIKeyboardInputManager updateComposedText](&v6, sel_updateComposedText);
  }
}

- (id)convertInputsToSyntheticInputUptoCount:(int)a3
{
  return 0;
}

- (id)uncommittedText
{
  return 0;
}

- (id)_convertInputsToSyntheticInputUptoCount:(int)a3 cursorIndex:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  MCSyntheticInput *v9;
  MCSyntheticInput *v10;
  MCKeyboardInput *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  unint64_t v28;
  void *v29;
  MCSyntheticInput *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;

  v6 = a4;
  v7 = v6;
  if (v6)
    v8 = objc_msgSend(v6, "integerValue");
  else
    v8 = -1;
  v9 = [MCSyntheticInput alloc];
  v10 = -[MCSyntheticInput initWithCommittedText:syllables:](v9, "initWithCommittedText:syllables:", &stru_1EA1081D0, MEMORY[0x1E0C9AA60]);
  v11 = objc_alloc_init(MCKeyboardInput);
  if (a3 >= 1)
  {
    do
    {
      -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "inputs");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCKeyboardInput composeNew:](v10, "composeNew:", v14);

      -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "inputs");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCKeyboardInput composeNew:](v11, "composeNew:", v17);

      -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "removeInputAtIndex:", 0);

      --a3;
    }
    while (a3);
  }
  -[MCKeyboardInput asCommittedText](v11, "asCommittedText");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerMecabra uncommittedText](self, "uncommittedText");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    v22 = v20;
  }
  else
  {
    -[MCKeyboardInput asInlineText](v11, "asInlineText");
    v22 = (id)objc_claimAutoreleasedReturnValue();
  }
  v23 = v22;

  -[TIKeyboardInputManagerMecabra syllableSeparator](self, "syllableSeparator");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "length");

  if (v25)
  {
    -[TIKeyboardInputManagerMecabra syllableSeparator](self, "syllableSeparator");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "componentsSeparatedByString:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "length"))
    {
      v28 = 0;
      do
      {
        objc_msgSend(v23, "substringWithRange:", v28, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "addObject:", v29);

        ++v28;
      }
      while (objc_msgSend(v23, "length") > v28);
    }
  }
  v30 = -[MCSyntheticInput initWithCommittedText:syllables:](v10, "initWithCommittedText:syllables:", v19, v27);
  v31 = v30;
  if ((v8 & 0x8000000000000000) == 0)
  {
    -[MCSyntheticInput syntheticInputWithCursorIndex:](v30, "syntheticInputWithCursorIndex:", v8);
    v32 = objc_claimAutoreleasedReturnValue();

    v31 = (void *)v32;
  }
  objc_msgSend(v31, "text");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "length");

  if (v34)
  {
    -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "insertInput:atIndex:", v31, 0);

    -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "composingInput");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v37)
    {
      -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setComposingInput:", v31);

    }
    v39 = v31;
  }
  else
  {
    v39 = 0;
  }

  return v39;
}

- (id)convertInput:(id)a3
{
  return a3;
}

- (id)syllableSeparator
{
  return (id)*MEMORY[0x1E0DBDAE0];
}

- (unint64_t)inputIndexWithDrawInput
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (!-[TIKeyboardInputManagerMecabra usesComposingInput](self, "usesComposingInput"))
    return 0;
  -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasKindOf:", objc_opt_class());

  if (!v4)
    return 0;
  -[TIKeyboardInputManager inputString](self, "inputString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerMecabra syllableSeparator](self, "syllableSeparator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", v6, &stru_1EA1081D0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "length");
  -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "inputs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "hasKindOf:", objc_opt_class());

    if ((v13 & 1) == 0)
    {
      v14 = v11;
      objc_msgSend(v14, "text");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "length");
      v17 = objc_msgSend(v14, "cursorIndex");

      if (v8 <= v16 - v17)
        v18 = 0;
      else
        v18 = v16 - v17;
      v8 -= v18;
    }
  }

  return v8;
}

- (id)handleAcceptedCandidate:(id)a3 keyboardState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char isKindOfClass;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  MCAcceptCandidateInput *v35;
  void *v36;
  MCAcceptCandidateInput *v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v61;
  char v62;
  void *v63;
  objc_super v64;
  _QWORD v65[4];
  id v66;
  TIKeyboardInputManagerMecabra *v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t v72;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isResponseKitCandidate"))
  {
    v8 = (void *)MEMORY[0x1E0D87BF8];
    v9 = *MEMORY[0x1E0D87C18];
    -[TIKeyboardInputManagerBase inputMode](self, "inputMode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "normalizedIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    TIInputModeGetBaseLanguage();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "incrementAggdKeyForCategory:forAction:withLanguageID:", 0, v9, v12);

    v13 = (void *)MEMORY[0x1E0D87BF8];
    objc_msgSend(v6, "responseKitCategory");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerBase inputMode](self, "inputMode");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "normalizedIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    TIInputModeGetBaseLanguage();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "incrementAggdKeyForCategory:forAction:withLanguageID:", v14, v9, v17);

  }
  -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleAcceptedCandidate:keyboardState:", v6, v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    if (objc_msgSend(v6, "isAddress"))
    {
      -[TIKeyboardInputManager keyboardState](self, "keyboardState");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "documentState");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "contextBeforeInput");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v22, "length"))
      {
LABEL_10:

        goto LABEL_11;
      }
      objc_msgSend(v6, "candidate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "_firstGrapheme");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v24, "_containsCJScripts") & 1) != 0)
      {

        goto LABEL_10;
      }
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v6, "candidate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(CFSTR(" "), "stringByAppendingString:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "candidateByReplacingWithCandidate:", v21);
        v22 = v6;
        v6 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
    }
LABEL_11:
    if (!-[TIKeyboardInputManagerMecabra usesComposingInput](self, "usesComposingInput")
      || (objc_msgSend(v6, "candidate"),
          v26 = (void *)objc_claimAutoreleasedReturnValue(),
          v27 = objc_msgSend(v26, "length"),
          v26,
          !v27))
    {
      -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "removeAllInputs");
LABEL_34:

      -[TIKeyboardInputManagerMecabra setPreservesComposingInput:](self, "setPreservesComposingInput:", 1);
      v69 = 0;
      v70 = &v69;
      v71 = 0x2020000000;
      v72 = 0x7FFFFFFFFFFFFFFFLL;
      -[TIKeyboardInputManagerMecabra wordSearchCandidateResultSet](self, "wordSearchCandidateResultSet");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "candidates");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v65[0] = MEMORY[0x1E0C809B0];
      v65[1] = 3221225472;
      v65[2] = __71__TIKeyboardInputManagerMecabra_handleAcceptedCandidate_keyboardState___block_invoke;
      v65[3] = &unk_1EA0FAD90;
      v6 = v6;
      v67 = self;
      v68 = &v69;
      v66 = v6;
      objc_msgSend(v53, "enumerateObjectsUsingBlock:", v65);

      v64.receiver = self;
      v64.super_class = (Class)TIKeyboardInputManagerMecabra;
      -[TIKeyboardInputManager handleAcceptedCandidate:keyboardState:](&v64, sel_handleAcceptedCandidate_keyboardState_, v6, v7);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[TIKeyboardInputManagerMecabra usesComposingInput](self, "usesComposingInput"))
      {
        -[TIKeyboardInputManagerMecabra updateComposedText](self, "updateComposedText");
        -[TIKeyboardInputManager setMarkedText](self, "setMarkedText");
      }
      -[TIKeyboardInputManagerMecabra setPreservesComposingInput:](self, "setPreservesComposingInput:", 0);
      TIInputManager::sync_with_input_from_UI((TIInputManager *)self->super.super.m_impl);
      objc_msgSend(v6, "candidateByReplacingWithSourceMask:", -[TIKeyboardInputManager adjustedSourceMaskFromCandidate:](self, "adjustedSourceMaskFromCandidate:", v6));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManager typingSessionMonitor](self, "typingSessionMonitor");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManager keyboardState](self, "keyboardState");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "documentState");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManager inputContext](self, "inputContext");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManager inputStem](self, "inputStem");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v61) = 1;
      objc_msgSend(v55, "candidateAccepted:withInput:documentState:inputContext:inputStem:predictionBarHit:useCandidateSelection:candidateIndex:keyboardState:", v54, 0, v57, v58, v59, 0, v61, v70[3], v7);

      _Block_object_dispose(&v69, 8);
      goto LABEL_37;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v28 = -[TIKeyboardInputManagerMecabra mecabraCandidateRefFromCandidate:](self, "mecabraCandidateRefFromCandidate:", v6);
      if (v28)
      {
        v29 = v28;
        objc_msgSend(MEMORY[0x1E0DBDC88], "convertedInputFromMecabraCandidate:", v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v30, "length"))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v6, "input");
            v31 = objc_claimAutoreleasedReturnValue();

            v30 = (void *)v31;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0DBDC88], "inputFromMecabraCandidate:", v29);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            -[TIKeyboardInputManagerMecabra convertInput:](self, "convertInput:", v32);
            v33 = objc_claimAutoreleasedReturnValue();

            v30 = (void *)v33;
          }
        }
      }
      else
      {
        objc_msgSend(v6, "input");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if (v30)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_25:
          v35 = [MCAcceptCandidateInput alloc];
          objc_msgSend(v6, "candidate");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = -[MCAcceptCandidateInput initWithCandidateText:convertedInput:](v35, "initWithCandidateText:convertedInput:", v36, v30);

          -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "composingInput");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v40 = objc_opt_isKindOfClass();

          -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = v41;
          if ((v40 & 1) != 0)
          {
            objc_msgSend(v41, "composingInput");
            v43 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v43, "text");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "syntheticInputWithCursorIndex:", objc_msgSend(v44, "length"));
            v42 = (void *)objc_claimAutoreleasedReturnValue();

            -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "replaceComposingInputWith:", v42);
          }
          else
          {
            objc_msgSend(v41, "inputs");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            if ((unint64_t)objc_msgSend(v45, "count") >= 2)
            {
              -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "inputs");
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v63, "firstObject");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
                v48 = v46;
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                v62 = objc_msgSend(v49, "hasDrawInput");

                if ((v62 & 1) != 0)
                {
LABEL_33:
                  -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v51, "composeNew:", v37);

                  -[TIKeyboardInputManagerMecabra setPreviouslyDeletedTypeInput:](self, "setPreviouslyDeletedTypeInput:", 0);
                  -[TIKeyboardInputManagerMecabra setPreviouslyProcessedDeleteInput:](self, "setPreviouslyProcessedDeleteInput:", 0);

                  goto LABEL_34;
                }
                -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "inputs");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                v50 = -[TIKeyboardInputManagerMecabra convertInputsToSyntheticInputUptoCount:](self, "convertInputsToSyntheticInputUptoCount:", objc_msgSend(v45, "count"));
              }
              else
              {

              }
            }
          }

          goto LABEL_33;
        }
      }
    }
    else
    {
      v30 = 0;
    }
    objc_msgSend(v6, "input");
    v34 = objc_claimAutoreleasedReturnValue();

    v30 = (void *)v34;
    goto LABEL_25;
  }
LABEL_37:

  return v19;
}

- (id)didAcceptCandidate:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  if (-[TIKeyboardInputManagerMecabra usesComposingInput](self, "usesComposingInput"))
  {
    -[TIKeyboardInputManagerMecabra processAcceptedCandidate:](self, "processAcceptedCandidate:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)TIKeyboardInputManagerMecabra;
    -[TIKeyboardInputManager didAcceptCandidate:](&v8, sel_didAcceptCandidate_, v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (id)processAcceptedCandidate:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  int v32;
  BOOL v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;

  v4 = a3;
  if (!-[TIKeyboardInputManagerMecabra usesComposingInput](self, "usesComposingInput"))
    goto LABEL_12;
  -[TIKeyboardInputManagerMecabra setRemainingInput:](self, "setRemainingInput:", 0);
  -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasRemainingComposingInput");

  if (!v6
    || objc_msgSend(v4, "isContinuousPathConversion")
    && !objc_msgSend(v4, "isPartialCandidate"))
  {
    if (v4)
    {
      -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "asInlineText");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v23 = 0;
    }
    -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeAllInputs");
    goto LABEL_20;
  }
  -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "inputs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count") != 2)
  {
LABEL_19:

    v23 = 0;
LABEL_20:

    goto LABEL_21;
  }
  -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "inputs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_18:

    goto LABEL_19;
  }
  -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "inputs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_18;
  }
  v40 = objc_msgSend(v4, "isPartialCandidate");

  if (v40)
  {
    -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "inputs");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "inputs");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectAtIndexedSubscript:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "candidateText");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "length"))
    {
      objc_msgSend(v19, "convertedInput");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "length");

      if (v22)
      {
        v23 = 0;
LABEL_45:

        goto LABEL_20;
      }
      objc_msgSend(v7, "committedText");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v26, "mutableCopy");

      objc_msgSend(v7, "syllables");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)objc_msgSend(v27, "mutableCopy");

      if (objc_msgSend(v20, "length")
        && (objc_msgSend(v19, "candidateText"),
            v29 = (void *)objc_claimAutoreleasedReturnValue(),
            v30 = objc_msgSend(v20, "rangeOfString:", v29),
            v29,
            v30))
      {
        objc_msgSend(v19, "candidateText");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringByAppendingString:", v31);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v19, "candidateText");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v32 = objc_msgSend(v23, "length");
      if (v32 >= 1)
      {
        while (objc_msgSend(v20, "length"))
        {
          objc_msgSend(v20, "deleteCharactersInRange:", 0, 1);
          v33 = __OFSUB__(v32--, 1);
          if ((v32 < 0) ^ v33 | (v32 == 0))
            goto LABEL_43;
        }
LABEL_38:
        if (objc_msgSend(v28, "count"))
        {
          objc_msgSend(v28, "firstObject");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = (void *)objc_msgSend(v34, "mutableCopy");

          objc_msgSend(v28, "removeObjectAtIndex:", 0);
          do
          {
            if (!objc_msgSend(v35, "length"))
            {

              goto LABEL_38;
            }
            objc_msgSend(v35, "deleteCharactersInRange:", 0, 1);
            v33 = __OFSUB__(v32--, 1);
          }
          while (!((v32 < 0) ^ v33 | (v32 == 0)));
          if (objc_msgSend(v35, "length"))
            objc_msgSend(v28, "insertObject:atIndex:", v35, 0);

        }
      }
LABEL_43:
      objc_msgSend(v7, "syntheticInputWithCommittedText:syllables:", v20, v28);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "removeComposingInput");

      -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "removeComposingInput");

      -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "composeNew:", v36);

    }
    else
    {
      v23 = 0;
    }

    goto LABEL_45;
  }
LABEL_12:
  v23 = 0;
LABEL_21:

  return v23;
}

- (void)clearInput
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[TIKeyboardInputManagerMecabra geometryDataArray](self, "geometryDataArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  if (-[TIKeyboardInputManager isTypologyEnabled](self, "isTypologyEnabled"))
  {
    -[TIKeyboardInputManagerMecabra touchDataArray](self, "touchDataArray");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeAllObjects");

  }
  if (!-[TIKeyboardInputManagerMecabra preservesComposingInput](self, "preservesComposingInput"))
  {
    -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeAllInputs");

  }
  v6.receiver = self;
  v6.super_class = (Class)TIKeyboardInputManagerMecabra;
  -[TIKeyboardInputManager_mul clearInput](&v6, sel_clearInput);
}

- (void)dropInputPrefix:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  LODWORD(v3) = a3;
  v8.receiver = self;
  v8.super_class = (Class)TIKeyboardInputManagerMecabra;
  -[TIKeyboardInputManager dropInputPrefix:](&v8, sel_dropInputPrefix_);
  -[TIKeyboardInputManagerMecabra geometryDataArray](self, "geometryDataArray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") <= (unint64_t)v3)
  {
    -[TIKeyboardInputManagerMecabra geometryDataArray](self, "geometryDataArray");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v6, "count");

  }
  else
  {
    v3 = v3;
  }

  -[TIKeyboardInputManagerMecabra geometryDataArray](self, "geometryDataArray");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectsInRange:", 0, v3);

}

- (BOOL)needsTouchEvents
{
  return 0;
}

- (RefPtr<TI::Favonius::KeyboardLayout>)characterKeysLayoutFrom:(const void *)a3
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t *v7;
  uint64_t *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[2];
  void (*v13)(uint64_t, uint64_t *);
  void *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  _QWORD *(*v19)(_QWORD *, _QWORD *);
  _QWORD *(*v20)(uint64_t);
  const char *v21;
  _QWORD v22[3];

  v4 = v3;
  v5 = *(_QWORD *)a3;
  if (*(_QWORD *)a3)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x4812000000;
    v19 = __Block_byref_object_copy__1746;
    v20 = __Block_byref_object_dispose__1747;
    v21 = "";
    memset(v22, 0, sizeof(v22));
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v13 = __57__TIKeyboardInputManagerMecabra_characterKeysLayoutFrom___block_invoke;
    v14 = &unk_1EA102658;
    v15 = &v16;
    v7 = *(uint64_t **)(v5 + 8);
    v8 = *(uint64_t **)(v5 + 16);
    v9 = v22;
    if (v7 != v8)
    {
      do
        v13((uint64_t)v12, v7++);
      while (v7 != v8);
      v9 = v17 + 6;
    }
    v10 = operator new();
    v11 = TI::Favonius::KeyboardLayout::KeyboardLayout(v10, v9);
    KB::String::operator=((KB::String *)(v11 + 208), (KB::String *)(*(_QWORD *)a3 + 208));
    _Block_object_dispose(&v16, 8);
    self = (TIKeyboardInputManagerMecabra *)WTF::Vector<WTF::RefPtr<TI::Favonius::LayoutKey>,0ul>::~Vector(v22);
  }
  else
  {
    v10 = 0;
  }
  *v4 = v10;
  return (RefPtr<TI::Favonius::KeyboardLayout>)self;
}

- (RefPtr<TI::Favonius::KeyboardLayout>)baseCharacterKeysLayout
{
  unsigned int **v2;
  unsigned int **v4;
  RefPtr<TI::Favonius::KeyboardLayout> v5;
  unsigned int *m_ptr;
  void *v7;
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  KeyboardLayout *v11;
  unsigned int v12;
  uint64_t v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  _QWORD *(*v18)(_QWORD *, _QWORD *);
  _QWORD *(*v19)(uint64_t);
  const char *v20;
  _QWORD v21[3];

  v4 = v2;
  v5.m_ptr = (KeyboardLayout *)-[TIKeyboardInputManagerMecabra shouldRescaleTouchPoints](self, "shouldRescaleTouchPoints");
  m_ptr = (unsigned int *)self->_currentCharacterKeysLayout.m_ptr;
  if (m_ptr)
  {
    *v4 = m_ptr;
    do
LABEL_8:
      v12 = __ldaxr(m_ptr);
    while (__stlxr(v12 + 1, m_ptr));
    return v5;
  }
  v15 = 0;
  v16 = &v15;
  v17 = 0x4812000000;
  v18 = __Block_byref_object_copy__1746;
  v19 = __Block_byref_object_dispose__1747;
  v20 = "";
  memset(v21, 0, sizeof(v21));
  -[TIKeyboardInputManagerMecabra wordSearch](self, "wordSearch");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "baseLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __56__TIKeyboardInputManagerMecabra_baseCharacterKeysLayout__block_invoke;
  v14[3] = &unk_1EA0FADB8;
  v14[4] = &v15;
  objc_msgSend(v8, "enumerateKeysUsingBlock:", v14);

  v9 = v16 + 6;
  v10 = operator new();
  TI::Favonius::KeyboardLayout::KeyboardLayout(v10, v9);
  v11 = self->_currentCharacterKeysLayout.m_ptr;
  self->_currentCharacterKeysLayout.m_ptr = (KeyboardLayout *)v10;
  if (v11)
  {
    WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref((uint64_t)v11);
    v10 = (uint64_t)self->_currentCharacterKeysLayout.m_ptr;
  }
  -[TIKeyboardInputManagerMecabra currentCharacterKeysLayout](self, "currentCharacterKeysLayout");
  KB::String::operator=((KB::String *)(v10 + 208), (KB::String *)(v13 + 208));
  if (v13)
    WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(v13);
  _Block_object_dispose(&v15, 8);
  v5.m_ptr = (KeyboardLayout *)WTF::Vector<WTF::RefPtr<TI::Favonius::LayoutKey>,0ul>::~Vector(v21);
  m_ptr = (unsigned int *)self->_currentCharacterKeysLayout.m_ptr;
  *v4 = m_ptr;
  if (m_ptr)
    goto LABEL_8;
  return v5;
}

- (CGRect)baseCharacterKeysLayoutFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double *v10;
  CGRect result;

  -[TIKeyboardInputManagerMecabra baseCharacterKeysLayout](self, "baseCharacterKeysLayout");
  v2 = v10[15];
  v3 = v10[16];
  v4 = v10[17];
  v5 = v10[18];
  WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref((uint64_t)v10);
  v6 = v2;
  v7 = v3;
  v8 = v4;
  v9 = v5;
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (RefPtr<TI::Favonius::KeyboardLayout>)currentCharacterKeysLayout
{
  unsigned int **v2;
  unsigned int **v4;
  id *v5;
  unsigned int *v6;
  unsigned int v7;
  id compositionCompletionHandler;
  TIKeyboardInputManagerMecabra *v9;
  TIKeyboardInputManagerMecabra *chainedKeyboardInputManager;
  unsigned int *v11;
  unsigned int v12;
  id *v13;
  TIKeyboardInputManagerMecabra *v14;

  v4 = v2;
  v5 = (id *)TIInputManager::favonius_layout((TIInputManager *)self->super.super.m_impl);
  if (self->_compositionCompletionHandler != *v5)
  {
    v6 = (unsigned int *)*TIInputManager::favonius_layout((TIInputManager *)self->super.super.m_impl);
    if (v6)
    {
      do
        v7 = __ldaxr(v6);
      while (__stlxr(v7 + 1, v6));
    }
    compositionCompletionHandler = self->_compositionCompletionHandler;
    self->_compositionCompletionHandler = v6;
    if (compositionCompletionHandler)
      WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref((uint64_t)compositionCompletionHandler);
    -[TIKeyboardInputManagerMecabra currentLayout](self, "currentLayout");
    -[TIKeyboardInputManagerMecabra characterKeysLayoutFrom:](self, "characterKeysLayoutFrom:", &v13);
    v9 = v14;
    v14 = 0;
    chainedKeyboardInputManager = self->chainedKeyboardInputManager;
    self->chainedKeyboardInputManager = v9;
    if (chainedKeyboardInputManager)
    {
      WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref((uint64_t)chainedKeyboardInputManager);
      if (v14)
        WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref((uint64_t)v14);
    }
    v5 = v13;
    if (v13)
      v5 = (id *)WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref((uint64_t)v13);
  }
  v11 = (unsigned int *)self->chainedKeyboardInputManager;
  *v4 = v11;
  if (v11)
  {
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 + 1, v11));
  }
  return (RefPtr<TI::Favonius::KeyboardLayout>)v5;
}

- (CGRect)currentCharacterKeysLayoutFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double *v10;
  CGRect result;

  -[TIKeyboardInputManagerMecabra currentCharacterKeysLayout](self, "currentCharacterKeysLayout");
  v2 = v10[15];
  v3 = v10[16];
  v4 = v10[17];
  v5 = v10[18];
  WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref((uint64_t)v10);
  v6 = v2;
  v7 = v3;
  v8 = v4;
  v9 = v5;
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (id)addInput:(id)a3 flags:(unsigned int)a4 point:(CGPoint)a5 firstDelete:(unint64_t *)a6
{
  double y;
  double x;
  uint64_t v9;
  id v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  unint64_t v15;
  MCKeyboardState *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  MCKeyboardState *v25;
  void *v26;
  MCSyntheticInput *v27;
  void *v28;
  MCSyntheticInput *v29;
  MCTypeInput *v30;
  MCTypeInput *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[5];
  id v40;
  MCKeyboardState *v41;
  double v42;
  double v43;
  _QWORD v44[3];
  objc_super v45;
  _QWORD v46[3];

  y = a5.y;
  x = a5.x;
  v9 = *(_QWORD *)&a4;
  v46[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v45.receiver = self;
  v45.super_class = (Class)TIKeyboardInputManagerMecabra;
  -[TIKeyboardInputManager addInput:flags:point:firstDelete:](&v45, sel_addInput_flags_point_firstDelete_, v11, v9, a6, x, y);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[TIKeyboardInputManagerMecabra usesComposingInput](self, "usesComposingInput"))
  {
    v13 = (_QWORD *)(*(uint64_t (**)(_QWORD, _QWORD))(**((_QWORD **)self->super.super.m_impl + 23) + 240))(*((_QWORD *)self->super.super.m_impl + 23), (*((_DWORD *)self->super.super.m_impl + 24) - 1));
    v14 = objc_msgSend((id)objc_opt_class(), "maxNearbyKeysCountDefault");
    v15 = v14 << -[TIKeyboardInputManager_mul isUsingMultilingual](self, "isUsingMultilingual");
    v37 = v12;
    v38 = v11;
    if (v13)
      WTF::Vector<WTF::RefPtr<TI::Favonius::KeyMatch>,0ul>::Vector(v44, v13);
    else
      memset(v44, 0, sizeof(v44));
    asMCNearbyKeys(v44, v15);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    WTF::Vector<WTF::RefPtr<TI::Favonius::KeyMatch>,0ul>::~Vector(v44);
    v16 = [MCKeyboardState alloc];
    -[TIKeyboardInputManager keyboardState](self, "keyboardState");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "layoutState");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "userInterfaceIdiom");
    -[TIKeyboardInputManager keyboardState](self, "keyboardState");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "splitKeyboardMode");
    -[TIKeyboardInputManager keyboardState](self, "keyboardState");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "floatingKeyboardMode");
    -[TIKeyboardInputManager keyboardState](self, "keyboardState");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[MCKeyboardState initWithUserInterfaceIdiom:isSplitKeyboard:isFloatingKeyboard:isHardwareKeyboard:](v16, "initWithUserInterfaceIdiom:isSplitKeyboard:isFloatingKeyboard:isHardwareKeyboard:", v19, v21, v23, objc_msgSend(v24, "hardwareKeyboardMode"));

    v11 = v38;
    -[TIKeyboardInputManager_mul externalStringToInternal:](self, "externalStringToInternal:", v38);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v38, "isEqualToString:", CFSTR("^_^")) & 1) != 0
      || objc_msgSend(v26, "isEqualToString:", CFSTR("^_^")))
    {
      v27 = [MCSyntheticInput alloc];
      v46[0] = CFSTR("^_^");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[MCSyntheticInput initWithCommittedText:syllables:](v27, "initWithCommittedText:syllables:", &stru_1EA1081D0, v28);

      v30 = [MCTypeInput alloc];
      v31 = -[MCTypeInput initWithCharacters:nearbyKeys:](v30, "initWithCharacters:nearbyKeys:", CFSTR("☻"), MEMORY[0x1E0C9AA60]);
      -[MCKeyboardInput composeNew:](v29, "composeNew:", v31);
      -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "composeNew:", v29);

      v33 = v36;
    }
    else
    {
      v34 = objc_msgSend(v26, "length");
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __66__TIKeyboardInputManagerMecabra_addInput_flags_point_firstDelete___block_invoke;
      v39[3] = &unk_1EA0FADE0;
      v42 = x;
      v43 = y;
      v39[4] = self;
      v33 = v36;
      v40 = v36;
      v41 = v25;
      objc_msgSend(v26, "enumerateSubstringsInRange:options:usingBlock:", 0, v34, 2, v39);

    }
    -[TIKeyboardInputManagerMecabra setShouldClearBeforeContinuousPath:](self, "setShouldClearBeforeContinuousPath:", 1, v36);
    -[TIKeyboardInputManagerMecabra setPreviouslyDeletedTypeInput:](self, "setPreviouslyDeletedTypeInput:", 0);
    -[TIKeyboardInputManagerMecabra setPreviouslyProcessedDeleteInput:](self, "setPreviouslyProcessedDeleteInput:", 0);

    v12 = v37;
  }

  return v12;
}

- (int64_t)addTouch:(id)a3 shouldHitTest:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  MCDrawInput *v11;
  int v12;
  MCDrawInput *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  CGFloat *v18;
  void *v19;
  _BOOL4 is_far_away_point;
  _BOOL4 v21;
  CGFloat *v22;
  CGFloat *v23;
  CGFloat *v24;
  void *v25;
  void *v26;
  char isKindOfClass;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_super v36;
  uint64_t v37;
  uint64_t v38;
  CGPoint v39;
  CGPoint v40;
  CGPoint v41;
  CGPoint v42;

  v4 = a4;
  v6 = a3;
  if (self->super.super.m_impl)
  {
    if (-[TIKeyboardInputManager isTypologyEnabled](self, "isTypologyEnabled")
      || -[TIKeyboardInputManagerMecabra needsTouchEvents](self, "needsTouchEvents"))
    {
      if (!objc_msgSend(v6, "stage"))
      {
        -[TIKeyboardInputManagerMecabra touchDownEvents](self, "touchDownEvents");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
      if (objc_msgSend(v6, "stage") == 2)
      {
        -[TIKeyboardInputManagerMecabra touchUpEvents](self, "touchUpEvents");
        v7 = objc_claimAutoreleasedReturnValue();
LABEL_9:
        v9 = (void *)v7;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "pathIndex"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKey:", v6, v10);

      }
    }
    if (!-[TIKeyboardInputManagerMecabra usesComposingInput](self, "usesComposingInput")
      || objc_msgSend(v6, "stage") != 1 && objc_msgSend(v6, "stage") != 2)
    {
LABEL_49:
      v36.receiver = self;
      v36.super_class = (Class)TIKeyboardInputManagerMecabra;
      v8 = -[TIKeyboardInputManager addTouch:shouldHitTest:](&v36, sel_addTouch_shouldHitTest_, v6, v4);
      goto LABEL_50;
    }
    -[TIKeyboardInputManager previousTouchEvent](self, "previousTouchEvent");
    v11 = (MCDrawInput *)objc_claimAutoreleasedReturnValue();
    if (!-[MCDrawInput stage](v11, "stage"))
    {
      v12 = objc_msgSend(v6, "stage");

      if (v12 != 1)
        goto LABEL_24;
      v13 = [MCDrawInput alloc];
      -[TIKeyboardInputManagerMecabra currentCharacterKeysLayout](self, "currentCharacterKeysLayout");
      if (-[TIKeyboardInputManagerMecabra shouldRescaleTouchPoints](self, "shouldRescaleTouchPoints"))
        -[TIKeyboardInputManagerMecabra baseCharacterKeysLayout](self, "baseCharacterKeysLayout");
      else
        v37 = 0;
      v11 = -[MCDrawInput initWithKeyboardLayout:rescaleKeyboardLayout:shouldResample:](v13, "initWithKeyboardLayout:rescaleKeyboardLayout:shouldResample:", &v38, &v37, -[TIKeyboardInputManagerMecabra shouldResample](self, "shouldResample"));
      if (v37)
        WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(v37);
      if (v38)
        WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(v38);
      -[TIKeyboardInputManager previousTouchEvent](self, "previousTouchEvent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCDrawInput composeWith:](v11, "composeWith:", v14);

      -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "composeNew:", v11);

      -[TIKeyboardInputManagerMecabra setPreviouslyDeletedTypeInput:](self, "setPreviouslyDeletedTypeInput:", 0);
      -[TIKeyboardInputManagerMecabra setPreviouslyProcessedDeleteInput:](self, "setPreviouslyProcessedDeleteInput:", 0);
    }

LABEL_24:
    -[TIKeyboardInputManager previousTouchEvent](self, "previousTouchEvent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "stage") == 1)
    {
      v17 = objc_msgSend(v6, "stage");

      if (v17 != 1)
      {
        v21 = 0;
        is_far_away_point = 0;
LABEL_35:
        -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "composingInput");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "composingInput");
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v29, "isDrawing"))
          {
            if (objc_msgSend(v6, "stage") == 2
              && objc_msgSend(v6, "continuousPathState") != 5)
            {
              -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "removeComposingInput");

            }
            else if (is_far_away_point)
            {
              -[TIKeyboardInputManagerMecabra setCancelledDrawInput:](self, "setCancelledDrawInput:", v29);
              -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "removeComposingInput");

              -[TIKeyboardInputManagerMecabra updateComposedText](self, "updateComposedText");
              -[TIKeyboardInputManager setMarkedText](self, "setMarkedText");
            }
            else
            {
              objc_msgSend(v29, "composeWith:", v6);
            }
          }

        }
        if (v21)
        {
          -[TIKeyboardInputManagerMecabra cancelledDrawInput](self, "cancelledDrawInput");
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          if (v32)
          {
            -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            -[TIKeyboardInputManagerMecabra cancelledDrawInput](self, "cancelledDrawInput");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "composeNew:", v34);

            -[TIKeyboardInputManagerMecabra setCancelledDrawInput:](self, "setCancelledDrawInput:", 0);
          }
        }
        if (objc_msgSend(v6, "stage") == 2)
          -[TIKeyboardInputManagerMecabra setCancelledDrawInput:](self, "setCancelledDrawInput:", 0);
        goto LABEL_49;
      }
      v18 = (CGFloat *)*TIInputManager::favonius_layout((TIInputManager *)self->super.super.m_impl);
      -[TIKeyboardInputManager previousTouchEvent](self, "previousTouchEvent");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "location");
      if (TI::Favonius::KeyboardLayout::is_far_away_point(v18, v39))
      {
        is_far_away_point = 0;
      }
      else
      {
        v22 = (CGFloat *)*TIInputManager::favonius_layout((TIInputManager *)self->super.super.m_impl);
        objc_msgSend(v6, "location");
        is_far_away_point = TI::Favonius::KeyboardLayout::is_far_away_point(v22, v40);
      }

      v23 = (CGFloat *)*TIInputManager::favonius_layout((TIInputManager *)self->super.super.m_impl);
      -[TIKeyboardInputManager previousTouchEvent](self, "previousTouchEvent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "location");
      if (TI::Favonius::KeyboardLayout::is_far_away_point(v23, v41))
      {
        v24 = (CGFloat *)*TIInputManager::favonius_layout((TIInputManager *)self->super.super.m_impl);
        objc_msgSend(v6, "location");
        v21 = !TI::Favonius::KeyboardLayout::is_far_away_point(v24, v42);
      }
      else
      {
        v21 = 0;
      }
    }
    else
    {
      v21 = 0;
      is_far_away_point = 0;
    }

    goto LABEL_35;
  }
  v8 = 0;
LABEL_50:

  return (int64_t)v8;
}

- (id)touchDataForPathIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v29[7];

  v29[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerMecabra touchDownEvents](self, "touchDownEvents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIKeyboardInputManagerMecabra touchUpEvents](self, "touchUpEvents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v10 = *MEMORY[0x1E0C9D538];
    v12 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v14 = 0.0;
    if (v8)
      goto LABEL_3;
LABEL_5:
    v16 = *MEMORY[0x1E0C9D538];
    v18 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v20 = 0.0;
    goto LABEL_6;
  }
  objc_msgSend(v6, "location");
  v10 = v9;
  v12 = v11;
  objc_msgSend(v6, "timestamp");
  v14 = v13;
  if (!v8)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v8, "location");
  v16 = v15;
  v18 = v17;
  objc_msgSend(v8, "timestamp");
  v20 = v19;
LABEL_6:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v21;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v22;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v23;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v24;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v18);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v29[4] = v25;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v20);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v29[5] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 6);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (void)saveTouchDataForEvent:(id)a3 atIndex:(unint64_t)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;

  v16 = a3;
  objc_msgSend(v16, "touchEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_5;
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "hardwareKeyboardMode") & 1) != 0 || objc_msgSend(v16, "isPopupVariant"))
  {

LABEL_5:
    objc_msgSend((id)objc_opt_class(), "dummyTouchData");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v15 = objc_msgSend(v16, "isGesture");

  if (v15)
    goto LABEL_5;
  -[TIKeyboardInputManagerMecabra touchDataForPathIndex:](self, "touchDataForPathIndex:", objc_msgSend(v6, "pathIndex"));
  v8 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v9 = (void *)v8;
  if ((objc_msgSend(v16, "isMultitap") & 1) != 0)
  {
    v10 = &unk_1EA140288;
  }
  else
  {
    if (!objc_msgSend(v16, "isFlick"))
      goto LABEL_11;
    v10 = &unk_1EA1402A0;
  }
  objc_msgSend(v9, "arrayByAddingObject:", v10);
  v11 = objc_claimAutoreleasedReturnValue();

  v9 = (void *)v11;
LABEL_11:
  -[TIKeyboardInputManagerMecabra touchDataArray](self, "touchDataArray");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerMecabra touchDataArray](self, "touchDataArray");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count") <= a4)
  {
    -[TIKeyboardInputManagerMecabra touchDataArray](self, "touchDataArray");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "insertObject:atIndex:", v9, objc_msgSend(v14, "count"));

  }
  else
  {
    objc_msgSend(v12, "insertObject:atIndex:", v9, a4);
  }

}

- (void)logInputString
{
  __CFString *v3;
  void *v4;
  uint64_t v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  TIKeyboardInputManagerMecabra *v26;
  _QWORD *v27;
  _QWORD v28[4];

  -[TIKeyboardInputManager rawInputString](self, "rawInputString");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = -[__CFString length](v3, "length");
  v6 = CFSTR("(none)");
  if (v5)
    v6 = v3;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Input String: %@\n"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager logToTypologyRecorderWithString:](self, "logToTypologyRecorderWithString:", v7);

  v8 = (void *)MEMORY[0x1E0CB3940];
  -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "shortDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("Keyboard Input: %@\n"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager logToTypologyRecorderWithString:](self, "logToTypologyRecorderWithString:", v11);

  -[TIKeyboardInputManagerMecabra geometryDataArray](self, "geometryDataArray");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerMecabra touchDataArray](self, "touchDataArray");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v28[3] = 0;
  v14 = -[__CFString length](v3, "length");
  v23[0] = MEMORY[0x1E0C809B0];
  if (v14 >= 0x14)
    v15 = 20;
  else
    v15 = v14;
  if (v14 <= 0x14)
    v16 = 0;
  else
    v16 = v14 - 20;
  v23[1] = 3221225472;
  v23[2] = __47__TIKeyboardInputManagerMecabra_logInputString__block_invoke;
  v23[3] = &unk_1EA0FAE08;
  v24 = v13;
  v25 = v12;
  v26 = self;
  v27 = v28;
  v17 = v12;
  v18 = v13;
  -[__CFString enumerateSubstringsInRange:options:usingBlock:](v3, "enumerateSubstringsInRange:options:usingBlock:", v16, v15, 2, v23);
  v19 = (void *)MEMORY[0x1E0CB3940];
  -[TIKeyboardInputManagerBase inputMode](self, "inputMode");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "normalizedIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("Keyboard: %@\n"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager logToTypologyRecorderWithString:](self, "logToTypologyRecorderWithString:", v22);

  -[TIKeyboardInputManagerMecabra logDocumentContext](self, "logDocumentContext");
  -[TIKeyboardInputManagerMecabra logAllCandidates](self, "logAllCandidates");

  _Block_object_dispose(v28, 8);
}

- (void)logDocumentContext
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "documentState");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v10, "contextBeforeInput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Context Before Input: %@\n"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager logToTypologyRecorderWithString:](self, "logToTypologyRecorderWithString:", v6);

  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v10, "contextAfterInput");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("Context After Input: %@\n"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager logToTypologyRecorderWithString:](self, "logToTypologyRecorderWithString:", v9);

}

- (void)logAllCandidates
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  TIKeyboardInputManagerMecabra *v25;
  void *v26;
  void *v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  -[TIKeyboardInputManagerMecabra wordSearchCandidateResultSet](self, "wordSearchCandidateResultSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "candidates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    v25 = self;
    -[TIKeyboardInputManager inputString](self, "inputString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v26 = v4;
    obj = v4;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    v27 = v6;
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v30 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(v11, "input");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "length"))
          {
            objc_msgSend(v11, "input");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v13, "isEqualToString:", v5) & 1) != 0)
            {
              objc_msgSend(v11, "candidate");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v15 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(v11, "input");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "candidate");
              v17 = v5;
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = v15;
              v6 = v27;
              objc_msgSend(v19, "stringWithFormat:", CFSTR("%@ -> %@"), v16, v18);
              v14 = (void *)objc_claimAutoreleasedReturnValue();

              v5 = v17;
            }

          }
          else
          {
            objc_msgSend(v11, "candidate");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
          }

          if (v14)
            objc_msgSend(v6, "addObject:", v14);

        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v8);
    }

    v20 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR("; "));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("All candidates: %@\n\n"), v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v22, "length") >= 0xBB9)
    {
      objc_msgSend(v22, "substringToIndex:", 3000);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringByAppendingString:", CFSTR("..."));
      v24 = objc_claimAutoreleasedReturnValue();

      v22 = (void *)v24;
    }
    -[TIKeyboardInputManager logToTypologyRecorderWithString:](v25, "logToTypologyRecorderWithString:", v22);

    v4 = v26;
  }

}

- (void)logCommittedCandidate:(id)a3 partial:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  const __CFString *v7;
  void *v8;
  id v9;

  v4 = a4;
  objc_msgSend(a3, "candidate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager rawInputString](self, "rawInputString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
  {
    v7 = CFSTR("NO");
    if (v4)
      v7 = CFSTR("YES");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Accepted candidate:%@; partial:%@; input:%@\n\n"),
      v9,
      v7,
      v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager logToTypologyRecorderWithString:](self, "logToTypologyRecorderWithString:", v8);

  }
}

- (void)storeLanguageModelDynamicDataIncludingCache
{
  void *v3;
  uint64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardInputManagerMecabra;
  -[TIKeyboardInputManager storeLanguageModelDynamicDataIncludingCache](&v5, sel_storeLanguageModelDynamicDataIncludingCache);
  -[TIKeyboardInputManager rawInputString](self, "rawInputString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
    -[TIKeyboardInputManagerMecabra logInputString](self, "logInputString");
}

- (void)insertDummyGeometryDataAtIndex:(unint64_t)a3
{
  void *v4;
  id v5;

  -[TIKeyboardInputManagerMecabra geometryDataArray](self, "geometryDataArray");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "dummyGeometryData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertObject:atIndex:", v4, a3);

}

- (void)insertDummyTouchDataAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[TIKeyboardInputManagerMecabra touchDataArray](self, "touchDataArray");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "dummyTouchData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerMecabra touchDataArray](self, "touchDataArray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count") <= a3)
  {
    -[TIKeyboardInputManagerMecabra touchDataArray](self, "touchDataArray");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "insertObject:atIndex:", v5, objc_msgSend(v7, "count"));

  }
  else
  {
    objc_msgSend(v8, "insertObject:atIndex:", v5, a3);
  }

}

- (void)suspend
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  objc_super v7;

  -[TIKeyboardInputManager config](self, "config");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isTesting");

  if ((v4 & 1) == 0)
  {
    -[TIKeyboardInputManagerMecabra wordSearch](self, "wordSearch");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "saveLearningDictionary");

  }
  -[TIKeyboardInputManagerMecabra wordSearch](self, "wordSearch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resetMecabraEnvironment");

  -[TIKeyboardInputManagerMecabra handlePerformBackgroundMaintenanceNotification](self, "handlePerformBackgroundMaintenanceNotification");
  v7.receiver = self;
  v7.super_class = (Class)TIKeyboardInputManagerMecabra;
  -[TIKeyboardInputManager_mul suspend](&v7, sel_suspend);
}

- (void)resume
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)TIKeyboardInputManagerMecabra;
  -[TIKeyboardInputManager_mul resume](&v2, sel_resume);
}

- (id)wordSeparator
{
  return &stru_1EA1081D0;
}

- (unsigned)pathedWordSeparatorChar
{
  return 0;
}

- (id)pathedWordSeparator
{
  __CFString *v3;

  if (-[TIKeyboardInputManagerMecabra pathedWordSeparatorChar](self, "pathedWordSeparatorChar"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "_stringWithUnichar:", -[TIKeyboardInputManagerMecabra pathedWordSeparatorChar](self, "pathedWordSeparatorChar"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_1EA1081D0;
  }
  return v3;
}

- (id)inputsToReject
{
  void *v2;
  uint64_t v3;
  void *v4;

  -[TIKeyboardInputManager rawInputString](self, "rawInputString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  if (v3)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBDB60]), "initWithCharactersInString:", CFSTR("\t"));
  else
    v4 = 0;
  return v4;
}

- (void)handlePerformBackgroundMaintenanceNotification
{
  TIWordSearchOperationPerformMaintenance *v2;
  void *v3;
  TIWordSearchOperationPerformMaintenance *v4;
  id v5;

  -[TIKeyboardInputManagerMecabra wordSearch](self, "wordSearch");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v2 = [TIWordSearchOperationPerformMaintenance alloc];
    objc_msgSend(v5, "mecabraWrapper");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[TIWordSearchOperationPerformMaintenance initWithMecabraWrapper:](v2, "initWithMecabraWrapper:", v3);

    objc_msgSend(v5, "performOperationAsync:withBackgroundActivityAssertion:", v4, 1);
  }

}

- (id)adaptationContextReadingForReanalysisString:(id)a3 fromRecentlyCommittedCandidates:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  unint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  int WordCount;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t WordLengthAtIndex;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  id v53;
  uint64_t WordDictionaryReadingLengthAtIndex;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v53 = a3;
  v5 = a4;
  if (!objc_msgSend(v5, "count"))
  {
    v13 = 0;
    goto LABEL_53;
  }
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v64;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v64 != v10)
          objc_enumerationMutation(v7);
        if (!MecabraCandidateIsUserWordCandidate())
          objc_msgSend(v6, "appendString:", MecabraCandidateGetSurface());
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
    }
    while (v9);
  }

  v12 = objc_msgSend(v6, "rangeOfString:options:", v53, 6);
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v13 = 0;
    goto LABEL_52;
  }
  v44 = v12;
  v45 = v5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v15 = v7;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
  if (!v16)
    goto LABEL_45;
  v17 = v16;
  v18 = *(_QWORD *)v60;
  v48 = v15;
  v49 = v6;
  v47 = *(_QWORD *)v60;
  while (2)
  {
    v19 = 0;
    v50 = v17;
    do
    {
      if (*(_QWORD *)v60 != v18)
        objc_enumerationMutation(v15);
      if (!MecabraCandidateIsUserWordCandidate())
      {
        MecabraCandidateGetAnalysisString();
        v20 = (id)objc_claimAutoreleasedReturnValue();
        if (!v20)
        {
LABEL_42:

          goto LABEL_43;
        }
        v21 = (void *)MecabraCandidateCopySyllableLengthArrayInAnalysisString();
        if (objc_msgSend(v21, "count"))
        {
          v22 = objc_msgSend(v20, "length");
          v55 = 0u;
          v56 = 0u;
          v57 = 0u;
          v58 = 0u;
          v51 = v21;
          v23 = v21;
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
          if (v24)
          {
            v25 = v24;
            v26 = 0;
            v27 = *(_QWORD *)v56;
            do
            {
              v28 = 0;
              v29 = v26;
              do
              {
                if (*(_QWORD *)v56 != v27)
                  objc_enumerationMutation(v23);
                v30 = objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * v28), "unsignedIntegerValue");
                v26 = v30 + v29;
                if (v22 >= v30 + v29)
                {
                  objc_msgSend(v20, "substringWithRange:", v29, v30);
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v14, "addObject:", v31);

                }
                ++v28;
                v29 = v26;
              }
              while (v25 != v28);
              v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
            }
            while (v25);
            v15 = v48;
            v6 = v49;
            v18 = v47;
LABEL_39:
            v17 = v50;
          }
          v21 = v51;
          goto LABEL_41;
        }
        MecabraCandidateGetSurface();
        v23 = (id)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v53, "isEqualToString:", v23))
        {
          v20 = v20;
          v13 = v20;
          v5 = v45;
        }
        else
        {
          WordCount = MecabraCandidateGetWordCount();
          if (!WordCount)
          {
LABEL_41:

            goto LABEL_42;
          }
          v51 = v21;
          v46 = v19;
          v33 = 0;
          v34 = 0;
          v35 = 0;
          v52 = WordCount;
          while (1)
          {
            WordLengthAtIndex = MecabraCandidateGetWordLengthAtIndex();
            objc_msgSend(v23, "substringWithRange:", v35, WordLengthAtIndex);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            WordDictionaryReadingLengthAtIndex = MecabraCandidateGetWordDictionaryReadingLengthAtIndex();
            if (objc_msgSend(v53, "isEqualToString:", v37))
            {
              MecabraCandidateGetDictionaryReading();
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              if (v38)
                break;
            }
            v35 += WordLengthAtIndex;
            v34 += WordDictionaryReadingLengthAtIndex;

            if (v52 == ++v33)
            {
              v15 = v48;
              v6 = v49;
              v19 = v46;
              v18 = v47;
              goto LABEL_39;
            }
          }
          v42 = v38;
          objc_msgSend(v38, "substringWithRange:", v34, WordDictionaryReadingLengthAtIndex);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          v5 = v45;
          v15 = v48;
          v6 = v49;
          v21 = v51;
        }

        goto LABEL_50;
      }
LABEL_43:
      ++v19;
    }
    while (v19 != v17);
    v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
    if (v17)
      continue;
    break;
  }
LABEL_45:

  objc_msgSend(v6, "substringToIndex:", v44);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "_graphemeCount");

  v41 = objc_msgSend(v53, "_graphemeCount");
  if (objc_msgSend(v14, "count") >= (unint64_t)(v41 + v40))
  {
    objc_msgSend(v14, "subarrayWithRange:", v40, v41);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "componentsJoinedByString:", &stru_1EA1081D0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v45;
LABEL_50:

  }
  else
  {
    v13 = 0;
    v5 = v45;
  }

LABEL_52:
LABEL_53:

  return v13;
}

- (BOOL)shouldUpdateLanguageModel
{
  void *v2;
  unsigned __int8 v3;

  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "secureTextEntry") & 1) != 0)
    v3 = 0;
  else
    v3 = TI_DEVICE_UNLOCKED_SINCE_BOOT();

  return v3;
}

- (BOOL)updateLanguageModelForKeyboardState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  uint64_t v18;

  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[TIKeyboardInputManagerMecabra initializedClients](TIKeyboardInputManagerMecabra, "initializedClients");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if ((objc_msgSend(v5, "containsObject:", v4) & 1) == 0)
    {
      -[TIKeyboardInputManagerMecabra wordSearch](self, "wordSearch");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "mecabra");

      if (v8)
      {
        +[TIWordSearch sharedOperationQueue](TIWordSearch, "sharedOperationQueue");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = MEMORY[0x1E0C809B0];
        v14 = 3221225472;
        v15 = __68__TIKeyboardInputManagerMecabra_updateLanguageModelForKeyboardState__block_invoke;
        v16 = &unk_1EA100718;
        v18 = v8;
        v10 = v4;
        v17 = v10;
        +[NSBlockOperation blockOperationWithBlock:](TINoncancellableBlockOperation, "blockOperationWithBlock:", &v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addOperation:", v11, v13, v14, v15, v16);

        objc_msgSend(v6, "addObject:", v10);
      }
    }
  }

  return 1;
}

- (BOOL)supportsPerRecipientLearning
{
  return 0;
}

- (void)setLanguageModelAdaptationContext
{
  void *v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  __CFString *v16;

  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (__CFString *)v4;
  else
    v6 = &stru_1EA1081D0;
  v16 = v6;

  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recipientIdentifier");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (__CFString *)v8;
  else
    v10 = &stru_1EA1081D0;
  v11 = v10;

  -[TIKeyboardInputManagerMecabra currentClientIdentifier](self, "currentClientIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[__CFString isEqualToString:](v16, "isEqualToString:", v12) & 1) != 0)
  {
    -[TIKeyboardInputManagerMecabra currentRecipientIdentifier](self, "currentRecipientIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[__CFString isEqualToString:](v11, "isEqualToString:", v13);

    if ((v14 & 1) != 0)
      goto LABEL_12;
  }
  else
  {

  }
  -[TIKeyboardInputManagerMecabra wordSearch](self, "wordSearch");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setLanguageModelAdaptationContextWithClientIdentifier:recipientIdentifier:", v16, v11);

  -[TIKeyboardInputManagerMecabra setCurrentRecipientIdentifier:](self, "setCurrentRecipientIdentifier:", v11);
  -[TIKeyboardInputManagerMecabra setCurrentClientIdentifier:](self, "setCurrentClientIdentifier:", v16);
LABEL_12:

}

- (int)mecabraTextContentTypeFromTITextContentType:(id)a3
{
  id v3;
  void *v4;
  int v5;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DBE9E8]) & 1) != 0)
    {
      v5 = 1;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DBE9F0]) & 1) != 0)
    {
      v5 = 2;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DBE9C8]) & 1) != 0)
    {
      v5 = 3;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DBE9E0]) & 1) != 0)
    {
      v5 = 4;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DBE9B8]) & 1) != 0)
    {
      v5 = 5;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DBE9F8]) & 1) != 0)
    {
      v5 = 6;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DBEA00]) & 1) != 0)
    {
      v5 = 7;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DBE9D0]) & 1) != 0)
    {
      v5 = 8;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DBEA08]) & 1) != 0)
    {
      v5 = 9;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DBE9D8]) & 1) != 0)
    {
      v5 = 10;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DBE9C0]) & 1) != 0)
    {
      v5 = 11;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DBEA18]) & 1) != 0)
    {
      v5 = 12;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DBEA20]) & 1) != 0)
    {
      v5 = 13;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DBE980]) & 1) != 0)
    {
      v5 = 14;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DBE990]) & 1) != 0)
    {
      v5 = 15;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DBE988]) & 1) != 0)
    {
      v5 = 16;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DBEA28]) & 1) != 0)
    {
      v5 = 17;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DBE9A8]) & 1) != 0)
    {
      v5 = 18;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DBEA10]) & 1) != 0)
    {
      v5 = 19;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DBEA30]) & 1) != 0)
    {
      v5 = 20;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DBE9B0]) & 1) != 0)
    {
      v5 = 21;
    }
    else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DBEA38]))
    {
      v5 = 22;
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)syncToKeyboardState:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;

  v6 = a4;
  v7 = a3;
  -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "syncToKeyboardState:completionHandler:", v7, v6);

  return v9;
}

- (void)syncToKeyboardState:(id)a3 from:(id)a4 afterContextChange:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  objc_super v17;

  v5 = a5;
  v17.receiver = self;
  v17.super_class = (Class)TIKeyboardInputManagerMecabra;
  v8 = a3;
  -[TIKeyboardInputManager syncToKeyboardState:from:afterContextChange:](&v17, sel_syncToKeyboardState_from_afterContextChange_, v8, a4, v5);
  if (-[TIKeyboardInputManagerMecabra supportsPerRecipientLearning](self, "supportsPerRecipientLearning", v17.receiver, v17.super_class))
  {
    -[TIKeyboardInputManagerMecabra setLanguageModelAdaptationContext](self, "setLanguageModelAdaptationContext");
  }
  objc_msgSend(v8, "textInputTraits");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "textContentType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[TIKeyboardInputManagerMecabra mecabraTextContentTypeFromTITextContentType:](self, "mecabraTextContentTypeFromTITextContentType:", v10);

  -[TIKeyboardInputManagerMecabra wordSearch](self, "wordSearch");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMecabraTextContentType:", v11);

  -[TIKeyboardInputManagerMecabra wordSearch](self, "wordSearch");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v8, "isScreenLocked");

  objc_msgSend(v13, "setDisablePersonalData:", v14);
  if (v5)
  {
    -[TIKeyboardInputManagerMecabra updateDocumentContext](self, "updateDocumentContext");
    -[TIKeyboardInputManagerMecabra wordSearch](self, "wordSearch");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "adjustEnvironmentOnAction:", 3);

    -[TIKeyboardInputManagerMecabra setLastCommittedCandidateType:](self, "setLastCommittedCandidateType:", 0);
  }
  if (!-[TIKeyboardInputManagerMecabra usesComposingInput](self, "usesComposingInput"))
  {
    -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeAllInputs");

  }
}

- (void)syncMarkedTextForKeyboardState:(id)a3 afterContextChange:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  objc_super v8;

  v4 = a4;
  v6 = a3;
  -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8.receiver = self;
    v8.super_class = (Class)TIKeyboardInputManagerMecabra;
    -[TIKeyboardInputManager syncMarkedTextForKeyboardState:afterContextChange:](&v8, sel_syncMarkedTextForKeyboardState_afterContextChange_, v6, v4);
  }

}

- (void)updateUsageStatisticsForCandidate:(id)a3 isPartial:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v4 = a4;
  objc_msgSend(a3, "input");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    -[TIKeyboardInputManager keyboardState](self, "keyboardState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "inputMode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    TIStatisticGetKeyForCandidateAccepted();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    TIStatisticScalarIncrement();

    if (!-[TIKeyboardInputManagerMecabra hasCommittedPartialCandidate](self, "hasCommittedPartialCandidate"))
    {
      TIStatisticGetKeyForCandidateAccepted();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      TIStatisticScalarIncrement();

      if (v4)
      {
        -[TIKeyboardInputManagerMecabra setHasCommittedPartialCandidate:](self, "setHasCommittedPartialCandidate:", 1);
      }
      else
      {
        TIStatisticGetKeyForCandidateAccepted();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        TIStatisticScalarIncrement();

      }
    }

  }
  if (!v4)
  {
    if (v7)
      v13 = 1;
    else
      v13 = 2;
    -[TIKeyboardInputManagerMecabra setLastCommittedCandidateType:](self, "setLastCommittedCandidateType:", v13);
  }
}

- (void)incrementUsageTrackingKeysForDeleteFromInput
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  id *v11;
  id v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)TIKeyboardInputManagerMecabra;
  -[TIKeyboardInputManager incrementUsageTrackingKeysForDeleteFromInput](&v15, sel_incrementUsageTrackingKeysForDeleteFromInput);
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "documentState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "markedText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    if (!-[TIKeyboardInputManagerMecabra hasBackspacedIntoInputString](self, "hasBackspacedIntoInputString"))
    {
      TIStatisticGetKeyForCandidateAccepted();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      TIStatisticScalarIncrement();

      -[TIKeyboardInputManagerMecabra setHasBackspacedIntoInputString:](self, "setHasBackspacedIntoInputString:", 1);
    }
  }
  else
  {
    v10 = -[TIKeyboardInputManagerMecabra lastCommittedCandidateType](self, "lastCommittedCandidateType");
    if (v10 == 1)
    {
      v11 = (id *)MEMORY[0x1E0DBE680];
    }
    else
    {
      if (v10 != 2)
        goto LABEL_10;
      v11 = (id *)MEMORY[0x1E0DBE690];
    }
    v12 = *v11;
    if (v12)
    {
      v13 = v12;
      TIStatisticGetKeyForCandidateAccepted();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      TIStatisticScalarIncrement();

      -[TIKeyboardInputManagerMecabra setLastCommittedCandidateType:](self, "setLastCommittedCandidateType:", 0);
    }
  }
LABEL_10:

}

- (BOOL)whiteSpaceEndsSentence
{
  return 1;
}

- (BOOL)apostropheEndsSentence
{
  return 1;
}

- (BOOL)usesMarkedTextForInput
{
  return 1;
}

- (BOOL)stringContainsActiveSupplementalLexiconSearchPrefix:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  __int16 v12;

  v4 = a3;
  -[TIKeyboardInputManager currentCandidateGenerationContextSupplementalLexicons](self, "currentCandidateGenerationContextSupplementalLexicons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[TIKeyboardInputManager currentCandidateGenerationContextSupplementalLexicons](self, "currentCandidateGenerationContextSupplementalLexicons");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activeLexicon");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v12 = objc_msgSend(v7, "searchPrefixCharacter");
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCharacters:length:", &v12, 1);
      v10 = objc_msgSend(v4, "containsString:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)canTypeAndPathSimultaneously
{
  return 1;
}

- (BOOL)shouldResample
{
  return 0;
}

- (BOOL)shouldRescaleTouchPoints
{
  return 0;
}

- (BOOL)stringEndsWord:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if (-[TIKeyboardInputManagerMecabra stringContainsActiveSupplementalLexiconSearchPrefix:](self, "stringContainsActiveSupplementalLexiconSearchPrefix:", v4))
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)TIKeyboardInputManagerMecabra;
    v5 = -[TIKeyboardInputManager stringEndsWord:](&v7, sel_stringEndsWord_, v4);
  }

  return v5;
}

- (id)handleKeyboardInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  objc_super v21;

  v4 = a3;
  -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleKeyboardInput:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    goto LABEL_23;
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "documentState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "markedText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "string");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "length") && objc_msgSend(v10, "length"))
  {
    v12 = objc_msgSend(v10, "characterAtIndex:", 0);
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v13, "characterIsMember:", v12)
      || !-[TIKeyboardInputManagerMecabra whiteSpaceEndsSentence](self, "whiteSpaceEndsSentence"))
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v14, "characterIsMember:", v12))
      {
        objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v16, "characterIsMember:", v12) & 1) != 0)
        {
          v17 = -[TIKeyboardInputManagerMecabra apostropheEndsSentence](self, "apostropheEndsSentence");

          if (v17 || (_DWORD)v12 != 39)
            goto LABEL_10;
        }
        else
        {

        }
        if (-[TIKeyboardInputManagerMecabra usesMarkedTextForInput](self, "usesMarkedTextForInput"))
        {
          -[TIKeyboardInputManagerMecabra updateDocumentContext](self, "updateDocumentContext");
          -[TIKeyboardInputManagerMecabra wordSearch](self, "wordSearch");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "adjustEnvironmentOnAction:", 1);

          -[TIKeyboardInputManagerMecabra setHasCommittedPartialCandidate:](self, "setHasCommittedPartialCandidate:", 0);
          -[TIKeyboardInputManagerMecabra setHasBackspacedIntoInputString:](self, "setHasBackspacedIntoInputString:", 0);
        }
        v11 = 0;
        goto LABEL_19;
      }

    }
LABEL_10:
    -[TIKeyboardInputManagerMecabra wordSearch](self, "wordSearch");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "declareEndOfSentence");

    v11 = 1;
LABEL_19:
    -[TIKeyboardInputManagerMecabra setLastCommittedCandidateType:](self, "setLastCommittedCandidateType:", 0);
    goto LABEL_20;
  }
  v11 = 0;
LABEL_20:
  v21.receiver = self;
  v21.super_class = (Class)TIKeyboardInputManagerMecabra;
  -[TIKeyboardInputManager_mul handleKeyboardInput:](&v21, sel_handleKeyboardInput_, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[TIKeyboardInputManagerMecabra wordSearch](self, "wordSearch");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "clearLeftDocumentContext");

  }
LABEL_23:

  return v6;
}

- (void)updateDocumentContext
{
  void *v3;
  __CFString *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  id v8;

  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "documentState");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "contextBeforeInput");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contextAfterInput");
    v5 = objc_claimAutoreleasedReturnValue();
    if (!v4)
      v4 = &stru_1EA1081D0;
    if (v5)
      v6 = (__CFString *)v5;
    else
      v6 = &stru_1EA1081D0;
    -[TIKeyboardInputManagerMecabra wordSearch](self, "wordSearch");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLeftDocumentContext:rightDocumentContext:", v4, v6);

  }
}

- (void)deleteFromInputWithContext:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TIKeyboardInputManagerMecabra;
  -[TIKeyboardInputManager deleteFromInputWithContext:](&v10, sel_deleteFromInputWithContext_, a3);
  v7 = -[TIKeyboardInputManagerMecabra usesMarkedTextForInput](self, "usesMarkedTextForInput");
  if (v7)
  {
    -[TIKeyboardInputManager keyboardState](self, "keyboardState");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "documentState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "markedText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v5, "length"))
    {

LABEL_11:
      -[TIKeyboardInputManagerMecabra updateDocumentContext](self, "updateDocumentContext");
      -[TIKeyboardInputManagerMecabra wordSearch](self, "wordSearch");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "adjustEnvironmentOnAction:", 2);
      goto LABEL_12;
    }
    if (-[TIKeyboardInputManagerMecabra usesMarkedTextForInput](self, "usesMarkedTextForInput"))
    {

LABEL_12:
      return;
    }
  }
  else if (-[TIKeyboardInputManagerMecabra usesMarkedTextForInput](self, "usesMarkedTextForInput"))
  {
    return;
  }
  -[TIKeyboardInputManager inputString](self, "inputString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v7)
  {

  }
  if (!v9)
    goto LABEL_11;
}

- (id)candidateResultSetFromWordSearchCandidateResultSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  objc_msgSend(v4, "candidates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "proactiveCandidates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    objc_msgSend(v4, "proactiveCandidates");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "candidates");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v10;
  }
  objc_msgSend(v4, "proactiveTriggers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager candidateResultSetFromCandidates:proactiveTriggers:](self, "candidateResultSetFromCandidates:proactiveTriggers:", v5, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "disambiguationCandidates");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDisambiguationCandidates:", v13);

  objc_msgSend(v12, "setSelectedDisambiguationCandidateIndex:", objc_msgSend(v4, "selectedDisambiguationCandidateIndex"));
  return v12;
}

- (void)mecabraCandidateRefFromCandidate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  objc_msgSend(v4, "proactiveTrigger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v11 = 0;
      goto LABEL_11;
    }
    -[TIKeyboardInputManagerMecabra wordSearchCandidateResultSet](self, "wordSearchCandidateResultSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "candidateRefsDictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mecabraCandidatePointerValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v12, "objectForKey:", v13);

    goto LABEL_7;
  }
  objc_msgSend(v4, "proactiveTrigger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0DBEB18]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v11 = 0;
    goto LABEL_9;
  }
  -[TIKeyboardInputManagerMecabra wordSearchCandidateResultSet](self, "wordSearchCandidateResultSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "candidateRefsDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "objectForKey:", v8);

  if (v11)
  {
    objc_msgSend(v4, "candidate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    MecabraCandidateSetDisplayString();
LABEL_7:

  }
LABEL_9:

LABEL_11:
  return v11;
}

- (id)segmentsFromCandidate:(id)a3 phraseBoundary:(BOOL)a4
{
  id v5;
  void *v6;
  int WordCount;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t NextPhraseBoundary;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  TIMecabraSegment *v20;
  void *v21;
  TIMecabraSegment *v22;
  id v24;
  uint64_t v25;
  _BOOL4 v26;
  void *v27;
  void *v28;

  v26 = a4;
  v5 = a3;
  if (-[TIKeyboardInputManagerMecabra mecabraCandidateRefFromCandidate:](self, "mecabraCandidateRefFromCandidate:", v5))
  {
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
    objc_msgSend(v5, "input");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v5;
    objc_msgSend(v5, "candidate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    WordCount = MecabraCandidateGetWordCount();
    if (WordCount >= 1)
    {
      v8 = 0;
      v9 = 0;
      v10 = 0;
      v11 = WordCount;
      v25 = WordCount - 1;
      while (1)
      {
        NextPhraseBoundary = v10;
        if (v26)
          NextPhraseBoundary = MecabraCandidateGetNextPhraseBoundary();
        if ((_DWORD)v11 == 1 && NextPhraseBoundary == -1)
          break;
        if (NextPhraseBoundary == -1)
          v13 = v25;
        else
          v13 = NextPhraseBoundary;
        if (v10 <= v13)
        {
          v15 = 0;
          v14 = 0;
          do
          {
            v15 += MecabraCandidateGetWordReadingLengthAtIndex();
            v14 += MecabraCandidateGetWordLengthAtIndex();
            ++v10;
          }
          while (v13 + 1 != v10);
        }
        else
        {
          v14 = 0;
          v15 = 0;
        }
        v16 = v15 + v8;
        if (objc_msgSend(v6, "length") >= (unint64_t)(v15 + v8))
        {
          objc_msgSend(v6, "substringWithRange:", v8, v15);
          v17 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v17 = v6;
        }
        v18 = v17;
        objc_msgSend(v27, "substringWithRange:", v9, v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_alloc_init(TIMecabraSegment);
        -[TIMecabraSegment setReading:](v20, "setReading:", v18);
        -[TIMecabraSegment setSurface:](v20, "setSurface:", v19);
        objc_msgSend(v28, "addObject:", v20);
        v9 += v14;

        v10 = v13 + 1;
        v8 = v16;
        if (v13 + 1 >= v11)
          goto LABEL_22;
      }
      v22 = objc_alloc_init(TIMecabraSegment);
      -[TIMecabraSegment setReading:](v22, "setReading:", v6);
      -[TIMecabraSegment setSurface:](v22, "setSurface:", v27);
      objc_msgSend(v28, "addObject:", v22);

    }
LABEL_22:
    v21 = (void *)objc_msgSend(v28, "copy");

    v5 = v24;
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (pair<NSString)_supplementalItemIdentifiersInCurrentSelection
{
  _QWORD *v2;
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  TIKeyboardInputManagerMecabra *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  BOOL v38;
  void *v40;
  _QWORD *v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;
  pair<NSString *, NSArray<NSNumber *> *> result;

  v4 = v2;
  v57 = *MEMORY[0x1E0C80C00];
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "documentState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectedText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    *v4 = 0;
    v4[1] = 0;
  }
  else
  {
    v11 = self;
    v12 = (void *)objc_opt_new();
    -[TIKeyboardInputManager keyboardState](v11, "keyboardState");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "documentState");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "contextBeforeInput");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v15, "length"))
      objc_msgSend(v12, "appendString:", v15);

    -[TIKeyboardInputManager keyboardState](v11, "keyboardState");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "documentState");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "contextAfterInput");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v18, "length"))
      objc_msgSend(v12, "appendString:", v18);

    if (objc_msgSend(v12, "length"))
    {
      v41 = v4;
      v19 = (void *)objc_opt_new();
      -[TIKeyboardInputManager keyboardState](v11, "keyboardState");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "documentState");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "contextBeforeInput");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "length");

      v43 = *((id *)v11->super.super.m_impl + 17);
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      -[TIKeyboardInputManager currentCandidateGenerationContextSupplementalLexicons](v11, "currentCandidateGenerationContextSupplementalLexicons");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "activeLexicon");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "items");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v44 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
      v27 = 0;
      if (v44)
      {
        v42 = *(_QWORD *)v52;
        v46 = v12;
        do
        {
          v28 = 0;
          do
          {
            if (*(_QWORD *)v52 != v42)
              objc_enumerationMutation(v26);
            v45 = v28;
            v29 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v28);
            objc_msgSend(v29, "core_nonPhoneticRangesInString:options:locale:", v12, 385, v43);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = 0u;
            v48 = 0u;
            v49 = 0u;
            v50 = 0u;
            v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
            if (v31)
            {
              v32 = v31;
              v33 = *(_QWORD *)v48;
              do
              {
                for (i = 0; i != v32; ++i)
                {
                  if (*(_QWORD *)v48 != v33)
                    objc_enumerationMutation(v30);
                  v35 = objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * i), "rangeValue");
                  if (v23 != 0x7FFFFFFFFFFFFFFFLL)
                  {
                    v37 = v35;
                    v38 = v35 == 0x7FFFFFFFFFFFFFFFLL || v35 >= v23;
                    if (!v38 && v35 + v36 >= v23)
                    {
                      if (!v27)
                      {
                        objc_msgSend(v46, "substringWithRange:", v35, v36);
                        v27 = (void *)objc_claimAutoreleasedReturnValue();
                      }
                      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v29, "identifier", v37));
                      v40 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v19, "addObject:", v40);

                    }
                  }
                }
                v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
              }
              while (v32);
            }

            v28 = v45 + 1;
            v12 = v46;
          }
          while (v45 + 1 != v44);
          v44 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
        }
        while (v44);
      }

      if (objc_msgSend(v19, "count"))
      {
        *v41 = v27;
        v41[1] = v19;
      }
      else
      {
        *v41 = 0;
        v41[1] = 0;
      }

    }
    else
    {
      *v4 = 0;
      v4[1] = 0;
    }

  }
  result.var1 = v10;
  result.var0 = v9;
  return result;
}

- (void)addStickers:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(id, id);
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  TIKeyboardInputManagerStickerTask *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  TIKeyboardInputManagerStickerTask *v26;
  _BOOL4 v27;
  void *v28;
  _QWORD v29[4];
  TIKeyboardInputManagerStickerTask *v30;
  id v31;
  id v32;
  void (**v33)(id, id);
  id v34;
  id location;

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  -[TIKeyboardInputManagerMecabra pendingStickerTask](self, "pendingStickerTask");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[TIKeyboardInputManagerMecabra pendingStickerTask](self, "pendingStickerTask");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stickerCompletionHandler");
    v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerMecabra pendingStickerTask](self, "pendingStickerTask");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "candidateResultSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v10)[2](v10, v12);

    -[TIKeyboardInputManagerMecabra setPendingStickerTask:](self, "setPendingStickerTask:", 0);
  }
  objc_msgSend(v6, "candidates");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v13, "count"))
    goto LABEL_9;
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "imageSuggestionEnabled") & 1) == 0)
  {

LABEL_9:
    goto LABEL_10;
  }
  v15 = -[TIKeyboardInputManager shouldOfferStickers](self, "shouldOfferStickers");

  if (!v15)
  {
LABEL_10:
    v7[2](v7, v6);
    goto LABEL_11;
  }
  objc_msgSend(v6, "candidates");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIKeyboardInputManager stickerCandidateGenerator](self, "stickerCandidateGenerator");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "candidate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "generateStickerQueriesForText:tokenize:", v19, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v20, "count"))
  {
    v21 = objc_alloc_init(TIKeyboardInputManagerStickerTask);
    -[TIKeyboardInputManagerStickerTask setCandidateResultSet:](v21, "setCandidateResultSet:", v6);
    -[TIKeyboardInputManagerStickerTask setStickerCompletionHandler:](v21, "setStickerCompletionHandler:", v7);
    -[TIKeyboardInputManagerMecabra setPendingStickerTask:](self, "setPendingStickerTask:", v21);
    objc_initWeak(&location, self);
    -[TIKeyboardInputManager keyboardState](self, "keyboardState");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "secureCandidateRenderTraits");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[TIKeyboardInputManager shouldGeneratePredictionsForCurrentContext](self, "shouldGeneratePredictionsForCurrentContext");
    -[TIKeyboardInputManagerBase inputMode](self, "inputMode");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "languageWithRegion");
    v24 = v17;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __67__TIKeyboardInputManagerMecabra_addStickers_withCompletionHandler___block_invoke;
    v29[3] = &unk_1EA0FAEB0;
    objc_copyWeak(&v34, &location);
    v30 = v21;
    v31 = v24;
    v32 = v6;
    v33 = v7;
    v26 = v21;
    objc_msgSend(v18, "generateStickerCandidatesForSearchableQueries:withRenderTraits:shouldAppend:language:completionHandler:", v20, v22, v27, v25, v29);

    v17 = v24;
    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }
  else
  {
    v7[2](v7, v6);
  }

LABEL_11:
}

- (void)addProactiveTriggers:(id)a3 withCompletionHandler:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void (**v24)(void *, _QWORD);
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  void *v49;
  id v50;
  void (**v51)(void *, _QWORD);
  _QWORD aBlock[4];
  id v53;
  id v54;
  id v55;
  id v56;
  char v57;

  v44 = a3;
  v46 = a4;
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textInputTraits");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textContentType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "textInputTraits");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "textContentType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "documentState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "contextBeforeInput");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[TIProactiveQuickTypeManager proactiveTriggerForTextContentType:withContextBeforeInput:autofillMode:](TIProactiveQuickTypeManager, "proactiveTriggerForTextContentType:withContextBeforeInput:autofillMode:", v11, v14, objc_msgSend(v15, "autofillMode"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "documentState");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "markedText");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v10) = objc_msgSend(v19, "length") != 0;

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__TIKeyboardInputManagerMecabra_addProactiveTriggers_withCompletionHandler___block_invoke;
  aBlock[3] = &unk_1EA0FAED8;
  v20 = v8;
  v53 = v20;
  v21 = v44;
  v54 = v21;
  v22 = v16;
  v55 = v22;
  v57 = (char)v10;
  v23 = v46;
  v56 = v23;
  v24 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "documentState");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = objc_msgSend(v26, "documentIsEmpty");

  if (!(_DWORD)v12)
  {
    v24[2](v24, 0);
    goto LABEL_8;
  }
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "responseContext");
  v28 = objc_claimAutoreleasedReturnValue();
  if (!v28)
  {

    goto LABEL_7;
  }
  v29 = (void *)v28;
  +[TIProactiveQuickTypeManager sharedInstance](TIProactiveQuickTypeManager, "sharedInstance");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "usePQT2Flow");

  if ((v31 & 1) != 0)
  {
LABEL_7:
    v24[2](v24, 1);
    goto LABEL_8;
  }
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "shiftState");

  -[TIKeyboardInputManagerBase inputMode](self, "inputMode");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "languageWithRegion");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "clientIdentifier");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "recipientIdentifier");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "responseContext");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  chineseJapaneseResponseKitBackgroundQueue();
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v37;
  v49 = v39;
  v51 = v24;
  v50 = v21;
  v47 = v45;
  v40 = v39;
  v41 = v37;
  v42 = v35;
  TIDispatchAsync();

LABEL_8:
}

- (void)updateProactiveCandidatesForCandidateResultSet:(id)a3 withInput:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[4];
  NSObject *v23;
  TIKeyboardInputManagerMecabra *v24;
  char v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "proactiveTriggers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {

    goto LABEL_3;
  }
  +[TIProactiveQuickTypeManager sharedInstance](TIProactiveQuickTypeManager, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v19, "usePQT2Flow") & 1) == 0)
  {

    goto LABEL_17;
  }
  v20 = objc_msgSend(v7, "length");

  if (!v20)
  {
LABEL_3:
    -[TIKeyboardInputManager keyboardState](self, "keyboardState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "secureCandidateRenderTraits");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[TIKeyboardInputManager keyboardState](self, "keyboardState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "secureCandidateRenderTraits");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDisableHideMyEmail:", 1);

    objc_msgSend(v8, "singleCellWidth");
    if (v12 > 0.0 && (objc_msgSend(v8, "singleCellHeight"), v13 > 0.0)
      || (objc_msgSend(v8, "cellWidthOptions"), v14 = (void *)objc_claimAutoreleasedReturnValue(),
                                                v14,
                                                v14))
    {
      -[TIKeyboardInputManager candidateHandlerForOpenRequest](self, "candidateHandlerForOpenRequest");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "asynchronous");

      objc_msgSend(v6, "proactiveTriggers");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __90__TIKeyboardInputManagerMecabra_updateProactiveCandidatesForCandidateResultSet_withInput___block_invoke;
      v22[3] = &unk_1EA0FAFA0;
      v25 = v16;
      v23 = v6;
      v24 = self;
      -[TIKeyboardInputManager generateAndRenderProactiveSuggestionsWithTriggers:withAdditionalPredictions:withInput:async:completionHandler:](self, "generateAndRenderProactiveSuggestionsWithTriggers:withAdditionalPredictions:withInput:async:completionHandler:", v17, 0, v7, v16, v22);

      v18 = v23;
    }
    else
    {
      if (TICanLogMessageAtLevel_onceToken != -1)
        dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
      if (TICanLogMessageAtLevel_logLevel < 2)
        goto LABEL_17;
      TIOSLogFacility();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s ProactiveQuickType:TI: Not generating proactive candidates - invalid secure candidate width or height trait"), "-[TIKeyboardInputManagerMecabra updateProactiveCandidatesForCandidateResultSet:withInput:]");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v27 = v21;
        _os_log_debug_impl(&dword_1DA6F2000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }

LABEL_17:
  }

}

- (id)keyboardConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyboardConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)TIKeyboardInputManagerMecabra;
    -[TIKeyboardInputManager_mul keyboardConfiguration](&v9, sel_keyboardConfiguration);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (void)generateAutocorrectionsWithKeyboardState:(id)a3 candidateRange:(_NSRange)a4 candidateHandler:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  void *v11;
  void *v12;
  objc_super v13;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v10 = a5;
  -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "generateAutocorrectionsWithKeyboardState:candidateRange:candidateHandler:", v9, location, length, v10);

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)TIKeyboardInputManagerMecabra;
    -[TIKeyboardInputManager generateAutocorrectionsWithKeyboardState:candidateRange:candidateHandler:](&v13, sel_generateAutocorrectionsWithKeyboardState_candidateRange_candidateHandler_, v9, location, length, v10);
  }

}

- (BOOL)supportsCandidateGeneration
{
  return 1;
}

- (BOOL)alreadyGeneratedCandidates
{
  void *v3;
  char v4;
  void *v5;

  -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "alreadyGeneratedCandidates") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "supportsCandidateGeneration");

  }
  return v4;
}

- (void)generateCandidatesWithKeyboardState:(id)a3 candidateRange:(_NSRange)a4 candidateHandler:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  void *v11;
  objc_super v12;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v10 = a5;
  if (-[TIKeyboardInputManagerMecabra alreadyGeneratedCandidates](self, "alreadyGeneratedCandidates")
    || !-[TIKeyboardInputManagerMecabra supportsCandidateGeneration](self, "supportsCandidateGeneration"))
  {
    -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "generateCandidatesWithKeyboardState:candidateRange:candidateHandler:", v9, location, length, v10);

  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)TIKeyboardInputManagerMecabra;
    -[TIKeyboardInputManager generateCandidatesWithKeyboardState:candidateRange:candidateHandler:](&v12, sel_generateCandidatesWithKeyboardState_candidateRange_candidateHandler_, v9, location, length, v10);
  }

}

- (unint64_t)additionalAnalysisOptions
{
  return 0;
}

- (BOOL)shouldInsertSpaceBeforePredictions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  BOOL v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "documentState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contextBeforeInput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length")
    && (objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "characterIsMember:", (unsigned __int16)objc_msgSend(v5, "_lastLongCharacter")),
        v6,
        (v7 & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "characterIsMember:", (unsigned __int16)objc_msgSend(v5, "_lastLongCharacter"));

    if (!v10)
      goto LABEL_7;
    objc_msgSend(v5, "_lastGrapheme");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager terminatorsPrecedingAutospace](self, "terminatorsPrecedingAutospace");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "characterSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v11, "rangeOfCharacterFromSet:", v13);

    if (v14 == 0x7FFFFFFFFFFFFFFFLL)
      v8 = -[TIKeyboardInputManager stringEndsWithClosingQuote:](self, "stringEndsWithClosingQuote:", v5);
    else
LABEL_7:
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)autocorrectionListWithCandidateCount:(unint64_t)a3
{
  const KB::String *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  uint64_t v17;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  void *v30;
  unsigned int v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  unint64_t v42;
  unint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  char v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  char v72;
  void *v73;
  void *v74;
  __CFString *v75;
  __CFString *v76;
  id v77;
  __CFString *v78;
  __CFString *v79;
  __CFString *v80;
  __CFString *v81;
  id *v82;
  void *v83;
  id v84;
  __CFString *v85;
  __CFString *v86;
  _QWORD v87[4];
  id v88;
  id v89;
  __CFString *v90;
  __CFString *v91;
  __CFString *v92;
  id v93;
  id v94;
  TIKeyboardInputManagerMecabra *v95;
  __CFString *v96;
  uint64_t *v97;
  id v98[2];
  unsigned int v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  uint64_t v104;
  uint64_t *v105;
  uint64_t v106;
  uint64_t (*v107)(uint64_t, uint64_t);
  void (*v108)(uint64_t);
  TIWordSearchCandidateResultSet *v109;
  _BYTE v110[128];
  id location;
  void *v112;
  uint64_t v113;

  v113 = *MEMORY[0x1E0C80C00];
  v104 = 0;
  v105 = &v104;
  v106 = 0x3032000000;
  v107 = __Block_byref_object_copy__217;
  v108 = __Block_byref_object_dispose__218;
  v109 = objc_alloc_init(TIWordSearchCandidateResultSet);
  TIInputManager::input_substring((unsigned __int16 *)self->super.super.m_impl + 4, 0, -858993459 * ((*((_QWORD *)self->super.super.m_impl + 2) - *((_QWORD *)self->super.super.m_impl + 1)) >> 3), (uint64_t)&location);
  KB::ns_string((KB *)&location, v5);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v112 && BYTE6(location) == 1)
    free(v112);
  -[TIKeyboardInputManager inputString](self, "inputString");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[TIKeyboardInputManager shouldGeneratePredictionsForCurrentContext](self, "shouldGeneratePredictionsForCurrentContext")&& !-[TIKeyboardInputManagerMecabra stringContainsActiveSupplementalLexiconSearchPrefix:](self, "stringContainsActiveSupplementalLexiconSearchPrefix:", v6))
  {

    v7 = &stru_1EA1081D0;
    v72 = 1;
    v83 = (void *)MEMORY[0x1E0C9AA60];
    v6 = &stru_1EA1081D0;
  }
  else
  {
    -[TIKeyboardInputManagerMecabra geometryModelData](self, "geometryModelData");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = 0;
  }
  v75 = v7;
  -[TIKeyboardInputManagerMecabra wordSearch](self, "wordSearch");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = v6;
  if ((objc_msgSend(v8, "autoCorrects") & 1) != 0
    || -[TIKeyboardInputManager_mul isUsingMultilingual](self, "isUsingMultilingual"))
  {
    v9 = 64;
  }
  else
  {
    v9 = 0;
  }
  if (objc_msgSend(v8, "shouldLearnAcceptedCandidate"))
    v10 = v9;
  else
    v10 = v9 | 0x80;
  v11 = -[TIKeyboardInputManagerMecabra additionalAnalysisOptions](self, "additionalAnalysisOptions");
  objc_initWeak(&location, self);
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "documentState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "contextBeforeInput");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v16 = (__CFString *)v14;
  else
    v16 = &stru_1EA1081D0;
  v80 = v16;

  objc_msgSend(v13, "contextAfterInput");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v17)
    v19 = (__CFString *)v17;
  else
    v19 = &stru_1EA1081D0;
  v78 = v19;

  -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "composingInput");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v20, "composingInput");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v74 = 0;
  }
  v22 = (void *)(v10 | v11);

  v73 = v13;
  if (!-[TIKeyboardInputManagerMecabra canTypeAndPathSimultaneously](self, "canTypeAndPathSimultaneously"))
  {
    v102 = 0u;
    v103 = 0u;
    v100 = 0u;
    v101 = 0u;
    -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "inputs");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v100, v110, 16);
    if (v25)
    {
      v26 = v25;
      v82 = (id *)a3;
      v27 = *(_QWORD *)v101;
      while (2)
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v101 != v27)
            objc_enumerationMutation(v24);
          v29 = *(_QWORD *)(*((_QWORD *)&v100 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v30 = (void *)objc_opt_new();

            objc_msgSend(v30, "composeNew:", v29);
            v20 = v30;
            goto LABEL_35;
          }
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v100, v110, 16);
        if (v26)
          continue;
        break;
      }
LABEL_35:
      a3 = (unint64_t)v82;
    }

  }
  v31 = -[TIKeyboardInputManagerMecabra pathedWordSeparatorChar](self, "pathedWordSeparatorChar");
  -[TIKeyboardInputManagerMecabra wordSearch](self, "wordSearch");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)MEMORY[0x1E0CB34C8];
  v87[0] = MEMORY[0x1E0C809B0];
  v87[1] = 3221225472;
  v87[2] = __70__TIKeyboardInputManagerMecabra_autocorrectionListWithCandidateCount___block_invoke;
  v87[3] = &unk_1EA0FAFC8;
  v34 = v8;
  v88 = v34;
  objc_copyWeak(v98, &location);
  v84 = v83;
  v89 = v84;
  v86 = v85;
  v90 = v86;
  v81 = v80;
  v91 = v81;
  v79 = v78;
  v92 = v79;
  v77 = v20;
  v93 = v77;
  v98[1] = v22;
  v35 = v74;
  v94 = v35;
  v95 = self;
  v97 = &v104;
  v36 = v75;
  v96 = v36;
  v99 = v31;
  objc_msgSend(v33, "blockOperationWithBlock:", v87);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "performOperationAsync:", v37);

  +[TIWordSearch sharedOperationQueue](TIWordSearch, "sharedOperationQueue");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "waitUntilAllOperationsAreFinished");

  objc_msgSend((id)v105[5], "candidates");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "count");

  if (v40 || !v35)
  {
    -[TIKeyboardInputManagerMecabra setWordSearchCandidateResultSet:](self, "setWordSearchCandidateResultSet:", v105[5]);
    if (!v35)
      goto LABEL_47;
    goto LABEL_45;
  }
  -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "totalDrawSamples");
  v43 = -[TIKeyboardInputManagerMecabra maxDrawSamplesWithNoCandidatesResult](self, "maxDrawSamplesWithNoCandidatesResult");

  if (v42 <= v43)
  {
LABEL_45:
    objc_msgSend((id)v105[5], "candidates");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v53, "count");

    if (v54)
    {
      v76 = v36;
      v55 = v34;
      objc_msgSend((id)v105[5], "candidates");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "objectAtIndexedSubscript:", 0);
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      v58 = (void *)MEMORY[0x1E0CB3940];
      -[TIKeyboardInputManager keyboardState](self, "keyboardState");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "documentState");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "contextBeforeInput");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "candidate");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "stringWithFormat:", CFSTR("%@ %@"), v61, v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();

      -[TIKeyboardInputManager emojiCandidateGenerator](self, "emojiCandidateGenerator");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "emojiReplacementCandidatesForText:", v63);
      v65 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_51:
      v50 = v73;

      -[TIKeyboardInputManagerMecabra autocorrectionListFromWordSearchCandidateResultSet:emojiCandidates:](self, "autocorrectionListFromWordSearchCandidateResultSet:emojiCandidates:", v105[5], v65);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManager autocorrectionForCurrentStem](self, "autocorrectionForCurrentStem");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "corrections");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "autocorrection");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "candidate");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManager currentWordStem](self, "currentWordStem");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "setObject:forKey:", v69, v70);

      v34 = v55;
      v36 = v76;
      goto LABEL_52;
    }
LABEL_47:
    v76 = v36;
    v55 = v34;
    -[TIKeyboardInputManager emojiCandidateGenerator](self, "emojiCandidateGenerator");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager keyboardState](self, "keyboardState");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v72 & 1) != 0)
      objc_msgSend(v57, "emojiAdornmentCandidatesForKeyboardState:", v63);
    else
      objc_msgSend(v57, "emojiReplacementCandidatesForKeyboardState:", v63);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_51;
  }
  -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "removeAllInputs");

  -[TIKeyboardInputManagerMecabra wordSearchCandidateResultSet](self, "wordSearchCandidateResultSet");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "candidates");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "firstObject");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "isContinuousPathConversion");

  if ((v48 & 1) == 0)
  {
    -[TIKeyboardInputManagerMecabra wordSearchCandidateResultSet](self, "wordSearchCandidateResultSet");
    v51 = objc_claimAutoreleasedReturnValue();
    v52 = (void *)v105[5];
    v105[5] = v51;

    goto LABEL_45;
  }
  -[TIKeyboardInputManagerMecabra autocorrectionListWithCandidateCount:](self, "autocorrectionListWithCandidateCount:", a3);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v73;
LABEL_52:

  objc_destroyWeak(v98);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v104, 8);
  return v49;
}

- (id)lexiconLocaleOfCandidate:(void *)a3
{
  void *v3;
  uint64_t v4;
  uint64_t WordLocaleAtIndex;
  const void *v6;
  id v7;
  void *v8;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
  v4 = 0;
  while (MecabraCandidateGetWordLengthAtIndex())
  {
    WordLocaleAtIndex = MecabraCandidateCreateWordLocaleAtIndex();
    if (!WordLocaleAtIndex)
      goto LABEL_9;
    v6 = (const void *)WordLocaleAtIndex;
    v7 = (id)MEMORY[0x1DF0A08CC]();
    if (objc_msgSend(v3, "indexOfObject:", v7) == 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v3, "addObject:", v7);
    ++v4;

    CFRelease(v6);
  }
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR("/"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
LABEL_9:
  v8 = 0;
LABEL_10:

  return v8;
}

- (unint64_t)maxDrawSamplesWithNoCandidatesResult
{
  return +[TIMecabraEnvironment maxNumberOfDrawSamples](TIMecabraEnvironment, "maxNumberOfDrawSamples");
}

- (id)autocorrectionListFromWordSearchCandidateResultSet:(id)a3 emojiCandidates:(id)a4
{
  void *v4;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  TIKeyboardInputManagerMecabra *v31;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "candidates");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "proactiveCandidates");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    objc_msgSend(v7, "proactiveCandidates");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "candidates");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "arrayByAddingObjectsFromArray:", v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v14;
  }
  objc_msgSend(v9, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "input");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "length");
  if (v17)
  {
    -[TIKeyboardInputManagerMecabra wordSearch](self, "wordSearch");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "autoCorrects"))
    {
      if (!-[TIKeyboardInputManager shouldBlockAutocorrection:](self, "shouldBlockAutocorrection:", v15))
        goto LABEL_8;
    }
  }
  v18 = v8;
  objc_msgSend(v15, "input");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "candidate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v19, "isEqualToString:", v20) & 1) != 0)
  {

    v8 = v18;
    if (!v17)
    {
LABEL_9:

      goto LABEL_13;
    }
LABEL_8:

    goto LABEL_9;
  }
  v31 = self;
  v21 = objc_msgSend(v15, "isContinuousPathConversion");

  if (v17)
  v8 = v18;
  if ((v21 & 1) == 0)
  {
    -[TIKeyboardInputManager typedStringForEmptyAutocorrection](v31, "typedStringForEmptyAutocorrection");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DBDBE8], "candidateWithUnchangedInput:", v27);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    v26 = v9;

    goto LABEL_20;
  }
LABEL_13:
  if (objc_msgSend(v15, "isSupplementalItemCandidate"))
  {
    v22 = (void *)MEMORY[0x1E0DBDBE8];
    objc_msgSend(v15, "input");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "candidateWithUnchangedInput:", v23);
    v24 = (id)objc_claimAutoreleasedReturnValue();

    v25 = v9;
LABEL_17:
    v26 = v25;
    goto LABEL_20;
  }
  v24 = v15;
  if ((unint64_t)objc_msgSend(v9, "count") >= 2)
  {
    objc_msgSend(v9, "subarrayWithRange:", 1, objc_msgSend(v9, "count") - 1);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  v26 = (id)MEMORY[0x1E0C9AA60];
LABEL_20:
  if ((objc_msgSend(v24, "isContinuousPathConversion") & 1) == 0)
    objc_msgSend(v24, "setConfidence:", 2);
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBDB70]), "initWithAutocorrection:alternateCorrections:", v24, 0);
  objc_msgSend(MEMORY[0x1E0DBDB48], "listWithCorrections:predictions:emojiList:", v28, v26, v8);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (id)generateReplacementsForString:(id)a3 keyLayout:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "generateReplacementsForString:keyLayout:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)generateRefinementsForCandidate:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "generateRefinementsForCandidate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)performHitTestForTouchEvent:(id)a3 keyboardState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v9, "performHitTestForTouchEvent:keyboardState:", v6, v7);

  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)TIKeyboardInputManagerMecabra;
    v10 = -[TIKeyboardInputManager performHitTestForTouchEvent:keyboardState:](&v12, sel_performHitTestForTouchEvent_keyboardState_, v6, v7);
  }

  return (int64_t)v10;
}

- (void)skipHitTestForTouchEvent:(id)a3 keyboardState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "skipHitTestForTouchEvent:keyboardState:", v6, v7);

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)TIKeyboardInputManagerMecabra;
    -[TIKeyboardInputManager skipHitTestForTouchEvent:keyboardState:](&v10, sel_skipHitTestForTouchEvent_keyboardState_, v6, v7);
  }

}

- (void)adjustPhraseBoundaryInForwardDirection:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  objc_super v7;

  v3 = a3;
  -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "adjustPhraseBoundaryInForwardDirection:", v3);

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)TIKeyboardInputManagerMecabra;
    -[TIKeyboardInputManager adjustPhraseBoundaryInForwardDirection:](&v7, sel_adjustPhraseBoundaryInForwardDirection_, v3);
  }
}

- (void)adjustPhraseBoundaryInForwardDirection:(BOOL)a3 granularity:(int)a4
{
  uint64_t v4;
  _BOOL8 v5;
  objc_super v7;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  if (!-[TIKeyboardInputManagerMecabra _adjustPhraseBoundaryInForwardDirection:granularity:](self, "_adjustPhraseBoundaryInForwardDirection:granularity:"))
  {
    v7.receiver = self;
    v7.super_class = (Class)TIKeyboardInputManagerMecabra;
    -[TIKeyboardInputManager adjustPhraseBoundaryInForwardDirection:granularity:](&v7, sel_adjustPhraseBoundaryInForwardDirection_granularity_, v5, v4);
  }
}

- (BOOL)_adjustPhraseBoundaryInForwardDirection:(BOOL)a3 granularity:(int)a4
{
  uint64_t v4;
  _BOOL8 v5;
  void *v6;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v6, "_adjustPhraseBoundaryInForwardDirection:granularity:", v5, v4);

  return v4;
}

- (void)setOriginalInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setOriginalInput:", v4);

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)TIKeyboardInputManagerMecabra;
    -[TIKeyboardInputManager setOriginalInput:](&v7, sel_setOriginalInput_, v4);
  }

}

- (void)textAccepted:(id)a3 fromPredictiveInputBar:(BOOL)a4 withInput:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  objc_super v12;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "textAccepted:fromPredictiveInputBar:withInput:", v8, v6, v9);

  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)TIKeyboardInputManagerMecabra;
    -[TIKeyboardInputManager textAccepted:fromPredictiveInputBar:withInput:](&v12, sel_textAccepted_fromPredictiveInputBar_withInput_, v8, v6, v9);
  }

}

- (void)candidateRejected:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "candidateRejected:", v4);

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)TIKeyboardInputManagerMecabra;
    -[TIKeyboardInputManager candidateRejected:](&v7, sel_candidateRejected_, v4);
  }

}

- (void)registerLearning:(id)a3 fullCandidate:(id)a4 keyboardState:(id)a5 mode:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  objc_super v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "registerLearning:fullCandidate:keyboardState:mode:", v10, v11, v12, v13);

  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)TIKeyboardInputManagerMecabra;
    -[TIKeyboardInputManager registerLearning:fullCandidate:keyboardState:mode:](&v16, sel_registerLearning_fullCandidate_keyboardState_mode_, v10, v11, v12, v13);
  }

}

- (void)registerLearningForCompletion:(id)a3 fullCompletion:(id)a4 context:(id)a5 prefix:(id)a6 mode:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  objc_super v19;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "registerLearningForCompletion:fullCompletion:context:prefix:mode:", v12, v13, v14, v15, v16);

  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)TIKeyboardInputManagerMecabra;
    -[TIKeyboardInputManager registerLearningForCompletion:fullCompletion:context:prefix:mode:](&v19, sel_registerLearningForCompletion_fullCompletion_context_prefix_mode_, v12, v13, v14, v15, v16);
  }

}

- (void)lastAcceptedCandidateCorrected
{
  void *v3;
  id v4;
  objc_super v5;

  -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastAcceptedCandidateCorrected");

  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)TIKeyboardInputManagerMecabra;
    -[TIKeyboardInputManagerBase lastAcceptedCandidateCorrected](&v5, sel_lastAcceptedCandidateCorrected);
  }
}

- (id)_convertInputsToSyntheticInputWithOffset:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  __CFString *v34;
  char v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v41;
  void *v42;
  unint64_t v43;
  void *v44;
  unint64_t v45;
  char v46;

  -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inputs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count") == 1)
  {
    -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "inputs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "inputs");
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[__CFString firstObject](v12, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_28:

LABEL_29:
      return v13;
    }
  }
  else
  {

  }
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "documentState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "markedText");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "length");

  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "documentState");
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[__CFString markedText](v12, "markedText");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v19;
  if (v17 > a3)
  {

    if (objc_msgSend(v11, "length") <= a3)
    {
      v12 = &stru_1EA1081D0;
    }
    else
    {
      objc_msgSend(v11, "substringFromIndex:", a3);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "inputs");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "firstObject");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v29 = objc_opt_isKindOfClass();

    if ((v29 & 1) == 0)
      goto LABEL_17;
    -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "inputs");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "firstObject");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      -[TIKeyboardInputManagerMecabra syllableSeparator](self, "syllableSeparator");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "externalSuffix:", v33);
      v34 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v35 = 0;
    }
    else
    {
LABEL_17:
      v35 = 1;
      v34 = &stru_1EA1081D0;
    }
    -[TIKeyboardInputManagerMecabra syllableSeparator](self, "syllableSeparator");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "stringByAppendingString:", v34);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if ((v35 & 1) == 0
      && ((-[__CFString isEqualToString:](v12, "isEqualToString:", v34) & 1) != 0
       || (-[__CFString isEqualToString:](v12, "isEqualToString:", v37) & 1) != 0))
    {
      v13 = 0;
    }
    else
    {
      -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "inputs");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManagerMecabra convertInputsToSyntheticInputUptoCount:](self, "convertInputsToSyntheticInputUptoCount:", objc_msgSend(v39, "count"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
LABEL_24:

    goto LABEL_28;
  }
  if (objc_msgSend(v19, "length") != a3)
  {
LABEL_27:

    v13 = 0;
    v11 = v18;
    goto LABEL_28;
  }
  -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "inputs");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v21, "count") < 2)
  {
LABEL_26:

    goto LABEL_27;
  }
  -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "inputs");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "firstObject");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_26;
  }
  -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v25, "hasKindOf:", objc_opt_class());

  if ((v46 & 1) == 0)
  {
    -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "inputs");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v43 = objc_msgSend(v11, "cursorIndex");
    objc_msgSend(v11, "text");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "length");

    if (v43 >= v45)
    {
      v13 = 0;
      goto LABEL_29;
    }
    -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[__CFString inputs](v12, "inputs");
    v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerMecabra convertInputsToSyntheticInputUptoCount:](self, "convertInputsToSyntheticInputUptoCount:", -[__CFString count](v34, "count"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  v13 = 0;
  return v13;
}

- (void)_replaceComposingInputWithSyntheticInput:(id)a3 internalIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[7];
  _QWORD v15[4];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v6 = a3;
  if (v6)
  {
    v7 = v6;
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 0;
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x2020000000;
    v15[3] = 0;
    objc_msgSend(v6, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (a4)
    {
      v10 = objc_msgSend(v8, "length");
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __88__TIKeyboardInputManagerMecabra__replaceComposingInputWithSyntheticInput_internalIndex___block_invoke;
      v14[3] = &unk_1EA0FAFF0;
      v14[5] = &v16;
      v14[6] = a4;
      v14[4] = v15;
      objc_msgSend(v9, "enumerateSubstringsInRange:options:usingBlock:", 0, v10, 514, v14);
    }
    objc_msgSend(v7, "syntheticInputWithCursorIndex:", v17[3]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setIncludeSuffixAsSearchString:", 0);
    -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "replaceInputAtIndex:with:", 0, v11);

    -[TIKeyboardInputManagerMecabra previouslyDeletedTypeInput](self, "previouslyDeletedTypeInput");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
      -[TIKeyboardInputManagerMecabra setPreviouslyDeletedTypeInput:](self, "setPreviouslyDeletedTypeInput:", v11);

    _Block_object_dispose(v15, 8);
    _Block_object_dispose(&v16, 8);

  }
}

- (void)processDeleteInputs
{
  TIKeyboardInputManagerMecabra *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _UNKNOWN **v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  _UNKNOWN **v26;
  void *v27;
  char isKindOfClass;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  unint64_t v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  uint64_t v41;
  void *v42;
  int v43;
  BOOL v44;
  void *v45;
  void *v46;
  int v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  int v52;
  unsigned int v53;
  void *v54;
  void *v55;
  char v56;
  id v57;
  void *v58;
  void *v59;
  uint64_t v60;
  unint64_t v61;
  void *v62;
  void *v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  MCDeleteInput *v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  BOOL v81;
  uint64_t v82;
  void *v83;
  TIKeyboardInputManagerMecabra *v84;
  void *v85;
  void *v86;
  int v87;

  v2 = self;
  -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = 0;
    v7 = 0;
    v8 = &off_1EA0F7000;
    v84 = v2;
    while (1)
    {
      -[TIKeyboardInputManagerMecabra composingInput](v2, "composingInput");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "inputs");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
LABEL_24:

      v7 = (v7 + 1);
      v6 = (int)v7;
      -[TIKeyboardInputManagerMecabra composingInput](v2, "composingInput");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "inputs");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "count");

      if (v34 <= (int)v7)
        return;
    }
    v12 = v11;
    -[TIKeyboardInputManagerMecabra composingInput](v2, "composingInput");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = (v7 - 1);
    if ((int)v7 < 1)
    {
      objc_msgSend(v13, "removeInputAtIndex:", v6);
      v17 = v14;
    }
    else
    {
      objc_msgSend(v13, "inputs");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndexedSubscript:", (v7 - 1));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && objc_msgSend(v12, "shouldDeleteAcceptCandidateInput"))
      {
        v85 = v17;
        -[TIKeyboardInputManagerMecabra composingInput](v2, "composingInput");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "removeInputAtIndex:", v6);

        -[TIKeyboardInputManagerMecabra composingInput](v2, "composingInput");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "removeInputAtIndex:", (v7 - 1));

        if ((int)v7 <= 2)
          v20 = 2;
        else
          v20 = v7;
        v7 = (v20 - 2);
        -[TIKeyboardInputManagerMecabra composingInput](v2, "composingInput");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "inputs");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v22, "count") <= v7)
        {

        }
        else
        {
          -[TIKeyboardInputManagerMecabra composingInput](v2, "composingInput");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "inputs");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectAtIndexedSubscript:", v7);
          v25 = v12;
          v26 = v8;
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          v8 = v26;
          v12 = v25;

          if ((isKindOfClass & 1) == 0)
            goto LABEL_21;
          -[TIKeyboardInputManagerMecabra composingInput](v84, "composingInput");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "inputs");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "objectAtIndexedSubscript:", v7);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v21, "setIncludeSuffixAsSearchString:", 1);
        }

LABEL_21:
        objc_opt_class();
        v17 = v85;
        v2 = v84;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          -[TIKeyboardInputManagerMecabra setPreviouslyDeletedTypeInput:](v84, "setPreviouslyDeletedTypeInput:", v85);
        goto LABEL_23;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v31 = -[TIKeyboardInputManagerMecabra convertInputsToSyntheticInputUptoCount:](v2, "convertInputsToSyntheticInputUptoCount:", v7);
        LODWORD(v7) = 0;
        goto LABEL_23;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v35 = v17;
        objc_msgSend(v35, "syllables");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (void *)objc_msgSend(v36, "mutableCopy");

        objc_msgSend(v35, "committedText");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v86 = (void *)objc_msgSend(v38, "mutableCopy");

        v39 = v35;
        v87 = 0;
        v40 = objc_msgSend(v35, "syllableIndex:", &v87);
        v83 = v37;
        v41 = objc_msgSend(v37, "count");
        v42 = v35;
        if (!v41 || v40 < 0)
        {
          v47 = objc_msgSend(v12, "deleteBySyllable");
          v44 = 0;
          v48 = 0;
          if (!v47)
            goto LABEL_59;
        }
        else
        {
          v43 = v87;
          if ((objc_msgSend(v12, "deleteBySyllable") & 1) == 0)
          {
            if ((v43 & 0x80000000) == 0)
            {
LABEL_41:
              objc_msgSend(v83, "objectAtIndexedSubscript:", v40);
              v57 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v83, "removeObjectAtIndex:", v40);
              if (v87 > 0)
              {
                v82 = v40;
                objc_msgSend(v57, "substringWithRange:", (v87 - 1), 1);
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                v59 = (void *)objc_msgSend(v57, "mutableCopy");
                objc_msgSend(v59, "deleteCharactersInRange:", v87 - 1, 1);
                v39 = v42;
                if (objc_msgSend(v59, "length"))
                  objc_msgSend(v83, "insertObject:atIndex:", v59, v82);

                v48 = 0;
                goto LABEL_54;
              }

            }
LABEL_57:
            v48 = 0;
LABEL_58:
            v39 = v42;
            goto LABEL_59;
          }
          v44 = v43 >= 0;
          v39 = v35;
        }
        v81 = v44;
        objc_msgSend(v39, "inputs");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend(v49, "count");

        if (v50)
        {
          objc_msgSend(v42, "inputs");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = objc_msgSend(v51, "count");

          v53 = v52 - 1;
          while ((v53 & 0x80000000) == 0)
          {
            objc_msgSend(v42, "inputs");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "objectAtIndexedSubscript:", v53);
            v55 = (void *)objc_claimAutoreleasedReturnValue();

            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {

              break;
            }
            objc_opt_class();
            v56 = objc_opt_isKindOfClass();

            --v53;
            if ((v56 & 1) != 0)
            {
              if (v81)
                goto LABEL_41;
              goto LABEL_57;
            }
          }
        }
        if (v81)
        {
          v60 = v40;
          objc_msgSend(v83, "objectAtIndexedSubscript:", v40);
          v57 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "removeObjectAtIndex:", v40);
          v61 = v87;
          if (objc_msgSend(v57, "length") <= v61)
          {
            v57 = v57;
            v48 = 1;
            v58 = v57;
          }
          else
          {
            objc_msgSend(v57, "substringToIndex:", v87);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "substringFromIndex:", v87);
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v62, "length"))
              objc_msgSend(v83, "insertObject:atIndex:", v62, v60);

            v48 = 1;
          }
          v39 = v42;
LABEL_54:

          if (v58)
          {
LABEL_65:
            objc_msgSend(v39, "syntheticInputWithCommittedText:syllables:", v86, v83);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            v70 = v39;
            v71 = v69;
            objc_msgSend(v69, "syntheticInputWithCursorIndex:", objc_msgSend(v70, "cursorIndex") - objc_msgSend(v58, "length"));
            v7 = objc_claimAutoreleasedReturnValue();

            objc_msgSend((id)v7, "setIncludeSuffixAsSearchString:", 1);
            v72 = -[MCDeleteInput initWithDeletedText:deleteBySyllable:shouldDeleteAcceptCandidateInput:]([MCDeleteInput alloc], "initWithDeletedText:deleteBySyllable:shouldDeleteAcceptCandidateInput:", v58, v48, objc_msgSend(v12, "shouldDeleteAcceptCandidateInput"));
            objc_msgSend((id)v7, "composeNew:", v72);
            -[TIKeyboardInputManagerMecabra composingInput](v2, "composingInput");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v73, "removeInputAtIndex:", v6);

            -[TIKeyboardInputManagerMecabra composingInput](v2, "composingInput");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "removeInputAtIndex:", v15);

            objc_msgSend((id)v7, "text");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            v76 = objc_msgSend(v75, "length");

            if (v76)
            {
              -[TIKeyboardInputManagerMecabra composingInput](v2, "composingInput");
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v77, "insertInput:atIndex:", v7, v15);

              -[TIKeyboardInputManagerMecabra composingInput](v2, "composingInput");
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v78, "composingInput");
              v79 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v79)
              {
                -[TIKeyboardInputManagerMecabra composingInput](v2, "composingInput");
                v80 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v80, "setComposingInput:", v7);

              }
            }

            v17 = v42;
            LODWORD(v7) = 0;
            v8 = &off_1EA0F7000;
            goto LABEL_23;
          }
LABEL_59:
          if (objc_msgSend(v86, "length"))
          {
            v63 = v39;
            v64 = objc_msgSend(v39, "cursorIndex");
            if (v64 >= objc_msgSend(v86, "length"))
              v65 = objc_msgSend(v86, "length");
            else
              v65 = objc_msgSend(v63, "cursorIndex");
            v66 = objc_msgSend(v86, "rangeOfComposedCharacterSequenceAtIndex:", v65 - 1);
            v68 = v67;
            objc_msgSend(v86, "substringWithRange:", v66, v67);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v86, "deleteCharactersInRange:", v66, v68);
            v39 = v42;
          }
          else
          {
            v58 = 0;
          }
          goto LABEL_65;
        }
        v48 = 1;
        goto LABEL_58;
      }
      -[TIKeyboardInputManagerMecabra composingInput](v2, "composingInput");
      v45 = v17;
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "removeInputAtIndex:", v6);

      v17 = v45;
    }
    LODWORD(v7) = v15;
LABEL_23:

    goto LABEL_24;
  }
}

- (TIKeyboardInputManagerMecabra)chainedKeyboardInputManager
{
  return (TIKeyboardInputManagerMecabra *)self->_geometryDataArray;
}

- (TIKeyboardInputManagerMecabra)composingKeyboardInputManager
{
  return (TIKeyboardInputManagerMecabra *)self->_clearedGeometryDataArray;
}

- (void)setComposingKeyboardInputManager:(id)a3
{
  objc_storeStrong((id *)&self->_clearedGeometryDataArray, a3);
}

- (NSArray)clearedGeometryDataArray
{
  return self->_clearedTouchDataArray;
}

- (void)setClearedGeometryDataArray:(id)a3
{
  objc_storeStrong((id *)&self->_clearedTouchDataArray, a3);
}

- (NSArray)clearedTouchDataArray
{
  return (NSArray *)self->_currentClientIdentifier;
}

- (void)setClearedTouchDataArray:(id)a3
{
  objc_storeStrong((id *)&self->_currentClientIdentifier, a3);
}

- (NSString)currentClientIdentifier
{
  return self->_currentRecipientIdentifier;
}

- (void)setCurrentClientIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 680);
}

- (NSString)currentRecipientIdentifier
{
  return (NSString *)&self->_cancelledDrawInput->super.super.isa;
}

- (void)setCurrentRecipientIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 688);
}

- (BOOL)hasCommittedPartialCandidate
{
  return self->_hasBackspacedIntoInputString;
}

- (void)setHasCommittedPartialCandidate:(BOOL)a3
{
  self->_hasBackspacedIntoInputString = a3;
}

- (BOOL)hasBackspacedIntoInputString
{
  return self->_preservesComposingInput;
}

- (void)setHasBackspacedIntoInputString:(BOOL)a3
{
  self->_preservesComposingInput = a3;
}

- (int)lastCommittedCandidateType
{
  return (int)self->_touchDataArray;
}

- (void)setLastCommittedCandidateType:(int)a3
{
  LODWORD(self->_touchDataArray) = a3;
}

- (BOOL)preservesComposingInput
{
  return self->_shouldClearBeforeContinuousPath;
}

- (void)setPreservesComposingInput:(BOOL)a3
{
  self->_shouldClearBeforeContinuousPath = a3;
}

- (MCDrawInput)cancelledDrawInput
{
  return (MCDrawInput *)self->_currentLayout.m_ptr;
}

- (void)setCancelledDrawInput:(id)a3
{
  objc_storeStrong((id *)&self->_currentLayout.m_ptr, a3);
}

- (RefPtr<TI::Favonius::KeyboardLayout>)currentLayout
{
  unsigned int **v2;
  unsigned int *compositionCompletionHandler;
  unsigned int v4;

  compositionCompletionHandler = (unsigned int *)self->_compositionCompletionHandler;
  *v2 = compositionCompletionHandler;
  if (compositionCompletionHandler)
  {
    do
      v4 = __ldaxr(compositionCompletionHandler);
    while (__stlxr(v4 + 1, compositionCompletionHandler));
  }
  return (RefPtr<TI::Favonius::KeyboardLayout>)self;
}

- (id)compositionCompletionHandler
{
  return self->_pendingStickerTask;
}

- (void)setCompositionCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 712);
}

- (TIKeyboardInputManagerStickerTask)pendingStickerTask
{
  return (TIKeyboardInputManagerStickerTask *)self->_wordSearch;
}

- (void)setPendingStickerTask:(id)a3
{
  objc_storeStrong((id *)&self->_wordSearch, a3);
}

- (TIWordSearch)wordSearch
{
  return (TIWordSearch *)self->_wordSearchCandidateResultSet;
}

- (TIWordSearchCandidateResultSet)wordSearchCandidateResultSet
{
  return (TIWordSearchCandidateResultSet *)self->_previouslyDeletedTypeInput;
}

- (void)setWordSearchCandidateResultSet:(id)a3
{
  objc_storeStrong((id *)&self->_previouslyDeletedTypeInput, a3);
}

- (MCKeyboardInput)previouslyDeletedTypeInput
{
  return self->_previouslyProcessedDeleteInput;
}

- (void)setPreviouslyDeletedTypeInput:(id)a3
{
  objc_storeStrong((id *)&self->_previouslyProcessedDeleteInput, a3);
}

- (MCKeyboardInput)previouslyProcessedDeleteInput
{
  return (MCKeyboardInput *)self->_remainingInput;
}

- (void)setPreviouslyProcessedDeleteInput:(id)a3
{
  objc_storeStrong((id *)&self->_remainingInput, a3);
}

- (BOOL)shouldClearBeforeContinuousPath
{
  return self->_lastCommittedCandidateType;
}

- (void)setShouldClearBeforeContinuousPath:(BOOL)a3
{
  LOBYTE(self->_lastCommittedCandidateType) = a3;
}

- (NSString)remainingInput
{
  return (NSString *)&self->_touchDownEvents->super.super.isa;
}

- (void)setRemainingInput:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 760);
}

- (NSMutableDictionary)touchDownEvents
{
  return self->_touchUpEvents;
}

- (NSMutableDictionary)touchUpEvents
{
  return (NSMutableDictionary *)self[1].super.super.super.super.isa;
}

- (void).cxx_destruct
{
  id compositionCompletionHandler;
  TIKeyboardInputManagerMecabra *chainedKeyboardInputManager;
  KeyboardLayout *m_ptr;

  objc_storeStrong((id *)&self[1].super.super.super.super.isa, 0);
  objc_storeStrong((id *)&self->_touchUpEvents, 0);
  objc_storeStrong((id *)&self->_touchDownEvents, 0);
  objc_storeStrong((id *)&self->_remainingInput, 0);
  objc_storeStrong((id *)&self->_previouslyProcessedDeleteInput, 0);
  objc_storeStrong((id *)&self->_previouslyDeletedTypeInput, 0);
  objc_storeStrong((id *)&self->_wordSearchCandidateResultSet, 0);
  objc_storeStrong((id *)&self->_wordSearch, 0);
  objc_storeStrong((id *)&self->_pendingStickerTask, 0);
  compositionCompletionHandler = self->_compositionCompletionHandler;
  if (compositionCompletionHandler)
    WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref((uint64_t)compositionCompletionHandler);
  objc_storeStrong((id *)&self->_currentLayout.m_ptr, 0);
  objc_storeStrong((id *)&self->_cancelledDrawInput, 0);
  objc_storeStrong((id *)&self->_currentRecipientIdentifier, 0);
  objc_storeStrong((id *)&self->_currentClientIdentifier, 0);
  objc_storeStrong((id *)&self->_clearedTouchDataArray, 0);
  objc_storeStrong((id *)&self->_clearedGeometryDataArray, 0);
  objc_storeStrong((id *)&self->_composingKeyboardInputManager, 0);
  objc_storeStrong((id *)&self->_geometryDataArray, 0);
  chainedKeyboardInputManager = self->chainedKeyboardInputManager;
  if (chainedKeyboardInputManager)
    WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref((uint64_t)chainedKeyboardInputManager);
  m_ptr = self->_currentCharacterKeysLayout.m_ptr;
  if (m_ptr)
    WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref((uint64_t)m_ptr);
  objc_storeStrong((id *)&self->_baseCharacterKeysLayout.m_ptr, 0);
  objc_storeStrong((id *)&self->_composingInput, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 78) = 0;
  *((_QWORD *)self + 79) = 0;
  *((_QWORD *)self + 88) = 0;
  return self;
}

_QWORD *__88__TIKeyboardInputManagerMecabra__replaceComposingInputWithSyntheticInput_internalIndex___block_invoke(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  if (++*(_QWORD *)(*(_QWORD *)(result[4] + 8) + 24) >= result[6])
  {
    *(_QWORD *)(*(_QWORD *)(result[5] + 8) + 24) = a3 + a4;
    *a7 = 1;
  }
  return result;
}

void __70__TIKeyboardInputManagerMecabra_autocorrectionListWithCandidateCount___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  char v4;
  id v5;
  uint64_t NextCandidate;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  uint64_t v19;
  id v20;

  objc_msgSend(*(id *)(a1 + 32), "mecabraEnvironment");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
  objc_msgSend(v20, "setGeometryModel:modelData:", WeakRetained, *(_QWORD *)(a1 + 40));

  if (!objc_msgSend(*(id *)(a1 + 48), "length"))
  {
    objc_msgSend(v20, "setLeftDocumentContext:", *(_QWORD *)(a1 + 56));
    objc_msgSend(v20, "setRightDocumentContext:", *(_QWORD *)(a1 + 64));
    objc_msgSend(v20, "adjustEnvironmentDirectly:", 0);
  }
  v3 = *(_QWORD *)(a1 + 72);
  if (v3)
  {
    if ((objc_msgSend(v20, "analyzeInput:options:", v3, *(_QWORD *)(a1 + 120)) & 1) == 0)
      goto LABEL_34;
  }
  else if (!objc_msgSend(v20, "analyzeString:options:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 120)))
  {
    goto LABEL_34;
  }
  if (*(_QWORD *)(a1 + 80))
    v4 = objc_msgSend(*(id *)(a1 + 88), "shouldInsertSpaceBeforePredictions");
  else
    v4 = 0;
  v5 = 0;
  while (1)
  {
    objc_msgSend(*(id *)(a1 + 32), "mecabra");
    NextCandidate = MecabraGetNextCandidate();
    if (!NextCandidate)
      break;
    v7 = NextCandidate;
    if (MecabraCandidateGetType() == 6)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "addMecabraProactiveCandidate:triggerSourceType:", v7, 0);
    }
    else
    {
      v8 = objc_alloc(MEMORY[0x1E0DBDC88]);
      v9 = v8;
      if (v5)
      {
        objc_msgSend(v5, "candidate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v9, "initWithMecabraCandidate:input:", v7, v10);

      }
      else
      {
        v11 = (void *)objc_msgSend(v8, "initWithMecabraCandidate:input:", v7, *(_QWORD *)(a1 + 96));
      }
      objc_msgSend(v11, "setContinuousPathConversion:", *(_QWORD *)(a1 + 80) != 0);
      if (objc_msgSend(*(id *)(a1 + 88), "isUsingMultilingual"))
      {
        objc_msgSend(*(id *)(a1 + 88), "lexiconLocaleOfCandidate:", v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setLexiconLocale:", v12);

      }
      if (*(_QWORD *)(a1 + 80))
      {
        if (*(_DWORD *)(a1 + 128))
        {
          if ((v4 & 1) != 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "_stringWithUnichar:");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "candidate");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "stringByAppendingString:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            objc_msgSend(v11, "candidate");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v5, "candidate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v15, "isEqualToString:", v16);

          if ((v17 & 1) == 0)
          {
            objc_msgSend(v11, "candidateByReplacingWithCandidate:", v15);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v18, "setMecabraCandidatePointerValue:", 0);
            v7 = 0;
            v11 = v18;
          }

        }
        if (!v5)
        {
          v5 = v11;
          if ((objc_msgSend(*(id *)(a1 + 80), "isCompleting") & 1) != 0)
            v19 = 1;
          else
            v19 = objc_msgSend(*(id *)(a1 + 80), "isComplete");
          objc_msgSend(v5, "setShouldAccept:", v19);
          v11 = v5;
        }
      }
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "addMecabraCandidate:mecabraCandidateRef:", v11, v7);

    }
  }

LABEL_34:
  if (!objc_msgSend(*(id *)(a1 + 48), "length"))
    objc_msgSend(*(id *)(a1 + 32), "insertTopSupplementalCandidateSurroundingCursorToFrontOfResultSet:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40));

}

void __90__TIKeyboardInputManagerMecabra_updateProactiveCandidatesForCandidateResultSet_withInput___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setProactiveCandidates:", v3);
  if (*(_BYTE *)(a1 + 48) && objc_msgSend(v3, "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "candidateResultSetFromWordSearchCandidateResultSet:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "pushCandidateGenerationContextWithResults:", v4);

  }
  if (TICanLogMessageAtLevel_onceToken != -1)
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
  if (TICanLogMessageAtLevel_logLevel >= 2)
  {
    TIOSLogFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(a1 + 32), "proactiveCandidates");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("%s ProactiveQuickType:TI: Generated proactive candidates: %@"), "-[TIKeyboardInputManagerMecabra updateProactiveCandidatesForCandidateResultSet:withInput:]_block_invoke", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v10 = v8;
      _os_log_debug_impl(&dword_1DA6F2000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
  }

}

uint64_t __76__TIKeyboardInputManagerMecabra_addProactiveTriggers_withCompletionHandler___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t result;

  if (a2)
  {
    +[TIProactiveQuickTypeManager proactiveTriggerForTextContentType:](TIProactiveQuickTypeManager, "proactiveTriggerForTextContentType:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      v5 = *(void **)(a1 + 40);
      objc_msgSend(v3, "attributes");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addSyntheticMecabraProactiveCandidate:triggerSourceType:", v6, 2);

    }
  }
  if (_os_feature_enabled_impl() && *(_QWORD *)(a1 + 48) && !*(_BYTE *)(a1 + 64))
    objc_msgSend(*(id *)(a1 + 40), "addProactiveTrigger:");
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 40));
  return result;
}

void __76__TIKeyboardInputManagerMecabra_addProactiveTriggers_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2;
  uint64_t v3;
  TILanguageModelAdaptationContext *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  _QWORD *v17;
  _QWORD block[4];
  id v19;
  _QWORD *v20;
  _QWORD v21[3];
  char v22;

  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v22 = 0;
  v2 = dispatch_time(0, 100000000);
  v3 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__TIKeyboardInputManagerMecabra_addProactiveTriggers_withCompletionHandler___block_invoke_3;
  block[3] = &unk_1EA102A48;
  v20 = v21;
  v19 = *(id *)(a1 + 80);
  dispatch_after(v2, MEMORY[0x1E0C80D38], block);
  v4 = -[TILanguageModelAdaptationContext initWithClientIdentifier:andRecipientContactInfo:]([TILanguageModelAdaptationContext alloc], "initWithClientIdentifier:andRecipientContactInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0D87C10], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 48);
  -[TILanguageModelAdaptationContext identifierForResponseKit](v4, "identifierForResponseKit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 88);
  v13[0] = v3;
  v13[1] = 3221225472;
  v13[2] = __76__TIKeyboardInputManagerMecabra_addProactiveTriggers_withCompletionHandler___block_invoke_4;
  v13[3] = &unk_1EA0FAF50;
  v17 = v21;
  v9 = *(_QWORD *)(a1 + 56);
  v10 = *(id *)(a1 + 64);
  v11 = *(_QWORD *)(a1 + 72);
  v12 = *(void **)(a1 + 80);
  v14 = v10;
  v15 = v11;
  v16 = v12;
  objc_msgSend(v5, "responsesForMessage:maximumResponses:forContext:withLanguage:options:completionBlock:", v6, 10, v7, v9, v8, v13);

  _Block_object_dispose(v21, 8);
}

uint64_t __76__TIKeyboardInputManagerMecabra_addProactiveTriggers_withCompletionHandler___block_invoke_3(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  }
  return result;
}

void __76__TIKeyboardInputManagerMecabra_addProactiveTriggers_withCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;

  v3 = a2;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 48);
  v4 = v3;
  TIDispatchAsync();

}

void __76__TIKeyboardInputManagerMecabra_addProactiveTriggers_withCompletionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __76__TIKeyboardInputManagerMecabra_addProactiveTriggers_withCompletionHandler___block_invoke_6;
    v8[3] = &unk_1EA0FAF00;
    v3 = *(void **)(a1 + 32);
    v4 = *(id *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v9 = v4;
    v10 = v5;
    objc_msgSend(v3, "enumerateObjectsWithOptions:usingBlock:", 2, v8);
    (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), 1, v6, v7);

  }
}

void __76__TIKeyboardInputManagerMecabra_addProactiveTriggers_withCompletionHandler___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *CandidateFromContextString;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "attributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (TICanLogMessageAtLevel_onceToken != -1)
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      TIOSLogFacility();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        v28 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v3, "attributes");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "stringWithFormat:", CFSTR("%s ResponseKit:Proactive:TI: received proactive trigger [%@]"), "-[TIKeyboardInputManagerMecabra addProactiveTriggers:withCompletionHandler:]_block_invoke_6", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v35 = v30;
        _os_log_debug_impl(&dword_1DA6F2000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }
    objc_msgSend(v3, "attributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D43428]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "attributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D87C30]))
    {
      +[TIResponseKitManager rewriteMoneyAttributes:](TIResponseKitManager, "rewriteMoneyAttributes:", v8);
      v9 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v9;
    }
    objc_msgSend(*(id *)(a1 + 32), "addSyntheticMecabraProactiveCandidate:triggerSourceType:", v8, 1);

    goto LABEL_11;
  }
  objc_msgSend(v3, "string");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (TICanLogMessageAtLevel_onceToken != -1)
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      TIOSLogFacility();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v31 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v3, "string");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "stringWithFormat:", CFSTR("%s ResponseKit:Canned:TI: received canned response [%@]"), "-[TIKeyboardInputManagerMecabra addProactiveTriggers:withCompletionHandler:]_block_invoke", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v35 = v33;
        _os_log_debug_impl(&dword_1DA6F2000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }
    objc_msgSend(*(id *)(a1 + 40), "mecabra");
    objc_msgSend(v3, "string");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    CandidateFromContextString = (void *)MecabraCreateCandidateFromContextString();

    if (CandidateFromContextString)
    {
      v14 = objc_alloc(MEMORY[0x1E0DBDC88]);
      objc_msgSend(v3, "string");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "category");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", CandidateFromContextString);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v14, "initWithResponseKitString:responseKitCategory:mecabraCandidatePointerValue:", v15, v16, v17);

      objc_msgSend(*(id *)(a1 + 32), "insertMecabraCandidate:mecabraCandidateRef:atIndex:", v7, CandidateFromContextString, 0);
      v18 = (void *)MEMORY[0x1E0D87BF8];
      v19 = *MEMORY[0x1E0D87C20];
      objc_msgSend(*(id *)(a1 + 40), "inputMode");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "normalizedIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      TIInputModeGetBaseLanguage();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "incrementAggdKeyForCategory:forAction:withLanguageID:", 0, v19, v22);

      v23 = (void *)MEMORY[0x1E0D87BF8];
      objc_msgSend(v3, "category");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "inputMode");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "normalizedIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      TIInputModeGetBaseLanguage();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "incrementAggdKeyForCategory:forAction:withLanguageID:", v24, v19, v27);

LABEL_11:
    }
  }

}

void __67__TIKeyboardInputManagerMecabra_addStickers_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "pendingStickerTask");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);

  if (v5 == v6)
  {
    objc_msgSend(WeakRetained, "setPendingStickerTask:", 0);
    if (objc_msgSend(v3, "count"))
    {
      +[TIAppAutofillManager sharedInstance](TIAppAutofillManager, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "secureCandidateRenderer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v18 = v3;
      v9 = v3;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v20;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v20 != v12)
              objc_enumerationMutation(v9);
            v14 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v13);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v8, "cachedCandidateForSecureCandidate:", v14);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 40), "input");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "setInput:", v16);

              objc_msgSend(*(id *)(a1 + 40), "rawInput");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "setRawInput:", v17);

            }
            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v11);
      }

      objc_msgSend(*(id *)(a1 + 48), "insertStickers:", v9);
      v3 = v18;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __68__TIKeyboardInputManagerMecabra_updateLanguageModelForKeyboardState__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  dispatch_time_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  MecabraGetLastOfflineAdaptationTime();
  v3 = v2;
  v4 = dispatch_time(0, 20000000000);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__TIKeyboardInputManagerMecabra_updateLanguageModelForKeyboardState__block_invoke_2;
  v5[3] = &unk_1EA100718;
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  dispatch_after(v4, MEMORY[0x1E0C80D38], v5);

}

void __68__TIKeyboardInputManagerMecabra_updateLanguageModelForKeyboardState__block_invoke_2(uint64_t a1)
{
  void *v2;
  TILanguageModelOfflineLearningStrategyMecabraFavonius *v3;

  v3 = -[TILanguageModelOfflineLearningStrategyMecabraFavonius initWithClientIdentifier:]([TILanguageModelOfflineLearningStrategyMecabraFavonius alloc], "initWithClientIdentifier:", *(_QWORD *)(a1 + 32));
  +[TILanguageModelOfflineLearningAgent sharedLearningAgent](TILanguageModelOfflineLearningAgent, "sharedLearningAgent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performLearningIfNecessaryWithStrategy:lastAdaptationTime:", v3, *(double *)(a1 + 40));

}

void __47__TIKeyboardInputManagerMecabra_logInputString__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  id v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  __CFString *v23;
  __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  unint64_t v29;
  void *v30;
  uint64_t v31;
  float *v32;
  uint64_t v33;
  float v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  __CFString *v46;
  _BYTE v47[4];
  _BYTE v48[180];

  *(_QWORD *)&v48[164] = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  if (v10 >= objc_msgSend(*(id *)(a1 + 32), "count")
    || (v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), v11 >= objc_msgSend(*(id *)(a1 + 40), "count")))
  {
    *a7 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "validCharacterSetForAutocorrection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "characterIsMember:", objc_msgSend(v9, "characterAtIndex:", 0));

    if ((v13 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "doubleValue");
      v17 = v16;

      objc_msgSend(v14, "objectAtIndexedSubscript:", 5);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "doubleValue");
      v20 = v19;

      if (v17 == 0.0)
        v17 = v20;
      if ((unint64_t)objc_msgSend(v14, "count") < 7)
      {
        v24 = &stru_1EA1081D0;
      }
      else
      {
        objc_msgSend(v14, "objectAtIndexedSubscript:", 6);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "integerValue");

        v23 = CFSTR("; flick");
        if (v22 == 1)
          v23 = CFSTR("; multitap");
        v24 = v23;
      }
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "length");
      if (v28 < 0xA9)
      {
        v29 = v28;
        v45 = v27;
        v46 = v24;
        objc_msgSend(v27, "getBytes:length:", v47, v28);
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v29 & 0x7FFFFFFF0) != 0)
        {
          v31 = (v29 >> 3) - 1;
          v32 = (float *)v48;
          do
          {
            v33 = *((unsigned __int16 *)v32 - 2);
            v34 = *v32;
            v32 += 2;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%C:%f"), v33, v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "addObject:", v35);

            --v31;
          }
          while (v31);
        }
        v43 = (void *)MEMORY[0x1E0CB3940];
        v44 = *(void **)(a1 + 48);
        v42 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
        objc_msgSend(v30, "componentsJoinedByString:", CFSTR(", "));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectAtIndexedSubscript:", 3);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectAtIndexedSubscript:", 4);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v46;
        objc_msgSend(v43, "stringWithFormat:", CFSTR("%lu; %@; %@; %@,%@; %@,%@; %.3f; %.3f%@\n"),
          v42,
          v9,
          v41,
          v36,
          v37,
          v38,
          v39,
          v20 - v17,
          *(_QWORD *)&v20,
          v46);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "logToTypologyRecorderWithString:", v40);

        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += objc_msgSend(v9, "length");
        v27 = v45;
      }
      else
      {
        *a7 = 1;
      }

    }
    else
    {
      v25 = *(void **)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu; %@\n"),
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24),
        v9);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "logToTypologyRecorderWithString:", v26);

      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += objc_msgSend(v9, "length");
    }
  }

}

void __66__TIKeyboardInputManagerMecabra_addInput_flags_point_firstDelete___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  id v29;
  MCTypeInput *v30;
  CGRect v31;
  CGRect v32;

  if (a2)
  {
    v4 = *(double *)(a1 + 56);
    v3 = *(double *)(a1 + 64);
    v5 = *(void **)(a1 + 32);
    v6 = a2;
    if (!objc_msgSend(v5, "shouldRescaleTouchPoints"))
      goto LABEL_8;
    v7 = *MEMORY[0x1E0C9D538];
    v8 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    if (v4 == *MEMORY[0x1E0C9D538] && v3 == v8)
      goto LABEL_9;
    objc_msgSend(*(id *)(a1 + 32), "currentCharacterKeysLayoutFrame");
    v11 = v10;
    v13 = v12;
    v29 = v14;
    v16 = v15;
    objc_msgSend(*(id *)(a1 + 32), "baseCharacterKeysLayoutFrame");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v27 = v16;
    v31.origin.x = v11;
    v28 = v13;
    v31.origin.y = v13;
    *(_QWORD *)&v31.size.width = v29;
    v31.size.height = v16;
    v25 = v20;
    v32.origin.x = v18;
    v32.origin.y = v25;
    v32.size.width = v22;
    v32.size.height = v24;
    if (!CGRectEqualToRect(v31, v32))
    {
      v7 = v18 + (v4 - v11) / *(double *)&v29 * v22;
      v8 = v25 + (v3 - v28) / v27 * v24;
    }
    else
    {
LABEL_8:
      v7 = v4;
      v8 = v3;
    }
LABEL_9:
    v30 = -[MCTypeInput initWithCharacters:point:nearbyKeys:sourceKeyboardState:]([MCTypeInput alloc], "initWithCharacters:point:nearbyKeys:sourceKeyboardState:", v6, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v7, v8);

    objc_msgSend(*(id *)(a1 + 32), "composingInput");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "composeNew:", v30);

  }
}

void __56__TIKeyboardInputManagerMecabra_baseCharacterKeysLayout__block_invoke(uint64_t a1, const char *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  __CFString *v12;
  uint64_t v13;
  void *v14;
  TI::Favonius::LayoutKey *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t *v18;
  TI::Favonius::LayoutKey **v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  const void *v23;
  TI::Favonius::LayoutKey *v24;
  _BYTE v25[8];
  void *v26;
  uint64_t v27;
  CGRect v28;

  v27 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = &stru_1EA1081D0;
  }
  if (-[__CFString length](v12, "length") != 1)
    goto LABEL_19;
  v13 = -[__CFString _firstChar](v12, "_firstChar");
  objc_msgSend(MEMORY[0x1E0CB3500], "letterCharacterSet");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = objc_msgSend(v14, "characterIsMember:", v13);

  if (!(_DWORD)v13)
    goto LABEL_19;
  KB::String::String((KB::String *)v25, a2);
  LOWORD(v23) = 0;
  v15 = (TI::Favonius::LayoutKey *)operator new();
  v28.origin.x = a3;
  v28.origin.y = a4;
  v28.size.width = a5;
  v28.size.height = a6;
  v24 = TI::Favonius::LayoutKey::LayoutKey(v15, (const KB::String *)v25, &v23, v28, 0);
  if (v26 && v25[6] == 1)
    free(v26);
  v16 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
  v18 = v16 + 6;
  v17 = v16[6];
  if (v17 != v16[8])
  {
    *(_QWORD *)(v16[7] + 8 * v17) = v15;
    do
LABEL_14:
      v22 = __ldaxr((unsigned int *)v15);
    while (__stlxr(v22 + 1, (unsigned int *)v15));
    v21 = *v18;
    goto LABEL_16;
  }
  v19 = (TI::Favonius::LayoutKey **)WTF::Vector<WTF::RefPtr<TI::Favonius::LayoutKey>,0ul>::expandCapacity(v16 + 6, v17 + 1, (unint64_t)&v24);
  v20 = v16[7];
  if (!v20)
    goto LABEL_17;
  v21 = *v18;
  v15 = *v19;
  *(_QWORD *)(v20 + 8 * *v18) = *v19;
  if (v15)
    goto LABEL_14;
LABEL_16:
  *v18 = v21 + 1;
LABEL_17:
  if (v24)
    WTF::RefCounted<TI::Favonius::Key>::deref((uint64_t)v24);
LABEL_19:

}

void __57__TIKeyboardInputManagerMecabra_characterKeysLayoutFrom___block_invoke(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int16 v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  size_t v13;
  _BOOL4 v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  __int16 v19;
  TI::Favonius::LayoutKey *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t *v23;
  TI::Favonius::LayoutKey **v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int v27;
  __int128 v28;
  TI::Favonius::LayoutKey *v29;
  uint64_t v30;
  void *v31;
  int v32;
  uint64_t v33;
  CGRect v34;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = *a2;
  v5 = *(unsigned __int16 *)(*a2 + 12);
  if (!*(_WORD *)(*a2 + 12))
  {
    KB::String::compute_length((unsigned __int16 *)(v4 + 8));
    v5 = *(unsigned __int16 *)(v4 + 12);
  }
  if (v5 == 1)
  {
    v6 = *a2;
    v7 = *(_QWORD *)(*a2 + 16);
    if (!v7)
      v7 = *a2 + 24;
    v30 = v7;
    LODWORD(v31) = 0;
    HIDWORD(v31) = *(unsigned __int16 *)(v6 + 8);
    v32 = 0;
    KB::String::iterator::initialize(&v30);
    v8 = v32;
    objc_msgSend(MEMORY[0x1E0CB3500], "letterCharacterSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "characterIsMember:", v8))
    {

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "zhuyinCharacterSet");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "characterIsMember:", v8);

      if (!v11)
        return;
    }
    KB::String::String((KB::String *)&v30, (const KB::String *)(*a2 + 8));
    v12 = *a2;
    v13 = *(unsigned __int16 *)(*a2 + 40);
    if (v13 < 0xF)
    {
      v28 = *(_OWORD *)(*a2 + 40);
      v14 = (unsigned __int16)v28 > 0xEu;
    }
    else
    {
      LOWORD(v28) = *(_WORD *)(*a2 + 40);
      *((_QWORD *)&v28 + 1) = operator new[]();
      memcpy(*((void **)&v28 + 1), *(const void **)(v12 + 48), v13);
      v12 = *a2;
      v14 = 1;
    }
    v15 = *(double *)(v12 + 64);
    v16 = *(double *)(v12 + 72);
    v17 = *(double *)(v12 + 80);
    v18 = *(double *)(v12 + 88);
    v19 = *(_WORD *)(v12 + 62);
    v20 = (TI::Favonius::LayoutKey *)operator new();
    v34.origin.x = v15;
    v34.origin.y = v16;
    v34.size.width = v17;
    v34.size.height = v18;
    v29 = TI::Favonius::LayoutKey::LayoutKey(v20, (const KB::String *)&v30, (const void **)&v28, v34, v19);
    if (v14 && *((_QWORD *)&v28 + 1))
      MEMORY[0x1DF0A212C](*((_QWORD *)&v28 + 1), 0x1000C8077774924);
    if (v31 && BYTE6(v30) == 1)
      free(v31);
    v21 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
    v23 = v21 + 6;
    v22 = v21[6];
    if (v22 == v21[8])
    {
      v24 = (TI::Favonius::LayoutKey **)WTF::Vector<WTF::RefPtr<TI::Favonius::LayoutKey>,0ul>::expandCapacity(v21 + 6, v22 + 1, (unint64_t)&v29);
      v25 = v21[7];
      if (!v25)
        goto LABEL_26;
      v26 = *v23;
      v20 = *v24;
      *(_QWORD *)(v25 + 8 * *v23) = *v24;
      if (!v20)
      {
LABEL_25:
        *v23 = v26 + 1;
LABEL_26:
        if (v29)
          WTF::RefCounted<TI::Favonius::Key>::deref((uint64_t)v29);
        return;
      }
    }
    else
    {
      *(_QWORD *)(v21[7] + 8 * v22) = v20;
    }
    do
      v27 = __ldaxr((unsigned int *)v20);
    while (__stlxr(v27 + 1, (unsigned int *)v20));
    v26 = *v23;
    goto LABEL_25;
  }
}

void __71__TIKeyboardInputManagerMecabra_handleAcceptedCandidate_keyboardState___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;

  objc_msgSend(a2, "candidate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "candidate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "composingInput");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "hasDrawInput");

      if (v11)
        objc_msgSend(*(id *)(a1 + 32), "setContinuousPathConversion:", 1);
    }
    *a4 = 1;
  }
}

void __67__TIKeyboardInputManagerMecabra_validCharacterSetForAutocorrection__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithRange:", 97, 26);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)-[TIKeyboardInputManagerMecabra validCharacterSetForAutocorrection]::__validCharSet;
  -[TIKeyboardInputManagerMecabra validCharacterSetForAutocorrection]::__validCharSet = v0;

}

uint64_t __50__TIKeyboardInputManagerMecabra_setKeyboardState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "canSuggestSupplementalItemsFlagDidChangeTo:", *(unsigned __int8 *)(a1 + 40));
}

+ (void)removeDynamicDictionaryForInputMode:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  TIWordSearchOperationResetLearningDictionaries *v6;
  void *v7;
  TIWordSearchOperationResetLearningDictionaries *v8;
  id v9;

  +[TIInputMode inputModeWithIdentifier:](TIInputMode, "inputModeWithIdentifier:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  +[TIWordSearchController sharedWordSearchController](TIWordSearchController, "sharedWordSearchController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wordSearchForInputMode:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[TIWordSearch sharedOperationQueue](TIWordSearch, "sharedOperationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [TIWordSearchOperationResetLearningDictionaries alloc];
  objc_msgSend(v4, "mecabraWrapper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[TIWordSearchOperationResetLearningDictionaries initWithMecabraWrapper:](v6, "initWithMecabraWrapper:", v7);
  objc_msgSend(v5, "addOperation:", v8);

}

+ (id)dummyGeometryData
{
  if (+[TIKeyboardInputManagerMecabra dummyGeometryData]::__onceToken != -1)
    dispatch_once(&+[TIKeyboardInputManagerMecabra dummyGeometryData]::__onceToken, &__block_literal_global_158);
  return (id)+[TIKeyboardInputManagerMecabra dummyGeometryData]::__dummyData;
}

+ (id)dummyTouchData
{
  return &unk_1EA13FF40;
}

+ (id)offlineLearningHandleForInputMode:(id)a3
{
  id v3;
  TILanguageModelOfflineLearningHandleMecabra *v4;

  v3 = a3;
  v4 = -[TILanguageModelOfflineLearningHandle initWithInputMode:]([TILanguageModelOfflineLearningHandleMecabra alloc], "initWithInputMode:", v3);

  -[TILanguageModelOfflineLearningHandle setValid:](v4, "setValid:", 1);
  return v4;
}

+ (id)initializedClients
{
  if (+[TIKeyboardInputManagerMecabra initializedClients]::onceToken != -1)
    dispatch_once(&+[TIKeyboardInputManagerMecabra initializedClients]::onceToken, &__block_literal_global_169);
  return (id)+[TIKeyboardInputManagerMecabra initializedClients]::__initializedClients;
}

+ (Class)wordSearchClass
{
  return 0;
}

void __51__TIKeyboardInputManagerMecabra_initializedClients__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[TIKeyboardInputManagerMecabra initializedClients]::__initializedClients;
  +[TIKeyboardInputManagerMecabra initializedClients]::__initializedClients = v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v4, "addObserverForName:object:queue:usingBlock:", CFSTR("TIKeyboardInputManagerDynamicDictionariesRemovedNotification"), 0, v2, &__block_literal_global_173);

}

uint64_t __51__TIKeyboardInputManagerMecabra_initializedClients__block_invoke_2()
{
  return objc_msgSend((id)+[TIKeyboardInputManagerMecabra initializedClients]::__initializedClients, "removeAllObjects");
}

void __50__TIKeyboardInputManagerMecabra_dummyGeometryData__block_invoke()
{
  uint64_t v0;
  void *v1;
  _WORD v2[2];
  int v3;

  v2[0] = 0;
  v3 = 0;
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v2, 8);
  v1 = (void *)+[TIKeyboardInputManagerMecabra dummyGeometryData]::__dummyData;
  +[TIKeyboardInputManagerMecabra dummyGeometryData]::__dummyData = v0;

}

- (TIKeyboardInputManagerMecabra)initWithKeyboardInputManagerToChain:(id)a3
{
  id v5;
  TIKeyboardInputManagerMecabra *v6;
  TIKeyboardInputManagerMecabra *v7;

  v5 = a3;
  v6 = -[TIKeyboardInputManager initWithInputMode:keyboardState:](self, "initWithInputMode:keyboardState:", 0, 0);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_geometryDataArray, a3);

  return v7;
}

- (void)commitComposition
{
  -[TIKeyboardInputManagerMecabra setComposingKeyboardInputManager:](self, "setComposingKeyboardInputManager:", 0);
}

- (void)abortComposition
{
  -[TIKeyboardInputManagerMecabra setComposingKeyboardInputManager:](self, "setComposingKeyboardInputManager:", 0);
}

- (void)composeTextWith:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _BYTE location[12];
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v6 = (void *)objc_opt_class();
    v7 = v6;
    *(_DWORD *)location = 136315650;
    *(_QWORD *)&location[4] = "-[TIKeyboardInputManagerMecabra(StackableInputManager) composeTextWith:]";
    v12 = 2112;
    v13 = v6;
    v14 = 2112;
    v15 = (id)objc_opt_class();
    v8 = v15;
    _os_log_debug_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%s  %@ invokes %@", location, 0x20u);

  }
  -[TIKeyboardInputManagerMecabra setComposingKeyboardInputManager:](self, "setComposingKeyboardInputManager:", v4);
  objc_initWeak((id *)location, self);
  -[TIKeyboardInputManagerMecabra composingKeyboardInputManager](self, "composingKeyboardInputManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__TIKeyboardInputManagerMecabra_StackableInputManager__composeTextWith___block_invoke;
  v9[3] = &unk_1EA0FB018;
  objc_copyWeak(&v10, (id *)location);
  objc_msgSend(v5, "composeText:", v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)location);

}

- (void)_completeComposition:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void (**v6)(_QWORD, _QWORD);

  v3 = a3;
  -[TIKeyboardInputManagerMecabra compositionCompletionHandler](self, "compositionCompletionHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[TIKeyboardInputManagerMecabra compositionCompletionHandler](self, "compositionCompletionHandler");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v6[2](v6, v3);

    -[TIKeyboardInputManagerMecabra setCompositionCompletionHandler:](self, "setCompositionCompletionHandler:", 0);
  }
}

- (void)completeComposition
{
  void *v3;
  id v4;
  _BYTE v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v5 = 136315394;
    *(_QWORD *)&v5[4] = "-[TIKeyboardInputManagerMecabra(StackableInputManager) completeComposition]";
    *(_WORD *)&v5[12] = 2112;
    *(_QWORD *)&v5[14] = objc_opt_class();
    v4 = *(id *)&v5[14];
    _os_log_debug_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%s  %@ was completed", v5, 0x16u);

  }
  -[TIKeyboardInputManagerMecabra compositionCompletionHandler](self, "compositionCompletionHandler", *(_OWORD *)v5, *(_QWORD *)&v5[16], v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[TIKeyboardInputManagerMecabra _completeComposition:](self, "_completeComposition:", 1);
}

- (void)cancelComposition
{
  void *v3;
  id v4;
  _BYTE v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v5 = 136315394;
    *(_QWORD *)&v5[4] = "-[TIKeyboardInputManagerMecabra(StackableInputManager) cancelComposition]";
    *(_WORD *)&v5[12] = 2112;
    *(_QWORD *)&v5[14] = objc_opt_class();
    v4 = *(id *)&v5[14];
    _os_log_debug_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%s  %@ was canceled", v5, 0x16u);

  }
  -[TIKeyboardInputManagerMecabra compositionCompletionHandler](self, "compositionCompletionHandler", *(_OWORD *)v5, *(_QWORD *)&v5[16], v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[TIKeyboardInputManagerMecabra _completeComposition:](self, "_completeComposition:", 0);
}

- (void)tearDown
{
  void *v3;
  objc_super v4;

  +[TIWordSearch sharedOperationQueue](TIWordSearch, "sharedOperationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "waitUntilAllOperationsAreFinished");

  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManagerMecabra;
  -[TIKeyboardInputManager tearDown](&v4, sel_tearDown);
}

void __72__TIKeyboardInputManagerMecabra_StackableInputManager__composeTextWith___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (a2)
    objc_msgSend(WeakRetained, "commitComposition");
  else
    objc_msgSend(WeakRetained, "abortComposition");

}

+ (id)inputMethodWithChainedKeyboardInputManager:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithKeyboardInputManagerToChain:", v4);

  return v5;
}

@end
