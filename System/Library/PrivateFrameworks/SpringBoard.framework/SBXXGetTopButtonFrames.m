@implementation SBXXGetTopButtonFrames

double ___SBXXGetTopButtonFrames_block_invoke(uint64_t a1)
{
  __int128 v2;
  void *v3;
  double result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  v2 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *MEMORY[0x1E0C9D648];
  v8 = v2;
  v5 = v7;
  v6 = v2;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBCoverSheetPresentationManager getLeadingTopButtonFrame:trailingTopButtonFrame:forScreen:](SBCoverSheetPresentationManager, "getLeadingTopButtonFrame:trailingTopButtonFrame:forScreen:", &v7, &v5, v3);

  *(_OWORD *)*(_QWORD *)(a1 + 32) = v7;
  *(_OWORD *)*(_QWORD *)(a1 + 48) = v8;
  *(_OWORD *)*(_QWORD *)(a1 + 64) = v5;
  **(_QWORD **)(a1 + 80) = v6;
  result = *((double *)&v6 + 1);
  **(_QWORD **)(a1 + 88) = *((_QWORD *)&v6 + 1);
  return result;
}

@end
