@implementation _UIDatePickerMode_DateWithOptionalYear

+ (int64_t)datePickerMode
{
  return 4271;
}

- (int64_t)numberOfRowsForCalendarUnit:(unint64_t)a3
{
  objc_super v4;

  if (a3 == 4)
    return -[_UIDatePickerMode yearsSinceBaseDate](self, "yearsSinceBaseDate") + 2;
  v4.receiver = self;
  v4.super_class = (Class)_UIDatePickerMode_DateWithOptionalYear;
  return -[_UIDatePickerMode_Date numberOfRowsForCalendarUnit:](&v4, sel_numberOfRowsForCalendarUnit_);
}

- (id)titleForRow:(int64_t)a3 inComponent:(int64_t)a4
{
  objc_super v8;

  if (-[_UIDatePickerMode calendarUnitForComponent:](self, "calendarUnitForComponent:", a4) == 4
    && -[_UIDatePickerMode yearsSinceBaseDate](self, "yearsSinceBaseDate") < a3)
  {
    return CFSTR("----");
  }
  v8.receiver = self;
  v8.super_class = (Class)_UIDatePickerMode_DateWithOptionalYear;
  -[_UIDatePickerMode titleForRow:inComponent:](&v8, sel_titleForRow_inComponent_, a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)yearForRow:(int64_t)a3
{
  objc_super v6;

  if (-[_UIDatePickerMode yearsSinceBaseDate](self, "yearsSinceBaseDate") < a3)
    return -[_UIDatePickerMode _yearlessYearForMonth:](self, "_yearlessYearForMonth:", -[_UIDatePickerMode monthForRow:](self, "monthForRow:", a3));
  v6.receiver = self;
  v6.super_class = (Class)_UIDatePickerMode_DateWithOptionalYear;
  return -[_UIDatePickerMode yearForRow:](&v6, sel_yearForRow_, a3);
}

- (int64_t)rowForDate:(id)a3 dateComponents:(id)a4 component:(int64_t)a5 currentRow:(int64_t)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  if (-[_UIDatePickerMode calendarUnitForComponent:](self, "calendarUnitForComponent:", a5) != 4)
    goto LABEL_6;
  -[_UIDatePickerMode calendar](self, "calendar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "components:fromDate:", 12, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "year");
  if (v14 != -[_UIDatePickerMode _yearlessYearForMonth:](self, "_yearlessYearForMonth:", objc_msgSend(v13, "month")))
  {

LABEL_6:
    v17.receiver = self;
    v17.super_class = (Class)_UIDatePickerMode_DateWithOptionalYear;
    v15 = -[_UIDatePickerMode_Date rowForDate:dateComponents:component:currentRow:](&v17, sel_rowForDate_dateComponents_component_currentRow_, v10, v11, a5, a6);
    goto LABEL_7;
  }
  v15 = (id)(-[_UIDatePickerMode yearsSinceBaseDate](self, "yearsSinceBaseDate") + 1);

  if (v15 == (id)-1)
    goto LABEL_6;
LABEL_7:

  return (int64_t)v15;
}

- (void)_updateSelectedDateComponentsWithNewValueInComponent:(int64_t)a3 usingSelectionBarValue:(BOOL)a4
{
  void *v6;
  uint64_t v7;
  NSDateComponents *v8;
  NSDateComponents *selectedDateComponents;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UIDatePickerMode_DateWithOptionalYear;
  -[_UIDatePickerMode _updateSelectedDateComponentsWithNewValueInComponent:usingSelectionBarValue:](&v10, sel__updateSelectedDateComponentsWithNewValueInComponent_usingSelectionBarValue_, a3, a4);
  if (self->super.super._selectedDateComponents
    && (a3 == 0x7FFFFFFFFFFFFFFFLL
     || -[_UIDatePickerMode calendarUnitForComponent:](self, "calendarUnitForComponent:", a3) == 4))
  {
    -[_UIDatePickerMode datePickerView](self, "datePickerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "selectedRowInComponent:", -[_UIDatePickerMode componentForCalendarUnit:](self, "componentForCalendarUnit:", 4));

    if (v7 > -[_UIDatePickerMode yearsSinceBaseDate](self, "yearsSinceBaseDate"))
    {
      v8 = self->super.super._selectedDateComponents;
      -[NSDateComponents setYear:](v8, "setYear:", -[_UIDatePickerMode _yearlessYearForMonth:](self, "_yearlessYearForMonth:", v8));
      selectedDateComponents = self->super.super._selectedDateComponents;
      self->super.super._selectedDateComponents = v8;

    }
  }
}

- (BOOL)_shouldEnableValueForRow:(int64_t)a3 inComponent:(int64_t)a4 calendarUnit:(unint64_t)a5
{
  objc_super v10;

  if (a5 == 4 && -[_UIDatePickerMode yearsSinceBaseDate](self, "yearsSinceBaseDate") < a3)
    return 1;
  v10.receiver = self;
  v10.super_class = (Class)_UIDatePickerMode_DateWithOptionalYear;
  return -[_UIDatePickerMode_Date _shouldEnableValueForRow:inComponent:calendarUnit:](&v10, sel__shouldEnableValueForRow_inComponent_calendarUnit_, a3, a4, a5);
}

- (id)dateComponentsByRestrictingSelectedComponents:(id)a3 withLastManipulatedColumn:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  objc_super v11;

  v6 = a3;
  v7 = (void *)objc_msgSend(v6, "copy");
  v11.receiver = self;
  v11.super_class = (Class)_UIDatePickerMode_DateWithOptionalYear;
  -[_UIDatePickerMode dateComponentsByRestrictingSelectedComponents:withLastManipulatedColumn:](&v11, sel_dateComponentsByRestrictingSelectedComponents_withLastManipulatedColumn_, v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "year");
  if (v9 == -[_UIDatePickerMode _yearlessYearForMonth:](self, "_yearlessYearForMonth:", objc_msgSend(v7, "month")))
    objc_msgSend(v8, "setYear:", -[_UIDatePickerMode _yearlessYearForMonth:](self, "_yearlessYearForMonth:", objc_msgSend(v8, "month")));

  return v8;
}

@end
