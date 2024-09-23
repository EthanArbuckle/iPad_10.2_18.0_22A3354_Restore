id RKLinguisticCategoryToPreferenceKey(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  keyToCategoryMap();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeysForObject:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "count") == 1)
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id keyToCategoryMap()
{
  if (keyToCategoryMap_onceToken != -1)
    dispatch_once(&keyToCategoryMap_onceToken, &__block_literal_global_0);
  return (id)keyToCategoryMap_sKeyToCategoryMap;
}

__CFString *RKLinguisticCategoryForFSMType(void *a1)
{
  id v1;
  uint64_t v2;
  __CFString *v3;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("xCONGRATULATIONx")) & 1) != 0)
  {
    v2 = 37;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("xNEWYEARx")) & 1) != 0)
  {
    v2 = 39;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("xBIRTHDAYx")) & 1) != 0)
  {
    v2 = 38;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("xTHINKING_OF_YOUx")) & 1) != 0)
  {
    v2 = 41;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("xCHINESENEWYEARx")) & 1) != 0)
  {
    v2 = 40;
  }
  else
  {
    if (!objc_msgSend(v1, "isEqualToString:", CFSTR("xSHOOTINGSTARx")))
    {
      v3 = CFSTR("Unknown");
      goto LABEL_14;
    }
    v2 = 42;
  }
  RKLinguisticCategoryToPreferenceKey(v2);
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_14:

  return v3;
}

uint64_t RKLinguisticCategoryFromPreferenceKey(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;

  v1 = a1;
  keyToCategoryMap();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "unsignedIntegerValue");
  else
    v4 = -1;

  return v4;
}

void __keyToCategoryMap_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t i;
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
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _QWORD v52[46];
  _QWORD v53[48];

  v53[46] = *MEMORY[0x24BDAC8D0];
  v52[0] = CFSTR("Unknown");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v51;
  v52[1] = CFSTR("QueryGeneral");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 1);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v53[1] = v50;
  v52[2] = CFSTR("QueryPolar");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 2);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v53[2] = v49;
  v52[3] = CFSTR("QueryPolarDefinite");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 3);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v53[3] = v48;
  v52[4] = CFSTR("QueryPolarRequest");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 4);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v53[4] = v47;
  v52[5] = CFSTR("QueryTagged");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 5);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v53[5] = v46;
  v52[6] = CFSTR("QueryAlternative");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 6);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v53[6] = v45;
  v52[7] = CFSTR("QueryPerson");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 7);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v53[7] = v44;
  v52[8] = CFSTR("QueryObject");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 8);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v53[8] = v43;
  v52[9] = CFSTR("QueryPersonOrObject");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 9);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v53[9] = v42;
  v52[10] = CFSTR("QueryPosessive");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 10);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v53[10] = v41;
  v52[11] = CFSTR("QueryLocation");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 11);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v53[11] = v40;
  v52[12] = CFSTR("QueryLocationSelf");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 12);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v53[12] = v39;
  v52[13] = CFSTR("QueryEvaluation");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 13);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v53[13] = v38;
  v52[14] = CFSTR("QueryEvaluationState");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 14);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v53[14] = v37;
  v52[15] = CFSTR("QueryReason");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 15);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v53[15] = v36;
  v52[16] = CFSTR("QueryDistance");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 16);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v53[16] = v35;
  v52[17] = CFSTR("QueryDimension");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 17);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v53[17] = v34;
  v52[18] = CFSTR("QueryCountable");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 18);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v53[18] = v33;
  v52[19] = CFSTR("QueryUncountable");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 19);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v53[19] = v32;
  v52[20] = CFSTR("QueryQuantity");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 20);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v53[20] = v31;
  v52[21] = CFSTR("QueryTime");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 21);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v53[21] = v30;
  v52[22] = CFSTR("QueryTimePast");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 22);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v53[22] = v29;
  v52[23] = CFSTR("QueryTimeFuture");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 23);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v53[23] = v28;
  v52[24] = CFSTR("QueryTimeOfDay");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 24);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v53[24] = v27;
  v52[25] = CFSTR("QueryDay");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v53[25] = v26;
  v52[26] = CFSTR("QueryMonth");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v53[26] = v25;
  v52[27] = CFSTR("QueryYear");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 27);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v53[27] = v24;
  v52[28] = CFSTR("QueryDuration");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 28);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v53[28] = v23;
  v52[29] = CFSTR("QueryFrequency");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 29);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v53[29] = v22;
  v52[30] = CFSTR("QueryAge");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 30);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v53[30] = v21;
  v52[31] = CFSTR("StatementGeneral");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 31);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v53[31] = v20;
  v52[32] = CFSTR("StatementGreeting");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 32);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v53[32] = v19;
  v52[33] = CFSTR("StatementImperative");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 33);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v53[33] = v18;
  v52[34] = CFSTR("StatementAppreciation");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 34);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v53[34] = v17;
  v52[35] = CFSTR("StatementApology");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 35);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v53[35] = v16;
  v52[36] = CFSTR("FixedPhrase");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 36);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v53[36] = v15;
  v52[37] = CFSTR("StatementCongratulation");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 37);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v53[37] = v14;
  v52[38] = CFSTR("StatementBirthday");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 38);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v53[38] = v0;
  v52[39] = CFSTR("StatementNewYear");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 39);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v53[39] = v1;
  v52[40] = CFSTR("StatementChineseNewYear");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 40);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v53[40] = v2;
  v52[41] = CFSTR("StatementThinkingOfYou");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 41);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v53[41] = v3;
  v52[42] = CFSTR("StatementShootingStar");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 42);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v53[42] = v4;
  v52[43] = CFSTR("QueryProactive");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 43);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v53[43] = v5;
  v52[44] = CFSTR("StatementPayment");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 44);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v53[44] = v6;
  v52[45] = CFSTR("QueryPhotoSharing");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 45);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v53[45] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v53, v52, 46);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)keyToCategoryMap_sKeyToCategoryMap;
  keyToCategoryMap_sKeyToCategoryMap = v8;

  for (i = 0; i != 46; ++i)
  {
    v11 = (void *)keyToCategoryMap_sKeyToCategoryMap;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", i);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allKeysForObject:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
}

void sub_20D3C1920(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D3C1E88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

id _languageCodeForIdentifier(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x24BDBCEA0], "componentsFromLocaleIdentifier:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", *MEMORY[0x24BDBCB20]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id _regExPatternFromKeywords(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v1 = a1;
  v2 = (void *)MEMORY[0x212BA17B8]();
  objc_msgSend(MEMORY[0x24BDD1798], "escapedPatternForString:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("\\s+"), CFSTR(" \\\\s+ "), 1024, 0, objc_msgSend(v3, "length"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v2);
  return v6;
}

void sub_20D3C7014(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x218], 8);
  _Block_object_dispose(&STACK[0x2A8], 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_20D3C7724(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D3C7DA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

NSUInteger NSSubtractRange(NSRange a1, NSRange a2)
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v4;
  NSUInteger v5;
  NSRange v6;
  uint64_t v7;
  NSRange v9;
  NSRange v10;

  length = a2.length;
  location = a2.location;
  v4 = a1.length;
  v5 = a1.location;
  if (NSIntersectionRange(a1, a2).length)
  {
    v9.location = v5;
    v9.length = v4;
    v10.location = location;
    v10.length = length;
    v6 = NSIntersectionRange(v9, v10);
    if (v6.location != v5 || v6.length != v4)
    {
      if (v5 + v4 <= location + length)
        v7 = v5;
      else
        v7 = 0x7FFFFFFFFFFFFFFFLL;
      if (location > v5)
        return v7;
      else
        return location + length;
    }
  }
  return v5;
}

void sub_20D3CB84C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  uint64_t v34;

  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 168), 8);
  _Block_object_dispose((const void *)(v34 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_20D3CBF7C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_20D3CCF1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_20D3CD938(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D3D0074(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_20D3D0480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D3D1DF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void sub_20D3D2424(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void sub_20D3D620C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D3D9098(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_20D3D9220(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object)
{
  void *v9;
  void *v10;

  _Unwind_Resume(a1);
}

void sub_20D3D9498(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)RKMontrealModel;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_20D3D9640(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  void *v20;
  void *v21;
  void *v22;

  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void sub_20D3D9754(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_20D3D98AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20D3D99B4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_20D3D9D88(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_20D3DA860(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *__p,uint64_t a29)
{
  void *v29;

  if (__p)
    operator delete(__p);
  objc_sync_exit(v29);

  _Unwind_Resume(a1);
}

uint64_t *std::map<int,int>::at(uint64_t a1, int *a2)
{
  uint64_t *v2;
  int v3;
  int v4;

  v2 = *(uint64_t **)(a1 + 8);
  if (!v2)
LABEL_8:
    std::__throw_out_of_range[abi:ne180100]("map::at:  key not found");
  v3 = *a2;
  while (1)
  {
    while (1)
    {
      v4 = *((_DWORD *)v2 + 7);
      if (v3 >= v4)
        break;
      v2 = (uint64_t *)*v2;
      if (!v2)
        goto LABEL_8;
    }
    if (v4 >= v3)
      return v2 + 4;
    v2 = (uint64_t *)v2[1];
    if (!v2)
      goto LABEL_8;
  }
}

uint64_t IOMappings::lookupInput(IOMappings *this, char *a2, size_t a3)
{
  IOMappings *v4;
  IOMappings *v5;
  unsigned int *v6;
  uint64_t v7;
  uint64_t v8;
  void *__p[2];
  char v11;
  void *__dst[2];
  char v13;

  std::string::basic_string[abi:ne180100](__dst, a2, a3);
  v4 = (IOMappings *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::find<std::string>((uint64_t)this, (const void **)__dst);
  v5 = v4;
  if ((IOMappings *)((char *)this + 8) == v4)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "UNKNOWN");
    v7 = std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::find<std::string>((uint64_t)this, (const void **)__p);
    if (v11 < 0)
      operator delete(__p[0]);
    v6 = (unsigned int *)((char *)this + 96);
    if (v5 != (IOMappings *)v7)
      v6 = (unsigned int *)(v7 + 56);
  }
  else
  {
    v6 = (unsigned int *)((char *)v4 + 56);
  }
  v8 = *v6;
  if (v13 < 0)
    operator delete(__dst[0]);
  return v8;
}

void sub_20D3DAAE8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a14 < 0)
    operator delete(__p);
  if (a20 < 0)
    operator delete(a15);
  _Unwind_Resume(exception_object);
}

void sub_20D3DAD74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,void *__p,uint64_t a35)
{
  _Block_object_dispose(&a28, 8);
  if (__p)
  {
    a35 = (uint64_t)__p;
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__47(__n128 *a1, __n128 *a2)
{
  __n128 result;

  a1[3].n128_u64[0] = 0;
  a1[3].n128_u64[1] = 0;
  a1[4].n128_u64[0] = 0;
  result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  return result;
}

void __Block_byref_object_dispose__48(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(_QWORD *)(a1 + 56) = v2;
    operator delete(v2);
  }
}

void sub_20D3DB1E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,void *__p,uint64_t a35)
{
  _Block_object_dispose(&a28, 8);
  if (__p)
  {
    a35 = (uint64_t)__p;
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_20D3DB458(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20D3DB5D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_20D3DB79C(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;

  _Unwind_Resume(a1);
}

void *findTopKClassifications(void *a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  float v11;
  uint64_t j;
  uint64_t v13;
  uint64_t *v14;
  int v15;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[2];
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (a2 >= 6)
    findTopKClassifications();
  v19[0] = 0;
  v19[1] = 0;
  v20 = 0;
  v7 = a5 + a4;
  if (a5 + a4 > a4)
  {
    v8 = a3 + 20 * a4;
    do
    {
      for (i = 0; i != 20; i += 4)
        *(float *)((char *)v19 + i) = *(float *)(v8 + i) + *(float *)((char *)v19 + i);
      ++a4;
      v8 += 20;
    }
    while (a4 != v7);
  }
  v10 = 0;
  v11 = 0.0;
  do
  {
    v11 = v11 + *(float *)((char *)v19 + v10);
    v10 += 4;
  }
  while (v10 != 20);
  for (j = 0; j != 20; j += 4)
    *(float *)((char *)v19 + j) = *(float *)((char *)v19 + j) / v11;
  v13 = 0;
  v14 = &v18;
  do
  {
    v15 = *((_DWORD *)v19 + v13);
    *(v14 - 1) = v13;
    *(_DWORD *)v14 = v15;
    v14 += 2;
    ++v13;
  }
  while (v13 != 5);
  qsort_b(&v17, 5uLL, 0x10uLL, &__block_literal_global_104);
  return memcpy(a1, &v17, 16 * a2);
}

void sub_20D3DBA84(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_20D3DBB60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__74(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = a2[3];
  a1[3] = result;
  return result;
}

void sub_20D3DBC4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);

  _Unwind_Resume(a1);
}

void sub_20D3DBD48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id a14)
{

  _Unwind_Resume(a1);
}

_QWORD *std::string::basic_string[abi:ne180100](_QWORD *__dst, void *__src, size_t __len)
{
  void *v6;
  size_t v7;
  size_t v8;

  if (__len >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (__len >= 0x17)
  {
    v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17)
      v7 = __len | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    __dst[1] = __len;
    __dst[2] = v8 | 0x8000000000000000;
    *__dst = v6;
  }
  else
  {
    *((_BYTE *)__dst + 23) = __len;
    v6 = __dst;
    if (!__len)
      goto LABEL_9;
  }
  memmove(v6, __src, __len);
LABEL_9:
  *((_BYTE *)v6 + __len) = 0;
  return __dst;
}

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24C6AE728, MEMORY[0x24BEDAAF0]);
}

void sub_20D3DBE68(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

uint64_t std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::find<std::string>(uint64_t a1, const void **a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  _BOOL4 v7;
  uint64_t *v8;

  v2 = a1 + 8;
  v3 = *(_QWORD *)(a1 + 8);
  if (!v3)
    return v2;
  v5 = a1 + 16;
  v6 = a1 + 8;
  do
  {
    v7 = std::less<std::string>::operator()[abi:ne180100](v5, (const void **)(v3 + 32), a2);
    v8 = (uint64_t *)(v3 + 8);
    if (!v7)
    {
      v8 = (uint64_t *)v3;
      v6 = v3;
    }
    v3 = *v8;
  }
  while (*v8);
  if (v6 == v2 || std::less<std::string>::operator()[abi:ne180100](v5, a2, (const void **)(v6 + 32)))
    return v2;
  return v6;
}

BOOL std::less<std::string>::operator()[abi:ne180100](uint64_t a1, const void **a2, const void **a3)
{
  int v3;
  int v4;
  size_t v5;
  const void *v6;
  size_t v7;
  const void *v8;
  size_t v9;
  int v10;

  v3 = *((char *)a3 + 23);
  v4 = *((char *)a2 + 23);
  if (v4 >= 0)
    v5 = *((unsigned __int8 *)a2 + 23);
  else
    v5 = (size_t)a2[1];
  if (v4 >= 0)
    v6 = a2;
  else
    v6 = *a2;
  if (v3 >= 0)
    v7 = *((unsigned __int8 *)a3 + 23);
  else
    v7 = (size_t)a3[1];
  if (v3 >= 0)
    v8 = a3;
  else
    v8 = *a3;
  if (v7 >= v5)
    v9 = v5;
  else
    v9 = v7;
  v10 = memcmp(v6, v8, v9);
  if (v10)
    return v10 < 0;
  else
    return v5 < v7;
}

_QWORD *std::string::basic_string[abi:ne180100]<0>(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v5 = v4;
  if (v4 >= 0x17)
  {
    v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v7 = v4 | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((_BYTE *)a1 + 23) = v4;
    v6 = a1;
    if (!v4)
      goto LABEL_9;
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

uint64_t ___ZL23findTopKClassificationsP31RKEventIdentifierClassificationmPKfmm_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  float v3;
  float v4;
  unsigned int v5;

  v3 = *(float *)(a2 + 8);
  v4 = *(float *)(a3 + 8);
  if (v3 <= v4)
    v5 = 0;
  else
    v5 = -1;
  if (v3 < v4)
    return 1;
  else
    return v5;
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24C6AE730, MEMORY[0x24BEDAB00]);
}

void sub_20D3DC0C0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8C0] + 16);
  return result;
}

void std::vector<std::pair<int,int>>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<int,int>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(8 * a2);
}

uint64_t std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *,false>(uint64_t result, int *a2, uint64_t a3, uint64_t a4, char a5)
{
  int *v8;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int *v15;
  uint64_t v16;
  int v17;
  int *v18;
  char v19;
  BOOL v20;
  int v21;
  int v22;
  int v23;

  v8 = (int *)result;
LABEL_2:
  v9 = v8;
LABEL_3:
  v10 = 1 - a4;
  while (2)
  {
    v8 = v9;
    v11 = v10;
    v12 = (char *)a2 - (char *)v9;
    v13 = ((char *)a2 - (char *)v9) >> 3;
    switch(v13)
    {
      case 0uLL:
      case 1uLL:
        return result;
      case 2uLL:
        v21 = *(a2 - 2);
        v22 = *v9;
        if (v21 < *v9 || v22 >= v21 && *(a2 - 1) < v9[1])
        {
          *v9 = v21;
          *(a2 - 2) = v22;
          v23 = v9[1];
          v9[1] = *(a2 - 1);
          *(a2 - 1) = v23;
        }
        return result;
      case 3uLL:
        return std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *>(v9, v9 + 2, a2 - 2);
      case 4uLL:
        return std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *>(v9, v9 + 2, v9 + 4, a2 - 2);
      case 5uLL:
        return std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *>(v9, v9 + 2, v9 + 4, v9 + 6, a2 - 2);
      default:
        if (v12 <= 191)
        {
          if ((a5 & 1) != 0)
            return (uint64_t)std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *>(v9, a2);
          else
            return (uint64_t)std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *>(v9, a2);
        }
        if (v11 != 1)
        {
          v14 = v13 >> 1;
          v15 = &v9[2 * (v13 >> 1)];
          if ((unint64_t)v12 < 0x401)
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *>(&v9[2 * (v13 >> 1)], v9, a2 - 2);
            if ((a5 & 1) != 0)
              goto LABEL_14;
          }
          else
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *>(v9, &v9[2 * (v13 >> 1)], a2 - 2);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *>(v9 + 2, v15 - 2, a2 - 4);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *>(v9 + 4, &v9[2 * v14 + 2], a2 - 6);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *>(v15 - 2, v15, &v9[2 * v14 + 2]);
            v16 = *(_QWORD *)v9;
            *(_QWORD *)v9 = *(_QWORD *)v15;
            *(_QWORD *)v15 = v16;
            if ((a5 & 1) != 0)
              goto LABEL_14;
          }
          v17 = *(v9 - 2);
          if (v17 >= *v9 && (*v9 < v17 || *(v9 - 1) >= v9[1]))
          {
            result = (uint64_t)std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,std::pair<int,int> *,std::__less<void,void> &>(v9, a2);
            v9 = (int *)result;
            goto LABEL_19;
          }
LABEL_14:
          v18 = std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,std::pair<int,int> *,std::__less<void,void> &>(v9, a2);
          if ((v19 & 1) == 0)
            goto LABEL_17;
          v20 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *>(v9, v18);
          v9 = v18 + 2;
          result = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *>(v18 + 2, a2);
          if (!(_DWORD)result)
          {
            v10 = v11 + 1;
            if (v20)
              continue;
LABEL_17:
            result = std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *,false>(v8, v18, a3, -v11, a5 & 1);
            v9 = v18 + 2;
LABEL_19:
            a5 = 0;
            a4 = -v11;
            goto LABEL_3;
          }
          a4 = -v11;
          a2 = v18;
          if (v20)
            return result;
          goto LABEL_2;
        }
        if (v9 != a2)
          return (uint64_t)std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *,std::pair<int,int> *>(v9, a2, a2, a3);
        return result;
    }
  }
}

_DWORD *std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *>(_DWORD *result, _DWORD *a2)
{
  _DWORD *v2;
  uint64_t v3;
  _DWORD *v4;
  _DWORD *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  _DWORD *v11;
  uint64_t v12;
  int v13;
  int v14;
  _DWORD *v15;

  if (result == a2)
    return result;
  v2 = result + 2;
  if (result + 2 == a2)
    return result;
  v3 = 0;
  v4 = result;
  do
  {
    v5 = v4;
    v4 = v2;
    v6 = v5[2];
    v7 = *v5;
    if (v6 >= *v5 && (v7 < v6 || v5[3] >= v5[1]))
      goto LABEL_18;
    v9 = v5[2];
    v8 = v5[3];
    v10 = v5[1];
    v5[2] = v7;
    v4[1] = v10;
    v11 = result;
    if (v5 == result)
      goto LABEL_17;
    v12 = v3;
    while (1)
    {
      v13 = *(_DWORD *)((char *)result + v12 - 8);
      if (v13 <= v9)
        break;
      v14 = *(_DWORD *)((char *)result + v12 - 4);
LABEL_11:
      v5 -= 2;
      v15 = (_DWORD *)((char *)result + v12);
      *v15 = v13;
      v15[1] = v14;
      v12 -= 8;
      if (!v12)
      {
        v11 = result;
        goto LABEL_17;
      }
    }
    if (v13 >= v9)
    {
      v11 = (_DWORD *)((char *)result + v12);
      v14 = *(_DWORD *)((char *)result + v12 - 4);
      if (v14 <= v8)
        goto LABEL_17;
      goto LABEL_11;
    }
    v11 = v5;
LABEL_17:
    *v11 = v9;
    v11[1] = v8;
LABEL_18:
    v2 = v4 + 2;
    v3 += 8;
  }
  while (v4 + 2 != a2);
  return result;
}

int *std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *>(int *result, int *a2)
{
  int *v2;
  int *v3;
  int *v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int *i;
  int v10;

  if (result != a2)
  {
    v2 = result + 2;
    if (result + 2 != a2)
    {
      v3 = result + 1;
      do
      {
        v4 = result;
        result = v2;
        v5 = v4[2];
        v6 = *v4;
        if (v5 < *v4 || v6 >= v5 && v4[3] < v4[1])
        {
          v7 = *result;
          v8 = result[1];
          for (i = v3; ; i -= 2)
          {
            v10 = *i;
            i[1] = v6;
            i[2] = v10;
            v6 = *(i - 3);
            if (v6 <= v7 && (v6 < v7 || *(i - 2) <= v8))
              break;
          }
          *(i - 1) = v7;
          *i = v8;
        }
        v2 = result + 2;
        v3 += 2;
      }
      while (result + 2 != a2);
    }
  }
  return result;
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *>(int *a1, int *a2, int *a3)
{
  int v3;
  int v4;
  int v5;
  int *v6;
  int *v7;
  uint64_t v8;
  int v9;
  int v10;
  int *v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;

  v3 = *a2;
  v4 = *a1;
  if (*a2 >= *a1 && (v4 < v3 || a2[1] >= a1[1]))
  {
    v9 = *a3;
    if (*a3 >= v3 && (v3 < v9 || a3[1] >= a2[1]))
      return 0;
    *a2 = v9;
    *a3 = v3;
    v11 = a2 + 1;
    v10 = a2[1];
    a2[1] = a3[1];
    a3[1] = v10;
    v12 = *a2;
    v13 = *a1;
    if (*a2 >= *a1 && (v13 < v12 || *v11 >= a1[1]))
      return 1;
    *a1 = v12;
    v6 = a1 + 1;
    *a2 = v13;
    v8 = 2;
  }
  else
  {
    v5 = *a3;
    if (*a3 < v3 || v3 >= v5 && a3[1] < a2[1])
    {
      *a1 = v5;
      v6 = a1 + 1;
      *a3 = v4;
      v7 = a3 + 1;
      v8 = 1;
    }
    else
    {
      *a1 = v3;
      *a2 = v4;
      v14 = a1[1];
      a1[1] = a2[1];
      a2[1] = v14;
      v15 = *a3;
      v16 = *a2;
      if (*a3 >= *a2 && (v16 < v15 || a3[1] >= v14))
        return 1;
      *a2 = v15;
      *a3 = v16;
      v7 = a3 + 1;
      v8 = 2;
      v6 = a2 + 1;
    }
    v11 = v7;
  }
  v17 = *v6;
  *v6 = *v11;
  *v11 = v17;
  return v8;
}

int *std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,std::pair<int,int> *,std::__less<void,void> &>(int *a1, int *a2)
{
  int v2;
  int v3;
  int v4;
  int *i;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  BOOL v14;

  v3 = *a1;
  v2 = a1[1];
  v4 = *(a2 - 2);
  if (v4 <= *a1 && (v4 < v3 || *(a2 - 1) <= v2))
  {
    for (i = a1 + 2; i < a2 && *i <= v3 && (*i < v3 || i[1] <= v2); i += 2)
      ;
  }
  else
  {
    i = a1;
    do
    {
      v7 = i[2];
      i += 2;
      v6 = v7;
    }
    while (v7 <= v3 && (v6 < v3 || i[1] <= v2));
  }
  if (i < a2)
  {
    for (a2 -= 2; v4 > v3 || v4 >= v3 && a2[1] > v2; a2 -= 2)
    {
      v8 = *(a2 - 2);
      v4 = v8;
    }
  }
  if (i < a2)
  {
    v9 = *i;
    v10 = *a2;
    do
    {
      *i = v10;
      *a2 = v9;
      v11 = i[1];
      i[1] = a2[1];
      a2[1] = v11;
      do
      {
        v12 = i[2];
        i += 2;
        v9 = v12;
      }
      while (v12 <= v3 && (v9 < v3 || i[1] <= v2));
      do
      {
        do
        {
          v13 = *(a2 - 2);
          a2 -= 2;
          v10 = v13;
          v14 = v13 < v3;
        }
        while (v13 > v3);
      }
      while (!v14 && a2[1] > v2);
    }
    while (i < a2);
  }
  if (i - 2 != a1)
  {
    *a1 = *(i - 2);
    a1[1] = *(i - 1);
  }
  *(i - 2) = v3;
  *(i - 1) = v2;
  return i;
}

_DWORD *std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,std::pair<int,int> *,std::__less<void,void> &>(int *a1, _DWORD *a2)
{
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  unint64_t v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v12;
  _DWORD *v13;
  _DWORD *v14;
  int v15;
  int v16;
  BOOL v17;
  int v18;

  v2 = 0;
  v3 = *a1;
  v4 = a1[1];
  while (1)
  {
    v5 = a1[v2 + 2];
    if (v5 >= v3 && (v5 > v3 || a1[v2 + 3] >= v4))
      break;
    v2 += 2;
  }
  v6 = (unint64_t)&a1[v2 + 2];
  if (v2 * 4)
  {
    do
    {
      v8 = *(a2 - 2);
      a2 -= 2;
      v7 = v8;
    }
    while (v8 >= v3 && (v7 > v3 || a2[1] >= v4));
  }
  else
  {
LABEL_19:
    if (v6 < (unint64_t)a2)
    {
      do
      {
        v10 = *(a2 - 2);
        a2 -= 2;
        v9 = v10;
        if (v10 < v3)
          break;
        if (v9 > v3)
          goto LABEL_19;
      }
      while (a2[1] >= v4 && v6 < (unint64_t)a2);
    }
  }
  if (v6 >= (unint64_t)a2)
  {
    v13 = (_DWORD *)v6;
  }
  else
  {
    v12 = *a2;
    v13 = (_DWORD *)v6;
    v14 = a2;
    do
    {
      *v13 = v12;
      *v14 = v5;
      v15 = v13[1];
      v13[1] = v14[1];
      v14[1] = v15;
      do
      {
        do
        {
          v16 = v13[2];
          v13 += 2;
          v5 = v16;
          v17 = v16 <= v3;
        }
        while (v16 < v3);
      }
      while (v17 && v13[1] < v4);
      do
      {
        v18 = *(v14 - 2);
        v14 -= 2;
        v12 = v18;
      }
      while (v18 >= v3 && (v12 > v3 || v14[1] >= v4));
    }
    while (v13 < v14);
  }
  if (v13 - 2 != a1)
  {
    *a1 = *(v13 - 2);
    a1[1] = *(v13 - 1);
  }
  *(v13 - 2) = v3;
  *(v13 - 1) = v4;
  return v13 - 2;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *>(int *a1, int *a2)
{
  uint64_t v4;
  _BOOL8 result;
  int v6;
  int v7;
  int v8;
  int *v9;
  int *v10;
  uint64_t v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int *v16;
  uint64_t v17;
  char *v18;
  int v19;
  int v20;

  v4 = ((char *)a2 - (char *)a1) >> 3;
  result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      v6 = *(a2 - 2);
      v7 = *a1;
      if (v6 < *a1 || v7 >= v6 && *(a2 - 1) < a1[1])
      {
        *a1 = v6;
        *(a2 - 2) = v7;
        v8 = a1[1];
        a1[1] = *(a2 - 1);
        *(a2 - 1) = v8;
      }
      return result;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *>(a1, a1 + 2, a2 - 2);
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *>(a1, a1 + 2, a1 + 4, a2 - 2);
      return 1;
    case 5:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *>(a1, a1 + 2, a1 + 4, a1 + 6, a2 - 2);
      return 1;
    default:
      v9 = a1 + 4;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *>(a1, a1 + 2, a1 + 4);
      v10 = a1 + 6;
      if (a1 + 6 == a2)
        return 1;
      v11 = 0;
      v12 = 0;
      break;
  }
  do
  {
    v13 = *v9;
    if (*v10 >= *v9 && (v13 < *v10 || v10[1] >= v9[1]))
      goto LABEL_22;
    v14 = *v10;
    v15 = v10[1];
    *v10 = v13;
    v10[1] = v9[1];
    v16 = a1;
    if (v9 == a1)
      goto LABEL_21;
    v17 = v11;
    while (1)
    {
      v18 = (char *)a1 + v17;
      v19 = *(int *)((char *)a1 + v17 + 8);
      if (v19 > v14)
      {
        v20 = *((_DWORD *)v18 + 3);
        goto LABEL_17;
      }
      if (v19 < v14)
      {
        v16 = v9;
        goto LABEL_21;
      }
      v20 = *(int *)((char *)a1 + v17 + 12);
      if (v20 <= v15)
        break;
LABEL_17:
      v9 -= 2;
      *((_DWORD *)v18 + 4) = v19;
      *(int *)((char *)a1 + v17 + 20) = v20;
      v17 -= 8;
      if (v17 == -16)
      {
        v16 = a1;
        goto LABEL_21;
      }
    }
    v16 = (int *)((char *)a1 + v17 + 16);
LABEL_21:
    *v16 = v14;
    v16[1] = v15;
    if (++v12 == 8)
      return v10 + 2 == a2;
LABEL_22:
    v9 = v10;
    v11 += 8;
    v10 += 2;
  }
  while (v10 != a2);
  return 1;
}

uint64_t std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *>(int *a1, int *a2, int *a3, int *a4)
{
  uint64_t result;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;

  result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *>(a1, a2, a3);
  v9 = *a4;
  v10 = *a3;
  if (*a4 < *a3 || v10 >= v9 && a4[1] < a3[1])
  {
    *a3 = v9;
    *a4 = v10;
    v11 = a3[1];
    a3[1] = a4[1];
    a4[1] = v11;
    v12 = *a3;
    v13 = *a2;
    if (*a3 < *a2 || v13 >= v12 && a3[1] < a2[1])
    {
      *a2 = v12;
      *a3 = v13;
      v14 = a2[1];
      a2[1] = a3[1];
      a3[1] = v14;
      v15 = *a2;
      v16 = *a1;
      if (*a2 < *a1 || v16 >= v15 && a2[1] < a1[1])
      {
        *a1 = v15;
        *a2 = v16;
        v17 = a1[1];
        a1[1] = a2[1];
        a2[1] = v17;
      }
    }
  }
  return result;
}

uint64_t std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *>(int *a1, int *a2, int *a3, int *a4, int *a5)
{
  uint64_t result;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;

  result = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *>(a1, a2, a3, a4);
  v11 = *a5;
  v12 = *a4;
  if (*a5 < *a4 || v12 >= v11 && a5[1] < a4[1])
  {
    *a4 = v11;
    *a5 = v12;
    v13 = a4[1];
    a4[1] = a5[1];
    a5[1] = v13;
    v14 = *a4;
    v15 = *a3;
    if (*a4 < *a3 || v15 >= v14 && a4[1] < a3[1])
    {
      *a3 = v14;
      *a4 = v15;
      v16 = a3[1];
      a3[1] = a4[1];
      a4[1] = v16;
      v17 = *a3;
      v18 = *a2;
      if (*a3 < *a2 || v18 >= v17 && a3[1] < a2[1])
      {
        *a2 = v17;
        *a3 = v18;
        v19 = a2[1];
        a2[1] = a3[1];
        a3[1] = v19;
        v20 = *a2;
        v21 = *a1;
        if (*a2 < *a1 || v21 >= v20 && a2[1] < a1[1])
        {
          *a1 = v20;
          *a2 = v21;
          v22 = a1[1];
          a1[1] = a2[1];
          a2[1] = v22;
        }
      }
    }
  }
  return result;
}

int *std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *,std::pair<int,int> *>(int *a1, int *a2, int *a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  int *v12;
  int *v13;
  int *v14;
  int v15;
  int v16;
  int v17;
  uint64_t v18;
  int *v19;
  int v20;
  int v21;
  int *v22;

  if (a1 != a2)
  {
    v8 = (char *)a2 - (char *)a1;
    v9 = ((char *)a2 - (char *)a1) >> 3;
    if ((char *)a2 - (char *)a1 >= 9)
    {
      v10 = (unint64_t)(v9 - 2) >> 1;
      v11 = v10 + 1;
      v12 = &a1[2 * v10];
      do
      {
        std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *>((uint64_t)a1, a4, v9, v12);
        v12 -= 2;
        --v11;
      }
      while (v11);
    }
    v13 = a2;
    if (a2 != a3)
    {
      v14 = a2;
      do
      {
        v15 = *v14;
        v16 = *a1;
        if (*v14 < *a1 || v16 >= v15 && v14[1] < a1[1])
        {
          *v14 = v16;
          *a1 = v15;
          v17 = v14[1];
          v14[1] = a1[1];
          a1[1] = v17;
          std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *>((uint64_t)a1, a4, v9, a1);
        }
        v14 += 2;
      }
      while (v14 != a3);
      v13 = a3;
    }
    if (v8 >= 9)
    {
      v18 = (unint64_t)v8 >> 3;
      v19 = a2 - 2;
      do
      {
        v21 = *a1;
        v20 = a1[1];
        v22 = std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *>(a1, a4, v18);
        if (v19 == v22)
        {
          *v22 = v21;
          v22[1] = v20;
        }
        else
        {
          *v22 = *v19;
          v22[1] = v19[1];
          *v19 = v21;
          v19[1] = v20;
          std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *>((uint64_t)a1, (uint64_t)(v22 + 2), a4, ((char *)(v22 + 2) - (char *)a1) >> 3);
        }
        v19 -= 2;
      }
      while (v18-- > 2);
    }
    return v13;
  }
  return a3;
}

uint64_t std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *>(uint64_t result, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;

  if (a3 >= 2)
  {
    v4 = (uint64_t)a4 - result;
    v5 = (unint64_t)(a3 - 2) >> 1;
    if (v5 >= ((uint64_t)a4 - result) >> 3)
    {
      v6 = v4 >> 2;
      v7 = (v4 >> 2) + 1;
      v8 = (int *)(result + 8 * v7);
      v9 = v6 + 2;
      if (v9 < a3)
      {
        v10 = v8[2];
        if (*v8 < v10 || v10 >= *v8 && *(_DWORD *)(result + 8 * v7 + 4) < v8[3])
        {
          v8 += 2;
          v7 = v9;
        }
      }
      v11 = *v8;
      if (*v8 >= *a4 && (*a4 < v11 || v8[1] >= a4[1]))
      {
        v12 = *a4;
        v13 = a4[1];
        *a4 = v11;
        a4[1] = v8[1];
        if (v5 >= v7)
        {
          while (1)
          {
            v15 = 2 * v7;
            v7 = (2 * v7) | 1;
            v14 = (int *)(result + 8 * v7);
            v16 = v15 + 2;
            if (v16 < a3)
            {
              v17 = v14[2];
              if (*v14 < v17 || v17 >= *v14 && *(_DWORD *)(result + 8 * v7 + 4) < v14[3])
              {
                v14 += 2;
                v7 = v16;
              }
            }
            v18 = *v14;
            if (*v14 < v12 || v18 <= v12 && v14[1] < v13)
              break;
            *v8 = v18;
            v8[1] = v14[1];
            v8 = v14;
            if (v5 < v7)
              goto LABEL_22;
          }
        }
        v14 = v8;
LABEL_22:
        *v14 = v12;
        v14[1] = v13;
      }
    }
  }
  return result;
}

_DWORD *std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *>(_DWORD *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _DWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;

  v3 = 0;
  v4 = a3 - 2;
  if (a3 < 2)
    v4 = a3 - 1;
  v5 = v4 >> 1;
  do
  {
    v6 = result;
    v7 = v3 + 1;
    result += 2 * v3 + 2;
    v8 = 2 * v3;
    v3 = (2 * v3) | 1;
    v9 = v8 + 2;
    if (v9 < a3)
    {
      v10 = result[2];
      if (*result < v10 || v10 >= *result && v6[2 * v7 + 1] < result[3])
      {
        result += 2;
        v3 = v9;
      }
    }
    *v6 = *result;
    v6[1] = result[1];
  }
  while (v3 <= v5);
  return result;
}

uint64_t std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *>(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  int *v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int *v11;
  unint64_t v12;
  int v13;
  int v14;

  v4 = a4 - 2;
  if (a4 >= 2)
  {
    v5 = v4 >> 1;
    v6 = (int *)(result + 8 * (v4 >> 1));
    v7 = *v6;
    v8 = *(_DWORD *)(a2 - 8);
    if (*v6 < v8 || v8 >= v7 && *(_DWORD *)(result + 8 * v5 + 4) < *(_DWORD *)(a2 - 4))
    {
      v9 = *(_DWORD *)(a2 - 8);
      v10 = *(_DWORD *)(a2 - 4);
      *(_DWORD *)(a2 - 8) = v7;
      *(_DWORD *)(a2 - 4) = v6[1];
      if (v4 >= 2)
      {
        while (1)
        {
          v12 = v5 - 1;
          v5 = (v5 - 1) >> 1;
          v11 = (int *)(result + 8 * v5);
          v13 = *v11;
          if (*v11 >= v9)
          {
            if (v13 > v9)
              break;
            v14 = *(_DWORD *)(result + 8 * v5 + 4);
            if (v14 >= v10)
              break;
          }
          else
          {
            v14 = v11[1];
          }
          *v6 = v13;
          v6[1] = v14;
          v6 = (int *)(result + 8 * v5);
          if (v12 <= 1)
            goto LABEL_12;
        }
      }
      v11 = v6;
LABEL_12:
      *v11 = v9;
      v11[1] = v10;
    }
  }
  return result;
}

LABEL_1:
  v8 = (unint64_t *)(a2 - 24);
  i = a1;
  while (2)
  {
    a1 = i;
    v10 = a2 - i;
    v11 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a2 - i) >> 3);
    switch(v11)
    {
      case 0:
      case 1:
        return;
      case 2:
        v63 = (__int128 *)(a2 - 24);
        v64 = *(_QWORD *)(a2 - 24);
        if (v64 < *(_QWORD *)i
          || v64 <= *(_QWORD *)i
          && ((v65 = *(_QWORD *)(a2 - 16), v66 = *(_QWORD *)(i + 8), v65 < v66)
           || v65 <= v66 && *(unsigned __int8 *)(a2 - 8) < *(unsigned __int8 *)(i + 16)))
        {
          v151 = *(_QWORD *)(i + 16);
          v143 = *(_OWORD *)i;
          v67 = *v63;
          *(_QWORD *)(i + 16) = *(_QWORD *)(a2 - 8);
          *(_OWORD *)i = v67;
          *(_QWORD *)(a2 - 8) = v151;
          *v63 = v143;
        }
        return;
      case 3:
        std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::$_0 &,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::Delta *>((__int128 *)i, (unint64_t *)(i + 24), (__int128 *)(a2 - 24));
        return;
      case 4:
        std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::$_0 &,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::Delta *>(i, (unint64_t *)(i + 24), i + 48, a2 - 24);
        return;
      case 5:
        std::__sort5_maybe_branchless[abi:ne180100]<std::_ClassicAlgPolicy,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::$_0 &,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::Delta *,0>(i, (unint64_t *)(i + 24), i + 48, i + 72, a2 - 24);
        return;
      default:
        if (v10 > 575)
        {
          if (!a3)
          {
            if (i == a2)
              return;
            v83 = (unint64_t)(v11 - 2) >> 1;
            v84 = v83;
            while (1)
            {
              v85 = v84;
              if (v83 >= v84)
              {
                v86 = (2 * v84) | 1;
                v87 = i + 24 * v86;
                if (2 * v85 + 2 < v11)
                {
                  v88 = *(_QWORD *)(v87 + 24);
                  if (*(_QWORD *)v87 < v88
                    || *(_QWORD *)v87 <= v88
                    && ((v89 = *(_QWORD *)(i + 24 * v86 + 8), v90 = *(_QWORD *)(v87 + 32), v89 < v90)
                     || v89 <= v90
                     && *(unsigned __int8 *)(i + 24 * v86 + 16) < *(unsigned __int8 *)(v87 + 40)))
                  {
                    v87 += 24;
                    v86 = 2 * v85 + 2;
                  }
                }
                v91 = i + 24 * v85;
                v92 = *(_QWORD *)v91;
                if (*(_QWORD *)v87 >= *(_QWORD *)v91)
                {
                  if (*(_QWORD *)v87 > *(_QWORD *)v91)
                  {
                    v93 = *(_QWORD *)(v91 + 8);
LABEL_161:
                    v95 = *(unsigned __int8 *)(v91 + 16);
                    *(_DWORD *)&v145[3] = *(_DWORD *)(v91 + 20);
                    *(_DWORD *)v145 = *(_DWORD *)(v91 + 17);
                    while (1)
                    {
                      v96 = *(_OWORD *)v87;
                      *(_QWORD *)(v91 + 16) = *(_QWORD *)(v87 + 16);
                      *(_OWORD *)v91 = v96;
                      if (v83 < v86)
                        goto LABEL_176;
                      v91 = v87;
                      v97 = 2 * v86;
                      v86 = (2 * v86) | 1;
                      v87 = i + 24 * v86;
                      v98 = v97 + 2;
                      if (v98 < v11)
                      {
                        v99 = *(_QWORD *)(v87 + 24);
                        if (*(_QWORD *)v87 < v99
                          || *(_QWORD *)v87 <= v99
                          && ((v100 = *(_QWORD *)(i + 24 * v86 + 8), v101 = *(_QWORD *)(v87 + 32), v100 < v101)
                           || v100 <= v101
                           && *(unsigned __int8 *)(i + 24 * v86 + 16) < *(unsigned __int8 *)(v87 + 40)))
                        {
                          v87 += 24;
                          v86 = v98;
                        }
                      }
                      if (*(_QWORD *)v87 < v92)
                        break;
                      if (*(_QWORD *)v87 <= v92)
                      {
                        v102 = *(_QWORD *)(v87 + 8);
                        if (v102 < v93 || v102 <= v93 && *(unsigned __int8 *)(v87 + 16) < v95)
                          break;
                      }
                    }
                    v87 = v91;
LABEL_176:
                    *(_QWORD *)v87 = v92;
                    *(_QWORD *)(v87 + 8) = v93;
                    *(_BYTE *)(v87 + 16) = v95;
                    *(_DWORD *)(v87 + 17) = *(_DWORD *)v145;
                    *(_DWORD *)(v87 + 20) = *(_DWORD *)&v145[3];
                    goto LABEL_177;
                  }
                  v94 = *(_QWORD *)(v87 + 8);
                  v93 = *(_QWORD *)(i + 24 * v85 + 8);
                  if (v94 >= v93
                    && (v94 > v93
                     || *(unsigned __int8 *)(v87 + 16) >= *(unsigned __int8 *)(i + 24 * v85 + 16)))
                  {
                    goto LABEL_161;
                  }
                }
              }
LABEL_177:
              v84 = v85 - 1;
              if (!v85)
              {
                v103 = v10 / 0x18uLL;
                while (1)
                {
                  v104 = 0;
                  v152 = *(_QWORD *)(i + 16);
                  v146 = *(_OWORD *)i;
                  v105 = i;
                  do
                  {
                    v106 = v105;
                    v107 = v104 + 1;
                    v105 += 24 * (v104 + 1);
                    v108 = 2 * v104;
                    v104 = (2 * v104) | 1;
                    v109 = v108 + 2;
                    if (v109 < v103)
                    {
                      v110 = *(_QWORD *)(v105 + 24);
                      if (*(_QWORD *)v105 < v110
                        || *(_QWORD *)v105 <= v110
                        && ((v112 = *(_QWORD *)(v106 + 24 * v107 + 8), v113 = *(_QWORD *)(v105 + 32), v112 < v113)
                         || v112 <= v113
                         && *(unsigned __int8 *)(v106 + 24 * v107 + 16) < *(unsigned __int8 *)(v105 + 40)))
                      {
                        v105 += 24;
                        v104 = v109;
                      }
                    }
                    v111 = *(_OWORD *)v105;
                    *(_QWORD *)(v106 + 16) = *(_QWORD *)(v105 + 16);
                    *(_OWORD *)v106 = v111;
                  }
                  while (v104 <= (uint64_t)((unint64_t)(v103 - 2) >> 1));
                  a2 -= 24;
                  if (v105 == a2)
                  {
                    *(_QWORD *)(v105 + 16) = v152;
                    *(_OWORD *)v105 = v146;
                  }
                  else
                  {
                    v114 = *(_OWORD *)a2;
                    *(_QWORD *)(v105 + 16) = *(_QWORD *)(a2 + 16);
                    *(_OWORD *)v105 = v114;
                    *(_QWORD *)(a2 + 16) = v152;
                    *(_OWORD *)a2 = v146;
                    v115 = v105 - i + 24;
                    if (v115 >= 25)
                    {
                      v116 = v115 / 0x18uLL - 2;
                      v117 = v116 >> 1;
                      v118 = i + 24 * (v116 >> 1);
                      v119 = *(_QWORD *)v105;
                      if (*(_QWORD *)v118 < *(_QWORD *)v105)
                      {
                        v120 = *(_QWORD *)(v105 + 8);
LABEL_194:
                        v121 = *(unsigned __int8 *)(v105 + 16);
                        *(_DWORD *)v139 = *(_DWORD *)(v105 + 17);
                        *(_DWORD *)&v139[3] = *(_DWORD *)(v105 + 20);
                        v122 = *(_QWORD *)(v118 + 16);
                        *(_OWORD *)v105 = *(_OWORD *)v118;
                        *(_QWORD *)(v105 + 16) = v122;
                        if (v116 >= 2)
                        {
                          while (1)
                          {
                            v124 = v117 - 1;
                            v117 = (v117 - 1) >> 1;
                            v123 = i + 24 * v117;
                            if (*(_QWORD *)v123 >= v119)
                            {
                              if (*(_QWORD *)v123 > v119)
                                break;
                              v125 = *(_QWORD *)(i + 24 * v117 + 8);
                              if (v125 >= v120 && (v125 > v120 || *(unsigned __int8 *)(i + 24 * v117 + 16) >= v121))
                                break;
                            }
                            v126 = *(_OWORD *)v123;
                            *(_QWORD *)(v118 + 16) = *(_QWORD *)(v123 + 16);
                            *(_OWORD *)v118 = v126;
                            v118 = i + 24 * v117;
                            if (v124 <= 1)
                              goto LABEL_202;
                          }
                        }
                        v123 = v118;
LABEL_202:
                        *(_QWORD *)v123 = v119;
                        *(_QWORD *)(v123 + 8) = v120;
                        *(_BYTE *)(v123 + 16) = v121;
                        *(_DWORD *)(v123 + 17) = *(_DWORD *)v139;
                        *(_DWORD *)(v123 + 20) = *(_DWORD *)&v139[3];
                        goto LABEL_204;
                      }
                      if (*(_QWORD *)v118 <= *(_QWORD *)v105)
                      {
                        v127 = *(_QWORD *)(i + 24 * v117 + 8);
                        v120 = *(_QWORD *)(v105 + 8);
                        if (v127 < v120
                          || v127 <= v120
                          && *(unsigned __int8 *)(i + 24 * v117 + 16) < *(unsigned __int8 *)(v105 + 16))
                        {
                          goto LABEL_194;
                        }
                      }
                    }
                  }
LABEL_204:
                  v38 = v103-- <= 2;
                  if (v38)
                    return;
                }
              }
            }
          }
          v12 = (unint64_t)v11 >> 1;
          v13 = (unint64_t *)(i + 24 * ((unint64_t)v11 >> 1));
          if ((unint64_t)v10 < 0xC01)
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::$_0 &,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::Delta *>((__int128 *)(a1 + 24 * v12), (unint64_t *)a1, (__int128 *)(a2 - 24));
          }
          else
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::$_0 &,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::Delta *>((__int128 *)a1, (unint64_t *)(a1 + 24 * v12), (__int128 *)(a2 - 24));
            v14 = 3 * v12;
            v15 = (unint64_t *)(a1 + 24 * v12 - 24);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::$_0 &,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::Delta *>((__int128 *)(a1 + 24), v15, (__int128 *)(a2 - 48));
            v16 = (unint64_t *)(a1 + 24 + 8 * v14);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::$_0 &,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::Delta *>((__int128 *)(a1 + 48), v16, (__int128 *)(a2 - 72));
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::$_0 &,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::Delta *>((__int128 *)v15, v13, (__int128 *)v16);
            v148 = *(_QWORD *)(a1 + 16);
            v140 = *(_OWORD *)a1;
            v17 = v13[2];
            *(_OWORD *)a1 = *(_OWORD *)v13;
            *(_QWORD *)(a1 + 16) = v17;
            v13[2] = v148;
            *(_OWORD *)v13 = v140;
          }
          --a3;
          v18 = *(_QWORD *)a1;
          if ((a4 & 1) == 0)
          {
            v19 = *(_QWORD *)(a1 - 24);
            if (v19 >= v18)
            {
              if (v19 > v18)
              {
                v21 = *(_QWORD *)(a1 + 8);
              }
              else
              {
                v20 = *(_QWORD *)(a1 - 16);
                v21 = *(_QWORD *)(a1 + 8);
                if (v20 < v21
                  || v20 <= v21 && *(unsigned __int8 *)(a1 - 8) < *(unsigned __int8 *)(a1 + 16))
                {
                  goto LABEL_14;
                }
              }
              v45 = *(unsigned __int8 *)(a1 + 16);
              *(_DWORD *)v138 = *(_DWORD *)(a1 + 17);
              *(_DWORD *)&v138[3] = *(_DWORD *)(a1 + 20);
              v46 = *v8;
              if (v18 < *v8
                || v18 <= *v8
                && ((v62 = *(_QWORD *)(a2 - 16), v21 < v62) || v21 <= v62 && v45 < *(unsigned __int8 *)(a2 - 8)))
              {
                i = a1;
                while (1)
                {
                  v48 = *(_QWORD *)(i + 24);
                  i += 24;
                  v47 = v48;
                  if (v18 < v48)
                    break;
                  if (v18 <= v47)
                  {
                    v49 = *(_QWORD *)(i + 8);
                    if (v21 < v49 || v21 <= v49 && v45 < *(unsigned __int8 *)(i + 16))
                      break;
                  }
                }
              }
              else
              {
                for (i = a1 + 24; i < a2; i += 24)
                {
                  if (v18 < *(_QWORD *)i)
                    break;
                  if (v18 <= *(_QWORD *)i)
                  {
                    v61 = *(_QWORD *)(i + 8);
                    if (v21 < v61 || v21 <= v61 && v45 < *(unsigned __int8 *)(i + 16))
                      break;
                  }
                }
              }
              j = a2;
              if (i < a2)
              {
                for (j = a2 - 24; ; j -= 24)
                {
                  if (v18 >= v46)
                  {
                    if (v18 > v46)
                      break;
                    v51 = *(_QWORD *)(j + 8);
                    if (v21 >= v51 && (v21 > v51 || v45 >= *(unsigned __int8 *)(j + 16)))
                      break;
                  }
                  v52 = *(_QWORD *)(j - 24);
                  v46 = v52;
                }
              }
              while (i < j)
              {
                v150 = *(_QWORD *)(i + 16);
                v142 = *(_OWORD *)i;
                v53 = *(_OWORD *)j;
                *(_QWORD *)(i + 16) = *(_QWORD *)(j + 16);
                *(_OWORD *)i = v53;
                *(_QWORD *)(j + 16) = v150;
                *(_OWORD *)j = v142;
                while (1)
                {
                  v55 = *(_QWORD *)(i + 24);
                  i += 24;
                  v54 = v55;
                  if (v18 < v55)
                    break;
                  if (v18 <= v54)
                  {
                    v56 = *(_QWORD *)(i + 8);
                    if (v21 < v56 || v21 <= v56 && v45 < *(unsigned __int8 *)(i + 16))
                      break;
                  }
                }
                do
                {
                  do
                  {
                    v57 = *(_QWORD *)(j - 24);
                    j -= 24;
                    v58 = v18 > v57;
                  }
                  while (v18 < v57);
                  if (v58)
                    break;
                  v59 = *(_QWORD *)(j + 8);
                }
                while (v21 < v59 || v21 <= v59 && v45 < *(unsigned __int8 *)(j + 16));
              }
              if (i - 24 != a1)
              {
                v60 = *(_OWORD *)(i - 24);
                *(_QWORD *)(a1 + 16) = *(_QWORD *)(i - 8);
                *(_OWORD *)a1 = v60;
              }
              a4 = 0;
              *(_QWORD *)(i - 24) = v18;
              *(_QWORD *)(i - 16) = v21;
              *(_BYTE *)(i - 8) = v45;
              *(_DWORD *)(i - 7) = *(_DWORD *)v138;
              *(_DWORD *)(i - 4) = *(_DWORD *)&v138[3];
              continue;
            }
          }
LABEL_14:
          v22 = 0;
          v23 = *(_QWORD *)(a1 + 8);
          v24 = *(unsigned __int8 *)(a1 + 16);
          *(_DWORD *)v137 = *(_DWORD *)(a1 + 17);
          *(_DWORD *)&v137[3] = *(_DWORD *)(a1 + 20);
          while (1)
          {
            v25 = *(_QWORD *)(a1 + v22 + 24);
            if (v25 >= v18)
            {
              if (v25 > v18)
                break;
              v26 = *(_QWORD *)(a1 + v22 + 32);
              if (v26 >= v23 && (v26 > v23 || *(unsigned __int8 *)(a1 + v22 + 40) >= v24))
                break;
            }
            v22 += 24;
          }
          v27 = a1 + v22 + 24;
          if (v22)
          {
            v28 = *v8;
            for (k = a2 - 24; v28 >= v18; k -= 24)
            {
              if (v28 <= v18)
              {
                v30 = *(_QWORD *)(k + 8);
                if (v30 < v23 || v30 <= v23 && *(unsigned __int8 *)(k + 16) < v24)
                  break;
              }
              v31 = *(_QWORD *)(k - 24);
              v28 = v31;
            }
          }
          else
          {
            k = a2;
            if (v27 < a2)
            {
              v32 = *v8;
              k = a2 - 24;
              if (*v8 >= v18)
              {
                k = a2 - 24;
                do
                {
                  if (v32 > v18)
                    goto LABEL_35;
                  v33 = *(_QWORD *)(k + 8);
                  if (v33 < v23)
                    break;
                  if (v33 <= v23)
                  {
                    if (v27 >= k || *(unsigned __int8 *)(k + 16) < v24)
                      break;
                  }
                  else
                  {
LABEL_35:
                    if (v27 >= k)
                      break;
                  }
                  v34 = *(_QWORD *)(k - 24);
                  k -= 24;
                  v32 = v34;
                }
                while (v34 >= v18);
              }
            }
          }
          i = v27;
          if (v27 < k)
          {
            v35 = k;
            do
            {
              v149 = *(_QWORD *)(i + 16);
              v141 = *(_OWORD *)i;
              v36 = *(_OWORD *)v35;
              *(_QWORD *)(i + 16) = *(_QWORD *)(v35 + 16);
              *(_OWORD *)i = v36;
              *(_QWORD *)(v35 + 16) = v149;
              *(_OWORD *)v35 = v141;
              do
              {
                do
                {
                  v37 = *(_QWORD *)(i + 24);
                  i += 24;
                  v38 = v37 > v18;
                }
                while (v37 < v18);
                if (v38)
                  break;
                v39 = *(_QWORD *)(i + 8);
              }
              while (v39 < v23 || v39 <= v23 && *(unsigned __int8 *)(i + 16) < v24);
              while (1)
              {
                v41 = *(_QWORD *)(v35 - 24);
                v35 -= 24;
                v40 = v41;
                if (v41 < v18)
                  break;
                if (v40 <= v18)
                {
                  v42 = *(_QWORD *)(v35 + 8);
                  if (v42 < v23 || v42 <= v23 && *(unsigned __int8 *)(v35 + 16) < v24)
                    break;
                }
              }
            }
            while (i < v35);
          }
          if (i - 24 != a1)
          {
            v43 = *(_OWORD *)(i - 24);
            *(_QWORD *)(a1 + 16) = *(_QWORD *)(i - 8);
            *(_OWORD *)a1 = v43;
          }
          *(_QWORD *)(i - 24) = v18;
          *(_QWORD *)(i - 16) = v23;
          *(_BYTE *)(i - 8) = v24;
          *(_DWORD *)(i - 7) = *(_DWORD *)v137;
          *(_DWORD *)(i - 4) = *(_DWORD *)&v137[3];
          if (v27 < k)
          {
LABEL_59:
            std::__introsort<std::_ClassicAlgPolicy,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::$_0 &,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::Delta *,false>(a1, i - 24, a3, a4 & 1);
            a4 = 0;
            continue;
          }
          v44 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::$_0 &,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::Delta *>(a1, i - 24);
          if (!std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::$_0 &,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::Delta *>(i, a2))
          {
            if (v44)
              continue;
            goto LABEL_59;
          }
          a2 = i - 24;
          if (v44)
            return;
          goto LABEL_1;
        }
        v68 = i + 24;
        v70 = i == a2 || v68 == a2;
        if ((a4 & 1) == 0)
        {
          if (v70)
            return;
          while (1)
          {
            v128 = a1;
            a1 = v68;
            v129 = *(_QWORD *)(v128 + 24);
            if (v129 < *(_QWORD *)v128)
              break;
            if (v129 <= *(_QWORD *)v128)
            {
              v130 = *(_QWORD *)(v128 + 32);
              v131 = *(_QWORD *)(v128 + 8);
              if (v130 < v131
                || v130 <= v131 && *(unsigned __int8 *)(v128 + 40) < *(unsigned __int8 *)(v128 + 16))
              {
                goto LABEL_219;
              }
            }
LABEL_226:
            v68 = a1 + 24;
            if (a1 + 24 == a2)
              return;
          }
          v130 = *(_QWORD *)(v128 + 32);
LABEL_219:
          v132 = *(unsigned __int8 *)(v128 + 40);
          *(_DWORD *)v147 = *(_DWORD *)(v128 + 41);
          *(_DWORD *)&v147[3] = *(_DWORD *)(v128 + 44);
          do
          {
            do
            {
              v133 = v128;
              *(_OWORD *)(v128 + 24) = *(_OWORD *)v128;
              *(_QWORD *)(v128 + 40) = *(_QWORD *)(v128 + 16);
              v134 = *(_QWORD *)(v128 - 24);
              v128 -= 24;
              v135 = v129 > v134;
            }
            while (v129 < v134);
            if (v135)
              break;
            v136 = *(_QWORD *)(v133 - 16);
          }
          while (v130 < v136 || v130 <= v136 && v132 < *(unsigned __int8 *)(v133 - 8));
          *(_QWORD *)v133 = v129;
          *(_QWORD *)(v133 + 8) = v130;
          *(_BYTE *)(v133 + 16) = v132;
          *(_DWORD *)(v133 + 17) = *(_DWORD *)v147;
          *(_DWORD *)(v133 + 20) = *(_DWORD *)&v147[3];
          goto LABEL_226;
        }
        if (v70)
          return;
        v71 = 0;
        v72 = i;
        do
        {
          v73 = v72;
          v72 = v68;
          v74 = *(_QWORD *)(v73 + 24);
          if (v74 >= *(_QWORD *)v73)
          {
            if (v74 > *(_QWORD *)v73)
              goto LABEL_143;
            v75 = *(_QWORD *)(v73 + 32);
            v76 = *(_QWORD *)(v73 + 8);
            if (v75 >= v76
              && (v75 > v76 || *(unsigned __int8 *)(v73 + 40) >= *(unsigned __int8 *)(v73 + 16)))
            {
              goto LABEL_143;
            }
          }
          else
          {
            v75 = *(_QWORD *)(v73 + 32);
          }
          v77 = *(unsigned __int8 *)(v73 + 40);
          *(_DWORD *)v144 = *(_DWORD *)(v73 + 41);
          *(_DWORD *)&v144[3] = *(_DWORD *)(v73 + 44);
          *(_OWORD *)v72 = *(_OWORD *)v73;
          *(_QWORD *)(v72 + 16) = *(_QWORD *)(v73 + 16);
          v78 = i;
          if (v73 == i)
            goto LABEL_142;
          v79 = v71;
          while (1)
          {
            v80 = i + v79;
            v81 = *(_QWORD *)(i + v79 - 24);
            if (v74 >= v81)
            {
              if (v74 > v81)
                goto LABEL_140;
              v82 = *(_QWORD *)(i + v79 - 16);
              if (v75 >= v82)
                break;
            }
LABEL_138:
            v73 -= 24;
            *(_OWORD *)v80 = *(_OWORD *)(i + v79 - 24);
            *(_QWORD *)(v80 + 16) = *(_QWORD *)(i + v79 - 8);
            v79 -= 24;
            if (!v79)
            {
              v78 = i;
              goto LABEL_142;
            }
          }
          if (v75 <= v82)
          {
            if (v77 >= *(unsigned __int8 *)(i + v79 - 8))
            {
LABEL_140:
              v78 = v73;
              goto LABEL_142;
            }
            goto LABEL_138;
          }
          v78 = i + v79;
LABEL_142:
          *(_QWORD *)v78 = v74;
          *(_QWORD *)(v78 + 8) = v75;
          *(_BYTE *)(v78 + 16) = v77;
          *(_DWORD *)(v78 + 17) = *(_DWORD *)v144;
          *(_DWORD *)(v78 + 20) = *(_DWORD *)&v144[3];
LABEL_143:
          v68 = v72 + 24;
          v71 += 24;
        }
        while (v72 + 24 != a2);
        return;
    }
  }
}

void std::__sort5_maybe_branchless[abi:ne180100]<std::_ClassicAlgPolicy,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::$_0 &,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::Delta *,0>(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  __int128 v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  __int128 v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;

  std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::$_0 &,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::Delta *>(a1, a2, a3, a4);
  if (*(_QWORD *)a5 < *(_QWORD *)a4
    || *(_QWORD *)a5 <= *(_QWORD *)a4
    && ((v28 = *(_QWORD *)(a5 + 8), v29 = *(_QWORD *)(a4 + 8), v28 < v29)
     || v28 <= v29 && *(unsigned __int8 *)(a5 + 16) < *(unsigned __int8 *)(a4 + 16)))
  {
    v10 = *(_QWORD *)(a4 + 16);
    v11 = *(_OWORD *)a4;
    v12 = *(_QWORD *)(a5 + 16);
    *(_OWORD *)a4 = *(_OWORD *)a5;
    *(_QWORD *)(a4 + 16) = v12;
    *(_OWORD *)a5 = v11;
    *(_QWORD *)(a5 + 16) = v10;
    if (*(_QWORD *)a4 < *(_QWORD *)a3
      || *(_QWORD *)a4 <= *(_QWORD *)a3
      && ((v13 = *(_QWORD *)(a4 + 8), v14 = *(_QWORD *)(a3 + 8), v13 < v14)
       || v13 <= v14 && *(unsigned __int8 *)(a4 + 16) < *(unsigned __int8 *)(a3 + 16)))
    {
      v15 = *(_QWORD *)(a3 + 16);
      v16 = *(_OWORD *)a3;
      v17 = *(_QWORD *)(a4 + 16);
      *(_OWORD *)a3 = *(_OWORD *)a4;
      *(_QWORD *)(a3 + 16) = v17;
      *(_OWORD *)a4 = v16;
      *(_QWORD *)(a4 + 16) = v15;
      if (*(_QWORD *)a3 < *a2
        || *(_QWORD *)a3 <= *a2
        && ((v18 = *(_QWORD *)(a3 + 8), v19 = a2[1], v18 < v19)
         || v18 <= v19 && *(unsigned __int8 *)(a3 + 16) < *((unsigned __int8 *)a2 + 16)))
      {
        v20 = a2[2];
        v21 = *(_OWORD *)a2;
        v22 = *(_QWORD *)(a3 + 16);
        *(_OWORD *)a2 = *(_OWORD *)a3;
        a2[2] = v22;
        *(_OWORD *)a3 = v21;
        *(_QWORD *)(a3 + 16) = v20;
        if (*a2 < *(_QWORD *)a1
          || *a2 <= *(_QWORD *)a1
          && ((v23 = a2[1], v24 = *(_QWORD *)(a1 + 8), v23 < v24)
           || v23 <= v24 && *((unsigned __int8 *)a2 + 16) < *(unsigned __int8 *)(a1 + 16)))
        {
          v25 = *(_QWORD *)(a1 + 16);
          v26 = *(_OWORD *)a1;
          v27 = a2[2];
          *(_OWORD *)a1 = *(_OWORD *)a2;
          *(_QWORD *)(a1 + 16) = v27;
          *(_OWORD *)a2 = v26;
          a2[2] = v25;
        }
      }
    }
  }
}

__int128 *std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::$_0 &,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::Delta *>(__int128 *result, unint64_t *a2, __int128 *a3)
{
  unint64_t v3;
  unint64_t v4;
  __int128 v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  __int128 v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  __int128 v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  __int128 v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;

  v3 = *a2;
  if (*a2 < *(_QWORD *)result
    || *a2 <= *(_QWORD *)result
    && ((v25 = a2[1], v26 = *((_QWORD *)result + 1), v25 < v26)
     || v25 <= v26 && *((unsigned __int8 *)a2 + 16) < *((unsigned __int8 *)result + 16)))
  {
    if (*(_QWORD *)a3 < v3
      || *(_QWORD *)a3 <= v3
      && ((v17 = *((_QWORD *)a3 + 1), v18 = a2[1], v17 < v18)
       || v17 <= v18 && *((unsigned __int8 *)a3 + 16) < *((unsigned __int8 *)a2 + 16)))
    {
      v4 = *((_QWORD *)result + 2);
      v5 = *result;
      v6 = *((_QWORD *)a3 + 2);
      *result = *a3;
      *((_QWORD *)result + 2) = v6;
    }
    else
    {
      v19 = *((_QWORD *)result + 2);
      v20 = *result;
      v21 = a2[2];
      *result = *(_OWORD *)a2;
      *((_QWORD *)result + 2) = v21;
      *(_OWORD *)a2 = v20;
      a2[2] = v19;
      if (*(_QWORD *)a3 >= *a2)
      {
        if (*(_QWORD *)a3 > *a2)
          return result;
        v22 = *((_QWORD *)a3 + 1);
        v23 = a2[1];
        if (v22 >= v23 && (v22 > v23 || *((unsigned __int8 *)a3 + 16) >= *((unsigned __int8 *)a2 + 16)))
          return result;
      }
      v4 = a2[2];
      v5 = *(_OWORD *)a2;
      v24 = *((_QWORD *)a3 + 2);
      *(_OWORD *)a2 = *a3;
      a2[2] = v24;
    }
    *a3 = v5;
    *((_QWORD *)a3 + 2) = v4;
    return result;
  }
  if (*(_QWORD *)a3 < v3
    || *(_QWORD *)a3 <= v3
    && ((v7 = *((_QWORD *)a3 + 1), v8 = a2[1], v7 < v8)
     || v7 <= v8 && *((unsigned __int8 *)a3 + 16) < *((unsigned __int8 *)a2 + 16)))
  {
    v9 = a2[2];
    v10 = *(_OWORD *)a2;
    v11 = *((_QWORD *)a3 + 2);
    *(_OWORD *)a2 = *a3;
    a2[2] = v11;
    *a3 = v10;
    *((_QWORD *)a3 + 2) = v9;
    if (*a2 < *(_QWORD *)result
      || *a2 <= *(_QWORD *)result
      && ((v12 = a2[1], v13 = *((_QWORD *)result + 1), v12 < v13)
       || v12 <= v13 && *((unsigned __int8 *)a2 + 16) < *((unsigned __int8 *)result + 16)))
    {
      v14 = *((_QWORD *)result + 2);
      v15 = *result;
      v16 = a2[2];
      *result = *(_OWORD *)a2;
      *((_QWORD *)result + 2) = v16;
      *(_OWORD *)a2 = v15;
      a2[2] = v14;
    }
  }
  return result;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::$_0 &,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::Delta *>(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  _BOOL8 result;
  __int128 *v6;
  unint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  unint64_t v15;
  unint64_t v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  _BYTE v25[7];

  v4 = 0xAAAAAAAAAAAAAAABLL * ((a2 - a1) >> 3);
  result = 1;
  switch(v4)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      v6 = (__int128 *)(a2 - 24);
      v7 = *(_QWORD *)(a2 - 24);
      if (v7 < *(_QWORD *)a1
        || v7 <= *(_QWORD *)a1
        && ((v23 = *(_QWORD *)(a2 - 16), v24 = *(_QWORD *)(a1 + 8), v23 < v24)
         || v23 <= v24 && *(unsigned __int8 *)(a2 - 8) < *(unsigned __int8 *)(a1 + 16)))
      {
        v8 = *(_QWORD *)(a1 + 16);
        v9 = *(_OWORD *)a1;
        v10 = *(_QWORD *)(a2 - 8);
        *(_OWORD *)a1 = *v6;
        *(_QWORD *)(a1 + 16) = v10;
        *v6 = v9;
        *(_QWORD *)(a2 - 8) = v8;
      }
      return result;
    case 3uLL:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::$_0 &,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::Delta *>((__int128 *)a1, (unint64_t *)(a1 + 24), (__int128 *)(a2 - 24));
      return 1;
    case 4uLL:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::$_0 &,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::Delta *>(a1, (unint64_t *)(a1 + 24), a1 + 48, a2 - 24);
      return 1;
    case 5uLL:
      std::__sort5_maybe_branchless[abi:ne180100]<std::_ClassicAlgPolicy,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::$_0 &,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::Delta *,0>(a1, (unint64_t *)(a1 + 24), a1 + 48, a1 + 72, a2 - 24);
      return 1;
    default:
      v11 = a1 + 48;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::$_0 &,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::Delta *>((__int128 *)a1, (unint64_t *)(a1 + 24), (__int128 *)(a1 + 48));
      v12 = a1 + 72;
      if (a1 + 72 == a2)
        return 1;
      v13 = 0;
      v14 = 0;
      break;
  }
  while (1)
  {
    v15 = *(_QWORD *)v12;
    if (*(_QWORD *)v12 < *(_QWORD *)v11)
      break;
    if (*(_QWORD *)v12 <= *(_QWORD *)v11)
    {
      v16 = *(_QWORD *)(v12 + 8);
      v22 = *(_QWORD *)(v11 + 8);
      if (v16 < v22 || v16 <= v22 && *(unsigned __int8 *)(v12 + 16) < *(unsigned __int8 *)(v11 + 16))
        goto LABEL_9;
    }
LABEL_26:
    v11 = v12;
    v13 += 24;
    v12 += 24;
    if (v12 == a2)
      return 1;
  }
  v16 = *(_QWORD *)(v12 + 8);
LABEL_9:
  v17 = *(unsigned __int8 *)(v12 + 16);
  *(_DWORD *)v25 = *(_DWORD *)(v12 + 17);
  *(_DWORD *)&v25[3] = *(_DWORD *)(v12 + 20);
  *(_OWORD *)v12 = *(_OWORD *)v11;
  *(_QWORD *)(v12 + 16) = *(_QWORD *)(v11 + 16);
  v18 = a1;
  if (v11 != a1)
  {
    v19 = v13;
    while (1)
    {
      v20 = *(_QWORD *)(a1 + v19 + 24);
      if (v15 >= v20)
      {
        if (v15 > v20)
          goto LABEL_23;
        v21 = *(_QWORD *)(a1 + v19 + 32);
        if (v16 >= v21)
        {
          if (v16 > v21)
          {
LABEL_23:
            v18 = v11;
            goto LABEL_25;
          }
          if (v17 >= *(unsigned __int8 *)(a1 + v19 + 40))
            break;
        }
      }
      v11 -= 24;
      *(_OWORD *)(a1 + v19 + 48) = *(_OWORD *)(a1 + v19 + 24);
      *(_QWORD *)(a1 + v19 + 64) = *(_QWORD *)(a1 + v19 + 40);
      v19 -= 24;
      if (v19 == -48)
      {
        v18 = a1;
        goto LABEL_25;
      }
    }
    v18 = a1 + v19 + 48;
  }
LABEL_25:
  *(_QWORD *)v18 = v15;
  *(_QWORD *)(v18 + 8) = v16;
  *(_BYTE *)(v18 + 16) = v17;
  *(_DWORD *)(v18 + 17) = *(_DWORD *)v25;
  *(_DWORD *)(v18 + 20) = *(_DWORD *)&v25[3];
  if (++v14 != 8)
    goto LABEL_26;
  return v12 + 24 == a2;
}

__n128 std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::$_0 &,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::Delta *>(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  __n128 result;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;

  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::$_0 &,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::Delta *>((__int128 *)a1, a2, (__int128 *)a3);
  if (*(_QWORD *)a4 < *(_QWORD *)a3
    || *(_QWORD *)a4 <= *(_QWORD *)a3
    && ((v9 = *(_QWORD *)(a4 + 8), v10 = *(_QWORD *)(a3 + 8), v9 < v10)
     || v9 <= v10 && *(unsigned __int8 *)(a4 + 16) < *(unsigned __int8 *)(a3 + 16)))
  {
    v11 = *(_QWORD *)(a3 + 16);
    result = *(__n128 *)a3;
    v12 = *(_QWORD *)(a4 + 16);
    *(_OWORD *)a3 = *(_OWORD *)a4;
    *(_QWORD *)(a3 + 16) = v12;
    *(__n128 *)a4 = result;
    *(_QWORD *)(a4 + 16) = v11;
    if (*(_QWORD *)a3 < *a2
      || *(_QWORD *)a3 <= *a2
      && ((v13 = *(_QWORD *)(a3 + 8), v14 = a2[1], v13 < v14)
       || v13 <= v14 && *(unsigned __int8 *)(a3 + 16) < *((unsigned __int8 *)a2 + 16)))
    {
      v15 = a2[2];
      result = *(__n128 *)a2;
      v16 = *(_QWORD *)(a3 + 16);
      *(_OWORD *)a2 = *(_OWORD *)a3;
      a2[2] = v16;
      *(__n128 *)a3 = result;
      *(_QWORD *)(a3 + 16) = v15;
      if (*a2 < *(_QWORD *)a1
        || *a2 <= *(_QWORD *)a1
        && ((v17 = a2[1], v18 = *(_QWORD *)(a1 + 8), v17 < v18)
         || v17 <= v18 && *((unsigned __int8 *)a2 + 16) < *(unsigned __int8 *)(a1 + 16)))
      {
        v19 = *(_QWORD *)(a1 + 16);
        result = *(__n128 *)a1;
        v20 = a2[2];
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(_QWORD *)(a1 + 16) = v20;
        *(__n128 *)a2 = result;
        a2[2] = v19;
      }
    }
  }
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<RKEventIdentifierRange>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(24 * a2);
}

void sub_20D3DED74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_4()
{
  uint64_t v0;

  return v0;
}

void sub_20D3E373C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void sub_20D3E40C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  uint64_t v34;

  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 192), 8);
  _Unwind_Resume(a1);
}

void stripCharacterSet(void *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v9;

  v9 = a1;
  v3 = a2;
  v4 = objc_msgSend(v9, "length");
  if (v4)
  {
    v5 = v4;
    do
    {
      v6 = objc_msgSend(v9, "rangeOfCharacterFromSet:options:range:", v3, 4, 0, v5);
      if (v6 == 0x7FFFFFFFFFFFFFFFLL || v7 == 0)
        break;
      v5 = v6;
      objc_msgSend(v9, "deleteCharactersInRange:", v6, v7);
    }
    while (v5);
  }

}

void sub_20D3E49D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void stripEmojiSkinTones(void *a1)
{
  uint64_t v1;
  id v2;
  id v3;

  v1 = stripEmojiSkinTones_onceToken;
  v2 = a1;
  v3 = v2;
  if (v1 != -1)
  {
    dispatch_once(&stripEmojiSkinTones_onceToken, &__block_literal_global_116);
    v2 = v3;
  }
  stripCharacterSet(v2, (void *)stripEmojiSkinTones_sEmojiSkinToneCharacterSet);

}

void stripDiacritics(void *a1)
{
  uint64_t v1;
  __CFString *v2;
  CFMutableStringRef theString;

  v1 = stripDiacritics_onceToken;
  v2 = a1;
  theString = v2;
  if (v1 != -1)
  {
    dispatch_once(&stripDiacritics_onceToken, &__block_literal_global_118);
    v2 = theString;
  }
  CFStringNormalize(v2, kCFStringNormalizationFormD);
  stripCharacterSet(theString, (void *)stripDiacritics_sDiacriticCharacterSet);
  CFStringNormalize(theString, kCFStringNormalizationFormC);

}

void sub_20D3E5218(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void __stripEmojiSkinTones_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithRange:", 127995, 5);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)stripEmojiSkinTones_sEmojiSkinToneCharacterSet;
  stripEmojiSkinTones_sEmojiSkinToneCharacterSet = v0;

}

void __normalizeWhitespace_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)normalizeWhitespace_sWhitespaceCharacterSet;
  normalizeWhitespace_sWhitespaceCharacterSet = v0;

  objc_msgSend((id)normalizeWhitespace_sWhitespaceCharacterSet, "invertedSet");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)normalizeWhitespace_sNonWhitespaceCharacterSet;
  normalizeWhitespace_sNonWhitespaceCharacterSet = v2;

}

void __stripDiacritics_block_invoke()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1690], "characterSetWithRange:", 768, 56);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addCharactersInRange:", 825, 22);
  objc_msgSend(v0, "addCharactersInRange:", 848, 8);
  objc_msgSend(v0, "addCharactersInRange:", 861, 6);
  objc_msgSend(v0, "addCharactersInRange:", 1155, 5);
  objc_msgSend(v0, "addCharactersInRange:", 1425, 45);
  objc_msgSend(v0, "addCharactersInRange:", 1471, 1);
  objc_msgSend(v0, "addCharactersInRange:", 1473, 2);
  objc_msgSend(v0, "addCharactersInRange:", 1476, 1);
  objc_msgSend(v0, "addCharactersInRange:", 1611, 8);
  objc_msgSend(v0, "addCharactersInRange:", 1623, 2);
  objc_msgSend(v0, "addCharactersInRange:", 1759, 2);
  objc_msgSend(v0, "addCharactersInRange:", 1770, 3);
  objc_msgSend(v0, "addCharactersInRange:", 2275, 28);
  objc_msgSend(v0, "addCharactersInRange:", 3655, 6);
  objc_msgSend(v0, "addCharactersInRange:", 3662, 1);
  objc_msgSend(v0, "addCharactersInRange:", 12330, 6);
  v1 = (void *)stripDiacritics_sDiacriticCharacterSet;
  stripDiacritics_sDiacriticCharacterSet = (uint64_t)v0;

}

void sub_20D3E6258(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void findTopKClassifications()
{
  __assert_rtn("findTopKClassifications", "RKEventIdentifier.mm", 541, "k <= RKEventIDCount");
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

uint64_t CEMEmojiTokenGetString()
{
  return MEMORY[0x24BE1B258]();
}

uint64_t CEMEnumerateEmojiTokensInStringWithBlock()
{
  return MEMORY[0x24BE1B268]();
}

uint64_t CEMStringContainsEmoji()
{
  return MEMORY[0x24BE1B278]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
  MEMORY[0x24BDBB870](theArray, idx, value);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x24BDBBD30](allocator, at);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x24BDBBF48](allocator, localeIdentifier);
}

CFLocaleIdentifier CFLocaleCreateCanonicalLocaleIdentifierFromString(CFAllocatorRef allocator, CFStringRef localeIdentifier)
{
  return (CFLocaleIdentifier)MEMORY[0x24BDBBF58](allocator, localeIdentifier);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC540](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithCharactersNoCopy(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x24BDBC588](alloc, chars, numChars, contentsDeallocator);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x24BDBC5B0](alloc, str, range.location, range.length);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x24BDBC610](theString, *(_QWORD *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
  MEMORY[0x24BDBC620](theString, range.location, range.length, buffer);
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x24BDBC628](theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFRange CFStringGetRangeOfComposedCharactersAtIndex(CFStringRef theString, CFIndex theIndex)
{
  CFIndex v2;
  CFIndex v3;
  CFRange result;

  v2 = MEMORY[0x24BDBC680](theString, theIndex);
  result.length = v3;
  result.location = v2;
  return result;
}

void CFStringLowercase(CFMutableStringRef theString, CFLocaleRef locale)
{
  MEMORY[0x24BDBC6C8](theString, locale);
}

void CFStringNormalize(CFMutableStringRef theString, CFStringNormalizationForm theForm)
{
  MEMORY[0x24BDBC6D0](theString, theForm);
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return MEMORY[0x24BDBC6F8](tokenizer);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x24BDBC710](alloc, string, range.location, range.length, options, locale);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFIndex v1;
  CFIndex v2;
  CFRange result;

  v1 = MEMORY[0x24BDBC718](tokenizer);
  result.length = v2;
  result.location = v1;
  return result;
}

void CFStringTokenizerSetString(CFStringTokenizerRef tokenizer, CFStringRef string, CFRange range)
{
  MEMORY[0x24BDBC728](tokenizer, string, range.location, range.length);
}

Boolean CFStringTransform(CFMutableStringRef string, CFRange *range, CFStringRef transform, Boolean reverse)
{
  return MEMORY[0x24BDBC730](string, range, transform, reverse);
}

void CFStringTrimWhitespace(CFMutableStringRef theString)
{
  MEMORY[0x24BDBC740](theString);
}

CFStringRef CFURLCopyLastPathComponent(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x24BDBC7A8](url);
}

CFStringRef CFURLCopyPath(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x24BDBC7B8](anURL);
}

uint64_t ChineseTokenizerAdvanceToNextToken()
{
  return MEMORY[0x24BED3C00]();
}

uint64_t ChineseTokenizerCreate()
{
  return MEMORY[0x24BED3C08]();
}

uint64_t ChineseTokenizerGetCurrentTokenRange()
{
  return MEMORY[0x24BED3C10]();
}

uint64_t ChineseTokenizerRelease()
{
  return MEMORY[0x24BED3C18]();
}

uint64_t ChineseTokenizerSetCustomWordCheckBlock()
{
  return MEMORY[0x24BED3C20]();
}

uint64_t ChineseTokenizerSetString()
{
  return MEMORY[0x24BED3C28]();
}

uint64_t DDResultCurrencyExtraction()
{
  return MEMORY[0x24BE2B298]();
}

uint64_t DDResultGetCategory()
{
  return MEMORY[0x24BE2B2A8]();
}

uint64_t DDResultGetRange()
{
  return MEMORY[0x24BE2B2C8]();
}

uint64_t DDResultGetType()
{
  return MEMORY[0x24BE2B2E0]();
}

uint64_t DDResultGetValue()
{
  return MEMORY[0x24BE2B2E8]();
}

uint64_t DDResultHasType()
{
  return MEMORY[0x24BE2B2F0]();
}

uint64_t DDScannerCopyResultsWithOptions()
{
  return MEMORY[0x24BE2B328]();
}

uint64_t DDScannerCreateWithType()
{
  return MEMORY[0x24BE2B340]();
}

uint64_t DDScannerScanString()
{
  return MEMORY[0x24BE2B350]();
}

uint64_t LDEnumerateAssetDataItems()
{
  return MEMORY[0x24BE5F7C0]();
}

uint64_t LMLanguageModelAddTokenForString()
{
  return MEMORY[0x24BE5EB28]();
}

uint64_t LMLanguageModelAddTransientVocabulary()
{
  return MEMORY[0x24BE5EB30]();
}

uint64_t LMLanguageModelCopyDynamicModelBundlePath()
{
  return MEMORY[0x24BE5EB40]();
}

uint64_t LMLanguageModelCopyTokenAttributes()
{
  return MEMORY[0x24BE5EB48]();
}

uint64_t LMLanguageModelCreate()
{
  return MEMORY[0x24BE5EB50]();
}

uint64_t LMLanguageModelCreatePredictionEnumerator()
{
  return MEMORY[0x24BE5EB58]();
}

uint64_t LMLanguageModelCreateStringForTokenID()
{
  return MEMORY[0x24BE5EB60]();
}

uint64_t LMLanguageModelDynamicModelIsEmpty()
{
  return MEMORY[0x24BE5EB70]();
}

uint64_t LMLanguageModelEnumeratePredictionsWithBlock()
{
  return MEMORY[0x24BE5EB80]();
}

uint64_t LMLanguageModelFlushDynamicData()
{
  return MEMORY[0x24BE5EB88]();
}

uint64_t LMLanguageModelGetTokenIDForString()
{
  return MEMORY[0x24BE5EBB0]();
}

uint64_t LMLanguageModelIncrementUsageCount()
{
  return MEMORY[0x24BE5EBC0]();
}

uint64_t LMLanguageModelIncrementUsageCountWithEffectiveTime()
{
  return MEMORY[0x24BE5EBC8]();
}

uint64_t LMLanguageModelRelease()
{
  return MEMORY[0x24BE5EBE8]();
}

uint64_t LMLanguageModelRemoveModelBundlesInDirectory()
{
  return MEMORY[0x24BE5EBF0]();
}

uint64_t LMLanguageModelSetParameterValue()
{
  return MEMORY[0x24BE5EC10]();
}

uint64_t LMPredictionEnumeratorAdvance()
{
  return MEMORY[0x24BE5EC80]();
}

uint64_t LMPredictionEnumeratorGetPrediction()
{
  return MEMORY[0x24BE5EC88]();
}

uint64_t LMPredictionEnumeratorRelease()
{
  return MEMORY[0x24BE5EC90]();
}

uint64_t LMVocabularyContainsLemma()
{
  return MEMORY[0x24BE5ECB0]();
}

uint64_t LMVocabularyContainsLemmaForCharacters()
{
  return MEMORY[0x24BE5ECB8]();
}

uint64_t LMVocabularyGetSharedVocabulary()
{
  return MEMORY[0x24BE5ECC0]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t NLMessageConversationCreate()
{
  return MEMORY[0x24BE6B210]();
}

uint64_t NLMessageConversationTurnCreate()
{
  return MEMORY[0x24BE6B218]();
}

uint64_t NLMessageIntentCandidateCopyAttributes()
{
  return MEMORY[0x24BE6B220]();
}

uint64_t NLMessageIntentCandidateGetIntentType()
{
  return MEMORY[0x24BE6B228]();
}

uint64_t NLMessageIntentCandidateGetScore()
{
  return MEMORY[0x24BE6B230]();
}

uint64_t NLMessageIntentRecognizerCopyTopNIntentCandidates()
{
  return MEMORY[0x24BE6B238]();
}

uint64_t NLMessageIntentRecognizerCreate()
{
  return MEMORY[0x24BE6B240]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD0DD8]();
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x24BDD0E08](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x24BDD1258](range.location, range.length);
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x24BDD13D8](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

uint64_t operator delete[]()
{
  return off_24C6AE750();
}

void operator delete(void *__p)
{
  off_24C6AE758(__p);
}

uint64_t operator new[]()
{
  return off_24C6AE760();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24C6AE768(__sz);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint32_t arc4random(void)
{
  return MEMORY[0x24BDAD158]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x24BDAE270](__x);
  return result;
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAA8](__x);
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
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

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x24BEDD020](dest, src, size, atomic, hasStrong);
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
  MEMORY[0x24BDAFA20](__base, __nel, __width, __compar);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

uint64_t uloc_addLikelySubtags()
{
  return MEMORY[0x24BEDC178]();
}

