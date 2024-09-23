@implementation THNotesNoSearchResultContainerView

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[THNotesNoSearchResultsContainerSizeProvider sizeForContainerView:](-[THNotesNoSearchResultContainerView sizeProvider](self, "sizeProvider"), "sizeForContainerView:", self);
  result.height = v3;
  result.width = v2;
  return result;
}

- (THNotesNoSearchResultsContainerSizeProvider)sizeProvider
{
  return self->_sizeProvider;
}

- (void)setSizeProvider:(id)a3
{
  self->_sizeProvider = (THNotesNoSearchResultsContainerSizeProvider *)a3;
}

@end
