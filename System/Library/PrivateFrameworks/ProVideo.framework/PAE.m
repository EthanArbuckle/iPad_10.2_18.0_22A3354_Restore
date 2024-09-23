@implementation PAE

uint64_t __26__PAE_HLG_OETF_properties__block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;

  v0 = objc_alloc(MEMORY[0x1E0C99D80]);
  v1 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v2 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 67584);
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 591872);
  v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 3);
  result = objc_msgSend(v0, "initWithObjectsAndKeys:", MEMORY[0x1E0C9AAB0], CFSTR("PixelTransformSupport"), v1, CFSTR("PixelIndependent"), v2, CFSTR("PositionIndependent"), v3, CFSTR("MayRemapTime"), v4, CFSTR("SupportsLargeRenderScale"), v5, CFSTR("SupportsHeliumRendering"), v6, CFSTR("SDRWorkingSpace"), v7, CFSTR("HDRWorkingSpace"), v8,
             CFSTR("AutoColorProcessingSupport"),
             0);
  -[PAE_HLG_OETF properties]::sPropertiesDict = result;
  return result;
}

uint64_t __34__PAE_HLG_Inverse_OETF_properties__block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;

  v0 = objc_alloc(MEMORY[0x1E0C99D80]);
  v1 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v2 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 67584);
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 591872);
  v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 3);
  result = objc_msgSend(v0, "initWithObjectsAndKeys:", MEMORY[0x1E0C9AAB0], CFSTR("PixelTransformSupport"), v1, CFSTR("PixelIndependent"), v2, CFSTR("PositionIndependent"), v3, CFSTR("MayRemapTime"), v4, CFSTR("SupportsLargeRenderScale"), v5, CFSTR("SupportsHeliumRendering"), v6, CFSTR("SDRWorkingSpace"), v7, CFSTR("HDRWorkingSpace"), v8,
             CFSTR("AutoColorProcessingSupport"),
             0);
  -[PAE_HLG_Inverse_OETF properties]::sPropertiesDict = result;
  return result;
}

@end
