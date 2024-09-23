@implementation TKPickerRowItem

- (void)_appendDescriptionOfAttributesToString:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TKPickerRowItem;
  v4 = a3;
  -[TKPickerItem _appendDescriptionOfAttributesToString:](&v5, sel__appendDescriptionOfAttributesToString_, v4);
  -[TKPickerItem _appendDescriptionOfAttributeNamed:withIntegerValue:toString:](self, "_appendDescriptionOfAttributeNamed:withIntegerValue:toString:", CFSTR("row"), -[TKPickerRowItem row](self, "row", v5.receiver, v5.super_class), v4);

}

- (int64_t)row
{
  return self->_row;
}

- (void)_setRow:(int64_t)a3
{
  self->_row = a3;
}

@end
