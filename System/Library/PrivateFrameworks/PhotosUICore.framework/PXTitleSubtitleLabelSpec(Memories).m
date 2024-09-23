@implementation PXTitleSubtitleLabelSpec(Memories)

+ (id)memoriesTitleSubtitleSpecForViewSpecDescriptor:()Memories featureSpec:
{
  double v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  _OWORD v14[6];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;

  v6 = *a3;
  v7 = a4;
  v8 = *MEMORY[0x1E0C9D538];
  v9 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v10 = a3[2];
  v11 = a3[3];
  if ((unint64_t)(*(_QWORD *)&v6 - 1900) >= 0x64)
    v12 = 0;
  else
    v12 = (LOBYTE(v6) - 108) % 0xFu;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  _TitleSubtitleContextMakeFeatureSpec(v12, v7, (uint64_t)&v15, v8, v9, v10, v11);

  v14[2] = v17;
  v14[3] = v18;
  v14[4] = v19;
  v14[5] = v20;
  v14[0] = v15;
  v14[1] = v16;
  objc_msgSend(a1, "memoriesTitleSubtitleSpecForContext:", v14);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)memoriesTitleSubtitleSpecForTileKind:()Memories featureSpec:boundedByRect:
{
  _OWORD v10[6];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  _TitleSubtitleContextMakeFeatureSpec(a7, a8, (uint64_t)&v11, a2, a3, a4, a5);
  v10[2] = v13;
  v10[3] = v14;
  v10[4] = v15;
  v10[5] = v16;
  v10[0] = v11;
  v10[1] = v12;
  objc_msgSend(a1, "memoriesTitleSubtitleSpecForContext:", v10);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)memoriesTitleSubtitleSpecForTileKind:()Memories gadgetSpec:boundedByRect:
{
  _OWORD v10[6];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  _TitleSubtitleContextMakeGadgetSpec(a7, a8, (uint64_t)&v11, a2, a3, a4, a5);
  v10[2] = v13;
  v10[3] = v14;
  v10[4] = v15;
  v10[5] = v16;
  v10[0] = v11;
  v10[1] = v12;
  objc_msgSend(a1, "memoriesTitleSubtitleSpecForContext:", v10);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)memoriesTitleSubtitleSpecForTileKind:()Memories viewMode:boundedByRect:
{
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  _QWORD v27[11];
  char v28;
  _BYTE v29[7];

  memset(v29, 0, sizeof(v29));
  v14 = a8;
  v15 = objc_msgSend(v14, "specSet");
  v16 = objc_msgSend(v14, "variant");
  objc_msgSend(v14, "layoutMargins");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  v27[0] = a7;
  v27[1] = v15;
  v27[2] = v16;
  *(double *)&v27[3] = a2;
  *(double *)&v27[4] = a3;
  *(double *)&v27[5] = a4;
  *(double *)&v27[6] = a5;
  v27[7] = v18;
  v27[8] = v20;
  v27[9] = v22;
  v27[10] = v24;
  v28 = 1;
  objc_msgSend(a1, "memoriesTitleSubtitleSpecForContext:", v27);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

+ (id)memoriesTitleSubtitleSpecForContext:()Memories
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init((Class)off_1E50B5C68);
  objc_msgSend(off_1E50B31F8, "memoriesLabelSpecForLabelKind:tileKind:specSet:variant:boundedBy:shouldScale:", 0, *(_QWORD *)a3, *((_QWORD *)a3 + 1), *((_QWORD *)a3 + 2), *((unsigned __int8 *)a3 + 88), a3[3], a3[4], a3[5], a3[6]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitleLabelSpec:", v5);

  objc_msgSend(off_1E50B31F8, "memoriesLabelSpecForLabelKind:tileKind:specSet:variant:boundedBy:shouldScale:", 1, *(_QWORD *)a3, *((_QWORD *)a3 + 1), *((_QWORD *)a3 + 2), *((unsigned __int8 *)a3 + 88), a3[3], a3[4], a3[5], a3[6]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSubtitleLabelSpec:", v6);

  +[PXMemoriesFontsSpec baselineDistanceForFontSet:specSet:variant:size:shouldScale:](PXMemoriesFontsSpec, "baselineDistanceForFontSet:specSet:variant:size:shouldScale:", 2, *((_QWORD *)a3 + 1), *((_QWORD *)a3 + 2), *((unsigned __int8 *)a3 + 88), a3[5], a3[6]);
  objc_msgSend(v4, "setDistanceBetweenTitleBaselineAndSubtitleBaseline:");
  +[PXMemoriesFontsSpec paddingForFontSet:specSet:variant:layoutMargins:width:shouldScale:forHeaderTile:](PXMemoriesFontsSpec, "paddingForFontSet:specSet:variant:layoutMargins:width:shouldScale:forHeaderTile:", 2, *((_QWORD *)a3 + 1), *((_QWORD *)a3 + 2), *((unsigned __int8 *)a3 + 88), *(_QWORD *)a3 == 4, a3[7], a3[8], a3[9], a3[10], a3[5]);
  objc_msgSend(v4, "setPadding:");
  return v4;
}

@end
