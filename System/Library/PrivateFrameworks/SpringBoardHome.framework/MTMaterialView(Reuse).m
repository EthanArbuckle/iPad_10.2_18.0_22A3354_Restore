@implementation MTMaterialView(Reuse)

- (uint64_t)prepareForReuse
{
  __int128 v2;
  _OWORD v4[3];

  objc_msgSend(a1, "setWeighting:", 1.0);
  v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v4[0] = *MEMORY[0x1E0C9BAA8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(a1, "setTransform:", v4);
  objc_msgSend(a1, "setAlpha:", 1.0);
  return objc_msgSend(a1, "setHidden:", 0);
}

@end
