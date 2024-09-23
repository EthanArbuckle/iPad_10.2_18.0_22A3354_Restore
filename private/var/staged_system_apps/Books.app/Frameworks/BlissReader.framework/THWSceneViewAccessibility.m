@implementation THWSceneViewAccessibility

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return THAccessibilityLocalizedString((uint64_t)CFSTR("3d.model"));
}

- (unint64_t)accessibilityTraits
{
  return TSAccessibilityTraitAllowsDirectInteraction;
}

- (CGRect)accessibilityFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  objc_super v26;
  CGRect result;

  v26.receiver = self;
  v26.super_class = (Class)THWSceneViewAccessibility;
  -[THWSceneViewAccessibility accessibilityFrame](&v26, "accessibilityFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[THWSceneViewAccessibility thaxAccessibilityFrameLeftInset](self, "thaxAccessibilityFrameLeftInset");
  v12 = v11 + v4;
  -[THWSceneViewAccessibility thaxAccessibilityFrameTopInset](self, "thaxAccessibilityFrameTopInset");
  v14 = v6 + v13;
  -[THWSceneViewAccessibility thaxAccessibilityFrameLeftInset](self, "thaxAccessibilityFrameLeftInset");
  v16 = v8 - v15;
  -[THWSceneViewAccessibility thaxAccessibilityFrameRightInset](self, "thaxAccessibilityFrameRightInset");
  v18 = v16 - v17;
  -[THWSceneViewAccessibility thaxAccessibilityFrameTopInset](self, "thaxAccessibilityFrameTopInset");
  v20 = v10 - v19;
  -[THWSceneViewAccessibility thaxAccessibilityFrameBottomInset](self, "thaxAccessibilityFrameBottomInset");
  v22 = v20 - v21;
  v23 = v12;
  v24 = v14;
  v25 = v18;
  result.size.height = v22;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

+ (id)tsaxTargetClassName
{
  return CFSTR("THWSceneView");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (double)thaxAccessibilityFrameTopInset
{
  double result;

  __TSAccessibilityGetAssociatedCGFloat(self, &unk_543A33);
  return result;
}

- (void)thaxSetAccessibilityFrameTopInset:(double)a3
{
  __TSAccessibilitySetAssociatedCGFloat(self, &unk_543A33, a3);
}

- (double)thaxAccessibilityFrameLeftInset
{
  double result;

  __TSAccessibilityGetAssociatedCGFloat(self, &unk_543A34);
  return result;
}

- (void)thaxSetAccessibilityFrameLeftInset:(double)a3
{
  __TSAccessibilitySetAssociatedCGFloat(self, &unk_543A34, a3);
}

- (double)thaxAccessibilityFrameRightInset
{
  double result;

  __TSAccessibilityGetAssociatedCGFloat(self, &unk_543A35);
  return result;
}

- (void)thaxSetAccessibilityFrameRightInset:(double)a3
{
  __TSAccessibilitySetAssociatedCGFloat(self, &unk_543A35, a3);
}

- (double)thaxAccessibilityFrameBottomInset
{
  double result;

  __TSAccessibilityGetAssociatedCGFloat(self, &unk_543A36);
  return result;
}

- (void)thaxSetAccessibilityFrameBottomInset:(double)a3
{
  __TSAccessibilitySetAssociatedCGFloat(self, &unk_543A36, a3);
}

@end
