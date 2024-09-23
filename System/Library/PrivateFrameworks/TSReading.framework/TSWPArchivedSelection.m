@implementation TSWPArchivedSelection

- (TSWPArchivedSelection)initWithContext:(id)a3
{
  TSWPArchivedSelection *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSWPArchivedSelection;
  v3 = -[TSPObject initWithContext:](&v5, sel_initWithContext_, a3);
  if (v3)
    -[TSWPArchivedSelection setSelection:](v3, "setSelection:", -[TSWPSelection initWithRange:]([TSWPSelection alloc], "initWithRange:", 0, 0));
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWPArchivedSelection;
  -[TSWPArchivedSelection dealloc](&v3, sel_dealloc);
}

- (void)setSelection:(id)a3
{
  id v5;

  -[TSPObject willModify](self, "willModify");
  v5 = a3;

  self->_selection = (TSWPSelection *)a3;
}

- (TSWPSelection)selection
{
  return self->_selection;
}

@end
