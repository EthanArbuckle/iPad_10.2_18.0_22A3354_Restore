@implementation PRXIconContentView

- (PRXIconContentView)initWithCardStyle:(int64_t)a3
{
  PRXIconContentView *v3;
  UILayoutGuide *v4;
  UILayoutGuide *imageViewsGuide;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  PRXIconContentView *v21;
  void *v23;
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
  objc_super v34;
  _QWORD v35[9];

  v35[7] = *MEMORY[0x24BDAC8D0];
  v34.receiver = self;
  v34.super_class = (Class)PRXIconContentView;
  v3 = -[PRXCardContentView initWithCardStyle:](&v34, sel_initWithCardStyle_, a3);
  if (v3)
  {
    v4 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x24BDF6B78]);
    imageViewsGuide = v3->_imageViewsGuide;
    v3->_imageViewsGuide = v4;

    -[PRXIconContentView addLayoutGuide:](v3, "addLayoutGuide:", v3->_imageViewsGuide);
    -[PRXCardContentView mainContentGuide](v3, "mainContentGuide");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide widthAnchor](v3->_imageViewsGuide, "widthAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToConstant:", 0.0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v8) = 1112276992;
    objc_msgSend(v33, "setPriority:", v8);
    -[UILayoutGuide heightAnchor](v3->_imageViewsGuide, "heightAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToConstant:", 0.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v10;
    v23 = v10;
    LODWORD(v12) = 1112276992;
    objc_msgSend(v10, "setPriority:", v12);
    v26 = (void *)MEMORY[0x24BDD1628];
    -[UILayoutGuide topAnchor](v3->_imageViewsGuide, "topAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "topAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v31);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v30;
    -[UILayoutGuide leadingAnchor](v3->_imageViewsGuide, "leadingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "leadingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintGreaterThanOrEqualToAnchor:", v28);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v27;
    -[UILayoutGuide trailingAnchor](v3->_imageViewsGuide, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintLessThanOrEqualToAnchor:", v24);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v35[2] = v13;
    -[UILayoutGuide centerXAnchor](v3->_imageViewsGuide, "centerXAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "centerXAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v35[3] = v16;
    -[UILayoutGuide bottomAnchor](v3->_imageViewsGuide, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintLessThanOrEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v35[4] = v19;
    v35[5] = v33;
    v35[6] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "activateConstraints:", v20);

    v21 = v3;
  }

  return v3;
}

- (void)updateConstraints
{
  void *v2;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSArray *v25;
  NSArray *imageViewsConstraints;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSArray *v35;
  NSArray *bodyLabelConstraints;
  void *v37;
  void *v38;
  NSArray *obj;
  id obja;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  objc_super v49;
  _QWORD v50[4];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v49.receiver = self;
  v49.super_class = (Class)PRXIconContentView;
  -[PRXCardContentView updateConstraints](&v49, sel_updateConstraints);
  if (-[NSArray count](self->_imageViews, "count") && !self->_imageViewsConstraints)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    obj = self->_imageViews;
    v43 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    v5 = 0;
    if (v43)
    {
      v41 = *(_QWORD *)v46;
      do
      {
        v6 = 0;
        v7 = v5;
        do
        {
          if (*(_QWORD *)v46 != v41)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v6);
          objc_msgSend(v8, "centerYAnchor");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "centerYAnchor");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10;
          if (!v10)
          {
            -[UILayoutGuide centerYAnchor](self->_imageViewsGuide, "centerYAnchor");
            v2 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = v2;
          }
          objc_msgSend(v9, "constraintEqualToAnchor:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v12);

          if (!v10)
          objc_msgSend(v8, "topAnchor");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILayoutGuide topAnchor](self->_imageViewsGuide, "topAnchor");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "constraintGreaterThanOrEqualToAnchor:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v15);

          objc_msgSend(v8, "bottomAnchor");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILayoutGuide bottomAnchor](self->_imageViewsGuide, "bottomAnchor");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "constraintLessThanOrEqualToAnchor:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v18);

          objc_msgSend(v8, "leadingAnchor");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v7)
          {
            objc_msgSend(v7, "trailingAnchor");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20, 10.0);
          }
          else
          {
            -[UILayoutGuide leadingAnchor](self->_imageViewsGuide, "leadingAnchor");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "constraintEqualToAnchor:", v20);
          }
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v21);

          v5 = v8;
          ++v6;
          v7 = v5;
        }
        while (v43 != v6);
        v43 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
      }
      while (v43);
    }

    objc_msgSend(v5, "trailingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide trailingAnchor](self->_imageViewsGuide, "trailingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v24);

    v25 = (NSArray *)objc_msgSend(v4, "copy");
    imageViewsConstraints = self->_imageViewsConstraints;
    self->_imageViewsConstraints = v25;

    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", self->_imageViewsConstraints);
  }
  if (self->_bodyLabel)
  {
    if (!self->_bodyLabelConstraints)
    {
      -[PRXCardContentView mainContentGuide](self, "mainContentGuide");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRXLabel topAnchor](self->_bodyLabel, "topAnchor");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide bottomAnchor](self->_imageViewsGuide, "bottomAnchor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "constraintEqualToAnchor:constant:", v42, 20.0);
      obja = (id)objc_claimAutoreleasedReturnValue();
      v50[0] = obja;
      -[PRXLabel leadingAnchor](self->_bodyLabel, "leadingAnchor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "leadingAnchor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "constraintEqualToAnchor:", v37);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v50[1] = v28;
      -[PRXLabel trailingAnchor](self->_bodyLabel, "trailingAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "trailingAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "constraintEqualToAnchor:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v50[2] = v31;
      -[PRXLabel bottomAnchor](self->_bodyLabel, "bottomAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "bottomAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "constraintLessThanOrEqualToAnchor:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v50[3] = v34;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v50, 4);
      v35 = (NSArray *)objc_claimAutoreleasedReturnValue();
      bodyLabelConstraints = self->_bodyLabelConstraints;
      self->_bodyLabelConstraints = v35;

      objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", self->_bodyLabelConstraints);
    }
  }
}

- (void)setImageViews:(id)a3
{
  NSArray *v5;
  NSArray **p_imageViews;
  NSArray *imageViews;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  NSArray *imageViewsConstraints;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = (NSArray *)a3;
  p_imageViews = &self->_imageViews;
  imageViews = self->_imageViews;
  if (imageViews != v5 && !-[NSArray isEqualToArray:](imageViews, "isEqualToArray:", v5))
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v8 = *p_imageViews;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v25 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "removeFromSuperview");
        }
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v10);
    }

    objc_storeStrong((id *)&self->_imageViews, a3);
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v13 = *p_imageViews;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v21;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v21 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * j);
          objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0, (_QWORD)v20);
          -[PRXIconContentView addSubview:](self, "addSubview:", v18);
        }
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v15);
    }

    imageViewsConstraints = self->_imageViewsConstraints;
    self->_imageViewsConstraints = 0;

    if (-[NSArray count](*p_imageViews, "count"))
      -[PRXIconContentView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }

}

- (void)setBodyLabel:(id)a3
{
  PRXLabel *v5;
  PRXLabel **p_bodyLabel;
  PRXLabel *bodyLabel;
  NSArray *bodyLabelConstraints;
  PRXLabel *v9;

  v5 = (PRXLabel *)a3;
  p_bodyLabel = &self->_bodyLabel;
  bodyLabel = self->_bodyLabel;
  v9 = v5;
  if (bodyLabel != v5)
  {
    -[PRXLabel removeFromSuperview](bodyLabel, "removeFromSuperview");
    objc_storeStrong((id *)&self->_bodyLabel, a3);
    -[PRXLabel setTranslatesAutoresizingMaskIntoConstraints:](*p_bodyLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PRXIconContentView addSubview:](self, "addSubview:", *p_bodyLabel);
    bodyLabelConstraints = self->_bodyLabelConstraints;
    self->_bodyLabelConstraints = 0;

    if (*p_bodyLabel)
      -[PRXIconContentView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }

}

- (NSArray)imageViews
{
  return self->_imageViews;
}

- (PRXLabel)bodyLabel
{
  return self->_bodyLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_imageViews, 0);
  objc_storeStrong((id *)&self->_imageViewsGuide, 0);
  objc_storeStrong((id *)&self->_bodyLabelConstraints, 0);
  objc_storeStrong((id *)&self->_imageViewsConstraints, 0);
}

@end
