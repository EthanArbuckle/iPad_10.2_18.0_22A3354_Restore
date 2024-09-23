@implementation _UIEventSessionDynamicAccumulator

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
    v18 = accumulatorWithName_depth_block_delegate_allowedActionSourceTypes____s_category;
    if (!accumulatorWithName_depth_block_delegate_allowedActionSourceTypes____s_category)
    {
      v18 = __UILogCategoryGetNode("UIEventSessionActionAnalytics", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v18, (unint64_t *)&accumulatorWithName_depth_block_delegate_allowedActionSourceTypes____s_category);
    }
    if ((*(_BYTE *)v18 & 1) != 0)
    {
      v19 = *(NSObject **)(v18 + 8);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_185066000, v19, OS_LOG_TYPE_ERROR, "_UIEventSessionDynamicAccumulator: Created new accumulator!", v20, 2u);
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
  uint64_t (**v5)(_QWORD, _QWORD);
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  uint8_t buf[16];

  v4 = a3;
  if (os_variant_has_internal_diagnostics())
  {
    v15 = performIncreaseWithActions____s_category;
    if (!performIncreaseWithActions____s_category)
    {
      v15 = __UILogCategoryGetNode("UIEventSessionActionAnalytics", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v15, (unint64_t *)&performIncreaseWithActions____s_category);
    }
    if ((*(_BYTE *)v15 & 1) != 0)
    {
      v16 = *(NSObject **)(v15 + 8);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_ERROR, "_UIEventSessionDynamicAccumulator: increaseWithActions() called!", buf, 2u);
      }
    }
  }
  -[_UIEventSessionAccumulator block](self, "block");
  v5 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v6 = ((uint64_t (**)(_QWORD, id))v5)[2](v5, v4);

  if (v6)
  {
    -[_UIEventSessionDynamicAccumulator delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB37A0], "string");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count") + 3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __64___UIEventSessionDynamicAccumulator_performIncreaseWithActions___block_invoke;
      v17[3] = &unk_1E16C8E88;
      v18 = v8;
      v19 = v9;
      v20 = v4;
      v10 = v9;
      v11 = v8;
      objc_msgSend(v20, "enumerateObjectsWithOptions:usingBlock:", 2, v17);
      objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("Sequence"));
      -[_UIEventSessionAccumulator name](self, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v12, CFSTR("Action"));

      -[_UIEventSessionDynamicAccumulator delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIEventSessionAccumulator name](self, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "writeEventWithFields:andName:", v10, v14);

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
