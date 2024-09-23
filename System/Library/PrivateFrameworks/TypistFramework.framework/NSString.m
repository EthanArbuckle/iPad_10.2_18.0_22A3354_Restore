@implementation NSString

void __64__NSString_TYTextDirectionAnnotations__textDirectionAnnotations__block_invoke(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _UNKNOWN **v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  int v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;

  objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a2, a3);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  v10 = 0x24BDD1000;
  v11 = &off_251A7C000;
  v12 = a2 - v9;
  v35 = (id)v8;
  if (a2 > v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v9, a2 - v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "processString:", v13);
    v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    objc_msgSend(*(id *)(a1 + 40), "reset");
    objc_msgSend(*(id *)(a1 + 40), "processString:", v35);
    v15 = (void *)MEMORY[0x24BDBCEA0];
    objc_msgSend(*(id *)(a1 + 40), "dominantLanguage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "characterDirectionForLanguage:", v16);

    if (v14)
      v17 = v14;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24)
      && (v18 = *(void **)(a1 + 48),
          objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", v13),
          v19 = (void *)objc_claimAutoreleasedReturnValue(),
          LODWORD(v18) = objc_msgSend(v18, "isSupersetOfSet:", v19),
          v19,
          (_DWORD)v18))
    {
      objc_msgSend(*(id *)(a1 + 56), "lastObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "range");
      objc_msgSend(v20, "range");
      objc_msgSend(v20, "setRange:", v21, v22 + v12);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = a2;
      v11 = &off_251A7C000;
    }
    else
    {
      v11 = &off_251A7C000;
      +[TYTextDirectionAnnotation initWithRange:textDirection:](TYTextDirectionAnnotation, "initWithRange:textDirection:", v9, a2 - v9, v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "addObject:", v20);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
    }

    objc_msgSend(*(id *)(a1 + 40), "reset");
    v8 = (uint64_t)v35;
    v10 = 0x24BDD1000uLL;
  }
  objc_msgSend(*(id *)(a1 + 40), "processString:", v8);
  objc_msgSend(*(id *)(a1 + 40), "dominantLanguage");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(MEMORY[0x24BDBCEA0], "characterDirectionForLanguage:", v23);
  v25 = v24;
  v26 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  if (!*(_QWORD *)(v26 + 24))
    *(_QWORD *)(v26 + 24) = v24;
  objc_msgSend(*(id *)(v10 + 1192), "characterSetWithCharactersInString:", v35);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v10 + 1192), "decimalDigitCharacterSet");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "isSupersetOfSet:", v27);

  v30 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  if (a4 != 1 && !v29)
  {
    *(_BYTE *)(v30 + 24) = 0;
LABEL_20:
    objc_msgSend(v11[33], "initWithRange:textDirection:", a2, a3, v25);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v31);
    goto LABEL_21;
  }
  if (!*(_BYTE *)(v30 + 24))
  {
    if (!a2 && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) == 2)
    {
      objc_msgSend(v11[33], "initWithRange:textDirection:", 0, 0, 2);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "addObject:", v34);

      v30 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    }
    v25 = 1;
    *(_BYTE *)(v30 + 24) = 1;
    goto LABEL_20;
  }
  objc_msgSend(*(id *)(a1 + 56), "lastObject");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "range");
  objc_msgSend(v31, "range");
  objc_msgSend(v31, "setRange:", v32, v33 + a3);
LABEL_21:
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = a2 + a3;
  objc_msgSend(*(id *)(a1 + 40), "reset");

}

uint64_t __35__NSString_Grapheme__graphemeCount__block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

void __38__NSString_Grapheme__graphemeAtIndex___block_invoke(_QWORD *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v7 = *(_QWORD *)(a1[4] + 8);
  v8 = *(_QWORD *)(v7 + 24);
  if (v8 == a1[6])
  {
    v11 = objc_msgSend(a2, "copy");
    v12 = *(_QWORD *)(a1[5] + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    *a7 = 1;
    v7 = *(_QWORD *)(a1[4] + 8);
    v8 = *(_QWORD *)(v7 + 24);
  }
  *(_QWORD *)(v7 + 24) = v8 + 1;
}

void __35__NSString_Grapheme__graphemeArray__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = (id)objc_msgSend(a2, "copy");
  objc_msgSend(v2, "addObject:", v3);

}

void __63__NSString_ArabicFormConverter__combinedArabicCharacterFormMap__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  _QWORD v11[5];

  v11[4] = *MEMORY[0x24BDAC8D0];
  if (!combinedArabicCharacterFormMap_combinedArabicCharacterFormMap)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%C%C"), 1604, 1570);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v9;
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFEF5u, 0, 0, 65270));
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v0;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%C%C"), 1604, 1571);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v10[1] = v1;
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFEF7u, 0, 0, 65272));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v2;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%C%C"), 1604, 1573);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2] = v3;
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFEF9u, 0, 0, 65274));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2] = v4;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%C%C"), 1604, 1575);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[3] = v5;
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFEFBu, 0, 0, 65276));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[3] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)combinedArabicCharacterFormMap_combinedArabicCharacterFormMap;
    combinedArabicCharacterFormMap_combinedArabicCharacterFormMap = v7;

  }
}

void __70__NSString_ArabicFormConverter__arabicNonPresentationFormCharacterSet__block_invoke()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1690], "characterSetWithRange:", 1569, 25);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addCharactersInRange:", 1600, 10);
  v1 = (void *)arabicNonPresentationFormCharacterSet_arabicNonPresentationFormCharacterSet;
  arabicNonPresentationFormCharacterSet_arabicNonPresentationFormCharacterSet = (uint64_t)v0;

}

void __55__NSString_ArabicFormConverter__arabicCharacterFormMap__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[37];
  _QWORD v40[39];

  v40[37] = *MEMORY[0x24BDAC8D0];
  v39[0] = &unk_251A95210;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFE80u, 0, 0, 0));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v38;
  v39[1] = &unk_251A95228;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFE81u, 0, 0, 65154));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v37;
  v39[2] = &unk_251A95240;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFE83u, 0, 0, 65156));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v40[2] = v36;
  v39[3] = &unk_251A95258;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFE85u, 0, 0, 65158));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v40[3] = v35;
  v39[4] = &unk_251A95270;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFE87u, 0, 0, 65160));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v40[4] = v34;
  v39[5] = &unk_251A95288;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFE89u, 0xFE8Bu, 65164, 65162));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v40[5] = v33;
  v39[6] = &unk_251A952A0;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFE8Du, 0, 0, 65166));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v40[6] = v32;
  v39[7] = &unk_251A952B8;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFE8Fu, 0xFE91u, 65170, 65168));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v40[7] = v31;
  v39[8] = &unk_251A952D0;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFE93u, 0, 0, 65172));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v40[8] = v30;
  v39[9] = &unk_251A952E8;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFE95u, 0xFE97u, 65176, 65174));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v40[9] = v29;
  v39[10] = &unk_251A95300;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFE99u, 0xFE9Bu, 65180, 65178));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v40[10] = v28;
  v39[11] = &unk_251A95318;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFE9Du, 0xFE9Fu, 65184, 65182));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v40[11] = v27;
  v39[12] = &unk_251A95330;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFEA1u, 0xFEA3u, 65188, 65186));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v40[12] = v26;
  v39[13] = &unk_251A95348;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFEA5u, 0xFEA7u, 65192, 65190));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v40[13] = v25;
  v39[14] = &unk_251A95360;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFEA9u, 0, 0, 65194));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v40[14] = v24;
  v39[15] = &unk_251A95378;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFEABu, 0, 0, 65196));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v40[15] = v23;
  v39[16] = &unk_251A95390;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFEADu, 0, 0, 65198));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v40[16] = v22;
  v39[17] = &unk_251A953A8;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFEAFu, 0, 0, 65200));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v40[17] = v21;
  v39[18] = &unk_251A953C0;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFEB1u, 0xFEB3u, 65204, 65202));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v40[18] = v20;
  v39[19] = &unk_251A953D8;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFEB5u, 0xFEB7u, 65208, 65206));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v40[19] = v19;
  v39[20] = &unk_251A953F0;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFEB9u, 0xFEBBu, 65212, 65210));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v40[20] = v18;
  v39[21] = &unk_251A95408;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFEBDu, 0xFEBFu, 65216, 65214));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v40[21] = v17;
  v39[22] = &unk_251A95420;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFEC1u, 0xFEC3u, 65220, 65218));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v40[22] = v16;
  v39[23] = &unk_251A95438;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFEC5u, 0xFEC7u, 65224, 65222));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v40[23] = v15;
  v39[24] = &unk_251A95450;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFEC9u, 0xFECBu, 65228, 65226));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v40[24] = v14;
  v39[25] = &unk_251A95468;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFECDu, 0xFECFu, 65232, 65230));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v40[25] = v13;
  v39[26] = &unk_251A95480;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0x640u, 0, 0, 0));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v40[26] = v12;
  v39[27] = &unk_251A95498;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFED1u, 0xFED3u, 65236, 65234));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v40[27] = v0;
  v39[28] = &unk_251A954B0;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFED5u, 0xFED7u, 65240, 65238));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v40[28] = v1;
  v39[29] = &unk_251A954C8;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFED9u, 0xFEDBu, 65244, 65242));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v40[29] = v2;
  v39[30] = &unk_251A954E0;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFEDDu, 0xFEDFu, 65248, 65246));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v40[30] = v3;
  v39[31] = &unk_251A954F8;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFEE1u, 0xFEE3u, 65252, 65250));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v40[31] = v4;
  v39[32] = &unk_251A95510;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFEE5u, 0xFEE7u, 65256, 65254));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v40[32] = v5;
  v39[33] = &unk_251A95528;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFEE9u, 0xFEEBu, 65260, 65258));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v40[33] = v6;
  v39[34] = &unk_251A95540;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFEEDu, 0, 0, 65262));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v40[34] = v7;
  v39[35] = &unk_251A95558;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFEEFu, 0, 0, 65264));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v40[35] = v8;
  v39[36] = &unk_251A95570;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithTYArabicCharacter:", TYMakeArabicCharacter(0xFEF1u, 0xFEF3u, 65268, 65266));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v40[36] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, v39, 37);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)arabicCharacterFormMap_arabicCharacterFormMap;
  arabicCharacterFormMap_arabicCharacterFormMap = v10;

}

void __60__NSString_ArabicFormConverter__arabicDiacriticCharacterSet__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;

  v0 = (void *)MEMORY[0x24BDD14A8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C"), 1552, 1554, 1555, 1556, 1557, 1611, 1612, 1613, 1614, 1615, 1616, 1617, 1618, 1619, 1620, 1621,
    1622,
    1623,
    1624,
    1648,
    1750,
    1751,
    1752,
    1753,
    1754,
    1755,
    1756,
    1759,
    1760,
    1761,
    1762,
    1763,
    1764,
    1767,
    1768,
    1770,
    1771,
    1772,
    1773);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "characterSetWithCharactersInString:", v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)arabicDiacriticCharacterSet_arabicDiacriticCharacterSet;
  arabicDiacriticCharacterSet_arabicDiacriticCharacterSet = v1;

}

void __61__NSString_ArabicFormConverter__arabicFinalFormsCharacterSet__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;

  v0 = (void *)MEMORY[0x24BDD14A8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C%C"), 65166, 65168, 65174, 65178, 65182, 65186, 65190, 65194, 65196, 65198, 65200, 65202, 65206, 65210, 65214, 65218,
    65222,
    65226,
    65230,
    65234,
    65238,
    65242,
    65246,
    65250,
    65254,
    65258,
    65262,
    65266,
    65154,
    65172,
    65264,
    65276);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "characterSetWithCharactersInString:", v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)arabicFinalFormsCharacterSet_arabicFinalFormsCharacterSet;
  arabicFinalFormsCharacterSet_arabicFinalFormsCharacterSet = v1;

}

@end
