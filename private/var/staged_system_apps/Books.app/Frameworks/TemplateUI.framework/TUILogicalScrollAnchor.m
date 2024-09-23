@implementation TUILogicalScrollAnchor

- (TUILogicalScrollAnchor)initWithPosition:(unint64_t)a3 identifier:(id)a4
{
  id v7;
  TUILogicalScrollAnchor *v8;
  TUILogicalScrollAnchor *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TUILogicalScrollAnchor;
  v8 = -[TUILogicalScrollAnchor init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    v8->_position = a3;
    objc_storeStrong(&v8->_identifier, a4);
  }

  return v9;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_252368, "objectAtIndexedSubscript:", self->_position));
  v4 = (objc_class *)objc_opt_class(self);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ position=%@ identifier=%@>"), v6, v3, self->_identifier));

  return v7;
}

- (unint64_t)position
{
  return self->_position;
}

- (id)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_identifier, 0);
}

@end
