@implementation WFInputDateDialogViewController

- (void)loadView
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  id location;
  objc_super v44;
  _QWORD v45[2];
  _QWORD v46[6];

  v46[4] = *MEMORY[0x24BDAC8D0];
  v44.receiver = self;
  v44.super_class = (Class)WFInputDateDialogViewController;
  -[WFCompactDialogViewController loadView](&v44, sel_loadView);
  -[WFCompactPlatterViewController platterView](self, "platterView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCompactDialogViewController request](self, "request");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "message");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setSecondaryText:", v2);

  objc_msgSend(v35, "configuration");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "datePickerMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = WFDatePickerModeFromString();

  v34 = (void *)objc_opt_new();
  objc_msgSend(v34, "view");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCompactPlatterViewController setContentViewController:](self, "setContentViewController:", v34);
  v5 = objc_alloc_init(MEMORY[0x24BEBD520]);
  v6 = v5;
  if (v4)
    v7 = 3;
  else
    v7 = 1;
  objc_msgSend(v5, "setPreferredDatePickerStyle:", v7);
  objc_msgSend(v6, "setDatePickerMode:", v4);
  objc_msgSend(v36, "defaultDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "setDate:", v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDate:", v9);

  }
  objc_msgSend(v36, "minimumDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMinimumDate:", v10);

  objc_msgSend(v36, "maximumDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMaximumDate:", v11);

  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v37, "addSubview:", v6);
  -[WFInputDateDialogViewController setDatePicker:](self, "setDatePicker:", v6);
  if (objc_msgSend(v6, "preferredDatePickerStyle") == 1)
    v12 = 108.0;
  else
    v12 = 28.0;
  objc_msgSend(v6, "centerXAnchor", MEMORY[0x24BDD1628]);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "centerXAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v31);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v30;
  objc_msgSend(v6, "widthAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "widthAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:constant:", v13, -v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v46[1] = v14;
  objc_msgSend(v6, "topAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "topAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v46[2] = v17;
  objc_msgSend(v6, "bottomAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v46[3] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v46, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "activateConstraints:", v21);

  objc_initWeak(&location, self);
  objc_msgSend(v35, "cancelButton");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = MEMORY[0x24BDAC760];
  v41[0] = MEMORY[0x24BDAC760];
  v41[1] = 3221225472;
  v41[2] = __43__WFInputDateDialogViewController_loadView__block_invoke;
  v41[3] = &unk_24E604D60;
  objc_copyWeak(&v42, &location);
  +[WFCompactDialogAction actionForButton:handler:](WFCompactDialogAction, "actionForButton:handler:", v22, v41);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v35, "doneButton");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v23;
  v39[1] = 3221225472;
  v39[2] = __43__WFInputDateDialogViewController_loadView__block_invoke_2;
  v39[3] = &unk_24E604D60;
  objc_copyWeak(&v40, &location);
  +[WFCompactDialogAction actionForButton:handler:](WFCompactDialogAction, "actionForButton:handler:", v25, v39);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v45[0] = v24;
  v45[1] = v26;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v45, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCompactDialogViewController configureActionGroupWithActions:](self, "configureActionGroupWithActions:", v27);

  objc_destroyWeak(&v40);
  objc_destroyWeak(&v42);
  objc_destroyWeak(&location);

}

- (UIDatePicker)datePicker
{
  return (UIDatePicker *)objc_loadWeakRetained((id *)&self->_datePicker);
}

- (void)setDatePicker:(id)a3
{
  objc_storeWeak((id *)&self->_datePicker, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_datePicker);
}

void __43__WFInputDateDialogViewController_loadView__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC1500]), "initWithInputtedDate:cancelled:", 0, 1);
  objc_msgSend(WeakRetained, "finishWithResponse:", v1);

}

void __43__WFInputDateDialogViewController_loadView__block_invoke_2(uint64_t a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = objc_alloc(MEMORY[0x24BEC1500]);
  objc_msgSend(WeakRetained, "datePicker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v1, "initWithInputtedDate:cancelled:", v3, 0);
  objc_msgSend(WeakRetained, "finishWithResponse:", v4);

}

@end
