@implementation TransitStationDatePickerHeaderView

- (TransitStationDatePickerHeaderView)initWithFrame:(CGRect)a3
{
  TransitStationDatePickerHeaderView *v3;
  UIDatePicker *v4;
  UIDatePicker *datePicker;
  UIDatePicker *v6;
  objc_super v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TransitStationDatePickerHeaderView;
  v3 = -[TransitStationLineScheduleSectionHeaderView initWithFrame:](&v9, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIDatePicker *)objc_msgSend(objc_alloc((Class)UIDatePicker), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    datePicker = v3->_datePicker;
    v3->_datePicker = v4;

    -[UIDatePicker setDatePickerMode:](v3->_datePicker, "setDatePickerMode:", 1);
    v6 = v3->_datePicker;
    v8.receiver = v3;
    v8.super_class = (Class)TransitStationDatePickerHeaderView;
    -[TransitStationLineScheduleSectionHeaderView _addSecondaryView:](&v8, "_addSecondaryView:", v6);
  }
  return v3;
}

- (UIDatePicker)datePicker
{
  return self->_datePicker;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_datePicker, 0);
}

@end
