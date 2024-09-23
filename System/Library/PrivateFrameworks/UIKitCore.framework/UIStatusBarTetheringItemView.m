@implementation UIStatusBarTetheringItemView

- (BOOL)updateForNewData:(id)a3 actions:(int)a4
{
  int v5;
  int tetheringConnectionCount;

  v5 = *(_DWORD *)(objc_msgSend(a3, "rawData") + 2532);
  tetheringConnectionCount = self->_tetheringConnectionCount;
  if (v5 != tetheringConnectionCount)
    self->_tetheringConnectionCount = v5;
  return v5 != tetheringConnectionCount;
}

- (id)contentsImage
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  -[UIStatusBarItemView imageWithShadowNamed:](self, "imageWithShadowNamed:", CFSTR("DataTypeiOSHotspot"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "size");
  v6 = v5;
  v8 = v7;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), self->_tetheringConnectionCount);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "textColorForStyle:", 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(off_1E167A828, "boldSystemFontOfSize:", 8.5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)off_1E1678D90;
  v28[0] = *(_QWORD *)off_1E1678D98;
  v28[1] = v13;
  v29[0] = v11;
  v29[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  UIFloorToViewScale(self);
  v16 = v15;
  UIFloorToViewScale(self);
  v18 = v17;
  objc_msgSend(v9, "sizeWithAttributes:", v14);
  v20 = v19;
  v21 = v16 + v19;
  if (self->_tetheringConnectionCount <= 0)
    v21 = -0.0;
  v22 = v6 + v21;
  -[UIStatusBarItemView beginImageContextWithMinimumWidth:](self, "beginImageContextWithMinimumWidth:", v6 + v21);
  objc_msgSend(v4, "drawInRect:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v6, v8);
  if (self->_tetheringConnectionCount >= 1)
  {
    -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "height");
    objc_msgSend(v9, "drawInRect:withAttributes:", v14, v6 + v16, v18, v20, v24);

  }
  -[UIStatusBarItemView imageFromImageContextClippedToWidth:](self, "imageFromImageContextClippedToWidth:", v22);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStatusBarItemView endImageContext](self, "endImageContext");
  +[_UILegibilityImageSet imageFromImage:withShadowImage:](_UILegibilityImageSet, "imageFromImage:withShadowImage:", v25, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

@end
