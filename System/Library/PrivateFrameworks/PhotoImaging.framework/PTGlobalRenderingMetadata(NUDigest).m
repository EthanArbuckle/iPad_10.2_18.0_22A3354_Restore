@implementation PTGlobalRenderingMetadata(NUDigest)

- (void)nu_updateDigest:()NUDigest
{
  id v4;
  _DWORD v5[3];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5[0] = objc_msgSend(a1, "majorVersion");
  v5[1] = objc_msgSend(a1, "minorVersion");
  v5[2] = objc_msgSend(a1, "renderingVersion");
  objc_msgSend(v4, "addBytes:length:", v5, 12);

}

@end
