@implementation _UISheetActiveDetent

- (double)_value
{
  return self->__value;
}

- (_UISheetActiveDetent)initWithIdentifier:(id)a3 value:(double)a4
{
  id v6;
  _UISheetActiveDetent *v7;
  uint64_t v8;
  NSString *identifier;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UISheetActiveDetent;
  v7 = -[_UISheetActiveDetent init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    identifier = v7->__identifier;
    v7->__identifier = (NSString *)v8;

    v7->__value = a4;
  }

  return v7;
}

- (NSString)_identifier
{
  return self->__identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__identifier, 0);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(sel__identifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  NSStringFromSelector(sel__value);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIDescriptionBuilder descriptionForObject:keys:](UIDescriptionBuilder, "descriptionForObject:keys:", self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
