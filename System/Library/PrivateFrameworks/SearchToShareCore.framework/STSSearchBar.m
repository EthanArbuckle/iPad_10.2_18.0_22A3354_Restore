@implementation STSSearchBar

- (STSSearchBarDelegate)stsDelegate
{
  return (STSSearchBarDelegate *)objc_loadWeakRetained((id *)&self->_stsDelegate);
}

- (void)setStsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_stsDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_stsDelegate);
}

@end
