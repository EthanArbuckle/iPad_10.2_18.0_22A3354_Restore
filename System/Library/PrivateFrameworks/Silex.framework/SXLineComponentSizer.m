@implementation SXLineComponentSizer

- (double)calculateHeightForWidth:(double)a3 layoutContext:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double result;

  objc_msgSend(a4, "unitConverter", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentSizer component](self, "component");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stroke");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "width");
  objc_msgSend(v5, "convertValueToPoints:", v8, v9);
  v11 = v10;

  result = 1.0;
  if (v11 >= 1.0)
    return v11;
  return result;
}

@end
