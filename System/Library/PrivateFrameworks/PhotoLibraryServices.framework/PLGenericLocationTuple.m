@implementation PLGenericLocationTuple

- (PLGenericLocationTuple)initWithText:(id)a3 lookupIdentifier:(id)a4 indexCategory:(unint64_t)a5
{
  id v9;
  id v10;
  PLGenericLocationTuple *v11;
  uint64_t v12;
  NSString *text;
  uint64_t v14;
  NSString *lookupIdentifier;
  void *v17;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  if (!objc_msgSend(v9, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLGenericLocationTuple.m"), 15, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("text.length > 0"));

  }
  v18.receiver = self;
  v18.super_class = (Class)PLGenericLocationTuple;
  v11 = -[PLGenericLocationTuple init](&v18, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v9, "copy");
    text = v11->_text;
    v11->_text = (NSString *)v12;

    v14 = objc_msgSend(v10, "copy");
    lookupIdentifier = v11->_lookupIdentifier;
    v11->_lookupIdentifier = (NSString *)v14;

    v11->_indexCategory = a5;
  }

  return v11;
}

- (id)description
{
  void *v2;
  NSString *text;
  NSString *lookupIdentifier;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  text = self->_text;
  lookupIdentifier = self->_lookupIdentifier;
  PLDebugStringForSearchIndexCategory(self->_indexCategory);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Generic Location Tuple for text: %@, lookupIdentifier: %@, indexCategory: %@"), text, lookupIdentifier, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)text
{
  return self->_text;
}

- (NSString)lookupIdentifier
{
  return self->_lookupIdentifier;
}

- (unint64_t)indexCategory
{
  return self->_indexCategory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lookupIdentifier, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
