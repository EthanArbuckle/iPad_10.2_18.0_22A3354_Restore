@implementation TUIHoverRegionLayout

- (TUIHoverRegionLayout)initWithModel:(id)a3 parent:(id)a4 controller:(id)a5
{
  TUIHoverRegionLayout *v5;
  TUIHoverRegionLayout *v6;
  void *v7;
  TUIHoverIdentifier *v8;
  void *v9;
  void *v10;
  TUIHoverIdentifier *v11;
  TUIHoverIdentifier *hoverIdentifier;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)TUIHoverRegionLayout;
  v5 = -[TUILayout initWithModel:parent:controller:](&v14, "initWithModel:parent:controller:", a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](v5, "box"));
    v8 = [TUIHoverIdentifier alloc];
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "regionName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
    v11 = -[TUIHoverIdentifier initWithName:identifier:](v8, "initWithName:identifier:", v9, v10);
    hoverIdentifier = v6->_hoverIdentifier;
    v6->_hoverIdentifier = v11;

  }
  return v6;
}

- (id)hoverIdentifierWithName:(id)a3 forDescdendent:(id)a4
{
  id v5;
  void *v6;
  unsigned int v7;
  TUIHoverIdentifier *v8;
  void *v9;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIHoverIdentifier name](self->_hoverIdentifier, "name"));
  v7 = objc_msgSend(v6, "isEqualToString:", v5);

  if (v7)
  {
    v8 = self->_hoverIdentifier;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout layoutAncestor](self, "layoutAncestor"));
    v8 = (TUIHoverIdentifier *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "hoverIdentifierWithName:", v5));

  }
  return v8;
}

- (void)appendHoverRegions:(id)a3 relativeToLayout:(id)a4
{
  id v6;
  id v7;
  CGFloat v8;
  CGFloat v9;
  TUIHoverRegion *v10;
  objc_super v11;
  CGAffineTransform v12;
  CGAffineTransform v13;
  CGRect v14;
  CGRect v15;

  v6 = a3;
  v7 = a4;
  if (self->_hoverIdentifier)
  {
    memset(&v13, 0, sizeof(v13));
    -[TUILayout computedTransformInAncestorLayout:](self, "computedTransformInAncestorLayout:", v7);
    -[TUILayout computedNaturalSize](self, "computedNaturalSize");
    v14.size.width = v8;
    v14.size.height = v9;
    v12 = v13;
    v14.origin.x = 0.0;
    v14.origin.y = 0.0;
    v15 = CGRectApplyAffineTransform(v14, &v12);
    v10 = -[TUIHoverRegion initWithBounds:]([TUIHoverRegion alloc], "initWithBounds:", v15.origin.x, v15.origin.y, v15.size.width, v15.size.height);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, self->_hoverIdentifier);

  }
  v11.receiver = self;
  v11.super_class = (Class)TUIHoverRegionLayout;
  -[TUILayout appendHoverRegions:relativeToLayout:](&v11, "appendHoverRegions:relativeToLayout:", v6, v7);

}

- (TUIHoverIdentifier)hoverIdentifier
{
  return self->_hoverIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hoverIdentifier, 0);
}

@end
