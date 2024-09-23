@implementation PUTileHider

- (PUTileHider)init
{
  return -[PUTileHider initWithTilingView:](self, "initWithTilingView:", 0);
}

- (PUTileHider)initWithTilingView:(id)a3
{
  id v5;
  PUTileHider *v6;
  PUTileHider *v7;
  uint64_t v8;
  NSMutableDictionary *hiddenTileControllersByLayoutInfo;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PUTileHider;
  v6 = -[PUTileHider init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_tilingView, a3);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    hiddenTileControllersByLayoutInfo = v7->__hiddenTileControllersByLayoutInfo;
    v7->__hiddenTileControllersByLayoutInfo = (NSMutableDictionary *)v8;

    v7->__animationDuration = 0.2;
  }

  return v7;
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (-[NSMutableDictionary count](self->__hiddenTileControllersByLayoutInfo, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTileHider.m"), 38, CFSTR("tile hider deallocated while tiles are still hidden %@"), self->__hiddenTileControllersByLayoutInfo);

  }
  v5.receiver = self;
  v5.super_class = (Class)PUTileHider;
  -[PUTileHider dealloc](&v5, sel_dealloc);
}

- (void)hideTilesAtIndexPath:(id)a3 withKinds:(id)a4 dataSourceIdentifier:(id)a5 animated:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  PUTileAnimationOptions *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  PUTileAnimationOptions *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v6 = a6;
  v33 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[PUTileHider tilingView](self, "tilingView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "tileAnimator");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTileHider _hiddenTileControllersByLayoutInfo](self, "_hiddenTileControllersByLayoutInfo");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v14 = objc_alloc_init(PUTileAnimationOptions);
    -[PUTileHider _animationDuration](self, "_animationDuration");
    v25 = v14;
    -[PUTileAnimationOptions setDuration:](v14, "setDuration:");
  }
  else
  {
    v25 = 0;
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v15 = v11;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v28;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v28 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(v13, "presentedTileControllerWithIndexPath:kind:dataSourceIdentifier:", v10, *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v19), v12);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          objc_msgSend(v13, "freezeTileController:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v20, "isDetached") & 1) == 0)
          {
            objc_msgSend(v24, "setObject:forKey:", v20, v21);
            v31 = v20;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "detachTileControllers:", v22);

          }
          objc_msgSend(v21, "layoutInfoWithAlpha:", 0.0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "animateTileController:toLayoutInfo:withOptions:completionHandler:", v20, v23, v25, 0);

        }
        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v17);
  }

}

- (void)unhideTilesAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  PUTileAnimationOptions *v7;
  id v8;
  PUTileAnimationOptions *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  PUTileAnimationOptions *v14;
  id v15;

  v3 = a3;
  -[PUTileHider tilingView](self, "tilingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tileAnimator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTileHider _hiddenTileControllersByLayoutInfo](self, "_hiddenTileControllersByLayoutInfo");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v7 = objc_alloc_init(PUTileAnimationOptions);
    -[PUTileHider _animationDuration](self, "_animationDuration");
    -[PUTileAnimationOptions setDuration:](v7, "setDuration:");
  }
  else
  {
    v7 = 0;
  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __35__PUTileHider_unhideTilesAnimated___block_invoke;
  v12[3] = &unk_1E58A8F38;
  v13 = v6;
  v14 = v7;
  v15 = v5;
  v8 = v5;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v12);
  objc_msgSend(v11, "removeAllObjects");

}

- (void)reattachTiles
{
  void *v3;
  void *v4;
  id v5;

  -[PUTileHider _hiddenTileControllersByLayoutInfo](self, "_hiddenTileControllersByLayoutInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTileHider tilingView](self, "tilingView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reattachTileControllers:withContext:", v3, 0);

  objc_msgSend(v5, "removeAllObjects");
}

- (PUTilingView)tilingView
{
  return self->_tilingView;
}

- (NSMutableDictionary)_hiddenTileControllersByLayoutInfo
{
  return self->__hiddenTileControllersByLayoutInfo;
}

- (double)_animationDuration
{
  return self->__animationDuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__hiddenTileControllersByLayoutInfo, 0);
  objc_storeStrong((id *)&self->_tilingView, 0);
}

void __35__PUTileHider_unhideTilesAnimated___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __35__PUTileHider_unhideTilesAnimated___block_invoke_2;
  v9[3] = &unk_1E58ABCA8;
  v10 = *(id *)(a1 + 48);
  v11 = v5;
  v8 = v5;
  objc_msgSend(v6, "animateTileController:toLayoutInfo:withOptions:completionHandler:", v8, a2, v7, v9);

}

void __35__PUTileHider_unhideTilesAnimated___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  v3[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reattachTileControllers:withContext:", v2, 0);

}

@end
