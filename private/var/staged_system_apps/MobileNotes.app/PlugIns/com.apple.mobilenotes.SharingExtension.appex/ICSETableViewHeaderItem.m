@implementation ICSETableViewHeaderItem

- (BOOL)isHeader
{
  return 1;
}

- (BOOL)isSelectable
{
  return 0;
}

- (BOOL)isChecked
{
  return 0;
}

- (double)cellHeight
{
  unint64_t v2;
  uint64_t v3;
  double *v4;
  int v5;
  double *v6;

  v2 = -[ICSETableViewHeaderItem headerType](self, "headerType");
  if (v2 > 2)
    return 32.0;
  v4 = (double *)((char *)&unk_1000B3788 + 8 * v2);
  v5 = ICAccessibilityAccessibilityLargerTextSizesEnabled(v2, v3);
  v6 = (double *)&UITableViewAutomaticDimension;
  if (!v5)
    v6 = v4;
  return *v6;
}

- (UIColor)backgroundColor
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v4 = -[ICSETableViewHeaderItem headerType](self, "headerType");
  if (v4 == 1)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[UIColor systemGroupedBackgroundColor](UIColor, "systemGroupedBackgroundColor"));
    goto LABEL_5;
  }
  if (v4 == 2)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[UIColor tertiarySystemGroupedBackgroundColor](UIColor, "tertiarySystemGroupedBackgroundColor"));
LABEL_5:
    v6 = (void *)v5;

    v3 = v6;
  }
  return (UIColor *)v3;
}

+ (id)headerItemWithAccount:(id)a3
{
  id v3;
  ICSETableViewHeaderItem *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc_init(ICSETableViewHeaderItem);
  -[ICSETableViewHeaderItem setHeaderType:](v4, "setHeaderType:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accountName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedUppercaseString"));
  -[ICSETableViewItem setTitle:](v4, "setTitle:", v6);

  -[ICSETableViewItem setAccount:](v4, "setAccount:", v3);
  return v4;
}

- (unint64_t)headerType
{
  return self->_headerType;
}

- (void)setHeaderType:(unint64_t)a3
{
  self->_headerType = a3;
}

@end
