@implementation _UIResponder_Override_Host_Entry

+ (id)entryWithResponder:(id)a3 forType:(int64_t)a4
{
  id v5;
  uint64_t v6;
  _QWORD *v7;

  v5 = a3;
  v6 = objc_opt_new();
  v7 = (_QWORD *)v6;
  if (v6)
  {
    objc_storeWeak((id *)(v6 + 8), v5);
    v7[2] = a4;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t WeakRetained;
  unint64_t v4;

  WeakRetained = (unint64_t)objc_loadWeakRetained((id *)&self->_overridden);
  v4 = self->_type ^ WeakRetained;

  return v4;
}

- (id)description
{
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  WeakRetained = objc_loadWeakRetained((id *)&self->_overridden);
  NSStringFrom_UI_UIResponder_Override_Type(self->_type);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ = %@>"), WeakRetained, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (UIResponder)overridden
{
  return (UIResponder *)objc_loadWeakRetained((id *)&self->_overridden);
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_overridden);
}

@end
