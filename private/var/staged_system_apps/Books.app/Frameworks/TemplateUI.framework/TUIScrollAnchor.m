@implementation TUIScrollAnchor

- (TUIScrollAnchor)initWithAnchor:(id)a3 relativeDistance:(double)a4
{
  id v6;
  TUIScrollAnchor *v7;
  TUILogicalScrollAnchor *v8;
  TUILogicalScrollAnchor *anchor;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TUIScrollAnchor;
  v7 = -[TUIScrollAnchor init](&v11, "init");
  if (v7)
  {
    v8 = (TUILogicalScrollAnchor *)objc_msgSend(v6, "copy");
    anchor = v7->_anchor;
    v7->_anchor = v8;

    v7->_relativeDistance = a4;
  }

  return v7;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ anchor=%@ relativeDistance=%f>"), v5, self->_anchor, *(_QWORD *)&self->_relativeDistance));

  return v6;
}

- (TUILogicalScrollAnchor)anchor
{
  return self->_anchor;
}

- (double)relativeDistance
{
  return self->_relativeDistance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchor, 0);
}

@end
