@implementation PKPassEntitlementsComposerPredefinedSelectionEntry

- (PKPassEntitlementsComposerPredefinedSelectionEntry)init
{

  return 0;
}

- (NSCopying)identifier
{
  return (NSCopying *)-[PKPredefinedSharedEntitlementSelection identifier](self->_predefinedSelection, "identifier");
}

- (PKPredefinedSharedEntitlementSelection)predefinedSelection
{
  return self->_predefinedSelection;
}

- (void)setPredefinedSelection:(id)a3
{
  objc_storeStrong((id *)&self->_predefinedSelection, a3);
}

- (NSArray)entries
{
  return self->_entries;
}

- (void)setEntries:(id)a3
{
  objc_storeStrong((id *)&self->_entries, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong((id *)&self->_predefinedSelection, 0);
  objc_destroyWeak((id *)&self->_parentEntitlementComposer);
}

@end
