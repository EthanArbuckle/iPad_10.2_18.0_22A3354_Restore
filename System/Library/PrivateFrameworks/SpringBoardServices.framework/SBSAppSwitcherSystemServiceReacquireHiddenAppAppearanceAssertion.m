@implementation SBSAppSwitcherSystemServiceReacquireHiddenAppAppearanceAssertion

void ____SBSAppSwitcherSystemServiceReacquireHiddenAppAppearanceAssertion_block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id WeakRetained;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && v6)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = ____SBSAppSwitcherSystemServiceReacquireHiddenAppAppearanceAssertion_block_invoke_2;
    v14[3] = &unk_1E288E1D8;
    v15 = a1[4];
    objc_msgSend(v5, "addHandler:forDeathOfServerPort:", v14, v7);
    WeakRetained = v15;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained(a1 + 6);
    if (objc_msgSend(WeakRetained, "isValid"))
    {
      objc_msgSend(a1[5], "client");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = a1[4];
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = ____SBSAppSwitcherSystemServiceReacquireHiddenAppAppearanceAssertion_block_invoke_3;
      v11[3] = &unk_1E288E200;
      v12 = v10;
      objc_copyWeak(&v13, a1 + 6);
      objc_msgSend(v9, "requestAppSwitcherAppearanceForHiddenApplicationWithBundleIdentifier:reacquiringExistingAssertion:completion:", v12, WeakRetained, v11);

      objc_destroyWeak(&v13);
    }
  }

}

uint64_t ____SBSAppSwitcherSystemServiceReacquireHiddenAppAppearanceAssertion_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return __SBSAppSwitcherSystemServiceReacquireHiddenAppAppearanceAssertion(a2, *(_QWORD *)(a1 + 32));
}

void ____SBSAppSwitcherSystemServiceReacquireHiddenAppAppearanceAssertion_block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id WeakRetained;
  _QWORD v6[4];
  id v7;

  if (a2 && a3)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = ____SBSAppSwitcherSystemServiceReacquireHiddenAppAppearanceAssertion_block_invoke_4;
    v6[3] = &unk_1E288E1D8;
    v7 = *(id *)(a1 + 32);
    objc_msgSend(a2, "addHandler:forDeathOfServerPort:", v6, a3);

  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "invalidate");

  }
}

uint64_t ____SBSAppSwitcherSystemServiceReacquireHiddenAppAppearanceAssertion_block_invoke_4(uint64_t a1, uint64_t a2)
{
  return __SBSAppSwitcherSystemServiceReacquireHiddenAppAppearanceAssertion(a2, *(_QWORD *)(a1 + 32));
}

@end
