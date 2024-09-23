@implementation _UITableViewDropAnimationToTarget

- (_UITableViewDropAnimationToTarget)initWithDragItem:(id)a3 target:(id)a4
{
  id v7;
  _UITableViewDropAnimationToTarget *v8;
  _UITableViewDropAnimationToTarget *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_UITableViewDropAnimationToTarget;
  v8 = -[_UITableViewDropAnimation initWithDragItem:](&v11, sel_initWithDragItem_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_target, a4);

  return v9;
}

- (id)cellForTargetContainerInTableView:(id)a3
{
  id v4;
  void *v5;
  UITableViewCell *v6;
  uint64_t v7;
  UITableViewCell *cell;
  UITableViewCell *v9;
  UITableViewCell *v10;

  v4 = a3;
  if (!-[_UITableViewDropAnimationToTarget didSearchForCell](self, "didSearchForCell"))
  {
    objc_opt_class();
    -[_UITableViewDropAnimationToTarget target](self, "target");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "container");
    v6 = (UITableViewCell *)objc_claimAutoreleasedReturnValue();

    while ((objc_opt_isKindOfClass() & 1) == 0 || !-[UIView isDescendantOfView:](v6, "isDescendantOfView:", v4))
    {
      -[UIView superview](v6, "superview");
      v7 = objc_claimAutoreleasedReturnValue();

      v6 = (UITableViewCell *)v7;
      if (!v7)
        goto LABEL_8;
    }
    cell = self->_cell;
    self->_cell = v6;
    v9 = v6;

LABEL_8:
    -[_UITableViewDropAnimationToTarget setDidSearchForCell:](self, "setDidSearchForCell:", 1);
  }
  v10 = self->_cell;

  return v10;
}

- (UIDragPreviewTarget)target
{
  return self->_target;
}

- (void)setTarget:(id)a3
{
  objc_storeStrong((id *)&self->_target, a3);
}

- (BOOL)didSearchForCell
{
  return self->_didSearchForCell;
}

- (void)setDidSearchForCell:(BOOL)a3
{
  self->_didSearchForCell = a3;
}

- (UITableViewCell)cell
{
  return self->_cell;
}

- (void)setCell:(id)a3
{
  objc_storeStrong((id *)&self->_cell, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cell, 0);
  objc_storeStrong((id *)&self->_target, 0);
}

@end
