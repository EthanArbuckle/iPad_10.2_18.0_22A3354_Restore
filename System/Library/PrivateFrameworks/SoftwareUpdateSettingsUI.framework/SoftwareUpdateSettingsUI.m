uint64_t SUSUISettingsIsBadgedForSoftwareUpdate()
{
  char v1;
  id v2;

  v2 = (id)objc_msgSend(MEMORY[0x24BEAEC70], "sharedController");
  v1 = objc_msgSend(v2, "isBadgeOnlyFollowUpCurrentlyBeingPresented");
  objc_storeStrong(&v2, 0);
  return v1 & 1;
}

uint64_t __os_log_helper_16_2_2_8_32_8_66(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  return result;
}

uint64_t __os_log_helper_16_2_1_8_32(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  return result;
}

uint64_t __os_log_helper_16_2_2_8_64_8_64(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  return result;
}

id SUSettingsSharedLogger()
{
  dispatch_block_t block;
  dispatch_once_t *predicate;

  predicate = (dispatch_once_t *)&onceToken;
  block = 0;
  objc_storeStrong(&block, &__block_literal_global_0);
  if (*predicate != -1)
    dispatch_once(predicate, block);
  objc_storeStrong(&block, 0);
  return (id)sharedLogger;
}

__CFString *SUSettingsUIStateToString(unint64_t a1)
{
  if (a1 <= 4)
    __asm { BR              X8 }
  return CFSTR("Unknown");
}

void sub_21BF3A108()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

uint64_t __os_log_helper_16_2_22_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  uint64_t result;

  result = a13;
  *(_BYTE *)a1 = 2;
  *(_BYTE *)(a1 + 1) = 22;
  *(_BYTE *)(a1 + 2) = 32;
  *(_BYTE *)(a1 + 3) = 8;
  *(_QWORD *)(a1 + 4) = a2;
  *(_BYTE *)(a1 + 12) = 66;
  *(_BYTE *)(a1 + 13) = 8;
  *(_QWORD *)(a1 + 14) = a3;
  *(_BYTE *)(a1 + 22) = 0;
  *(_BYTE *)(a1 + 23) = 8;
  *(_QWORD *)(a1 + 24) = a4;
  *(_BYTE *)(a1 + 32) = 66;
  *(_BYTE *)(a1 + 33) = 8;
  *(_QWORD *)(a1 + 34) = a5;
  *(_BYTE *)(a1 + 42) = 0;
  *(_BYTE *)(a1 + 43) = 8;
  *(_QWORD *)(a1 + 44) = a6;
  *(_BYTE *)(a1 + 52) = 66;
  *(_BYTE *)(a1 + 53) = 8;
  *(_QWORD *)(a1 + 54) = a7;
  *(_BYTE *)(a1 + 62) = 66;
  *(_BYTE *)(a1 + 63) = 8;
  *(_QWORD *)(a1 + 64) = a8;
  *(_BYTE *)(a1 + 72) = 66;
  *(_BYTE *)(a1 + 73) = 8;
  *(_QWORD *)(a1 + 74) = a9;
  *(_BYTE *)(a1 + 82) = 66;
  *(_BYTE *)(a1 + 83) = 8;
  *(_QWORD *)(a1 + 84) = a10;
  *(_BYTE *)(a1 + 92) = 0;
  *(_BYTE *)(a1 + 93) = 8;
  *(_QWORD *)(a1 + 94) = a11;
  *(_BYTE *)(a1 + 102) = 34;
  *(_BYTE *)(a1 + 103) = 8;
  *(_QWORD *)(a1 + 104) = a12;
  *(_BYTE *)(a1 + 112) = 34;
  *(_BYTE *)(a1 + 113) = 8;
  *(_QWORD *)(a1 + 114) = a13;
  *(_BYTE *)(a1 + 122) = 34;
  *(_BYTE *)(a1 + 123) = 8;
  *(_QWORD *)(a1 + 124) = a14;
  *(_BYTE *)(a1 + 132) = 66;
  *(_BYTE *)(a1 + 133) = 8;
  *(_QWORD *)(a1 + 134) = a15;
  *(_BYTE *)(a1 + 142) = 34;
  *(_BYTE *)(a1 + 143) = 8;
  *(_QWORD *)(a1 + 144) = a16;
  *(_BYTE *)(a1 + 152) = 66;
  *(_BYTE *)(a1 + 153) = 8;
  *(_QWORD *)(a1 + 154) = a17;
  *(_BYTE *)(a1 + 162) = 0;
  *(_BYTE *)(a1 + 163) = 8;
  *(_QWORD *)(a1 + 164) = a18;
  *(_BYTE *)(a1 + 172) = 0;
  *(_BYTE *)(a1 + 173) = 8;
  *(_QWORD *)(a1 + 174) = a19;
  *(_BYTE *)(a1 + 182) = 0;
  *(_BYTE *)(a1 + 183) = 8;
  *(_QWORD *)(a1 + 184) = a20;
  *(_BYTE *)(a1 + 192) = 0;
  *(_BYTE *)(a1 + 193) = 8;
  *(_QWORD *)(a1 + 194) = a21;
  *(_BYTE *)(a1 + 202) = 0;
  *(_BYTE *)(a1 + 203) = 8;
  *(_QWORD *)(a1 + 204) = a22;
  *(_BYTE *)(a1 + 212) = 0;
  *(_BYTE *)(a1 + 213) = 8;
  *(_QWORD *)(a1 + 214) = a23;
  return result;
}

uint64_t __os_log_helper_16_2_26_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66_8_0_8_66_8_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  uint64_t result;

  result = a17;
  *(_BYTE *)a1 = 2;
  *(_BYTE *)(a1 + 1) = 26;
  *(_BYTE *)(a1 + 2) = 32;
  *(_BYTE *)(a1 + 3) = 8;
  *(_QWORD *)(a1 + 4) = a2;
  *(_BYTE *)(a1 + 12) = 66;
  *(_BYTE *)(a1 + 13) = 8;
  *(_QWORD *)(a1 + 14) = a3;
  *(_BYTE *)(a1 + 22) = 0;
  *(_BYTE *)(a1 + 23) = 8;
  *(_QWORD *)(a1 + 24) = a4;
  *(_BYTE *)(a1 + 32) = 66;
  *(_BYTE *)(a1 + 33) = 8;
  *(_QWORD *)(a1 + 34) = a5;
  *(_BYTE *)(a1 + 42) = 0;
  *(_BYTE *)(a1 + 43) = 8;
  *(_QWORD *)(a1 + 44) = a6;
  *(_BYTE *)(a1 + 52) = 66;
  *(_BYTE *)(a1 + 53) = 8;
  *(_QWORD *)(a1 + 54) = a7;
  *(_BYTE *)(a1 + 62) = 66;
  *(_BYTE *)(a1 + 63) = 8;
  *(_QWORD *)(a1 + 64) = a8;
  *(_BYTE *)(a1 + 72) = 66;
  *(_BYTE *)(a1 + 73) = 8;
  *(_QWORD *)(a1 + 74) = a9;
  *(_BYTE *)(a1 + 82) = 66;
  *(_BYTE *)(a1 + 83) = 8;
  *(_QWORD *)(a1 + 84) = a10;
  *(_BYTE *)(a1 + 92) = 0;
  *(_BYTE *)(a1 + 93) = 8;
  *(_QWORD *)(a1 + 94) = a11;
  *(_BYTE *)(a1 + 102) = 34;
  *(_BYTE *)(a1 + 103) = 8;
  *(_QWORD *)(a1 + 104) = a12;
  *(_BYTE *)(a1 + 112) = 34;
  *(_BYTE *)(a1 + 113) = 8;
  *(_QWORD *)(a1 + 114) = a13;
  *(_BYTE *)(a1 + 122) = 34;
  *(_BYTE *)(a1 + 123) = 8;
  *(_QWORD *)(a1 + 124) = a14;
  *(_BYTE *)(a1 + 132) = 66;
  *(_BYTE *)(a1 + 133) = 8;
  *(_QWORD *)(a1 + 134) = a15;
  *(_BYTE *)(a1 + 142) = 34;
  *(_BYTE *)(a1 + 143) = 8;
  *(_QWORD *)(a1 + 144) = a16;
  *(_BYTE *)(a1 + 152) = 66;
  *(_BYTE *)(a1 + 153) = 8;
  *(_QWORD *)(a1 + 154) = a17;
  *(_BYTE *)(a1 + 162) = 0;
  *(_BYTE *)(a1 + 163) = 8;
  *(_QWORD *)(a1 + 164) = a18;
  *(_BYTE *)(a1 + 172) = 0;
  *(_BYTE *)(a1 + 173) = 8;
  *(_QWORD *)(a1 + 174) = a19;
  *(_BYTE *)(a1 + 182) = 0;
  *(_BYTE *)(a1 + 183) = 8;
  *(_QWORD *)(a1 + 184) = a20;
  *(_BYTE *)(a1 + 192) = 0;
  *(_BYTE *)(a1 + 193) = 8;
  *(_QWORD *)(a1 + 194) = a21;
  *(_BYTE *)(a1 + 202) = 0;
  *(_BYTE *)(a1 + 203) = 8;
  *(_QWORD *)(a1 + 204) = a22;
  *(_BYTE *)(a1 + 212) = 0;
  *(_BYTE *)(a1 + 213) = 8;
  *(_QWORD *)(a1 + 214) = a23;
  *(_BYTE *)(a1 + 222) = 66;
  *(_BYTE *)(a1 + 223) = 8;
  *(_QWORD *)(a1 + 224) = a24;
  *(_BYTE *)(a1 + 232) = 0;
  *(_BYTE *)(a1 + 233) = 8;
  *(_QWORD *)(a1 + 234) = a25;
  *(_BYTE *)(a1 + 242) = 66;
  *(_BYTE *)(a1 + 243) = 8;
  *(_QWORD *)(a1 + 244) = a26;
  *(_BYTE *)(a1 + 252) = 0;
  *(_BYTE *)(a1 + 253) = 8;
  *(_QWORD *)(a1 + 254) = a27;
  return result;
}

void sub_21BF3DAE0()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

uint64_t __os_log_helper_16_2_24_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66_8_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  uint64_t result;

  result = a15;
  *(_BYTE *)a1 = 2;
  *(_BYTE *)(a1 + 1) = 24;
  *(_BYTE *)(a1 + 2) = 32;
  *(_BYTE *)(a1 + 3) = 8;
  *(_QWORD *)(a1 + 4) = a2;
  *(_BYTE *)(a1 + 12) = 66;
  *(_BYTE *)(a1 + 13) = 8;
  *(_QWORD *)(a1 + 14) = a3;
  *(_BYTE *)(a1 + 22) = 0;
  *(_BYTE *)(a1 + 23) = 8;
  *(_QWORD *)(a1 + 24) = a4;
  *(_BYTE *)(a1 + 32) = 66;
  *(_BYTE *)(a1 + 33) = 8;
  *(_QWORD *)(a1 + 34) = a5;
  *(_BYTE *)(a1 + 42) = 0;
  *(_BYTE *)(a1 + 43) = 8;
  *(_QWORD *)(a1 + 44) = a6;
  *(_BYTE *)(a1 + 52) = 66;
  *(_BYTE *)(a1 + 53) = 8;
  *(_QWORD *)(a1 + 54) = a7;
  *(_BYTE *)(a1 + 62) = 66;
  *(_BYTE *)(a1 + 63) = 8;
  *(_QWORD *)(a1 + 64) = a8;
  *(_BYTE *)(a1 + 72) = 66;
  *(_BYTE *)(a1 + 73) = 8;
  *(_QWORD *)(a1 + 74) = a9;
  *(_BYTE *)(a1 + 82) = 66;
  *(_BYTE *)(a1 + 83) = 8;
  *(_QWORD *)(a1 + 84) = a10;
  *(_BYTE *)(a1 + 92) = 0;
  *(_BYTE *)(a1 + 93) = 8;
  *(_QWORD *)(a1 + 94) = a11;
  *(_BYTE *)(a1 + 102) = 34;
  *(_BYTE *)(a1 + 103) = 8;
  *(_QWORD *)(a1 + 104) = a12;
  *(_BYTE *)(a1 + 112) = 34;
  *(_BYTE *)(a1 + 113) = 8;
  *(_QWORD *)(a1 + 114) = a13;
  *(_BYTE *)(a1 + 122) = 34;
  *(_BYTE *)(a1 + 123) = 8;
  *(_QWORD *)(a1 + 124) = a14;
  *(_BYTE *)(a1 + 132) = 66;
  *(_BYTE *)(a1 + 133) = 8;
  *(_QWORD *)(a1 + 134) = a15;
  *(_BYTE *)(a1 + 142) = 34;
  *(_BYTE *)(a1 + 143) = 8;
  *(_QWORD *)(a1 + 144) = a16;
  *(_BYTE *)(a1 + 152) = 66;
  *(_BYTE *)(a1 + 153) = 8;
  *(_QWORD *)(a1 + 154) = a17;
  *(_BYTE *)(a1 + 162) = 0;
  *(_BYTE *)(a1 + 163) = 8;
  *(_QWORD *)(a1 + 164) = a18;
  *(_BYTE *)(a1 + 172) = 0;
  *(_BYTE *)(a1 + 173) = 8;
  *(_QWORD *)(a1 + 174) = a19;
  *(_BYTE *)(a1 + 182) = 0;
  *(_BYTE *)(a1 + 183) = 8;
  *(_QWORD *)(a1 + 184) = a20;
  *(_BYTE *)(a1 + 192) = 0;
  *(_BYTE *)(a1 + 193) = 8;
  *(_QWORD *)(a1 + 194) = a21;
  *(_BYTE *)(a1 + 202) = 0;
  *(_BYTE *)(a1 + 203) = 8;
  *(_QWORD *)(a1 + 204) = a22;
  *(_BYTE *)(a1 + 212) = 0;
  *(_BYTE *)(a1 + 213) = 8;
  *(_QWORD *)(a1 + 214) = a23;
  *(_BYTE *)(a1 + 222) = 66;
  *(_BYTE *)(a1 + 223) = 8;
  *(_QWORD *)(a1 + 224) = a24;
  *(_BYTE *)(a1 + 232) = 2;
  *(_BYTE *)(a1 + 233) = 8;
  *(_QWORD *)(a1 + 234) = a25;
  return result;
}

uint64_t __os_log_helper_16_2_2_8_32_8_64(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  return result;
}

id getSUNetworkMonitorClass()
{
  id v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  int v11;
  int v12;
  uint64_t v13;

  v9 = 0;
  v10 = &v9;
  v11 = 1342177280;
  v12 = 32;
  v8 = getSUNetworkMonitorClass_softClass;
  v13 = getSUNetworkMonitorClass_softClass;
  if (!getSUNetworkMonitorClass_softClass)
  {
    v2 = MEMORY[0x24BDAC760];
    v3 = -1073741824;
    v4 = 0;
    v5 = __getSUNetworkMonitorClass_block_invoke;
    v6 = &unk_24DFF80D0;
    v7 = &v9;
    __getSUNetworkMonitorClass_block_invoke((uint64_t)&v2);
  }
  v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __os_log_helper_16_2_23_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  uint64_t result;

  result = a14;
  *(_BYTE *)a1 = 2;
  *(_BYTE *)(a1 + 1) = 23;
  *(_BYTE *)(a1 + 2) = 32;
  *(_BYTE *)(a1 + 3) = 8;
  *(_QWORD *)(a1 + 4) = a2;
  *(_BYTE *)(a1 + 12) = 66;
  *(_BYTE *)(a1 + 13) = 8;
  *(_QWORD *)(a1 + 14) = a3;
  *(_BYTE *)(a1 + 22) = 0;
  *(_BYTE *)(a1 + 23) = 8;
  *(_QWORD *)(a1 + 24) = a4;
  *(_BYTE *)(a1 + 32) = 66;
  *(_BYTE *)(a1 + 33) = 8;
  *(_QWORD *)(a1 + 34) = a5;
  *(_BYTE *)(a1 + 42) = 0;
  *(_BYTE *)(a1 + 43) = 8;
  *(_QWORD *)(a1 + 44) = a6;
  *(_BYTE *)(a1 + 52) = 66;
  *(_BYTE *)(a1 + 53) = 8;
  *(_QWORD *)(a1 + 54) = a7;
  *(_BYTE *)(a1 + 62) = 66;
  *(_BYTE *)(a1 + 63) = 8;
  *(_QWORD *)(a1 + 64) = a8;
  *(_BYTE *)(a1 + 72) = 66;
  *(_BYTE *)(a1 + 73) = 8;
  *(_QWORD *)(a1 + 74) = a9;
  *(_BYTE *)(a1 + 82) = 66;
  *(_BYTE *)(a1 + 83) = 8;
  *(_QWORD *)(a1 + 84) = a10;
  *(_BYTE *)(a1 + 92) = 0;
  *(_BYTE *)(a1 + 93) = 8;
  *(_QWORD *)(a1 + 94) = a11;
  *(_BYTE *)(a1 + 102) = 34;
  *(_BYTE *)(a1 + 103) = 8;
  *(_QWORD *)(a1 + 104) = a12;
  *(_BYTE *)(a1 + 112) = 34;
  *(_BYTE *)(a1 + 113) = 8;
  *(_QWORD *)(a1 + 114) = a13;
  *(_BYTE *)(a1 + 122) = 34;
  *(_BYTE *)(a1 + 123) = 8;
  *(_QWORD *)(a1 + 124) = a14;
  *(_BYTE *)(a1 + 132) = 66;
  *(_BYTE *)(a1 + 133) = 8;
  *(_QWORD *)(a1 + 134) = a15;
  *(_BYTE *)(a1 + 142) = 34;
  *(_BYTE *)(a1 + 143) = 8;
  *(_QWORD *)(a1 + 144) = a16;
  *(_BYTE *)(a1 + 152) = 66;
  *(_BYTE *)(a1 + 153) = 8;
  *(_QWORD *)(a1 + 154) = a17;
  *(_BYTE *)(a1 + 162) = 0;
  *(_BYTE *)(a1 + 163) = 8;
  *(_QWORD *)(a1 + 164) = a18;
  *(_BYTE *)(a1 + 172) = 0;
  *(_BYTE *)(a1 + 173) = 8;
  *(_QWORD *)(a1 + 174) = a19;
  *(_BYTE *)(a1 + 182) = 0;
  *(_BYTE *)(a1 + 183) = 8;
  *(_QWORD *)(a1 + 184) = a20;
  *(_BYTE *)(a1 + 192) = 0;
  *(_BYTE *)(a1 + 193) = 8;
  *(_QWORD *)(a1 + 194) = a21;
  *(_BYTE *)(a1 + 202) = 0;
  *(_BYTE *)(a1 + 203) = 8;
  *(_QWORD *)(a1 + 204) = a22;
  *(_BYTE *)(a1 + 212) = 0;
  *(_BYTE *)(a1 + 213) = 8;
  *(_QWORD *)(a1 + 214) = a23;
  *(_BYTE *)(a1 + 222) = 66;
  *(_BYTE *)(a1 + 223) = 8;
  *(_QWORD *)(a1 + 224) = a24;
  return result;
}

void sub_21BF42E3C()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

uint64_t __os_log_helper_16_2_3_8_32_8_64_8_0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  return result;
}

uint64_t __os_log_helper_16_2_24_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_4_0_8_66(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,int a24,uint64_t a25)
{
  uint64_t result;

  result = a15;
  *(_BYTE *)a1 = 2;
  *(_BYTE *)(a1 + 1) = 24;
  *(_BYTE *)(a1 + 2) = 32;
  *(_BYTE *)(a1 + 3) = 8;
  *(_QWORD *)(a1 + 4) = a2;
  *(_BYTE *)(a1 + 12) = 66;
  *(_BYTE *)(a1 + 13) = 8;
  *(_QWORD *)(a1 + 14) = a3;
  *(_BYTE *)(a1 + 22) = 0;
  *(_BYTE *)(a1 + 23) = 8;
  *(_QWORD *)(a1 + 24) = a4;
  *(_BYTE *)(a1 + 32) = 66;
  *(_BYTE *)(a1 + 33) = 8;
  *(_QWORD *)(a1 + 34) = a5;
  *(_BYTE *)(a1 + 42) = 0;
  *(_BYTE *)(a1 + 43) = 8;
  *(_QWORD *)(a1 + 44) = a6;
  *(_BYTE *)(a1 + 52) = 66;
  *(_BYTE *)(a1 + 53) = 8;
  *(_QWORD *)(a1 + 54) = a7;
  *(_BYTE *)(a1 + 62) = 66;
  *(_BYTE *)(a1 + 63) = 8;
  *(_QWORD *)(a1 + 64) = a8;
  *(_BYTE *)(a1 + 72) = 66;
  *(_BYTE *)(a1 + 73) = 8;
  *(_QWORD *)(a1 + 74) = a9;
  *(_BYTE *)(a1 + 82) = 66;
  *(_BYTE *)(a1 + 83) = 8;
  *(_QWORD *)(a1 + 84) = a10;
  *(_BYTE *)(a1 + 92) = 0;
  *(_BYTE *)(a1 + 93) = 8;
  *(_QWORD *)(a1 + 94) = a11;
  *(_BYTE *)(a1 + 102) = 34;
  *(_BYTE *)(a1 + 103) = 8;
  *(_QWORD *)(a1 + 104) = a12;
  *(_BYTE *)(a1 + 112) = 34;
  *(_BYTE *)(a1 + 113) = 8;
  *(_QWORD *)(a1 + 114) = a13;
  *(_BYTE *)(a1 + 122) = 34;
  *(_BYTE *)(a1 + 123) = 8;
  *(_QWORD *)(a1 + 124) = a14;
  *(_BYTE *)(a1 + 132) = 66;
  *(_BYTE *)(a1 + 133) = 8;
  *(_QWORD *)(a1 + 134) = a15;
  *(_BYTE *)(a1 + 142) = 34;
  *(_BYTE *)(a1 + 143) = 8;
  *(_QWORD *)(a1 + 144) = a16;
  *(_BYTE *)(a1 + 152) = 66;
  *(_BYTE *)(a1 + 153) = 8;
  *(_QWORD *)(a1 + 154) = a17;
  *(_BYTE *)(a1 + 162) = 0;
  *(_BYTE *)(a1 + 163) = 8;
  *(_QWORD *)(a1 + 164) = a18;
  *(_BYTE *)(a1 + 172) = 0;
  *(_BYTE *)(a1 + 173) = 8;
  *(_QWORD *)(a1 + 174) = a19;
  *(_BYTE *)(a1 + 182) = 0;
  *(_BYTE *)(a1 + 183) = 8;
  *(_QWORD *)(a1 + 184) = a20;
  *(_BYTE *)(a1 + 192) = 0;
  *(_BYTE *)(a1 + 193) = 8;
  *(_QWORD *)(a1 + 194) = a21;
  *(_BYTE *)(a1 + 202) = 0;
  *(_BYTE *)(a1 + 203) = 8;
  *(_QWORD *)(a1 + 204) = a22;
  *(_BYTE *)(a1 + 212) = 0;
  *(_BYTE *)(a1 + 213) = 8;
  *(_QWORD *)(a1 + 214) = a23;
  *(_BYTE *)(a1 + 222) = 0;
  *(_BYTE *)(a1 + 223) = 4;
  *(_DWORD *)(a1 + 224) = a24;
  *(_BYTE *)(a1 + 228) = 66;
  *(_BYTE *)(a1 + 229) = 8;
  *(_QWORD *)(a1 + 230) = a25;
  return result;
}

uint64_t __os_log_helper_16_2_23_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_4_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,int a24)
{
  uint64_t result;

  result = a15;
  *(_BYTE *)a1 = 2;
  *(_BYTE *)(a1 + 1) = 23;
  *(_BYTE *)(a1 + 2) = 32;
  *(_BYTE *)(a1 + 3) = 8;
  *(_QWORD *)(a1 + 4) = a2;
  *(_BYTE *)(a1 + 12) = 66;
  *(_BYTE *)(a1 + 13) = 8;
  *(_QWORD *)(a1 + 14) = a3;
  *(_BYTE *)(a1 + 22) = 0;
  *(_BYTE *)(a1 + 23) = 8;
  *(_QWORD *)(a1 + 24) = a4;
  *(_BYTE *)(a1 + 32) = 66;
  *(_BYTE *)(a1 + 33) = 8;
  *(_QWORD *)(a1 + 34) = a5;
  *(_BYTE *)(a1 + 42) = 0;
  *(_BYTE *)(a1 + 43) = 8;
  *(_QWORD *)(a1 + 44) = a6;
  *(_BYTE *)(a1 + 52) = 66;
  *(_BYTE *)(a1 + 53) = 8;
  *(_QWORD *)(a1 + 54) = a7;
  *(_BYTE *)(a1 + 62) = 66;
  *(_BYTE *)(a1 + 63) = 8;
  *(_QWORD *)(a1 + 64) = a8;
  *(_BYTE *)(a1 + 72) = 66;
  *(_BYTE *)(a1 + 73) = 8;
  *(_QWORD *)(a1 + 74) = a9;
  *(_BYTE *)(a1 + 82) = 66;
  *(_BYTE *)(a1 + 83) = 8;
  *(_QWORD *)(a1 + 84) = a10;
  *(_BYTE *)(a1 + 92) = 0;
  *(_BYTE *)(a1 + 93) = 8;
  *(_QWORD *)(a1 + 94) = a11;
  *(_BYTE *)(a1 + 102) = 34;
  *(_BYTE *)(a1 + 103) = 8;
  *(_QWORD *)(a1 + 104) = a12;
  *(_BYTE *)(a1 + 112) = 34;
  *(_BYTE *)(a1 + 113) = 8;
  *(_QWORD *)(a1 + 114) = a13;
  *(_BYTE *)(a1 + 122) = 34;
  *(_BYTE *)(a1 + 123) = 8;
  *(_QWORD *)(a1 + 124) = a14;
  *(_BYTE *)(a1 + 132) = 66;
  *(_BYTE *)(a1 + 133) = 8;
  *(_QWORD *)(a1 + 134) = a15;
  *(_BYTE *)(a1 + 142) = 34;
  *(_BYTE *)(a1 + 143) = 8;
  *(_QWORD *)(a1 + 144) = a16;
  *(_BYTE *)(a1 + 152) = 66;
  *(_BYTE *)(a1 + 153) = 8;
  *(_QWORD *)(a1 + 154) = a17;
  *(_BYTE *)(a1 + 162) = 0;
  *(_BYTE *)(a1 + 163) = 8;
  *(_QWORD *)(a1 + 164) = a18;
  *(_BYTE *)(a1 + 172) = 0;
  *(_BYTE *)(a1 + 173) = 8;
  *(_QWORD *)(a1 + 174) = a19;
  *(_BYTE *)(a1 + 182) = 0;
  *(_BYTE *)(a1 + 183) = 8;
  *(_QWORD *)(a1 + 184) = a20;
  *(_BYTE *)(a1 + 192) = 0;
  *(_BYTE *)(a1 + 193) = 8;
  *(_QWORD *)(a1 + 194) = a21;
  *(_BYTE *)(a1 + 202) = 0;
  *(_BYTE *)(a1 + 203) = 8;
  *(_QWORD *)(a1 + 204) = a22;
  *(_BYTE *)(a1 + 212) = 0;
  *(_BYTE *)(a1 + 213) = 8;
  *(_QWORD *)(a1 + 214) = a23;
  *(_BYTE *)(a1 + 222) = 0;
  *(_BYTE *)(a1 + 223) = 4;
  *(_DWORD *)(a1 + 224) = a24;
  return result;
}

uint64_t __os_log_helper_16_2_25_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_4_0_4_0_8_66(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,int a24,int a25,uint64_t a26)
{
  uint64_t result;

  result = a16;
  *(_BYTE *)a1 = 2;
  *(_BYTE *)(a1 + 1) = 25;
  *(_BYTE *)(a1 + 2) = 32;
  *(_BYTE *)(a1 + 3) = 8;
  *(_QWORD *)(a1 + 4) = a2;
  *(_BYTE *)(a1 + 12) = 66;
  *(_BYTE *)(a1 + 13) = 8;
  *(_QWORD *)(a1 + 14) = a3;
  *(_BYTE *)(a1 + 22) = 0;
  *(_BYTE *)(a1 + 23) = 8;
  *(_QWORD *)(a1 + 24) = a4;
  *(_BYTE *)(a1 + 32) = 66;
  *(_BYTE *)(a1 + 33) = 8;
  *(_QWORD *)(a1 + 34) = a5;
  *(_BYTE *)(a1 + 42) = 0;
  *(_BYTE *)(a1 + 43) = 8;
  *(_QWORD *)(a1 + 44) = a6;
  *(_BYTE *)(a1 + 52) = 66;
  *(_BYTE *)(a1 + 53) = 8;
  *(_QWORD *)(a1 + 54) = a7;
  *(_BYTE *)(a1 + 62) = 66;
  *(_BYTE *)(a1 + 63) = 8;
  *(_QWORD *)(a1 + 64) = a8;
  *(_BYTE *)(a1 + 72) = 66;
  *(_BYTE *)(a1 + 73) = 8;
  *(_QWORD *)(a1 + 74) = a9;
  *(_BYTE *)(a1 + 82) = 66;
  *(_BYTE *)(a1 + 83) = 8;
  *(_QWORD *)(a1 + 84) = a10;
  *(_BYTE *)(a1 + 92) = 0;
  *(_BYTE *)(a1 + 93) = 8;
  *(_QWORD *)(a1 + 94) = a11;
  *(_BYTE *)(a1 + 102) = 34;
  *(_BYTE *)(a1 + 103) = 8;
  *(_QWORD *)(a1 + 104) = a12;
  *(_BYTE *)(a1 + 112) = 34;
  *(_BYTE *)(a1 + 113) = 8;
  *(_QWORD *)(a1 + 114) = a13;
  *(_BYTE *)(a1 + 122) = 34;
  *(_BYTE *)(a1 + 123) = 8;
  *(_QWORD *)(a1 + 124) = a14;
  *(_BYTE *)(a1 + 132) = 66;
  *(_BYTE *)(a1 + 133) = 8;
  *(_QWORD *)(a1 + 134) = a15;
  *(_BYTE *)(a1 + 142) = 34;
  *(_BYTE *)(a1 + 143) = 8;
  *(_QWORD *)(a1 + 144) = a16;
  *(_BYTE *)(a1 + 152) = 66;
  *(_BYTE *)(a1 + 153) = 8;
  *(_QWORD *)(a1 + 154) = a17;
  *(_BYTE *)(a1 + 162) = 0;
  *(_BYTE *)(a1 + 163) = 8;
  *(_QWORD *)(a1 + 164) = a18;
  *(_BYTE *)(a1 + 172) = 0;
  *(_BYTE *)(a1 + 173) = 8;
  *(_QWORD *)(a1 + 174) = a19;
  *(_BYTE *)(a1 + 182) = 0;
  *(_BYTE *)(a1 + 183) = 8;
  *(_QWORD *)(a1 + 184) = a20;
  *(_BYTE *)(a1 + 192) = 0;
  *(_BYTE *)(a1 + 193) = 8;
  *(_QWORD *)(a1 + 194) = a21;
  *(_BYTE *)(a1 + 202) = 0;
  *(_BYTE *)(a1 + 203) = 8;
  *(_QWORD *)(a1 + 204) = a22;
  *(_BYTE *)(a1 + 212) = 0;
  *(_BYTE *)(a1 + 213) = 8;
  *(_QWORD *)(a1 + 214) = a23;
  *(_BYTE *)(a1 + 222) = 0;
  *(_BYTE *)(a1 + 223) = 4;
  *(_DWORD *)(a1 + 224) = a24;
  *(_BYTE *)(a1 + 228) = 0;
  *(_BYTE *)(a1 + 229) = 4;
  *(_DWORD *)(a1 + 230) = a25;
  *(_BYTE *)(a1 + 234) = 66;
  *(_BYTE *)(a1 + 235) = 8;
  *(_QWORD *)(a1 + 236) = a26;
  return result;
}

uint64_t __os_log_helper_16_2_24_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66_8_66(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  uint64_t result;

  result = a15;
  *(_BYTE *)a1 = 2;
  *(_BYTE *)(a1 + 1) = 24;
  *(_BYTE *)(a1 + 2) = 32;
  *(_BYTE *)(a1 + 3) = 8;
  *(_QWORD *)(a1 + 4) = a2;
  *(_BYTE *)(a1 + 12) = 66;
  *(_BYTE *)(a1 + 13) = 8;
  *(_QWORD *)(a1 + 14) = a3;
  *(_BYTE *)(a1 + 22) = 0;
  *(_BYTE *)(a1 + 23) = 8;
  *(_QWORD *)(a1 + 24) = a4;
  *(_BYTE *)(a1 + 32) = 66;
  *(_BYTE *)(a1 + 33) = 8;
  *(_QWORD *)(a1 + 34) = a5;
  *(_BYTE *)(a1 + 42) = 0;
  *(_BYTE *)(a1 + 43) = 8;
  *(_QWORD *)(a1 + 44) = a6;
  *(_BYTE *)(a1 + 52) = 66;
  *(_BYTE *)(a1 + 53) = 8;
  *(_QWORD *)(a1 + 54) = a7;
  *(_BYTE *)(a1 + 62) = 66;
  *(_BYTE *)(a1 + 63) = 8;
  *(_QWORD *)(a1 + 64) = a8;
  *(_BYTE *)(a1 + 72) = 66;
  *(_BYTE *)(a1 + 73) = 8;
  *(_QWORD *)(a1 + 74) = a9;
  *(_BYTE *)(a1 + 82) = 66;
  *(_BYTE *)(a1 + 83) = 8;
  *(_QWORD *)(a1 + 84) = a10;
  *(_BYTE *)(a1 + 92) = 0;
  *(_BYTE *)(a1 + 93) = 8;
  *(_QWORD *)(a1 + 94) = a11;
  *(_BYTE *)(a1 + 102) = 34;
  *(_BYTE *)(a1 + 103) = 8;
  *(_QWORD *)(a1 + 104) = a12;
  *(_BYTE *)(a1 + 112) = 34;
  *(_BYTE *)(a1 + 113) = 8;
  *(_QWORD *)(a1 + 114) = a13;
  *(_BYTE *)(a1 + 122) = 34;
  *(_BYTE *)(a1 + 123) = 8;
  *(_QWORD *)(a1 + 124) = a14;
  *(_BYTE *)(a1 + 132) = 66;
  *(_BYTE *)(a1 + 133) = 8;
  *(_QWORD *)(a1 + 134) = a15;
  *(_BYTE *)(a1 + 142) = 34;
  *(_BYTE *)(a1 + 143) = 8;
  *(_QWORD *)(a1 + 144) = a16;
  *(_BYTE *)(a1 + 152) = 66;
  *(_BYTE *)(a1 + 153) = 8;
  *(_QWORD *)(a1 + 154) = a17;
  *(_BYTE *)(a1 + 162) = 0;
  *(_BYTE *)(a1 + 163) = 8;
  *(_QWORD *)(a1 + 164) = a18;
  *(_BYTE *)(a1 + 172) = 0;
  *(_BYTE *)(a1 + 173) = 8;
  *(_QWORD *)(a1 + 174) = a19;
  *(_BYTE *)(a1 + 182) = 0;
  *(_BYTE *)(a1 + 183) = 8;
  *(_QWORD *)(a1 + 184) = a20;
  *(_BYTE *)(a1 + 192) = 0;
  *(_BYTE *)(a1 + 193) = 8;
  *(_QWORD *)(a1 + 194) = a21;
  *(_BYTE *)(a1 + 202) = 0;
  *(_BYTE *)(a1 + 203) = 8;
  *(_QWORD *)(a1 + 204) = a22;
  *(_BYTE *)(a1 + 212) = 0;
  *(_BYTE *)(a1 + 213) = 8;
  *(_QWORD *)(a1 + 214) = a23;
  *(_BYTE *)(a1 + 222) = 66;
  *(_BYTE *)(a1 + 223) = 8;
  *(_QWORD *)(a1 + 224) = a24;
  *(_BYTE *)(a1 + 232) = 66;
  *(_BYTE *)(a1 + 233) = 8;
  *(_QWORD *)(a1 + 234) = a25;
  return result;
}

uint64_t __os_log_helper_16_2_24_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_34_8_66(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  uint64_t result;

  result = a15;
  *(_BYTE *)a1 = 2;
  *(_BYTE *)(a1 + 1) = 24;
  *(_BYTE *)(a1 + 2) = 32;
  *(_BYTE *)(a1 + 3) = 8;
  *(_QWORD *)(a1 + 4) = a2;
  *(_BYTE *)(a1 + 12) = 66;
  *(_BYTE *)(a1 + 13) = 8;
  *(_QWORD *)(a1 + 14) = a3;
  *(_BYTE *)(a1 + 22) = 0;
  *(_BYTE *)(a1 + 23) = 8;
  *(_QWORD *)(a1 + 24) = a4;
  *(_BYTE *)(a1 + 32) = 66;
  *(_BYTE *)(a1 + 33) = 8;
  *(_QWORD *)(a1 + 34) = a5;
  *(_BYTE *)(a1 + 42) = 0;
  *(_BYTE *)(a1 + 43) = 8;
  *(_QWORD *)(a1 + 44) = a6;
  *(_BYTE *)(a1 + 52) = 66;
  *(_BYTE *)(a1 + 53) = 8;
  *(_QWORD *)(a1 + 54) = a7;
  *(_BYTE *)(a1 + 62) = 66;
  *(_BYTE *)(a1 + 63) = 8;
  *(_QWORD *)(a1 + 64) = a8;
  *(_BYTE *)(a1 + 72) = 66;
  *(_BYTE *)(a1 + 73) = 8;
  *(_QWORD *)(a1 + 74) = a9;
  *(_BYTE *)(a1 + 82) = 66;
  *(_BYTE *)(a1 + 83) = 8;
  *(_QWORD *)(a1 + 84) = a10;
  *(_BYTE *)(a1 + 92) = 0;
  *(_BYTE *)(a1 + 93) = 8;
  *(_QWORD *)(a1 + 94) = a11;
  *(_BYTE *)(a1 + 102) = 34;
  *(_BYTE *)(a1 + 103) = 8;
  *(_QWORD *)(a1 + 104) = a12;
  *(_BYTE *)(a1 + 112) = 34;
  *(_BYTE *)(a1 + 113) = 8;
  *(_QWORD *)(a1 + 114) = a13;
  *(_BYTE *)(a1 + 122) = 34;
  *(_BYTE *)(a1 + 123) = 8;
  *(_QWORD *)(a1 + 124) = a14;
  *(_BYTE *)(a1 + 132) = 66;
  *(_BYTE *)(a1 + 133) = 8;
  *(_QWORD *)(a1 + 134) = a15;
  *(_BYTE *)(a1 + 142) = 34;
  *(_BYTE *)(a1 + 143) = 8;
  *(_QWORD *)(a1 + 144) = a16;
  *(_BYTE *)(a1 + 152) = 66;
  *(_BYTE *)(a1 + 153) = 8;
  *(_QWORD *)(a1 + 154) = a17;
  *(_BYTE *)(a1 + 162) = 0;
  *(_BYTE *)(a1 + 163) = 8;
  *(_QWORD *)(a1 + 164) = a18;
  *(_BYTE *)(a1 + 172) = 0;
  *(_BYTE *)(a1 + 173) = 8;
  *(_QWORD *)(a1 + 174) = a19;
  *(_BYTE *)(a1 + 182) = 0;
  *(_BYTE *)(a1 + 183) = 8;
  *(_QWORD *)(a1 + 184) = a20;
  *(_BYTE *)(a1 + 192) = 0;
  *(_BYTE *)(a1 + 193) = 8;
  *(_QWORD *)(a1 + 194) = a21;
  *(_BYTE *)(a1 + 202) = 0;
  *(_BYTE *)(a1 + 203) = 8;
  *(_QWORD *)(a1 + 204) = a22;
  *(_BYTE *)(a1 + 212) = 0;
  *(_BYTE *)(a1 + 213) = 8;
  *(_QWORD *)(a1 + 214) = a23;
  *(_BYTE *)(a1 + 222) = 34;
  *(_BYTE *)(a1 + 223) = 8;
  *(_QWORD *)(a1 + 224) = a24;
  *(_BYTE *)(a1 + 232) = 66;
  *(_BYTE *)(a1 + 233) = 8;
  *(_QWORD *)(a1 + 234) = a25;
  return result;
}

uint64_t __os_log_helper_16_2_24_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  uint64_t result;

  result = a15;
  *(_BYTE *)a1 = 2;
  *(_BYTE *)(a1 + 1) = 24;
  *(_BYTE *)(a1 + 2) = 32;
  *(_BYTE *)(a1 + 3) = 8;
  *(_QWORD *)(a1 + 4) = a2;
  *(_BYTE *)(a1 + 12) = 66;
  *(_BYTE *)(a1 + 13) = 8;
  *(_QWORD *)(a1 + 14) = a3;
  *(_BYTE *)(a1 + 22) = 0;
  *(_BYTE *)(a1 + 23) = 8;
  *(_QWORD *)(a1 + 24) = a4;
  *(_BYTE *)(a1 + 32) = 66;
  *(_BYTE *)(a1 + 33) = 8;
  *(_QWORD *)(a1 + 34) = a5;
  *(_BYTE *)(a1 + 42) = 0;
  *(_BYTE *)(a1 + 43) = 8;
  *(_QWORD *)(a1 + 44) = a6;
  *(_BYTE *)(a1 + 52) = 66;
  *(_BYTE *)(a1 + 53) = 8;
  *(_QWORD *)(a1 + 54) = a7;
  *(_BYTE *)(a1 + 62) = 66;
  *(_BYTE *)(a1 + 63) = 8;
  *(_QWORD *)(a1 + 64) = a8;
  *(_BYTE *)(a1 + 72) = 66;
  *(_BYTE *)(a1 + 73) = 8;
  *(_QWORD *)(a1 + 74) = a9;
  *(_BYTE *)(a1 + 82) = 66;
  *(_BYTE *)(a1 + 83) = 8;
  *(_QWORD *)(a1 + 84) = a10;
  *(_BYTE *)(a1 + 92) = 0;
  *(_BYTE *)(a1 + 93) = 8;
  *(_QWORD *)(a1 + 94) = a11;
  *(_BYTE *)(a1 + 102) = 34;
  *(_BYTE *)(a1 + 103) = 8;
  *(_QWORD *)(a1 + 104) = a12;
  *(_BYTE *)(a1 + 112) = 34;
  *(_BYTE *)(a1 + 113) = 8;
  *(_QWORD *)(a1 + 114) = a13;
  *(_BYTE *)(a1 + 122) = 34;
  *(_BYTE *)(a1 + 123) = 8;
  *(_QWORD *)(a1 + 124) = a14;
  *(_BYTE *)(a1 + 132) = 66;
  *(_BYTE *)(a1 + 133) = 8;
  *(_QWORD *)(a1 + 134) = a15;
  *(_BYTE *)(a1 + 142) = 34;
  *(_BYTE *)(a1 + 143) = 8;
  *(_QWORD *)(a1 + 144) = a16;
  *(_BYTE *)(a1 + 152) = 66;
  *(_BYTE *)(a1 + 153) = 8;
  *(_QWORD *)(a1 + 154) = a17;
  *(_BYTE *)(a1 + 162) = 0;
  *(_BYTE *)(a1 + 163) = 8;
  *(_QWORD *)(a1 + 164) = a18;
  *(_BYTE *)(a1 + 172) = 0;
  *(_BYTE *)(a1 + 173) = 8;
  *(_QWORD *)(a1 + 174) = a19;
  *(_BYTE *)(a1 + 182) = 0;
  *(_BYTE *)(a1 + 183) = 8;
  *(_QWORD *)(a1 + 184) = a20;
  *(_BYTE *)(a1 + 192) = 0;
  *(_BYTE *)(a1 + 193) = 8;
  *(_QWORD *)(a1 + 194) = a21;
  *(_BYTE *)(a1 + 202) = 0;
  *(_BYTE *)(a1 + 203) = 8;
  *(_QWORD *)(a1 + 204) = a22;
  *(_BYTE *)(a1 + 212) = 0;
  *(_BYTE *)(a1 + 213) = 8;
  *(_QWORD *)(a1 + 214) = a23;
  *(_BYTE *)(a1 + 222) = 0;
  *(_BYTE *)(a1 + 223) = 8;
  *(_QWORD *)(a1 + 224) = a24;
  *(_BYTE *)(a1 + 232) = 0;
  *(_BYTE *)(a1 + 233) = 8;
  *(_QWORD *)(a1 + 234) = a25;
  return result;
}

uint64_t __os_log_helper_16_2_25_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_66(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  uint64_t result;

  result = a16;
  *(_BYTE *)a1 = 2;
  *(_BYTE *)(a1 + 1) = 25;
  *(_BYTE *)(a1 + 2) = 32;
  *(_BYTE *)(a1 + 3) = 8;
  *(_QWORD *)(a1 + 4) = a2;
  *(_BYTE *)(a1 + 12) = 66;
  *(_BYTE *)(a1 + 13) = 8;
  *(_QWORD *)(a1 + 14) = a3;
  *(_BYTE *)(a1 + 22) = 0;
  *(_BYTE *)(a1 + 23) = 8;
  *(_QWORD *)(a1 + 24) = a4;
  *(_BYTE *)(a1 + 32) = 66;
  *(_BYTE *)(a1 + 33) = 8;
  *(_QWORD *)(a1 + 34) = a5;
  *(_BYTE *)(a1 + 42) = 0;
  *(_BYTE *)(a1 + 43) = 8;
  *(_QWORD *)(a1 + 44) = a6;
  *(_BYTE *)(a1 + 52) = 66;
  *(_BYTE *)(a1 + 53) = 8;
  *(_QWORD *)(a1 + 54) = a7;
  *(_BYTE *)(a1 + 62) = 66;
  *(_BYTE *)(a1 + 63) = 8;
  *(_QWORD *)(a1 + 64) = a8;
  *(_BYTE *)(a1 + 72) = 66;
  *(_BYTE *)(a1 + 73) = 8;
  *(_QWORD *)(a1 + 74) = a9;
  *(_BYTE *)(a1 + 82) = 66;
  *(_BYTE *)(a1 + 83) = 8;
  *(_QWORD *)(a1 + 84) = a10;
  *(_BYTE *)(a1 + 92) = 0;
  *(_BYTE *)(a1 + 93) = 8;
  *(_QWORD *)(a1 + 94) = a11;
  *(_BYTE *)(a1 + 102) = 34;
  *(_BYTE *)(a1 + 103) = 8;
  *(_QWORD *)(a1 + 104) = a12;
  *(_BYTE *)(a1 + 112) = 34;
  *(_BYTE *)(a1 + 113) = 8;
  *(_QWORD *)(a1 + 114) = a13;
  *(_BYTE *)(a1 + 122) = 34;
  *(_BYTE *)(a1 + 123) = 8;
  *(_QWORD *)(a1 + 124) = a14;
  *(_BYTE *)(a1 + 132) = 66;
  *(_BYTE *)(a1 + 133) = 8;
  *(_QWORD *)(a1 + 134) = a15;
  *(_BYTE *)(a1 + 142) = 34;
  *(_BYTE *)(a1 + 143) = 8;
  *(_QWORD *)(a1 + 144) = a16;
  *(_BYTE *)(a1 + 152) = 66;
  *(_BYTE *)(a1 + 153) = 8;
  *(_QWORD *)(a1 + 154) = a17;
  *(_BYTE *)(a1 + 162) = 0;
  *(_BYTE *)(a1 + 163) = 8;
  *(_QWORD *)(a1 + 164) = a18;
  *(_BYTE *)(a1 + 172) = 0;
  *(_BYTE *)(a1 + 173) = 8;
  *(_QWORD *)(a1 + 174) = a19;
  *(_BYTE *)(a1 + 182) = 0;
  *(_BYTE *)(a1 + 183) = 8;
  *(_QWORD *)(a1 + 184) = a20;
  *(_BYTE *)(a1 + 192) = 0;
  *(_BYTE *)(a1 + 193) = 8;
  *(_QWORD *)(a1 + 194) = a21;
  *(_BYTE *)(a1 + 202) = 0;
  *(_BYTE *)(a1 + 203) = 8;
  *(_QWORD *)(a1 + 204) = a22;
  *(_BYTE *)(a1 + 212) = 0;
  *(_BYTE *)(a1 + 213) = 8;
  *(_QWORD *)(a1 + 214) = a23;
  *(_BYTE *)(a1 + 222) = 0;
  *(_BYTE *)(a1 + 223) = 8;
  *(_QWORD *)(a1 + 224) = a24;
  *(_BYTE *)(a1 + 232) = 0;
  *(_BYTE *)(a1 + 233) = 8;
  *(_QWORD *)(a1 + 234) = a25;
  *(_BYTE *)(a1 + 242) = 66;
  *(_BYTE *)(a1 + 243) = 8;
  *(_QWORD *)(a1 + 244) = a26;
  return result;
}

uint64_t __os_log_helper_16_2_25_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66_8_0_8_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  uint64_t result;

  result = a16;
  *(_BYTE *)a1 = 2;
  *(_BYTE *)(a1 + 1) = 25;
  *(_BYTE *)(a1 + 2) = 32;
  *(_BYTE *)(a1 + 3) = 8;
  *(_QWORD *)(a1 + 4) = a2;
  *(_BYTE *)(a1 + 12) = 66;
  *(_BYTE *)(a1 + 13) = 8;
  *(_QWORD *)(a1 + 14) = a3;
  *(_BYTE *)(a1 + 22) = 0;
  *(_BYTE *)(a1 + 23) = 8;
  *(_QWORD *)(a1 + 24) = a4;
  *(_BYTE *)(a1 + 32) = 66;
  *(_BYTE *)(a1 + 33) = 8;
  *(_QWORD *)(a1 + 34) = a5;
  *(_BYTE *)(a1 + 42) = 0;
  *(_BYTE *)(a1 + 43) = 8;
  *(_QWORD *)(a1 + 44) = a6;
  *(_BYTE *)(a1 + 52) = 66;
  *(_BYTE *)(a1 + 53) = 8;
  *(_QWORD *)(a1 + 54) = a7;
  *(_BYTE *)(a1 + 62) = 66;
  *(_BYTE *)(a1 + 63) = 8;
  *(_QWORD *)(a1 + 64) = a8;
  *(_BYTE *)(a1 + 72) = 66;
  *(_BYTE *)(a1 + 73) = 8;
  *(_QWORD *)(a1 + 74) = a9;
  *(_BYTE *)(a1 + 82) = 66;
  *(_BYTE *)(a1 + 83) = 8;
  *(_QWORD *)(a1 + 84) = a10;
  *(_BYTE *)(a1 + 92) = 0;
  *(_BYTE *)(a1 + 93) = 8;
  *(_QWORD *)(a1 + 94) = a11;
  *(_BYTE *)(a1 + 102) = 34;
  *(_BYTE *)(a1 + 103) = 8;
  *(_QWORD *)(a1 + 104) = a12;
  *(_BYTE *)(a1 + 112) = 34;
  *(_BYTE *)(a1 + 113) = 8;
  *(_QWORD *)(a1 + 114) = a13;
  *(_BYTE *)(a1 + 122) = 34;
  *(_BYTE *)(a1 + 123) = 8;
  *(_QWORD *)(a1 + 124) = a14;
  *(_BYTE *)(a1 + 132) = 66;
  *(_BYTE *)(a1 + 133) = 8;
  *(_QWORD *)(a1 + 134) = a15;
  *(_BYTE *)(a1 + 142) = 34;
  *(_BYTE *)(a1 + 143) = 8;
  *(_QWORD *)(a1 + 144) = a16;
  *(_BYTE *)(a1 + 152) = 66;
  *(_BYTE *)(a1 + 153) = 8;
  *(_QWORD *)(a1 + 154) = a17;
  *(_BYTE *)(a1 + 162) = 0;
  *(_BYTE *)(a1 + 163) = 8;
  *(_QWORD *)(a1 + 164) = a18;
  *(_BYTE *)(a1 + 172) = 0;
  *(_BYTE *)(a1 + 173) = 8;
  *(_QWORD *)(a1 + 174) = a19;
  *(_BYTE *)(a1 + 182) = 0;
  *(_BYTE *)(a1 + 183) = 8;
  *(_QWORD *)(a1 + 184) = a20;
  *(_BYTE *)(a1 + 192) = 0;
  *(_BYTE *)(a1 + 193) = 8;
  *(_QWORD *)(a1 + 194) = a21;
  *(_BYTE *)(a1 + 202) = 0;
  *(_BYTE *)(a1 + 203) = 8;
  *(_QWORD *)(a1 + 204) = a22;
  *(_BYTE *)(a1 + 212) = 0;
  *(_BYTE *)(a1 + 213) = 8;
  *(_QWORD *)(a1 + 214) = a23;
  *(_BYTE *)(a1 + 222) = 66;
  *(_BYTE *)(a1 + 223) = 8;
  *(_QWORD *)(a1 + 224) = a24;
  *(_BYTE *)(a1 + 232) = 0;
  *(_BYTE *)(a1 + 233) = 8;
  *(_QWORD *)(a1 + 234) = a25;
  *(_BYTE *)(a1 + 242) = 0;
  *(_BYTE *)(a1 + 243) = 8;
  *(_QWORD *)(a1 + 244) = a26;
  return result;
}

uint64_t __os_log_helper_16_2_26_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66_8_66_8_34_8_66(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  uint64_t result;

  result = a17;
  *(_BYTE *)a1 = 2;
  *(_BYTE *)(a1 + 1) = 26;
  *(_BYTE *)(a1 + 2) = 32;
  *(_BYTE *)(a1 + 3) = 8;
  *(_QWORD *)(a1 + 4) = a2;
  *(_BYTE *)(a1 + 12) = 66;
  *(_BYTE *)(a1 + 13) = 8;
  *(_QWORD *)(a1 + 14) = a3;
  *(_BYTE *)(a1 + 22) = 0;
  *(_BYTE *)(a1 + 23) = 8;
  *(_QWORD *)(a1 + 24) = a4;
  *(_BYTE *)(a1 + 32) = 66;
  *(_BYTE *)(a1 + 33) = 8;
  *(_QWORD *)(a1 + 34) = a5;
  *(_BYTE *)(a1 + 42) = 0;
  *(_BYTE *)(a1 + 43) = 8;
  *(_QWORD *)(a1 + 44) = a6;
  *(_BYTE *)(a1 + 52) = 66;
  *(_BYTE *)(a1 + 53) = 8;
  *(_QWORD *)(a1 + 54) = a7;
  *(_BYTE *)(a1 + 62) = 66;
  *(_BYTE *)(a1 + 63) = 8;
  *(_QWORD *)(a1 + 64) = a8;
  *(_BYTE *)(a1 + 72) = 66;
  *(_BYTE *)(a1 + 73) = 8;
  *(_QWORD *)(a1 + 74) = a9;
  *(_BYTE *)(a1 + 82) = 66;
  *(_BYTE *)(a1 + 83) = 8;
  *(_QWORD *)(a1 + 84) = a10;
  *(_BYTE *)(a1 + 92) = 0;
  *(_BYTE *)(a1 + 93) = 8;
  *(_QWORD *)(a1 + 94) = a11;
  *(_BYTE *)(a1 + 102) = 34;
  *(_BYTE *)(a1 + 103) = 8;
  *(_QWORD *)(a1 + 104) = a12;
  *(_BYTE *)(a1 + 112) = 34;
  *(_BYTE *)(a1 + 113) = 8;
  *(_QWORD *)(a1 + 114) = a13;
  *(_BYTE *)(a1 + 122) = 34;
  *(_BYTE *)(a1 + 123) = 8;
  *(_QWORD *)(a1 + 124) = a14;
  *(_BYTE *)(a1 + 132) = 66;
  *(_BYTE *)(a1 + 133) = 8;
  *(_QWORD *)(a1 + 134) = a15;
  *(_BYTE *)(a1 + 142) = 34;
  *(_BYTE *)(a1 + 143) = 8;
  *(_QWORD *)(a1 + 144) = a16;
  *(_BYTE *)(a1 + 152) = 66;
  *(_BYTE *)(a1 + 153) = 8;
  *(_QWORD *)(a1 + 154) = a17;
  *(_BYTE *)(a1 + 162) = 0;
  *(_BYTE *)(a1 + 163) = 8;
  *(_QWORD *)(a1 + 164) = a18;
  *(_BYTE *)(a1 + 172) = 0;
  *(_BYTE *)(a1 + 173) = 8;
  *(_QWORD *)(a1 + 174) = a19;
  *(_BYTE *)(a1 + 182) = 0;
  *(_BYTE *)(a1 + 183) = 8;
  *(_QWORD *)(a1 + 184) = a20;
  *(_BYTE *)(a1 + 192) = 0;
  *(_BYTE *)(a1 + 193) = 8;
  *(_QWORD *)(a1 + 194) = a21;
  *(_BYTE *)(a1 + 202) = 0;
  *(_BYTE *)(a1 + 203) = 8;
  *(_QWORD *)(a1 + 204) = a22;
  *(_BYTE *)(a1 + 212) = 0;
  *(_BYTE *)(a1 + 213) = 8;
  *(_QWORD *)(a1 + 214) = a23;
  *(_BYTE *)(a1 + 222) = 66;
  *(_BYTE *)(a1 + 223) = 8;
  *(_QWORD *)(a1 + 224) = a24;
  *(_BYTE *)(a1 + 232) = 66;
  *(_BYTE *)(a1 + 233) = 8;
  *(_QWORD *)(a1 + 234) = a25;
  *(_BYTE *)(a1 + 242) = 34;
  *(_BYTE *)(a1 + 243) = 8;
  *(_QWORD *)(a1 + 244) = a26;
  *(_BYTE *)(a1 + 252) = 66;
  *(_BYTE *)(a1 + 253) = 8;
  *(_QWORD *)(a1 + 254) = a27;
  return result;
}

void sub_21BF598F0()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

uint64_t __os_log_helper_16_2_28_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_64_4_0_8_66_4_0_8_66_4_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,int a25,uint64_t a26,int a27,uint64_t a28,int a29)
{
  uint64_t result;

  result = a20;
  *(_BYTE *)a1 = 2;
  *(_BYTE *)(a1 + 1) = 28;
  *(_BYTE *)(a1 + 2) = 32;
  *(_BYTE *)(a1 + 3) = 8;
  *(_QWORD *)(a1 + 4) = a2;
  *(_BYTE *)(a1 + 12) = 66;
  *(_BYTE *)(a1 + 13) = 8;
  *(_QWORD *)(a1 + 14) = a3;
  *(_BYTE *)(a1 + 22) = 0;
  *(_BYTE *)(a1 + 23) = 8;
  *(_QWORD *)(a1 + 24) = a4;
  *(_BYTE *)(a1 + 32) = 66;
  *(_BYTE *)(a1 + 33) = 8;
  *(_QWORD *)(a1 + 34) = a5;
  *(_BYTE *)(a1 + 42) = 0;
  *(_BYTE *)(a1 + 43) = 8;
  *(_QWORD *)(a1 + 44) = a6;
  *(_BYTE *)(a1 + 52) = 66;
  *(_BYTE *)(a1 + 53) = 8;
  *(_QWORD *)(a1 + 54) = a7;
  *(_BYTE *)(a1 + 62) = 66;
  *(_BYTE *)(a1 + 63) = 8;
  *(_QWORD *)(a1 + 64) = a8;
  *(_BYTE *)(a1 + 72) = 66;
  *(_BYTE *)(a1 + 73) = 8;
  *(_QWORD *)(a1 + 74) = a9;
  *(_BYTE *)(a1 + 82) = 66;
  *(_BYTE *)(a1 + 83) = 8;
  *(_QWORD *)(a1 + 84) = a10;
  *(_BYTE *)(a1 + 92) = 0;
  *(_BYTE *)(a1 + 93) = 8;
  *(_QWORD *)(a1 + 94) = a11;
  *(_BYTE *)(a1 + 102) = 34;
  *(_BYTE *)(a1 + 103) = 8;
  *(_QWORD *)(a1 + 104) = a12;
  *(_BYTE *)(a1 + 112) = 34;
  *(_BYTE *)(a1 + 113) = 8;
  *(_QWORD *)(a1 + 114) = a13;
  *(_BYTE *)(a1 + 122) = 34;
  *(_BYTE *)(a1 + 123) = 8;
  *(_QWORD *)(a1 + 124) = a14;
  *(_BYTE *)(a1 + 132) = 66;
  *(_BYTE *)(a1 + 133) = 8;
  *(_QWORD *)(a1 + 134) = a15;
  *(_BYTE *)(a1 + 142) = 34;
  *(_BYTE *)(a1 + 143) = 8;
  *(_QWORD *)(a1 + 144) = a16;
  *(_BYTE *)(a1 + 152) = 66;
  *(_BYTE *)(a1 + 153) = 8;
  *(_QWORD *)(a1 + 154) = a17;
  *(_BYTE *)(a1 + 162) = 0;
  *(_BYTE *)(a1 + 163) = 8;
  *(_QWORD *)(a1 + 164) = a18;
  *(_BYTE *)(a1 + 172) = 0;
  *(_BYTE *)(a1 + 173) = 8;
  *(_QWORD *)(a1 + 174) = a19;
  *(_BYTE *)(a1 + 182) = 0;
  *(_BYTE *)(a1 + 183) = 8;
  *(_QWORD *)(a1 + 184) = a20;
  *(_BYTE *)(a1 + 192) = 0;
  *(_BYTE *)(a1 + 193) = 8;
  *(_QWORD *)(a1 + 194) = a21;
  *(_BYTE *)(a1 + 202) = 0;
  *(_BYTE *)(a1 + 203) = 8;
  *(_QWORD *)(a1 + 204) = a22;
  *(_BYTE *)(a1 + 212) = 0;
  *(_BYTE *)(a1 + 213) = 8;
  *(_QWORD *)(a1 + 214) = a23;
  *(_BYTE *)(a1 + 222) = 64;
  *(_BYTE *)(a1 + 223) = 8;
  *(_QWORD *)(a1 + 224) = a24;
  *(_BYTE *)(a1 + 232) = 0;
  *(_BYTE *)(a1 + 233) = 4;
  *(_DWORD *)(a1 + 234) = a25;
  *(_BYTE *)(a1 + 238) = 66;
  *(_BYTE *)(a1 + 239) = 8;
  *(_QWORD *)(a1 + 240) = a26;
  *(_BYTE *)(a1 + 248) = 0;
  *(_BYTE *)(a1 + 249) = 4;
  *(_DWORD *)(a1 + 250) = a27;
  *(_BYTE *)(a1 + 254) = 66;
  *(_BYTE *)(a1 + 255) = 8;
  *(_QWORD *)(a1 + 256) = a28;
  *(_BYTE *)(a1 + 264) = 0;
  *(_BYTE *)(a1 + 265) = 4;
  *(_DWORD *)(a1 + 266) = a29;
  return result;
}

void sub_21BF5B1B8()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

uint64_t __os_log_helper_16_2_3_8_32_8_66_8_66(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 66;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  return result;
}

uint64_t __os_log_helper_16_2_24_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66_8_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  uint64_t result;

  result = a15;
  *(_BYTE *)a1 = 2;
  *(_BYTE *)(a1 + 1) = 24;
  *(_BYTE *)(a1 + 2) = 32;
  *(_BYTE *)(a1 + 3) = 8;
  *(_QWORD *)(a1 + 4) = a2;
  *(_BYTE *)(a1 + 12) = 66;
  *(_BYTE *)(a1 + 13) = 8;
  *(_QWORD *)(a1 + 14) = a3;
  *(_BYTE *)(a1 + 22) = 0;
  *(_BYTE *)(a1 + 23) = 8;
  *(_QWORD *)(a1 + 24) = a4;
  *(_BYTE *)(a1 + 32) = 66;
  *(_BYTE *)(a1 + 33) = 8;
  *(_QWORD *)(a1 + 34) = a5;
  *(_BYTE *)(a1 + 42) = 0;
  *(_BYTE *)(a1 + 43) = 8;
  *(_QWORD *)(a1 + 44) = a6;
  *(_BYTE *)(a1 + 52) = 66;
  *(_BYTE *)(a1 + 53) = 8;
  *(_QWORD *)(a1 + 54) = a7;
  *(_BYTE *)(a1 + 62) = 66;
  *(_BYTE *)(a1 + 63) = 8;
  *(_QWORD *)(a1 + 64) = a8;
  *(_BYTE *)(a1 + 72) = 66;
  *(_BYTE *)(a1 + 73) = 8;
  *(_QWORD *)(a1 + 74) = a9;
  *(_BYTE *)(a1 + 82) = 66;
  *(_BYTE *)(a1 + 83) = 8;
  *(_QWORD *)(a1 + 84) = a10;
  *(_BYTE *)(a1 + 92) = 0;
  *(_BYTE *)(a1 + 93) = 8;
  *(_QWORD *)(a1 + 94) = a11;
  *(_BYTE *)(a1 + 102) = 34;
  *(_BYTE *)(a1 + 103) = 8;
  *(_QWORD *)(a1 + 104) = a12;
  *(_BYTE *)(a1 + 112) = 34;
  *(_BYTE *)(a1 + 113) = 8;
  *(_QWORD *)(a1 + 114) = a13;
  *(_BYTE *)(a1 + 122) = 34;
  *(_BYTE *)(a1 + 123) = 8;
  *(_QWORD *)(a1 + 124) = a14;
  *(_BYTE *)(a1 + 132) = 66;
  *(_BYTE *)(a1 + 133) = 8;
  *(_QWORD *)(a1 + 134) = a15;
  *(_BYTE *)(a1 + 142) = 34;
  *(_BYTE *)(a1 + 143) = 8;
  *(_QWORD *)(a1 + 144) = a16;
  *(_BYTE *)(a1 + 152) = 66;
  *(_BYTE *)(a1 + 153) = 8;
  *(_QWORD *)(a1 + 154) = a17;
  *(_BYTE *)(a1 + 162) = 0;
  *(_BYTE *)(a1 + 163) = 8;
  *(_QWORD *)(a1 + 164) = a18;
  *(_BYTE *)(a1 + 172) = 0;
  *(_BYTE *)(a1 + 173) = 8;
  *(_QWORD *)(a1 + 174) = a19;
  *(_BYTE *)(a1 + 182) = 0;
  *(_BYTE *)(a1 + 183) = 8;
  *(_QWORD *)(a1 + 184) = a20;
  *(_BYTE *)(a1 + 192) = 0;
  *(_BYTE *)(a1 + 193) = 8;
  *(_QWORD *)(a1 + 194) = a21;
  *(_BYTE *)(a1 + 202) = 0;
  *(_BYTE *)(a1 + 203) = 8;
  *(_QWORD *)(a1 + 204) = a22;
  *(_BYTE *)(a1 + 212) = 0;
  *(_BYTE *)(a1 + 213) = 8;
  *(_QWORD *)(a1 + 214) = a23;
  *(_BYTE *)(a1 + 222) = 66;
  *(_BYTE *)(a1 + 223) = 8;
  *(_QWORD *)(a1 + 224) = a24;
  *(_BYTE *)(a1 + 232) = 0;
  *(_BYTE *)(a1 + 233) = 8;
  *(_QWORD *)(a1 + 234) = a25;
  return result;
}

uint64_t __os_log_helper_16_2_6_8_32_8_66_8_0_8_66_8_0_8_0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 6;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 66;
  *(_BYTE *)(result + 33) = 8;
  *(_QWORD *)(result + 34) = a5;
  *(_BYTE *)(result + 42) = 0;
  *(_BYTE *)(result + 43) = 8;
  *(_QWORD *)(result + 44) = a6;
  *(_BYTE *)(result + 52) = 0;
  *(_BYTE *)(result + 53) = 8;
  *(_QWORD *)(result + 54) = a7;
  return result;
}

uint64_t __os_log_helper_16_2_25_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66_8_0_8_66(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  uint64_t result;

  result = a16;
  *(_BYTE *)a1 = 2;
  *(_BYTE *)(a1 + 1) = 25;
  *(_BYTE *)(a1 + 2) = 32;
  *(_BYTE *)(a1 + 3) = 8;
  *(_QWORD *)(a1 + 4) = a2;
  *(_BYTE *)(a1 + 12) = 66;
  *(_BYTE *)(a1 + 13) = 8;
  *(_QWORD *)(a1 + 14) = a3;
  *(_BYTE *)(a1 + 22) = 0;
  *(_BYTE *)(a1 + 23) = 8;
  *(_QWORD *)(a1 + 24) = a4;
  *(_BYTE *)(a1 + 32) = 66;
  *(_BYTE *)(a1 + 33) = 8;
  *(_QWORD *)(a1 + 34) = a5;
  *(_BYTE *)(a1 + 42) = 0;
  *(_BYTE *)(a1 + 43) = 8;
  *(_QWORD *)(a1 + 44) = a6;
  *(_BYTE *)(a1 + 52) = 66;
  *(_BYTE *)(a1 + 53) = 8;
  *(_QWORD *)(a1 + 54) = a7;
  *(_BYTE *)(a1 + 62) = 66;
  *(_BYTE *)(a1 + 63) = 8;
  *(_QWORD *)(a1 + 64) = a8;
  *(_BYTE *)(a1 + 72) = 66;
  *(_BYTE *)(a1 + 73) = 8;
  *(_QWORD *)(a1 + 74) = a9;
  *(_BYTE *)(a1 + 82) = 66;
  *(_BYTE *)(a1 + 83) = 8;
  *(_QWORD *)(a1 + 84) = a10;
  *(_BYTE *)(a1 + 92) = 0;
  *(_BYTE *)(a1 + 93) = 8;
  *(_QWORD *)(a1 + 94) = a11;
  *(_BYTE *)(a1 + 102) = 34;
  *(_BYTE *)(a1 + 103) = 8;
  *(_QWORD *)(a1 + 104) = a12;
  *(_BYTE *)(a1 + 112) = 34;
  *(_BYTE *)(a1 + 113) = 8;
  *(_QWORD *)(a1 + 114) = a13;
  *(_BYTE *)(a1 + 122) = 34;
  *(_BYTE *)(a1 + 123) = 8;
  *(_QWORD *)(a1 + 124) = a14;
  *(_BYTE *)(a1 + 132) = 66;
  *(_BYTE *)(a1 + 133) = 8;
  *(_QWORD *)(a1 + 134) = a15;
  *(_BYTE *)(a1 + 142) = 34;
  *(_BYTE *)(a1 + 143) = 8;
  *(_QWORD *)(a1 + 144) = a16;
  *(_BYTE *)(a1 + 152) = 66;
  *(_BYTE *)(a1 + 153) = 8;
  *(_QWORD *)(a1 + 154) = a17;
  *(_BYTE *)(a1 + 162) = 0;
  *(_BYTE *)(a1 + 163) = 8;
  *(_QWORD *)(a1 + 164) = a18;
  *(_BYTE *)(a1 + 172) = 0;
  *(_BYTE *)(a1 + 173) = 8;
  *(_QWORD *)(a1 + 174) = a19;
  *(_BYTE *)(a1 + 182) = 0;
  *(_BYTE *)(a1 + 183) = 8;
  *(_QWORD *)(a1 + 184) = a20;
  *(_BYTE *)(a1 + 192) = 0;
  *(_BYTE *)(a1 + 193) = 8;
  *(_QWORD *)(a1 + 194) = a21;
  *(_BYTE *)(a1 + 202) = 0;
  *(_BYTE *)(a1 + 203) = 8;
  *(_QWORD *)(a1 + 204) = a22;
  *(_BYTE *)(a1 + 212) = 0;
  *(_BYTE *)(a1 + 213) = 8;
  *(_QWORD *)(a1 + 214) = a23;
  *(_BYTE *)(a1 + 222) = 66;
  *(_BYTE *)(a1 + 223) = 8;
  *(_QWORD *)(a1 + 224) = a24;
  *(_BYTE *)(a1 + 232) = 0;
  *(_BYTE *)(a1 + 233) = 8;
  *(_QWORD *)(a1 + 234) = a25;
  *(_BYTE *)(a1 + 242) = 66;
  *(_BYTE *)(a1 + 243) = 8;
  *(_QWORD *)(a1 + 244) = a26;
  return result;
}

id getSUErrorDomain()
{
  id *SUErrorDomainSymbolLoc;

  SUErrorDomainSymbolLoc = (id *)getSUErrorDomainSymbolLoc();
  if (!SUErrorDomainSymbolLoc)
  {
    dlerror();
    abort_report_np();
  }
  return *SUErrorDomainSymbolLoc;
}

uint64_t __os_log_helper_16_2_25_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66_8_0_8_32(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  uint64_t result;

  result = a16;
  *(_BYTE *)a1 = 2;
  *(_BYTE *)(a1 + 1) = 25;
  *(_BYTE *)(a1 + 2) = 32;
  *(_BYTE *)(a1 + 3) = 8;
  *(_QWORD *)(a1 + 4) = a2;
  *(_BYTE *)(a1 + 12) = 66;
  *(_BYTE *)(a1 + 13) = 8;
  *(_QWORD *)(a1 + 14) = a3;
  *(_BYTE *)(a1 + 22) = 0;
  *(_BYTE *)(a1 + 23) = 8;
  *(_QWORD *)(a1 + 24) = a4;
  *(_BYTE *)(a1 + 32) = 66;
  *(_BYTE *)(a1 + 33) = 8;
  *(_QWORD *)(a1 + 34) = a5;
  *(_BYTE *)(a1 + 42) = 0;
  *(_BYTE *)(a1 + 43) = 8;
  *(_QWORD *)(a1 + 44) = a6;
  *(_BYTE *)(a1 + 52) = 66;
  *(_BYTE *)(a1 + 53) = 8;
  *(_QWORD *)(a1 + 54) = a7;
  *(_BYTE *)(a1 + 62) = 66;
  *(_BYTE *)(a1 + 63) = 8;
  *(_QWORD *)(a1 + 64) = a8;
  *(_BYTE *)(a1 + 72) = 66;
  *(_BYTE *)(a1 + 73) = 8;
  *(_QWORD *)(a1 + 74) = a9;
  *(_BYTE *)(a1 + 82) = 66;
  *(_BYTE *)(a1 + 83) = 8;
  *(_QWORD *)(a1 + 84) = a10;
  *(_BYTE *)(a1 + 92) = 0;
  *(_BYTE *)(a1 + 93) = 8;
  *(_QWORD *)(a1 + 94) = a11;
  *(_BYTE *)(a1 + 102) = 34;
  *(_BYTE *)(a1 + 103) = 8;
  *(_QWORD *)(a1 + 104) = a12;
  *(_BYTE *)(a1 + 112) = 34;
  *(_BYTE *)(a1 + 113) = 8;
  *(_QWORD *)(a1 + 114) = a13;
  *(_BYTE *)(a1 + 122) = 34;
  *(_BYTE *)(a1 + 123) = 8;
  *(_QWORD *)(a1 + 124) = a14;
  *(_BYTE *)(a1 + 132) = 66;
  *(_BYTE *)(a1 + 133) = 8;
  *(_QWORD *)(a1 + 134) = a15;
  *(_BYTE *)(a1 + 142) = 34;
  *(_BYTE *)(a1 + 143) = 8;
  *(_QWORD *)(a1 + 144) = a16;
  *(_BYTE *)(a1 + 152) = 66;
  *(_BYTE *)(a1 + 153) = 8;
  *(_QWORD *)(a1 + 154) = a17;
  *(_BYTE *)(a1 + 162) = 0;
  *(_BYTE *)(a1 + 163) = 8;
  *(_QWORD *)(a1 + 164) = a18;
  *(_BYTE *)(a1 + 172) = 0;
  *(_BYTE *)(a1 + 173) = 8;
  *(_QWORD *)(a1 + 174) = a19;
  *(_BYTE *)(a1 + 182) = 0;
  *(_BYTE *)(a1 + 183) = 8;
  *(_QWORD *)(a1 + 184) = a20;
  *(_BYTE *)(a1 + 192) = 0;
  *(_BYTE *)(a1 + 193) = 8;
  *(_QWORD *)(a1 + 194) = a21;
  *(_BYTE *)(a1 + 202) = 0;
  *(_BYTE *)(a1 + 203) = 8;
  *(_QWORD *)(a1 + 204) = a22;
  *(_BYTE *)(a1 + 212) = 0;
  *(_BYTE *)(a1 + 213) = 8;
  *(_QWORD *)(a1 + 214) = a23;
  *(_BYTE *)(a1 + 222) = 66;
  *(_BYTE *)(a1 + 223) = 8;
  *(_QWORD *)(a1 + 224) = a24;
  *(_BYTE *)(a1 + 232) = 0;
  *(_BYTE *)(a1 + 233) = 8;
  *(_QWORD *)(a1 + 234) = a25;
  *(_BYTE *)(a1 + 242) = 32;
  *(_BYTE *)(a1 + 243) = 8;
  *(_QWORD *)(a1 + 244) = a26;
  return result;
}

uint64_t __os_log_helper_16_2_24_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_4_0_4_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,int a24,int a25)
{
  uint64_t result;

  result = a15;
  *(_BYTE *)a1 = 2;
  *(_BYTE *)(a1 + 1) = 24;
  *(_BYTE *)(a1 + 2) = 32;
  *(_BYTE *)(a1 + 3) = 8;
  *(_QWORD *)(a1 + 4) = a2;
  *(_BYTE *)(a1 + 12) = 66;
  *(_BYTE *)(a1 + 13) = 8;
  *(_QWORD *)(a1 + 14) = a3;
  *(_BYTE *)(a1 + 22) = 0;
  *(_BYTE *)(a1 + 23) = 8;
  *(_QWORD *)(a1 + 24) = a4;
  *(_BYTE *)(a1 + 32) = 66;
  *(_BYTE *)(a1 + 33) = 8;
  *(_QWORD *)(a1 + 34) = a5;
  *(_BYTE *)(a1 + 42) = 0;
  *(_BYTE *)(a1 + 43) = 8;
  *(_QWORD *)(a1 + 44) = a6;
  *(_BYTE *)(a1 + 52) = 66;
  *(_BYTE *)(a1 + 53) = 8;
  *(_QWORD *)(a1 + 54) = a7;
  *(_BYTE *)(a1 + 62) = 66;
  *(_BYTE *)(a1 + 63) = 8;
  *(_QWORD *)(a1 + 64) = a8;
  *(_BYTE *)(a1 + 72) = 66;
  *(_BYTE *)(a1 + 73) = 8;
  *(_QWORD *)(a1 + 74) = a9;
  *(_BYTE *)(a1 + 82) = 66;
  *(_BYTE *)(a1 + 83) = 8;
  *(_QWORD *)(a1 + 84) = a10;
  *(_BYTE *)(a1 + 92) = 0;
  *(_BYTE *)(a1 + 93) = 8;
  *(_QWORD *)(a1 + 94) = a11;
  *(_BYTE *)(a1 + 102) = 34;
  *(_BYTE *)(a1 + 103) = 8;
  *(_QWORD *)(a1 + 104) = a12;
  *(_BYTE *)(a1 + 112) = 34;
  *(_BYTE *)(a1 + 113) = 8;
  *(_QWORD *)(a1 + 114) = a13;
  *(_BYTE *)(a1 + 122) = 34;
  *(_BYTE *)(a1 + 123) = 8;
  *(_QWORD *)(a1 + 124) = a14;
  *(_BYTE *)(a1 + 132) = 66;
  *(_BYTE *)(a1 + 133) = 8;
  *(_QWORD *)(a1 + 134) = a15;
  *(_BYTE *)(a1 + 142) = 34;
  *(_BYTE *)(a1 + 143) = 8;
  *(_QWORD *)(a1 + 144) = a16;
  *(_BYTE *)(a1 + 152) = 66;
  *(_BYTE *)(a1 + 153) = 8;
  *(_QWORD *)(a1 + 154) = a17;
  *(_BYTE *)(a1 + 162) = 0;
  *(_BYTE *)(a1 + 163) = 8;
  *(_QWORD *)(a1 + 164) = a18;
  *(_BYTE *)(a1 + 172) = 0;
  *(_BYTE *)(a1 + 173) = 8;
  *(_QWORD *)(a1 + 174) = a19;
  *(_BYTE *)(a1 + 182) = 0;
  *(_BYTE *)(a1 + 183) = 8;
  *(_QWORD *)(a1 + 184) = a20;
  *(_BYTE *)(a1 + 192) = 0;
  *(_BYTE *)(a1 + 193) = 8;
  *(_QWORD *)(a1 + 194) = a21;
  *(_BYTE *)(a1 + 202) = 0;
  *(_BYTE *)(a1 + 203) = 8;
  *(_QWORD *)(a1 + 204) = a22;
  *(_BYTE *)(a1 + 212) = 0;
  *(_BYTE *)(a1 + 213) = 8;
  *(_QWORD *)(a1 + 214) = a23;
  *(_BYTE *)(a1 + 222) = 0;
  *(_BYTE *)(a1 + 223) = 4;
  *(_DWORD *)(a1 + 224) = a24;
  *(_BYTE *)(a1 + 228) = 0;
  *(_BYTE *)(a1 + 229) = 4;
  *(_DWORD *)(a1 + 230) = a25;
  return result;
}

void sub_21BF64B7C()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

void sub_21BF66C84()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

uint64_t __os_log_helper_16_2_27_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_66_8_66_8_0_8_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  uint64_t result;

  result = a18;
  *(_BYTE *)a1 = 2;
  *(_BYTE *)(a1 + 1) = 27;
  *(_BYTE *)(a1 + 2) = 32;
  *(_BYTE *)(a1 + 3) = 8;
  *(_QWORD *)(a1 + 4) = a2;
  *(_BYTE *)(a1 + 12) = 66;
  *(_BYTE *)(a1 + 13) = 8;
  *(_QWORD *)(a1 + 14) = a3;
  *(_BYTE *)(a1 + 22) = 0;
  *(_BYTE *)(a1 + 23) = 8;
  *(_QWORD *)(a1 + 24) = a4;
  *(_BYTE *)(a1 + 32) = 66;
  *(_BYTE *)(a1 + 33) = 8;
  *(_QWORD *)(a1 + 34) = a5;
  *(_BYTE *)(a1 + 42) = 0;
  *(_BYTE *)(a1 + 43) = 8;
  *(_QWORD *)(a1 + 44) = a6;
  *(_BYTE *)(a1 + 52) = 66;
  *(_BYTE *)(a1 + 53) = 8;
  *(_QWORD *)(a1 + 54) = a7;
  *(_BYTE *)(a1 + 62) = 66;
  *(_BYTE *)(a1 + 63) = 8;
  *(_QWORD *)(a1 + 64) = a8;
  *(_BYTE *)(a1 + 72) = 66;
  *(_BYTE *)(a1 + 73) = 8;
  *(_QWORD *)(a1 + 74) = a9;
  *(_BYTE *)(a1 + 82) = 66;
  *(_BYTE *)(a1 + 83) = 8;
  *(_QWORD *)(a1 + 84) = a10;
  *(_BYTE *)(a1 + 92) = 0;
  *(_BYTE *)(a1 + 93) = 8;
  *(_QWORD *)(a1 + 94) = a11;
  *(_BYTE *)(a1 + 102) = 34;
  *(_BYTE *)(a1 + 103) = 8;
  *(_QWORD *)(a1 + 104) = a12;
  *(_BYTE *)(a1 + 112) = 34;
  *(_BYTE *)(a1 + 113) = 8;
  *(_QWORD *)(a1 + 114) = a13;
  *(_BYTE *)(a1 + 122) = 34;
  *(_BYTE *)(a1 + 123) = 8;
  *(_QWORD *)(a1 + 124) = a14;
  *(_BYTE *)(a1 + 132) = 66;
  *(_BYTE *)(a1 + 133) = 8;
  *(_QWORD *)(a1 + 134) = a15;
  *(_BYTE *)(a1 + 142) = 34;
  *(_BYTE *)(a1 + 143) = 8;
  *(_QWORD *)(a1 + 144) = a16;
  *(_BYTE *)(a1 + 152) = 66;
  *(_BYTE *)(a1 + 153) = 8;
  *(_QWORD *)(a1 + 154) = a17;
  *(_BYTE *)(a1 + 162) = 0;
  *(_BYTE *)(a1 + 163) = 8;
  *(_QWORD *)(a1 + 164) = a18;
  *(_BYTE *)(a1 + 172) = 0;
  *(_BYTE *)(a1 + 173) = 8;
  *(_QWORD *)(a1 + 174) = a19;
  *(_BYTE *)(a1 + 182) = 0;
  *(_BYTE *)(a1 + 183) = 8;
  *(_QWORD *)(a1 + 184) = a20;
  *(_BYTE *)(a1 + 192) = 0;
  *(_BYTE *)(a1 + 193) = 8;
  *(_QWORD *)(a1 + 194) = a21;
  *(_BYTE *)(a1 + 202) = 0;
  *(_BYTE *)(a1 + 203) = 8;
  *(_QWORD *)(a1 + 204) = a22;
  *(_BYTE *)(a1 + 212) = 0;
  *(_BYTE *)(a1 + 213) = 8;
  *(_QWORD *)(a1 + 214) = a23;
  *(_BYTE *)(a1 + 222) = 0;
  *(_BYTE *)(a1 + 223) = 8;
  *(_QWORD *)(a1 + 224) = a24;
  *(_BYTE *)(a1 + 232) = 66;
  *(_BYTE *)(a1 + 233) = 8;
  *(_QWORD *)(a1 + 234) = a25;
  *(_BYTE *)(a1 + 242) = 66;
  *(_BYTE *)(a1 + 243) = 8;
  *(_QWORD *)(a1 + 244) = a26;
  *(_BYTE *)(a1 + 252) = 0;
  *(_BYTE *)(a1 + 253) = 8;
  *(_QWORD *)(a1 + 254) = a27;
  *(_BYTE *)(a1 + 262) = 0;
  *(_BYTE *)(a1 + 263) = 8;
  *(_QWORD *)(a1 + 264) = a28;
  return result;
}

uint64_t __os_log_helper_16_2_2_8_32_4_0(uint64_t result, uint64_t a2, int a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  return result;
}

uint64_t __os_log_helper_16_2_24_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_32_8_66(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  uint64_t result;

  result = a15;
  *(_BYTE *)a1 = 2;
  *(_BYTE *)(a1 + 1) = 24;
  *(_BYTE *)(a1 + 2) = 32;
  *(_BYTE *)(a1 + 3) = 8;
  *(_QWORD *)(a1 + 4) = a2;
  *(_BYTE *)(a1 + 12) = 66;
  *(_BYTE *)(a1 + 13) = 8;
  *(_QWORD *)(a1 + 14) = a3;
  *(_BYTE *)(a1 + 22) = 0;
  *(_BYTE *)(a1 + 23) = 8;
  *(_QWORD *)(a1 + 24) = a4;
  *(_BYTE *)(a1 + 32) = 66;
  *(_BYTE *)(a1 + 33) = 8;
  *(_QWORD *)(a1 + 34) = a5;
  *(_BYTE *)(a1 + 42) = 0;
  *(_BYTE *)(a1 + 43) = 8;
  *(_QWORD *)(a1 + 44) = a6;
  *(_BYTE *)(a1 + 52) = 66;
  *(_BYTE *)(a1 + 53) = 8;
  *(_QWORD *)(a1 + 54) = a7;
  *(_BYTE *)(a1 + 62) = 66;
  *(_BYTE *)(a1 + 63) = 8;
  *(_QWORD *)(a1 + 64) = a8;
  *(_BYTE *)(a1 + 72) = 66;
  *(_BYTE *)(a1 + 73) = 8;
  *(_QWORD *)(a1 + 74) = a9;
  *(_BYTE *)(a1 + 82) = 66;
  *(_BYTE *)(a1 + 83) = 8;
  *(_QWORD *)(a1 + 84) = a10;
  *(_BYTE *)(a1 + 92) = 0;
  *(_BYTE *)(a1 + 93) = 8;
  *(_QWORD *)(a1 + 94) = a11;
  *(_BYTE *)(a1 + 102) = 34;
  *(_BYTE *)(a1 + 103) = 8;
  *(_QWORD *)(a1 + 104) = a12;
  *(_BYTE *)(a1 + 112) = 34;
  *(_BYTE *)(a1 + 113) = 8;
  *(_QWORD *)(a1 + 114) = a13;
  *(_BYTE *)(a1 + 122) = 34;
  *(_BYTE *)(a1 + 123) = 8;
  *(_QWORD *)(a1 + 124) = a14;
  *(_BYTE *)(a1 + 132) = 66;
  *(_BYTE *)(a1 + 133) = 8;
  *(_QWORD *)(a1 + 134) = a15;
  *(_BYTE *)(a1 + 142) = 34;
  *(_BYTE *)(a1 + 143) = 8;
  *(_QWORD *)(a1 + 144) = a16;
  *(_BYTE *)(a1 + 152) = 66;
  *(_BYTE *)(a1 + 153) = 8;
  *(_QWORD *)(a1 + 154) = a17;
  *(_BYTE *)(a1 + 162) = 0;
  *(_BYTE *)(a1 + 163) = 8;
  *(_QWORD *)(a1 + 164) = a18;
  *(_BYTE *)(a1 + 172) = 0;
  *(_BYTE *)(a1 + 173) = 8;
  *(_QWORD *)(a1 + 174) = a19;
  *(_BYTE *)(a1 + 182) = 0;
  *(_BYTE *)(a1 + 183) = 8;
  *(_QWORD *)(a1 + 184) = a20;
  *(_BYTE *)(a1 + 192) = 0;
  *(_BYTE *)(a1 + 193) = 8;
  *(_QWORD *)(a1 + 194) = a21;
  *(_BYTE *)(a1 + 202) = 0;
  *(_BYTE *)(a1 + 203) = 8;
  *(_QWORD *)(a1 + 204) = a22;
  *(_BYTE *)(a1 + 212) = 0;
  *(_BYTE *)(a1 + 213) = 8;
  *(_QWORD *)(a1 + 214) = a23;
  *(_BYTE *)(a1 + 222) = 32;
  *(_BYTE *)(a1 + 223) = 8;
  *(_QWORD *)(a1 + 224) = a24;
  *(_BYTE *)(a1 + 232) = 66;
  *(_BYTE *)(a1 + 233) = 8;
  *(_QWORD *)(a1 + 234) = a25;
  return result;
}

uint64_t __os_log_helper_16_2_3_8_32_4_0_4_0(uint64_t result, uint64_t a2, int a3, int a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 18) = 0;
  *(_BYTE *)(result + 19) = 4;
  *(_DWORD *)(result + 20) = a4;
  return result;
}

uint64_t __os_log_helper_16_2_25_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_32_8_66_8_66(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  uint64_t result;

  result = a16;
  *(_BYTE *)a1 = 2;
  *(_BYTE *)(a1 + 1) = 25;
  *(_BYTE *)(a1 + 2) = 32;
  *(_BYTE *)(a1 + 3) = 8;
  *(_QWORD *)(a1 + 4) = a2;
  *(_BYTE *)(a1 + 12) = 66;
  *(_BYTE *)(a1 + 13) = 8;
  *(_QWORD *)(a1 + 14) = a3;
  *(_BYTE *)(a1 + 22) = 0;
  *(_BYTE *)(a1 + 23) = 8;
  *(_QWORD *)(a1 + 24) = a4;
  *(_BYTE *)(a1 + 32) = 66;
  *(_BYTE *)(a1 + 33) = 8;
  *(_QWORD *)(a1 + 34) = a5;
  *(_BYTE *)(a1 + 42) = 0;
  *(_BYTE *)(a1 + 43) = 8;
  *(_QWORD *)(a1 + 44) = a6;
  *(_BYTE *)(a1 + 52) = 66;
  *(_BYTE *)(a1 + 53) = 8;
  *(_QWORD *)(a1 + 54) = a7;
  *(_BYTE *)(a1 + 62) = 66;
  *(_BYTE *)(a1 + 63) = 8;
  *(_QWORD *)(a1 + 64) = a8;
  *(_BYTE *)(a1 + 72) = 66;
  *(_BYTE *)(a1 + 73) = 8;
  *(_QWORD *)(a1 + 74) = a9;
  *(_BYTE *)(a1 + 82) = 66;
  *(_BYTE *)(a1 + 83) = 8;
  *(_QWORD *)(a1 + 84) = a10;
  *(_BYTE *)(a1 + 92) = 0;
  *(_BYTE *)(a1 + 93) = 8;
  *(_QWORD *)(a1 + 94) = a11;
  *(_BYTE *)(a1 + 102) = 34;
  *(_BYTE *)(a1 + 103) = 8;
  *(_QWORD *)(a1 + 104) = a12;
  *(_BYTE *)(a1 + 112) = 34;
  *(_BYTE *)(a1 + 113) = 8;
  *(_QWORD *)(a1 + 114) = a13;
  *(_BYTE *)(a1 + 122) = 34;
  *(_BYTE *)(a1 + 123) = 8;
  *(_QWORD *)(a1 + 124) = a14;
  *(_BYTE *)(a1 + 132) = 66;
  *(_BYTE *)(a1 + 133) = 8;
  *(_QWORD *)(a1 + 134) = a15;
  *(_BYTE *)(a1 + 142) = 34;
  *(_BYTE *)(a1 + 143) = 8;
  *(_QWORD *)(a1 + 144) = a16;
  *(_BYTE *)(a1 + 152) = 66;
  *(_BYTE *)(a1 + 153) = 8;
  *(_QWORD *)(a1 + 154) = a17;
  *(_BYTE *)(a1 + 162) = 0;
  *(_BYTE *)(a1 + 163) = 8;
  *(_QWORD *)(a1 + 164) = a18;
  *(_BYTE *)(a1 + 172) = 0;
  *(_BYTE *)(a1 + 173) = 8;
  *(_QWORD *)(a1 + 174) = a19;
  *(_BYTE *)(a1 + 182) = 0;
  *(_BYTE *)(a1 + 183) = 8;
  *(_QWORD *)(a1 + 184) = a20;
  *(_BYTE *)(a1 + 192) = 0;
  *(_BYTE *)(a1 + 193) = 8;
  *(_QWORD *)(a1 + 194) = a21;
  *(_BYTE *)(a1 + 202) = 0;
  *(_BYTE *)(a1 + 203) = 8;
  *(_QWORD *)(a1 + 204) = a22;
  *(_BYTE *)(a1 + 212) = 0;
  *(_BYTE *)(a1 + 213) = 8;
  *(_QWORD *)(a1 + 214) = a23;
  *(_BYTE *)(a1 + 222) = 32;
  *(_BYTE *)(a1 + 223) = 8;
  *(_QWORD *)(a1 + 224) = a24;
  *(_BYTE *)(a1 + 232) = 66;
  *(_BYTE *)(a1 + 233) = 8;
  *(_QWORD *)(a1 + 234) = a25;
  *(_BYTE *)(a1 + 242) = 66;
  *(_BYTE *)(a1 + 243) = 8;
  *(_QWORD *)(a1 + 244) = a26;
  return result;
}

void sub_21BF6EFC0()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

void sub_21BF6F308()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

void sub_21BF6F65C()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

void sub_21BF6F998()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

void sub_21BF709CC()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

uint64_t __os_log_helper_16_2_7_8_32_8_66_8_0_8_66_8_66_8_0_8_66(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 7;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 66;
  *(_BYTE *)(result + 33) = 8;
  *(_QWORD *)(result + 34) = a5;
  *(_BYTE *)(result + 42) = 66;
  *(_BYTE *)(result + 43) = 8;
  *(_QWORD *)(result + 44) = a6;
  *(_BYTE *)(result + 52) = 0;
  *(_BYTE *)(result + 53) = 8;
  *(_QWORD *)(result + 54) = a7;
  *(_BYTE *)(result + 62) = 66;
  *(_BYTE *)(result + 63) = 8;
  *(_QWORD *)(result + 64) = a8;
  return result;
}

uint64_t __os_log_helper_16_2_7_8_66_8_66_8_0_8_66_8_0_8_32_8_32(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 7;
  *(_BYTE *)(result + 2) = 66;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 66;
  *(_BYTE *)(result + 33) = 8;
  *(_QWORD *)(result + 34) = a5;
  *(_BYTE *)(result + 42) = 0;
  *(_BYTE *)(result + 43) = 8;
  *(_QWORD *)(result + 44) = a6;
  *(_BYTE *)(result + 52) = 32;
  *(_BYTE *)(result + 53) = 8;
  *(_QWORD *)(result + 54) = a7;
  *(_BYTE *)(result + 62) = 32;
  *(_BYTE *)(result + 63) = 8;
  *(_QWORD *)(result + 64) = a8;
  return result;
}

uint64_t __getSUNetworkMonitorClass_block_invoke(uint64_t a1)
{
  Class Class;
  uint64_t result;

  SoftwareUpdateServicesLibrary();
  Class = objc_getClass("SUNetworkMonitor");
  result = a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = Class;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    result = abort_report_np();
  getSUNetworkMonitorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SoftwareUpdateServicesLibrary()
{
  uint64_t updated;

  updated = SoftwareUpdateServicesLibraryCore();
  if (!updated)
    abort_report_np();
  return updated;
}

uint64_t SoftwareUpdateServicesLibraryCore()
{
  if (!SoftwareUpdateServicesLibraryCore_frameworkLibrary)
    __SoftwareUpdateServicesLibraryCore_block_invoke();
  return SoftwareUpdateServicesLibraryCore_frameworkLibrary;
}

uint64_t getSUErrorDomainSymbolLoc()
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  int v11;
  int v12;
  uint64_t v13;

  v9 = 0;
  v10 = &v9;
  v11 = 0x20000000;
  v12 = 32;
  v8 = getSUErrorDomainSymbolLoc_ptr;
  v13 = getSUErrorDomainSymbolLoc_ptr;
  if (!getSUErrorDomainSymbolLoc_ptr)
  {
    v2 = MEMORY[0x24BDAC760];
    v3 = -1073741824;
    v4 = 0;
    v5 = __getSUErrorDomainSymbolLoc_block_invoke;
    v6 = &unk_24DFF80D0;
    v7 = &v9;
    __getSUErrorDomainSymbolLoc_block_invoke((uint64_t)&v2);
  }
  v1 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __getSUErrorDomainSymbolLoc_block_invoke(uint64_t a1)
{
  void *updated;
  void *v2;
  uint64_t result;

  updated = (void *)SoftwareUpdateServicesLibrary();
  v2 = dlsym(updated, "SUErrorDomain");
  result = a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v2;
  getSUErrorDomainSymbolLoc_ptr = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

__CFString *SUSettingsUserInteractionResponseTypeToString(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      return CFSTR("Agree");
    case 1:
      return CFSTR("Disagree");
    case 2:
      return CFSTR("Cancel");
  }
  return CFSTR("Unknown");
}

uint64_t __os_log_helper_16_2_14_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34_8_66_8_66(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 14;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 66;
  *(_BYTE *)(result + 33) = 8;
  *(_QWORD *)(result + 34) = a5;
  *(_BYTE *)(result + 42) = 0;
  *(_BYTE *)(result + 43) = 8;
  *(_QWORD *)(result + 44) = a6;
  *(_BYTE *)(result + 52) = 66;
  *(_BYTE *)(result + 53) = 8;
  *(_QWORD *)(result + 54) = a7;
  *(_BYTE *)(result + 62) = 0;
  *(_BYTE *)(result + 63) = 8;
  *(_QWORD *)(result + 64) = a8;
  *(_BYTE *)(result + 72) = 66;
  *(_BYTE *)(result + 73) = 8;
  *(_QWORD *)(result + 74) = a9;
  *(_BYTE *)(result + 82) = 0;
  *(_BYTE *)(result + 83) = 8;
  *(_QWORD *)(result + 84) = a10;
  *(_BYTE *)(result + 92) = 66;
  *(_BYTE *)(result + 93) = 8;
  *(_QWORD *)(result + 94) = a11;
  *(_BYTE *)(result + 102) = 0;
  *(_BYTE *)(result + 103) = 8;
  *(_QWORD *)(result + 104) = a12;
  *(_BYTE *)(result + 112) = 34;
  *(_BYTE *)(result + 113) = 8;
  *(_QWORD *)(result + 114) = a13;
  *(_BYTE *)(result + 122) = 66;
  *(_BYTE *)(result + 123) = 8;
  *(_QWORD *)(result + 124) = a14;
  *(_BYTE *)(result + 132) = 66;
  *(_BYTE *)(result + 133) = 8;
  *(_QWORD *)(result + 134) = a15;
  return result;
}

uint64_t __os_log_helper_16_2_14_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34_8_32_8_32(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 14;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 66;
  *(_BYTE *)(result + 33) = 8;
  *(_QWORD *)(result + 34) = a5;
  *(_BYTE *)(result + 42) = 0;
  *(_BYTE *)(result + 43) = 8;
  *(_QWORD *)(result + 44) = a6;
  *(_BYTE *)(result + 52) = 66;
  *(_BYTE *)(result + 53) = 8;
  *(_QWORD *)(result + 54) = a7;
  *(_BYTE *)(result + 62) = 0;
  *(_BYTE *)(result + 63) = 8;
  *(_QWORD *)(result + 64) = a8;
  *(_BYTE *)(result + 72) = 66;
  *(_BYTE *)(result + 73) = 8;
  *(_QWORD *)(result + 74) = a9;
  *(_BYTE *)(result + 82) = 0;
  *(_BYTE *)(result + 83) = 8;
  *(_QWORD *)(result + 84) = a10;
  *(_BYTE *)(result + 92) = 66;
  *(_BYTE *)(result + 93) = 8;
  *(_QWORD *)(result + 94) = a11;
  *(_BYTE *)(result + 102) = 0;
  *(_BYTE *)(result + 103) = 8;
  *(_QWORD *)(result + 104) = a12;
  *(_BYTE *)(result + 112) = 34;
  *(_BYTE *)(result + 113) = 8;
  *(_QWORD *)(result + 114) = a13;
  *(_BYTE *)(result + 122) = 32;
  *(_BYTE *)(result + 123) = 8;
  *(_QWORD *)(result + 124) = a14;
  *(_BYTE *)(result + 132) = 32;
  *(_BYTE *)(result + 133) = 8;
  *(_QWORD *)(result + 134) = a15;
  return result;
}

uint64_t __os_log_helper_16_2_12_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 12;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 66;
  *(_BYTE *)(result + 33) = 8;
  *(_QWORD *)(result + 34) = a5;
  *(_BYTE *)(result + 42) = 0;
  *(_BYTE *)(result + 43) = 8;
  *(_QWORD *)(result + 44) = a6;
  *(_BYTE *)(result + 52) = 66;
  *(_BYTE *)(result + 53) = 8;
  *(_QWORD *)(result + 54) = a7;
  *(_BYTE *)(result + 62) = 0;
  *(_BYTE *)(result + 63) = 8;
  *(_QWORD *)(result + 64) = a8;
  *(_BYTE *)(result + 72) = 66;
  *(_BYTE *)(result + 73) = 8;
  *(_QWORD *)(result + 74) = a9;
  *(_BYTE *)(result + 82) = 0;
  *(_BYTE *)(result + 83) = 8;
  *(_QWORD *)(result + 84) = a10;
  *(_BYTE *)(result + 92) = 66;
  *(_BYTE *)(result + 93) = 8;
  *(_QWORD *)(result + 94) = a11;
  *(_BYTE *)(result + 102) = 0;
  *(_BYTE *)(result + 103) = 8;
  *(_QWORD *)(result + 104) = a12;
  *(_BYTE *)(result + 112) = 34;
  *(_BYTE *)(result + 113) = 8;
  *(_QWORD *)(result + 114) = a13;
  return result;
}

__CFString *SUSettingsDescriptorStateToString(unint64_t a1)
{
  if (a1 <= 5)
    __asm { BR              X8 }
  return CFSTR("Unknown");
}

__CFString *SUSettingsDescriptorTypeToString(uint64_t a1)
{
  if (!a1)
    return CFSTR("Preferred");
  if (a1 == 1)
    return CFSTR("Alternate");
  return CFSTR("Unknown");
}

uint64_t __os_log_helper_16_2_2_8_66_8_66(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 66;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  return result;
}

_BYTE *__os_log_helper_16_0_0(_BYTE *result)
{
  *result = 0;
  result[1] = 0;
  return result;
}

uint64_t SUPrefsDownloadPhaseIsStalled(id obj)
{
  char v2;
  uint64_t (*IsStalledSymbolLoc)(id);
  id location;

  location = 0;
  objc_storeStrong(&location, obj);
  IsStalledSymbolLoc = (uint64_t (*)(id))getSUDownloadPhaseIsStalledSymbolLoc();
  if (!IsStalledSymbolLoc)
  {
    dlerror();
    abort_report_np();
  }
  v2 = IsStalledSymbolLoc(location);
  objc_storeStrong(&location, 0);
  return v2 & 1;
}

uint64_t __os_log_helper_16_2_6_8_32_8_66_8_66_8_0_8_66_8_0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 6;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 66;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 0;
  *(_BYTE *)(result + 33) = 8;
  *(_QWORD *)(result + 34) = a5;
  *(_BYTE *)(result + 42) = 66;
  *(_BYTE *)(result + 43) = 8;
  *(_QWORD *)(result + 44) = a6;
  *(_BYTE *)(result + 52) = 0;
  *(_BYTE *)(result + 53) = 8;
  *(_QWORD *)(result + 54) = a7;
  return result;
}

uint64_t __os_log_helper_16_2_8_8_32_8_66_8_66_8_0_8_66_8_0_8_66_8_66(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 8;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 66;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 0;
  *(_BYTE *)(result + 33) = 8;
  *(_QWORD *)(result + 34) = a5;
  *(_BYTE *)(result + 42) = 66;
  *(_BYTE *)(result + 43) = 8;
  *(_QWORD *)(result + 44) = a6;
  *(_BYTE *)(result + 52) = 0;
  *(_BYTE *)(result + 53) = 8;
  *(_QWORD *)(result + 54) = a7;
  *(_BYTE *)(result + 62) = 66;
  *(_BYTE *)(result + 63) = 8;
  *(_QWORD *)(result + 64) = a8;
  *(_BYTE *)(result + 72) = 66;
  *(_BYTE *)(result + 73) = 8;
  *(_QWORD *)(result + 74) = a9;
  return result;
}

uint64_t __os_log_helper_16_2_8_8_32_8_66_8_66_8_0_8_66_8_0_8_66_8_0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 8;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 66;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 0;
  *(_BYTE *)(result + 33) = 8;
  *(_QWORD *)(result + 34) = a5;
  *(_BYTE *)(result + 42) = 66;
  *(_BYTE *)(result + 43) = 8;
  *(_QWORD *)(result + 44) = a6;
  *(_BYTE *)(result + 52) = 0;
  *(_BYTE *)(result + 53) = 8;
  *(_QWORD *)(result + 54) = a7;
  *(_BYTE *)(result + 62) = 66;
  *(_BYTE *)(result + 63) = 8;
  *(_QWORD *)(result + 64) = a8;
  *(_BYTE *)(result + 72) = 0;
  *(_BYTE *)(result + 73) = 8;
  *(_QWORD *)(result + 74) = a9;
  return result;
}

uint64_t __os_log_helper_16_2_5_8_32_8_66_8_66_8_0_8_66(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 5;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 66;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 0;
  *(_BYTE *)(result + 33) = 8;
  *(_QWORD *)(result + 34) = a5;
  *(_BYTE *)(result + 42) = 66;
  *(_BYTE *)(result + 43) = 8;
  *(_QWORD *)(result + 44) = a6;
  return result;
}

id getSUErrorDomain_0()
{
  id *SUErrorDomainSymbolLoc_0;

  SUErrorDomainSymbolLoc_0 = (id *)getSUErrorDomainSymbolLoc_0();
  if (!SUErrorDomainSymbolLoc_0)
  {
    dlerror();
    abort_report_np();
  }
  return *SUErrorDomainSymbolLoc_0;
}

uint64_t __os_log_helper_16_2_4_8_32_8_66_8_66_8_0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 4;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 66;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 0;
  *(_BYTE *)(result + 33) = 8;
  *(_QWORD *)(result + 34) = a5;
  return result;
}

id getkSUInstallationConstraintsUnmetKey()
{
  id *v1;

  v1 = (id *)getkSUInstallationConstraintsUnmetKeySymbolLoc();
  if (!v1)
  {
    dlerror();
    abort_report_np();
  }
  return *v1;
}

uint64_t getSUDownloadPhaseIsStalledSymbolLoc()
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  int v11;
  int v12;
  uint64_t v13;

  v9 = 0;
  v10 = &v9;
  v11 = 0x20000000;
  v12 = 32;
  v8 = getSUDownloadPhaseIsStalledSymbolLoc_ptr;
  v13 = getSUDownloadPhaseIsStalledSymbolLoc_ptr;
  if (!getSUDownloadPhaseIsStalledSymbolLoc_ptr)
  {
    v2 = MEMORY[0x24BDAC760];
    v3 = -1073741824;
    v4 = 0;
    v5 = __getSUDownloadPhaseIsStalledSymbolLoc_block_invoke;
    v6 = &unk_24DFF80D0;
    v7 = &v9;
    __getSUDownloadPhaseIsStalledSymbolLoc_block_invoke((uint64_t)&v2);
  }
  v1 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __getSUDownloadPhaseIsStalledSymbolLoc_block_invoke(uint64_t a1)
{
  void *updated;
  void *v2;
  uint64_t result;

  updated = (void *)SoftwareUpdateServicesLibrary_0();
  v2 = dlsym(updated, "SUDownloadPhaseIsStalled");
  result = a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v2;
  getSUDownloadPhaseIsStalledSymbolLoc_ptr = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SoftwareUpdateServicesLibrary_0()
{
  uint64_t updated;

  updated = SoftwareUpdateServicesLibraryCore_0();
  if (!updated)
    abort_report_np();
  return updated;
}

uint64_t SoftwareUpdateServicesLibraryCore_0()
{
  if (!SoftwareUpdateServicesLibraryCore_frameworkLibrary_0)
    __SoftwareUpdateServicesLibraryCore_block_invoke_0();
  return SoftwareUpdateServicesLibraryCore_frameworkLibrary_0;
}

uint64_t getSUErrorDomainSymbolLoc_0()
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  int v11;
  int v12;
  uint64_t v13;

  v9 = 0;
  v10 = &v9;
  v11 = 0x20000000;
  v12 = 32;
  v8 = getSUErrorDomainSymbolLoc_ptr_0;
  v13 = getSUErrorDomainSymbolLoc_ptr_0;
  if (!getSUErrorDomainSymbolLoc_ptr_0)
  {
    v2 = MEMORY[0x24BDAC760];
    v3 = -1073741824;
    v4 = 0;
    v5 = __getSUErrorDomainSymbolLoc_block_invoke_0;
    v6 = &unk_24DFF80D0;
    v7 = &v9;
    __getSUErrorDomainSymbolLoc_block_invoke_0((uint64_t)&v2);
  }
  v1 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __getSUErrorDomainSymbolLoc_block_invoke_0(uint64_t a1)
{
  void *updated;
  void *v2;
  uint64_t result;

  updated = (void *)SoftwareUpdateServicesLibrary_0();
  v2 = dlsym(updated, "SUErrorDomain");
  result = a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v2;
  getSUErrorDomainSymbolLoc_ptr_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getkSUInstallationConstraintsUnmetKeySymbolLoc()
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  int v11;
  int v12;
  uint64_t v13;

  v9 = 0;
  v10 = &v9;
  v11 = 0x20000000;
  v12 = 32;
  v8 = getkSUInstallationConstraintsUnmetKeySymbolLoc_ptr;
  v13 = getkSUInstallationConstraintsUnmetKeySymbolLoc_ptr;
  if (!getkSUInstallationConstraintsUnmetKeySymbolLoc_ptr)
  {
    v2 = MEMORY[0x24BDAC760];
    v3 = -1073741824;
    v4 = 0;
    v5 = __getkSUInstallationConstraintsUnmetKeySymbolLoc_block_invoke;
    v6 = &unk_24DFF80D0;
    v7 = &v9;
    __getkSUInstallationConstraintsUnmetKeySymbolLoc_block_invoke((uint64_t)&v2);
  }
  v1 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __getkSUInstallationConstraintsUnmetKeySymbolLoc_block_invoke(uint64_t a1)
{
  void *updated;
  void *v2;
  uint64_t result;

  updated = (void *)SoftwareUpdateServicesLibrary_0();
  v2 = dlsym(updated, "kSUInstallationConstraintsUnmetKey");
  result = a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v2;
  getkSUInstallationConstraintsUnmetKeySymbolLoc_ptr = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

__CFString *SUBetaUpdatesRestrictionToString(uint64_t a1)
{
  id location;
  uint64_t v3;
  __CFString *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  if (a1)
  {
    if (a1 == 1)
    {
      v4 = CFSTR("Lockdown");
    }
    else if (a1 == 2)
    {
      v4 = CFSTR("MDM");
    }
    else
    {
      location = _SUSUILoggingFacility();
      if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_2_8_32_8_0((uint64_t)v5, (uint64_t)"NSString *const  _Nonnull SUBetaUpdatesRestrictionToString(SUBetaUpdatesRestriction)", v3);
        _os_log_error_impl(&dword_21BF33000, (os_log_t)location, OS_LOG_TYPE_ERROR, "%s: Un-mapped restriction %ld", v5, 0x16u);
      }
      objc_storeStrong(&location, 0);
      v4 = (__CFString *)(id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("N/A (restriction: %ld)"), v3);
    }
  }
  else
  {
    v4 = CFSTR("None");
  }
  return v4;
}

uint64_t __os_log_helper_16_2_2_8_32_8_0(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  return result;
}

uint64_t __os_log_helper_16_2_1_8_64(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  return result;
}

id getSUSUIUserDefaultsKeysClass()
{
  id v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  int v11;
  int v12;
  uint64_t v13;

  v9 = 0;
  v10 = &v9;
  v11 = 1342177280;
  v12 = 32;
  v8 = getSUSUIUserDefaultsKeysClass_softClass;
  v13 = getSUSUIUserDefaultsKeysClass_softClass;
  if (!getSUSUIUserDefaultsKeysClass_softClass)
  {
    v2 = MEMORY[0x24BDAC760];
    v3 = -1073741824;
    v4 = 0;
    v5 = __getSUSUIUserDefaultsKeysClass_block_invoke;
    v6 = &unk_24DFF80D0;
    v7 = &v9;
    __getSUSUIUserDefaultsKeysClass_block_invoke((uint64_t)&v2);
  }
  v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

void sub_21BF79E20(uint64_t a1, int a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 24) = a1;
  *(_DWORD *)(v2 - 28) = a2;
  if (*(_DWORD *)(v2 - 28) == 1)
  {
    *(_QWORD *)(v2 - 40) = objc_begin_catch(*(void **)(v2 - 24));
    objc_storeStrong((id *)(v2 - 40), 0);
    objc_end_catch();
    JUMPOUT(0x21BF79DF0);
  }
  _Unwind_Resume(*(_Unwind_Exception **)(v2 - 24));
}

id getSUSMKTestCaseSessionPhaseUtilityClass()
{
  id v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  int v11;
  int v12;
  uint64_t v13;

  v9 = 0;
  v10 = &v9;
  v11 = 1342177280;
  v12 = 32;
  v8 = getSUSMKTestCaseSessionPhaseUtilityClass_softClass;
  v13 = getSUSMKTestCaseSessionPhaseUtilityClass_softClass;
  if (!getSUSMKTestCaseSessionPhaseUtilityClass_softClass)
  {
    v2 = MEMORY[0x24BDAC760];
    v3 = -1073741824;
    v4 = 0;
    v5 = __getSUSMKTestCaseSessionPhaseUtilityClass_block_invoke;
    v6 = &unk_24DFF80D0;
    v7 = &v9;
    __getSUSMKTestCaseSessionPhaseUtilityClass_block_invoke((uint64_t)&v2);
  }
  v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

id getSUSMKMockedServiceTypeUtilityClass()
{
  id v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  int v11;
  int v12;
  uint64_t v13;

  v9 = 0;
  v10 = &v9;
  v11 = 1342177280;
  v12 = 32;
  v8 = getSUSMKMockedServiceTypeUtilityClass_softClass;
  v13 = getSUSMKMockedServiceTypeUtilityClass_softClass;
  if (!getSUSMKMockedServiceTypeUtilityClass_softClass)
  {
    v2 = MEMORY[0x24BDAC760];
    v3 = -1073741824;
    v4 = 0;
    v5 = __getSUSMKMockedServiceTypeUtilityClass_block_invoke;
    v6 = &unk_24DFF80D0;
    v7 = &v9;
    __getSUSMKMockedServiceTypeUtilityClass_block_invoke((uint64_t)&v2);
  }
  v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

id getSUSMKUserDefaultsCodedMockedStrategyClass()
{
  id v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  int v11;
  int v12;
  uint64_t v13;

  v9 = 0;
  v10 = &v9;
  v11 = 1342177280;
  v12 = 32;
  v8 = getSUSMKUserDefaultsCodedMockedStrategyClass_softClass;
  v13 = getSUSMKUserDefaultsCodedMockedStrategyClass_softClass;
  if (!getSUSMKUserDefaultsCodedMockedStrategyClass_softClass)
  {
    v2 = MEMORY[0x24BDAC760];
    v3 = -1073741824;
    v4 = 0;
    v5 = __getSUSMKUserDefaultsCodedMockedStrategyClass_block_invoke;
    v6 = &unk_24DFF80D0;
    v7 = &v9;
    __getSUSMKUserDefaultsCodedMockedStrategyClass_block_invoke((uint64_t)&v2);
  }
  v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __os_log_helper_16_2_3_8_64_8_64_8_64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 64;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  return result;
}

uint64_t __getSUSUIUserDefaultsKeysClass_block_invoke(uint64_t a1)
{
  Class Class;
  uint64_t result;

  SoftwareUpdateSettingsMockingKitLibrary();
  Class = objc_getClass("SUSUIUserDefaultsKeys");
  result = a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = Class;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    result = abort_report_np();
  getSUSUIUserDefaultsKeysClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SoftwareUpdateSettingsMockingKitLibrary()
{
  uint64_t updated;

  updated = SoftwareUpdateSettingsMockingKitLibraryCore();
  if (!updated)
    abort_report_np();
  return updated;
}

uint64_t SoftwareUpdateSettingsMockingKitLibraryCore()
{
  if (!SoftwareUpdateSettingsMockingKitLibraryCore_frameworkLibrary)
    __SoftwareUpdateSettingsMockingKitLibraryCore_block_invoke();
  return SoftwareUpdateSettingsMockingKitLibraryCore_frameworkLibrary;
}

uint64_t __getSUSMKTestCaseSessionPhaseUtilityClass_block_invoke(uint64_t a1)
{
  Class Class;
  uint64_t result;

  SoftwareUpdateSettingsMockingKitLibrary();
  Class = objc_getClass("SUSMKTestCaseSessionPhaseUtility");
  result = a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = Class;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    result = abort_report_np();
  getSUSMKTestCaseSessionPhaseUtilityClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __getSUSMKMockedServiceTypeUtilityClass_block_invoke(uint64_t a1)
{
  Class Class;
  uint64_t result;

  SoftwareUpdateSettingsMockingKitLibrary();
  Class = objc_getClass("SUSMKMockedServiceTypeUtility");
  result = a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = Class;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    result = abort_report_np();
  getSUSMKMockedServiceTypeUtilityClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __getSUSMKUserDefaultsCodedMockedStrategyClass_block_invoke(uint64_t a1)
{
  Class Class;
  uint64_t result;

  SoftwareUpdateSettingsMockingKitLibrary();
  Class = objc_getClass("SUSMKUserDefaultsCodedMockedStrategy");
  result = a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = Class;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    result = abort_report_np();
  getSUSMKUserDefaultsCodedMockedStrategyClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __os_log_helper_16_0_1_8_0(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = 0;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  return result;
}

uint64_t __os_log_helper_16_2_1_8_66(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 66;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  return result;
}

void sub_21BF80910(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
  uint64_t v11;

  *(_QWORD *)(v11 - 56) = a1;
  *(_DWORD *)(v11 - 60) = a2;
  objc_destroyWeak((id *)(v11 - 40));
  _Unwind_Resume(*(_Unwind_Exception **)(v11 - 56));
}

uint64_t __os_log_helper_16_2_2_8_64_8_0(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  return result;
}

id getkSUDownloadPhasePreparingForInstallation()
{
  id *v1;

  v1 = (id *)getkSUDownloadPhasePreparingForInstallationSymbolLoc();
  if (!v1)
  {
    dlerror();
    abort_report_np();
  }
  return *v1;
}

uint64_t getkSUDownloadPhasePreparingForInstallationSymbolLoc()
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  int v11;
  int v12;
  uint64_t v13;

  v9 = 0;
  v10 = &v9;
  v11 = 0x20000000;
  v12 = 32;
  v8 = getkSUDownloadPhasePreparingForInstallationSymbolLoc_ptr;
  v13 = getkSUDownloadPhasePreparingForInstallationSymbolLoc_ptr;
  if (!getkSUDownloadPhasePreparingForInstallationSymbolLoc_ptr)
  {
    v2 = MEMORY[0x24BDAC760];
    v3 = -1073741824;
    v4 = 0;
    v5 = __getkSUDownloadPhasePreparingForInstallationSymbolLoc_block_invoke;
    v6 = &unk_24DFF80D0;
    v7 = &v9;
    __getkSUDownloadPhasePreparingForInstallationSymbolLoc_block_invoke((uint64_t)&v2);
  }
  v1 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __getkSUDownloadPhasePreparingForInstallationSymbolLoc_block_invoke(uint64_t a1)
{
  void *updated;
  void *v2;
  uint64_t result;

  updated = (void *)SoftwareUpdateServicesLibrary_1();
  v2 = dlsym(updated, "kSUDownloadPhasePreparingForInstallation");
  result = a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v2;
  getkSUDownloadPhasePreparingForInstallationSymbolLoc_ptr = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SoftwareUpdateServicesLibrary_1()
{
  uint64_t updated;

  updated = SoftwareUpdateServicesLibraryCore_1();
  if (!updated)
    abort_report_np();
  return updated;
}

uint64_t SoftwareUpdateServicesLibraryCore_1()
{
  if (!SoftwareUpdateServicesLibraryCore_frameworkLibrary_1)
    __SoftwareUpdateServicesLibraryCore_block_invoke_1();
  return SoftwareUpdateServicesLibraryCore_frameworkLibrary_1;
}

uint64_t __os_log_helper_16_2_16_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34_8_64_8_0_8_64_8_0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 16;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 66;
  *(_BYTE *)(result + 33) = 8;
  *(_QWORD *)(result + 34) = a5;
  *(_BYTE *)(result + 42) = 0;
  *(_BYTE *)(result + 43) = 8;
  *(_QWORD *)(result + 44) = a6;
  *(_BYTE *)(result + 52) = 66;
  *(_BYTE *)(result + 53) = 8;
  *(_QWORD *)(result + 54) = a7;
  *(_BYTE *)(result + 62) = 0;
  *(_BYTE *)(result + 63) = 8;
  *(_QWORD *)(result + 64) = a8;
  *(_BYTE *)(result + 72) = 66;
  *(_BYTE *)(result + 73) = 8;
  *(_QWORD *)(result + 74) = a9;
  *(_BYTE *)(result + 82) = 0;
  *(_BYTE *)(result + 83) = 8;
  *(_QWORD *)(result + 84) = a10;
  *(_BYTE *)(result + 92) = 66;
  *(_BYTE *)(result + 93) = 8;
  *(_QWORD *)(result + 94) = a11;
  *(_BYTE *)(result + 102) = 0;
  *(_BYTE *)(result + 103) = 8;
  *(_QWORD *)(result + 104) = a12;
  *(_BYTE *)(result + 112) = 34;
  *(_BYTE *)(result + 113) = 8;
  *(_QWORD *)(result + 114) = a13;
  *(_BYTE *)(result + 122) = 64;
  *(_BYTE *)(result + 123) = 8;
  *(_QWORD *)(result + 124) = a14;
  *(_BYTE *)(result + 132) = 0;
  *(_BYTE *)(result + 133) = 8;
  *(_QWORD *)(result + 134) = a15;
  *(_BYTE *)(result + 142) = 64;
  *(_BYTE *)(result + 143) = 8;
  *(_QWORD *)(result + 144) = a16;
  *(_BYTE *)(result + 152) = 0;
  *(_BYTE *)(result + 153) = 8;
  *(_QWORD *)(result + 154) = a17;
  return result;
}

uint64_t __os_log_helper_16_2_18_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34_8_66_8_0_8_64_8_0_8_64_8_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  uint64_t result;

  result = a9;
  *(_BYTE *)a1 = 2;
  *(_BYTE *)(a1 + 1) = 18;
  *(_BYTE *)(a1 + 2) = 32;
  *(_BYTE *)(a1 + 3) = 8;
  *(_QWORD *)(a1 + 4) = a2;
  *(_BYTE *)(a1 + 12) = 66;
  *(_BYTE *)(a1 + 13) = 8;
  *(_QWORD *)(a1 + 14) = a3;
  *(_BYTE *)(a1 + 22) = 0;
  *(_BYTE *)(a1 + 23) = 8;
  *(_QWORD *)(a1 + 24) = a4;
  *(_BYTE *)(a1 + 32) = 66;
  *(_BYTE *)(a1 + 33) = 8;
  *(_QWORD *)(a1 + 34) = a5;
  *(_BYTE *)(a1 + 42) = 0;
  *(_BYTE *)(a1 + 43) = 8;
  *(_QWORD *)(a1 + 44) = a6;
  *(_BYTE *)(a1 + 52) = 66;
  *(_BYTE *)(a1 + 53) = 8;
  *(_QWORD *)(a1 + 54) = a7;
  *(_BYTE *)(a1 + 62) = 0;
  *(_BYTE *)(a1 + 63) = 8;
  *(_QWORD *)(a1 + 64) = a8;
  *(_BYTE *)(a1 + 72) = 66;
  *(_BYTE *)(a1 + 73) = 8;
  *(_QWORD *)(a1 + 74) = a9;
  *(_BYTE *)(a1 + 82) = 0;
  *(_BYTE *)(a1 + 83) = 8;
  *(_QWORD *)(a1 + 84) = a10;
  *(_BYTE *)(a1 + 92) = 66;
  *(_BYTE *)(a1 + 93) = 8;
  *(_QWORD *)(a1 + 94) = a11;
  *(_BYTE *)(a1 + 102) = 0;
  *(_BYTE *)(a1 + 103) = 8;
  *(_QWORD *)(a1 + 104) = a12;
  *(_BYTE *)(a1 + 112) = 34;
  *(_BYTE *)(a1 + 113) = 8;
  *(_QWORD *)(a1 + 114) = a13;
  *(_BYTE *)(a1 + 122) = 66;
  *(_BYTE *)(a1 + 123) = 8;
  *(_QWORD *)(a1 + 124) = a14;
  *(_BYTE *)(a1 + 132) = 0;
  *(_BYTE *)(a1 + 133) = 8;
  *(_QWORD *)(a1 + 134) = a15;
  *(_BYTE *)(a1 + 142) = 64;
  *(_BYTE *)(a1 + 143) = 8;
  *(_QWORD *)(a1 + 144) = a16;
  *(_BYTE *)(a1 + 152) = 0;
  *(_BYTE *)(a1 + 153) = 8;
  *(_QWORD *)(a1 + 154) = a17;
  *(_BYTE *)(a1 + 162) = 64;
  *(_BYTE *)(a1 + 163) = 8;
  *(_QWORD *)(a1 + 164) = a18;
  *(_BYTE *)(a1 + 172) = 0;
  *(_BYTE *)(a1 + 173) = 8;
  *(_QWORD *)(a1 + 174) = a19;
  return result;
}

uint64_t __os_log_helper_16_2_14_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34_8_66_8_0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 14;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 66;
  *(_BYTE *)(result + 33) = 8;
  *(_QWORD *)(result + 34) = a5;
  *(_BYTE *)(result + 42) = 0;
  *(_BYTE *)(result + 43) = 8;
  *(_QWORD *)(result + 44) = a6;
  *(_BYTE *)(result + 52) = 66;
  *(_BYTE *)(result + 53) = 8;
  *(_QWORD *)(result + 54) = a7;
  *(_BYTE *)(result + 62) = 0;
  *(_BYTE *)(result + 63) = 8;
  *(_QWORD *)(result + 64) = a8;
  *(_BYTE *)(result + 72) = 66;
  *(_BYTE *)(result + 73) = 8;
  *(_QWORD *)(result + 74) = a9;
  *(_BYTE *)(result + 82) = 0;
  *(_BYTE *)(result + 83) = 8;
  *(_QWORD *)(result + 84) = a10;
  *(_BYTE *)(result + 92) = 66;
  *(_BYTE *)(result + 93) = 8;
  *(_QWORD *)(result + 94) = a11;
  *(_BYTE *)(result + 102) = 0;
  *(_BYTE *)(result + 103) = 8;
  *(_QWORD *)(result + 104) = a12;
  *(_BYTE *)(result + 112) = 34;
  *(_BYTE *)(result + 113) = 8;
  *(_QWORD *)(result + 114) = a13;
  *(_BYTE *)(result + 122) = 66;
  *(_BYTE *)(result + 123) = 8;
  *(_QWORD *)(result + 124) = a14;
  *(_BYTE *)(result + 132) = 0;
  *(_BYTE *)(result + 133) = 8;
  *(_QWORD *)(result + 134) = a15;
  return result;
}

uint64_t __os_log_helper_16_2_14_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34_4_0_8_66(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, uint64_t a15)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 14;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 66;
  *(_BYTE *)(result + 33) = 8;
  *(_QWORD *)(result + 34) = a5;
  *(_BYTE *)(result + 42) = 0;
  *(_BYTE *)(result + 43) = 8;
  *(_QWORD *)(result + 44) = a6;
  *(_BYTE *)(result + 52) = 66;
  *(_BYTE *)(result + 53) = 8;
  *(_QWORD *)(result + 54) = a7;
  *(_BYTE *)(result + 62) = 0;
  *(_BYTE *)(result + 63) = 8;
  *(_QWORD *)(result + 64) = a8;
  *(_BYTE *)(result + 72) = 66;
  *(_BYTE *)(result + 73) = 8;
  *(_QWORD *)(result + 74) = a9;
  *(_BYTE *)(result + 82) = 0;
  *(_BYTE *)(result + 83) = 8;
  *(_QWORD *)(result + 84) = a10;
  *(_BYTE *)(result + 92) = 66;
  *(_BYTE *)(result + 93) = 8;
  *(_QWORD *)(result + 94) = a11;
  *(_BYTE *)(result + 102) = 0;
  *(_BYTE *)(result + 103) = 8;
  *(_QWORD *)(result + 104) = a12;
  *(_BYTE *)(result + 112) = 34;
  *(_BYTE *)(result + 113) = 8;
  *(_QWORD *)(result + 114) = a13;
  *(_BYTE *)(result + 122) = 0;
  *(_BYTE *)(result + 123) = 4;
  *(_DWORD *)(result + 124) = a14;
  *(_BYTE *)(result + 128) = 66;
  *(_BYTE *)(result + 129) = 8;
  *(_QWORD *)(result + 130) = a15;
  return result;
}

void system_root_status(_BYTE *a1, _BYTE *a2)
{
  id location;
  dispatch_once_t *v5;

  v5 = (dispatch_once_t *)&system_root_status_onceToken;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global_513);
  if (*v5 != -1)
    dispatch_once(v5, location);
  objc_storeStrong(&location, 0);
  if (a1)
    *a1 = system_root_status_is_live_fs & 1;
  if (a2)
    *a2 = system_root_status_darwinup & 1;
}

id getkSUDownloadPhasePreparingForInstallation_0()
{
  id *v1;

  v1 = (id *)getkSUDownloadPhasePreparingForInstallationSymbolLoc_0();
  if (!v1)
  {
    dlerror();
    abort_report_np();
  }
  return *v1;
}

void sub_21BF922E4()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

id getSUErrorDomain_1()
{
  id *SUErrorDomainSymbolLoc_1;

  SUErrorDomainSymbolLoc_1 = (id *)getSUErrorDomainSymbolLoc_1();
  if (!SUErrorDomainSymbolLoc_1)
  {
    dlerror();
    abort_report_np();
  }
  return *SUErrorDomainSymbolLoc_1;
}

id getkSUInstallationConstraintsUnmetKey_0()
{
  id *v1;

  v1 = (id *)getkSUInstallationConstraintsUnmetKeySymbolLoc_0();
  if (!v1)
  {
    dlerror();
    abort_report_np();
  }
  return *v1;
}

uint64_t __os_log_helper_16_2_3_8_0_8_64_8_64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 64;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  return result;
}

void __system_root_status_block_invoke(NSObject *a1)
{
  int *v1;
  os_log_t v2;
  os_log_type_t v3;
  os_log_t v4;
  id location;
  os_log_type_t type;
  os_log_t oslog[3];
  uint8_t v8[32];
  uint8_t v9[32];
  uint8_t v10[32];
  statfs v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  oslog[2] = a1;
  oslog[1] = a1;
  bzero(&v11, 0x200uLL);
  bzero(&v11, 0x878uLL);
  if (statfs("/", &v11))
  {
    oslog[0] = (os_log_t)_SUSUILoggingFacility();
    type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      v1 = __error();
      __os_log_helper_16_2_2_8_32_4_0((uint64_t)v10, (uint64_t)"void system_root_status(_Bool *, _Bool *)_block_invoke", *v1);
      _os_log_impl(&dword_21BF33000, oslog[0], type, "%s: statfs(\"/\") failed: %d", v10, 0x12u);
    }
    objc_storeStrong((id *)oslog, 0);
  }
  else
  {
    location = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v11.f_mntfromname);
    if ((objc_msgSend(location, "containsString:", CFSTR("darwinup")) & 1) != 0)
    {
      v4 = (os_log_t)_SUSUILoggingFacility();
      v3 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_2_8_32_8_64((uint64_t)v9, (uint64_t)"void system_root_status(_Bool *, _Bool *)_block_invoke", (uint64_t)location);
        _os_log_impl(&dword_21BF33000, v4, v3, "%s: rooted from darwinup snapshot %@", v9, 0x16u);
      }
      objc_storeStrong((id *)&v4, 0);
      system_root_status_darwinup = 1;
    }
    if ((objc_msgSend(location, "hasPrefix:", CFSTR("/dev/disk")) & 1) != 0)
    {
      v2 = (os_log_t)_SUSUILoggingFacility();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_2_8_32_8_64((uint64_t)v8, (uint64_t)"void system_root_status(_Bool *, _Bool *)_block_invoke", (uint64_t)location);
        _os_log_impl(&dword_21BF33000, v2, OS_LOG_TYPE_DEFAULT, "%s: rooted from live fs %@", v8, 0x16u);
      }
      objc_storeStrong((id *)&v2, 0);
      system_root_status_is_live_fs = 1;
    }
    objc_storeStrong(&location, 0);
  }
}

uint64_t getkSUDownloadPhasePreparingForInstallationSymbolLoc_0()
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  int v11;
  int v12;
  uint64_t v13;

  v9 = 0;
  v10 = &v9;
  v11 = 0x20000000;
  v12 = 32;
  v8 = getkSUDownloadPhasePreparingForInstallationSymbolLoc_ptr_0;
  v13 = getkSUDownloadPhasePreparingForInstallationSymbolLoc_ptr_0;
  if (!getkSUDownloadPhasePreparingForInstallationSymbolLoc_ptr_0)
  {
    v2 = MEMORY[0x24BDAC760];
    v3 = -1073741824;
    v4 = 0;
    v5 = __getkSUDownloadPhasePreparingForInstallationSymbolLoc_block_invoke_0;
    v6 = &unk_24DFF80D0;
    v7 = &v9;
    __getkSUDownloadPhasePreparingForInstallationSymbolLoc_block_invoke_0((uint64_t)&v2);
  }
  v1 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __getkSUDownloadPhasePreparingForInstallationSymbolLoc_block_invoke_0(uint64_t a1)
{
  void *updated;
  void *v2;
  uint64_t result;

  updated = (void *)SoftwareUpdateServicesLibrary_2();
  v2 = dlsym(updated, "kSUDownloadPhasePreparingForInstallation");
  result = a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v2;
  getkSUDownloadPhasePreparingForInstallationSymbolLoc_ptr_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SoftwareUpdateServicesLibrary_2()
{
  uint64_t updated;

  updated = SoftwareUpdateServicesLibraryCore_2();
  if (!updated)
    abort_report_np();
  return updated;
}

uint64_t SoftwareUpdateServicesLibraryCore_2()
{
  if (!SoftwareUpdateServicesLibraryCore_frameworkLibrary_2)
    __SoftwareUpdateServicesLibraryCore_block_invoke_2();
  return SoftwareUpdateServicesLibraryCore_frameworkLibrary_2;
}

uint64_t getSUErrorDomainSymbolLoc_1()
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  int v11;
  int v12;
  uint64_t v13;

  v9 = 0;
  v10 = &v9;
  v11 = 0x20000000;
  v12 = 32;
  v8 = getSUErrorDomainSymbolLoc_ptr_1;
  v13 = getSUErrorDomainSymbolLoc_ptr_1;
  if (!getSUErrorDomainSymbolLoc_ptr_1)
  {
    v2 = MEMORY[0x24BDAC760];
    v3 = -1073741824;
    v4 = 0;
    v5 = __getSUErrorDomainSymbolLoc_block_invoke_1;
    v6 = &unk_24DFF80D0;
    v7 = &v9;
    __getSUErrorDomainSymbolLoc_block_invoke_1((uint64_t)&v2);
  }
  v1 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __getSUErrorDomainSymbolLoc_block_invoke_1(uint64_t a1)
{
  void *updated;
  void *v2;
  uint64_t result;

  updated = (void *)SoftwareUpdateServicesLibrary_2();
  v2 = dlsym(updated, "SUErrorDomain");
  result = a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v2;
  getSUErrorDomainSymbolLoc_ptr_1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getkSUInstallationConstraintsUnmetKeySymbolLoc_0()
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  int v11;
  int v12;
  uint64_t v13;

  v9 = 0;
  v10 = &v9;
  v11 = 0x20000000;
  v12 = 32;
  v8 = getkSUInstallationConstraintsUnmetKeySymbolLoc_ptr_0;
  v13 = getkSUInstallationConstraintsUnmetKeySymbolLoc_ptr_0;
  if (!getkSUInstallationConstraintsUnmetKeySymbolLoc_ptr_0)
  {
    v2 = MEMORY[0x24BDAC760];
    v3 = -1073741824;
    v4 = 0;
    v5 = __getkSUInstallationConstraintsUnmetKeySymbolLoc_block_invoke_0;
    v6 = &unk_24DFF80D0;
    v7 = &v9;
    __getkSUInstallationConstraintsUnmetKeySymbolLoc_block_invoke_0((uint64_t)&v2);
  }
  v1 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __getkSUInstallationConstraintsUnmetKeySymbolLoc_block_invoke_0(uint64_t a1)
{
  void *updated;
  void *v2;
  uint64_t result;

  updated = (void *)SoftwareUpdateServicesLibrary_2();
  v2 = dlsym(updated, "kSUInstallationConstraintsUnmetKey");
  result = a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v2;
  getkSUInstallationConstraintsUnmetKeySymbolLoc_ptr_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __os_log_helper_16_2_4_8_64_8_66_8_66_8_66(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 4;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 66;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 66;
  *(_BYTE *)(result + 33) = 8;
  *(_QWORD *)(result + 34) = a5;
  return result;
}

__CFString *SUSettingsUpdateOperationTypeToString(unint64_t a1)
{
  if (a1 <= 5)
    __asm { BR              X8 }
  return CFSTR("Unknown");
}

uint64_t __os_log_helper_16_2_6_8_32_8_66_8_66_8_66_8_0_8_66(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 6;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 66;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 66;
  *(_BYTE *)(result + 33) = 8;
  *(_QWORD *)(result + 34) = a5;
  *(_BYTE *)(result + 42) = 0;
  *(_BYTE *)(result + 43) = 8;
  *(_QWORD *)(result + 44) = a6;
  *(_BYTE *)(result + 52) = 66;
  *(_BYTE *)(result + 53) = 8;
  *(_QWORD *)(result + 54) = a7;
  return result;
}

uint64_t __os_log_helper_16_2_4_8_32_8_66_4_0_8_66(uint64_t result, uint64_t a2, uint64_t a3, int a4, uint64_t a5)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 4;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 4;
  *(_DWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 28) = 66;
  *(_BYTE *)(result + 29) = 8;
  *(_QWORD *)(result + 30) = a5;
  return result;
}

uint64_t __os_log_helper_16_2_4_8_32_8_66_8_66_8_66(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 4;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 66;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 66;
  *(_BYTE *)(result + 33) = 8;
  *(_QWORD *)(result + 34) = a5;
  return result;
}

uint64_t __os_log_helper_16_2_4_8_32_8_66_4_0_4_0(uint64_t result, uint64_t a2, uint64_t a3, int a4, int a5)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 4;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 4;
  *(_DWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 28) = 0;
  *(_BYTE *)(result + 29) = 4;
  *(_DWORD *)(result + 30) = a5;
  return result;
}

uint64_t __os_log_helper_16_2_5_8_32_8_66_8_66_4_0_4_0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 5;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 66;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 0;
  *(_BYTE *)(result + 33) = 4;
  *(_DWORD *)(result + 34) = a5;
  *(_BYTE *)(result + 38) = 0;
  *(_BYTE *)(result + 39) = 4;
  *(_DWORD *)(result + 40) = a6;
  return result;
}

uint64_t __os_log_helper_16_2_3_8_32_8_66_4_0(uint64_t result, uint64_t a2, uint64_t a3, int a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 4;
  *(_DWORD *)(result + 24) = a4;
  return result;
}

uint64_t __os_log_helper_16_2_4_8_32_8_66_8_66_4_0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 4;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 66;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 0;
  *(_BYTE *)(result + 33) = 4;
  *(_DWORD *)(result + 34) = a5;
  return result;
}

uint64_t __os_log_helper_16_2_4_8_32_8_66_8_66_8_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 4;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 66;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 2;
  *(_BYTE *)(result + 33) = 8;
  *(_QWORD *)(result + 34) = a5;
  return result;
}

id getSUDownloadPolicyFactoryClass()
{
  id v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  int v11;
  int v12;
  uint64_t v13;

  v9 = 0;
  v10 = &v9;
  v11 = 1342177280;
  v12 = 32;
  v8 = getSUDownloadPolicyFactoryClass_softClass;
  v13 = getSUDownloadPolicyFactoryClass_softClass;
  if (!getSUDownloadPolicyFactoryClass_softClass)
  {
    v2 = MEMORY[0x24BDAC760];
    v3 = -1073741824;
    v4 = 0;
    v5 = __getSUDownloadPolicyFactoryClass_block_invoke;
    v6 = &unk_24DFF80D0;
    v7 = &v9;
    __getSUDownloadPolicyFactoryClass_block_invoke((uint64_t)&v2);
  }
  v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

id getSUErrorDomain_2()
{
  id *SUErrorDomainSymbolLoc_2;

  SUErrorDomainSymbolLoc_2 = (id *)getSUErrorDomainSymbolLoc_2();
  if (!SUErrorDomainSymbolLoc_2)
  {
    dlerror();
    abort_report_np();
  }
  return *SUErrorDomainSymbolLoc_2;
}

uint64_t __os_log_helper_16_2_4_8_32_8_66_8_32_8_66(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 4;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 32;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 66;
  *(_BYTE *)(result + 33) = 8;
  *(_QWORD *)(result + 34) = a5;
  return result;
}

void sub_21BFA1D0C()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

void sub_21BFA20B8()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

void sub_21BFA246C()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

void sub_21BFA2868()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

void sub_21BFA3028()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

void sub_21BFA34D4()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

uint64_t __getSUDownloadPolicyFactoryClass_block_invoke(uint64_t a1)
{
  Class Class;
  uint64_t result;

  SoftwareUpdateServicesLibrary_3();
  Class = objc_getClass("SUDownloadPolicyFactory");
  result = a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = Class;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    result = abort_report_np();
  getSUDownloadPolicyFactoryClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SoftwareUpdateServicesLibrary_3()
{
  uint64_t updated;

  updated = SoftwareUpdateServicesLibraryCore_3();
  if (!updated)
    abort_report_np();
  return updated;
}

uint64_t SoftwareUpdateServicesLibraryCore_3()
{
  if (!SoftwareUpdateServicesLibraryCore_frameworkLibrary_3)
    __SoftwareUpdateServicesLibraryCore_block_invoke_3();
  return SoftwareUpdateServicesLibraryCore_frameworkLibrary_3;
}

uint64_t getSUErrorDomainSymbolLoc_2()
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  int v11;
  int v12;
  uint64_t v13;

  v9 = 0;
  v10 = &v9;
  v11 = 0x20000000;
  v12 = 32;
  v8 = getSUErrorDomainSymbolLoc_ptr_2;
  v13 = getSUErrorDomainSymbolLoc_ptr_2;
  if (!getSUErrorDomainSymbolLoc_ptr_2)
  {
    v2 = MEMORY[0x24BDAC760];
    v3 = -1073741824;
    v4 = 0;
    v5 = __getSUErrorDomainSymbolLoc_block_invoke_2;
    v6 = &unk_24DFF80D0;
    v7 = &v9;
    __getSUErrorDomainSymbolLoc_block_invoke_2((uint64_t)&v2);
  }
  v1 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __getSUErrorDomainSymbolLoc_block_invoke_2(uint64_t a1)
{
  void *updated;
  void *v2;
  uint64_t result;

  updated = (void *)SoftwareUpdateServicesLibrary_3();
  v2 = dlsym(updated, "SUErrorDomain");
  result = a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v2;
  getSUErrorDomainSymbolLoc_ptr_2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __os_log_helper_16_2_13_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34_8_64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 13;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 66;
  *(_BYTE *)(result + 33) = 8;
  *(_QWORD *)(result + 34) = a5;
  *(_BYTE *)(result + 42) = 0;
  *(_BYTE *)(result + 43) = 8;
  *(_QWORD *)(result + 44) = a6;
  *(_BYTE *)(result + 52) = 66;
  *(_BYTE *)(result + 53) = 8;
  *(_QWORD *)(result + 54) = a7;
  *(_BYTE *)(result + 62) = 0;
  *(_BYTE *)(result + 63) = 8;
  *(_QWORD *)(result + 64) = a8;
  *(_BYTE *)(result + 72) = 66;
  *(_BYTE *)(result + 73) = 8;
  *(_QWORD *)(result + 74) = a9;
  *(_BYTE *)(result + 82) = 0;
  *(_BYTE *)(result + 83) = 8;
  *(_QWORD *)(result + 84) = a10;
  *(_BYTE *)(result + 92) = 66;
  *(_BYTE *)(result + 93) = 8;
  *(_QWORD *)(result + 94) = a11;
  *(_BYTE *)(result + 102) = 0;
  *(_BYTE *)(result + 103) = 8;
  *(_QWORD *)(result + 104) = a12;
  *(_BYTE *)(result + 112) = 34;
  *(_BYTE *)(result + 113) = 8;
  *(_QWORD *)(result + 114) = a13;
  *(_BYTE *)(result + 122) = 64;
  *(_BYTE *)(result + 123) = 8;
  *(_QWORD *)(result + 124) = a14;
  return result;
}

uint64_t __os_log_helper_16_2_18_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34_8_66_8_66_8_0_8_66_8_0_8_66(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  uint64_t result;

  result = a9;
  *(_BYTE *)a1 = 2;
  *(_BYTE *)(a1 + 1) = 18;
  *(_BYTE *)(a1 + 2) = 32;
  *(_BYTE *)(a1 + 3) = 8;
  *(_QWORD *)(a1 + 4) = a2;
  *(_BYTE *)(a1 + 12) = 66;
  *(_BYTE *)(a1 + 13) = 8;
  *(_QWORD *)(a1 + 14) = a3;
  *(_BYTE *)(a1 + 22) = 0;
  *(_BYTE *)(a1 + 23) = 8;
  *(_QWORD *)(a1 + 24) = a4;
  *(_BYTE *)(a1 + 32) = 66;
  *(_BYTE *)(a1 + 33) = 8;
  *(_QWORD *)(a1 + 34) = a5;
  *(_BYTE *)(a1 + 42) = 0;
  *(_BYTE *)(a1 + 43) = 8;
  *(_QWORD *)(a1 + 44) = a6;
  *(_BYTE *)(a1 + 52) = 66;
  *(_BYTE *)(a1 + 53) = 8;
  *(_QWORD *)(a1 + 54) = a7;
  *(_BYTE *)(a1 + 62) = 0;
  *(_BYTE *)(a1 + 63) = 8;
  *(_QWORD *)(a1 + 64) = a8;
  *(_BYTE *)(a1 + 72) = 66;
  *(_BYTE *)(a1 + 73) = 8;
  *(_QWORD *)(a1 + 74) = a9;
  *(_BYTE *)(a1 + 82) = 0;
  *(_BYTE *)(a1 + 83) = 8;
  *(_QWORD *)(a1 + 84) = a10;
  *(_BYTE *)(a1 + 92) = 66;
  *(_BYTE *)(a1 + 93) = 8;
  *(_QWORD *)(a1 + 94) = a11;
  *(_BYTE *)(a1 + 102) = 0;
  *(_BYTE *)(a1 + 103) = 8;
  *(_QWORD *)(a1 + 104) = a12;
  *(_BYTE *)(a1 + 112) = 34;
  *(_BYTE *)(a1 + 113) = 8;
  *(_QWORD *)(a1 + 114) = a13;
  *(_BYTE *)(a1 + 122) = 66;
  *(_BYTE *)(a1 + 123) = 8;
  *(_QWORD *)(a1 + 124) = a14;
  *(_BYTE *)(a1 + 132) = 66;
  *(_BYTE *)(a1 + 133) = 8;
  *(_QWORD *)(a1 + 134) = a15;
  *(_BYTE *)(a1 + 142) = 0;
  *(_BYTE *)(a1 + 143) = 8;
  *(_QWORD *)(a1 + 144) = a16;
  *(_BYTE *)(a1 + 152) = 66;
  *(_BYTE *)(a1 + 153) = 8;
  *(_QWORD *)(a1 + 154) = a17;
  *(_BYTE *)(a1 + 162) = 0;
  *(_BYTE *)(a1 + 163) = 8;
  *(_QWORD *)(a1 + 164) = a18;
  *(_BYTE *)(a1 + 172) = 66;
  *(_BYTE *)(a1 + 173) = 8;
  *(_QWORD *)(a1 + 174) = a19;
  return result;
}

uint64_t __os_log_helper_16_2_13_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34_8_66(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 13;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 66;
  *(_BYTE *)(result + 33) = 8;
  *(_QWORD *)(result + 34) = a5;
  *(_BYTE *)(result + 42) = 0;
  *(_BYTE *)(result + 43) = 8;
  *(_QWORD *)(result + 44) = a6;
  *(_BYTE *)(result + 52) = 66;
  *(_BYTE *)(result + 53) = 8;
  *(_QWORD *)(result + 54) = a7;
  *(_BYTE *)(result + 62) = 0;
  *(_BYTE *)(result + 63) = 8;
  *(_QWORD *)(result + 64) = a8;
  *(_BYTE *)(result + 72) = 66;
  *(_BYTE *)(result + 73) = 8;
  *(_QWORD *)(result + 74) = a9;
  *(_BYTE *)(result + 82) = 0;
  *(_BYTE *)(result + 83) = 8;
  *(_QWORD *)(result + 84) = a10;
  *(_BYTE *)(result + 92) = 66;
  *(_BYTE *)(result + 93) = 8;
  *(_QWORD *)(result + 94) = a11;
  *(_BYTE *)(result + 102) = 0;
  *(_BYTE *)(result + 103) = 8;
  *(_QWORD *)(result + 104) = a12;
  *(_BYTE *)(result + 112) = 34;
  *(_BYTE *)(result + 113) = 8;
  *(_QWORD *)(result + 114) = a13;
  *(_BYTE *)(result + 122) = 66;
  *(_BYTE *)(result + 123) = 8;
  *(_QWORD *)(result + 124) = a14;
  return result;
}

uint64_t __os_log_helper_16_2_3_8_32_8_0_8_66(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 66;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  return result;
}

uint64_t __os_log_helper_16_2_3_8_32_8_66_8_0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  return result;
}

uint64_t __os_log_helper_16_2_3_8_32_8_0_8_64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 64;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  return result;
}

uint64_t __os_log_helper_16_2_2_8_0_8_66(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  return result;
}

uint64_t __os_log_helper_16_2_5_8_0_8_0_8_0_8_66_8_66(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 5;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 66;
  *(_BYTE *)(result + 33) = 8;
  *(_QWORD *)(result + 34) = a5;
  *(_BYTE *)(result + 42) = 66;
  *(_BYTE *)(result + 43) = 8;
  *(_QWORD *)(result + 44) = a6;
  return result;
}

uint64_t __os_log_helper_16_2_14_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34_8_0_8_0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 14;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 66;
  *(_BYTE *)(result + 33) = 8;
  *(_QWORD *)(result + 34) = a5;
  *(_BYTE *)(result + 42) = 0;
  *(_BYTE *)(result + 43) = 8;
  *(_QWORD *)(result + 44) = a6;
  *(_BYTE *)(result + 52) = 66;
  *(_BYTE *)(result + 53) = 8;
  *(_QWORD *)(result + 54) = a7;
  *(_BYTE *)(result + 62) = 0;
  *(_BYTE *)(result + 63) = 8;
  *(_QWORD *)(result + 64) = a8;
  *(_BYTE *)(result + 72) = 66;
  *(_BYTE *)(result + 73) = 8;
  *(_QWORD *)(result + 74) = a9;
  *(_BYTE *)(result + 82) = 0;
  *(_BYTE *)(result + 83) = 8;
  *(_QWORD *)(result + 84) = a10;
  *(_BYTE *)(result + 92) = 66;
  *(_BYTE *)(result + 93) = 8;
  *(_QWORD *)(result + 94) = a11;
  *(_BYTE *)(result + 102) = 0;
  *(_BYTE *)(result + 103) = 8;
  *(_QWORD *)(result + 104) = a12;
  *(_BYTE *)(result + 112) = 34;
  *(_BYTE *)(result + 113) = 8;
  *(_QWORD *)(result + 114) = a13;
  *(_BYTE *)(result + 122) = 0;
  *(_BYTE *)(result + 123) = 8;
  *(_QWORD *)(result + 124) = a14;
  *(_BYTE *)(result + 132) = 0;
  *(_BYTE *)(result + 133) = 8;
  *(_QWORD *)(result + 134) = a15;
  return result;
}

uint64_t __os_log_helper_16_2_13_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34_8_0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 13;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 66;
  *(_BYTE *)(result + 33) = 8;
  *(_QWORD *)(result + 34) = a5;
  *(_BYTE *)(result + 42) = 0;
  *(_BYTE *)(result + 43) = 8;
  *(_QWORD *)(result + 44) = a6;
  *(_BYTE *)(result + 52) = 66;
  *(_BYTE *)(result + 53) = 8;
  *(_QWORD *)(result + 54) = a7;
  *(_BYTE *)(result + 62) = 0;
  *(_BYTE *)(result + 63) = 8;
  *(_QWORD *)(result + 64) = a8;
  *(_BYTE *)(result + 72) = 66;
  *(_BYTE *)(result + 73) = 8;
  *(_QWORD *)(result + 74) = a9;
  *(_BYTE *)(result + 82) = 0;
  *(_BYTE *)(result + 83) = 8;
  *(_QWORD *)(result + 84) = a10;
  *(_BYTE *)(result + 92) = 66;
  *(_BYTE *)(result + 93) = 8;
  *(_QWORD *)(result + 94) = a11;
  *(_BYTE *)(result + 102) = 0;
  *(_BYTE *)(result + 103) = 8;
  *(_QWORD *)(result + 104) = a12;
  *(_BYTE *)(result + 112) = 34;
  *(_BYTE *)(result + 113) = 8;
  *(_QWORD *)(result + 114) = a13;
  *(_BYTE *)(result + 122) = 0;
  *(_BYTE *)(result + 123) = 8;
  *(_QWORD *)(result + 124) = a14;
  return result;
}

uint64_t __os_log_helper_16_2_8_8_32_8_34_8_0_8_0_8_0_8_66_8_0_8_0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 8;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 34;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 0;
  *(_BYTE *)(result + 33) = 8;
  *(_QWORD *)(result + 34) = a5;
  *(_BYTE *)(result + 42) = 0;
  *(_BYTE *)(result + 43) = 8;
  *(_QWORD *)(result + 44) = a6;
  *(_BYTE *)(result + 52) = 66;
  *(_BYTE *)(result + 53) = 8;
  *(_QWORD *)(result + 54) = a7;
  *(_BYTE *)(result + 62) = 0;
  *(_BYTE *)(result + 63) = 8;
  *(_QWORD *)(result + 64) = a8;
  *(_BYTE *)(result + 72) = 0;
  *(_BYTE *)(result + 73) = 8;
  *(_QWORD *)(result + 74) = a9;
  return result;
}

void sub_21BFB3A38()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

id getSUSUIUserDefaultsKeysClass_0()
{
  id v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  int v11;
  int v12;
  uint64_t v13;

  v9 = 0;
  v10 = &v9;
  v11 = 1342177280;
  v12 = 32;
  v8 = getSUSUIUserDefaultsKeysClass_softClass_0;
  v13 = getSUSUIUserDefaultsKeysClass_softClass_0;
  if (!getSUSUIUserDefaultsKeysClass_softClass_0)
  {
    v2 = MEMORY[0x24BDAC760];
    v3 = -1073741824;
    v4 = 0;
    v5 = __getSUSUIUserDefaultsKeysClass_block_invoke_0;
    v6 = &unk_24DFF80D0;
    v7 = &v9;
    __getSUSUIUserDefaultsKeysClass_block_invoke_0((uint64_t)&v2);
  }
  v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

void sub_21BFB3DF8()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

id getSUSMKMockedServiceTypeUtilityClass_0()
{
  id v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  int v11;
  int v12;
  uint64_t v13;

  v9 = 0;
  v10 = &v9;
  v11 = 1342177280;
  v12 = 32;
  v8 = getSUSMKMockedServiceTypeUtilityClass_softClass_0;
  v13 = getSUSMKMockedServiceTypeUtilityClass_softClass_0;
  if (!getSUSMKMockedServiceTypeUtilityClass_softClass_0)
  {
    v2 = MEMORY[0x24BDAC760];
    v3 = -1073741824;
    v4 = 0;
    v5 = __getSUSMKMockedServiceTypeUtilityClass_block_invoke_0;
    v6 = &unk_24DFF80D0;
    v7 = &v9;
    __getSUSMKMockedServiceTypeUtilityClass_block_invoke_0((uint64_t)&v2);
  }
  v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

id getSUSMKUserDefaultsCodedTestCaseSessionClass()
{
  id v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  int v11;
  int v12;
  uint64_t v13;

  v9 = 0;
  v10 = &v9;
  v11 = 1342177280;
  v12 = 32;
  v8 = getSUSMKUserDefaultsCodedTestCaseSessionClass_softClass;
  v13 = getSUSMKUserDefaultsCodedTestCaseSessionClass_softClass;
  if (!getSUSMKUserDefaultsCodedTestCaseSessionClass_softClass)
  {
    v2 = MEMORY[0x24BDAC760];
    v3 = -1073741824;
    v4 = 0;
    v5 = __getSUSMKUserDefaultsCodedTestCaseSessionClass_block_invoke;
    v6 = &unk_24DFF80D0;
    v7 = &v9;
    __getSUSMKUserDefaultsCodedTestCaseSessionClass_block_invoke((uint64_t)&v2);
  }
  v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __os_log_helper_16_2_4_8_32_8_0_8_0_8_0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 4;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 0;
  *(_BYTE *)(result + 33) = 8;
  *(_QWORD *)(result + 34) = a5;
  return result;
}

uint64_t __os_log_helper_16_2_3_8_32_8_64_8_64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 64;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  return result;
}

uint64_t SoftwareUpdateSettingsMockingKitLibraryCore_0()
{
  if (!SoftwareUpdateSettingsMockingKitLibraryCore_frameworkLibrary_0)
    __SoftwareUpdateSettingsMockingKitLibraryCore_block_invoke_0();
  return SoftwareUpdateSettingsMockingKitLibraryCore_frameworkLibrary_0;
}

uint64_t __getSUSUIUserDefaultsKeysClass_block_invoke_0(uint64_t a1)
{
  Class Class;
  uint64_t result;

  SoftwareUpdateSettingsMockingKitLibrary_0();
  Class = objc_getClass("SUSUIUserDefaultsKeys");
  result = a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = Class;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    result = abort_report_np();
  getSUSUIUserDefaultsKeysClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SoftwareUpdateSettingsMockingKitLibrary_0()
{
  uint64_t updated;

  updated = SoftwareUpdateSettingsMockingKitLibraryCore_0();
  if (!updated)
    abort_report_np();
  return updated;
}

uint64_t __getSUSMKMockedServiceTypeUtilityClass_block_invoke_0(uint64_t a1)
{
  Class Class;
  uint64_t result;

  SoftwareUpdateSettingsMockingKitLibrary_0();
  Class = objc_getClass("SUSMKMockedServiceTypeUtility");
  result = a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = Class;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    result = abort_report_np();
  getSUSMKMockedServiceTypeUtilityClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __getSUSMKUserDefaultsCodedTestCaseSessionClass_block_invoke(uint64_t a1)
{
  Class Class;
  uint64_t result;

  SoftwareUpdateSettingsMockingKitLibrary_0();
  Class = objc_getClass("SUSMKUserDefaultsCodedTestCaseSession");
  result = a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = Class;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    result = abort_report_np();
  getSUSMKUserDefaultsCodedTestCaseSessionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

uint64_t __os_log_helper_16_2_2_8_34_8_66(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 34;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  return result;
}

uint64_t __os_log_helper_16_2_3_8_34_8_66_8_64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 34;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 64;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  return result;
}

uint64_t __os_log_helper_16_2_1_8_34(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 34;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  return result;
}

uint64_t __os_log_helper_16_2_2_8_34_4_0(uint64_t result, uint64_t a2, int a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 34;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  return result;
}

id SUSUISoftwareUpdateStateToString(unsigned int a1)
{
  id location;
  unsigned int v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  if (a1 <= 0x10uLL)
    __asm { BR              X8 }
  location = _SUSUILoggingFacility();
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
  {
    __os_log_helper_16_2_2_8_32_4_0((uint64_t)v4, (uint64_t)"NSString *const SUSUISoftwareUpdateStateToString(SUSUISoftwareUpdateState)", v3);
    _os_log_error_impl(&dword_21BF33000, (os_log_t)location, OS_LOG_TYPE_ERROR, "%s: Un-mapped state %d", v4, 0x12u);
  }
  objc_storeStrong(&location, 0);
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("N/A (state: %d)"), v3);
}

__CFString *SUInstallationTypeToString(uint64_t a1)
{
  id location;
  uint64_t v3;
  __CFString *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  if (a1)
  {
    if (a1 == 1)
    {
      v4 = CFSTR("InstallAfterDownload");
    }
    else if (a1 == 2)
    {
      v4 = CFSTR("InstallTonight");
    }
    else
    {
      location = _SUSUILoggingFacility();
      if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_2_8_32_8_0((uint64_t)v5, (uint64_t)"NSString *const SUInstallationTypeToString(SUInstallationType)", v3);
        _os_log_error_impl(&dword_21BF33000, (os_log_t)location, OS_LOG_TYPE_ERROR, "%s: Un-mapped installation type %lu", v5, 0x16u);
      }
      objc_storeStrong(&location, 0);
      v4 = (__CFString *)(id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("N/A (type: %lu)"), v3);
    }
  }
  else
  {
    v4 = CFSTR("DoNotInstall");
  }
  return v4;
}

id getSUNetworkMonitorClass_0()
{
  id v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  int v11;
  int v12;
  uint64_t v13;

  v9 = 0;
  v10 = &v9;
  v11 = 1342177280;
  v12 = 32;
  v8 = getSUNetworkMonitorClass_softClass_0;
  v13 = getSUNetworkMonitorClass_softClass_0;
  if (!getSUNetworkMonitorClass_softClass_0)
  {
    v2 = MEMORY[0x24BDAC760];
    v3 = -1073741824;
    v4 = 0;
    v5 = __getSUNetworkMonitorClass_block_invoke_0;
    v6 = &unk_24DFF80D0;
    v7 = &v9;
    __getSUNetworkMonitorClass_block_invoke_0((uint64_t)&v2);
  }
  v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

id getkSUDownloadPhasePreparingForInstallation_1()
{
  id *v1;

  v1 = (id *)getkSUDownloadPhasePreparingForInstallationSymbolLoc_1();
  if (!v1)
  {
    dlerror();
    abort_report_np();
  }
  return *v1;
}

uint64_t __os_log_helper_16_2_19_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_66_4_0_8_66_4_0(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, int a18, uint64_t a19, int a20)
{
  uint64_t result;

  result = a11;
  *(_BYTE *)a1 = 2;
  *(_BYTE *)(a1 + 1) = 19;
  *(_BYTE *)(a1 + 2) = 32;
  *(_BYTE *)(a1 + 3) = 8;
  *(_QWORD *)(a1 + 4) = a2;
  *(_BYTE *)(a1 + 12) = 66;
  *(_BYTE *)(a1 + 13) = 8;
  *(_QWORD *)(a1 + 14) = a3;
  *(_BYTE *)(a1 + 22) = 0;
  *(_BYTE *)(a1 + 23) = 4;
  *(_DWORD *)(a1 + 24) = a4;
  *(_BYTE *)(a1 + 28) = 66;
  *(_BYTE *)(a1 + 29) = 8;
  *(_QWORD *)(a1 + 30) = a5;
  *(_BYTE *)(a1 + 38) = 0;
  *(_BYTE *)(a1 + 39) = 8;
  *(_QWORD *)(a1 + 40) = a6;
  *(_BYTE *)(a1 + 48) = 66;
  *(_BYTE *)(a1 + 49) = 8;
  *(_QWORD *)(a1 + 50) = a7;
  *(_BYTE *)(a1 + 58) = 66;
  *(_BYTE *)(a1 + 59) = 8;
  *(_QWORD *)(a1 + 60) = a8;
  *(_BYTE *)(a1 + 68) = 0;
  *(_BYTE *)(a1 + 69) = 8;
  *(_QWORD *)(a1 + 70) = a9;
  *(_BYTE *)(a1 + 78) = 66;
  *(_BYTE *)(a1 + 79) = 8;
  *(_QWORD *)(a1 + 80) = a10;
  *(_BYTE *)(a1 + 88) = 0;
  *(_BYTE *)(a1 + 89) = 8;
  *(_QWORD *)(a1 + 90) = a11;
  *(_BYTE *)(a1 + 98) = 66;
  *(_BYTE *)(a1 + 99) = 8;
  *(_QWORD *)(a1 + 100) = a12;
  *(_BYTE *)(a1 + 108) = 0;
  *(_BYTE *)(a1 + 109) = 8;
  *(_QWORD *)(a1 + 110) = a13;
  *(_BYTE *)(a1 + 118) = 66;
  *(_BYTE *)(a1 + 119) = 8;
  *(_QWORD *)(a1 + 120) = a14;
  *(_BYTE *)(a1 + 128) = 0;
  *(_BYTE *)(a1 + 129) = 8;
  *(_QWORD *)(a1 + 130) = a15;
  *(_BYTE *)(a1 + 138) = 66;
  *(_BYTE *)(a1 + 139) = 8;
  *(_QWORD *)(a1 + 140) = a16;
  *(_BYTE *)(a1 + 148) = 66;
  *(_BYTE *)(a1 + 149) = 8;
  *(_QWORD *)(a1 + 150) = a17;
  *(_BYTE *)(a1 + 158) = 0;
  *(_BYTE *)(a1 + 159) = 4;
  *(_DWORD *)(a1 + 160) = a18;
  *(_BYTE *)(a1 + 164) = 66;
  *(_BYTE *)(a1 + 165) = 8;
  *(_QWORD *)(a1 + 166) = a19;
  *(_BYTE *)(a1 + 174) = 0;
  *(_BYTE *)(a1 + 175) = 4;
  *(_DWORD *)(a1 + 176) = a20;
  return result;
}

uint64_t __os_log_helper_16_2_21_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_66_4_0_8_66_4_0_8_66_8_66(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, int a18, uint64_t a19, int a20,uint64_t a21,uint64_t a22)
{
  uint64_t result;

  result = a12;
  *(_BYTE *)a1 = 2;
  *(_BYTE *)(a1 + 1) = 21;
  *(_BYTE *)(a1 + 2) = 32;
  *(_BYTE *)(a1 + 3) = 8;
  *(_QWORD *)(a1 + 4) = a2;
  *(_BYTE *)(a1 + 12) = 66;
  *(_BYTE *)(a1 + 13) = 8;
  *(_QWORD *)(a1 + 14) = a3;
  *(_BYTE *)(a1 + 22) = 0;
  *(_BYTE *)(a1 + 23) = 4;
  *(_DWORD *)(a1 + 24) = a4;
  *(_BYTE *)(a1 + 28) = 66;
  *(_BYTE *)(a1 + 29) = 8;
  *(_QWORD *)(a1 + 30) = a5;
  *(_BYTE *)(a1 + 38) = 0;
  *(_BYTE *)(a1 + 39) = 8;
  *(_QWORD *)(a1 + 40) = a6;
  *(_BYTE *)(a1 + 48) = 66;
  *(_BYTE *)(a1 + 49) = 8;
  *(_QWORD *)(a1 + 50) = a7;
  *(_BYTE *)(a1 + 58) = 66;
  *(_BYTE *)(a1 + 59) = 8;
  *(_QWORD *)(a1 + 60) = a8;
  *(_BYTE *)(a1 + 68) = 0;
  *(_BYTE *)(a1 + 69) = 8;
  *(_QWORD *)(a1 + 70) = a9;
  *(_BYTE *)(a1 + 78) = 66;
  *(_BYTE *)(a1 + 79) = 8;
  *(_QWORD *)(a1 + 80) = a10;
  *(_BYTE *)(a1 + 88) = 0;
  *(_BYTE *)(a1 + 89) = 8;
  *(_QWORD *)(a1 + 90) = a11;
  *(_BYTE *)(a1 + 98) = 66;
  *(_BYTE *)(a1 + 99) = 8;
  *(_QWORD *)(a1 + 100) = a12;
  *(_BYTE *)(a1 + 108) = 0;
  *(_BYTE *)(a1 + 109) = 8;
  *(_QWORD *)(a1 + 110) = a13;
  *(_BYTE *)(a1 + 118) = 66;
  *(_BYTE *)(a1 + 119) = 8;
  *(_QWORD *)(a1 + 120) = a14;
  *(_BYTE *)(a1 + 128) = 0;
  *(_BYTE *)(a1 + 129) = 8;
  *(_QWORD *)(a1 + 130) = a15;
  *(_BYTE *)(a1 + 138) = 66;
  *(_BYTE *)(a1 + 139) = 8;
  *(_QWORD *)(a1 + 140) = a16;
  *(_BYTE *)(a1 + 148) = 66;
  *(_BYTE *)(a1 + 149) = 8;
  *(_QWORD *)(a1 + 150) = a17;
  *(_BYTE *)(a1 + 158) = 0;
  *(_BYTE *)(a1 + 159) = 4;
  *(_DWORD *)(a1 + 160) = a18;
  *(_BYTE *)(a1 + 164) = 66;
  *(_BYTE *)(a1 + 165) = 8;
  *(_QWORD *)(a1 + 166) = a19;
  *(_BYTE *)(a1 + 174) = 0;
  *(_BYTE *)(a1 + 175) = 4;
  *(_DWORD *)(a1 + 176) = a20;
  *(_BYTE *)(a1 + 180) = 66;
  *(_BYTE *)(a1 + 181) = 8;
  *(_QWORD *)(a1 + 182) = a21;
  *(_BYTE *)(a1 + 190) = 66;
  *(_BYTE *)(a1 + 191) = 8;
  *(_QWORD *)(a1 + 192) = a22;
  return result;
}

uint64_t __os_log_helper_16_2_19_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_66_4_0_8_66_8_66(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, int a18, uint64_t a19, uint64_t a20)
{
  uint64_t result;

  result = a10;
  *(_BYTE *)a1 = 2;
  *(_BYTE *)(a1 + 1) = 19;
  *(_BYTE *)(a1 + 2) = 32;
  *(_BYTE *)(a1 + 3) = 8;
  *(_QWORD *)(a1 + 4) = a2;
  *(_BYTE *)(a1 + 12) = 66;
  *(_BYTE *)(a1 + 13) = 8;
  *(_QWORD *)(a1 + 14) = a3;
  *(_BYTE *)(a1 + 22) = 0;
  *(_BYTE *)(a1 + 23) = 4;
  *(_DWORD *)(a1 + 24) = a4;
  *(_BYTE *)(a1 + 28) = 66;
  *(_BYTE *)(a1 + 29) = 8;
  *(_QWORD *)(a1 + 30) = a5;
  *(_BYTE *)(a1 + 38) = 0;
  *(_BYTE *)(a1 + 39) = 8;
  *(_QWORD *)(a1 + 40) = a6;
  *(_BYTE *)(a1 + 48) = 66;
  *(_BYTE *)(a1 + 49) = 8;
  *(_QWORD *)(a1 + 50) = a7;
  *(_BYTE *)(a1 + 58) = 66;
  *(_BYTE *)(a1 + 59) = 8;
  *(_QWORD *)(a1 + 60) = a8;
  *(_BYTE *)(a1 + 68) = 0;
  *(_BYTE *)(a1 + 69) = 8;
  *(_QWORD *)(a1 + 70) = a9;
  *(_BYTE *)(a1 + 78) = 66;
  *(_BYTE *)(a1 + 79) = 8;
  *(_QWORD *)(a1 + 80) = a10;
  *(_BYTE *)(a1 + 88) = 0;
  *(_BYTE *)(a1 + 89) = 8;
  *(_QWORD *)(a1 + 90) = a11;
  *(_BYTE *)(a1 + 98) = 66;
  *(_BYTE *)(a1 + 99) = 8;
  *(_QWORD *)(a1 + 100) = a12;
  *(_BYTE *)(a1 + 108) = 0;
  *(_BYTE *)(a1 + 109) = 8;
  *(_QWORD *)(a1 + 110) = a13;
  *(_BYTE *)(a1 + 118) = 66;
  *(_BYTE *)(a1 + 119) = 8;
  *(_QWORD *)(a1 + 120) = a14;
  *(_BYTE *)(a1 + 128) = 0;
  *(_BYTE *)(a1 + 129) = 8;
  *(_QWORD *)(a1 + 130) = a15;
  *(_BYTE *)(a1 + 138) = 66;
  *(_BYTE *)(a1 + 139) = 8;
  *(_QWORD *)(a1 + 140) = a16;
  *(_BYTE *)(a1 + 148) = 66;
  *(_BYTE *)(a1 + 149) = 8;
  *(_QWORD *)(a1 + 150) = a17;
  *(_BYTE *)(a1 + 158) = 0;
  *(_BYTE *)(a1 + 159) = 4;
  *(_DWORD *)(a1 + 160) = a18;
  *(_BYTE *)(a1 + 164) = 66;
  *(_BYTE *)(a1 + 165) = 8;
  *(_QWORD *)(a1 + 166) = a19;
  *(_BYTE *)(a1 + 174) = 66;
  *(_BYTE *)(a1 + 175) = 8;
  *(_QWORD *)(a1 + 176) = a20;
  return result;
}

uint64_t __os_log_helper_16_2_16_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_66(uint64_t result, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 16;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 4;
  *(_DWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 28) = 66;
  *(_BYTE *)(result + 29) = 8;
  *(_QWORD *)(result + 30) = a5;
  *(_BYTE *)(result + 38) = 0;
  *(_BYTE *)(result + 39) = 8;
  *(_QWORD *)(result + 40) = a6;
  *(_BYTE *)(result + 48) = 66;
  *(_BYTE *)(result + 49) = 8;
  *(_QWORD *)(result + 50) = a7;
  *(_BYTE *)(result + 58) = 66;
  *(_BYTE *)(result + 59) = 8;
  *(_QWORD *)(result + 60) = a8;
  *(_BYTE *)(result + 68) = 0;
  *(_BYTE *)(result + 69) = 8;
  *(_QWORD *)(result + 70) = a9;
  *(_BYTE *)(result + 78) = 66;
  *(_BYTE *)(result + 79) = 8;
  *(_QWORD *)(result + 80) = a10;
  *(_BYTE *)(result + 88) = 0;
  *(_BYTE *)(result + 89) = 8;
  *(_QWORD *)(result + 90) = a11;
  *(_BYTE *)(result + 98) = 66;
  *(_BYTE *)(result + 99) = 8;
  *(_QWORD *)(result + 100) = a12;
  *(_BYTE *)(result + 108) = 0;
  *(_BYTE *)(result + 109) = 8;
  *(_QWORD *)(result + 110) = a13;
  *(_BYTE *)(result + 118) = 66;
  *(_BYTE *)(result + 119) = 8;
  *(_QWORD *)(result + 120) = a14;
  *(_BYTE *)(result + 128) = 0;
  *(_BYTE *)(result + 129) = 8;
  *(_QWORD *)(result + 130) = a15;
  *(_BYTE *)(result + 138) = 66;
  *(_BYTE *)(result + 139) = 8;
  *(_QWORD *)(result + 140) = a16;
  *(_BYTE *)(result + 148) = 66;
  *(_BYTE *)(result + 149) = 8;
  *(_QWORD *)(result + 150) = a17;
  return result;
}

uint64_t __os_log_helper_16_2_17_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_4_0_8_66(uint64_t result, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, uint64_t a18)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 17;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 4;
  *(_DWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 28) = 66;
  *(_BYTE *)(result + 29) = 8;
  *(_QWORD *)(result + 30) = a5;
  *(_BYTE *)(result + 38) = 0;
  *(_BYTE *)(result + 39) = 8;
  *(_QWORD *)(result + 40) = a6;
  *(_BYTE *)(result + 48) = 66;
  *(_BYTE *)(result + 49) = 8;
  *(_QWORD *)(result + 50) = a7;
  *(_BYTE *)(result + 58) = 66;
  *(_BYTE *)(result + 59) = 8;
  *(_QWORD *)(result + 60) = a8;
  *(_BYTE *)(result + 68) = 0;
  *(_BYTE *)(result + 69) = 8;
  *(_QWORD *)(result + 70) = a9;
  *(_BYTE *)(result + 78) = 66;
  *(_BYTE *)(result + 79) = 8;
  *(_QWORD *)(result + 80) = a10;
  *(_BYTE *)(result + 88) = 0;
  *(_BYTE *)(result + 89) = 8;
  *(_QWORD *)(result + 90) = a11;
  *(_BYTE *)(result + 98) = 66;
  *(_BYTE *)(result + 99) = 8;
  *(_QWORD *)(result + 100) = a12;
  *(_BYTE *)(result + 108) = 0;
  *(_BYTE *)(result + 109) = 8;
  *(_QWORD *)(result + 110) = a13;
  *(_BYTE *)(result + 118) = 66;
  *(_BYTE *)(result + 119) = 8;
  *(_QWORD *)(result + 120) = a14;
  *(_BYTE *)(result + 128) = 0;
  *(_BYTE *)(result + 129) = 8;
  *(_QWORD *)(result + 130) = a15;
  *(_BYTE *)(result + 138) = 66;
  *(_BYTE *)(result + 139) = 8;
  *(_QWORD *)(result + 140) = a16;
  *(_BYTE *)(result + 148) = 0;
  *(_BYTE *)(result + 149) = 4;
  *(_DWORD *)(result + 150) = a17;
  *(_BYTE *)(result + 154) = 66;
  *(_BYTE *)(result + 155) = 8;
  *(_QWORD *)(result + 156) = a18;
  return result;
}

uint64_t __os_log_helper_16_2_15_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66(uint64_t result, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 15;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 4;
  *(_DWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 28) = 66;
  *(_BYTE *)(result + 29) = 8;
  *(_QWORD *)(result + 30) = a5;
  *(_BYTE *)(result + 38) = 0;
  *(_BYTE *)(result + 39) = 8;
  *(_QWORD *)(result + 40) = a6;
  *(_BYTE *)(result + 48) = 66;
  *(_BYTE *)(result + 49) = 8;
  *(_QWORD *)(result + 50) = a7;
  *(_BYTE *)(result + 58) = 66;
  *(_BYTE *)(result + 59) = 8;
  *(_QWORD *)(result + 60) = a8;
  *(_BYTE *)(result + 68) = 0;
  *(_BYTE *)(result + 69) = 8;
  *(_QWORD *)(result + 70) = a9;
  *(_BYTE *)(result + 78) = 66;
  *(_BYTE *)(result + 79) = 8;
  *(_QWORD *)(result + 80) = a10;
  *(_BYTE *)(result + 88) = 0;
  *(_BYTE *)(result + 89) = 8;
  *(_QWORD *)(result + 90) = a11;
  *(_BYTE *)(result + 98) = 66;
  *(_BYTE *)(result + 99) = 8;
  *(_QWORD *)(result + 100) = a12;
  *(_BYTE *)(result + 108) = 0;
  *(_BYTE *)(result + 109) = 8;
  *(_QWORD *)(result + 110) = a13;
  *(_BYTE *)(result + 118) = 66;
  *(_BYTE *)(result + 119) = 8;
  *(_QWORD *)(result + 120) = a14;
  *(_BYTE *)(result + 128) = 0;
  *(_BYTE *)(result + 129) = 8;
  *(_QWORD *)(result + 130) = a15;
  *(_BYTE *)(result + 138) = 66;
  *(_BYTE *)(result + 139) = 8;
  *(_QWORD *)(result + 140) = a16;
  return result;
}

uint64_t __os_log_helper_16_2_18_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_0_8_66(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  uint64_t result;

  result = a9;
  *(_BYTE *)a1 = 2;
  *(_BYTE *)(a1 + 1) = 18;
  *(_BYTE *)(a1 + 2) = 32;
  *(_BYTE *)(a1 + 3) = 8;
  *(_QWORD *)(a1 + 4) = a2;
  *(_BYTE *)(a1 + 12) = 66;
  *(_BYTE *)(a1 + 13) = 8;
  *(_QWORD *)(a1 + 14) = a3;
  *(_BYTE *)(a1 + 22) = 0;
  *(_BYTE *)(a1 + 23) = 4;
  *(_DWORD *)(a1 + 24) = a4;
  *(_BYTE *)(a1 + 28) = 66;
  *(_BYTE *)(a1 + 29) = 8;
  *(_QWORD *)(a1 + 30) = a5;
  *(_BYTE *)(a1 + 38) = 0;
  *(_BYTE *)(a1 + 39) = 8;
  *(_QWORD *)(a1 + 40) = a6;
  *(_BYTE *)(a1 + 48) = 66;
  *(_BYTE *)(a1 + 49) = 8;
  *(_QWORD *)(a1 + 50) = a7;
  *(_BYTE *)(a1 + 58) = 66;
  *(_BYTE *)(a1 + 59) = 8;
  *(_QWORD *)(a1 + 60) = a8;
  *(_BYTE *)(a1 + 68) = 0;
  *(_BYTE *)(a1 + 69) = 8;
  *(_QWORD *)(a1 + 70) = a9;
  *(_BYTE *)(a1 + 78) = 66;
  *(_BYTE *)(a1 + 79) = 8;
  *(_QWORD *)(a1 + 80) = a10;
  *(_BYTE *)(a1 + 88) = 0;
  *(_BYTE *)(a1 + 89) = 8;
  *(_QWORD *)(a1 + 90) = a11;
  *(_BYTE *)(a1 + 98) = 66;
  *(_BYTE *)(a1 + 99) = 8;
  *(_QWORD *)(a1 + 100) = a12;
  *(_BYTE *)(a1 + 108) = 0;
  *(_BYTE *)(a1 + 109) = 8;
  *(_QWORD *)(a1 + 110) = a13;
  *(_BYTE *)(a1 + 118) = 66;
  *(_BYTE *)(a1 + 119) = 8;
  *(_QWORD *)(a1 + 120) = a14;
  *(_BYTE *)(a1 + 128) = 0;
  *(_BYTE *)(a1 + 129) = 8;
  *(_QWORD *)(a1 + 130) = a15;
  *(_BYTE *)(a1 + 138) = 66;
  *(_BYTE *)(a1 + 139) = 8;
  *(_QWORD *)(a1 + 140) = a16;
  *(_BYTE *)(a1 + 148) = 0;
  *(_BYTE *)(a1 + 149) = 8;
  *(_QWORD *)(a1 + 150) = a17;
  *(_BYTE *)(a1 + 158) = 0;
  *(_BYTE *)(a1 + 159) = 8;
  *(_QWORD *)(a1 + 160) = a18;
  *(_BYTE *)(a1 + 168) = 66;
  *(_BYTE *)(a1 + 169) = 8;
  *(_QWORD *)(a1 + 170) = a19;
  return result;
}

uint64_t __os_log_helper_16_2_19_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_4_0_8_66_4_0_8_66(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, uint64_t a18, int a19, uint64_t a20)
{
  uint64_t result;

  result = a10;
  *(_BYTE *)a1 = 2;
  *(_BYTE *)(a1 + 1) = 19;
  *(_BYTE *)(a1 + 2) = 32;
  *(_BYTE *)(a1 + 3) = 8;
  *(_QWORD *)(a1 + 4) = a2;
  *(_BYTE *)(a1 + 12) = 66;
  *(_BYTE *)(a1 + 13) = 8;
  *(_QWORD *)(a1 + 14) = a3;
  *(_BYTE *)(a1 + 22) = 0;
  *(_BYTE *)(a1 + 23) = 4;
  *(_DWORD *)(a1 + 24) = a4;
  *(_BYTE *)(a1 + 28) = 66;
  *(_BYTE *)(a1 + 29) = 8;
  *(_QWORD *)(a1 + 30) = a5;
  *(_BYTE *)(a1 + 38) = 0;
  *(_BYTE *)(a1 + 39) = 8;
  *(_QWORD *)(a1 + 40) = a6;
  *(_BYTE *)(a1 + 48) = 66;
  *(_BYTE *)(a1 + 49) = 8;
  *(_QWORD *)(a1 + 50) = a7;
  *(_BYTE *)(a1 + 58) = 66;
  *(_BYTE *)(a1 + 59) = 8;
  *(_QWORD *)(a1 + 60) = a8;
  *(_BYTE *)(a1 + 68) = 0;
  *(_BYTE *)(a1 + 69) = 8;
  *(_QWORD *)(a1 + 70) = a9;
  *(_BYTE *)(a1 + 78) = 66;
  *(_BYTE *)(a1 + 79) = 8;
  *(_QWORD *)(a1 + 80) = a10;
  *(_BYTE *)(a1 + 88) = 0;
  *(_BYTE *)(a1 + 89) = 8;
  *(_QWORD *)(a1 + 90) = a11;
  *(_BYTE *)(a1 + 98) = 66;
  *(_BYTE *)(a1 + 99) = 8;
  *(_QWORD *)(a1 + 100) = a12;
  *(_BYTE *)(a1 + 108) = 0;
  *(_BYTE *)(a1 + 109) = 8;
  *(_QWORD *)(a1 + 110) = a13;
  *(_BYTE *)(a1 + 118) = 66;
  *(_BYTE *)(a1 + 119) = 8;
  *(_QWORD *)(a1 + 120) = a14;
  *(_BYTE *)(a1 + 128) = 0;
  *(_BYTE *)(a1 + 129) = 8;
  *(_QWORD *)(a1 + 130) = a15;
  *(_BYTE *)(a1 + 138) = 66;
  *(_BYTE *)(a1 + 139) = 8;
  *(_QWORD *)(a1 + 140) = a16;
  *(_BYTE *)(a1 + 148) = 0;
  *(_BYTE *)(a1 + 149) = 4;
  *(_DWORD *)(a1 + 150) = a17;
  *(_BYTE *)(a1 + 154) = 66;
  *(_BYTE *)(a1 + 155) = 8;
  *(_QWORD *)(a1 + 156) = a18;
  *(_BYTE *)(a1 + 164) = 0;
  *(_BYTE *)(a1 + 165) = 4;
  *(_DWORD *)(a1 + 166) = a19;
  *(_BYTE *)(a1 + 170) = 66;
  *(_BYTE *)(a1 + 171) = 8;
  *(_QWORD *)(a1 + 172) = a20;
  return result;
}

uint64_t __os_log_helper_16_2_17_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_4_0_4_0(uint64_t result, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, int a18)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 17;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 4;
  *(_DWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 28) = 66;
  *(_BYTE *)(result + 29) = 8;
  *(_QWORD *)(result + 30) = a5;
  *(_BYTE *)(result + 38) = 0;
  *(_BYTE *)(result + 39) = 8;
  *(_QWORD *)(result + 40) = a6;
  *(_BYTE *)(result + 48) = 66;
  *(_BYTE *)(result + 49) = 8;
  *(_QWORD *)(result + 50) = a7;
  *(_BYTE *)(result + 58) = 66;
  *(_BYTE *)(result + 59) = 8;
  *(_QWORD *)(result + 60) = a8;
  *(_BYTE *)(result + 68) = 0;
  *(_BYTE *)(result + 69) = 8;
  *(_QWORD *)(result + 70) = a9;
  *(_BYTE *)(result + 78) = 66;
  *(_BYTE *)(result + 79) = 8;
  *(_QWORD *)(result + 80) = a10;
  *(_BYTE *)(result + 88) = 0;
  *(_BYTE *)(result + 89) = 8;
  *(_QWORD *)(result + 90) = a11;
  *(_BYTE *)(result + 98) = 66;
  *(_BYTE *)(result + 99) = 8;
  *(_QWORD *)(result + 100) = a12;
  *(_BYTE *)(result + 108) = 0;
  *(_BYTE *)(result + 109) = 8;
  *(_QWORD *)(result + 110) = a13;
  *(_BYTE *)(result + 118) = 66;
  *(_BYTE *)(result + 119) = 8;
  *(_QWORD *)(result + 120) = a14;
  *(_BYTE *)(result + 128) = 0;
  *(_BYTE *)(result + 129) = 8;
  *(_QWORD *)(result + 130) = a15;
  *(_BYTE *)(result + 138) = 66;
  *(_BYTE *)(result + 139) = 8;
  *(_QWORD *)(result + 140) = a16;
  *(_BYTE *)(result + 148) = 0;
  *(_BYTE *)(result + 149) = 4;
  *(_DWORD *)(result + 150) = a17;
  *(_BYTE *)(result + 154) = 0;
  *(_BYTE *)(result + 155) = 4;
  *(_DWORD *)(result + 156) = a18;
  return result;
}

uint64_t __os_log_helper_16_2_17_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_0(uint64_t result, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 17;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 4;
  *(_DWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 28) = 66;
  *(_BYTE *)(result + 29) = 8;
  *(_QWORD *)(result + 30) = a5;
  *(_BYTE *)(result + 38) = 0;
  *(_BYTE *)(result + 39) = 8;
  *(_QWORD *)(result + 40) = a6;
  *(_BYTE *)(result + 48) = 66;
  *(_BYTE *)(result + 49) = 8;
  *(_QWORD *)(result + 50) = a7;
  *(_BYTE *)(result + 58) = 66;
  *(_BYTE *)(result + 59) = 8;
  *(_QWORD *)(result + 60) = a8;
  *(_BYTE *)(result + 68) = 0;
  *(_BYTE *)(result + 69) = 8;
  *(_QWORD *)(result + 70) = a9;
  *(_BYTE *)(result + 78) = 66;
  *(_BYTE *)(result + 79) = 8;
  *(_QWORD *)(result + 80) = a10;
  *(_BYTE *)(result + 88) = 0;
  *(_BYTE *)(result + 89) = 8;
  *(_QWORD *)(result + 90) = a11;
  *(_BYTE *)(result + 98) = 66;
  *(_BYTE *)(result + 99) = 8;
  *(_QWORD *)(result + 100) = a12;
  *(_BYTE *)(result + 108) = 0;
  *(_BYTE *)(result + 109) = 8;
  *(_QWORD *)(result + 110) = a13;
  *(_BYTE *)(result + 118) = 66;
  *(_BYTE *)(result + 119) = 8;
  *(_QWORD *)(result + 120) = a14;
  *(_BYTE *)(result + 128) = 0;
  *(_BYTE *)(result + 129) = 8;
  *(_QWORD *)(result + 130) = a15;
  *(_BYTE *)(result + 138) = 66;
  *(_BYTE *)(result + 139) = 8;
  *(_QWORD *)(result + 140) = a16;
  *(_BYTE *)(result + 148) = 0;
  *(_BYTE *)(result + 149) = 8;
  *(_QWORD *)(result + 150) = a17;
  *(_BYTE *)(result + 158) = 0;
  *(_BYTE *)(result + 159) = 8;
  *(_QWORD *)(result + 160) = a18;
  return result;
}

uint64_t __os_log_helper_16_2_19_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_64_4_0_8_66_4_0(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, int a18, uint64_t a19, int a20)
{
  uint64_t result;

  result = a11;
  *(_BYTE *)a1 = 2;
  *(_BYTE *)(a1 + 1) = 19;
  *(_BYTE *)(a1 + 2) = 32;
  *(_BYTE *)(a1 + 3) = 8;
  *(_QWORD *)(a1 + 4) = a2;
  *(_BYTE *)(a1 + 12) = 66;
  *(_BYTE *)(a1 + 13) = 8;
  *(_QWORD *)(a1 + 14) = a3;
  *(_BYTE *)(a1 + 22) = 0;
  *(_BYTE *)(a1 + 23) = 4;
  *(_DWORD *)(a1 + 24) = a4;
  *(_BYTE *)(a1 + 28) = 66;
  *(_BYTE *)(a1 + 29) = 8;
  *(_QWORD *)(a1 + 30) = a5;
  *(_BYTE *)(a1 + 38) = 0;
  *(_BYTE *)(a1 + 39) = 8;
  *(_QWORD *)(a1 + 40) = a6;
  *(_BYTE *)(a1 + 48) = 66;
  *(_BYTE *)(a1 + 49) = 8;
  *(_QWORD *)(a1 + 50) = a7;
  *(_BYTE *)(a1 + 58) = 66;
  *(_BYTE *)(a1 + 59) = 8;
  *(_QWORD *)(a1 + 60) = a8;
  *(_BYTE *)(a1 + 68) = 0;
  *(_BYTE *)(a1 + 69) = 8;
  *(_QWORD *)(a1 + 70) = a9;
  *(_BYTE *)(a1 + 78) = 66;
  *(_BYTE *)(a1 + 79) = 8;
  *(_QWORD *)(a1 + 80) = a10;
  *(_BYTE *)(a1 + 88) = 0;
  *(_BYTE *)(a1 + 89) = 8;
  *(_QWORD *)(a1 + 90) = a11;
  *(_BYTE *)(a1 + 98) = 66;
  *(_BYTE *)(a1 + 99) = 8;
  *(_QWORD *)(a1 + 100) = a12;
  *(_BYTE *)(a1 + 108) = 0;
  *(_BYTE *)(a1 + 109) = 8;
  *(_QWORD *)(a1 + 110) = a13;
  *(_BYTE *)(a1 + 118) = 66;
  *(_BYTE *)(a1 + 119) = 8;
  *(_QWORD *)(a1 + 120) = a14;
  *(_BYTE *)(a1 + 128) = 0;
  *(_BYTE *)(a1 + 129) = 8;
  *(_QWORD *)(a1 + 130) = a15;
  *(_BYTE *)(a1 + 138) = 66;
  *(_BYTE *)(a1 + 139) = 8;
  *(_QWORD *)(a1 + 140) = a16;
  *(_BYTE *)(a1 + 148) = 64;
  *(_BYTE *)(a1 + 149) = 8;
  *(_QWORD *)(a1 + 150) = a17;
  *(_BYTE *)(a1 + 158) = 0;
  *(_BYTE *)(a1 + 159) = 4;
  *(_DWORD *)(a1 + 160) = a18;
  *(_BYTE *)(a1 + 164) = 66;
  *(_BYTE *)(a1 + 165) = 8;
  *(_QWORD *)(a1 + 166) = a19;
  *(_BYTE *)(a1 + 174) = 0;
  *(_BYTE *)(a1 + 175) = 4;
  *(_DWORD *)(a1 + 176) = a20;
  return result;
}

void sub_21BFC8630()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

void sub_21BFC9170(unint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, _Unwind_Exception *exception_object, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id *location)
{
  STACK[0x248] = a1;
  LODWORD(STACK[0x244]) = a2;
  objc_destroyWeak(location);
  objc_destroyWeak((id *)&STACK[0x298]);
  _Unwind_Resume((_Unwind_Exception *)STACK[0x248]);
}

uint64_t __os_log_helper_16_2_17_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_66_4_0(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, int a18)
{
  uint64_t result;

  result = a9;
  *(_BYTE *)a1 = 2;
  *(_BYTE *)(a1 + 1) = 17;
  *(_BYTE *)(a1 + 2) = 32;
  *(_BYTE *)(a1 + 3) = 8;
  *(_QWORD *)(a1 + 4) = a2;
  *(_BYTE *)(a1 + 12) = 66;
  *(_BYTE *)(a1 + 13) = 8;
  *(_QWORD *)(a1 + 14) = a3;
  *(_BYTE *)(a1 + 22) = 0;
  *(_BYTE *)(a1 + 23) = 4;
  *(_DWORD *)(a1 + 24) = a4;
  *(_BYTE *)(a1 + 28) = 66;
  *(_BYTE *)(a1 + 29) = 8;
  *(_QWORD *)(a1 + 30) = a5;
  *(_BYTE *)(a1 + 38) = 0;
  *(_BYTE *)(a1 + 39) = 8;
  *(_QWORD *)(a1 + 40) = a6;
  *(_BYTE *)(a1 + 48) = 66;
  *(_BYTE *)(a1 + 49) = 8;
  *(_QWORD *)(a1 + 50) = a7;
  *(_BYTE *)(a1 + 58) = 66;
  *(_BYTE *)(a1 + 59) = 8;
  *(_QWORD *)(a1 + 60) = a8;
  *(_BYTE *)(a1 + 68) = 0;
  *(_BYTE *)(a1 + 69) = 8;
  *(_QWORD *)(a1 + 70) = a9;
  *(_BYTE *)(a1 + 78) = 66;
  *(_BYTE *)(a1 + 79) = 8;
  *(_QWORD *)(a1 + 80) = a10;
  *(_BYTE *)(a1 + 88) = 0;
  *(_BYTE *)(a1 + 89) = 8;
  *(_QWORD *)(a1 + 90) = a11;
  *(_BYTE *)(a1 + 98) = 66;
  *(_BYTE *)(a1 + 99) = 8;
  *(_QWORD *)(a1 + 100) = a12;
  *(_BYTE *)(a1 + 108) = 0;
  *(_BYTE *)(a1 + 109) = 8;
  *(_QWORD *)(a1 + 110) = a13;
  *(_BYTE *)(a1 + 118) = 66;
  *(_BYTE *)(a1 + 119) = 8;
  *(_QWORD *)(a1 + 120) = a14;
  *(_BYTE *)(a1 + 128) = 0;
  *(_BYTE *)(a1 + 129) = 8;
  *(_QWORD *)(a1 + 130) = a15;
  *(_BYTE *)(a1 + 138) = 66;
  *(_BYTE *)(a1 + 139) = 8;
  *(_QWORD *)(a1 + 140) = a16;
  *(_BYTE *)(a1 + 148) = 66;
  *(_BYTE *)(a1 + 149) = 8;
  *(_QWORD *)(a1 + 150) = a17;
  *(_BYTE *)(a1 + 158) = 0;
  *(_BYTE *)(a1 + 159) = 4;
  *(_DWORD *)(a1 + 160) = a18;
  return result;
}

id getSUDownloadPolicyFactoryClass_0()
{
  id v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  int v11;
  int v12;
  uint64_t v13;

  v9 = 0;
  v10 = &v9;
  v11 = 1342177280;
  v12 = 32;
  v8 = getSUDownloadPolicyFactoryClass_softClass_0;
  v13 = getSUDownloadPolicyFactoryClass_softClass_0;
  if (!getSUDownloadPolicyFactoryClass_softClass_0)
  {
    v2 = MEMORY[0x24BDAC760];
    v3 = -1073741824;
    v4 = 0;
    v5 = __getSUDownloadPolicyFactoryClass_block_invoke_0;
    v6 = &unk_24DFF80D0;
    v7 = &v9;
    __getSUDownloadPolicyFactoryClass_block_invoke_0((uint64_t)&v2);
  }
  v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

void sub_21BFC9EC8(unint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, _Unwind_Exception *exception_object,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id *location)
{
  STACK[0x230] = a1;
  LODWORD(STACK[0x22C]) = a2;
  objc_destroyWeak(location);
  _Unwind_Resume((_Unwind_Exception *)STACK[0x230]);
}

id getSUErrorDomain_3()
{
  id *SUErrorDomainSymbolLoc_3;

  SUErrorDomainSymbolLoc_3 = (id *)getSUErrorDomainSymbolLoc_3();
  if (!SUErrorDomainSymbolLoc_3)
  {
    dlerror();
    abort_report_np();
  }
  return *SUErrorDomainSymbolLoc_3;
}

void sub_21BFCAAC8()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

uint64_t __os_log_helper_16_2_17_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_66_8_66(uint64_t result, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 17;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 4;
  *(_DWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 28) = 66;
  *(_BYTE *)(result + 29) = 8;
  *(_QWORD *)(result + 30) = a5;
  *(_BYTE *)(result + 38) = 0;
  *(_BYTE *)(result + 39) = 8;
  *(_QWORD *)(result + 40) = a6;
  *(_BYTE *)(result + 48) = 66;
  *(_BYTE *)(result + 49) = 8;
  *(_QWORD *)(result + 50) = a7;
  *(_BYTE *)(result + 58) = 66;
  *(_BYTE *)(result + 59) = 8;
  *(_QWORD *)(result + 60) = a8;
  *(_BYTE *)(result + 68) = 0;
  *(_BYTE *)(result + 69) = 8;
  *(_QWORD *)(result + 70) = a9;
  *(_BYTE *)(result + 78) = 66;
  *(_BYTE *)(result + 79) = 8;
  *(_QWORD *)(result + 80) = a10;
  *(_BYTE *)(result + 88) = 0;
  *(_BYTE *)(result + 89) = 8;
  *(_QWORD *)(result + 90) = a11;
  *(_BYTE *)(result + 98) = 66;
  *(_BYTE *)(result + 99) = 8;
  *(_QWORD *)(result + 100) = a12;
  *(_BYTE *)(result + 108) = 0;
  *(_BYTE *)(result + 109) = 8;
  *(_QWORD *)(result + 110) = a13;
  *(_BYTE *)(result + 118) = 66;
  *(_BYTE *)(result + 119) = 8;
  *(_QWORD *)(result + 120) = a14;
  *(_BYTE *)(result + 128) = 0;
  *(_BYTE *)(result + 129) = 8;
  *(_QWORD *)(result + 130) = a15;
  *(_BYTE *)(result + 138) = 66;
  *(_BYTE *)(result + 139) = 8;
  *(_QWORD *)(result + 140) = a16;
  *(_BYTE *)(result + 148) = 66;
  *(_BYTE *)(result + 149) = 8;
  *(_QWORD *)(result + 150) = a17;
  *(_BYTE *)(result + 158) = 66;
  *(_BYTE *)(result + 159) = 8;
  *(_QWORD *)(result + 160) = a18;
  return result;
}

uint64_t __os_log_helper_16_2_17_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_64_8_64(uint64_t result, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 17;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 4;
  *(_DWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 28) = 66;
  *(_BYTE *)(result + 29) = 8;
  *(_QWORD *)(result + 30) = a5;
  *(_BYTE *)(result + 38) = 0;
  *(_BYTE *)(result + 39) = 8;
  *(_QWORD *)(result + 40) = a6;
  *(_BYTE *)(result + 48) = 66;
  *(_BYTE *)(result + 49) = 8;
  *(_QWORD *)(result + 50) = a7;
  *(_BYTE *)(result + 58) = 66;
  *(_BYTE *)(result + 59) = 8;
  *(_QWORD *)(result + 60) = a8;
  *(_BYTE *)(result + 68) = 0;
  *(_BYTE *)(result + 69) = 8;
  *(_QWORD *)(result + 70) = a9;
  *(_BYTE *)(result + 78) = 66;
  *(_BYTE *)(result + 79) = 8;
  *(_QWORD *)(result + 80) = a10;
  *(_BYTE *)(result + 88) = 0;
  *(_BYTE *)(result + 89) = 8;
  *(_QWORD *)(result + 90) = a11;
  *(_BYTE *)(result + 98) = 66;
  *(_BYTE *)(result + 99) = 8;
  *(_QWORD *)(result + 100) = a12;
  *(_BYTE *)(result + 108) = 0;
  *(_BYTE *)(result + 109) = 8;
  *(_QWORD *)(result + 110) = a13;
  *(_BYTE *)(result + 118) = 66;
  *(_BYTE *)(result + 119) = 8;
  *(_QWORD *)(result + 120) = a14;
  *(_BYTE *)(result + 128) = 0;
  *(_BYTE *)(result + 129) = 8;
  *(_QWORD *)(result + 130) = a15;
  *(_BYTE *)(result + 138) = 66;
  *(_BYTE *)(result + 139) = 8;
  *(_QWORD *)(result + 140) = a16;
  *(_BYTE *)(result + 148) = 64;
  *(_BYTE *)(result + 149) = 8;
  *(_QWORD *)(result + 150) = a17;
  *(_BYTE *)(result + 158) = 64;
  *(_BYTE *)(result + 159) = 8;
  *(_QWORD *)(result + 160) = a18;
  return result;
}

uint64_t __os_log_helper_16_2_19_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_66(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t result;

  result = a10;
  *(_BYTE *)a1 = 2;
  *(_BYTE *)(a1 + 1) = 19;
  *(_BYTE *)(a1 + 2) = 32;
  *(_BYTE *)(a1 + 3) = 8;
  *(_QWORD *)(a1 + 4) = a2;
  *(_BYTE *)(a1 + 12) = 66;
  *(_BYTE *)(a1 + 13) = 8;
  *(_QWORD *)(a1 + 14) = a3;
  *(_BYTE *)(a1 + 22) = 0;
  *(_BYTE *)(a1 + 23) = 4;
  *(_DWORD *)(a1 + 24) = a4;
  *(_BYTE *)(a1 + 28) = 66;
  *(_BYTE *)(a1 + 29) = 8;
  *(_QWORD *)(a1 + 30) = a5;
  *(_BYTE *)(a1 + 38) = 0;
  *(_BYTE *)(a1 + 39) = 8;
  *(_QWORD *)(a1 + 40) = a6;
  *(_BYTE *)(a1 + 48) = 66;
  *(_BYTE *)(a1 + 49) = 8;
  *(_QWORD *)(a1 + 50) = a7;
  *(_BYTE *)(a1 + 58) = 66;
  *(_BYTE *)(a1 + 59) = 8;
  *(_QWORD *)(a1 + 60) = a8;
  *(_BYTE *)(a1 + 68) = 0;
  *(_BYTE *)(a1 + 69) = 8;
  *(_QWORD *)(a1 + 70) = a9;
  *(_BYTE *)(a1 + 78) = 66;
  *(_BYTE *)(a1 + 79) = 8;
  *(_QWORD *)(a1 + 80) = a10;
  *(_BYTE *)(a1 + 88) = 0;
  *(_BYTE *)(a1 + 89) = 8;
  *(_QWORD *)(a1 + 90) = a11;
  *(_BYTE *)(a1 + 98) = 66;
  *(_BYTE *)(a1 + 99) = 8;
  *(_QWORD *)(a1 + 100) = a12;
  *(_BYTE *)(a1 + 108) = 0;
  *(_BYTE *)(a1 + 109) = 8;
  *(_QWORD *)(a1 + 110) = a13;
  *(_BYTE *)(a1 + 118) = 66;
  *(_BYTE *)(a1 + 119) = 8;
  *(_QWORD *)(a1 + 120) = a14;
  *(_BYTE *)(a1 + 128) = 0;
  *(_BYTE *)(a1 + 129) = 8;
  *(_QWORD *)(a1 + 130) = a15;
  *(_BYTE *)(a1 + 138) = 66;
  *(_BYTE *)(a1 + 139) = 8;
  *(_QWORD *)(a1 + 140) = a16;
  *(_BYTE *)(a1 + 148) = 66;
  *(_BYTE *)(a1 + 149) = 8;
  *(_QWORD *)(a1 + 150) = a17;
  *(_BYTE *)(a1 + 158) = 66;
  *(_BYTE *)(a1 + 159) = 8;
  *(_QWORD *)(a1 + 160) = a18;
  *(_BYTE *)(a1 + 168) = 66;
  *(_BYTE *)(a1 + 169) = 8;
  *(_QWORD *)(a1 + 170) = a19;
  *(_BYTE *)(a1 + 178) = 66;
  *(_BYTE *)(a1 + 179) = 8;
  *(_QWORD *)(a1 + 180) = a20;
  return result;
}

uint64_t __os_log_helper_16_2_19_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_64_8_0_8_64_8_0(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t result;

  result = a10;
  *(_BYTE *)a1 = 2;
  *(_BYTE *)(a1 + 1) = 19;
  *(_BYTE *)(a1 + 2) = 32;
  *(_BYTE *)(a1 + 3) = 8;
  *(_QWORD *)(a1 + 4) = a2;
  *(_BYTE *)(a1 + 12) = 66;
  *(_BYTE *)(a1 + 13) = 8;
  *(_QWORD *)(a1 + 14) = a3;
  *(_BYTE *)(a1 + 22) = 0;
  *(_BYTE *)(a1 + 23) = 4;
  *(_DWORD *)(a1 + 24) = a4;
  *(_BYTE *)(a1 + 28) = 66;
  *(_BYTE *)(a1 + 29) = 8;
  *(_QWORD *)(a1 + 30) = a5;
  *(_BYTE *)(a1 + 38) = 0;
  *(_BYTE *)(a1 + 39) = 8;
  *(_QWORD *)(a1 + 40) = a6;
  *(_BYTE *)(a1 + 48) = 66;
  *(_BYTE *)(a1 + 49) = 8;
  *(_QWORD *)(a1 + 50) = a7;
  *(_BYTE *)(a1 + 58) = 66;
  *(_BYTE *)(a1 + 59) = 8;
  *(_QWORD *)(a1 + 60) = a8;
  *(_BYTE *)(a1 + 68) = 0;
  *(_BYTE *)(a1 + 69) = 8;
  *(_QWORD *)(a1 + 70) = a9;
  *(_BYTE *)(a1 + 78) = 66;
  *(_BYTE *)(a1 + 79) = 8;
  *(_QWORD *)(a1 + 80) = a10;
  *(_BYTE *)(a1 + 88) = 0;
  *(_BYTE *)(a1 + 89) = 8;
  *(_QWORD *)(a1 + 90) = a11;
  *(_BYTE *)(a1 + 98) = 66;
  *(_BYTE *)(a1 + 99) = 8;
  *(_QWORD *)(a1 + 100) = a12;
  *(_BYTE *)(a1 + 108) = 0;
  *(_BYTE *)(a1 + 109) = 8;
  *(_QWORD *)(a1 + 110) = a13;
  *(_BYTE *)(a1 + 118) = 66;
  *(_BYTE *)(a1 + 119) = 8;
  *(_QWORD *)(a1 + 120) = a14;
  *(_BYTE *)(a1 + 128) = 0;
  *(_BYTE *)(a1 + 129) = 8;
  *(_QWORD *)(a1 + 130) = a15;
  *(_BYTE *)(a1 + 138) = 66;
  *(_BYTE *)(a1 + 139) = 8;
  *(_QWORD *)(a1 + 140) = a16;
  *(_BYTE *)(a1 + 148) = 64;
  *(_BYTE *)(a1 + 149) = 8;
  *(_QWORD *)(a1 + 150) = a17;
  *(_BYTE *)(a1 + 158) = 0;
  *(_BYTE *)(a1 + 159) = 8;
  *(_QWORD *)(a1 + 160) = a18;
  *(_BYTE *)(a1 + 168) = 64;
  *(_BYTE *)(a1 + 169) = 8;
  *(_QWORD *)(a1 + 170) = a19;
  *(_BYTE *)(a1 + 178) = 0;
  *(_BYTE *)(a1 + 179) = 8;
  *(_QWORD *)(a1 + 180) = a20;
  return result;
}

uint64_t __os_log_helper_16_2_17_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_4_0_8_64(uint64_t result, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, uint64_t a18)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 17;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 4;
  *(_DWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 28) = 66;
  *(_BYTE *)(result + 29) = 8;
  *(_QWORD *)(result + 30) = a5;
  *(_BYTE *)(result + 38) = 0;
  *(_BYTE *)(result + 39) = 8;
  *(_QWORD *)(result + 40) = a6;
  *(_BYTE *)(result + 48) = 66;
  *(_BYTE *)(result + 49) = 8;
  *(_QWORD *)(result + 50) = a7;
  *(_BYTE *)(result + 58) = 66;
  *(_BYTE *)(result + 59) = 8;
  *(_QWORD *)(result + 60) = a8;
  *(_BYTE *)(result + 68) = 0;
  *(_BYTE *)(result + 69) = 8;
  *(_QWORD *)(result + 70) = a9;
  *(_BYTE *)(result + 78) = 66;
  *(_BYTE *)(result + 79) = 8;
  *(_QWORD *)(result + 80) = a10;
  *(_BYTE *)(result + 88) = 0;
  *(_BYTE *)(result + 89) = 8;
  *(_QWORD *)(result + 90) = a11;
  *(_BYTE *)(result + 98) = 66;
  *(_BYTE *)(result + 99) = 8;
  *(_QWORD *)(result + 100) = a12;
  *(_BYTE *)(result + 108) = 0;
  *(_BYTE *)(result + 109) = 8;
  *(_QWORD *)(result + 110) = a13;
  *(_BYTE *)(result + 118) = 66;
  *(_BYTE *)(result + 119) = 8;
  *(_QWORD *)(result + 120) = a14;
  *(_BYTE *)(result + 128) = 0;
  *(_BYTE *)(result + 129) = 8;
  *(_QWORD *)(result + 130) = a15;
  *(_BYTE *)(result + 138) = 66;
  *(_BYTE *)(result + 139) = 8;
  *(_QWORD *)(result + 140) = a16;
  *(_BYTE *)(result + 148) = 0;
  *(_BYTE *)(result + 149) = 4;
  *(_DWORD *)(result + 150) = a17;
  *(_BYTE *)(result + 154) = 64;
  *(_BYTE *)(result + 155) = 8;
  *(_QWORD *)(result + 156) = a18;
  return result;
}

uint64_t __os_log_helper_16_0_1_4_0(uint64_t result, int a2)
{
  *(_BYTE *)result = 0;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  return result;
}

uint64_t __os_log_helper_16_2_3_8_32_4_0_8_66(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 18) = 66;
  *(_BYTE *)(result + 19) = 8;
  *(_QWORD *)(result + 20) = a4;
  return result;
}

uint64_t __os_log_helper_16_2_6_8_32_8_0_8_64_8_0_4_0_8_0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 6;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 64;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 0;
  *(_BYTE *)(result + 33) = 8;
  *(_QWORD *)(result + 34) = a5;
  *(_BYTE *)(result + 42) = 0;
  *(_BYTE *)(result + 43) = 4;
  *(_DWORD *)(result + 44) = a6;
  *(_BYTE *)(result + 48) = 0;
  *(_BYTE *)(result + 49) = 8;
  *(_QWORD *)(result + 50) = a7;
  return result;
}

uint64_t SUPrefsDownloadPhaseIsStalled_0(id obj)
{
  char v2;
  uint64_t (*IsStalledSymbolLoc_0)(id);
  id location;

  location = 0;
  objc_storeStrong(&location, obj);
  IsStalledSymbolLoc_0 = (uint64_t (*)(id))getSUDownloadPhaseIsStalledSymbolLoc_0();
  if (!IsStalledSymbolLoc_0)
  {
    dlerror();
    abort_report_np();
  }
  v2 = IsStalledSymbolLoc_0(location);
  objc_storeStrong(&location, 0);
  return v2 & 1;
}

uint64_t __os_log_helper_16_2_17_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_64_4_0(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, int a18)
{
  uint64_t result;

  result = a9;
  *(_BYTE *)a1 = 2;
  *(_BYTE *)(a1 + 1) = 17;
  *(_BYTE *)(a1 + 2) = 32;
  *(_BYTE *)(a1 + 3) = 8;
  *(_QWORD *)(a1 + 4) = a2;
  *(_BYTE *)(a1 + 12) = 66;
  *(_BYTE *)(a1 + 13) = 8;
  *(_QWORD *)(a1 + 14) = a3;
  *(_BYTE *)(a1 + 22) = 0;
  *(_BYTE *)(a1 + 23) = 4;
  *(_DWORD *)(a1 + 24) = a4;
  *(_BYTE *)(a1 + 28) = 66;
  *(_BYTE *)(a1 + 29) = 8;
  *(_QWORD *)(a1 + 30) = a5;
  *(_BYTE *)(a1 + 38) = 0;
  *(_BYTE *)(a1 + 39) = 8;
  *(_QWORD *)(a1 + 40) = a6;
  *(_BYTE *)(a1 + 48) = 66;
  *(_BYTE *)(a1 + 49) = 8;
  *(_QWORD *)(a1 + 50) = a7;
  *(_BYTE *)(a1 + 58) = 66;
  *(_BYTE *)(a1 + 59) = 8;
  *(_QWORD *)(a1 + 60) = a8;
  *(_BYTE *)(a1 + 68) = 0;
  *(_BYTE *)(a1 + 69) = 8;
  *(_QWORD *)(a1 + 70) = a9;
  *(_BYTE *)(a1 + 78) = 66;
  *(_BYTE *)(a1 + 79) = 8;
  *(_QWORD *)(a1 + 80) = a10;
  *(_BYTE *)(a1 + 88) = 0;
  *(_BYTE *)(a1 + 89) = 8;
  *(_QWORD *)(a1 + 90) = a11;
  *(_BYTE *)(a1 + 98) = 66;
  *(_BYTE *)(a1 + 99) = 8;
  *(_QWORD *)(a1 + 100) = a12;
  *(_BYTE *)(a1 + 108) = 0;
  *(_BYTE *)(a1 + 109) = 8;
  *(_QWORD *)(a1 + 110) = a13;
  *(_BYTE *)(a1 + 118) = 66;
  *(_BYTE *)(a1 + 119) = 8;
  *(_QWORD *)(a1 + 120) = a14;
  *(_BYTE *)(a1 + 128) = 0;
  *(_BYTE *)(a1 + 129) = 8;
  *(_QWORD *)(a1 + 130) = a15;
  *(_BYTE *)(a1 + 138) = 66;
  *(_BYTE *)(a1 + 139) = 8;
  *(_QWORD *)(a1 + 140) = a16;
  *(_BYTE *)(a1 + 148) = 64;
  *(_BYTE *)(a1 + 149) = 8;
  *(_QWORD *)(a1 + 150) = a17;
  *(_BYTE *)(a1 + 158) = 0;
  *(_BYTE *)(a1 + 159) = 4;
  *(_DWORD *)(a1 + 160) = a18;
  return result;
}

uint64_t __os_log_helper_16_2_16_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_64(uint64_t result, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 16;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 4;
  *(_DWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 28) = 66;
  *(_BYTE *)(result + 29) = 8;
  *(_QWORD *)(result + 30) = a5;
  *(_BYTE *)(result + 38) = 0;
  *(_BYTE *)(result + 39) = 8;
  *(_QWORD *)(result + 40) = a6;
  *(_BYTE *)(result + 48) = 66;
  *(_BYTE *)(result + 49) = 8;
  *(_QWORD *)(result + 50) = a7;
  *(_BYTE *)(result + 58) = 66;
  *(_BYTE *)(result + 59) = 8;
  *(_QWORD *)(result + 60) = a8;
  *(_BYTE *)(result + 68) = 0;
  *(_BYTE *)(result + 69) = 8;
  *(_QWORD *)(result + 70) = a9;
  *(_BYTE *)(result + 78) = 66;
  *(_BYTE *)(result + 79) = 8;
  *(_QWORD *)(result + 80) = a10;
  *(_BYTE *)(result + 88) = 0;
  *(_BYTE *)(result + 89) = 8;
  *(_QWORD *)(result + 90) = a11;
  *(_BYTE *)(result + 98) = 66;
  *(_BYTE *)(result + 99) = 8;
  *(_QWORD *)(result + 100) = a12;
  *(_BYTE *)(result + 108) = 0;
  *(_BYTE *)(result + 109) = 8;
  *(_QWORD *)(result + 110) = a13;
  *(_BYTE *)(result + 118) = 66;
  *(_BYTE *)(result + 119) = 8;
  *(_QWORD *)(result + 120) = a14;
  *(_BYTE *)(result + 128) = 0;
  *(_BYTE *)(result + 129) = 8;
  *(_QWORD *)(result + 130) = a15;
  *(_BYTE *)(result + 138) = 66;
  *(_BYTE *)(result + 139) = 8;
  *(_QWORD *)(result + 140) = a16;
  *(_BYTE *)(result + 148) = 64;
  *(_BYTE *)(result + 149) = 8;
  *(_QWORD *)(result + 150) = a17;
  return result;
}

id getkSUInstallationConstraintsUnmetKey_1()
{
  id *v1;

  v1 = (id *)getkSUInstallationConstraintsUnmetKeySymbolLoc_1();
  if (!v1)
  {
    dlerror();
    abort_report_np();
  }
  return *v1;
}

uint64_t SUPrefsRequiredBatteryLevelForInstall()
{
  uint64_t SURequiredBatteryLevelForInstallSymbolLoc;
  uint64_t (*v2)(uint64_t);

  SURequiredBatteryLevelForInstallSymbolLoc = getSURequiredBatteryLevelForInstallSymbolLoc();
  v2 = (uint64_t (*)(uint64_t))SURequiredBatteryLevelForInstallSymbolLoc;
  if (!SURequiredBatteryLevelForInstallSymbolLoc)
  {
    dlerror();
    SURequiredBatteryLevelForInstallSymbolLoc = abort_report_np();
  }
  return v2(SURequiredBatteryLevelForInstallSymbolLoc);
}

uint64_t SUPrefsconnectedToCharger(uint64_t a1)
{
  uint64_t (*v2)(uint64_t);

  v2 = (uint64_t (*)(uint64_t))getconnectedToChargerSymbolLoc();
  if (!v2)
  {
    dlerror();
    abort_report_np();
  }
  return v2(a1) & 1;
}

uint64_t __os_log_helper_16_2_16_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_4_0(uint64_t result, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 16;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 4;
  *(_DWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 28) = 66;
  *(_BYTE *)(result + 29) = 8;
  *(_QWORD *)(result + 30) = a5;
  *(_BYTE *)(result + 38) = 0;
  *(_BYTE *)(result + 39) = 8;
  *(_QWORD *)(result + 40) = a6;
  *(_BYTE *)(result + 48) = 66;
  *(_BYTE *)(result + 49) = 8;
  *(_QWORD *)(result + 50) = a7;
  *(_BYTE *)(result + 58) = 66;
  *(_BYTE *)(result + 59) = 8;
  *(_QWORD *)(result + 60) = a8;
  *(_BYTE *)(result + 68) = 0;
  *(_BYTE *)(result + 69) = 8;
  *(_QWORD *)(result + 70) = a9;
  *(_BYTE *)(result + 78) = 66;
  *(_BYTE *)(result + 79) = 8;
  *(_QWORD *)(result + 80) = a10;
  *(_BYTE *)(result + 88) = 0;
  *(_BYTE *)(result + 89) = 8;
  *(_QWORD *)(result + 90) = a11;
  *(_BYTE *)(result + 98) = 66;
  *(_BYTE *)(result + 99) = 8;
  *(_QWORD *)(result + 100) = a12;
  *(_BYTE *)(result + 108) = 0;
  *(_BYTE *)(result + 109) = 8;
  *(_QWORD *)(result + 110) = a13;
  *(_BYTE *)(result + 118) = 66;
  *(_BYTE *)(result + 119) = 8;
  *(_QWORD *)(result + 120) = a14;
  *(_BYTE *)(result + 128) = 0;
  *(_BYTE *)(result + 129) = 8;
  *(_QWORD *)(result + 130) = a15;
  *(_BYTE *)(result + 138) = 66;
  *(_BYTE *)(result + 139) = 8;
  *(_QWORD *)(result + 140) = a16;
  *(_BYTE *)(result + 148) = 0;
  *(_BYTE *)(result + 149) = 4;
  *(_DWORD *)(result + 150) = a17;
  return result;
}

void sub_21BFE269C()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

uint64_t __os_log_helper_16_2_18_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_4_0_8_64(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, int a18, uint64_t a19)
{
  uint64_t result;

  result = a9;
  *(_BYTE *)a1 = 2;
  *(_BYTE *)(a1 + 1) = 18;
  *(_BYTE *)(a1 + 2) = 32;
  *(_BYTE *)(a1 + 3) = 8;
  *(_QWORD *)(a1 + 4) = a2;
  *(_BYTE *)(a1 + 12) = 66;
  *(_BYTE *)(a1 + 13) = 8;
  *(_QWORD *)(a1 + 14) = a3;
  *(_BYTE *)(a1 + 22) = 0;
  *(_BYTE *)(a1 + 23) = 4;
  *(_DWORD *)(a1 + 24) = a4;
  *(_BYTE *)(a1 + 28) = 66;
  *(_BYTE *)(a1 + 29) = 8;
  *(_QWORD *)(a1 + 30) = a5;
  *(_BYTE *)(a1 + 38) = 0;
  *(_BYTE *)(a1 + 39) = 8;
  *(_QWORD *)(a1 + 40) = a6;
  *(_BYTE *)(a1 + 48) = 66;
  *(_BYTE *)(a1 + 49) = 8;
  *(_QWORD *)(a1 + 50) = a7;
  *(_BYTE *)(a1 + 58) = 66;
  *(_BYTE *)(a1 + 59) = 8;
  *(_QWORD *)(a1 + 60) = a8;
  *(_BYTE *)(a1 + 68) = 0;
  *(_BYTE *)(a1 + 69) = 8;
  *(_QWORD *)(a1 + 70) = a9;
  *(_BYTE *)(a1 + 78) = 66;
  *(_BYTE *)(a1 + 79) = 8;
  *(_QWORD *)(a1 + 80) = a10;
  *(_BYTE *)(a1 + 88) = 0;
  *(_BYTE *)(a1 + 89) = 8;
  *(_QWORD *)(a1 + 90) = a11;
  *(_BYTE *)(a1 + 98) = 66;
  *(_BYTE *)(a1 + 99) = 8;
  *(_QWORD *)(a1 + 100) = a12;
  *(_BYTE *)(a1 + 108) = 0;
  *(_BYTE *)(a1 + 109) = 8;
  *(_QWORD *)(a1 + 110) = a13;
  *(_BYTE *)(a1 + 118) = 66;
  *(_BYTE *)(a1 + 119) = 8;
  *(_QWORD *)(a1 + 120) = a14;
  *(_BYTE *)(a1 + 128) = 0;
  *(_BYTE *)(a1 + 129) = 8;
  *(_QWORD *)(a1 + 130) = a15;
  *(_BYTE *)(a1 + 138) = 66;
  *(_BYTE *)(a1 + 139) = 8;
  *(_QWORD *)(a1 + 140) = a16;
  *(_BYTE *)(a1 + 148) = 0;
  *(_BYTE *)(a1 + 149) = 8;
  *(_QWORD *)(a1 + 150) = a17;
  *(_BYTE *)(a1 + 158) = 0;
  *(_BYTE *)(a1 + 159) = 4;
  *(_DWORD *)(a1 + 160) = a18;
  *(_BYTE *)(a1 + 164) = 64;
  *(_BYTE *)(a1 + 165) = 8;
  *(_QWORD *)(a1 + 166) = a19;
  return result;
}

void sub_21BFE4428()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

id getSUScanOptionsClass()
{
  id v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  int v11;
  int v12;
  uint64_t v13;

  v9 = 0;
  v10 = &v9;
  v11 = 1342177280;
  v12 = 32;
  v8 = getSUScanOptionsClass_softClass;
  v13 = getSUScanOptionsClass_softClass;
  if (!getSUScanOptionsClass_softClass)
  {
    v2 = MEMORY[0x24BDAC760];
    v3 = -1073741824;
    v4 = 0;
    v5 = __getSUScanOptionsClass_block_invoke;
    v6 = &unk_24DFF80D0;
    v7 = &v9;
    __getSUScanOptionsClass_block_invoke((uint64_t)&v2);
  }
  v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __os_log_helper_16_2_18_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_4_0_8_0_8_64(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, uint64_t a18, uint64_t a19)
{
  uint64_t result;

  result = a9;
  *(_BYTE *)a1 = 2;
  *(_BYTE *)(a1 + 1) = 18;
  *(_BYTE *)(a1 + 2) = 32;
  *(_BYTE *)(a1 + 3) = 8;
  *(_QWORD *)(a1 + 4) = a2;
  *(_BYTE *)(a1 + 12) = 66;
  *(_BYTE *)(a1 + 13) = 8;
  *(_QWORD *)(a1 + 14) = a3;
  *(_BYTE *)(a1 + 22) = 0;
  *(_BYTE *)(a1 + 23) = 4;
  *(_DWORD *)(a1 + 24) = a4;
  *(_BYTE *)(a1 + 28) = 66;
  *(_BYTE *)(a1 + 29) = 8;
  *(_QWORD *)(a1 + 30) = a5;
  *(_BYTE *)(a1 + 38) = 0;
  *(_BYTE *)(a1 + 39) = 8;
  *(_QWORD *)(a1 + 40) = a6;
  *(_BYTE *)(a1 + 48) = 66;
  *(_BYTE *)(a1 + 49) = 8;
  *(_QWORD *)(a1 + 50) = a7;
  *(_BYTE *)(a1 + 58) = 66;
  *(_BYTE *)(a1 + 59) = 8;
  *(_QWORD *)(a1 + 60) = a8;
  *(_BYTE *)(a1 + 68) = 0;
  *(_BYTE *)(a1 + 69) = 8;
  *(_QWORD *)(a1 + 70) = a9;
  *(_BYTE *)(a1 + 78) = 66;
  *(_BYTE *)(a1 + 79) = 8;
  *(_QWORD *)(a1 + 80) = a10;
  *(_BYTE *)(a1 + 88) = 0;
  *(_BYTE *)(a1 + 89) = 8;
  *(_QWORD *)(a1 + 90) = a11;
  *(_BYTE *)(a1 + 98) = 66;
  *(_BYTE *)(a1 + 99) = 8;
  *(_QWORD *)(a1 + 100) = a12;
  *(_BYTE *)(a1 + 108) = 0;
  *(_BYTE *)(a1 + 109) = 8;
  *(_QWORD *)(a1 + 110) = a13;
  *(_BYTE *)(a1 + 118) = 66;
  *(_BYTE *)(a1 + 119) = 8;
  *(_QWORD *)(a1 + 120) = a14;
  *(_BYTE *)(a1 + 128) = 0;
  *(_BYTE *)(a1 + 129) = 8;
  *(_QWORD *)(a1 + 130) = a15;
  *(_BYTE *)(a1 + 138) = 66;
  *(_BYTE *)(a1 + 139) = 8;
  *(_QWORD *)(a1 + 140) = a16;
  *(_BYTE *)(a1 + 148) = 0;
  *(_BYTE *)(a1 + 149) = 4;
  *(_DWORD *)(a1 + 150) = a17;
  *(_BYTE *)(a1 + 154) = 0;
  *(_BYTE *)(a1 + 155) = 8;
  *(_QWORD *)(a1 + 156) = a18;
  *(_BYTE *)(a1 + 164) = 64;
  *(_BYTE *)(a1 + 165) = 8;
  *(_QWORD *)(a1 + 166) = a19;
  return result;
}

id getkSUDownloadPhaseBrainFetchingQueuedRemote()
{
  id *v1;

  v1 = (id *)getkSUDownloadPhaseBrainFetchingQueuedRemoteSymbolLoc();
  if (!v1)
  {
    dlerror();
    abort_report_np();
  }
  return *v1;
}

id getkSUDownloadPhaseUpdateFetchingQueuedRemote()
{
  id *updated;

  updated = (id *)getkSUDownloadPhaseUpdateFetchingQueuedRemoteSymbolLoc();
  if (!updated)
  {
    dlerror();
    abort_report_np();
  }
  return *updated;
}

void sub_21BFE73FC()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

uint64_t __os_log_helper_16_2_19_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_64(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t result;

  result = a10;
  *(_BYTE *)a1 = 2;
  *(_BYTE *)(a1 + 1) = 19;
  *(_BYTE *)(a1 + 2) = 32;
  *(_BYTE *)(a1 + 3) = 8;
  *(_QWORD *)(a1 + 4) = a2;
  *(_BYTE *)(a1 + 12) = 66;
  *(_BYTE *)(a1 + 13) = 8;
  *(_QWORD *)(a1 + 14) = a3;
  *(_BYTE *)(a1 + 22) = 0;
  *(_BYTE *)(a1 + 23) = 4;
  *(_DWORD *)(a1 + 24) = a4;
  *(_BYTE *)(a1 + 28) = 66;
  *(_BYTE *)(a1 + 29) = 8;
  *(_QWORD *)(a1 + 30) = a5;
  *(_BYTE *)(a1 + 38) = 0;
  *(_BYTE *)(a1 + 39) = 8;
  *(_QWORD *)(a1 + 40) = a6;
  *(_BYTE *)(a1 + 48) = 66;
  *(_BYTE *)(a1 + 49) = 8;
  *(_QWORD *)(a1 + 50) = a7;
  *(_BYTE *)(a1 + 58) = 66;
  *(_BYTE *)(a1 + 59) = 8;
  *(_QWORD *)(a1 + 60) = a8;
  *(_BYTE *)(a1 + 68) = 0;
  *(_BYTE *)(a1 + 69) = 8;
  *(_QWORD *)(a1 + 70) = a9;
  *(_BYTE *)(a1 + 78) = 66;
  *(_BYTE *)(a1 + 79) = 8;
  *(_QWORD *)(a1 + 80) = a10;
  *(_BYTE *)(a1 + 88) = 0;
  *(_BYTE *)(a1 + 89) = 8;
  *(_QWORD *)(a1 + 90) = a11;
  *(_BYTE *)(a1 + 98) = 66;
  *(_BYTE *)(a1 + 99) = 8;
  *(_QWORD *)(a1 + 100) = a12;
  *(_BYTE *)(a1 + 108) = 0;
  *(_BYTE *)(a1 + 109) = 8;
  *(_QWORD *)(a1 + 110) = a13;
  *(_BYTE *)(a1 + 118) = 66;
  *(_BYTE *)(a1 + 119) = 8;
  *(_QWORD *)(a1 + 120) = a14;
  *(_BYTE *)(a1 + 128) = 0;
  *(_BYTE *)(a1 + 129) = 8;
  *(_QWORD *)(a1 + 130) = a15;
  *(_BYTE *)(a1 + 138) = 66;
  *(_BYTE *)(a1 + 139) = 8;
  *(_QWORD *)(a1 + 140) = a16;
  *(_BYTE *)(a1 + 148) = 66;
  *(_BYTE *)(a1 + 149) = 8;
  *(_QWORD *)(a1 + 150) = a17;
  *(_BYTE *)(a1 + 158) = 66;
  *(_BYTE *)(a1 + 159) = 8;
  *(_QWORD *)(a1 + 160) = a18;
  *(_BYTE *)(a1 + 168) = 66;
  *(_BYTE *)(a1 + 169) = 8;
  *(_QWORD *)(a1 + 170) = a19;
  *(_BYTE *)(a1 + 178) = 64;
  *(_BYTE *)(a1 + 179) = 8;
  *(_QWORD *)(a1 + 180) = a20;
  return result;
}

uint64_t __os_log_helper_16_2_6_8_32_8_64_8_0_8_64_8_0_8_64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 6;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 64;
  *(_BYTE *)(result + 33) = 8;
  *(_QWORD *)(result + 34) = a5;
  *(_BYTE *)(result + 42) = 0;
  *(_BYTE *)(result + 43) = 8;
  *(_QWORD *)(result + 44) = a6;
  *(_BYTE *)(result + 52) = 64;
  *(_BYTE *)(result + 53) = 8;
  *(_QWORD *)(result + 54) = a7;
  return result;
}

uint64_t __os_log_helper_16_2_4_8_32_8_64_8_0_8_64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 4;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 64;
  *(_BYTE *)(result + 33) = 8;
  *(_QWORD *)(result + 34) = a5;
  return result;
}

uint64_t __os_log_helper_16_2_7_8_32_8_0_8_64_8_64_4_0_8_0_8_0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 7;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 64;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 64;
  *(_BYTE *)(result + 33) = 8;
  *(_QWORD *)(result + 34) = a5;
  *(_BYTE *)(result + 42) = 0;
  *(_BYTE *)(result + 43) = 4;
  *(_DWORD *)(result + 44) = a6;
  *(_BYTE *)(result + 48) = 0;
  *(_BYTE *)(result + 49) = 8;
  *(_QWORD *)(result + 50) = a7;
  *(_BYTE *)(result + 58) = 0;
  *(_BYTE *)(result + 59) = 8;
  *(_QWORD *)(result + 60) = a8;
  return result;
}

uint64_t __os_log_helper_16_2_16_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0(uint64_t result, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 16;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 4;
  *(_DWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 28) = 66;
  *(_BYTE *)(result + 29) = 8;
  *(_QWORD *)(result + 30) = a5;
  *(_BYTE *)(result + 38) = 0;
  *(_BYTE *)(result + 39) = 8;
  *(_QWORD *)(result + 40) = a6;
  *(_BYTE *)(result + 48) = 66;
  *(_BYTE *)(result + 49) = 8;
  *(_QWORD *)(result + 50) = a7;
  *(_BYTE *)(result + 58) = 66;
  *(_BYTE *)(result + 59) = 8;
  *(_QWORD *)(result + 60) = a8;
  *(_BYTE *)(result + 68) = 0;
  *(_BYTE *)(result + 69) = 8;
  *(_QWORD *)(result + 70) = a9;
  *(_BYTE *)(result + 78) = 66;
  *(_BYTE *)(result + 79) = 8;
  *(_QWORD *)(result + 80) = a10;
  *(_BYTE *)(result + 88) = 0;
  *(_BYTE *)(result + 89) = 8;
  *(_QWORD *)(result + 90) = a11;
  *(_BYTE *)(result + 98) = 66;
  *(_BYTE *)(result + 99) = 8;
  *(_QWORD *)(result + 100) = a12;
  *(_BYTE *)(result + 108) = 0;
  *(_BYTE *)(result + 109) = 8;
  *(_QWORD *)(result + 110) = a13;
  *(_BYTE *)(result + 118) = 66;
  *(_BYTE *)(result + 119) = 8;
  *(_QWORD *)(result + 120) = a14;
  *(_BYTE *)(result + 128) = 0;
  *(_BYTE *)(result + 129) = 8;
  *(_QWORD *)(result + 130) = a15;
  *(_BYTE *)(result + 138) = 66;
  *(_BYTE *)(result + 139) = 8;
  *(_QWORD *)(result + 140) = a16;
  *(_BYTE *)(result + 148) = 0;
  *(_BYTE *)(result + 149) = 8;
  *(_QWORD *)(result + 150) = a17;
  return result;
}

uint64_t __getSUNetworkMonitorClass_block_invoke_0(uint64_t a1)
{
  Class Class;
  uint64_t result;

  SoftwareUpdateServicesLibrary_4();
  Class = objc_getClass("SUNetworkMonitor");
  result = a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = Class;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    result = abort_report_np();
  getSUNetworkMonitorClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SoftwareUpdateServicesLibrary_4()
{
  uint64_t updated;

  updated = SoftwareUpdateServicesLibraryCore_4();
  if (!updated)
    abort_report_np();
  return updated;
}

uint64_t SoftwareUpdateServicesLibraryCore_4()
{
  if (!SoftwareUpdateServicesLibraryCore_frameworkLibrary_4)
    __SoftwareUpdateServicesLibraryCore_block_invoke_4();
  return SoftwareUpdateServicesLibraryCore_frameworkLibrary_4;
}

uint64_t getkSUDownloadPhasePreparingForInstallationSymbolLoc_1()
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  int v11;
  int v12;
  uint64_t v13;

  v9 = 0;
  v10 = &v9;
  v11 = 0x20000000;
  v12 = 32;
  v8 = getkSUDownloadPhasePreparingForInstallationSymbolLoc_ptr_1;
  v13 = getkSUDownloadPhasePreparingForInstallationSymbolLoc_ptr_1;
  if (!getkSUDownloadPhasePreparingForInstallationSymbolLoc_ptr_1)
  {
    v2 = MEMORY[0x24BDAC760];
    v3 = -1073741824;
    v4 = 0;
    v5 = __getkSUDownloadPhasePreparingForInstallationSymbolLoc_block_invoke_1;
    v6 = &unk_24DFF80D0;
    v7 = &v9;
    __getkSUDownloadPhasePreparingForInstallationSymbolLoc_block_invoke_1((uint64_t)&v2);
  }
  v1 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __getkSUDownloadPhasePreparingForInstallationSymbolLoc_block_invoke_1(uint64_t a1)
{
  void *updated;
  void *v2;
  uint64_t result;

  updated = (void *)SoftwareUpdateServicesLibrary_4();
  v2 = dlsym(updated, "kSUDownloadPhasePreparingForInstallation");
  result = a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v2;
  getkSUDownloadPhasePreparingForInstallationSymbolLoc_ptr_1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __getSUDownloadPolicyFactoryClass_block_invoke_0(uint64_t a1)
{
  Class Class;
  uint64_t result;

  SoftwareUpdateServicesLibrary_4();
  Class = objc_getClass("SUDownloadPolicyFactory");
  result = a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = Class;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    result = abort_report_np();
  getSUDownloadPolicyFactoryClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getSUErrorDomainSymbolLoc_3()
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  int v11;
  int v12;
  uint64_t v13;

  v9 = 0;
  v10 = &v9;
  v11 = 0x20000000;
  v12 = 32;
  v8 = getSUErrorDomainSymbolLoc_ptr_3;
  v13 = getSUErrorDomainSymbolLoc_ptr_3;
  if (!getSUErrorDomainSymbolLoc_ptr_3)
  {
    v2 = MEMORY[0x24BDAC760];
    v3 = -1073741824;
    v4 = 0;
    v5 = __getSUErrorDomainSymbolLoc_block_invoke_3;
    v6 = &unk_24DFF80D0;
    v7 = &v9;
    __getSUErrorDomainSymbolLoc_block_invoke_3((uint64_t)&v2);
  }
  v1 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __getSUErrorDomainSymbolLoc_block_invoke_3(uint64_t a1)
{
  void *updated;
  void *v2;
  uint64_t result;

  updated = (void *)SoftwareUpdateServicesLibrary_4();
  v2 = dlsym(updated, "SUErrorDomain");
  result = a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v2;
  getSUErrorDomainSymbolLoc_ptr_3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getSUDownloadPhaseIsStalledSymbolLoc_0()
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  int v11;
  int v12;
  uint64_t v13;

  v9 = 0;
  v10 = &v9;
  v11 = 0x20000000;
  v12 = 32;
  v8 = getSUDownloadPhaseIsStalledSymbolLoc_ptr_0;
  v13 = getSUDownloadPhaseIsStalledSymbolLoc_ptr_0;
  if (!getSUDownloadPhaseIsStalledSymbolLoc_ptr_0)
  {
    v2 = MEMORY[0x24BDAC760];
    v3 = -1073741824;
    v4 = 0;
    v5 = __getSUDownloadPhaseIsStalledSymbolLoc_block_invoke_0;
    v6 = &unk_24DFF80D0;
    v7 = &v9;
    __getSUDownloadPhaseIsStalledSymbolLoc_block_invoke_0((uint64_t)&v2);
  }
  v1 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __getSUDownloadPhaseIsStalledSymbolLoc_block_invoke_0(uint64_t a1)
{
  void *updated;
  void *v2;
  uint64_t result;

  updated = (void *)SoftwareUpdateServicesLibrary_4();
  v2 = dlsym(updated, "SUDownloadPhaseIsStalled");
  result = a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v2;
  getSUDownloadPhaseIsStalledSymbolLoc_ptr_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getkSUInstallationConstraintsUnmetKeySymbolLoc_1()
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  int v11;
  int v12;
  uint64_t v13;

  v9 = 0;
  v10 = &v9;
  v11 = 0x20000000;
  v12 = 32;
  v8 = getkSUInstallationConstraintsUnmetKeySymbolLoc_ptr_1;
  v13 = getkSUInstallationConstraintsUnmetKeySymbolLoc_ptr_1;
  if (!getkSUInstallationConstraintsUnmetKeySymbolLoc_ptr_1)
  {
    v2 = MEMORY[0x24BDAC760];
    v3 = -1073741824;
    v4 = 0;
    v5 = __getkSUInstallationConstraintsUnmetKeySymbolLoc_block_invoke_1;
    v6 = &unk_24DFF80D0;
    v7 = &v9;
    __getkSUInstallationConstraintsUnmetKeySymbolLoc_block_invoke_1((uint64_t)&v2);
  }
  v1 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __getkSUInstallationConstraintsUnmetKeySymbolLoc_block_invoke_1(uint64_t a1)
{
  void *updated;
  void *v2;
  uint64_t result;

  updated = (void *)SoftwareUpdateServicesLibrary_4();
  v2 = dlsym(updated, "kSUInstallationConstraintsUnmetKey");
  result = a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v2;
  getkSUInstallationConstraintsUnmetKeySymbolLoc_ptr_1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getSURequiredBatteryLevelForInstallSymbolLoc()
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  int v11;
  int v12;
  uint64_t v13;

  v9 = 0;
  v10 = &v9;
  v11 = 0x20000000;
  v12 = 32;
  v8 = getSURequiredBatteryLevelForInstallSymbolLoc_ptr;
  v13 = getSURequiredBatteryLevelForInstallSymbolLoc_ptr;
  if (!getSURequiredBatteryLevelForInstallSymbolLoc_ptr)
  {
    v2 = MEMORY[0x24BDAC760];
    v3 = -1073741824;
    v4 = 0;
    v5 = __getSURequiredBatteryLevelForInstallSymbolLoc_block_invoke;
    v6 = &unk_24DFF80D0;
    v7 = &v9;
    __getSURequiredBatteryLevelForInstallSymbolLoc_block_invoke((uint64_t)&v2);
  }
  v1 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __getSURequiredBatteryLevelForInstallSymbolLoc_block_invoke(uint64_t a1)
{
  void *updated;
  void *v2;
  uint64_t result;

  updated = (void *)SoftwareUpdateServicesLibrary_4();
  v2 = dlsym(updated, "SURequiredBatteryLevelForInstall");
  result = a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v2;
  getSURequiredBatteryLevelForInstallSymbolLoc_ptr = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getconnectedToChargerSymbolLoc()
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  int v11;
  int v12;
  uint64_t v13;

  v9 = 0;
  v10 = &v9;
  v11 = 0x20000000;
  v12 = 32;
  v8 = getconnectedToChargerSymbolLoc_ptr;
  v13 = getconnectedToChargerSymbolLoc_ptr;
  if (!getconnectedToChargerSymbolLoc_ptr)
  {
    v2 = MEMORY[0x24BDAC760];
    v3 = -1073741824;
    v4 = 0;
    v5 = __getconnectedToChargerSymbolLoc_block_invoke;
    v6 = &unk_24DFF80D0;
    v7 = &v9;
    __getconnectedToChargerSymbolLoc_block_invoke((uint64_t)&v2);
  }
  v1 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __getconnectedToChargerSymbolLoc_block_invoke(uint64_t a1)
{
  void *updated;
  void *v2;
  uint64_t result;

  updated = (void *)SoftwareUpdateServicesLibrary_4();
  v2 = dlsym(updated, "connectedToCharger");
  result = a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v2;
  getconnectedToChargerSymbolLoc_ptr = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __getSUScanOptionsClass_block_invoke(uint64_t a1)
{
  Class Class;
  uint64_t result;

  SoftwareUpdateServicesLibrary_4();
  Class = objc_getClass("SUScanOptions");
  result = a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = Class;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    result = abort_report_np();
  getSUScanOptionsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getkSUDownloadPhaseBrainFetchingQueuedRemoteSymbolLoc()
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  int v11;
  int v12;
  uint64_t v13;

  v9 = 0;
  v10 = &v9;
  v11 = 0x20000000;
  v12 = 32;
  v8 = getkSUDownloadPhaseBrainFetchingQueuedRemoteSymbolLoc_ptr;
  v13 = getkSUDownloadPhaseBrainFetchingQueuedRemoteSymbolLoc_ptr;
  if (!getkSUDownloadPhaseBrainFetchingQueuedRemoteSymbolLoc_ptr)
  {
    v2 = MEMORY[0x24BDAC760];
    v3 = -1073741824;
    v4 = 0;
    v5 = __getkSUDownloadPhaseBrainFetchingQueuedRemoteSymbolLoc_block_invoke;
    v6 = &unk_24DFF80D0;
    v7 = &v9;
    __getkSUDownloadPhaseBrainFetchingQueuedRemoteSymbolLoc_block_invoke((uint64_t)&v2);
  }
  v1 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __getkSUDownloadPhaseBrainFetchingQueuedRemoteSymbolLoc_block_invoke(uint64_t a1)
{
  void *updated;
  void *v2;
  uint64_t result;

  updated = (void *)SoftwareUpdateServicesLibrary_4();
  v2 = dlsym(updated, "kSUDownloadPhaseBrainFetchingQueuedRemote");
  result = a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v2;
  getkSUDownloadPhaseBrainFetchingQueuedRemoteSymbolLoc_ptr = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getkSUDownloadPhaseUpdateFetchingQueuedRemoteSymbolLoc()
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  int v11;
  int v12;
  uint64_t v13;

  v9 = 0;
  v10 = &v9;
  v11 = 0x20000000;
  v12 = 32;
  v8 = getkSUDownloadPhaseUpdateFetchingQueuedRemoteSymbolLoc_ptr;
  v13 = getkSUDownloadPhaseUpdateFetchingQueuedRemoteSymbolLoc_ptr;
  if (!getkSUDownloadPhaseUpdateFetchingQueuedRemoteSymbolLoc_ptr)
  {
    v2 = MEMORY[0x24BDAC760];
    v3 = -1073741824;
    v4 = 0;
    v5 = __getkSUDownloadPhaseUpdateFetchingQueuedRemoteSymbolLoc_block_invoke;
    v6 = &unk_24DFF80D0;
    v7 = &v9;
    __getkSUDownloadPhaseUpdateFetchingQueuedRemoteSymbolLoc_block_invoke((uint64_t)&v2);
  }
  v1 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __getkSUDownloadPhaseUpdateFetchingQueuedRemoteSymbolLoc_block_invoke(uint64_t a1)
{
  void *updated;
  void *v2;
  uint64_t result;

  updated = (void *)SoftwareUpdateServicesLibrary_4();
  v2 = dlsym(updated, "kSUDownloadPhaseUpdateFetchingQueuedRemote");
  result = a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v2;
  getkSUDownloadPhaseUpdateFetchingQueuedRemoteSymbolLoc_ptr = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

__CFString *SUSettingsScanOperationTypeToString(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      return CFSTR("None");
    case 1:
      return CFSTR("FullScan");
    case 2:
      return CFSTR("RefreshScanResults");
  }
  return CFSTR("Unknown");
}

uint64_t __os_log_helper_16_2_4_8_32_8_66_8_66_8_64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 4;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 66;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 64;
  *(_BYTE *)(result + 33) = 8;
  *(_QWORD *)(result + 34) = a5;
  return result;
}

uint64_t __os_log_helper_16_2_6_8_32_8_66_8_32_8_66_8_32_8_66(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 6;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 32;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 66;
  *(_BYTE *)(result + 33) = 8;
  *(_QWORD *)(result + 34) = a5;
  *(_BYTE *)(result + 42) = 32;
  *(_BYTE *)(result + 43) = 8;
  *(_QWORD *)(result + 44) = a6;
  *(_BYTE *)(result + 52) = 66;
  *(_BYTE *)(result + 53) = 8;
  *(_QWORD *)(result + 54) = a7;
  return result;
}

uint64_t __os_log_helper_16_2_6_8_32_8_66_8_66_8_32_8_66_8_66(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 6;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 66;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 32;
  *(_BYTE *)(result + 33) = 8;
  *(_QWORD *)(result + 34) = a5;
  *(_BYTE *)(result + 42) = 66;
  *(_BYTE *)(result + 43) = 8;
  *(_QWORD *)(result + 44) = a6;
  *(_BYTE *)(result + 52) = 66;
  *(_BYTE *)(result + 53) = 8;
  *(_QWORD *)(result + 54) = a7;
  return result;
}

uint64_t __os_log_helper_16_2_5_8_32_8_66_8_64_8_0_8_66(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 5;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 64;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 0;
  *(_BYTE *)(result + 33) = 8;
  *(_QWORD *)(result + 34) = a5;
  *(_BYTE *)(result + 42) = 66;
  *(_BYTE *)(result + 43) = 8;
  *(_QWORD *)(result + 44) = a6;
  return result;
}

uint64_t __os_log_helper_16_2_4_8_32_8_66_8_0_8_64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 4;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 64;
  *(_BYTE *)(result + 33) = 8;
  *(_QWORD *)(result + 34) = a5;
  return result;
}

uint64_t __os_log_helper_16_2_4_8_32_8_66_8_64_8_66(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 4;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 64;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 66;
  *(_BYTE *)(result + 33) = 8;
  *(_QWORD *)(result + 34) = a5;
  return result;
}

uint64_t __os_log_helper_16_2_5_8_32_8_66_4_0_8_66_8_64(uint64_t result, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 5;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 4;
  *(_DWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 28) = 66;
  *(_BYTE *)(result + 29) = 8;
  *(_QWORD *)(result + 30) = a5;
  *(_BYTE *)(result + 38) = 64;
  *(_BYTE *)(result + 39) = 8;
  *(_QWORD *)(result + 40) = a6;
  return result;
}

uint64_t __os_log_helper_16_2_5_8_32_8_64_8_0_8_64_8_0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 5;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 64;
  *(_BYTE *)(result + 33) = 8;
  *(_QWORD *)(result + 34) = a5;
  *(_BYTE *)(result + 42) = 0;
  *(_BYTE *)(result + 43) = 8;
  *(_QWORD *)(result + 44) = a6;
  return result;
}

uint64_t __os_log_helper_16_2_5_8_32_8_66_8_66_8_66_4_0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 5;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 66;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 66;
  *(_BYTE *)(result + 33) = 8;
  *(_QWORD *)(result + 34) = a5;
  *(_BYTE *)(result + 42) = 0;
  *(_BYTE *)(result + 43) = 4;
  *(_DWORD *)(result + 44) = a6;
  return result;
}

uint64_t __os_log_helper_16_2_3_8_64_8_32_8_64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 32;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 64;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  return result;
}

id getSUSMKSoftwareUpdateServicesStrategyBaseClass()
{
  id v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  int v11;
  int v12;
  uint64_t v13;

  v9 = 0;
  v10 = &v9;
  v11 = 1342177280;
  v12 = 32;
  v8 = getSUSMKSoftwareUpdateServicesStrategyBaseClass_softClass;
  v13 = getSUSMKSoftwareUpdateServicesStrategyBaseClass_softClass;
  if (!getSUSMKSoftwareUpdateServicesStrategyBaseClass_softClass)
  {
    v2 = MEMORY[0x24BDAC760];
    v3 = -1073741824;
    v4 = 0;
    v5 = __getSUSMKSoftwareUpdateServicesStrategyBaseClass_block_invoke;
    v6 = &unk_24DFF80D0;
    v7 = &v9;
    __getSUSMKSoftwareUpdateServicesStrategyBaseClass_block_invoke((uint64_t)&v2);
  }
  v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

id getSUSMKSoftwareUpdateServicesStrategyOptionsClass()
{
  id v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  int v11;
  int v12;
  uint64_t v13;

  v9 = 0;
  v10 = &v9;
  v11 = 1342177280;
  v12 = 32;
  v8 = getSUSMKSoftwareUpdateServicesStrategyOptionsClass_softClass;
  v13 = getSUSMKSoftwareUpdateServicesStrategyOptionsClass_softClass;
  if (!getSUSMKSoftwareUpdateServicesStrategyOptionsClass_softClass)
  {
    v2 = MEMORY[0x24BDAC760];
    v3 = -1073741824;
    v4 = 0;
    v5 = __getSUSMKSoftwareUpdateServicesStrategyOptionsClass_block_invoke;
    v6 = &unk_24DFF80D0;
    v7 = &v9;
    __getSUSMKSoftwareUpdateServicesStrategyOptionsClass_block_invoke((uint64_t)&v2);
  }
  v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __getSUSMKSoftwareUpdateServicesStrategyBaseClass_block_invoke(uint64_t a1)
{
  Class Class;
  uint64_t result;

  SoftwareUpdateSettingsMockingKitLibrary_1();
  Class = objc_getClass("SUSMKSoftwareUpdateServicesStrategyBase");
  result = a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = Class;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    result = abort_report_np();
  getSUSMKSoftwareUpdateServicesStrategyBaseClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SoftwareUpdateSettingsMockingKitLibrary_1()
{
  uint64_t updated;

  updated = SoftwareUpdateSettingsMockingKitLibraryCore_1();
  if (!updated)
    abort_report_np();
  return updated;
}

uint64_t SoftwareUpdateSettingsMockingKitLibraryCore_1()
{
  if (!SoftwareUpdateSettingsMockingKitLibraryCore_frameworkLibrary_1)
    __SoftwareUpdateSettingsMockingKitLibraryCore_block_invoke_1();
  return SoftwareUpdateSettingsMockingKitLibraryCore_frameworkLibrary_1;
}

uint64_t __getSUSMKSoftwareUpdateServicesStrategyOptionsClass_block_invoke(uint64_t a1)
{
  Class Class;
  uint64_t result;

  SoftwareUpdateSettingsMockingKitLibrary_1();
  Class = objc_getClass("SUSMKSoftwareUpdateServicesStrategyOptions");
  result = a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = Class;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    result = abort_report_np();
  getSUSMKSoftwareUpdateServicesStrategyOptionsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                           + 24);
  return result;
}

uint64_t __os_log_helper_16_2_3_8_64_8_32_8_34(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 32;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 34;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  return result;
}

id getSUSMKSoftwareUpdateServicesStrategyBaseClass_0()
{
  id v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  int v11;
  int v12;
  uint64_t v13;

  v9 = 0;
  v10 = &v9;
  v11 = 1342177280;
  v12 = 32;
  v8 = getSUSMKSoftwareUpdateServicesStrategyBaseClass_softClass_0;
  v13 = getSUSMKSoftwareUpdateServicesStrategyBaseClass_softClass_0;
  if (!getSUSMKSoftwareUpdateServicesStrategyBaseClass_softClass_0)
  {
    v2 = MEMORY[0x24BDAC760];
    v3 = -1073741824;
    v4 = 0;
    v5 = __getSUSMKSoftwareUpdateServicesStrategyBaseClass_block_invoke_0;
    v6 = &unk_24DFF80D0;
    v7 = &v9;
    __getSUSMKSoftwareUpdateServicesStrategyBaseClass_block_invoke_0((uint64_t)&v2);
  }
  v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

id getSUSMKSoftwareUpdateServicesStrategyOptionsClass_0()
{
  id v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  int v11;
  int v12;
  uint64_t v13;

  v9 = 0;
  v10 = &v9;
  v11 = 1342177280;
  v12 = 32;
  v8 = getSUSMKSoftwareUpdateServicesStrategyOptionsClass_softClass_0;
  v13 = getSUSMKSoftwareUpdateServicesStrategyOptionsClass_softClass_0;
  if (!getSUSMKSoftwareUpdateServicesStrategyOptionsClass_softClass_0)
  {
    v2 = MEMORY[0x24BDAC760];
    v3 = -1073741824;
    v4 = 0;
    v5 = __getSUSMKSoftwareUpdateServicesStrategyOptionsClass_block_invoke_0;
    v6 = &unk_24DFF80D0;
    v7 = &v9;
    __getSUSMKSoftwareUpdateServicesStrategyOptionsClass_block_invoke_0((uint64_t)&v2);
  }
  v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __getSUSMKSoftwareUpdateServicesStrategyBaseClass_block_invoke_0(uint64_t a1)
{
  Class Class;
  uint64_t result;

  SoftwareUpdateSettingsMockingKitLibrary_2();
  Class = objc_getClass("SUSMKSoftwareUpdateServicesStrategyBase");
  result = a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = Class;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    result = abort_report_np();
  getSUSMKSoftwareUpdateServicesStrategyBaseClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 24);
  return result;
}

uint64_t SoftwareUpdateSettingsMockingKitLibrary_2()
{
  uint64_t updated;

  updated = SoftwareUpdateSettingsMockingKitLibraryCore_2();
  if (!updated)
    abort_report_np();
  return updated;
}

uint64_t SoftwareUpdateSettingsMockingKitLibraryCore_2()
{
  if (!SoftwareUpdateSettingsMockingKitLibraryCore_frameworkLibrary_2)
    __SoftwareUpdateSettingsMockingKitLibraryCore_block_invoke_2();
  return SoftwareUpdateSettingsMockingKitLibraryCore_frameworkLibrary_2;
}

uint64_t __getSUSMKSoftwareUpdateServicesStrategyOptionsClass_block_invoke_0(uint64_t a1)
{
  Class Class;
  uint64_t result;

  SoftwareUpdateSettingsMockingKitLibrary_2();
  Class = objc_getClass("SUSMKSoftwareUpdateServicesStrategyOptions");
  result = a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = Class;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    result = abort_report_np();
  getSUSMKSoftwareUpdateServicesStrategyOptionsClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                             + 24);
  return result;
}

id getkSUInstallationConstraintsUnmetKey_2()
{
  id *v1;

  v1 = (id *)getkSUInstallationConstraintsUnmetKeySymbolLoc_2();
  if (!v1)
  {
    dlerror();
    abort_report_np();
  }
  return *v1;
}

id getSUErrorDomain_4()
{
  id *SUErrorDomainSymbolLoc_4;

  SUErrorDomainSymbolLoc_4 = (id *)getSUErrorDomainSymbolLoc_4();
  if (!SUErrorDomainSymbolLoc_4)
  {
    dlerror();
    abort_report_np();
  }
  return *SUErrorDomainSymbolLoc_4;
}

uint64_t SUPrefsRequiredBatteryLevelForInstall_0()
{
  uint64_t SURequiredBatteryLevelForInstallSymbolLoc_0;
  uint64_t (*v2)(uint64_t);

  SURequiredBatteryLevelForInstallSymbolLoc_0 = getSURequiredBatteryLevelForInstallSymbolLoc_0();
  v2 = (uint64_t (*)(uint64_t))SURequiredBatteryLevelForInstallSymbolLoc_0;
  if (!SURequiredBatteryLevelForInstallSymbolLoc_0)
  {
    dlerror();
    SURequiredBatteryLevelForInstallSymbolLoc_0 = abort_report_np();
  }
  return v2(SURequiredBatteryLevelForInstallSymbolLoc_0);
}

uint64_t SUPrefsconnectedToCharger_0(uint64_t a1)
{
  uint64_t (*v2)(uint64_t);

  v2 = (uint64_t (*)(uint64_t))getconnectedToChargerSymbolLoc_0();
  if (!v2)
  {
    dlerror();
    abort_report_np();
  }
  return v2(a1) & 1;
}

uint64_t getkSUInstallationConstraintsUnmetKeySymbolLoc_2()
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  int v11;
  int v12;
  uint64_t v13;

  v9 = 0;
  v10 = &v9;
  v11 = 0x20000000;
  v12 = 32;
  v8 = getkSUInstallationConstraintsUnmetKeySymbolLoc_ptr_2;
  v13 = getkSUInstallationConstraintsUnmetKeySymbolLoc_ptr_2;
  if (!getkSUInstallationConstraintsUnmetKeySymbolLoc_ptr_2)
  {
    v2 = MEMORY[0x24BDAC760];
    v3 = -1073741824;
    v4 = 0;
    v5 = __getkSUInstallationConstraintsUnmetKeySymbolLoc_block_invoke_2;
    v6 = &unk_24DFF80D0;
    v7 = &v9;
    __getkSUInstallationConstraintsUnmetKeySymbolLoc_block_invoke_2((uint64_t)&v2);
  }
  v1 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __getkSUInstallationConstraintsUnmetKeySymbolLoc_block_invoke_2(uint64_t a1)
{
  void *updated;
  void *v2;
  uint64_t result;

  updated = (void *)SoftwareUpdateServicesLibrary_5();
  v2 = dlsym(updated, "kSUInstallationConstraintsUnmetKey");
  result = a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v2;
  getkSUInstallationConstraintsUnmetKeySymbolLoc_ptr_2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SoftwareUpdateServicesLibrary_5()
{
  uint64_t updated;

  updated = SoftwareUpdateServicesLibraryCore_5();
  if (!updated)
    abort_report_np();
  return updated;
}

uint64_t SoftwareUpdateServicesLibraryCore_5()
{
  if (!SoftwareUpdateServicesLibraryCore_frameworkLibrary_5)
    __SoftwareUpdateServicesLibraryCore_block_invoke_5();
  return SoftwareUpdateServicesLibraryCore_frameworkLibrary_5;
}

uint64_t getSUErrorDomainSymbolLoc_4()
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  int v11;
  int v12;
  uint64_t v13;

  v9 = 0;
  v10 = &v9;
  v11 = 0x20000000;
  v12 = 32;
  v8 = getSUErrorDomainSymbolLoc_ptr_4;
  v13 = getSUErrorDomainSymbolLoc_ptr_4;
  if (!getSUErrorDomainSymbolLoc_ptr_4)
  {
    v2 = MEMORY[0x24BDAC760];
    v3 = -1073741824;
    v4 = 0;
    v5 = __getSUErrorDomainSymbolLoc_block_invoke_4;
    v6 = &unk_24DFF80D0;
    v7 = &v9;
    __getSUErrorDomainSymbolLoc_block_invoke_4((uint64_t)&v2);
  }
  v1 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __getSUErrorDomainSymbolLoc_block_invoke_4(uint64_t a1)
{
  void *updated;
  void *v2;
  uint64_t result;

  updated = (void *)SoftwareUpdateServicesLibrary_5();
  v2 = dlsym(updated, "SUErrorDomain");
  result = a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v2;
  getSUErrorDomainSymbolLoc_ptr_4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getSURequiredBatteryLevelForInstallSymbolLoc_0()
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  int v11;
  int v12;
  uint64_t v13;

  v9 = 0;
  v10 = &v9;
  v11 = 0x20000000;
  v12 = 32;
  v8 = getSURequiredBatteryLevelForInstallSymbolLoc_ptr_0;
  v13 = getSURequiredBatteryLevelForInstallSymbolLoc_ptr_0;
  if (!getSURequiredBatteryLevelForInstallSymbolLoc_ptr_0)
  {
    v2 = MEMORY[0x24BDAC760];
    v3 = -1073741824;
    v4 = 0;
    v5 = __getSURequiredBatteryLevelForInstallSymbolLoc_block_invoke_0;
    v6 = &unk_24DFF80D0;
    v7 = &v9;
    __getSURequiredBatteryLevelForInstallSymbolLoc_block_invoke_0((uint64_t)&v2);
  }
  v1 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __getSURequiredBatteryLevelForInstallSymbolLoc_block_invoke_0(uint64_t a1)
{
  void *updated;
  void *v2;
  uint64_t result;

  updated = (void *)SoftwareUpdateServicesLibrary_5();
  v2 = dlsym(updated, "SURequiredBatteryLevelForInstall");
  result = a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v2;
  getSURequiredBatteryLevelForInstallSymbolLoc_ptr_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t getconnectedToChargerSymbolLoc_0()
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  int v11;
  int v12;
  uint64_t v13;

  v9 = 0;
  v10 = &v9;
  v11 = 0x20000000;
  v12 = 32;
  v8 = getconnectedToChargerSymbolLoc_ptr_0;
  v13 = getconnectedToChargerSymbolLoc_ptr_0;
  if (!getconnectedToChargerSymbolLoc_ptr_0)
  {
    v2 = MEMORY[0x24BDAC760];
    v3 = -1073741824;
    v4 = 0;
    v5 = __getconnectedToChargerSymbolLoc_block_invoke_0;
    v6 = &unk_24DFF80D0;
    v7 = &v9;
    __getconnectedToChargerSymbolLoc_block_invoke_0((uint64_t)&v2);
  }
  v1 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __getconnectedToChargerSymbolLoc_block_invoke_0(uint64_t a1)
{
  void *updated;
  void *v2;
  uint64_t result;

  updated = (void *)SoftwareUpdateServicesLibrary_5();
  v2 = dlsym(updated, "connectedToCharger");
  result = a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v2;
  getconnectedToChargerSymbolLoc_ptr_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __Block_byref_object_copy__1(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

id getSUSMKSoftwareUpdateServicesStrategyBaseClass_1()
{
  id v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  int v11;
  int v12;
  uint64_t v13;

  v9 = 0;
  v10 = &v9;
  v11 = 1342177280;
  v12 = 32;
  v8 = getSUSMKSoftwareUpdateServicesStrategyBaseClass_softClass_1;
  v13 = getSUSMKSoftwareUpdateServicesStrategyBaseClass_softClass_1;
  if (!getSUSMKSoftwareUpdateServicesStrategyBaseClass_softClass_1)
  {
    v2 = MEMORY[0x24BDAC760];
    v3 = -1073741824;
    v4 = 0;
    v5 = __getSUSMKSoftwareUpdateServicesStrategyBaseClass_block_invoke_1;
    v6 = &unk_24DFF80D0;
    v7 = &v9;
    __getSUSMKSoftwareUpdateServicesStrategyBaseClass_block_invoke_1((uint64_t)&v2);
  }
  v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __getSUSMKSoftwareUpdateServicesStrategyBaseClass_block_invoke_1(uint64_t a1)
{
  Class Class;
  uint64_t result;

  SoftwareUpdateSettingsMockingKitLibrary_3();
  Class = objc_getClass("SUSMKSoftwareUpdateServicesStrategyBase");
  result = a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = Class;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    result = abort_report_np();
  getSUSMKSoftwareUpdateServicesStrategyBaseClass_softClass_1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 24);
  return result;
}

uint64_t SoftwareUpdateSettingsMockingKitLibrary_3()
{
  uint64_t updated;

  updated = SoftwareUpdateSettingsMockingKitLibraryCore_3();
  if (!updated)
    abort_report_np();
  return updated;
}

uint64_t SoftwareUpdateSettingsMockingKitLibraryCore_3()
{
  if (!SoftwareUpdateSettingsMockingKitLibraryCore_frameworkLibrary_3)
    __SoftwareUpdateSettingsMockingKitLibraryCore_block_invoke_3();
  return SoftwareUpdateSettingsMockingKitLibraryCore_frameworkLibrary_3;
}

id getSUSMKMockedServiceTypeUtilityClass_1()
{
  id v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  int v11;
  int v12;
  uint64_t v13;

  v9 = 0;
  v10 = &v9;
  v11 = 1342177280;
  v12 = 32;
  v8 = getSUSMKMockedServiceTypeUtilityClass_softClass_1;
  v13 = getSUSMKMockedServiceTypeUtilityClass_softClass_1;
  if (!getSUSMKMockedServiceTypeUtilityClass_softClass_1)
  {
    v2 = MEMORY[0x24BDAC760];
    v3 = -1073741824;
    v4 = 0;
    v5 = __getSUSMKMockedServiceTypeUtilityClass_block_invoke_1;
    v6 = &unk_24DFF80D0;
    v7 = &v9;
    __getSUSMKMockedServiceTypeUtilityClass_block_invoke_1((uint64_t)&v2);
  }
  v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __os_log_helper_16_2_5_8_32_8_64_8_64_8_64_8_64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 5;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 64;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 64;
  *(_BYTE *)(result + 33) = 8;
  *(_QWORD *)(result + 34) = a5;
  *(_BYTE *)(result + 42) = 64;
  *(_BYTE *)(result + 43) = 8;
  *(_QWORD *)(result + 44) = a6;
  return result;
}

uint64_t __getSUSMKMockedServiceTypeUtilityClass_block_invoke_1(uint64_t a1)
{
  Class Class;
  uint64_t result;

  SoftwareUpdateSettingsMockingKitLibrary_4();
  Class = objc_getClass("SUSMKMockedServiceTypeUtility");
  result = a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = Class;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    result = abort_report_np();
  getSUSMKMockedServiceTypeUtilityClass_softClass_1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SoftwareUpdateSettingsMockingKitLibrary_4()
{
  uint64_t updated;

  updated = SoftwareUpdateSettingsMockingKitLibraryCore_4();
  if (!updated)
    abort_report_np();
  return updated;
}

uint64_t SoftwareUpdateSettingsMockingKitLibraryCore_4()
{
  if (!SoftwareUpdateSettingsMockingKitLibraryCore_frameworkLibrary_4)
    __SoftwareUpdateSettingsMockingKitLibraryCore_block_invoke_4();
  return SoftwareUpdateSettingsMockingKitLibraryCore_frameworkLibrary_4;
}

void sub_21C015820(uint64_t a1, int a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 56) = a1;
  *(_DWORD *)(v2 - 60) = a2;
  _Block_object_dispose((const void *)(v2 - 48), 8);
  _Unwind_Resume(*(_Unwind_Exception **)(v2 - 56));
}

void sub_21C015B34(uint64_t a1, int a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 56) = a1;
  *(_DWORD *)(v2 - 60) = a2;
  _Block_object_dispose((const void *)(v2 - 48), 8);
  _Unwind_Resume(*(_Unwind_Exception **)(v2 - 56));
}

void sub_21C015E48(uint64_t a1, int a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 56) = a1;
  *(_DWORD *)(v2 - 60) = a2;
  _Block_object_dispose((const void *)(v2 - 48), 8);
  _Unwind_Resume(*(_Unwind_Exception **)(v2 - 56));
}

void sub_21C01615C(uint64_t a1, int a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 56) = a1;
  *(_DWORD *)(v2 - 60) = a2;
  _Block_object_dispose((const void *)(v2 - 48), 8);
  _Unwind_Resume(*(_Unwind_Exception **)(v2 - 56));
}

void sub_21C016470(uint64_t a1, int a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 56) = a1;
  *(_DWORD *)(v2 - 60) = a2;
  _Block_object_dispose((const void *)(v2 - 48), 8);
  _Unwind_Resume(*(_Unwind_Exception **)(v2 - 56));
}

void sub_21C016604(uint64_t a1, int a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 56) = a1;
  *(_DWORD *)(v2 - 60) = a2;
  _Block_object_dispose((const void *)(v2 - 48), 8);
  _Unwind_Resume(*(_Unwind_Exception **)(v2 - 56));
}

void sub_21C016918(uint64_t a1, int a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 56) = a1;
  *(_DWORD *)(v2 - 60) = a2;
  _Block_object_dispose((const void *)(v2 - 48), 8);
  _Unwind_Resume(*(_Unwind_Exception **)(v2 - 56));
}

id _SUSUILoggingFacility()
{
  dispatch_block_t block;
  dispatch_once_t *predicate;

  predicate = (dispatch_once_t *)&_SUSUILoggingFacility_onceToken;
  block = 0;
  objc_storeStrong(&block, &__block_literal_global_7);
  if (*predicate != -1)
    dispatch_once(predicate, block);
  objc_storeStrong(&block, 0);
  return (id)_SUSUILoggingFacility_oslog;
}

id _SUSUIInternalLoggingFacility()
{
  dispatch_block_t block;
  dispatch_once_t *predicate;

  predicate = (dispatch_once_t *)&_SUSUIInternalLoggingFacility_onceToken;
  block = 0;
  objc_storeStrong(&block, &__block_literal_global_8);
  if (*predicate != -1)
    dispatch_once(predicate, block);
  objc_storeStrong(&block, 0);
  return (id)_SUSUIInternalLoggingFacility_oslog;
}

uint64_t sub_21C019934()
{
  uint64_t v1;

  v1 = sub_21C01CBE4();
  __swift_allocate_value_buffer(v1, qword_2551FC668);
  __swift_project_value_buffer(v1, (uint64_t)qword_2551FC668);
  sub_21C01CC2C();
  sub_21C01CC2C();
  return sub_21C01CBD8();
}

uint64_t sub_21C0199D4()
{
  uint64_t v0;

  if (qword_2551FC660 != -1)
    swift_once();
  v0 = sub_21C01CBE4();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2551FC668);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = a2;
  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
    return *(_QWORD *)a2;
  return v3;
}

void *sub_21C019A74()
{
  return &unk_2551FC680;
}

uint64_t sub_21C019ADC()
{
  void *v0;
  id v1;
  char v3;
  char v4;
  char v5;
  const void *key;
  id v7;
  _BYTE v8[40];
  char v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  void *v15;

  v9 = 0;
  v15 = v0;
  v1 = v0;
  key = sub_21C019A74();
  swift_beginAccess();
  v7 = objc_getAssociatedObject(v0, key);
  swift_endAccess();
  swift_unknownObjectRelease();
  if (v7)
  {
    sub_21C01CD04();
    sub_21C019DB0((uint64_t)v8, (uint64_t)&v10);
    swift_unknownObjectRelease();
  }
  else
  {
    v10 = 0uLL;
    v11 = 0;
    v12 = 0;
  }
  sub_21C019CA4(&v10, &v13);
  if (v14)
  {
    if ((swift_dynamicCast() & 1) != 0)
      v5 = v8[39] & 1;
    else
      v5 = 2;
    v4 = v5;
  }
  else
  {
    sub_21C019D08((uint64_t)&v13);
    v4 = 2;
  }
  if (v4 == 2)
  {
    v3 = 0;
  }
  else
  {
    v9 = v4 & 1;
    v3 = v4;
  }
  return v3 & 1;
}

_OWORD *sub_21C019CA4(_OWORD *a1, _OWORD *a2)
{
  *a2 = *a1;
  a2[1] = a1[1];
  return a2;
}

uint64_t sub_21C019D08(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 24))
    __swift_destroy_boxed_opaque_existential_0(a1);
  return a1;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 24);
  if ((*(_DWORD *)(*(_QWORD *)(v2 - 8) + 80) & 0x20000) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1);
}

__n128 sub_21C019DB0(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_OWORD *)a2 = *(_OWORD *)a1;
  result = *(__n128 *)(a1 + 16);
  *(__n128 *)(a2 + 16) = result;
  return result;
}

uint64_t sub_21C019E24()
{
  void *v0;
  id v1;
  const void *key;
  id value;

  v1 = v0;
  key = sub_21C019A74();
  value = (id)sub_21C01CC5C();
  swift_beginAccess();
  objc_setAssociatedObject(v0, key, value, 0);
  swift_endAccess();
  swift_unknownObjectRelease();
  return swift_unknownObjectRelease();
}

Swift::Void __swiftcall SUSUISoftwareUpdateController.setupTipsObserver()()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  unsigned int v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;

  v13 = MEMORY[0x24BEE6930];
  v15 = 0;
  v8 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2551FC3D0) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v14 = (char *)&v8 - v8;
  v15 = (id)MEMORY[0x24BDAC7A8](v11);
  v9 = 1;
  objc_msgSend(v15, sel_setShouldShowComingSoonTip_, 0);
  v10 = 0;
  v0 = sub_21C01CC98();
  (*(void (**)(char *, _QWORD))(*(_QWORD *)(v0 - 8) + 56))(v14, v9);
  v1 = v11;
  sub_21C01CC80();
  v2 = sub_21C01CC74();
  v3 = v11;
  v12 = v2;
  v4 = swift_allocObject();
  v5 = v13;
  v6 = (_QWORD *)v4;
  v7 = (uint64_t)v14;
  v6[2] = v12;
  v6[3] = v5;
  v6[4] = v3;
  sub_21C01B0B0(v7, (uint64_t)&unk_2551FC3E0, (uint64_t)v6, MEMORY[0x24BEE4AE0] + 8);
  swift_release();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v4;

  v4 = *a1;
  if (*a1 < 0)
  {
    v2 = MEMORY[0x220773B24]((char *)a1 + (int)*a1, -(*a1 >> 32), 0);
    *a1 = v2;
    return v2;
  }
  return v4;
}

uint64_t sub_21C01A08C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4[20] = a4;
  v4[14] = v4;
  v4[15] = 0;
  v5 = sub_21C01CBE4();
  v4[21] = v5;
  v4[22] = *(_QWORD *)(v5 - 8);
  v4[23] = swift_task_alloc();
  v6 = sub_21C01CC14();
  v4[24] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v4[25] = v7;
  v4[26] = *(_QWORD *)(v7 + 64);
  v4[27] = swift_task_alloc();
  v4[28] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2551FC3F8);
  v4[29] = swift_task_alloc();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2551FC400);
  v4[30] = v8;
  v4[31] = *(_QWORD *)(v8 - 8);
  v4[32] = swift_task_alloc();
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2551FC408);
  v4[33] = v9;
  v4[34] = *(_QWORD *)(v9 - 8);
  v4[35] = swift_task_alloc();
  v4[15] = a4;
  v4[36] = sub_21C01CC80();
  v4[37] = sub_21C01CC74();
  v4[38] = sub_21C01CC68();
  v4[39] = v10;
  return swift_task_switch();
}

uint64_t sub_21C01A244()
{
  _QWORD *v0;
  _QWORD *v1;
  _QWORD *v2;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = v0[32];
  v5 = v0[31];
  v7 = v0[30];
  v0[14] = v0;
  v4 = *(_QWORD **)sub_21C01CBC0();
  v1 = v4;
  (*(void (**)(_QWORD *))((*v4 & *MEMORY[0x24BEE4EA0]) + 0x90))(v1);

  __swift_project_boxed_opaque_existential_1(v0 + 2, v0[5]);
  sub_21C01CBF0();
  sub_21C01CCA4();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v6, v7);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  v0[40] = 0;
  v0[41] = sub_21C01CC74();
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v8 + 336) = v2;
  *v2 = *(_QWORD *)(v8 + 112);
  v2[1] = sub_21C01A39C;
  return sub_21C01CCB0();
}

uint64_t sub_21C01A39C()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 112) = *(_QWORD *)v0;
  swift_task_dealloc();
  swift_unknownObjectRelease();
  return swift_task_switch();
}

uint64_t sub_21C01A418()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  uint64_t v21;
  uint8_t *buf;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint32_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  NSObject *v45;
  os_log_type_t v46;
  uint64_t v47;

  v1 = v0[29];
  v2 = v0[25];
  v3 = v0[24];
  v0[14] = v0;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v1, 1, v3) == 1)
  {
    (*(void (**)(void))(*(_QWORD *)(v47 + 272) + 8))();
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(*(_QWORD *)(v47 + 112) + 8))();
  }
  v29 = *(_QWORD *)(v47 + 224);
  v32 = *(_QWORD *)(v47 + 216);
  v31 = *(_QWORD *)(v47 + 200);
  v33 = *(_QWORD *)(v47 + 192);
  v26 = *(_QWORD *)(v47 + 184);
  v27 = *(_QWORD *)(v47 + 176);
  v28 = *(_QWORD *)(v47 + 168);
  v25 = *(_QWORD **)sub_21C01CBC0();
  v5 = v25;
  (*(void (**)(_QWORD *))((*v25 & *MEMORY[0x24BEE4EA0]) + 0x90))(v5);

  __swift_project_boxed_opaque_existential_1((_QWORD *)(v47 + 56), *(_QWORD *)(v47 + 80));
  sub_21C01CBFC();
  __swift_destroy_boxed_opaque_existential_1(v47 + 56);
  v6 = sub_21C0199D4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 16))(v26, v6, v28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 16))(v32, v29, v33);
  v30 = (*(unsigned __int8 *)(v31 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80);
  v36 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v31 + 32))(v36 + v30, v32, v33);
  v45 = sub_21C01CBCC();
  v46 = sub_21C01CCBC();
  *(_QWORD *)(v47 + 128) = 22;
  sub_21C01B844();
  sub_21C01B8AC();
  sub_21C01B914();
  sub_21C01CC44();
  v34 = *(_DWORD *)(v47 + 344);
  v38 = swift_allocObject();
  *(_BYTE *)(v38 + 16) = 32;
  v39 = swift_allocObject();
  *(_BYTE *)(v39 + 16) = 8;
  v35 = swift_allocObject();
  *(_QWORD *)(v35 + 16) = sub_21C01B008;
  *(_QWORD *)(v35 + 24) = 0;
  v40 = swift_allocObject();
  *(_QWORD *)(v40 + 16) = sub_21C01C918;
  *(_QWORD *)(v40 + 24) = v35;
  v41 = swift_allocObject();
  *(_BYTE *)(v41 + 16) = 32;
  v42 = swift_allocObject();
  *(_BYTE *)(v42 + 16) = 8;
  v37 = swift_allocObject();
  *(_QWORD *)(v37 + 16) = sub_21C01B814;
  *(_QWORD *)(v37 + 24) = v36;
  v43 = swift_allocObject();
  *(_QWORD *)(v43 + 16) = sub_21C01CA08;
  *(_QWORD *)(v43 + 24) = v37;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2551FC428);
  sub_21C01CD28();
  v44 = v7;
  swift_retain();
  *v44 = sub_21C01C8A4;
  v44[1] = v38;
  swift_retain();
  v44[2] = sub_21C01C8D4;
  v44[3] = v39;
  swift_retain();
  v44[4] = sub_21C01C960;
  v44[5] = v40;
  swift_retain();
  v44[6] = sub_21C01C994;
  v44[7] = v41;
  swift_retain();
  v44[8] = sub_21C01C9C4;
  v44[9] = v42;
  swift_retain();
  v44[10] = sub_21C01CA50;
  v44[11] = v43;
  sub_21C01CA5C();
  swift_bridgeObjectRelease();
  if (!os_log_type_enabled(v45, v46))
  {
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    v21 = *(_QWORD *)(v47 + 320);
    goto LABEL_8;
  }
  v8 = *(_QWORD *)(v47 + 320);
  buf = (uint8_t *)sub_21C01CCE0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2551FC430);
  v23 = sub_21C01B38C(0);
  v24 = sub_21C01B38C(2);
  *(_QWORD *)(v47 + 136) = buf;
  *(_QWORD *)(v47 + 144) = v23;
  *(_QWORD *)(v47 + 152) = v24;
  sub_21C01B3E4(2, (_BYTE **)(v47 + 136));
  sub_21C01B3E4(2, (_BYTE **)(v47 + 136));
  *(_QWORD *)(v47 + 96) = sub_21C01C8A4;
  *(_QWORD *)(v47 + 104) = v38;
  result = sub_21C01B3F8((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v47 + 96), v47 + 136, v47 + 144, v47 + 152);
  if (!v8)
  {
    *(_QWORD *)(v47 + 96) = sub_21C01C8D4;
    *(_QWORD *)(v47 + 104) = v39;
    sub_21C01B3F8((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v47 + 96), v47 + 136, v47 + 144, v47 + 152);
    *(_QWORD *)(v47 + 96) = sub_21C01C960;
    *(_QWORD *)(v47 + 104) = v40;
    sub_21C01B3F8((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v47 + 96), v47 + 136, v47 + 144, v47 + 152);
    *(_QWORD *)(v47 + 96) = sub_21C01C994;
    *(_QWORD *)(v47 + 104) = v41;
    sub_21C01B3F8((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v47 + 96), v47 + 136, v47 + 144, v47 + 152);
    *(_QWORD *)(v47 + 96) = sub_21C01C9C4;
    *(_QWORD *)(v47 + 104) = v42;
    sub_21C01B3F8((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v47 + 96), v47 + 136, v47 + 144, v47 + 152);
    *(_QWORD *)(v47 + 96) = sub_21C01CA50;
    *(_QWORD *)(v47 + 104) = v43;
    sub_21C01B3F8((uint64_t (**)(uint64_t, uint64_t, uint64_t))(v47 + 96), v47 + 136, v47 + 144, v47 + 152);
    _os_log_impl(&dword_21BF33000, v45, v46, "%s: Coming Soon tip asked to refresh its status: %s", buf, v34);
    sub_21C01B43C(v23);
    sub_21C01B43C(v24);
    sub_21C01CCC8();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    v21 = 0;
LABEL_8:
    v18 = *(_QWORD *)(v47 + 232);
    v17 = *(_QWORD *)(v47 + 224);
    v14 = *(_QWORD *)(v47 + 216);
    v13 = *(_QWORD *)(v47 + 200);
    v19 = *(_QWORD *)(v47 + 192);
    v11 = *(_QWORD *)(v47 + 184);
    v10 = *(_QWORD *)(v47 + 176);
    v12 = *(_QWORD *)(v47 + 168);
    v16 = *(id *)(v47 + 160);

    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v11, v12);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v13 + 104))(v14, *MEMORY[0x24BDF62F0], v19);
    v15 = sub_21C01CC08();
    v20 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
    v20(v14, v19);
    objc_msgSend(v16, sel_setShouldShowComingSoonTip_, v15 & 1);
    objc_msgSend(v16, sel_refreshPane);
    v20(v17, v19);
    v20(v18, v19);
    *(_QWORD *)(v47 + 320) = v21;
    *(_QWORD *)(v47 + 328) = sub_21C01CC74();
    v9 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v47 + 336) = v9;
    *v9 = *(_QWORD *)(v47 + 112);
    v9[1] = sub_21C01A39C;
    return sub_21C01CCB0();
  }
  return result;
}

uint64_t sub_21C01AECC()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_21C01AF10(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(v2 + 16) = v2;
  v5 = v1[2];
  v6 = v1[3];
  v7 = v1[4];
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = *(_QWORD *)(v2 + 16);
  v3[1] = sub_21C01AFA8;
  return sub_21C01A08C(a1, v5, v6, v7);
}

uint64_t sub_21C01AFA8()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  *(_QWORD *)(*v0 + 16) = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 16) + 8))();
}

uint64_t sub_21C01B008()
{
  return sub_21C01CC2C();
}

uint64_t sub_21C01B034(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  char *v6;

  v3 = a1;
  v5 = sub_21C01CC14();
  v4 = (*(_QWORD *)(*(_QWORD *)(v5 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v3 - v4;
  (*(void (**)(void))(v1 + 16))();
  return sub_21C01CC20();
}

uint64_t sub_21C01B0B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v11;
  uint64_t v12;

  v11 = sub_21C01CC98();
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v12 + 48))(a1, 1) == 1)
  {
    sub_21C01B31C(a1);
  }
  else
  {
    sub_21C01CC8C();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a1, v11);
  }
  v6 = *(_QWORD *)(a3 + 16);
  swift_unknownObjectRetain();
  if (v6)
  {
    swift_getObjectType();
    sub_21C01CC68();
    swift_unknownObjectRelease();
  }
  v5 = (_QWORD *)swift_allocObject();
  v5[2] = a4;
  v5[3] = a2;
  v5[4] = a3;
  return swift_task_create();
}

uint64_t sub_21C01B31C(uint64_t a1)
{
  uint64_t v3;
  uint64_t v4;

  v3 = sub_21C01CC98();
  v4 = *(_QWORD *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1))
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return a1;
}

uint64_t sub_21C01B38C(uint64_t a1)
{
  if (a1)
    return sub_21C01CCE0();
  else
    return 0;
}

uint64_t sub_21C01B3E4(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_21C01B3F8(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_21C01B43C(uint64_t result)
{
  if (result)
  {
    sub_21C01CCD4();
    return sub_21C01CCC8();
  }
  return result;
}

uint64_t sub_21C01B4A8(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v2 + 16) = v2;
  v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = *(_QWORD *)(v2 + 16);
  v3[1] = sub_21C01B52C;
  return v5(a1);
}

uint64_t sub_21C01B52C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  *(_QWORD *)(*v0 + 16) = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 16) + 8))();
}

uint64_t sub_21C01B590()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21C01B5D4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int *v5;

  *(_QWORD *)(v2 + 16) = v2;
  v5 = *(int **)(v1 + 24);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = *(_QWORD *)(v2 + 16);
  v3[1] = sub_21C01B688;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_2551FC3E8 + dword_2551FC3E8))(a1, v5);
}

uint64_t sub_21C01B688()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  *(_QWORD *)(*v0 + 16) = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 16) + 8))();
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  int v2;

  v2 = *(_DWORD *)(*(_QWORD *)(a2 - 8) + 80);
  if ((v2 & 0x20000) != 0)
    return (_QWORD *)(*result + ((v2 + 16) & ~(unint64_t)v2));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 24);
  if ((*(_DWORD *)(*(_QWORD *)(v2 - 8) + 80) & 0x20000) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1);
}

uint64_t sub_21C01B7A4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(sub_21C01CC14() - 8);
  (*(void (**)(unint64_t))(v1 + 8))(v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80)));
  return swift_deallocObject();
}

uint64_t sub_21C01B814()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(sub_21C01CC14() - 8) + 80);
  return sub_21C01B034(v0 + ((v1 + 16) & ~v1));
}

unint64_t sub_21C01B844()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2551FC410;
  if (!qword_2551FC410)
  {
    v0 = MEMORY[0x220773B30](MEMORY[0x24BEE4540], MEMORY[0x24BEE44F0]);
    atomic_store(v0, (unint64_t *)&qword_2551FC410);
    return v0;
  }
  return v2;
}

unint64_t sub_21C01B8AC()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2551FC418;
  if (!qword_2551FC418)
  {
    v0 = MEMORY[0x220773B30](MEMORY[0x24BEE4518], MEMORY[0x24BEE44F0]);
    atomic_store(v0, (unint64_t *)&qword_2551FC418);
    return v0;
  }
  return v2;
}

unint64_t sub_21C01B914()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2551FC420;
  if (!qword_2551FC420)
  {
    v0 = MEMORY[0x220773B30](MEMORY[0x24BEE17B0], MEMORY[0x24BEE1768]);
    atomic_store(v0, (unint64_t *)&qword_2551FC420);
    return v0;
  }
  return v2;
}

void sub_21C01B97C()
{
  _QWORD *v0;

  *v0 = *v0;
}

uint64_t sub_21C01B988(uint64_t (*a1)(void))
{
  return a1();
}

_QWORD *sub_21C01B9A8(_QWORD *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *result;
  uint64_t v8;

  v4 = a4();
  sub_21C01BA24(v4, v5, a3);
  v8 = *a1;
  sub_21C01CCEC();
  swift_bridgeObjectRelease();
  result = a1;
  *a1 = v8 + 8;
  return result;
}

uint64_t sub_21C01BA24(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  __int16 v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v11;
  _QWORD v12[4];
  _QWORD v13[4];
  uint64_t v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;

  v14 = sub_21C01BB94((uint64_t)&v17, 0, 0, 1, a1, a2);
  v15 = v3;
  v16 = v4;
  v11 = v17;
  if (v14)
  {
    v12[3] = swift_getObjectType();
    v12[0] = v14;
    v6 = *a3;
    if (*a3)
    {
      sub_21C01CA9C((uint64_t)v12, v6);
      *a3 = v6 + 32;
    }
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  }
  else
  {
    v13[3] = MEMORY[0x24BEE2520];
    v13[0] = a1;
    v13[1] = a2;
    v7 = *a3;
    if (*a3)
    {
      sub_21C01CA9C((uint64_t)v13, v7);
      *a3 = v7 + 32;
    }
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);
  }
  return v11;
}

uint64_t sub_21C01BB94(uint64_t result, void *a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  char v13;
  char v14;
  int64_t v15;
  int64_t v16;
  _QWORD *v17;
  _QWORD v21[4];
  char v22;
  char v23;
  uint64_t v24;

  v17 = (_QWORD *)result;
  v24 = a6;
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (a2)
      {
        if (!a3)
          __break(1u);
        v16 = a3 - (_QWORD)a2;
      }
      else
      {
        v16 = 0;
      }
      v15 = (a6 & 0xF00000000000000uLL) >> 56;
      if (v15 < v16)
      {
        if (a2)
        {
          v21[0] = a5;
          v21[1] = a6 & (-(uint64_t)bswap64(0xFFuLL) - 1);
          sub_21C01BF08(v21, v15, a2);
          sub_21C01CCF8();
          *v17 = a2;
          v11 = 0;
          v12 = v15;
          v13 = 1;
          v14 = 0;
LABEL_26:
          v21[2] = v11;
          v21[3] = v12;
          v22 = v13 & 1;
          v23 = v14 & 1;
          return (uint64_t)v11;
        }
        goto LABEL_28;
      }
    }
LABEL_13:
    v6 = sub_21C01BF44(a5, a6);
    *v17 = v7;
    v11 = v6;
    v12 = v8;
    v13 = 0;
    v14 = 1;
    goto LABEL_26;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    if ((a6 & 0xFFFFFFFFFFFFFFFLL) != 0xFFFFFFFFFFFFFFE0)
    {
      v10 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
      goto LABEL_21;
    }
    __break(1u);
  }
  result = sub_21C01CD1C();
  if (!result)
    goto LABEL_29;
  v10 = result;
LABEL_21:
  *v17 = v10;
  if (a6 < 0)
  {
    v9 = 0;
LABEL_25:
    v11 = (_QWORD *)v9;
    v12 = a5 & 0xFFFFFFFFFFFFLL;
    v13 = 0;
    v14 = 0;
    goto LABEL_26;
  }
  if ((a6 & 0xFFFFFFFFFFFFFFFLL) != 0)
  {
    swift_unknownObjectRetain();
    v9 = a6 & 0xFFFFFFFFFFFFFFFLL;
    goto LABEL_25;
  }
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
  return result;
}

void *sub_21C01BF08(const void *a1, size_t a2, void *__dst)
{
  memcpy(__dst, a1, a2);
  return __dst;
}

_QWORD *sub_21C01BF44(uint64_t a1, uint64_t a2)
{
  _QWORD *result;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v6 = sub_21C01BFF4(a1, a2);
  sub_21C01C16C();
  v4 = v6[2];
  sub_21C01C1E0(v4);
  sub_21C01C260(v4, 0);
  sub_21C01C2CC();
  swift_retain();
  v5 = sub_21C01C2D8((uint64_t)v6);
  swift_bridgeObjectRelease();
  result = (_QWORD *)v5;
  if (!__OFSUB__(v5, 1))
    return v6;
  __break(1u);
  return result;
}

_QWORD *sub_21C01BFF4(uint64_t a1, uint64_t a2)
{
  _QWORD *result;
  char v3;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD v8[3];

  v8[2] = a2;
  if ((a2 & 0x1000000000000000) != 0)
  {
    v7 = sub_21C01CC38();
  }
  else if ((a2 & 0x2000000000000000) != 0)
  {
    v7 = (a2 & 0xF00000000000000uLL) >> 56;
  }
  else
  {
    v7 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v7)
    return (_QWORD *)sub_21C01C454();
  v5 = sub_21C01C2EC(v7, 0);
  swift_retain();
  swift_release();
  result = (_QWORD *)sub_21C01CD10();
  v6 = result;
  if ((v3 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRetain();
    result = v8;
    v8[0] = 0;
    v8[1] = 0xE000000000000000;
    sub_21C01CB10();
    if (v6 == (_QWORD *)v7)
      return v5;
  }
  __break(1u);
  return result;
}

uint64_t sub_21C01C16C()
{
  uint64_t *v0;
  uint64_t result;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;

  v4 = *v0;
  result = swift_isUniquelyReferenced_nonNull_native();
  *v0 = v4;
  if ((result & 1) == 0)
  {
    v2 = sub_21C01C2D8(*v3);
    result = sub_21C01C480(0, v2 + 1, 1, *v3);
    *v3 = result;
  }
  return result;
}

uint64_t sub_21C01C1E0(uint64_t result)
{
  uint64_t v1;
  uint64_t *v2;

  if (*(_QWORD *)(*(_QWORD *)v1 + 24) >> 1 < result + 1)
  {
    result = sub_21C01C480(*(_QWORD *)(*(_QWORD *)v1 + 24) >> 1 != 0, result + 1, 1, *v2);
    *v2 = result;
  }
  return result;
}

uint64_t sub_21C01C260(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v5 = a1 + 1;
  v4 = *v2;
  swift_bridgeObjectRetain();
  *(_QWORD *)(v4 + 16) = v5;
  swift_release();
  v6 = *v2;
  swift_retain();
  *(_BYTE *)(v6 + 32 + a1) = a2;
  return swift_release();
}

void sub_21C01C2CC()
{
  _QWORD *v0;

  *v0 = *v0;
}

uint64_t sub_21C01C2D8(uint64_t a1)
{
  return sub_21C01C77C(a1);
}

_QWORD *sub_21C01C2EC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  size_t v4;
  _QWORD *v6;
  uint64_t v7;

  if (a2 < a1)
    v7 = a1;
  else
    v7 = a2;
  if (v7)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2551FC438);
    v6 = (_QWORD *)swift_allocObject();
    if ((_swift_stdlib_has_malloc_size() & 1) != 0)
    {
      v4 = (size_t)v6 + _swift_stdlib_malloc_size(v6);
      swift_retain();
      v6[2] = a1;
      v6[3] = 2 * (v4 - (_QWORD)(v6 + 4));
    }
    else
    {
      swift_retain();
      v6[2] = a1;
      v6[3] = 2 * v7;
    }
    swift_release();
    return v6;
  }
  else
  {
    v3 = MEMORY[0x24BEE4AF8];
    swift_retain();
    return (_QWORD *)v3;
  }
}

uint64_t sub_21C01C454()
{
  uint64_t v1;

  v1 = MEMORY[0x24BEE4AF8];
  swift_retain();
  return v1;
}

uint64_t sub_21C01C480(char a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t result;
  char *v5;
  size_t v6;
  char *v7;
  _QWORD *v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v16;

  swift_retain();
  result = swift_retain();
  v16 = *(_QWORD *)(a4 + 24) >> 1;
  if ((a3 & 1) != 0)
  {
    if (v16 < a2)
    {
      if ((unsigned __int128)(v16 * (__int128)2) >> 64 != (2 * v16) >> 63)
      {
        __break(1u);
        return result;
      }
      if (2 * v16 < a2)
        v11 = a2;
      else
        v11 = 2 * v16;
    }
    else
    {
      v11 = *(_QWORD *)(a4 + 24) >> 1;
    }
  }
  else
  {
    v11 = a2;
  }
  v10 = *(_QWORD *)(a4 + 16);
  if (v11 < v10)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v11;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2551FC438);
    v8 = (_QWORD *)swift_allocObject();
    if ((_swift_stdlib_has_malloc_size() & 1) != 0)
    {
      v6 = (size_t)v8 + _swift_stdlib_malloc_size(v8);
      swift_retain();
      v8[2] = v10;
      v8[3] = 2 * (v6 - (_QWORD)(v8 + 4));
    }
    else
    {
      swift_retain();
      v8[2] = v10;
      v8[3] = 2 * v9;
    }
    swift_release();
    v7 = (char *)v8;
  }
  else
  {
    v5 = (char *)MEMORY[0x24BEE4AF8];
    swift_retain();
    v7 = v5;
  }
  if ((a1 & 1) != 0)
  {
    swift_release();
    swift_bridgeObjectRelease();
    sub_21C01C7B8((char *)(a4 + 32), v10, v7 + 32);
    *(_QWORD *)(a4 + 16) = 0;
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_release();
    swift_retain();
    swift_release();
    sub_21C01C784((const void *)(a4 + 32), v10, v7 + 32);
    swift_unknownObjectRelease();
  }
  return (uint64_t)v7;
}

uint64_t sub_21C01C77C(uint64_t a1)
{
  return *(_QWORD *)(a1 + 16);
}

void *sub_21C01C784(const void *a1, size_t a2, void *__dst)
{
  return memcpy(__dst, a1, a2);
}

char *sub_21C01C7B8(char *result, size_t a2, char *a3)
{
  if (a3 < result || a3 >= &result[a2] || a3 != result)
    return (char *)memmove(a3, result, a2);
  return result;
}

_BYTE **sub_21C01C868(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

uint64_t sub_21C01C87C()
{
  return swift_deallocObject();
}

_BYTE **sub_21C01C8A4(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_21C01C868(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_21C01C8AC()
{
  return swift_deallocObject();
}

_BYTE **sub_21C01C8D4(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_21C01C868(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_21C01C8DC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21C01C918()
{
  uint64_t v0;

  return sub_21C01B988(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_21C01C924()
{
  swift_release();
  return swift_deallocObject();
}

_QWORD *sub_21C01C960(_QWORD *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  return sub_21C01B9A8(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_21C01C96C()
{
  return swift_deallocObject();
}

_BYTE **sub_21C01C994(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_21C01C868(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_21C01C99C()
{
  return swift_deallocObject();
}

_BYTE **sub_21C01C9C4(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_21C01C868(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_21C01C9CC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21C01CA08()
{
  uint64_t v0;

  return sub_21C01B988(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_21C01CA14()
{
  swift_release();
  return swift_deallocObject();
}

_QWORD *sub_21C01CA50(_QWORD *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  return sub_21C01B9A8(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_21C01CA5C()
{
  sub_21C01CC50();
  sub_21C01B97C();
}

uint64_t sub_21C01CA9C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v2;
  (**(void (***)(uint64_t))(v2 - 8))(a2);
  return a2;
}

uint64_t _swift_stdlib_has_malloc_size()
{
  return 1;
}

size_t _swift_stdlib_malloc_size(const void *a1)
{
  return malloc_size(a1);
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_21C01CB10()
{
  swift_bridgeObjectRelease();
}

uint64_t __swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t *v5;

  v5 = a2;
  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v2 = swift_slowAlloc();
    *a2 = v2;
    return v2;
  }
  return (uint64_t)v5;
}

uint64_t sub_21C01CBA8()
{
  return MEMORY[0x24BEE5B78]();
}

uint64_t sub_21C01CBB4()
{
  return MEMORY[0x24BEE5B80]();
}

uint64_t sub_21C01CBC0()
{
  return MEMORY[0x24BEAEEF8]();
}

uint64_t sub_21C01CBCC()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_21C01CBD8()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_21C01CBE4()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_21C01CBF0()
{
  return MEMORY[0x24BDF60A0]();
}

uint64_t sub_21C01CBFC()
{
  return MEMORY[0x24BDF60D0]();
}

uint64_t sub_21C01CC08()
{
  return MEMORY[0x24BDF62E8]();
}

uint64_t sub_21C01CC14()
{
  return MEMORY[0x24BDF62F8]();
}

uint64_t sub_21C01CC20()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_21C01CC2C()
{
  return MEMORY[0x24BEE0AF8]();
}

uint64_t sub_21C01CC38()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_21C01CC44()
{
  return MEMORY[0x24BEE0F48]();
}

uint64_t sub_21C01CC50()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_21C01CC5C()
{
  return MEMORY[0x24BDCFC08]();
}

uint64_t sub_21C01CC68()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_21C01CC74()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_21C01CC80()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_21C01CC8C()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_21C01CC98()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_21C01CCA4()
{
  return MEMORY[0x24BEE6A50]();
}

uint64_t sub_21C01CCB0()
{
  return MEMORY[0x24BEE6A58]();
}

uint64_t sub_21C01CCBC()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_21C01CCC8()
{
  return MEMORY[0x24BEE1BE0]();
}

uint64_t sub_21C01CCD4()
{
  return MEMORY[0x24BEE1C00]();
}

uint64_t sub_21C01CCE0()
{
  return MEMORY[0x24BEE1C20]();
}

uint64_t sub_21C01CCEC()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_21C01CCF8()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_21C01CD04()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_21C01CD10()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_21C01CD1C()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_21C01CD28()
{
  return MEMORY[0x24BEE3A18]();
}

uint64_t LICreateIconForImage()
{
  return MEMORY[0x24BE67100]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x24BDD1250](proto);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x24BDD1258](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

uint64_t PSIsDataRoamingEnabled()
{
  return MEMORY[0x24BE85708]();
}

uint64_t PSIsRunningInAssistant()
{
  return MEMORY[0x24BE75B30]();
}

uint64_t PSSetBatteryMonitoringEnabled()
{
  return MEMORY[0x24BE75C58]();
}

uint64_t SBGetApplicationNetworkFlags()
{
  return MEMORY[0x24BEB0B70]();
}

uint64_t SBSSpringBoardServerPort()
{
  return MEMORY[0x24BEB0D48]();
}

uint64_t SBSetApplicationNetworkFlags()
{
  return MEMORY[0x24BEB0DD0]();
}

uint64_t SFLocalizableWAPIStringKeyForKey()
{
  return MEMORY[0x24BE85770]();
}

uint64_t SULogInfo()
{
  return MEMORY[0x24BEAEDA0]();
}

uint64_t SURequiredBatteryLevelForInstallForDescriptor()
{
  return MEMORY[0x24BEAEDA8]();
}

uint64_t SURequiredBatteryLevelForInstallation()
{
  return MEMORY[0x24BEAEDB0]();
}

uint64_t SUStringFromAgreementStatus()
{
  return MEMORY[0x24BEAEDB8]();
}

uint64_t SUStringFromMDMSUPath()
{
  return MEMORY[0x24BEAEDC0]();
}

uint64_t SUStringFromNetworkType()
{
  return MEMORY[0x24BEAEDC8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _CFCopySupplementalVersionDictionary()
{
  return MEMORY[0x24BDBCFA8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCB8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCE0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x24BEDD080](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x24BEDD3C0](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x24BDAF4D0]();
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x24BDAFEB0](a1, a2);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x24BEE7230]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x24BEE7238]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

