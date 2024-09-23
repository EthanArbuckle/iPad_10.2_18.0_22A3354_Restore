@implementation WGWidgetDatum

- (WGWidgetDatum)initWithExtension:(id)a3
{
  id v5;
  WGWidgetDatum *v6;
  WGWidgetDatum *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WGWidgetDatum;
  v6 = -[WGWidgetDatum init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_representedExtension, a3);

  return v7;
}

- (NSString)datumIdentifier
{
  return (NSString *)-[NSExtension identifier](self->_representedExtension, "identifier");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  WGWidgetDatum *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSExtension *representedExtension;
  char v12;

  v4 = a3;
  v5 = self;
  v6 = v4;
  v7 = v6;
  if (v5 && v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[WGWidgetDatum datumIdentifier](v5, "datumIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "datumIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if (!v10)
    {
      v12 = 0;
      goto LABEL_8;
    }
    representedExtension = v5->_representedExtension;
    objc_msgSend(v7, "representedExtension");
    v5 = (WGWidgetDatum *)objc_claimAutoreleasedReturnValue();
    v12 = -[NSExtension isEqual:](representedExtension, "isEqual:", v5);
  }
  else
  {

    v12 = 0;
  }

LABEL_8:
  return v12;
}

- (unint64_t)hash
{
  return -[NSExtension hash](self->_representedExtension, "hash");
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[NSExtension wg_description](self->_representedExtension, "wg_description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; representedExtension: %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSExtension)representedExtension
{
  return self->_representedExtension;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_representedExtension, 0);
}

@end
