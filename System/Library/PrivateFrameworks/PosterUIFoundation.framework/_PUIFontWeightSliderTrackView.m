@implementation _PUIFontWeightSliderTrackView

- (_PUIFontWeightSliderTrackView)initWithTrackBackgroundColor:(id)a3
{
  id v5;
  _PUIFontWeightSliderTrackView *v6;
  _PUIFontWeightSliderTrackView *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PUIFontWeightSliderTrackView;
  v6 = -[_PUIFontWeightSliderTrackView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_trackBackgroundColor, a3);
    -[_PUIFontWeightSliderTrackView setOpaque:](v7, "setOpaque:", 0);
    -[_PUIFontWeightSliderTrackView setContentMode:](v7, "setContentMode:", 3);
  }

  return v7;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id *v8;
  uint64_t v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double MinX;
  double v19;
  double v20;
  id v21;
  _BOOL8 v22;
  void *v23;
  double v24;
  double MidY;
  double v26;
  double v27;
  double v28;
  objc_super v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v29.receiver = self;
  v29.super_class = (Class)_PUIFontWeightSliderTrackView;
  -[_PUIFontWeightSliderTrackView drawRect:](&v29, sel_drawRect_);
  v8 = (id *)MEMORY[0x24BDF74F8];
  v9 = objc_msgSend((id)*MEMORY[0x24BDF74F8], "userInterfaceLayoutDirection");
  v10 = x;
  v11 = y;
  v12 = width;
  v13 = height;
  if (v9 == 1)
  {
    v27 = CGRectGetMaxX(*(CGRect *)&v10) + -2.0;
    v30.origin.x = x;
    v30.origin.y = y;
    v30.size.width = width;
    v30.size.height = height;
    MidY = CGRectGetMidY(v30);
    v31.origin.x = x;
    v31.origin.y = y;
    v31.size.width = width;
    v31.size.height = height;
    v28 = CGRectGetMaxX(v31) + -2.0;
    v32.origin.x = x;
    v32.origin.y = y;
    v32.size.width = width;
    v32.size.height = height;
    v26 = CGRectGetMidY(v32);
    v33.origin.x = x;
    v33.origin.y = y;
    v33.size.width = width;
    v33.size.height = height;
    v24 = CGRectGetMaxX(v33) + -2.0;
    v34.origin.x = x;
    v34.origin.y = y;
    v34.size.width = width;
    v34.size.height = height;
    v14 = CGRectGetMidY(v34);
    v35.origin.x = x;
    v35.origin.y = y;
    v35.size.width = width;
    v35.size.height = height;
    v15 = 7.0;
    v16 = CGRectGetMinX(v35) + 7.0;
    v36.origin.x = x;
    v36.origin.y = y;
    v36.size.width = width;
    v36.size.height = height;
    v17 = CGRectGetMidY(v36);
    v37.origin.x = x;
    v37.origin.y = y;
    v37.size.width = width;
    v37.size.height = height;
    MinX = CGRectGetMinX(v37);
  }
  else
  {
    v27 = CGRectGetMinX(*(CGRect *)&v10) + 2.0;
    v38.origin.x = x;
    v38.origin.y = y;
    v38.size.width = width;
    v38.size.height = height;
    MidY = CGRectGetMidY(v38);
    v39.origin.x = x;
    v39.origin.y = y;
    v39.size.width = width;
    v39.size.height = height;
    v28 = CGRectGetMinX(v39) + 2.0;
    v40.origin.x = x;
    v40.origin.y = y;
    v40.size.width = width;
    v40.size.height = height;
    v26 = CGRectGetMidY(v40);
    v41.origin.x = x;
    v41.origin.y = y;
    v41.size.width = width;
    v41.size.height = height;
    v24 = CGRectGetMinX(v41) + 2.0;
    v42.origin.x = x;
    v42.origin.y = y;
    v42.size.width = width;
    v42.size.height = height;
    v14 = CGRectGetMidY(v42);
    v43.origin.x = x;
    v43.origin.y = y;
    v43.size.width = width;
    v43.size.height = height;
    v15 = -7.0;
    v16 = CGRectGetMaxX(v43) + -7.0;
    v44.origin.x = x;
    v44.origin.y = y;
    v44.size.width = width;
    v44.size.height = height;
    v17 = CGRectGetMidY(v44);
    v45.origin.x = x;
    v45.origin.y = y;
    v45.size.width = width;
    v45.size.height = height;
    MinX = CGRectGetMaxX(v45);
  }
  v19 = MinX + v15;
  v46.origin.x = x;
  v46.origin.y = y;
  v46.size.width = width;
  v46.size.height = height;
  v20 = CGRectGetMidY(v46);
  v21 = objc_alloc_init(MEMORY[0x24BDF6870]);
  objc_msgSend(v21, "moveToPoint:", v27, MidY + -2.0);
  objc_msgSend(v21, "addLineToPoint:", v16, v17 + -7.0);
  v22 = objc_msgSend(*v8, "userInterfaceLayoutDirection") != 1;
  objc_msgSend(v21, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", v22, v19, v20, 7.0, 4.71238898, 1.57079633);
  objc_msgSend(v21, "addLineToPoint:", v24, v14 + 2.0);
  objc_msgSend(v21, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", v22, v28, v26, 2.0, 1.57079633, 4.71238898);
  -[_PUIFontWeightSliderTrackView trackBackgroundColor](self, "trackBackgroundColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setFill");

  objc_msgSend(v21, "fill");
}

- (UIColor)trackBackgroundColor
{
  return self->_trackBackgroundColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackBackgroundColor, 0);
}

@end
