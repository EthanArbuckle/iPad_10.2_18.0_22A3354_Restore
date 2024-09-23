@implementation PKPayLaterStackedLeadingTrailingRow

- (PKPayLaterStackedLeadingTrailingRow)initWithLeadingPrimaryText:(id)a3 leadingSecondaryText:(id)a4 trailingPrimaryText:(id)a5 trailingSecondaryText:(id)a6 detailText:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  PKPayLaterStackedLeadingTrailingRow *v17;
  PKPayLaterStackedLeadingTrailingRow *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)PKPayLaterStackedLeadingTrailingRow;
  v17 = -[PKPayLaterStackedLeadingTrailingRow init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_leadingPrimaryText, a3);
    objc_storeStrong((id *)&v18->_leadingSecondaryText, a4);
    objc_storeStrong((id *)&v18->_trailingPrimaryText, a5);
    objc_storeStrong((id *)&v18->_trailingSecondaryText, a6);
    objc_storeStrong((id *)&v18->_detailText, a7);
  }

  return v18;
}

- (NSCopying)identifier
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v5);

  if (self->_leadingPrimaryText)
    objc_msgSend(v3, "appendString:");
  if (self->_leadingSecondaryText)
    objc_msgSend(v3, "appendString:");
  if (self->_trailingPrimaryText)
    objc_msgSend(v3, "appendString:");
  if (self->_trailingSecondaryText)
    objc_msgSend(v3, "appendString:");
  if (self->_detailText)
    objc_msgSend(v3, "appendString:");
  v6 = (void *)objc_msgSend(v3, "copy");

  return (NSCopying *)v6;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (void)configureCell:(id)a3
{
  NSString *leadingPrimaryText;
  id v5;
  id v6;

  v6 = a3;
  -[PKPayLaterStackedLeadingTrailingRow cellClass](self, "cellClass");
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    leadingPrimaryText = self->_leadingPrimaryText;
    v5 = v6;
    objc_msgSend(v5, "setLeadingPrimaryText:", leadingPrimaryText);
    objc_msgSend(v5, "setLeadingSecondaryText:", self->_leadingSecondaryText);
    objc_msgSend(v5, "setTrailingPrimaryText:", self->_trailingPrimaryText);
    objc_msgSend(v5, "setTrailingSecondaryText:", self->_trailingSecondaryText);
    objc_msgSend(v5, "setDetailText:", self->_detailText);
    objc_msgSend(v5, "setShowProgressBar:", self->_showProgressBar);
    objc_msgSend(v5, "setProgress:", self->_progress);
    objc_msgSend(v5, "setProgressBarStartColor:", self->_progressBarStartColor);
    objc_msgSend(v5, "setProgressBarEndColor:", self->_progressBarEndColor);

  }
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_leadingPrimaryText);
  objc_msgSend(v3, "safelyAddObject:", self->_leadingSecondaryText);
  objc_msgSend(v3, "safelyAddObject:", self->_trailingPrimaryText);
  objc_msgSend(v3, "safelyAddObject:", self->_trailingSecondaryText);
  objc_msgSend(v3, "safelyAddObject:", self->_detailText);
  objc_msgSend(v3, "safelyAddObject:", self->_progressBarStartColor);
  objc_msgSend(v3, "safelyAddObject:", self->_progressBarEndColor);
  PKCombinedHash();
  PKIntegerHash();
  v4 = PKIntegerHash();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PKPayLaterStackedLeadingTrailingRow *v4;
  PKPayLaterStackedLeadingTrailingRow *v5;
  PKPayLaterStackedLeadingTrailingRow *v6;
  NSString *leadingPrimaryText;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  _BOOL4 v11;
  BOOL v12;
  NSString *leadingSecondaryText;
  NSString *v14;
  _BOOL4 v15;
  NSString *trailingPrimaryText;
  NSString *v17;
  _BOOL4 v18;
  NSString *trailingSecondaryText;
  NSString *v20;
  _BOOL4 v21;
  NSString *detailText;
  NSString *v23;
  _BOOL4 v24;

  v4 = (PKPayLaterStackedLeadingTrailingRow *)a3;
  v5 = v4;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        leadingPrimaryText = v6->_leadingPrimaryText;
        v8 = self->_leadingPrimaryText;
        v9 = leadingPrimaryText;
        if (v8 == v9)
        {

        }
        else
        {
          v10 = v9;
          if (!v8 || !v9)
            goto LABEL_35;
          v11 = -[NSString isEqualToString:](v8, "isEqualToString:", v9);

          if (!v11)
            goto LABEL_36;
        }
        leadingSecondaryText = v6->_leadingSecondaryText;
        v8 = self->_leadingSecondaryText;
        v14 = leadingSecondaryText;
        if (v8 == v14)
        {

        }
        else
        {
          v10 = v14;
          if (!v8 || !v14)
            goto LABEL_35;
          v15 = -[NSString isEqualToString:](v8, "isEqualToString:", v14);

          if (!v15)
            goto LABEL_36;
        }
        trailingPrimaryText = v6->_trailingPrimaryText;
        v8 = self->_trailingPrimaryText;
        v17 = trailingPrimaryText;
        if (v8 == v17)
        {

        }
        else
        {
          v10 = v17;
          if (!v8 || !v17)
            goto LABEL_35;
          v18 = -[NSString isEqualToString:](v8, "isEqualToString:", v17);

          if (!v18)
            goto LABEL_36;
        }
        trailingSecondaryText = v6->_trailingSecondaryText;
        v8 = self->_trailingSecondaryText;
        v20 = trailingSecondaryText;
        if (v8 == v20)
        {

        }
        else
        {
          v10 = v20;
          if (!v8 || !v20)
            goto LABEL_35;
          v21 = -[NSString isEqualToString:](v8, "isEqualToString:", v20);

          if (!v21)
            goto LABEL_36;
        }
        detailText = v6->_detailText;
        v8 = self->_detailText;
        v23 = detailText;
        if (v8 == v23)
        {

LABEL_40:
          if (PKEqualObjects()
            && PKEqualObjects()
            && self->_showProgressBar == v6->_showProgressBar)
          {
            v12 = self->_progress == v6->_progress;
            goto LABEL_37;
          }
LABEL_36:
          v12 = 0;
LABEL_37:

          goto LABEL_38;
        }
        v10 = v23;
        if (v8 && v23)
        {
          v24 = -[NSString isEqualToString:](v8, "isEqualToString:", v23);

          if (!v24)
            goto LABEL_36;
          goto LABEL_40;
        }
LABEL_35:

        goto LABEL_36;
      }
    }
    v12 = 0;
  }
LABEL_38:

  return v12;
}

- (NSString)leadingPrimaryText
{
  return self->_leadingPrimaryText;
}

- (void)setLeadingPrimaryText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)leadingSecondaryText
{
  return self->_leadingSecondaryText;
}

- (void)setLeadingSecondaryText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)trailingPrimaryText
{
  return self->_trailingPrimaryText;
}

- (void)setTrailingPrimaryText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)trailingSecondaryText
{
  return self->_trailingSecondaryText;
}

- (void)setTrailingSecondaryText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)detailText
{
  return self->_detailText;
}

- (void)setDetailText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)showProgressBar
{
  return self->_showProgressBar;
}

- (void)setShowProgressBar:(BOOL)a3
{
  self->_showProgressBar = a3;
}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (UIColor)progressBarStartColor
{
  return self->_progressBarStartColor;
}

- (void)setProgressBarStartColor:(id)a3
{
  objc_storeStrong((id *)&self->_progressBarStartColor, a3);
}

- (UIColor)progressBarEndColor
{
  return self->_progressBarEndColor;
}

- (void)setProgressBarEndColor:(id)a3
{
  objc_storeStrong((id *)&self->_progressBarEndColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressBarEndColor, 0);
  objc_storeStrong((id *)&self->_progressBarStartColor, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_trailingSecondaryText, 0);
  objc_storeStrong((id *)&self->_trailingPrimaryText, 0);
  objc_storeStrong((id *)&self->_leadingSecondaryText, 0);
  objc_storeStrong((id *)&self->_leadingPrimaryText, 0);
}

@end
