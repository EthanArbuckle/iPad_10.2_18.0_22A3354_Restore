@implementation FBSSceneSettingsDiff(PosterUIFoundation)

- (uint64_t)pui_posterContentDidChange
{
  return objc_msgSend(a1, "pui_inspect:", 20467);
}

- (uint64_t)pui_inspect:()PosterUIFoundation
{
  uint64_t v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  if (pui_inspect__onceToken != -1)
    dispatch_once(&pui_inspect__onceToken, &__block_literal_global);
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__FBSSceneSettingsDiff_PosterUIFoundation__pui_inspect___block_invoke_2;
  v7[3] = &unk_25154BA08;
  v7[4] = &v8;
  objc_msgSend((id)pui_inspect__inspector, "observeOtherSetting:withBlock:", a3, v7);
  objc_msgSend((id)pui_inspect__inspector, "inspectDiff:withContext:", a1, 0);
  objc_msgSend((id)pui_inspect__inspector, "removeAllObservers");
  v5 = *((unsigned __int8 *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

@end
