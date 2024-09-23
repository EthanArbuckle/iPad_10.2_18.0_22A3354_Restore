@implementation UIDebuggingInformationHierarchyLayoutAttributes

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIDebuggingInformationHierarchyLayoutAttributes;
  if (-[UICollectionViewLayoutAttributes isEqual:](&v9, sel_isEqual_, v4)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v4, "lineColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDebuggingInformationHierarchyLayoutAttributes lineColor](self, "lineColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5 == v6;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIDebuggingInformationHierarchyLayoutAttributes;
  v4 = -[UICollectionViewLayoutAttributes copyWithZone:](&v7, sel_copyWithZone_, a3);
  -[UIDebuggingInformationHierarchyLayoutAttributes lineColor](self, "lineColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLineColor:", v5);

  return v4;
}

- (UIColor)lineColor
{
  return self->_lineColor;
}

- (void)setLineColor:(id)a3
{
  objc_storeStrong((id *)&self->_lineColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lineColor, 0);
}

@end
