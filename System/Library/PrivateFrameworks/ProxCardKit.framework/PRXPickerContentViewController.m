@implementation PRXPickerContentViewController

+ (Class)contentViewClass
{
  return (Class)objc_opt_class();
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PRXPickerContentViewController;
  -[PRXCardContentViewController viewDidLoad](&v7, sel_viewDidLoad);
  -[PRXCardContentViewController contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pickerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDataSource:", self);

  -[PRXCardContentViewController contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pickerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", self);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PRXPickerContentViewController;
  -[PRXPickerContentViewController viewWillAppear:](&v14, sel_viewWillAppear_, a3);
  -[PRXCardContentViewController contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pickerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "numberOfRowsInComponent:", 0);
  if (v6)
  {
    v7 = v6;
    if (objc_msgSend(v5, "selectedRowInComponent:", 0) == -1)
    {
      -[PRXCardContentViewController contentView](self, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "pickerView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v7 >= 0)
        v11 = v7;
      else
        v11 = v7 + 1;
      v12 = v11 >> 1;
      if (v12 >= 3)
        v13 = 3;
      else
        v13 = v12;
      objc_msgSend(v9, "selectRow:inComponent:animated:", v13, 0, 0);

    }
  }

}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCA98], CFSTR("PRXPickerContentViewController subclasses must override pickerView:numberOfRowsInComponent:"), 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v5);
}

@end
