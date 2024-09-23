@implementation PXPhotosGridStackTransitionHelper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetMapping, 0);
}

- (_QWORD)initWithStackItemsCount:(void *)a1
{
  _QWORD *v3;
  _QWORD *v4;
  PXPhotosGridTransitionAssetMapping *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  objc_super v18;
  objc_super v19;

  if (!a1)
    return 0;
  v18.receiver = a1;
  v18.super_class = (Class)PXPhotosGridStackTransitionHelper;
  v3 = objc_msgSendSuper2(&v18, sel_init);
  v4 = v3;
  if (v3)
  {
    v3[2] = a2;
    v5 = [PXPhotosGridTransitionAssetMapping alloc];
    if (v5)
    {
      v19.receiver = v5;
      v19.super_class = (Class)PXPhotosGridTransitionAssetMapping;
      v6 = objc_msgSendSuper2(&v19, sel_init);
      if (v6)
      {
        v7 = (2 * a2) | 1;
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v7);
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = (void *)v6[1];
        v6[1] = v8;

        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v7);
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = (void *)v6[2];
        v6[2] = v10;

        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v7);
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)v6[3];
        v6[3] = v12;

        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v7);
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v6[4];
        v6[4] = v14;

      }
    }
    else
    {
      v6 = 0;
    }
    v16 = (void *)v4[1];
    v4[1] = v6;

  }
  return v4;
}

- (uint64_t)prepareForTransitionFromEndpoint:(void *)a3 toEndpoint:(void *)a4 withPrimaryAssetReference:(void *)a5 dataSource:
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;
  void (**v16)(void *, void *);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  objc_class *v27;
  uint64_t v28;
  uint64_t v29;
  objc_class *v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  void (**v35)(_QWORD, _QWORD);
  void *v36;
  Class isa;
  id v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  _QWORD aBlock[4];
  id v45;
  id v46;
  NSObject *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 buf;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v43 = v12;
  if (a1)
  {
    objc_msgSend(v12, "assetReferenceForAssetReference:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 0u;
    v49 = 0u;
    objc_msgSend(v11, "indexPath");
    if (v13 && (_QWORD)v48 != *(_QWORD *)off_1E50B7E98)
    {
      v42 = v13;
      v40 = v11;
      v15 = *(id *)(a1 + 8);
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __118__PXPhotosGridStackTransitionHelper_prepareForTransitionFromEndpoint_toEndpoint_withPrimaryAssetReference_dataSource___block_invoke;
      aBlock[3] = &unk_1E511BBA8;
      v45 = v9;
      v41 = v10;
      v46 = v10;
      v14 = v15;
      v47 = v14;
      v16 = (void (**)(void *, void *))_Block_copy(aBlock);
      v17 = objc_msgSend(v43, "numberOfItemsInSection:", *((_QWORD *)&v48 + 1));
      v18 = objc_msgSend(v43, "identifier");
      v19 = *(_QWORD *)(a1 + 16);
      if (v19 >= 1)
      {
        v20 = v18;
        v21 = -v19;
        do
        {
          v22 = v49;
          if (v21 + (uint64_t)v49 >= 0)
          {
            *(_QWORD *)&buf = v20;
            *((_QWORD *)&buf + 1) = *((_QWORD *)&v48 + 1);
            v55 = v21 + v49;
            v56 = 0x7FFFFFFFFFFFFFFFLL;
            objc_msgSend(v43, "assetReferenceAtItemIndexPath:", &buf);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v16[2](v16, v23);

            v22 = v49;
          }
          v24 = v22 + v19;
          if (v24 < v17)
          {
            *(_QWORD *)&buf = v20;
            *((_QWORD *)&buf + 1) = *((_QWORD *)&v48 + 1);
            v55 = v24;
            v56 = 0x7FFFFFFFFFFFFFFFLL;
            objc_msgSend(v43, "assetReferenceAtItemIndexPath:", &buf);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v16[2](v16, v25);

          }
          ++v21;
        }
        while (v19-- > 1);
      }
      v13 = v42;
      v16[2](v16, v42);
      if (v14)
      {
        v39 = v9;
        v53 = 0u;
        v51 = 0u;
        v52 = 0u;
        v50 = 0u;
        v27 = v14[2].isa;
        v28 = -[objc_class countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v50, &buf, 16);
        if (v28)
        {
          v29 = v28;
          v30 = 0;
          v31 = *(_QWORD *)v51;
          do
          {
            for (i = 0; i != v29; ++i)
            {
              if (*(_QWORD *)v51 != v31)
                objc_enumerationMutation(v27);
              v33 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
              objc_msgSend(v33, "placeholderViewFactory", v39);
              v34 = (void *)objc_claimAutoreleasedReturnValue();

              if (v34)
              {
                objc_msgSend(v33, "placeholderViewFactory");
                v35 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
                ((void (**)(_QWORD, void *))v35)[2](v35, v33);
                v36 = (void *)objc_claimAutoreleasedReturnValue();

                -[objc_class addObject:](v14[4].isa, "addObject:", v36);
                v30 = (objc_class *)((char *)v30 + 1);
              }
              else
              {
                isa = v14[4].isa;
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                -[objc_class addObject:](isa, "addObject:", v36);
              }

            }
            v29 = -[objc_class countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v50, &buf, 16);
          }
          while (v29);
        }
        else
        {
          v30 = 0;
        }

        v14[5].isa = v30;
        a1 = v30 != 0;
        v9 = v39;
        v13 = v42;
      }
      else
      {
        a1 = 0;
      }

      v11 = v40;
      v10 = v41;
    }
    else
    {
      PLUIGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v11;
        _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_ERROR, "Transition: asset reference %@ cannot be found in the provided dataSource", (uint8_t *)&buf, 0xCu);
      }
      a1 = 0;
    }

  }
  return a1;
}

void __118__PXPhotosGridStackTransitionHelper_prepareForTransitionFromEndpoint_toEndpoint_withPrimaryAssetReference_dataSource___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;

  v11 = a2;
  objc_msgSend(*(id *)(a1 + 32), "regionOfInterestForTransitioningAssetReference:", v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "regionOfInterestForTransitioningAssetReference:", v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 1;
  if (!v6)
  {
    v7 = *(_QWORD *)(a1 + 48);
    if (v7)
    {
      v8 = *(void **)(v7 + 8);
      v9 = v4;
      v10 = v3;
      objc_msgSend(v8, "addObject:", v11);
      objc_msgSend(*(id *)(v7 + 16), "addObject:", v10);

      objc_msgSend(*(id *)(v7 + 24), "addObject:", v9);
    }
  }

}

- (_QWORD)setInitialTransitionStateInContainerView:(void *)a3 aboveView:
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id *v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1)
  {
    v8 = a1[1];
    if (v8 && *(_QWORD *)(v8 + 40))
    {
      if (v6)
        goto LABEL_5;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", sel_setInitialTransitionStateInContainerView_aboveView_, a1, CFSTR("PXPhotosGridStackTransitionHelper.m"), 89, CFSTR("Helper must be successfully prepared"));

      if (v7)
      {
LABEL_5:
        v9 = v7;
        v10 = v5;
        do
        {
          objc_msgSend(v9, "superview");
          v11 = (id)objc_claimAutoreleasedReturnValue();

          if (v11 == v10)
            break;
          objc_msgSend(v9, "superview");
          v12 = objc_claimAutoreleasedReturnValue();

          v9 = (id)v12;
        }
        while (v12);

        goto LABEL_11;
      }
    }
    v9 = 0;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id *)a1[1];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __88__PXPhotosGridStackTransitionHelper_setInitialTransitionStateInContainerView_aboveView___block_invoke;
    v20[3] = &unk_1E511BBD0;
    v21 = v5;
    v22 = v9;
    v16 = v14;
    v23 = v16;
    v17 = v9;
    -[PXPhotosGridTransitionAssetMapping enumerateTransitionAssetsUsingBlock:](v15, v20);
    v18 = v23;
    a1 = v16;

  }
  return a1;
}

void __88__PXPhotosGridStackTransitionHelper_setInitialTransitionStateInContainerView_aboveView___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v8;
  id v9;
  void *v10;
  id v11;

  v8 = *(_QWORD *)(a1 + 32);
  v9 = a5;
  v11 = a2;
  objc_msgSend(a3, "rectInCoordinateSpace:", v8);
  PXRectGetCenter();
  objc_msgSend(v9, "setCenter:");
  v10 = *(void **)(a1 + 32);
  if (*(_QWORD *)(a1 + 40))
    objc_msgSend(v10, "insertSubview:aboveSubview:", v9);
  else
    objc_msgSend(v10, "addSubview:", v9);

  objc_msgSend(*(id *)(a1 + 48), "addObject:", v11);
}

- (void)addTransitionAnimationsToAnimator:(void *)a3 inContainerView:
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = *(_QWORD *)(a1 + 8);
    if (!v7 || !*(_QWORD *)(v7 + 40))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", sel_addTransitionAnimationsToAnimator_inContainerView_, a1, CFSTR("PXPhotosGridStackTransitionHelper.m"), 114, CFSTR("Helper must be successfully prepared"));

    }
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __87__PXPhotosGridStackTransitionHelper_addTransitionAnimationsToAnimator_inContainerView___block_invoke;
    v9[3] = &unk_1E5148D08;
    v9[4] = a1;
    v10 = v6;
    objc_msgSend(v5, "addAnimations:", v9);

  }
}

void __87__PXPhotosGridStackTransitionHelper_addTransitionAnimationsToAnimator_inContainerView___block_invoke(uint64_t a1)
{
  void *v1;
  id *v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  v2 = *(id **)(*(_QWORD *)(a1 + 32) + 8);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __87__PXPhotosGridStackTransitionHelper_addTransitionAnimationsToAnimator_inContainerView___block_invoke_2;
  v3[3] = &unk_1E511BBF8;
  v4 = v1;
  -[PXPhotosGridTransitionAssetMapping enumerateTransitionAssetsUsingBlock:](v2, v3);

}

void __87__PXPhotosGridStackTransitionHelper_addTransitionAnimationsToAnimator_inContainerView___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v7;
  uint64_t v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  CGFloat v17;
  __int128 v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  CGAffineTransform v29;
  CGAffineTransform v30;
  CGAffineTransform v31;

  v7 = a4;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = a5;
  objc_msgSend(v7, "rectInCoordinateSpace:", v8);
  v11 = v10;
  v13 = v12;
  memset(&v31, 0, sizeof(v31));
  objc_msgSend(v7, "imageViewSpec");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "rotationAngle");
  if (v15 == 0.0)
  {
    v18 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v31.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v31.c = v18;
    *(_OWORD *)&v31.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  }
  else
  {
    objc_msgSend(v7, "imageViewSpec");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "rotationAngle");
    CGAffineTransformMakeRotation(&v31, v17);

  }
  PXRectGetCenter();
  objc_msgSend(v9, "setCenter:");
  objc_msgSend(v9, "setBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v11, v13);
  v30 = v31;
  objc_msgSend(v9, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v30;
  objc_msgSend(v19, "setAffineTransform:", &v29);

  objc_msgSend(v7, "imageContentsRect");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  objc_msgSend(v9, "layer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "setContentsRect:", v21, v23, v25, v27);
}

- (void)addTransitionCompletionsToAnimator:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];

  v3 = a2;
  if (a1)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (!v4 || !*(_QWORD *)(v4 + 40))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", sel_addTransitionCompletionsToAnimator_, a1, CFSTR("PXPhotosGridStackTransitionHelper.m"), 129, CFSTR("Helper must be successfully prepared"));

    }
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __72__PXPhotosGridStackTransitionHelper_addTransitionCompletionsToAnimator___block_invoke;
    v6[3] = &unk_1E51438B0;
    v6[4] = a1;
    objc_msgSend(v3, "addCompletion:", v6);
  }

}

void __72__PXPhotosGridStackTransitionHelper_addTransitionCompletionsToAnimator___block_invoke(uint64_t a1)
{
  -[PXPhotosGridTransitionAssetMapping enumerateTransitionAssetsUsingBlock:](*(id **)(*(_QWORD *)(a1 + 32) + 8), &__block_literal_global_36687);
}

uint64_t __72__PXPhotosGridStackTransitionHelper_addTransitionCompletionsToAnimator___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  return objc_msgSend(a5, "removeFromSuperview");
}

@end
