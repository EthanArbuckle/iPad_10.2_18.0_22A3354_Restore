@implementation STBackgroundActivityVisualDescriptorColorRepresentation

- (STBackgroundActivityVisualDescriptorColorRepresentation)initWithPlistRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  STBackgroundActivityVisualDescriptorColorRepresentation *v8;
  STBackgroundActivityVisualDescriptorColorRepresentation *v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  NSObject *v24;
  int v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "bs_safeStringForKey:", CFSTR("SystemColorName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_safeArrayForKey:", CFSTR("RGBAColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_safeStringForKey:", CFSTR("_PatternColorKitImageName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    if (!v6)
    {
      if (!v7)
      {
        v9 = 0;
        goto LABEL_18;
      }
      v8 = -[STBackgroundActivityVisualDescriptorColorRepresentation initWithPatternColorKitImageName:](self, "initWithPatternColorKitImageName:", v7);
      goto LABEL_3;
    }
    objc_msgSend(v6, "bs_objectsOfClass:", objc_opt_class());
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count") == 3 || objc_msgSend(v10, "count") == 4)
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "doubleValue");
      v13 = v12;

      objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "doubleValue");
      v16 = v15;

      objc_msgSend(v10, "objectAtIndexedSubscript:", 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "doubleValue");
      v19 = v18;

      v20 = 1.0;
      if (objc_msgSend(v10, "count") == 4)
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", 3);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "doubleValue");
        v20 = v22;

      }
      objc_msgSend(MEMORY[0x1E0D01710], "colorWithRed:green:blue:alpha:", v13, v16, v19, v20);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        self = -[STBackgroundActivityVisualDescriptorColorRepresentation initWithBSColor:](self, "initWithBSColor:", v23);
        v9 = self;
LABEL_17:

        goto LABEL_18;
      }
    }
    else
    {

    }
    STSystemStatusLogBundleLoading();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v26 = 138543362;
      v27 = v10;
      _os_log_error_impl(&dword_1D12C7000, v24, OS_LOG_TYPE_ERROR, "Expected an RGB or RGBA color as an array of numbers, but got: '%{public}@'", (uint8_t *)&v26, 0xCu);
    }

    v23 = 0;
    v9 = 0;
    goto LABEL_17;
  }
  v8 = -[STBackgroundActivityVisualDescriptorColorRepresentation initWithSystemColorName:](self, "initWithSystemColorName:", v5);
LABEL_3:
  self = v8;
  v9 = self;
LABEL_18:

  return v9;
}

- (STBackgroundActivityVisualDescriptorColorRepresentation)initWithSystemColorName:(id)a3
{
  id v4;
  STBackgroundActivityVisualDescriptorColorRepresentation *v5;
  uint64_t v6;
  NSString *systemColorName;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STBackgroundActivityVisualDescriptorColorRepresentation;
  v5 = -[STBackgroundActivityVisualDescriptorColorRepresentation init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    systemColorName = v5->_systemColorName;
    v5->_systemColorName = (NSString *)v6;

  }
  return v5;
}

- (STBackgroundActivityVisualDescriptorColorRepresentation)initWithBSColor:(id)a3
{
  id v5;
  STBackgroundActivityVisualDescriptorColorRepresentation *v6;
  STBackgroundActivityVisualDescriptorColorRepresentation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STBackgroundActivityVisualDescriptorColorRepresentation;
  v6 = -[STBackgroundActivityVisualDescriptorColorRepresentation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_BSColor, a3);

  return v7;
}

- (STBackgroundActivityVisualDescriptorColorRepresentation)initWithPatternColorKitImageName:(id)a3
{
  id v4;
  STBackgroundActivityVisualDescriptorColorRepresentation *v5;
  uint64_t v6;
  NSString *patternColorKitImageName;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STBackgroundActivityVisualDescriptorColorRepresentation;
  v5 = -[STBackgroundActivityVisualDescriptorColorRepresentation init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    patternColorKitImageName = v5->_patternColorKitImageName;
    v5->_patternColorKitImageName = (NSString *)v6;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBackgroundActivityVisualDescriptorColorRepresentation systemColorName](self, "systemColorName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __67__STBackgroundActivityVisualDescriptorColorRepresentation_isEqual___block_invoke;
  v21[3] = &unk_1E91E4B00;
  v8 = v4;
  v22 = v8;
  v9 = (id)objc_msgSend(v5, "appendString:counterpart:", v6, v21);

  -[STBackgroundActivityVisualDescriptorColorRepresentation BSColor](self, "BSColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v7;
  v19[1] = 3221225472;
  v19[2] = __67__STBackgroundActivityVisualDescriptorColorRepresentation_isEqual___block_invoke_2;
  v19[3] = &unk_1E91E4AB0;
  v11 = v8;
  v20 = v11;
  v12 = (id)objc_msgSend(v5, "appendObject:counterpart:", v10, v19);

  -[STBackgroundActivityVisualDescriptorColorRepresentation patternColorKitImageName](self, "patternColorKitImageName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = __67__STBackgroundActivityVisualDescriptorColorRepresentation_isEqual___block_invoke_3;
  v17[3] = &unk_1E91E4B00;
  v18 = v11;
  v14 = v11;
  v15 = (id)objc_msgSend(v5, "appendString:counterpart:", v13, v17);

  LOBYTE(v13) = objc_msgSend(v5, "isEqual");
  return (char)v13;
}

uint64_t __67__STBackgroundActivityVisualDescriptorColorRepresentation_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "systemColorName");
}

uint64_t __67__STBackgroundActivityVisualDescriptorColorRepresentation_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "BSColor");
}

uint64_t __67__STBackgroundActivityVisualDescriptorColorRepresentation_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "patternColorKitImageName");
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  unint64_t v10;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBackgroundActivityVisualDescriptorColorRepresentation systemColorName](self, "systemColorName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendString:", v4);

  -[STBackgroundActivityVisualDescriptorColorRepresentation BSColor](self, "BSColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:", v6);

  -[STBackgroundActivityVisualDescriptorColorRepresentation patternColorKitImageName](self, "patternColorKitImageName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendString:", v8);

  v10 = objc_msgSend(v3, "hash");
  return v10;
}

- (NSString)description
{
  return (NSString *)-[STBackgroundActivityVisualDescriptorColorRepresentation descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STBackgroundActivityVisualDescriptorColorRepresentation succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STBackgroundActivityVisualDescriptorColorRepresentation descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STBackgroundActivityVisualDescriptorColorRepresentation _descriptionBuilderWithMultilinePrefix:forDebug:](self, "_descriptionBuilderWithMultilinePrefix:forDebug:", a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STBackgroundActivityVisualDescriptorColorRepresentation _descriptionBuilderWithMultilinePrefix:forDebug:](self, "_descriptionBuilderWithMultilinePrefix:forDebug:", a3, 0);
}

- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v4 = a4;
  v6 = a3;
  -[STBackgroundActivityVisualDescriptorColorRepresentation succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUseDebugDescription:", v4);
  objc_msgSend(v7, "setActiveMultilinePrefix:", v6);

  -[STBackgroundActivityVisualDescriptorColorRepresentation systemColorName](self, "systemColorName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendString:withName:skipIfEmpty:", v8, CFSTR("systemColorName"), 1);

  -[STBackgroundActivityVisualDescriptorColorRepresentation BSColor](self, "BSColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v7, "appendObject:withName:skipIfNil:", v9, CFSTR("BSColor"), 1);

  -[STBackgroundActivityVisualDescriptorColorRepresentation patternColorKitImageName](self, "patternColorKitImageName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendString:withName:skipIfEmpty:", v11, CFSTR("patternColorKitImageName"), 1);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[STBackgroundActivityVisualDescriptorColorRepresentation systemColorName](self, "systemColorName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("systemColorName"));

  -[STBackgroundActivityVisualDescriptorColorRepresentation BSColor](self, "BSColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("BSColor"));

  -[STBackgroundActivityVisualDescriptorColorRepresentation patternColorKitImageName](self, "patternColorKitImageName");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("patternColorKitImageName"));

}

- (STBackgroundActivityVisualDescriptorColorRepresentation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  STBackgroundActivityVisualDescriptorColorRepresentation *v8;
  STBackgroundActivityVisualDescriptorColorRepresentation *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("systemColorName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BSColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("patternColorKitImageName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v8 = -[STBackgroundActivityVisualDescriptorColorRepresentation initWithSystemColorName:](self, "initWithSystemColorName:", v5);
  }
  else if (v6)
  {
    v8 = -[STBackgroundActivityVisualDescriptorColorRepresentation initWithBSColor:](self, "initWithBSColor:", v6);
  }
  else
  {
    if (!v7)
    {
      v9 = 0;
      goto LABEL_8;
    }
    v8 = -[STBackgroundActivityVisualDescriptorColorRepresentation initWithPatternColorKitImageName:](self, "initWithPatternColorKitImageName:", v7);
  }
  self = v8;
  v9 = self;
LABEL_8:

  return v9;
}

- (NSString)systemColorName
{
  return self->_systemColorName;
}

- (NSString)patternColorKitImageName
{
  return self->_patternColorKitImageName;
}

- (BSColor)BSColor
{
  return self->_BSColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_BSColor, 0);
  objc_storeStrong((id *)&self->_patternColorKitImageName, 0);
  objc_storeStrong((id *)&self->_systemColorName, 0);
}

@end
