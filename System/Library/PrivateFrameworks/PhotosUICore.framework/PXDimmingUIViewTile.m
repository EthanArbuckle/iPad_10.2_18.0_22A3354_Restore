@implementation PXDimmingUIViewTile

- (PXDimmingUIViewTile)initWithFrame:(CGRect)a3
{
  PXDimmingUIViewTile *v3;
  PXDimmingUIViewTile *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXDimmingUIViewTile;
  v3 = -[PXDimmingUIViewTile initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PXDimmingUIViewTile setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXDimmingUIViewTile setBackgroundColor:](v4, "setBackgroundColor:", v5);

  }
  return v4;
}

- (void)becomeReusable
{
  id v2;

  -[PXDimmingUIViewTile view](self, "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:", 1);

}

- (void)prepareForReuse
{
  id v2;

  -[PXDimmingUIViewTile view](self, "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:", 0);

}

- (void)didApplyGeometry:(PXTileGeometry *)a3 withUserData:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a4, "viewSpec", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v7 = v5;
    objc_msgSend(v5, "backgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXDimmingUIViewTile setBackgroundColor:](self, "setBackgroundColor:", v6);

    v5 = v7;
  }

}

@end
