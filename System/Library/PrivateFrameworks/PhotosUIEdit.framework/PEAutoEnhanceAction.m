@implementation PEAutoEnhanceAction

- (void)applyToLoadResult:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  objc_msgSend(a3, "compositionController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __52__PEAutoEnhanceAction_applyToLoadResult_completion___block_invoke;
  v8[3] = &unk_24C618E88;
  v9 = v5;
  v7 = v5;
  +[PEAutoEnhanceActionHelper applyAutoEnhance:replacesAffectedAdjustments:useCompositionIntensity:completion:](PEAutoEnhanceActionHelper, "applyAutoEnhance:replacesAffectedAdjustments:useCompositionIntensity:completion:", v6, 1, 0, v8);

}

- (int64_t)actionType
{
  return 5;
}

uint64_t __52__PEAutoEnhanceAction_applyToLoadResult_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
