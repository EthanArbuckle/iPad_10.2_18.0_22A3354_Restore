@implementation BKLibraryDatePicker

+ (void)pickDate:(id)a3 title:(id)a4 presentingViewController:(id)a5 sourceRect:(CGRect)a6 completion:(id)a7
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  id v15;
  BKLibraryDatePickerView *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v13 = a7;
  v14 = a5;
  v15 = a4;
  v22 = objc_alloc_init((Class)UIViewController);
  v16 = -[BKLibraryDatePickerView initWithTitle:]([BKLibraryDatePickerView alloc], "initWithTitle:", v15);

  -[BKLibraryDatePickerView setPresentingViewController:](v16, "setPresentingViewController:", v14);
  -[BKLibraryDatePickerView setCompletionBlock:](v16, "setCompletionBlock:", v13);

  objc_msgSend(v22, "setView:", v16);
  -[BKLibraryDatePickerView bounds](v16, "bounds");
  objc_msgSend(v22, "setPreferredContentSize:", v17, v18);
  objc_msgSend(v22, "setModalPresentationStyle:", 7);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "view"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "popoverPresentationController"));
  objc_msgSend(v20, "setSourceView:", v19);

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "popoverPresentationController"));
  objc_msgSend(v21, "setSourceRect:", x, y, width, height);

  objc_msgSend(v14, "presentViewController:animated:completion:", v22, 1, 0);
}

@end
