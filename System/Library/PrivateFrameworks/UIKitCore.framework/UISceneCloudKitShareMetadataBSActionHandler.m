@implementation UISceneCloudKitShareMetadataBSActionHandler

id __119___UISceneCloudKitShareMetadataBSActionHandler__launchOptionsFromActions_forFBSScene_uiSceneSession_transitionContext___block_invoke(void **a1, uint64_t a2)
{
  void *v3;
  id result;

  v3 = *a1;
  if (v3)
    return (id)objc_msgSend(v3, "addObject:", a2);
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", a2);
  result = (id)objc_claimAutoreleasedReturnValue();
  *a1 = result;
  return result;
}

void __119___UISceneCloudKitShareMetadataBSActionHandler__launchOptionsFromActions_forFBSScene_uiSceneSession_transitionContext___block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (v10)
  {
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    if (v6)
    {
      objc_msgSend(v6, "setObject:forKey:", v10, v5);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", v10, v5);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

    }
  }

}

@end
