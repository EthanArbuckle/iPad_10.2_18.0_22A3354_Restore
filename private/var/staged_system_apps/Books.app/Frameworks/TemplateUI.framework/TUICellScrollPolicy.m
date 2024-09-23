@implementation TUICellScrollPolicy

- (TUICellScrollPolicy)initWithCells:(const void *)a3
{
  TUICellScrollPolicy *v4;
  vector<TUI::Layout::CellInfo, std::allocator<TUI::Layout::CellInfo>> *p_cells;
  BOOL v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TUICellScrollPolicy;
  v4 = -[TUICellScrollPolicy init](&v8, "init");
  p_cells = &v4->_cells;
  if (v4)
    v6 = p_cells == a3;
  else
    v6 = 1;
  if (!v6)
    sub_14D7DC((uint64_t)p_cells, *(_QWORD *)a3, *((_QWORD *)a3 + 1), 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 3));
  return v4;
}

- (id)newScrollableObserverInstanceWithView:(id)a3 host:(id)a4 uuid:(id)a5 uid:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _TUICellScrollObserver *v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = -[_TUICellScrollObserver initWithPolicy:view:host:uuid:uid:]([_TUICellScrollObserver alloc], "initWithPolicy:view:host:uuid:uid:", self, v10, v11, v12, v13);

  return v14;
}

- (const)cells
{
  return &self->_cells;
}

- (void).cxx_destruct
{
  vector<TUI::Layout::CellInfo, std::allocator<TUI::Layout::CellInfo>> *p_cells;

  p_cells = &self->_cells;
  sub_92A40((void ***)&p_cells);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
