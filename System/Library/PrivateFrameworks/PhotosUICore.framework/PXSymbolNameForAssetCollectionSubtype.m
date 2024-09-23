@implementation PXSymbolNameForAssetCollectionSubtype

void __PXSymbolNameForAssetCollectionSubtype_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[31];
  _QWORD v3[32];

  v3[31] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E53EE100;
  v2[1] = &unk_1E53EE118;
  v3[0] = CFSTR("rectangle.stack");
  v3[1] = CFSTR("rectangle.stack");
  v2[2] = &unk_1E53EE130;
  v2[3] = &unk_1E53EE148;
  v3[2] = CFSTR("exclamationmark.icloud");
  v3[3] = CFSTR("square.stack.3d.down.dottedline");
  v2[4] = &unk_1E53EE160;
  v2[5] = &unk_1E53EE178;
  v3[4] = CFSTR("square.stack.3d.down.right");
  v3[5] = CFSTR("heart");
  v2[6] = &unk_1E53EE190;
  v2[7] = &unk_1E53EE1A8;
  v3[6] = CFSTR("eye.slash");
  v3[7] = CFSTR("person.crop.square");
  v2[8] = &unk_1E53EE1C0;
  v2[9] = &unk_1E53EE1D8;
  v3[8] = CFSTR("livephoto");
  v3[9] = CFSTR("livephoto.long.exposure");
  v2[10] = &unk_1E53EE1F0;
  v2[11] = &unk_1E53EE208;
  v3[10] = CFSTR("pano");
  v3[11] = CFSTR("spatial");
  v2[12] = &unk_1E53EE220;
  v2[13] = &unk_1E53EE238;
  v3[12] = CFSTR("camera.viewfinder");
  v3[13] = CFSTR("f.cursive.circle");
  v2[14] = &unk_1E53EE250;
  v2[15] = &unk_1E53EE268;
  v3[14] = CFSTR("video");
  v3[15] = CFSTR("slowmo");
  v2[16] = &unk_1E53EE280;
  v2[17] = &unk_1E53EE298;
  v3[16] = CFSTR("timelapse");
  v3[17] = CFSTR("actionCam");
  v2[18] = &unk_1E53EE2B0;
  v2[19] = &unk_1E53EE2C8;
  v3[18] = CFSTR("trash");
  v3[19] = CFSTR("arrow.up.bin");
  v2[20] = &unk_1E53EE2E0;
  v2[21] = &unk_1E53EE2F8;
  v3[20] = CFSTR("mappin.and.ellipse");
  v3[21] = CFSTR("clock");
  v2[22] = &unk_1E53EE310;
  v2[23] = &unk_1E53EE328;
  v3[22] = CFSTR("clock");
  v3[23] = CFSTR("square.and.arrow.down");
  v2[24] = &unk_1E53EE340;
  v2[25] = &unk_1E53EE358;
  v3[24] = CFSTR("record.circle");
  v3[25] = CFSTR("gearshape");
  v2[26] = &unk_1E53EE370;
  v2[27] = &unk_1E53EE388;
  v3[26] = CFSTR("r.square.on.square");
  v3[27] = CFSTR("cinematic.video");
  v2[28] = &unk_1E53EE3A0;
  v2[29] = &unk_1E53EE3B8;
  v3[28] = CFSTR("video.circle");
  v3[29] = CFSTR("person.2.fill");
  v2[30] = &unk_1E53EE3D0;
  v3[30] = CFSTR("square.on.square");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 31);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)PXSymbolNameForAssetCollectionSubtype_symbolNames;
  PXSymbolNameForAssetCollectionSubtype_symbolNames = v0;

}

@end
