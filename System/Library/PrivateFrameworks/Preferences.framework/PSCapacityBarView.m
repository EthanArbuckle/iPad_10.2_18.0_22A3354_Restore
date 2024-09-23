@implementation PSCapacityBarView

- (PSCapacityBarView)initWithFrame:(CGRect)a3
{
  PSCapacityBarView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PSCapacityBarView;
  v3 = -[PSCapacityBarView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSCapacityBarView setBackgroundColor:](v3, "setBackgroundColor:", v4);

  }
  return v3;
}

- (id)bezierPathWithLineFrom:(CGPoint)a3 to:(CGPoint)a4
{
  double y;
  double x;
  double v6;
  double v7;
  void *v8;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "moveToPoint:", v7, v6);
  objc_msgSend(v8, "addLineToPoint:", x, y);
  return v8;
}

- (void)drawRect:(CGRect)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  uint64_t v20;
  UIColor *barOtherDataColor;
  UIColor *v22;
  UIColor *v23;
  PSCapacityBarCategory *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  UIColor *barBackgroundColor;
  UIColor *v37;
  UIColor *barSeparatorColor;
  UIColor *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  uint64_t j;
  void *v51;
  uint64_t v52;
  double v53;
  double v54;
  double v56;
  double v57;
  CGContext *CurrentContext;
  void *v59;
  void *v60;
  void *v61;
  double v62;
  void *v63;
  double v64;
  double v65;
  void *v66;
  double v67;
  double v68;
  UIColor *v69;
  CGContext *c;
  void *v71;
  void *v72;
  UIColor **p_barSeparatorColor;
  double v74;
  PSCapacityBarView *v75;
  UIColor *v76;
  void *v77;
  double v78;
  double v79;
  uint64_t v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _BYTE v89[128];
  _BYTE v90[128];
  uint64_t v91;
  CGRect v92;
  CGRect v93;

  v91 = *MEMORY[0x1E0C80C00];
  -[PSCapacityBarView traitCollection](self, "traitCollection", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = objc_msgSend(v4, "userInterfaceStyle");

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceLayoutDirection");

  -[PSCapacityBarView barData](self, "barData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "adjustedCategories");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  v10 = objc_msgSend(v7, "capacity");
  v72 = v7;
  v11 = objc_msgSend(v7, "bytesUsed");
  v85 = 0u;
  v86 = 0u;
  if (v11 >= v10)
    v12 = v10;
  else
    v12 = v11;
  v87 = 0uLL;
  v88 = 0uLL;
  v13 = v9;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v85, v90, 16);
  if (v14)
  {
    v15 = v14;
    v16 = 0;
    v17 = *(_QWORD *)v86;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v86 != v17)
          objc_enumerationMutation(v13);
        v19 = objc_msgSend(*(id *)(*((_QWORD *)&v85 + 1) + 8 * i), "bytes");
        v16 += v19 & ~(v19 >> 63);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v85, v90, 16);
    }
    while (v15);
  }
  else
  {
    v16 = 0;
  }

  v20 = v12 - v16;
  if (v12 > v16)
  {
    barOtherDataColor = self->_barOtherDataColor;
    if (barOtherDataColor)
    {
      v22 = barOtherDataColor;
    }
    else
    {
      if (v80 == 2)
        objc_msgSend(MEMORY[0x1E0CEA478], "systemDarkLightMidGrayColor");
      else
        objc_msgSend(MEMORY[0x1E0CEA478], "systemLightMidGrayColor");
      v22 = (UIColor *)objc_claimAutoreleasedReturnValue();
    }
    v23 = v22;
    v24 = -[PSCapacityBarCategory initWithIdentifier:title:color:bytes:]([PSCapacityBarCategory alloc], "initWithIdentifier:title:color:bytes:", CFSTR("_CAT_OTHER_"), &stru_1E4A69238, v22, v20);
    objc_msgSend(v13, "addObject:", v24);

  }
  c = UIGraphicsGetCurrentContext();
  CGContextSaveGState(c);
  -[PSCapacityBarView bounds](self, "bounds");
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "setFill");
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRect:", v26, v28, v30, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "fill");

  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRoundedRect:cornerRadius:", v26, v28, v30, v32, 5.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "addClip");

  v78 = v26;
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRoundedRect:cornerRadius:", v26, v28, v30, v32, 5.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setLineWidth:", 1.0);
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.1);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  barBackgroundColor = self->_barBackgroundColor;
  if (barBackgroundColor)
  {
    v37 = barBackgroundColor;
    p_barSeparatorColor = &self->_barSeparatorColor;
    barSeparatorColor = self->_barSeparatorColor;
    if (!barSeparatorColor)
    {
      if (v80 != 2)
        goto LABEL_30;
LABEL_27:
      objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
      v39 = (UIColor *)objc_claimAutoreleasedReturnValue();
      goto LABEL_31;
    }
LABEL_29:
    v39 = barSeparatorColor;
    goto LABEL_31;
  }
  if (v80 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "_externalSystemExtraDarkGrayColor");
    v37 = (UIColor *)objc_claimAutoreleasedReturnValue();
    p_barSeparatorColor = &self->_barSeparatorColor;
    barSeparatorColor = self->_barSeparatorColor;
    if (!barSeparatorColor)
      goto LABEL_27;
    goto LABEL_29;
  }
  objc_msgSend(MEMORY[0x1E0CEA478], "secondarySystemBackgroundColor");
  v37 = (UIColor *)objc_claimAutoreleasedReturnValue();
  p_barSeparatorColor = &self->_barSeparatorColor;
  barSeparatorColor = self->_barSeparatorColor;
  if (barSeparatorColor)
    goto LABEL_29;
LABEL_30:
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v39 = (UIColor *)objc_claimAutoreleasedReturnValue();
LABEL_31:
  v75 = self;
  v76 = v39;
  v79 = v30 + -1.0;
  -[UIColor setFill](v37, "setFill");
  objc_msgSend(v35, "fill");
  v69 = v37;
  -[UIColor setStroke](v37, "setStroke");
  objc_msgSend(v35, "stroke");
  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  v40 = v13;
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v81, v89, 16);
  v67 = v32;
  v68 = v28;
  if (v41)
  {
    v42 = v41;
    v43 = 0;
    v44 = *(_QWORD *)v82;
    v45 = (double)v10;
    v46 = v78 + v30;
    v47 = v28 + -0.5;
    v48 = v32 + 1.0;
    v74 = v28 + v32 + 0.5;
    v49 = 0.0;
    do
    {
      for (j = 0; j != v42; ++j)
      {
        if (*(_QWORD *)v82 != v44)
          objc_enumerationMutation(v40);
        v51 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * j);
        v52 = objc_msgSend(v51, "bytes", *(_QWORD *)&v67, *(_QWORD *)&v68);
        if (v52 >= 1)
        {
          v43 += v52;
          v53 = floor(v79 * ((double)v43 / v45));
          if (v53 - v49 == 0.0)
            v54 = 1.0;
          else
            v54 = v53 - v49;
          if (v53 - v49 != 0.0 || v53 <= 0.0)
            v56 = v53;
          else
            v56 = v53 + -1.0;
          if (v6 == 1)
            v57 = v46 - v49 - v54;
          else
            v57 = v78 + v49;
          CurrentContext = UIGraphicsGetCurrentContext();
          CGContextSaveGState(CurrentContext);
          v59 = (void *)MEMORY[0x1E0CEA390];
          v92.origin.x = v57;
          v92.origin.y = v47;
          v92.size.width = v54;
          v92.size.height = v48;
          v93 = CGRectInset(v92, -0.5, -0.5);
          objc_msgSend(v59, "bezierPathWithRect:", v93.origin.x, v93.origin.y, v93.size.width, v93.size.height);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "addClip");

          objc_msgSend(v51, "color");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "setFill");

          objc_msgSend(v35, "fill");
          if (v49 > 0.0)
          {
            v62 = -0.0;
            if (v6 == 1)
              v62 = v54;
            -[PSCapacityBarView bezierPathWithLineFrom:to:](v75, "bezierPathWithLineFrom:to:", v62 + v57, v47, v62 + v57, v74);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIColor setStroke](v76, "setStroke");
            objc_msgSend(v63, "stroke");
            if (v80 == 2 && *p_barSeparatorColor)
            {
              objc_msgSend(v77, "setStroke");
              objc_msgSend(v63, "stroke");
            }

          }
          if (v80 == 2)
          {
            objc_msgSend(v77, "setFill");
            objc_msgSend(v35, "fill");
          }
          CGContextRestoreGState(CurrentContext);
          v49 = v56;
        }
      }
      v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v81, v89, 16);
    }
    while (v42);
  }
  else
  {
    v49 = 0.0;
  }

  if (v79 > v49 && objc_msgSend(v40, "count", v79))
  {
    v64 = v79 - v49;
    v65 = -0.0;
    if (v6 != 1)
    {
      v64 = -0.0;
      v65 = v49;
    }
    -[PSCapacityBarView bezierPathWithLineFrom:to:](v75, "bezierPathWithLineFrom:to:", v78 + v65 + v64, v68 + -0.5, v78 + v65 + v64, v68 + v67 + 0.5, *(_QWORD *)&v67, *(_QWORD *)&v68);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIColor setStroke](v76, "setStroke");
    objc_msgSend(v66, "stroke");
    if (v80 == 2 && *p_barSeparatorColor)
    {
      objc_msgSend(v77, "setStroke");
      objc_msgSend(v66, "stroke");
    }

  }
  CGContextRestoreGState(c);

}

- (void)setBarData:(id)a3
{
  PSCapacityBarData *v4;
  PSCapacityBarData *barData;

  v4 = (PSCapacityBarData *)objc_msgSend(a3, "copy");
  barData = self->_barData;
  self->_barData = v4;

  -[PSCapacityBarView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)setBarBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_barBackgroundColor, a3);
  -[PSCapacityBarView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)setBarSeparatorColor:(id)a3
{
  objc_storeStrong((id *)&self->_barSeparatorColor, a3);
  -[PSCapacityBarView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)setBarOtherDataColor:(id)a3
{
  objc_storeStrong((id *)&self->_barOtherDataColor, a3);
  -[PSCapacityBarView setNeedsDisplay](self, "setNeedsDisplay");
}

- (PSCapacityBarData)barData
{
  return self->_barData;
}

- (UIColor)barBackgroundColor
{
  return self->_barBackgroundColor;
}

- (UIColor)barSeparatorColor
{
  return self->_barSeparatorColor;
}

- (UIColor)barOtherDataColor
{
  return self->_barOtherDataColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_barOtherDataColor, 0);
  objc_storeStrong((id *)&self->_barSeparatorColor, 0);
  objc_storeStrong((id *)&self->_barBackgroundColor, 0);
  objc_storeStrong((id *)&self->_barData, 0);
}

@end
