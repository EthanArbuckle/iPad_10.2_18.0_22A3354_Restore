@implementation FBSScene

id __61__FBSScene_UIApp__updateUIClientSettingsWithTransitionBlock___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v6;

  v3 = a2;
  if ((objc_msgSend(v3, "isUISubclass") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("FBSScene+UIApp.m"), 60, CFSTR("clientSettings is of an unexpected class : %@"), v3);

  }
  (*(void (**)(void))(a1[5] + 16))();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __51__FBSScene_UIApp__updateUIClientSettingsWithBlock___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_msgSend(v4, "isUISubclass") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("FBSScene+UIApp.m"), 49, CFSTR("clientSettings is of an unexpected class : %@"), v4);

  }
  (*(void (**)(void))(a1[5] + 16))();

}

uint64_t __51__FBSScene_UIApp__updateUIClientSettingsWithBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateUIClientSettingsWithBlock:", *(_QWORD *)(a1 + 40));
}

uint64_t __61__FBSScene_UIApp__updateUIClientSettingsWithTransitionBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateUIClientSettingsWithTransitionBlock:", *(_QWORD *)(a1 + 40));
}

@end
