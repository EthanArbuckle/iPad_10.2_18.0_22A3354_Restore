@implementation SBXXSetMediaVolume

void ___SBXXSetMediaVolume_block_invoke(uint64_t a1)
{
  double v2;
  id v3;

  objc_msgSend((id)SBApp, "volumeControl");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = *(_DWORD *)(a1 + 32);
  objc_msgSend(v3, "_setMediaVolumeForIAP:", v2);

}

@end
