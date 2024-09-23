@implementation MapsEdgeConstraints

+ (id)edgeConstraintsWithTop:(id)a3 leading:(id)a4 bottom:(id)a5 trailing:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  MapsEdgeConstraints *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = objc_alloc_init(MapsEdgeConstraints);
  -[MapsEdgeConstraints setTopConstraint:](v13, "setTopConstraint:", v12);

  -[MapsEdgeConstraints setLeadingConstraint:](v13, "setLeadingConstraint:", v11);
  -[MapsEdgeConstraints setBottomConstraint:](v13, "setBottomConstraint:", v10);

  -[MapsEdgeConstraints setTrailingConstraint:](v13, "setTrailingConstraint:", v9);
  return v13;
}

- (NSArray)allConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MapsEdgeConstraints topConstraint](self, "topConstraint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MapsEdgeConstraints topConstraint](self, "topConstraint");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  -[MapsEdgeConstraints leftConstraint](self, "leftConstraint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MapsEdgeConstraints leftConstraint](self, "leftConstraint");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MapsEdgeConstraints leadingConstraint](self, "leadingConstraint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      goto LABEL_8;
    -[MapsEdgeConstraints leadingConstraint](self, "leadingConstraint");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v7;
  objc_msgSend(v3, "addObject:", v7);

LABEL_8:
  -[MapsEdgeConstraints bottomConstraint](self, "bottomConstraint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[MapsEdgeConstraints bottomConstraint](self, "bottomConstraint");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v11);

  }
  -[MapsEdgeConstraints rightConstraint](self, "rightConstraint");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[MapsEdgeConstraints rightConstraint](self, "rightConstraint");
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_14:
    v15 = (void *)v13;
    objc_msgSend(v3, "addObject:", v13);

    goto LABEL_15;
  }
  -[MapsEdgeConstraints trailingConstraint](self, "trailingConstraint");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[MapsEdgeConstraints trailingConstraint](self, "trailingConstraint");
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
LABEL_15:
  v16 = (void *)objc_msgSend(v3, "copy");

  return (NSArray *)v16;
}

- (NSLayoutConstraint)topConstraint
{
  return self->_topConstraint;
}

- (void)setTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_topConstraint, a3);
}

- (NSLayoutConstraint)leftConstraint
{
  return self->_leftConstraint;
}

- (void)setLeftConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_leftConstraint, a3);
}

- (NSLayoutConstraint)leadingConstraint
{
  return self->_leadingConstraint;
}

- (void)setLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_leadingConstraint, a3);
}

- (NSLayoutConstraint)bottomConstraint
{
  return self->_bottomConstraint;
}

- (void)setBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bottomConstraint, a3);
}

- (NSLayoutConstraint)rightConstraint
{
  return self->_rightConstraint;
}

- (void)setRightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_rightConstraint, a3);
}

- (NSLayoutConstraint)trailingConstraint
{
  return self->_trailingConstraint;
}

- (void)setTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_trailingConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingConstraint, 0);
  objc_storeStrong((id *)&self->_rightConstraint, 0);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_leadingConstraint, 0);
  objc_storeStrong((id *)&self->_leftConstraint, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
}

@end
