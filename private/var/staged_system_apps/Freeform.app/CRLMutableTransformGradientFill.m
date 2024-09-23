@implementation CRLMutableTransformGradientFill

- (void)setGradientStops:(id)a3
{
  -[CRLGradientFill p_setGradientStops:](self, "p_setGradientStops:", a3);
}

- (void)removeStop:(id)a3
{
  -[CRLGradientFill p_removeStop:](self, "p_removeStop:", a3);
}

- (id)removeStopAtIndex:(unint64_t)a3
{
  return -[CRLGradientFill p_removeStopAtIndex:](self, "p_removeStopAtIndex:", a3);
}

- (id)insertStopAtFraction:(double)a3
{
  return -[CRLGradientFill p_insertStopAtFraction:](self, "p_insertStopAtFraction:", a3);
}

- (id)insertStopAtFraction:(double)a3 withColor:(id)a4
{
  return -[CRLGradientFill p_insertStopAtFraction:withColor:](self, "p_insertStopAtFraction:withColor:", a4, a3);
}

- (void)reverseStopOrder
{
  -[CRLGradientFill p_reverseStopOrder](self, "p_reverseStopOrder");
}

- (void)evenlyDistributeStops
{
  -[CRLGradientFill p_evenlyDistributeStops](self, "p_evenlyDistributeStops");
}

- (void)setGradientType:(unint64_t)a3
{
  -[CRLGradientFill p_setGradientType:](self, "p_setGradientType:", a3);
}

- (void)moveStopAtIndex:(unint64_t)a3 toFraction:(double)a4
{
  -[CRLGradientFill p_moveStopAtIndex:toFraction:](self, "p_moveStopAtIndex:toFraction:", a3, a4);
}

- (void)swapStopAtIndex:(unint64_t)a3 withStopAtIndex:(unint64_t)a4
{
  -[CRLGradientFill p_swapStopAtIndex:withStopAtIndex:](self, "p_swapStopAtIndex:withStopAtIndex:", a3, a4);
}

- (void)setColorOfStopAtIndex:(unint64_t)a3 toColor:(id)a4
{
  -[CRLGradientFill p_setColorOfStopAtIndex:toColor:](self, "p_setColorOfStopAtIndex:toColor:", a3, a4);
}

- (void)setInflectionOfStopAtIndex:(unint64_t)a3 toInflection:(double)a4
{
  -[CRLGradientFill p_setInflectionOfStopAtIndex:toInflection:](self, "p_setInflectionOfStopAtIndex:toInflection:", a3, a4);
}

- (void)setFirstColor:(id)a3
{
  -[CRLMutableTransformGradientFill setColorOfStopAtIndex:toColor:](self, "setColorOfStopAtIndex:toColor:", 0, a3);
}

- (void)setLastColor:(id)a3
{
  -[CRLMutableTransformGradientFill setColorOfStopAtIndex:toColor:](self, "setColorOfStopAtIndex:toColor:", (char *)-[NSArray count](-[CRLGradientFill gradientStops](self, "gradientStops"), "count") - 1, a3);
}

- (void)setOpacity:(double)a3
{
  -[CRLGradientFill p_setOpacity:](self, "p_setOpacity:", a3);
}

- (void)setStartPoint:(CGPoint)a3 inShapeWithNaturalSize:(CGSize)a4
{
  -[CRLTransformGradientFill p_scalePoint:fromShapeWithNaturalSize:](self, "p_scalePoint:fromShapeWithNaturalSize:", a3.x, a3.y, a4.width, a4.height);
  -[CRLTransformGradientFill p_setStartPoint:](self, "p_setStartPoint:");
}

- (void)setEndPoint:(CGPoint)a3 inShapeWithNaturalSize:(CGSize)a4
{
  -[CRLTransformGradientFill p_scalePoint:fromShapeWithNaturalSize:](self, "p_scalePoint:fromShapeWithNaturalSize:", a3.x, a3.y, a4.width, a4.height);
  -[CRLTransformGradientFill p_setEndPoint:](self, "p_setEndPoint:");
}

- (void)upgradeIfNecessaryWithBaseNaturalSize:(CGSize)a3
{
  double height;
  double width;
  CGAffineTransform *p_mTransformBeforeUpgrade;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  CGAffineTransform v10;
  CGAffineTransform v11;

  height = a3.height;
  width = a3.width;
  p_mTransformBeforeUpgrade = &self->super.mTransformBeforeUpgrade;
  v7 = *(_OWORD *)&self->super.mTransformBeforeUpgrade.c;
  *(_OWORD *)&v10.a = *(_OWORD *)&self->super.mTransformBeforeUpgrade.a;
  *(_OWORD *)&v10.c = v7;
  *(_OWORD *)&v10.tx = *(_OWORD *)&self->super.mTransformBeforeUpgrade.tx;
  CGAffineTransformInvert(&v11, &v10);
  v8 = *(_OWORD *)&v11.c;
  *(_OWORD *)&p_mTransformBeforeUpgrade->a = *(_OWORD *)&v11.a;
  *(_OWORD *)&p_mTransformBeforeUpgrade->c = v8;
  *(_OWORD *)&p_mTransformBeforeUpgrade->tx = *(_OWORD *)&v11.tx;
  -[CRLMutableTransformGradientFill setBaseNaturalSize:](self, "setBaseNaturalSize:", height * p_mTransformBeforeUpgrade->c + p_mTransformBeforeUpgrade->a * width, height * p_mTransformBeforeUpgrade->d + p_mTransformBeforeUpgrade->b * width);
  v9 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&p_mTransformBeforeUpgrade->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&p_mTransformBeforeUpgrade->c = v9;
  *(_OWORD *)&p_mTransformBeforeUpgrade->tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
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
  v9 = sub_100061A8C(x, y, v8, self->super.mEnd.y, 0.5);
  v11 = v10;
  v12 = sub_1000603B8(x, y, v8);
  v14 = sub_100061070(v12, v13);
  v15 = sub_100061F64(a3 * 0.0174532925);
  v17 = sub_1000603DC(-v15, v16, v14 * 0.5);
  p_mStart->x = sub_1000603D0(v9, v11, v17);
  p_mStart->y = v18;
  p_mEnd->x = sub_1000603B8(v9, v11, v17);
  p_mEnd->y = v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CRLTransformGradientFill *v4;
  NSArray *v5;
  unint64_t v6;
  CRLTransformGradientFill *v7;

  v4 = +[CRLTransformGradientFill allocWithZone:](CRLTransformGradientFill, "allocWithZone:", a3);
  v5 = -[CRLGradientFill gradientStops](self, "gradientStops");
  v6 = -[CRLGradientFill gradientType](self, "gradientType");
  -[CRLGradientFill opacity](self, "opacity");
  v7 = -[CRLGradientFill initWithGradientStops:type:opacity:](v4, "initWithGradientStops:type:opacity:", v5, v6);
  -[CRLGradientFill i_setAdvancedGradientFlag:](v7, "i_setAdvancedGradientFlag:", -[CRLGradientFill i_advancedGradientFlag](self, "i_advancedGradientFlag"));
  -[CRLTransformGradientFill startPoint](self, "startPoint");
  -[CRLTransformGradientFill p_setStartPoint:](v7, "p_setStartPoint:");
  -[CRLTransformGradientFill endPoint](self, "endPoint");
  -[CRLTransformGradientFill p_setEndPoint:](v7, "p_setEndPoint:");
  -[CRLTransformGradientFill baseNaturalSize](self, "baseNaturalSize");
  -[CRLTransformGradientFill p_setBaseNaturalSize:](v7, "p_setBaseNaturalSize:");
  return v7;
}

@end
