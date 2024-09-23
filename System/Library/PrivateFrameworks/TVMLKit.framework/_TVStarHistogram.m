@implementation _TVStarHistogram

+ (id)histogramViewWithElement:(id)a3 existingView:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v5 = a4;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v5;
    objc_msgSend(v7, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "subviews");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = v10;
      objc_msgSend(v11, "contentView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "subviews");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "firstObject");
      v14 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v14 = v10;
      else
        v14 = 0;
      v11 = 0;
    }
    objc_msgSend(v7, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "subviews");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "makeObjectsPerformSelector:", sel_removeFromSuperview);

    objc_msgSend((id)objc_opt_class(), "_histogramViewWithElement:existingView:", v6, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSubview:", v17);

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v7, "setAllowsFocus:", 0);

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_histogramViewWithElement:existingView:", v6, v5);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v10 = v6;
  }

  return v7;
}

+ (id)_histogramViewWithElement:(id)a3 existingView:(id)a4
{
  id v5;
  id v6;
  _TVStarHistogram *v7;
  _TVStarHistogram *v8;
  _TVStarHistogram *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  _TVStarBar *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  float v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _TVStarHistogram *v47;
  _TVStarHistogram *v49;
  void *v50;
  void *v51;
  void *v52;
  id obj;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_opt_class();
  v50 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (_TVStarHistogram *)v6;
  }
  else
  {
    v8 = [_TVStarHistogram alloc];
    v7 = -[_TVStarHistogram initWithFrame:](v8, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  }
  v9 = v7;
  objc_msgSend(v5, "style");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "tv_width");
  v12 = v11;
  objc_msgSend(v5, "style");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "tv_height");
  v49 = v9;
  -[_TVStarHistogram setFrame:](v9, "setFrame:", 0.0, 0.0, v12, v14);

  v51 = v5;
  v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 5);
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  objc_msgSend(v5, "children");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
  if (v15)
  {
    v16 = v15;
    v17 = 0;
    v18 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v55 != v18)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
        if (objc_msgSend(v20, "tv_elementType") == 84)
        {
          v21 = objc_alloc_init(_TVStarBar);
          objc_msgSend(v20, "attributes");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("numStars"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[_TVStarBar setNumStars:](v21, "setNumStars:", objc_msgSend(v23, "integerValue"));

          objc_msgSend(v20, "attributes");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("value"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "floatValue");
          -[_TVStarBar setValue:](v21, "setValue:", v26);

          objc_msgSend(v52, "addObject:", v21);
          if (!v17)
          {
            objc_msgSend(v20, "style");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "tv_tintColor");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "color");
            v17 = (void *)objc_claimAutoreleasedReturnValue();

          }
          objc_msgSend(v20, "tv_attributedString");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[_TVStarBar setCountStr:](v21, "setCountStr:", v29);

          objc_msgSend(v20, "style");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "tv_margin");
          -[_TVStarBar setBarMargin:](v21, "setBarMargin:");

          objc_msgSend(v20, "style");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "tv_width");
          -[_TVStarBar setBarWidth:](v21, "setBarWidth:");

          objc_msgSend(v20, "style");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "tv_height");
          -[_TVStarBar setHeight:](v21, "setHeight:");

        }
      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
    }
    while (v16);
  }
  else
  {
    v17 = 0;
  }

  objc_msgSend(v51, "style");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "tv_backgroundColor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "color");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v35;
  if (v35)
  {
    v37 = v35;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v37 = (id)objc_claimAutoreleasedReturnValue();
  }
  v38 = v37;

  -[_TVStarHistogram setBackgroundColor:](v49, "setBackgroundColor:", v38);
  -[_TVStarHistogram setStarBars:](v49, "setStarBars:", v52);
  v39 = (void *)MEMORY[0x24BDF6AC8];
  +[TVMLUtilities TVMLKitBundle](TVMLUtilities, "TVMLKitBundle");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "imageNamed:inBundle:", CFSTR("star_mask_s"), v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 1.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v17, "colorWithAlphaComponent:", 0.3);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "_flatImageWithColor:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVStarHistogram setStarImage:](v49, "setStarImage:", v43);

  objc_msgSend(v17, "colorWithAlphaComponent:", 0.15);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVStarHistogram setBarEmptyColor:](v49, "setBarEmptyColor:", v44);

  objc_msgSend(v17, "colorWithAlphaComponent:", 0.6);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVStarHistogram setBarFillColor:](v49, "setBarFillColor:", v45);

  objc_msgSend(v51, "style");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "tv_lineSpacing");
  -[_TVStarHistogram setLineSpacing:](v49, "setLineSpacing:");

  v47 = v49;
  return v47;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (void)drawRect:(CGRect)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t i;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  float v18;
  float v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  double v27;
  uint64_t v28;
  double v29;
  uint64_t j;
  void *v31;
  CGContext *CurrentContext;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  unint64_t v42;
  double v43;
  float v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  void *v53;
  float v54;
  double v55;
  double width;
  NSArray *obj;
  double v58;
  double v59;
  double v60;
  double v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  width = a3.size.width;
  v72 = *MEMORY[0x24BDAC8D0];
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v4 = self->_starBars;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v67;
    v8 = *MEMORY[0x24BDBF148];
    v9 = *(double *)(MEMORY[0x24BDBF148] + 8);
    v10 = 0.0;
    v11 = 0.0;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v67 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * i), "countStr");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "boundingRectWithSize:options:context:", 1, 0, v8, v9);
        v15 = v14;
        v17 = v16;

        v11 = fmax(v11, v15);
        if (v10 == 0.0)
          v10 = v17;
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
    }
    while (v6);
    v18 = v10;
    v19 = v11;
  }
  else
  {
    v18 = 0.0;
    v19 = 0.0;
  }

  -[UIImage size](self->_starImage, "size");
  v21 = v20;
  v23 = v22;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  obj = self->_starBars;
  v24 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
  if (v24)
  {
    v25 = v24;
    v26 = 0;
    v27 = ceilf(v19);
    v28 = *(_QWORD *)v63;
    v55 = v21 * 5.0 + 20.0;
    v58 = ceilf(v18);
    v59 = 0.0;
    v29 = 0.0;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v63 != v28)
          objc_enumerationMutation(obj);
        v31 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * j);
        CurrentContext = UIGraphicsGetCurrentContext();
        CGContextSaveGState(CurrentContext);
        objc_msgSend(v31, "barMargin");
        v34 = v33;
        v36 = v35;
        objc_msgSend(v31, "barWidth");
        v38 = v37;
        objc_msgSend(v31, "height");
        v60 = v39;
        if ((v26 & 1) != 0)
        {
          v40 = v59;
        }
        else
        {
          v41 = width - (v38 + v36 + v55 + v34);
          v27 = fmin(v27, v41);
          *(float *)&v41 = (v41 - v27) * 0.5;
          v40 = floorf(*(float *)&v41);
        }
        v61 = v27;
        v42 = 5;
        v59 = v40;
        do
        {
          if (objc_msgSend(v31, "numStars", *(_QWORD *)&v55) >= v42)
            -[UIImage drawInRect:](self->_starImage, "drawInRect:", v40, v29, v21, v23);
          v40 = v21 + 5.0 + v40;
          --v42;
        }
        while (v42);
        v43 = v34 + v40;
        v44 = v29 + (v60 + -6.0) * 0.5;
        v45 = floorf(v44);
        objc_msgSend(v31, "barWidth");
        v47 = v46;
        objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithRoundedRect:cornerRadius:", v43, v45, v46, 6.0, 2.0);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIColor set](self->_barEmptyColor, "set");
        objc_msgSend(v48, "fill");
        objc_msgSend(v31, "value");
        objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithRoundedRect:cornerRadius:", v43, v45, v47 * fmax(fmin(v49, 1.0), 0.0), 6.0, 2.0);
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        -[UIColor set](self->_barFillColor, "set");
        objc_msgSend(v50, "fill");
        objc_msgSend(v31, "barWidth");
        v52 = v43 + v36 + v51;
        objc_msgSend(v31, "countStr");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = v29 + (v60 - v58) * 0.5;
        v27 = v61;
        objc_msgSend(v53, "drawInRect:", v52, floorf(v54), v61);

        v29 = v29 + v60 + self->_lineSpacing;
        CGContextRestoreGState(CurrentContext);

        v26 = 1;
      }
      v25 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
    }
    while (v25);
  }

}

- (NSArray)starBars
{
  return self->_starBars;
}

- (void)setStarBars:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (UIImage)starImage
{
  return self->_starImage;
}

- (void)setStarImage:(id)a3
{
  objc_storeStrong((id *)&self->_starImage, a3);
}

- (UIColor)barEmptyColor
{
  return self->_barEmptyColor;
}

- (void)setBarEmptyColor:(id)a3
{
  objc_storeStrong((id *)&self->_barEmptyColor, a3);
}

- (UIColor)barFillColor
{
  return self->_barFillColor;
}

- (void)setBarFillColor:(id)a3
{
  objc_storeStrong((id *)&self->_barFillColor, a3);
}

- (double)lineSpacing
{
  return self->_lineSpacing;
}

- (void)setLineSpacing:(double)a3
{
  self->_lineSpacing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_barFillColor, 0);
  objc_storeStrong((id *)&self->_barEmptyColor, 0);
  objc_storeStrong((id *)&self->_starBars, 0);
  objc_storeStrong((id *)&self->_starImage, 0);
}

@end
