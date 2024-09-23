@implementation PRUISSwitcherSceneSettingsDiffInspector

+ (id)diffInspectorForObservingDiffContext
{
  id v2;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(v2, "observePreferredSwitcherLayoutModeWithBlock:", &__block_literal_global_8);
  objc_msgSend(v2, "observeLockPosterOverlayLayerWithBlock:", &__block_literal_global_1_0);
  objc_msgSend(v2, "observeLockPosterLiveContentLayerWithBlock:", &__block_literal_global_2_1);
  objc_msgSend(v2, "observeLockPosterLiveFloatingLayerWithBlock:", &__block_literal_global_3_0);
  objc_msgSend(v2, "observeLockPosterFloatingLayerInlinedWithBlock:", &__block_literal_global_4);
  objc_msgSend(v2, "observeLockPosterComplicationRowHiddenWithBlock:", &__block_literal_global_5);
  objc_msgSend(v2, "observeLeadingTopButtonFrameWithBlock:", &__block_literal_global_6);
  objc_msgSend(v2, "observeTrailingTopButtonFrameWithBlock:", &__block_literal_global_7);
  objc_msgSend(v2, "observeVibrancyConfigurationWithBlock:", &__block_literal_global_8);
  return v2;
}

void __79__PRUISSwitcherSceneSettingsDiffInspector_diffInspectorForObservingDiffContext__block_invoke(uint64_t a1, _WORD *a2)
{
  *a2 |= 1u;
}

void __79__PRUISSwitcherSceneSettingsDiffInspector_diffInspectorForObservingDiffContext__block_invoke_2(uint64_t a1, _WORD *a2)
{
  *a2 |= 2u;
}

void __79__PRUISSwitcherSceneSettingsDiffInspector_diffInspectorForObservingDiffContext__block_invoke_3(uint64_t a1, _WORD *a2)
{
  *a2 |= 4u;
}

void __79__PRUISSwitcherSceneSettingsDiffInspector_diffInspectorForObservingDiffContext__block_invoke_4(uint64_t a1, _WORD *a2)
{
  *a2 |= 8u;
}

void __79__PRUISSwitcherSceneSettingsDiffInspector_diffInspectorForObservingDiffContext__block_invoke_5(uint64_t a1, _WORD *a2)
{
  *a2 |= 0x10u;
}

void __79__PRUISSwitcherSceneSettingsDiffInspector_diffInspectorForObservingDiffContext__block_invoke_6(uint64_t a1, _WORD *a2)
{
  *a2 |= 0x20u;
}

void __79__PRUISSwitcherSceneSettingsDiffInspector_diffInspectorForObservingDiffContext__block_invoke_7(uint64_t a1, _WORD *a2)
{
  *a2 |= 0x40u;
}

void __79__PRUISSwitcherSceneSettingsDiffInspector_diffInspectorForObservingDiffContext__block_invoke_8(uint64_t a1, _WORD *a2)
{
  *a2 |= 0x80u;
}

void __79__PRUISSwitcherSceneSettingsDiffInspector_diffInspectorForObservingDiffContext__block_invoke_9(uint64_t a1, _WORD *a2)
{
  *a2 |= 0x100u;
}

- (void)observePreferredSwitcherLayoutModeWithBlock:(id)a3
{
  -[PRUISSwitcherSceneSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 25562, a3);
}

- (void)observeLockPosterOverlayLayerWithBlock:(id)a3
{
  id v4;

  v4 = a3;
  -[PRUISSwitcherSceneSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 25563, v4);
  -[PRUISSwitcherSceneSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 25564, v4);

}

- (void)observeLockPosterLiveContentLayerWithBlock:(id)a3
{
  id v4;

  v4 = a3;
  -[PRUISSwitcherSceneSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 25565, v4);
  -[PRUISSwitcherSceneSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 25566, v4);

}

- (void)observeLockPosterLiveFloatingLayerWithBlock:(id)a3
{
  id v4;

  v4 = a3;
  -[PRUISSwitcherSceneSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 25567, v4);
  -[PRUISSwitcherSceneSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 25568, v4);

}

- (void)observeLockPosterFloatingLayerInlinedWithBlock:(id)a3
{
  -[PRUISSwitcherSceneSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 25569, a3);
}

- (void)observeLockPosterComplicationRowHiddenWithBlock:(id)a3
{
  -[PRUISSwitcherSceneSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 25570, a3);
}

- (void)observeLeadingTopButtonFrameWithBlock:(id)a3
{
  -[PRUISSwitcherSceneSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 25571, a3);
}

- (void)observeTrailingTopButtonFrameWithBlock:(id)a3
{
  -[PRUISSwitcherSceneSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 25572, a3);
}

- (void)observeVibrancyConfigurationWithBlock:(id)a3
{
  -[PRUISSwitcherSceneSettingsDiffInspector _observeOtherSetting:withBlock:](self, "_observeOtherSetting:withBlock:", 25573, a3);
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
    v8[2] = __74__PRUISSwitcherSceneSettingsDiffInspector__observeOtherSetting_withBlock___block_invoke;
    v8[3] = &unk_2515354A8;
    v9 = v6;
    -[FBSSettingsDiffInspector observeOtherSetting:withBlock:](self, "observeOtherSetting:withBlock:", a3, v8);

  }
}

uint64_t __74__PRUISSwitcherSceneSettingsDiffInspector__observeOtherSetting_withBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
