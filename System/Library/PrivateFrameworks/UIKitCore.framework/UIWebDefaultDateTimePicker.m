@implementation UIWebDefaultDateTimePicker

- (int64_t)_timeZoneOffsetFromGMT:(id)a3
{
  if (self->_shouldRemoveTimeZoneInformation)
    return -[NSTimeZone secondsFromGMTForDate:](-[UIDatePicker timeZone](self->_datePicker, "timeZone"), "secondsFromGMTForDate:", a3);
  else
    return 0;
}

- (void)_dateChangedSetAsNumber
{
  NSDate *v3;
  double v4;
  double v5;

  v3 = -[UIDatePicker date](self->_datePicker, "date");
  -[NSDate timeIntervalSince1970](v3, "timeIntervalSince1970");
  v5 = (v4 + (double)-[UIWebDefaultDateTimePicker _timeZoneOffsetFromGMT:](self, "_timeZoneOffsetFromGMT:", v3))
     * 1000.0;
  WebThreadLock();
  -[DOMHTMLInputElement setValueAsNumberWithChangeEvent:](self->_inputElement, "setValueAsNumberWithChangeEvent:", v5);
}

- (void)_dateChangedSetAsString
{
  NSDate *v3;
  id v4;
  uint64_t v5;
  id v6;

  v3 = -[UIDatePicker date](self->_datePicker, "date");
  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v4 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v4, "setTimeZone:", -[UIDatePicker timeZone](self->_datePicker, "timeZone"));
  objc_msgSend(v4, "setDateFormat:", self->_formatString);
  objc_msgSend(v4, "setLocale:", v6);
  v5 = objc_msgSend(v4, "stringFromDate:", v3);
  WebThreadLock();
  -[DOMHTMLInputElement setValueWithChangeEvent:](self->_inputElement, "setValueWithChangeEvent:", v5);

}

- (void)_dateChanged
{
  if (self->_formatString)
    -[UIWebDefaultDateTimePicker _dateChangedSetAsString](self, "_dateChangedSetAsString");
  else
    -[UIWebDefaultDateTimePicker _dateChangedSetAsNumber](self, "_dateChangedSetAsNumber");
}

- (UIWebDefaultDateTimePicker)initWithDOMHTMLInputElement:(id)a3 datePickerMode:(int64_t)a4
{
  UIWebDefaultDateTimePicker *v6;
  UIWebDefaultDateTimePicker *v7;
  NSString *v8;
  const __CFString *v9;
  double v10;
  double v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)UIWebDefaultDateTimePicker;
  v6 = -[UIWebDefaultDateTimePicker init](&v13, sel_init);
  v7 = v6;
  if (!v6)
    return v7;
  -[UIWebDefaultDateTimePicker set_inputElement:](v6, "set_inputElement:", a3);
  v8 = -[DOMHTMLInputElement type](v7->_inputElement, "type");
  *(_WORD *)&v7->_shouldRemoveTimeZoneInformation = 0;
  v7->_formatString = 0;
  if (-[NSString isEqualToString:](v8, "isEqualToString:", CFSTR("date")))
  {
    v9 = CFSTR("yyyy-MM-dd");
LABEL_6:
    v7->_formatString = &v9->isa;
    goto LABEL_7;
  }
  if (-[NSString isEqualToString:](v8, "isEqualToString:", CFSTR("month")))
  {
    v9 = CFSTR("yyyy-MM");
    goto LABEL_6;
  }
  if (-[NSString isEqualToString:](v8, "isEqualToString:", CFSTR("time")))
  {
    v7->_formatString = (NSString *)CFSTR("HH:mm");
    v7->_isTimeInput = 1;
  }
  else
  {
    v7->_shouldRemoveTimeZoneInformation = -[NSString isEqualToString:](v8, "isEqualToString:", CFSTR("datetime-local"));
  }
LABEL_7:
  if ((-[UIDevice userInterfaceIdiom](+[UIDevice currentDevice](UIDevice, "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1)+[UIPickerView defaultSizeForCurrentOrientation](UIPickerView, "defaultSizeForCurrentOrientation");
  else
    +[UIKeyboard defaultSizeForInterfaceOrientation:](UIKeyboard, "defaultSizeForInterfaceOrientation:", objc_msgSend((id)UIApp, "_defaultSceneInterfaceOrientationReturningUnknownForNilScene:", 0));
  -[UIWebDefaultDateTimePicker set_datePicker:](v7, "set_datePicker:", -[UIDatePicker initWithFrame:]([UIDatePicker alloc], "initWithFrame:", 0.0, 0.0, v10, v11));
  -[UIDatePicker setDatePickerMode:](v7->_datePicker, "setDatePickerMode:", a4);
  -[UIView setHidden:](v7->_datePicker, "setHidden:", 0);
  -[UIControl addTarget:action:forControlEvents:](v7->_datePicker, "addTarget:action:forControlEvents:", v7, sel__dateChangeHandler_, 4096);
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[UIControl removeTarget:action:forControlEvents:](self->_datePicker, "removeTarget:action:forControlEvents:", self, 0, 4096);
  -[UIWebDefaultDateTimePicker set_inputElement:](self, "set_inputElement:", 0);
  -[UIWebDefaultDateTimePicker set_datePicker:](self, "set_datePicker:", 0);
  v3.receiver = self;
  v3.super_class = (Class)UIWebDefaultDateTimePicker;
  -[UIWebDefaultDateTimePicker dealloc](&v3, sel_dealloc);
}

- (id)controlView
{
  return self->_datePicker;
}

- (id)_sanitizeInputValueForFormatter:(id)a3
{
  if (self->_isTimeInput)
    return (id)objc_msgSend(a3, "substringToIndex:", objc_msgSend(CFSTR("HH:mm"), "length"));
  else
    return a3;
}

- (void)controlBeginEditing
{
  NSString *v3;
  id v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t v9;
  id v10;

  -[UIDatePicker setTimeZone:](self->_datePicker, "setTimeZone:", objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone"));
  v3 = -[DOMHTMLInputElement value](self->_inputElement, "value");
  if (-[NSString length](v3, "length"))
  {
    if (self->_formatString)
    {
      v4 = -[UIWebDefaultDateTimePicker _sanitizeInputValueForFormatter:](self, "_sanitizeInputValueForFormatter:", v3);
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
      v10 = objc_alloc_init(MEMORY[0x1E0CB3578]);
      objc_msgSend(v10, "setTimeZone:", -[UIDatePicker timeZone](self->_datePicker, "timeZone"));
      objc_msgSend(v10, "setDateFormat:", self->_formatString);
      objc_msgSend(v10, "setLocale:", v5);
      v6 = objc_msgSend(v10, "dateFromString:", v4);
      if (!v6)
        v6 = objc_msgSend(MEMORY[0x1E0C99D68], "date");
      -[UIDatePicker setDate:](self->_datePicker, "setDate:", v6);

    }
    else
    {
      -[DOMHTMLInputElement valueAsNumber](self->_inputElement, "valueAsNumber");
      v8 = v7 / 1000.0;
      v9 = -[UIWebDefaultDateTimePicker _timeZoneOffsetFromGMT:](self, "_timeZoneOffsetFromGMT:", objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v7 / 1000.0));
      -[UIDatePicker setDate:](self->_datePicker, "setDate:", objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v8 - (double)v9));
    }
  }
  else
  {
    -[UIDatePicker setDate:](self->_datePicker, "setDate:", objc_msgSend(MEMORY[0x1E0C99D68], "date"));
    -[UIWebDefaultDateTimePicker _dateChanged](self, "_dateChanged");
  }
}

- (DOMHTMLInputElement)_inputElement
{
  return self->_inputElement;
}

- (void)set_inputElement:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (UIDatePicker)_datePicker
{
  return self->_datePicker;
}

- (void)set_datePicker:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
