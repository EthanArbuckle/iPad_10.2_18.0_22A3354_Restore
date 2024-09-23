@implementation _UILegibilitySettings(SpringBoard)

- (uint64_t)sb_description
{
  return objc_msgSend(a1, "descriptionWithMultilinePrefix:", 0);
}

- (const)sb_styleString
{
  uint64_t v1;
  const __CFString *v2;

  v1 = objc_msgSend(a1, "style");
  v2 = CFSTR("Default");
  if (v1 == 2)
    v2 = CFSTR("Dark");
  if (v1 == 1)
    return CFSTR("Light");
  else
    return v2;
}

- (BOOL)sb_isEqualToLegibilitySettings:()SpringBoard
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a3;
  if (a1 == v4 || (objc_msgSend(a1, "isEqual:", v4) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(a1, "primaryColor");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "primaryColor");
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "secondaryColor");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "secondaryColor");
    v9 = objc_claimAutoreleasedReturnValue();
    v5 = ((objc_msgSend((id)v6, "_isSimilarToColor:withinPercentage:", v7, 0.01) & 1) != 0 || !(v6 | v7))
      && ((objc_msgSend((id)v8, "_isSimilarToColor:withinPercentage:", v9, 0.01) & 1) != 0 || !(v8 | v9));

  }
  return v5;
}

- (id)sb_copy
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = objc_alloc(MEMORY[0x1E0CEADE8]);
  v3 = objc_msgSend(a1, "style");
  objc_msgSend(a1, "primaryColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "secondaryColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "shadowColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v2, "initWithStyle:primaryColor:secondaryColor:shadowColor:", v3, v4, v5, v6);

  return v7;
}

- (id)succinctDescription
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "succinctDescriptionBuilder");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "build");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)succinctDescriptionBuilder
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sb_styleString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("style"));

  return v2;
}

- (id)descriptionWithMultilinePrefix:()SpringBoard
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "descriptionBuilderWithMultilinePrefix:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "build");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)descriptionBuilderWithMultilinePrefix:()SpringBoard
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  void *v11;

  v4 = a3;
  objc_msgSend(a1, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76___UILegibilitySettings_SpringBoard__descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E200E2A0;
  v6 = v5;
  v10 = v6;
  v11 = a1;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

@end
