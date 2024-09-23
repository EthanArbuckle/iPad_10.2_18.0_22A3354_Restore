@implementation SXImageComponentSizer

- (double)calculateHeightForWidth:(double)a3 layoutContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;

  v6 = a4;
  -[SXComponentSizer DOMObjectProvider](self, "DOMObjectProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentSizer component](self, "component");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageResourceForIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXComponentSizer componentLayout](self, "componentLayout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "maximumContentWidth");
  v13 = v12;

  v14 = a3;
  if (v13)
  {
    objc_msgSend(v6, "unitConverter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXComponentSizer componentLayout](self, "componentLayout");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "maximumContentWidth");
    objc_msgSend(v15, "convertValueToPoints:", v17, v18);
    v14 = v19;

  }
  if (v14 >= a3)
    v20 = a3;
  else
    v20 = v14;
  objc_msgSend(v10, "heightForImageWidth:", v20);
  v22 = v21;

  return v22;
}

@end
