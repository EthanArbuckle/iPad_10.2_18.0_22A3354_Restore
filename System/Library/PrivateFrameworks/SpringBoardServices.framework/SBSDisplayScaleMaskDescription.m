@implementation SBSDisplayScaleMaskDescription

void __SBSDisplayScaleMaskDescription_block_invoke(uint64_t a1, uint64_t a2)
{
  uint8x8_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("|"));
  v4 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "SBSDisplayScale _SBSDisplayScaleFromSingleBitMask(SBSDisplayScaleMask)");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("SBSDisplayModeSettings.m"), 39, CFSTR("invalid mask"));

  }
  if (a2 == 1)
  {
    v7 = 0;
  }
  else if (a2 == 4)
  {
    v7 = 2;
  }
  else
  {
    if (a2 != 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "SBSDisplayScale _SBSDisplayScaleFromSingleBitMask(SBSDisplayScaleMask)");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("SBSDisplayModeSettings.m"), 47, CFSTR("invalid mask"));

    }
    v7 = 1;
  }
  v8 = *(void **)(a1 + 32);
  SBSDisplayScaleDescription(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendString:", v9);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
}

@end
