@implementation WFCompactThumbnailViewController

- (unint64_t)preferredContentMode
{
  return 0;
}

- (double)contentHeightForWidth:(double)a3
{
  return 0.0;
}

- (void)invalidateContentSize
{
  id v3;

  -[WFCompactThumbnailViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "thumbnailViewControllerDidInvalidateSize:", self);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)contentHeightLikelyToChange
{
  return self->_contentHeightLikelyToChange;
}

- (WFCompactThumbnailViewControllerDelegate)delegate
{
  return (WFCompactThumbnailViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
