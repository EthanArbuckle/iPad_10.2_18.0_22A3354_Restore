@implementation CAAnimation

id __61__CAAnimation_TSDCAAnimationAdditions__TSD_supportedKeyPaths__block_invoke()
{
  id result;
  _QWORD v1[24];

  v1[23] = *MEMORY[0x24BDAC8D0];
  v1[0] = CFSTR("anchorPoint");
  v1[1] = CFSTR("anchorPointZ");
  v1[2] = CFSTR("borderColor");
  v1[3] = CFSTR("borderWidth");
  v1[4] = CFSTR("bounds");
  v1[5] = CFSTR("contents");
  v1[6] = CFSTR("doubleSided");
  v1[7] = CFSTR("hidden");
  v1[8] = CFSTR("opacity");
  v1[9] = CFSTR("position");
  v1[10] = CFSTR("transform");
  v1[11] = CFSTR("transform.rotation");
  v1[12] = CFSTR("transform.rotation.x");
  v1[13] = CFSTR("transform.rotation.y");
  v1[14] = CFSTR("transform.rotation.z");
  v1[15] = CFSTR("transform.scale.x");
  v1[16] = CFSTR("transform.scale.y");
  v1[17] = CFSTR("transform.scale.xy");
  v1[18] = CFSTR("transform.translation");
  v1[19] = CFSTR("transform.translation.x");
  v1[20] = CFSTR("transform.translation.y");
  v1[21] = CFSTR("transform.translation.z");
  v1[22] = CFSTR("zPosition");
  result = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v1, 23);
  TSD_supportedKeyPaths_s_supportedKeyPaths = (uint64_t)result;
  return result;
}

@end
