@implementation REElementDataSourceUpdate

- (REElementDataSourceUpdate)initWithElement:(id)a3 section:(id)a4 updateType:(unint64_t)a5
{
  id v9;
  id v10;
  REElementDataSourceUpdate *v11;
  REElementDataSourceUpdate *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)REElementDataSourceUpdate;
  v11 = -[REElementDataSourceUpdate init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_element, a3);
    objc_storeStrong((id *)&v12->_section, a4);
    v12->_type = a5;
  }

  return v12;
}

+ (id)reloadElement:(id)a3 inSection:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithElement:section:updateType:", v6, v5, 0);

  return v7;
}

+ (id)insertElement:(id)a3 inSection:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithElement:section:updateType:", v6, v5, 2);

  return v7;
}

+ (id)removeElement:(id)a3 inSection:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithElement:section:updateType:", v6, v5, 1);

  return v7;
}

+ (id)refreshElement:(id)a3 inSection:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithElement:section:updateType:", v6, v5, 4);

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  void *v5;
  unint64_t v6;

  v3 = -[REElement hash](self->_element, "hash");
  v4 = -[NSString hash](self->_section, "hash") ^ v3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_type);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ objc_msgSend(v5, "hash");

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[REElement isEqual:](self->_element, "isEqual:", v5[1])
      && -[NSString isEqualToString:](self->_section, "isEqualToString:", v5[3])
      && self->_type == v5[2];

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (REElement)element
{
  return self->_element;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)section
{
  return self->_section;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_section, 0);
  objc_storeStrong((id *)&self->_element, 0);
}

@end
