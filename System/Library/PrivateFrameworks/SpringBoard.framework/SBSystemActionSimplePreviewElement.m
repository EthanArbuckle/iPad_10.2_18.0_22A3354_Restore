@implementation SBSystemActionSimplePreviewElement

- (SBSystemActionSimplePreviewElement)initWithSystemAction:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  SBSystemActionSimplePreviewElement *v19;
  void *v21;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("systemAction != ((void *)0)"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBSystemActionSimplePreviewElement initWithSystemAction:].cold.1(a2);
LABEL_12:
    objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D0960DD0);
  }
  v6 = v5;
  v7 = objc_alloc_init(MEMORY[0x1E0DAC6A8]);
  objc_msgSend(v6, "configuredAction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "leadingApertureView");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("A leading view should be provided for this action"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBSystemActionSimplePreviewElement initWithSystemAction:].cold.2(a2);
    goto LABEL_12;
  }
  v10 = (void *)v9;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAC6B0]), "initWithView:", v9);
  objc_msgSend(v7, "setLeadingContentViewProvider:", v11);
  objc_msgSend(v8, "trailingApertureView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    v15 = objc_alloc(MEMORY[0x1E0CEABB0]);
    v14 = (id)objc_msgSend(v15, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  }
  v16 = v14;

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAC6B0]), "initWithView:", v16);
  objc_msgSend(v7, "setTrailingContentViewProvider:", v17);
  objc_msgSend(v10, "keyColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[SBSystemActionSimplePreviewElement initWithSystemAction:contentProvider:keyColor:](self, "initWithSystemAction:contentProvider:keyColor:", v6, v7, v18);

  return v19;
}

- (SBSystemActionSimplePreviewElement)initWithSystemAction:(id)a3 contentProvider:(id)a4 keyColor:(id)a5
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  SBSAElementIdentification *v19;
  void *v20;
  SBSAElementIdentification *v21;
  SBSystemActionSimplePreviewElement *v22;
  SBSystemActionSimplePreviewElement *v23;
  SBSystemActionSimplePreviewElement *result;
  void *v25;
  objc_super v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    v13 = v12;
    objc_msgSend(v10, "configuredAction");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "componentsSeparatedByString:", CFSTR("."));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "lastObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("SBSystemAction-"), "stringByAppendingString:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = [SBSAElementIdentification alloc];
    objc_msgSend(v10, "hostBundleIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[SBSAElementIdentification initWithClientIdentifier:elementIdentifier:](v19, "initWithClientIdentifier:elementIdentifier:", v20, v18);

    v26.receiver = self;
    v26.super_class = (Class)SBSystemActionSimplePreviewElement;
    v22 = -[SBSystemApertureProvidedContentElement initWithIdentifier:contentProvider:](&v26, sel_initWithIdentifier_contentProvider_, v21, v11);
    v23 = v22;
    if (v22)
    {
      objc_storeStrong((id *)&v22->_keyColor, a5);
      objc_storeStrong((id *)&v23->_systemAction, a3);
      -[SBSystemApertureProvidedContentElement setMinimumSupportedLayoutMode:](v23, "setMinimumSupportedLayoutMode:", 1);
      -[SBSystemApertureProvidedContentElement setMaximumSupportedLayoutMode:](v23, "setMaximumSupportedLayoutMode:", 2);
      -[SBSystemApertureProvidedContentElement setPreferredLayoutMode:](v23, "setPreferredLayoutMode:", 2);
    }

    return v23;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("systemAction != ((void *)0)"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBSystemActionSimplePreviewElement initWithSystemAction:contentProvider:keyColor:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
    result = (SBSystemActionSimplePreviewElement *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

+ (id)defaultSymbolFont
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v0 = objc_opt_self();
  objc_msgSend(MEMORY[0x1E0DDA0E8], "defaultSymbolConfiguration");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend(v1, "weight"))
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "handleFailureInMethod:object:file:lineNumber:description:", sel_defaultSymbolFont, v0, CFSTR("SBSystemActionSimplePreviewElement.m"), 107, CFSTR("Unhandled symbol weight: %ld"), objc_msgSend(v1, "weight"));

      break;
  }
  v3 = (void *)MEMORY[0x1E0CEA5E8];
  objc_msgSend(v1, "pointSize");
  objc_msgSend(v3, "systemFontOfSize:weight:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setKeyColor:(uint64_t)a1
{
  id v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (a1 && (BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)(a1 + 168), a2);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CFSTR("SBSystemApertureNotificationUserInfoElementKey");
    v8[0] = a1;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("SBSystemApertureElementKeyColorDidInvalidateNotification"), 0, v6);

  }
}

- (BOOL)isMinimalPresentationPossible
{
  return 1;
}

- (BOOL)shouldSuppressElementWhilePresentingAppWithBundleId:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[SBSystemApertureProvidedContentElement clientIdentifier](self, "clientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v4);

  return v6;
}

- (UIColor)keyColor
{
  return self->_keyColor;
}

- (uint64_t)systemAction
{
  if (result)
    return *(_QWORD *)(result + 176);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemAction, 0);
  objc_storeStrong((id *)&self->_keyColor, 0);
}

- (void)initWithSystemAction:(const char *)a1 .cold.1(const char *a1)
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
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithSystemAction:(const char *)a1 .cold.2(const char *a1)
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
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithSystemAction:(const char *)a1 contentProvider:keyColor:.cold.1(const char *a1)
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
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
