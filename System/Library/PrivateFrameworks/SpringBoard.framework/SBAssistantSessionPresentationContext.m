@implementation SBAssistantSessionPresentationContext

- (BOOL)isAnyAssistantPresentablePresented
{
  return -[SBAssistantSessionPresentationContext isAssistantPresented](self, "isAssistantPresented")
      || -[SBAssistantSessionPresentationContext isAssistantAccessoryPresented](self, "isAssistantAccessoryPresented");
}

- (int64_t)modality
{
  int64_t result;
  uint64_t v3;

  result = (int64_t)self->_siriPresentationOptions;
  if (result)
  {
    v3 = objc_msgSend((id)result, "inputType");
    if (v3 == 1)
      return 2;
    else
      return v3 == 2;
  }
  return result;
}

- (BOOL)isKeyboardVisible
{
  return self->_keyboardVisible;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  SBMutableAssistantSessionPresentationContext *v4;
  void *v5;

  v4 = -[SBMutableAssistantSessionPresentationContext init](+[SBMutableAssistantSessionPresentationContext allocWithZone:](SBMutableAssistantSessionPresentationContext, "allocWithZone:", a3), "init");
  -[SBAssistantSessionPresentationContext setAssistantPresented:](v4, "setAssistantPresented:", -[SBAssistantSessionPresentationContext isAssistantPresented](self, "isAssistantPresented"));
  -[SBAssistantSessionPresentationContext siriPresentationOptions](self, "siriPresentationOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAssistantSessionPresentationContext setSiriPresentationOptions:](v4, "setSiriPresentationOptions:", v5);

  -[SBAssistantSessionPresentationContext setKeyboardVisible:](v4, "setKeyboardVisible:", -[SBAssistantSessionPresentationContext isKeyboardVisible](self, "isKeyboardVisible"));
  -[SBAssistantSessionPresentationContext setAssistantAccessoryPresented:](v4, "setAssistantAccessoryPresented:", -[SBAssistantSessionPresentationContext isAssistantAccessoryPresented](self, "isAssistantAccessoryPresented"));
  return v4;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  unint64_t v8;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:", self->_assistantPresented);
  v5 = (id)objc_msgSend(v3, "appendObject:", self->_siriPresentationOptions);
  v6 = (id)objc_msgSend(v3, "appendBool:", self->_keyboardVisible);
  v7 = (id)objc_msgSend(v3, "appendBool:", self->_assistantAccessoryPresented);
  v8 = objc_msgSend(v3, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  SBAssistantSessionPresentationContext *v4;
  void *v5;
  _BOOL8 assistantPresented;
  uint64_t v7;
  SBAssistantSessionPresentationContext *v8;
  id v9;
  SiriPresentationOptions *siriPresentationOptions;
  SBAssistantSessionPresentationContext *v11;
  id v12;
  _BOOL8 keyboardVisible;
  SBAssistantSessionPresentationContext *v14;
  id v15;
  _BOOL8 assistantAccessoryPresented;
  id v17;
  char v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  SBAssistantSessionPresentationContext *v24;
  _QWORD v25[4];
  SBAssistantSessionPresentationContext *v26;
  _QWORD v27[4];
  SBAssistantSessionPresentationContext *v28;
  _QWORD v29[4];
  SBAssistantSessionPresentationContext *v30;

  v4 = (SBAssistantSessionPresentationContext *)a3;
  if (v4 == self)
  {
    v18 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    assistantPresented = self->_assistantPresented;
    v7 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __49__SBAssistantSessionPresentationContext_isEqual___block_invoke;
    v29[3] = &unk_1E8EA3E78;
    v8 = v4;
    v30 = v8;
    v9 = (id)objc_msgSend(v5, "appendBool:counterpart:", assistantPresented, v29);
    siriPresentationOptions = self->_siriPresentationOptions;
    v27[0] = v7;
    v27[1] = 3221225472;
    v27[2] = __49__SBAssistantSessionPresentationContext_isEqual___block_invoke_2;
    v27[3] = &unk_1E8EA4320;
    v11 = v8;
    v28 = v11;
    v12 = (id)objc_msgSend(v5, "appendObject:counterpart:", siriPresentationOptions, v27);
    keyboardVisible = self->_keyboardVisible;
    v25[0] = v7;
    v25[1] = 3221225472;
    v25[2] = __49__SBAssistantSessionPresentationContext_isEqual___block_invoke_3;
    v25[3] = &unk_1E8EA3E78;
    v14 = v11;
    v26 = v14;
    v15 = (id)objc_msgSend(v5, "appendBool:counterpart:", keyboardVisible, v25);
    assistantAccessoryPresented = self->_assistantAccessoryPresented;
    v20 = v7;
    v21 = 3221225472;
    v22 = __49__SBAssistantSessionPresentationContext_isEqual___block_invoke_4;
    v23 = &unk_1E8EA3E78;
    v24 = v14;
    v17 = (id)objc_msgSend(v5, "appendBool:counterpart:", assistantAccessoryPresented, &v20);
    v18 = objc_msgSend(v5, "isEqual", v20, v21, v22, v23);

  }
  return v18;
}

uint64_t __49__SBAssistantSessionPresentationContext_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isAssistantPresented");
}

uint64_t __49__SBAssistantSessionPresentationContext_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "siriPresentationOptions");
}

uint64_t __49__SBAssistantSessionPresentationContext_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isKeyboardVisible");
}

uint64_t __49__SBAssistantSessionPresentationContext_isEqual___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isAssistantAccessoryPresented");
}

- (BOOL)isAssistantPresented
{
  return self->_assistantPresented;
}

- (void)setAssistantPresented:(BOOL)a3
{
  self->_assistantPresented = a3;
}

- (SiriPresentationOptions)siriPresentationOptions
{
  return self->_siriPresentationOptions;
}

- (void)setSiriPresentationOptions:(id)a3
{
  objc_storeStrong((id *)&self->_siriPresentationOptions, a3);
}

- (void)setKeyboardVisible:(BOOL)a3
{
  self->_keyboardVisible = a3;
}

- (BOOL)isAssistantAccessoryPresented
{
  return self->_assistantAccessoryPresented;
}

- (void)setAssistantAccessoryPresented:(BOOL)a3
{
  self->_assistantAccessoryPresented = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriPresentationOptions, 0);
}

@end
