@implementation CRLiOSInspectorTableCellImageButton

- (void)setImage:(id)a3 forState:(unint64_t)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLiOSInspectorTableCellImageButton;
  -[CRLiOSInspectorTableCellImageButton setImage:forState:](&v6, "setImage:forState:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableCellImageButton parentCell](self, "parentCell"));
  objc_msgSend(v5, "p_imageDidChange");

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
