@implementation TUISeparatedFlickSelectorView

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  objc_super v10;
  CGRect v11;

  v10.receiver = self;
  v10.super_class = (Class)TUISeparatedFlickSelectorView;
  -[TUIKeyPopupView layoutSubviews](&v10, sel_layoutSubviews);
  -[TUISeparatedFlickSelectorView stackLayoutMargins](self, "stackLayoutMargins");
  v5 = v3 + v4;
  -[TUIKeyPopupView baseKeyLayoutGuide](self, "baseKeyLayoutGuide");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutFrame");
  v7 = (v5 + CGRectGetHeight(v11)) * 0.5;
  -[TUIKeyPopupView variantView](self, "variantView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCornerRadius:", v7);

}

- (void)decorateVariantView
{
  void *v2;
  void *v3;
  uint64_t v4;
  double v5;
  id v6;
  CATransform3D v7;
  CATransform3D v8;
  CATransform3D v9;

  -[TUIKeyPopupView variantView](self, "variantView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_msgSend(v2, "transform3D");
  else
    memset(&v8, 0, sizeof(v8));
  CATransform3DTranslate(&v9, &v8, 0.0, 0.0, 6.0);
  v7 = v9;
  objc_msgSend(v2, "setTransform3D:", &v7);
  v4 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v3, "setValue:forKeyPath:", MEMORY[0x1E0C9AAB0], CFSTR("separatedOptions.acceptsUpstreamHitTesting"));
  objc_msgSend(v3, "setValue:forKeyPath:", v4, CFSTR("separatedOptions.platter.enabled"));
  objc_msgSend(v3, "setValue:forKeyPath:", &unk_1E2517840, CFSTR("separatedOptions.platter.frontDepthForNormals"));
  objc_msgSend(v3, "setValue:forKeyPath:", &unk_1E2517850, CFSTR("separatedOptions.platter.mainSpecularStrength"));
  objc_msgSend(v3, "setValue:forKeyPath:", &unk_1E2517860, CFSTR("separatedOptions.platter.fillSpecularStrength"));
  objc_msgSend(v3, "setValue:forKeyPath:", &unk_1E2517870, CFSTR("separatedOptions.platter.mainSpecularExponent"));
  objc_msgSend(v3, "setValue:forKeyPath:", &unk_1E2517880, CFSTR("separatedOptions.platter.fillSpecularExponent"));
  objc_msgSend(v3, "setValue:forKeyPath:", &unk_1E2517890, CFSTR("separatedOptions.platter.fakeFresnelMaxDist"));
  objc_msgSend(v3, "setValue:forKeyPath:", &unk_1E2517860, CFSTR("separatedOptions.platter.fakeFresnelStrength"));
  objc_msgSend(v3, "setValue:forKeyPath:", &unk_1E2517840, CFSTR("separatedOptions.platter.fakeFresnelFalloff"));
  objc_msgSend(v3, "setValue:forKeyPath:", &unk_1E2517860, CFSTR("separatedOptions.geometry.frontBevel"));
  objc_msgSend(v3, "setValue:forKeyPath:", &unk_1E25178A0, CFSTR("separatedOptions.geometry.flatDepth"));
  objc_msgSend(v3, "setValue:forKeyPath:", &unk_1E25178A0, CFSTR("separatedOptions.geometry.backBevel"));
  objc_msgSend(v3, "setValue:forKeyPath:", &unk_1E25178B0, CFSTR("separatedOptions.shadows.expansionOpacity"));
  objc_msgSend(v3, "setValue:forKeyPath:", &unk_1E25178C0, CFSTR("separatedOptions.shadows.expansionRadius"));
  objc_msgSend(v3, "setValue:forKeyPath:", &unk_1E25178C0, CFSTR("separatedOptions.shadows.expansionSize"));
  objc_msgSend(v3, "setValue:forKeyPath:", &unk_1E25178C0, CFSTR("separatedOptions.shadows.maxDynamicOffset"));
  objc_msgSend(v3, "setValue:forKeyPath:", &unk_1E25178D0, CFSTR("separatedOptions.shadows.expansionTargetZ"));
  LODWORD(v5) = 1017370378;
  objc_msgSend(v3, "setShadowOpacity:", v5);
  objc_msgSend(v3, "setShadowRadius:", 1.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "setShadowColor:", objc_msgSend(v6, "CGColor"));

  objc_msgSend(v3, "setShadowOffset:", 0.5, 2.0);
  objc_msgSend(v3, "setShadowPathIsBounds:", 1);

}

- (UIEdgeInsets)stackLayoutMargins
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 8.0;
  v3 = 8.0;
  v4 = 8.0;
  v5 = 8.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)flickPopupOffset
{
  return 4.0;
}

- (double)itemSpacing
{
  return 8.0;
}

- (BOOL)drawsBackground
{
  return 0;
}

- (BOOL)drawsShadows
{
  return 0;
}

- (BOOL)shouldProvideDefaultSelection
{
  return 0;
}

- (BOOL)wantsUserInteractionEnabled
{
  void *v2;
  BOOL v3;

  -[TUIKeyPopupView associatedTree](self, "associatedTree");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "flickDirection") == -1;

  return v3;
}

- (id)variantCellWithString:(id)a3 annotation:(id)a4
{
  id v6;
  id v7;
  TUISeparatedFlickVariantCell *v8;
  void *v9;
  TUISeparatedFlickVariantCell *v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  v8 = [TUISeparatedFlickVariantCell alloc];
  -[TUIKeyPopupView renderTraits](self, "renderTraits");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[TUISeparatedFlickVariantCell initWithFrame:string:annotation:traits:](v8, "initWithFrame:string:annotation:traits:", v7, v6, v9, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

  -[TUIKeyPopupView touchesForwardingView](self, "touchesForwardingView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "superview");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUISeparatedFlickVariantCell setTouchesForwardingView:](v10, "setTouchesForwardingView:", v12);

  return v10;
}

- (void)setInitialHighlight
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  objc_super v8;

  -[TUIKeyPopupView associatedTree](self, "associatedTree");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "flickDirection") == -1)
  {

  }
  else
  {
    -[TUIKeyPopupView arrangedVariantCells](self, "arrangedVariantCells");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5 == 1)
    {
      -[TUIKeyPopupView arrangedVariantCells](self, "arrangedVariantCells");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setHighlighted:", 1);

      return;
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)TUISeparatedFlickSelectorView;
  -[TUIKeyPopupView setInitialHighlight](&v8, sel_setInitialHighlight);
}

+ (int64_t)hitTestingMode
{
  return 1;
}

@end
