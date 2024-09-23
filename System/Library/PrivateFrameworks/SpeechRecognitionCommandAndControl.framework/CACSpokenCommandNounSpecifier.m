@implementation CACSpokenCommandNounSpecifier

- (CACSpokenCommandNounSpecifier)initWithType:(unsigned int)a3 items:(id)a4
{
  id v7;
  CACSpokenCommandNounSpecifier *v8;
  CACSpokenCommandNounSpecifier *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CACSpokenCommandNounSpecifier;
  v8 = -[CACSpokenCommandNounSpecifier init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_items, a4);
  }

  return v9;
}

- (CACSpokenCommandNounSpecifier)initWithType:(unsigned int)a3 item:(id)a4
{
  uint64_t v4;
  void *v6;
  CACSpokenCommandNounSpecifier *v7;

  v4 = *(_QWORD *)&a3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CACSpokenCommandNounSpecifier initWithType:items:](self, "initWithType:items:", v4, v6);

  return v7;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Type: %d, Items: %@"), self->_type, self->_items);
}

- (unsigned)type
{
  return self->_type;
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
}

@end
