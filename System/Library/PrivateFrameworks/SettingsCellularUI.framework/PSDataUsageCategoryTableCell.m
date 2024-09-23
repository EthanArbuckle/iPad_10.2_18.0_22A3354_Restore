@implementation PSDataUsageCategoryTableCell

- (PSDataUsageCategoryTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PSDataUsageCategoryTableCell *v4;
  PSDataUsageCategoryTableCell *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PSDataUsageCategoryTableCell;
  v4 = -[PSMultilineTitleTableCell initWithStyle:reuseIdentifier:](&v8, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[PSMultilineTitleTableCell titleLeadingCon](v4, "titleLeadingCon");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setConstant:", 44.0);

  }
  return v5;
}

@end
