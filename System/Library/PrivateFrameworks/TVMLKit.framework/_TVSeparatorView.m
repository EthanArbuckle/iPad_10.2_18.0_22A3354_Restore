@implementation _TVSeparatorView

+ (id)separatorViewWithElement:(id)a3 existingView:(id)a4
{
  id v5;
  id v6;
  _TVSeparatorView *v7;
  _TVSeparatorView *v8;
  _TVSeparatorView *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_opt_class();
  v28 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (_TVSeparatorView *)v6;
  }
  else
  {
    v8 = [_TVSeparatorView alloc];
    v7 = -[_TVSeparatorView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  }
  v9 = v7;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v5, "children");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v30 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[_TVSeparatorView separatorComponent](v9, "separatorComponent");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "_viewFromElement:existingView:", v15, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          -[_TVSeparatorView setSeparatorComponent:](v9, "setSeparatorComponent:", v18);

          goto LABEL_14;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_14:

  objc_msgSend(v5, "style");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "tv_tintColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "color");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "opaqueSeparatorColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[_TVSeparatorView setTintColor:](v9, "setTintColor:", v21);
  objc_msgSend(v5, "style");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "tv_height");
  v24 = v23;

  if (v24 <= 0.0)
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "scale");
    v24 = 1.0 / v26;

  }
  -[_TVSeparatorView setLineHeight:](v9, "setLineHeight:", v24);

  return v9;
}

- (BOOL)canBecomeFocused
{
  UIView **p_separatorComponent;
  id WeakRetained;
  id v4;
  int v5;

  p_separatorComponent = &self->_separatorComponent;
  WeakRetained = objc_loadWeakRetained((id *)&self->_separatorComponent);
  if (objc_msgSend(WeakRetained, "canBecomeFocused"))
  {
    v4 = objc_loadWeakRetained((id *)p_separatorComponent);
    v5 = objc_msgSend(v4, "isFocused") ^ 1;

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (id)preferredFocusEnvironments
{
  UIView **p_separatorComponent;
  id WeakRetained;
  id v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  p_separatorComponent = &self->_separatorComponent;
  WeakRetained = objc_loadWeakRetained((id *)&self->_separatorComponent);
  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained((id *)p_separatorComponent);
    v7[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v5;
}

- (void)setSeparatorComponent:(id)a3
{
  id WeakRetained;
  id v5;
  id v6;
  id v7;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_separatorComponent);

  if (WeakRetained != obj)
  {
    v5 = objc_loadWeakRetained((id *)&self->_separatorComponent);
    objc_msgSend(v5, "removeFromSuperview");

    v6 = objc_storeWeak((id *)&self->_separatorComponent, obj);
    if (obj)
    {
      v7 = objc_loadWeakRetained((id *)&self->_separatorComponent);
      -[_TVSeparatorView addSubview:](self, "addSubview:", v7);

    }
  }
  -[_TVSeparatorView setNeedsLayout](self, "setNeedsLayout");

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  id WeakRetained;
  double v11;
  double v12;
  float lineHeight;
  double v14;
  double v15;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[UIView tv_padding](self, "tv_padding");
  v7 = v6;
  v9 = v8;
  WeakRetained = objc_loadWeakRetained((id *)&self->_separatorComponent);
  objc_msgSend(WeakRetained, "tv_sizeThatFits:", width, height);
  v12 = v11;

  lineHeight = self->_lineHeight;
  v14 = v7 + v9 + fmax(v12, ceilf(lineHeight));
  v15 = width;
  result.height = v14;
  result.width = v15;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  UIView **p_line1;
  UIView *line1;
  UIView *v19;
  UIView *v20;
  id WeakRetained;
  id v22;
  uint64_t v23;
  UIView *line2;
  id v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  id v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  float v39;
  float v40;
  double v41;
  double v42;
  double v43;
  double lineHeight;
  double v45;
  UIView *v46;
  double v47;
  double v48;
  float v49;
  double v50;
  UIView *v51;
  UIView *v52;
  UIView *v53;
  id v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  CGRect v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  CGRect v68;

  -[_TVSeparatorView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView tv_padding](self, "tv_padding");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  p_line1 = &self->_line1;
  line1 = self->_line1;
  if (!line1)
  {
    v19 = (UIView *)objc_alloc_init(MEMORY[0x24BDF6F90]);
    v20 = *p_line1;
    *p_line1 = v19;

    -[_TVSeparatorView addSubview:](self, "addSubview:", *p_line1);
    line1 = *p_line1;
  }
  -[UIView setBackgroundColor:](line1, "setBackgroundColor:", self->_tintColor);
  WeakRetained = objc_loadWeakRetained((id *)&self->_separatorComponent);

  if (WeakRetained)
  {
    v61.origin.x = v4;
    v61.origin.y = v6;
    v61.size.width = v8;
    v61.size.height = v10;
    v62 = v16;
    v22 = objc_loadWeakRetained((id *)&self->_separatorComponent);
    v23 = objc_msgSend(v22, "tv_alignment");

    if ((v23 & 0xFFFFFFFFFFFFFFFDLL) == 1)
    {
      -[UIView removeFromSuperview](self->_line2, "removeFromSuperview");
      line2 = self->_line2;
      self->_line2 = 0;

    }
    v25 = objc_loadWeakRetained((id *)&self->_separatorComponent);
    objc_msgSend(v25, "tv_margin");
    v27 = v26;
    v29 = v28;
    v31 = v30;

    v58 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v60 = *MEMORY[0x24BDBF090];
    v65 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v67 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v32 = objc_loadWeakRetained((id *)&self->_separatorComponent);
    objc_msgSend(v32, "tv_sizeThatFits:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
    v34 = v33;
    v36 = v35;

    v37 = v12 + v27;
    v38 = v36;
    v39 = v36 * 0.5;
    v40 = floorf(v39);
    v41 = v37 + v40;
    v64 = v37;
    if (v23 == 3)
    {
      v42 = CGRectGetWidth(v61) - v62 - v31 - v34;
      v63 = v42 - v14 - v29;
      lineHeight = self->_lineHeight;
      v43 = v14;
      v45 = v58;
      v14 = v60;
    }
    else
    {
      v57 = v37 + v40;
      if (v23 == 1)
      {
        v42 = v14 + v29;
        v43 = v31 + v14 + v29 + v34;
        v63 = CGRectGetWidth(v61) - v43 - v62;
        lineHeight = self->_lineHeight;
        v45 = v58;
        v14 = v60;
        v41 = v57;
      }
      else
      {
        v49 = (CGRectGetWidth(v61) - v14 - v62 - (v31 + v29 + v34)) * 0.5;
        v66 = v29;
        v42 = v14 + v29 + floorf(v49);
        v55 = v42 - v14;
        v56 = v14;
        v59 = self->_lineHeight;
        v14 = v31 + v34 + v42;
        v50 = CGRectGetWidth(v61) - v62;
        v67 = self->_lineHeight;
        v51 = self->_line2;
        if (!v51)
        {
          v52 = (UIView *)objc_alloc_init(MEMORY[0x24BDF6F90]);
          v53 = self->_line2;
          self->_line2 = v52;

          -[_TVSeparatorView addSubview:](self, "addSubview:", self->_line2);
          v51 = self->_line2;
        }
        v63 = v55 - v66;
        v65 = v50 - v14;
        -[UIView setBackgroundColor:](v51, "setBackgroundColor:", self->_tintColor, *(_QWORD *)&v55);
        v41 = v57;
        v45 = v57;
        lineHeight = v59;
        v38 = v36;
        v43 = v56;
      }
    }
    v54 = objc_loadWeakRetained((id *)&self->_separatorComponent);
    objc_msgSend(v54, "setFrame:", v42, v64, v34, v38);

    -[UIView setFrame:](*p_line1, "setFrame:", v43, v41, v63, lineHeight);
    p_line1 = &self->_line2;
    v47 = v65;
    v48 = v67;
  }
  else
  {
    -[UIView removeFromSuperview](self->_line2, "removeFromSuperview");
    v46 = self->_line2;
    self->_line2 = 0;

    v68.origin.x = v4;
    v68.origin.y = v6;
    v68.size.width = v8;
    v68.size.height = v10;
    v47 = CGRectGetWidth(v68) - v14 - v16;
    v48 = self->_lineHeight;
    v45 = v12;
  }
  -[UIView setFrame:](*p_line1, "setFrame:", v14, v45, v47, v48);
}

- (UIView)separatorComponent
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_separatorComponent);
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
}

- (double)lineHeight
{
  return self->_lineHeight;
}

- (void)setLineHeight:(double)a3
{
  self->_lineHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_destroyWeak((id *)&self->_separatorComponent);
  objc_storeStrong((id *)&self->_line2, 0);
  objc_storeStrong((id *)&self->_line1, 0);
}

@end
