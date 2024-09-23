@implementation ISPlayerItemChefOperation

void __48___ISPlayerItemChefOperation__preparePlayerItem__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  _OWORD v8[3];
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "preferredTransform");
  }
  else
  {
    v10 = 0u;
    v11 = 0u;
    v9 = 0u;
  }
  v8[0] = v9;
  v8[1] = v10;
  v8[2] = v11;
  objc_msgSend(v5, "setPreferredTransform:", v8);

}

void __48___ISPlayerItemChefOperation__preparePlayerItem__block_invoke_56()
{
  void *v0;

  v0 = (void *)_preparePlayerItem_InterpolationCurveControlPoints;
  _preparePlayerItem_InterpolationCurveControlPoints = (uint64_t)&unk_1E945FFA8;

}

uint64_t __50___ISPlayerItemChefOperation__handleValuesDidLoad__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_preparePlayerItem");
}

void __34___ISPlayerItemChefOperation_main__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleValuesDidLoad");

}

@end
