@implementation PXLabelSpec(Memories)

+ (id)memoriesLabelSpecForLabelKind:()Memories tileKind:specSet:variant:boundedBy:shouldScale:
{
  _QWORD v12[9];

  v12[0] = a7;
  v12[1] = a8;
  v12[2] = a9;
  v12[3] = a10;
  *(double *)&v12[4] = a1;
  *(double *)&v12[5] = a2;
  *(double *)&v12[6] = a3;
  *(double *)&v12[7] = a4;
  v12[8] = a11;
  objc_msgSend(off_1E50B31F8, "_memoriesLabelSpecForContext:", v12);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)memoriesLabelSpecForLabelKind:()Memories descriptor:featureSpec:
{
  __int128 v5;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = 0;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = a4[1];
  v7 = *a4;
  v8 = v5;
  _LabelContextMakeDescriptor(a3, (uint64_t *)&v7, a5, (uint64_t)&v12);
  v9 = v14;
  v10 = v15;
  v11 = v16;
  v7 = v12;
  v8 = v13;
  objc_msgSend(off_1E50B31F8, "_memoriesLabelSpecForContext:", &v7);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)memoriesLabelSpecForLabelKind:()Memories tileKind:featureSpec:boundedByRect:
{
  _OWORD v10[4];
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = 0;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  _LabelContextMakeFeatureSpec(a7, a8, a9, (uint64_t)&v12, a1, a2, a3, a4);
  v10[2] = v14;
  v10[3] = v15;
  v11 = v16;
  v10[0] = v12;
  v10[1] = v13;
  objc_msgSend(off_1E50B31F8, "_memoriesLabelSpecForContext:", v10);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)memoriesLabelSpecForLabelKind:()Memories tileKind:gadgetSpec:boundedByRect:
{
  _OWORD v10[4];
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = 0;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  _LabelContextMakeGadgetSpec(a7, a8, a9, (uint64_t)&v12, a1, a2, a3, a4);
  v10[2] = v14;
  v10[3] = v15;
  v11 = v16;
  v10[0] = v12;
  v10[1] = v13;
  objc_msgSend(off_1E50B31F8, "_memoriesLabelSpecForContext:", v10);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_memoriesLabelSpecForContext:()Memories
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  +[PXKitSettings sharedInstance](PXKitSettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init((Class)off_1E50B31F8);
  +[PXMemoriesFontsSpec textAttributesForFontSet:specSet:labelKind:variant:size:shouldScale:](PXMemoriesFontsSpec, "textAttributesForFontSet:specSet:labelKind:variant:size:shouldScale:", 2, *((_QWORD *)a3 + 2), *(_QWORD *)a3, *((_QWORD *)a3 + 3), *((unsigned __int8 *)a3 + 64), a3[6], a3[7]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextAttributes:", v6);

  +[PXMemoriesFontsSpec textAttributesForFontSet:specSet:labelKind:variant:size:shouldScale:](PXMemoriesFontsSpec, "textAttributesForFontSet:specSet:labelKind:variant:size:shouldScale:", 1, *((_QWORD *)a3 + 2), *(_QWORD *)a3, *((_QWORD *)a3 + 3), *((unsigned __int8 *)a3 + 64), a3[6], a3[7]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFallbackTextAttributes:", v7);

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v8);

  objc_msgSend(v5, "setTextAlignment:", objc_msgSend(MEMORY[0x1E0C99DC8], "px_currentLeadingTextAlignment"));
  objc_msgSend(v5, "setVerticalAlignment:", 1);
  objc_msgSend(v5, "setCapitalization:", +[PXMemoriesFontsSpec capitalizationStyleForLabelKind:](PXMemoriesFontsSpec, "capitalizationStyleForLabelKind:", *(_QWORD *)a3));
  objc_msgSend(v5, "setNumberOfLines:", +[PXMemoriesFontsSpec numberOfLinesForLabelKind:](PXMemoriesFontsSpec, "numberOfLinesForLabelKind:", *(_QWORD *)a3));
  objc_msgSend(v5, "setAdjustsFontSizeToFitWidth:", objc_msgSend(v4, "defaultTextAutoscalingEnabled"));
  objc_msgSend(v4, "defaultTextMinimumScaleFactor");
  objc_msgSend(v5, "setMinimumScaleFactor:");
  objc_msgSend(v5, "setAllowTruncation:", objc_msgSend(v4, "defaultTextTruncationEnabled"));
  objc_msgSend(v4, "defaultTruncatedTextMinimumScaleFactor");
  objc_msgSend(v5, "setMinimumTruncatedScaleFactor:");

  return v5;
}

@end
