@implementation UIPrintSheetController

- (UIPrintSheetController)initWithPrintInfo:(id)a3 printPageImageDelegate:(id)a4
{
  id v6;
  id v7;
  UIPrintSheetController *v8;
  UIPrintSheetController *v9;
  UIPrintPagesController *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UIPrintSheetController;
  v8 = -[UIPrintSheetController init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    -[UIPrintSheetController setPrintInfo:](v8, "setPrintInfo:", v6);
    v10 = -[UIPrintPagesController initWithPrintInfo:delegate:]([UIPrintPagesController alloc], "initWithPrintInfo:delegate:", v6, v7);
    -[UIPrintSheetController setPagesController:](v9, "setPagesController:", v10);

  }
  return v9;
}

- (void)dealloc
{
  int64_t *selectionPageMap;
  objc_super v4;

  selectionPageMap = self->_selectionPageMap;
  if (selectionPageMap)
    free(selectionPageMap);
  v4.receiver = self;
  v4.super_class = (Class)UIPrintSheetController;
  -[UIPrintSheetController dealloc](&v4, sel_dealloc);
}

- (int64_t)numberOfPagesInSelection
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[UIPrintSheetController printInfo](self, "printInfo", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pageRanges");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "rangeValue");
        v6 += v9;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)updateSelectionPageMap
{
  int64_t *selectionPageMap;
  int64_t *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int64_t *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  selectionPageMap = self->_selectionPageMap;
  if (selectionPageMap)
    free(selectionPageMap);
  v4 = (int64_t *)malloc_type_calloc(-[UIPrintSheetController numberOfPagesInSelection](self, "numberOfPagesInSelection"), 8uLL, 0x100004000313F17uLL);
  self->_selectionPageMap = v4;
  if (v4)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[UIPrintSheetController printInfo](self, "printInfo", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pageRanges");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v18;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v6);
          v12 = objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v11), "rangeValue");
          if (v13)
          {
            v14 = v13 + v9;
            v15 = v12 + 1;
            v16 = &self->_selectionPageMap[v9];
            do
            {
              *v16++ = v15++;
              --v13;
            }
            while (v13);
            v9 = v14;
          }
          ++v11;
        }
        while (v11 != v8);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v8);
    }

  }
}

- (int64_t)numberOfSheets:(BOOL)a3
{
  void *v5;
  int64_t v6;
  uint64_t v7;
  float v8;
  void *v9;
  uint64_t v10;
  void *v11;

  -[UIPrintSheetController printInfo](self, "printInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "pageCount");

  if (!a3)
  {
    v7 = -[UIPrintSheetController numberOfPagesInSelection](self, "numberOfPagesInSelection");
    if (v7 >= 1)
    {
      v8 = (float)v7;
      -[UIPrintSheetController printInfo](self, "printInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "numNUpColumns");
      -[UIPrintSheetController printInfo](self, "printInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = vcvtps_s32_f32(v8 / (float)(objc_msgSend(v11, "numNUpRows") * v10));

    }
  }
  return v6;
}

- (CGSize)sizeForSheetNum:(int64_t)a3 showingPageView:(BOOL)a4
{
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  -[UIPrintSheetController pagesController](self, "pagesController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sizeForPageNum:", a3);
  v9 = v8;
  v11 = v10;

  if (!a4)
  {
    -[UIPrintSheetController printInfo](self, "printInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "numNUpRows");
    -[UIPrintSheetController printInfo](self, "printInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "numNUpColumns");

    if (v13 != v15)
    {
      v16 = v9 / v11;
      if (v9 / v11 <= 1.0)
        v9 = v11 / v16;
      else
        v11 = v9 * v16;
    }
  }
  v17 = v9;
  v18 = v11;
  result.height = v18;
  result.width = v17;
  return result;
}

- (id)imageForSheetNum:(int64_t)a3 showingPageView:(BOOL)a4
{
  void *v6;
  void *v7;
  int64_t v8;
  uint64_t v9;
  void *v10;
  char v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  CGColorSpace *DeviceRGB;
  CGColorSpace *v21;
  void *v22;
  int v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  BOOL v29;
  double v30;
  double v31;
  double v32;
  double v33;
  int64_t v34;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  double v42;
  double v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  double v47;
  uint64_t v48;
  double v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  id v54;
  CGImage *v55;
  CGImageRef Image;
  double v57;
  double v58;
  double v59;
  CGAffineTransform v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  CGRect v64;

  if (a4)
  {
    -[UIPrintSheetController pagesController](self, "pagesController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = a3;
    v9 = 1;
LABEL_20:
    objc_msgSend(v6, "imageForPageNum:showingPageView:", v8, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    return v14;
  }
  -[UIPrintSheetController printInfo](self, "printInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "nUpActive");

  if ((v11 & 1) == 0)
  {
    v34 = -[UIPrintSheetController convertSelectionPageNumToPageNum:](self, "convertSelectionPageNumToPageNum:", a3);
    -[UIPrintSheetController pagesController](self, "pagesController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = v34;
    v9 = 0;
    goto LABEL_20;
  }
  -[UIPrintSheetController sizeForSheetNum:showingPageView:](self, "sizeForSheetNum:showingPageView:", a3, 0);
  v14 = 0;
  v15 = ceil(v12);
  if (v15 > 0.0)
  {
    v16 = v13;
    if (v13 > 0.0)
    {
      v17 = v12;
      -[UIPrintSheetController printInfo](self, "printInfo");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "outputType") != 2)
      {
        -[UIPrintSheetController printInfo](self, "printInfo");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v19, "outputType") != 3)
        {
          -[UIPrintSheetController printInfo](self, "printInfo");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "currentPrinter");
          v37 = objc_claimAutoreleasedReturnValue();
          if (v37)
          {
            v38 = (void *)v37;
            -[UIPrintSheetController printInfo](self, "printInfo");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "currentPrinter");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = objc_msgSend(v40, "supportsColor");

            if ((v41 & 1) == 0)
              goto LABEL_10;
          }
          else
          {

          }
          DeviceRGB = CGColorSpaceCreateDeviceRGB();
LABEL_11:
          v21 = DeviceRGB;
          v14 = CGBitmapContextCreate(0, (unint64_t)v15, (unint64_t)v16, 8uLL, vcvtd_n_u64_f64(v15, 2uLL), DeviceRGB, 1u);
          CGColorSpaceRelease(v21);
          if (v14)
          {
            eraseCGBitmapContext((CGContext *)v14);
            CGContextScaleCTM((CGContextRef)v14, v15 / v17, v16 / v16);
            CGContextSaveGState((CGContextRef)v14);
            -[UIPrintSheetController printInfo](self, "printInfo");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "flipHorizontal");

            if (v23)
            {
              CGContextTranslateCTM((CGContextRef)v14, v17, 0.0);
              CGContextScaleCTM((CGContextRef)v14, -1.0, 1.0);
            }
            -[UIPrintSheetController getNUpLayout](self, "getNUpLayout");
            v25 = v24;
            v27 = v26;
            v28 = v17 / v24;
            v29 = v26 == v25;
            v30 = v16 / v26;
            if (v29)
            {
              v42 = v28 / v17;
              v43 = v30 / v16;
              if (v42 >= v43)
                v42 = v43;
              v58 = v17;
              v59 = v42;
              v57 = v16;
            }
            else
            {
              v31 = v28 / v16;
              v32 = v30 / v17;
              if (v31 >= v32)
                v33 = v32;
              else
                v33 = v31;
              v59 = v33;
              CGContextTranslateCTM((CGContextRef)v14, (v17 + -(v16 * v33) * v25) * 0.5, (v16 + -(v17 * v33) * v27) * 0.5);
              v57 = v17;
              v58 = v16;
            }
            -[UIPrintSheetController printInfo](self, "printInfo");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = objc_msgSend(v44, "pageCount");

            if (v27 > 0.0)
            {
              v46 = (uint64_t)(v27 * v25 * (double)(a3 - 1));
              v47 = 0.0;
              do
              {
                if (v25 <= 0.0)
                {
                  v47 = v47 + 1.0;
                }
                else
                {
                  v48 = (uint64_t)v47;
                  v47 = v47 + 1.0;
                  v49 = 0.0;
                  do
                  {
                    v50 = -[UIPrintSheetController pageOffsetForRow:column:nUpLayout:](self, "pageOffsetForRow:column:nUpLayout:", v48, (uint64_t)v49, v25, v27)+ v46;
                    if (v50 < v45)
                    {
                      v51 = v50 + 1;
                      if (-[UIPrintSheetController convertSelectionPageNumToPageNum:](self, "convertSelectionPageNumToPageNum:", v50 + 1) >= 1)
                      {
                        -[UIPrintSheetController pagesController](self, "pagesController");
                        v52 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v52, "imageForPageNum:showingPageView:", -[UIPrintSheetController convertSelectionPageNumToPageNum:](self, "convertSelectionPageNumToPageNum:", v51), 0);
                        v53 = (void *)objc_claimAutoreleasedReturnValue();

                        if (v53)
                        {
                          CGContextSaveGState((CGContextRef)v14);
                          CGContextTranslateCTM((CGContextRef)v14, v58 * (v59 * v49), v57 * (v59 * (v27 - v47)));
                          v62 = 0u;
                          v63 = 0u;
                          v61 = 0u;
                          CGContextGetBaseCTM();
                          CGContextGetCTM(&v60, (CGContextRef)v14);
                          CGContextSetBaseCTM();
                          v54 = objc_retainAutorelease(v53);
                          v55 = (CGImage *)objc_msgSend(v54, "CGImage");
                          v64.origin.x = 0.0;
                          v64.origin.y = 0.0;
                          v64.size.width = v59 * v58;
                          v64.size.height = v59 * v57;
                          CGContextDrawImage((CGContextRef)v14, v64, v55);
                          CGContextSetBaseCTM();
                          CGContextRestoreGState((CGContextRef)v14);

                        }
                      }
                    }
                    v49 = v49 + 1.0;
                  }
                  while (v49 < v25);
                }
              }
              while (v47 < v27);
            }
            Image = CGBitmapContextCreateImage((CGContextRef)v14);
            CGContextRelease((CGContextRef)v14);
            if (Image)
            {
              v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithCGImage:", Image);
              CFRelease(Image);
            }
            else
            {
              v14 = 0;
            }
          }
          return v14;
        }

      }
LABEL_10:
      DeviceRGB = CGColorSpaceCreateDeviceGray();
      goto LABEL_11;
    }
  }
  return v14;
}

- (int64_t)convertSelectionPageNumToPageNum:(int64_t)a3
{
  int64_t v6;

  if (!self->_selectionPageMap)
    -[UIPrintSheetController updateSelectionPageMap](self, "updateSelectionPageMap");
  if (-[UIPrintSheetController numberOfPagesInSelection](self, "numberOfPagesInSelection") < a3)
    return 0;
  if (a3 <= 1)
    v6 = 1;
  else
    v6 = a3;
  return self->_selectionPageMap[v6 - 1];
}

- (CGSize)getNUpLayout
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  -[UIPrintSheetController printInfo](self, "printInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (double)objc_msgSend(v3, "numNUpRows");

  -[UIPrintSheetController printInfo](self, "printInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (double)objc_msgSend(v5, "numNUpColumns");

  -[UIPrintSheetController pagesController](self, "pagesController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sizeForPageNum:", 1);
  v9 = v8;
  v11 = v10;

  if (v6 >= v4)
    v12 = v6;
  else
    v12 = v4;
  if (v6 >= v4)
    v13 = v4;
  else
    v13 = v6;
  if (v11 <= v9)
    v14 = v13;
  else
    v14 = v12;
  if (v11 > v9)
    v12 = v13;
  result.height = v12;
  result.width = v14;
  return result;
}

- (int64_t)pageOffsetForRow:(int64_t)a3 column:(int64_t)a4 nUpLayout:(CGSize)a5
{
  double height;
  double width;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  int64_t v15;

  height = a5.height;
  width = a5.width;
  -[UIPrintSheetController printInfo](self, "printInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "nUpLayoutDirection");
  v11 = width - (double)(a4 + 1);
  v12 = v11 + (double)a3 * width;
  v13 = (double)a3 + v11 * height;
  v14 = (double)a4 + (double)a3 * width;
  if (v10 == 3)
    v14 = v13;
  if (v10 == 2)
    v14 = (double)a3 + (double)a4 * height;
  if (v10 == 1)
    v14 = v12;
  v15 = (uint64_t)v14;

  return v15;
}

- (void)clearPagesCache
{
  id v2;

  -[UIPrintSheetController pagesController](self, "pagesController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearPagesCache");

}

- (void)generateWebKitThumbnailsWithCompletionBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UIPrintSheetController pagesController](self, "pagesController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "generateWebKitThumbnailsWithCompletionBlock:", v4);

}

- (void)recalculateWebKitPageCount
{
  id v2;

  -[UIPrintSheetController pagesController](self, "pagesController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recalculateWebKitPageCount");

}

- (UIPrintInfo)printInfo
{
  return self->_printInfo;
}

- (void)setPrintInfo:(id)a3
{
  objc_storeStrong((id *)&self->_printInfo, a3);
}

- (UIPrintPagesController)pagesController
{
  return self->_pagesController;
}

- (void)setPagesController:(id)a3
{
  objc_storeStrong((id *)&self->_pagesController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pagesController, 0);
  objc_storeStrong((id *)&self->_printInfo, 0);
}

@end
