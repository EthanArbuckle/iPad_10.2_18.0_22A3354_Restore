@implementation REUpNextCollectionView

- (UILayoutGuide)contentSizeLayoutGuide
{
  return self->_contentSizeLayoutGuide;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentSizeLayoutGuide, 0);
}

@end
