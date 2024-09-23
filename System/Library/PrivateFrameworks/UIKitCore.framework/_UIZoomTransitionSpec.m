@implementation _UIZoomTransitionSpec

- (_TtC5UIKit30_UIZoomTransitionAnimationSpec)zoomIn
{
  return (_TtC5UIKit30_UIZoomTransitionAnimationSpec *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                                               + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_zoomIn));
}

- (void)setZoomIn:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_zoomIn);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_zoomIn) = (Class)a3;
  v3 = a3;

}

- (_TtC5UIKit30_UIZoomTransitionAnimationSpec)zoomInShowcase
{
  return (_TtC5UIKit30_UIZoomTransitionAnimationSpec *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                                               + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_zoomInShowcase));
}

- (void)setZoomInShowcase:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_zoomInShowcase);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_zoomInShowcase) = (Class)a3;
  v3 = a3;

}

- (_TtC5UIKit30_UIZoomTransitionAnimationSpec)zoomOut
{
  return (_TtC5UIKit30_UIZoomTransitionAnimationSpec *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                                               + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_zoomOut));
}

- (void)setZoomOut:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_zoomOut);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_zoomOut) = (Class)a3;
  v3 = a3;

}

- (_TtC5UIKit30_UIZoomTransitionAnimationSpec)zoomOutInteractive
{
  return (_TtC5UIKit30_UIZoomTransitionAnimationSpec *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                                               + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_zoomOutInteractive));
}

- (void)setZoomOutInteractive:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_zoomOutInteractive);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_zoomOutInteractive) = (Class)a3;
  v3 = a3;

}

- (_TtC5UIKit30_UIZoomTransitionAnimationSpec)cancelInteractive
{
  return (_TtC5UIKit30_UIZoomTransitionAnimationSpec *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                                               + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_cancelInteractive));
}

- (void)setCancelInteractive:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_cancelInteractive);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_cancelInteractive) = (Class)a3;
  v3 = a3;

}

- (CGSize)platterShadowOffset
{
  double v2;
  double v3;
  CGSize result;

  v2 = *(double *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_platterShadowXOffset);
  v3 = *(double *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_platterShadowYOffset);
  result.height = v3;
  result.width = v2;
  return result;
}

- (CATransform3D)recededContentTransformFor:(SEL)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v9;
  double v10;
  _TtC5UIKit21_UIZoomTransitionSpec *v11;
  CGFloat v12;
  double v13;
  CATransform3D *result;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  CATransform3D v23;
  CGRect v24;
  CGRect v25;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = *(double *)((char *)&self->super.super.isa
                 + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_recededBackgroundScaleDownPoints);
  v10 = *(double *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_recededBackgroundMinScale);
  v11 = self;
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  v12 = CGRectGetWidth(v24) - v9;
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  v13 = v12 / CGRectGetWidth(v25);
  if (v13 <= v10)
    v13 = v10;
  CATransform3DMakeScale(&v23, v13, v13, 1.0);
  v21 = *(_OWORD *)&v23.m13;
  v22 = *(_OWORD *)&v23.m11;
  v19 = *(_OWORD *)&v23.m23;
  v20 = *(_OWORD *)&v23.m21;
  v17 = *(_OWORD *)&v23.m33;
  v18 = *(_OWORD *)&v23.m31;
  v15 = *(_OWORD *)&v23.m43;
  v16 = *(_OWORD *)&v23.m41;

  *(_OWORD *)&retstr->m11 = v22;
  *(_OWORD *)&retstr->m13 = v21;
  *(_OWORD *)&retstr->m21 = v20;
  *(_OWORD *)&retstr->m23 = v19;
  *(_OWORD *)&retstr->m31 = v18;
  *(_OWORD *)&retstr->m33 = v17;
  *(_OWORD *)&retstr->m41 = v16;
  *(_OWORD *)&retstr->m43 = v15;
  return result;
}

- (double)recededBackgroundScaleDownPoints
{
  return *(double *)((char *)&self->super.super.isa
                   + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_recededBackgroundScaleDownPoints);
}

- (void)setRecededBackgroundScaleDownPoints:(double)a3
{
  *(double *)((char *)&self->super.super.isa
            + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_recededBackgroundScaleDownPoints) = a3;
}

- (double)recededBackgroundMinScale
{
  return *(double *)((char *)&self->super.super.isa
                   + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_recededBackgroundMinScale);
}

- (void)setRecededBackgroundMinScale:(double)a3
{
  *(double *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_recededBackgroundMinScale) = a3;
}

- (double)dimmingOpacity
{
  return *(double *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_dimmingOpacity);
}

- (void)setDimmingOpacity:(double)a3
{
  *(double *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_dimmingOpacity) = a3;
}

- (double)fallbackSourceViewWidth
{
  return *(double *)((char *)&self->super.super.isa
                   + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_fallbackSourceViewWidth);
}

- (void)setFallbackSourceViewWidth:(double)a3
{
  *(double *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_fallbackSourceViewWidth) = a3;
}

- (float)platterShadowOpacity
{
  return *(float *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_platterShadowOpacity);
}

- (void)setPlatterShadowOpacity:(float)a3
{
  *(float *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_platterShadowOpacity) = a3;
}

- (double)platterShadowRadius
{
  return *(double *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_platterShadowRadius);
}

- (void)setPlatterShadowRadius:(double)a3
{
  *(double *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_platterShadowRadius) = a3;
}

- (double)platterShadowXOffset
{
  return *(double *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_platterShadowXOffset);
}

- (void)setPlatterShadowXOffset:(double)a3
{
  *(double *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_platterShadowXOffset) = a3;
}

- (double)platterShadowYOffset
{
  return *(double *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_platterShadowYOffset);
}

- (void)setPlatterShadowYOffset:(double)a3
{
  *(double *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit21_UIZoomTransitionSpec_platterShadowYOffset) = a3;
}

- (void)setDefaultValues
{
  _TtC5UIKit21_UIZoomTransitionSpec *v2;

  v2 = self;
  sub_1856B0220();

}

+ (id)settingsControllerModule
{
  id v2;

  sub_1856B0F24();
  return v2;
}

- (_TtC5UIKit21_UIZoomTransitionSpec)initWithDefaultValues
{
  return (_TtC5UIKit21_UIZoomTransitionSpec *)sub_1856B07EC();
}

- (void).cxx_destruct
{

}

@end
