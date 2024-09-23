@implementation BSSettings(SBUISystemAperture)

- (uint64_t)SBUISA_contentRoleforSetting:()SBUISystemAperture
{
  void *v1;
  uint64_t v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;

  objc_msgSend(a1, "objectForSetting:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_opt_class();
  v3 = v1;
  if (v2)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  v6 = objc_msgSend(v5, "unsignedIntegerValue");
  return v6;
}

- (id)SBUISA_stringforSetting:()SBUISystemAperture
{
  void *v1;
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  objc_msgSend(a1, "objectForSetting:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_opt_class();
  v3 = v1;
  if (v2)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  return v5;
}

- (id)SBUISA_URLforSetting:()SBUISystemAperture
{
  void *v1;
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  objc_msgSend(a1, "objectForSetting:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_opt_class();
  v3 = v1;
  if (v2)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  return v5;
}

- (id)SBUISA_BSActionforSetting:()SBUISystemAperture
{
  void *v1;
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  objc_msgSend(a1, "objectForSetting:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_opt_class();
  v3 = v1;
  if (v2)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  return v5;
}

- (double)SBUISA_CGRectforSetting:()SBUISystemAperture
{
  void *v1;
  uint64_t v2;
  id v3;
  void *v4;
  id v5;
  double v6;
  double v7;

  objc_msgSend(a1, "objectForSetting:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_opt_class();
  v3 = v1;
  if (v2)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  objc_msgSend(v5, "CGRectValue");
  v7 = v6;

  return v7;
}

- (double)SBUISA_CGSizeforSetting:()SBUISystemAperture
{
  void *v1;
  uint64_t v2;
  id v3;
  void *v4;
  id v5;
  double v6;
  double v7;

  objc_msgSend(a1, "objectForSetting:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_opt_class();
  v3 = v1;
  if (v2)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  objc_msgSend(v5, "CGSizeValue");
  v7 = v6;

  return v7;
}

- (uint64_t)SBUISA_layoutModeforSetting:()SBUISystemAperture
{
  void *v1;
  uint64_t v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;

  objc_msgSend(a1, "objectForSetting:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_opt_class();
  v3 = v1;
  if (v2)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  v6 = objc_msgSend(v5, "integerValue");
  return v6;
}

- (uint64_t)SBUISA_contextIdforSetting:()SBUISystemAperture
{
  void *v1;
  uint64_t v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;

  objc_msgSend(a1, "objectForSetting:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_opt_class();
  v3 = v1;
  if (v2)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  v6 = objc_msgSend(v5, "unsignedIntValue");
  return v6;
}

- (uint64_t)SBUISA_renderingIdforSetting:()SBUISystemAperture
{
  void *v1;
  uint64_t v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;

  objc_msgSend(a1, "objectForSetting:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_opt_class();
  v3 = v1;
  if (v2)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  v6 = objc_msgSend(v5, "unsignedLongLongValue");
  return v6;
}

- (double)SBUISA_directionalEdgeInsetsforSetting:()SBUISystemAperture
{
  void *v1;
  uint64_t v2;
  id v3;
  void *v4;
  id v5;
  double v6;
  double v7;

  objc_msgSend(a1, "objectForSetting:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_opt_class();
  v3 = v1;
  if (v2)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  objc_msgSend(v5, "directionalEdgeInsetsValue");
  v7 = v6;

  return v7;
}

- (id)SBUISA_backgroundActivityIdentifiersForSetting:()SBUISystemAperture
{
  void *v1;
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  objc_msgSend(a1, "objectForSetting:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_opt_class();
  v3 = v1;
  if (v2)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  return v5;
}

- (uint64_t)SBUISA_customLayoutModeforSetting:()SBUISystemAperture
{
  void *v1;
  uint64_t v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;

  objc_msgSend(a1, "objectForSetting:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_opt_class();
  v3 = v1;
  if (v2)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  v6 = objc_msgSend(v5, "integerValue");
  return v6;
}

- (uint64_t)SBUISA_presentationBehaviorsForSetting:()SBUISystemAperture
{
  void *v1;
  uint64_t v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;

  objc_msgSend(a1, "objectForSetting:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_opt_class();
  v3 = v1;
  if (v2)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  v6 = objc_msgSend(v5, "unsignedIntegerValue");
  return v6;
}

- (id)SBUISA_UIColorForSetting:()SBUISystemAperture
{
  void *v1;
  uint64_t v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;

  objc_msgSend(a1, "objectForSetting:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_opt_class();
  v3 = v1;
  if (v2)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CEA478];
    objc_msgSend(v5, "red");
    v8 = v7;
    objc_msgSend(v5, "green");
    v10 = v9;
    objc_msgSend(v5, "blue");
    v12 = v11;
    objc_msgSend(v5, "alpha");
    objc_msgSend(v6, "colorWithRed:green:blue:alpha:", v8, v10, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)SBUI_systemApertureDescription
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  uint64_t v11;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __64__BSSettings_SBUISystemAperture__SBUI_systemApertureDescription__block_invoke;
  v9 = &unk_1E4C3E6A0;
  v10 = v2;
  v11 = a1;
  v3 = v2;
  objc_msgSend(v3, "appendBodySectionWithName:multilinePrefix:block:", 0, 0, &v6);
  objc_msgSend(v3, "build", v6, v7, v8, v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)SBUI_systemApertureDescriptionOfDiffFromSettings:()SBUISystemAperture
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v4 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __83__BSSettings_SBUISystemAperture__SBUI_systemApertureDescriptionOfDiffFromSettings___block_invoke;
  v13 = &unk_1E4C3F660;
  v14 = a1;
  v6 = v4;
  v15 = v6;
  v7 = v5;
  v16 = v7;
  v17 = &v18;
  objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", 0, 0, &v10);
  if (*((_BYTE *)v19 + 24))
  {
    objc_msgSend(v7, "build", v10, v11, v12, v13, v14, v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  _Block_object_dispose(&v18, 8);
  return v8;
}

@end
