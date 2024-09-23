@implementation _UISheetPresentationControllerAppearance

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__smallestDimmedDetentIdentifier, 0);
  objc_storeStrong((id *)&self->__largestUndimmedDetentIdentifier, 0);
}

+ (id)appearancePreferringDimmingVisible:(BOOL)a3
{
  _UISheetPresentationControllerAppearance *v4;

  v4 = objc_alloc_init(_UISheetPresentationControllerAppearance);
  v4->__prefersDimmingVisible = a3;
  return v4;
}

- (BOOL)_isDimmingAlwaysVisible
{
  void *v3;
  BOOL v4;
  void *v5;

  if (!-[_UISheetPresentationControllerAppearance _prefersDimmingVisible](self, "_prefersDimmingVisible"))
    return 0;
  -[_UISheetPresentationControllerAppearance _largestUndimmedDetentIdentifier](self, "_largestUndimmedDetentIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    -[_UISheetPresentationControllerAppearance _smallestDimmedDetentIdentifier](self, "_smallestDimmedDetentIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 == 0;

  }
  return v4;
}

- (NSString)_smallestDimmedDetentIdentifier
{
  return self->__smallestDimmedDetentIdentifier;
}

- (NSString)_largestUndimmedDetentIdentifier
{
  return self->__largestUndimmedDetentIdentifier;
}

- (BOOL)_prefersDimmingVisible
{
  return self->__prefersDimmingVisible;
}

+ (_UISheetPresentationControllerAppearance)appearanceWithLargestUndimmedDetentIdentifier:(id)a3
{
  NSString *v3;
  _UISheetPresentationControllerAppearance *v4;
  NSString *largestUndimmedDetentIdentifier;

  v3 = (NSString *)a3;
  v4 = objc_alloc_init(_UISheetPresentationControllerAppearance);
  v4->__prefersDimmingVisible = 1;
  largestUndimmedDetentIdentifier = v4->__largestUndimmedDetentIdentifier;
  v4->__largestUndimmedDetentIdentifier = v3;

  return v4;
}

+ (_UISheetPresentationControllerAppearance)appearanceWithSmallestDimmedDetentIdentifier:(id)a3
{
  NSString *v3;
  _UISheetPresentationControllerAppearance *v4;
  NSString *smallestDimmedDetentIdentifier;

  v3 = (NSString *)a3;
  v4 = objc_alloc_init(_UISheetPresentationControllerAppearance);
  v4->__prefersDimmingVisible = 0;
  smallestDimmedDetentIdentifier = v4->__smallestDimmedDetentIdentifier;
  v4->__smallestDimmedDetentIdentifier = v3;

  return v4;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(sel__prefersDimmingVisible);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v3;
  NSStringFromSelector(sel__largestUndimmedDetentIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v4;
  NSStringFromSelector(sel__smallestDimmedDetentIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIDescriptionBuilder descriptionForObject:keys:](UIDescriptionBuilder, "descriptionForObject:keys:", self, v6, v9, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  int v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[_UISheetPresentationControllerAppearance _prefersDimmingVisible](self, "_prefersDimmingVisible");
    if (v6 != objc_msgSend(v5, "_prefersDimmingVisible"))
    {
      LOBYTE(v7) = 0;
LABEL_19:

      goto LABEL_20;
    }
    -[_UISheetPresentationControllerAppearance _largestUndimmedDetentIdentifier](self, "_largestUndimmedDetentIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_largestUndimmedDetentIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v8;
    v11 = v9;
    v12 = v11;
    if (v10 == v11)
    {

    }
    else
    {
      LOBYTE(v7) = 0;
      v13 = v11;
      v14 = v10;
      if (!v10 || !v11)
      {
LABEL_17:

LABEL_18:
        goto LABEL_19;
      }
      v7 = objc_msgSend(v10, "isEqual:", v11);

      if (!v7)
        goto LABEL_18;
    }
    -[_UISheetPresentationControllerAppearance _smallestDimmedDetentIdentifier](self, "_smallestDimmedDetentIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_smallestDimmedDetentIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v15;
    v17 = v16;
    v13 = v17;
    if (v14 == v17)
    {
      LOBYTE(v7) = 1;
    }
    else
    {
      LOBYTE(v7) = 0;
      if (v14 && v17)
        LOBYTE(v7) = objc_msgSend(v14, "isEqual:", v17);
    }

    goto LABEL_17;
  }
  LOBYTE(v7) = 0;
LABEL_20:

  return v7;
}

- (_UISheetPresentationControllerAppearance)initWithCoder:(id)a3
{
  id v4;
  _UISheetPresentationControllerAppearance *v5;
  uint64_t v6;
  NSString *largestUndimmedDetentIdentifier;
  uint64_t v8;
  NSString *smallestDimmedDetentIdentifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UISheetPresentationControllerAppearance;
  v5 = -[_UISheetPresentationControllerAppearance init](&v11, sel_init);
  if (v5)
  {
    v5->__prefersDimmingVisible = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_prefersDimmingVisible"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_largestUndimmedDetentIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    largestUndimmedDetentIdentifier = v5->__largestUndimmedDetentIdentifier;
    v5->__largestUndimmedDetentIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_smallestDimmedDetentIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    smallestDimmedDetentIdentifier = v5->__smallestDimmedDetentIdentifier;
    v5->__smallestDimmedDetentIdentifier = (NSString *)v8;

  }
  return v5;
}

- (_UISheetPresentationControllerAppearance)initWithBSXPCCoder:(id)a3
{
  id v4;
  _UISheetPresentationControllerAppearance *v5;
  uint64_t v6;
  NSString *largestUndimmedDetentIdentifier;
  uint64_t v8;
  NSString *smallestDimmedDetentIdentifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UISheetPresentationControllerAppearance;
  v5 = -[_UISheetPresentationControllerAppearance init](&v11, sel_init);
  if (v5)
  {
    v5->__prefersDimmingVisible = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_prefersDimmingVisible"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_largestUndimmedDetentIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    largestUndimmedDetentIdentifier = v5->__largestUndimmedDetentIdentifier;
    v5->__largestUndimmedDetentIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_smallestDimmedDetentIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    smallestDimmedDetentIdentifier = v5->__smallestDimmedDetentIdentifier;
    v5->__smallestDimmedDetentIdentifier = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[_UISheetPresentationControllerAppearance _prefersDimmingVisible](self, "_prefersDimmingVisible"), CFSTR("_prefersDimmingVisible"));
  -[_UISheetPresentationControllerAppearance _largestUndimmedDetentIdentifier](self, "_largestUndimmedDetentIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_largestUndimmedDetentIdentifier"));

  -[_UISheetPresentationControllerAppearance _smallestDimmedDetentIdentifier](self, "_smallestDimmedDetentIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("_smallestDimmedDetentIdentifier"));

}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[_UISheetPresentationControllerAppearance _prefersDimmingVisible](self, "_prefersDimmingVisible"), CFSTR("_prefersDimmingVisible"));
  -[_UISheetPresentationControllerAppearance _largestUndimmedDetentIdentifier](self, "_largestUndimmedDetentIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_largestUndimmedDetentIdentifier"));

  -[_UISheetPresentationControllerAppearance _smallestDimmedDetentIdentifier](self, "_smallestDimmedDetentIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("_smallestDimmedDetentIdentifier"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

@end
