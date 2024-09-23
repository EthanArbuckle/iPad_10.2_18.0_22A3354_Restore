@implementation OABShadow

+ (id)readShadowFromShapeBaseManager:(id)a3 state:(id)a4
{
  id v5;
  id v6;
  OADOuterShadowEffect *v7;
  void *v8;
  float v9;
  double v10;
  void *v11;
  double v12;
  int v13;
  float v14;
  double v15;
  double v16;
  double v17;
  double v18;
  EshColor v20;
  EshColor v21;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "isShadowed") & 1) != 0)
  {
    v7 = objc_alloc_init(OADOuterShadowEffect);
    if (v5)
      objc_msgSend(v5, "shadowColor");
    else
      v21 = 0;
    v9 = EshFixedPointUtil::toFloat((EshFixedPointUtil *)objc_msgSend(v5, "shadowAlpha"));
    EshColor::EshColor(&v20, &v21);
    *(float *)&v10 = v9;
    +[OABShapeProperties targetColorWithSourceColor:alpha:colorPropertiesManager:state:](OABShapeProperties, "targetColorWithSourceColor:alpha:colorPropertiesManager:state:", &v20, v5, v6, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADShadowEffect setColor:](v7, "setColor:", v11);
    *(float *)&v12 = (float)(int)objc_msgSend(v5, "shadowSoftness") / 12700.0;
    -[OADShadowEffect setBlurRadius:](v7, "setBlurRadius:", v12);
    v13 = objc_msgSend(v5, "shadowOffsetX");
    v14 = (float)(int)objc_msgSend(v5, "shadowOffsetY") / 12700.0;
    *(float *)&v15 = hypotf((float)v13 / 12700.0, v14);
    -[OADShadowEffect setDistance:](v7, "setDistance:", v15);
    v16 = atan2f(v14, (float)v13 / 12700.0) * 57.2957795;
    *(float *)&v16 = v16;
    -[OADShadowEffect setAngle:](v7, "setAngle:", v16);
    if (objc_msgSend(v5, "shadowType") - 2 <= 2)
    {
      LODWORD(v17) = 1109393408;
      -[OADOuterShadowEffect setYSkew:](v7, "setYSkew:", v17);
      LODWORD(v18) = 0.5;
      -[OADOuterShadowEffect setXScale:](v7, "setXScale:", v18);
    }
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

@end
