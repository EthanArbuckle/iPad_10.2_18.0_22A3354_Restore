@implementation _PXVisualDiagnosticsTableCell

- (_PXVisualDiagnosticsTableCell)initWithRenderingBlock:(id)a3
{
  id v4;
  _PXVisualDiagnosticsTableCell *v5;
  uint64_t v6;
  id renderingBlock;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PXVisualDiagnosticsTableCell;
  v5 = -[_PXVisualDiagnosticsTableCell init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    renderingBlock = v5->_renderingBlock;
    v5->_renderingBlock = (id)v6;

  }
  return v5;
}

- (id)renderingBlock
{
  return self->_renderingBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_renderingBlock, 0);
}

@end
