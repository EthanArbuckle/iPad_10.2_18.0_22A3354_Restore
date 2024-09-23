@implementation SXAudioComponentSizer

- (double)calculateHeightForWidth:(double)a3 layoutContext:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v14;

  -[SXComponentSizer DOMObjectProvider](self, "DOMObjectProvider", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentSizer component](self, "component");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stillImageIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageResourceForIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "dimensions");
  v12 = 0.0;
  if (v10 != *MEMORY[0x24BDBF148] || v11 != *(double *)(MEMORY[0x24BDBF148] + 8))
    v12 = v11 * (a3 / v10);
  if (v12 >= 48.0)
    v14 = v12;
  else
    v14 = 48.0;

  return v14;
}

@end
