@implementation _UISheetDetent

+ (_UISheetDetent)_mediumDetent
{
  if (qword_1ECD7D438 != -1)
    dispatch_once(&qword_1ECD7D438, &__block_literal_global_127);
  return (_UISheetDetent *)(id)_MergedGlobals_1000;
}

+ (_UISheetDetent)_largeDetent
{
  if (qword_1ECD7D448 != -1)
    dispatch_once(&qword_1ECD7D448, &__block_literal_global_1_10);
  return (_UISheetDetent *)(id)qword_1ECD7D440;
}

+ (id)_detentWithContainerViewBlock:(id)a3
{
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS____UISheetDetent;
  objc_msgSendSuper2(&v4, sel__detentWithContainerViewBlock_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
