@implementation PFXLinearGradient

- (void)end
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v3 = +[TSDMutableAngleGradient linearGradientWithGradientStops:](TSDMutableAngleGradient, "linearGradientWithGradientStops:", self->super.mStops);
  +[PFXStyleUtilities percentageStringToFraction:](PFXStyleUtilities, "percentageStringToFraction:", -[PFXSvgElement valueForAttributeName:](self, "valueForAttributeName:", "x1"));
  v5 = v4;
  +[PFXStyleUtilities percentageStringToFraction:](PFXStyleUtilities, "percentageStringToFraction:", -[PFXSvgElement valueForAttributeName:](self, "valueForAttributeName:", "y1"));
  v7 = v6;
  +[PFXStyleUtilities percentageStringToFraction:](PFXStyleUtilities, "percentageStringToFraction:", -[PFXSvgElement valueForAttributeName:](self, "valueForAttributeName:", "x2"));
  v9 = v8;
  +[PFXStyleUtilities percentageStringToFraction:](PFXStyleUtilities, "percentageStringToFraction:", -[PFXSvgElement valueForAttributeName:](self, "valueForAttributeName:", "y2"));
  objc_msgSend(v3, "setGradientAngle:", (double)-atan2(v10 - v7, v9 - v5));
  -[PFXSvgElement cacheDefinition:](self, "cacheDefinition:", v3);
}

@end
