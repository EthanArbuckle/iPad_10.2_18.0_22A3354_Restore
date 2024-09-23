@implementation TUILinkEntityReference

- (TUILinkEntityReference)initWithModel:(id)a3 path:(id)a4 renderIdentifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  TUILinkEntityReference *v12;
  TUILinkEntityReference *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TUILinkEntityReference;
  v12 = -[TUILinkEntityReference init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_model, a3);
    objc_storeStrong((id *)&v13->_path, a4);
    objc_storeStrong((id *)&v13->_renderIdentifier, a5);
  }

  return v13;
}

- (NSString)type
{
  return -[TUILinkEntityModel type](self->_model, "type");
}

- (NSString)identifier
{
  return -[TUILinkEntityModel identifier](self->_model, "identifier");
}

- (NSString)title
{
  return -[TUILinkEntityModel title](self->_model, "title");
}

- (NSSet)actions
{
  return -[TUILinkEntityModel actions](self->_model, "actions");
}

- (id)resolvePath
{
  id v3;
  _TUILinkEntityReferencePath *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v3 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2);
  v4 = self->_path;
  if (v4)
  {
    v5 = v4;
    do
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
      objc_msgSend(v3, "insertObject:atIndex:", v6, 0);

      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "parent"));
      v5 = (void *)v7;
    }
    while (v7);
  }
  objc_msgSend(v3, "addObject:", self->_renderIdentifier);
  v8 = objc_msgSend(v3, "copy");

  return v8;
}

- (NSString)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUILinkEntityModel type](self->_model, "type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUILinkEntityModel identifier](self->_model, "identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUILinkEntityModel title](self->_model, "title"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ type=%@ identifier=%@ title='%@'>"), v5, v6, v7, v8));

  return (NSString *)v9;
}

- (TUILinkEntityModel)model
{
  return self->_model;
}

- (_TUILinkEntityReferencePath)path
{
  return self->_path;
}

- (TUIIdentifier)renderIdentifier
{
  return self->_renderIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderIdentifier, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end
