@implementation PFParallaxPaletteSuggestion

- (PFParallaxPaletteSuggestion)initWithPrimaryColor:(id)a3 secondaryColor:(id)a4
{
  PFParallaxColor *v6;
  PFParallaxColor *v7;
  PFParallaxPaletteSuggestion *v8;
  PFParallaxColor *primaryColor;
  PFParallaxColor *v10;
  PFParallaxColor *secondaryColor;
  objc_super v13;

  v6 = (PFParallaxColor *)a3;
  v7 = (PFParallaxColor *)a4;
  v13.receiver = self;
  v13.super_class = (Class)PFParallaxPaletteSuggestion;
  v8 = -[PFParallaxPaletteSuggestion init](&v13, sel_init);
  primaryColor = v8->_primaryColor;
  v8->_primaryColor = v6;
  v10 = v6;

  secondaryColor = v8->_secondaryColor;
  v8->_secondaryColor = v7;

  return v8;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[PFParallaxPaletteSuggestion primaryColor](self, "primaryColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFParallaxPaletteSuggestion secondaryColor](self, "secondaryColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, primary: %@, secondary: %@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[PFParallaxPaletteSuggestion isEqualToSuggestion:](self, "isEqualToSuggestion:", v4);

  return v5;
}

- (BOOL)isEqualToSuggestion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;

  v4 = a3;
  -[PFParallaxPaletteSuggestion primaryColor](self, "primaryColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "primaryColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToParallaxColor:", v6);

  if (!v7)
    goto LABEL_7;
  -[PFParallaxPaletteSuggestion secondaryColor](self, "secondaryColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {

    goto LABEL_4;
  }
  objc_msgSend(v4, "secondaryColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
LABEL_7:
    v13 = 0;
    goto LABEL_9;
  }
LABEL_4:
  -[PFParallaxPaletteSuggestion secondaryColor](self, "secondaryColor");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[PFParallaxPaletteSuggestion secondaryColor](self, "secondaryColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "secondaryColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqualToParallaxColor:", v12);

  }
  else
  {
    v13 = 1;
  }
LABEL_9:

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[PFParallaxPaletteSuggestion secondaryColor](self, "secondaryColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PFParallaxPaletteSuggestion primaryColor](self, "primaryColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("primaryColor"));

  objc_msgSend(v7, "encodeBool:forKey:", v4 != 0, CFSTR("hasSecondaryColor"));
  if (v4)
  {
    -[PFParallaxPaletteSuggestion secondaryColor](self, "secondaryColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("secondaryColor"));

  }
}

- (PFParallaxPaletteSuggestion)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PFParallaxPaletteSuggestion *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("primaryColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasSecondaryColor")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("secondaryColor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v7 = -[PFParallaxPaletteSuggestion initWithPrimaryColor:secondaryColor:](self, "initWithPrimaryColor:secondaryColor:", v5, v6);

  return v7;
}

- (PFParallaxColor)primaryColor
{
  return self->_primaryColor;
}

- (PFParallaxColor)secondaryColor
{
  return self->_secondaryColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryColor, 0);
  objc_storeStrong((id *)&self->_primaryColor, 0);
}

+ (id)dictionaryWithPaletteSuggestion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
  objc_msgSend(v3, "primaryColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "RGBValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("primaryColor"));

  objc_msgSend(v3, "secondaryColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v3, "secondaryColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "RGBValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("secondaryColor"));

  }
  return v4;
}

+ (id)paletteSuggestionWithDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PFParallaxPaletteSuggestion *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("primaryColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      +[PFParallaxColor colorWithRGBValues:error:](PFParallaxColor, "colorWithRGBValues:error:", v6, a4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
        v11 = 0;
LABEL_19:

        goto LABEL_20;
      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("secondaryColor"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
LABEL_17:
            v11 = 0;
            goto LABEL_18;
          }
          v12 = (void *)MEMORY[0x1E0CB35C8];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid secondary color array: %@"), v5, *MEMORY[0x1E0CB2938]);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v9;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 7, v13);
          *a4 = (id)objc_claimAutoreleasedReturnValue();

          v11 = 0;
          goto LABEL_16;
        }
        +[PFParallaxColor colorWithRGBValues:error:](PFParallaxColor, "colorWithRGBValues:error:", v8, a4);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v9)
          goto LABEL_17;
      }
      else
      {
        v9 = 0;
      }
      v11 = -[PFParallaxPaletteSuggestion initWithPrimaryColor:secondaryColor:]([PFParallaxPaletteSuggestion alloc], "initWithPrimaryColor:secondaryColor:", v7, v9);
LABEL_16:

      goto LABEL_18;
    }
  }
  if (a4)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v17 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid primary color array: %@"), v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 7, v8);
    v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:

    goto LABEL_19;
  }
  v11 = 0;
LABEL_20:

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
