@implementation SLShareableContentRepresentationCollection

- (SLShareableContentRepresentationCollection)initWithRepresentations:(id)a3 suggestedFileName:(id)a4
{
  id v6;
  id v7;
  SLShareableContentRepresentationCollection *v8;
  uint64_t v9;
  NSArray *representations;
  uint64_t v11;
  NSString *suggestedFileName;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SLShareableContentRepresentationCollection;
  v8 = -[SLShareableContentRepresentationCollection init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    representations = v8->_representations;
    v8->_representations = (NSArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    suggestedFileName = v8->_suggestedFileName;
    v8->_suggestedFileName = (NSString *)v11;

  }
  return v8;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[SLShareableContentRepresentationCollection suggestedFileName](self, "suggestedFileName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  v5 = (void *)MEMORY[0x1E0CB3940];
  if (v4)
  {
    -[SLShareableContentRepresentationCollection suggestedFileName](self, "suggestedFileName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLShareableContentRepresentationCollection representations](self, "representations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@: %@"), v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[SLShareableContentRepresentationCollection representations](self, "representations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (SLShareableContentRepresentationCollection)initWithBSXPCCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  SLShareableContentRepresentationCollection *v12;

  v4 = a3;
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  NSStringFromSelector(sel_representations);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_opt_class();
  NSStringFromSelector(sel_suggestedFileName);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[SLShareableContentRepresentationCollection initWithRepresentations:suggestedFileName:](self, "initWithRepresentations:suggestedFileName:", v8, v11);
  return v12;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[SLShareableContentRepresentationCollection representations](self, "representations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_representations);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeCollection:forKey:", v5, v6);

  -[SLShareableContentRepresentationCollection suggestedFileName](self, "suggestedFileName");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_suggestedFileName);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, v7);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SLShareableContentRepresentationCollection)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  SLShareableContentRepresentationCollection *v11;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_representations);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  NSStringFromSelector(sel_suggestedFileName);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[SLShareableContentRepresentationCollection initWithRepresentations:suggestedFileName:](self, "initWithRepresentations:suggestedFileName:", v7, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[SLShareableContentRepresentationCollection representations](self, "representations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_representations);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[SLShareableContentRepresentationCollection suggestedFileName](self, "suggestedFileName");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_suggestedFileName);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, v7);

}

- (NSArray)representations
{
  return self->_representations;
}

- (NSString)suggestedFileName
{
  return self->_suggestedFileName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedFileName, 0);
  objc_storeStrong((id *)&self->_representations, 0);
}

@end
