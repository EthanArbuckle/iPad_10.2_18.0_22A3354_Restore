@implementation UICollectionViewLayout(PhotosUI)

- (id)pu_layoutAttributesForElementClosestToPoint:()PhotosUI inRect:passingTest:
{
  unsigned int (**v14)(id, void *);
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  double v20;
  uint64_t i;
  void *v22;
  double v23;
  double v24;
  id v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v14 = a9;
  objc_msgSend(a1, "layoutAttributesForElementsInRect:", a4, a5, a6, a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v16)
  {
    v17 = v16;
    v18 = 0;
    v19 = *(_QWORD *)v28;
    v20 = 1.79769313e308;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v28 != v19)
          objc_enumerationMutation(v15);
        v22 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        if ((objc_msgSend(v22, "isHidden") & 1) == 0)
        {
          objc_msgSend(v22, "frame");
          UIDistanceBetweenPointAndRect();
          if (v23 < v20)
          {
            v24 = v23;
            if (v14[2](v14, v22))
            {
              v25 = v22;

              v20 = v24;
              v18 = v25;
            }
          }
        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v17);
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

@end
