@implementation _UICollectionViewDragSourceControllerSessionState

- (id)description
{
  void *v3;
  objc_class *v4;
  uint64_t v5;
  void *v6;
  UIDragSession *dragSession;
  _BOOL8 v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (self)
  {
    dragSession = self->_dragSession;
    v8 = dragSession != 0;
  }
  else
  {
    v8 = 0;
    dragSession = 0;
  }
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p isActive = %d; dragSession = %@>"), v5, self, v8, dragSession);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragSession, 0);
}

@end
