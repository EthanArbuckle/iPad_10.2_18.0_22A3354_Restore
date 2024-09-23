@implementation PXSortOrderState

- (PXSortOrderState)initWithSortOrder:(unint64_t)a3
{
  PXSortOrderState *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXSortOrderState;
  result = -[PXSortOrderState init](&v5, sel_init);
  if (result)
    result->_sortOrder = a3;
  return result;
}

- (void)setSortOrder:(unint64_t)a3
{
  if (self->_sortOrder != a3)
  {
    self->_sortOrder = a3;
    -[PXSortOrderState signalChange:](self, "signalChange:", 1);
  }
}

- (void)enumeratePossibleSortOrdersUsingBlock:(id)a3
{
  id v4;
  unint64_t v5;
  id v6;
  void (**v7)(void *, uint64_t);
  _QWORD v8[4];
  id v9;
  unint64_t v10;

  v4 = a3;
  v5 = -[PXSortOrderState sortOrder](self, "sortOrder");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__PXSortOrderState_enumeratePossibleSortOrdersUsingBlock___block_invoke;
  v8[3] = &unk_1E5133A58;
  v9 = v4;
  v10 = v5;
  v6 = v4;
  v7 = (void (**)(void *, uint64_t))_Block_copy(v8);
  v7[2](v7, 2);
  v7[2](v7, 1);

}

- (unint64_t)sortOrder
{
  return self->_sortOrder;
}

uint64_t __58__PXSortOrderState_enumeratePossibleSortOrdersUsingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, *(_QWORD *)(a1 + 40) == a2);
}

@end
