@implementation SADyldInfo

- (id)initWithTask:(id *)a1
{
  id v4;
  id *v5;
  objc_super v7;

  v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)SADyldInfo;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5)
      objc_storeStrong(v5 + 2, a2);
  }

  return a1;
}

- (id)debugDescription
{
  id v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SATask debugDescription](self->_task, "debugDescription");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (self->_isSharedCache)
    v6 = CFSTR(" (shared cache)");
  else
    v6 = &stru_1E714A250;
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ DYLD info %@@0x%llx id:0x%llx %@%@ (dyld complete:%d, path complete:%d)"), v4, *(_OWORD *)&self->_uuid, self->_stringID, self->_path, v6, self->_dyldInfoIsComplete, self->_pathIsComplete);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_task, 0);
}

@end
