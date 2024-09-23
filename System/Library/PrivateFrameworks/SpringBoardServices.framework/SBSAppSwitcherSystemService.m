@implementation SBSAppSwitcherSystemService

- (void)requestAppSwitcherAppearanceForHiddenApplicationWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[SBSAbstractSystemService client](self, "client");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __111__SBSAppSwitcherSystemService_requestAppSwitcherAppearanceForHiddenApplicationWithBundleIdentifier_completion___block_invoke;
  v11[3] = &unk_1E288E250;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "requestAppSwitcherAppearanceForHiddenApplicationWithBundleIdentifier:reacquiringExistingAssertion:completion:", v10, 0, v11);

}

void __111__SBSAppSwitcherSystemService_requestAppSwitcherAppearanceForHiddenApplicationWithBundleIdentifier_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  _QWORD v6[4];
  id v7;

  v5 = a2;
  if (v5 && a3)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __111__SBSAppSwitcherSystemService_requestAppSwitcherAppearanceForHiddenApplicationWithBundleIdentifier_completion___block_invoke_2;
    v6[3] = &unk_1E288E1D8;
    v7 = *(id *)(a1 + 32);
    objc_msgSend(v5, "addHandler:forDeathOfServerPort:", v6, a3);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __111__SBSAppSwitcherSystemService_requestAppSwitcherAppearanceForHiddenApplicationWithBundleIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  __SBSAppSwitcherSystemServiceReacquireHiddenAppAppearanceAssertion(a2, *(void **)(a1 + 32));
}

@end
