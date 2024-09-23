@implementation SBControlSystemActionProperties

+ (id)propertiesForControlInstance:(uint64_t)a1
{
  id v2;
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id result;
  void *v9;

  v2 = a2;
  v3 = (objc_class *)objc_opt_self();
  if (v2)
  {
    objc_msgSend(v2, "sb_viewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(v2, "control");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "descriptor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)-[SBControlSystemActionProperties _initWithViewModel:control:descriptor:]([v3 alloc], v4, v5, v6);

    }
    else
    {
      v7 = 0;
    }

    return v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("controlInstance != ((void *)0)"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[SBControlSystemActionProperties propertiesForControlInstance:].cold.1(sel_propertiesForControlInstance_);
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (uint64_t)_initWithViewModel:(void *)a3 control:(void *)a4 descriptor:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t result;
  void *v35;
  uint64_t v36;
  objc_super v37;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (!a1)
  {
LABEL_17:

    return (uint64_t)a1;
  }
  if (v7)
  {
    v37.receiver = a1;
    v37.super_class = (Class)SBControlSystemActionProperties;
    a1 = objc_msgSendSuper2(&v37, sel_init);
    if (a1)
    {
      objc_msgSend(v7, "title");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v10, "copy");
      v12 = v11;
      if (v11)
      {
        v13 = v11;
      }
      else
      {
        objc_msgSend(v9, "displayName");
        v13 = (id)objc_claimAutoreleasedReturnValue();
      }
      v14 = (void *)a1[1];
      a1[1] = v13;

      objc_msgSend(v7, "sb_secondaryText");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "copy");
      v17 = (void *)a1[2];
      a1[2] = v16;

      objc_msgSend(v7, "sb_secondaryTextColor");
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)a1[3];
      a1[3] = v18;

      objc_msgSend(v7, "sb_keyColor");
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)a1[4];
      a1[4] = v20;

      v36 = 0;
      objc_msgSend(v7, "sb_actionHintTextWithType:", &v36);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v22)
      {
        objc_msgSend(v9, "displayName");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 0;
      }
      v23 = objc_msgSend(v22, "copy");
      v24 = (void *)a1[5];
      a1[5] = v23;

      a1[6] = v36;
      v25 = objc_msgSend(v7, "isRedacted");
      if (objc_msgSend(v7, "isDisabled"))
        v25 |= 2uLL;
      v26 = objc_msgSend(v7, "hasError");
      v27 = v25 | 4;
      if (!v26)
        v27 = v25;
      a1[7] = v27;
      objc_msgSend(v7, "accessibilityIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if (v28)
      {
        v30 = v28;
      }
      else
      {
        objc_msgSend(v8, "kind");
        v30 = (id)objc_claimAutoreleasedReturnValue();
      }
      v31 = v30;

      v32 = objc_msgSend(v31, "copy");
      v33 = (void *)a1[8];
      a1[8] = v32;

    }
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("viewModel != ((void *)0)"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SBControlSystemActionProperties _initWithViewModel:control:descriptor:].cold.1(sel__initWithViewModel_control_descriptor_);
  objc_msgSend(objc_retainAutorelease(v35), "UTF8String");
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
  SBControlSystemActionProperties *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__SBControlSystemActionProperties_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_1E8E9E820;
  v7 = v4;
  v8 = self;
  v5 = v4;
  objc_msgSend(v5, "appendProem:block:", 0, v6);

}

id __64__SBControlSystemActionProperties_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "appendString:withName:skipIfEmpty:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("titleText"), 1);
  objc_msgSend(*(id *)(a1 + 32), "appendString:withName:skipIfEmpty:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("secondaryText"), 1);
  objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40), CFSTR("actionHintText"));
  v2 = *(void **)(a1 + 32);
  NSStringFromSBControlSystemActionHintType(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:", v3, CFSTR("actionHintType"));

  v4 = *(void **)(a1 + 32);
  NSStringFromSBControlSystemActionAttributes(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:skipIfEmpty:", v5, CFSTR("attributes"), 1);

  objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64), CFSTR("accessibilityIdentifier"));
  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("secondaryTextColor"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), CFSTR("keyColor"));
}

- (BOOL)isEqual:(id)a3
{
  SBControlSystemActionProperties *v4;
  SBControlSystemActionProperties *v5;
  char v6;

  v4 = (SBControlSystemActionProperties *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (BSEqualStrings()
        && BSEqualStrings()
        && BSEqualObjects()
        && BSEqualObjects()
        && BSEqualStrings()
        && self->_actionHintType == v5->_actionHintType
        && self->_attributes == v5->_attributes)
      {
        v6 = BSEqualStrings();
      }
      else
      {
        v6 = 0;
      }

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;

  v3 = -[NSString hash](self->_titleText, "hash");
  v4 = -[NSString hash](self->_secondaryText, "hash") ^ v3;
  v5 = -[UIColor hash](self->_secondaryTextColor, "hash");
  v6 = v4 ^ v5 ^ -[UIColor hash](self->_keyColor, "hash");
  v7 = v6 ^ -[NSString hash](self->_actionHintText, "hash") ^ self->_actionHintType ^ self->_attributes;
  return v7 ^ -[NSString hash](self->_accessibilityIdentifier, "hash");
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityIdentifier, 0);
  objc_storeStrong((id *)&self->_actionHintText, 0);
  objc_storeStrong((id *)&self->_keyColor, 0);
  objc_storeStrong((id *)&self->_secondaryTextColor, 0);
  objc_storeStrong((id *)&self->_secondaryText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
}

+ (void)propertiesForControlInstance:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_initWithViewModel:(const char *)a1 control:descriptor:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
