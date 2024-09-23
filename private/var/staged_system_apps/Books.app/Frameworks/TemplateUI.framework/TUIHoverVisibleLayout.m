@implementation TUIHoverVisibleLayout

- (TUIHoverVisibleLayout)initWithModel:(id)a3 parent:(id)a4 controller:(id)a5
{
  TUIHoverVisibleLayout *v5;
  TUIHoverVisibleLayout *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TUIHoverVisibleLayout;
  v5 = -[TUILayout initWithModel:parent:controller:](&v9, "initWithModel:parent:controller:", a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    if (-[TUIHoverVisibleLayout hoverAvailable](v5, "hoverAvailable"))
    {
      -[TUILayout setHidden:](v6, "setHidden:", 0);
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](v6, "box"));
      -[TUILayout setHidden:](v6, "setHidden:", objc_msgSend(v7, "whenUnavailable") == (char *)&dword_0 + 1);

    }
  }
  return v6;
}

- (id)newRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "regionName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout hoverIdentifierWithName:](self, "hoverIdentifierWithName:", v8));

  v10 = 0;
  if (a3 >= 4 && v9)
  {
    if (-[TUIHoverVisibleLayout hoverAvailable](self, "hoverAvailable"))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "renderModelForContainerLayout:kind:", self, 6));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[TUIHoverVisibleView renderModelWithSubviewsModel:identifier:hoverIdentifier:](TUIHoverVisibleView, "renderModelWithSubviewsModel:identifier:hoverIdentifier:", v11, v13, v9));

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (BOOL)hoverAvailable
{
  return 0;
}

@end
