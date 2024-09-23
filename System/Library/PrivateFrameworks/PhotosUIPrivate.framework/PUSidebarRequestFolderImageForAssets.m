@implementation PUSidebarRequestFolderImageForAssets

void __PUSidebarRequestFolderImageForAssets_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a2;
  objc_msgSend(v5, "numberWithInteger:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v7);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __PUSidebarRequestFolderImageForAssets_block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[5];
  __int128 v6;

  objc_msgSend(MEMORY[0x1E0DC3830], "formatForTraitCollection:", *(_QWORD *)(a1 + 32));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:format:", v4, *(double *)(a1 + 56), *(double *)(a1 + 64));
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __PUSidebarRequestFolderImageForAssets_block_invoke_3;
  v5[3] = &unk_1E589BA70;
  v6 = *(_OWORD *)(a1 + 72);
  v5[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "imageWithActions:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __PUSidebarRequestFolderImageForAssets_block_invoke_3(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  double *v5;
  void *v6;
  uint64_t i;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _OWORD v17[2];
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[15];

  v20[14] = *MEMORY[0x1E0C80C00];
  v16 = a2;
  v3 = *(double *)(a1 + 40);
  v4 = v3 + *(double *)(a1 + 48);
  v5 = (double *)v20;
  v18 = 0;
  v19 = 0;
  *(double *)v20 = v3;
  *(double *)&v20[1] = v3;
  *(double *)&v20[2] = v4;
  v20[3] = 0;
  *(double *)&v20[4] = v3;
  *(double *)&v20[5] = v3;
  v20[6] = 0;
  *(double *)&v20[7] = v4;
  *(double *)&v20[8] = v3;
  *(double *)&v20[9] = v3;
  *(double *)&v20[10] = v4;
  *(double *)&v20[11] = v4;
  *(double *)&v20[12] = v3;
  *(double *)&v20[13] = v3;
  v17[0] = xmmword_1AB0EF270;
  v17[1] = xmmword_1AB0EF280;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGray5Color");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "set");

  for (i = 0; i != 4; ++i)
  {
    v9 = *(v5 - 2);
    v8 = *(v5 - 1);
    v11 = *v5;
    v10 = v5[1];
    v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", i);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", *((_QWORD *)v17 + i), v9, v8, v11, v10, 1.0, 1.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addClip");
    if (v14)
    {
      objc_msgSend(v14, "size");
      PXSizeGetAspectRatio();
      PXRectWithAspectRatioFillingRect();
      objc_msgSend(v14, "drawInRect:");
    }
    else
    {
      objc_msgSend(v16, "fillRect:", v9, v8, v11, v10);
    }
    CGContextResetClip((CGContextRef)objc_msgSend(v16, "CGContext"));

    v5 += 4;
  }

}

@end
