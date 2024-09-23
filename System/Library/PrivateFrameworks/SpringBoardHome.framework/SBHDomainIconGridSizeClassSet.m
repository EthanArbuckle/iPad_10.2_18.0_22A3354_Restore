@implementation SBHDomainIconGridSizeClassSet

- (SBHDomainIconGridSizeClassSet)initWithGridSizeClassDomain:(id)a3
{
  return -[SBHDomainIconGridSizeClassSet initWithGridSizeClassDomain:filter:](self, "initWithGridSizeClassDomain:filter:", a3, 0);
}

- (SBHDomainIconGridSizeClassSet)initWithGridSizeClassDomain:(id)a3 filter:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  SBHDomainIconGridSizeClassSet *v11;
  uint64_t v12;
  id filter;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)SBHDomainIconGridSizeClassSet;
  v11 = -[SBHIconGridSizeClassSet initWithGridSizeClasses:gridSizeClassGroups:](&v15, sel_initWithGridSizeClasses_gridSizeClassGroups_, v9, v10);

  if (v11)
  {
    objc_storeStrong((id *)&v11->_gridSizeClassDomain, a3);
    v12 = objc_msgSend(v8, "copy");
    filter = v11->_filter;
    v11->_filter = (id)v12;

  }
  return v11;
}

- (id)gridSizeClasses
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;

  -[SBHDomainIconGridSizeClassSet gridSizeClassDomain](self, "gridSizeClassDomain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHDomainIconGridSizeClassSet filter](self, "filter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48__SBHDomainIconGridSizeClassSet_gridSizeClasses__block_invoke;
  v11[3] = &unk_1E8D89120;
  v13 = v4;
  v6 = v5;
  v12 = v6;
  v7 = v4;
  objc_msgSend(v3, "enumerateGridSizeClassesUsingBlock:", v11);
  v8 = v12;
  v9 = v6;

  return v9;
}

void __48__SBHDomainIconGridSizeClassSet_gridSizeClasses__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  id v6;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  v6 = v3;
  if (!v4 || (v5 = (*(uint64_t (**)(uint64_t, id))(v4 + 16))(v4, v3), v3 = v6, v5))
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v6;
  }

}

- (id)gridSizeClassGroups
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (BOOL)containsGridSizeClass:(id)a3 inDomain:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  char v10;

  v6 = a3;
  v7 = a4;
  -[SBHDomainIconGridSizeClassSet filter](self, "filter");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8 && !(*(unsigned int (**)(uint64_t, id))(v8 + 16))(v8, v6))
    v10 = 0;
  else
    v10 = objc_msgSend(v7, "containsGridSizeClass:", v6);

  return v10;
}

- (SBHIconGridSizeClassDomain)gridSizeClassDomain
{
  return self->_gridSizeClassDomain;
}

- (id)filter
{
  return self->_filter;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_filter, 0);
  objc_storeStrong((id *)&self->_gridSizeClassDomain, 0);
}

@end
