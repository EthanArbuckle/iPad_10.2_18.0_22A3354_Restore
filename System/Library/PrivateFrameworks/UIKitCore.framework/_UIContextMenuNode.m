@implementation _UIContextMenuNode

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuNode listView](self, "listView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  objc_msgSend(v3, "appendFormat:", CFSTR("; rect = (%g %g; %g %g)"), v6, v8, v10, v12);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (_UIContextMenuListView)listView
{
  return self->_listView;
}

- (void)setListView:(id)a3
{
  objc_storeStrong((id *)&self->_listView, a3);
}

- (UIMenu)menu
{
  return self->_menu;
}

- (void)setMenu:(id)a3
{
  objc_storeStrong((id *)&self->_menu, a3);
}

- (_UIContextMenuNode)previous
{
  return (_UIContextMenuNode *)objc_loadWeakRetained((id *)&self->_previous);
}

- (void)setPrevious:(id)a3
{
  objc_storeWeak((id *)&self->_previous, a3);
}

- (_UIContextMenuNode)next
{
  return (_UIContextMenuNode *)objc_loadWeakRetained((id *)&self->_next);
}

- (void)setNext:(id)a3
{
  objc_storeWeak((id *)&self->_next, a3);
}

- (BOOL)leftOfParentWhenCascading
{
  return self->_leftOfParentWhenCascading;
}

- (void)setLeftOfParentWhenCascading:(BOOL)a3
{
  self->_leftOfParentWhenCascading = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_next);
  objc_destroyWeak((id *)&self->_previous);
  objc_storeStrong((id *)&self->_menu, 0);
  objc_storeStrong((id *)&self->_listView, 0);
}

@end
