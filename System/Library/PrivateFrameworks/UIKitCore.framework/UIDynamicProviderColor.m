@implementation UIDynamicProviderColor

- (void).cxx_destruct
{
  objc_storeStrong(&self->_provider, 0);
}

- (unint64_t)hash
{
  return objc_msgSend(self->_provider, "hash");
}

- (UIDynamicProviderColor)initWithProvider:(id)a3
{
  id v4;
  UIDynamicProviderColor *v5;
  uint64_t v6;
  id provider;
  UIDynamicProviderColor *v8;
  objc_super v10;

  v4 = a3;
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)UIDynamicProviderColor;
    v5 = -[UIDynamicProviderColor init](&v10, sel_init);
    if (v5)
    {
      v6 = objc_msgSend(v4, "copy");
      provider = v5->_provider;
      v5->_provider = (id)v6;

    }
    self = v5;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_resolvedColorWithTraitCollection:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v9;

  v5 = a3;
  +[UITraitCollection _currentTraitCollectionIfExists]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITraitCollection setCurrentTraitCollection:](UITraitCollection, "setCurrentTraitCollection:", v5);
  (*((void (**)(void))self->_provider + 2))();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITraitCollection setCurrentTraitCollection:](UITraitCollection, "setCurrentTraitCollection:", v6);
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIColor.m"), 5116, CFSTR("Dynamic color provider must return a non-nil color. %@ resolved with %@"), self, v5);

  }
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  UIDynamicProviderColor *v4;
  BOOL v5;

  v4 = (UIDynamicProviderColor *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && v4->_provider == self->_provider;
  }

  return v5;
}

- (id)replacementObjectForCoder:(id)a3
{
  void *v3;
  unint64_t v4;
  _BOOL4 v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v26;
  char v27;
  void *v29;
  char v30;
  int v31;
  char v32;
  id v33;
  char v34;
  char v36;
  _BOOL4 v37;

  v33 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  v32 = v4;
  v6 = v4 < 2 || v4 - 5 < 6;
  v37 = v6;
  +[UITraitCollection _currentTraitCollectionIfExists]();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  v7 = 0;
  v8 = 1;
  do
  {
    v36 = 0;
    v9 = *((_QWORD *)&xmmword_1866691E0 + v7);
    v27 = v8;
    if ((v8 & 1) != 0)
      v10 = 0;
    else
      v10 = *((_QWORD *)&xmmword_1866691E0 + v7);
    v11 = 1;
    do
    {
      v12 = 0;
      v30 = v11;
      v13 = 1;
      do
      {
        v31 = v13;
        v14 = 0;
        v15 = *((_QWORD *)&xmmword_1866794A0 + v12);
        v16 = 1;
        do
        {
          v17 = *((_QWORD *)&xmmword_1866794A0 + v14);
          _UIThemeKeyFromTraitValues(v32, v9, v36 & 1, v15, v17, 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_self();
          _UITraitCollectionFromThemeKey(v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          +[UITraitCollection setCurrentTraitCollection:](UITraitCollection, "setCurrentTraitCollection:", v19);
          (*((void (**)(void))self->_provider + 2))();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v20)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIColor.m"), 5067, CFSTR("Dynamic color provider must return a non-nil color"));

          }
          _UIThemeKeyFromTraitValues(-1, v10, v36 & 1, v15, v17, 0);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_self();
          _UITraitCollectionFromThemeKey(v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setObject:forKey:", v20, v22);

          v23 = v37 & v34 & v16;
          v14 = 1;
          v16 = 0;
        }
        while ((v23 & 1) != 0);
        v12 = 1;
        v13 = 0;
      }
      while ((v37 & v31 & 1) != 0);
      v11 = 0;
      v36 = 1;
    }
    while ((v30 & 1) != 0);
    v8 = 0;
    v34 = 1;
    v7 = 1;
  }
  while ((v27 & 1) != 0);
  +[UITraitCollection setCurrentTraitCollection:](UITraitCollection, "setCurrentTraitCollection:", v26);
  +[UIColor _dynamicColorWithColorsByTraitCollection:](UIColor, "_dynamicColorWithColorsByTraitCollection:", v33);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = _Block_copy(self->_provider);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; provider = %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
