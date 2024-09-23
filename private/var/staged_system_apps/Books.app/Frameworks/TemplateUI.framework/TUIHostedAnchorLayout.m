@implementation TUIHostedAnchorLayout

- (BOOL)collectHostingPropertiesWithCollector:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hostingProperties"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hostingIdentifier"));
  objc_msgSend(v4, "hostingCollectorAddProperties:forIdentifier:", v6, v7);

  return 0;
}

- (id)newRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (a3 < 4)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "renderModelForContainerLayout:kind:", self, 6));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hostingIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hostingProperties"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[TUIHostingAnchorView renderModelIdentifier:submodel:hostingIdentifier:hostingProperties:](TUIHostingAnchorView, "renderModelIdentifier:submodel:hostingIdentifier:hostingProperties:", v7, v5, v8, v9));

  return v10;
}

@end
