@implementation CRLiOSInspectorTableCellImageView

- (void)setImage:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLiOSInspectorTableCellImageView;
  -[CRLiOSInspectorTableCellImageView setImage:](&v5, "setImage:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableCellImageView parentCell](self, "parentCell"));
  objc_msgSend(v4, "p_imageDidChange");

}

- (void)setContentMode:(int64_t)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLiOSInspectorTableCellImageView;
  -[CRLiOSInspectorTableCellImageView setContentMode:](&v5, "setContentMode:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableCellImageView parentCell](self, "parentCell"));
  objc_msgSend(v4, "p_imageDidChange");

}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 0;
}

- (CRLiOSInspectorTableViewCell)parentCell
{
  return (CRLiOSInspectorTableViewCell *)objc_loadWeakRetained((id *)&self->_parentCell);
}

- (void)setParentCell:(id)a3
{
  objc_storeWeak((id *)&self->_parentCell, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentCell);
}

@end
