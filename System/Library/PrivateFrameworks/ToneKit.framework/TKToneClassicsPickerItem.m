@implementation TKToneClassicsPickerItem

- (id)childItemAtIndex:(int64_t)a3
{
  return 0;
}

- (void)_appendDescriptionOfAttributesToString:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TKToneClassicsPickerItem;
  v4 = a3;
  -[TKTonePickerItem _appendDescriptionOfAttributesToString:](&v5, sel__appendDescriptionOfAttributesToString_, v4);
  -[TKPickerItem _appendDescriptionOfAttributeNamed:withIntegerValue:toString:](self, "_appendDescriptionOfAttributeNamed:withIntegerValue:toString:", CFSTR("classicToneIndex"), -[TKToneClassicsPickerItem classicToneIndex](self, "classicToneIndex", v5.receiver, v5.super_class), v4);

}

- (TKTonePickerItem)parentItem
{
  return (TKTonePickerItem *)objc_loadWeakRetained((id *)&self->_parentItem);
}

- (void)_setParentItem:(id)a3
{
  objc_storeWeak((id *)&self->_parentItem, a3);
}

- (int64_t)classicToneIndex
{
  return self->_classicToneIndex;
}

- (void)_setClassicToneIndex:(int64_t)a3
{
  self->_classicToneIndex = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentItem);
}

@end
