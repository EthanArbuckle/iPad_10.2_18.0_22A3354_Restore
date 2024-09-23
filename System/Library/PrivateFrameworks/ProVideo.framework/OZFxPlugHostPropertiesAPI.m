@implementation OZFxPlugHostPropertiesAPI

+ (id)sharedHostPropertiesAPI
{
  id result;

  result = (id)gHostProps;
  if (!gHostProps)
  {
    result = objc_alloc_init(OZFxPlugHostPropertiesAPI);
    gHostProps = (uint64_t)result;
  }
  return result;
}

+ (void)releaseSharedHostPropertiesAPI
{

}

- (id)hostProperties
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  void *v14;

  v2 = *(unsigned __int8 *)(theApp + 81);
  v14 = (void *)MEMORY[0x1E0C99D80];
  v13 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v9 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v2);
  return (id)objc_msgSend(v14, "dictionaryWithObjectsAndKeys:", v13, CFSTR("FormatsFloatRGBABitmapsAsARGB"), v3, CFSTR("SupportsHiddenParameters"), v4, CFSTR("SupportsDisabledParameters"), v5, CFSTR("SupportsGroupParameters"), v6, CFSTR("NotifiesParameterChangedForGenerators"), v7, CFSTR("ParameterChangedUsableForAllParameters"), v8, CFSTR("UpscalesFields"), v9, CFSTR("UsingMotionRendering"), v10,
               CFSTR("SupportsTemporalBitmaps"),
               v11,
               CFSTR("TimeBase"),
               objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 87064576),
               CFSTR("HostVersion"),
               0);
}

- (BOOL)conformsToProtocol:(id)a3 version:(unsigned int)a4
{
  return &unk_1EF0A80F0 == a3;
}

@end
