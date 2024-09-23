@implementation PXSharedLibraryAssistantSummaryContentView

- (PXSharedLibraryAssistantSummaryContentView)initWithViewModel:(id)a3
{
  id v6;
  PXSharedLibraryAssistantSummaryContentView *v7;
  PXSharedLibraryAssistantSummaryContentView *v8;
  void *v9;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryAssistantSummaryContentView.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("viewModel"));

  }
  v12.receiver = self;
  v12.super_class = (Class)PXSharedLibraryAssistantSummaryContentView;
  v7 = -[PXSharedLibraryAssistantSummaryContentView initWithFrame:](&v12, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_viewModel, a3);
    -[PXSharedLibraryAssistantViewModel registerChangeObserver:context:](v8->_viewModel, "registerChangeObserver:context:", v8, PXSharedLibraryAssistantViewModelObservationContext_155447);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSharedLibraryAssistantSummaryContentView setBackgroundColor:](v8, "setBackgroundColor:", v9);

    -[PXSharedLibraryAssistantSummaryContentView _initializeSubviews](v8, "_initializeSubviews");
    -[PXSharedLibraryAssistantSummaryContentView _updateCountsLabel](v8, "_updateCountsLabel");
    -[PXSharedLibraryAssistantSummaryContentView _updatePeopleLabel](v8, "_updatePeopleLabel");
    -[PXSharedLibraryAssistantSummaryContentView _updateDateLabel](v8, "_updateDateLabel");
  }

  return v8;
}

- (void)_initializeSubviews
{
  UIImageView *v3;
  UIImageView *topImageView;
  UILabel *v5;
  UILabel *countsLabel;
  UILabel *v7;
  UILabel *peopleLabel;
  UILabel *v9;
  UILabel *dateLabel;
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
  _QWORD v55[16];

  v55[14] = *MEMORY[0x1E0C80C00];
  v3 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  topImageView = self->_topImageView;
  self->_topImageView = v3;

  _CreateLabel(1);
  v5 = (UILabel *)objc_claimAutoreleasedReturnValue();
  countsLabel = self->_countsLabel;
  self->_countsLabel = v5;

  _CreateLabel(0);
  v7 = (UILabel *)objc_claimAutoreleasedReturnValue();
  peopleLabel = self->_peopleLabel;
  self->_peopleLabel = v7;

  _CreateLabel(0);
  v9 = (UILabel *)objc_claimAutoreleasedReturnValue();
  dateLabel = self->_dateLabel;
  self->_dateLabel = v9;

  -[PXSharedLibraryAssistantSummaryContentView addSubview:](self, "addSubview:", self->_topImageView);
  -[PXSharedLibraryAssistantSummaryContentView addSubview:](self, "addSubview:", self->_countsLabel);
  -[PXSharedLibraryAssistantSummaryContentView addSubview:](self, "addSubview:", self->_peopleLabel);
  -[PXSharedLibraryAssistantSummaryContentView addSubview:](self, "addSubview:", self->_dateLabel);
  v37 = (void *)MEMORY[0x1E0CB3718];
  -[UIImageView topAnchor](self->_topImageView, "topAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryAssistantSummaryContentView topAnchor](self, "topAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToAnchor:", v53);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v52;
  -[UIImageView centerXAnchor](self->_topImageView, "centerXAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryAssistantSummaryContentView centerXAnchor](self, "centerXAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:", v50);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v49;
  -[UIImageView leadingAnchor](self->_topImageView, "leadingAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryAssistantSummaryContentView leadingAnchor](self, "leadingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintGreaterThanOrEqualToAnchor:", v47);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v55[2] = v46;
  -[UIImageView trailingAnchor](self->_topImageView, "trailingAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryAssistantSummaryContentView trailingAnchor](self, "trailingAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintLessThanOrEqualToAnchor:", v44);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v55[3] = v43;
  -[UILabel topAnchor](self->_countsLabel, "topAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView bottomAnchor](self->_topImageView, "bottomAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:constant:", v41, 22.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v55[4] = v40;
  -[UILabel leadingAnchor](self->_countsLabel, "leadingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryAssistantSummaryContentView leadingAnchor](self, "leadingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v38);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v55[5] = v36;
  -[UILabel trailingAnchor](self->_countsLabel, "trailingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryAssistantSummaryContentView trailingAnchor](self, "trailingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v34);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v55[6] = v33;
  -[UILabel topAnchor](self->_peopleLabel, "topAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_countsLabel, "bottomAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v31);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v55[7] = v30;
  -[UILabel leadingAnchor](self->_peopleLabel, "leadingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryAssistantSummaryContentView leadingAnchor](self, "leadingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v28);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v55[8] = v27;
  -[UILabel trailingAnchor](self->_peopleLabel, "trailingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryAssistantSummaryContentView trailingAnchor](self, "trailingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v25);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v55[9] = v24;
  -[UILabel topAnchor](self->_dateLabel, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_peopleLabel, "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v55[10] = v21;
  -[UILabel leadingAnchor](self->_dateLabel, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryAssistantSummaryContentView leadingAnchor](self, "leadingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v55[11] = v12;
  -[UILabel trailingAnchor](self->_dateLabel, "trailingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryAssistantSummaryContentView trailingAnchor](self, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v55[12] = v15;
  -[UILabel bottomAnchor](self->_dateLabel, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryAssistantSummaryContentView bottomAnchor](self, "bottomAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v55[13] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "activateConstraints:", v19);

  -[PXSharedLibraryAssistantSummaryContentView _updateIcon](self, "_updateIcon");
}

- (void)_updateCountsLabel
{
  void *v3;
  void *v4;
  void *v5;

  -[PXSharedLibraryAssistantSummaryContentView viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "shareCounts");
  PLLocalizedCountDescription();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_countsLabel, "setText:", v5);

}

- (void)_updatePeopleLabel
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;

  v17 = 0;
  -[PXSharedLibraryAssistantSummaryContentView viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedSelectedPeopleWithAdditionalPeopleCount:", &v17);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "count");
  v6 = v17 + v5;
  if (v17 + v5 >= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3738], "localizedStringByJoiningStrings:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count") == 1)
    {
      v8 = CFSTR("PXSharedLibraryAssistant_Summary_People_SinglePerson_Format");
    }
    else
    {
      if ((unint64_t)objc_msgSend(v4, "count") < 2 || v17)
      {
        if (objc_msgSend(v4, "count") == 2 && v17 >= 1)
        {
          PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryAssistant_Summary_People_TwoPeopleAndCount_Format"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v17;
          v14 = v13;
          PXLocalizedStringWithValidatedFormat(v11, CFSTR("%@ %@ %lu"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_10;
        }
        PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryAssistant_Summary_People_CountOnly_Format"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        v14 = (void *)v6;
        v12 = CFSTR("%lu");
LABEL_9:
        PXLocalizedStringWithValidatedFormat(v10, v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

        goto LABEL_11;
      }
      v8 = CFSTR("PXSharedLibraryAssistant_Summary_People_MultiplePeople_Format");
    }
    PXLocalizedSharedLibraryString(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v14 = v7;
    v12 = CFSTR("%@");
    goto LABEL_9;
  }
  v9 = 0;
LABEL_11:
  -[UILabel setText:](self->_peopleLabel, "setText:", v9, v14, v15, v16);
  -[UILabel setHidden:](self->_peopleLabel, "setHidden:", v9 == 0);

}

- (void)_updateDateLabel
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  -[PXSharedLibraryAssistantSummaryContentView viewModel](self, "viewModel");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v12, "selectedRuleType");
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", v3, 2, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v4 != 1)
    {
      v9 = 0;
      v10 = 1;
      goto LABEL_7;
    }
    v6 = (void *)MEMORY[0x1E0CB3578];
    objc_msgSend(v12, "suggestedStartDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringFromDate:dateStyle:timeStyle:", v7, 2, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryAssistant_Summary_Date_Format"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v5;
  PXLocalizedStringWithValidatedFormat(v8, CFSTR("%@"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
LABEL_7:
  -[UILabel setText:](self->_dateLabel, "setText:", v9, v11);
  -[UILabel setHidden:](self->_dateLabel, "setHidden:", v10);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXSharedLibraryAssistantSummaryContentView;
  v4 = a3;
  -[PXSharedLibraryAssistantSummaryContentView traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  -[PXSharedLibraryAssistantSummaryContentView traitCollection](self, "traitCollection", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 != v7)
    -[PXSharedLibraryAssistantSummaryContentView _updateIcon](self, "_updateIcon");

}

- (void)_updateIcon
{
  id v3;

  PXSharedLibraryCreatePlatterImage(CFSTR("rectangle.and.text.magnifyingglass"), 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](self->_topImageView, "setImage:", v3);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  __int16 v5;
  uint64_t v7;
  uint64_t v8;

  if ((void *)PXSharedLibraryAssistantViewModelObservationContext_155447 == a5)
  {
    v5 = a4;
    v7 = a4 & 0x88;
    if ((+[PXSharedLibraryAssistantViewModel shareCountChangeDescriptors](PXSharedLibraryAssistantViewModel, "shareCountChangeDescriptors", a3) & a4) != 0)-[PXSharedLibraryAssistantSummaryContentView _updateCountsLabel](self, "_updateCountsLabel");
    v8 = v5 & 0x2084;
    if (v7)
      -[PXSharedLibraryAssistantSummaryContentView _updatePeopleLabel](self, "_updatePeopleLabel");
    if (v8)
      -[PXSharedLibraryAssistantSummaryContentView _updateDateLabel](self, "_updateDateLabel");
  }
}

- (PXSharedLibraryAssistantViewModel)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_dateLabel, 0);
  objc_storeStrong((id *)&self->_peopleLabel, 0);
  objc_storeStrong((id *)&self->_countsLabel, 0);
  objc_storeStrong((id *)&self->_topImageView, 0);
}

@end
