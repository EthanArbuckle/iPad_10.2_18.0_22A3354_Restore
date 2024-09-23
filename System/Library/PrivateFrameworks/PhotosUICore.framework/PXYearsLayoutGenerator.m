@implementation PXYearsLayoutGenerator

- (void)updateContentSize:(CGSize *)a3 itemRects:(CGRect *)a4
{
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
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
  _BOOL4 v23;
  int64_t v24;
  int v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  uint64_t v37;
  double v38;
  CGSize *p_size;
  uint64_t v40;
  id v41;

  v7 = -[PXYearsLayoutGenerator itemCount](self, "itemCount");
  +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
  v41 = (id)objc_claimAutoreleasedReturnValue();
  -[PXYearsLayoutGenerator metrics](self, "metrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "referenceSize");
  v10 = v9;
  objc_msgSend(v8, "padding");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  objc_msgSend(v8, "defaultItemAspectRatio");
  v20 = v19;
  objc_msgSend(v8, "interitemSpacing");
  v22 = v21;
  v23 = objc_msgSend(v8, "sizeClass") == 1 && objc_msgSend(v8, "orientation") == 2;
  v24 = 1;
  if (objc_msgSend(v41, "allowsModularLayoutForZoomLevel:sizeClass:orientation:layoutStyle:", 1, objc_msgSend(v8, "sizeClass"), objc_msgSend(v8, "orientation"), objc_msgSend(v8, "layoutStyle")))
  {
    if (objc_msgSend(v8, "orientation") == 2)
    {
      v25 = objc_msgSend(v41, "useWideModularLayoutInYears");
      v26 = v7 < 9 || v23;
      v27 = 1;
      if (v7 > 3)
        v27 = 2;
      if (v26 == 1)
        v28 = v27;
      else
        v28 = 3;
      v29 = 4;
      v30 = 3;
      v31 = 1;
      if (v7 > 1)
        v31 = 2;
      if (v7 <= 7)
        v30 = v31;
      if (v7 <= 11)
        v29 = v30;
      if (v25)
        v24 = v29;
      else
        v24 = v28;
    }
    else if (v7 <= 5)
    {
      v24 = 1;
    }
    else
    {
      v24 = 2;
    }
  }
  if (objc_msgSend(v41, "forcedNumberOfYearsColumn") >= 1)
    v24 = objc_msgSend(v41, "forcedNumberOfYearsColumn");
  if (v24 <= 1)
  {
    objc_msgSend(v8, "referenceSize");
    v34 = fmax((v10 - v14 - v18 + v20 * v33 * -0.8) * 0.5, 0.0);
    v14 = v14 + v34;
    v18 = v18 + v34;
  }
  else
  {
    objc_msgSend(v8, "multiColumnAspectRatio");
    v20 = v32;
  }
  v35 = (v22 + v10 - (v18 + v14)) / (double)v24 - v22;
  v36 = v35 / v20;
  if (v7 <= 0)
  {
    v38 = v22 + v36;
  }
  else
  {
    v37 = (v24 + v7 / v24 * v24 - v7) % v24;
    v38 = v22 + v36;
    p_size = &a4->size;
    v40 = v7;
    do
    {
      p_size[-1].width = v14 + (double)(v37 % v24) * (v22 + v35);
      p_size[-1].height = v12 + (double)(v37 / v24) * v38;
      p_size->width = v35;
      p_size->height = v36;
      p_size += 2;
      ++v37;
      --v40;
    }
    while (v40);
  }
  a3->width = v10;
  a3->height = v16 + v12 + (double)((v7 + v24 - 1) / v24) * v38 - v22;
  self->_presentedNumberOfColumns = v24;

}

- (int64_t)presentedNumberOfColumns
{
  return self->_presentedNumberOfColumns;
}

@end
