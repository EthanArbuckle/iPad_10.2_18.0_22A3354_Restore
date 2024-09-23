@implementation NSString(WeatherStringAdditions)

- (void)drawAtPoint:()WeatherStringAdditions forWidth:withFont:fontColor:shadowColor:
{
  id v14;
  id v15;
  double v16;
  id v17;

  v14 = a1;
  v15 = a7;
  v17 = a6;
  objc_msgSend(a8, "setFill");
  v16 = a4;
  objc_msgSend(v14, "_legacy_drawAtPoint:forWidth:withFont:lineBreakMode:", v17, 4, a2, a3 + 1.0, v16);
  objc_msgSend(v15, "setFill");

  objc_msgSend(v14, "_legacy_drawAtPoint:forWidth:withFont:lineBreakMode:", v17, 4, a2, a3, v16);
}

- (void)drawWithDegreeAtPoint:()WeatherStringAdditions font:degreeFont:degreeOffset:
{
  void *v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;

  v21 = a8;
  v14 = (void *)MEMORY[0x24BDD17C8];
  v15 = a7;
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%C"), (unsigned __int16)WeatherDegreeChar);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = IsNumberRTL();
  objc_msgSend(a1, "_legacy_sizeWithFont:", v15);
  v18 = v17;
  objc_msgSend(v16, "_legacy_sizeWithFont:", v21);
  v20 = v19;
  if ((_DWORD)v14)
  {
    objc_msgSend(a1, "_legacy_drawAtPoint:forWidth:withFont:lineBreakMode:", v15, 2, a4 + a2 + v19, a3, v18);

  }
  else
  {
    objc_msgSend(a1, "_legacy_drawAtPoint:forWidth:withFont:lineBreakMode:", v15, 2, a2, a3, v18);

    a2 = a4 + a2 + v18;
  }
  objc_msgSend(v16, "_legacy_drawAtPoint:forWidth:withFont:lineBreakMode:", v21, 2, a2, a3 + a5, v20);

}

- (double)sizeWithDegreeWithFont:()WeatherStringAdditions degreeFont:degreeOffset:
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;

  v8 = (void *)MEMORY[0x24BDD17C8];
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%C"), (unsigned __int16)WeatherDegreeChar);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_legacy_sizeWithFont:", v10);
  v13 = v12;

  objc_msgSend(v11, "_legacy_sizeWithFont:", v9);
  v15 = v14;

  return v13 + a2 + v15;
}

@end
