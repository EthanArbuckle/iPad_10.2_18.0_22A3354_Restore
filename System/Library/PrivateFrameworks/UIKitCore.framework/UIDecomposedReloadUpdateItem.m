@implementation UIDecomposedReloadUpdateItem

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pairedItem);
}

- (BOOL)isDecomposedFromReload
{
  return 1;
}

- (id)pairedItem
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 5);
  return WeakRetained;
}

@end
