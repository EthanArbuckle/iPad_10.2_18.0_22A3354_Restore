@implementation VSCredentialEntryPicker

- (void)setSelectedIndex:(int64_t)a3
{
  self->_selectedIndex = a3;
}

- (id)pickerItemAtCurrentIndex
{
  void *v3;
  void *v4;

  -[VSCredentialEntryPicker pickerItems](self, "pickerItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndex:", -[VSCredentialEntryPicker selectedIndex](self, "selectedIndex"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)pickerItems
{
  return self->_pickerItems;
}

- (void)setPickerItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pickerItems, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
