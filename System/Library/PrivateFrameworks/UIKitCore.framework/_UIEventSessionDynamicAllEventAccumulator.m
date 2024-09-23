@implementation _UIEventSessionDynamicAllEventAccumulator

+ (id)accumulatorWithName:(id)a3 depth:(unint64_t)a4 block:(id)a5 delegate:(id)a6 allowedActionSourceTypes:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id *v16;
  unint64_t v18;
  NSObject *v19;
  uint8_t v20[16];

  v12 = a3;
  v13 = a5;
  v14 = a7;
  v15 = a6;
  if (os_variant_has_internal_diagnostics())
  {
    v18 = accumulatorWithName_depth_block_delegate_allowedActionSourceTypes____s_category_72;
    if (!accumulatorWithName_depth_block_delegate_allowedActionSourceTypes____s_category_72)
    {
      v18 = __UILogCategoryGetNode("UIEventSessionActionAnalytics", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v18, (unint64_t *)&accumulatorWithName_depth_block_delegate_allowedActionSourceTypes____s_category_72);
    }
    if ((*(_BYTE *)v18 & 1) != 0)
    {
      v19 = *(NSObject **)(v18 + 8);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_185066000, v19, OS_LOG_TYPE_ERROR, "_UIEventSessionDynamicAllEventAccumulator: Created new accumulator!", v20, 2u);
      }
    }
  }
  objc_msgSend(a1, "accumulatorWithName:depthRange:block:allowedActionSourceTypes:", v12, a4, 0, v13, v14);
  v16 = (id *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak(v16 + 8, v15);

  return v16;
}

- (void)performIncreaseWithActions:(id)a3
{
  id v4;
  void *v5;
  uint64_t (**v6)(_QWORD, _QWORD);
  uint64_t v7;
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
  unint64_t v21;
  NSObject *v22;
  void *v23;
  uint8_t v24[16];

  v4 = a3;
  if (os_variant_has_internal_diagnostics())
  {
    v21 = performIncreaseWithActions____s_category_73;
    if (!performIncreaseWithActions____s_category_73)
    {
      v21 = __UILogCategoryGetNode("UIEventSessionActionAnalytics", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v21, (unint64_t *)&performIncreaseWithActions____s_category_73);
    }
    if ((*(_BYTE *)v21 & 1) != 0)
    {
      v22 = *(NSObject **)(v21 + 8);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v24 = 0;
        _os_log_impl(&dword_185066000, v22, OS_LOG_TYPE_ERROR, "_UIEventSessionDynamicAllEventAccumulator: increaseWithActions() called!", v24, 2u);
      }
    }
  }
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIEventSessionAccumulator block](self, "block");
  v6 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v7 = ((uint64_t (**)(_QWORD, id))v6)[2](v6, v4);

  if (v7)
  {
    -[_UIEventSessionDynamicAllEventAccumulator delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "firstObject");
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = (void *)v9;
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v10, "hardwareKeyboardState"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("kbAtt"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v10, "magicKeyboardState"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("mkbAtt"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v10, "uiInterfaceOrientation"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("uiOrient"));

        objc_msgSend(v10, "sessionID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, CFSTR("sID"));

        if (os_variant_has_internal_diagnostics())
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v10, "sequenceNumber"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v23, CFSTR("seqN"));

        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v10, "source"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, CFSTR("src"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v10, "actionType"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, CFSTR("aTyp"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v10, "actionCount"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v18, CFSTR("aCnt"));

        -[_UIEventSessionDynamicAllEventAccumulator delegate](self, "delegate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIEventSessionAccumulator name](self, "name");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "writeEventWithFields:andName:", v11, v20);

      }
    }
  }

}

- (_UIEventSessionDynamicAccumulatorDelegate)delegate
{
  return (_UIEventSessionDynamicAccumulatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
