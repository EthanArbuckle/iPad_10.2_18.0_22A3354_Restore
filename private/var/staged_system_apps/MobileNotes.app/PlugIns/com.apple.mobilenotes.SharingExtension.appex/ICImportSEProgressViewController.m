@implementation ICImportSEProgressViewController

- (UILabel)statusLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_statusLabel);
}

- (void)setStatusLabel:(id)a3
{
  objc_storeWeak((id *)&self->_statusLabel, a3);
}

- (UIActivityIndicatorView)statusActivityIndicator
{
  return (UIActivityIndicatorView *)objc_loadWeakRetained((id *)&self->_statusActivityIndicator);
}

- (void)setStatusActivityIndicator:(id)a3
{
  objc_storeWeak((id *)&self->_statusActivityIndicator, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_statusActivityIndicator);
  objc_destroyWeak((id *)&self->_statusLabel);
}

@end
