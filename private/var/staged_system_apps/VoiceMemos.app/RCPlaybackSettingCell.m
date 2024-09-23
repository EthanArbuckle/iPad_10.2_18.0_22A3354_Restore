@implementation RCPlaybackSettingCell

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;
  CGSize result;

  v14.receiver = self;
  v14.super_class = (Class)RCPlaybackSettingCell;
  -[RCPlaybackSettingCell systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](&v14, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3.width, a3.height);
  v6 = v5;
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  objc_msgSend(v9, "playbackSettingsCollectionViewCellMinHeight");
  v11 = v10;

  if (v8 >= v11)
    v12 = v8;
  else
    v12 = v11;
  v13 = v6;
  result.height = v12;
  result.width = v13;
  return result;
}

- (RCPlaybackSettingCellActionsDelegate)cellActionsDelegate
{
  return (RCPlaybackSettingCellActionsDelegate *)objc_loadWeakRetained((id *)&self->_cellActionsDelegate);
}

- (void)setCellActionsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_cellActionsDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cellActionsDelegate);
}

@end
