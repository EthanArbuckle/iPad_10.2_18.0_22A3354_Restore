@implementation MFPrintMessageHeaderViewBlock

- (MFPrintMessageHeaderViewBlock)initWithFrame:(CGRect)a3
{
  MFPrintMessageHeaderViewBlock *v3;
  NSDateFormatter *v4;
  NSDateFormatter *dateFormatter;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MFPrintMessageHeaderViewBlock;
  v3 = -[MFPrintMessageHeaderViewBlock initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (NSDateFormatter *)objc_alloc_init((Class)NSDateFormatter);
    dateFormatter = v3->_dateFormatter;
    v3->_dateFormatter = v4;

    -[NSDateFormatter setDateStyle:](v3->_dateFormatter, "setDateStyle:", 2);
    -[NSDateFormatter setTimeStyle:](v3->_dateFormatter, "setTimeStyle:", 2);
  }
  return v3;
}

- (void)updateConstraints
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MFPrintMessageHeaderViewBlock;
  -[MFPrintMessageHeaderViewBlock updateConstraints](&v4, "updateConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  -[MFPrintMessageHeaderViewBlock setBackgroundColor:](self, "setBackgroundColor:", v3);

}

- (void)createPrimaryViews
{
  UILayoutGuide *v3;
  UILayoutGuide *firstColumn;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  UIStackView *v29;
  UIStackView *secondColumn;
  UIStackView *v31;
  void *v32;
  UIStackView *v33;
  void *v34;
  UIStackView *v35;
  void *v36;
  UIStackView *v37;
  void *v38;
  UIStackView *v39;
  void *v40;
  UIStackView *v41;
  void *v42;
  objc_super v43;

  v43.receiver = self;
  v43.super_class = (Class)MFPrintMessageHeaderViewBlock;
  -[MFPrintMessageHeaderViewBlock createPrimaryViews](&v43, "createPrimaryViews");
  -[MFPrintMessageHeaderViewBlock _createFormEntries](self, "_createFormEntries");
  v3 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
  firstColumn = self->_firstColumn;
  self->_firstColumn = v3;

  -[MFPrintMessageHeaderViewBlock addLayoutGuide:](self, "addLayoutGuide:", self->_firstColumn);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("FROM"), &stru_100531B00, CFSTR("Main")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_MFFormEntry titleLabel](self->_from, "titleLabel"));
  objc_msgSend(v7, "setText:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_MFFormEntry titleLabel](self->_from, "titleLabel"));
  -[MFPrintMessageHeaderViewBlock addSubview:](self, "addSubview:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SUBJECT"), &stru_100531B00, CFSTR("Main")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[_MFFormEntry titleLabel](self->_subject, "titleLabel"));
  objc_msgSend(v11, "setText:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[_MFFormEntry titleLabel](self->_subject, "titleLabel"));
  -[MFPrintMessageHeaderViewBlock addSubview:](self, "addSubview:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("DATE"), &stru_100531B00, CFSTR("Main")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[_MFFormEntry titleLabel](self->_date, "titleLabel"));
  objc_msgSend(v15, "setText:", v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[_MFFormEntry titleLabel](self->_date, "titleLabel"));
  -[MFPrintMessageHeaderViewBlock addSubview:](self, "addSubview:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("TO"), &stru_100531B00, CFSTR("Main")));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[_MFFormEntry titleLabel](self->_to, "titleLabel"));
  objc_msgSend(v19, "setText:", v18);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[_MFFormEntry titleLabel](self->_to, "titleLabel"));
  -[MFPrintMessageHeaderViewBlock addSubview:](self, "addSubview:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("CC"), &stru_100531B00, CFSTR("Main")));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[_MFFormEntry titleLabel](self->_cc, "titleLabel"));
  objc_msgSend(v23, "setText:", v22);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[_MFFormEntry titleLabel](self->_cc, "titleLabel"));
  -[MFPrintMessageHeaderViewBlock addSubview:](self, "addSubview:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("BCC"), &stru_100531B00, CFSTR("Main")));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[_MFFormEntry titleLabel](self->_bcc, "titleLabel"));
  objc_msgSend(v27, "setText:", v26);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[_MFFormEntry titleLabel](self->_bcc, "titleLabel"));
  -[MFPrintMessageHeaderViewBlock addSubview:](self, "addSubview:", v28);

  v29 = (UIStackView *)objc_alloc_init((Class)UIStackView);
  secondColumn = self->_secondColumn;
  self->_secondColumn = v29;

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_secondColumn, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setAxis:](self->_secondColumn, "setAxis:", 1);
  -[UIStackView setAlignment:](self->_secondColumn, "setAlignment:", 1);
  -[UIStackView setDistribution:](self->_secondColumn, "setDistribution:", 0);
  -[MFPrintMessageHeaderViewBlock addSubview:](self, "addSubview:", self->_secondColumn);
  v31 = self->_secondColumn;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[_MFFormEntry valueLabel](self->_from, "valueLabel"));
  -[UIStackView addArrangedSubview:](v31, "addArrangedSubview:", v32);

  v33 = self->_secondColumn;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[_MFFormEntry valueLabel](self->_subject, "valueLabel"));
  -[UIStackView addArrangedSubview:](v33, "addArrangedSubview:", v34);

  v35 = self->_secondColumn;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[_MFFormEntry valueLabel](self->_date, "valueLabel"));
  -[UIStackView addArrangedSubview:](v35, "addArrangedSubview:", v36);

  v37 = self->_secondColumn;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[_MFFormEntry valueLabel](self->_to, "valueLabel"));
  -[UIStackView addArrangedSubview:](v37, "addArrangedSubview:", v38);

  v39 = self->_secondColumn;
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[_MFFormEntry valueLabel](self->_cc, "valueLabel"));
  -[UIStackView addArrangedSubview:](v39, "addArrangedSubview:", v40);

  v41 = self->_secondColumn;
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[_MFFormEntry valueLabel](self->_bcc, "valueLabel"));
  -[UIStackView addArrangedSubview:](v41, "addArrangedSubview:", v42);

}

- (void)_createFormEntries
{
  NSMutableArray *v3;
  NSMutableArray *entries;
  int64_t v5;
  _MFFormEntry *v6;
  _MFFormEntry *from;
  _MFFormEntry *v8;
  _MFFormEntry *subject;
  _MFFormEntry *v10;
  _MFFormEntry *date;
  _MFFormEntry *v12;
  _MFFormEntry *to;
  _MFFormEntry *v14;
  _MFFormEntry *cc;
  _MFFormEntry *v16;
  _MFFormEntry *bcc;

  v3 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 6);
  entries = self->_entries;
  self->_entries = v3;

  v5 = -[MFPrintMessageHeaderViewBlock _textAlignmentForLayoutDirection](self, "_textAlignmentForLayoutDirection");
  v6 = -[_MFFormEntry initWithTextAlignment:]([_MFFormEntry alloc], "initWithTextAlignment:", v5);
  from = self->_from;
  self->_from = v6;

  -[NSMutableArray addObject:](self->_entries, "addObject:", self->_from);
  v8 = -[_MFFormEntry initWithTextAlignment:]([_MFFormEntry alloc], "initWithTextAlignment:", v5);
  subject = self->_subject;
  self->_subject = v8;

  -[NSMutableArray addObject:](self->_entries, "addObject:", self->_subject);
  v10 = -[_MFFormEntry initWithTextAlignment:]([_MFFormEntry alloc], "initWithTextAlignment:", v5);
  date = self->_date;
  self->_date = v10;

  -[NSMutableArray addObject:](self->_entries, "addObject:", self->_date);
  v12 = -[_MFFormEntry initWithTextAlignment:]([_MFFormEntry alloc], "initWithTextAlignment:", v5);
  to = self->_to;
  self->_to = v12;

  -[NSMutableArray addObject:](self->_entries, "addObject:", self->_to);
  v14 = -[_MFFormEntry initWithTextAlignment:]([_MFFormEntry alloc], "initWithTextAlignment:", v5);
  cc = self->_cc;
  self->_cc = v14;

  -[NSMutableArray addObject:](self->_entries, "addObject:", self->_cc);
  v16 = -[_MFFormEntry initWithTextAlignment:]([_MFFormEntry alloc], "initWithTextAlignment:", v5);
  bcc = self->_bcc;
  self->_bcc = v16;

  -[NSMutableArray addObject:](self->_entries, "addObject:", self->_bcc);
}

- (void)initializePrimaryLayoutConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
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
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  objc_super v105;
  _QWORD v106[24];

  v105.receiver = self;
  v105.super_class = (Class)MFPrintMessageHeaderViewBlock;
  -[MFPrintMessageHeaderViewBlock initializePrimaryLayoutConstraints](&v105, "initializePrimaryLayoutConstraints");
  v104 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_firstColumn, "topAnchor"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(-[MFPrintMessageHeaderViewBlock layoutMarginsGuide](self, "layoutMarginsGuide"));
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "topAnchor"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "constraintEqualToAnchor:"));
  v106[0] = v80;
  v103 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](self->_firstColumn, "leadingAnchor"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(-[MFPrintMessageHeaderViewBlock layoutMarginsGuide](self, "layoutMarginsGuide"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "leadingAnchor"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "constraintEqualToAnchor:"));
  v106[1] = v77;
  v102 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide widthAnchor](self->_firstColumn, "widthAnchor"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[_MFFormEntry titleLabel](self->_from, "titleLabel"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "widthAnchor"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "constraintEqualToAnchor:"));
  v106[2] = v74;
  v101 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide widthAnchor](self->_firstColumn, "widthAnchor"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[_MFFormEntry titleLabel](self->_subject, "titleLabel"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "widthAnchor"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "constraintEqualToAnchor:"));
  v106[3] = v71;
  v100 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide widthAnchor](self->_firstColumn, "widthAnchor"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[_MFFormEntry titleLabel](self->_date, "titleLabel"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "widthAnchor"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "constraintEqualToAnchor:"));
  v106[4] = v68;
  v99 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide widthAnchor](self->_firstColumn, "widthAnchor"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[_MFFormEntry titleLabel](self->_to, "titleLabel"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "widthAnchor"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "constraintEqualToAnchor:"));
  v106[5] = v65;
  v98 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide widthAnchor](self->_firstColumn, "widthAnchor"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[_MFFormEntry titleLabel](self->_cc, "titleLabel"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "widthAnchor"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "constraintEqualToAnchor:"));
  v106[6] = v62;
  v97 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide widthAnchor](self->_firstColumn, "widthAnchor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[_MFFormEntry titleLabel](self->_bcc, "titleLabel"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "widthAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "constraintEqualToAnchor:"));
  v106[7] = v59;
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[_MFFormEntry titleLabel](self->_from, "titleLabel"));
  v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "firstBaselineAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[_MFFormEntry valueLabel](self->_from, "valueLabel"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "firstBaselineAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "constraintEqualToAnchor:"));
  v106[8] = v55;
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[_MFFormEntry titleLabel](self->_from, "titleLabel"));
  v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "trailingAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self->_firstColumn, "trailingAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "constraintEqualToAnchor:"));
  v106[9] = v52;
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[_MFFormEntry titleLabel](self->_subject, "titleLabel"));
  v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "firstBaselineAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[_MFFormEntry valueLabel](self->_subject, "valueLabel"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "firstBaselineAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "constraintEqualToAnchor:"));
  v106[10] = v48;
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[_MFFormEntry titleLabel](self->_subject, "titleLabel"));
  v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "trailingAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self->_firstColumn, "trailingAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "constraintEqualToAnchor:"));
  v106[11] = v45;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[_MFFormEntry titleLabel](self->_date, "titleLabel"));
  v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "firstBaselineAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[_MFFormEntry valueLabel](self->_date, "valueLabel"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "firstBaselineAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "constraintEqualToAnchor:"));
  v106[12] = v41;
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[_MFFormEntry titleLabel](self->_date, "titleLabel"));
  v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "trailingAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self->_firstColumn, "trailingAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "constraintEqualToAnchor:"));
  v106[13] = v38;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[_MFFormEntry titleLabel](self->_to, "titleLabel"));
  v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "firstBaselineAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[_MFFormEntry valueLabel](self->_to, "valueLabel"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "firstBaselineAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "constraintEqualToAnchor:"));
  v106[14] = v34;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[_MFFormEntry titleLabel](self->_to, "titleLabel"));
  v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "trailingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self->_firstColumn, "trailingAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "constraintEqualToAnchor:"));
  v106[15] = v31;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[_MFFormEntry titleLabel](self->_cc, "titleLabel"));
  v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "firstBaselineAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[_MFFormEntry valueLabel](self->_cc, "valueLabel"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "firstBaselineAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "constraintEqualToAnchor:"));
  v106[16] = v27;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[_MFFormEntry titleLabel](self->_cc, "titleLabel"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "trailingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self->_firstColumn, "trailingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "constraintEqualToAnchor:"));
  v106[17] = v24;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[_MFFormEntry titleLabel](self->_bcc, "titleLabel"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "firstBaselineAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[_MFFormEntry valueLabel](self->_bcc, "valueLabel"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "firstBaselineAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "constraintEqualToAnchor:"));
  v106[18] = v20;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[_MFFormEntry titleLabel](self->_bcc, "titleLabel"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "trailingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self->_firstColumn, "trailingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "constraintEqualToAnchor:"));
  v106[19] = v17;
  v84 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](self->_secondColumn, "topAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MFPrintMessageHeaderViewBlock layoutMarginsGuide](self, "layoutMarginsGuide"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "topAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "constraintEqualToAnchor:"));
  v106[20] = v14;
  v83 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](self->_secondColumn, "leadingAnchor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self->_firstColumn, "trailingAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "constraintEqualToAnchor:constant:", v3, 5.0));
  v106[21] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](self->_secondColumn, "bottomAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFPrintMessageHeaderViewBlock layoutMarginsGuide](self, "layoutMarginsGuide"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bottomAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v7));
  v106[22] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](self->_secondColumn, "trailingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFPrintMessageHeaderViewBlock layoutMarginsGuide](self, "layoutMarginsGuide"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "trailingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v11));
  v106[23] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v106, 24));

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v13);
}

- (void)displayMessageUsingViewModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSDateFormatter *dateFormatter;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)MFPrintMessageHeaderViewBlock;
  -[MFPrintMessageHeaderViewBlock displayMessageUsingViewModel:](&v24, "displayMessageUsingViewModel:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "senderList"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFPrintMessageHeaderViewBlock _attributedStringForAddressList:](self, "_attributedStringForAddressList:", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_MFFormEntry valueLabel](self->_from, "valueLabel"));
  objc_msgSend(v7, "setAttributedText:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "toList"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFPrintMessageHeaderViewBlock _attributedStringForAddressList:](self, "_attributedStringForAddressList:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[_MFFormEntry valueLabel](self->_to, "valueLabel"));
  objc_msgSend(v10, "setAttributedText:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ccList"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MFPrintMessageHeaderViewBlock _attributedStringForAddressList:](self, "_attributedStringForAddressList:", v11));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[_MFFormEntry valueLabel](self->_cc, "valueLabel"));
  objc_msgSend(v13, "setAttributedText:", v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bccList"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MFPrintMessageHeaderViewBlock _attributedStringForAddressList:](self, "_attributedStringForAddressList:", v14));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[_MFFormEntry valueLabel](self->_bcc, "valueLabel"));
  objc_msgSend(v16, "setAttributedText:", v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subject"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[ECSubjectFormatter subjectStringForDisplayForSubject:](ECSubjectFormatter, "subjectStringForDisplayForSubject:", v17));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[_MFFormEntry valueLabel](self->_subject, "valueLabel"));
  objc_msgSend(v19, "setText:", v18);

  dateFormatter = self->_dateFormatter;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "date"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](dateFormatter, "stringFromDate:", v21));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[_MFFormEntry valueLabel](self->_date, "valueLabel"));
  objc_msgSend(v23, "setText:", v22);

  -[MFPrintMessageHeaderViewBlock _updateVisibility](self, "_updateVisibility");
}

- (void)_updateVisibility
{
  NSMutableArray *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v2 = self->_entries;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueLabel", (_QWORD)v14));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "text"));
        v9 = objc_msgSend(v8, "length");
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueLabel"));
        objc_msgSend(v10, "setHidden:", v9 == 0);

        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueLabel"));
        v12 = objc_msgSend(v11, "isHidden");
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "titleLabel"));
        objc_msgSend(v13, "setHidden:", v12);

      }
      v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v3);
  }

}

- (id)_attributedStringForAddressList:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  MFPrintMessageHeaderViewBlock *v12;
  id v13;

  v4 = a3;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10019A4E0;
  v10[3] = &unk_100522438;
  v5 = objc_alloc_init((Class)NSMutableAttributedString);
  v11 = v5;
  v12 = self;
  v6 = v4;
  v13 = v6;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);
  v7 = v13;
  v8 = v5;

  return v8;
}

- (id)_attributedStringForAddress:(id)a3 appendComma:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  NSAttributedStringKey v25;
  void *v26;

  v4 = a4;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "emailAddressValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "displayName"));

  v8 = v5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "emailAddressValue"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "simpleAddress"));
  v11 = v10;
  if (v10)
    v12 = v10;
  else
    v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringValue"));
  v13 = v12;

  if (v7 && (objc_msgSend(v7, "isEqualToString:", v13) & 1) == 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("NAME_AND_EMAIL_ADDRESS_FORMAT %@ %@"), CFSTR("%@ %@"), CFSTR("Main")));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", v17, v7, v13));

    v14 = 1;
    if (!v4)
      goto LABEL_10;
    goto LABEL_9;
  }
  v14 = 0;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", v13));
  if (v4)
  {
LABEL_9:
    v18 = MFLocalizedAddressSeparator();
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    objc_msgSend(v15, "appendString:", v19);

  }
LABEL_10:
  v20 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithString:", v15);
  if (v14)
  {
    v25 = NSForegroundColorAttributeName;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mailSubtitleGrayColor](UIColor, "mailSubtitleGrayColor"));
    v26 = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
    objc_msgSend(v20, "setAttributes:range:", v22, (char *)objc_msgSend(v7, "length") + 1, (char *)objc_msgSend(v15, "length") + ~(unint64_t)objc_msgSend(v7, "length"));

  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[_MFFormEntry labelFont](_MFFormEntry, "labelFont"));
  objc_msgSend(v20, "addAttribute:value:range:", NSFontAttributeName, v23, 0, objc_msgSend(v20, "length"));

  return v20;
}

- (int64_t)_textAlignmentForLayoutDirection
{
  if (-[MFPrintMessageHeaderViewBlock mf_prefersRightToLeftInterfaceLayout](self, "mf_prefersRightToLeftInterfaceLayout"))return 0;
  else
    return 2;
}

- (UILayoutGuide)firstColumn
{
  return self->_firstColumn;
}

- (void)setFirstColumn:(id)a3
{
  objc_storeStrong((id *)&self->_firstColumn, a3);
}

- (UIStackView)secondColumn
{
  return self->_secondColumn;
}

- (void)setSecondColumn:(id)a3
{
  objc_storeStrong((id *)&self->_secondColumn, a3);
}

- (_MFFormEntry)from
{
  return self->_from;
}

- (void)setFrom:(id)a3
{
  objc_storeStrong((id *)&self->_from, a3);
}

- (_MFFormEntry)subject
{
  return self->_subject;
}

- (void)setSubject:(id)a3
{
  objc_storeStrong((id *)&self->_subject, a3);
}

- (_MFFormEntry)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (_MFFormEntry)to
{
  return self->_to;
}

- (void)setTo:(id)a3
{
  objc_storeStrong((id *)&self->_to, a3);
}

- (_MFFormEntry)cc
{
  return self->_cc;
}

- (void)setCc:(id)a3
{
  objc_storeStrong((id *)&self->_cc, a3);
}

- (_MFFormEntry)bcc
{
  return self->_bcc;
}

- (void)setBcc:(id)a3
{
  objc_storeStrong((id *)&self->_bcc, a3);
}

- (NSMutableArray)entries
{
  return self->_entries;
}

- (void)setEntries:(id)a3
{
  objc_storeStrong((id *)&self->_entries, a3);
}

- (NSDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (void)setDateFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_dateFormatter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong((id *)&self->_bcc, 0);
  objc_storeStrong((id *)&self->_cc, 0);
  objc_storeStrong((id *)&self->_to, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_from, 0);
  objc_storeStrong((id *)&self->_secondColumn, 0);
  objc_storeStrong((id *)&self->_firstColumn, 0);
}

@end
