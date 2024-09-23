@implementation PXStoryVolumeForFadeOutFractionCompleted

void __PXStoryVolumeForFadeOutFractionCompleted_block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  float v7;
  float v8;
  float v9;
  float v10;
  uint64_t v11;
  float v12;
  float v13;
  void *v14;
  float v15;
  id v16;

  v7 = *(float *)(a1 + 40);
  objc_msgSend(a2, "floatValue");
  v9 = v8;
  objc_msgSend(&unk_1E53E8AF0, "objectAtIndexedSubscript:", a3);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "floatValue");
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v7 >= v9)
  {
    *(float *)(v11 + 24) = v10;

  }
  else
  {
    v12 = v10 - *(float *)(v11 + 24);
    v13 = *(float *)(a1 + 40);
    objc_msgSend(&unk_1E53E8AD8, "objectAtIndexedSubscript:", a3 - 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "floatValue");
    *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 24)
                                                               + (float)(v12 * (float)(v13 - v15));

    *a4 = 1;
  }
}

@end
