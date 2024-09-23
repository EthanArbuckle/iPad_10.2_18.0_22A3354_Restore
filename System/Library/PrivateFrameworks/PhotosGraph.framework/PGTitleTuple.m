@implementation PGTitleTuple

- (PGTitleTuple)initWithWithTitle:(id)a3 subtitle:(id)a4 locationNames:(id)a5
{
  id v9;
  id v10;
  id v11;
  PGTitleTuple *v12;
  PGTitleTuple *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PGTitleTuple;
  v12 = -[PGTitleTuple init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_title, a3);
    objc_storeStrong((id *)&v13->_subtitle, a4);
    objc_storeStrong((id *)&v13->_locationNames, a5);
  }

  return v13;
}

- (PGTitleTuple)initWithWithTitle:(id)a3 subtitle:(id)a4
{
  return -[PGTitleTuple initWithWithTitle:subtitle:locationNames:](self, "initWithWithTitle:subtitle:locationNames:", a3, a4, 0);
}

- (BOOL)isEqual:(id)a3
{
  PGTitleTuple *v4;
  uint64_t v5;
  char v6;
  PGTitle *title;
  uint64_t v8;
  void *v9;
  PGTitle *v10;
  void *v11;
  PGTitle *subtitle;
  uint64_t v13;
  void *v14;
  PGTitle *v15;
  void *v16;
  NSArray *locationNames;
  NSArray *v18;
  NSArray *v19;
  void *v20;

  v4 = (PGTitleTuple *)a3;
  if (self == v4)
  {
    v6 = 1;
    goto LABEL_17;
  }
  v5 = objc_opt_class();
  if (v5 != objc_opt_class())
    goto LABEL_3;
  title = self->_title;
  -[PGTitleTuple title](v4, "title");
  v8 = objc_claimAutoreleasedReturnValue();
  if (title == (PGTitle *)v8)
  {

  }
  else
  {
    v9 = (void *)v8;
    v10 = self->_title;
    -[PGTitleTuple title](v4, "title");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = -[PGTitle isEqual:](v10, "isEqual:", v11);

    if (!(_DWORD)v10)
      goto LABEL_3;
  }
  subtitle = self->_subtitle;
  -[PGTitleTuple subtitle](v4, "subtitle");
  v13 = objc_claimAutoreleasedReturnValue();
  if (subtitle != (PGTitle *)v13)
  {
    v14 = (void *)v13;
    v15 = self->_subtitle;
    -[PGTitleTuple subtitle](v4, "subtitle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v15) = -[PGTitle isEqual:](v15, "isEqual:", v16);

    if ((_DWORD)v15)
      goto LABEL_13;
LABEL_3:
    v6 = 0;
    goto LABEL_17;
  }

LABEL_13:
  locationNames = self->_locationNames;
  -[PGTitleTuple locationNames](v4, "locationNames");
  v18 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (locationNames == v18)
  {
    v6 = 1;
  }
  else
  {
    v19 = self->_locationNames;
    -[PGTitleTuple locationNames](v4, "locationNames");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[NSArray isEqual:](v19, "isEqual:", v20);

  }
LABEL_17:

  return v6;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTitle description](self->_title, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTitle description](self->_subtitle, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> title: %@, subtitle: %@"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (PGTitle)title
{
  return self->_title;
}

- (PGTitle)subtitle
{
  return self->_subtitle;
}

- (NSArray)locationNames
{
  return self->_locationNames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationNames, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
