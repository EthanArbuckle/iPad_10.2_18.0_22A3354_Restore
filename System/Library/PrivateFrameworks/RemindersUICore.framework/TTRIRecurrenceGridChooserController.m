@implementation TTRIRecurrenceGridChooserController

- (id)tableViewCell
{
  TTRIUIDividedGridViewTableViewCell *tableViewCell;
  TTRIUIDividedGridViewTableViewCell *v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  TTRIUIDividedGridViewTableViewCell *v9;
  void *v10;
  TTRIUIDividedGridViewTableViewCell *v11;

  tableViewCell = self->_tableViewCell;
  if (!tableViewCell)
  {
    v4 = [TTRIUIDividedGridViewTableViewCell alloc];
    v5 = -[TTRIRecurrenceGridChooserController gridViewType](self, "gridViewType");
    -[TTRIRecurrenceGridChooserController cellLabels](self, "cellLabels");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TTRIRecurrenceGridChooserController cellAccessibilityLabels](self, "cellAccessibilityLabels");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TTRIRecurrenceChooserController backgroundColor](self, "backgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[TTRIUIDividedGridViewTableViewCell initWithStyle:reuseIdentifier:gridViewType:buttonTitles:buttonAccessibilityLabels:cellBackgroundColor:](v4, "initWithStyle:reuseIdentifier:gridViewType:buttonTitles:buttonAccessibilityLabels:cellBackgroundColor:", 0, 0, v5, v6, v7, v8);

    -[TTRIUIDividedGridViewTableViewCell setDrawingEnabled:](v9, "setDrawingEnabled:", 1);
    -[TTRIUIDividedGridViewTableViewCell setSelectionStyle:](v9, "setSelectionStyle:", 0);
    -[TTRIUIDividedGridViewTableViewCell gridViewController](v9, "gridViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDelegate:", self);

    -[TTRIUIDividedGridViewTableViewCell setDrawsTopDivider:](v9, "setDrawsTopDivider:", 0);
    v11 = self->_tableViewCell;
    self->_tableViewCell = v9;

    tableViewCell = self->_tableViewCell;
  }
  return tableViewCell;
}

- (id)allCells
{
  void *v2;
  void *v3;
  void *v4;

  -[TTRIRecurrenceGridChooserController tableViewCell](self, "tableViewCell");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "gridViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allCells");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)heightForRow:(int64_t)a3
{
  void *v3;
  double v4;
  double v5;

  -[TTRIRecurrenceGridChooserController tableViewCell](self, "tableViewCell", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0DC4FF8], *(double *)(MEMORY[0x1E0DC4FF8] + 8));
  v5 = v4;

  return v5;
}

- (void)dividedGridViewControllerDidLayout:(id)a3
{
  -[TTRIRecurrenceGridChooserController prepareForDisplay](self, "prepareForDisplay", a3);
  -[TTRIRecurrenceGridChooserController refreshCells](self, "refreshCells");
}

- (void)dividedGridViewController:(id)a3 didSelectCell:(id)a4 atIndex:(int64_t)a5
{
  -[TTRIRecurrenceGridChooserController selectCell:atIndex:](self, "selectCell:atIndex:", a4, a5);
}

- (BOOL)drawBackgroundForRow:(int64_t)a3
{
  return -[TTRIUIDividedGridViewTableViewCell wantsDrawBackground](self->_tableViewCell, "wantsDrawBackground", a3);
}

- (id)cellAccessibilityLabels
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableViewCell, 0);
}

- (id)cellLabels
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  return 0;
}

- (int64_t)gridViewType
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  return -1;
}

- (void)prepareForDisplay
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
}

- (void)refreshCells
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
}

- (void)selectCell:(id)a3 atIndex:(int64_t)a4
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
}

@end
