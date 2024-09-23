@implementation _WeakPersonalizedCompoundItem

- (PersonalizedCompoundItem)item
{
  return (PersonalizedCompoundItem *)objc_loadWeakRetained((id *)&self->_item);
}

- (void)setItem:(id)a3
{
  objc_storeWeak((id *)&self->_item, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_item);
}

@end
