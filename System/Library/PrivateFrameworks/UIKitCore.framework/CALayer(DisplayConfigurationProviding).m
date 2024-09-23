@implementation CALayer(DisplayConfigurationProviding)

- (id)_uis_provideRenderingAttributes
{
  void *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  void *v7;

  _UIViewLayerGetNearestAncestorView(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForTrait:", objc_opt_class());
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(v1, "_window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "windowScene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScene _renderingEnvironmentSceneComponentRegisteringIfNecessary:](v5, 1);
    v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();

    if (v6)
      v7 = (void *)v6[3];
    else
      v7 = 0;
    v3 = v7;

  }
  return v3;
}

@end
