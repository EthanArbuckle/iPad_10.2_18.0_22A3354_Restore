@implementation OAVShadow

+ (id)readFromManager:(id)a3
{
  id v3;
  OADOuterShadowEffect *v4;
  void *v5;
  void *v6;
  double v7;
  long double v8;
  long double v9;
  long double v10;
  long double v11;
  long double v12;
  long double v13;
  void *v14;

  v3 = a3;
  if ((objc_msgSend(v3, "isShadowed") & 1) != 0)
  {
    v4 = objc_alloc_init(OADOuterShadowEffect);
    objc_msgSend(v3, "shadowColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "shadowAlpha");
    +[OAVColor readColorFromAttribute:alpha:manager:](OAVColor, "readColorFromAttribute:alpha:manager:", v5, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADShadowEffect setColor:](v4, "setColor:", v6);
    LODWORD(v7) = 1.0;
    -[OADShadowEffect setBlurRadius:](v4, "setBlurRadius:", v7);
    objc_msgSend(v3, "shadowOffsets");
    v9 = v8;
    v11 = v10;
    v12 = hypot(v8, v10);
    *(float *)&v12 = v12;
    -[OADShadowEffect setDistance:](v4, "setDistance:", (double)v12);
    v13 = atan2(v11, v9) * 57.2957795;
    *(float *)&v13 = v13;
    -[OADShadowEffect setAngle:](v4, "setAngle:", (double)v13);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

@end
