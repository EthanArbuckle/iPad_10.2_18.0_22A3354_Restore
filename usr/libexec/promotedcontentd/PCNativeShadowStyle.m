@implementation PCNativeShadowStyle

- (id)initWithShadowStyle:(id)a3
{
  id v4;
  PCNativeShadowStyle *v5;
  PCNativeShadowStyle *v6;
  id v7;
  void *v8;
  id v9;
  float v10;
  float v11;
  void *v12;
  unint64_t v13;
  void *v14;
  id v15;

  v4 = a3;
  v5 = -[PCNativeShadowStyle init](self, "init");
  v6 = v5;
  if (v4 && v5)
  {
    v7 = objc_alloc((Class)PCNativeColor);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "color"));
    v9 = objc_msgSend(v7, "initWithColor:", v8);
    -[PCNativeShadowStyle setColor:](v6, "setColor:", v9);

    objc_msgSend(v4, "opacity");
    -[PCNativeShadowStyle setOpacity:](v6, "setOpacity:", v10);
    objc_msgSend(v4, "radius");
    -[PCNativeShadowStyle setRadius:](v6, "setRadius:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    if (objc_msgSend(v4, "offsetsCount"))
    {
      v13 = 0;
      do
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)objc_msgSend(v4, "offsets") + v13)));
        objc_msgSend(v12, "addObject:", v14);

        ++v13;
      }
      while (v13 < (unint64_t)objc_msgSend(v4, "offsetsCount"));
    }
    v15 = objc_msgSend(v12, "copy");
    -[PCNativeShadowStyle setOffsets:](v6, "setOffsets:", v15);

  }
  return v6;
}

@end
