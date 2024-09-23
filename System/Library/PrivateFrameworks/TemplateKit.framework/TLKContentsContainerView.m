@implementation TLKContentsContainerView

- (TLKContentsContainerView)init
{
  TLKContentsContainerView *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TLKContentsContainerView;
  v2 = -[TLKContentsContainerView init](&v5, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[TLKContentsContainerView setContentsViews:](v2, "setContentsViews:", v3);

    -[TLKStackView setAxis:](v2, "setAxis:", 1);
    -[NUIContainerStackView setSpacing:](v2, "setSpacing:", 14.0);
  }
  return v2;
}

- (void)updateWithContents:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  unint64_t v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t i;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  id v30;

  v30 = a3;
  v4 = objc_msgSend(v30, "count");
  -[TLKContentsContainerView contentsViews](self, "contentsViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v4 != v6)
  {
    v14 = objc_msgSend(v30, "count");
    -[TLKContentsContainerView contentsViews](self, "contentsViews");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (v14 <= v16)
    {
      for (i = objc_msgSend(v30, "count"); ; ++i)
      {
        -[TLKContentsContainerView contentsViews](self, "contentsViews");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "count");

        if (i >= v27)
          break;
        -[TLKContentsContainerView contentsViews](self, "contentsViews");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "objectAtIndexedSubscript:", i);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setHidden:", 1);

      }
    }
    else
    {
      -[TLKContentsContainerView contentsViews](self, "contentsViews");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");
      v19 = objc_msgSend(v30, "count");

      if (v18 < v19)
      {
        do
        {
          v20 = (void *)objc_opt_new();
          -[TLKContentsContainerView contentsViews](self, "contentsViews");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v20);

          -[TLKStackView addArrangedSubview:](self, "addArrangedSubview:", v20);
          -[TLKContentsContainerView contentsViews](self, "contentsViews");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "count");
          v24 = objc_msgSend(v30, "count");

        }
        while (v23 < v24);
      }
    }
  }
  if (objc_msgSend(v30, "count"))
  {
    v7 = 0;
    do
    {
      -[TLKContentsContainerView contentsViews](self, "contentsViews");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectAtIndexedSubscript:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "title");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectAtIndexedSubscript:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "details");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "updateWithTitle:contents:", v11, v13);

      ++v7;
    }
    while (v7 < objc_msgSend(v30, "count"));
  }

}

- (NSMutableArray)contentsViews
{
  return self->_contentsViews;
}

- (void)setContentsViews:(id)a3
{
  objc_storeStrong((id *)&self->_contentsViews, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentsViews, 0);
}

@end
