@implementation RENamedImage

- (RENamedImage)initWithName:(id)a3 inBundle:(id)a4
{
  id v6;
  id v7;
  RENamedImage *v8;
  uint64_t v9;
  NSString *name;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RENamedImage;
  v8 = -[RENamedImage init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    name = v8->_name;
    v8->_name = (NSString *)v9;

    objc_storeStrong((id *)&v8->_bundle, a4);
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithName:inBundle:", self->_name, self->_bundle);
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_name, "hash");
  return -[NSBundle hash](self->_bundle, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  int v9;
  char v10;
  NSBundle *v11;
  NSBundle *v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "name");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    v7 = self->_name;
    if (v6 == v7)
    {

    }
    else
    {
      v8 = v7;
      v9 = -[NSString isEqual:](v6, "isEqual:", v7);

      if (!v9)
      {
        v10 = 0;
LABEL_11:

        goto LABEL_12;
      }
    }
    objc_msgSend(v5, "bundle");
    v11 = (NSBundle *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11 == self->_bundle)
      v10 = 1;
    else
      v10 = -[NSBundle isEqual:](v11, "isEqual:");

    goto LABEL_11;
  }
  v10 = 0;
LABEL_12:

  return v10;
}

- (RENamedImage)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  RENamedImage *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[RENamedImage initWithName:inBundle:](self, "initWithName:inBundle:", v5, v7);

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  NSBundle *bundle;
  void *v5;
  id v6;

  bundle = self->_bundle;
  v6 = a3;
  -[NSBundle bundlePath](bundle, "bundlePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("bundle"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_name, CFSTR("name"));
}

- (NSString)name
{
  return self->_name;
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
