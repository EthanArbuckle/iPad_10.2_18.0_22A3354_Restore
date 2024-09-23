@implementation WFRowOfIconsView

- (WFRowOfIconsView)initWithMaxNumberOfIcons:(unint64_t)a3 height:(double)a4
{
  WFRowOfIconsView *v6;
  WFRowOfIconsView *v7;
  UIStackView *v8;
  UIStackView *stackView;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSMutableArray *iconViews;
  WFRowOfIconsView *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;
  _QWORD v29[5];

  v29[4] = *MEMORY[0x24BDAC8D0];
  v28.receiver = self;
  v28.super_class = (Class)WFRowOfIconsView;
  v6 = -[WFRowOfIconsView initWithFrame:](&v28, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v7 = v6;
  if (v6)
  {
    v6->_height = a4;
    v6->_maxNumberOfIcons = a3;
    v8 = (UIStackView *)objc_alloc_init(MEMORY[0x24BEBD978]);
    stackView = v7->_stackView;
    v7->_stackView = v8;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v7->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](v7->_stackView, "setAxis:", 0);
    -[UIStackView setAlignment:](v7->_stackView, "setAlignment:", 3);
    -[UIStackView setDistribution:](v7->_stackView, "setDistribution:", 3);
    -[UIStackView setSpacing:](v7->_stackView, "setSpacing:", 0.0);
    -[WFRowOfIconsView addSubview:](v7, "addSubview:", v7->_stackView);
    v23 = (void *)MEMORY[0x24BDD1628];
    -[UIStackView topAnchor](v7->_stackView, "topAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRowOfIconsView topAnchor](v7, "topAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v26);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v25;
    -[UIStackView bottomAnchor](v7->_stackView, "bottomAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRowOfIconsView bottomAnchor](v7, "bottomAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v11;
    -[UIStackView leadingAnchor](v7->_stackView, "leadingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRowOfIconsView leadingAnchor](v7, "leadingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v29[2] = v14;
    -[UIStackView trailingAnchor](v7->_stackView, "trailingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRowOfIconsView trailingAnchor](v7, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintLessThanOrEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v29[3] = v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "activateConstraints:", v18);

    v19 = objc_opt_new();
    iconViews = v7->_iconViews;
    v7->_iconViews = (NSMutableArray *)v19;

    v21 = v7;
  }

  return v7;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  v2 = *MEMORY[0x24BEBE9C8];
  -[WFRowOfIconsView height](self, "height");
  v4 = v3;
  v5 = v2;
  result.height = v4;
  result.width = v5;
  return result;
}

- (void)rebuildSubviewsForItems:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  objc_class *v22;
  id v23;
  uint64_t v24;
  Class (__cdecl *v25)();
  NSObject *v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[WFRowOfIconsView iconViews](self, "iconViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v36, v47, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v37 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        -[WFRowOfIconsView stackView](self, "stackView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeArrangedSubview:", v10);

        objc_msgSend(v10, "removeFromSuperview");
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v36, v47, 16);
    }
    while (v7);
  }

  -[WFRowOfIconsView iconViews](self, "iconViews");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeAllObjects");

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v13 = objc_msgSend(v4, "count");
  v14 = -[WFRowOfIconsView maxNumberOfIcons](self, "maxNumberOfIcons");
  if (v13 >= v14)
    v15 = v14;
  else
    v15 = v13;
  v31 = v4;
  objc_msgSend(v4, "subarrayWithRange:", 0, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v46, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v33;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v33 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v20);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v22 = (objc_class *)MEMORY[0x24BEC5168];
          v23 = v21;
          v24 = objc_msgSend([v22 alloc], "initWithIcon:size:", v23, 29.0, 29.0);
LABEL_20:
          v26 = v24;

          -[NSObject setTranslatesAutoresizingMaskIntoConstraints:](v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          -[WFRowOfIconsView stackView](self, "stackView");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "addArrangedSubview:", v26);

          -[WFRowOfIconsView iconViews](self, "iconViews");
          v28 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "addObject:", v26);
LABEL_21:

          goto LABEL_22;
        }
        if (objc_msgSend(v21, "conformsToProtocol:", &unk_255655768))
        {
          v25 = (Class (__cdecl *)())getHUTriggerIconViewClass_15433;
          v23 = v21;
          v24 = objc_msgSend(objc_alloc(v25()), "initWithIconDescriptor:", v23);
          goto LABEL_20;
        }
        getWFTriggersLogObject();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          v29 = (void *)objc_opt_class();
          *(_DWORD *)buf = 136315650;
          v41 = "-[WFRowOfIconsView rebuildSubviewsForItems:]";
          v42 = 2112;
          v43 = v29;
          v44 = 2112;
          v45 = v21;
          v28 = v29;
          _os_log_impl(&dword_22007E000, v26, OS_LOG_TYPE_ERROR, "%s Unexpected item class (%@): %@", buf, 0x20u);
          goto LABEL_21;
        }
LABEL_22:

        ++v20;
      }
      while (v18 != v20);
      v30 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v46, 16);
      v18 = v30;
    }
    while (v30);
  }

  -[WFRowOfIconsView setNeedsLayout](self, "setNeedsLayout");
}

- (unint64_t)maxNumberOfIcons
{
  return self->_maxNumberOfIcons;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (NSMutableArray)iconViews
{
  return self->_iconViews;
}

- (double)height
{
  return self->_height;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconViews, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

@end
