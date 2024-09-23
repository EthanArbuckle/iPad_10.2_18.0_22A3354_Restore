@implementation ICBaseNoteResultsCollectionViewCell

- (ICBaseNoteResultsCollectionViewCell)initWithFrame:(CGRect)a3
{
  ICBaseNoteResultsCollectionViewCell *v3;
  ICBaseNoteResultsCollectionViewCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICBaseNoteResultsCollectionViewCell;
  v3 = -[ICBaseNoteResultsCollectionViewCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[ICBaseNoteResultsCollectionViewCell commonInit](v3, "commonInit");
  return v4;
}

- (ICBaseNoteResultsCollectionViewCell)initWithCoder:(id)a3
{
  ICBaseNoteResultsCollectionViewCell *v3;
  ICBaseNoteResultsCollectionViewCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICBaseNoteResultsCollectionViewCell;
  v3 = -[ICBaseNoteResultsCollectionViewCell initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[ICBaseNoteResultsCollectionViewCell commonInit](v3, "commonInit");
  return v4;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICBaseNoteResultsCollectionViewCell;
  -[ICBaseNoteResultsCollectionViewCell layoutSubviews](&v7, "layoutSubviews");
  -[ICBaseNoteResultsCollectionViewCell currentWidth](self, "currentWidth");
  v4 = v3;
  -[ICBaseNoteResultsCollectionViewCell frame](self, "frame");
  if (v4 != v5)
  {
    -[ICBaseNoteResultsCollectionViewCell updateEstimatedLabelFrames](self, "updateEstimatedLabelFrames");
    -[ICBaseNoteResultsCollectionViewCell loadConfigurationDataAndUpdate](self, "loadConfigurationDataAndUpdate");
  }
  -[ICBaseNoteResultsCollectionViewCell frame](self, "frame");
  -[ICBaseNoteResultsCollectionViewCell setCurrentWidth:](self, "setCurrentWidth:", v6);
}

- (NSArray)cloudSharingParticipantNames
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell collaboratorsBadgeView](self, "collaboratorsBadgeView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "share"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "participants"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell collaboratorsBadgeView](self, "collaboratorsBadgeView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CKShareParticipant ic_displayableNames:maximumNamesCount:](CKShareParticipant, "ic_displayableNames:maximumNamesCount:", v5, objc_msgSend(v6, "displayedAvatarCount")));

  return (NSArray *)v7;
}

- (void)setConfiguration:(id)a3
{
  -[ICBaseNoteResultsCollectionViewCell setConfiguration:synchronously:](self, "setConfiguration:synchronously:", a3, 1);
}

- (void)setConfiguration:(id)a3 synchronously:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v4 = a4;
  v11 = a3;
  objc_storeStrong((id *)&self->_configuration, a3);
  -[ICBaseNoteResultsCollectionViewCell updateConfigurationAttributes](self, "updateConfigurationAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "note"));
  v8 = objc_opt_class(NSManagedObject);
  v9 = ICClassAndProtocolCast(v7, v8, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  -[ICBaseNoteResultsCollectionViewCell ic_annotateWithNote:](self, "ic_annotateWithNote:", v10, &OBJC_PROTOCOL___ICSearchIndexableNote);

  if ((objc_msgSend(v11, "isDataLoaded") & 1) == 0)
  {
    if (v4)
      -[ICBaseNoteResultsCollectionViewCell synchronouslyLoadConfigurationDataAndUpdate](self, "synchronouslyLoadConfigurationDataAndUpdate");
    else
      -[ICBaseNoteResultsCollectionViewCell loadConfigurationDataAndUpdate](self, "loadConfigurationDataAndUpdate");
  }
  -[ICBaseNoteResultsCollectionViewCell updateFromConfiguration](self, "updateFromConfiguration");

}

- (void)loadConfigurationDataAndUpdate
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchResult"));

  if (v4)
  {
    -[ICBaseNoteResultsCollectionViewCell synchronouslyLoadConfigurationDataAndUpdate](self, "synchronouslyLoadConfigurationDataAndUpdate");
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000F32B0;
    v6[3] = &unk_100550110;
    v6[4] = self;
    objc_msgSend(v5, "loadDataWithCompletion:", v6);

  }
}

- (void)synchronouslyLoadConfigurationDataAndUpdate
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
  objc_msgSend(v3, "synchronouslyLoadData");

  -[ICBaseNoteResultsCollectionViewCell updateFromConfiguration](self, "updateFromConfiguration");
}

- (void)updateViewStateProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  NSAttributedStringKey v25;
  void *v26;
  _QWORD v27[2];
  _QWORD v28[2];
  NSAttributedStringKey v29;
  void *v30;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont ic_preferredSingleLineAFontForTextStyle:](UIFont, "ic_preferredSingleLineAFontForTextStyle:", UIFontTextStyleHeadline));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell titleLabel](self, "titleLabel"));
  objc_msgSend(v4, "setFont:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont ic_preferredSingleLineAFontForTextStyle:](UIFont, "ic_preferredSingleLineAFontForTextStyle:", UIFontTextStyleSubheadline));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell summaryLabel](self, "summaryLabel"));
  objc_msgSend(v6, "setFont:", v5);

  v7 = objc_opt_respondsToSelector(self, "folderAndAccountLabel");
  if ((v7 & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont ic_preferredSingleLineAFontForTextStyle:](UIFont, "ic_preferredSingleLineAFontForTextStyle:", UIFontTextStyleSubheadline));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell folderAndAccountLabel](self, "folderAndAccountLabel"));
    objc_msgSend(v9, "setFont:", v8);

  }
  v29 = NSFontAttributeName;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell titleLabel](self, "titleLabel"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "font"));
  v30 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1));
  -[ICBaseNoteResultsCollectionViewCell setTitleLabelAttributes:](self, "setTitleLabelAttributes:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell summaryLabel](self, "summaryLabel"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "textColor"));
  v15 = v14;
  if (v14)
    v16 = v14;
  else
    v16 = (id)objc_claimAutoreleasedReturnValue(+[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor"));
  v17 = v16;

  v27[0] = NSFontAttributeName;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell summaryLabel](self, "summaryLabel"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "font"));
  v27[1] = NSForegroundColorAttributeName;
  v28[0] = v19;
  v28[1] = v17;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 2));
  -[ICBaseNoteResultsCollectionViewCell setSummaryLabelAttributes:](self, "setSummaryLabelAttributes:", v20);

  if ((v7 & 1) != 0)
  {
    v25 = NSFontAttributeName;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell folderAndAccountLabel](self, "folderAndAccountLabel"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "font"));
    v26 = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
    -[ICBaseNoteResultsCollectionViewCell setFolderAndAccountLabelAttributes:](self, "setFolderAndAccountLabelAttributes:", v23);

  }
  else
  {
    -[ICBaseNoteResultsCollectionViewCell setFolderAndAccountLabelAttributes:](self, "setFolderAndAccountLabelAttributes:", &__NSDictionary0__struct);
  }
  -[ICBaseNoteResultsCollectionViewCell frame](self, "frame");
  -[ICBaseNoteResultsCollectionViewCell setCurrentWidth:](self, "setCurrentWidth:", v24);
  -[ICBaseNoteResultsCollectionViewCell updateEstimatedLabelFrames](self, "updateEstimatedLabelFrames");
  -[ICBaseNoteResultsCollectionViewCell updateConfigurationAttributes](self, "updateConfigurationAttributes");

}

- (void)updateEstimatedLabelFrames
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell titleLabel](self, "titleLabel"));
  -[ICBaseNoteResultsCollectionViewCell estimatedBoundsForLabel:](self, "estimatedBoundsForLabel:", v3);
  -[ICBaseNoteResultsCollectionViewCell setEstimatedTitleLabelFrame:](self, "setEstimatedTitleLabelFrame:");

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell summaryLabel](self, "summaryLabel"));
  -[ICBaseNoteResultsCollectionViewCell estimatedBoundsForLabel:](self, "estimatedBoundsForLabel:", v4);
  -[ICBaseNoteResultsCollectionViewCell setEstimatedSummaryLabelFrame:](self, "setEstimatedSummaryLabelFrame:");

}

- (void)setEstimatedTitleLabelFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  self->_estimatedTitleLabelFrame = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
  objc_msgSend(v7, "setEstimatedTitleLabelFrame:", x, y, width, height);

}

- (void)setEstimatedSummaryLabelFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  self->_estimatedSummaryLabelFrame = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
  objc_msgSend(v7, "setEstimatedSummaryLabelFrame:", x, y, width, height);

}

- (CGRect)estimatedBoundsForLabel:(id)a3
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)updateConfigurationAttributes
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;

  v18 = (id)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell configuration](self, "configuration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell titleLabelAttributes](self, "titleLabelAttributes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell summaryLabelAttributes](self, "summaryLabelAttributes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICBaseNoteResultsCollectionViewCell folderAndAccountLabelAttributes](self, "folderAndAccountLabelAttributes"));
  -[ICBaseNoteResultsCollectionViewCell estimatedTitleLabelFrame](self, "estimatedTitleLabelFrame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[ICBaseNoteResultsCollectionViewCell estimatedSummaryLabelFrame](self, "estimatedSummaryLabelFrame");
  objc_msgSend(v18, "updateTitleLabelAttributes:summaryLabelAttributes:folderAndAccountLabelAttributes:estimatedTitleLabelFrame:estimatedSummaryLabelFrame:", v3, v4, v5, v7, v9, v11, v13, v14, v15, v16, v17);

}

- (void)registerForTraitChanges
{
  void *v3;
  id v4;
  _QWORD v5[5];
  _QWORD v6[3];

  v6[0] = objc_opt_class(UITraitHorizontalSizeClass);
  v6[1] = objc_opt_class(UITraitVerticalSizeClass);
  v6[2] = objc_opt_class(UITraitPreferredContentSizeCategory);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v6, 3));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000F3954;
  v5[3] = &unk_1005543A0;
  v5[4] = self;
  v4 = -[ICBaseNoteResultsCollectionViewCell registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v3, v5);

}

- (ICNoteResultsCollaboratorsBadgeView)collaboratorsBadgeView
{
  return (ICNoteResultsCollaboratorsBadgeView *)objc_loadWeakRetained((id *)&self->_collaboratorsBadgeView);
}

- (void)setCollaboratorsBadgeView:(id)a3
{
  objc_storeWeak((id *)&self->_collaboratorsBadgeView, a3);
}

- (ICNoteResultsCellConfiguration)configuration
{
  return self->_configuration;
}

- (NSDictionary)titleLabelAttributes
{
  return self->_titleLabelAttributes;
}

- (void)setTitleLabelAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabelAttributes, a3);
}

- (NSDictionary)summaryLabelAttributes
{
  return self->_summaryLabelAttributes;
}

- (void)setSummaryLabelAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_summaryLabelAttributes, a3);
}

- (NSDictionary)folderAndAccountLabelAttributes
{
  return self->_folderAndAccountLabelAttributes;
}

- (void)setFolderAndAccountLabelAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_folderAndAccountLabelAttributes, a3);
}

- (CGRect)estimatedTitleLabelFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_estimatedTitleLabelFrame.origin.x;
  y = self->_estimatedTitleLabelFrame.origin.y;
  width = self->_estimatedTitleLabelFrame.size.width;
  height = self->_estimatedTitleLabelFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)estimatedSummaryLabelFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_estimatedSummaryLabelFrame.origin.x;
  y = self->_estimatedSummaryLabelFrame.origin.y;
  width = self->_estimatedSummaryLabelFrame.size.width;
  height = self->_estimatedSummaryLabelFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)currentWidth
{
  return self->_currentWidth;
}

- (void)setCurrentWidth:(double)a3
{
  self->_currentWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folderAndAccountLabelAttributes, 0);
  objc_storeStrong((id *)&self->_summaryLabelAttributes, 0);
  objc_storeStrong((id *)&self->_titleLabelAttributes, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_collaboratorsBadgeView);
}

@end
