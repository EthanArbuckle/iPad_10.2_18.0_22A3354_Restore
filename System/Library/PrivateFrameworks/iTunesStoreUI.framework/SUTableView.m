@implementation SUTableView

- (BOOL)allowsFooterViewsToFloat
{
  return self->_allowsHeaderAndFooterToFloat;
}

- (BOOL)allowsHeaderViewsToFloat
{
  return self->_allowsHeaderAndFooterToFloat;
}

- (BOOL)allowsHeaderAndFooterToFloat
{
  return self->_allowsHeaderAndFooterToFloat;
}

- (void)setAllowsHeaderAndFooterToFloat:(BOOL)a3
{
  self->_allowsHeaderAndFooterToFloat = a3;
}

@end
