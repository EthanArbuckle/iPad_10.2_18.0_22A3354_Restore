@implementation VUIMLUtilities

+ (int64_t)gridStyleForCSSStyle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int64_t v6;

  v3 = a3;
  if (gridStyleForCSSStyle__onceToken != -1)
    dispatch_once(&gridStyleForCSSStyle__onceToken, &__block_literal_global_135);
  objc_msgSend((id)gridStyleForCSSStyle__sGridStyleMap, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend((id)gridStyleForCSSStyle__sGridStyleMap, "objectForKeyedSubscript:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "integerValue");

  }
  else
  {
    v6 = -1;
  }

  return v6;
}

void __39__VUIMLUtilities_gridStyleForCSSStyle___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[14];
  _QWORD v3[15];

  v3[14] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("a");
  v2[1] = CFSTR("aa");
  v3[0] = &unk_1EA0B9EF8;
  v3[1] = &unk_1EA0B9F10;
  v2[2] = CFSTR("b");
  v2[3] = CFSTR("c");
  v3[2] = &unk_1EA0B9F28;
  v3[3] = &unk_1EA0B9F40;
  v2[4] = CFSTR("d");
  v2[5] = CFSTR("dd");
  v3[4] = &unk_1EA0B9F58;
  v3[5] = &unk_1EA0B9F70;
  v2[6] = CFSTR("e");
  v2[7] = CFSTR("f");
  v3[6] = &unk_1EA0B9F88;
  v3[7] = &unk_1EA0B9FA0;
  v2[8] = CFSTR("k");
  v2[9] = CFSTR("oc");
  v3[8] = &unk_1EA0B9FB8;
  v3[9] = &unk_1EA0B9FD0;
  v2[10] = CFSTR("tm");
  v2[11] = CFSTR("full");
  v3[10] = &unk_1EA0B9FE8;
  v3[11] = &unk_1EA0BA000;
  v2[12] = CFSTR("edgeToEdge");
  v2[13] = CFSTR("split");
  v3[12] = &unk_1EA0BA018;
  v3[13] = &unk_1EA0BA030;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 14);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)gridStyleForCSSStyle__sGridStyleMap;
  gridStyleForCSSStyle__sGridStyleMap = v0;

}

+ (int64_t)gridStyleConsideringAX:(int64_t)a3
{
  int64_t v4;

  if (objc_msgSend(MEMORY[0x1E0DC6960], "isAXLargeEnabled:", 0))
  {
    v4 = a3 - 3;
    if ((unint64_t)(a3 - 3) <= 5 && ((0x37u >> v4) & 1) != 0)
      return qword_1DA1C2818[v4];
  }
  return a3;
}

@end
