@implementation UICalendarWeekdayView

id __40___UICalendarWeekdayView__rebuildLabels__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 432);
  v3 = a2;
  objc_msgSend(v2, "effectiveLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uppercaseStringWithLocale:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
