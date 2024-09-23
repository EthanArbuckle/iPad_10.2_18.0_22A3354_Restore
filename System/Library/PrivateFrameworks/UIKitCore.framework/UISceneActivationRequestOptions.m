@implementation UISceneActivationRequestOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestingScene, 0);
}

- (int64_t)_collectionJoinBehavior
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[UISceneActivationRequestOptions requestingScene](self, "requestingScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRequestingScene:", v5);

  objc_msgSend(v4, "setPreserveLayout:", -[UISceneActivationRequestOptions preserveLayout](self, "preserveLayout"));
  objc_msgSend(v4, "_setRequestFullscreen:", -[UISceneActivationRequestOptions _requestFullscreen](self, "_requestFullscreen"));
  return v4;
}

- (NSString)debugDescription
{
  return (NSString *)-[UISceneActivationRequestOptions debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[UISceneActivationRequestOptions succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  UISceneActivationRequestOptions *v11;

  v4 = a3;
  -[UISceneActivationRequestOptions succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActiveMultilinePrefix:", v4);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73__UISceneActivationRequestOptions_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E16B1B50;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", &stru_1E16EDF20, v4, v9);

  v7 = v6;
  return v7;
}

void __73__UISceneActivationRequestOptions_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "requestingScene");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v1, "appendObject:withName:skipIfNil:", v3, CFSTR("requestingScene"), 1);

}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[UISceneActivationRequestOptions descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[UISceneActivationRequestOptions descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (UIScene)requestingScene
{
  return self->_requestingScene;
}

- (void)setRequestingScene:(UIScene *)requestingScene
{
  objc_storeStrong((id *)&self->_requestingScene, requestingScene);
}

- (UISceneCollectionJoinBehavior)collectionJoinBehavior
{
  return self->_collectionJoinBehavior;
}

- (void)setCollectionJoinBehavior:(UISceneCollectionJoinBehavior)collectionJoinBehavior
{
  self->_collectionJoinBehavior = collectionJoinBehavior;
}

- (BOOL)preserveLayout
{
  return self->_preserveLayout;
}

- (void)setPreserveLayout:(BOOL)a3
{
  self->_preserveLayout = a3;
}

- (BOOL)_requestFullscreen
{
  return self->__requestFullscreen;
}

- (void)_setRequestFullscreen:(BOOL)a3
{
  self->__requestFullscreen = a3;
}

@end
