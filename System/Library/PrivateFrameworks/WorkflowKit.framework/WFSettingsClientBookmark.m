@implementation WFSettingsClientBookmark

- (WFSettingsClientBookmark)initWithBiomeBookmark:(id)a3
{
  id v5;
  WFSettingsClientBookmark *v6;
  WFSettingsClientBookmark *v7;
  WFSettingsClientBookmark *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFSettingsClientBookmark;
  v6 = -[WFSettingsClientBookmark init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_biomeBookmark, a3);
    v8 = v7;
  }

  return v7;
}

- (WFSettingsClientBookmark)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  WFSettingsClientBookmark *v8;

  v4 = (void *)MEMORY[0x1E0CB3510];
  v5 = a3;
  objc_msgSend(v4, "bm_allowedClassesForSecureCodingBMBookmark");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v6, CFSTR("biomeBookmark"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    self = -[WFSettingsClientBookmark initWithBiomeBookmark:](self, "initWithBiomeBookmark:", v7);
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFSettingsClientBookmark biomeBookmark](self, "biomeBookmark");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("biomeBookmark"));

}

- (BMBookmark)biomeBookmark
{
  return self->_biomeBookmark;
}

- (void)setBiomeBookmark:(id)a3
{
  objc_storeStrong((id *)&self->_biomeBookmark, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biomeBookmark, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WFSettingsClientBookmark)initWithActionReversalState:(id)a3
{
  id v5;
  void *v6;
  id v7;
  WFSettingsClientBookmark *v8;
  void *v9;

  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSettingsClientBookmark+WFActionReversalState.m"), 17, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reversalState"));

    goto LABEL_5;
  }
  v7 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_5:

    v7 = 0;
    v8 = 0;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v7, 0);
  v8 = (WFSettingsClientBookmark *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v8;
}

- (id)actionReversalState
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
}

@end
