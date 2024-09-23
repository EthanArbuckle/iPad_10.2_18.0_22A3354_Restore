@implementation AXFKATextFieldFocusRingShapeLayer

- (void)updateAppearance
{
  id v2;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  id v10;

  if (-[AXFKAFocusRingShapeLayer kind](self, "kind") == 1 || !-[AXFKAFocusRingShapeLayer kind](self, "kind"))
  {
    -[AXFKAFocusRingShapeLayer tintColor](self, "tintColor");
    v4 = objc_claimAutoreleasedReturnValue();
    v10 = (id)v4;
    if (v4)
    {
      -[AXFKAFocusRingShapeLayer bottomFocusRingColorForTintColor:](self, "bottomFocusRingColorForTintColor:", v4);
      v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v5 = objc_msgSend(v2, "CGColor");
    }
    else
    {
      v5 = 0;
    }
    -[AXFKAFocusRingShapeLayer bottomBorderLayer](self, "bottomBorderLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setStrokeColor:", v5);

    if (v10)
    -[AXFKAFocusRingShapeLayer bottomBorderLayer](self, "bottomBorderLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = 0.25;
    objc_msgSend(v7, "setOpacity:", v8);

    -[AXFKAFocusRingShapeLayer bottomBorderLayer](self, "bottomBorderLayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setUnscaledLineWidth:", 3.0);

    -[AXFKAFocusRingShapeLayer _updateBottomLayerPath](self, "_updateBottomLayerPath");
  }
}

@end
