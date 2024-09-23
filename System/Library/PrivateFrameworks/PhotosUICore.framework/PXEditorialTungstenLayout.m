@implementation PXEditorialTungstenLayout

- (PXEditorialTungstenLayout)init
{
  PXEditorialTungstenLayout *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXEditorialTungstenLayout;
  result = -[PXGGeneratedLayout init](&v3, sel_init);
  if (result)
    result->_numberOfColumns = 3;
  return result;
}

- (id)newGenerator
{
  PXEditorialLayoutMetrics *v3;
  PXEditorialLayoutGenerator *v4;
  _QWORD v6[4];
  id v7;
  id location;

  v3 = objc_alloc_init(PXEditorialLayoutMetrics);
  -[PXEditorialLayoutMetrics setNumberOfColumns:](v3, "setNumberOfColumns:", -[PXEditorialTungstenLayout numberOfColumns](self, "numberOfColumns"));
  -[PXGGeneratedLayout interitemSpacing](self, "interitemSpacing");
  -[PXEditorialLayoutMetrics setInterTileSpacing:](v3, "setInterTileSpacing:");
  -[PXGGeneratedLayout padding](self, "padding");
  -[PXEditorialLayoutMetrics setPadding:](v3, "setPadding:");
  -[PXGLayout referenceSize](self, "referenceSize");
  -[PXLayoutMetrics setReferenceSize:](v3, "setReferenceSize:");
  -[PXEditorialLayoutMetrics setUseSaliency:](v3, "setUseSaliency:", -[PXGGeneratedLayout useSaliency](self, "useSaliency"));
  objc_initWeak(&location, self);
  v4 = -[PXEditorialLayoutGenerator initWithMetrics:]([PXEditorialLayoutGenerator alloc], "initWithMetrics:", v3);
  -[PXEditorialLayoutGenerator setItemCount:](v4, "setItemCount:", -[PXGItemsLayout numberOfItems](self, "numberOfItems"));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__PXEditorialTungstenLayout_newGenerator__block_invoke;
  v6[3] = &unk_1E513D448;
  objc_copyWeak(&v7, &location);
  -[PXEditorialLayoutGenerator setItemLayoutInfoBlock:](v4, "setItemLayoutInfoBlock:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

  return v4;
}

- (id)_inputItemAtIndex:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;

  v3 = *(_QWORD *)&a3;
  -[PXGItemsLayout delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "generatedLayout:inputItemAtIndex:", self, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setNumberOfColumns:(int64_t)a3
{
  BOOL v3;
  int64_t v4;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v8;
  void *v9;

  if (self->_numberOfColumns != a3)
  {
    v3 = a3 == 5 || a3 == 3;
    v4 = 3;
    if (v3)
      v4 = a3;
    self->_numberOfColumns = v4;
    p_updateFlags = &self->super._updateFlags;
    needsUpdate = self->super._updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->super._updateFlags.isPerformingUpdate)
      {
LABEL_13:
        p_updateFlags->needsUpdate = needsUpdate | 7;
        return;
      }
LABEL_12:
      if ((self->super._updateFlags.updated & 7) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXEditorialTungstenLayout setNumberOfColumns:]");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("PXEditorialTungstenLayout.m"), 57, CFSTR("invalidating %lu after it already has been updated"), 7);

        abort();
      }
      goto LABEL_13;
    }
    if (self->super._updateFlags.isPerformingUpdate)
      goto LABEL_12;
    willPerformUpdate = self->super._updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 7;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (id)diagnosticDescription
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXEditorialTungstenLayout;
  -[PXGGeneratedLayout diagnosticDescription](&v6, sel_diagnosticDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("; numberOfColumns: %li"),
    -[PXEditorialTungstenLayout numberOfColumns](self, "numberOfColumns"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)numberOfColumns
{
  return self->_numberOfColumns;
}

id __41__PXEditorialTungstenLayout_newGenerator__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_inputItemAtIndex:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
