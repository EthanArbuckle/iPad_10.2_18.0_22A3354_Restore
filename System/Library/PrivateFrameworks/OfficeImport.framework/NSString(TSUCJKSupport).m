@implementation NSString(TSUCJKSupport)

- (BOOL)tsu_isCJKString
{
  void *v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  char *v7;
  BOOL v8;
  unint64_t i;
  unsigned int v10;
  int16x8_t v11;
  int16x4_t v12;
  char v13;
  BOOL v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  if (!objc_msgSend(a1, "length"))
    return 0;
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByTrimmingCharactersInSet:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "length");
  if (!v4)
  {

    return 0;
  }
  v5 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v17 - ((v6 + 17) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(v3, "getCharacters:range:", v7, 0, v5);
  v8 = 0;
  for (i = 0; i != v5; v8 = i >= v5)
  {
    v10 = *(unsigned __int16 *)&v7[2 * i];
    v11 = vdupq_n_s16(v10);
    v12 = (int16x4_t)vand_s8(*(int8x8_t *)v11.i8, (int8x8_t)0xFFF0FFC0FF00FF80);
    v13 = vmaxv_u8((uint8x8_t)vmovn_s16((int16x8_t)vcgtq_u16((uint16x8_t)xmmword_22A4BD020, (uint16x8_t)vaddq_s16(v11, (int16x8_t)xmmword_22A4BD010)))) | vmaxv_u16((uint16x4_t)vceq_s16(v12, (int16x4_t)0x3190300011002E80));
    v15 = (unsigned __int16)v10 >> 5 == 397 || (v12.i16[1] & 0xFF00) == 12800;
    if (!(v13 & 1 | ((unsigned __int16)(v10 + 464) < 0x20u || v15)) && v12.u16[1] != 13056)
      break;
    ++i;
  }

  return v8;
}

@end
