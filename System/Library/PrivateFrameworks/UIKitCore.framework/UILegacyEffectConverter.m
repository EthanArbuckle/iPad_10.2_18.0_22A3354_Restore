@implementation UILegacyEffectConverter

void __43___UILegacyEffectConverter_sharedConverter__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_MergedGlobals_953;
  _MergedGlobals_953 = v0;

}

uint64_t __67___UILegacyEffectConverter_applyVibrancyConfig_toEffectDescriptor___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addFilterEntry:", a2);
}

uint64_t __67___UILegacyEffectConverter_applyVibrancyConfig_toEffectDescriptor___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addViewEffect:", a2);
}

void __67___UILegacyEffectConverter_applyVibrancyConfig_toEffectDescriptor___block_invoke_3(_QWORD *a1, void *a2)
{
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[6];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67___UILegacyEffectConverter_applyVibrancyConfig_toEffectDescriptor___block_invoke_4;
  v7[3] = &unk_1E16B5440;
  v4 = (void *)a1[5];
  v3 = a1[6];
  v7[4] = a1[4];
  v7[5] = v3;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67___UILegacyEffectConverter_applyVibrancyConfig_toEffectDescriptor___block_invoke_5;
  v5[3] = &unk_1E16B5418;
  v6 = v4;
  _UILegacyEffectConvertLayerConfig(a2, v7, v5);

}

void __67___UILegacyEffectConverter_applyVibrancyConfig_toEffectDescriptor___block_invoke_4(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("_UILegacyEffectSupport.m"), 165, CFSTR("Filter effects are not supported on underlay layer configs"));

}

uint64_t __67___UILegacyEffectConverter_applyVibrancyConfig_toEffectDescriptor___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addUnderlay:", a2);
}

@end
