@implementation _PKContinuousPickerView

- (void)pickerTableView:(id)a3 didChangeSelectionBarRowFrom:(int64_t)a4 to:(int64_t)a5
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if (-[_PKContinuousPickerView numberOfComponents](self, "numberOfComponents", a3, a4, a5) >= 1)
  {
    v6 = 0;
    do
    {
      v7 = -[_PKContinuousPickerView selectedRowInComponent:](self, "selectedRowInComponent:", v6);
      -[_PKContinuousPickerView delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "pickerView:didSelectRow:inComponent:", self, v7, v6);

      ++v6;
    }
    while (v6 < -[_PKContinuousPickerView numberOfComponents](self, "numberOfComponents"));
  }
}

@end
