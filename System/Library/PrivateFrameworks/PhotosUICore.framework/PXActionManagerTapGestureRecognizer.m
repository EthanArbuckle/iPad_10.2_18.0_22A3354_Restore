@implementation PXActionManagerTapGestureRecognizer

- (UIBarButtonItem)barButtonItem
{
  return self->_barButtonItem;
}

- (void)setBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_barButtonItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_barButtonItem, 0);
}

@end
