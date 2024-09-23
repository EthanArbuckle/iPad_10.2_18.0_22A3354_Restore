@implementation SXQuickLookComponentSizer

- (double)calculateHeightForWidth:(double)a3 layoutContext:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v17;
  double v18;

  v6 = a4;
  -[SXComponentSizer componentLayout](self, "componentLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minimumHeight");
  v9 = v8;

  objc_msgSend(v6, "unitConverter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[SXComponentSizer componentLayout](self, "componentLayout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "minimumHeight");
    objc_msgSend(v10, "convertValueToPoints:", v12, v13);
    v15 = v14;

    return v15;
  }
  else
  {
    objc_msgSend(v10, "convertValueToPoints:", 0x4049000000000000, 2);
    v18 = v17;

    if (v18 <= a3)
      return v18;
    else
      return a3;
  }
}

@end
