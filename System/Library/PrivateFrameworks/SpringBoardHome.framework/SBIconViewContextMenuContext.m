@implementation SBIconViewContextMenuContext

- (SBIconViewContextMenuContext)initWithIconView:(id)a3 location:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  SBIconViewContextMenuContext *v8;
  SBIconViewContextMenuContext *v9;
  void *v10;
  uint64_t v11;
  NSString *nodeIdentifier;
  uint64_t v13;
  NSUUID *identifier;
  objc_super v16;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SBIconViewContextMenuContext;
  v8 = -[SBIconViewContextMenuContext init](&v16, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_iconView, v7);
    objc_msgSend(v7, "icon");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "nodeIdentifier");
    v11 = objc_claimAutoreleasedReturnValue();
    nodeIdentifier = v9->_nodeIdentifier;
    v9->_nodeIdentifier = (NSString *)v11;

    v9->_location.x = x;
    v9->_location.y = y;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v13 = objc_claimAutoreleasedReturnValue();
    identifier = v9->_identifier;
    v9->_identifier = (NSUUID *)v13;

  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSUUID *identifier;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    identifier = self->_identifier;
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NSUUID isEqual:](identifier, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  id WeakRetained;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_iconView);
  v6 = (_QWORD *)objc_msgSend(v4, "initWithIconView:location:", WeakRetained, self->_location.x, self->_location.y);

  v7 = -[NSUUID copy](self->_identifier, "copy");
  v8 = (void *)v6[4];
  v6[4] = v7;

  v9 = -[NSString copy](self->_nodeIdentifier, "copy");
  v10 = (void *)v6[1];
  v6[1] = v9;

  return v6;
}

- (unint64_t)hash
{
  return -[NSUUID hash](self->_identifier, "hash");
}

- (id)description
{
  void *v3;
  id WeakRetained;
  id v5;
  id v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_iconView);
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", WeakRetained, CFSTR("_iconView"));

  v6 = (id)objc_msgSend(v3, "appendObject:withName:", self->_identifier, CFSTR("_identifier"));
  v7 = (id)objc_msgSend(v3, "appendPoint:withName:", CFSTR("_location"), self->_location.x, self->_location.y);
  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)contextMenuNotificationUserInfo
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_setSafeObject:forKey:", self->_nodeIdentifier, CFSTR("iconViewNodeIdentifier"));
  objc_msgSend(v3, "bs_setSafeObject:forKey:", self->_identifier, CFSTR("contextMenuIdentifier"));
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", self->_location.x, self->_location.y);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v4, CFSTR("contextMenuPresentationLocation"));

  return v3;
}

- (UIContextMenuInteraction)contextMenuInteraction
{
  return (UIContextMenuInteraction *)objc_loadWeakRetained((id *)&self->_contextMenuInteraction);
}

- (void)setContextMenuInteraction:(id)a3
{
  objc_storeWeak((id *)&self->_contextMenuInteraction, a3);
}

- (SBIconView)iconView
{
  return (SBIconView *)objc_loadWeakRetained((id *)&self->_iconView);
}

- (CGPoint)location
{
  double x;
  double y;
  CGPoint result;

  x = self->_location.x;
  y = self->_location.y;
  result.y = y;
  result.x = x;
  return result;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_iconView);
  objc_destroyWeak((id *)&self->_contextMenuInteraction);
  objc_storeStrong((id *)&self->_nodeIdentifier, 0);
}

@end
