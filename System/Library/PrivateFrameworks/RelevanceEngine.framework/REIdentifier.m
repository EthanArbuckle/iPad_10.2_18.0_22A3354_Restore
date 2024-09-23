@implementation REIdentifier

- (REIdentifier)initWithDataSource:(id)a3 section:(id)a4 identifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  REIdentifier *v11;
  uint64_t v12;
  NSString *dataSource;
  uint64_t v14;
  NSString *section;
  uint64_t v16;
  NSString *identifier;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSUInteger v21;
  objc_super v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)REIdentifier;
  v11 = -[REIdentifier init](&v23, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    dataSource = v11->_dataSource;
    v11->_dataSource = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    section = v11->_section;
    v11->_section = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v16;

    v18 = -[NSString hash](v11->_dataSource, "hash");
    v19 = -[NSString hash](v11->_section, "hash") ^ v18;
    v11->_hash = v19 ^ -[NSString hash](v11->_identifier, "hash");
    v20 = -[NSString length](v11->_dataSource, "length");
    v21 = -[NSString length](v11->_section, "length") + v20;
    v11->_length = v21 + -[NSString length](v11->_identifier, "length");
  }

  return v11;
}

- (BOOL)isEqualToString:(id)a3
{
  REIdentifier *v4;
  REIdentifier *v5;
  NSString *identifier;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  int v10;
  unsigned __int8 v11;
  NSString *dataSource;
  NSString *v13;
  NSString *v14;
  NSString *v15;
  int v16;
  NSString *section;
  NSString *v18;
  NSString *v19;
  NSString *v20;
  objc_super v22;

  v4 = (REIdentifier *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      identifier = self->_identifier;
      v7 = v5->_identifier;
      if (identifier == v7)
      {

      }
      else
      {
        v8 = v7;
        v9 = identifier;
        v10 = -[NSString isEqual:](v9, "isEqual:", v8);

        if (!v10)
          goto LABEL_11;
      }
      dataSource = self->_dataSource;
      v13 = v5->_dataSource;
      if (dataSource == v13)
      {

      }
      else
      {
        v14 = v13;
        v15 = dataSource;
        v16 = -[NSString isEqual:](v15, "isEqual:", v14);

        if (!v16)
        {
LABEL_11:
          v11 = 0;
LABEL_17:

          goto LABEL_18;
        }
      }
      section = self->_section;
      v18 = v5->_section;
      v19 = section;
      v20 = v19;
      if (v19 == v18)
        v11 = 1;
      else
        v11 = -[NSString isEqual:](v19, "isEqual:", v18);

      goto LABEL_17;
    }
    v22.receiver = self;
    v22.super_class = (Class)REIdentifier;
    v11 = -[REIdentifier isEqualToString:](&v22, sel_isEqualToString_, v4);
  }
LABEL_18:

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  REIdentifier *v4;
  BOOL v5;

  v4 = (REIdentifier *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[REIdentifier isEqualToString:](self, "isEqualToString:", v4);
  }

  return v5;
}

- (unint64_t)hash
{
  return self->_hash;
}

- (unint64_t)length
{
  return self->_length;
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  unint64_t v5;
  NSString *dataSource;
  unint64_t v7;
  unint64_t v8;

  v5 = -[NSString length](self->_dataSource, "length");
  dataSource = self->_dataSource;
  if (v5 <= a3
    && (a3 -= -[NSString length](dataSource, "length"),
        v7 = -[NSString length](self->_section, "length"),
        dataSource = self->_section,
        a3 >= v7))
  {
    v8 = a3 - -[NSString length](dataSource, "length");
    dataSource = self->_identifier;
  }
  else
  {
    v8 = a3;
  }
  return -[NSString characterAtIndex:](dataSource, "characterAtIndex:", v8);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@::%@::%@"), self->_dataSource, self->_section, self->_identifier);
}

- (NSString)dataSource
{
  return self->_dataSource;
}

- (NSString)section
{
  return self->_section;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_section, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
