@implementation PKFamilyMemberTableViewCell

- (void)setRowModel:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  -[PKFamilyMemberTableViewCell defaultContentConfiguration](self, "defaultContentConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "titleText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v5);

  objc_msgSend(v19, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", v6);

  objc_msgSend(v19, "detailText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSecondaryText:", v7);

  v8 = objc_msgSend(v19, "cellStyle");
  if (v8)
  {
    if (v8 == 1)
    {
      PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setPrefersSideBySideTextAndSecondaryText:", 1);
      v10 = 0.0;
      v11 = 5.0;
      v12 = 10.0;
      v13 = 35.0;
      v14 = 35.0;
      v15 = 5.0;
    }
    else
    {
      v9 = 0;
      v15 = *MEMORY[0x1E0DC3298];
      v10 = *(double *)(MEMORY[0x1E0DC3298] + 8);
      v11 = *(double *)(MEMORY[0x1E0DC3298] + 16);
      v12 = *(double *)(MEMORY[0x1E0DC3298] + 24);
      v14 = *MEMORY[0x1E0C9D820];
      v13 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    }
  }
  else
  {
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4B10], 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 10.0;
    v12 = 0.0;
    v13 = 40.0;
    v14 = 40.0;
    v10 = 0.0;
    v15 = 10.0;
  }
  objc_msgSend(v4, "setDirectionalLayoutMargins:", v15, v10, v11, v12);
  objc_msgSend(v4, "imageProperties");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setMaximumSize:", v14, v13);
  objc_msgSend(v4, "secondaryTextProperties");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setColor:", v18);

  objc_msgSend(v17, "setFont:", v9);
  -[PKFamilyMemberTableViewCell setContentConfiguration:](self, "setContentConfiguration:", v4);
  -[PKFamilyMemberTableViewCell setAccessoryType:](self, "setAccessoryType:", objc_msgSend(v19, "accessoryType"));

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKFamilyMemberTableViewCell;
  -[PKFamilyMemberTableViewCell prepareForReuse](&v3, sel_prepareForReuse);
  -[PKFamilyMemberTableViewCell setAccessoryType:](self, "setAccessoryType:", 0);
}

- (PKFamilyMemberRowModel)rowModel
{
  return self->_rowModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rowModel, 0);
}

@end
