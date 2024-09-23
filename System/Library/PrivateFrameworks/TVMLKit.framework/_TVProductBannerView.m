@implementation _TVProductBannerView

+ (id)productBannerViewWithElement:(id)a3 existingView:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  _TVProductBannerView *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  void *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tv_height");
  v9 = v8;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12 = v11;

  objc_opt_class();
  v39 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = (_TVProductBannerView *)v6;
  else
    v13 = -[_TVProductBannerView initWithFrame:]([_TVProductBannerView alloc], "initWithFrame:", 0.0, 0.0, v12, v9);
  -[_TVProductBannerView setSemanticContentAttribute:](v13, "setSemanticContentAttribute:", objc_msgSend(v5, "tv_semanticContentAttribute"));
  -[_TVProductBannerView setFrame:](v13, "setFrame:", 0.0, 0.0, v12, v9);
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v40 = v5;
  objc_msgSend(v5, "children");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v47;
    v18 = 0x24EB83000uLL;
    v41 = v14;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v47 != v17)
          objc_enumerationMutation(v14);
        v20 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        v21 = objc_msgSend(v20, "tv_elementType");
        if (v21 > 18)
        {
          switch(v21)
          {
            case 19:
              objc_msgSend(*(id *)(v18 + 2344), "sharedInterfaceFactory");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              -[_TVProductBannerView infoListView](v13, "infoListView");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "_viewFromElement:existingView:", v20, v28);
              v24 = (void *)objc_claimAutoreleasedReturnValue();

              -[_TVProductBannerView setInfoListView:](v13, "setInfoListView:", v24);
              break;
            case 24:
LABEL_18:
              objc_msgSend(*(id *)(v18 + 2344), "sharedInterfaceFactory");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              -[_TVProductBannerView heroImageView](v13, "heroImageView");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "_viewFromElement:existingView:", v20, v26);
              v24 = (void *)objc_claimAutoreleasedReturnValue();

              -[_TVProductBannerView setHeroImageView:](v13, "setHeroImageView:", v24);
              break;
            case 54:
              objc_msgSend(*(id *)(v18 + 2344), "sharedInterfaceFactory");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              -[_TVProductBannerView stackView](v13, "stackView");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "_viewFromElement:existingView:", v20, v23);
              v24 = (void *)objc_claimAutoreleasedReturnValue();

              -[_TVProductBannerView setStackView:](v13, "setStackView:", v24);
              break;
            default:
              continue;
          }
LABEL_32:

          continue;
        }
        if (v21 == 4)
        {
          v44 = 0u;
          v45 = 0u;
          v42 = 0u;
          v43 = 0u;
          objc_msgSend(v20, "children");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
          if (v29)
          {
            v30 = v29;
            v31 = v18;
            v32 = *(_QWORD *)v43;
            while (2)
            {
              for (j = 0; j != v30; ++j)
              {
                if (*(_QWORD *)v43 != v32)
                  objc_enumerationMutation(v24);
                v34 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
                if (objc_msgSend(v34, "tv_elementType") == 16 && !objc_msgSend(v34, "tv_imageType"))
                {
                  v18 = v31;
                  objc_msgSend(*(id *)(v31 + 2344), "sharedInterfaceFactory");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  -[_TVProductBannerView backgroundImageView](v13, "backgroundImageView");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v35, "_viewFromElement:existingView:", v34, v36);
                  v37 = (void *)objc_claimAutoreleasedReturnValue();

                  -[_TVProductBannerView setBackgroundImageView:](v13, "setBackgroundImageView:", v37);
                  goto LABEL_31;
                }
              }
              v30 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
              if (v30)
                continue;
              break;
            }
            v18 = v31;
LABEL_31:
            v14 = v41;
          }
          goto LABEL_32;
        }
        if (v21 == 16 && (objc_msgSend(v20, "tv_imageType") == 3 || !objc_msgSend(v20, "tv_imageType")))
          goto LABEL_18;
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    }
    while (v16);
  }

  return v13;
}

- (_TVProductBannerView)initWithFrame:(CGRect)a3
{
  double height;
  _TVProductBannerView *result;
  objc_super v5;

  height = a3.size.height;
  v5.receiver = self;
  v5.super_class = (Class)_TVProductBannerView;
  result = -[_TVFocusRedirectView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width);
  if (result)
    result->_height = height;
  return result;
}

- (id)preferredFocusEnvironments
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  -[_TVProductBannerView stackView](self, "stackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[_TVProductBannerView stackView](self, "stackView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
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

- (void)setBackgroundImageView:(id)a3
{
  UIView *v5;
  UIView **p_backgroundImageView;
  UIView *backgroundImageView;
  UIView *v8;

  v5 = (UIView *)a3;
  p_backgroundImageView = &self->_backgroundImageView;
  backgroundImageView = self->_backgroundImageView;
  v8 = v5;
  if (backgroundImageView != v5)
  {
    -[UIView removeFromSuperview](backgroundImageView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_backgroundImageView, a3);
    if (*p_backgroundImageView)
      -[_TVProductBannerView insertSubview:atIndex:](self, "insertSubview:atIndex:", *p_backgroundImageView, 0);
  }
  -[_TVProductBannerView setNeedsLayout](self, "setNeedsLayout");

}

- (void)setInfoListView:(id)a3
{
  UIView *v5;
  UIView *infoListView;
  UIView *v7;

  v5 = (UIView *)a3;
  infoListView = self->_infoListView;
  v7 = v5;
  if (infoListView != v5)
  {
    -[UIView removeFromSuperview](infoListView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_infoListView, a3);
    if (self->_infoListView)
      -[_TVProductBannerView addSubview:](self, "addSubview:");
  }
  -[_TVProductBannerView setNeedsLayout](self, "setNeedsLayout");

}

- (void)setStackView:(id)a3
{
  UIView *v5;
  UIView *stackView;
  UIView *v7;

  v5 = (UIView *)a3;
  stackView = self->_stackView;
  v7 = v5;
  if (stackView != v5)
  {
    -[UIView removeFromSuperview](stackView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_stackView, a3);
    if (self->_stackView)
      -[_TVProductBannerView addSubview:](self, "addSubview:");
  }
  -[_TVProductBannerView setNeedsLayout](self, "setNeedsLayout");

}

- (void)setHeroImageView:(id)a3
{
  UIView *v5;
  UIView *heroImageView;
  UIView *v7;

  v5 = (UIView *)a3;
  heroImageView = self->_heroImageView;
  v7 = v5;
  if (heroImageView != v5)
  {
    -[UIView removeFromSuperview](heroImageView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_heroImageView, a3);
    if (self->_heroImageView)
      -[_TVProductBannerView addSubview:](self, "addSubview:");
  }
  -[_TVProductBannerView setNeedsLayout](self, "setNeedsLayout");

}

- (CGSize)sizeThatFits:(CGSize)result
{
  double height;

  height = self->_height;
  result.height = height;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  objc_super v46;
  CGRect v47;
  CGRect v48;

  v46.receiver = self;
  v46.super_class = (Class)_TVProductBannerView;
  -[_TVFocusRedirectView layoutSubviews](&v46, sel_layoutSubviews);
  -[_TVProductBannerView bounds](self, "bounds");
  -[UIView setFrame:](self->_backgroundImageView, "setFrame:");
  -[UIView tv_margin](self->_infoListView, "tv_margin");
  v45 = v3;
  v5 = v4;
  v7 = v6;
  -[UIView tv_margin](self->_stackView, "tv_margin");
  v44 = v8;
  v10 = v9;
  v12 = v11;
  -[UIView tv_margin](self->_heroImageView, "tv_margin");
  -[UIView tv_associatedIKViewElement](self->_heroImageView, "tv_associatedIKViewElement");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UIView tv_associatedIKViewElement](self->_heroImageView, "tv_associatedIKViewElement");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  if (objc_msgSend(MEMORY[0x24BDF6F90], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[_TVProductBannerView semanticContentAttribute](self, "semanticContentAttribute")) == 1)
  {
    -[UIView tv_itemWidth](self->_stackView, "tv_itemWidth");
    v16 = v15;
    if (v15 == 0.0)
    {
      -[_TVProductBannerView bounds](self, "bounds");
      v16 = CGRectGetWidth(v47) - v10 - v12;
    }
    -[UIView tv_itemHeight](self->_stackView, "tv_itemHeight");
    v41 = v10;
    v42 = v17;
    v18 = fmax(v12, v5) + v10 + v16;
    -[UIView tv_itemWidth](self->_infoListView, "tv_itemWidth");
    v20 = v19;
    -[UIView tv_itemHeight](self->_infoListView, "tv_itemHeight");
    v22 = v21;
  }
  else
  {
    v43 = v12;
    -[UIView tv_itemWidth](self->_infoListView, "tv_itemWidth");
    v24 = v23;
    -[UIView tv_itemHeight](self->_infoListView, "tv_itemHeight");
    v40 = v25;
    v26 = v10;
    v18 = v5;
    v27 = v24;
    v28 = v5 + v24;
    v29 = fmax(v7, v26);
    -[UIView tv_itemWidth](self->_stackView, "tv_itemWidth");
    v16 = v30;
    if (v30 == 0.0)
    {
      -[_TVProductBannerView bounds](self, "bounds");
      v16 = CGRectGetWidth(v48) - v26 - v43;
    }
    v41 = v29 + v28;
    -[UIView tv_itemHeight](self->_stackView, "tv_itemHeight");
    v42 = v31;
    v20 = v27;
    v22 = v40;
  }
  objc_msgSend(v14, "width");
  objc_msgSend(v14, "height");
  UIRectCenteredXInRect();
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v39 = v38;
  -[UIView setFrame:](self->_infoListView, "setFrame:", v18, v45, v20, v22);
  -[UIView setFrame:](self->_stackView, "setFrame:", v41, v44, v16, v42);
  -[UIView setFrame:](self->_heroImageView, "setFrame:", v33, v35, v37, v39);

}

- (id)impressionableElementsContainedInDocument:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = (void *)MEMORY[0x24BDBCEB8];
  v5 = a3;
  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVProductBannerView infoListView](self, "infoListView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tv_impressionableElementsForDocument:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v8);

  -[_TVProductBannerView stackView](self, "stackView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tv_impressionableElementsForDocument:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v10);

  -[_TVProductBannerView heroImageView](self, "heroImageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "tv_impressionableElementsForDocument:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObjectsFromArray:", v12);
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (UIView)backgroundImageView
{
  return self->_backgroundImageView;
}

- (UIView)infoListView
{
  return self->_infoListView;
}

- (UIView)stackView
{
  return self->_stackView;
}

- (UIView)heroImageView
{
  return self->_heroImageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heroImageView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_infoListView, 0);
  objc_storeStrong((id *)&self->_backgroundImageView, 0);
}

@end
