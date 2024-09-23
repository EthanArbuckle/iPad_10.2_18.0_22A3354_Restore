@implementation PSDateTimePickerCell

+ (double)preferredHeight
{
  return *MEMORY[0x1E0CEBC10];
}

- (PSDateTimePickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8;
  PSDateTimePickerCell *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  UIDatePicker *v15;
  id v16;
  uint64_t v17;
  UIDatePicker *datePicker;
  UIDatePicker *v19;
  void *v20;
  UIDatePicker *v21;
  void *v22;
  UIDatePicker *v23;
  UIDatePicker *v24;
  void *v25;
  id *v26;
  id v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  NSString *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  id v90;
  _QWORD v91[4];
  id *v92;
  id v93;
  objc_super v94;

  v8 = a5;
  v94.receiver = self;
  v94.super_class = (Class)PSDateTimePickerCell;
  v9 = -[PSDateTimePickerCell initWithStyle:reuseIdentifier:](&v94, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (!v9)
    goto LABEL_16;
  objc_msgSend(v8, "target");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "conformsToProtocol:", &unk_1EE72CEB8) & 1) == 0)
  {

    goto LABEL_6;
  }
  objc_msgSend(v8, "target");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) == 0)
  {
LABEL_6:
    v16 = objc_alloc(MEMORY[0x1E0CEA4E8]);
    v17 = objc_msgSend(v16, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    datePicker = v9->_datePicker;
    v9->_datePicker = (UIDatePicker *)v17;

    v19 = v9->_datePicker;
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 2145988800.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDatePicker setMaximumDate:](v19, "setMaximumDate:", v20);

    v21 = v9->_datePicker;
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", 0.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDatePicker setMinimumDate:](v21, "setMinimumDate:", v22);

    -[UIDatePicker setDatePickerMode:](v9->_datePicker, "setDatePickerMode:", 2);
    -[UIDatePicker setPreferredDatePickerStyle:](v9->_datePicker, "setPreferredDatePickerStyle:", 3);
    v23 = v9->_datePicker;
    objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDatePicker setTimeZone:](v23, "setTimeZone:", v13);
    goto LABEL_7;
  }
  objc_msgSend(v8, "target");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "datePickerForSpecifier:", v8);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v9->_datePicker;
  v9->_datePicker = (UIDatePicker *)v14;

LABEL_7:
  v24 = v9->_datePicker;
  v25 = (void *)MEMORY[0x1E0CEA2A8];
  v91[0] = MEMORY[0x1E0C809B0];
  v91[1] = 3221225472;
  v91[2] = __64__PSDateTimePickerCell_initWithStyle_reuseIdentifier_specifier___block_invoke;
  v91[3] = &unk_1E4A67F58;
  v26 = v9;
  v92 = v26;
  v90 = v8;
  v27 = v8;
  v93 = v27;
  objc_msgSend(v25, "actionWithHandler:", v91);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDatePicker addAction:forControlEvents:](v24, "addAction:forControlEvents:", v28, 4096);

  v29 = objc_opt_new();
  v30 = v26[151];
  v26[151] = (id)v29;

  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26[151], "setFont:", v31);

  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26[151], "setTextColor:", v32);

  objc_msgSend(v26[151], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v26, "contentView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addSubview:", v26[151]);

  -[UIDatePicker setTranslatesAutoresizingMaskIntoConstraints:](v9->_datePicker, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIDatePicker setClipsToBounds:](v9->_datePicker, "setClipsToBounds:", 1);
  objc_msgSend(v26, "contentView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "addSubview:", v9->_datePicker);

  objc_msgSend(v27, "propertyForKey:", CFSTR("InlineDatePicker"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "BOOLValue");

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "preferredContentSizeCategory");
  v38 = (NSString *)objc_claimAutoreleasedReturnValue();
  v39 = 0;
  if (UIContentSizeCategoryIsAccessibilityCategory(v38))
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v40, "sf_isiPhone") & v36;

  }
  objc_msgSend(v26, "contentView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "layoutMarginsGuide");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "contentView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
  {
    objc_msgSend(v26[151], "setNumberOfLines:", 0);
    objc_msgSend(v26[151], "topAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "topAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v45, 1.0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setActive:", 1);

    objc_msgSend(v26[151], "leadingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "leadingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setActive:", 1);

    objc_msgSend(v26[151], "trailingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "trailingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setActive:", 1);

    -[UIDatePicker topAnchor](v9->_datePicker, "topAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26[151], "bottomAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v54, 1.0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setActive:", 1);

    -[UIDatePicker leadingAnchor](v9->_datePicker, "leadingAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "leadingAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToAnchor:", v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setActive:", 1);

    -[UIDatePicker trailingAnchor](v9->_datePicker, "trailingAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "trailingAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "constraintEqualToAnchor:", v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setActive:", 1);

    objc_msgSend(v43, "bottomAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDatePicker bottomAnchor](v9->_datePicker, "bottomAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v63, 1.0);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v36)
    {
      objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("allowMultilineTitleKey"));
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26[151], "setNumberOfLines:", objc_msgSend(v65, "BOOLValue") ^ 1);

      objc_msgSend(v26[151], "topAnchor");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "topAnchor");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "constraintEqualToAnchor:", v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "setActive:", 1);

      objc_msgSend(v26[151], "leadingAnchor");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "leadingAnchor");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "constraintEqualToAnchor:", v70);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "setActive:", 1);

      objc_msgSend(v26[151], "bottomAnchor");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "bottomAnchor");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "constraintEqualToAnchor:", v73);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "setActive:", 1);

      -[UIDatePicker topAnchor](v9->_datePicker, "topAnchor");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "topAnchor");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "constraintEqualToAnchor:", v76);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "setActive:", 1);

      -[UIDatePicker leadingAnchor](v9->_datePicker, "leadingAnchor");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26[151], "trailingAnchor");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v79, 1.0);
    }
    else
    {
      objc_msgSend(v26[151], "setHidden:", 1);
      -[UIDatePicker topAnchor](v9->_datePicker, "topAnchor");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "topAnchor");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "constraintEqualToAnchor:", v81);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "setActive:", 1);

      -[UIDatePicker leadingAnchor](v9->_datePicker, "leadingAnchor");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "leadingAnchor");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "constraintEqualToAnchor:", v79);
    }
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "setActive:", 1);

    -[UIDatePicker trailingAnchor](v9->_datePicker, "trailingAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "trailingAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "constraintEqualToAnchor:", v85);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "setActive:", 1);

    -[UIDatePicker bottomAnchor](v9->_datePicker, "bottomAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "bottomAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintEqualToAnchor:", v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v87 = v64;
  objc_msgSend(v64, "setActive:", 1);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "addObserver:selector:name:object:", v26, sel_timeZoneChanged_, *MEMORY[0x1E0C998A0], 0);

  v8 = v90;
LABEL_16:

  return v9;
}

void __64__PSDateTimePickerCell_initWithStyle_reuseIdentifier_specifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  objc_msgSend(*(id *)(a1 + 32), "cellTarget");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "cellTarget");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v15, "sender");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D8D658], "trackingControlValueChanged:sender:", v6, v10);
  objc_msgSend(*(id *)(a1 + 40), "target");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "conformsToProtocol:", &unk_1EE72CEB8);

  if (v12)
  {
    objc_msgSend(*(id *)(a1 + 40), "target");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sender");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "datePickerChanged:", v14);

  }
}

- (void)timeZoneChanged:(id)a3
{
  UIDatePicker *datePicker;
  id v4;

  datePicker = self->_datePicker;
  objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIDatePicker setTimeZone:](datePicker, "setTimeZone:", v4);

}

- (void)setTitle:(id)a3
{
  -[UILabel setText:](self->_titleLabel, "setText:", a3);
}

- (id)datePicker
{
  return self->_datePicker;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PSDateTimePickerCell;
  -[PSTableCell dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_datePicker, 0);
}

@end
