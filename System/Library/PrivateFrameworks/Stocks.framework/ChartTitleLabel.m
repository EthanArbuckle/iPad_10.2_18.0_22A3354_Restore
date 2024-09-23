@implementation ChartTitleLabel

- (ChartTitleLabel)init
{
  ChartTitleLabel *v2;
  LabelSequenceView *v3;
  LabelSequenceView *leftView;
  LabelSequenceView *v5;
  LabelSequenceView *rightView;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ChartTitleLabel;
  v2 = -[ChartTitleLabel init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(LabelSequenceView);
    leftView = v2->_leftView;
    v2->_leftView = v3;

    -[ChartTitleLabel addSubview:](v2, "addSubview:", v3);
    v5 = objc_alloc_init(LabelSequenceView);
    rightView = v2->_rightView;
    v2->_rightView = v5;

    -[ChartTitleLabel addSubview:](v2, "addSubview:", v5);
    -[ChartTitleLabel layer](v2, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNeedsLayoutOnGeometryChange:", 0);

  }
  return v2;
}

- (void)setLabelsHidden:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[LabelSequenceView setHidden:](self->_leftView, "setHidden:");
  -[LabelSequenceView setHidden:](self->_rightView, "setHidden:", v3);
}

- (void)layoutSubviews
{
  CGFloat y;
  double height;
  double v5;
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
  CGRect v17;
  CGRect v18;

  -[ChartTitleLabel bounds](self, "bounds");
  y = v17.origin.y;
  height = v17.size.height;
  v6 = v5 + -32.0;
  v17.origin.x = 16.0;
  v17.size.width = v5 + -32.0;
  if (!CGRectIsEmpty(v17))
  {
    -[LabelSequenceView requiredSize](self->_leftView, "requiredSize");
    v8 = v7;
    v10 = v9;
    -[LabelSequenceView requiredSize](self->_rightView, "requiredSize");
    v13 = v11;
    if (v12 > height)
      v13 = v11 * ((v12 - (v12 - height)) / v12);
    if (v10 > height)
      v8 = v8 * ((v10 - (v10 - height)) / v10);
    v14 = v6 - v8 - v13;
    if (v14 < 15.0)
    {
      v15 = 15.0 - v14;
      v16 = v8 / (v13 + v8);
      v8 = v8 - v16 * v15;
      v13 = v13 - (1.0 - v16) * v15;
    }
    -[LabelSequenceView setFrame:](self->_leftView, "setFrame:", 16.0, 0.0, v8, height);
    v18.origin.x = 16.0;
    v18.origin.y = y;
    v18.size.width = v6;
    v18.size.height = height;
    -[LabelSequenceView setFrame:](self->_rightView, "setFrame:", CGRectGetMaxX(v18) - v13, 0.0, v13, height);
  }
}

- (void)prepareStringsWithStock:(id)a3 width:(double)a4
{
  Stock *v7;
  void *v8;
  Stock *deferredStock;
  void *v10;
  float v11;
  float v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  double *v36;
  double v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  uint64_t v44;
  double v45;
  id v46;
  double v47;
  void *v49;
  unint64_t v50;
  double v51;
  __int128 *v52;
  double v53;
  id v54;
  void *v55;
  double v56;
  void *v57;
  void *v58;
  double v59;
  double v60;
  uint64_t v61;
  unint64_t v62;
  _BOOL4 v63;
  BOOL v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  double v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  LabelSequenceView *leftView;
  double v86;
  double v87;
  double v88;
  double v89;
  LabelSequenceView *rightView;
  double v91;
  double v92;
  __CFString *v93;
  __CFString *v94;
  __CFString *v95;
  void *v96;
  Stock *v97;
  _BOOL4 v98;
  ChartTitleLabel *v99;
  void *v100;
  void *v101;
  _QWORD v102[2];
  _QWORD v103[2];
  _QWORD v104[2];
  _QWORD v105[2];
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  uint64_t v111;

  v111 = *MEMORY[0x24BDAC8D0];
  v7 = (Stock *)a3;
  if (self->_stock != v7)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObserver:", self);
    deferredStock = self->_deferredStock;
    self->_deferredStock = 0;

    objc_storeStrong((id *)&self->_stock, a3);
    if (self->_stock)
    {
      v96 = v8;
      objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__stockWillBeRemoved_, StockWillBeRemovedNotification[0], 0);
      v98 = -[Stock changeIsNegative](v7, "changeIsNegative");
      -[Stock price](v7, "price");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "floatValue");
      v12 = v11;

      v13 = &stru_24D74CF50;
      v14 = &stru_24D74CF50;
      v15 = &stru_24D74CF50;
      if (v12 > 0.0)
      {
        -[Stock formattedPrice](v7, "formattedPrice");
        v15 = (const __CFString *)objc_claimAutoreleasedReturnValue();
        -[Stock formattedChangePercent:](v7, "formattedChangePercent:", 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[Stock formattedChangePercent:](v7, "formattedChangePercent:", 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = CFSTR("+");
        if (v98)
          v18 = CFSTR("-");
        v19 = (void *)MEMORY[0x24BDD16A8];
        v20 = v18;
        objc_msgSend(v19, "stringWithFormat:", CFSTR("%@%@"), v20, v16);
        v14 = (const __CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("%@%@"), v20, v17);
        v13 = (const __CFString *)objc_claimAutoreleasedReturnValue();

      }
      v21 = (void *)MEMORY[0x24BDBCE30];
      -[Stock symbol](v7, "symbol");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v97 = v7;
      -[Stock companyName](v7, "companyName");
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = (void *)v23;
      if (v23)
        v25 = (const __CFString *)v23;
      else
        v25 = &stru_24D74CF50;
      v93 = (__CFString *)v13;
      v94 = (__CFString *)v14;
      v95 = (__CFString *)v15;
      objc_msgSend(v21, "arrayWithObjects:", v22, v25, v15, v14, v13, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      +[StocksStyle sharedStyle](StocksStyle, "sharedStyle");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "lightFontOfSize:", 22.0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v99 = self;
      self->_width = a4;
      v29 = a4 + -15.0;
      objc_msgSend(MEMORY[0x24BDF6750], "defaultParagraphStyle");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)objc_msgSend(v30, "mutableCopy");

      v101 = v31;
      objc_msgSend(v31, "setLineBreakMode:", 5);
      v109 = 0u;
      v110 = 0u;
      v107 = 0u;
      v108 = 0u;
      v106 = 0u;
      v32 = objc_msgSend(v26, "count");
      v33 = *MEMORY[0x24BDF65F8];
      v34 = *MEMORY[0x24BDF6628];
      if (v32)
      {
        v35 = 0;
        v36 = (double *)&v106 + 1;
        v37 = 0.0;
        do
        {
          if (v35 == 1)
          {
            objc_msgSend(v28, "fontWithSize:", 14.0);
            v38 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v38 = v28;
          }
          v39 = v38;
          v104[0] = v33;
          v104[1] = v34;
          v105[0] = v38;
          v105[1] = v101;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v105, v104, 2);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "objectAtIndex:", v35);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "sizeWithAttributes:", v40);
          v43 = v42;
          *(v36 - 1) = v42;
          *(_QWORD *)v36 = v44;

          v37 = v37 + v43;
          ++v35;
          v36 += 2;
        }
        while (v35 < objc_msgSend(v26, "count"));
      }
      else
      {
        v37 = 0.0;
      }
      v45 = v29 + -45.0;
      v46 = v28;
      v47 = 21.0;
      v100 = v46;
      while (v47 >= 14.0 && v37 > v45)
      {
        objc_msgSend(v100, "fontWithSize:", v47);
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v26, "count"))
        {
          v50 = 0;
          if (v47 + -8.0 >= 14.0)
            v51 = v47 + -8.0;
          else
            v51 = 14.0;
          v52 = &v106;
          do
          {
            v53 = *(double *)v52;
            if (v50 == 1)
            {
              objc_msgSend(v100, "fontWithSize:", v51);
              v54 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v54 = v49;
            }
            v55 = v54;
            v56 = v37 - v53;
            v102[0] = v33;
            v102[1] = v34;
            v103[0] = v54;
            v103[1] = v101;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v103, v102, 2);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "objectAtIndex:", v50);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "sizeWithAttributes:", v57);
            v60 = v59;
            *(double *)v52 = v59;
            *((_QWORD *)v52 + 1) = v61;

            v37 = v56 + v60;
            ++v50;
            v62 = objc_msgSend(v26, "count");
            v63 = v37 > v45;
            if (v50 >= v62)
              break;
            ++v52;
          }
          while (v37 > v45);
        }
        else
        {
          v63 = 1;
        }
        v47 = v47 + -1.0;
        v64 = v47 >= 14.0 || !v63;
        v46 = v49;
        if (!v64)
        {
          *(double *)&v107 = *(double *)&v107 - (v37 - v45);
          break;
        }
      }
      objc_msgSend(v26, "objectAtIndex:", 0);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      +[StringDrawingInfo stringDrawingInfoWithString:color:font:size:](StringDrawingInfo, "stringDrawingInfoWithString:color:font:size:", v65, v66, v46, v106);
      v67 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v26, "objectAtIndex:", 1);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.8, 1.0);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = v47 + -8.0;
      if (v47 + -8.0 < 14.0)
        v70 = 14.0;
      objc_msgSend(v100, "fontWithSize:", v70);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      +[StringDrawingInfo stringDrawingInfoWithString:color:font:size:](StringDrawingInfo, "stringDrawingInfoWithString:color:font:size:", v68, v69, v71, v107);
      v72 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v67, v72, 0);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      -[LabelSequenceView setStringDrawingInfoValues:](v99->_leftView, "setStringDrawingInfoValues:", v73);

      +[StocksStyle sharedStyle](StocksStyle, "sharedStyle");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = v74;
      if (v98)
        objc_msgSend(v74, "lossColor");
      else
        objc_msgSend(v74, "gainColor");
      v76 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v26, "objectAtIndex:", 2);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.8, 1.0);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      +[StringDrawingInfo stringDrawingInfoWithString:color:font:size:](StringDrawingInfo, "stringDrawingInfoWithString:color:font:size:", v77, v78, v46, v108);
      v79 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v26, "objectAtIndex:", 3);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      +[StringDrawingInfo stringDrawingInfoWithString:color:font:size:](StringDrawingInfo, "stringDrawingInfoWithString:color:font:size:", v80, v76, v46, v109);
      v81 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v26, "objectAtIndex:", 4);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      +[StringDrawingInfo stringDrawingInfoWithString:color:font:size:](StringDrawingInfo, "stringDrawingInfoWithString:color:font:size:", v82, v76, v46, v110);
      v83 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v79, v81, v83, 0);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      -[LabelSequenceView setStringDrawingInfoValues:](v99->_rightView, "setStringDrawingInfoValues:", v84);

      leftView = v99->_leftView;
      v86 = *MEMORY[0x24BDBEFB0];
      v87 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
      -[LabelSequenceView requiredSize](leftView, "requiredSize");
      v89 = v88;
      -[ChartTitleLabel bounds](v99, "bounds");
      -[LabelSequenceView setFrame:](leftView, "setFrame:", v86, v87, v89);
      rightView = v99->_rightView;
      -[LabelSequenceView requiredSize](rightView, "requiredSize");
      v92 = v91;
      -[ChartTitleLabel bounds](v99, "bounds");
      -[LabelSequenceView setFrame:](rightView, "setFrame:", v86, v87, v92);
      -[LabelSequenceView setNeedsDisplay](v99->_leftView, "setNeedsDisplay");
      -[LabelSequenceView setNeedsDisplay](v99->_rightView, "setNeedsDisplay");
      -[ChartTitleLabel layoutSubviews](v99, "layoutSubviews");

      v8 = v96;
      v7 = v97;
    }

  }
}

- (void)prepareStringsForDeferredStockIfNeeded
{
  if (self->_deferredStock)
    -[ChartTitleLabel prepareStringsWithStock:width:](self, "prepareStringsWithStock:width:", self->_width);
}

- (void)_stockWillBeRemoved:(id)a3
{
  Stock *v4;
  Stock *v5;
  Stock *v6;

  objc_msgSend(a3, "object");
  v4 = (Stock *)objc_claimAutoreleasedReturnValue();
  if (self->_stock == v4)
  {
    self->_stock = 0;
    v5 = v4;

    v4 = v5;
  }
  if (self->_deferredStock == v4)
  {
    self->_deferredStock = 0;
    v6 = v4;

    v4 = v6;
  }

}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[ChartTitleLabel frame](self, "frame");
  v9 = v8;
  v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)ChartTitleLabel;
  -[ChartTitleLabel setFrame:](&v13, sel_setFrame_, x, y, width, height);
  if (v9 != width || v11 != height)
    -[ChartTitleLabel layoutSubviews](self, "layoutSubviews");
}

- (void)setOpaque:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)ChartTitleLabel;
  -[ChartTitleLabel setOpaque:](&v5, sel_setOpaque_);
  -[LabelSequenceView setOpaque:](self->_leftView, "setOpaque:", v3);
  -[LabelSequenceView setOpaque:](self->_rightView, "setOpaque:", v3);
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ChartTitleLabel;
  v4 = a3;
  -[ChartTitleLabel setBackgroundColor:](&v5, sel_setBackgroundColor_, v4);
  -[LabelSequenceView setBackgroundColor:](self->_leftView, "setBackgroundColor:", v4, v5.receiver, v5.super_class);
  -[LabelSequenceView setBackgroundColor:](self->_rightView, "setBackgroundColor:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferredStock, 0);
  objc_storeStrong((id *)&self->_stock, 0);
  objc_storeStrong((id *)&self->_rightView, 0);
  objc_storeStrong((id *)&self->_leftView, 0);
}

@end
