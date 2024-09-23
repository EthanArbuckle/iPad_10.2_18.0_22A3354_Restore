@implementation RESectionPath

+ (RESectionPath)sectionPathWithSectionName:(id)a3 element:(unint64_t)a4
{
  id v5;
  RESectionPath *v6;

  v5 = a3;
  v6 = -[RESectionPath initWithSectionName:element:]([RESectionPath alloc], "initWithSectionName:element:", v5, a4);

  return v6;
}

- (RESectionPath)init
{
  return -[RESectionPath initWithSectionName:element:](self, "initWithSectionName:element:", 0, 0);
}

- (RESectionPath)initWithSectionName:(id)a3 element:(unint64_t)a4
{
  id v6;
  RESectionPath *v7;
  uint64_t v8;
  NSString *sectionName;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RESectionPath;
  v7 = -[RESectionPath init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    sectionName = v7->_sectionName;
    v7->_sectionName = (NSString *)v8;

    v7->_element = a4;
  }

  return v7;
}

- (NSString)sectionName
{
  return (NSString *)(id)-[NSString copy](self->_sectionName, "copy");
}

- (unint64_t)element
{
  return self->_element;
}

- (unint64_t)hash
{
  return self->_element ^ -[NSString hash](self->_sectionName, "hash");
}

- (BOOL)isEqual:(id)a3
{
  RESectionPath *v4;
  RESectionPath *v5;
  RESectionPath *v6;
  NSString *sectionName;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  char v11;

  v4 = (RESectionPath *)a3;
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
      v6 = v5;
      if (self->_element == v5->_element)
      {
        sectionName = self->_sectionName;
        v8 = v5->_sectionName;
        v9 = sectionName;
        v10 = v9;
        if (v9 == v8)
          v11 = 1;
        else
          v11 = -[NSString isEqual:](v9, "isEqual:", v8);

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)RESectionPath;
  -[RESectionPath description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  REStringForSectionPath(self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[RESectionPath initWithSectionName:element:](+[RESectionPath allocWithZone:](RESectionPath, "allocWithZone:", a3), "initWithSectionName:element:", self->_sectionName, self->_element);
}

- (void)setElement:(unint64_t)a3
{
  self->_element = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionName, 0);
}

@end
