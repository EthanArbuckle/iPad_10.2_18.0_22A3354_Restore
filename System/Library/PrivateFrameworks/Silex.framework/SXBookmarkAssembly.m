@implementation SXBookmarkAssembly

- (void)loadInRegistry:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  v3 = a3;
  objc_msgSend(v3, "publicContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerProtocol:factory:", &unk_254F2FB38, &__block_literal_global_19);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "withConfiguration:", &__block_literal_global_3);

  objc_msgSend(v3, "publicContainer");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v7 = (id)objc_msgSend(v8, "registerClass:factory:", objc_opt_class(), &__block_literal_global_7_0);
}

SXBookmarkManager *__37__SXBookmarkAssembly_loadInRegistry___block_invoke()
{
  return objc_alloc_init(SXBookmarkManager);
}

void __37__SXBookmarkAssembly_loadInRegistry___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  v5 = a2;
  objc_msgSend(v5, "resolveClass:", objc_opt_class());
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "registerApplicator:bookmarkType:", v6, objc_opt_class());
}

SXComponentBookmarkApplicator *__37__SXBookmarkAssembly_loadInRegistry___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  SXComponentBookmarkApplicator *v3;
  void *v4;
  SXComponentBookmarkApplicator *v5;

  v2 = a2;
  v3 = [SXComponentBookmarkApplicator alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F00368);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[SXComponentBookmarkApplicator initWithScrollPositionRestoring:](v3, "initWithScrollPositionRestoring:", v4);
  return v5;
}

@end
