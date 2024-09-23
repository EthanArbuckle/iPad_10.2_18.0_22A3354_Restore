@implementation NSLayoutDimension

- (id)constraintEqualToConstant:(double)a3 priority:(float)a4
{
  void *v5;
  double v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSLayoutDimension constraintEqualToConstant:](self, "constraintEqualToConstant:", a3));
  *(float *)&v6 = a4;
  objc_msgSend(v5, "setPriority:", v6);
  return v5;
}

- (id)constraintGreaterThanOrEqualToConstant:(double)a3 priority:(float)a4
{
  void *v5;
  double v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSLayoutDimension constraintGreaterThanOrEqualToConstant:](self, "constraintGreaterThanOrEqualToConstant:", a3));
  *(float *)&v6 = a4;
  objc_msgSend(v5, "setPriority:", v6);
  return v5;
}

- (id)constraintLessThanOrEqualToConstant:(double)a3 priority:(float)a4
{
  void *v5;
  double v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSLayoutDimension constraintLessThanOrEqualToConstant:](self, "constraintLessThanOrEqualToConstant:", a3));
  *(float *)&v6 = a4;
  objc_msgSend(v5, "setPriority:", v6);
  return v5;
}

- (id)constraintEqualToAnchor:(id)a3 multiplier:(double)a4 priority:(float)a5
{
  void *v6;
  double v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSLayoutDimension constraintEqualToAnchor:multiplier:](self, "constraintEqualToAnchor:multiplier:", a3, a4));
  *(float *)&v7 = a5;
  objc_msgSend(v6, "setPriority:", v7);
  return v6;
}

@end
