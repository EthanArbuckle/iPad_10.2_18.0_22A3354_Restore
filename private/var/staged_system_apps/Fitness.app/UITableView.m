@implementation UITableView

- (id)ch_withFloatingHeadersAndFooters:(BOOL)a3
{
  -[UITableView _setHeaderAndFooterViewsFloat:](self, "_setHeaderAndFooterViewsFloat:", a3);
  return self;
}

@end
