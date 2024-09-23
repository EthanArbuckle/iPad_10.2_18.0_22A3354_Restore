@implementation PRPosterDescriptorHomeScreenConfiguration

+ (id)defaultHomeScreenConfigurationForProvider:(id)a3 role:(id)a4
{
  id v4;
  uint64_t v5;
  PRPosterDescriptorHomeScreenConfiguration *v6;

  v4 = a3;
  if (PFCurrentDeviceClass() == 1)
  {
    v5 = 0;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.EmojiPoster.EmojiPosterExtension")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.PhotosUIPrivate.PhotosPosterProvider"));
  }
  v6 = -[PRPosterDescriptorHomeScreenConfiguration initWithPreferredStyle:allowsModifyingLegibilityBlur:preferredSolidColors:preferredGradientColors:]([PRPosterDescriptorHomeScreenConfiguration alloc], "initWithPreferredStyle:allowsModifyingLegibilityBlur:preferredSolidColors:preferredGradientColors:", v5, objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.GradientPoster.GradientPosterExtension")) ^ 1, 0, 0);

  return v6;
}

- (PRPosterDescriptorHomeScreenConfiguration)initWithPreferredSolidColors:(id)a3
{
  return -[PRPosterDescriptorHomeScreenConfiguration initWithPreferredSolidColors:preferredGradientColors:](self, "initWithPreferredSolidColors:preferredGradientColors:", a3, a3);
}

- (PRPosterDescriptorHomeScreenConfiguration)initWithPreferredSolidColors:(id)a3 preferredGradientColors:(id)a4
{
  return -[PRPosterDescriptorHomeScreenConfiguration initWithPreferredStyle:allowsModifyingLegibilityBlur:preferredSolidColors:preferredGradientColors:](self, "initWithPreferredStyle:allowsModifyingLegibilityBlur:preferredSolidColors:preferredGradientColors:", 0, 1, a3, a4);
}

- (PRPosterDescriptorHomeScreenConfiguration)initWithPreferredStyle:(unint64_t)a3
{
  return -[PRPosterDescriptorHomeScreenConfiguration initWithPreferredStyle:allowsModifyingLegibilityBlur:preferredSolidColors:preferredGradientColors:](self, "initWithPreferredStyle:allowsModifyingLegibilityBlur:preferredSolidColors:preferredGradientColors:", a3, 1, 0, 0);
}

- (PRPosterDescriptorHomeScreenConfiguration)initWithPreferredStyle:(unint64_t)a3 allowsModifyingLegibilityBlur:(BOOL)a4 preferredSolidColors:(id)a5 preferredGradientColors:(id)a6
{
  id v10;
  id v11;
  PRPosterDescriptorHomeScreenConfiguration *v12;
  PRPosterDescriptorHomeScreenConfiguration *v13;
  uint64_t v14;
  NSArray *preferredSolidColors;
  uint64_t v16;
  NSArray *preferredGradientColors;
  objc_super v19;

  v10 = a5;
  v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)PRPosterDescriptorHomeScreenConfiguration;
  v12 = -[PRPosterDescriptorHomeScreenConfiguration init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_preferredStyle = a3;
    v12->_allowsModifyingLegibilityBlur = a4;
    v14 = objc_msgSend(v10, "copy");
    preferredSolidColors = v13->_preferredSolidColors;
    v13->_preferredSolidColors = (NSArray *)v14;

    v16 = objc_msgSend(v11, "copy");
    preferredGradientColors = v13->_preferredGradientColors;
    v13->_preferredGradientColors = (NSArray *)v16;

  }
  return v13;
}

- (PRPosterDescriptorHomeScreenConfiguration)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  PRPosterDescriptorHomeScreenConfiguration *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preferredStyle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "unsignedIntegerValue");
  else
    v7 = 0;
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("allowsModifyingLegibilityBlur")))
    v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowsModifyingLegibilityBlur"));
  else
    v8 = 1;
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("preferredSolidColors"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("preferredGradientColors"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PRPosterDescriptorHomeScreenConfiguration initWithPreferredStyle:allowsModifyingLegibilityBlur:preferredSolidColors:preferredGradientColors:](self, "initWithPreferredStyle:allowsModifyingLegibilityBlur:preferredSolidColors:preferredGradientColors:", v7, v8, v9, v10);

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", -[PRPosterDescriptorHomeScreenConfiguration preferredStyle](self, "preferredStyle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("preferredStyle"));

  objc_msgSend(v5, "encodeBool:forKey:", -[PRPosterDescriptorHomeScreenConfiguration allowsModifyingLegibilityBlur](self, "allowsModifyingLegibilityBlur"), CFSTR("allowsModifyingLegibilityBlur"));
  -[PRPosterDescriptorHomeScreenConfiguration preferredSolidColors](self, "preferredSolidColors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("preferredSolidColors"));

  -[PRPosterDescriptorHomeScreenConfiguration preferredGradientColors](self, "preferredGradientColors");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("preferredGradientColors"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PRPosterDescriptorHomeScreenConfiguration *v4;
  unint64_t v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  PRPosterDescriptorHomeScreenConfiguration *v9;

  v4 = [PRPosterDescriptorHomeScreenConfiguration alloc];
  v5 = -[PRPosterDescriptorHomeScreenConfiguration preferredStyle](self, "preferredStyle");
  v6 = -[PRPosterDescriptorHomeScreenConfiguration allowsModifyingLegibilityBlur](self, "allowsModifyingLegibilityBlur");
  -[PRPosterDescriptorHomeScreenConfiguration preferredSolidColors](self, "preferredSolidColors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterDescriptorHomeScreenConfiguration preferredGradientColors](self, "preferredGradientColors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PRPosterDescriptorHomeScreenConfiguration initWithPreferredStyle:allowsModifyingLegibilityBlur:preferredSolidColors:preferredGradientColors:](v4, "initWithPreferredStyle:allowsModifyingLegibilityBlur:preferredSolidColors:preferredGradientColors:", v5, v6, v7, v8);

  return v9;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  PRMutablePosterDescriptorHomeScreenConfiguration *v4;
  unint64_t v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  PRMutablePosterDescriptorHomeScreenConfiguration *v9;

  v4 = [PRMutablePosterDescriptorHomeScreenConfiguration alloc];
  v5 = -[PRPosterDescriptorHomeScreenConfiguration preferredStyle](self, "preferredStyle");
  v6 = -[PRPosterDescriptorHomeScreenConfiguration allowsModifyingLegibilityBlur](self, "allowsModifyingLegibilityBlur");
  -[PRPosterDescriptorHomeScreenConfiguration preferredSolidColors](self, "preferredSolidColors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterDescriptorHomeScreenConfiguration preferredGradientColors](self, "preferredGradientColors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PRPosterDescriptorHomeScreenConfiguration initWithPreferredStyle:allowsModifyingLegibilityBlur:preferredSolidColors:preferredGradientColors:](v4, "initWithPreferredStyle:allowsModifyingLegibilityBlur:preferredSolidColors:preferredGradientColors:", v5, v6, v7, v8);

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  PRPosterDescriptorHomeScreenConfiguration *v4;
  PRPosterDescriptorHomeScreenConfiguration *v5;
  PRPosterDescriptorHomeScreenConfiguration *v6;
  unint64_t v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  char v14;

  v4 = (PRPosterDescriptorHomeScreenConfiguration *)a3;
  v5 = v4;
  if (self == v4)
  {
    v14 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v7 = -[PRPosterDescriptorHomeScreenConfiguration preferredStyle](self, "preferredStyle");
    if (v7 != -[PRPosterDescriptorHomeScreenConfiguration preferredStyle](v6, "preferredStyle"))
      goto LABEL_10;
    v8 = -[PRPosterDescriptorHomeScreenConfiguration allowsModifyingLegibilityBlur](self, "allowsModifyingLegibilityBlur");
    if (v8 != -[PRPosterDescriptorHomeScreenConfiguration allowsModifyingLegibilityBlur](v6, "allowsModifyingLegibilityBlur"))goto LABEL_10;
    -[PRPosterDescriptorHomeScreenConfiguration preferredSolidColors](self, "preferredSolidColors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRPosterDescriptorHomeScreenConfiguration preferredSolidColors](v6, "preferredSolidColors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = BSEqualObjects();

    if (v11)
    {
      -[PRPosterDescriptorHomeScreenConfiguration preferredGradientColors](self, "preferredGradientColors");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRPosterDescriptorHomeScreenConfiguration preferredGradientColors](v6, "preferredGradientColors");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = BSEqualObjects();

    }
    else
    {
LABEL_10:
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t v14;
  id (*v15)(uint64_t, uint64_t);
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;

  -[PRPosterDescriptorHomeScreenConfiguration preferredSolidColors](self, "preferredSolidColors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterDescriptorHomeScreenConfiguration preferredGradientColors](self, "preferredGradientColors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "appendUnsignedInteger:", -[PRPosterDescriptorHomeScreenConfiguration preferredStyle](self, "preferredStyle"));
  v7 = (id)objc_msgSend(v5, "appendBool:", -[PRPosterDescriptorHomeScreenConfiguration allowsModifyingLegibilityBlur](self, "allowsModifyingLegibilityBlur"));
  v8 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __49__PRPosterDescriptorHomeScreenConfiguration_hash__block_invoke;
  v18[3] = &unk_1E2183FE8;
  v9 = v5;
  v19 = v9;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v18);
  v13 = v8;
  v14 = 3221225472;
  v15 = __49__PRPosterDescriptorHomeScreenConfiguration_hash__block_invoke_2;
  v16 = &unk_1E2183FE8;
  v17 = v9;
  v10 = v9;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v13);
  v11 = objc_msgSend(v10, "hash", v13, v14, v15, v16);

  return v11;
}

id __49__PRPosterDescriptorHomeScreenConfiguration_hash__block_invoke(uint64_t a1, uint64_t a2)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:", a2);
}

id __49__PRPosterDescriptorHomeScreenConfiguration_hash__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:", a2);
}

- (NSString)description
{
  id v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  PRPosterDescriptorHomeScreenConfiguration *v11;
  id v12;

  v3 = objc_alloc_init(MEMORY[0x1E0D01750]);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __56__PRPosterDescriptorHomeScreenConfiguration_description__block_invoke;
  v10 = &unk_1E2183900;
  v11 = self;
  v12 = v3;
  v4 = v3;
  objc_msgSend(v4, "appendProem:block:", self, &v7);
  objc_msgSend(v4, "description", v7, v8, v9, v10, v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

uint64_t __56__PRPosterDescriptorHomeScreenConfiguration_description__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendDescriptionToFormatter:", *(_QWORD *)(a1 + 40));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (PRPosterDescriptorHomeScreenConfiguration)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  PRPosterDescriptorHomeScreenConfiguration *v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preferredStyle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "unsignedIntegerValue");
  else
    v7 = 0;
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("allowsModifyingLegibilityBlur")))
    v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowsModifyingLegibilityBlur"));
  else
    v8 = 1;
  v9 = objc_opt_class();
  objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v9, objc_opt_class(), CFSTR("preferredSolidColors"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_class();
  objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v11, objc_opt_class(), CFSTR("preferredGradientColors"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PRPosterDescriptorHomeScreenConfiguration initWithPreferredStyle:allowsModifyingLegibilityBlur:preferredSolidColors:preferredGradientColors:](self, "initWithPreferredStyle:allowsModifyingLegibilityBlur:preferredSolidColors:preferredGradientColors:", v7, v8, v10, v12);

  return v13;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", -[PRPosterDescriptorHomeScreenConfiguration preferredStyle](self, "preferredStyle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("preferredStyle"));

  objc_msgSend(v5, "encodeBool:forKey:", -[PRPosterDescriptorHomeScreenConfiguration allowsModifyingLegibilityBlur](self, "allowsModifyingLegibilityBlur"), CFSTR("allowsModifyingLegibilityBlur"));
  -[PRPosterDescriptorHomeScreenConfiguration preferredSolidColors](self, "preferredSolidColors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("preferredSolidColors"));

  -[PRPosterDescriptorHomeScreenConfiguration preferredGradientColors](self, "preferredGradientColors");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("preferredGradientColors"));

}

- (void)appendDescriptionToFormatter:(id)a3
{
  unint64_t v4;
  __CFString *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;

  v11 = a3;
  v4 = -[PRPosterDescriptorHomeScreenConfiguration preferredStyle](self, "preferredStyle");
  if (v4 > 3)
    v5 = 0;
  else
    v5 = off_1E2186300[v4];
  objc_msgSend(v11, "appendString:withName:", v5, CFSTR("preferredStyle"));
  v6 = (id)objc_msgSend(v11, "appendBool:withName:", -[PRPosterDescriptorHomeScreenConfiguration allowsModifyingLegibilityBlur](self, "allowsModifyingLegibilityBlur"), CFSTR("allowsModifyingLegibilityBlur"));
  -[PRPosterDescriptorHomeScreenConfiguration preferredSolidColors](self, "preferredSolidColors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v11, "appendObject:withName:", v7, CFSTR("preferredSolidColors"));

  -[PRPosterDescriptorHomeScreenConfiguration preferredGradientColors](self, "preferredGradientColors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v11, "appendObject:withName:", v9, CFSTR("preferredGradientColors"));

}

- (BOOL)allowsModifyingLegibilityBlur
{
  return self->_allowsModifyingLegibilityBlur;
}

- (void)setAllowsModifyingLegibilityBlur:(BOOL)a3
{
  self->_allowsModifyingLegibilityBlur = a3;
}

- (unint64_t)preferredStyle
{
  return self->_preferredStyle;
}

- (void)setPreferredStyle:(unint64_t)a3
{
  self->_preferredStyle = a3;
}

- (NSArray)preferredSolidColors
{
  return self->_preferredSolidColors;
}

- (void)setPreferredSolidColors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)preferredGradientColors
{
  return self->_preferredGradientColors;
}

- (void)setPreferredGradientColors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredGradientColors, 0);
  objc_storeStrong((id *)&self->_preferredSolidColors, 0);
}

@end
