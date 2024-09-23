@implementation _PXSelectionCoordinatorState

- (_PXSelectionCoordinatorState)initWithSelectionSnapshot:(id)a3
{
  id v5;
  _PXSelectionCoordinatorState *v6;
  _PXSelectionCoordinatorState *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PXSelectionCoordinatorState;
  v6 = -[_PXSelectionCoordinatorState init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_selectionSnapshot, a3);

  return v7;
}

- (PXSelectionSnapshot)selectionSnapshot
{
  return self->_selectionSnapshot;
}

- (void)setSelectionSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_selectionSnapshot, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionSnapshot, 0);
}

@end
