@implementation PXStoryClipKenBurnsAnimationInfoGetMovementType

void __PXStoryClipKenBurnsAnimationInfoGetMovementType_block_invoke(_OWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  __int128 v5;
  void *v6;
  __int128 v7;
  void *v8;
  _BYTE v9[32];
  __int128 v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLStoryGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = a1[3];
    *(_OWORD *)v9 = a1[2];
    *(_OWORD *)&v9[16] = v5;
    v10 = a1[4];
    PXStoryRectDescription();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = a1[6];
    *(_OWORD *)v9 = a1[5];
    *(_OWORD *)&v9[16] = v7;
    v10 = a1[7];
    PXStoryRectDescription();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v9 = 138412802;
    *(_QWORD *)&v9[4] = v3;
    *(_WORD *)&v9[12] = 2112;
    *(_QWORD *)&v9[14] = v6;
    *(_WORD *)&v9[22] = 2112;
    *(_QWORD *)&v9[24] = v8;
    _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_ERROR, "unexpected movement type %@ (%@ -> %@)", v9, 0x20u);

  }
}

@end
