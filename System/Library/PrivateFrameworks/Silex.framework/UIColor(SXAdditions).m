@implementation UIColor(SXAdditions)

- (double)brightness
{
  double v1;
  _QWORD v3[5];
  uint64_t v4;
  double *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = (double *)&v4;
  v6 = 0x2020000000;
  v7 = 0;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __34__UIColor_SXAdditions__brightness__block_invoke;
  v3[3] = &unk_24D68C9F8;
  v3[4] = &v4;
  objc_msgSend(a1, "_getHSBA:", v3);
  v1 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v1;
}

- (void)_getHSBA:()SXAdditions
{
  void (**v4)(_QWORD, double, double, double, double);
  double v5;
  double v6;
  double v7;
  double v8;

  v7 = 0.0;
  v8 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  v4 = a3;
  objc_msgSend(a1, "getHue:saturation:brightness:alpha:", &v8, &v7, &v6, &v5);
  v4[2](v4, v8, v7, v6, v5);

}

- (id)invertedRGB
{
  uint64_t v2;
  double v3;
  double v4;
  double v5;

  v5 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v2 = 0;
  objc_msgSend(a1, "getRed:green:blue:alpha:", &v5, &v4, &v3, &v2);
  v5 = 1.0 - v5;
  v3 = 1.0 - v3;
  v4 = 1.0 - v4;
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)invertedBrightness
{
  uint64_t v2;
  double v3;
  double v4;
  double v5;

  v5 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v2 = 0;
  objc_msgSend(a1, "getHue:saturation:brightness:alpha:", &v5, &v4, &v3, &v2);
  v3 = 1.0 - v3;
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithHue:saturation:brightness:alpha:", v5, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)hex
{
  float v1;
  unint64_t v2;
  float v3;
  unint64_t v4;
  float v5;
  unint64_t v6;
  float v7;
  double v9;
  double v10;
  double v11;
  double v12;

  v11 = 0.0;
  v12 = 0.0;
  v10 = 0.0;
  v9 = 0.0;
  objc_msgSend(a1, "getRed:green:blue:alpha:", &v12, &v11, &v10, &v9);
  v1 = v12 * 255.0;
  v2 = llroundf(v1);
  v3 = v11 * 255.0;
  v4 = llroundf(v3);
  v5 = v10 * 255.0;
  v6 = llroundf(v5);
  v7 = v9 * 255.0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("#%02lX%02lX%02lX%02lX"), v2, v4, v6, llroundf(v7));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)getHue:()SXAdditions saturation:lightness:alpha:
{
  double result;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;

  v26 = 0.0;
  v27 = 0.0;
  v24 = 0.0;
  v25 = 0.0;
  if (objc_msgSend(a1, "getRed:green:blue:alpha:", &v27, &v26, &v25, &v24))
  {
    if (v27 >= v26)
      v11 = v27;
    else
      v11 = v26;
    if (v27 >= v26)
      v12 = v26;
    else
      v12 = v27;
    if (v11 >= v25)
      v13 = v11;
    else
      v13 = v25;
    if (v12 >= v25)
      v14 = v25;
    else
      v14 = v12;
    result = (v13 + v14) * 0.5;
    v15 = 0.0;
    v16 = 0.0;
    if (v13 > v14)
    {
      v17 = v13 - v14;
      v18 = 2.0 - v13 - v14;
      if (result <= 0.5)
        v18 = v13 + v14;
      v16 = v17 / v18;
      v19 = (v27 - v26) / v17 + 4.0;
      if (v26 == v13)
        v19 = (v25 - v27) / v17 + 2.0;
      v20 = (v26 - v25) / v17;
      v21 = 0.0;
      if (v26 < v25)
        v21 = 6.0;
      v22 = v21 + v20;
      if (v27 == v13)
        v23 = v22;
      else
        v23 = v19;
      v15 = v23 / 6.0;
    }
    if (a3)
      *a3 = v15;
    if (a4)
      *a4 = v16;
    if (a5)
      *a5 = result;
    if (a6)
    {
      result = v24;
      *a6 = v24;
    }
  }
  return result;
}

+ (uint64_t)colorWithHue:()SXAdditions saturation:lightness:alpha:
{
  BOOL v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  v5 = a3 < 0.5;
  v6 = a2 + a3 - a3 * a2;
  v7 = (a2 + 1.0) * a3;
  if (v5)
    v6 = v7;
  v8 = -(v6 - a3 * 2.0);
  v9 = a1 + 0.333333343;
  if (a1 + 0.333333343 < 0.0)
    v9 = a1 + 0.333333343 + 1.0;
  if (v9 > 1.0)
    v9 = v9 + -1.0;
  if (v9 < 0.166666672)
  {
    v10 = (v6 - v8) * 6.0;
LABEL_13:
    v11 = v8 + v10 * v9;
    goto LABEL_14;
  }
  v11 = v6;
  if (v9 >= 0.5)
  {
    v11 = v8;
    if (v9 < 0.666666687)
    {
      v10 = (0.666666687 - v9) * (v6 - v8);
      v9 = 6.0;
      goto LABEL_13;
    }
  }
LABEL_14:
  v12 = a1 + 1.0;
  if (a1 >= 0.0)
    v12 = a1;
  if (v12 > 1.0)
    v12 = v12 + -1.0;
  if (v12 < 0.166666672)
  {
    v13 = (v6 - v8) * 6.0;
LABEL_23:
    v14 = v8 + v13 * v12;
    goto LABEL_24;
  }
  v14 = v6;
  if (v12 >= 0.5)
  {
    v14 = v8;
    if (v12 < 0.666666687)
    {
      v13 = (0.666666687 - v12) * (v6 - v8);
      v12 = 6.0;
      goto LABEL_23;
    }
  }
LABEL_24:
  v15 = a1 + -0.333333343;
  if (v15 < 0.0)
    v15 = v15 + 1.0;
  if (v15 > 1.0)
    v15 = v15 + -1.0;
  if (v15 < 0.166666672)
  {
    v16 = (v6 - v8) * 6.0;
LABEL_33:
    v6 = v8 + v16 * v15;
    return objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", v11, v14, v6);
  }
  if (v15 >= 0.5)
  {
    if (v15 >= 0.666666687)
    {
      v6 = v8;
      return objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", v11, v14, v6);
    }
    v16 = (0.666666687 - v15) * (v6 - v8);
    v15 = 6.0;
    goto LABEL_33;
  }
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", v11, v14, v6);
}

- (id)invertedLightness
{
  double v1;
  double v3;
  double v4;
  double v5;
  double v6;

  v6 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  v3 = 0.0;
  objc_msgSend(a1, "getHue:saturation:lightness:alpha:", &v6, &v5, &v4, &v3);
  v1 = 1.0 - v4;
  v4 = 1.0 - v4;
  if (v5 >= 2.22044605e-16)
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithHue:saturation:lightness:alpha:", v6, v5);
  else
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", v1, v1, v1, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)relativeLuminance
{
  double v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v8;
  double v9;
  double v10;

  v9 = 0.0;
  v10 = 0.0;
  v8 = 0.0;
  objc_msgSend(a1, "getRed:green:blue:alpha:", &v10, &v9, &v8, 0);
  v1 = v10 * 255.0;
  if (v10 * 255.0 >= 10.0)
    v2 = pow(v1 / 269.0 + 0.0513, 2.4);
  else
    v2 = v1 / 3294.0;
  v3 = v9 * 255.0;
  if (v9 * 255.0 >= 10.0)
    v4 = pow(v3 / 269.0 + 0.0513, 2.4);
  else
    v4 = v3 / 3294.0;
  v5 = v8 * 255.0;
  if (v8 * 255.0 >= 10.0)
    v6 = pow(v5 / 269.0 + 0.0513, 2.4);
  else
    v6 = v5 / 3294.0;
  return v4 * 0.7152 + v2 * 0.2126 + v6 * 0.0722;
}

@end
