@implementation PSIIndexToken

- (PSIIndexToken)initWithText:(id)a3 identifier:(id)a4 category:(signed __int16)a5 owningCategory:(signed __int16)a6
{
  unint64_t v11;
  unint64_t v12;
  PSIIndexToken *v13;
  uint64_t v14;
  NSString *text;
  uint64_t v16;
  NSString *identifier;
  void *v19;
  objc_super v20;

  v11 = (unint64_t)a3;
  v12 = (unint64_t)a4;
  if (!(v11 | v12))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PSIIndexToken.m"), 17, CFSTR("text and identifier cannot be both nil"));

  }
  v20.receiver = self;
  v20.super_class = (Class)PSIIndexToken;
  v13 = -[PSIIndexToken init](&v20, sel_init);
  if (v13)
  {
    v14 = objc_msgSend((id)v11, "copy");
    text = v13->_text;
    v13->_text = (NSString *)v14;

    v16 = objc_msgSend((id)v12, "copy");
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v16;

    v13->_category = a5;
    v13->_owningCategory = a6;
  }

  return v13;
}

- (id)description
{
  NSString *identifier;
  NSString *text;
  uint64_t v5;

  text = self->_text;
  identifier = self->_identifier;
  if (!text)
    goto LABEL_5;
  if (!identifier)
  {
    identifier = self->_text;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("'%@' (%d)"), identifier, self->_category, v5);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("'%@' / '%@' (%d)"), text, self->_identifier, self->_category);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)text
{
  return self->_text;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (signed)category
{
  return self->_category;
}

- (signed)owningCategory
{
  return self->_owningCategory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
