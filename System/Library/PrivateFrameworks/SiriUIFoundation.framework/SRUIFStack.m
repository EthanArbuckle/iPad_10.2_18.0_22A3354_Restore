@implementation SRUIFStack

- (SRUIFStack)initWithArray:(id)a3
{
  id v4;
  SRUIFStack *v5;
  void *v6;
  void *v7;
  NSMutableArray *v8;
  NSMutableArray *elements;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SRUIFStack;
  v5 = -[SRUIFStack init](&v11, sel_init);
  if (v5)
  {
    v6 = (void *)objc_msgSend(v4, "mutableCopy");
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v8 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    }
    elements = v5->_elements;
    v5->_elements = v8;

  }
  return v5;
}

- (SRUIFStack)initWithStack:(id)a3
{
  void *v4;
  SRUIFStack *v5;

  objc_msgSend(a3, "_elements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SRUIFStack initWithArray:](self, "initWithArray:", v4);

  return v5;
}

- (SRUIFStack)init
{
  return -[SRUIFStack initWithArray:](self, "initWithArray:", MEMORY[0x24BDBD1A8]);
}

- (id)topObject
{
  void *v2;
  void *v3;

  -[SRUIFStack _elements](self, "_elements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSArray)allObjects
{
  void *v2;
  void *v3;

  -[SRUIFStack _elements](self, "_elements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (id)copy
{
  return -[SRUIFStack copyWithZone:](self, "copyWithZone:", 0);
}

- (NSMutableArray)_elements
{
  return self->_elements;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elements, 0);
}

@end
