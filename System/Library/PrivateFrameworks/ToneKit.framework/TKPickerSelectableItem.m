@implementation TKPickerSelectableItem

- (void)_appendDescriptionOfAttributesToString:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[TKPickerItem _appendDescriptionOfAttributeNamed:withIntegerValue:toString:](self, "_appendDescriptionOfAttributeNamed:withIntegerValue:toString:", CFSTR("section"), -[TKPickerItem section](self, "section"), v7);
  -[TKPickerItem _appendDescriptionOfAttributeNamed:withIntegerValue:toString:](self, "_appendDescriptionOfAttributeNamed:withIntegerValue:toString:", CFSTR("row"), -[TKPickerRowItem row](self, "row"), v7);
  if (-[TKPickerSelectableItem conformsToProtocol:](self, "conformsToProtocol:", &unk_254E0C610))
  {
    v4 = -[TKPickerSelectableItem numberOfChildren](self, "numberOfChildren");
    if (v4 >= 1)
      -[TKPickerItem _appendDescriptionOfAttributeNamed:withIntegerValue:toString:](self, "_appendDescriptionOfAttributeNamed:withIntegerValue:toString:", CFSTR("numberOfChildren"), v4, v7);
  }
  -[TKPickerSelectableItem text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKPickerItem _appendDescriptionOfAttributeNamed:withStringValue:toString:](self, "_appendDescriptionOfAttributeNamed:withStringValue:toString:", CFSTR("text"), v5, v7);

  -[TKPickerItem _appendDescriptionOfAttributeNamed:withBoolValue:toString:](self, "_appendDescriptionOfAttributeNamed:withBoolValue:toString:", CFSTR("shouldTintText"), -[TKPickerSelectableItem shouldTintText](self, "shouldTintText"), v7);
  -[TKPickerSelectableItem detailText](self, "detailText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    -[TKPickerItem _appendDescriptionOfAttributeNamed:withStringValue:toString:](self, "_appendDescriptionOfAttributeNamed:withStringValue:toString:", CFSTR("detailText"), v6, v7);
  if (-[TKPickerSelectableItem showsCheckmark](self, "showsCheckmark"))
    -[TKPickerItem _appendDescriptionOfAttributeNamed:withBoolValue:toString:](self, "_appendDescriptionOfAttributeNamed:withBoolValue:toString:", CFSTR("showsCheckmark"), 1, v7);
  if (-[TKPickerSelectableItem showsDisclosureIndicator](self, "showsDisclosureIndicator"))
    -[TKPickerItem _appendDescriptionOfAttributeNamed:withBoolValue:toString:](self, "_appendDescriptionOfAttributeNamed:withBoolValue:toString:", CFSTR("showsDisclosureIndicator"), 1, v7);
  if (-[TKPickerSelectableItem shouldPreventSelection](self, "shouldPreventSelection"))
    -[TKPickerItem _appendDescriptionOfAttributeNamed:withBoolValue:toString:](self, "_appendDescriptionOfAttributeNamed:withBoolValue:toString:", CFSTR("shouldPreventSelection"), 1, v7);

}

- (NSString)text
{
  return self->_text;
}

- (void)_setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)shouldTintText
{
  return self->_shouldTintText;
}

- (void)_setShouldTintText:(BOOL)a3
{
  self->_shouldTintText = a3;
}

- (NSString)detailText
{
  return self->_detailText;
}

- (void)_setDetailText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)showsCheckmark
{
  return self->_showsCheckmark;
}

- (void)_setShowsCheckmark:(BOOL)a3
{
  self->_showsCheckmark = a3;
}

- (BOOL)showsDisclosureIndicator
{
  return self->_showsDisclosureIndicator;
}

- (void)_setShowsDisclosureIndicator:(BOOL)a3
{
  self->_showsDisclosureIndicator = a3;
}

- (BOOL)shouldPreventSelection
{
  return self->_shouldPreventSelection;
}

- (void)_setShouldPreventSelection:(BOOL)a3
{
  self->_shouldPreventSelection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
