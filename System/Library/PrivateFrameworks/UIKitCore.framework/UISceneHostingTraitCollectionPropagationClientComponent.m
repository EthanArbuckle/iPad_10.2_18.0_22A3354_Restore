@implementation UISceneHostingTraitCollectionPropagationClientComponent

void __106___UISceneHostingTraitCollectionPropagationClientComponent_modifiedTraitCollectionForHostTraitCollection___block_invoke(uint64_t a1, void *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  v2 = dyld_program_sdk_at_least();
  v3 = -1;
  if (v2 && UIApp)
    v3 = objc_msgSend((id)UIApp, "userInterfaceLayoutDirection", -1);
  objc_msgSend(v6, "setLayoutDirection:", v3);
  v4 = objc_msgSend((id)UIApp, "_effectiveUserInterfaceStyle");
  if (v4)
    objc_msgSend(v6, "setUserInterfaceStyle:", v4);
  objc_msgSend(v6, "_tintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v6, "_setTintColor:", 0);

}

@end
