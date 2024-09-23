@implementation PFXStop

- (void)start
{
  id v3;
  unsigned int v4;
  double v5;
  double v6;
  id v7;

  v3 = -[PFXSvgElement valueForAttributeName:](self, "valueForAttributeName:", "offset");
  v4 = objc_msgSend(v3, "hasSuffix:", CFSTR("%"));
  objc_msgSend(v3, "doubleValue");
  if (v4)
    v6 = v5 / 100.0;
  else
    v6 = v5;
  v7 = objc_msgSend(objc_alloc((Class)TSDGradientStop), "initWithColor:fraction:", +[PFXStyleUtilities htmlStringToColor:](PFXStyleUtilities, "htmlStringToColor:", -[PFXSvgElement valueForAttributeName:](self, "valueForAttributeName:", "stop-color")), v6);
  -[PFXSvgElement addStop:](self->super.mParent, "addStop:", v7);

}

@end
