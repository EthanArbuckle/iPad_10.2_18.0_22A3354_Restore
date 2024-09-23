@implementation PXGShaderFlagsDescription

void __PXGShaderFlagsDescription_block_invoke_278(uint64_t a1, void *a2, void *a3)
{
  int v5;
  unsigned int v6;
  uint64_t v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v5 = *(_DWORD *)(a1 + 40);
  v6 = objc_msgSend(a2, "integerValue");
  v7 = v5 & v6;
  if ((v5 & v6) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v11);
    }
    else
    {
      v8 = (void (**)(_QWORD, _QWORD))MEMORY[0x2495B0BB0](v11);
      v9 = *(void **)(a1 + 32);
      v8[2](v8, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v10);

    }
  }

}

void __PXGShaderFlagsDescription_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[17];
  _QWORD v3[18];

  v3[17] = *MEMORY[0x24BDAC8D0];
  v2[0] = &unk_251A7AFD0;
  v2[1] = &unk_251A7AFE8;
  v3[0] = CFSTR("ARGBtoRGBA");
  v3[1] = CFSTR("ABGRtoBGRA");
  v2[2] = &unk_251A7B000;
  v2[3] = &unk_251A7B018;
  v3[2] = CFSTR("RtoGray");
  v3[3] = CFSTR("RGtoGrayA");
  v2[4] = &unk_251A7B030;
  v2[5] = &unk_251A7B048;
  v3[4] = &__block_literal_global_239;
  v3[5] = &__block_literal_global_242;
  v2[6] = &unk_251A7B060;
  v2[7] = &unk_251A7B078;
  v3[6] = CFSTR("RoundedCorners");
  v3[7] = CFSTR("InvertColors");
  v2[8] = &unk_251A7B090;
  v2[9] = &unk_251A7B0A8;
  v3[8] = CFSTR("EffectShader");
  v3[9] = CFSTR("DebugXR");
  v2[10] = &unk_251A7B0C0;
  v2[11] = &unk_251A7B0D8;
  v3[10] = CFSTR("DebugIsOpaque");
  v3[11] = CFSTR("DebugIsNotOpaque");
  v2[12] = &unk_251A7B0F0;
  v2[13] = &unk_251A7B108;
  v3[12] = CFSTR("DebugResolution");
  v3[13] = CFSTR("DebugColorTransform");
  v2[14] = &unk_251A7B120;
  v2[15] = &unk_251A7B138;
  v3[14] = CFSTR("FragmentClipping");
  v3[15] = CFSTR("ViewportRoundedCorners");
  v2[16] = &unk_251A7B150;
  v3[16] = CFSTR("DebugMipmaps");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 17);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)PXGShaderFlagsDescription_descriptionByBit;
  PXGShaderFlagsDescription_descriptionByBit = v0;

}

__CFString *__PXGShaderFlagsDescription_block_invoke_241(uint64_t a1, unsigned int a2)
{
  return PXGYCbCrBitDepthDescription((a2 >> 12) & 3);
}

__CFString *__PXGShaderFlagsDescription_block_invoke_237(uint64_t a1, unsigned int a2)
{
  return PXGYCbCrMatrixDescription((a2 >> 8) & 0xF);
}

@end
