@implementation _UIActivityItemLoaderResult

- (id)originalItem
{
  return self->_originalItem;
}

- (void)setOriginalItem:(id)a3
{
  objc_storeStrong(&self->_originalItem, a3);
}

- (id)resolvedItem
{
  return self->_resolvedItem;
}

- (void)setResolvedItem:(id)a3
{
  objc_storeStrong(&self->_resolvedItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resolvedItem, 0);
  objc_storeStrong(&self->_originalItem, 0);
}

@end
