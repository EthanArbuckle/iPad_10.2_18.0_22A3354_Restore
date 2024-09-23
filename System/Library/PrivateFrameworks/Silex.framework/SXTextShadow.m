@implementation SXTextShadow

- (id)TSDShadow
{
  double v3;
  long double v4;
  long double v5;
  long double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  void *v17;

  -[SXTextShadow offset](self, "offset");
  v4 = v3;
  -[SXTextShadow offset](self, "offset");
  v6 = atan2(v4, v5) * 57.2957795;
  -[SXTextShadow offset](self, "offset");
  v8 = v7 * v7;
  -[SXTextShadow offset](self, "offset");
  v10 = sqrt(v8 + v9 * v9);
  v11 = (void *)MEMORY[0x24BEB3AB8];
  -[SXTextShadow radius](self, "radius");
  v13 = v12;
  -[SXTextShadow opacity](self, "opacity");
  v15 = v14;
  -[SXTextShadow color](self, "color");
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v11, "shadowWithAngle:offset:radius:opacity:color:enabled:", objc_msgSend(v16, "CGColor"), 1, (double)v6, v10, v13, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

@end
