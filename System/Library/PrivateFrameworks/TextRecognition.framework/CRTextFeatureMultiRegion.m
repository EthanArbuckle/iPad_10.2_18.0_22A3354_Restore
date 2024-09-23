@implementation CRTextFeatureMultiRegion

- (CRTextFeatureMultiRegion)initWithOrderedFeatures:(id)a3
{
  id v4;
  CRTextFeatureMultiRegion *v5;
  CRTextFeatureMultiRegion *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _BYTE v30[128];
  uint64_t v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CRTextFeatureMultiRegion;
  v5 = -[CRTextFeature init](&v29, sel_init);
  v6 = v5;
  if (v5)
  {
    -[CRTextFeature setSubFeatures:](v5, "setSubFeatures:", v4);
    -[CRTextFeature setBounds:](v6, "setBounds:", *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[CRTextFeature subFeatures](v6, "subFeatures", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v26;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v26 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v10);
          -[CRTextFeature bounds](v6, "bounds");
          v13 = v12;
          v15 = v14;
          v17 = v16;
          v19 = v18;
          objc_msgSend(v11, "bounds");
          v34.origin.x = v20;
          v34.origin.y = v21;
          v34.size.width = v22;
          v34.size.height = v23;
          v32.origin.x = v13;
          v32.origin.y = v15;
          v32.size.width = v17;
          v32.size.height = v19;
          v33 = CGRectUnion(v32, v34);
          -[CRTextFeature setBounds:](v6, "setBounds:", v33.origin.x, v33.origin.y, v33.size.width, v33.size.height);
          objc_msgSend(v11, "setShouldExpandToFullWidth:", 0);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v8);
    }

  }
  return v6;
}

@end
