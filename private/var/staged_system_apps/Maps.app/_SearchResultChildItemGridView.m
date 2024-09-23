@implementation _SearchResultChildItemGridView

- (void)removeAllArrangedSubviews
{
  id v3;

  if ((uint64_t)-[_SearchResultChildItemGridView numberOfRows](self, "numberOfRows") >= 1)
  {
    do
      -[_SearchResultChildItemGridView removeRowAtIndex:](self, "removeRowAtIndex:", 0);
    while ((uint64_t)-[_SearchResultChildItemGridView numberOfRows](self, "numberOfRows") > 0);
  }
  v3 = (id)objc_claimAutoreleasedReturnValue(-[_SearchResultChildItemGridView subviews](self, "subviews"));
  objc_msgSend(v3, "makeObjectsPerformSelector:", "removeFromSuperview");

}

@end
