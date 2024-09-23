@implementation MSDNearbyObject

- (MSDNearbyObject)initWithIdentifier:(id)a3 andIsInBubble:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  MSDNearbyObject *v7;
  MSDNearbyObject *v8;
  objc_super v10;

  v4 = a4;
  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MSDNearbyObject;
  v7 = -[MSDNearbyObject init](&v10, "init");
  v8 = v7;
  if (v7)
  {
    -[MSDNearbyObject setIdentifier:](v7, "setIdentifier:", v6);
    -[MSDNearbyObject setIsInBubble:](v8, "setIsInBubble:", v4);
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;

  v4 = a3;
  v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDNearbyObject identifier](self, "identifier"));
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDNearbyObject identifier](self, "identifier"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDNearbyObject identifier](self, "identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@[%p]: Identifier=%@ IsInBubble=%d>"), v5, self, v6, -[MSDNearbyObject isInBubble](self, "isInBubble")));

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (BOOL)isInBubble
{
  return self->_isInBubble;
}

- (void)setIsInBubble:(BOOL)a3
{
  self->_isInBubble = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
