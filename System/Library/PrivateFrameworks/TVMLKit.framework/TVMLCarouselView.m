@implementation TVMLCarouselView

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  void *v6;
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
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  double v26;
  double v27;
  uint64_t v28;
  double v29;
  double x;
  double y;
  double width;
  double height;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  objc_super v54;
  CGRect v55;
  CGRect v56;

  -[TVMLCarouselView bounds](self, "bounds");
  v4 = v3;
  v53 = v5;
  -[TVMLCarouselView headerView](self, "headerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView tv_padding](self, "tv_padding");
  v50 = v7;
  v9 = v8;
  -[UIView tv_padding](self, "tv_padding");
  v11 = v10;
  v13 = v12;
  objc_msgSend(v6, "tv_margin");
  v51 = v17;
  v52 = v16;
  v18 = v14;
  v19 = v15;
  if (v4 - (v14 + v15) - (v11 + v13) >= 2.22044605e-16)
    v20 = v4 - (v14 + v15) - (v11 + v13);
  else
    v20 = v4;
  v21 = -[TVMLCarouselView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  objc_msgSend(v6, "tv_sizeThatFits:", v20, 0.0);
  v23 = v22;
  v25 = v24;
  v26 = v4 - (v9 + v19 + v22);
  if (v21 == 1)
    v27 = v26;
  else
    v27 = v11 + v18;
  if (v22 < v20)
  {
    v28 = objc_msgSend(v6, "tv_alignment");
    v29 = floor((v4 - v23) * 0.5);
    if (v28 != 2)
      v29 = v27;
    if (v28 == 3)
      v27 = v26;
    else
      v27 = v29;
  }
  v55.origin.y = v50 + v52;
  v55.origin.x = v27;
  v55.size.width = v23;
  v55.size.height = v25;
  v56 = CGRectIntegral(v55);
  x = v56.origin.x;
  y = v56.origin.y;
  width = v56.size.width;
  height = v56.size.height;
  objc_msgSend(v6, "layer");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "anchorPoint");
  v36 = v35;
  v38 = v37;

  objc_msgSend(v6, "setBounds:", 0.0, 0.0, width, height);
  objc_msgSend(v6, "setCenter:", round(x + width * v36), round(y + height * v38));
  v39 = v51 + v52 + height;
  -[TVMLCarouselView showcaseFactor](self, "showcaseFactor");
  v41 = ceil(v39 * v40);
  -[TVMLCarouselView showcaseFactor](self, "showcaseFactor");
  v43 = floor(v39 * (1.0 - v42));
  -[TVMLCarouselView _collectionView](self, "_collectionView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setFrame:", 0.0, v41, v4, v53);

  v45 = *(double *)(MEMORY[0x24BDF7718] + 8);
  v46 = *(double *)(MEMORY[0x24BDF7718] + 16);
  v47 = *(double *)(MEMORY[0x24BDF7718] + 24);
  v48 = v43 + *MEMORY[0x24BDF7718];
  -[TVMLCarouselView _collectionView](self, "_collectionView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setContentInset:", v48, v45, v46, v47);

  v54.receiver = self;
  v54.super_class = (Class)TVMLCarouselView;
  -[TVMLCarouselView layoutSubviews](&v54, sel_layoutSubviews);

}

@end
