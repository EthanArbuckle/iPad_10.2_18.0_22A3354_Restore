@implementation SXUnitConverterFactory

- (id)createUnitConverterWithComponentWidth:(double)a3 parentWidth:(double)a4 layoutOptions:(id)a5
{
  id v7;
  SXUnitConverter *v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  SXUnitConverter *v21;

  v7 = a5;
  v8 = [SXUnitConverter alloc];
  objc_msgSend(v7, "columnLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (double)objc_msgSend(v9, "gutter");
  objc_msgSend(v7, "columnLayout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "leftMargin");
  v13 = v12;
  objc_msgSend(v7, "columnLayout");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "viewportSize");
  v16 = v15;
  v18 = v17;
  objc_msgSend(v7, "contentScaleFactor");
  v20 = v19;

  v21 = -[SXUnitConverter initWithComponentWidth:parentWidth:documentGutter:documentMargin:viewportSize:contentScaleFactor:](v8, "initWithComponentWidth:parentWidth:documentGutter:documentMargin:viewportSize:contentScaleFactor:", a3, a4, v10, v13, v16, v18, v20);
  return v21;
}

@end
