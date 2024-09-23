@implementation _UICollectionViewCompositionLayoutInvalidationContext

- (void)_setInvalidationContextTable:(id)a3
{
  NSMapTable *v5;
  NSMapTable *v6;

  v5 = (NSMapTable *)a3;
  if (self->_invalidationContextTable != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_invalidationContextTable, a3);
    v5 = v6;
  }

}

- (NSMapTable)_invalidationContextTable
{
  return self->_invalidationContextTable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidationContextTable, 0);
}

@end
