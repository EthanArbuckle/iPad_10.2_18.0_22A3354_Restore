@implementation _UIDeallocInvalidatable

- (_UIDeallocInvalidatable)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDeallocInvalidatable.m"), 29, CFSTR("%s: init is not allowed on %@"), "-[_UIDeallocInvalidatable init]", objc_opt_class());

  return 0;
}

- (id)initWithIdentifier:(char)a3 faultForDeallocInvalidation:(void *)a4 invalidationBlock:
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v17;
  void *v18;
  objc_super v19;

  v7 = a2;
  v8 = a4;
  v9 = v8;
  if (!a1)
    goto LABEL_6;
  if (v7)
  {
    if (v8)
      goto LABEL_4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithIdentifier_faultForDeallocInvalidation_invalidationBlock_, a1, CFSTR("_UIDeallocInvalidatable.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

    if (v9)
      goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithIdentifier_faultForDeallocInvalidation_invalidationBlock_, a1, CFSTR("_UIDeallocInvalidatable.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("invalidationBlock"));

LABEL_4:
  v19.receiver = a1;
  v19.super_class = (Class)_UIDeallocInvalidatable;
  a1 = objc_msgSendSuper2(&v19, sel_init);
  if (a1)
  {
    v10 = objc_msgSend(v7, "copy");
    v11 = (void *)*((_QWORD *)a1 + 4);
    *((_QWORD *)a1 + 4) = v10;

    *((_BYTE *)a1 + 8) = a3;
    v12 = objc_opt_new();
    v13 = (void *)*((_QWORD *)a1 + 2);
    *((_QWORD *)a1 + 2) = v12;

    v14 = objc_msgSend(v9, "copy");
    v15 = (void *)*((_QWORD *)a1 + 3);
    *((_QWORD *)a1 + 3) = v14;

  }
LABEL_6:

  return a1;
}

- (void)_invalidate
{
  id invalidationBlock;
  void *v5;

  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDeallocInvalidatable.m"), 56, CFSTR("Call must be made on main thread"));

  }
  if (-[BSAtomicSignal signal](self->_invalidationSignal, "signal"))
  {
    (*((void (**)(void))self->_invalidationBlock + 2))();
    invalidationBlock = self->_invalidationBlock;
    self->_invalidationBlock = 0;

  }
}

- (void)dealloc
{
  unint64_t v3;
  NSObject *v4;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  _UIDeallocInvalidatable *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (self->_faultForDeallocInvalidation
    && (-[BSAtomicSignal hasBeenSignalled](self->_invalidationSignal, "hasBeenSignalled") & 1) == 0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v8 = self;
        _os_log_fault_impl(&dword_185066000, v5, OS_LOG_TYPE_FAULT, "_UIInvalidatable deallocated without being invalidated: %@", buf, 0xCu);
      }

    }
    else
    {
      v3 = dealloc___s_category_8;
      if (!dealloc___s_category_8)
      {
        v3 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v3, (unint64_t *)&dealloc___s_category_8);
      }
      v4 = *(NSObject **)(v3 + 8);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v8 = self;
        _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_ERROR, "_UIInvalidatable deallocated without being invalidated: %@", buf, 0xCu);
      }
    }
  }
  -[_UIDeallocInvalidatable _invalidate](self, "_invalidate");
  v6.receiver = self;
  v6.super_class = (Class)_UIDeallocInvalidatable;
  -[_UIDeallocInvalidatable dealloc](&v6, sel_dealloc);
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _UIDeallocInvalidatable *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53___UIDeallocInvalidatable_appendDescriptionToStream___block_invoke;
  v6[3] = &unk_1E16B1B50;
  v7 = v4;
  v8 = self;
  v5 = v4;
  objc_msgSend(v5, "appendProem:block:", self, v6);

}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_invalidationBlock, 0);
  objc_storeStrong((id *)&self->_invalidationSignal, 0);
}

@end
