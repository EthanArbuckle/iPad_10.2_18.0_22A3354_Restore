@implementation PXPhotosGridTransitionAssetMapping

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionViews, 0);
  objc_storeStrong((id *)&self->_toRegions, 0);
  objc_storeStrong((id *)&self->_fromRegions, 0);
  objc_storeStrong((id *)&self->_assetReferences, 0);
}

- (void)enumerateTransitionAssetsUsingBlock:(id *)a1
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(id, void *, void *, void *, void *);

  v9 = a2;
  if (a1 && objc_msgSend(a1[1], "count"))
  {
    v3 = 0;
    do
    {
      objc_msgSend(a1[4], "objectAtIndexedSubscript:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4 != v5)
      {
        objc_msgSend(a1[1], "objectAtIndexedSubscript:", v3);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[2], "objectAtIndexedSubscript:", v3);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[3], "objectAtIndexedSubscript:", v3);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9[2](v9, v6, v7, v8, v4);

      }
      ++v3;
    }
    while (v3 < objc_msgSend(a1[1], "count"));
  }

}

@end
