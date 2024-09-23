@implementation TUILinkEntityAttributes

- (TUILinkEntityAttributes)initWithIdentifier:(id)a3 linkEntities:(id)a4 size:(CGSize)a5 center:(CGPoint)a6 transform:(CGAffineTransform *)a7
{
  double y;
  double x;
  double height;
  double width;
  id v15;
  id v16;
  __int128 v17;
  TUILinkEntityAttributes *v18;
  TUILinkEntityAttributes *v19;
  NSArray *v20;
  NSArray *linkEntities;
  _OWORD v23[3];
  objc_super v24;

  y = a6.y;
  x = a6.x;
  height = a5.height;
  width = a5.width;
  v15 = a3;
  v16 = a4;
  v24.receiver = self;
  v24.super_class = (Class)TUILinkEntityAttributes;
  v17 = *(_OWORD *)&a7->c;
  v23[0] = *(_OWORD *)&a7->a;
  v23[1] = v17;
  v23[2] = *(_OWORD *)&a7->tx;
  v18 = -[TUIGeometryAttributes initWithSize:center:transform:](&v24, "initWithSize:center:transform:", v23, width, height, x, y);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_identifier, a3);
    v20 = (NSArray *)objc_msgSend(v16, "copy");
    linkEntities = v19->_linkEntities;
    v19->_linkEntities = v20;

  }
  return v19;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIIdentifier tui_identifierToString](self->_identifier, "tui_identifierToString"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p id=%@ entities=%@>"), v5, self, v6, self->_linkEntities));

  return v7;
}

- (TUIIdentifier)identifier
{
  return self->_identifier;
}

- (NSArray)linkEntities
{
  return self->_linkEntities;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkEntities, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
