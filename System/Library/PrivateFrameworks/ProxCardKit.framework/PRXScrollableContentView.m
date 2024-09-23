@implementation PRXScrollableContentView

- (PRXScrollableContentView)initWithCardStyle:(int64_t)a3
{
  id v5;
  PRXScrollableContentView *v6;

  v5 = objc_alloc_init(MEMORY[0x24BDF6D50]);
  v6 = -[PRXScrollableContentView initWithCardStyle:scrollView:](self, "initWithCardStyle:scrollView:", a3, v5);

  return v6;
}

- (PRXScrollableContentView)initWithCardStyle:(int64_t)a3 scrollView:(id)a4
{
  id v7;
  PRXScrollableContentView *v8;
  PRXScrollableContentView *v9;
  id *p_scrollView;
  void *v11;
  double v12;
  uint64_t v13;
  NSLayoutConstraint *scrollViewHeightConstraint;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  PRXScrollableContentView *v22;
  void *v24;
  void *v25;
  void *v26;
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
  void *v37;
  objc_super v38;
  _QWORD v39[8];

  v39[6] = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v38.receiver = self;
  v38.super_class = (Class)PRXScrollableContentView;
  v8 = -[PRXCardContentView initWithCardStyle:](&v38, sel_initWithCardStyle_, a3);
  v9 = v8;
  if (v8)
  {
    p_scrollView = (id *)&v8->_scrollView;
    objc_storeStrong((id *)&v8->_scrollView, a4);
    objc_msgSend(*p_scrollView, "setScrollEnabled:", 0);
    objc_msgSend(*p_scrollView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(*p_scrollView, "setPreservesSuperviewLayoutMargins:", 1);
    -[PRXScrollableContentView addSubview:](v9, "addSubview:", *p_scrollView);
    objc_msgSend(*p_scrollView, "heightAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_scrollView, "contentSize");
    objc_msgSend(v11, "constraintEqualToConstant:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    scrollViewHeightConstraint = v9->_scrollViewHeightConstraint;
    v9->_scrollViewHeightConstraint = (NSLayoutConstraint *)v13;

    v29 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(*p_scrollView, "leadingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXScrollableContentView leadingAnchor](v9, "leadingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v36);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v35;
    objc_msgSend(*p_scrollView, "trailingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXScrollableContentView trailingAnchor](v9, "trailingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v33);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = v32;
    objc_msgSend(*p_scrollView, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXCardContentView mainContentGuide](v9, "mainContentGuide");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "topAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v28);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v39[2] = v27;
    objc_msgSend(*p_scrollView, "bottomAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXCardContentView mainContentGuide](v9, "mainContentGuide");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "bottomAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v24);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v39[3] = v15;
    objc_msgSend(*p_scrollView, "contentLayoutGuide");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "widthAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXCardContentView mainContentGuide](v9, "mainContentGuide");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "widthAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v39[4] = v20;
    v39[5] = v9->_scrollViewHeightConstraint;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v39, 6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "activateConstraints:", v21);

    objc_msgSend(*p_scrollView, "addObserver:forKeyPath:options:context:", v9, CFSTR("contentSize"), 0, PRXScrollableContentViewObserverContentSizeContext);
    v22 = v9;
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[UIScrollView removeObserver:forKeyPath:context:](self->_scrollView, "removeObserver:forKeyPath:context:", self, CFSTR("contentSize"), PRXScrollableContentViewObserverContentSizeContext);
  v3.receiver = self;
  v3.super_class = (Class)PRXScrollableContentView;
  -[PRXScrollableContentView dealloc](&v3, sel_dealloc);
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double MaxY;
  double v4;
  CGSize result;
  CGRect v6;

  v2 = *MEMORY[0x24BDF7FB8];
  -[UIScrollView frame](self->_scrollView, "frame");
  MaxY = CGRectGetMaxY(v6);
  v4 = v2;
  result.height = MaxY;
  result.width = v4;
  return result;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  NSObject *v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;

  if ((void *)PRXScrollableContentViewObserverContentSizeContext == a6)
  {
    PRXDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[PRXScrollableContentView observeValueForKeyPath:ofObject:change:context:].cold.1((uint64_t)self, v7);

    -[NSLayoutConstraint constant](self->_scrollViewHeightConstraint, "constant");
    v9 = v8;
    -[UIScrollView contentSize](self->_scrollView, "contentSize");
    if (v9 != v10)
    {
      -[NSLayoutConstraint setConstant:](self->_scrollViewHeightConstraint, "setConstant:", v10);
      -[PRXScrollableContentView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    }
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)PRXScrollableContentView;
    -[PRXScrollableContentView observeValueForKeyPath:ofObject:change:context:](&v11, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (NSLayoutConstraint)scrollViewHeightConstraint
{
  return self->_scrollViewHeightConstraint;
}

- (void)setScrollViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_scrollViewHeightConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
}

- (void)observeValueForKeyPath:(uint64_t)a1 ofObject:(NSObject *)a2 change:context:.cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  CGSize v7;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 512), "contentSize");
  NSStringFromCGSize(v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_21161A000, a2, OS_LOG_TYPE_DEBUG, "contentSize changed for scroll view: %@", (uint8_t *)&v4, 0xCu);

}

@end
