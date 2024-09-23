@implementation VSCredentialEntryPickerItem

- (NSString)itemName
{
  return self->_itemName;
}

- (void)setItemName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)itemValue
{
  return self->_itemValue;
}

- (void)setItemValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)itemId
{
  return self->_itemId;
}

- (void)setItemId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemId, 0);
  objc_storeStrong((id *)&self->_itemValue, 0);
  objc_storeStrong((id *)&self->_itemName, 0);
}

@end
