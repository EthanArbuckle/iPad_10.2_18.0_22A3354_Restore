@implementation PRUISSwitcherSceneClientSettingsDiffInspector

+ (id)diffInspectorForObservingDiffContext
{
  id v2;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(v2, "observeSwitcherLayoutModeWithBlock:", &__block_literal_global_7);
  objc_msgSend(v2, "observeSwitcherContextIDWithBlock:", &__block_literal_global_1);
  objc_msgSend(v2, "observePrimaryPosterScaleWithBlock:", &__block_literal_global_2_0);
  objc_msgSend(v2, "observePrimaryPosterOffsetWithBlock:", &__block_literal_global_3);
  return v2;
}

void __85__PRUISSwitcherSceneClientSettingsDiffInspector_diffInspectorForObservingDiffContext__block_invoke(uint64_t a1, _BYTE *a2)
{
  *a2 |= 1u;
}

void __85__PRUISSwitcherSceneClientSettingsDiffInspector_diffInspectorForObservingDiffContext__block_invoke_2(uint64_t a1, _BYTE *a2)
{
  *a2 |= 2u;
}

void __85__PRUISSwitcherSceneClientSettingsDiffInspector_diffInspectorForObservingDiffContext__block_invoke_3(uint64_t a1, _BYTE *a2)
{
  *a2 |= 4u;
}

void __85__PRUISSwitcherSceneClientSettingsDiffInspector_diffInspectorForObservingDiffContext__block_invoke_4(uint64_t a1, _BYTE *a2)
{
  *a2 |= 8u;
}

- (void)observeSwitcherLayoutModeWithBlock:(id)a3
{
  -[PRUISSwitcherSceneClientSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 25612, a3);
}

- (void)observeSwitcherContextIDWithBlock:(id)a3
{
  -[PRUISSwitcherSceneClientSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 25613, a3);
}

- (void)observePrimaryPosterScaleWithBlock:(id)a3
{
  -[PRUISSwitcherSceneClientSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 25614, a3);
}

- (void)observePrimaryPosterOffsetWithBlock:(id)a3
{
  -[PRUISSwitcherSceneClientSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 25615, a3);
}

- (void)_observeOtherSetting:(unint64_t)a3 withBlock:(id)a4
{
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __80__PRUISSwitcherSceneClientSettingsDiffInspector__observeOtherSetting_withBlock___block_invoke;
    v8[3] = &unk_2515354A8;
    v9 = v6;
    -[FBSSettingsDiffInspector observeOtherSetting:withBlock:](self, "observeOtherSetting:withBlock:", a3, v8);

  }
}

uint64_t __80__PRUISSwitcherSceneClientSettingsDiffInspector__observeOtherSetting_withBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
