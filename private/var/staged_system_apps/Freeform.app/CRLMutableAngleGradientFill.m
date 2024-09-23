@implementation CRLMutableAngleGradientFill

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
  -[CRLMutableAngleGradientFill setColorOfStopAtIndex:toColor:](self, "setColorOfStopAtIndex:toColor:", 0, a3);
}

- (void)setLastColor:(id)a3
{
  -[CRLMutableAngleGradientFill setColorOfStopAtIndex:toColor:](self, "setColorOfStopAtIndex:toColor:", (char *)-[NSArray count](-[CRLGradientFill gradientStops](self, "gradientStops"), "count") - 1, a3);
}

- (void)setOpacity:(double)a3
{
  -[CRLGradientFill p_setOpacity:](self, "p_setOpacity:", a3);
}

- (void)setGradientAngleInDegrees:(double)a3
{
  -[CRLMutableAngleGradientFill setGradientAngle:](self, "setGradientAngle:", a3 * 0.0174532925);
}

- (void)setGradientAngle:(double)a3
{
  self->super.mAngle = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CRLAngleGradientFill *v4;
  NSArray *v5;
  unint64_t v6;
  double v7;
  double v8;
  double v9;
  CRLAngleGradientFill *v10;

  v4 = +[CRLAngleGradientFill allocWithZone:](CRLAngleGradientFill, "allocWithZone:", a3);
  v5 = -[CRLGradientFill gradientStops](self, "gradientStops");
  v6 = -[CRLGradientFill gradientType](self, "gradientType");
  -[CRLGradientFill opacity](self, "opacity");
  v8 = v7;
  -[CRLAngleGradientFill gradientAngle](self, "gradientAngle");
  v10 = -[CRLAngleGradientFill initWithGradientStops:type:opacity:angle:](v4, "initWithGradientStops:type:opacity:angle:", v5, v6, v8, v9);
  -[CRLGradientFill i_setAdvancedGradientFlag:](v10, "i_setAdvancedGradientFlag:", -[CRLGradientFill i_advancedGradientFlag](self, "i_advancedGradientFlag"));
  return v10;
}

@end
