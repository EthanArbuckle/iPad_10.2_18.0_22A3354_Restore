@implementation TPBottomSingleButtonBar

+ (id)_backgroundImage
{
  return 0;
}

- (double)buttonWidth
{
  unint64_t style;
  double result;

  style = self->super._style;
  result = 0.0;
  if (style <= 3)
    return dbl_1BCFE6EC0[style];
  return result;
}

- (void)setButton:(id)a3 andStyle:(BOOL)a4
{
  _BOOL4 v4;
  TPButton *v7;
  id *p_button;
  TPButton *button;
  id v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;
  TPButton *v26;

  v4 = a4;
  v7 = (TPButton *)a3;
  p_button = (id *)&self->_button;
  button = self->_button;
  v10 = v7;
  v26 = v7;
  if (button != v7)
  {
    -[TPButton removeFromSuperview](button, "removeFromSuperview");
    objc_storeStrong((id *)&self->_button, a3);
    v10 = *p_button;
  }
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "userInterfaceIdiom");

    if ((v12 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      if (v4)
      {
        -[TPBottomSingleButtonBar bounds](self, "bounds");
        v14 = v13;
        v16 = v15;
        objc_msgSend(*p_button, "frame");
        objc_msgSend((id)objc_opt_class(), "defaultHeightForColor:", objc_msgSend(*p_button, "buttonColor"));
        v18 = v17;
        v19 = floor((v16 - v17) * 0.5) + 2.0;
        v20 = v14 + -4.0;
        v21 = *p_button;
        v22 = 2.0;
LABEL_9:
        objc_msgSend(v21, "setFrame:", v22, v19, v20, v18);
      }
    }
    else if (v4)
    {
      -[TPBottomSingleButtonBar bounds](self, "bounds");
      v24 = v23;
      objc_msgSend((id)objc_opt_class(), "defaultHeightForColor:", objc_msgSend(*p_button, "buttonColor"));
      v18 = v25;
      v21 = *p_button;
      v22 = 0.0;
      v19 = 0.0;
      v20 = v24;
      goto LABEL_9;
    }
    -[TPBottomSingleButtonBar addSubview:](self, "addSubview:", *p_button);
  }
  -[TPBottomSingleButtonBar setNeedsLayout](self, "setNeedsLayout");

}

- (id)button
{
  return self->_button;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong(&self->_delegate, 0);
}

@end
