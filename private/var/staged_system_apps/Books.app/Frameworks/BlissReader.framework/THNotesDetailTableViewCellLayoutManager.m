@implementation THNotesDetailTableViewCellLayoutManager

- (CGRect)editControlStartingRectForCell:(id)a3 forNewEditingState:(BOOL)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  float v11;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v16;
  CGRect v17;
  CGRect result;

  v16.receiver = self;
  v16.super_class = (Class)THNotesDetailTableViewCellLayoutManager;
  -[THNotesDetailTableViewCellLayoutManager editControlStartingRectForCell:forNewEditingState:](&v16, "editControlStartingRectForCell:forNewEditingState:", a3, a4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[THNotesDetailTableViewCellLayoutManagerDelegate editControlCenteringRect](self->_delegate, "editControlCenteringRect");
  v11 = CGRectGetMidY(v17) + v10 * -0.5;
  v12 = floorf(v11);
  v13 = v6;
  v14 = v8;
  v15 = v10;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v12;
  result.origin.x = v13;
  return result;
}

- (CGRect)editControlEndingRectForCell:(id)a3 forNewEditingState:(BOOL)a4
{
  _BOOL4 v4;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  float v13;
  double v14;
  double v15;
  double v16;
  double v17;
  objc_super v18;
  CGRect v19;
  CGRect result;

  v4 = a4;
  v18.receiver = self;
  v18.super_class = (Class)THNotesDetailTableViewCellLayoutManager;
  -[THNotesDetailTableViewCellLayoutManager editControlEndingRectForCell:forNewEditingState:](&v18, "editControlEndingRectForCell:forNewEditingState:");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  if (v4
    && +[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:](UIView, "userInterfaceLayoutDirectionForSemanticContentAttribute:", objc_msgSend(a3, "semanticContentAttribute")) == UIUserInterfaceLayoutDirectionLeftToRight)
  {
    v8 = v8 + 29.0;
  }
  -[THNotesDetailTableViewCellLayoutManagerDelegate editControlCenteringRect](self->_delegate, "editControlCenteringRect");
  v13 = CGRectGetMidY(v19) + v12 * -0.5;
  v14 = floorf(v13);
  v15 = v8;
  v16 = v10;
  v17 = v12;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v14;
  result.origin.x = v15;
  return result;
}

- (THNotesDetailTableViewCellLayoutManagerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THNotesDetailTableViewCellLayoutManagerDelegate *)a3;
}

@end
