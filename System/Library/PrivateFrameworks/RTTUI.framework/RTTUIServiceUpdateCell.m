@implementation RTTUIServiceUpdateCell

+ (double)heightForWidth:(double)a3 delegate:(id)a4 serviceUpdate:(id)a5
{
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  double v12;
  double v13;

  v7 = a5;
  v8 = heightForWidth_delegate_serviceUpdate__onceToken;
  v9 = a4;
  if (v8 != -1)
    dispatch_once(&heightForWidth_delegate_serviceUpdate__onceToken, &__block_literal_global_390);
  v10 = *(void **)(heightForWidth_delegate_serviceUpdate__SizeCell + 1040);
  *(_QWORD *)(heightForWidth_delegate_serviceUpdate__SizeCell + 1040) = v7;
  v11 = v7;

  objc_msgSend((id)heightForWidth_delegate_serviceUpdate__SizeCell, "setDelegate:", v9);
  objc_msgSend((id)heightForWidth_delegate_serviceUpdate__SizeCell, "updateLayout");
  objc_msgSend((id)heightForWidth_delegate_serviceUpdate__SizeCell, "preferredHeightForWidth:", a3);
  v13 = v12;

  return v13;
}

uint64_t __64__RTTUIServiceUpdateCell_heightForWidth_delegate_serviceUpdate___block_invoke()
{
  RTTUIServiceUpdateCell *v0;
  void *v1;

  v0 = objc_alloc_init(RTTUIServiceUpdateCell);
  v1 = (void *)heightForWidth_delegate_serviceUpdate__SizeCell;
  heightForWidth_delegate_serviceUpdate__SizeCell = (uint64_t)v0;

  return objc_msgSend((id)heightForWidth_delegate_serviceUpdate__SizeCell, "updateLayout");
}

- (RTTUIServiceUpdateCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 serviceUpdate:(id)a5
{
  id v9;
  RTTUIServiceUpdateCell *v10;
  RTTUIServiceUpdateCell *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)RTTUIServiceUpdateCell;
  v10 = -[RTTUIServiceUpdateCell initWithStyle:reuseIdentifier:](&v13, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_serviceUpdate, a5);

  return v11;
}

- (double)preferredHeightForWidth:(double)a3
{
  double v5;
  double v6;
  double v7;

  -[UITextView sizeThatFits:](self->_titleView, "sizeThatFits:", a3, 1.79769313e308);
  v6 = v5;
  -[UITextView sizeThatFits:](self->_subtitleView, "sizeThatFits:", a3, 1.79769313e308);
  return fmax(v6 + v7, 20.0);
}

- (void)adjustTextViewSize
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  void *v12;
  UITextView *titleView;
  void *v14;
  double v15;
  double v16;
  double v17;
  double Width;
  UITextView *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  UITextView *subtitleView;
  void *v27;
  double v28;
  double v29;
  double v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  double v34;
  UITextView *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double MaxY;
  void (**v43)(void);
  CGFloat v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  CGFloat v48;
  _QWORD v49[13];
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;

  -[RTTUIServiceUpdateCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v47 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  v48 = *MEMORY[0x24BDBEFB0];
  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77E8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setFont:](self->_titleView, "setFont:", v11);

  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setFont:](self->_subtitleView, "setFont:", v12);

  titleView = self->_titleView;
  -[RTTUIServiceUpdateCell window](self, "window");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "frame");
  -[UITextView sizeThatFits:](titleView, "sizeThatFits:", CGRectGetWidth(v50), 1.79769313e308);
  v16 = v15;

  v17 = fmax(v16, 20.0);
  v44 = v4;
  v45 = v17;
  v51.origin.x = v4;
  v51.origin.y = v6;
  v51.size.width = v8;
  v51.size.height = v10;
  Width = CGRectGetWidth(v51);
  v19 = self->_titleView;
  -[RTTUIServiceUpdateCell window](self, "window");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "frame");
  -[UITextView sizeThatFits:](v19, "sizeThatFits:", CGRectGetWidth(v52), v17);
  v22 = v21;

  v23 = fmax(v22, 130.0);
  if (Width >= v23)
    v24 = v23;
  else
    v24 = Width;
  v53.origin.x = v4;
  v53.origin.y = v6;
  v53.size.width = v8;
  v53.size.height = v10;
  v25 = CGRectGetWidth(v53);
  v54.origin.x = v48;
  v54.origin.y = v47;
  v54.size.width = v24;
  v54.size.height = v17;
  v46 = (v25 - CGRectGetWidth(v54)) * 0.5;
  -[UITextView setFrame:](self->_titleView, "setFrame:");
  subtitleView = self->_subtitleView;
  -[RTTUIServiceUpdateCell window](self, "window");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "frame");
  -[UITextView sizeThatFits:](subtitleView, "sizeThatFits:", CGRectGetWidth(v55), 1.79769313e308);
  v29 = v28;

  v30 = fmax(v29, 20.0);
  v56.origin.x = v4;
  v56.origin.y = v6;
  v31 = v6;
  v56.size.width = v8;
  v32 = v8;
  v56.size.height = v10;
  v33 = v10;
  v34 = CGRectGetWidth(v56);
  v35 = self->_subtitleView;
  -[RTTUIServiceUpdateCell window](self, "window");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "frame");
  -[UITextView sizeThatFits:](v35, "sizeThatFits:", CGRectGetWidth(v57), v30);
  v38 = v37;

  v39 = fmax(v38, 130.0);
  if (v34 >= v39)
    v34 = v39;
  v58.origin.x = v44;
  v58.origin.y = v31;
  v58.size.width = v32;
  v58.size.height = v33;
  v40 = CGRectGetWidth(v58);
  v59.origin.x = v48;
  v59.origin.y = v47;
  v59.size.width = v34;
  v59.size.height = v30;
  v41 = (v40 - CGRectGetWidth(v59)) * 0.5;
  v60.origin.x = v46;
  v60.origin.y = v47;
  v60.size.width = v24;
  v60.size.height = v45;
  MaxY = CGRectGetMaxY(v60);
  -[UITextView setFrame:](self->_subtitleView, "setFrame:", v41, MaxY, v34, v30);
  v49[0] = MEMORY[0x24BDAC760];
  v49[1] = 3221225472;
  v49[2] = __44__RTTUIServiceUpdateCell_adjustTextViewSize__block_invoke;
  v49[3] = &unk_24D657E98;
  v49[4] = self;
  *(double *)&v49[5] = v46;
  *(CGFloat *)&v49[6] = v47;
  *(CGFloat *)&v49[7] = v24;
  *(CGFloat *)&v49[8] = v45;
  *(double *)&v49[9] = v41;
  *(double *)&v49[10] = MaxY;
  *(double *)&v49[11] = v34;
  *(double *)&v49[12] = v30;
  v43 = (void (**)(void))MEMORY[0x219A04408](v49);
  v43[2]();

}

void __44__RTTUIServiceUpdateCell_adjustTextViewSize__block_invoke(uint64_t a1)
{
  id v2;
  CGRect v3;

  objc_msgSend(*(id *)(a1 + 32), "backgroundView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = CGRectUnion(*(CGRect *)(a1 + 40), *(CGRect *)(a1 + 72));
  objc_msgSend(v2, "setFrame:", v3.origin.x, v3.origin.y, v3.size.width, v3.size.height);

}

- (void)layoutSubviews
{
  void *v3;
  int v4;
  RTTUIStaticTextView *v5;
  void *v6;
  UITextView *v7;
  UITextView *titleView;
  UITextView *v9;
  void *v10;
  UITextView *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  RTTUIStaticTextView *v16;
  void *v17;
  UITextView *v18;
  UITextView *subtitleView;
  UITextView *v20;
  void *v21;
  UITextView *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  int v31;
  UITextView *v32;
  void *v33;
  UITextView *v34;
  void *v35;
  void *v36;
  int v37;
  UITextView *v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  UITextView *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  int IsRTTNotificationContentExtension;
  uint64_t v56;
  void *v57;
  objc_super v58;

  v58.receiver = self;
  v58.super_class = (Class)RTTUIServiceUpdateCell;
  -[RTTUIServiceUpdateCell layoutSubviews](&v58, sel_layoutSubviews);
  -[RTTUIServiceUpdateCell delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCurrentCallConnected");

  if (!self->_titleView)
  {
    v5 = [RTTUIStaticTextView alloc];
    -[RTTUIServiceUpdateCell textLabel](self, "textLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    v7 = -[RTTUIStaticTextView initWithFrame:textContainer:](v5, "initWithFrame:textContainer:", 0);
    titleView = self->_titleView;
    self->_titleView = v7;

    v9 = self->_titleView;
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setBackgroundColor:](v9, "setBackgroundColor:", v10);

    v11 = self->_titleView;
    objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 20.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setFont:](v11, "setFont:", v12);

    -[RTTUIServiceUpdateCell contentView](self, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", self->_titleView);

    -[UITextView textContainer](self->_titleView, "textContainer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setLineBreakMode:", 0);

    -[UITextView textContainer](self->_titleView, "textContainer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setMaximumNumberOfLines:", 0);

    -[UITextView setTextAlignment:](self->_titleView, "setTextAlignment:", 1);
    -[UITextView setEditable:](self->_titleView, "setEditable:", 0);
    -[UITextView setSelectable:](self->_titleView, "setSelectable:", 1);
    -[UITextView setScrollEnabled:](self->_titleView, "setScrollEnabled:", 0);
  }
  if (!self->_subtitleView)
  {
    v16 = [RTTUIStaticTextView alloc];
    -[RTTUIServiceUpdateCell textLabel](self, "textLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "frame");
    v18 = -[RTTUIStaticTextView initWithFrame:textContainer:](v16, "initWithFrame:textContainer:", 0);
    subtitleView = self->_subtitleView;
    self->_subtitleView = v18;

    v20 = self->_subtitleView;
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setBackgroundColor:](v20, "setBackgroundColor:", v21);

    v22 = self->_subtitleView;
    objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 20.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setFont:](v22, "setFont:", v23);

    -[RTTUIServiceUpdateCell contentView](self, "contentView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addSubview:", self->_subtitleView);

    -[UITextView textContainer](self->_subtitleView, "textContainer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setLineBreakMode:", 0);

    -[UITextView textContainer](self->_subtitleView, "textContainer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setMaximumNumberOfLines:", 0);

    -[UITextView setTextAlignment:](self->_subtitleView, "setTextAlignment:", 1);
    -[UITextView setEditable:](self->_subtitleView, "setEditable:", 0);
    -[UITextView setSelectable:](self->_subtitleView, "setSelectable:", 1);
    -[UITextView setScrollEnabled:](self->_subtitleView, "setScrollEnabled:", 0);
  }
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTUIServiceUpdateCell setBackgroundColor:](self, "setBackgroundColor:", v27);

  -[RTTServiceUpdate serviceUpdateType](self->_serviceUpdate, "serviceUpdateType");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "isEqualToString:", *MEMORY[0x24BE7CB88]);

  if (!v29)
  {
    -[RTTServiceUpdate serviceUpdateType](self->_serviceUpdate, "serviceUpdateType");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "isEqualToString:", *MEMORY[0x24BE7CBB8]);

    if (!v31)
    {
      -[RTTServiceUpdate serviceUpdateType](self->_serviceUpdate, "serviceUpdateType");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "isEqualToString:", *MEMORY[0x24BE7CB98]);

      if (v37)
      {
        v38 = self->_titleView;
        v39 = (void *)MEMORY[0x24BDD17C8];
      }
      else
      {
        -[RTTServiceUpdate serviceUpdateType](self->_serviceUpdate, "serviceUpdateType");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "isEqualToString:", *MEMORY[0x24BE7CBB0]);

        if (!v41)
        {
          -[RTTServiceUpdate serviceUpdateType](self->_serviceUpdate, "serviceUpdateType");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = objc_msgSend(v45, "isEqualToString:", *MEMORY[0x24BE7CB90]);

          if (v46)
          {
            v47 = self->_titleView;
          }
          else
          {
            -[RTTServiceUpdate serviceUpdateType](self->_serviceUpdate, "serviceUpdateType");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = (void *)*MEMORY[0x24BE7CBA8];

            if (v48 == v49)
            {
              v47 = self->_titleView;
            }
            else
            {
              -[RTTServiceUpdate serviceUpdateType](self->_serviceUpdate, "serviceUpdateType");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              v51 = (void *)*MEMORY[0x24BE7CBC0];

              if (v50 == v51)
              {
                v47 = self->_titleView;
              }
              else
              {
                -[RTTServiceUpdate serviceUpdateType](self->_serviceUpdate, "serviceUpdateType");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                v53 = (void *)*MEMORY[0x24BE7CBA0];

                if (v52 != v53)
                  goto LABEL_23;
                v47 = self->_titleView;
              }
            }
          }
          ttyLocString();
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          -[UITextView setText:](v47, "setText:", v54);

LABEL_22:
          -[UITextView setText:](self->_subtitleView, "setText:", 0);
          goto LABEL_23;
        }
        v38 = self->_titleView;
        v39 = (void *)MEMORY[0x24BDD17C8];
      }
      ttyLocString();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTTServiceUpdate optionValueForKey:](self->_serviceUpdate, "optionValueForKey:", *MEMORY[0x24BE7CB80]);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "stringWithFormat:", v42, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextView setText:](v38, "setText:", v44);

      goto LABEL_22;
    }
  }
  v32 = self->_titleView;
  ttyLocString();
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setText:](v32, "setText:", v33);

  v34 = self->_subtitleView;
  ttyLocString();
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setText:](v34, "setText:", v35);

LABEL_23:
  IsRTTNotificationContentExtension = Soft_AXProcessIsRTTNotificationContentExtension();
  if (!v4 || IsRTTNotificationContentExtension)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    v56 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v56 = objc_claimAutoreleasedReturnValue();
  }
  v57 = (void *)v56;
  -[UITextView setTextColor:](self->_titleView, "setTextColor:", v56);
  -[UITextView setTextColor:](self->_subtitleView, "setTextColor:", v57);
  -[RTTUIServiceUpdateCell adjustTextViewSize](self, "adjustTextViewSize");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return -[UITextView text](self->_subtitleView, "text");
}

- (id)serviceTitle
{
  return -[UITextView text](self->_titleView, "text");
}

- (id)serviceMessage
{
  return -[UITextView text](self->_subtitleView, "text");
}

- (RTTUIServiceCellDelegate)delegate
{
  return (RTTUIServiceCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serviceUpdate, 0);
  objc_storeStrong((id *)&self->_subtitleView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
}

@end
