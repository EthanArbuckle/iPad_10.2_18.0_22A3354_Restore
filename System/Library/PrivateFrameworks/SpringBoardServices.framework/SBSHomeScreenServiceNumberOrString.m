@implementation SBSHomeScreenServiceNumberOrString

- (SBSHomeScreenServiceNumberOrString)initWithNumberOrString:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  SBSHomeScreenServiceNumberOrString *v9;
  uint64_t v10;
  NSCopying *numberOrString;
  objc_super v13;

  v5 = a3;
  if (v5)
  {
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_self();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
        goto LABEL_6;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSHomeScreenServiceSpecification.m"), 106, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!numberOrString || [numberOrString isKindOfClass:[NSString self]] || [numberOrString isKindOfClass:[NSNumber self]]"));
    }

  }
LABEL_6:
  v13.receiver = self;
  v13.super_class = (Class)SBSHomeScreenServiceNumberOrString;
  v9 = -[SBSHomeScreenServiceNumberOrString init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v5, "copyWithZone:", 0);
    numberOrString = v9->_numberOrString;
    v9->_numberOrString = (NSCopying *)v10;

  }
  return v9;
}

- (SBSHomeScreenServiceNumberOrString)init
{
  return -[SBSHomeScreenServiceNumberOrString initWithNumberOrString:](self, "initWithNumberOrString:", 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_numberOrString, CFSTR("numberOrString"));
}

- (SBSHomeScreenServiceNumberOrString)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SBSHomeScreenServiceNumberOrString *v10;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithObjects:", v6, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v8, CFSTR("numberOrString"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[SBSHomeScreenServiceNumberOrString initWithNumberOrString:](self, "initWithNumberOrString:", v9);
  return v10;
}

- (NSCopying)numberOrString
{
  return self->_numberOrString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberOrString, 0);
}

@end
