@implementation VSCredentialEntryButton

- (VSCredentialEntryViewModel)owningViewModel
{
  return (VSCredentialEntryViewModel *)objc_loadWeakRetained((id *)&self->_owningViewModel);
}

- (void)setOwningViewModel:(id)a3
{
  objc_storeWeak((id *)&self->_owningViewModel, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_destroyWeak((id *)&self->_owningViewModel);
}

@end
