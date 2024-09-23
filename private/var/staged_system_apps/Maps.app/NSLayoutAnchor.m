@implementation NSLayoutAnchor

- (id)constraintEqualToAnchor:(id)a3 constant:(double)a4 priority:(float)a5
{
  void *v6;
  double v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSLayoutAnchor constraintEqualToAnchor:constant:](self, "constraintEqualToAnchor:constant:", a3, a4));
  *(float *)&v7 = a5;
  objc_msgSend(v6, "setPriority:", v7);
  return v6;
}

- (id)constraintGreaterThanOrEqualToAnchor:(id)a3 constant:(double)a4 priority:(float)a5
{
  void *v6;
  double v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSLayoutAnchor constraintGreaterThanOrEqualToAnchor:constant:](self, "constraintGreaterThanOrEqualToAnchor:constant:", a3, a4));
  *(float *)&v7 = a5;
  objc_msgSend(v6, "setPriority:", v7);
  return v6;
}

- (id)constraintLessThanOrEqualToAnchor:(id)a3 constant:(double)a4 priority:(float)a5
{
  void *v6;
  double v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSLayoutAnchor constraintLessThanOrEqualToAnchor:constant:](self, "constraintLessThanOrEqualToAnchor:constant:", a3, a4));
  *(float *)&v7 = a5;
  objc_msgSend(v6, "setPriority:", v7);
  return v6;
}

- (NSString)maps_uniqueKey
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%p"), self);
}

@end
