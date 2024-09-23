@implementation _UITableViewDropAnimationToCell

- (_UITableViewDropAnimationToCell)initWithDragItem:(id)a3 cell:(id)a4 previewParameters:(id)a5
{
  id v8;
  id v9;
  _UITableViewDropAnimationToCell *v10;
  _UITableViewDropAnimationToCell *v11;
  objc_super v13;

  v8 = a4;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)_UITableViewDropAnimationToCell;
  v10 = -[_UITableViewDropAnimation initWithDragItem:](&v13, sel_initWithDragItem_, a3);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_cell, v8);
    objc_storeStrong((id *)&v11->_previewParameters, a5);
  }

  return v11;
}

- (UITableViewCell)cell
{
  return (UITableViewCell *)objc_loadWeakRetained((id *)&self->_cell);
}

- (void)setCell:(id)a3
{
  objc_storeWeak((id *)&self->_cell, a3);
}

- (UIDragPreviewParameters)previewParameters
{
  return self->_previewParameters;
}

- (void)setPreviewParameters:(id)a3
{
  objc_storeStrong((id *)&self->_previewParameters, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewParameters, 0);
  objc_destroyWeak((id *)&self->_cell);
}

@end
