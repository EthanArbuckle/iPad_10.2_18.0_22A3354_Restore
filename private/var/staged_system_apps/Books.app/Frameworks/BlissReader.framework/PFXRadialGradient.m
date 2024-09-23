@implementation PFXRadialGradient

- (void)end
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v3 = +[TSDMutableTransformGradient radialGradientWithGradientStops:](TSDMutableTransformGradient, "radialGradientWithGradientStops:", self->super.mStops);
  +[PFXStyleUtilities percentageStringToFraction:](PFXStyleUtilities, "percentageStringToFraction:", -[PFXSvgElement valueForAttributeName:](self, "valueForAttributeName:", "fx"));
  v5 = v4;
  +[PFXStyleUtilities percentageStringToFraction:](PFXStyleUtilities, "percentageStringToFraction:", -[PFXSvgElement valueForAttributeName:](self, "valueForAttributeName:", "fy"));
  v7 = v6;
  +[PFXStyleUtilities percentageStringToFraction:](PFXStyleUtilities, "percentageStringToFraction:", -[PFXSvgElement valueForAttributeName:](self, "valueForAttributeName:", "r"));
  v9 = v8;
  v10 = -[PFXSvgElement valueForAttributeName:](self, "valueForAttributeName:", "baseNaturalSize");
  v13 = 0.0;
  v14 = 0.0;
  if (objc_msgSend(v10, "length"))
  {
    sscanf((const char *)objc_msgSend(v10, "UTF8String"), "%lfpt,%lfpt", &v14, &v13);
    v12 = v13;
    v11 = v14;
  }
  else
  {
    v12 = 0.0;
    v11 = 0.0;
  }
  objc_msgSend(v3, "setStartPoint:", v5 * v11, v7 * v12);
  objc_msgSend(v3, "setEndPoint:", (v5 + v9 * 0.707106781) * v14, (v7 + v9 * 0.707106781) * v13);
  objc_msgSend(v3, "setBaseNaturalSize:", v14, v13);
  -[PFXSvgElement cacheDefinition:](self, "cacheDefinition:", v3);
}

@end
