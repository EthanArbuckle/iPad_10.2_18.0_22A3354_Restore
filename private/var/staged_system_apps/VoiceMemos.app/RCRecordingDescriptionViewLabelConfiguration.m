@implementation RCRecordingDescriptionViewLabelConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleTextColor, 0);
  objc_storeStrong((id *)&self->_recordingTitleEditingTintColor, 0);
  objc_storeStrong((id *)&self->_recordingTitleTextColor, 0);
}

- (UIColor)subtitleTextColor
{
  return self->_subtitleTextColor;
}

- (UIColor)recordingTitleTextColor
{
  return self->_recordingTitleTextColor;
}

- (UIColor)recordingTitleEditingTintColor
{
  return self->_recordingTitleEditingTintColor;
}

+ (id)recordingCollectionViewCellConfiguration
{
  return -[RCRecordingDescriptionViewLabelConfiguration _initWithStyle:]([RCRecordingDescriptionViewLabelConfiguration alloc], "_initWithStyle:", 1);
}

- (id)_initWithStyle:(unint64_t)a3
{
  RCRecordingDescriptionViewLabelConfiguration *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  UIColor *recordingTitleTextColor;
  uint64_t v9;
  UIColor *recordingTitleEditingTintColor;
  uint64_t v11;
  uint64_t v12;
  UIColor *v13;
  uint64_t v14;
  UIColor *v15;
  uint64_t v16;
  UIColor *v17;
  void *v18;
  uint64_t v19;
  UIColor *subtitleTextColor;
  uint64_t v21;
  UIColor *v22;
  uint64_t v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)RCRecordingDescriptionViewLabelConfiguration;
  v4 = -[RCRecordingDescriptionViewLabelConfiguration init](&v25, "init");
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    v6 = v5;
    switch(a3)
    {
      case 1uLL:
        v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recordingCollectionViewCellTextColor"));
        recordingTitleTextColor = v4->_recordingTitleTextColor;
        v4->_recordingTitleTextColor = (UIColor *)v7;

        v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordingCollectionViewCellTextColor"));
        recordingTitleEditingTintColor = v4->_recordingTitleEditingTintColor;
        v4->_recordingTitleEditingTintColor = (UIColor *)v9;

        v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordingCollectionViewCellTextColor"));
        goto LABEL_6;
      case 2uLL:
        v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recordingCollectionViewSelectedCellTextColor"));
        v13 = v4->_recordingTitleTextColor;
        v4->_recordingTitleTextColor = (UIColor *)v12;

        v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordingCollectionViewSelectedCellTextColor"));
        v15 = v4->_recordingTitleEditingTintColor;
        v4->_recordingTitleEditingTintColor = (UIColor *)v14;

        v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordingCollectionViewSelectedCellTextColor"));
        goto LABEL_6;
      case 3uLL:
        v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "playbackCardPrimaryLabelFontColor"));
        v17 = v4->_recordingTitleTextColor;
        v4->_recordingTitleTextColor = (UIColor *)v16;

        v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "playbackCardPrimaryLabelFontColor"));
LABEL_6:
        v18 = (void *)v11;
        objc_msgSend(v6, "descriptionViewSecondaryLabelAlpha");
        v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "colorWithAlphaComponent:"));
        subtitleTextColor = v4->_subtitleTextColor;
        v4->_subtitleTextColor = (UIColor *)v19;

        goto LABEL_8;
      case 4uLL:
        v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "playbackCardPrimaryLabelFontColor"));
        v22 = v4->_recordingTitleTextColor;
        v4->_recordingTitleTextColor = (UIColor *)v21;

        v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "playbackCardSecondaryLabelFontColor"));
        v18 = v4->_subtitleTextColor;
        v4->_subtitleTextColor = (UIColor *)v23;
LABEL_8:

        break;
      default:
        break;
    }

  }
  return v4;
}

+ (id)recordingViewConfiguration
{
  return -[RCRecordingDescriptionViewLabelConfiguration _initWithStyle:]([RCRecordingDescriptionViewLabelConfiguration alloc], "_initWithStyle:", 3);
}

+ (id)emptyConfiguration
{
  return -[RCRecordingDescriptionViewLabelConfiguration _initWithStyle:]([RCRecordingDescriptionViewLabelConfiguration alloc], "_initWithStyle:", 0);
}

+ (id)selectedRecordingCollectionViewCellConfiguration
{
  return -[RCRecordingDescriptionViewLabelConfiguration _initWithStyle:]([RCRecordingDescriptionViewLabelConfiguration alloc], "_initWithStyle:", 2);
}

+ (id)playbackViewConfiguration
{
  return -[RCRecordingDescriptionViewLabelConfiguration _initWithStyle:]([RCRecordingDescriptionViewLabelConfiguration alloc], "_initWithStyle:", 4);
}

- (RCRecordingDescriptionViewLabelConfiguration)initWithRecordingTitleTextColor:(id)a3 recordingTitleEditingTintColor:(id)a4 subtitleTextColor:(id)a5
{
  id v9;
  id v10;
  id v11;
  RCRecordingDescriptionViewLabelConfiguration *v12;
  RCRecordingDescriptionViewLabelConfiguration *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)RCRecordingDescriptionViewLabelConfiguration;
  v12 = -[RCRecordingDescriptionViewLabelConfiguration init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_recordingTitleTextColor, a3);
    objc_storeStrong((id *)&v13->_recordingTitleEditingTintColor, a4);
    objc_storeStrong((id *)&v13->_subtitleTextColor, a5);
  }

  return v13;
}

- (void)setRecordingTitleTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_recordingTitleTextColor, a3);
}

- (void)setRecordingTitleEditingTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_recordingTitleEditingTintColor, a3);
}

- (void)setSubtitleTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleTextColor, a3);
}

@end
