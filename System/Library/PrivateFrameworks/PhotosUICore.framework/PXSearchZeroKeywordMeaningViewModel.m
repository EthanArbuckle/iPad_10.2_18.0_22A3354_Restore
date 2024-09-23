@implementation PXSearchZeroKeywordMeaningViewModel

- (PXSearchZeroKeywordMeaningViewModel)initWithTitle:(id)a3 representedObject:(id)a4 displayInfo:(id)a5
{
  id v8;
  id v9;
  void *v10;
  PXSearchZeroKeywordMeaningViewModel *v11;
  objc_super v13;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(a5, "copy");
  v13.receiver = self;
  v13.super_class = (Class)PXSearchZeroKeywordMeaningViewModel;
  v11 = -[PXSearchZeroKeywordBaseViewModel initWithType:title:representedObject:displayInfo:](&v13, sel_initWithType_title_representedObject_displayInfo_, 5, v9, v8, v10);

  return v11;
}

@end
