@implementation SBSystemActionCompoundPreviewAssertion

- (uint64_t)state
{
  if (result)
    return *(unsigned int *)(result + 56);
  return result;
}

- (_QWORD)initWithIdentifier:(void *)a3 stateDidChangeBlock:(void *)a4 eventHandlingBlock:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v18;
  void *v19;
  objc_super v20;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!a1)
    goto LABEL_7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("identifier != ((void *)0)"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBSystemActionCompoundPreviewAssertion initWithIdentifier:stateDidChangeBlock:eventHandlingBlock:].cold.1();
LABEL_16:
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D0BD34D8);
  }
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("stateDidChangeBlock != ((void *)0)"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBSystemActionCompoundPreviewAssertion initWithIdentifier:stateDidChangeBlock:eventHandlingBlock:].cold.2();
    objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D0BD353CLL);
  }
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("eventHandlingBlock != ((void *)0)"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBSystemActionCompoundPreviewAssertion initWithIdentifier:stateDidChangeBlock:eventHandlingBlock:].cold.3();
    goto LABEL_16;
  }
  v20.receiver = a1;
  v20.super_class = (Class)SBSystemActionCompoundPreviewAssertion;
  a1 = objc_msgSendSuper2(&v20, sel_init);
  if (a1)
  {
    v11 = objc_msgSend(v7, "copy");
    v12 = (void *)a1[8];
    a1[8] = v11;

    v13 = objc_msgSend(v8, "copy");
    v14 = (void *)a1[1];
    a1[1] = v13;

    v15 = objc_msgSend(v10, "copy");
    v16 = (void *)a1[2];
    a1[2] = v15;

  }
LABEL_7:

  return a1;
}

- (void)dealloc
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (id)acquireForReason:(uint64_t)a1
{
  id v3;
  void *v4;
  SBSystemActionPreviewAssertion *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("reason != ((void *)0)"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[SBSystemActionCompoundPreviewAssertion acquireForReason:].cold.1();
      objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D0BD385CLL);
    }
    v5 = [SBSystemActionPreviewAssertion alloc];
    v6 = MEMORY[0x1E0C809B0];
    v7 = *(void **)(a1 + 64);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __59__SBSystemActionCompoundPreviewAssertion_acquireForReason___block_invoke;
    v17[3] = &unk_1E8EBAE70;
    v17[4] = a1;
    v18 = v4;
    v15[0] = v6;
    v15[1] = 3221225472;
    v15[2] = __59__SBSystemActionCompoundPreviewAssertion_acquireForReason___block_invoke_2;
    v15[3] = &unk_1E8EBAE98;
    v15[4] = a1;
    v16 = v18;
    v13[0] = v6;
    v13[1] = 3221225472;
    v13[2] = __59__SBSystemActionCompoundPreviewAssertion_acquireForReason___block_invoke_3;
    v13[3] = &unk_1E8EBAE70;
    v13[4] = a1;
    v8 = v16;
    v14 = v8;
    v9 = -[SBSystemActionPreviewAssertion initWithIdentifier:forReason:expansionInvalidationBlock:urgencyInvalidationBlock:finalInvalidationBlock:](v5, v7, v8, v17, v15, v13);
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __59__SBSystemActionCompoundPreviewAssertion_acquireForReason___block_invoke_4;
    v12[3] = &unk_1E8EBAEC0;
    v12[4] = a1;
    objc_msgSend(v9, "addExpansionInvalidationBlock:", v12);
    objc_storeWeak((id *)(a1 + 24), v9);
    -[SBSystemActionCompoundPreviewAssertion _addAssertionReason:]((id *)a1, v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __59__SBSystemActionCompoundPreviewAssertion_acquireForReason___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (v1)
  {
    objc_msgSend(*(id *)(v1 + 40), "removeObject:", *(_QWORD *)(result + 40));
    return -[SBSystemActionCompoundPreviewAssertion _updateState](v1);
  }
  return result;
}

- (uint64_t)_removeExpansionReason:(uint64_t)result
{
  uint64_t v2;

  if (result)
  {
    v2 = result;
    objc_msgSend(*(id *)(result + 40), "removeObject:", a2);
    return -[SBSystemActionCompoundPreviewAssertion _updateState](v2);
  }
  return result;
}

uint64_t __59__SBSystemActionCompoundPreviewAssertion_acquireForReason___block_invoke_2(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (v1)
  {
    objc_msgSend(*(id *)(v1 + 48), "removeObject:", *(_QWORD *)(result + 40));
    return -[SBSystemActionCompoundPreviewAssertion _updateState](v1);
  }
  return result;
}

- (uint64_t)_removeUrgencyReason:(uint64_t)result
{
  uint64_t v2;

  if (result)
  {
    v2 = result;
    objc_msgSend(*(id *)(result + 48), "removeObject:", a2);
    return -[SBSystemActionCompoundPreviewAssertion _updateState](v2);
  }
  return result;
}

uint64_t __59__SBSystemActionCompoundPreviewAssertion_acquireForReason___block_invoke_3(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (v1)
  {
    objc_msgSend(*(id *)(v1 + 32), "removeObject:", *(_QWORD *)(result + 40));
    return -[SBSystemActionCompoundPreviewAssertion _updateState](v1);
  }
  return result;
}

- (uint64_t)_removePreviewingReason:(uint64_t)result
{
  uint64_t v2;

  if (result)
  {
    v2 = result;
    objc_msgSend(*(id *)(result + 32), "removeObject:", a2);
    return -[SBSystemActionCompoundPreviewAssertion _updateState](v2);
  }
  return result;
}

void __59__SBSystemActionCompoundPreviewAssertion_acquireForReason___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v5 = a2;
  if (!a3)
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
    {
      v7 = v5;
      (*(void (**)(void))(*(_QWORD *)(v6 + 16) + 16))();
      v5 = v7;
    }
  }

}

- (uint64_t)_sendEvent:(uint64_t)result
{
  if (result)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 16) + 16))();
  return result;
}

- (void)_addAssertionReason:(id *)a1
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;

  v3 = a2;
  if (a1)
  {
    v10 = v3;
    if (!a1[4])
    {
      objc_msgSend(MEMORY[0x1E0CB3550], "set");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = a1[4];
      a1[4] = (id)v4;

    }
    if (!a1[5])
    {
      objc_msgSend(MEMORY[0x1E0CB3550], "set");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = a1[5];
      a1[5] = (id)v6;

    }
    if (!a1[6])
    {
      objc_msgSend(MEMORY[0x1E0CB3550], "set");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = a1[6];
      a1[6] = (id)v8;

    }
    objc_msgSend(a1[4], "addObject:", v10);
    objc_msgSend(a1[5], "addObject:", v10);
    objc_msgSend(a1[6], "addObject:", v10);
    -[SBSystemActionCompoundPreviewAssertion _updateState]((uint64_t)a1);
    v3 = v10;
  }

}

- (uint64_t)_updateState
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id WeakRetained;
  char v5;
  uint64_t v6;

  if (result)
  {
    v1 = result;
    v2 = objc_msgSend(*(id *)(result + 32), "count");
    v3 = objc_msgSend(*(id *)(v1 + 40), "count");
    WeakRetained = objc_loadWeakRetained((id *)(v1 + 24));
    v5 = objc_msgSend(WeakRetained, "isProminent");
    v6 = objc_msgSend(*(id *)(v1 + 48), "count");

    if (!BSEqualBools()
      || !BSEqualBools()
      || !BSEqualBools()
      || (result = BSEqualBools(), (result & 1) == 0))
    {
      *(_BYTE *)(v1 + 56) = v2 != 0;
      *(_BYTE *)(v1 + 57) = v3 != 0;
      *(_BYTE *)(v1 + 58) = v5;
      *(_BYTE *)(v1 + 59) = v6 != 0;
      return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 8) + 16))();
    }
  }
  return result;
}

- (id)descriptionWithMultilinePrefix:(uint64_t)a1
{
  void *v1;
  void *v2;

  if (a1)
  {
    -[SBSystemActionCompoundPreviewAssertion succinctDescriptionBuilder](a1);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "build");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)succinctDescriptionBuilder
{
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "appendString:withName:", *(_QWORD *)(a1 + 64), CFSTR("identifier"));
    v3 = (id)objc_msgSend(v2, "appendObject:withName:", *(_QWORD *)(a1 + 32), CFSTR("previewingReasons"));
    v4 = (id)objc_msgSend(v2, "appendObject:withName:", *(_QWORD *)(a1 + 40), CFSTR("expansionReasons"));
    v5 = (id)objc_msgSend(v2, "appendObject:withName:", *(_QWORD *)(a1 + 48), CFSTR("urgencyReasons"));
    v6 = (id)objc_msgSend(v2, "appendBool:withName:", *(unsigned __int8 *)(a1 + 58), CFSTR("isProminent"));
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)descriptionBuilderWithMultilinePrefix:(void *)a1
{
  if (a1)
  {
    -[SBSystemActionCompoundPreviewAssertion succinctDescriptionBuilder]((uint64_t)a1);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_urgencyReasons, 0);
  objc_storeStrong((id *)&self->_expansionReasons, 0);
  objc_storeStrong((id *)&self->_previewingReasons, 0);
  objc_destroyWeak((id *)&self->_lastAcquiredAssertion);
  objc_storeStrong(&self->_eventHandlingBlock, 0);
  objc_storeStrong(&self->_stateDidChangeBlock, 0);
}

- (void)initWithIdentifier:stateDidChangeBlock:eventHandlingBlock:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithIdentifier:stateDidChangeBlock:eventHandlingBlock:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithIdentifier:stateDidChangeBlock:eventHandlingBlock:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)acquireForReason:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
