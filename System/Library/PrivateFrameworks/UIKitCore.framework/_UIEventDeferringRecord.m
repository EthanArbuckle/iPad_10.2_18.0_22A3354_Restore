@implementation _UIEventDeferringRecord

- (id)_initWithDescriptor:(void *)a3 invalidationToken:(void *)a4 deferringToken:(uint64_t)a5 recordingManagerPointer:(void *)a6 recreationReasons:
{
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  objc_super v17;

  if (!a1)
    return 0;
  v17.receiver = a1;
  v17.super_class = (Class)_UIEventDeferringRecord;
  v11 = objc_msgSendSuper2(&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(a2, "copy");
    v13 = (void *)*((_QWORD *)v11 + 2);
    *((_QWORD *)v11 + 2) = v12;

    objc_storeStrong((id *)v11 + 3, a3);
    objc_storeWeak((id *)v11 + 4, a4);
    *((_QWORD *)v11 + 5) = a5;
    v14 = objc_msgSend(a6, "mutableCopy");
    v15 = (void *)*((_QWORD *)v11 + 1);
    *((_QWORD *)v11 + 1) = v14;

  }
  return v11;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_UIEventDeferringRecord descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  _UIEventDeferringRecord *v14;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActiveMultilinePrefix:", a3);
  v6 = (id)objc_msgSend(v5, "appendBool:withName:", -[_UIEventDeferringRecord needsRecreation](self), CFSTR("needsRecreation"));
  v7 = (id)objc_msgSend(v5, "appendUnsignedInteger:withName:", -[NSMutableSet count](self->_recreationReasons, "count"), CFSTR("recreationReasons.count"));
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65___UIEventDeferringRecord_descriptionBuilderWithMultilinePrefix___block_invoke;
  v12[3] = &unk_1E16B1B50;
  v8 = v5;
  v13 = v8;
  v14 = self;
  v9 = (id)objc_msgSend(v8, "modifyBody:", v12);
  v10 = v8;

  return v10;
}

- (BOOL)needsRecreation
{
  void *v1;
  _BOOL8 v2;

  if (!a1 || !a1[1])
    return 0;
  -[_UIEventDeferringRecord recreationReasons](a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "count") != 0;

  return v2;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_deferringToken);
  objc_storeStrong((id *)&self->_invalidationToken, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_recreationReasons, 0);
}

- (_QWORD)recreationReasons
{
  void *v1;

  if (a1)
  {
    v1 = (void *)a1[1];
    if (v1)
      return (id)objc_msgSend(v1, "copy");
    a1 = (_QWORD *)objc_opt_new();
  }
  return a1;
}

- (_UIEventDeferringRecord)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIEventDeferringRecord.m"), 56, CFSTR("%s: init is not allowed on _UIEventDeferringRecord"), "-[_UIEventDeferringRecord init]");

  return 0;
}

- (uint64_t)addRecreationReason:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  if (result)
  {
    v3 = result;
    v4 = *(void **)(result + 8);
    if (!v4)
    {
      v5 = objc_opt_new();
      v6 = *(void **)(v3 + 8);
      *(_QWORD *)(v3 + 8) = v5;

      v4 = *(void **)(v3 + 8);
    }
    if (objc_msgSend(v4, "containsObject:", a2))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", sel_addRecreationReason_, v3, CFSTR("_UIEventDeferringRecord.m"), 84, CFSTR("%s: Invalid to mark a record as needing recreation for the same reason twice: %@"), "-[_UIEventDeferringRecord addRecreationReason:]", v3);

    }
    return objc_msgSend(*(id *)(v3 + 8), "addObject:", a2);
  }
  return result;
}

- (NSString)debugDescription
{
  return (NSString *)-[_UIEventDeferringRecord debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[_UIEventDeferringRecord succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  id v11;
  id v12;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[_UIEventDeferringRecord needsRecreation](self), CFSTR("needsRecreation"));
  v5 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[NSMutableSet count](self->_recreationReasons, "count"), CFSTR("recreationReasons.count"));
  -[_UIEventDeferringDescriptor succinctDescription](self->_descriptor, "succinctDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("descriptor"));

  v8 = (id)objc_msgSend(v3, "appendObject:withName:", self->_invalidationToken, CFSTR("invalidationToken"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_deferringToken);
  objc_msgSend(WeakRetained, "succinctDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v3, "appendObject:withName:", v10, CFSTR("deferringToken"));

  v12 = (id)objc_msgSend(v3, "appendPointer:withName:", self->_recordingManagerPointer, CFSTR("recordingManagerPointer"));
  return v3;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_UIEventDeferringRecord descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
