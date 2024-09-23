@implementation PUPhotoBrowserOneUpPresentationAdaptor

- (void)setZoomTransitionDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  _BOOL8 v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_zoomTransitionDelegate);

  if (WeakRetained != obj)
  {
    -[PUPhotoBrowserOneUpPresentationAdaptor _photoTokensForHiddenAssetReferences](self, "_photoTokensForHiddenAssetReferences");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PUPhotoBrowserOneUpPresentationAdaptor _shouldDisableScroll](self, "_shouldDisableScroll");
    -[PUPhotoBrowserOneUpPresentationAdaptor _setPhotoTokensForHiddenAssetReferences:](self, "_setPhotoTokensForHiddenAssetReferences:", 0);
    -[PUPhotoBrowserOneUpPresentationAdaptor _setShouldDisableScroll:](self, "_setShouldDisableScroll:", 0);
    objc_storeWeak((id *)&self->_zoomTransitionDelegate, obj);
    self->_zoomTransitionDelegateFlags.respondsToTransitionImageForPhotoToken = objc_opt_respondsToSelector() & 1;
    self->_zoomTransitionDelegateFlags.respondsToWillBeginForOperation = objc_opt_respondsToSelector() & 1;
    self->_zoomTransitionDelegateFlags.respondsToDidFinishForOperation = objc_opt_respondsToSelector() & 1;
    self->_zoomTransitionDelegateFlags.respondsToWillBeginAnimationForOperation = objc_opt_respondsToSelector() & 1;
    self->_zoomTransitionDelegateFlags.respondsToDidFinishAnimationForOperation = objc_opt_respondsToSelector() & 1;
    self->_zoomTransitionDelegateFlags.respondsToShouldHidePhotosTokens = objc_opt_respondsToSelector() & 1;
    self->_zoomTransitionDelegateFlags.respondsToSetVisibilityForPhotoToken = objc_opt_respondsToSelector() & 1;
    -[PUPhotoBrowserOneUpPresentationAdaptor _setPhotoTokensForHiddenAssetReferences:](self, "_setPhotoTokensForHiddenAssetReferences:", v5);
    -[PUPhotoBrowserOneUpPresentationAdaptor _setShouldDisableScroll:](self, "_setShouldDisableScroll:", v6);

  }
}

- (id)_photoTokenForAssetReference:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[PUPhotoBrowserOneUpPresentationAdaptor zoomTransitionDelegate](self, "zoomTransitionDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "zoomTransition:photoTokenForPhoto:inCollection:", 0, v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_setPhotoTokensForHiddenAssetReferences:(id)a3
{
  NSSet *v4;
  NSSet *v5;
  NSSet *v6;
  NSSet *v7;
  NSSet *photoTokensForHiddenAssetReferences;
  void *v9;
  void *v10;
  NSSet *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  NSSet *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = (NSSet *)a3;
  v5 = v4;
  if (self->__photoTokensForHiddenAssetReferences != v4 && (-[NSSet isEqual:](v4, "isEqual:") & 1) == 0)
  {
    v6 = self->__photoTokensForHiddenAssetReferences;
    v7 = (NSSet *)-[NSSet copy](v5, "copy");
    photoTokensForHiddenAssetReferences = self->__photoTokensForHiddenAssetReferences;
    self->__photoTokensForHiddenAssetReferences = v7;

    -[PUPhotoBrowserOneUpPresentationAdaptor zoomTransitionDelegate](self, "zoomTransitionDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (self->_zoomTransitionDelegateFlags.respondsToShouldHidePhotosTokens)
    {
      objc_msgSend(v9, "zoomTransition:shouldHidePhotoTokens:", 0, v5);
    }
    else if (self->_zoomTransitionDelegateFlags.respondsToSetVisibilityForPhotoToken)
    {
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v11 = v6;
      v12 = -[NSSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v28 != v14)
              objc_enumerationMutation(v11);
            v16 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
            if (!-[NSSet containsObject:](v5, "containsObject:", v16))
              objc_msgSend(v10, "zoomTransition:setVisibility:forPhotoToken:", 0, 1, v16);
          }
          v13 = -[NSSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        }
        while (v13);
      }

      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v17 = v5;
      v18 = -[NSSet countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v24;
        do
        {
          for (j = 0; j != v19; ++j)
          {
            if (*(_QWORD *)v24 != v20)
              objc_enumerationMutation(v17);
            v22 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j);
            if (!-[NSSet containsObject:](v11, "containsObject:", v22, (_QWORD)v23))
              objc_msgSend(v10, "zoomTransition:setVisibility:forPhotoToken:", 0, 0, v22);
          }
          v19 = -[NSSet countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        }
        while (v19);
      }

    }
  }

}

- (void)_setShouldDisableScroll:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;

  if (self->__shouldDisableScroll != a3)
  {
    v3 = a3;
    self->__shouldDisableScroll = a3;
    -[PUPhotoBrowserOneUpPresentationAdaptor zoomTransitionDelegate](self, "zoomTransitionDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      if (self->_zoomTransitionDelegateFlags.respondsToWillBeginForOperation)
      {
        v6 = v5;
        objc_msgSend(v5, "zoomTransition:willBeginForOperation:animated:interactive:", 0, 1, 1, 1);
LABEL_7:
        v5 = v6;
      }
    }
    else if (self->_zoomTransitionDelegateFlags.respondsToDidFinishForOperation)
    {
      v6 = v5;
      objc_msgSend(v5, "zoomTransition:didFinishForOperation:animated:interactive:", 0, 1, 1, 1);
      goto LABEL_7;
    }

  }
}

- (id)oneUpPresentationHelper:(id)a3 regionOfInterestForAssetReference:(id)a4 cropInsets:(UIEdgeInsets *)a5
{
  id v7;
  CGSize v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  double x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  NSObject *v19;
  NSObject *v20;
  BOOL IsNull;
  void *v22;
  id v23;
  uint8_t buf[16];
  id v26;
  uint64_t v27;
  CGRect v28;

  v7 = a4;
  v8 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  v28.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  v28.size = v8;
  v27 = 0;
  -[PUPhotoBrowserOneUpPresentationAdaptor _photoTokenForAssetReference:](self, "_photoTokenForAssetReference:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoBrowserOneUpPresentationAdaptor zoomTransitionDelegate](self, "zoomTransitionDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  objc_msgSend(v10, "zoomTransition:getFrame:inCoordinateSpace:contentMode:cropInsets:forPhotoToken:operation:", 0, &v28, &v26, &v27, a5, v9, 0);
  v11 = v26;

  if (v27 == 1)
  {
    objc_msgSend(v7, "asset");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "aspectRatio");
    v14 = v13;

    x = PURectWithAspectRatioFittingRect(v14, v28.origin.x, v28.origin.y, v28.size.width, v28.size.height);
    v28.origin.x = x;
    v28.origin.y = y;
    v28.size.width = width;
    v28.size.height = height;
  }
  else
  {
    y = v28.origin.y;
    x = v28.origin.x;
    height = v28.size.height;
    width = v28.size.width;
  }
  if (CGRectIsNull(*(CGRect *)&x))
  {
    PXAssertGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1AAB61000, v19, OS_LOG_TYPE_ERROR, "Supplied rect from zoom transition for creating region of interest was CGRectNull", buf, 2u);
    }

  }
  if (!v11)
  {
    PXAssertGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1AAB61000, v20, OS_LOG_TYPE_ERROR, "Supplied coordinateSpace from zoom transition for creating region of interest was nil", buf, 2u);
    }

  }
  IsNull = CGRectIsNull(v28);
  v22 = 0;
  if (v11 && !IsNull)
  {
    v23 = objc_alloc(MEMORY[0x1E0D7CD60]);
    v22 = (void *)objc_msgSend(v23, "initWithRect:inCoordinateSpace:", v11, *(_OWORD *)&v28.origin, *(_OWORD *)&v28.size);
  }

  return v22;
}

- (id)oneUpPresentationHelper:(id)a3 currentImageForAssetReference:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a3;
  v7 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__57689;
  v18 = __Block_byref_object_dispose__57690;
  v19 = 0;
  if (self->_zoomTransitionDelegateFlags.respondsToTransitionImageForPhotoToken)
  {
    -[PUPhotoBrowserOneUpPresentationAdaptor _photoTokenForAssetReference:](self, "_photoTokenForAssetReference:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoBrowserOneUpPresentationAdaptor zoomTransitionDelegate](self, "zoomTransitionDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __96__PUPhotoBrowserOneUpPresentationAdaptor_oneUpPresentationHelper_currentImageForAssetReference___block_invoke;
    v13[3] = &unk_1E58A3E70;
    v13[4] = &v14;
    objc_msgSend(v9, "zoomTransition:transitionImageForPhotoToken:callback:", 0, v8, v13);

    v10 = (void *)v15[5];
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;
  _Block_object_dispose(&v14, 8);

  return v11;
}

- (void)oneUpPresentationHelper:(id)a3 shouldHideAssetReferences:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        -[PUPhotoBrowserOneUpPresentationAdaptor _photoTokenForAssetReference:](self, "_photoTokenForAssetReference:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11), (_QWORD)v13);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  -[PUPhotoBrowserOneUpPresentationAdaptor _setPhotoTokensForHiddenAssetReferences:](self, "_setPhotoTokensForHiddenAssetReferences:", v6);
}

- (void)oneUpPresentationHelper:(id)a3 scrollAssetReferenceToVisible:(id)a4
{
  void *v5;
  id v6;

  -[PUPhotoBrowserOneUpPresentationAdaptor _photoTokenForAssetReference:](self, "_photoTokenForAssetReference:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PUPhotoBrowserOneUpPresentationAdaptor zoomTransitionDelegate](self, "zoomTransitionDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "zoomTransition:getFrame:inCoordinateSpace:contentMode:cropInsets:forPhotoToken:operation:", 0, 0, 0, 0, 0, v6, 2);

}

- (void)oneUpPresentationHelper:(id)a3 shouldDisableScroll:(BOOL)a4
{
  -[PUPhotoBrowserOneUpPresentationAdaptor _setShouldDisableScroll:](self, "_setShouldDisableScroll:", a4);
}

- (PUPhotoBrowserZoomTransitionDelegate)zoomTransitionDelegate
{
  return (PUPhotoBrowserZoomTransitionDelegate *)objc_loadWeakRetained((id *)&self->_zoomTransitionDelegate);
}

- (NSSet)_photoTokensForHiddenAssetReferences
{
  return self->__photoTokensForHiddenAssetReferences;
}

- (BOOL)_shouldDisableScroll
{
  return self->__shouldDisableScroll;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__photoTokensForHiddenAssetReferences, 0);
  objc_destroyWeak((id *)&self->_zoomTransitionDelegate);
}

void __96__PUPhotoBrowserOneUpPresentationAdaptor_oneUpPresentationHelper_currentImageForAssetReference___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

@end
