@implementation NSLayoutConstraint

- (id)mt_copy
{
  void *v3;
  NSLayoutAttribute v4;
  NSLayoutRelation v5;
  void *v6;
  NSLayoutAttribute v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSLayoutConstraint firstItem](self, "firstItem"));
  v4 = -[NSLayoutConstraint firstAttribute](self, "firstAttribute");
  v5 = -[NSLayoutConstraint relation](self, "relation");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSLayoutConstraint secondItem](self, "secondItem"));
  v7 = -[NSLayoutConstraint secondAttribute](self, "secondAttribute");
  -[NSLayoutConstraint multiplier](self, "multiplier");
  v9 = v8;
  -[NSLayoutConstraint constant](self, "constant");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3, v4, v5, v6, v7, v9, v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSLayoutConstraint mt_dynamicTypeConstant](self, "mt_dynamicTypeConstant"));
  objc_msgSend(v11, "mt_setDynamicTypeConstant:", v12);

  -[NSLayoutConstraint priority](self, "priority");
  objc_msgSend(v11, "setPriority:");
  return v11;
}

- (id)mt_copyWithPriority:(float)a3
{
  void *v4;
  double v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSLayoutConstraint mt_copy](self, "mt_copy"));
  *(float *)&v5 = a3;
  objc_msgSend(v4, "setPriority:", v5);
  return v4;
}

- (id)mt_copyWithDynamicTypeConstant:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSLayoutConstraint mt_copy](self, "mt_copy"));
  objc_msgSend(v5, "mt_setDynamicTypeConstant:", v4);

  return v5;
}

- (void)mt_setDynamicTypeConstant:(id)a3
{
  void *v4;
  id value;

  value = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSLayoutConstraint mt_dynamicTypeConstant](self, "mt_dynamicTypeConstant"));
  if ((objc_msgSend(v4, "isEqual:", value) & 1) == 0)
  {
    objc_setAssociatedObject(self, &unk_100026FA4, value, (void *)0x301);
    objc_msgSend(value, "currentConstant");
    -[NSLayoutConstraint setConstant:](self, "setConstant:");
  }

}

- (id)mt_dynamicTypeConstant
{
  return objc_getAssociatedObject(self, &unk_100026FA4);
}

@end
