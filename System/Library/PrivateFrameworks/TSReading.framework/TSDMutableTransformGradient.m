@implementation TSDMutableTransformGradient

- (void)setFirstColor:(id)a3
{
  -[TSDMutableTransformGradient setColorOfStopAtIndex:toColor:](self, "setColorOfStopAtIndex:toColor:", 0, a3);
}

- (void)setLastColor:(id)a3
{
  -[TSDMutableTransformGradient setColorOfStopAtIndex:toColor:](self, "setColorOfStopAtIndex:toColor:", -[NSArray count](-[TSDGradient gradientStops](self, "gradientStops"), "count") - 1, a3);
}

- (void)setStartPoint:(CGPoint)a3 inShapeWithNaturalSize:(CGSize)a4
{
  -[TSDTransformGradient p_scalePoint:fromShapeWithNaturalSize:](self, "p_scalePoint:fromShapeWithNaturalSize:", a3.x, a3.y, a4.width, a4.height);
  -[TSDTransformGradient setStartPoint:](self, "setStartPoint:");
}

- (void)setEndPoint:(CGPoint)a3 inShapeWithNaturalSize:(CGSize)a4
{
  -[TSDTransformGradient p_scalePoint:fromShapeWithNaturalSize:](self, "p_scalePoint:fromShapeWithNaturalSize:", a3.x, a3.y, a4.width, a4.height);
  -[TSDTransformGradient setEndPoint:](self, "setEndPoint:");
}

- (void)upgradeIfNecessaryWithBaseNaturalSize:(CGSize)a3
{
  double height;
  double width;
  CGAffineTransform *p_mTransformBeforeUpgrade;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  CGAffineTransform v11;
  CGAffineTransform v12;

  height = a3.height;
  width = a3.width;
  p_mTransformBeforeUpgrade = &self->super.mTransformBeforeUpgrade;
  v7 = *(_OWORD *)&self->super.mTransformBeforeUpgrade.c;
  *(_OWORD *)&v11.a = *(_OWORD *)&self->super.mTransformBeforeUpgrade.a;
  *(_OWORD *)&v11.c = v7;
  *(_OWORD *)&v11.tx = *(_OWORD *)&self->super.mTransformBeforeUpgrade.tx;
  CGAffineTransformInvert(&v12, &v11);
  v8 = *(_OWORD *)&v12.c;
  *(_OWORD *)&p_mTransformBeforeUpgrade->a = *(_OWORD *)&v12.a;
  *(_OWORD *)&p_mTransformBeforeUpgrade->c = v8;
  *(_OWORD *)&p_mTransformBeforeUpgrade->tx = *(_OWORD *)&v12.tx;
  -[TSDTransformGradient setBaseNaturalSize:](self, "setBaseNaturalSize:", height * p_mTransformBeforeUpgrade->c + p_mTransformBeforeUpgrade->a * width, height * p_mTransformBeforeUpgrade->d + p_mTransformBeforeUpgrade->b * width);
  v9 = MEMORY[0x24BDBD8B8];
  v10 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&p_mTransformBeforeUpgrade->a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&p_mTransformBeforeUpgrade->c = v10;
  *(_OWORD *)&p_mTransformBeforeUpgrade->tx = *(_OWORD *)(v9 + 32);
}

- (void)setGradientAngleInDegrees:(double)a3
{
  CGPoint *p_mStart;
  CGPoint *p_mEnd;
  double x;
  double y;
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
  CGFloat v18;
  CGFloat v19;

  p_mStart = &self->super.mStart;
  p_mEnd = &self->super.mEnd;
  x = self->super.mStart.x;
  y = self->super.mStart.y;
  v8 = self->super.mEnd.x;
  v9 = TSDMixPoints(x, y, v8, self->super.mEnd.y, 0.5);
  v11 = v10;
  v12 = TSDSubtractPoints(x, y, v8);
  v14 = TSDPointLength(v12, v13);
  v15 = TSDDeltaFromAngle(a3 * 0.0174532925);
  v17 = TSDMultiplyPointScalar(-v15, v16, v14 * 0.5);
  p_mStart->x = TSDAddPoints(v9, v11, v17);
  p_mStart->y = v18;
  p_mEnd->x = TSDSubtractPoints(v9, v11, v17);
  p_mEnd->y = v19;
}

@end
