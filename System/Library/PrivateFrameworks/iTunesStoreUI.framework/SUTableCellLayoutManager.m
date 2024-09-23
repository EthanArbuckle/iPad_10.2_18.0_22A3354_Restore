@implementation SUTableCellLayoutManager

- (CGRect)accessoryEndingRectForCell:(id)a3 forNewEditingState:(BOOL)a4 showingDeleteConfirmation:(BOOL)a5
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  objc_super v23;
  CGRect result;

  v23.receiver = self;
  v23.super_class = (Class)SUTableCellLayoutManager;
  -[UITableViewCellLayoutManager accessoryEndingRectForCell:forNewEditingState:showingDeleteConfirmation:](&v23, sel_accessoryEndingRectForCell_forNewEditingState_showingDeleteConfirmation_, a3, a4, a5);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = (void *)objc_msgSend(a3, "configuration");
  if (v14)
  {
    objc_msgSend(v14, "frameForAccessoryViewWithFrame:", v7, v9, v11, v13);
    v7 = v15;
    v9 = v16;
    v11 = v17;
    v13 = v18;
  }
  v19 = v7;
  v20 = v9;
  v21 = v11;
  v22 = v13;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

@end
