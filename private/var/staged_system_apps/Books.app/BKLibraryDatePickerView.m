@implementation BKLibraryDatePickerView

- (BKLibraryDatePickerView)initWithTitle:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double Height;
  BKLibraryDatePickerView *v30;
  void *v31;
  objc_super v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  v4 = a3;
  v5 = objc_alloc_init((Class)UIToolbar);
  objc_msgSend(v5, "setBarStyle:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  objc_msgSend(v5, "setTintColor:", v6);

  objc_msgSend(v5, "setAutoresizingMask:", 2);
  v7 = objc_alloc_init((Class)UILabel);
  objc_msgSend(v7, "setText:", v4);

  objc_msgSend(v7, "sizeToFit");
  v8 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 1, self, "cancelPressed");
  v9 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, self, "donePressed");
  v10 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  v11 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  v12 = objc_alloc_init((Class)UIBarButtonItem);
  objc_msgSend(v12, "setCustomView:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v8, v10, v12, v11, v9, 0));
  objc_msgSend(v5, "setItems:", v13);

  objc_msgSend(v5, "sizeToFit");
  v14 = objc_alloc_init((Class)UIDatePicker);
  objc_msgSend(v14, "setAutoresizingMask:", 58);
  objc_msgSend(v14, "setDatePickerMode:", 1);
  objc_msgSend(v14, "sizeToFit");
  objc_msgSend(v5, "frame");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  objc_msgSend(v14, "frame");
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v34.origin.x = v16;
  v34.origin.y = v18;
  v34.size.width = v20;
  v34.size.height = v22;
  Height = CGRectGetHeight(v34);
  objc_msgSend(v5, "setFrame:", v16, v18, v26, v22);
  objc_msgSend(v14, "setFrame:", v24, Height, v26, v28);
  v35.origin.x = v16;
  v35.origin.y = v18;
  v35.size.width = v26;
  v35.size.height = v22;
  v37.origin.x = v24;
  v37.origin.y = Height;
  v37.size.width = v26;
  v37.size.height = v28;
  v36 = CGRectUnion(v35, v37);
  v33.receiver = self;
  v33.super_class = (Class)BKLibraryDatePickerView;
  v30 = -[BKLibraryDatePickerView initWithFrame:](&v33, "initWithFrame:", v36.origin.x, v36.origin.y, v36.size.width, v36.size.height);
  if (v30)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[BKLibraryDatePickerView setBackgroundColor:](v30, "setBackgroundColor:", v31);

    objc_storeStrong((id *)&v30->_picker, v14);
    -[BKLibraryDatePickerView addSubview:](v30, "addSubview:", v30->_picker);
    -[BKLibraryDatePickerView addSubview:](v30, "addSubview:", v5);
    -[BKLibraryDatePickerView setAutoresizesSubviews:](v30, "setAutoresizesSubviews:", 1);
    -[BKLibraryDatePickerView setAutoresizingMask:](v30, "setAutoresizingMask:", 58);
  }

  return v30;
}

- (void)donePressed
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDatePickerView completionBlock](self, "completionBlock"));

  if (v3)
  {
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[BKLibraryDatePickerView completionBlock](self, "completionBlock"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDatePickerView picker](self, "picker"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "date"));
    ((void (**)(_QWORD, void *))v4)[2](v4, v6);

  }
  v7 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryDatePickerView presentingViewController](self, "presentingViewController"));
  objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)cancelPressed
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryDatePickerView presentingViewController](self, "presentingViewController"));
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (UIDatePicker)picker
{
  return self->_picker;
}

- (void)setPicker:(id)a3
{
  objc_storeStrong((id *)&self->_picker, a3);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (SEL)action
{
  return self->_action;
}

- (void)setAction:(SEL)a3
{
  self->_action = a3;
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
  self->_presentingViewController = (UIViewController *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_picker, 0);
}

@end
