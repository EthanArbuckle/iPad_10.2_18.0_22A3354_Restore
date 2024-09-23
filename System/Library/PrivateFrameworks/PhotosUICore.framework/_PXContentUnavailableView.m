@implementation _PXContentUnavailableView

- (void)becomeReusable
{
  -[_PXContentUnavailableView setHidden:](self, "setHidden:", 1);
}

- (void)prepareForReuse
{
  -[_PXContentUnavailableView setHidden:](self, "setHidden:", 0);
}

@end
