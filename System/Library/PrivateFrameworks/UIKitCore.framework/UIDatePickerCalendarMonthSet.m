@implementation UIDatePickerCalendarMonthSet

void __50___UIDatePickerCalendarMonthSet__loadOffsetRange___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  void *v7;

  v5 = *(_QWORD *)(a1[7] + 8);
  if (*(_QWORD *)(v5 + 32) != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a1[8], a1[4], CFSTR("_UIDatePickerCalendarMonthSet.m"), 150, CFSTR("More than one range needed. This should never happen. Offsets needed: %@; offsets missing: %@"),
      a1[5],
      a1[6]);

    v5 = *(_QWORD *)(a1[7] + 8);
  }
  *(_QWORD *)(v5 + 32) = a2;
  *(_QWORD *)(v5 + 40) = a3;
}

@end
