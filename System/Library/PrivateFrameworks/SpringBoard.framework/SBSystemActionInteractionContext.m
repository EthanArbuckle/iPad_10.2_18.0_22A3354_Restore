@implementation SBSystemActionInteractionContext

- (uint64_t)initWithPreciseTimestamp:(uint64_t)a3 type:(void *)a4 suppressionStatus:
{
  id v8;
  id v9;
  id *v10;
  uint64_t result;
  void *v12;
  objc_super v13;

  v8 = a2;
  v9 = a4;
  if (!a1)
    goto LABEL_5;
  if (v8)
  {
    v13.receiver = (id)a1;
    v13.super_class = (Class)SBSystemActionInteractionContext;
    v10 = (id *)objc_msgSendSuper2(&v13, sel_init);
    a1 = (uint64_t)v10;
    if (v10)
    {
      objc_storeStrong(v10 + 1, a2);
      *(_QWORD *)(a1 + 16) = a3;
      objc_storeStrong((id *)(a1 + 24), a4);
    }
LABEL_5:

    return a1;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("timestamp != ((void *)0)"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SBSystemActionInteractionContext initWithPreciseTimestamp:type:suppressionStatus:].cold.1(sel_initWithPreciseTimestamp_type_suppressionStatus_, a1, (uint64_t)v12);
  objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
  result = _bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  SBSystemActionInteractionContext *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__SBSystemActionInteractionContext_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_1E8E9E820;
  v7 = v4;
  v8 = self;
  v5 = v4;
  objc_msgSend(v5, "appendProem:block:", 0, v6);

}

id __65__SBSystemActionInteractionContext_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("preciseTimestamp"));
  v3 = *(void **)(a1 + 32);
  NSStringFromSBSystemActionInteractionType(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("type"));

  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("suppressionStatus"));
}

- (BOOL)isEqual:(id)a3
{
  SBSystemActionInteractionContext *v4;
  void *v5;
  char isKindOfClass;
  SBSystemActionInteractionContext *v7;
  char v8;

  v4 = (SBSystemActionInteractionContext *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v7 = v4;
      if (-[NSDate isEqualToDate:](self->_preciseTimestamp, "isEqualToDate:", v7->_preciseTimestamp)
        && self->_type == v7->_type)
      {
        v8 = BSEqualObjects();
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  SBSystemActionSuppressionStatus *suppressionStatus;
  unint64_t v5;

  v3 = -[NSDate hash](self->_preciseTimestamp, "hash");
  suppressionStatus = self->_suppressionStatus;
  v5 = self->_type + v3;
  return v5 + -[SBSystemActionSuppressionStatus hash](suppressionStatus, "hash");
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suppressionStatus, 0);
  objc_storeStrong((id *)&self->_preciseTimestamp, 0);
}

- (void)initWithPreciseTimestamp:(const char *)a1 type:(uint64_t)a2 suppressionStatus:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("SBSystemActionInteractionContext.m");
  v16 = 1024;
  v17 = 36;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_1D0540000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
