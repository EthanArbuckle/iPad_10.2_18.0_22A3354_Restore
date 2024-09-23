@implementation PGPortalView

- (void)setSourceView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[PGPortalView portalLayer](self, "portalLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setSourceLayer:", v6);
  -[PGPortalView portalLayer](self, "portalLayer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMatchesTransform:", 1);

}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (UIView)sourceView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_sourceView);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sourceView);
}

@end
