@implementation PREditorLookSwitchingAssertion

- (PREditorLookSwitchingAssertion)initWithEditor:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  PREditorLookSwitchingAssertion *v8;
  PREditorLookSwitchingAssertion *v9;
  uint64_t v10;
  NSString *reason;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PREditorLookSwitchingAssertion;
  v8 = -[PREditorLookSwitchingAssertion init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_editor, v6);
    v10 = objc_msgSend(v7, "copy");
    reason = v9->_reason;
    v9->_reason = (NSString *)v10;

  }
  return v9;
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

  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)invalidate
{
  id v3;

  if (!-[PREditorLookSwitchingAssertion isInvalidated](self, "isInvalidated"))
  {
    -[PREditorLookSwitchingAssertion editor](self, "editor");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeLookSwitchingAssertion:", self);
    -[PREditorLookSwitchingAssertion setInvalidated:](self, "setInvalidated:", 1);

  }
}

- (PREditor)editor
{
  return (PREditor *)objc_loadWeakRetained((id *)&self->_editor);
}

- (NSString)reason
{
  return self->_reason;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_destroyWeak((id *)&self->_editor);
}

@end
