@implementation WBUAutoFillDisplayData

- (WBUAutoFillDisplayData)initWithLabel:(id)a3 fillMatches:(id)a4
{
  id v7;
  id v8;
  WBUAutoFillDisplayData *v9;
  WBUAutoFillDisplayData *v10;
  uint64_t v11;
  NSArray *fillMatches;
  WBUAutoFillDisplayData *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WBUAutoFillDisplayData;
  v9 = -[WBUAutoFillDisplayData init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_label, a3);
    v11 = objc_msgSend(v8, "copy");
    fillMatches = v10->_fillMatches;
    v10->_fillMatches = (NSArray *)v11;

    v13 = v10;
  }

  return v10;
}

- (id)addressStringForLabel:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[NSArray safari_mapObjectsUsingBlock:](self->_fillMatches, "safari_mapObjectsUsingBlock:", &__block_literal_global_1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __48__WBUAutoFillDisplayData_addressStringForLabel___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stringValue");
}

- (NSString)valueString
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;

  -[NSArray firstObject](self->_fillMatches, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "property");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("Address"));

  if (v5)
  {
    objc_msgSend(v3, "label");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBUAutoFillDisplayData addressStringForLabel:](self, "addressStringForLabel:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[WBUFormDataController valueStringForMatch:](WBUFormDataController, "valueStringForMatch:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v7;
}

- (NSString)property
{
  void *v2;
  void *v3;

  -[NSArray firstObject](self->_fillMatches, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "property");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBUAutoFillDisplayData)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  WBUAutoFillDisplayData *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("label"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("fillMatches"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[WBUAutoFillDisplayData initWithLabel:fillMatches:](self, "initWithLabel:fillMatches:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *label;
  id v5;

  label = self->_label;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", label, CFSTR("label"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fillMatches, CFSTR("fillMatches"));

}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (NSArray)fillMatches
{
  return self->_fillMatches;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fillMatches, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
