@implementation _TVTintedImageDecorator

- (_TVTintedImageDecorator)initWithTintColor:(id)a3
{
  id v5;
  _TVTintedImageDecorator *v6;
  _TVTintedImageDecorator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_TVTintedImageDecorator;
  v6 = -[TVImageScaleDecorator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_tintColor, a3);

  return v7;
}

- (id)decoratorIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  char **__ptr32 *v10;
  uint64_t v11;
  uint64_t v12;
  float v13;
  void *v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  float v21;
  double v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  float v28;
  void *v29;
  unint64_t v30;
  void *v31;
  unint64_t v32;
  void *v33;
  double v35;
  double v36;
  double v37;
  double v38;
  objc_super v39;

  -[_TVTintedImageDecorator tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v39.receiver = self;
  v39.super_class = (Class)_TVTintedImageDecorator;
  -[TVImageScaleDecorator decoratorIdentifier](&v39, sel_decoratorIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v3, "color");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 || objc_msgSend(v3, "colorType") != 3)
  {
    v9 = v6;
  }
  else
  {
    objc_msgSend(v3, "gradientColors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count") == 1)
    {
      objc_msgSend(v3, "gradientColors");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "firstObject");
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }

  }
  if (v9)
  {
    v37 = 0.0;
    v38 = 0.0;
    v35 = 0.0;
    v36 = 0.0;
    objc_msgSend(v9, "getRed:green:blue:alpha:", &v38, &v37, &v36, &v35);
    objc_msgSend(v5, "appendFormat:", CFSTR("_t"));
    v10 = &off_222E76000;
    LODWORD(v10) = vcvtad_u64_f64(v38 * 255.0);
    LODWORD(v11) = vcvtad_u64_f64(v37 * 255.0);
    LODWORD(v12) = vcvtad_u64_f64(v36 * 255.0);
    v13 = v35;
    objc_msgSend(v5, "appendFormat:", CFSTR("%02X%02X%02X%.1f"), v10, v11, v12, v13);
  }
  else if (objc_msgSend(v3, "colorType") == 3)
  {
    objc_msgSend(v3, "gradientColors");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (v15 >= 2)
    {
      objc_msgSend(v5, "appendFormat:", CFSTR("_t"));
      objc_msgSend(v3, "gradientColors");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");

      if (v17)
      {
        v18 = 0;
        do
        {
          objc_msgSend(v3, "gradientPoints");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectAtIndex:", v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "floatValue");
          v22 = v21;

          objc_msgSend(v3, "gradientColors");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectAtIndex:", v18);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          v37 = 0.0;
          v38 = 0.0;
          v35 = 0.0;
          v36 = 0.0;
          objc_msgSend(v24, "getRed:green:blue:alpha:", &v38, &v37, &v36, &v35);
          LODWORD(v25) = vcvtad_u64_f64(v38 * 255.0);
          LODWORD(v26) = vcvtad_u64_f64(v37 * 255.0);
          LODWORD(v27) = vcvtad_u64_f64(v36 * 255.0);
          v28 = v35;
          objc_msgSend(v5, "appendFormat:", CFSTR("%.2f:%02X%02X%02X%.1f"), *(_QWORD *)&v22, v25, v26, v27, v28);
          objc_msgSend(v3, "gradientColors");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "count") - 1;

          if (v18 < v30)
            objc_msgSend(v5, "appendString:", CFSTR(","));

          ++v18;
          objc_msgSend(v3, "gradientColors");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "count");

        }
        while (v18 < v32);
      }
    }
  }
  v33 = (void *)objc_msgSend(v5, "copy");

  return v33;
}

- (void)drawInContext:(id)a3 imageRect:(CGRect)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  CGContext *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  CGFloat *v19;
  CGFloat *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  CGGradient *v28;
  double *v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double *v38;
  CGFloat *locations;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[5];
  _BYTE v45[128];
  uint64_t v46;
  CGRect v47;

  height = a4.size.height;
  width = a4.size.width;
  v46 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  -[_TVTintedImageDecorator tintColor](self, "tintColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (CGContext *)objc_msgSend(v7, "CGContext");
    CGContextSaveGState(v9);
    CGContextTranslateCTM(v9, 0.0, height);
    CGContextScaleCTM(v9, 1.0, -1.0);
    objc_msgSend(v8, "color");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 || objc_msgSend(v8, "colorType") != 3)
    {
      v13 = v10;
    }
    else
    {
      objc_msgSend(v8, "gradientColors");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "count") == 1)
      {
        objc_msgSend(v8, "gradientColors");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "firstObject");
        v13 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v13 = 0;
      }

    }
    if (v13)
    {
      objc_msgSend(v8, "color");
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      CGContextSetFillColorWithColor(v9, (CGColorRef)objc_msgSend(v14, "CGColor"));

      v47.origin.x = 0.0;
      v47.origin.y = 0.0;
      v47.size.width = width;
      v47.size.height = height;
      CGContextFillRect(v9, v47);
    }
    else if (objc_msgSend(v8, "colorType") == 3)
    {
      objc_msgSend(v8, "gradientColors");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");

      if (v16 >= 2)
      {
        objc_msgSend(v8, "gradientPoints");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "count");

        v19 = (CGFloat *)malloc_type_malloc(8 * v18, 0x100004000313F17uLL);
        if (v19)
        {
          v20 = v19;
          objc_msgSend(v8, "gradientPoints");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v44[0] = MEMORY[0x24BDAC760];
          v44[1] = 3221225472;
          v44[2] = __51___TVTintedImageDecorator_drawInContext_imageRect___block_invoke;
          v44[3] = &__block_descriptor_40_e25_v32__0__NSNumber_8Q16_B24l;
          locations = v20;
          v44[4] = v20;
          objc_msgSend(v21, "enumerateObjectsUsingBlock:", v44);

          objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v18);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = 0u;
          v41 = 0u;
          v42 = 0u;
          v43 = 0u;
          objc_msgSend(v8, "gradientColors");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
          if (v24)
          {
            v25 = v24;
            v26 = *(_QWORD *)v41;
            do
            {
              for (i = 0; i != v25; ++i)
              {
                if (*(_QWORD *)v41 != v26)
                  objc_enumerationMutation(v23);
                objc_msgSend(v22, "addObject:", objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i)), "CGColor"));
              }
              v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
            }
            while (v25);
          }

          v28 = CGGradientCreateWithColors(0, (CFArrayRef)v22, locations);
          v29 = (double *)MEMORY[0x24BDBEFB0];
          v30 = objc_msgSend(v8, "gradientDirectionType");
          v31 = *locations;
          if (v30 == 1)
          {
            v32 = *v29;
            v33 = height * (1.0 - v31);
            v34 = height * (1.0 - locations[v18 - 1]);
            v35 = v34 - v33;
            v36 = *v29;
          }
          else
          {
            v33 = v29[1];
            v32 = width * v31;
            v36 = width * locations[v18 - 1];
            v35 = v36 - width * v31;
            v34 = v33;
            height = width;
          }
          if (v18)
          {
            v37 = fabs(v35);
            v38 = locations;
            do
            {
              *v38 = height * (*v38 - v31) / v37;
              ++v38;
              --v18;
            }
            while (v18);
          }
          if (v28)
          {
            CGContextDrawLinearGradient(v9, v28, *(CGPoint *)&v32, *(CGPoint *)&v36, 0);
            CGGradientRelease(v28);
          }
          free(locations);

        }
      }
    }
    CGContextRestoreGState(v9);

  }
}

- (IKColor)tintColor
{
  return self->_tintColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
}

@end
