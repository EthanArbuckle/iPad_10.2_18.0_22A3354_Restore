@implementation _UIResponder_Override

- (UIResponder)target
{
  return (UIResponder *)objc_loadWeakRetained((id *)&self->_target);
}

+ (id)overrideForResponder:(id)a3 withTarget:(id)a4 forType:(int64_t)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  id WeakRetained;
  void *v17;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "_currentOverrideClient");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 && (v11 = objc_loadWeakRetained((id *)(v9 + 16)), v11, v11 == v8))
  {
    if ((*(_QWORD *)(v10 + 24) & a5) == 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)(v10 + 16));
      objc_msgSend(WeakRetained, "_overrideHost");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "attachOverrider:forTypes:", v7, a5);

      *(_QWORD *)(v10 + 24) |= a5;
    }
  }
  else
  {
    v12 = objc_opt_new();

    if (v12)
    {
      objc_storeWeak((id *)(v12 + 8), v7);
      objc_storeWeak((id *)(v12 + 16), v8);
      *(_QWORD *)(v12 + 24) = a5;
      objc_msgSend(v8, "_overrideHost");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "attachOverrider:forTypes:", v7, a5);

    }
    v10 = v12;
  }
  v14 = (id)v10;

  return v14;
}

- (void)dealloc
{
  id WeakRetained;
  void *v4;
  id v5;
  objc_super v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_target);
  objc_msgSend(WeakRetained, "_overrideHost");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_loadWeakRetained((id *)&self->_owner);
  objc_msgSend(v4, "detachOverrider:forTypes:", v5, self->_types);

  v6.receiver = self;
  v6.super_class = (Class)_UIResponder_Override;
  -[_UIResponder_Override dealloc](&v6, sel_dealloc);
}

- (id)description
{
  void *v3;
  void *v4;
  id WeakRetained;
  id v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)_UIResponder_Override;
  -[_UIResponder_Override description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  v6 = objc_loadWeakRetained((id *)&self->_target);
  NSStringFrom_UI_UIResponder_Override_Type(self->_types);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@; owner=%@; target=%@; types=%@>"), v4, WeakRetained, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (UIResponder)owner
{
  return (UIResponder *)objc_loadWeakRetained((id *)&self->_owner);
}

- (int64_t)types
{
  return self->_types;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_target);
  objc_destroyWeak((id *)&self->_owner);
}

@end
