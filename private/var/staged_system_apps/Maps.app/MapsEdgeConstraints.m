@implementation MapsEdgeConstraints

+ (MapsEdgeConstraints)edgeConstraintsWithTop:(id)a3 leading:(id)a4 bottom:(id)a5 trailing:(id)a6
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

+ (MapsEdgeConstraints)edgeConstraintsWithTop:(id)a3 left:(id)a4 bottom:(id)a5 right:(id)a6
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

  -[MapsEdgeConstraints setLeftConstraint:](v13, "setLeftConstraint:", v11);
  -[MapsEdgeConstraints setBottomConstraint:](v13, "setBottomConstraint:", v10);

  -[MapsEdgeConstraints setRightConstraint:](v13, "setRightConstraint:", v9);
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
  id v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 4));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsEdgeConstraints topConstraint](self, "topConstraint"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsEdgeConstraints topConstraint](self, "topConstraint"));
    objc_msgSend(v3, "addObject:", v5);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsEdgeConstraints leftConstraint](self, "leftConstraint"));

  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(-[MapsEdgeConstraints leftConstraint](self, "leftConstraint"));
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsEdgeConstraints leadingConstraint](self, "leadingConstraint"));

    if (!v8)
      goto LABEL_8;
    v7 = objc_claimAutoreleasedReturnValue(-[MapsEdgeConstraints leadingConstraint](self, "leadingConstraint"));
  }
  v9 = (void *)v7;
  objc_msgSend(v3, "addObject:", v7);

LABEL_8:
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsEdgeConstraints bottomConstraint](self, "bottomConstraint"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsEdgeConstraints bottomConstraint](self, "bottomConstraint"));
    objc_msgSend(v3, "addObject:", v11);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsEdgeConstraints rightConstraint](self, "rightConstraint"));

  if (v12)
  {
    v13 = objc_claimAutoreleasedReturnValue(-[MapsEdgeConstraints rightConstraint](self, "rightConstraint"));
LABEL_14:
    v15 = (void *)v13;
    objc_msgSend(v3, "addObject:", v13);

    goto LABEL_15;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapsEdgeConstraints trailingConstraint](self, "trailingConstraint"));

  if (v14)
  {
    v13 = objc_claimAutoreleasedReturnValue(-[MapsEdgeConstraints trailingConstraint](self, "trailingConstraint"));
    goto LABEL_14;
  }
LABEL_15:
  v16 = objc_msgSend(v3, "copy");

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
