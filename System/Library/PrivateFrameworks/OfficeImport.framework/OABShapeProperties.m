@implementation OABShapeProperties

+ (id)targetColorWithSourceColor:(EshColor)a3 alpha:(float)a4 colorPropertiesManager:(id)a5 state:(id)a6
{
  void *v7;
  OADValueColorTransform *v8;
  double v9;

  +[OABColor readColor:colorPropertiesManager:state:](OABColor, "readColor:colorPropertiesManager:state:", a3, a5, a6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 != 1.0)
  {
    v8 = -[OADColorTransform initWithType:]([OADValueColorTransform alloc], "initWithType:", 6);
    *(float *)&v9 = a4;
    -[OADValueColorTransform setValue:](v8, "setValue:", v9);
    objc_msgSend(v7, "addTransform:", v8);

  }
  return v7;
}

@end
