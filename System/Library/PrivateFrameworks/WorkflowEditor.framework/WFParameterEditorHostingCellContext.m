@implementation WFParameterEditorHostingCellContext

- (WFParameterEditorHostingCell)cell
{
  return (WFParameterEditorHostingCell *)objc_loadWeakRetained((id *)&self->_cell);
}

- (void)setCell:(id)a3
{
  objc_storeWeak((id *)&self->_cell, a3);
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void)setTraitCollection:(id)a3
{
  objc_storeStrong((id *)&self->_traitCollection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_destroyWeak((id *)&self->_cell);
}

@end
