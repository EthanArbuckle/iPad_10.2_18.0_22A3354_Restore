@implementation PSISynonym

- (PSISynonym)initWithText:(id)a3 category:(unint64_t)a4 owningGroupId:(unint64_t)a5 identifier:(id)a6
{
  id v10;
  id v11;
  PSISynonym *v12;
  uint64_t v13;
  NSString *text;
  uint64_t v15;
  NSString *identifier;
  objc_super v18;

  v10 = a3;
  v11 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PSISynonym;
  v12 = -[PSISynonym init](&v18, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    text = v12->_text;
    v12->_text = (NSString *)v13;

    v12->_category = a4;
    v12->_owningGroupId = a5;
    v15 = objc_msgSend(v11, "copy");
    identifier = v12->_identifier;
    v12->_identifier = (NSString *)v15;

  }
  return v12;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = self->_category ^ -[NSString hash](self->_text, "hash") ^ (self->_owningGroupId << 32);
  return v3 ^ -[NSString hash](self->_identifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  PSISynonym *v4;
  uint64_t v5;
  char v6;
  unint64_t owningGroupId;
  unint64_t category;
  unint64_t v9;
  unint64_t v10;
  PSISynonym *v11;
  char IsEqual;
  char v13;
  char v15;

  v4 = (PSISynonym *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      category = self->_category;
      owningGroupId = self->_owningGroupId;
      v10 = v4->_category;
      v9 = v4->_owningGroupId;
      v11 = v4;
      IsEqual = PLObjectIsEqual();

      v13 = PLObjectIsEqual();
      if (category == v10 && owningGroupId == v9)
        v15 = IsEqual;
      else
        v15 = 0;
      v6 = v15 & v13;
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("'%@' (%d) -> %d, %@"), self->_text, self->_category, self->_owningGroupId, self->_identifier);
}

- (NSString)text
{
  return self->_text;
}

- (unint64_t)category
{
  return self->_category;
}

- (unint64_t)owningGroupId
{
  return self->_owningGroupId;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
