void ___ZL23userVisibleStringForURLP5NSURLPb_block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  char *v9;
  void *v10;
  unsigned __int16 *v11;
  uint64_t v12;
  unsigned int v13;
  unsigned __int8 v14;
  uint64_t v15;
  uint64_t v16;
  UChar32 v17;
  int v19;
  BOOL v20;
  int v21;
  _BOOL4 v22;
  int v23;
  void *__p;
  void *v25;
  uint64_t v26;

  v7 = a2;
  __p = 0;
  v25 = 0;
  v26 = 0;
  v8 = (int)a4;
  if (a4 << 32)
  {
    std::vector<unsigned short>::__vallocate[abi:nn180100](&__p, (int)a4);
    v9 = (char *)v25;
    bzero(v25, 2 * (int)a4);
    v25 = &v9[2 * (int)a4];
    v10 = __p;
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v7, "getCharacters:range:", v10, a3, a4);
  v11 = (unsigned __int16 *)__p;
  if ((int)a4 < 1)
  {
    LOBYTE(v22) = 0;
  }
  else
  {
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    do
    {
      v16 = v12 + 1;
      v17 = v11[v12];
      if ((v17 & 0xFC00) != 0xD800 || v16 == v8)
      {
        ++v12;
      }
      else
      {
        v19 = v11[v16];
        v20 = (v19 & 0xFC00) == 56320;
        v21 = v19 + (v17 << 10) - 56613888;
        if (v20)
          v17 = v21;
        if (v20)
          v12 += 2;
        else
          ++v12;
      }
      v22 = isLookalikeCharacter(v15 | v14 | v13, v17);
      v13 = v17 & 0xFFFFFF00;
      v23 = v12 >= v8 || v22;
      v15 = 0x100000000;
      v14 = v17;
    }
    while (v23 != 1);
    v11 = (unsigned __int16 *)__p;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) |= v22;
  if (v11)
  {
    v25 = v11;
    operator delete(v11);
  }

}

void sub_2084725BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  void *v11;

  _Unwind_Resume(a1);
}

void ___ZL33allCharactersInIDNScriptAllowListPKti_block_invoke()
{
  void *v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  FILE *v8;
  FILE *v9;
  int v10;
  char v11[33];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 0xFFFFuLL, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "count");
  if (v1 < 1)
  {
LABEL_6:
    allowIDNScript("Common");
    allowIDNScript("Inherited");
    allowIDNScript("Arabic");
    allowIDNScript("Armenian");
    allowIDNScript("Bopomofo");
    allowIDNScript("Canadian_Aboriginal");
    allowIDNScript("Devanagari");
    allowIDNScript("Deseret");
    allowIDNScript("Gujarati");
    allowIDNScript("Gurmukhi");
    allowIDNScript("Hangul");
    allowIDNScript("Han");
    allowIDNScript("Hebrew");
    allowIDNScript("Hiragana");
    allowIDNScript("Katakana_Or_Hiragana");
    allowIDNScript("Katakana");
    allowIDNScript("Latin");
    allowIDNScript("Tamil");
    allowIDNScript("Thai");
    allowIDNScript("Yi");
  }
  else
  {
    v2 = 0;
    v3 = v1;
    while (1)
    {
      objc_msgSend(v0, "objectAtIndex:", v2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("IDNScriptWhiteList.txt"));
      v5 = (id)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5)
      {
        v7 = objc_retainAutorelease(v5);
        v8 = fopen((const char *)objc_msgSend(v7, "fileSystemRepresentation"), "r");
        v9 = v8;
        if (v8)
          break;
      }

      if (v3 == ++v2)
        goto LABEL_6;
    }
    if (fscanf(v8, " #%*[^\n\r]%*[\n\r]") != -1)
    {
      do
      {
        v10 = fscanf(v9, " %32[^# \t\n\r]%*[^# \t\n\r] ", v11);
        if (v10 == 1)
        {
          allowIDNScript(v11);
        }
        else if (v10 == -1)
        {
          break;
        }
      }
      while (fscanf(v9, " #%*[^\n\r]%*[\n\r]") != -1);
    }
    fclose(v9);

  }
}

void sub_20847286C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t allowIDNScript(const char *a1)
{
  uint64_t result;

  result = MEMORY[0x20BD08B40](4106, a1);
  if (result <= 0xC7)
    IDNScriptAllowList[result >> 5] |= 1 << result;
  return result;
}

void sub_208472924(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

NSString *encodeHostName(NSString *a1)
{
  NSString *v1;
  NSString *v2;
  uint64_t v3;
  uint64_t v4;
  BOOL *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _NSRange v10;

  v1 = a1;
  if (-[NSString canBeConvertedToEncoding:](v1, "canBeConvertedToEncoding:", 1))
  {
    v2 = v1;
  }
  else
  {
    v10.length = -[NSString length](v1, "length");
    v10.location = 0;
    encodeHostNameWithRange(v1, v10, v3, v4, v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (void *)v6;
    else
      v8 = v1;
    v2 = v8;

  }
  return v2;
}

void sub_2084729B0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id decodeHostName(NSString *a1)
{
  NSString *v1;
  uint64_t v2;
  BOOL *v3;
  void *v4;
  void *v5;
  id v6;
  _NSRange v8;

  v1 = a1;
  v8.length = -[NSString length](v1, "length");
  v8.location = 0;
  decodeHostNameWithRange(v1, v8, 0, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = v1;
  v6 = v4;

  return v6;
}

void sub_208472A24(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id decodeHostNameWithRange(NSString *a1, _NSRange a2, BOOL *a3, uint64_t a4, BOOL *a5)
{
  mapHostNameWithRange(a1, a2, 0, (uint64_t)a3, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

id mapHostNameWithRange(NSString *a1, _NSRange a2, uint64_t a3, uint64_t a4, BOOL *a5)
{
  void *v5;
  _BYTE *v6;
  _BYTE *v7;
  int v8;
  int v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  uint64_t (*v19)(uint64_t, _BYTE *, unint64_t, _WORD *, uint64_t, __int128 *, int *);
  int v20;
  int v21;
  int v22;
  unsigned int v23;
  unsigned __int8 v24;
  uint64_t v25;
  uint64_t v26;
  UChar32 v27;
  int v29;
  BOOL v30;
  UChar32 v31;
  uint64_t Script;
  unsigned int v33;
  unsigned int v34;
  _WORD *v35;
  _WORD *v38;
  char v41;
  uint64_t v43;
  int v44;
  int v46;
  int v47;
  int v49;
  uint64_t (***v50)();
  uint64_t v51;
  void *v52;
  char v54;
  uint64_t (***v55)();
  uint64_t v56;
  int v57;
  uint64_t v58;
  int v59;
  int v61;
  BOOL v62;
  int v63;
  int v64;
  __int128 v66;
  int v67;
  _WORD __s2[2048];
  _BYTE v69[4096];
  uint64_t (**v70)();
  uint64_t (*v71)(int);
  uint64_t (***v72)();
  uint64_t v73;

  v5 = (void *)MEMORY[0x24BDAC7A8](a1, a2.location, a2.length, a3, a4, a5);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v73 = *MEMORY[0x24BDAC8D0];
  v14 = v5;
  v15 = v14;
  if (v11 > 0x800 || !-[__CFString length](v14, "length"))
    goto LABEL_99;
  if (v9
    && -[__CFString rangeOfString:options:range:](v15, "rangeOfString:options:range:", CFSTR("%"), 2, v13, v11) != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[__CFString substringWithRange:](v15, "substringWithRange:", v13, v11);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v17 = (__CFString *)CFURLCreateStringByReplacingPercentEscapes(0, v16, &stru_24C0A25C8);

    if (v17)
    {
      v18 = v17;

      v11 = -[__CFString length](v18, "length");
      v13 = 0;
      v15 = v18;
    }

  }
  -[__CFString getCharacters:range:](v15, "getCharacters:range:", v69, v13, v11);
  v67 = 0;
  v66 = xmmword_2084785C0;
  if (v9)
    v19 = (uint64_t (*)(uint64_t, _BYTE *, unint64_t, _WORD *, uint64_t, __int128 *, int *))MEMORY[0x24BEDC150];
  else
    v19 = (uint64_t (*)(uint64_t, _BYTE *, unint64_t, _WORD *, uint64_t, __int128 *, int *))MEMORY[0x24BEDC160];
  if (internationalDomainNameTranscoder(void)::onceToken != -1)
    dispatch_once(&internationalDomainNameTranscoder(void)::onceToken, &__block_literal_global_44);
  v20 = v19(internationalDomainNameTranscoder(void)::encoder, v69, v11, __s2, 2048, &v66, &v67);
  if (v67 > 0 || DWORD1(v66))
    goto LABEL_97;
  v21 = v20;
  if (v20 == (_DWORD)v11 && !memcmp(v69, __s2, 2 * (int)v11))
    goto LABEL_99;
  if ((v9 & 1) != 0)
    goto LABEL_137;
  if (allCharactersInIDNScriptAllowList(unsigned short const*,int)::onceToken != -1)
    dispatch_once(&allCharactersInIDNScriptAllowList(unsigned short const*,int)::onceToken, &__block_literal_global_45);
  if (v21 < 1)
  {
LABEL_137:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", __s2, v21);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_100;
  }
  v22 = 0;
  v23 = 0;
  v24 = 0;
  v25 = 0;
  while (1)
  {
    v26 = v22 + 1;
    v27 = (unsigned __int16)__s2[v22];
    if ((v27 & 0xFC00) != 0xD800 || (_DWORD)v26 == v21)
    {
      ++v22;
    }
    else
    {
      v29 = (unsigned __int16)__s2[v26];
      v30 = (v29 & 0xFC00) == 56320;
      v31 = (v27 << 10) - 56613888 + v29;
      if (v30)
        v27 = v31;
      if (v30)
        v22 += 2;
      else
        ++v22;
    }
    LODWORD(v70) = 0;
    Script = uscript_getScript();
    if ((_DWORD)v70)
    {
      NSLog(CFSTR("got ICU error while trying to look at scripts: %d"), v70);
      goto LABEL_43;
    }
    if ((Script & 0x80000000) != 0)
      break;
    if (Script > 0xC7
      || ((IDNScriptAllowList[Script >> 5] >> Script) & 1) == 0
      || isLookalikeCharacter(v25 | v24 | v23, v27))
    {
      goto LABEL_43;
    }
    v23 = v27 & 0xFFFFFF00;
    v25 = 0x100000000;
    v24 = v27;
    if (v22 >= v21)
      goto LABEL_117;
  }
  NSLog(CFSTR("got negative number for script code from ICU: %d"), Script);
LABEL_43:
  v33 = __s2[v21 - 1] == 46 ? v21 - 1 : v21;
  v34 = v33 - 4;
  if ((int)v33 < 4)
    goto LABEL_97;
  v35 = &__s2[v33];
  if (*(_DWORD *)(v35 - 3) == 71303214 && *(v35 - 1) == 1092)
  {
    v70 = (uint64_t (**)())&unk_24C0A2278;
    v71 = isRussianDomainNameCharacter;
    v72 = &v70;
    v41 = isSecondLevelDomainNameAllowedByTLDRules((uint64_t)__s2, v33 - 3, (uint64_t)&v70);
    goto LABEL_111;
  }
  if (v33 < 5)
    goto LABEL_86;
  if (*((_QWORD *)v35 - 1) == 0x44104430440002ELL)
    goto LABEL_69;
  if (v33 < 8)
  {
    if (v33 <= 5)
      goto LABEL_79;
    v38 = v35 - 5;
    if (*(_QWORD *)(v35 - 5) == 0x44204350434002ELL && *(v35 - 1) == 1080)
    {
LABEL_104:
      v70 = (uint64_t (**)())&unk_24C0A2278;
      v71 = isRussianDomainNameCharacter;
      v72 = &v70;
      v41 = isSecondLevelDomainNameAllowedByTLDRules((uint64_t)__s2, v33 - 5, (uint64_t)&v70);
      goto LABEL_111;
    }
  }
  else
  {
    if (*(_QWORD *)(v35 - 7) == 0x441043E043C002ELL && *((_QWORD *)v35 - 1) == 0x4300432043A0441)
      goto LABEL_67;
    v38 = v35 - 5;
    if (*(_QWORD *)(v35 - 5) == 0x44204350434002ELL && *(v35 - 1) == 1080)
      goto LABEL_104;
    if (*(_QWORD *)(v35 - 7) == 0x43B043D043E002ELL && *((_QWORD *)v35 - 1) == 0x43D04390430043BLL)
    {
LABEL_67:
      v70 = (uint64_t (**)())&unk_24C0A2278;
      v71 = isRussianDomainNameCharacter;
      v72 = &v70;
      v41 = isSecondLevelDomainNameAllowedByTLDRules((uint64_t)__s2, v33 - 7, (uint64_t)&v70);
      goto LABEL_111;
    }
  }
  v43 = *(_QWORD *)v38;
  v44 = (unsigned __int16)v38[4];
  if (v43 == 0x43904300441002ELL && v44 == 1090)
    goto LABEL_104;
LABEL_79:
  switch(*((_QWORD *)v35 - 1))
  {
    case 0x4330440043E002ELL:
LABEL_69:
      v70 = (uint64_t (**)())&unk_24C0A2278;
      v71 = isRussianDomainNameCharacter;
      v72 = &v70;
      v41 = isSecondLevelDomainNameAllowedByTLDRules((uint64_t)__s2, v34, (uint64_t)&v70);
      goto LABEL_111;
    case 0x43B04350431002ELL:
      v70 = &off_24C0A21E8;
      v72 = &v70;
      v41 = isSecondLevelDomainNameAllowedByTLDRules((uint64_t)__s2, v34, (uint64_t)&v70);
      goto LABEL_111;
    case 0x4370430049B002ELL:
      v70 = &off_24C0A2230;
      v72 = &v70;
      v41 = isSecondLevelDomainNameAllowedByTLDRules((uint64_t)__s2, v34, (uint64_t)&v70);
      goto LABEL_111;
    case 0x440043A0443002ELL:
      v70 = &off_24C0A22C0;
      v72 = &v70;
      v41 = isSecondLevelDomainNameAllowedByTLDRules((uint64_t)__s2, v34, (uint64_t)&v70);
      goto LABEL_111;
    case 0x43104400441002ELL:
      v70 = &off_24C0A2308;
      v72 = &v70;
      v41 = isSecondLevelDomainNameAllowedByTLDRules((uint64_t)__s2, v34, (uint64_t)&v70);
      goto LABEL_111;
    case 0x434043A043C002ELL:
      v70 = &off_24C0A2350;
      v72 = &v70;
      v41 = isSecondLevelDomainNameAllowedByTLDRules((uint64_t)__s2, v34, (uint64_t)&v70);
      goto LABEL_111;
    case 0x43D043E043C002ELL:
      v70 = &off_24C0A2398;
      v72 = &v70;
      v41 = isSecondLevelDomainNameAllowedByTLDRules((uint64_t)__s2, v34, (uint64_t)&v70);
LABEL_111:
      v54 = v41;
      v55 = v72;
      if (v72 == &v70)
      {
        v56 = 4;
        v55 = &v70;
      }
      else
      {
        if (!v72)
          goto LABEL_116;
        v56 = 5;
      }
      (*v55)[v56]();
LABEL_116:
      if ((v54 & 1) == 0)
        goto LABEL_97;
      goto LABEL_117;
  }
LABEL_86:
  v46 = *(_DWORD *)(v35 - 3);
  v47 = (unsigned __int16)*(v35 - 1);
  if (v46 == 70320174 && v47 == 1075)
  {
    v70 = &off_24C0A23E0;
    v72 = &v70;
    v49 = isSecondLevelDomainNameAllowedByTLDRules((uint64_t)__s2, v33 - 3, (uint64_t)&v70);
    v50 = v72;
    if (v72 == &v70)
    {
      v51 = 4;
      v50 = &v70;
    }
    else
    {
      if (!v72)
        goto LABEL_96;
      v51 = 5;
    }
    (*v50)[v51]();
LABEL_96:
    if (!v49)
      goto LABEL_97;
LABEL_117:
    v57 = 0;
    while (1)
    {
      v58 = v57 + 1;
      v59 = (unsigned __int16)__s2[v57];
      if ((v59 & 0xFC00) != 0xD800 || (_DWORD)v58 == v21)
      {
        if (v59 == 37)
          goto LABEL_136;
      }
      else
      {
        v61 = (unsigned __int16)__s2[v58];
        v62 = (v61 & 0xFC00) == 56320;
        v63 = v57 + 2;
        v64 = (v59 << 10) - 56613888 + v61;
        if (v62)
          v59 = v64;
        if (v62)
          LODWORD(v58) = v63;
      }
      if ((v59 - 35) <= 0x3A && ((1 << (v59 - 35)) & 0x700000030801005) != 0)
        break;
LABEL_136:
      v57 = v58;
      if ((int)v58 >= v21)
        goto LABEL_137;
    }
  }
LABEL_97:
  if (!v7)
  {
LABEL_99:
    v52 = 0;
    goto LABEL_100;
  }
  v52 = 0;
  *v7 = 1;
LABEL_100:

  return v52;
}

void sub_208473368(_Unwind_Exception *a1)
{
  void *v1;
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v5;
  uint64_t v6;

  v5 = *(_QWORD **)(v3 - 104);
  if (v5 == v2)
  {
    v6 = 4;
    v5 = (_QWORD *)(v3 - 128);
  }
  else
  {
    if (!v5)
      goto LABEL_6;
    v6 = 5;
  }
  (*(void (**)(void))(*v5 + 8 * v6))();
LABEL_6:

  _Unwind_Resume(a1);
}

__CFString *userVisibleStringForURL(NSURL *a1, BOOL *a2)
{
  NSURL *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  char *v8;
  char *v9;
  char *v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  BOOL v15;
  char v16;
  BOOL v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t v20;
  BOOL v21;
  int v22;
  unsigned int v23;
  __CFString *v24;
  NSString *v25;
  int v26;
  char *v27;
  unsigned int v28;
  char *v29;
  char *v30;
  char v31;
  char v32;
  char v33;
  unsigned int v34;
  void *v35;
  __CFString *v36;
  void *v37;
  CFIndex Length;
  char *v39;
  UniChar *v40;
  CFIndex v41;
  unsigned int v42;
  unsigned __int8 v43;
  uint64_t v44;
  CFIndex v45;
  unsigned int v46;
  CFIndex v48;
  int v49;
  BOOL v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  char *v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  char *v63;
  __int16 v64;
  uint64_t v65;
  char *v66;
  char *v67;
  char *v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  char *v75;
  __int16 v76;
  unsigned int v77;
  int v78;
  unsigned int v79;
  char *v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  unint64_t v85;
  uint64_t v86;
  char *v87;
  char *v88;
  __int16 v89;
  char v90;
  unsigned int v91;
  __int16 v92;
  __int16 v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  unint64_t v97;
  unint64_t v98;
  uint64_t v99;
  char *v100;
  char *v101;
  __int16 v102;
  const UniChar *v103;
  char *v104;
  __CFString *v106;
  NSURL *v107;
  CFIndex v108;
  CFIndex v109;
  size_t v110;
  unsigned int v111;
  _QWORD v112[5];
  void *__p;
  void *p_p;
  uint64_t v115;
  char v116;
  __int16 v117;
  __int16 v118;
  char *v119;
  char *v120;
  _QWORD v121[2];
  CFRange v122;

  v3 = a1;
  -[NSURL _lp_originalData](v3, "_lp_originalData");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = objc_msgSend(v4, "bytes");
  v6 = objc_msgSend(v4, "length");
  v7 = v6;
  if ((int)v6 >= 715827882)
  {
    v24 = 0;
  }
  else
  {
    v107 = v3;
    v110 = (0x300000000 * v6 + 0x100000000) >> 32;
    v8 = (char *)malloc_type_malloc(v110, 0xE8F59FE3uLL);
    v9 = v8;
    v10 = v8;
    if (v7 >= 1)
    {
      v11 = 0;
      v10 = v8;
      do
      {
        v12 = v11;
        v13 = *(unsigned __int8 *)(v5 + v11);
        v14 = v11 + 1;
        v15 = v13 == 37 && (int)v14 < v7;
        if (!v15
          || (v16 = *(_BYTE *)(v5 + v14), (v16 - 48) >= 0xAu)
          && (*(unsigned __int8 *)(v5 + v14) - 65 <= 0x25
            ? (v17 = ((1 << (v16 - 65)) & 0x3F0000003FLL) == 0)
            : (v17 = 1),
              v17)
          || (v18 = v11 + 2, v11 + 2 >= v7)
          || (*(_BYTE *)(v5 + v18) - 48) >= 0xAu
          && ((v19 = *(unsigned __int8 *)(v5 + v18) - 65, v15 = v19 > 0x25, v20 = (1 << v19) & 0x3F0000003FLL, !v15)
            ? (v21 = v20 == 0)
            : (v21 = 1),
              v21))
        {
          *v10++ = v13;
        }
        else
        {
          v22 = hexDigitValue(v16);
          v23 = hexDigitValue(*(char *)(v5 + v18)) | (16 * v22);
          if (v23 < 0x80)
          {
            *v10 = *(_BYTE *)(v5 + v12);
            v10[1] = *(_BYTE *)(v5 + v14);
            v10[2] = *(_BYTE *)(v5 + v18);
            v10 += 3;
          }
          else
          {
            *v10++ = v23;
          }
          v11 = v12 + 2;
        }
        ++v11;
      }
      while (v11 < v7);
    }
    *v10 = 0;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v9);
    v25 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (!v25)
    {
      v26 = (_DWORD)v10 - (_DWORD)v9;
      v27 = &v9[v110 - ((int)v10 - (int)v9)];
      memmove(v27 - 1, v9, v26 + 1);
      v28 = *(v27 - 1);
      v29 = v9;
      if (*(v27 - 1))
      {
        v30 = v9;
        do
        {
          if ((v28 & 0x80) != 0)
          {
            if (v28 <= 0x9F)
              v31 = 48;
            else
              v31 = 55;
            v30[1] = v31 + (v28 >> 4);
            v28 &= 0xFu;
            if (v28 <= 9)
              v32 = 48;
            else
              v32 = 55;
            v33 = v32 + v28;
            v29 = v30 + 3;
            v30[2] = v33;
            LOBYTE(v28) = 37;
          }
          else
          {
            v29 = v30 + 1;
          }
          *v30 = v28;
          v34 = *v27++;
          v28 = v34;
          v30 = v29;
        }
        while (v34);
      }
      *v29 = 0;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v9);
      v25 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    free(v9);
    v3 = v107;
    mapHostNames(v25, 0, a2);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v35, "precomposedStringWithCanonicalMapping");
    v36 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (a2 && !*a2)
    {
      __p = 0;
      p_p = &__p;
      v115 = 0x2020000000;
      v116 = 0;
      v112[0] = MEMORY[0x24BDAC760];
      v112[1] = 3221225472;
      v112[2] = ___ZL23userVisibleStringForURLP5NSURLPb_block_invoke;
      v112[3] = &unk_24C0A24C8;
      v112[4] = &__p;
      v37 = (void *)MEMORY[0x20BD08ABC](v112);
      applyHostNameFunctionToURLString(v36, v37);
      *a2 |= *((_BYTE *)p_p + 24);

      _Block_object_dispose(&__p, 8);
    }
    Length = CFStringGetLength(v36);
    __p = 0;
    p_p = 0;
    v115 = 0;
    if (Length)
    {
      std::vector<unsigned short>::__vallocate[abi:nn180100](&__p, Length);
      v39 = (char *)p_p;
      bzero(p_p, 2 * Length);
      p_p = &v39[2 * Length];
      v40 = (UniChar *)__p;
    }
    else
    {
      v40 = 0;
    }
    v122.location = 0;
    v122.length = Length;
    CFStringGetCharacters(v36, v122, v40);
    v119 = 0;
    v120 = 0;
    v121[0] = 0;
    if (Length >= 1)
    {
      v106 = v36;
      v41 = 0;
      v42 = 0;
      v43 = 0;
      v44 = 0;
      v108 = Length;
      while (1)
      {
        v45 = v41 + 1;
        v46 = *((unsigned __int16 *)__p + v41);
        if ((v46 & 0xFC00) != 0xD800 || v45 == Length)
        {
          v48 = v41 + 1;
        }
        else
        {
          v49 = *((unsigned __int16 *)__p + v45);
          v50 = (v49 & 0xFC00) == 56320;
          v51 = v49 + (v46 << 10) - 56613888;
          if (v50)
            v46 = v51;
          if (v50)
            v48 = v41 + 2;
          else
            v48 = v41 + 1;
        }
        v109 = v48;
        v111 = v46;
        if (isLookalikeCharacter(v44 | v43 | v42, v46))
        {
          if (v46 <= 0x7F)
          {
            LOBYTE(v117) = v46;
            v52 = 1;
            goto LABEL_95;
          }
          if (v46 <= 0x7FF)
          {
            LOBYTE(v117) = (v46 >> 6) | 0xC0;
            HIBYTE(v117) = v46 & 0x3F | 0x80;
            v52 = 2;
            goto LABEL_95;
          }
          if (v46 >> 11 < 0x1B || (v46 & 0xFFFFE000) == 0xE000)
          {
            LOBYTE(v117) = (v46 >> 12) | 0xE0;
            HIBYTE(v117) = (v46 >> 6) & 0x3F | 0x80;
            LOBYTE(v118) = v46 & 0x3F | 0x80;
            v52 = 3;
LABEL_95:
            v65 = 0;
            v66 = v120;
            do
            {
              v67 = (char *)v121[0];
              if ((unint64_t)v66 >= v121[0])
              {
                v69 = v119;
                v70 = v66 - v119;
                if (v66 - v119 <= -3)
                  abort();
                v71 = v70 >> 1;
                if (v121[0] - (_QWORD)v119 <= (unint64_t)((v70 >> 1) + 1))
                  v72 = v71 + 1;
                else
                  v72 = v121[0] - (_QWORD)v119;
                if (v121[0] - (_QWORD)v119 >= 0x7FFFFFFFFFFFFFFEuLL)
                  v73 = 0x7FFFFFFFFFFFFFFFLL;
                else
                  v73 = v72;
                if (v73)
                {
                  v74 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned short>>((uint64_t)v121, v73);
                  v69 = v119;
                  v66 = v120;
                }
                else
                {
                  v74 = 0;
                }
                v75 = &v74[2 * v71];
                *(_WORD *)v75 = 37;
                v68 = v75 + 2;
                while (v66 != v69)
                {
                  v76 = *((_WORD *)v66 - 1);
                  v66 -= 2;
                  *((_WORD *)v75 - 1) = v76;
                  v75 -= 2;
                }
                v67 = &v74[2 * v73];
                v119 = v75;
                v120 = v68;
                v121[0] = v67;
                if (v69)
                {
                  operator delete(v69);
                  v67 = (char *)v121[0];
                }
              }
              else
              {
                *(_WORD *)v66 = 37;
                v68 = v66 + 2;
              }
              v120 = v68;
              v77 = *((unsigned __int8 *)&v117 + v65);
              if (v77 <= 0x9F)
                v78 = 48;
              else
                v78 = 55;
              v79 = v78 + (v77 >> 4);
              if (v68 >= v67)
              {
                v81 = v119;
                v82 = v68 - v119;
                if (v68 - v119 <= -3)
                  abort();
                v83 = v82 >> 1;
                v84 = v67 - v119;
                if (v84 <= (v82 >> 1) + 1)
                  v85 = v83 + 1;
                else
                  v85 = v84;
                if (v84 >= 0x7FFFFFFFFFFFFFFELL)
                  v86 = 0x7FFFFFFFFFFFFFFFLL;
                else
                  v86 = v85;
                if (v86)
                {
                  v87 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned short>>((uint64_t)v121, v86);
                  v81 = v119;
                  v68 = v120;
                }
                else
                {
                  v87 = 0;
                }
                v88 = &v87[2 * v83];
                *(_WORD *)v88 = v79;
                v80 = v88 + 2;
                while (v68 != v81)
                {
                  v89 = *((_WORD *)v68 - 1);
                  v68 -= 2;
                  *((_WORD *)v88 - 1) = v89;
                  v88 -= 2;
                }
                v67 = &v87[2 * v86];
                v119 = v88;
                v120 = v80;
                v121[0] = v67;
                if (v81)
                {
                  operator delete(v81);
                  v67 = (char *)v121[0];
                }
              }
              else
              {
                *(_WORD *)v68 = v79;
                v80 = v68 + 2;
              }
              v90 = *((_BYTE *)&v117 + v65);
              v120 = v80;
              v91 = v90 & 0xF;
              if (v91 <= 9)
                v92 = 48;
              else
                v92 = 55;
              v93 = v92 + v91;
              if (v80 >= v67)
              {
                v94 = v119;
                v95 = v80 - v119;
                if (v80 - v119 <= -3)
                  abort();
                v96 = v95 >> 1;
                v97 = v67 - v119;
                if (v97 <= (v95 >> 1) + 1)
                  v98 = v96 + 1;
                else
                  v98 = v97;
                if (v97 >= 0x7FFFFFFFFFFFFFFELL)
                  v99 = 0x7FFFFFFFFFFFFFFFLL;
                else
                  v99 = v98;
                if (v99)
                {
                  v100 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned short>>((uint64_t)v121, v99);
                  v94 = v119;
                  v80 = v120;
                }
                else
                {
                  v100 = 0;
                }
                v101 = &v100[2 * v96];
                *(_WORD *)v101 = v93;
                v66 = v101 + 2;
                while (v80 != v94)
                {
                  v102 = *((_WORD *)v80 - 1);
                  v80 -= 2;
                  *((_WORD *)v101 - 1) = v102;
                  v101 -= 2;
                }
                v119 = v101;
                v120 = v66;
                v121[0] = &v100[2 * v99];
                if (v94)
                  operator delete(v94);
              }
              else
              {
                *(_WORD *)v80 = v93;
                v66 = v80 + 2;
              }
              v120 = v66;
              ++v65;
            }
            while (v65 != v52);
            goto LABEL_154;
          }
          if (!((v46 - 0x10000) >> 20))
          {
            LOBYTE(v117) = (v46 >> 18) | 0xF0;
            HIBYTE(v117) = (v46 >> 12) & 0x3F | 0x80;
            LOBYTE(v118) = (v46 >> 6) & 0x3F | 0x80;
            HIBYTE(v118) = v46 & 0x3F | 0x80;
            v52 = 4;
            goto LABEL_95;
          }
        }
        else
        {
          if (!HIWORD(v46))
          {
            v117 = v46;
            v53 = 1;
            goto LABEL_70;
          }
          if (HIWORD(v46) <= 0x10u)
          {
            v117 = (v46 >> 10) - 10304;
            v118 = v46 & 0x3FF | 0xDC00;
            v53 = 2;
LABEL_70:
            v54 = 0;
            v55 = v120;
            do
            {
              if ((unint64_t)v55 >= v121[0])
              {
                v57 = v119;
                v58 = v55 - v119;
                if (v55 - v119 <= -3)
                  abort();
                v59 = v58 >> 1;
                if (v121[0] - (_QWORD)v119 <= (unint64_t)((v58 >> 1) + 1))
                  v60 = v59 + 1;
                else
                  v60 = v121[0] - (_QWORD)v119;
                if (v121[0] - (_QWORD)v119 >= 0x7FFFFFFFFFFFFFFEuLL)
                  v61 = 0x7FFFFFFFFFFFFFFFLL;
                else
                  v61 = v60;
                if (v61)
                {
                  v62 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned short>>((uint64_t)v121, v61);
                  v57 = v119;
                  v55 = v120;
                }
                else
                {
                  v62 = 0;
                }
                v63 = &v62[2 * v59];
                *(_WORD *)v63 = *(&v117 + v54);
                v56 = v63 + 2;
                while (v55 != v57)
                {
                  v64 = *((_WORD *)v55 - 1);
                  v55 -= 2;
                  *((_WORD *)v63 - 1) = v64;
                  v63 -= 2;
                }
                v119 = v63;
                v120 = v56;
                v121[0] = &v62[2 * v61];
                if (v57)
                  operator delete(v57);
              }
              else
              {
                *(_WORD *)v55 = *(&v117 + v54);
                v56 = v55 + 2;
              }
              v120 = v56;
              ++v54;
              v55 = v56;
            }
            while (v54 != v53);
          }
        }
LABEL_154:
        v43 = v111;
        v42 = v111 & 0xFFFFFF00;
        v44 = 0x100000000;
        Length = v108;
        v41 = v109;
        if (v109 >= v108)
        {
          v103 = (const UniChar *)v119;
          v104 = v120;
          v3 = v107;
          v36 = v106;
          goto LABEL_157;
        }
      }
    }
    v104 = 0;
    v103 = 0;
LABEL_157:
    v24 = (__CFString *)CFStringCreateWithCharacters(0, v103, (v104 - (char *)v103) >> 1);
    if (v119)
    {
      v120 = v119;
      operator delete(v119);
    }
    if (__p)
    {
      p_p = __p;
      operator delete(__p);
    }

  }
  return v24;
}

void sub_208473CC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21)
{
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  _Block_object_dispose(&__p, 8);
  _Unwind_Resume(a1);
}

BOOL isLookalikeCharacter(uint64_t a1, UChar32 c)
{
  _BOOL8 result;
  UBlockCode Code;
  int v6;
  int v7;
  int v8;
  int v9;
  BOOL v11;

  if (!u_isprint(c) || u_isUWhiteSpace(c) || u_hasBinaryProperty(c, UCHAR_DEFAULT_IGNORABLE_CODE_POINT))
    return 1;
  Code = ublock_getCode(c);
  result = 1;
  if (Code == UBLOCK_IPA_EXTENSIONS || Code == UBLOCK_DESERET)
    return result;
  if (c > 8721)
  {
    if (c <= 12289)
    {
      if (c > 11002)
      {
        if ((c - 12272) < 0xC || c == 11003)
          return result;
        v9 = 11005;
      }
      else if (c <= 9133)
      {
        if ((c - 8722) <= 0x24 && ((1 << (c - 18)) & 0x1000000019) != 0)
          return result;
        v9 = 9023;
      }
      else if (c <= 9584)
      {
        if (c == 9134)
          return result;
        v9 = 9290;
      }
      else
      {
        if ((c - 9585) < 2 || c == 10742)
          return result;
        v9 = 10744;
      }
    }
    else if (c > 65043)
    {
      if (c <= 65376)
      {
        if ((c - 65087) <= 0x1F && ((1 << (c - 63)) & 0xC0000001) != 0 || (c - 65044) < 2)
          return result;
        v8 = -65294;
        goto LABEL_72;
      }
      if ((c - 128271) < 5 || (c - 65532) < 2)
        return result;
      v9 = 65377;
    }
    else
    {
      if (c <= 13229)
      {
        if ((c - 12290) <= 0x33 && ((1 << (c - 2)) & 0xA0000000C0041) != 0)
          return result;
        v8 = -12829;
        goto LABEL_72;
      }
      if (c <= 42800)
      {
        if ((c - 13230) > 0x31 || ((1 << (c + 82)) & 0x2000001000003) == 0)
          goto LABEL_86;
        return result;
      }
      if (c == 42801 || c == 42865)
        return result;
      v9 = 42889;
    }
    goto LABEL_85;
  }
  if (c > 5940)
  {
    if (c > 8207)
    {
      if ((c - 8531) < 0xD
        || (c - 8228) <= 0x2E && ((1 << (c - 36)) & 0x400120600009) != 0)
      {
        return result;
      }
      v8 = -8208;
      goto LABEL_72;
    }
    if (c > 7835)
    {
      if ((c - 7836) < 2)
        return result;
      v8 = -7934;
LABEL_72:
      if ((c + v8) < 2)
        return result;
      goto LABEL_86;
    }
    if ((c - 7428) <= 0x1E && ((1 << (c - 4)) & 0x71000801) != 0)
      return result;
    v9 = 5941;
LABEL_85:
    if (c != v9)
      goto LABEL_86;
    return result;
  }
  if (c <= 1416)
  {
    if (c <= 566)
    {
      if (c > 447)
      {
        if (c != 448 && c != 451)
          goto LABEL_86;
      }
      else if ((c - 188) >= 3)
      {
        if (c == 46)
          return 0;
        goto LABEL_86;
      }
      return result;
    }
    if (c <= 774)
    {
      if (((c - 567) > 0x2A || ((1 << (c - 55)) & 0x40004000001) == 0) && c != 720)
        goto LABEL_86;
      return result;
    }
    if ((c - 823) < 2)
      return result;
    if (c == 775)
    {
      v11 = (_DWORD)a1 == 567 || (_DWORD)a1 == 305;
      if ((a1 & 0xFF00000000) == 0 || !v11)
        return (a1 & 0xFF00000000) != 0 && (_DWORD)a1 == 1493;
      return result;
    }
    if (c == 821)
      return result;
LABEL_86:
    if ((isLookalikeSequence<(UScriptCode)3>(a1, c) & 1) != 0
      || (isLookalikeSequence<(UScriptCode)35>(a1, c) & 1) != 0
      || (isLookalikeSequence<(UScriptCode)40>(a1, c) & 1) != 0
      || (isLookalikeSequence<(UScriptCode)38>(a1, c) & 1) != 0)
    {
      return 1;
    }
    if ((c - 1611) <= 0x14)
    {
      if ((a1 & 0xFF00000000) != 0)
        return ublock_getCode(a1) != UBLOCK_ARABIC;
      return 1;
    }
    return 0;
  }
  if (c > 1615)
  {
    if ((c - 1748) <= 0x30 && ((1 << (c + 44)) & 0x1E00010000001) != 0)
      return result;
    if ((c - 1616) > 0x1A)
      goto LABEL_86;
    v6 = 1 << (c - 80);
    v7 = 67174401;
  }
  else
  {
    if ((c - 1417) <= 0x3B && ((1 << (c + 119)) & 0xF0B080000000001) != 0)
      return result;
    if ((c - 1524) > 0x16)
      goto LABEL_86;
    v6 = 1 << (c + 12);
    v7 = 6291457;
  }
  if ((v6 & v7) == 0)
    goto LABEL_86;
  return result;
}

uint64_t isLookalikeSequence<(UScriptCode)40>(uint64_t a1, unsigned __int16 a2)
{
  uint64_t result;
  unsigned int v5;
  unint64_t v6;

  result = 0;
  if ((a1 & 0xFF00000000) != 0 && a1 != 47)
  {
    if (isLookalikeCharacterOfScriptType<(UScriptCode)40>(a2) && !isOfScriptType<(UScriptCode)40>())
    {
      if ((unsigned __int16)(a1 - 33) >= 0x20u)
      {
        result = 1;
        if ((unsigned __int16)a1 - 94 > 0x20
          || ((1 << (a1 - 94)) & 0x1E0000007) == 0)
        {
          return result;
        }
      }
      else if ((unsigned __int16)(a1 - 35) < 0x1Eu && ((0x30801005u >> (a1 - 35)) & 1) != 0)
      {
        return 1;
      }
    }
    result = isLookalikeCharacterOfScriptType<(UScriptCode)40>((unsigned __int16)a1);
    if ((_DWORD)result)
    {
      if (isOfScriptType<(UScriptCode)40>())
      {
        return 0;
      }
      else
      {
        v5 = (0x30801005u >> (a2 - 35)) & 1;
        if ((unsigned __int16)(a2 - 35) >= 0x1Eu)
          v5 = 0;
        v6 = (0x1FFFFFF8uLL >> (a2 - 94)) & 1;
        if ((unsigned __int16)(a2 - 94) >= 0x21u)
          LODWORD(v6) = 1;
        if ((unsigned __int16)(a2 - 33) >= 0x20u)
          return v6;
        else
          return v5;
      }
    }
  }
  return result;
}

uint64_t isLookalikeCharacterOfScriptType<(UScriptCode)40>(int a1)
{
  uint64_t result;
  unsigned int v3;

  result = 1;
  if (a1 > 5572)
  {
    if (((a1 - 5573) > 0x2F || ((1 << (a1 + 59)) & 0x901002000001) == 0)
      && (a1 - 5741) >= 2)
    {
      return 0;
    }
  }
  else if ((a1 - 5229) > 0x3D || ((1 << (a1 - 109)) & 0x2000000000000025) == 0)
  {
    v3 = a1 - 5500;
    if (v3 > 0x38 || ((1 << v3) & 0x108000000000801) == 0)
      return 0;
  }
  return result;
}

unint64_t isLookalikeSequence<(UScriptCode)3>(uint64_t a1, unsigned __int16 a2)
{
  unint64_t result;
  unsigned int v5;
  unint64_t v6;

  result = 0;
  if ((a1 & 0xFF00000000) != 0 && a1 != 47)
  {
    if (a2 - 1352 <= 0x3D
      && ((1 << (a2 - 72)) & 0x2221000000002221) != 0
      && !isOfScriptType<(UScriptCode)3>())
    {
      v5 = (0x30801005u >> (a1 - 35)) & 1;
      if ((unsigned __int16)(a1 - 35) >= 0x1Eu)
        v5 = 0;
      v6 = (0x1FFFFFF8uLL >> (a1 - 94)) & 1;
      if ((unsigned __int16)(a1 - 94) >= 0x21u)
        LODWORD(v6) = 1;
      if ((unsigned __int16)(a1 - 33) >= 0x20u)
        return v6;
      else
        return v5;
    }
    else
    {
      result = 0;
      if ((unsigned __int16)a1 - 1352 <= 0x3D
        && ((1 << (a1 - 72)) & 0x2221000000002221) != 0)
      {
        if (isOfScriptType<(UScriptCode)3>())
        {
          return 0;
        }
        else if ((unsigned __int16)(a2 - 33) >= 0x20u)
        {
          if ((unsigned __int16)(a2 - 94) >= 0x21u)
            return 1;
          else
            return (0x1FFFFFF8uLL >> (a2 - 94)) & 1;
        }
        else if ((unsigned __int16)(a2 - 35) >= 0x1Eu)
        {
          return 0;
        }
        else
        {
          return (0x30801005u >> (a2 - 35)) & 1;
        }
      }
    }
  }
  return result;
}

uint64_t isLookalikeSequence<(UScriptCode)38>(uint64_t a1, __int16 a2)
{
  uint64_t result;
  unsigned int v5;
  unsigned int v6;
  unsigned __int16 v7;
  BOOL v8;
  unint64_t v9;

  result = 0;
  if ((a1 & 0xFF00000000) != 0 && a1 != 47)
  {
    if (a2 == 3585 && !isOfScriptType<(UScriptCode)38>())
    {
      v5 = (unsigned __int16)(a1 - 33);
      v6 = (0x30801005u >> (a1 - 35)) & 1;
      if ((unsigned __int16)(a1 - 35) >= 0x1Eu)
        v6 = 0;
      v7 = a1 - 94;
    }
    else
    {
      if ((unsigned __int16)a1 != 3585 || isOfScriptType<(UScriptCode)38>())
        return 0;
      v5 = (unsigned __int16)(a2 - 33);
      v6 = (0x30801005u >> (a2 - 35)) & 1;
      if ((unsigned __int16)(a2 - 35) >= 0x1Eu)
        v6 = 0;
      v7 = a2 - 94;
    }
    v8 = v7 >= 0x21u;
    v9 = (0x1FFFFFF8uLL >> v7) & 1;
    if (v8)
      LODWORD(v9) = 1;
    if (v5 >= 0x20)
      return v9;
    else
      return v6;
  }
  return result;
}

uint64_t isLookalikeSequence<(UScriptCode)35>(uint64_t a1, __int16 a2)
{
  uint64_t result;
  unsigned int v5;
  unsigned int v6;
  unsigned __int16 v7;
  BOOL v8;
  unint64_t v9;

  result = 0;
  if ((a1 & 0xFF00000000) != 0 && a1 != 47)
  {
    if (a2 == 3046 && !isOfScriptType<(UScriptCode)35>())
    {
      v5 = (unsigned __int16)(a1 - 33);
      v6 = (0x30801005u >> (a1 - 35)) & 1;
      if ((unsigned __int16)(a1 - 35) >= 0x1Eu)
        v6 = 0;
      v7 = a1 - 94;
    }
    else
    {
      if ((unsigned __int16)a1 != 3046 || isOfScriptType<(UScriptCode)35>())
        return 0;
      v5 = (unsigned __int16)(a2 - 33);
      v6 = (0x30801005u >> (a2 - 35)) & 1;
      if ((unsigned __int16)(a2 - 35) >= 0x1Eu)
        v6 = 0;
      v7 = a2 - 94;
    }
    v8 = v7 >= 0x21u;
    v9 = (0x1FFFFFF8uLL >> v7) & 1;
    if (v8)
      LODWORD(v9) = 1;
    if (v5 >= 0x20)
      return v9;
    else
      return v6;
  }
  return result;
}

uint64_t ___ZL33internationalDomainNameTranscoderv_block_invoke()
{
  uint64_t result;
  int v1;

  v1 = 0;
  result = MEMORY[0x20BD08B7C](60, &v1);
  internationalDomainNameTranscoder(void)::encoder = result;
  return result;
}

void ___ZL12mapHostNamesP8NSStringbPb_block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (!v7)
  {
    v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  }
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", a3, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v11);

}

void sub_208474858(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void applyHostNameFunctionToURLString(void *a1, void *a2)
{
  id v3;
  id v4;
  void (**v5)(id, id, _QWORD, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  int v22;
  int v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  int v30;
  unsigned int v31;
  void *v32;
  id v33;

  v33 = a1;
  v3 = a2;
  if (objc_msgSend(v33, "_lp_hasCaseInsensitivePrefix:", CFSTR("mailto:")))
  {
    v4 = v33;
    v5 = (void (**)(id, id, _QWORD, uint64_t))v3;
    {
      objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("\"@?"));
      applyHostNameFunctionToMailToURLString(NSString *,void({block_pointer})(NSString *,_NSRange))::hostNameOrStringStartCharacters = objc_claimAutoreleasedReturnValue();
    }
    {
      objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR(">,?"));
      applyHostNameFunctionToMailToURLString(NSString *,void({block_pointer})(NSString *,_NSRange))::hostNameEndCharacters = objc_claimAutoreleasedReturnValue();
    }
    {
      objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("\"\\"));
      applyHostNameFunctionToMailToURLString(NSString *,void({block_pointer})(NSString *,_NSRange))::quotedStringCharacters = objc_claimAutoreleasedReturnValue();
    }
    v6 = 0;
    v7 = objc_msgSend(v4, "length");
    v8 = v7;
LABEL_9:
    do
    {
      v10 = objc_msgSend(v4, "rangeOfCharacterFromSet:options:range:", applyHostNameFunctionToMailToURLString(NSString *,void({block_pointer})(NSString *,_NSRange))::hostNameOrStringStartCharacters, 0, v6, v8);
      if (v10 == 0x7FFFFFFFFFFFFFFFLL)
        break;
      v11 = v9;
      v12 = objc_msgSend(v4, "characterAtIndex:", v10);
      v13 = v10 + v11;
      if (v12 != 64)
      {
        if (v12 != 63)
        {
          while (1)
          {
            v15 = objc_msgSend(v4, "rangeOfCharacterFromSet:options:range:", applyHostNameFunctionToMailToURLString(NSString *,void({block_pointer})(NSString *,_NSRange))::quotedStringCharacters, 0, v13);
            if (v15 == 0x7FFFFFFFFFFFFFFFLL)
              break;
            v16 = v14;
            v17 = objc_msgSend(v4, "characterAtIndex:", v15);
            v6 = v15 + v16;
            v8 = v7 - v6;
            if (v17 == 34)
              goto LABEL_9;
            if (!v8)
              break;
            v13 = v6 + 1;
          }
        }
        break;
      }
      v18 = objc_msgSend(v4, "rangeOfCharacterFromSet:options:range:", applyHostNameFunctionToMailToURLString(NSString *,void({block_pointer})(NSString *,_NSRange))::hostNameEndCharacters, 0, v13, v7 - v13);
      v6 = v18;
      if (v18 == 0x7FFFFFFFFFFFFFFFLL)
        v19 = v7;
      else
        v19 = v18;
      v5[2](v5, v4, v13, v19 - v13);
      v8 = v7 - v6;
    }
    while (v6 != 0x7FFFFFFFFFFFFFFFLL);

  }
  else
  {
    v21 = objc_msgSend(v33, "rangeOfString:", CFSTR("://"));
    if (v21 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v22 = v20;
      {
        objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+-."));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "invertedSet");
        applyHostNameFunctionToURLString(NSString *,void({block_pointer})(NSString *,_NSRange))::nonSchemeCharacters = objc_claimAutoreleasedReturnValue();

      }
      if (objc_msgSend(v33, "rangeOfCharacterFromSet:options:range:", applyHostNameFunctionToURLString(NSString *,void({block_pointer})(NSString *,_NSRange))::nonSchemeCharacters, 0, 0, v21) == 0x7FFFFFFFFFFFFFFFLL)
      {
        v23 = objc_msgSend(v33, "length");
        {
          v24 = applyHostNameFunctionToURLString(NSString *,void({block_pointer})(NSString *,_NSRange))::hostTerminators;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR(":/?#"));
          v24 = objc_claimAutoreleasedReturnValue();
          applyHostNameFunctionToURLString(NSString *,void({block_pointer})(NSString *,_NSRange))::hostTerminators = v24;
        }
        v25 = v21 + v22;
        v26 = (v21 + v22);
        v27 = objc_msgSend(v33, "rangeOfCharacterFromSet:options:range:", v24, 0, v26, (v23 - v25));
        if (v27 == 0x7FFFFFFFFFFFFFFFLL)
          v28 = v23;
        else
          v28 = v27;
        v29 = objc_msgSend(v33, "rangeOfString:options:range:", CFSTR("@"), 0, v26, (v28 - v25));
        v31 = v29 + v30;
        if (v29 == 0x7FFFFFFFFFFFFFFFLL)
          v31 = v26;
        (*((void (**)(id, id, _QWORD, _QWORD))v3 + 2))(v3, v33, v31, v28 - v31);
      }
    }
  }

}

void sub_208474C2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

NSString *mapHostNames(NSString *a1, int a2, BOOL *a3)
{
  NSString *v5;
  NSString *v6;
  NSString *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  unsigned int v12;
  uint64_t v13;
  void *v14;
  NSUInteger v15;
  NSUInteger v16;
  NSUInteger v17;
  uint64_t v18;
  uint64_t v19;
  BOOL *v20;
  _NSRange v21;
  uint64_t v22;
  void *v23;
  NSString *v24;
  BOOL v26;
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v5 = a1;
  v6 = v5;
  if (a2 && -[NSString canBeConvertedToEncoding:](v5, "canBeConvertedToEncoding:", 1))
  {
    v7 = v6;
  }
  else
  {
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__0;
    v32 = __Block_byref_object_dispose__0;
    v33 = 0;
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = ___ZL12mapHostNamesP8NSStringbPb_block_invoke;
    v27[3] = &unk_24C0A24C8;
    v27[4] = &v28;
    v8 = (void *)MEMORY[0x20BD08ABC](v27);
    applyHostNameFunctionToURLString(v6, v8);
    v9 = (void *)v29[5];
    if (v9)
    {
      v10 = objc_msgSend(v9, "count");
      v11 = 0;
      if (v10)
      {
        v12 = v10 - 1;
        do
        {
          v13 = v12;
          objc_msgSend((id)v29[5], "objectAtIndex:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "rangeValue");
          v17 = v16;

          v26 = 0;
          v21.location = v15;
          v21.length = v17;
          if (a2)
            encodeHostNameWithRange(v6, v21, v18, v19, v20);
          else
            decodeHostNameWithRange(v6, v21, &v26, v19, v20);
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = (void *)v22;
          if (a3)
            *a3 |= v26;
          if (v22)
          {
            if (!v11)
              v11 = (void *)-[NSString mutableCopy](v6, "mutableCopy");
            objc_msgSend(v11, "replaceCharactersInRange:withString:", v15, v17, v23);
          }

          --v12;
        }
        while (v13);
      }
      if (v11)
        v24 = (NSString *)v11;
      else
        v24 = v6;
      v7 = v24;

    }
    else
    {
      v7 = v6;
    }

    _Block_object_dispose(&v28, 8);
  }

  return v7;
}

void sub_208474E84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  void *v20;
  void *v21;

  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_208475008(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2084750B4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2084751C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_20847529C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2084752D4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_208475364(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2084753F4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

unint64_t damerauLevenshteinDistance(NSString *a1, NSString *a2)
{
  __CFString *v3;
  __CFString *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  const char *CStringPtr;
  const char *v17;
  uint64_t v18;
  unint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  int v25;
  int64_t v26;
  int64_t v27;
  int64_t v28;
  int64_t v29;
  int64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  int v34;
  uint64_t v35;
  char *v36;
  int64_t v37;
  UniChar *v38;
  uint64_t v39;
  int v40;
  int64_t v41;
  uint64_t v42;
  UniChar v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  unsigned int v48;
  int v49;
  unsigned int v50;
  int64_t v51;
  UniChar *v52;
  uint64_t v53;
  UniChar v54;
  int64_t v55;
  uint64_t v56;
  UniChar *v57;
  unsigned __int16 v58;
  int v59;
  uint64_t v60;
  int v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v65;
  unint64_t v66;
  uint64_t *v67;
  __CFString *v68;
  __CFString *v69;
  unint64_t v70;
  int64_t v71;
  uint64_t v72;
  int64_t v73;
  uint64_t v74;
  int v75;
  uint64_t v76;
  int64_t v77;
  int64_t v78;
  char *v79;
  unint64_t v80;
  char *v81;
  int v82;
  int v83;
  UniChar v84[64];
  __CFString *v85;
  const UniChar *v86;
  const char *v87;
  uint64_t v88;
  int64_t v89;
  uint64_t v90;
  int64_t v91;
  UniChar v92[64];
  __CFString *v93;
  const UniChar *CharactersPtr;
  const char *v95;
  uint64_t v96;
  int64_t v97;
  int64_t v98;
  int64_t v99;
  uint64_t v100;
  CFRange v101;
  CFRange v102;
  CFRange v103;
  CFRange v104;

  v100 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  v70 = -[__CFString length](v3, "length");
  v5 = -[__CFString length](v4, "length");
  v11 = v5;
  if (v70 <= 0x3E8 && v5 < 0x3E9 && v70 && v5)
  {
    v12 = v5 + 1;
    MEMORY[0x24BDAC7A8](v5, v6, v7, v8, v9, v10);
    v14 = (char *)&v65 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    v15 = 0;
    do
    {
      *(_DWORD *)&v14[4 * v15] = v15;
      ++v15;
    }
    while (v12 != v15);
    v93 = v3;
    v96 = 0;
    v97 = v70;
    v68 = v4;
    v69 = v3;
    CharactersPtr = CFStringGetCharactersPtr(v3);
    if (CharactersPtr)
      CStringPtr = 0;
    else
      CStringPtr = CFStringGetCStringPtr(v3, 0x600u);
    v98 = 0;
    v99 = 0;
    v95 = CStringPtr;
    v85 = v4;
    v88 = 0;
    v89 = v11;
    v86 = CFStringGetCharactersPtr(v4);
    v67 = &v65;
    if (v86)
      v17 = 0;
    else
      v17 = CFStringGetCStringPtr(v4, 0x600u);
    v66 = v11;
    if (v11 <= 1)
      v18 = 1;
    else
      v18 = v11;
    v90 = 0;
    v91 = 0;
    v87 = v17;
    v19 = 1;
    v20 = v14;
    v21 = &v14[4 * v12];
    v76 = v18;
    while (1)
    {
      v22 = 0;
      v23 = 0;
      v24 = v21;
      v25 = *(_DWORD *)v21;
      *(_DWORD *)v21 = v19;
      v26 = (v19 - 1);
      v27 = v26 - 4;
      if (v26 < 4)
        v27 = 0;
      v74 = v27;
      v28 = v27 + 64;
      v29 = (v19 - 2);
      v30 = v29 - 4;
      if (v29 < 4)
        v30 = 0;
      v72 = v30;
      v73 = v28;
      v71 = v30 + 64;
      v31 = -1;
      v32 = 65;
      v33 = 1;
      v34 = (int)v17;
      v80 = v19;
      v81 = v20;
      v78 = (v19 - 1);
      v79 = v24;
      v77 = (v19 - 2);
      do
      {
        LODWORD(v17) = v25;
        if (v33 >= 5)
          v35 = 5;
        else
          v35 = v33;
        v36 = &v24[v22];
        v25 = *(_DWORD *)&v24[v22 + 4];
        v37 = v97;
        if (v97 <= v26)
        {
          v40 = 0;
        }
        else
        {
          v38 = (UniChar *)CharactersPtr;
          if (CharactersPtr)
          {
            v39 = v96 + v26;
LABEL_31:
            v40 = v38[v39];
            goto LABEL_33;
          }
          if (!v95)
          {
            if (v99 <= v26 || (v44 = v98, v98 > v26))
            {
              v83 = *(_DWORD *)&v24[v22 + 4];
              v45 = (int)v17;
              if (v73 < v97)
                v37 = v73;
              v98 = v74;
              v99 = v37;
              v101.location = v96 + v74;
              v101.length = v37 - v74;
              CFStringGetCharacters(v93, v101, v92);
              v44 = v98;
              LODWORD(v19) = v80;
              v20 = v81;
              v18 = v76;
              v29 = v77;
              LODWORD(v17) = v45;
              v26 = v78;
              v24 = v79;
              v25 = v83;
            }
            v39 = v26 - v44;
            v38 = v92;
            goto LABEL_31;
          }
          v40 = v95[v96 + v26];
        }
LABEL_33:
        v41 = v23 + 1;
        v42 = v89;
        if (v89 >= v23 + 1)
        {
          if (v86)
          {
            v43 = v86[v23 + v88];
          }
          else if (v87)
          {
            v43 = v87[v88 + v23];
          }
          else
          {
            if (v91 < v41 || (v46 = v90, v90 >= v41))
            {
              v82 = v40;
              v83 = v25;
              v75 = (int)v17;
              v47 = v23 - v35 + 65;
              if (v47 >= v89)
                v47 = v89;
              v90 = v23 - v35 + 1;
              v91 = v47;
              if (v89 >= v32 - v35)
                v42 = v32 - v35;
              v102.length = v42 + v35 + v31;
              v102.location = v23 - v35 + 1 + v88;
              CFStringGetCharacters(v85, v102, v84);
              v46 = v90;
              LODWORD(v19) = v80;
              v20 = v81;
              v18 = v76;
              v29 = v77;
              LODWORD(v17) = v75;
              v26 = v78;
              v24 = v79;
              v40 = v82;
              v25 = v83;
            }
            v43 = v84[v23 - v46];
          }
        }
        else
        {
          v43 = 0;
        }
        v48 = *(_DWORD *)&v20[v22];
        v49 = *(_DWORD *)&v20[v22 + 4];
        if ((unsigned __int16)v40 != v43)
          ++v48;
        if (*(_DWORD *)&v24[v22] + 1 >= (v49 + 1))
          v50 = v49 + 1;
        else
          v50 = *(_DWORD *)&v24[v22] + 1;
        if (v48 >= v50)
          v48 = v50;
        *((_DWORD *)v36 + 1) = v48;
        if (v19 >= 2 && (unint64_t)v41 >= 2)
        {
          v51 = v97;
          if (v97 <= v29)
          {
            v54 = 0;
          }
          else
          {
            v52 = (UniChar *)CharactersPtr;
            if (CharactersPtr)
            {
              v53 = v96 + v29;
              goto LABEL_67;
            }
            if (v95)
            {
              v54 = v95[v96 + v29];
            }
            else
            {
              if (v99 <= v29 || (v60 = v98, v98 > v29))
              {
                v82 = v40;
                v83 = v25;
                v61 = (int)v17;
                if (v71 < v97)
                  v51 = v71;
                v98 = v72;
                v99 = v51;
                v103.location = v96 + v72;
                v103.length = v51 - v72;
                CFStringGetCharacters(v93, v103, v92);
                v60 = v98;
                LODWORD(v19) = v80;
                v20 = v81;
                v18 = v76;
                v29 = v77;
                LODWORD(v17) = v61;
                v26 = v78;
                v24 = v79;
                v40 = v82;
                v25 = v83;
              }
              v53 = v29 - v60;
              v52 = v92;
LABEL_67:
              v54 = v52[v53];
            }
          }
          v55 = v23 - 1;
          v56 = v89;
          if (v89 <= v23 - 1)
          {
            v58 = 0;
          }
          else
          {
            if (v86)
            {
              v57 = (UniChar *)&v86[v23 + v88];
              goto LABEL_72;
            }
            if (v87)
            {
              v58 = v87[v88 - 1 + v23];
            }
            else
            {
              if (v91 <= v55 || (v62 = v90, v90 > v55))
              {
                v82 = v40;
                v83 = v25;
                v75 = (int)v17;
                if ((unint64_t)v55 >= 4)
                  v63 = v23 - 5;
                else
                  v63 = 0;
                if (v63 + 64 < v89)
                  v56 = v63 + 64;
                v90 = v63;
                v91 = v56;
                v104.location = v88 + v63;
                v104.length = v56 - v63;
                CFStringGetCharacters(v85, v104, v84);
                v62 = v90;
                LODWORD(v19) = v80;
                v20 = v81;
                v18 = v76;
                v29 = v77;
                LODWORD(v17) = v75;
                v26 = v78;
                v24 = v79;
                LOWORD(v40) = v82;
                v25 = v83;
              }
              v57 = &v84[v23 - v62];
LABEL_72:
              v58 = *(v57 - 1);
            }
          }
          if ((unsigned __int16)v40 == v58 && v43 == v54)
          {
            if ((v34 + 1) < *((_DWORD *)v36 + 1))
              v59 = v34 + 1;
            else
              v59 = *((_DWORD *)v36 + 1);
            *((_DWORD *)v36 + 1) = v59;
          }
        }
        ++v33;
        ++v23;
        v22 += 4;
        --v31;
        ++v32;
        v34 = (int)v17;
      }
      while (v18 != v23);
      v19 = (v19 + 1);
      v21 = v20;
      v20 = v24;
      if (v70 < v19)
      {
        v11 = *(unsigned int *)&v24[4 * v66];
        v4 = v68;
        v3 = v69;
        goto LABEL_103;
      }
    }
  }
  if (v70 > v5)
    v11 = v70;
LABEL_103:

  return v11;
}

void sub_2084759F8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_208475AA4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_208475C54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_208475DE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  void *v24;
  uint64_t v25;

  _Block_object_dispose(&a19, 8);

  _Block_object_dispose((const void *)(v25 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_208475EDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_208475FB4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_208476650(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  void *v9;
  void *v10;

  _Unwind_Resume(a1);
}

uint64_t isLookalikeCharacterOfScriptType<(UScriptCode)3>(int a1)
{
  return ((a1 - 1352) < 0x3E) & (0x2221000000002221uLL >> (a1 - 72));
}

BOOL isLookalikeCharacterOfScriptType<(UScriptCode)35>(int a1)
{
  return a1 == 3046;
}

BOOL isLookalikeCharacterOfScriptType<(UScriptCode)38>(int a1)
{
  return a1 == 3585;
}

BOOL isLookalikeSequence<(UScriptCode)2>(uint64_t a1, int a2)
{
  if ((a2 - 1611) > 0x14)
    return 0;
  if ((a1 & 0xFF00000000) != 0)
    return ublock_getCode(a1) != UBLOCK_ARABIC;
  return 1;
}

id encodeHostNameWithRange(NSString *a1, _NSRange a2, uint64_t a3, uint64_t a4, BOOL *a5)
{
  mapHostNameWithRange(a1, a2, 1, 0, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

void sub_208476814(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2084768A8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_208476A8C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_208476B80(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  v2 = v1;

  _Unwind_Resume(a1);
}

void sub_208476E04(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_208476E88(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_208476F38(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2084770A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v4;

  _Unwind_Resume(a1);
}

BOOL isOfScriptType<(UScriptCode)3>()
{
  return uscript_getScript() == 3;
}

BOOL isOfScriptType<(UScriptCode)35>()
{
  return uscript_getScript() == 35;
}

BOOL isOfScriptType<(UScriptCode)40>()
{
  return uscript_getScript() == 40;
}

BOOL isOfScriptType<(UScriptCode)38>()
{
  return uscript_getScript() == 38;
}

uint64_t isSecondLevelDomainNameAllowedByTLDRules(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  int v9;
  __int16 v10;

  v4 = a2;
  v5 = a1 - 2;
  while (1)
  {
    if ((int)v4 < 1)
      return 1;
    v6 = *(unsigned __int16 *)(v5 + 2 * v4);
    v10 = *(_WORD *)(v5 + 2 * v4);
    v7 = *(_QWORD *)(a3 + 24);
    if (!v7)
      break;
    --v4;
    if (((*(uint64_t (**)(uint64_t, __int16 *))(*(_QWORD *)v7 + 48))(v7, &v10) & 1) == 0)
      return v6 == 46;
  }
  std::__throw_bad_function_call[abi:nn180100]();
  return isRussianDomainNameCharacter(v9);
}

uint64_t isRussianDomainNameCharacter(int a1)
{
  _BOOL4 v2;
  unsigned int v3;

  v2 = a1 == 45 || (a1 - 48) < 0xA;
  v3 = (a1 - 1072) < 0x20 || v2;
  if (a1 == 1105)
    return 1;
  else
    return v3;
}

void std::__throw_bad_function_call[abi:nn180100]()
{
  std::__libcpp_verbose_abort("bad_function_call was thrown in -fno-exceptions mode");
  JUMPOUT(0x208477308);
}

void std::__function::__func<BOOL (*)(unsigned short),std::allocator<BOOL (*)(unsigned short)>,BOOL ()(unsigned short)>::~__func()
{
  JUMPOUT(0x20BD088F4);
}

_QWORD *std::__function::__func<BOOL (*)(unsigned short),std::allocator<BOOL (*)(unsigned short)>,BOOL ()(unsigned short)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &unk_24C0A2278;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<BOOL (*)(unsigned short),std::allocator<BOOL (*)(unsigned short)>,BOOL ()(unsigned short)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &unk_24C0A2278;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<BOOL (*)(unsigned short),std::allocator<BOOL (*)(unsigned short)>,BOOL ()(unsigned short)>::operator()(uint64_t a1, unsigned __int16 *a2)
{
  return (*(uint64_t (**)(_QWORD))(a1 + 8))(*a2);
}

void std::__throw_bad_array_new_length[abi:nn180100]()
{
  abort();
}

void std::__function::__func<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_0,std::allocator<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_0>,BOOL ()(unsigned short)>::~__func()
{
  JUMPOUT(0x20BD088F4);
}

_QWORD *std::__function::__func<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_0,std::allocator<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_0>,BOOL ()(unsigned short)>::__clone()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_24C0A21E8;
  return result;
}

void std::__function::__func<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_0,std::allocator<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_0>,BOOL ()(unsigned short)>::__clone(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_24C0A21E8;
}

BOOL std::__function::__func<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_0,std::allocator<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_0>,BOOL ()(unsigned short)>::operator()(uint64_t a1, unsigned __int16 *a2)
{
  int v2;
  _BOOL8 result;
  BOOL v4;

  v2 = *a2;
  result = 1;
  if ((v2 - 1072) >= 0x20)
  {
    v4 = (v2 - 1105) > 0xD || ((1 << (v2 - 81)) & 0x2021) == 0;
    if (v4 && v2 != 8217)
      return v2 == 45 || (v2 - 48) < 0xA;
  }
  return result;
}

void std::__function::__func<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_1,std::allocator<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_1>,BOOL ()(unsigned short)>::~__func()
{
  JUMPOUT(0x20BD088F4);
}

_QWORD *std::__function::__func<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_1,std::allocator<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_1>,BOOL ()(unsigned short)>::__clone()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_24C0A2230;
  return result;
}

void std::__function::__func<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_1,std::allocator<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_1>,BOOL ()(unsigned short)>::__clone(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_24C0A2230;
}

BOOL std::__function::__func<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_1,std::allocator<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_1>,BOOL ()(unsigned short)>::operator()(uint64_t a1, unsigned __int16 *a2)
{
  int v2;
  _BOOL8 result;
  BOOL v4;

  v2 = *a2;
  result = 1;
  if ((v2 - 1072) < 0x20)
    return result;
  if (*a2 <= 0x492u)
  {
    if (v2 == 1105 || v2 == 1110)
      return result;
    return v2 == 45 || (v2 - 48) < 0xA;
  }
  v4 = (v2 - 1171) > 0x28 || ((1 << (v2 + 109)) & 0x10050010101) == 0;
  if (v4 && v2 != 1241 && v2 != 1257)
    return v2 == 45 || (v2 - 48) < 0xA;
  return result;
}

void std::__function::__func<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_2,std::allocator<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_2>,BOOL ()(unsigned short)>::~__func()
{
  JUMPOUT(0x20BD088F4);
}

_QWORD *std::__function::__func<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_2,std::allocator<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_2>,BOOL ()(unsigned short)>::__clone()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_24C0A22C0;
  return result;
}

void std::__function::__func<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_2,std::allocator<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_2>,BOOL ()(unsigned short)>::__clone(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_24C0A22C0;
}

uint64_t std::__function::__func<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_2,std::allocator<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_2>,BOOL ()(unsigned short)>::operator()(uint64_t a1, unsigned __int16 *a2)
{
  int v2;
  uint64_t result;
  _BOOL4 v6;

  v2 = *a2;
  result = 1;
  if ((v2 - 1072) >= 0x20
    && ((v2 - 1110) > 0x3B || ((1 << (v2 - 86)) & 0x800000000000003) == 0))
  {
    v6 = v2 == 45 || (v2 - 48) < 0xA;
    if (v2 == 1105)
      v6 = 1;
    return v2 == 1028 || v6;
  }
  return result;
}

void std::__function::__func<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_3,std::allocator<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_3>,BOOL ()(unsigned short)>::~__func()
{
  JUMPOUT(0x20BD088F4);
}

_QWORD *std::__function::__func<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_3,std::allocator<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_3>,BOOL ()(unsigned short)>::__clone()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_24C0A2308;
  return result;
}

void std::__function::__func<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_3,std::allocator<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_3>,BOOL ()(unsigned short)>::__clone(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_24C0A2308;
}

BOOL std::__function::__func<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_3,std::allocator<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_3>,BOOL ()(unsigned short)>::operator()(uint64_t a1, unsigned __int16 *a2)
{
  int v2;
  BOOL v3;

  v2 = *a2;
  v3 = (v2 - 1072) >= 9 && (unsigned __int16)(v2 - 1082) >= 0xFu;
  if (!v3 || (v2 - 1106) < 0xE && ((0x23C1u >> (v2 - 82)) & 1) != 0)
    return 1;
  return v2 == 45 || (v2 - 48) < 0xA;
}

void std::__function::__func<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_4,std::allocator<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_4>,BOOL ()(unsigned short)>::~__func()
{
  JUMPOUT(0x20BD088F4);
}

_QWORD *std::__function::__func<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_4,std::allocator<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_4>,BOOL ()(unsigned short)>::__clone()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_24C0A2350;
  return result;
}

void std::__function::__func<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_4,std::allocator<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_4>,BOOL ()(unsigned short)>::__clone(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_24C0A2350;
}

BOOL std::__function::__func<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_4,std::allocator<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_4>,BOOL ()(unsigned short)>::operator()(uint64_t a1, unsigned __int16 *a2)
{
  int v2;
  BOOL v3;

  v2 = *a2;
  v3 = (v2 - 1072) >= 9 && (unsigned __int16)(v2 - 1082) >= 0xFu;
  if (!v3 || (v2 - 1107) < 0xD && ((0x12E5u >> (v2 - 83)) & 1) != 0)
    return 1;
  return v2 == 45 || (v2 - 48) < 0xA;
}

void std::__function::__func<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_5,std::allocator<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_5>,BOOL ()(unsigned short)>::~__func()
{
  JUMPOUT(0x20BD088F4);
}

_QWORD *std::__function::__func<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_5,std::allocator<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_5>,BOOL ()(unsigned short)>::__clone()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_24C0A2398;
  return result;
}

void std::__function::__func<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_5,std::allocator<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_5>,BOOL ()(unsigned short)>::__clone(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_24C0A2398;
}

uint64_t std::__function::__func<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_5,std::allocator<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_5>,BOOL ()(unsigned short)>::operator()(uint64_t a1, unsigned __int16 *a2)
{
  int v2;
  uint64_t result;
  _BOOL4 v5;

  v2 = *a2;
  result = 1;
  if ((v2 - 1072) >= 0x20 && v2 != 1105)
  {
    v5 = v2 == 45 || (v2 - 48) < 0xA;
    if (v2 == 1257)
      v5 = 1;
    return v2 == 1199 || v5;
  }
  return result;
}

void std::__function::__func<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_6,std::allocator<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_6>,BOOL ()(unsigned short)>::~__func()
{
  JUMPOUT(0x20BD088F4);
}

_QWORD *std::__function::__func<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_6,std::allocator<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_6>,BOOL ()(unsigned short)>::__clone()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_24C0A23E0;
  return result;
}

void std::__function::__func<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_6,std::allocator<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_6>,BOOL ()(unsigned short)>::__clone(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_24C0A23E0;
}

BOOL std::__function::__func<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_6,std::allocator<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_6>,BOOL ()(unsigned short)>::operator()(uint64_t a1, unsigned __int16 *a2)
{
  int v2;
  BOOL v3;

  v2 = *a2;
  v3 = v2 != 1100 && (unsigned __int16)(v2 - 1072) >= 0x1Bu;
  if (!v3 || (unsigned __int16)(v2 - 1102) < 0x10u && ((0x8007u >> (v2 - 78)) & 1) != 0)
    return 1;
  return v2 == 45 || (v2 - 48) < 0xA;
}

uint64_t hexDigitValue(int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  result = (a1 - 48);
  if (result > 9)
  {
    if ((a1 - 65) > 5)
    {
      if ((a1 - 97) > 5)
      {
        NSLog(CFSTR("illegal hex digit"), v1, v2);
        return 0;
      }
      else
      {
        return (a1 - 87);
      }
    }
    else
    {
      return (a1 - 55);
    }
  }
  return result;
}

char *std::vector<unsigned short>::__vallocate[abi:nn180100](_QWORD *a1, uint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 < 0)
    abort();
  result = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned short>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[2 * v4];
  return result;
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned short>>(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
    std::__throw_bad_array_new_length[abi:nn180100]();
  return operator new(2 * a2);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void isOfScriptType<(UScriptCode)3>()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_208471000, MEMORY[0x24BDACB70], v0, "ICU error under uscript_getScript: %d", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

CFStringRef CFStringCreateWithCharacters(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars)
{
  return (CFStringRef)MEMORY[0x24BDBC580](alloc, chars, numChars);
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

void CFStringTrimWhitespace(CFMutableStringRef theString)
{
  MEMORY[0x24BDBC740](theString);
}

CFURLRef CFURLCreateAbsoluteURLWithBytes(CFAllocatorRef alloc, const UInt8 *relativeURLBytes, CFIndex length, CFStringEncoding encoding, CFURLRef baseURL, Boolean useCompatibilityMode)
{
  return (CFURLRef)MEMORY[0x24BDBC7E8](alloc, relativeURLBytes, length, *(_QWORD *)&encoding, baseURL, useCompatibilityMode);
}

CFStringRef CFURLCreateStringByReplacingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveEscaped)
{
  return (CFStringRef)MEMORY[0x24BDBC840](allocator, originalString, charactersToLeaveEscaped);
}

CFURLRef CFURLCreateWithBytes(CFAllocatorRef allocator, const UInt8 *URLBytes, CFIndex length, CFStringEncoding encoding, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x24BDBC850](allocator, URLBytes, length, *(_QWORD *)&encoding, baseURL);
}

CFURLRef CFURLGetBaseURL(CFURLRef anURL)
{
  return (CFURLRef)MEMORY[0x24BDBC880](anURL);
}

CFRange CFURLGetByteRangeForComponent(CFURLRef url, CFURLComponentType component, CFRange *rangeIncludingSeparators)
{
  CFIndex v3;
  CFIndex v4;
  CFRange result;

  v3 = MEMORY[0x24BDBC888](url, component, rangeIncludingSeparators);
  result.length = v4;
  result.location = v3;
  return result;
}

CFIndex CFURLGetBytes(CFURLRef url, UInt8 *buffer, CFIndex bufferLength)
{
  return MEMORY[0x24BDBC890](url, buffer, bufferLength);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x24BDD1208](directory, domainMask, expandTilde);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _CFHostIsDomainTopLevel()
{
  return MEMORY[0x24BDB7560]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void std::__libcpp_verbose_abort(const char *__format, ...)
{
  MEMORY[0x24BEDB1B8](__format);
}

void operator delete(void *__p)
{
  off_24C0A1FD8(__p);
}

uint64_t operator delete()
{
  return off_24C0A1FE0();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24C0A1FE8(__sz);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int fscanf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE4C8](a1, a2);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED88](ptr, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int32_t u_getPropertyValueEnum(UProperty property, const char *alias)
{
  return MEMORY[0x24BEDBF78](*(_QWORD *)&property, alias);
}

UBool u_hasBinaryProperty(UChar32 c, UProperty which)
{
  return MEMORY[0x24BEDBF80](*(_QWORD *)&c, *(_QWORD *)&which);
}

UBool u_isUWhiteSpace(UChar32 c)
{
  return MEMORY[0x24BEDBF90](*(_QWORD *)&c);
}

UBool u_isprint(UChar32 c)
{
  return MEMORY[0x24BEDBFB8](*(_QWORD *)&c);
}

UBlockCode ublock_getCode(UChar32 c)
{
  return MEMORY[0x24BEDC068](*(_QWORD *)&c);
}

UIDNA *__cdecl uidna_openUTS46(uint32_t options, UErrorCode *pErrorCode)
{
  return (UIDNA *)MEMORY[0x24BEDC168](*(_QWORD *)&options, pErrorCode);
}

uint64_t uscript_getScript()
{
  return MEMORY[0x24BEDC270]();
}

