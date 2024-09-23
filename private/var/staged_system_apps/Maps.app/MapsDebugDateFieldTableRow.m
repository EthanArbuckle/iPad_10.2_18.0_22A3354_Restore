@implementation MapsDebugDateFieldTableRow

- (MapsDebugDateFieldTableRow)init
{
  MapsDebugDateFieldTableRow *v2;
  _QWORD v4[4];
  id v5;
  id location;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MapsDebugDateFieldTableRow;
  v2 = -[MapsDebugTableRow init](&v7, "init");
  if (v2)
  {
    objc_initWeak(&location, v2);
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100711CF0;
    v4[3] = &unk_1011AD260;
    objc_copyWeak(&v5, &location);
    -[MapsDebugTableRow setSelectionAction:](v2, "setSelectionAction:", v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[MapsDebugDateFieldTableRow invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MapsDebugDateFieldTableRow;
  -[MapsDebugTableRow dealloc](&v3, "dealloc");
}

- (void)invalidate
{
  objc_super v3;

  -[MapsDebugDateFieldTableRow setGet:](self, "setGet:", 0);
  -[MapsDebugDateFieldTableRow setSet:](self, "setSet:", 0);
  v3.receiver = self;
  v3.super_class = (Class)MapsDebugDateFieldTableRow;
  -[MapsDebugTableRow invalidate](&v3, "invalidate");
}

- (void)configureCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  UILabel *v13;
  UILabel *dateLabel;
  void *v15;
  void *v16;
  uint64_t (**v17)(void);
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  UILabel *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSArray *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSArray *lastConstraints;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  objc_super v51;
  _QWORD v52[4];
  _QWORD v53[3];
  _BYTE v54[128];

  v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)MapsDebugDateFieldTableRow;
  -[MapsDebugTableRow configureCell:](&v51, "configureCell:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentView"));
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subviews"));

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v48 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v12, "tag") == (id)999)
          objc_msgSend(v12, "removeFromSuperview");
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
    }
    while (v9);
  }

  objc_msgSend(v4, "setSelectionStyle:", 0);
  objc_storeWeak((id *)&self->_cell, v4);
  if (!self->_dateLabel)
  {
    v13 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    dateLabel = self->_dateLabel;
    self->_dateLabel = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](self->_dateLabel, "setBackgroundColor:", v15);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_dateLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setTag:](self->_dateLabel, "setTag:", 999);
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugDateFieldTableRow get](self, "get"));

  if (v16)
  {
    v17 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(-[MapsDebugDateFieldTableRow get](self, "get"));
    v18 = v17[2]();
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    -[MapsDebugDateFieldTableRow setDate:](self, "setDate:", v19);

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugDateFieldTableRow date](self, "date"));

  if (!v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[MapsDebugDateFieldTableRow setDate:](self, "setDate:", v21);

  }
  -[UILabel removeFromSuperview](self->_dateLabel, "removeFromSuperview");
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentView"));
  objc_msgSend(v22, "addSubview:", self->_dateLabel);

  objc_msgSend(v4, "setPreservesSuperviewLayoutMargins:", 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentView"));
  objc_msgSend(v23, "setPreservesSuperviewLayoutMargins:", 1);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow title](self, "title"));
  v25 = objc_msgSend(v24, "length");

  v26 = self->_dateLabel;
  if (v25)
  {
    -[UILabel setTextAlignment:](v26, "setTextAlignment:", 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_dateLabel, "leadingAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "textLayoutGuide"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "trailingAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:constant:", 5.0));
    v53[0] = v44;
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_dateLabel, "trailingAnchor"));
    v43 = v28;
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v42));
    v53[1] = v29;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](self->_dateLabel, "centerYAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "textLayoutGuide"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "centerYAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v32));
    v53[2] = v33;
    v34 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v53, 3));
  }
  else
  {
    -[UILabel setTextAlignment:](v26, "setTextAlignment:", 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_dateLabel, "leadingAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:"));
    v52[0] = v45;
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_dateLabel, "trailingAnchor"));
    v44 = v35;
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v43));
    v52[1] = v42;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_dateLabel, "topAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v30));
    v52[2] = v31;
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_dateLabel, "bottomAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bottomAnchor"));
    v36 = v5;
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v33));
    v52[3] = v37;
    v34 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v52, 4));

    v5 = v36;
    v27 = v41;
  }

  if (self->_lastConstraints)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentView"));
    objc_msgSend(v38, "removeConstraints:", self->_lastConstraints);

  }
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentView"));
  objc_msgSend(v39, "addConstraints:", v34);

  lastConstraints = self->_lastConstraints;
  self->_lastConstraints = v34;

}

- (void)setDate:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  objc_storeStrong((id *)&self->_date, a3);
  v5 = a3;
  v8 = objc_alloc_init((Class)NSDateFormatter);
  objc_msgSend(v8, "setTimeStyle:", 0);
  objc_msgSend(v8, "setDateStyle:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugDateFieldTableRow date](self, "date"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringFromDate:", v6));
  -[UILabel setText:](self->_dateLabel, "setText:", v7);

}

- (void)_fieldDidChangeValue:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "date"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugDateFieldTableRow date](self, "date"));
  v5 = objc_msgSend(v8, "isEqual:", v4);

  if ((v5 & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugDateFieldTableRow set](self, "set"));

    if (v6)
    {
      v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[MapsDebugDateFieldTableRow set](self, "set"));
      ((void (**)(_QWORD, id))v7)[2](v7, v8);

    }
    -[MapsDebugDateFieldTableRow setDate:](self, "setDate:", v8);
  }

}

- (void)_showDatePicker
{
  MapsDebugDateFieldTableRow *v2;
  void *v3;
  void *v4;
  MapsDebugDataPickerViewController *v5;
  void *v6;
  void *v7;
  MapsDebugDataPickerViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  id WeakRetained;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  void **v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  MapsDebugDateFieldTableRow *v25;
  MapsDebugDataPickerViewController *v26;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableRow title](self, "title"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v3, 0, 0));

  v5 = objc_alloc_init(MapsDebugDataPickerViewController);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugDateFieldTableRow date](v2, "date"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugDataPickerViewController datePicker](v5, "datePicker"));
  objc_msgSend(v7, "setDate:", v6);

  objc_msgSend(v4, "setContentViewController:", v5);
  v21 = _NSConcreteStackBlock;
  v22 = 3221225472;
  v23 = sub_10071270C;
  v24 = &unk_1011B0210;
  v25 = v2;
  v8 = v5;
  v26 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Ok"), 0, &v21));
  objc_msgSend(v4, "addAction:", v9, v21, v22, v23, v24, v25);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, 0));
  objc_msgSend(v4, "addAction:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "popoverPresentationController"));
  v2 = (MapsDebugDateFieldTableRow *)((char *)v2 + 112);
  WeakRetained = objc_loadWeakRetained((id *)&v2->super.super.isa);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "contentView"));
  objc_msgSend(v13, "bounds");
  objc_msgSend(v11, "setSourceRect:");

  v14 = objc_loadWeakRetained((id *)&v2->super.super.isa);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "contentView"));
  objc_msgSend(v11, "setSourceView:", v15);

  v16 = objc_loadWeakRetained((id *)&v2->super.super.isa);
  if (v16)
  {
    v17 = v16;
    do
    {
      v18 = v17;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIViewController viewControllerForView:](UIViewController, "viewControllerForView:", v17));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "superview"));

      if (v19)
        v20 = 1;
      else
        v20 = v17 == 0;
    }
    while (!v20);

  }
  else
  {
    v19 = 0;
  }
  objc_msgSend(v19, "presentViewController:animated:completion:", v4, 1, 0);

}

- (NSDate)date
{
  return self->_date;
}

- (id)set
{
  return self->_set;
}

- (void)setSet:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (id)get
{
  return self->_get;
}

- (void)setGet:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_get, 0);
  objc_storeStrong(&self->_set, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_destroyWeak((id *)&self->_cell);
  objc_storeStrong((id *)&self->_lastConstraints, 0);
  objc_storeStrong((id *)&self->_dateLabel, 0);
}

@end
