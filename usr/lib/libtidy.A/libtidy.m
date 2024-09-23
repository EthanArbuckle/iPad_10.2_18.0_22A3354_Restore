unint64_t AccessibilityChecks(unint64_t a1)
{
  uint64_t v2;
  _DWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t DocType;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v40;
  char v41;

  v2 = *(_QWORD *)(a1 + 744);
  v3 = (_DWORD *)(a1 + 4448);
  ClearMemory((void *)(a1 + 4448), 0x148uLL);
  *(_DWORD *)(a1 + 4448) = v2;
  AccessibilityHelloMessage(a1, v4, v5, v6, v7, v8, v9, v10, v40);
  CheckScriptKeyboardAccessible(a1, a1, v11, v12, v13, v14, v15, v16);
  CheckForStyleAttribute(a1, a1);
  if ((*(_DWORD *)(a1 + 4448) & 0xFFFFFFFE) == 2)
  {
    DocType = FindDocType(a1);
    if (!DocType)
      goto LABEL_12;
    v23 = *(_DWORD *)(DocType + 76);
    if (v23)
    {
      v24 = a1 + 4584;
      v25 = *(unsigned int *)(DocType + 72);
      if (v25 >= v23)
      {
        LODWORD(v26) = 0;
      }
      else
      {
        v26 = 0;
        v27 = *(_QWORD *)(a1 + 104);
        do
        {
          *(_BYTE *)(v24 + v26) = *(_BYTE *)(*(_QWORD *)(v27 + 104) + v25 + v26);
          if (v26 == 127)
            break;
          ++v26;
        }
        while (v25 + v26 < (unint64_t)*(unsigned int *)(DocType + 76));
      }
      *(_BYTE *)(v24 + v26) = 0;
      if (!strstr((char *)(a1 + 4584), "HTML PUBLIC") && !strstr((char *)(a1 + 4584), "html PUBLIC"))
LABEL_12:
        ReportAccessWarning(a1, a1, 1037, v18, v19, v20, v21, v22, v41);
    }
  }
  if ((*v3 & 0xFFFFFFFE) == 2 && !CheckMissingStyleSheets(a1))
    ReportAccessWarning(a1, a1, 1038, v28, v29, v30, v31, v32, v41);
  CheckForListElements(a1, a1);
  return AccessibilityCheckNode(a1, (uint64_t *)a1, v33, v34, v35, v36, v37, v38);
}

uint64_t CheckScriptKeyboardAccessible(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  _QWORD *v10;
  int v11;
  int v12;
  int32x4_t v13;
  unsigned int *v14;
  unsigned int v15;
  int32x4_t v16;
  uint64_t i;
  int32x4_t v18;

  if ((*(_DWORD *)(result + 4448) & 0xFFFFFFFE) == 2)
  {
    v9 = result;
    v10 = *(_QWORD **)(a2 + 40);
    if (v10)
    {
      v11 = 0;
      v12 = 0;
      v13 = 0uLL;
      do
      {
        v14 = (unsigned int *)v10[1];
        if (v14)
        {
          v15 = *v14;
          if (v15 == 104)
            ++v12;
          if (v15 == 102)
            ++v11;
          v16 = vdupq_n_s32(v15);
          v13 = vsubq_s32(vsubq_s32(v13, vceqq_s32(v16, (int32x4_t)xmmword_20AB60570)), vceqq_s32(v16, (int32x4_t)xmmword_20AB60580));
        }
        v10 = (_QWORD *)*v10;
      }
      while (v10);
      v18 = v13;
      if (v13.i32[3] == 1)
      {
        result = ReportAccessWarning(result, a2, 1093, a4, a5, a6, a7, a8, v13.i8[0]);
        v13 = v18;
      }
      if (v13.i32[2] == 1)
      {
        result = ReportAccessWarning(v9, a2, 1094, a4, a5, a6, a7, a8, v18.i8[0]);
        v13.i64[0] = v18.i64[0];
      }
      if (v13.i32[1] == 1)
      {
        result = ReportAccessWarning(v9, a2, 1095, a4, a5, a6, a7, a8, v18.i8[0]);
        v13.i32[0] = v18.i32[0];
      }
      if (v13.i32[0] == 1)
        result = ReportAccessWarning(v9, a2, 1097, a4, a5, a6, a7, a8, v18.i8[0]);
      if (v12 == 1)
        result = ReportAccessWarning(v9, a2, 1096, a4, a5, a6, a7, a8, v18.i8[0]);
      if (v11 == 1)
        result = ReportAccessWarning(v9, a2, 1098, a4, a5, a6, a7, a8, v18.i8[0]);
    }
    for (i = *(_QWORD *)(a2 + 24); i; i = *(_QWORD *)(i + 16))
      result = CheckScriptKeyboardAccessible(v9, i);
  }
  return result;
}

uint64_t CheckForStyleAttribute(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  char v11;

  v3 = result;
  if ((*(_DWORD *)(result + 4448) - 4) >= 0xFFFFFFFD)
  {
    v4 = AttrGetById(a2, 135);
    result = hasValue((uint64_t)v4);
    if ((_DWORD)result)
      result = ReportAccessWarning(v3, a2, 1067, v5, v6, v7, v8, v9, v11);
  }
  for (i = *(_QWORD *)(a2 + 24); i; i = *(_QWORD *)(i + 16))
    result = CheckForStyleAttribute(v3, i);
  return result;
}

uint64_t CheckMissingStyleSheets(uint64_t a1)
{
  _QWORD *v1;
  int *v2;
  int v3;
  uint64_t result;
  _QWORD *v5;
  int *v6;
  int v7;

  v1 = *(_QWORD **)(a1 + 24);
  if (v1)
  {
    while (1)
    {
      v2 = (int *)v1[7];
      if (v2)
      {
        v3 = *v2;
        result = 1;
        if (v3 > 35)
        {
          if (v3 == 36 || v3 == 62 || v3 == 101)
            return result;
        }
        else if (v3 == 10)
        {
          goto LABEL_24;
        }
      }
      LOBYTE(result) = 0;
      v5 = (_QWORD *)v1[5];
      if (v5)
      {
        while (1)
        {
          v6 = (int *)v5[1];
          if (v6)
          {
            LOBYTE(result) = 0;
            v7 = *v6;
            if (v7 > 134)
            {
              if (v7 == 135 || v7 == 139 || v7 == 148)
                return 1;
            }
            else if (v7 == 116)
            {
              result = v5[6];
              if (result)
                LOBYTE(result) = tmbstrcasecmp((char *)result, "stylesheet") == 0;
            }
            else if (v7 == 8 || v7 == 70)
            {
              return 1;
            }
          }
          else
          {
            LOBYTE(result) = 0;
          }
          if ((result & 1) == 0)
          {
            v5 = (_QWORD *)*v5;
            if (v5)
              continue;
          }
          break;
        }
      }
LABEL_24:
      if ((result & 1) != 0)
        return 1;
      result = CheckMissingStyleSheets(v1);
      if (!(_DWORD)result)
      {
        v1 = (_QWORD *)v1[2];
        if (v1)
          continue;
      }
      return result;
    }
  }
  return 0;
}

uint64_t CheckForListElements(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  int *v3;
  int v4;
  uint64_t i;

  v2 = result;
  if (a2)
  {
    v3 = *(int **)(a2 + 56);
    if (v3)
    {
      v4 = *v3;
      if (v4 == 115 || v4 == 76)
      {
        ++*(_DWORD *)(result + 4728);
      }
      else if (v4 == 61)
      {
        ++*(_DWORD *)(result + 4724);
      }
    }
  }
  for (i = *(_QWORD *)(a2 + 24); i; i = *(_QWORD *)(i + 16))
    result = CheckForListElements(v2, i);
  return result;
}

unint64_t AccessibilityCheckNode(unint64_t result, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v9;
  int *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL4 v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  int *v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _DWORD *v53;
  uint64_t v54;
  int *v55;
  int v56;
  uint64_t v57;
  int *v58;
  uint64_t v59;
  unsigned int v60;
  unsigned int v61;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  unint64_t v125;
  _DWORD *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  _DWORD *v134;
  int v135;
  int v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  _BYTE *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  _QWORD *v209;
  uint64_t i;
  unint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  int v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  char v227[20];
  char v228[20];
  uint64_t v229;

  v9 = result;
  v229 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v10 = (int *)a2[7];
    if (!v10)
      goto LABEL_34;
    v11 = *v10;
    if (v11 > 49)
    {
      if (v11 <= 74)
      {
        switch(v11)
        {
          case '2':
            result = CheckIFrame(result, (uint64_t)a2, a3, a4, a5, a6, a7, a8, v227[0]);
            break;
          case '3':
          case '6':
          case '7':
          case '8':
          case '9':
            goto LABEL_34;
          case '4':
            CheckFlicker(result, (uint64_t)a2, a3, a4, a5, a6, a7, a8);
            CheckColorAvailable(v9, (uint64_t)a2, v63, v64, v65, v66, v67, v68, v227[0]);
            result = CheckImage(v9, a2, v69, v70, v71, v72, v73, v74, v227[0]);
            break;
          case '5':
            CheckColorAvailable(result, (uint64_t)a2, a3, a4, a5, a6, a7, a8, v227[0]);
            CheckInputLabel(v9, (uint64_t)a2, v75, v76, v77, v78, v79, v80, v227[0]);
            result = (unint64_t)CheckInputAttributes((char *)v9, (uint64_t)a2, v81, v82, v83, v84, v85, v86, v227[0]);
            break;
          case ':':
            result = CheckLabel(result, (uint64_t)a2, a3, a4, a5, a6, a7, a8, v227[0]);
            break;
          default:
            if (v11 != 64)
              goto LABEL_34;
            result = CheckMapLinks(result, (uint64_t)a2);
            break;
        }
        goto LABEL_166;
      }
      if (v11 <= 91)
      {
        if (v11 == 75)
        {
          ProgrammaticObjects(result, (uint64_t)a2, a3, a4, a5, a6, a7, a8, v227[0]);
          DynamicContent(v9, (uint64_t)a2, v178, v179, v180, v181, v182, v183, v227[0]);
          AccessibleCompatible(v9, (uint64_t)a2, v184, v185, v186, v187, v188, v189, v227[0]);
          CheckFlicker(v9, (uint64_t)a2, v190, v191, v192, v193, v194, v195);
          CheckColorAvailable(v9, (uint64_t)a2, v196, v197, v198, v199, v200, v201, v227[0]);
          result = CheckObject(v9, (uint64_t)a2, v202, v203, v204, v205, v206, v207, v227[0]);
          goto LABEL_166;
        }
        if (v11 != 82)
          goto LABEL_34;
      }
      else
      {
        if (v11 == 92)
        {
          DynamicContent(result, (uint64_t)a2, a3, a4, a5, a6, a7, a8, v227[0]);
          ProgrammaticObjects(v9, (uint64_t)a2, v87, v88, v89, v90, v91, v92, v227[0]);
          AccessibleCompatible(v9, (uint64_t)a2, v93, v94, v95, v96, v97, v98, v227[0]);
          CheckFlicker(v9, (uint64_t)a2, v99, v100, v101, v102, v103, v104);
          CheckColorAvailable(v9, (uint64_t)a2, v105, v106, v107, v108, v109, v110, v227[0]);
          result = CheckScriptAcc(v9, (uint64_t)a2, v111, v112, v113, v114, v115, v116, v227[0]);
          goto LABEL_166;
        }
        if (v11 == 104)
        {
          CheckColorContrast(result, (uint64_t)a2);
          result = CheckTable(v9, (uint64_t)a2, v117, v118, v119, v120, v121, v122, v227[0]);
          goto LABEL_166;
        }
        if (v11 != 118)
          goto LABEL_34;
      }
      result = CheckASCII(result, a2, a3, a4, a5, a6, a7, a8, v227[0]);
      goto LABEL_166;
    }
    if (v11 > 15)
    {
      if (v11 > 38)
      {
        if (v11 == 39)
        {
          result = CheckFrameSet(result, (uint64_t)a2, a3, a4, a5, a6, a7, a8, v227[0]);
          goto LABEL_166;
        }
        if (v11 == 46)
        {
          result = CheckMetaData(result, a2, 0, a4, a5, a6, a7, a8);
          if ((_DWORD)result || (*(_DWORD *)(v9 + 4448) & 0xFFFFFFFE) != 2)
            goto LABEL_166;
          v17 = v9;
          v18 = (uint64_t)a2;
          v19 = 1128;
          goto LABEL_28;
        }
      }
      else
      {
        if (v11 == 16)
        {
          result = CheckColorContrast(result, (uint64_t)a2);
          goto LABEL_166;
        }
        if (v11 == 38)
        {
          result = CheckFrame(result, (uint64_t)a2, a3, a4, a5, a6, a7, a8, v227[0]);
          goto LABEL_166;
        }
      }
LABEL_34:
      result = nodeIsHeader((_BOOL8)a2);
      if ((_DWORD)result)
        goto LABEL_35;
      v28 = (int *)a2[7];
      if (!v28)
        goto LABEL_166;
      v29 = *v28;
      if (v29 > 75)
      {
        if (v29 > 100)
        {
          if (v29 <= 113)
          {
            if (v29 != 101)
            {
              if (v29 == 109)
                result = CheckTH(v9, (uint64_t)a2, v20, a4, a5, a6, a7, a8, v227[0]);
              goto LABEL_166;
            }
            result = CheckColorContrast(v9, (uint64_t)a2);
            if ((*(_DWORD *)(v9 + 4448) - 4) < 0xFFFFFFFD)
              goto LABEL_166;
            v25 = v9;
            v26 = (uint64_t)a2;
            v27 = 1066;
LABEL_47:
            result = ReportAccessWarning(v25, v26, v27, a4, a5, a6, a7, a8, v227[0]);
            goto LABEL_166;
          }
          if (v29 == 114)
          {
LABEL_165:
            result = CheckDeprecated(v9, (uint64_t)a2, v20, a4, a5, a6, a7, a8, v227[0]);
            goto LABEL_166;
          }
          if (v29 != 115)
            goto LABEL_166;
        }
        else
        {
          if (v29 > 89)
          {
            if (v29 != 90 && v29 != 99)
              goto LABEL_166;
            goto LABEL_165;
          }
          if (v29 != 76)
          {
            if (v29 == 79 && (*(_DWORD *)(v9 + 4448) & 0xFFFFFFFE) == 2)
            {
              v52 = a2[3];
              if (v52)
              {
                v53 = *(_DWORD **)(v52 + 56);
                if (v53)
                {
                  v54 = a2[3];
                  while (*(_QWORD *)(v54 + 56))
                  {
                    v54 = *(_QWORD *)(v54 + 16);
                    if (!v54)
                    {
                      if (*v53 == 100)
                      {
                        result = ReportAccessWarning(v9, (uint64_t)a2, 1040, a4, a5, a6, a7, a8, v227[0]);
                        v52 = a2[3];
                      }
                      if (!v52)
                        goto LABEL_166;
                      v55 = *(int **)(v52 + 56);
                      if (!v55)
                        goto LABEL_166;
                      v56 = *v55;
                      if (v56 == 114)
                      {
                        result = ReportAccessWarning(v9, (uint64_t)a2, 1042, a4, a5, a6, a7, a8, v227[0]);
                        v57 = a2[3];
                        if (!v57)
                          goto LABEL_166;
                        v58 = *(int **)(v57 + 56);
                        if (!v58)
                          goto LABEL_166;
                        v56 = *v58;
                      }
                      if (v56 != 33)
                        goto LABEL_166;
                      v25 = v9;
                      v26 = (uint64_t)a2;
                      v27 = 1041;
                      goto LABEL_47;
                    }
                  }
                }
              }
            }
            goto LABEL_166;
          }
        }
LABEL_158:
        result = CheckListUsage(v9, (uint64_t)a2, v20, a4, a5, a6, a7, a8, v227[0]);
        goto LABEL_166;
      }
      if (v29 <= 35)
      {
        if (v29 <= 19)
        {
          if (v29 != 10)
          {
            if (v29 == 14)
              result = CheckBlink(v9, (uint64_t)a2, v20, a4, a5, a6, a7, a8, v227[0]);
            goto LABEL_166;
          }
        }
        else if (v29 != 20 && v29 != 29)
        {
          if (v29 == 34)
          {
            CheckEmbed(v9, (uint64_t)a2, v20, a4, a5, a6, a7, a8, v227[0]);
            ProgrammaticObjects(v9, (uint64_t)a2, v30, v31, v32, v33, v34, v35, v227[0]);
            AccessibleCompatible(v9, (uint64_t)a2, v36, v37, v38, v39, v40, v41, v227[0]);
            result = CheckFlicker(v9, (uint64_t)a2, v42, v43, v44, v45, v46, v47);
          }
          goto LABEL_166;
        }
        goto LABEL_165;
      }
      switch(v29)
      {
        case '7':
        case 'B':
          goto LABEL_165;
        case '8':
        case '9':
        case ':':
        case ';':
        case '<':
        case '?':
        case '@':
          goto LABEL_166;
        case '=':
          goto LABEL_158;
        case '>':
          result = CheckLink(v9, (uint64_t)a2, v20, a4, a5, a6, a7, a8, v227[0]);
          goto LABEL_166;
        case 'A':
          result = CheckMarquee(v9, (uint64_t)a2, v20, a4, a5, a6, a7, a8, v227[0]);
          goto LABEL_166;
        default:
          if (v29 == 36)
            goto LABEL_165;
          if (v29 != 48 || *(_DWORD *)(v9 + 4448) != 3)
            goto LABEL_166;
          v209 = AttrGetById((uint64_t)a2, 65);
          if (v209)
          {
            result = hasValue((uint64_t)v209);
            if ((_DWORD)result)
              goto LABEL_166;
            v19 = 1049;
          }
          else
          {
            v19 = 1048;
          }
          v17 = v9;
          v18 = (uint64_t)a2;
          break;
      }
LABEL_28:
      result = ReportAccessWarning(v17, v18, v19, v12, v13, v14, v15, v16, v227[0]);
      goto LABEL_166;
    }
    if (v11 != 1)
    {
      if (v11 == 6)
      {
        CheckDeprecated(result, (uint64_t)a2, a3, a4, a5, a6, a7, a8, v227[0]);
        ProgrammaticObjects(v9, (uint64_t)a2, v142, v143, v144, v145, v146, v147, v227[0]);
        DynamicContent(v9, (uint64_t)a2, v148, v149, v150, v151, v152, v153, v227[0]);
        AccessibleCompatible(v9, (uint64_t)a2, v154, v155, v156, v157, v158, v159, v227[0]);
        CheckFlicker(v9, (uint64_t)a2, v160, v161, v162, v163, v164, v165);
        CheckColorAvailable(v9, (uint64_t)a2, v166, v167, v168, v169, v170, v171, v227[0]);
        result = CheckApplet(v9, (uint64_t)a2, v172, v173, v174, v175, v176, v177, v227[0]);
        goto LABEL_166;
      }
      if (v11 == 7)
      {
        result = (unint64_t)CheckArea((char *)result, (uint64_t)a2, a3, a4, a5, a6, a7, a8, v227[0]);
        goto LABEL_166;
      }
      goto LABEL_34;
    }
    v123 = a2[5];
    if (!v123)
    {
LABEL_139:
      if ((*(_DWORD *)(v9 + 4448) & 0xFFFFFFFE) == 2)
      {
        v208 = a2[3];
        if (!v208)
          goto LABEL_143;
        if (!*(_QWORD *)(v208 + 56))
        {
          v211 = v9 + 4584;
          v212 = *(unsigned int *)(v208 + 72);
          if (v212 >= *(_DWORD *)(v208 + 76))
          {
            LODWORD(v213) = 0;
          }
          else
          {
            v213 = 0;
            v214 = *(_QWORD *)(v9 + 104);
            do
            {
              *(_BYTE *)(v211 + v213) = *(_BYTE *)(*(_QWORD *)(v214 + 104) + v212 + v213);
              if (v213 == 127)
                break;
              ++v213;
            }
            while (v212 + v213 < (unint64_t)*(unsigned int *)(v208 + 76));
          }
          *(_BYTE *)(v211 + v213) = 0;
          v215 = 4584;
          while (1)
          {
            result = *(char *)(v9 + v215);
            if (!*(_BYTE *)(v9 + v215))
              break;
            ++v215;
            if (!IsWhite(result))
            {
              v216 = tmbstrcmp((unsigned __int8 *)(v9 + 4584), "more");
              if (!tmbstrcmp((unsigned __int8 *)(v9 + 4584), "click here"))
                ReportAccessWarning(v9, (uint64_t)a2, 1125, v217, v218, v219, v220, v221, v227[0]);
              if (v216 && (unint64_t)tmbstrlen((_BYTE *)(v9 + 4584)) <= 5)
                ReportAccessWarning(v9, (uint64_t)a2, 1122, v222, v223, v224, v225, v226, v227[0]);
              result = (unint64_t)tmbstrlen((_BYTE *)(v9 + 4584));
              if (result >= 0x3D)
                result = ReportAccessWarning(v9, (uint64_t)a2, 1124, a4, a5, a6, a7, a8, v227[0]);
              break;
            }
          }
        }
        if (!a2[3])
        {
LABEL_143:
          v25 = v9;
          v26 = (uint64_t)a2;
          v27 = 1123;
          goto LABEL_47;
        }
      }
      goto LABEL_166;
    }
    v124 = 0;
    v125 = result + 4584;
    while (1)
    {
      if ((*(_DWORD *)(v9 + 4448) - 4) >= 0xFFFFFFFD)
      {
        v126 = *(_DWORD **)(v123 + 8);
        if (v126)
        {
          if (*v126 == 58)
          {
            result = hasValue(v123);
            if ((_DWORD)result)
            {
              GetFileExtension(*(_BYTE **)(v123 + 48), v227);
              if (IsValidMediaExtension(*(_BYTE **)(v123 + 48)))
                ReportAccessWarning(v9, (uint64_t)a2, 1026, v127, v128, v129, v130, v131, v227[0]);
              result = (unint64_t)tmbstrlen(v227);
              if (result <= 5 && (result = (unint64_t)tmbstrlen(v227)) != 0)
              {
                GetFileExtension(*(_BYTE **)(v123 + 48), v228);
                v132 = 0;
                while (1)
                {
                  result = tmbstrcasecmp(v228, soundExtensions[v132]);
                  if (!(_DWORD)result)
                    break;
                  if (++v132 == 6)
                    goto LABEL_107;
                }
                v136 = soundExtErrCodes[v132];
                v137 = a2[2];
                if (v137 && !*(_QWORD *)(v137 + 56))
                {
                  v138 = *(unsigned int *)(v137 + 72);
                  if (v138 >= *(_DWORD *)(v137 + 76))
                  {
                    LODWORD(v139) = 0;
                  }
                  else
                  {
                    v139 = 0;
                    v140 = *(_QWORD *)(v9 + 104);
                    do
                    {
                      *(_BYTE *)(v125 + v139) = *(_BYTE *)(*(_QWORD *)(v140 + 104) + v138 + v139);
                      if (v139 == 127)
                        break;
                      ++v139;
                    }
                    while (v138 + v139 < (unint64_t)*(unsigned int *)(v137 + 76));
                  }
                  *(_BYTE *)(v125 + v139) = 0;
                  v141 = (_BYTE *)(v9 + 4584);
                  while (1)
                  {
                    result = (char)*v141;
                    if (!*v141)
                      break;
                    result = IsWhite(result);
                    ++v141;
                    v133 = 1;
                    if (!(_DWORD)result)
                      goto LABEL_108;
                  }
                }
                if ((_DWORD)v124)
                {
                  v133 = 1;
                }
                else
                {
                  result = ReportAccessWarning(v9, (uint64_t)a2, v136, a4, a5, a6, a7, a8, v227[0]);
                  v133 = 0;
                }
              }
              else
              {
LABEL_107:
                v133 = v124;
              }
LABEL_108:
              v124 = v133;
            }
          }
        }
      }
      if ((*(_DWORD *)(v9 + 4448) & 0xFFFFFFFE) != 2)
        goto LABEL_119;
      v134 = *(_DWORD **)(v123 + 8);
      if (!v134)
        goto LABEL_119;
      if (*v134 != 138)
        goto LABEL_119;
      result = *(_QWORD *)(v123 + 48);
      if (!result)
        goto LABEL_119;
      if (tmbstrcasecmp((char *)result, "_new"))
      {
        result = *(_QWORD *)(v123 + 48);
        if (!result)
          goto LABEL_119;
        result = tmbstrcasecmp((char *)result, "_blank");
        if ((_DWORD)result)
          goto LABEL_119;
        v135 = 1100;
      }
      else
      {
        v135 = 1099;
      }
      result = ReportAccessWarning(v9, (uint64_t)a2, v135, a4, a5, a6, a7, a8, v227[0]);
LABEL_119:
      v123 = *(_QWORD *)v123;
      if (!v123)
        goto LABEL_139;
    }
  }
  result = nodeIsHeader(0);
  if (!(_DWORD)result)
    goto LABEL_166;
LABEL_35:
  if ((*(_DWORD *)(v9 + 4448) & 0xFFFFFFFE) == 2)
  {
    v21 = a2[3];
    if (!v21 || *(_QWORD *)(v21 + 56))
      goto LABEL_38;
    v48 = v9 + 4584;
    v49 = *(unsigned int *)(v21 + 72);
    if (v49 >= *(_DWORD *)(v21 + 76))
    {
      LODWORD(v50) = 0;
    }
    else
    {
      v50 = 0;
      v51 = *(_QWORD *)(v9 + 104);
      do
      {
        *(_BYTE *)(v48 + v50) = *(_BYTE *)(*(_QWORD *)(v51 + 104) + v49 + v50);
        if (v50 == 127)
          break;
        ++v50;
      }
      while (v49 + v50 < (unint64_t)*(unsigned int *)(v21 + 76));
    }
    *(_BYTE *)(v48 + v50) = 0;
    if (tmbstrlen((_BYTE *)(v9 + 4584)))
    {
      v59 = 0;
      v60 = 1;
      v61 = 1;
      do
      {
        if (*(_BYTE *)(v48 + v59) == 32)
          ++v61;
        v59 = v60;
      }
      while ((unint64_t)tmbstrlen((_BYTE *)(v9 + 4584)) > v60++);
      v22 = v61 > 0x14;
    }
    else
    {
LABEL_38:
      v22 = 0;
    }
    if (nodeIsHeader((_BOOL8)a2))
    {
      result = nodeHeaderLevel((uint64_t)a2);
      v23 = result;
      v24 = (uint64_t)a2;
      while (1)
      {
        v24 = *(_QWORD *)(v24 + 16);
        if (!v24)
          break;
        result = nodeHeaderLevel(v24);
        if (result >= v23)
        {
          if (result <= v23 + 1)
            break;
          goto LABEL_44;
        }
      }
    }
    else
    {
LABEL_44:
      result = ReportAccessWarning(v9, (uint64_t)a2, 1039, a4, a5, a6, a7, a8, v227[0]);
    }
    if (v22)
    {
      v25 = v9;
      v26 = (uint64_t)a2;
      v27 = 1043;
      goto LABEL_47;
    }
  }
LABEL_166:
  for (i = a2[3]; i; i = *(_QWORD *)(i + 16))
    result = AccessibilityCheckNode(v9, i);
  return result;
}

uint64_t hasValue(uint64_t result)
{
  _BYTE *v1;
  char v2;
  unsigned __int8 *v3;
  int v4;

  if (result)
  {
    v1 = *(_BYTE **)(result + 48);
    if (v1 && (v2 = *v1) != 0)
    {
      v3 = v1 + 1;
      while (IsWhite(v2))
      {
        v4 = *v3++;
        v2 = v4;
        if (!v4)
          return 0;
      }
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t textFromOneNode(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  result = a1 + 4584;
  if (a2 && (v4 = *(unsigned int *)(a2 + 72), v4 < *(_DWORD *)(a2 + 76)))
  {
    v5 = 0;
    v6 = *(_QWORD *)(a1 + 104);
    do
    {
      *(_BYTE *)(result + v5) = *(_BYTE *)(*(_QWORD *)(v6 + 104) + v4 + v5);
      if (v5 == 127)
        break;
      ++v5;
    }
    while (v4 + v5 < (unint64_t)*(unsigned int *)(a2 + 76));
  }
  else
  {
    LODWORD(v5) = 0;
  }
  *(_BYTE *)(result + v5) = 0;
  return result;
}

uint64_t CheckColorContrast(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  _DWORD *v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int *v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  unsigned int v22;
  int v23;
  int v24;
  int v25;
  char v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v30 = 255;
  v29 = 0xFF000000FFLL;
  if (*(_DWORD *)(result + 4448) == 3)
  {
    v3 = *(_QWORD *)(a2 + 40);
    if (v3)
    {
      v4 = result;
      v5 = 1;
      do
      {
        v6 = *(_DWORD **)(v3 + 8);
        if (v6)
        {
          if (*v6 == 13)
          {
            result = hasValue(v3);
            if ((_DWORD)result)
            {
              result = GetRgb(*(char **)(v3 + 48), (uint64_t)&v29);
              v5 = result;
            }
          }
        }
        v3 = *(_QWORD *)v3;
      }
      while (v3);
      if (v5)
      {
        v7 = *(_QWORD *)(a2 + 40);
        if (v7)
        {
          v8 = v29;
          v9 = HIDWORD(v29);
          v10 = v30;
          v11 = (299 * (int)v29 + 587 * HIDWORD(v29) + 114 * v30) / 1000;
          do
          {
            v12 = *(int **)(v7 + 8);
            if (v12)
            {
              v13 = *v12;
              if (v13 > 138)
              {
                if (v13 == 139)
                {
                  v14 = 1033;
                  goto LABEL_22;
                }
                if (v13 == 148)
                {
                  v14 = 1036;
                  goto LABEL_22;
                }
              }
              else
              {
                if (v13 == 8)
                {
                  v14 = 1035;
                  goto LABEL_22;
                }
                if (v13 == 70)
                {
                  v14 = 1034;
LABEL_22:
                  result = hasValue(v7);
                  if ((_DWORD)result)
                  {
                    v28 = 0;
                    v27 = 0;
                    result = GetRgb(*(char **)(v7 + 48), (uint64_t)&v27);
                    if ((_DWORD)result)
                    {
                      v20 = -274877907 * (299 * (int)v27 + 587 * HIDWORD(v27) + 114 * v28);
                      v21 = (v20 >> 38) + ((unint64_t)v20 >> 63) + v11;
                      if (v21 >= 0)
                        v22 = v21;
                      else
                        v22 = -v21;
                      v23 = v8 - v27;
                      if (v8 - (int)v27 < 0)
                        v23 = v27 - v8;
                      v24 = v9 - HIDWORD(v27);
                      if (v9 - HIDWORD(v27) < 0)
                        v24 = HIDWORD(v27) - v9;
                      v25 = v10 - v28;
                      if (v10 - v28 < 0)
                        v25 = v28 - v10;
                      if (v22 < 0xB5 || (v24 + v23 + v25) <= 0x1F4)
                        result = ReportAccessWarning(v4, a2, v14, v15, v16, v17, v18, v19, v26);
                    }
                  }
                }
              }
            }
            v7 = *(_QWORD *)v7;
          }
          while (v7);
        }
      }
    }
  }
  return result;
}

uint64_t CheckMetaData(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _DWORD *v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  int *v16;
  int v17;
  char *v18;
  int *v19;
  int *v20;
  int v21;
  uint64_t v22;
  _DWORD *v23;
  _BYTE *v24;
  unsigned int v25;
  _DWORD *v26;
  _QWORD *v27;
  _BYTE *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  char v36;

  if ((*(_DWORD *)(a1 + 4448) & 0xFFFFFFFE) != 2)
    return a3;
  v11 = (_DWORD *)a2[7];
  if (!v11)
    goto LABEL_24;
  if (*v11 != 67)
    goto LABEL_24;
  v12 = a2[5];
  if (!v12)
    goto LABEL_24;
  v13 = 0;
  v14 = 0;
  v15 = 0;
  do
  {
    v16 = *(int **)(v12 + 8);
    if (!v16)
      goto LABEL_20;
    v17 = *v16;
    if (v17 != 61)
      goto LABEL_15;
    if (hasValue(v12))
    {
      v18 = *(char **)(v12 + 48);
      if (v18 && !tmbstrcasecmp(v18, "refresh"))
      {
        ReportAccessWarning(a1, (uint64_t)a2, 1086, a4, a5, a6, a7, a8, v36);
        v15 = 1;
      }
      v13 = 1;
    }
    v19 = *(int **)(v12 + 8);
    if (v19)
    {
      v17 = *v19;
LABEL_15:
      if (v17 == 35 && hasValue(v12))
      {
        if (!tmbstrncmp(*(unsigned __int8 **)(v12 + 48), "http:", 5))
        {
          ReportAccessWarning(a1, (uint64_t)a2, 1087, a4, a5, a6, a7, a8, v36);
          v14 = 1;
        }
        v13 = 1;
      }
    }
LABEL_20:
    v12 = *(_QWORD *)v12;
  }
  while (v12);
  if (v14 | v15)
  {
    ReportAccessWarning(a1, (uint64_t)a2, 1130, a4, a5, a6, a7, a8, v36);
    goto LABEL_31;
  }
  if (v13)
  {
LABEL_31:
    a3 = 1;
    goto LABEL_39;
  }
LABEL_24:
  if ((_DWORD)a3)
    goto LABEL_39;
  v20 = (int *)a2[7];
  if (v20)
  {
    v21 = *v20;
    if (v21 == 111)
    {
      if (nodeIsText(a2[3]))
      {
        v24 = (_BYTE *)textFromOneNode(a1, a2[3]);
        a3 = 1;
        while (1)
        {
          v25 = (char)*v24;
          if (!*v24)
            break;
          ++v24;
          if (!IsWhite(v25))
            goto LABEL_39;
        }
      }
    }
    else if (v21 == 4)
    {
      v22 = a2[3];
      if (v22)
      {
        v23 = *(_DWORD **)(v22 + 56);
        if (v23)
        {
          if (*v23 == 1)
            goto LABEL_31;
        }
      }
    }
    a3 = 0;
LABEL_39:
    v26 = (_DWORD *)a2[7];
    if (v26 && *v26 == 62)
    {
      v27 = AttrGetById((uint64_t)a2, 116);
      if (v27)
      {
        v28 = (_BYTE *)v27[6];
        if (v28)
        {
          if (tmbsubstr(v28, "stylesheet"))
            ReportAccessWarning(a1, (uint64_t)a2, 1129, v29, v30, v31, v32, v33, v36);
        }
      }
      a3 = 1;
    }
  }
  else
  {
    a3 = 0;
  }
  for (i = a2[3]; i; i = *(_QWORD *)(i + 16))
    a3 = CheckMetaData(a1, i, a3);
  return a3;
}

uint64_t CheckFlicker(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int *v9;
  uint64_t v10;
  int v11;
  _QWORD *v12;
  int v13;
  char v14;
  char v15[20];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if ((*(_DWORD *)(result + 4448) - 4) >= 0xFFFFFFFD)
  {
    v9 = *(int **)(a2 + 56);
    if (v9)
    {
      v10 = result;
      v11 = *v9;
      if (v11 <= 51)
      {
        if (v11 == 6)
        {
          v13 = 1083;
        }
        else
        {
          if (v11 != 34)
            return result;
          v13 = 1082;
        }
        return ReportAccessWarning(v10, a2, v13, a4, a5, a6, a7, a8, v14);
      }
      switch(v11)
      {
        case '\\':
          v13 = 1080;
          return ReportAccessWarning(v10, a2, v13, a4, a5, a6, a7, a8, v14);
        case 'K':
          v13 = 1081;
          return ReportAccessWarning(v10, a2, v13, a4, a5, a6, a7, a8, v14);
        case '4':
          v12 = AttrGetById(a2, 132);
          result = hasValue((uint64_t)v12);
          if ((_DWORD)result)
          {
            GetFileExtension((_BYTE *)v12[6], v15);
            result = tmbstrcasecmp(v15, ".gif");
            if (!(_DWORD)result)
            {
              v13 = 1084;
              return ReportAccessWarning(v10, a2, v13, a4, a5, a6, a7, a8, v14);
            }
          }
          break;
      }
    }
  }
  return result;
}

uint64_t CheckColorAvailable(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int *v9;
  int v10;
  int v11;

  if ((*(_DWORD *)(result + 4448) - 4) >= 0xFFFFFFFD)
  {
    v9 = *(int **)(a2 + 56);
    if (v9)
    {
      v10 = *v9;
      if (v10 <= 52)
      {
        if (v10 == 6)
        {
          v11 = 1029;
          return ReportAccessWarning(result, a2, v11, a4, a5, a6, a7, a8, a9);
        }
        if (v10 == 52)
        {
          v11 = 1028;
          return ReportAccessWarning(result, a2, v11, a4, a5, a6, a7, a8, a9);
        }
      }
      else
      {
        switch(v10)
        {
          case '5':
            v11 = 1032;
            return ReportAccessWarning(result, a2, v11, a4, a5, a6, a7, a8, a9);
          case 'K':
            v11 = 1030;
            return ReportAccessWarning(result, a2, v11, a4, a5, a6, a7, a8, a9);
          case '\\':
            v11 = 1031;
            return ReportAccessWarning(result, a2, v11, a4, a5, a6, a7, a8, a9);
        }
      }
    }
  }
  return result;
}

unint64_t CheckImage(unint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int *v18;
  int v19;
  _BYTE *v20;
  char *v21;
  _BOOL4 v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  char *v26;
  _QWORD *v27;
  _DWORD *v28;
  uint64_t v29;
  int v30;
  _QWORD *v31;
  _DWORD *v32;
  uint64_t v33;
  unsigned __int8 *v34;
  BOOL v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;

  if ((*(_DWORD *)(result + 4448) - 4) >= 0xFFFFFFFD)
  {
    v10 = result;
    v11 = a2[5];
    if (v11)
    {
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      while (1)
      {
        v18 = *(int **)(v11 + 8);
        if (v18)
        {
          v19 = *v18;
          if (v19 <= 70)
          {
            if (v19 != 9)
            {
              if (v19 == 57)
              {
                result = hasValue(v11);
                if ((_DWORD)result)
                {
                  result = atoi(*(const char **)(v11 + 48));
                  if ((int)result < 30)
                    v14 = 1;
                }
                goto LABEL_43;
              }
LABEL_33:
              if (v19 == 63)
                v16 = 1;
              goto LABEL_43;
            }
            result = *(_QWORD *)(v11 + 48);
            if (result)
            {
              v20 = tmbstrlen((_BYTE *)result);
              v21 = *(char **)(v11 + 48);
              if ((unint64_t)v20 <= 0x95 && !IsPlaceholderAlt(*(char **)(v11 + 48)) && !strstr(v21, "object"))
              {
                v22 = EndsWithBytes(v21);
                v21 = *(char **)(v11 + 48);
                if (!v22)
                {
                  result = IsImage(*(_BYTE **)(v11 + 48));
                  if (!(_DWORD)result)
                    goto LABEL_42;
                  v21 = *(char **)(v11 + 48);
                }
              }
              if ((unint64_t)tmbstrlen(v21) >= 0x97)
              {
                v23 = v10;
                v24 = (uint64_t)a2;
                v25 = 1005;
LABEL_41:
                result = ReportAccessWarning(v23, v24, v25, a4, a5, a6, a7, a8, v47);
LABEL_42:
                v17 = 1;
                goto LABEL_43;
              }
              if (IsImage(*(_BYTE **)(v11 + 48)))
              {
                v23 = v10;
                v24 = (uint64_t)a2;
                v25 = 1002;
                goto LABEL_41;
              }
              v26 = *(char **)(v11 + 48);
              if (IsPlaceholderAlt(v26))
              {
                v23 = v10;
                v24 = (uint64_t)a2;
                v25 = 1004;
                goto LABEL_41;
              }
              result = EndsWithBytes(v26);
              if ((_DWORD)result)
              {
                v23 = v10;
                v24 = (uint64_t)a2;
                v25 = 1003;
                goto LABEL_41;
              }
            }
          }
          else
          {
            if (v19 == 71)
            {
              result = hasValue(v11);
              if ((_DWORD)result)
              {
                result = (unint64_t)tmbstrlen(*(_BYTE **)(v11 + 48));
                if (result > 1)
                  v15 = 1;
              }
              goto LABEL_43;
            }
            if (v19 == 143)
            {
              result = hasValue(v11);
              if ((_DWORD)result)
                *(_DWORD *)(v10 + 4732) = 1;
              goto LABEL_43;
            }
            if (v19 != 150)
              goto LABEL_33;
            result = hasValue(v11);
            if ((_DWORD)result)
            {
              result = atoi(*(const char **)(v11 + 48));
              if ((int)result < 30)
                v13 = 1;
              if ((int)result > 150)
                v12 = 1;
            }
          }
        }
LABEL_43:
        v11 = *(_QWORD *)v11;
        if (!v11)
          goto LABEL_46;
      }
    }
    v17 = 0;
    v16 = 0;
    v15 = 0;
    v14 = 0;
    v13 = 0;
    v12 = 0;
LABEL_46:
    v27 = (_QWORD *)a2[2];
    if (v27 && (v28 = (_DWORD *)v27[7]) != 0 && *v28 == 1)
    {
      v29 = v27[3];
      if (!v29 || *(_QWORD *)(v29 + 56))
        goto LABEL_51;
      v43 = v10 + 4584;
      v44 = *(unsigned int *)(v29 + 72);
      if (v44 >= *(_DWORD *)(v29 + 76))
      {
        LODWORD(v45) = 0;
      }
      else
      {
        v45 = 0;
        v46 = *(_QWORD *)(v10 + 104);
        do
        {
          *(_BYTE *)(v43 + v45) = *(_BYTE *)(*(_QWORD *)(v46 + 104) + v44 + v45);
          if (v45 == 127)
            break;
          ++v45;
        }
        while (v44 + v45 < (unint64_t)*(unsigned int *)(v29 + 76));
      }
      *(_BYTE *)(v43 + v45) = 0;
      result = tmbstrcmp((unsigned __int8 *)(v10 + 4584), "d");
      if ((_DWORD)result && (result = tmbstrcmp((unsigned __int8 *)(v10 + 4584), "D"), (_DWORD)result))
LABEL_51:
        v30 = 0;
      else
        v30 = 1;
    }
    else
    {
      v30 = 0;
      v27 = a2;
    }
    v31 = (_QWORD *)v27[2];
    if (v31 && !v31[7])
    {
      v27 = (_QWORD *)v31[2];
      if (v27 && (v32 = (_DWORD *)v27[7]) != 0 && *v32 == 1)
      {
        v33 = v27[3];
        if (v33)
        {
          if (!*(_QWORD *)(v33 + 56))
          {
            v34 = (unsigned __int8 *)textFromOneNode(v10, v33);
            result = tmbstrcmp(v34, "d");
            if (!(_DWORD)result || (result = tmbstrcmp(v34, "D"), !(_DWORD)result))
              v30 = 1;
          }
        }
      }
      else
      {
        v27 = v31;
      }
    }
    if (!v17)
      result = ReportAccessWarning(v10, (uint64_t)v27, 1001, a4, a5, a6, a7, a8, v47);
    v36 = v12 == 1 || v13 == 1;
    if (!v15 && v14 == 1 && v36)
      goto LABEL_84;
    if (v15 || !v30)
    {
      if (v15 != 1 || v30)
      {
LABEL_82:
        if (!(v30 | v15))
          result = ReportAccessWarning(v10, (uint64_t)v27, 1008, a4, a5, a6, a7, a8, v47);
LABEL_84:
        if (v16 == 1)
        {
          ReportAccessWarning(v10, (uint64_t)v27, 1092, a4, a5, a6, a7, a8, v47);
          return ReportAccessWarning(v10, (uint64_t)v27, 1025, v38, v39, v40, v41, v42, a9);
        }
        return result;
      }
      v37 = 1009;
    }
    else
    {
      v37 = 1010;
    }
    result = ReportAccessWarning(v10, (uint64_t)v27, v37, a4, a5, a6, a7, a8, v47);
    goto LABEL_82;
  }
  return result;
}

uint64_t CheckMapLinks(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  _DWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;

  if (*(_DWORD *)(result + 4448) == 3)
  {
    v3 = *(_QWORD *)(a2 + 24);
    if (v3)
    {
      v4 = result;
      do
      {
        v5 = *(_DWORD **)(v3 + 56);
        if (v5)
        {
          if (*v5 == 7)
          {
            v6 = AttrGetById(v3, 58);
            result = hasValue((uint64_t)v6);
            if ((_DWORD)result)
            {
              result = FindLinkA(v4, (unsigned __int8 *)v6[6]);
              if (!(_DWORD)result)
                result = ReportAccessWarning(v4, a2, 1027, v7, v8, v9, v10, v11, v12);
            }
          }
        }
        v3 = *(_QWORD *)(v3 + 16);
      }
      while (v3);
    }
  }
  return result;
}

char *CheckArea(char *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10;
  _QWORD *v11;
  int v12;
  int v13;
  _DWORD *v14;
  _DWORD *v15;
  int v16;
  char v18;

  v10 = (uint64_t)result;
  v11 = *(_QWORD **)(a2 + 40);
  if (v11)
  {
    v12 = 0;
    while (1)
    {
      v13 = *(_DWORD *)(v10 + 4448);
      if ((v13 - 4) >= 0xFFFFFFFD)
      {
        v14 = (_DWORD *)v11[1];
        if (v14)
        {
          if (*v14 == 9 && v11[6])
            v12 = 1;
        }
      }
      if ((v13 & 0xFFFFFFFE) != 2)
        goto LABEL_18;
      v15 = (_DWORD *)v11[1];
      if (!v15)
        goto LABEL_18;
      if (*v15 != 138)
        goto LABEL_18;
      result = (char *)v11[6];
      if (!result)
        goto LABEL_18;
      if (tmbstrcasecmp(result, "_new"))
      {
        result = (char *)v11[6];
        if (!result)
          goto LABEL_18;
        result = (char *)tmbstrcasecmp(result, "_blank");
        if ((_DWORD)result)
          goto LABEL_18;
        v16 = 1100;
      }
      else
      {
        v16 = 1099;
      }
      result = (char *)ReportAccessWarning(v10, a2, v16, a4, a5, a6, a7, a8, v18);
LABEL_18:
      v11 = (_QWORD *)*v11;
      if (!v11)
        goto LABEL_21;
    }
  }
  v12 = 0;
LABEL_21:
  if ((*(_DWORD *)(v10 + 4448) - 1) <= 2 && v12 == 0)
    return (char *)ReportAccessWarning(v10, a2, 1022, a4, a5, a6, a7, a8, a9);
  return result;
}

uint64_t CheckDeprecated(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int *v9;
  int v10;
  int v11;

  if (a2)
  {
    if ((*(_DWORD *)(result + 4448) & 0xFFFFFFFE) == 2)
    {
      v9 = *(int **)(a2 + 56);
      if (v9)
      {
        v10 = *v9;
        if (v10 > 54)
        {
          if (v10 <= 89)
          {
            if (v10 == 55)
            {
              v11 = 1111;
              return ReportAccessWarning(result, a2, v11, a4, a5, a6, a7, a8, a9);
            }
            if (v10 == 66)
            {
              v11 = 1112;
              return ReportAccessWarning(result, a2, v11, a4, a5, a6, a7, a8, a9);
            }
          }
          else
          {
            switch(v10)
            {
              case 'Z':
                v11 = 1113;
                return ReportAccessWarning(result, a2, v11, a4, a5, a6, a7, a8, a9);
              case 'c':
                v11 = 1114;
                return ReportAccessWarning(result, a2, v11, a4, a5, a6, a7, a8, a9);
              case 'r':
                v11 = 1115;
                return ReportAccessWarning(result, a2, v11, a4, a5, a6, a7, a8, a9);
            }
          }
        }
        else if (v10 <= 19)
        {
          if (v10 == 6)
          {
            v11 = 1106;
            return ReportAccessWarning(result, a2, v11, a4, a5, a6, a7, a8, a9);
          }
          if (v10 == 10)
          {
            v11 = 1107;
            return ReportAccessWarning(result, a2, v11, a4, a5, a6, a7, a8, a9);
          }
        }
        else
        {
          switch(v10)
          {
            case 20:
              v11 = 1108;
              return ReportAccessWarning(result, a2, v11, a4, a5, a6, a7, a8, a9);
            case 29:
              v11 = 1109;
              return ReportAccessWarning(result, a2, v11, a4, a5, a6, a7, a8, a9);
            case 36:
              v11 = 1110;
              return ReportAccessWarning(result, a2, v11, a4, a5, a6, a7, a8, a9);
          }
        }
      }
    }
  }
  return result;
}

uint64_t ProgrammaticObjects(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int *v9;
  int v10;
  int v11;

  if ((*(_DWORD *)(result + 4448) - 4) >= 0xFFFFFFFD)
  {
    v9 = *(int **)(a2 + 56);
    if (v9)
    {
      v10 = *v9;
      if (v10 > 74)
      {
        if (v10 == 92)
        {
          v11 = 1072;
          return ReportAccessWarning(result, a2, v11, a4, a5, a6, a7, a8, a9);
        }
        if (v10 == 75)
        {
          v11 = 1073;
          return ReportAccessWarning(result, a2, v11, a4, a5, a6, a7, a8, a9);
        }
      }
      else
      {
        if (v10 == 6)
        {
          v11 = 1075;
          return ReportAccessWarning(result, a2, v11, a4, a5, a6, a7, a8, a9);
        }
        if (v10 == 34)
        {
          v11 = 1074;
          return ReportAccessWarning(result, a2, v11, a4, a5, a6, a7, a8, a9);
        }
      }
    }
  }
  return result;
}

uint64_t DynamicContent(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int *v9;
  int v10;
  int v11;

  if ((*(_DWORD *)(result + 4448) - 4) >= 0xFFFFFFFD)
  {
    v9 = *(int **)(a2 + 56);
    if (v9)
    {
      v10 = *v9;
      switch(v10)
      {
        case 6:
          v11 = 1069;
          return ReportAccessWarning(result, a2, v11, a4, a5, a6, a7, a8, a9);
        case 75:
          v11 = 1071;
          return ReportAccessWarning(result, a2, v11, a4, a5, a6, a7, a8, a9);
        case 92:
          v11 = 1070;
          return ReportAccessWarning(result, a2, v11, a4, a5, a6, a7, a8, a9);
      }
    }
  }
  return result;
}

uint64_t AccessibleCompatible(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int *v9;
  int v10;
  int v11;

  if ((*(_DWORD *)(result + 4448) - 4) >= 0xFFFFFFFD)
  {
    v9 = *(int **)(a2 + 56);
    if (v9)
    {
      v10 = *v9;
      if (v10 > 74)
      {
        if (v10 == 92)
        {
          v11 = 1088;
          return ReportAccessWarning(result, a2, v11, a4, a5, a6, a7, a8, a9);
        }
        if (v10 == 75)
        {
          v11 = 1089;
          return ReportAccessWarning(result, a2, v11, a4, a5, a6, a7, a8, a9);
        }
      }
      else
      {
        if (v10 == 6)
        {
          v11 = 1090;
          return ReportAccessWarning(result, a2, v11, a4, a5, a6, a7, a8, a9);
        }
        if (v10 == 34)
        {
          v11 = 1091;
          return ReportAccessWarning(result, a2, v11, a4, a5, a6, a7, a8, a9);
        }
      }
    }
  }
  return result;
}

uint64_t CheckApplet(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10;
  _QWORD *v11;
  int v12;
  _DWORD *v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  if ((*(_DWORD *)(result + 4448) - 4) >= 0xFFFFFFFD)
  {
    v10 = result;
    v11 = *(_QWORD **)(a2 + 40);
    if (!v11)
      goto LABEL_10;
    v12 = 0;
    do
    {
      v13 = (_DWORD *)v11[1];
      if (v13 && *v13 == 9 && v11[6])
        v12 = 1;
      v11 = (_QWORD *)*v11;
    }
    while (v11);
    if (!v12)
    {
LABEL_10:
      v14 = *(_QWORD *)(a2 + 24);
      if (v14)
      {
        if (*(_QWORD *)(v14 + 56))
        {
          v15 = 0;
        }
        else
        {
          v15 = (_BYTE *)(result + 4584);
          v16 = *(unsigned int *)(v14 + 72);
          if (v16 >= *(_DWORD *)(v14 + 76))
          {
            LODWORD(v17) = 0;
          }
          else
          {
            v17 = 0;
            v18 = *(_QWORD *)(result + 104);
            do
            {
              v15[v17] = *(_BYTE *)(*(_QWORD *)(v18 + 104) + v16 + v17);
              if (v17 == 127)
                break;
              ++v17;
            }
            while (v16 + v17 < (unint64_t)*(unsigned int *)(v14 + 76));
          }
          v15[v17] = 0;
          v14 = *(_QWORD *)(a2 + 24);
        }
        v19 = *(_QWORD *)(v14 + 24);
        if (v19 && !*(_QWORD *)(v19 + 56))
        {
          v15 = (_BYTE *)(result + 4584);
          v20 = *(unsigned int *)(v19 + 72);
          if (v20 >= *(_DWORD *)(v19 + 76))
          {
            LODWORD(v21) = 0;
          }
          else
          {
            v21 = 0;
            v22 = *(_QWORD *)(result + 104);
            do
            {
              v15[v21] = *(_BYTE *)(*(_QWORD *)(v22 + 104) + v20 + v21);
              if (v21 == 127)
                break;
              ++v21;
            }
            while (v20 + v21 < (unint64_t)*(unsigned int *)(v19 + 76));
          }
          v15[v21] = 0;
LABEL_31:
          while (*v15)
          {
            result = IsWhite((char)*v15++);
            if (!(_DWORD)result)
              return result;
          }
        }
        else if (v15)
        {
          goto LABEL_31;
        }
      }
      return ReportAccessWarning(v10, a2, 1013, a4, a5, a6, a7, a8, a9);
    }
  }
  return result;
}

uint64_t CheckObject(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10;
  _QWORD *v11;
  _DWORD *v12;
  _BOOL4 IsText;
  uint64_t v14;
  _BYTE *v15;

  if ((*(_DWORD *)(result + 4448) - 4) < 0xFFFFFFFD)
    return result;
  v10 = result;
  result = *(_QWORD *)(a2 + 24);
  if (!result)
    return ReportAccessWarning(v10, a2, 1014, a4, a5, a6, a7, a8, a9);
  if (*(_DWORD *)(result + 80) == 4 || (v11 = *(_QWORD **)(result + 40)) == 0)
  {
LABEL_9:
    IsText = nodeIsText(result);
    v14 = *(_QWORD *)(a2 + 24);
    if (IsText)
      goto LABEL_12;
    if (nodeIsText(*(_QWORD *)(v14 + 24)))
    {
      v14 = *(_QWORD *)(*(_QWORD *)(a2 + 24) + 24);
LABEL_12:
      v15 = (_BYTE *)textFromOneNode(v10, v14);
      while (*v15)
      {
        result = IsWhite((char)*v15++);
        if (!(_DWORD)result)
          return result;
      }
    }
    return ReportAccessWarning(v10, a2, 1014, a4, a5, a6, a7, a8, a9);
  }
  while (1)
  {
    v12 = (_DWORD *)v11[1];
    if (v12)
    {
      if (*v12 == 9)
        return result;
    }
    v11 = (_QWORD *)*v11;
    if (!v11)
      goto LABEL_9;
  }
}

unint64_t CheckFrame(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10;
  _QWORD *v11;
  int v12;
  int *v13;
  int v14;
  _BYTE *v15;
  _BYTE *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  _BYTE *v20;
  char v21;

  ++*(_DWORD *)(result + 4712);
  if ((*(_DWORD *)(result + 4448) - 4) < 0xFFFFFFFD)
    return result;
  v10 = result;
  v11 = *(_QWORD **)(a2 + 40);
  if (!v11)
    goto LABEL_33;
  v12 = 0;
  do
  {
    v13 = (int *)v11[1];
    if (!v13)
      goto LABEL_29;
    v14 = *v13;
    switch(v14)
    {
      case 140:
        result = hasValue((uint64_t)v11);
        if ((_DWORD)result)
          v12 = 1;
        if (!v12)
        {
          v15 = (_BYTE *)v11[6];
          if (!v15 || !tmbstrlen(v15))
          {
            v17 = v10;
            v18 = a2;
            v19 = 1117;
LABEL_28:
            result = ReportAccessWarning(v17, v18, v19, a4, a5, a6, a7, a8, v21);
            v12 = 1;
            break;
          }
          v16 = (_BYTE *)v11[6];
          if (v16)
          {
            while (*v16)
            {
              result = IsWhite((char)*v16);
              v12 = 0;
              ++v16;
              if (!(_DWORD)result)
                goto LABEL_29;
            }
            v20 = (_BYTE *)v11[6];
          }
          else
          {
            v20 = 0;
          }
          result = (unint64_t)tmbstrlen(v20);
          if (result)
          {
            v17 = v10;
            v18 = a2;
            v19 = 1118;
            goto LABEL_28;
          }
          v12 = 0;
        }
        break;
      case 132:
        result = hasValue((uint64_t)v11);
        if ((_DWORD)result)
        {
          result = IsValidSrcExtension((_BYTE *)v11[6]);
          if (!(_DWORD)result)
            result = ReportAccessWarning(v10, a2, 1068, a4, a5, a6, a7, a8, v21);
        }
        break;
      case 71:
        result = hasValue((uint64_t)v11);
        if ((_DWORD)result)
        {
          result = (unint64_t)tmbstrlen((_BYTE *)v11[6]);
          if (result >= 2)
            ++*(_DWORD *)(v10 + 4716);
        }
        break;
    }
LABEL_29:
    v11 = (_QWORD *)*v11;
  }
  while (v11);
  if (!v12)
LABEL_33:
    result = ReportAccessWarning(v10, a2, 1116, a4, a5, a6, a7, a8, v21);
  if (*(_DWORD *)(v10 + 4712) == 3 && *(int *)(v10 + 4716) <= 2)
  {
    *(_DWORD *)(v10 + 4712) = 0;
    return ReportAccessWarning(v10, a2, 1021, a4, a5, a6, a7, a8, a9);
  }
  return result;
}

uint64_t CheckIFrame(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if ((*(_DWORD *)(result + 4448) - 4) >= 0xFFFFFFFD)
  {
    v10 = result;
    v11 = AttrGetById(a2, 132);
    result = hasValue((uint64_t)v11);
    if ((_DWORD)result)
    {
      result = IsValidSrcExtension((_BYTE *)v11[6]);
      if (!(_DWORD)result)
        return ReportAccessWarning(v10, a2, 1068, v12, v13, v14, v15, v16, a9);
    }
  }
  return result;
}

uint64_t CheckScriptAcc(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v9;
  _DWORD *v10;

  if ((*(_DWORD *)(result + 4448) - 4) >= 0xFFFFFFFD)
  {
    v9 = *(_QWORD *)(a2 + 16);
    if (!v9)
      return ReportAccessWarning(result, a2, 1023, a4, a5, a6, a7, a8, a9);
    v10 = *(_DWORD **)(v9 + 56);
    if (!v10 || *v10 != 74)
      return ReportAccessWarning(result, a2, 1023, a4, a5, a6, a7, a8, a9);
  }
  return result;
}

uint64_t CheckTable(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  _DWORD *v10;
  int v11;
  _QWORD *v12;
  int v13;
  _DWORD *v14;
  _BYTE *v15;
  _BYTE *v16;
  _BYTE *v17;
  _BYTE *v18;
  int v19;
  _BYTE *v20;
  _QWORD *v21;
  int v22;
  int v23;
  int v24;
  _DWORD *v25;
  _QWORD *v26;
  _DWORD *v27;
  uint64_t **i;
  uint64_t *v29;
  _DWORD *v30;
  uint64_t **j;
  uint64_t *v32;
  uint64_t v33;
  _DWORD *v34;
  uint64_t v35;
  int *v36;
  int v37;
  _DWORD *v38;
  int v39;
  uint64_t v40;
  int v41;
  _DWORD *v42;
  _QWORD *v43;
  int *v44;
  int v45;
  _DWORD *v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  _BYTE *v64;
  char v65;
  char v66;
  char v67;

  v10 = (_DWORD *)result;
  v11 = *(_DWORD *)(result + 4448);
  if (v11 == 3)
  {
    v12 = *(_QWORD **)(a2 + 40);
    if (v12)
    {
      v13 = 0;
      while (1)
      {
        v14 = (_DWORD *)v12[1];
        if (v14 && *v14 == 136)
        {
          if (hasValue((uint64_t)v12))
          {
            v15 = (_BYTE *)v12[6];
            if (v15)
            {
              if (tmbsubstr(v15, "summary"))
              {
                v16 = (_BYTE *)v12[6];
                if (v16)
                {
                  if (tmbsubstr(v16, "table"))
                    ReportAccessWarning((uint64_t)v10, a2, 1060, a4, a5, a6, a7, a8, v65);
                }
              }
            }
            v13 = 1;
          }
          v17 = (_BYTE *)v12[6];
          if (v17 && tmbstrlen(v17))
          {
            v18 = (_BYTE *)v12[6];
            if (v18)
            {
              while (*v18)
              {
                result = IsWhite((char)*v18++);
                if (!(_DWORD)result)
                  goto LABEL_25;
              }
              v20 = (_BYTE *)v12[6];
            }
            else
            {
              v20 = 0;
            }
            result = (uint64_t)tmbstrlen(v20);
            if (!result)
              goto LABEL_25;
            v19 = 1059;
          }
          else
          {
            v19 = 1058;
          }
          result = ReportAccessWarning((uint64_t)v10, a2, v19, a4, a5, a6, a7, a8, v65);
          v13 = 1;
        }
LABEL_25:
        v12 = (_QWORD *)*v12;
        if (!v12)
          goto LABEL_29;
      }
    }
    v13 = 0;
LABEL_29:
    if (!*(_QWORD *)(a2 + 24))
    {
      v47 = (uint64_t)v10;
      v48 = a2;
      v49 = 1050;
      return ReportAccessWarning(v47, v48, v49, a4, a5, a6, a7, a8, a9);
    }
    v11 = v10[1112];
  }
  else
  {
    v13 = 0;
  }
  if ((v11 - 4) >= 0xFFFFFFFD)
  {
    v21 = *(_QWORD **)(a2 + 24);
    if (v21)
    {
      v22 = 0;
      v23 = 1;
      v24 = 1;
      do
      {
        v25 = (_DWORD *)v21[7];
        if (v25)
        {
          if (*v25 == 112)
          {
            v26 = (_QWORD *)v21[3];
            if (v26)
            {
              v27 = (_DWORD *)v26[7];
              if (v27)
              {
                if (*v27 == 109)
                {
                  for (i = (uint64_t **)v26[5]; i; i = (uint64_t **)*i)
                  {
                    v29 = i[1];
                    if (v29)
                    {
                      if (*(_DWORD *)v29 == 120)
                      {
                        result = atoi((const char *)i[6]);
                        if ((int)result > 1)
                          v24 = 0;
                      }
                    }
                  }
                }
              }
              if (!v22)
              {
                do
                {
                  v30 = (_DWORD *)v26[7];
                  if (v30)
                  {
                    if (*v30 == 109)
                    {
                      for (j = (uint64_t **)v26[5]; j; j = (uint64_t **)*j)
                      {
                        v32 = j[1];
                        if (v32)
                        {
                          if (*(_DWORD *)v32 == 33)
                          {
                            result = atoi((const char *)j[6]);
                            if ((int)result > 1)
                              v23 = 0;
                          }
                        }
                      }
                    }
                  }
                  v26 = (_QWORD *)v26[2];
                }
                while (v26);
              }
              v22 = 1;
            }
          }
        }
        v21 = (_QWORD *)v21[2];
      }
      while (v21);
      if (v24)
      {
        if (v23)
          goto LABEL_59;
      }
      else
      {
        ReportAccessWarning((uint64_t)v10, a2, 1054, a4, a5, a6, a7, a8, v65);
        result = DisplayHTMLTableAlgorithm((uint64_t)v10, v50, v51, v52, v53, v54, v55, v56, v66);
        if (v23)
          goto LABEL_59;
      }
      ReportAccessWarning((uint64_t)v10, a2, 1053, a4, a5, a6, a7, a8, v65);
      result = DisplayHTMLTableAlgorithm((uint64_t)v10, v57, v58, v59, v60, v61, v62, v63, v67);
    }
  }
LABEL_59:
  if ((v10[1112] & 0xFFFFFFFE) == 2)
  {
    v33 = *(_QWORD *)(a2 + 24);
    if (v33)
    {
      v34 = *(_DWORD **)(v33 + 56);
      if (v34)
      {
        if (*v34 == 19 && !*(_QWORD *)(*(_QWORD *)(v33 + 24) + 56))
        {
          v64 = v10 + 1114;
          ClearMemory(v10 + 1114, 0x80uLL);
          v10[1113] = 0;
          getTextNode((uint64_t)v10, *(_QWORD *)(v33 + 24));
          while (*v64)
          {
            result = IsWhite((char)*v64++);
            if (!(_DWORD)result)
              goto LABEL_65;
          }
        }
      }
    }
    result = ReportAccessWarning((uint64_t)v10, a2, 1061, a4, a5, a6, a7, a8, v65);
  }
LABEL_65:
  v35 = *(_QWORD *)(a2 + 24);
  if (v35)
  {
    v36 = *(int **)(v35 + 56);
    if (v36)
    {
      v37 = *v36;
      if (v37 == 112
        || v37 == 19 && (v35 = *(_QWORD *)(v35 + 16)) != 0 && (v38 = *(_DWORD **)(v35 + 56)) != 0 && *v38 == 112)
      {
        result = CheckColumns((uint64_t)v10, v35);
      }
    }
  }
  if (!v10[1190])
  {
    v43 = *(_QWORD **)(a2 + 24);
    if (v43)
    {
      v44 = (int *)v43[7];
      if (v44)
      {
        v45 = *v44;
        if (v45 == 112
          || v45 == 19 && (v43 = (_QWORD *)v43[2]) != 0 && (v46 = (_DWORD *)v43[7]) != 0 && *v46 == 112)
        {
          result = CheckRows((uint64_t)v10, v43);
        }
      }
    }
  }
  v39 = v10[1112];
  if (v39 == 3 && !v13)
  {
    result = ReportAccessWarning((uint64_t)v10, a2, 1057, a4, a5, a6, a7, a8, v65);
    v39 = v10[1112];
  }
  if ((v39 & 0xFFFFFFFE) == 2)
  {
    v40 = *(_QWORD *)(a2 + 24);
    if (v40)
    {
      v41 = 0;
      do
      {
        v42 = *(_DWORD **)(v40 + 56);
        if (v42 && *v42 == 112)
          ++v41;
        v40 = *(_QWORD *)(v40 + 16);
      }
      while (v40);
      if (v41 == 1)
        result = ReportAccessWarning((uint64_t)v10, a2, 1055, a4, a5, a6, a7, a8, v65);
    }
    if (v10[1186])
      result = ReportAccessWarning((uint64_t)v10, a2, 1056, a4, a5, a6, a7, a8, v65);
  }
  if ((v10[1112] - 4) >= 0xFFFFFFFD && v10[1180] == 2)
  {
    if (!v10[1189])
    {
      if (v10[1190]
        || v10[1191]
        || v10[1192]
        || (result = ReportAccessWarning((uint64_t)v10, a2, 1050, a4, a5, a6, a7, a8, v65), !v10[1189]))
      {
        if (v10[1191])
          result = ReportAccessWarning((uint64_t)v10, a2, 1052, a4, a5, a6, a7, a8, v65);
      }
    }
    if (!v10[1190] && v10[1192])
    {
      v47 = (uint64_t)v10;
      v48 = a2;
      v49 = 1051;
      return ReportAccessWarning(v47, v48, v49, a4, a5, a6, a7, a8, a9);
    }
  }
  return result;
}

uint64_t CheckASCII(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10;
  int v11;
  uint64_t v12;
  unsigned int v13;
  int v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  char *v21;
  int v22;
  int v23;
  uint64_t v24;
  _DWORD *v25;
  uint64_t v26;
  _DWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  _DWORD *v36;
  char v37;

  v10 = result;
  v11 = *(_DWORD *)(result + 4448);
  if ((v11 - 4) < 0xFFFFFFFD || (v12 = a2[3]) == 0)
  {
LABEL_19:
    v21 = 0;
    v22 = 0;
    v23 = 0;
    goto LABEL_20;
  }
  v14 = *(_DWORD *)(v12 + 72);
  v13 = *(_DWORD *)(v12 + 76);
  v15 = (v14 + 1);
  if (v15 >= v13)
  {
    LODWORD(v20) = 0;
    goto LABEL_18;
  }
  v16 = *(_QWORD *)(*(_QWORD *)(result + 104) + 104);
  v17 = v16 + v15;
  v18 = -1;
  while (1)
  {
    v19 = *(unsigned __int8 *)(v16 + v15);
    if (v19 == 10)
      ++v18;
    if (v15 < (v14 + 6))
      break;
    LODWORD(v20) = 0;
LABEL_14:
    v14 = v15;
    ++v17;
    if (v13 == (_DWORD)++v15)
      goto LABEL_17;
  }
  v20 = 0;
  while (*(unsigned __int8 *)(v17 + v20) == v19)
  {
    if ((_DWORD)++v20 == 5)
    {
      LODWORD(v20) = 5;
      goto LABEL_17;
    }
  }
  if (v20 <= 4)
    goto LABEL_14;
LABEL_17:
  if (v18 <= 5)
  {
LABEL_18:
    if ((int)v20 < 5)
      goto LABEL_19;
  }
  v33 = a2[1];
  if (v33 && (v34 = *(_QWORD *)(v33 + 8)) != 0 && (v35 = *(_QWORD **)(v34 + 40)) != 0)
  {
    v23 = 0;
    v21 = 0;
    do
    {
      v36 = (_DWORD *)v35[1];
      if (v36)
      {
        if (*v36 == 58)
        {
          result = hasValue((uint64_t)v35);
          if ((_DWORD)result)
          {
            v21 = (char *)v35[6];
            ++v23;
          }
        }
      }
      v35 = (_QWORD *)*v35;
    }
    while (v35);
    v11 = *(_DWORD *)(v10 + 4448);
  }
  else
  {
    v21 = 0;
    v23 = 0;
  }
  v22 = 1;
LABEL_20:
  if ((v11 & 0xFFFFFFFE) != 2)
    return result;
  if (v23 != 1)
    goto LABEL_33;
  v24 = a2[2];
  if (!v24 || (v25 = *(_DWORD **)(v24 + 56)) == 0 || *v25 != 1 || (v26 = *(_QWORD *)(v24 + 40)) == 0)
  {
    v23 = 1;
    if (!v22)
      return result;
    goto LABEL_36;
  }
  v23 = 1;
  do
  {
    v27 = *(_DWORD **)(v26 + 8);
    if (v27)
    {
      if (*v27 == 79)
      {
        result = hasValue(v26);
        if ((_DWORD)result)
        {
          result = (uint64_t)strstr(v21, *(const char **)(v26 + 48));
          if (result)
            ++v23;
        }
      }
    }
    v26 = *(_QWORD *)v26;
  }
  while (v26);
LABEL_33:
  if (v22)
  {
LABEL_36:
    result = ReportAccessWarning(v10, (uint64_t)a2, 1024, a4, a5, a6, a7, a8, v37);
    if (*(_DWORD *)(v10 + 4448) == 3 && v23 <= 1)
      return ReportAccessWarning(v10, (uint64_t)a2, 1131, v28, v29, v30, v31, v32, a9);
  }
  return result;
}

uint64_t CheckLabel(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;

  if ((*(_DWORD *)(result + 4448) & 0xFFFFFFFE) == 2)
  {
    v10 = result;
    v11 = AttrGetById(a2, 50);
    result = hasValue((uint64_t)v11);
    if ((_DWORD)result)
      *(_DWORD *)(v10 + 4748) = 1;
    v18 = *(_DWORD *)(v10 + 4772) + 1;
    *(_DWORD *)(v10 + 4772) = v18;
    if (v18 == 2)
    {
      *(_DWORD *)(v10 + 4772) = 0;
      return CheckFormControls(v10, a2, v12, v13, v14, v15, v16, v17, a9);
    }
  }
  return result;
}

uint64_t CheckInputLabel(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10;
  _QWORD *i;
  _DWORD *v12;
  int v13;

  if ((*(_DWORD *)(result + 4448) & 0xFFFFFFFE) == 2)
  {
    v10 = result;
    for (i = *(_QWORD **)(a2 + 40); i; i = (_QWORD *)*i)
    {
      v12 = (_DWORD *)i[1];
      if (v12)
      {
        if (*v12 == 62)
        {
          result = hasValue((uint64_t)i);
          if ((_DWORD)result)
            *(_DWORD *)(v10 + 4752) = 1;
        }
      }
    }
    v13 = *(_DWORD *)(v10 + 4772) + 1;
    *(_DWORD *)(v10 + 4772) = v13;
    if (v13 == 2)
    {
      *(_DWORD *)(v10 + 4772) = 0;
      return CheckFormControls(v10, a2, a3, a4, a5, a6, a7, a8, a9);
    }
  }
  return result;
}

char *CheckInputAttributes(char *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  _QWORD *v9;
  uint64_t v11;
  int v12;
  int v13;
  int *v14;
  int v15;
  int *v16;

  v9 = *(_QWORD **)(a2 + 40);
  if (!v9)
    return result;
  v11 = (uint64_t)result;
  v12 = 0;
  v13 = 0;
  do
  {
    v14 = (int *)v9[1];
    if (!v14)
      goto LABEL_15;
    v15 = *v14;
    if (v15 != 142)
      goto LABEL_12;
    result = (char *)hasValue((uint64_t)v9);
    if ((_DWORD)result)
    {
      if ((*(_DWORD *)(v11 + 4448) - 4) >= 0xFFFFFFFD)
      {
        result = (char *)v9[6];
        if (result)
        {
          result = (char *)tmbstrcasecmp(result, "image");
          if (!(_DWORD)result)
            v12 = 1;
        }
      }
    }
    v16 = (int *)v9[1];
    if (v16)
    {
      v15 = *v16;
LABEL_12:
      if (v15 == 9)
      {
        result = (char *)hasValue((uint64_t)v9);
        if ((_DWORD)result)
          v13 = 1;
      }
    }
LABEL_15:
    v9 = (_QWORD *)*v9;
  }
  while (v9);
  if (v12)
  {
    if (!v13)
      return (char *)ReportAccessWarning(v11, a2, 1012, a4, a5, a6, a7, a8, a9);
  }
  return result;
}

uint64_t CheckFrameSet(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10;
  _QWORD *v11;
  int v12;
  uint64_t v13;
  int *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  _DWORD *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;

  if ((*(_DWORD *)(result + 4448) - 4) >= 0xFFFFFFFD)
  {
    v10 = result;
    v11 = *(_QWORD **)(a2 + 24);
    if (!v11)
      return ReportAccessWarning(v10, a2, 1076, a4, a5, a6, a7, a8, a9);
    v12 = 0;
    v13 = result + 4584;
    while (1)
    {
      v14 = (int *)v11[7];
      if (v14)
        break;
LABEL_28:
      v11 = (_QWORD *)v11[2];
      if (!v11)
      {
        if (v12)
          return result;
        return ReportAccessWarning(v10, a2, 1076, a4, a5, a6, a7, a8, a9);
      }
    }
    v15 = *v14;
    if (v15 != 71)
    {
      if (v15 == 1)
        result = ReportAccessWarning(v10, (uint64_t)v11, 1079, a4, a5, a6, a7, a8, v27);
      goto LABEL_28;
    }
    v16 = v11[3];
    if (v16)
    {
      v17 = *(_QWORD *)(v16 + 24);
      if (v17)
      {
        v18 = *(_DWORD **)(v17 + 56);
        if (v18)
        {
          if (*v18 == 79)
          {
            result = nodeIsText(*(_QWORD *)(v17 + 24));
            if (!(_DWORD)result)
              goto LABEL_27;
            v19 = (char *)textFromOneNode(v10, *(_QWORD *)(v17 + 24));
            result = (uint64_t)strstr(v19, "browser");
            if (!result)
              goto LABEL_27;
            v20 = v10;
            v21 = v17;
            v22 = 1078;
LABEL_26:
            result = ReportAccessWarning(v20, v21, v22, a4, a5, a6, a7, a8, v27);
LABEL_27:
            v12 = 1;
            goto LABEL_28;
          }
        }
      }
      v23 = *(unsigned int *)(v16 + 72);
      if (v23 >= *(_DWORD *)(v16 + 76))
      {
        LODWORD(v24) = 0;
      }
      else
      {
        v24 = 0;
        v25 = *(_QWORD *)(v10 + 104);
        do
        {
          *(_BYTE *)(v13 + v24) = *(_BYTE *)(*(_QWORD *)(v25 + 104) + v23 + v24);
          if (v24 == 127)
            break;
          ++v24;
        }
        while (v23 + v24 < (unint64_t)*(unsigned int *)(v16 + 76));
      }
      *(_BYTE *)(v13 + v24) = 0;
      v26 = 4584;
      while (*(_BYTE *)(v10 + v26))
      {
        result = IsWhite(*(char *)(v10 + v26++));
        if (!(_DWORD)result)
          goto LABEL_27;
      }
    }
    v20 = v10;
    v21 = (uint64_t)v11;
    v22 = 1077;
    goto LABEL_26;
  }
  return result;
}

uint64_t CheckBlink(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10;
  _BYTE *i;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if ((*(_DWORD *)(result + 4448) & 0xFFFFFFFE) == 2)
  {
    v10 = result;
    result = nodeIsText(*(_QWORD *)(a2 + 24));
    if ((_DWORD)result)
    {
      for (i = (_BYTE *)textFromOneNode(v10, *(_QWORD *)(a2 + 24)); ; ++i)
      {
        result = (char)*i;
        if (!*i)
          break;
        if (!IsWhite(result))
          return ReportAccessWarning(v10, a2, 1085, v12, v13, v14, v15, v16, a9);
      }
    }
  }
  return result;
}

uint64_t CheckMarquee(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10;
  _BYTE *i;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if ((*(_DWORD *)(result + 4448) & 0xFFFFFFFE) == 2)
  {
    v10 = result;
    result = nodeIsText(a2);
    if ((_DWORD)result)
    {
      for (i = (_BYTE *)textFromOneNode(v10, *(_QWORD *)(a2 + 24)); ; ++i)
      {
        result = (char)*i;
        if (!*i)
          break;
        if (!IsWhite(result))
          return ReportAccessWarning(v10, a2, 1085, v12, v13, v14, v15, v16, a9);
      }
    }
  }
  return result;
}

uint64_t CheckLink(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  _QWORD *v10;
  uint64_t v11;
  int v12;
  int v13;
  int *v14;
  int v15;
  int *v16;

  if ((*(_DWORD *)(result + 4448) - 4) < 0xFFFFFFFD)
    return result;
  v10 = *(_QWORD **)(a2 + 40);
  if (!v10)
    return result;
  v11 = result;
  v12 = 0;
  v13 = 0;
  do
  {
    v14 = (int *)v10[1];
    if (!v14)
      goto LABEL_15;
    v15 = *v14;
    if (v15 != 116)
      goto LABEL_12;
    result = hasValue((uint64_t)v10);
    if ((_DWORD)result)
    {
      result = v10[6];
      if (result)
      {
        result = (uint64_t)tmbsubstr((_BYTE *)result, "stylesheet");
        if (result)
          v13 = 1;
      }
    }
    v16 = (int *)v10[1];
    if (v16)
    {
      v15 = *v16;
LABEL_12:
      if (v15 == 142)
      {
        result = hasValue((uint64_t)v10);
        if ((_DWORD)result)
          v12 = 1;
      }
    }
LABEL_15:
    v10 = (_QWORD *)*v10;
  }
  while (v10);
  if (v13)
  {
    if (v12)
      return ReportAccessWarning(v11, a2, 1065, a4, a5, a6, a7, a8, a9);
  }
  return result;
}

uint64_t CheckEmbed(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if ((*(_DWORD *)(result + 4448) - 4) >= 0xFFFFFFFD)
  {
    v10 = result;
    v11 = AttrGetById(a2, 132);
    result = hasValue((uint64_t)v11);
    if ((_DWORD)result)
    {
      result = IsValidMediaExtension((_BYTE *)v11[6]);
      if ((_DWORD)result)
        return ReportAccessWarning(v10, a2, 1026, v12, v13, v14, v15, v16, a9);
    }
  }
  return result;
}

unint64_t CheckTH(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10;
  _QWORD *v11;
  int v12;
  _DWORD *v13;
  _BYTE *v14;
  unsigned int v15;
  _BYTE *v16;
  _BYTE *v17;
  char v18;
  unsigned __int8 *v19;
  int v20;
  int v21;
  _BYTE *v22;
  _BYTE *v23;
  _BYTE *i;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;

  if (*(_DWORD *)(result + 4448) == 3)
  {
    v10 = result;
    v11 = *(_QWORD **)(a2 + 40);
    if (v11)
    {
      v12 = 0;
      while (1)
      {
        v13 = (_DWORD *)v11[1];
        if (v13 && *v13 == 1)
        {
          v14 = (_BYTE *)v11[6];
          if (!v14)
            goto LABEL_12;
          while (1)
          {
            v15 = (char)*v14;
            if (!*v14)
              break;
            ++v14;
            if (!IsWhite(v15))
            {
              v12 = 1;
              break;
            }
          }
          v16 = (_BYTE *)v11[6];
          if (!v16 || !tmbstrlen(v16))
          {
LABEL_12:
            ReportAccessWarning(v10, a2, 1063, a4, a5, a6, a7, a8, v30);
            v12 = 1;
          }
          v17 = (_BYTE *)v11[6];
          if (v17)
          {
            v18 = *v17;
            if (*v17)
            {
              v19 = v17 + 1;
              while (1)
              {
                v20 = IsWhite(v18);
                if (!v20)
                  goto LABEL_23;
                v21 = *v19++;
                v18 = v21;
                if (!v21)
                {
                  if (v20 != 1)
                    goto LABEL_23;
                  break;
                }
              }
            }
            v22 = (_BYTE *)v11[6];
          }
          else
          {
            v22 = 0;
          }
          if (tmbstrlen(v22))
          {
            ReportAccessWarning(v10, a2, 1064, a4, a5, a6, a7, a8, v30);
            v12 = 1;
          }
        }
LABEL_23:
        v11 = (_QWORD *)*v11;
        if (!v11)
          goto LABEL_26;
      }
    }
    v12 = 0;
LABEL_26:
    v23 = (_BYTE *)textFromOneNode(v10, *(_QWORD *)(a2 + 24));
    for (i = v23; ; ++i)
    {
      result = (char)*i;
      if (!*i)
        break;
      if (!IsWhite(result))
      {
        result = (unint64_t)tmbstrlen(v23);
        if (result >= 0x10 && !v12)
          return ReportAccessWarning(v10, a2, 1062, v25, v26, v27, v28, v29, a9);
        return result;
      }
    }
  }
  return result;
}

uint64_t CheckListUsage(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int *v9;
  int v10;
  int v11;
  int *v12;
  int v13;
  uint64_t v14;
  _DWORD *v15;

  if (a2)
  {
    if ((*(_DWORD *)(result + 4448) & 0xFFFFFFFE) == 2)
    {
      v9 = *(int **)(a2 + 56);
      if (v9)
      {
        v10 = *v9;
        if (v10 == 61)
        {
          if (!*(_QWORD *)a2)
            goto LABEL_21;
          v12 = *(int **)(*(_QWORD *)a2 + 56);
          if (!v12)
            goto LABEL_21;
          v13 = *v12;
          if (v13 != 115 && v13 != 76)
            goto LABEL_21;
          if (*(_DWORD *)(a2 + 96))
          {
            if (v13 == 115)
              v11 = 1044;
            else
              v11 = 1045;
            return ReportAccessWarning(result, a2, v11, a4, a5, a6, a7, a8, a9);
          }
        }
        else
        {
          if (v10 == 76)
          {
            v11 = 1045;
          }
          else
          {
            if (v10 != 115)
              return result;
            v11 = 1044;
          }
          v14 = *(_QWORD *)(a2 + 24);
          if (!v14)
            return ReportAccessWarning(result, a2, v11, a4, a5, a6, a7, a8, a9);
          v15 = *(_DWORD **)(v14 + 56);
          if (!v15 || *v15 != 61)
            return ReportAccessWarning(result, a2, v11, a4, a5, a6, a7, a8, a9);
          if (*(_DWORD *)(a2 + 96))
          {
LABEL_21:
            v11 = 1046;
            return ReportAccessWarning(result, a2, v11, a4, a5, a6, a7, a8, a9);
          }
        }
      }
    }
  }
  return result;
}

uint64_t GetRgb(char *__s2, uint64_t a2)
{
  uint64_t v4;
  int *v5;
  int v6;
  int v7;
  int v8;
  unsigned int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  unsigned int v15;
  int v16;
  int v17;
  int v18;
  unsigned int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  unsigned int v24;
  int v25;
  int v26;
  int v27;
  unsigned int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  unsigned int v33;
  int v34;

  v4 = 0;
  v5 = &dword_20AB605B0;
  do
  {
    if (strstr(colorNames[v4], __s2))
    {
      *(_QWORD *)a2 = *((_QWORD *)v5 - 1);
      v8 = *v5;
LABEL_10:
      *(_DWORD *)(a2 + 8) = v8;
      return 1;
    }
    v5 += 3;
    ++v4;
  }
  while (v4 != 16);
  if (tmbstrlen(__s2) == (_BYTE *)7 && *__s2 == 35)
  {
    v6 = __s2[1];
    v7 = v6 - 48;
    if ((v6 - 48) > 9)
    {
      if ((v6 - 97) > 5)
      {
        v10 = v6 - 65;
        v11 = v6 - 55;
        if (v10 >= 6)
          v7 = -1;
        else
          v7 = v11;
      }
      else
      {
        v7 = v6 - 87;
      }
    }
    v12 = 16 * v7;
    v13 = __s2[2];
    v14 = v13 - 48;
    if ((v13 - 48) > 9)
    {
      if ((v13 - 97) > 5)
      {
        v15 = v13 - 65;
        v16 = v13 - 55;
        if (v15 >= 6)
          v14 = -1;
        else
          v14 = v16;
      }
      else
      {
        v14 = v13 - 87;
      }
    }
    *(_DWORD *)a2 = v14 + v12;
    v17 = __s2[3];
    v18 = v17 - 48;
    if ((v17 - 48) > 9)
    {
      if ((v17 - 97) > 5)
      {
        v19 = v17 - 65;
        v20 = v17 - 55;
        if (v19 >= 6)
          v18 = -1;
        else
          v18 = v20;
      }
      else
      {
        v18 = v17 - 87;
      }
    }
    v21 = 16 * v18;
    v22 = __s2[4];
    v23 = v22 - 48;
    if ((v22 - 48) > 9)
    {
      if ((v22 - 97) > 5)
      {
        v24 = v22 - 65;
        v25 = v22 - 55;
        if (v24 >= 6)
          v23 = -1;
        else
          v23 = v25;
      }
      else
      {
        v23 = v22 - 87;
      }
    }
    *(_DWORD *)(a2 + 4) = v23 + v21;
    v26 = __s2[5];
    v27 = v26 - 48;
    if ((v26 - 48) > 9)
    {
      if ((v26 - 97) > 5)
      {
        v28 = v26 - 65;
        v29 = v26 - 55;
        if (v28 >= 6)
          v27 = -1;
        else
          v27 = v29;
      }
      else
      {
        v27 = v26 - 87;
      }
    }
    v30 = 16 * v27;
    v31 = __s2[6];
    v32 = v31 - 48;
    if ((v31 - 48) > 9)
    {
      if ((v31 - 97) > 5)
      {
        v33 = v31 - 65;
        v34 = v31 - 55;
        if (v33 >= 6)
          v32 = -1;
        else
          v32 = v34;
      }
      else
      {
        v32 = v31 - 87;
      }
    }
    v8 = v32 + v30;
    goto LABEL_10;
  }
  return 0;
}

_BYTE *GetFileExtension(_BYTE *a1, _BYTE *a2)
{
  _BYTE *result;
  _BYTE *i;
  int v6;

  result = tmbstrlen(a1);
  *a2 = 0;
  if (result)
  {
    for (i = result - 1; i; --i)
    {
      v6 = i[(_QWORD)a1];
      if (v6 == 92 || v6 == 47)
        break;
      if (v6 == 46)
        return (_BYTE *)tmbstrncpy(a2, &i[(_QWORD)a1], 20);
    }
  }
  return result;
}

uint64_t IsValidMediaExtension(_BYTE *a1)
{
  uint64_t v1;
  char v3[20];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  GetFileExtension(a1, v3);
  v1 = 0;
  while (tmbstrcasecmp(v3, mediaExtensions[v1]))
  {
    if (++v1 == 18)
      return 0;
  }
  return 1;
}

BOOL IsPlaceholderAlt(char *a1)
{
  return strstr(a1, "image") || strstr(a1, "photo") != 0;
}

BOOL EndsWithBytes(_BYTE *a1)
{
  _BYTE *v2;

  v2 = tmbstrlen(a1);
  return (unint64_t)v2 >= 5 && tmbstrcmp(&v2[(_QWORD)a1 - 5], "bytes") == 0;
}

uint64_t IsImage(_BYTE *a1)
{
  uint64_t v1;
  char v3[20];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  GetFileExtension(a1, v3);
  v1 = 0;
  while (tmbstrcasecmp(v3, imageExtensions[v1]))
  {
    if (++v1 == 13)
      return 0;
  }
  return 1;
}

uint64_t FindLinkA(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v2;
  _DWORD *v4;
  _QWORD *v5;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 24);
  if (!v2)
    return 0;
  do
  {
    v4 = *(_DWORD **)(v2 + 56);
    if (v4 && *v4 == 1)
    {
      v5 = AttrGetById(v2, 58);
      result = hasValue((uint64_t)v5);
      if ((_DWORD)result)
        result = tmbstrcmp(a2, (unsigned __int8 *)v5[6]) == 0;
    }
    else
    {
      result = FindLinkA(v2, a2);
    }
    if ((_DWORD)result)
      break;
    v2 = *(_QWORD *)(v2 + 16);
  }
  while (v2);
  return result;
}

uint64_t IsValidSrcExtension(_BYTE *a1)
{
  uint64_t v1;
  char v3[20];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  GetFileExtension(a1, v3);
  v1 = 0;
  while (tmbstrcasecmp(v3, frameExtensions[v1]))
  {
    if (++v1 == 10)
      return 0;
  }
  return 1;
}

uint64_t CheckColumns(uint64_t result, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  uint64_t v4;
  int v5;
  int v6;
  _DWORD *v7;
  _BYTE *v8;
  uint64_t v9;

  ++*(_DWORD *)(result + 4720);
  v2 = *(_QWORD **)(a2 + 24);
  if (v2)
  {
    v3 = (_DWORD *)v2[7];
    if (v3)
    {
      if (*v3 == 109)
      {
        v4 = result;
        v5 = 0;
        v6 = 0;
        *(_DWORD *)(result + 4744) = 1;
        do
        {
          v7 = (_DWORD *)v2[7];
          if (v7 && *v7 == 109)
          {
            result = nodeIsText(v2[3]);
            if ((_DWORD)result)
            {
              v8 = (_BYTE *)textFromOneNode(v4, v2[3]);
              while (1)
              {
                result = (char)*v8;
                if (!*v8)
                  break;
                result = IsWhite(result);
                ++v8;
                if (!(_DWORD)result)
                {
                  ++v6;
                  break;
                }
              }
            }
          }
          else
          {
            v5 = 1;
          }
          v2 = (_QWORD *)v2[2];
        }
        while (v2);
        if (!v5 && v6 >= 1)
        {
          v9 = 4760;
LABEL_20:
          *(_DWORD *)(v4 + v9) = 1;
          return result;
        }
        if (v5 && v6 >= 2)
        {
          v9 = 4768;
          goto LABEL_20;
        }
      }
    }
  }
  return result;
}

uint64_t CheckRows(uint64_t result, _QWORD *a2)
{
  _DWORD *v2;
  _QWORD *v3;
  int v4;
  unsigned int v5;
  _DWORD *v6;
  uint64_t v7;
  _BYTE *v8;

  v2 = (_DWORD *)result;
  ++*(_DWORD *)(result + 4720);
  if (!a2)
  {
    v4 = 0;
    v5 = 0;
LABEL_15:
    v2[1189] = 1;
    goto LABEL_16;
  }
  v3 = a2;
  v4 = 0;
  v5 = 0;
  do
  {
    v6 = (_DWORD *)v3[7];
    if (v6)
    {
      if (*v6 == 109)
      {
        v2[1186] = 1;
        v7 = v3[3];
        if (v7)
        {
          result = nodeIsText(*(_QWORD *)(v7 + 24));
          if ((_DWORD)result)
          {
            v8 = (_BYTE *)textFromOneNode((uint64_t)v2, *(_QWORD *)(v3[3] + 24));
            while (1)
            {
              result = (char)*v8;
              if (!*v8)
                break;
              result = IsWhite(result);
              ++v8;
              if (!(_DWORD)result)
              {
                ++v4;
                break;
              }
            }
          }
        }
      }
    }
    ++v5;
    v3 = (_QWORD *)v3[2];
  }
  while (v3);
  if (v5 == v4)
    goto LABEL_15;
LABEL_16:
  if (v5 >= 2 && (int)v5 > v4 && v4 >= 2 && v2[1186] == 1)
    v2[1191] = 1;
  return result;
}

uint64_t getTextNode(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t i;

  result = nodeIsText(a2);
  if ((_DWORD)result)
  {
    v5 = *(unsigned int *)(a2 + 72);
    if (v5 >= *(_DWORD *)(a2 + 76))
    {
LABEL_5:
      for (i = *(_QWORD *)(a2 + 24); i; i = *(_QWORD *)(i + 16))
        result = getTextNode(a1, i);
    }
    else
    {
      while (1)
      {
        v6 = *(int *)(a1 + 4452);
        if ((int)v6 > 126)
          break;
        v7 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 104) + v5);
        *(_DWORD *)(a1 + 4452) = v6 + 1;
        *(_BYTE *)(a1 + 4456 + v6) = v7;
        if (++v5 >= (unint64_t)*(unsigned int *)(a2 + 76))
          goto LABEL_5;
      }
    }
  }
  return result;
}

uint64_t CheckFormControls(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10;
  char v11;

  v10 = result;
  if (!*(_DWORD *)(result + 4748) && *(_DWORD *)(result + 4752))
    result = ReportAccessWarning(result, a2, 1120, a4, a5, a6, a7, a8, v11);
  if (!*(_DWORD *)(v10 + 4752))
  {
    if (!*(_DWORD *)(v10 + 4748))
      return ReportAccessWarning(v10, a2, 1119, a4, a5, a6, a7, a8, a9);
    result = ReportAccessWarning(v10, a2, 1121, a4, a5, a6, a7, a8, v11);
    if (!*(_DWORD *)(v10 + 4752) && !*(_DWORD *)(v10 + 4748))
      return ReportAccessWarning(v10, a2, 1119, a4, a5, a6, a7, a8, a9);
  }
  return result;
}

Bool tidySetMallocCall(TidyMalloc fmalloc)
{
  g_malloc = fmalloc;
  return 1;
}

Bool tidySetReallocCall(TidyRealloc frealloc)
{
  g_realloc = frealloc;
  return 1;
}

Bool tidySetFreeCall(TidyFree ffree)
{
  g_free = ffree;
  return 1;
}

Bool tidySetPanicCall(TidyPanic fpanic)
{
  g_panic = fpanic;
  return 1;
}

uint64_t FatalError(const char *a1)
{
  if (!g_panic)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "Fatal error: %s\n", a1);
    exit(2);
  }
  return g_panic();
}

void *MemAlloc(size_t a1)
{
  void *v1;
  void *v2;

  if (g_malloc)
    v1 = (void *)g_malloc();
  else
    v1 = malloc_type_malloc(a1, 0x3A45540EuLL);
  v2 = v1;
  if (!v1)
    FatalError("Out of memory!");
  return v2;
}

void *MemRealloc(void *a1, size_t ptr)
{
  void *result;

  if (!a1)
    return MemAlloc(ptr);
  if (g_realloc)
  {
    result = (void *)g_realloc();
    if (result)
      return result;
    goto LABEL_4;
  }
  result = malloc_type_realloc(a1, ptr, 0x38B90D59uLL);
  if (!result)
  {
LABEL_4:
    FatalError("Out of memory!");
    return 0;
  }
  return result;
}

void MemFree(void *a1)
{
  if (a1)
  {
    if (g_free)
      g_free();
    else
      free(a1);
  }
}

Bool tidyAttrIsHREF(TidyAttr tattr)
{
  _DWORD *v1;

  if (tattr)
  {
    v1 = *(_DWORD **)&tattr[2]._opaque;
    if (v1)
      LODWORD(tattr) = *v1 == 58;
    else
      LODWORD(tattr) = 0;
  }
  return tattr;
}

Bool tidyAttrIsSRC(TidyAttr tattr)
{
  _DWORD *v1;

  if (tattr)
  {
    v1 = *(_DWORD **)&tattr[2]._opaque;
    if (v1)
      LODWORD(tattr) = *v1 == 132;
    else
      LODWORD(tattr) = 0;
  }
  return tattr;
}

Bool tidyAttrIsID(TidyAttr tattr)
{
  _DWORD *v1;

  if (tattr)
  {
    v1 = *(_DWORD **)&tattr[2]._opaque;
    if (v1)
      LODWORD(tattr) = *v1 == 62;
    else
      LODWORD(tattr) = 0;
  }
  return tattr;
}

Bool tidyAttrIsNAME(TidyAttr tattr)
{
  _DWORD *v1;

  if (tattr)
  {
    v1 = *(_DWORD **)&tattr[2]._opaque;
    if (v1)
      LODWORD(tattr) = *v1 == 79;
    else
      LODWORD(tattr) = 0;
  }
  return tattr;
}

Bool tidyAttrIsSUMMARY(TidyAttr tattr)
{
  _DWORD *v1;

  if (tattr)
  {
    v1 = *(_DWORD **)&tattr[2]._opaque;
    if (v1)
      LODWORD(tattr) = *v1 == 136;
    else
      LODWORD(tattr) = 0;
  }
  return tattr;
}

Bool tidyAttrIsALT(TidyAttr tattr)
{
  _DWORD *v1;

  if (tattr)
  {
    v1 = *(_DWORD **)&tattr[2]._opaque;
    if (v1)
      LODWORD(tattr) = *v1 == 9;
    else
      LODWORD(tattr) = 0;
  }
  return tattr;
}

Bool tidyAttrIsLONGDESC(TidyAttr tattr)
{
  _DWORD *v1;

  if (tattr)
  {
    v1 = *(_DWORD **)&tattr[2]._opaque;
    if (v1)
      LODWORD(tattr) = *v1 == 71;
    else
      LODWORD(tattr) = 0;
  }
  return tattr;
}

Bool tidyAttrIsUSEMAP(TidyAttr tattr)
{
  _DWORD *v1;

  if (tattr)
  {
    v1 = *(_DWORD **)&tattr[2]._opaque;
    if (v1)
      LODWORD(tattr) = *v1 == 143;
    else
      LODWORD(tattr) = 0;
  }
  return tattr;
}

Bool tidyAttrIsISMAP(TidyAttr tattr)
{
  _DWORD *v1;

  if (tattr)
  {
    v1 = *(_DWORD **)&tattr[2]._opaque;
    if (v1)
      LODWORD(tattr) = *v1 == 63;
    else
      LODWORD(tattr) = 0;
  }
  return tattr;
}

Bool tidyAttrIsLANGUAGE(TidyAttr tattr)
{
  _DWORD *v1;

  if (tattr)
  {
    v1 = *(_DWORD **)&tattr[2]._opaque;
    if (v1)
      LODWORD(tattr) = *v1 == 66;
    else
      LODWORD(tattr) = 0;
  }
  return tattr;
}

Bool tidyAttrIsTYPE(TidyAttr tattr)
{
  _DWORD *v1;

  if (tattr)
  {
    v1 = *(_DWORD **)&tattr[2]._opaque;
    if (v1)
      LODWORD(tattr) = *v1 == 142;
    else
      LODWORD(tattr) = 0;
  }
  return tattr;
}

Bool tidyAttrIsVALUE(TidyAttr tattr)
{
  _DWORD *v1;

  if (tattr)
  {
    v1 = *(_DWORD **)&tattr[2]._opaque;
    if (v1)
      LODWORD(tattr) = *v1 == 145;
    else
      LODWORD(tattr) = 0;
  }
  return tattr;
}

Bool tidyAttrIsCONTENT(TidyAttr tattr)
{
  _DWORD *v1;

  if (tattr)
  {
    v1 = *(_DWORD **)&tattr[2]._opaque;
    if (v1)
      LODWORD(tattr) = *v1 == 35;
    else
      LODWORD(tattr) = 0;
  }
  return tattr;
}

Bool tidyAttrIsTITLE(TidyAttr tattr)
{
  _DWORD *v1;

  if (tattr)
  {
    v1 = *(_DWORD **)&tattr[2]._opaque;
    if (v1)
      LODWORD(tattr) = *v1 == 140;
    else
      LODWORD(tattr) = 0;
  }
  return tattr;
}

Bool tidyAttrIsXMLNS(TidyAttr tattr)
{
  _DWORD *v1;

  if (tattr)
  {
    v1 = *(_DWORD **)&tattr[2]._opaque;
    if (v1)
      LODWORD(tattr) = *v1 == 154;
    else
      LODWORD(tattr) = 0;
  }
  return tattr;
}

Bool tidyAttrIsDATAFLD(TidyAttr tattr)
{
  _DWORD *v1;

  if (tattr)
  {
    v1 = *(_DWORD **)&tattr[2]._opaque;
    if (v1)
      LODWORD(tattr) = *v1 == 38;
    else
      LODWORD(tattr) = 0;
  }
  return tattr;
}

Bool tidyAttrIsWIDTH(TidyAttr tattr)
{
  _DWORD *v1;

  if (tattr)
  {
    v1 = *(_DWORD **)&tattr[2]._opaque;
    if (v1)
      LODWORD(tattr) = *v1 == 150;
    else
      LODWORD(tattr) = 0;
  }
  return tattr;
}

Bool tidyAttrIsHEIGHT(TidyAttr tattr)
{
  _DWORD *v1;

  if (tattr)
  {
    v1 = *(_DWORD **)&tattr[2]._opaque;
    if (v1)
      LODWORD(tattr) = *v1 == 57;
    else
      LODWORD(tattr) = 0;
  }
  return tattr;
}

Bool tidyAttrIsFOR(TidyAttr tattr)
{
  _DWORD *v1;

  if (tattr)
  {
    v1 = *(_DWORD **)&tattr[2]._opaque;
    if (v1)
      LODWORD(tattr) = *v1 == 50;
    else
      LODWORD(tattr) = 0;
  }
  return tattr;
}

Bool tidyAttrIsSELECTED(TidyAttr tattr)
{
  _DWORD *v1;

  if (tattr)
  {
    v1 = *(_DWORD **)&tattr[2]._opaque;
    if (v1)
      LODWORD(tattr) = *v1 == 125;
    else
      LODWORD(tattr) = 0;
  }
  return tattr;
}

Bool tidyAttrIsCHECKED(TidyAttr tattr)
{
  _DWORD *v1;

  if (tattr)
  {
    v1 = *(_DWORD **)&tattr[2]._opaque;
    if (v1)
      LODWORD(tattr) = *v1 == 23;
    else
      LODWORD(tattr) = 0;
  }
  return tattr;
}

Bool tidyAttrIsLANG(TidyAttr tattr)
{
  _DWORD *v1;

  if (tattr)
  {
    v1 = *(_DWORD **)&tattr[2]._opaque;
    if (v1)
      LODWORD(tattr) = *v1 == 65;
    else
      LODWORD(tattr) = 0;
  }
  return tattr;
}

Bool tidyAttrIsTARGET(TidyAttr tattr)
{
  _DWORD *v1;

  if (tattr)
  {
    v1 = *(_DWORD **)&tattr[2]._opaque;
    if (v1)
      LODWORD(tattr) = *v1 == 138;
    else
      LODWORD(tattr) = 0;
  }
  return tattr;
}

Bool tidyAttrIsHTTP_EQUIV(TidyAttr tattr)
{
  _DWORD *v1;

  if (tattr)
  {
    v1 = *(_DWORD **)&tattr[2]._opaque;
    if (v1)
      LODWORD(tattr) = *v1 == 61;
    else
      LODWORD(tattr) = 0;
  }
  return tattr;
}

Bool tidyAttrIsREL(TidyAttr tattr)
{
  _DWORD *v1;

  if (tattr)
  {
    v1 = *(_DWORD **)&tattr[2]._opaque;
    if (v1)
      LODWORD(tattr) = *v1 == 116;
    else
      LODWORD(tattr) = 0;
  }
  return tattr;
}

Bool tidyAttrIsOnMOUSEMOVE(TidyAttr tattr)
{
  _DWORD *v1;

  if (tattr)
  {
    v1 = *(_DWORD **)&tattr[2]._opaque;
    if (v1)
      LODWORD(tattr) = *v1 == 102;
    else
      LODWORD(tattr) = 0;
  }
  return tattr;
}

Bool tidyAttrIsOnMOUSEDOWN(TidyAttr tattr)
{
  _DWORD *v1;

  if (tattr)
  {
    v1 = *(_DWORD **)&tattr[2]._opaque;
    if (v1)
      LODWORD(tattr) = *v1 == 101;
    else
      LODWORD(tattr) = 0;
  }
  return tattr;
}

Bool tidyAttrIsOnMOUSEUP(TidyAttr tattr)
{
  _DWORD *v1;

  if (tattr)
  {
    v1 = *(_DWORD **)&tattr[2]._opaque;
    if (v1)
      LODWORD(tattr) = *v1 == 105;
    else
      LODWORD(tattr) = 0;
  }
  return tattr;
}

Bool tidyAttrIsOnCLICK(TidyAttr tattr)
{
  _DWORD *v1;

  if (tattr)
  {
    v1 = *(_DWORD **)&tattr[2]._opaque;
    if (v1)
      LODWORD(tattr) = *v1 == 90;
    else
      LODWORD(tattr) = 0;
  }
  return tattr;
}

Bool tidyAttrIsOnMOUSEOVER(TidyAttr tattr)
{
  _DWORD *v1;

  if (tattr)
  {
    v1 = *(_DWORD **)&tattr[2]._opaque;
    if (v1)
      LODWORD(tattr) = *v1 == 104;
    else
      LODWORD(tattr) = 0;
  }
  return tattr;
}

Bool tidyAttrIsOnMOUSEOUT(TidyAttr tattr)
{
  _DWORD *v1;

  if (tattr)
  {
    v1 = *(_DWORD **)&tattr[2]._opaque;
    if (v1)
      LODWORD(tattr) = *v1 == 103;
    else
      LODWORD(tattr) = 0;
  }
  return tattr;
}

Bool tidyAttrIsOnKEYDOWN(TidyAttr tattr)
{
  _DWORD *v1;

  if (tattr)
  {
    v1 = *(_DWORD **)&tattr[2]._opaque;
    if (v1)
      LODWORD(tattr) = *v1 == 97;
    else
      LODWORD(tattr) = 0;
  }
  return tattr;
}

Bool tidyAttrIsOnKEYUP(TidyAttr tattr)
{
  _DWORD *v1;

  if (tattr)
  {
    v1 = *(_DWORD **)&tattr[2]._opaque;
    if (v1)
      LODWORD(tattr) = *v1 == 99;
    else
      LODWORD(tattr) = 0;
  }
  return tattr;
}

Bool tidyAttrIsOnKEYPRESS(TidyAttr tattr)
{
  _DWORD *v1;

  if (tattr)
  {
    v1 = *(_DWORD **)&tattr[2]._opaque;
    if (v1)
      LODWORD(tattr) = *v1 == 98;
    else
      LODWORD(tattr) = 0;
  }
  return tattr;
}

Bool tidyAttrIsOnFOCUS(TidyAttr tattr)
{
  _DWORD *v1;

  if (tattr)
  {
    v1 = *(_DWORD **)&tattr[2]._opaque;
    if (v1)
      LODWORD(tattr) = *v1 == 96;
    else
      LODWORD(tattr) = 0;
  }
  return tattr;
}

Bool tidyAttrIsOnBLUR(TidyAttr tattr)
{
  _DWORD *v1;

  if (tattr)
  {
    v1 = *(_DWORD **)&tattr[2]._opaque;
    if (v1)
      LODWORD(tattr) = *v1 == 88;
    else
      LODWORD(tattr) = 0;
  }
  return tattr;
}

Bool tidyAttrIsBGCOLOR(TidyAttr tattr)
{
  _DWORD *v1;

  if (tattr)
  {
    v1 = *(_DWORD **)&tattr[2]._opaque;
    if (v1)
      LODWORD(tattr) = *v1 == 13;
    else
      LODWORD(tattr) = 0;
  }
  return tattr;
}

Bool tidyAttrIsLINK(TidyAttr tattr)
{
  _DWORD *v1;

  if (tattr)
  {
    v1 = *(_DWORD **)&tattr[2]._opaque;
    if (v1)
      LODWORD(tattr) = *v1 == 70;
    else
      LODWORD(tattr) = 0;
  }
  return tattr;
}

Bool tidyAttrIsALINK(TidyAttr tattr)
{
  _DWORD *v1;

  if (tattr)
  {
    v1 = *(_DWORD **)&tattr[2]._opaque;
    if (v1)
      LODWORD(tattr) = *v1 == 8;
    else
      LODWORD(tattr) = 0;
  }
  return tattr;
}

Bool tidyAttrIsVLINK(TidyAttr tattr)
{
  _DWORD *v1;

  if (tattr)
  {
    v1 = *(_DWORD **)&tattr[2]._opaque;
    if (v1)
      LODWORD(tattr) = *v1 == 148;
    else
      LODWORD(tattr) = 0;
  }
  return tattr;
}

Bool tidyAttrIsTEXT(TidyAttr tattr)
{
  _DWORD *v1;

  if (tattr)
  {
    v1 = *(_DWORD **)&tattr[2]._opaque;
    if (v1)
      LODWORD(tattr) = *v1 == 139;
    else
      LODWORD(tattr) = 0;
  }
  return tattr;
}

Bool tidyAttrIsSTYLE(TidyAttr tattr)
{
  _DWORD *v1;

  if (tattr)
  {
    v1 = *(_DWORD **)&tattr[2]._opaque;
    if (v1)
      LODWORD(tattr) = *v1 == 135;
    else
      LODWORD(tattr) = 0;
  }
  return tattr;
}

Bool tidyAttrIsABBR(TidyAttr tattr)
{
  _DWORD *v1;

  if (tattr)
  {
    v1 = *(_DWORD **)&tattr[2]._opaque;
    if (v1)
      LODWORD(tattr) = *v1 == 1;
    else
      LODWORD(tattr) = 0;
  }
  return tattr;
}

Bool tidyAttrIsCOLSPAN(TidyAttr tattr)
{
  _DWORD *v1;

  if (tattr)
  {
    v1 = *(_DWORD **)&tattr[2]._opaque;
    if (v1)
      LODWORD(tattr) = *v1 == 33;
    else
      LODWORD(tattr) = 0;
  }
  return tattr;
}

Bool tidyAttrIsROWSPAN(TidyAttr tattr)
{
  _DWORD *v1;

  if (tattr)
  {
    v1 = *(_DWORD **)&tattr[2]._opaque;
    if (v1)
      LODWORD(tattr) = *v1 == 120;
    else
      LODWORD(tattr) = 0;
  }
  return tattr;
}

TidyAttr tidyAttrGetHREF(TidyNode tnod)
{
  return (TidyAttr)AttrGetById((uint64_t)tnod, 58);
}

TidyAttr tidyAttrGetSRC(TidyNode tnod)
{
  return (TidyAttr)AttrGetById((uint64_t)tnod, 132);
}

TidyAttr tidyAttrGetID(TidyNode tnod)
{
  return (TidyAttr)AttrGetById((uint64_t)tnod, 62);
}

TidyAttr tidyAttrGetNAME(TidyNode tnod)
{
  return (TidyAttr)AttrGetById((uint64_t)tnod, 79);
}

TidyAttr tidyAttrGetSUMMARY(TidyNode tnod)
{
  return (TidyAttr)AttrGetById((uint64_t)tnod, 136);
}

TidyAttr tidyAttrGetALT(TidyNode tnod)
{
  return (TidyAttr)AttrGetById((uint64_t)tnod, 9);
}

TidyAttr tidyAttrGetLONGDESC(TidyNode tnod)
{
  return (TidyAttr)AttrGetById((uint64_t)tnod, 71);
}

TidyAttr tidyAttrGetUSEMAP(TidyNode tnod)
{
  return (TidyAttr)AttrGetById((uint64_t)tnod, 143);
}

TidyAttr tidyAttrGetISMAP(TidyNode tnod)
{
  return (TidyAttr)AttrGetById((uint64_t)tnod, 63);
}

TidyAttr tidyAttrGetLANGUAGE(TidyNode tnod)
{
  return (TidyAttr)AttrGetById((uint64_t)tnod, 66);
}

TidyAttr tidyAttrGetTYPE(TidyNode tnod)
{
  return (TidyAttr)AttrGetById((uint64_t)tnod, 142);
}

TidyAttr tidyAttrGetVALUE(TidyNode tnod)
{
  return (TidyAttr)AttrGetById((uint64_t)tnod, 145);
}

TidyAttr tidyAttrGetCONTENT(TidyNode tnod)
{
  return (TidyAttr)AttrGetById((uint64_t)tnod, 35);
}

TidyAttr tidyAttrGetTITLE(TidyNode tnod)
{
  return (TidyAttr)AttrGetById((uint64_t)tnod, 140);
}

TidyAttr tidyAttrGetXMLNS(TidyNode tnod)
{
  return (TidyAttr)AttrGetById((uint64_t)tnod, 154);
}

TidyAttr tidyAttrGetDATAFLD(TidyNode tnod)
{
  return (TidyAttr)AttrGetById((uint64_t)tnod, 38);
}

TidyAttr tidyAttrGetWIDTH(TidyNode tnod)
{
  return (TidyAttr)AttrGetById((uint64_t)tnod, 150);
}

TidyAttr tidyAttrGetHEIGHT(TidyNode tnod)
{
  return (TidyAttr)AttrGetById((uint64_t)tnod, 57);
}

TidyAttr tidyAttrGetFOR(TidyNode tnod)
{
  return (TidyAttr)AttrGetById((uint64_t)tnod, 50);
}

TidyAttr tidyAttrGetSELECTED(TidyNode tnod)
{
  return (TidyAttr)AttrGetById((uint64_t)tnod, 125);
}

TidyAttr tidyAttrGetCHECKED(TidyNode tnod)
{
  return (TidyAttr)AttrGetById((uint64_t)tnod, 23);
}

TidyAttr tidyAttrGetLANG(TidyNode tnod)
{
  return (TidyAttr)AttrGetById((uint64_t)tnod, 65);
}

TidyAttr tidyAttrGetTARGET(TidyNode tnod)
{
  return (TidyAttr)AttrGetById((uint64_t)tnod, 138);
}

TidyAttr tidyAttrGetHTTP_EQUIV(TidyNode tnod)
{
  return (TidyAttr)AttrGetById((uint64_t)tnod, 61);
}

TidyAttr tidyAttrGetREL(TidyNode tnod)
{
  return (TidyAttr)AttrGetById((uint64_t)tnod, 116);
}

TidyAttr tidyAttrGetOnMOUSEMOVE(TidyNode tnod)
{
  return (TidyAttr)AttrGetById((uint64_t)tnod, 102);
}

TidyAttr tidyAttrGetOnMOUSEDOWN(TidyNode tnod)
{
  return (TidyAttr)AttrGetById((uint64_t)tnod, 101);
}

TidyAttr tidyAttrGetOnMOUSEUP(TidyNode tnod)
{
  return (TidyAttr)AttrGetById((uint64_t)tnod, 105);
}

TidyAttr tidyAttrGetOnCLICK(TidyNode tnod)
{
  return (TidyAttr)AttrGetById((uint64_t)tnod, 90);
}

TidyAttr tidyAttrGetOnMOUSEOVER(TidyNode tnod)
{
  return (TidyAttr)AttrGetById((uint64_t)tnod, 104);
}

TidyAttr tidyAttrGetOnMOUSEOUT(TidyNode tnod)
{
  return (TidyAttr)AttrGetById((uint64_t)tnod, 103);
}

TidyAttr tidyAttrGetOnKEYDOWN(TidyNode tnod)
{
  return (TidyAttr)AttrGetById((uint64_t)tnod, 97);
}

TidyAttr tidyAttrGetOnKEYUP(TidyNode tnod)
{
  return (TidyAttr)AttrGetById((uint64_t)tnod, 99);
}

TidyAttr tidyAttrGetOnKEYPRESS(TidyNode tnod)
{
  return (TidyAttr)AttrGetById((uint64_t)tnod, 98);
}

TidyAttr tidyAttrGetOnFOCUS(TidyNode tnod)
{
  return (TidyAttr)AttrGetById((uint64_t)tnod, 96);
}

TidyAttr tidyAttrGetOnBLUR(TidyNode tnod)
{
  return (TidyAttr)AttrGetById((uint64_t)tnod, 88);
}

TidyAttr tidyAttrGetBGCOLOR(TidyNode tnod)
{
  return (TidyAttr)AttrGetById((uint64_t)tnod, 13);
}

TidyAttr tidyAttrGetLINK(TidyNode tnod)
{
  return (TidyAttr)AttrGetById((uint64_t)tnod, 70);
}

TidyAttr tidyAttrGetALINK(TidyNode tnod)
{
  return (TidyAttr)AttrGetById((uint64_t)tnod, 8);
}

TidyAttr tidyAttrGetVLINK(TidyNode tnod)
{
  return (TidyAttr)AttrGetById((uint64_t)tnod, 148);
}

TidyAttr tidyAttrGetTEXT(TidyNode tnod)
{
  return (TidyAttr)AttrGetById((uint64_t)tnod, 139);
}

TidyAttr tidyAttrGetSTYLE(TidyNode tnod)
{
  return (TidyAttr)AttrGetById((uint64_t)tnod, 135);
}

TidyAttr tidyAttrGetABBR(TidyNode tnod)
{
  return (TidyAttr)AttrGetById((uint64_t)tnod, 1);
}

TidyAttr tidyAttrGetCOLSPAN(TidyNode tnod)
{
  return (TidyAttr)AttrGetById((uint64_t)tnod, 33);
}

TidyAttr tidyAttrGetROWSPAN(TidyNode tnod)
{
  return (TidyAttr)AttrGetById((uint64_t)tnod, 120);
}

uint64_t NodeAttributeVersions(uint64_t result, int a2)
{
  uint64_t v2;
  _DWORD *v3;
  uint64_t v4;
  unsigned int v5;
  int v6;

  if (!result)
    return result;
  v2 = *(_QWORD *)(result + 56);
  if (!v2)
    return 0;
  v3 = *(_DWORD **)(v2 + 24);
  if (!v3 || !*v3)
    return 0;
  if (*v3 != a2)
  {
    v5 = 1;
    while (1)
    {
      v6 = v3[2 * v5];
      if (!v6)
        break;
      v4 = v5++;
      if (v6 == a2)
        return v3[2 * v4 + 1];
    }
    return 0;
  }
  v4 = 0;
  return v3[2 * v4 + 1];
}

_QWORD *AttrGetById(uint64_t a1, int a2)
{
  _QWORD *result;
  _DWORD *v3;

  for (result = *(_QWORD **)(a1 + 40); result; result = (_QWORD *)*result)
  {
    v3 = (_DWORD *)result[1];
    if (v3 && *v3 == a2)
      break;
  }
  return result;
}

char *FindAttribute(uint64_t a1, uint64_t a2)
{
  if (a2)
    return lookup(a1, a1 + 3008, *(unsigned __int8 **)(a2 + 40));
  else
    return 0;
}

char *lookup(uint64_t a1, uint64_t a2, unsigned __int8 *a3)
{
  signed __int8 v6;
  unsigned int v7;
  unsigned __int8 *v8;
  int v9;
  uint64_t v10;
  _QWORD *v11;
  char *v12;
  unsigned __int8 *v13;
  _QWORD *v14;
  signed __int8 v15;
  unsigned int v16;
  unsigned __int8 *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;

  if (a3)
  {
    v6 = *a3;
    if (*a3)
    {
      v7 = 0;
      v8 = a3 + 1;
      do
      {
        v7 = 31 * v7 + v6;
        v9 = *v8++;
        v6 = v9;
      }
      while (v9);
      v10 = v7 % 0xB2;
    }
    else
    {
      v10 = 0;
    }
    v11 = *(_QWORD **)(a2 + 8 * v10 + 16);
    if (v11)
    {
      while (*v11)
      {
        if (!tmbstrcmp(a3, *(unsigned __int8 **)(*v11 + 8)))
          return (char *)*v11;
        v11 = (_QWORD *)v11[1];
        if (!v11)
          break;
      }
    }
    v12 = (char *)&attribute_defs;
    v13 = "unknown!";
    do
    {
      if (!tmbstrcmp(a3, v13))
      {
        v14 = MemAlloc(0x10uLL);
        *v14 = v12;
        v15 = *v13;
        if (*v13)
        {
          v16 = 0;
          v17 = v13 + 1;
          do
          {
            v16 = 31 * v16 + v15;
            v18 = *v17++;
            v15 = v18;
          }
          while (v18);
          v19 = v16 % 0xB2;
        }
        else
        {
          v19 = 0;
        }
        v20 = a2 + 8 * v19;
        v14[1] = *(_QWORD *)(v20 + 16);
        *(_QWORD *)(v20 + 16) = v14;
        return v12;
      }
      v13 = (unsigned __int8 *)*((_QWORD *)v12 + 6);
      v12 += 40;
    }
    while (v13);
    if (!qword_254615348)
    {
      qword_254615348 = (uint64_t)"onunknowneventhandler";
      dword_254615350 = 0x1FFF;
      qword_254615358 = (uint64_t)CheckScript;
    }
    if (*(_DWORD *)(a1 + 816) && !tmbstrncasecmp((char *)a3, "on", 2))
      return (char *)&lookup_unknownEventHandler;
  }
  return 0;
}

_QWORD *GetAttrByName(uint64_t a1, unsigned __int8 *a2)
{
  _QWORD *i;
  unsigned __int8 *v4;

  for (i = *(_QWORD **)(a1 + 40); i; i = (_QWORD *)*i)
  {
    v4 = (unsigned __int8 *)i[5];
    if (v4 && !tmbstrcmp(v4, a2))
      break;
  }
  return i;
}

_DWORD *AddAttribute(uint64_t a1, uint64_t a2, unsigned __int8 *a3, _BYTE *a4)
{
  _DWORD *v8;
  _BYTE *v9;

  v8 = NewAttribute();
  v8[8] = 34;
  *((_QWORD *)v8 + 5) = tmbstrdup(a3);
  if (a4)
    v9 = tmbstrdup(a4);
  else
    v9 = 0;
  *((_QWORD *)v8 + 6) = v9;
  *((_QWORD *)v8 + 1) = lookup(a1, a1 + 3008, a3);
  InsertAttributeAtEnd(a2, (uint64_t)v8);
  return v8;
}

_DWORD *RepairAttrValue(uint64_t a1, uint64_t a2, unsigned __int8 *a3, _BYTE *a4)
{
  _QWORD *AttrByName;
  _QWORD *v9;
  void *v10;
  _BYTE *v11;

  AttrByName = GetAttrByName(a2, a3);
  if (!AttrByName)
    return AddAttribute(a1, a2, a3, a4);
  v9 = AttrByName;
  v10 = (void *)AttrByName[6];
  if (v10)
    MemFree(v10);
  if (a4)
    v11 = tmbstrdup(a4);
  else
    v11 = 0;
  v9[6] = v11;
  return v9;
}

char *IsUrl(uint64_t a1, unsigned __int8 *a2)
{
  char *result;

  result = lookup(a1, a1 + 3008, a2);
  if (result)
    return (char *)(*((_QWORD *)result + 3) == (_QWORD)CheckUrl);
  return result;
}

void CheckUrl(_DWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  _BYTE *v6;
  int v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  int v11;
  _BYTE *v12;
  _BYTE *v13;
  char *v14;
  char *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  char *i;
  int v20;
  BOOL v21;
  _BYTE *v22;
  char *v23;
  int v24;
  uint64_t v25;
  unsigned __int8 *v26;
  uint64_t v27;
  int v28;
  int v29;
  int v30;
  uint64_t v31;

  v4 = a2;
  if (!a3 || (v6 = *(_BYTE **)(a3 + 48)) == 0)
  {
    ReportAttrError((uint64_t)a1, a2, a3, 50);
    return;
  }
  v7 = *v6;
  v8 = 168;
  if (v7 == 47)
    v8 = 170;
  v9 = *(_BYTE **)&a1[v8 + 28];
  if (v9 && *v9)
  {
    v10 = 1;
    v11 = *v6;
    if (*v6)
    {
      do
      {
        if (v11 == 47)
          break;
        if (v11 == 58)
          goto LABEL_15;
        v11 = v6[v10++];
      }
      while (v11);
    }
    v12 = tmbstrlen(v9);
    v13 = tmbstrlen(v6);
    v14 = (char *)MemAlloc((size_t)&v13[(_QWORD)v12 + 2]);
    v15 = v14;
    v16 = v9[(_QWORD)v12 - 1];
    if (v7 == 47 && v16 == 47 || v7 == 47 || v16 == 47)
      sprintf(v14, "%s%s");
    else
      sprintf(v14, "%s/%s");
    MemFree(*(void **)(a3 + 48));
    *(_QWORD *)(a3 + 48) = v15;
  }
  else
  {
LABEL_15:
    v15 = *(char **)(a3 + 48);
  }
  if (a1[204]
    && (*v15 & 0xDF) != 0x48
    && (!tmbstrncasecmp(v15, "javascript:", 11)
     || !tmbstrncasecmp(v15, "script:", 7)
     || !tmbstrncasecmp(v15, "vbscript:", 9)
     || !tmbstrncasecmp(v15, "file:", 5)))
  {
    *(_QWORD *)(a3 + 8) = &MarkedForRemoval;
    return;
  }
  v17 = 0;
  v18 = 0;
  for (i = v15; ; ++i)
  {
    v20 = *i;
    if (v20 != 92)
      break;
    ++v18;
    if (a1[122])
      *i = 47;
LABEL_31:
    ;
  }
  if (*i)
  {
    if ((v20 - 127) < 0xA2u || memchr("<>", (char)v20, 3uLL))
      ++v17;
    goto LABEL_31;
  }
  if (a1[148])
    v21 = v17 == 0;
  else
    v21 = 1;
  if (!v21)
  {
    v22 = tmbstrlen(v15);
    v23 = (char *)MemAlloc((size_t)&v22[2 * v17 + 1]);
    v24 = *v15;
    v31 = v4;
    v25 = 0;
    if (*v15)
    {
      v26 = (unsigned __int8 *)(v15 + 1);
      do
      {
        if ((v24 - 127) < 0xFFFFFFA2 || memchr("<>", v24, 3uLL))
        {
          v27 = sprintf(&v23[v25], "%%%02X", v24);
        }
        else
        {
          v23[v25] = v24;
          v27 = 1;
        }
        v25 += v27;
        v28 = *v26++;
        v24 = v28;
      }
      while (v28);
    }
    v23[v25] = 0;
    MemFree(*(void **)(a3 + 48));
    *(_QWORD *)(a3 + 48) = v23;
    v4 = v31;
  }
  if (v18)
  {
    if (a1[122])
      v29 = 62;
    else
      v29 = 61;
    ReportAttrError((uint64_t)a1, v4, a3, v29);
  }
  if (v17)
  {
    if (a1[148])
      v30 = 64;
    else
      v30 = 63;
    ReportAttrError((uint64_t)a1, v4, a3, v30);
    a1[1227] |= 0x20u;
  }
}

char *IsScript(uint64_t a1, unsigned __int8 *a2)
{
  char *result;

  result = lookup(a1, a1 + 3008, a2);
  if (result)
    return (char *)(*((_QWORD *)result + 3) == (_QWORD)CheckScript);
  return result;
}

uint64_t CheckScript(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (*(_DWORD *)(result + 816))
    *(_QWORD *)(a3 + 8) = &MarkedForRemoval;
  return result;
}

BOOL IsAnchorElement(uint64_t a1, uint64_t a2)
{
  _DWORD *v2;
  unsigned int v3;
  BOOL v4;
  unint64_t v5;
  _BOOL8 result;

  result = 0;
  if (a2)
  {
    v2 = *(_DWORD **)(a2 + 56);
    if (v2)
    {
      v3 = *v2 - 1;
      v4 = v3 > 0x3F;
      v5 = (1 << v3) & 0x800A003000000021;
      if (!v4 && v5 != 0)
        return 1;
    }
  }
  return result;
}

uint64_t IsCSS1Selector(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  int v7;

  v2 = 0;
  v3 = 0;
  v4 = MEMORY[0x24BDAC740];
  while (1)
  {
    v5 = *(unsigned __int8 *)(a1 + v2);
    result = 1;
    if ((_DWORD)v5 == 92)
      goto LABEL_16;
    if (!*(_BYTE *)(a1 + v2))
      return result;
    if ((v5 - 48) <= 9)
      break;
    if (v3 > 0 || (_DWORD)v2 && (_DWORD)v5 == 45)
    {
      LODWORD(result) = 0;
    }
    else
    {
      if ((v5 & 0x80) != 0)
        v7 = __maskrune(*(unsigned __int8 *)(a1 + v2), 0x100uLL);
      else
        v7 = *(_DWORD *)(v4 + 4 * v5 + 60) & 0x100;
      result = 0;
      if (v5 <= 0xA0 && !v7)
        return result;
    }
LABEL_16:
    ++v2;
    v3 = result;
  }
  if (v3 <= 4)
  {
    LODWORD(result) = v3 <= 0 ? v3 : v3 + 1;
    if ((_DWORD)v2 || (int)result >= 1)
      goto LABEL_16;
  }
  return 0;
}

void RemoveAnchorByNode(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;

  v2 = 0;
  v3 = (_QWORD *)(a1 + 3008);
  v4 = (_QWORD *)(a1 + 3008);
  while (1)
  {
    v4 = (_QWORD *)*v4;
    if (!v4)
      break;
    v5 = v2;
    v2 = v4;
    if (v4[1] == a2)
    {
      if (v5)
        v3 = v5;
      *v3 = *v4;
      break;
    }
  }
  FreeAnchor((void **)v4);
}

void FreeAnchor(void **a1)
{
  if (a1)
    MemFree(a1[2]);
  MemFree(a1);
}

void FreeAnchors(uint64_t a1)
{
  void **i;

  for (i = *(void ***)(a1 + 3008); i; i = *(void ***)(a1 + 3008))
  {
    *(_QWORD *)(a1 + 3008) = *i;
    MemFree(i[2]);
    MemFree(i);
  }
}

void InitAttrs(uint64_t a1)
{
  ClearMemory((void *)(a1 + 3008), 0x5A0uLL);
}

void FreeAttrTable(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t j;
  unsigned __int8 *v7;
  signed __int8 v8;
  unsigned int v9;
  unsigned __int8 *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  int v19;
  _QWORD *v20;

  for (i = 0; i != 178; ++i)
  {
    v3 = a1 + 8 * i;
    v4 = *(_QWORD **)(v3 + 3024);
    if (v4)
    {
      do
      {
        v5 = (_QWORD *)v4[1];
        MemFree(v4);
        v4 = v5;
      }
      while (v5);
    }
    *(_QWORD *)(v3 + 3024) = 0;
  }
  FreeAnchors(a1);
  for (j = *(_QWORD *)(a1 + 3016); j; j = *(_QWORD *)(a1 + 3016))
  {
    *(_QWORD *)(a1 + 3016) = *(_QWORD *)(j + 32);
    v7 = *(unsigned __int8 **)(j + 8);
    v8 = *v7;
    if (*v7)
    {
      v9 = 0;
      v10 = v7 + 1;
      do
      {
        v9 = 31 * v9 + v8;
        v11 = *v10++;
        v8 = v11;
      }
      while (v11);
      v12 = v9 % 0xB2;
    }
    else
    {
      v12 = 0;
    }
    v13 = a1 + 8 * v12;
    v14 = *(_QWORD **)(v13 + 3024);
    if (v14)
    {
      v15 = 0;
      v16 = (_QWORD *)(v13 + 3024);
      do
      {
        v17 = v14;
        v18 = *v14;
        if (!v18)
          break;
        v19 = tmbstrcmp(v7, *(unsigned __int8 **)(v18 + 8));
        v14 = (_QWORD *)v17[1];
        if (!v19)
        {
          v20 = v15 + 1;
          if (!v15)
            v20 = v16;
          *v20 = v14;
          MemFree(v17);
          break;
        }
        v15 = v17;
      }
      while (v14);
    }
    MemFree(*(void **)(j + 8));
    MemFree((void *)j);
  }
}

void AppendToClassAttr(uint64_t a1, unsigned __int8 *a2)
{
  _BYTE *v4;
  _BYTE *v5;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  void *v9;

  v4 = tmbstrlen(*(_BYTE **)(a1 + 48));
  v5 = tmbstrlen(a2);
  v6 = (unsigned __int8 *)MemAlloc((size_t)&v5[(_QWORD)v4 + 2]);
  v7 = v6;
  *v6 = 0;
  v8 = *(unsigned __int8 **)(a1 + 48);
  if (v8)
  {
    tmbstrcpy(v6, v8);
    tmbstrcat(v7, " ");
  }
  tmbstrcat(v7, a2);
  v9 = *(void **)(a1 + 48);
  if (v9)
    MemFree(v9);
  *(_QWORD *)(a1 + 48) = v7;
}

void RepairDuplicateAttributes(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  int v6;
  BOOL v7;
  int *v8;
  int *v9;
  int v10;
  int v11;
  BOOL v12;
  unsigned __int8 *v13;
  _BYTE *v14;
  unsigned __int8 *v15;
  _BYTE *v16;
  _BYTE *v17;
  unsigned __int8 *v18;
  int v19;
  _BYTE *v20;
  unsigned __int8 *v21;
  char *v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  _BYTE *v29;
  unsigned __int8 *v30;
  _BYTE *v31;
  unsigned __int8 *v32;

  v2 = *(_QWORD *)(a2 + 40);
  if (!v2)
    return;
  do
  {
    if (*(_QWORD *)(v2 + 16))
      goto LABEL_3;
    v5 = *(_QWORD **)v2;
    if (*(_QWORD *)(v2 + 24))
    {
      v2 = *(_QWORD *)v2;
      continue;
    }
    if (!v5)
      goto LABEL_3;
    v6 = 0;
    do
    {
      if (v5[2]
        || (!v5[3] ? (v7 = v2 == 0) : (v7 = 1),
            v7
         || (v8 = *(int **)(v2 + 8)) == 0
         || (v9 = (int *)v5[1]) == 0
         || (v10 = *v8) == 0
         || ((v11 = *v9) != 0 ? (v12 = v10 == v11) : (v12 = 0), !v12)))
      {
        v5 = (_QWORD *)*v5;
        continue;
      }
      if (v10 == 135)
      {
        if (!*(_DWORD *)(a1 + 656))
          goto LABEL_38;
        v14 = *(_BYTE **)(v2 + 48);
        if (!v14)
          goto LABEL_38;
        v15 = (unsigned __int8 *)v5[6];
        if (!v15)
          goto LABEL_38;
        v16 = tmbstrlen(v14);
        v17 = v16;
        v18 = *(unsigned __int8 **)(v2 + 48);
        if (!v16)
          goto LABEL_41;
        v19 = v18[(_QWORD)v16 - 1];
        if (v19 == 125)
        {
          v31 = tmbstrlen(v15);
          v32 = (unsigned __int8 *)MemRealloc(v18, (size_t)&v31[(_QWORD)v17 + 6]);
          *(_QWORD *)(v2 + 48) = v32;
          tmbstrcat(v32, " { ");
          tmbstrcat(*(unsigned __int8 **)(v2 + 48), v15);
          v21 = *(unsigned __int8 **)(v2 + 48);
          v30 = " }";
        }
        else
        {
          if (v19 == 59)
          {
            v20 = tmbstrlen(v15);
            v21 = (unsigned __int8 *)MemRealloc(v18, (size_t)&v20[(_QWORD)v17 + 2]);
            *(_QWORD *)(v2 + 48) = v21;
            v22 = " ";
            goto LABEL_43;
          }
LABEL_41:
          v29 = tmbstrlen(v15);
          v21 = (unsigned __int8 *)MemRealloc(v18, (size_t)&v29[(_QWORD)v17 + 3]);
          *(_QWORD *)(v2 + 48) = v21;
          if (v17)
          {
            v22 = "; ";
LABEL_43:
            tmbstrcat(v21, (unsigned __int8 *)v22);
            v21 = *(unsigned __int8 **)(v2 + 48);
          }
          v30 = v15;
        }
        tmbstrcat(v21, v30);
        goto LABEL_46;
      }
      if (v10 == 25)
      {
        if (*(_DWORD *)(a1 + 648))
        {
          if (*(_QWORD *)(v2 + 48))
          {
            v13 = (unsigned __int8 *)v5[6];
            if (v13)
            {
              AppendToClassAttr(v2, v13);
LABEL_46:
              v24 = (_QWORD *)*v5;
              v25 = a1;
              v26 = a2;
              v27 = (uint64_t)v5;
              v28 = 68;
              goto LABEL_47;
            }
          }
        }
      }
LABEL_38:
      if (*(_QWORD *)(a1 + 192) == 1)
      {
        v23 = *(_QWORD *)v2;
        ReportAttrError(a1, a2, v2, 55);
        RemoveAttribute(a1, a2, (_QWORD *)v2);
        v5 = (_QWORD *)*v5;
        v6 = 1;
        v2 = v23;
        continue;
      }
      v24 = (_QWORD *)*v5;
      v25 = a1;
      v26 = a2;
      v27 = (uint64_t)v5;
      v28 = 55;
LABEL_47:
      ReportAttrError(v25, v26, v27, v28);
      RemoveAttribute(a1, a2, v5);
      v5 = v24;
    }
    while (v5);
    if (!v6)
LABEL_3:
      v2 = *(_QWORD *)v2;
  }
  while (v2);
}

uint64_t CheckAttribute(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  int v7;
  void (*v8)(uint64_t, uint64_t, _QWORD *);
  uint64_t v9;

  v6 = a3[1];
  if (v6)
  {
    if ((*(_BYTE *)(v6 + 18) & 1) != 0)
    {
      *(_DWORD *)(*(_QWORD *)(a1 + 104) + 28) = 1;
      if (!*(_DWORD *)(a1 + 304))
      {
        SetOptionBool(a1, 0x17u, 1u);
        SetOptionBool(a1, 0x16u, 1u);
      }
    }
    v7 = AttributeVersions(a2, (uint64_t)a3);
    ConstrainVersion(a1, v7);
    v8 = *(void (**)(uint64_t, uint64_t, _QWORD *))(v6 + 24);
    if (v8)
      v8(a1, a2, a3);
    if ((_UNKNOWN *)a3[1] == &MarkedForRemoval)
      goto LABEL_13;
  }
  if (a2)
  {
    v9 = *(_QWORD *)(a2 + 56);
    if (v9)
    {
      if ((*(_WORD *)(v9 + 16) & 0x1FFF) != 0 && (AttributeVersions(a2, (uint64_t)a3) & 0x1FFF) == 0)
      {
        ReportAttrError(a1, a2, (uint64_t)a3, 53);
        if (*(_DWORD *)(a1 + 360))
LABEL_13:
          RemoveAttribute(a1, a2, a3);
      }
    }
  }
  return v6;
}

uint64_t AttributeVersions(uint64_t a1, uint64_t a2)
{
  _DWORD *v2;
  uint64_t v3;
  _DWORD *v4;
  uint64_t v5;
  unsigned int v7;
  int v8;
  unsigned int v9;

  if (!a2)
    return 0;
  v2 = *(_DWORD **)(a2 + 8);
  if (!v2)
    return 0;
  if (!a1)
    return v2[4];
  v3 = *(_QWORD *)(a1 + 56);
  if (!v3)
    return v2[4];
  v4 = *(_DWORD **)(v3 + 24);
  if (!v4)
    return v2[4];
  if (!*v4)
    goto LABEL_15;
  if (*v4 != *v2)
  {
    v7 = 1;
    while (1)
    {
      v8 = v4[2 * v7];
      if (!v8)
        break;
      v5 = v7++;
      if (v8 == *v2)
        return v4[2 * v5 + 1];
    }
LABEL_15:
    v9 = v2[4];
    if ((v9 & 0x1FFF) != 0)
      return 0;
    else
      return v9;
  }
  v5 = 0;
  return v4[2 * v5 + 1];
}

BOOL IsBoolAttribute(uint64_t a1)
{
  uint64_t v1;
  _BOOL8 result;

  result = 0;
  if (a1)
  {
    v1 = *(_QWORD *)(a1 + 8);
    if (v1)
    {
      if (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 24) == CheckBool)
        return 1;
    }
  }
  return result;
}

uint64_t CheckBool(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    if (*(_QWORD *)(a3 + 48))
      return CheckLowerCaseAttrValue(result, a2, a3);
  }
  return result;
}

BOOL attrIsEvent(_BOOL8 result)
{
  _DWORD *v1;

  if (result)
  {
    v1 = *(_DWORD **)(result + 8);
    return v1 && (*v1 - 85) < 0x1B;
  }
  return result;
}

uint64_t IsValidHTMLID(uint64_t result)
{
  uint64_t v1;
  char *v2;
  unsigned int v3;
  unsigned int v4;

  if (result)
  {
    v1 = result;
    result = IsLetter(*(char *)result);
    if ((_DWORD)result)
    {
      v2 = (char *)(v1 + 1);
      while (1)
      {
        v4 = *v2++;
        v3 = v4;
        if (!v4)
          break;
        result = IsNamechar(v3);
        if (!(_DWORD)result)
          return result;
      }
      return 1;
    }
  }
  return result;
}

uint64_t IsValidXMLID(uint64_t result)
{
  unsigned int v1;
  char *v2;
  signed int v3;
  unsigned int v4;

  if (result)
  {
    v2 = (char *)(result + 1);
    v1 = *(char *)result;
    v4 = v1;
    if ((v1 & 0x80000000) != 0)
    {
      v2 += GetUTF8(v2, (int *)&v4);
      v1 = v4;
    }
    if (IsXMLLetter(v1) || v4 == 95 || v4 == 58)
    {
      while (1)
      {
        v3 = *v2;
        if (!*v2)
          break;
        v4 = *v2;
        if ((v3 & 0x80) != 0)
        {
          v2 += GetUTF8(v2, (int *)&v4);
          v3 = v4;
        }
        ++v2;
        result = IsXMLNamechar(v3);
        if (!(_DWORD)result)
          return result;
      }
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void CheckAction(_DWORD *a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    if (*(_QWORD *)(a3 + 48))
      CheckUrl(a1, a2, a3);
  }
}

uint64_t CheckAlign(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  _DWORD *v8;
  int v9;
  char *v10;

  v3 = a3;
  v4 = a2;
  v5 = a1;
  v6 = *(_QWORD *)(a2 + 56);
  if (v6 && (*(_BYTE *)(v6 + 34) & 1) != 0)
    return CheckValign(a1, a2, a3);
  if (!a3 || !*(_QWORD *)(a3 + 48))
  {
    v9 = 50;
    return ReportAttrError(a1, a2, a3, v9);
  }
  result = CheckLowerCaseAttrValue(a1, a2, a3);
  v8 = *(_DWORD **)(v4 + 56);
  if (!v8 || *v8 != 19)
  {
    result = AttrValueIsAmong(v3, off_24C379800);
    if (!(_DWORD)result)
    {
      v10 = *(char **)(v3 + 48);
      if (!v10 || tmbstrcasecmp(v10, "char") || (result = nodeHasCM(v4, 640), !(_DWORD)result))
      {
        a1 = v5;
        a2 = v4;
        a3 = v3;
        v9 = 51;
        return ReportAttrError(a1, a2, a3, v9);
      }
    }
  }
  return result;
}

_BYTE *CheckColor(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  int v7;
  _BYTE *result;
  _BYTE *v9;
  char *v10;
  char *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  _BYTE *v17;
  uint64_t v18;
  char *v19;

  v3 = a3;
  v4 = a2;
  v5 = a1;
  if (a3)
  {
    v6 = *(char **)(a3 + 48);
    if (v6)
    {
      if (*v6 != 35)
      {
        if (IsValidColorCode(*(_BYTE **)(a3 + 48)))
        {
          v9 = tmbstrlen(v6);
          v10 = (char *)MemAlloc((size_t)(v9 + 2));
          v11 = v10;
          v12 = 0;
          *v10 = 35;
          do
          {
            v13 = v6[v12];
            v10[++v12] = v13;
          }
          while (v13);
          ReportAttrError(v5, v4, v3, 73);
          MemFree(*(void **)(v3 + 48));
          *(_QWORD *)(v3 + 48) = v11;
          v6 = v11;
          goto LABEL_12;
        }
        if (*v6 != 35)
          goto LABEL_22;
      }
      if (!IsValidColorCode(v6 + 1))
      {
LABEL_22:
        v18 = 0;
        v19 = "black";
        while (tmbstrcasecmp(v6, v19))
        {
          v19 = colors[v18 + 2];
          v18 += 2;
          if (v18 == 32)
          {
            a1 = v5;
            a2 = v4;
            a3 = v3;
            v7 = 51;
            return (_BYTE *)ReportAttrError(a1, a2, a3, v7);
          }
        }
        goto LABEL_29;
      }
LABEL_12:
      if (*v6 != 35)
      {
        v17 = *(_BYTE **)(v3 + 48);
        goto LABEL_31;
      }
      if (*(_DWORD *)(v5 + 696))
      {
        if (tmbstrcasecmp(v6, "#000000"))
        {
          v14 = 0;
          do
          {
            v15 = v14;
            v14 += 16;
          }
          while (v14 != 256 && tmbstrcasecmp(v6, *(char **)((char *)&colors[3] + v15)));
          v16 = *(char **)((char *)&colors[2] + v15);
          if (!v16)
            goto LABEL_29;
        }
        else
        {
          v16 = "black";
        }
        MemFree(*(void **)(v3 + 48));
        v6 = tmbstrdup(v16);
        *(_QWORD *)(v3 + 48) = v6;
      }
LABEL_29:
      v17 = *(_BYTE **)(v3 + 48);
      if (*v6 == 35)
      {
        result = tmbstrtoupper(v17);
LABEL_32:
        *(_QWORD *)(v3 + 48) = result;
        return result;
      }
LABEL_31:
      result = tmbstrtolower(v17);
      goto LABEL_32;
    }
  }
  v7 = 50;
  return (_BYTE *)ReportAttrError(a1, a2, a3, v7);
}

uint64_t CheckNumber(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 *v6;
  int *v7;
  int v8;
  int *v9;
  int v10;
  int v11;
  unsigned __int8 *v12;
  int v13;
  int v14;

  v3 = a3;
  v4 = a2;
  v5 = result;
  if (!a3 || (v6 = *(unsigned __int8 **)(a3 + 48)) == 0)
  {
    v14 = 50;
    return ReportAttrError(result, a2, a3, v14);
  }
  if (!a2)
    goto LABEL_14;
  v7 = *(int **)(a2 + 56);
  if (!v7)
    goto LABEL_14;
  v8 = *v7;
  if (*v7 == 39)
  {
    v9 = *(int **)(a3 + 8);
    if (v9)
    {
      v10 = *v9;
      if (v10 == 32 || v10 == 119)
        return result;
    }
    v8 = *v7;
  }
  if (v8 != 36)
    goto LABEL_14;
  v11 = *v6;
  if (v11 == 45 || v11 == 43)
  {
    ++v6;
LABEL_14:
    v11 = *v6;
  }
  if (v11)
  {
    v12 = v6 + 1;
    while (1)
    {
      result = IsDigit((char)v11);
      if (!(_DWORD)result)
        break;
      v13 = *v12++;
      LOBYTE(v11) = v13;
      if (!v13)
        return result;
    }
    result = v5;
    a2 = v4;
    a3 = v3;
    v14 = 51;
    return ReportAttrError(result, a2, a3, v14);
  }
  return result;
}

uint64_t CheckLength(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _DWORD *v7;
  _DWORD *v8;
  char v9;
  unsigned __int8 *v10;
  int v11;
  int v12;

  v3 = a3;
  v4 = a2;
  v5 = result;
  if (!a3 || (v6 = *(char **)(a3 + 48)) == 0)
  {
    v12 = 50;
    return ReportAttrError(result, a2, a3, v12);
  }
  v7 = *(_DWORD **)(a3 + 8);
  if (!v7 || !a2 || *v7 != 150 || (v8 = *(_DWORD **)(a2 + 56)) == 0 || (*v8 - 23) >= 2)
  {
    result = IsDigit(*v6);
    if (!(_DWORD)result)
    {
LABEL_16:
      result = v5;
      a2 = v4;
      a3 = v3;
      v12 = 51;
      return ReportAttrError(result, a2, a3, v12);
    }
    v9 = v6[1];
    if (v9)
    {
      v10 = (unsigned __int8 *)(v6 + 2);
      while (1)
      {
        result = IsDigit(v9);
        if (!(_DWORD)result && *(v10 - 1) != 37)
          break;
        v11 = *v10++;
        v9 = v11;
        if (!v11)
          return result;
      }
      goto LABEL_16;
    }
  }
  return result;
}

unint64_t CheckClass(unint64_t result, uint64_t a2, uint64_t a3)
{
  char *v3;
  char *v5;
  _BYTE *v6;

  v3 = *(char **)(result + 800);
  if (v3)
  {
    v5 = *(char **)(a3 + 48);
    if (v5)
    {
      v6 = tmbstrlen(*(_BYTE **)(result + 800));
      result = (unint64_t)tmbstrlen(v5);
      if (result >= (unint64_t)v6)
      {
        result = tmbstrncasecmp(v3, v5, (uint64_t)v6);
        if (!(_DWORD)result)
          *(_QWORD *)(a3 + 8) = &MarkedForRemoval;
      }
    }
  }
  return result;
}

uint64_t CheckClear(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  if (a3 && *(_QWORD *)(a3 + 48))
  {
    CheckLowerCaseAttrValue(a1, a2, a3);
    result = AttrValueIsAmong(a3, off_24C379938);
    if (!(_DWORD)result)
      return ReportAttrError(a1, a2, a3, 51);
  }
  else
  {
    result = ReportAttrError(a1, a2, a3, 50);
    if (!*(_QWORD *)(a3 + 48))
    {
      result = (uint64_t)tmbstrdup("none");
      *(_QWORD *)(a3 + 48) = result;
    }
  }
  return result;
}

uint64_t CheckTextDir(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return CheckAttrValidity(a1, a2, a3, off_24C379960);
}

uint64_t CheckLang(uint64_t result, uint64_t a2, uint64_t a3)
{
  _DWORD *v3;

  if ((!a3 || !*(_QWORD *)(a3 + 48) && ((v3 = *(_DWORD **)(a3 + 8)) == 0 || *v3 != 152))
    && !*(_QWORD *)(result + 744))
  {
    return ReportAttrError(result, a2, a3, 50);
  }
  return result;
}

_BYTE *CheckId(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  _BYTE *v9;
  _BYTE *result;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t *NodeByAnchor;

  v6 = *(_QWORD *)(a1 + 104);
  v7 = *(char **)(a1 + 808);
  if (v7)
  {
    v8 = *(char **)(a3 + 48);
    if (v8)
    {
      v9 = tmbstrlen(*(_BYTE **)(a1 + 808));
      if (tmbstrlen(v8) >= v9)
      {
        result = (_BYTE *)tmbstrncasecmp(v7, v8, (uint64_t)v9);
        if (!(_DWORD)result)
        {
          *(_QWORD *)(a3 + 8) = &MarkedForRemoval;
          return result;
        }
      }
    }
  }
  else if (!a3)
  {
LABEL_12:
    v13 = a1;
    v14 = a2;
    v15 = a3;
    v16 = 50;
    return (_BYTE *)ReportAttrError(v13, v14, v15, v16);
  }
  v11 = *(_QWORD *)(a3 + 48);
  if (!v11)
    goto LABEL_12;
  if (!IsValidHTMLID(v11))
  {
    if (*(_DWORD *)(v6 + 28) && IsValidXMLID(*(_QWORD *)(a3 + 48)))
      v12 = 71;
    else
      v12 = 51;
    ReportAttrError(a1, a2, a3, v12);
  }
  NodeByAnchor = GetNodeByAnchor(a1, *(_BYTE **)(a3 + 48));
  if (NodeByAnchor && NodeByAnchor != (uint64_t *)a2)
  {
    v13 = a1;
    v14 = a2;
    v15 = a3;
    v16 = 66;
    return (_BYTE *)ReportAttrError(v13, v14, v15, v16);
  }
  return AddAnchor(a1, *(_BYTE **)(a3 + 48), a2);
}

uint64_t CheckFsubmit(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return CheckAttrValidity(a1, a2, a3, off_24C379978);
}

_BYTE *CheckName(_BYTE *result, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  char *v6;
  _DWORD *v7;
  unsigned int v8;
  BOOL v9;
  unint64_t v10;
  signed int v12;
  uint64_t *NodeByAnchor;
  BOOL v14;
  int v15;

  v5 = (uint64_t)result;
  if (!a3)
    return (_BYTE *)ReportAttrError((uint64_t)result, a2, a3, 50);
  v6 = *(char **)(a3 + 48);
  if (!v6)
    return (_BYTE *)ReportAttrError((uint64_t)result, a2, a3, 50);
  if (a2)
  {
    v7 = *(_DWORD **)(a2 + 56);
    if (v7)
    {
      v8 = *v7 - 1;
      v9 = v8 > 0x3F;
      v10 = (1 << v8) & 0x800A003000000021;
      if (!v9 && v10 != 0)
      {
        if (*((_DWORD *)result + 72))
        {
          v15 = 0;
          while (1)
          {
            v12 = *v6;
            if (!*v6)
              break;
            v15 = *v6;
            if ((v12 & 0x80) != 0)
            {
              v6 += GetUTF8(v6, &v15);
              v12 = v15;
            }
            ++v6;
            if (!IsXMLNamechar(v12))
            {
              ReportAttrError(v5, a2, a3, 51);
              break;
            }
          }
        }
        NodeByAnchor = GetNodeByAnchor(v5, *(_BYTE **)(a3 + 48));
        if (NodeByAnchor)
          v14 = NodeByAnchor == (uint64_t *)a2;
        else
          v14 = 1;
        if (v14)
          return AddAnchor(v5, *(_BYTE **)(a3 + 48), a2);
        else
          return (_BYTE *)ReportAttrError(v5, a2, a3, 66);
      }
    }
  }
  return result;
}

uint64_t CheckScope(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return CheckAttrValidity(a1, a2, a3, off_24C379990);
}

uint64_t CheckScroll(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return CheckAttrValidity(a1, a2, a3, off_24C3799B8);
}

uint64_t CheckShape(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return CheckAttrValidity(a1, a2, a3, off_24C3799D8);
}

uint64_t CheckStyleAttr(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (*(_DWORD *)(result + 816))
    *(_QWORD *)(a3 + 8) = &MarkedForRemoval;
  return result;
}

uint64_t CheckTarget(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t result;
  int v8;

  v3 = a3;
  v4 = a2;
  v5 = a1;
  if (!a3 || (v6 = *(char **)(a3 + 48)) == 0)
  {
    v8 = 50;
    return ReportAttrError(a1, a2, a3, v8);
  }
  result = IsLetter(*v6);
  if (!(_DWORD)result)
  {
    result = AttrValueIsAmong(v3, off_24C379A00);
    if (!(_DWORD)result)
    {
      a1 = v5;
      a2 = v4;
      a3 = v3;
      v8 = 51;
      return ReportAttrError(a1, a2, a3, v8);
    }
  }
  return result;
}

uint64_t CheckType(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  char **v8;
  int v9;

  if (!a2)
    return result;
  v3 = a2;
  v4 = *(int **)(a2 + 56);
  if (!v4)
    return result;
  v5 = a3;
  v6 = result;
  v7 = *v4;
  if (v7 > 60)
  {
    switch(v7)
    {
      case '=':
        if (a3 && *(_QWORD *)(a3 + 48))
        {
          if (AttrValueIsAmong(a3, off_24C379AA0))
            return CheckLowerCaseAttrValue(v6, v3, v5);
LABEL_17:
          result = AttrValueIsAmong(v5, off_24C379AC0);
          if ((_DWORD)result)
            return result;
          result = v6;
          a2 = v3;
          a3 = v5;
          v9 = 51;
          return ReportAttrError(result, a2, a3, v9);
        }
        break;
      case 'L':
        if (a3 && *(_QWORD *)(a3 + 48))
          goto LABEL_17;
        break;
      case 's':
        v8 = off_24C379AA0;
        return CheckAttrValidity(result, a2, a3, v8);
      default:
        return result;
    }
    v9 = 50;
    return ReportAttrError(result, a2, a3, v9);
  }
  if (v7 == 18)
  {
    v8 = off_24C379A80;
    return CheckAttrValidity(result, a2, a3, v8);
  }
  if (v7 == 53)
  {
    v8 = off_24C379A28;
    return CheckAttrValidity(result, a2, a3, v8);
  }
  return result;
}

uint64_t CheckValign(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  int v7;
  uint64_t v8;

  v3 = a3;
  v4 = a2;
  v5 = a1;
  if (!a3 || !*(_QWORD *)(a3 + 48))
  {
    v7 = 50;
    return ReportAttrError(a1, a2, a3, v7);
  }
  CheckLowerCaseAttrValue(a1, a2, a3);
  result = AttrValueIsAmong(v3, off_24C379AE0);
  if ((_DWORD)result)
    return result;
  result = AttrValueIsAmong(v3, off_24C379B08);
  if (!(_DWORD)result)
  {
    if (!AttrValueIsAmong(v3, off_24C379B20))
    {
LABEL_13:
      a1 = v5;
      a2 = v4;
      a3 = v3;
      v7 = 51;
      return ReportAttrError(a1, a2, a3, v7);
    }
    ConstrainVersion(v5, 57344);
    a1 = v5;
    a2 = v4;
    a3 = v3;
    v7 = 54;
    return ReportAttrError(a1, a2, a3, v7);
  }
  v8 = *(_QWORD *)(v4 + 56);
  if (!v8 || (*(_BYTE *)(v8 + 34) & 1) == 0)
    goto LABEL_13;
  return result;
}

uint64_t CheckVType(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return CheckAttrValidity(a1, a2, a3, off_24C379B48);
}

uint64_t CheckLowerCaseAttrValue(uint64_t result, uint64_t a2, uint64_t a3)
{
  _BYTE *v3;
  char v4;
  uint64_t v7;
  unsigned __int8 *v8;
  int v9;
  uint64_t v10;

  v3 = *(_BYTE **)(a3 + 48);
  if (v3)
  {
    v4 = *v3;
    if (*v3)
    {
      v7 = result;
      v8 = v3 + 1;
      while (1)
      {
        result = IsUpper(v4);
        if ((_DWORD)result)
          break;
        v9 = *v8++;
        v4 = v9;
        if (!v9)
          return result;
      }
      v10 = *(_QWORD *)(v7 + 104);
      if (*(_DWORD *)(v10 + 28) && (result = ReportAttrError(v7, a2, a3, 70), *(_DWORD *)(v10 + 28))
        || *(_DWORD *)(v7 + 600))
      {
        result = (uint64_t)tmbstrtolower(*(_BYTE **)(a3 + 48));
        *(_QWORD *)(a3 + 48) = result;
      }
    }
  }
  return result;
}

uint64_t AttrValueIsAmong(uint64_t a1, char **a2)
{
  char *v3;
  char **i;
  char *v6;
  char *v7;

  v3 = *a2;
  if (!v3)
    return 0;
  for (i = a2 + 1; ; ++i)
  {
    v6 = *(char **)(a1 + 48);
    if (v6)
    {
      if (!tmbstrcasecmp(v6, v3))
        break;
    }
    v7 = *i;
    v3 = v7;
    if (!v7)
      return 0;
  }
  return 1;
}

uint64_t IsValidColorCode(_BYTE *a1)
{
  uint64_t v2;
  int v3;
  uint64_t result;

  if (tmbstrlen(a1) != (_BYTE *)6)
    return 0;
  v2 = 0;
  while (1)
  {
    if (!IsDigit((char)a1[v2]))
    {
      v3 = ToLower((char)a1[v2]);
      result = (uint64_t)memchr("abcdef", v3, 7uLL);
      if (!result)
        break;
    }
    if (++v2 == 6)
      return 1;
  }
  return result;
}

uint64_t CheckAttrValidity(uint64_t a1, uint64_t a2, uint64_t a3, char **a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  int v9;

  v4 = a3;
  v5 = a2;
  v6 = a1;
  if (!a3 || !*(_QWORD *)(a3 + 48))
  {
    v9 = 50;
    return ReportAttrError(a1, a2, a3, v9);
  }
  CheckLowerCaseAttrValue(a1, a2, a3);
  result = AttrValueIsAmong(v4, a4);
  if (!(_DWORD)result)
  {
    a1 = v6;
    a2 = v5;
    a3 = v4;
    v9 = 51;
    return ReportAttrError(a1, a2, a3, v9);
  }
  return result;
}

uint64_t *GetNodeByAnchor(uint64_t a1, _BYTE *a2)
{
  uint64_t **v2;
  _BYTE *v3;
  _BYTE *v4;

  v2 = (uint64_t **)(a1 + 3008);
  v3 = tmbstrdup(a2);
  v4 = tmbstrtolower(v3);
  while (1)
  {
    v2 = (uint64_t **)*v2;
    if (!v2)
      break;
    if (!tmbstrcmp((unsigned __int8 *)v2[2], v4))
    {
      MemFree(v4);
      return v2[1];
    }
  }
  MemFree(v4);
  return 0;
}

_BYTE *AddAnchor(uint64_t a1, _BYTE *a2, uint64_t a3)
{
  _QWORD *v6;
  _BYTE *v7;
  _BYTE *result;
  _QWORD *v9;
  _QWORD *v10;

  v6 = MemAlloc(0x18uLL);
  v7 = tmbstrdup(a2);
  v6[2] = v7;
  result = tmbstrtolower(v7);
  v6[1] = a3;
  v6[2] = result;
  *v6 = 0;
  v9 = *(_QWORD **)(a1 + 3008);
  if (v9)
  {
    do
    {
      v10 = v9;
      v9 = (_QWORD *)*v9;
    }
    while (v9);
  }
  else
  {
    v10 = (_QWORD *)(a1 + 3008);
  }
  *v10 = v6;
  return result;
}

void tidyInitInputBuffer(TidyInputSource *inp, TidyBuffer *buf)
{
  inp->ungetByte = (TidyUngetByteFunc)insrc_ungetByte;
  inp->eof = (TidyEOFFunc)insrc_eof;
  inp->sourceData = buf;
  inp->getByte = (TidyGetByteFunc)insrc_getByte;
}

uint64_t insrc_getByte(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *((unsigned int *)a1 + 4);
  if (v1 >= *((_DWORD *)a1 + 2))
    return 0xFFFFFFFFLL;
  v2 = *a1;
  *((_DWORD *)a1 + 4) = v1 + 1;
  return *(unsigned __int8 *)(v2 + v1);
}

BOOL insrc_eof(uint64_t a1)
{
  return *(_DWORD *)(a1 + 16) >= *(_DWORD *)(a1 + 8);
}

uint64_t insrc_ungetByte(uint64_t result)
{
  int v1;

  v1 = *(_DWORD *)(result + 16);
  if (v1)
    *(_DWORD *)(result + 16) = v1 - 1;
  return result;
}

void tidyInitOutputBuffer(TidyOutputSink *outp, TidyBuffer *buf)
{
  outp->sinkData = buf;
  outp->putByte = (TidyPutByteFunc)outsink_putByte;
}

void outsink_putByte(TidyBuffer *a1, byte a2)
{
  byte *bp;
  uint64_t size;

  tidyBufCheckAlloc(a1, a1->size + 1, 0);
  bp = a1->bp;
  size = a1->size;
  a1->size = size + 1;
  bp[size] = a2;
}

void tidyBufInit(TidyBuffer *buf)
{
  ClearMemory(buf, 0x18uLL);
}

void tidyBufAlloc(TidyBuffer *buf, uint allocSize)
{
  ClearMemory(buf, 0x18uLL);
  tidyBufCheckAlloc(buf, allocSize, 0);
  buf->next = 0;
}

void tidyBufCheckAlloc(TidyBuffer *buf, uint allocSize, uint chunkSize)
{
  uint allocated;
  uint v5;
  uint v6;
  byte *v7;
  byte *v8;

  allocated = buf->allocated;
  if (allocSize + 1 > allocated)
  {
    if (chunkSize)
      v5 = chunkSize;
    else
      v5 = 256;
    if (!allocated)
      allocated = v5;
    do
    {
      v6 = allocated;
      allocated *= 2;
    }
    while (v6 < allocSize + 1);
    v7 = (byte *)MemRealloc(buf->bp, v6);
    if (v7)
    {
      v8 = v7;
      ClearMemory(&v7[buf->allocated], v6 - buf->allocated);
      buf->bp = v8;
      buf->allocated = v6;
    }
  }
}

void tidyBufFree(TidyBuffer *buf)
{
  MemFree(buf->bp);
  ClearMemory(buf, 0x18uLL);
}

void tidyBufClear(TidyBuffer *buf)
{
  byte *bp;

  bp = buf->bp;
  if (bp)
  {
    ClearMemory(bp, buf->allocated);
    buf->size = 0;
  }
  buf->next = 0;
}

void tidyBufAttach(TidyBuffer *buf, byte *bp, uint size)
{
  buf->bp = bp;
  buf->size = size;
  buf->allocated = size;
  buf->next = 0;
}

void tidyBufDetach(TidyBuffer *buf)
{
  ClearMemory(buf, 0x18uLL);
}

void tidyBufAppend(TidyBuffer *buf, void *vp, uint size)
{
  if (vp)
  {
    if (size)
    {
      tidyBufCheckAlloc(buf, buf->size + size, 0);
      memcpy(&buf->bp[buf->size], vp, size);
      buf->size += size;
    }
  }
}

void tidyBufPutByte(TidyBuffer *buf, byte bv)
{
  byte *bp;
  uint64_t size;

  tidyBufCheckAlloc(buf, buf->size + 1, 0);
  bp = buf->bp;
  size = buf->size;
  buf->size = size + 1;
  bp[size] = bv;
}

int tidyBufPopByte(TidyBuffer *buf)
{
  uint size;
  byte *bp;
  uint v3;

  size = buf->size;
  if (!size)
    return -1;
  bp = buf->bp;
  v3 = size - 1;
  buf->size = v3;
  return bp[v3];
}

int tidyBufGetByte(TidyBuffer *buf)
{
  uint64_t next;
  byte *bp;

  next = buf->next;
  if (next >= buf->size)
    return -1;
  bp = buf->bp;
  buf->next = next + 1;
  return bp[next];
}

Bool tidyBufEndOfInput(TidyBuffer *buf)
{
  return buf->next >= buf->size;
}

void tidyBufUngetByte(TidyBuffer *buf, byte bv)
{
  uint next;

  next = buf->next;
  if (next)
    buf->next = next - 1;
}

void FreeStyles(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(a1 + 104);
  if (v1)
  {
    v2 = *(_QWORD *)(v1 + 160);
    if (v2)
    {
      do
      {
        v3 = *(_QWORD *)(v2 + 24);
        MemFree(*(void **)v2);
        MemFree(*(void **)(v2 + 8));
        MemFree(*(void **)(v2 + 16));
        MemFree((void *)v2);
        v2 = v3;
      }
      while (v3);
    }
  }
}

void AddStyleAsClass(uint64_t a1, uint64_t a2, unsigned __int8 *a3)
{
  unsigned __int8 *Style;
  _QWORD *v6;

  Style = (unsigned __int8 *)FindStyle(a1, *(unsigned __int8 **)(a2 + 64), a3);
  v6 = AttrGetById(a2, 25);
  if (v6)
    AppendToClassAttr((uint64_t)v6, Style);
  else
    AddAttribute(a1, a2, "class", Style);
}

uint64_t FindStyle(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  _QWORD *v15;
  char v17[512];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = *(_QWORD *)(a1 + 104);
  v7 = *(_QWORD *)(v6 + 160);
  if (v7)
  {
    while (tmbstrcmp(*(unsigned __int8 **)v7, a2)
         || tmbstrcmp(*(unsigned __int8 **)(v7 + 16), a3))
    {
      v7 = *(_QWORD *)(v7 + 24);
      if (!v7)
        goto LABEL_5;
    }
    v15 = (_QWORD *)(v7 + 8);
  }
  else
  {
LABEL_5:
    v8 = MemAlloc(0x20uLL);
    *v8 = tmbstrdup(a2);
    v14 = *(const char **)(a1 + 704);
    if (!v14 || !*v14)
      v14 = "c";
    ++*(_DWORD *)(a1 + 4928);
    tmbsnprintf(v17, 512, "%s%u", v9, v10, v11, v12, v13, (char)v14);
    v8[1] = tmbstrdup(v17);
    v15 = v8 + 1;
    v8[2] = tmbstrdup(a3);
    v8[3] = *(_QWORD *)(v6 + 160);
    *(_QWORD *)(v6 + 160) = v8;
  }
  return *v15;
}

_QWORD *FixNodeLinks(_QWORD *result)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *i;

  v1 = result[1];
  if (v1)
    v2 = (_QWORD *)(v1 + 16);
  else
    v2 = (_QWORD *)(*result + 24);
  *v2 = result;
  v3 = result[2];
  if (v3)
    v4 = (_QWORD *)(v3 + 8);
  else
    v4 = (_QWORD *)(*result + 32);
  *v4 = result;
  for (i = (_QWORD *)result[3]; i; i = (_QWORD *)i[2])
    *i = result;
  return result;
}

void AddStyleProperty(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  _QWORD *v6;
  _QWORD *v7;
  _BYTE *v8;
  _BYTE *v9;
  _QWORD *v10;

  v6 = AttrGetById(a2, 135);
  if (v6)
  {
    v7 = v6;
    v8 = (_BYTE *)v6[6];
    if (v8)
    {
      v9 = MergeProperties(v8, a3);
      MemFree((void *)v7[6]);
      v7[6] = v9;
    }
    else
    {
      v7[6] = tmbstrdup(a3);
    }
  }
  else
  {
    v10 = NewAttributeEx(a1, "style", a3, 34);
    InsertAttributeAtStart(a2, v10);
  }
}

_BYTE *MergeProperties(_BYTE *a1, _BYTE *a2)
{
  unsigned __int8 **Props;
  unsigned __int8 **v4;
  _BYTE *PropString;

  Props = CreateProps(0, a1);
  v4 = CreateProps(Props, a2);
  PropString = CreatePropString(v4);
  FreeStyleProps((uint64_t)v4);
  return PropString;
}

_QWORD *CleanDocument(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  _QWORD *v6;
  _QWORD *Body;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  unsigned __int8 *v11;
  _QWORD *v12;
  unsigned __int8 *v13;
  _QWORD *v14;
  unsigned __int8 *v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t i;
  _QWORD *v23;

  result = CleanTree(a1, a1);
  if (!*(_DWORD *)(a1 + 344))
    return result;
  DefineStyleRules(a1, a1);
  v3 = *(_QWORD *)(a1 + 104);
  if (!*(_QWORD *)(v3 + 160))
  {
    result = FindBody((_QWORD *)a1);
    if (!result)
      return result;
    v4 = (uint64_t)result;
    if (!AttrGetById((uint64_t)result, 12)
      && !AttrGetById(v4, 13)
      && !AttrGetById(v4, 139)
      && !AttrGetById(v4, 70)
      && !AttrGetById(v4, 148))
    {
      result = AttrGetById(v4, 8);
      if (!result)
        return result;
    }
    *(_DWORD *)(a1 + 4904) |= 0x10u;
  }
  v5 = NewNode((_QWORD *)v3);
  *((_DWORD *)v5 + 20) = 5;
  *((_DWORD *)v5 + 24) = 1;
  *((_QWORD *)v5 + 8) = tmbstrdup("style");
  FindTag(a1, (uint64_t)v5);
  v6 = NewAttributeEx(a1, "type", "text/css", 34);
  InsertAttributeAtStart((uint64_t)v5, v6);
  Body = FindBody((_QWORD *)a1);
  *(_DWORD *)(v3 + 48) = *(_DWORD *)(v3 + 116);
  if (Body)
  {
    v8 = (uint64_t)Body;
    v9 = *(_QWORD *)(a1 + 104);
    v10 = AttrGetById((uint64_t)Body, 12);
    if (v10)
    {
      v11 = (unsigned __int8 *)v10[6];
      v10[6] = 0;
      RemoveAttribute(a1, v8, v10);
    }
    else
    {
      v11 = 0;
    }
    v12 = AttrGetById(v8, 13);
    if (v12)
    {
      v13 = (unsigned __int8 *)v12[6];
      v12[6] = 0;
      RemoveAttribute(a1, v8, v12);
    }
    else
    {
      v13 = 0;
    }
    v14 = AttrGetById(v8, 139);
    if (v14)
    {
      v15 = (unsigned __int8 *)v14[6];
      v14[6] = 0;
      RemoveAttribute(a1, v8, v14);
      if (v11)
        goto LABEL_24;
    }
    else
    {
      v15 = 0;
      if (v11)
        goto LABEL_24;
    }
    if (!v13 && !v15)
    {
LABEL_31:
      v16 = AttrGetById(v8, 70);
      if (v16)
      {
        v17 = v16;
        AddColorRule(v9, " :link", (unsigned __int8 *)v16[6]);
        RemoveAttribute(a1, v8, v17);
      }
      v18 = AttrGetById(v8, 148);
      if (v18)
      {
        v19 = v18;
        AddColorRule(v9, " :visited", (unsigned __int8 *)v18[6]);
        RemoveAttribute(a1, v8, v19);
      }
      v20 = AttrGetById(v8, 8);
      if (v20)
      {
        v21 = v20;
        AddColorRule(v9, " :active", (unsigned __int8 *)v20[6]);
        RemoveAttribute(a1, v8, v21);
      }
      goto LABEL_37;
    }
LABEL_24:
    AddStringLiteral(v9, " body {\n");
    if (v11)
    {
      AddStringLiteral(v9, "  background-image: url(");
      AddStringLiteral(v9, v11);
      AddStringLiteral(v9, ");\n");
      MemFree(v11);
    }
    if (v13)
    {
      AddStringLiteral(v9, "  background-color: ");
      AddStringLiteral(v9, v13);
      AddStringLiteral(v9, ";\n");
      MemFree(v13);
    }
    if (v15)
    {
      AddStringLiteral(v9, "  color: ");
      AddStringLiteral(v9, v15);
      AddStringLiteral(v9, ";\n");
      MemFree(v15);
    }
    AddStringLiteral(v9, " }\n");
    goto LABEL_31;
  }
LABEL_37:
  for (i = *(_QWORD *)(v3 + 160); i; i = *(_QWORD *)(i + 24))
  {
    AddCharToLexer(v3, 0x20u);
    AddStringLiteral(v3, *(unsigned __int8 **)i);
    AddCharToLexer(v3, 0x2Eu);
    AddStringLiteral(v3, *(unsigned __int8 **)(i + 8));
    AddCharToLexer(v3, 0x20u);
    AddCharToLexer(v3, 0x7Bu);
    AddStringLiteral(v3, *(unsigned __int8 **)(i + 16));
    AddCharToLexer(v3, 0x7Du);
    AddCharToLexer(v3, 0xAu);
  }
  *(_DWORD *)(v3 + 52) = *(_DWORD *)(v3 + 116);
  TextToken(v3);
  InsertNodeAtEnd((uint64_t)v5, v23);
  result = FindHEAD((_QWORD *)a1);
  if (result)
    return (_QWORD *)InsertNodeAtEnd((uint64_t)result, v5);
  return result;
}

_QWORD *CleanTree(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  if (*(_QWORD *)(a2 + 24))
  {
    do
      v4 = CleanTree(a1);
    while (v4 && *(_QWORD *)(v4 + 16));
  }
  return CleanNode(a1, a2);
}

void DefineStyleRules(uint64_t a1, uint64_t a2)
{
  uint64_t i;
  _QWORD *v5;
  _QWORD *v6;
  unsigned __int8 *v7;
  unsigned __int8 *Style;
  _QWORD *v9;

  for (i = *(_QWORD *)(a2 + 24); i; i = *(_QWORD *)(i + 16))
    DefineStyleRules(a1, i);
  v5 = AttrGetById(a2, 135);
  if (v5)
  {
    v6 = v5;
    v7 = (unsigned __int8 *)v5[6];
    if (!v7)
    {
LABEL_7:
      RemoveAttribute(a1, a2, v6);
      return;
    }
    Style = (unsigned __int8 *)FindStyle(a1, *(unsigned __int8 **)(a2 + 64), v7);
    v9 = AttrGetById(a2, 25);
    if (v9)
    {
      AppendToClassAttr((uint64_t)v9, Style);
      goto LABEL_7;
    }
    MemFree((void *)v6[5]);
    MemFree((void *)v6[6]);
    v6[5] = tmbstrdup("class");
    v6[6] = tmbstrdup(Style);
  }
}

void NestedEmphasis(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  _DWORD *v4;
  BOOL v5;
  uint64_t v6;

  if (a2)
  {
    do
    {
      v3 = a2[2];
      v6 = v3;
      v4 = (_DWORD *)a2[7];
      if (v4 && (*v4 != 49 ? (v5 = *v4 == 8) : (v5 = 1), v5 && *a2 && *(_DWORD **)(*a2 + 56) == v4))
      {
        DiscardContainer(a1, a2, &v6);
        v3 = v6;
      }
      else if (a2[3])
      {
        NestedEmphasis(a1);
      }
      a2 = (uint64_t *)v3;
    }
    while (v3);
  }
}

void DiscardContainer(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;

  v3 = a2[3];
  if (v3)
  {
    v4 = *a2;
    v5 = a2[4];
    *(_QWORD *)(v5 + 16) = a2[2];
    v6 = a2[2];
    if (v6)
      v7 = (uint64_t *)(v6 + 8);
    else
      v7 = (uint64_t *)(v4 + 32);
    *v7 = v5;
    v8 = a2[1];
    if (v8)
    {
      *(_QWORD *)(v3 + 8) = v8;
      v9 = (uint64_t *)(a2[1] + 16);
    }
    else
    {
      v9 = (uint64_t *)(v4 + 24);
    }
    *v9 = v3;
    v10 = (uint64_t *)a2[3];
    if (v10)
    {
      do
      {
        *v10 = v4;
        v10 = (uint64_t *)v10[2];
      }
      while (v10);
      v11 = a2[3];
    }
    else
    {
      v11 = 0;
    }
    *a3 = v11;
    a2[2] = 0;
    a2[3] = 0;
    FreeNode(a1, (uint64_t)a2);
  }
  else
  {
    *a3 = DiscardElement(a1, a2);
  }
}

_BYTE *EmFromI(_BYTE *result, _QWORD *a2)
{
  _QWORD *v2;
  _BYTE *v3;
  int *v4;
  int v5;
  int v6;

  if (a2)
  {
    v2 = a2;
    v3 = result;
    do
    {
      v4 = (int *)v2[7];
      if (v4)
      {
        v5 = *v4;
        if (v5 == 49)
        {
          v6 = 33;
          goto LABEL_8;
        }
        if (v5 == 8)
        {
          v6 = 100;
LABEL_8:
          result = RenameElem((uint64_t)v2, v6);
        }
      }
      if (v2[3])
        result = (_BYTE *)EmFromI(v3);
      v2 = (_QWORD *)v2[2];
    }
    while (v2);
  }
  return result;
}

_BYTE *RenameElem(uint64_t a1, int a2)
{
  int *v3;
  _BYTE *result;

  v3 = LookupTagDef(a2);
  MemFree(*(void **)(a1 + 64));
  result = tmbstrdup(*((_BYTE **)v3 + 1));
  *(_QWORD *)(a1 + 56) = v3;
  *(_QWORD *)(a1 + 64) = result;
  return result;
}

_BYTE *List2BQ(_BYTE *result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (a2)
  {
    v2 = a2;
    v3 = (uint64_t)result;
    do
    {
      if (*(_QWORD *)(v2 + 24))
        result = (_BYTE *)List2BQ(v3);
      v4 = *(_QWORD *)(v2 + 56);
      if (v4)
      {
        if (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 40) == ParseList)
        {
          v5 = *(_QWORD *)(v2 + 24);
          if (v5)
          {
            if (!*(_QWORD *)(v5 + 16))
            {
              if (*(_DWORD *)(v5 + 96))
              {
                StripOnlyChild(v3, v2);
                result = RenameElem(v2, 15);
                *(_DWORD *)(v2 + 96) = 1;
              }
            }
          }
        }
      }
      v2 = *(_QWORD *)(v2 + 16);
    }
    while (v2);
  }
  return result;
}

void StripOnlyChild(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  _QWORD *i;

  v3 = *(_QWORD *)(a2 + 24);
  *(_OWORD *)(a2 + 24) = *(_OWORD *)(v3 + 24);
  *(_QWORD *)(v3 + 24) = 0;
  FreeNode(a1, v3);
  for (i = *(_QWORD **)(a2 + 24); i; i = (_QWORD *)i[2])
    *i = a2;
}

void BQ2Div(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _DWORD *v10;
  uint64_t v11;
  char v12;
  _DWORD *v13;
  char v14[32];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v8 = a2;
    do
    {
      v10 = *(_DWORD **)(v8 + 56);
      if (v10 && *v10 == 15 && *(_DWORD *)(v8 + 96))
      {
        v11 = *(_QWORD *)(v8 + 24);
        if (v11)
        {
          v12 = 1;
          while (!*(_QWORD *)(v11 + 16))
          {
            v13 = *(_DWORD **)(v11 + 56);
            if (!v13 || *v13 != 15 || !*(_DWORD *)(v8 + 96))
              break;
            ++v12;
            StripOnlyChild(a1, v8);
            v11 = *(_QWORD *)(v8 + 24);
            if (!v11)
              goto LABEL_18;
          }
          BQ2Div(a1);
        }
        else
        {
          v12 = 1;
        }
LABEL_18:
        tmbsnprintf(v14, 32, "margin-left: %dem", a4, a5, a6, a7, a8, 2 * v12);
        RenameElem(v8, 30);
        AddStyleProperty(a1, v8, v14);
      }
      else if (*(_QWORD *)(v8 + 24))
      {
        BQ2Div(a1);
      }
      v8 = *(_QWORD *)(v8 + 16);
    }
    while (v8);
  }
}

uint64_t DropSections(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (a2)
  {
    v2 = a2;
    v3 = result;
    v4 = *(_QWORD *)(result + 104);
    do
    {
      while (*(_DWORD *)(v2 + 80) == 9)
      {
        if (tmbstrncmp((unsigned __int8 *)(*(_QWORD *)(v4 + 104) + *(unsigned int *)(v2 + 72)), "if", 2)|| !tmbstrncmp((unsigned __int8 *)(*(_QWORD *)(v4 + 104) + *(unsigned int *)(v2 + 72)), "if !vml", 7))
        {
          result = DiscardElement(v3, (uint64_t *)v2);
        }
        else
        {
          result = PruneSection(v3, v2);
        }
        v2 = result;
        if (!result)
          return result;
      }
      if (*(_QWORD *)(v2 + 24))
        result = DropSections(v3);
      v2 = *(_QWORD *)(v2 + 16);
    }
    while (v2);
  }
  return result;
}

uint64_t PruneSection(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;
  _DWORD *v6;
  char *v7;
  uint64_t result;

  v4 = *(_QWORD *)(a1 + 104);
  while (1)
  {
    if (!tmbstrncmp((unsigned __int8 *)(*(_QWORD *)(v4 + 104) + *(unsigned int *)(a2 + 72)), "if !supportEmptyParas", 21))
    {
      v5 = (_QWORD *)a2;
      while (1)
      {
        v6 = (_DWORD *)v5[7];
        if (v6)
        {
          if (*v6 == 106)
            break;
        }
        v5 = (_QWORD *)*v5;
        if (!v5)
          goto LABEL_9;
      }
      v7 = NewLiteralTextNode(v4, "\xA0");
      InsertNodeBeforeElement((__int128 *)a2, (uint64_t)v7);
    }
LABEL_9:
    result = DiscardElement(a1, (uint64_t *)a2);
    if (!result)
      return result;
    a2 = result;
    if (*(_DWORD *)(result + 80) == 9)
    {
      if (tmbstrncmp((unsigned __int8 *)(*(_QWORD *)(v4 + 104) + *(unsigned int *)(result + 72)), "if", 2))
      {
        if (!tmbstrncmp((unsigned __int8 *)(*(_QWORD *)(v4 + 104) + *(unsigned int *)(a2 + 72)), "endif", 5))return DiscardElement(a1, (uint64_t *)a2);
      }
      else
      {
        a2 = PruneSection(a1, a2);
      }
    }
  }
}

uint64_t NormalizeSpaces(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  int v8;
  unsigned int v9;
  unsigned int v10;

  if (a2)
  {
    v2 = a2;
    v3 = result;
    do
    {
      if (*(_QWORD *)(v2 + 24))
        NormalizeSpaces(v3);
      result = nodeIsText(v2);
      if ((_DWORD)result)
      {
        v10 = 0;
        v4 = *(_QWORD *)(v3 + 104);
        v5 = *(unsigned int *)(v2 + 72);
        v6 = v4 + v5;
        if (v5 < *(_DWORD *)(v2 + 76))
        {
          do
          {
            v7 = (char *)(*(_QWORD *)(v3 + 104) + v5);
            v8 = *v7;
            v9 = *v7;
            v10 = v9;
            if (v8 < 0)
            {
              LODWORD(v5) = GetUTF8(v7, (int *)&v10) + v5;
              v9 = v10;
            }
            if (v9 == 160)
            {
              v9 = 32;
              v10 = 32;
            }
            result = PutUTF8(v6, v9);
            v6 = result;
            LODWORD(v5) = v5 + 1;
          }
          while (v5 < *(_DWORD *)(v2 + 76));
          v4 = *(_QWORD *)(v3 + 104);
        }
        *(_DWORD *)(v2 + 76) = v6 - v4;
      }
      v2 = *(_QWORD *)(v2 + 16);
    }
    while (v2);
  }
  return result;
}

void CleanWord2000(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char *v4;
  uint64_t v5;
  int *v6;
  int v7;
  int *v8;
  uint64_t v9;
  uint64_t *v10;
  _DWORD *v11;
  uint64_t *v12;
  char *v13;
  int *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  int v20;
  _QWORD *v21;
  char *v22;
  uint64_t v23;
  _DWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  char *v27;
  char *v28;
  _BYTE *v29;
  char *v30;
  int v31;
  char *v32;
  uint64_t v33;
  _DWORD *v34;
  int *v35;
  uint64_t v36;
  char *v37;
  _DWORD *v38;
  uint64_t v39;
  int v40;

  if (a2)
  {
    v2 = a2;
    v4 = 0;
    v5 = *(_QWORD *)(a1 + 104);
    do
    {
      v6 = *(int **)(v2 + 56);
      if (!v6)
        goto LABEL_20;
      v7 = *v6;
      if (v7 == 48)
      {
        if (!GetAttrByName(v2, "xmlns:o") && !*(_DWORD *)(a1 + 336))
          return;
        FreeAttrs(a1, v2);
        v8 = *(int **)(v2 + 56);
        if (!v8)
          goto LABEL_20;
        v7 = *v8;
      }
      if (v7 == 79 && NoMargins(v2))
      {
        CoerceNode(a1, v2, 82, 0, 1);
        PurgeWord2000Attributes(a1, v2);
        v9 = *(_QWORD *)(v2 + 24);
        if (v9)
          CleanWord2000(a1, v9);
        v10 = *(uint64_t **)(v2 + 16);
        if (!v10)
          return;
        while (1)
        {
          v11 = (_DWORD *)v10[7];
          if (!v11 || *v11 != 79 || !NoMargins((uint64_t)v10))
            break;
          v12 = (uint64_t *)v10[2];
          RemoveNode(v10);
          v13 = NewLineNode(v5);
          InsertNodeAtEnd(v2, v13);
          InsertNodeAtEnd(v2, v10);
          StripSpan(a1, (uint64_t)v10);
          v10 = v12;
          if (!v12)
            return;
        }
        v2 = (uint64_t)v10;
      }
LABEL_20:
      v14 = *(int **)(v2 + 56);
      if (!v14)
        goto LABEL_33;
      if ((v14[8] & 8) != 0)
      {
        v15 = *(_QWORD *)(v2 + 24);
        if (v15)
        {
          if (!*(_QWORD *)(v15 + 16) && *(_DWORD *)(v15 + 80) == 4)
          {
            v17 = v15 + 72;
            v16 = *(unsigned int *)(v15 + 72);
            v18 = *(_DWORD *)(v17 + 4) - v16;
            if (v18 == 2)
            {
              v40 = 0;
              GetUTF8((char *)(*(_QWORD *)(v5 + 104) + v16), &v40);
              if (v40 == 160)
                goto LABEL_42;
              v14 = *(int **)(v2 + 56);
              if (!v14)
                goto LABEL_33;
            }
            else if (v18 == 1 && *(_BYTE *)(*(_QWORD *)(v5 + 104) + v16) == 32)
            {
LABEL_42:
              v19 = StripSpan(a1, v2);
              goto LABEL_35;
            }
          }
        }
      }
      if (*v14 == 67 || *v14 == 101)
      {
LABEL_34:
        v19 = DiscardElement(a1, (uint64_t *)v2);
        goto LABEL_35;
      }
LABEL_33:
      if (*(_DWORD *)(v2 + 80) == 2)
        goto LABEL_34;
      if (v14)
      {
        v20 = *v14;
        switch(v20)
        {
          case 'b':
            goto LABEL_42;
          case '>':
            v21 = AttrGetById(v2, 116);
            if (v21)
            {
              v22 = (char *)v21[6];
              if (v22)
              {
                if (!tmbstrcasecmp(v22, "File-List"))
                  goto LABEL_34;
              }
            }
            break;
          case '$':
            goto LABEL_42;
        }
      }
      v23 = *(_QWORD *)(v2 + 56);
      if (v23 && !tmbstrcmp(*(unsigned __int8 **)(v23 + 8), "o:p"))
      {
        v39 = 0;
        DiscardContainer(a1, (uint64_t *)v2, &v39);
        v2 = v39;
        continue;
      }
      v24 = *(_DWORD **)(v2 + 56);
      if (*(_QWORD *)(v2 + 24))
      {
        if (!v24 || *v24 != 79)
          goto LABEL_71;
        v25 = AttrGetById(v2, 25);
        v26 = AttrGetById(v2, 135);
        if (v25
          && (v27 = (char *)v25[6]) != 0
          && (!tmbstrcasecmp(v27, "MsoListBullet")
           || (v28 = (char *)v25[6]) != 0 && !tmbstrcasecmp(v28, "MsoListNumber")))
        {
LABEL_64:
          v30 = (char *)v25[6];
          if (!v30)
            goto LABEL_77;
          if (tmbstrcasecmp(v30, "MsoListNumber"))
            v31 = 115;
          else
            v31 = 76;
LABEL_78:
          CoerceNode(a1, v2, 61, 0, 1);
          if (!v4 || (v34 = (_DWORD *)*((_QWORD *)v4 + 7)) == 0 || *v34 != v31)
          {
            v35 = LookupTagDef(v31);
            v4 = InferredTag(a1, *v35);
            InsertNodeBeforeElement((__int128 *)v2, (uint64_t)v4);
          }
          PurgeWord2000Attributes(a1, v2);
          v36 = *(_QWORD *)(v2 + 24);
          if (v36)
            CleanWord2000(a1, v36);
          RemoveNode((uint64_t *)v2);
          InsertNodeAtEnd((uint64_t)v4, (_QWORD *)v2);
          v2 = (uint64_t)v4;
          if (!v4)
            return;
        }
        else
        {
          if (v26)
          {
            v29 = (_BYTE *)v26[6];
            if (v29)
            {
              if (tmbsubstr(v29, "mso-list:"))
              {
                if (v25)
                  goto LABEL_64;
LABEL_77:
                v31 = 115;
                goto LABEL_78;
              }
            }
          }
          if (v25 && (v32 = (char *)v25[6]) != 0 && !tmbstrcasecmp(v32, "Code"))
          {
            v37 = NewLineNode(v5);
            NormalizeSpaces(v5, *(_QWORD *)(v2 + 24));
            if (!v4 || (v38 = (_DWORD *)*((_QWORD *)v4 + 7)) == 0 || *v38 != 82)
            {
              v4 = InferredTag(a1, 82);
              InsertNodeBeforeElement((__int128 *)v2, (uint64_t)v4);
            }
            RemoveNode((uint64_t *)v2);
            InsertNodeAtEnd((uint64_t)v4, (_QWORD *)v2);
            StripSpan(a1, v2);
            InsertNodeAtEnd((uint64_t)v4, v37);
            v2 = *((_QWORD *)v4 + 2);
            if (!v2)
              return;
          }
          else
          {
LABEL_71:
            v4 = 0;
          }
        }
        if (nodeIsElement(v2))
          PurgeWord2000Attributes(a1, v2);
        v33 = *(_QWORD *)(v2 + 24);
        if (v33)
          CleanWord2000(a1, v33);
        v2 = *(_QWORD *)(v2 + 16);
        continue;
      }
      if (!v24 || *v24 != 79)
        goto LABEL_71;
      v19 = TrimEmptyElement(a1, v2);
LABEL_35:
      v2 = v19;
    }
    while (v2);
  }
}

_QWORD *NoMargins(uint64_t a1)
{
  _QWORD *result;
  _QWORD *v2;

  result = AttrGetById(a1, 135);
  if (result)
  {
    v2 = result;
    result = (_QWORD *)result[6];
    if (result)
    {
      result = tmbsubstr(result, "margin-top: 0");
      if (result)
        return (_QWORD *)(tmbsubstr((_BYTE *)v2[6], "margin-bottom: 0") != 0);
    }
  }
  return result;
}

void PurgeWord2000Attributes(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v6;
  _QWORD *v7;
  int *v8;
  int v9;
  char *v10;
  int *v11;
  _DWORD *v12;
  unsigned int v13;
  BOOL v14;
  int v15;
  unsigned __int8 *v17;
  _QWORD *v18;

  v2 = (_QWORD *)(a2 + 40);
  v3 = *(_QWORD **)(a2 + 40);
  if (v3)
  {
    v6 = 0;
    do
    {
      while (1)
      {
        v7 = v3;
        v3 = (_QWORD *)*v3;
        v8 = (int *)v7[1];
        if (!v8)
          goto LABEL_23;
        v9 = *v8;
        if (v9 == 25)
          break;
LABEL_11:
        if (v9 > 134)
        {
          if (v9 == 135)
            goto LABEL_27;
          if (v9 != 150)
            goto LABEL_23;
        }
        else if (v9 != 57)
        {
          if (v9 == 65)
            goto LABEL_27;
          goto LABEL_23;
        }
        v12 = *(_DWORD **)(a2 + 56);
        if (v12)
        {
          v13 = *v12 - 106;
          v14 = v13 > 6;
          v15 = (1 << v13) & 0x49;
          if (!v14 && v15 != 0)
            goto LABEL_27;
        }
LABEL_23:
        v17 = (unsigned __int8 *)v7[5];
        if (!v17 || tmbstrncmp(v17, "x:", 2))
          goto LABEL_25;
LABEL_27:
        if (v6)
          v18 = v6;
        else
          v18 = v2;
        *v18 = v3;
        FreeAttribute(a1, (uint64_t)v7);
        if (!v3)
          return;
      }
      v10 = (char *)v7[6];
      if (v10)
      {
        if (!tmbstrcasecmp(v10, "Code"))
          goto LABEL_25;
        v10 = (char *)v7[6];
      }
      if (!tmbstrncmp((unsigned __int8 *)v10, "Mso", 3))
      {
        v11 = (int *)v7[1];
        if (!v11)
          goto LABEL_23;
        v9 = *v11;
        if (v9 == 25)
          goto LABEL_27;
        goto LABEL_11;
      }
LABEL_25:
      v6 = v7;
    }
    while (v3);
  }
}

uint64_t StripSpan(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;

  CleanWord2000(a1, *(_QWORD *)(a2 + 24));
  v4 = *(_QWORD *)(a2 + 24);
  v5 = *(uint64_t **)(a2 + 8);
  if (v5)
  {
    if (!v4)
      goto LABEL_8;
  }
  else
  {
    if (!v4)
    {
      v7 = 0;
      goto LABEL_10;
    }
    v6 = *(_QWORD *)(v4 + 16);
    RemoveNode(*(uint64_t **)(a2 + 24));
    InsertNodeBeforeElement((__int128 *)a2, v4);
    v5 = (uint64_t *)v4;
    v4 = v6;
    if (!v6)
    {
LABEL_8:
      v7 = v5;
      goto LABEL_10;
    }
  }
  do
  {
    v7 = (uint64_t *)v4;
    v4 = *(_QWORD *)(v4 + 16);
    RemoveNode(v7);
    InsertNodeAfterElement(v5, v7);
    v5 = v7;
  }
  while (v4);
LABEL_10:
  v8 = *(_QWORD *)(a2 + 16);
  if (!v8)
    *(_QWORD *)(*(_QWORD *)a2 + 32) = v7;
  *(_QWORD *)(a2 + 24) = 0;
  DiscardElement(a1, (uint64_t *)a2);
  return v8;
}

uint64_t IsWord2000(_QWORD *a1)
{
  _QWORD *HTML;
  uint64_t result;
  uint64_t v4;
  _DWORD *v5;
  _QWORD *v6;
  char *v7;
  _QWORD *v8;
  _BYTE *v9;

  HTML = FindHTML(a1);
  if (HTML && GetAttrByName((uint64_t)HTML, "xmlns:o"))
    return 1;
  result = (uint64_t)FindHEAD(a1);
  if (result)
  {
    v4 = *(_QWORD *)(result + 24);
    if (v4)
    {
      while (1)
      {
        v5 = *(_DWORD **)(v4 + 56);
        if (v5)
        {
          if (*v5 == 67)
          {
            v6 = AttrGetById(v4, 79);
            if (v6)
            {
              v7 = (char *)v6[6];
              if (v7)
              {
                if (!tmbstrcasecmp(v7, "generator"))
                {
                  v8 = AttrGetById(v4, 35);
                  if (v8)
                  {
                    v9 = (_BYTE *)v8[6];
                    if (v9)
                    {
                      if (tmbsubstr(v9, "Microsoft"))
                        break;
                    }
                  }
                }
              }
            }
          }
        }
        v4 = *(_QWORD *)(v4 + 16);
        if (!v4)
          return 0;
      }
      return 1;
    }
    return 0;
  }
  return result;
}

uint64_t BumpObject(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  int v7;
  uint64_t *i;
  uint64_t *v9;
  _DWORD *v10;
  uint64_t v11;
  _DWORD *v12;

  if (a2)
  {
    v2 = *(_QWORD *)(a2 + 24);
    if (v2)
    {
      v3 = result;
      v4 = 0;
      v5 = 0;
      do
      {
        v6 = *(int **)(v2 + 56);
        if (v6)
        {
          v7 = *v6;
          if (v7 == 46)
            v5 = v2;
          if (v7 == 16)
            v4 = v2;
        }
        v2 = *(_QWORD *)(v2 + 16);
      }
      while (v2);
      if (v5)
      {
        if (v4)
        {
          for (i = *(uint64_t **)(v5 + 24); i; result = InsertNodeAtStart(v4, v9))
          {
            while (1)
            {
              v9 = i;
              i = (uint64_t *)i[2];
              v10 = (_DWORD *)v9[7];
              if (v10)
              {
                if (*v10 == 75)
                {
                  v11 = v9[3];
                  if (v11)
                    break;
                }
              }
LABEL_21:
              if (!i)
                return result;
            }
            while (1)
            {
              result = nodeIsText(v11);
              if ((_DWORD)result)
              {
                result = IsBlank(*(_QWORD *)(v3 + 104), (uint64_t)v9);
                if (!(_DWORD)result)
                  break;
              }
              v12 = *(_DWORD **)(v11 + 56);
              if (!v12 || *v12 != 80)
                break;
              v11 = *(_QWORD *)(v11 + 16);
              if (!v11)
                goto LABEL_21;
            }
            RemoveNode(v9);
          }
        }
      }
    }
  }
  return result;
}

void VerifyHTTPEquiv(uint64_t a1, _QWORD *HEAD)
{
  uint64_t EncodingNameFromTidyId;
  unsigned __int8 *v5;
  _DWORD *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  _DWORD *v11;
  _QWORD *v12;
  BOOL v13;
  char *v15;
  char *v16;
  char *v17;
  char v18;
  unsigned __int8 **v19;
  unsigned __int8 **v20;
  char *i;
  char *v22;
  char v23;
  unsigned __int8 **v24;
  unsigned __int8 *v25;
  unsigned __int8 **v26;
  _BYTE *v27;
  unsigned __int8 *v28;
  _BYTE *PropString;
  unsigned __int8 *v30;

  EncodingNameFromTidyId = GetEncodingNameFromTidyId(*(_DWORD *)(a1 + 160));
  if (!EncodingNameFromTidyId)
    return;
  v5 = (unsigned __int8 *)EncodingNameFromTidyId;
  if (!HEAD || (v6 = (_DWORD *)HEAD[7]) == 0 || *v6 != 46)
  {
    HEAD = FindHEAD((_QWORD *)a1);
    if (!HEAD)
      return;
  }
  v7 = HEAD[3];
  if (!v7)
    return;
  v8 = MEMORY[0x24BDAC740];
  v30 = v5;
  do
  {
    v9 = AttrGetById(v7, 61);
    v10 = AttrGetById(v7, 35);
    v11 = *(_DWORD **)(v7 + 56);
    if (!v11)
      goto LABEL_48;
    v12 = v10;
    v13 = *v11 != 67 || v10 == 0;
    if (v13 || v9 == 0)
      goto LABEL_48;
    v15 = (char *)v9[6];
    if (!v15 || tmbstrcasecmp(v15, "Content-Type"))
      goto LABEL_48;
    v16 = tmbstrdup((_BYTE *)v12[6]);
    v17 = v16;
    if (!v16)
    {
      MemFree(0);
      v19 = 0;
      goto LABEL_47;
    }
    v18 = *v16;
    if (!*v16)
    {
      v19 = 0;
      goto LABEL_41;
    }
    v19 = 0;
    v20 = 0;
    i = v16;
    do
    {
      v22 = i;
      while ((v18 & 0x80) == 0)
      {
        if ((*(_DWORD *)(v8 + 4 * v18 + 60) & 0x4000) == 0)
          goto LABEL_27;
LABEL_26:
        v23 = *++v22;
        v18 = v23;
      }
      if (__maskrune(v18, 0x4000uLL))
        goto LABEL_26;
LABEL_27:
      for (i = v22; *i; ++i)
      {
        if (*i == 59)
        {
          *i++ = 0;
          break;
        }
      }
      if (i <= v22)
      {
        v24 = v20;
        i = v22;
      }
      else
      {
        v24 = (unsigned __int8 **)MemAlloc(0x18uLL);
        v25 = tmbstrdup(v22);
        v24[1] = 0;
        v24[2] = 0;
        *v24 = v25;
        if (v20)
          v20[2] = (unsigned __int8 *)v24;
        else
          v19 = v24;
      }
      v18 = *i;
      v20 = v24;
    }
    while (*i);
LABEL_41:
    MemFree(v17);
    if (v19)
    {
      v26 = v19;
      while (tmbstrncasecmp((char *)*v26, "charset", 7))
      {
        v26 = (unsigned __int8 **)v26[2];
        if (!v26)
          goto LABEL_47;
      }
      MemFree(*v26);
      v27 = tmbstrlen(v30);
      v28 = (unsigned __int8 *)MemAlloc((size_t)(v27 + 9));
      *v26 = v28;
      tmbstrcpy(v28, "charset=");
      tmbstrcpy(*v26 + 8, v30);
      PropString = CreatePropString(v19);
      MemFree((void *)v12[6]);
      v12[6] = PropString;
    }
LABEL_47:
    FreeStyleProps((uint64_t)v19);
LABEL_48:
    v7 = *(_QWORD *)(v7 + 16);
  }
  while (v7);
}

_BYTE *CreatePropString(unsigned __int8 **a1)
{
  unsigned __int8 **v1;
  int v2;
  unsigned __int8 **v3;
  unsigned __int8 *v4;
  _BYTE *result;
  _BYTE *v6;
  unsigned __int8 *v7;
  int v8;
  uint64_t v9;
  unsigned __int8 *v10;
  int v11;

  if (a1)
  {
    v1 = a1;
    v2 = 0;
    v3 = a1;
    do
    {
      v2 += tmbstrlen(*v3) + 2;
      v4 = v3[1];
      if (v4)
        v2 += tmbstrlen(v4) + 2;
      v3 = (unsigned __int8 **)v3[2];
    }
    while (v3);
    result = MemAlloc((v2 + 1));
    *result = 0;
    v6 = result;
    do
    {
      v7 = *v1;
      do
      {
        v8 = *v7++;
        *v6++ = v8;
      }
      while (v8);
      if (v1[1])
      {
        v9 = 0;
        *(_WORD *)(v6 - 1) = 8250;
        v10 = v1[1];
        do
        {
          v11 = v10[v9];
          v6[++v9] = v11;
        }
        while (v11);
        v6 += v9 + 1;
      }
      if (!v1[2])
        break;
      *(_WORD *)(v6++ - 1) = 8251;
      v1 = (unsigned __int8 **)v1[2];
    }
    while (v1);
  }
  else
  {
    result = MemAlloc(1uLL);
    *result = 0;
  }
  return result;
}

void FreeStyleProps(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  if (a1)
  {
    v1 = a1;
    do
    {
      v2 = *(_QWORD *)(v1 + 16);
      MemFree(*(void **)v1);
      MemFree(*(void **)(v1 + 8));
      MemFree((void *)v1);
      v1 = v2;
    }
    while (v2);
  }
}

void DropComments(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;

  if (a2)
  {
    v2 = a2;
    do
    {
      v4 = v2;
      v2 = *(_QWORD *)(v2 + 16);
      if (*(_DWORD *)(v4 + 80) == 2)
      {
        RemoveNode((uint64_t *)v4);
        FreeNode(a1, v4);
      }
      else if (*(_QWORD *)(v4 + 24))
      {
        DropComments(a1);
      }
    }
    while (v2);
  }
}

void DropFontElements(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  _DWORD *v4;
  uint64_t v5;

  if (a2)
  {
    do
    {
      v3 = a2[2];
      v5 = v3;
      v4 = (_DWORD *)a2[7];
      if (v4 && *v4 == 36)
      {
        DiscardContainer(a1, a2, &v5);
        v3 = v5;
      }
      else if (a2[3])
      {
        DropFontElements(a1);
      }
      a2 = (uint64_t *)v3;
    }
    while (v3);
  }
}

void WbrToSpace(uint64_t a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v4;
  _DWORD *v5;
  uint64_t *v6;

  if (a2)
  {
    v2 = a2;
    do
    {
      v4 = v2;
      v2 = (uint64_t *)v2[2];
      v5 = (_DWORD *)v4[7];
      if (v5 && *v5 == 117)
      {
        v6 = (uint64_t *)NewLiteralTextNode(*(_QWORD *)(a1 + 104), " ");
        InsertNodeAfterElement(v4, v6);
        RemoveNode(v4);
        FreeNode(a1, (uint64_t)v4);
      }
      else if (v4[3])
      {
        WbrToSpace(a1);
      }
    }
    while (v2);
  }
}

uint64_t DowngradeTypography(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  int v10;
  unsigned int v11;
  int v12;
  unsigned int v13;

  if (!a2)
    return result;
  v2 = a2;
  v3 = result;
  v4 = *(_QWORD *)(result + 104);
  do
  {
    v5 = *(_QWORD *)(v2 + 16);
    result = nodeIsText(v2);
    if (!(_DWORD)result)
      goto LABEL_18;
    v13 = 0;
    v6 = *(_QWORD *)(v4 + 104);
    v7 = *(unsigned int *)(v2 + 72);
    v8 = v6 + v7;
    if (v7 >= *(_DWORD *)(v2 + 76))
      goto LABEL_17;
    do
    {
      v9 = (char *)(*(_QWORD *)(v4 + 104) + v7);
      v10 = *v9;
      v11 = *v9;
      v13 = v11;
      if (v10 < 0)
      {
        LODWORD(v7) = GetUTF8(v9, (int *)&v13) + v7;
        v11 = v13;
      }
      if (v11 - 8211 <= 0xB)
      {
        v12 = 1 << (v11 - 19);
        if ((v12 & 0xE0) != 0)
        {
          v11 = 39;
        }
        else if ((v12 & 0xE00) != 0)
        {
          v11 = 34;
        }
        else
        {
          if ((v12 & 3) == 0)
            goto LABEL_15;
          v11 = 45;
        }
        v13 = v11;
      }
LABEL_15:
      result = PutUTF8(v8, v11);
      v8 = result;
      LODWORD(v7) = v7 + 1;
    }
    while (v7 < *(_DWORD *)(v2 + 76));
    v6 = *(_QWORD *)(v4 + 104);
LABEL_17:
    *(_DWORD *)(v2 + 76) = v8 - v6;
LABEL_18:
    if (*(_QWORD *)(v2 + 24))
      result = DowngradeTypography(v3);
    v2 = v5;
  }
  while (v5);
  return result;
}

uint64_t ReplacePreformattedSpaces(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (a2)
  {
    v2 = a2;
    v3 = result;
    do
    {
      while (1)
      {
        v4 = v2;
        v2 = *(_QWORD *)(v2 + 16);
        v5 = *(_QWORD *)(v4 + 56);
        if (!v5 || *(uint64_t (**)(uint64_t, uint64_t))(v5 + 40) != ParsePre)
          break;
        result = NormalizeSpaces(*(_QWORD *)(v3 + 104), *(_QWORD *)(v4 + 24));
        if (!v2)
          return result;
      }
      if (*(_QWORD *)(v4 + 24))
        result = ReplacePreformattedSpaces(v3);
    }
    while (v2);
  }
  return result;
}

uint64_t ConvertCDATANodes(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  if (a2)
  {
    v2 = result;
    do
    {
      if (*(_DWORD *)(a2 + 80) == 8)
        *(_DWORD *)(a2 + 80) = 4;
      v3 = *(_QWORD *)(a2 + 16);
      if (*(_QWORD *)(a2 + 24))
        result = ConvertCDATANodes(v2);
      a2 = v3;
    }
    while (v3);
  }
  return result;
}

void FixLanguageInformation(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;

  if (a2)
  {
    v6 = a2;
    while (1)
    {
      v8 = *(_QWORD *)(v6 + 16);
      if (nodeIsElement(v6))
        break;
LABEL_20:
      v12 = *(_QWORD *)(v6 + 24);
      if (v12)
        FixLanguageInformation(a1, v12, a3, a4);
      v6 = v8;
      if (!v8)
        return;
    }
    v9 = AttrGetById(v6, 65);
    v10 = AttrGetById(v6, 152);
    v11 = v10;
    if (!v9 || !v10)
    {
      if ((_DWORD)a3 && v9)
      {
        if ((*(_DWORD *)(*(_QWORD *)(a1 + 104) + 40) & NodeAttributeVersions(v6, 152)) != 0)
          RepairAttrValue(a1, v6, "xml:lang", (_BYTE *)v9[6]);
      }
      else if ((_DWORD)a4 && v10)
      {
        if ((*(_DWORD *)(*(_QWORD *)(a1 + 104) + 40) & NodeAttributeVersions(v6, 65)) != 0)
          RepairAttrValue(a1, v6, "lang", (_BYTE *)v11[6]);
        goto LABEL_17;
      }
    }
    if (!(_DWORD)a4 && v9)
      RemoveAttribute(a1, v6, v9);
LABEL_17:
    if (!(_DWORD)a3 && v11)
      RemoveAttribute(a1, v6, v11);
    goto LABEL_20;
  }
}

void FixXhtmlNamespace(_QWORD *a1, int a2)
{
  _QWORD *HTML;
  uint64_t v5;
  _QWORD *v6;
  char *v7;

  HTML = FindHTML(a1);
  if (HTML)
  {
    v5 = (uint64_t)HTML;
    v6 = AttrGetById((uint64_t)HTML, 154);
    if (a2)
    {
      if (!v6 || (v7 = (char *)v6[6]) == 0 || tmbstrcasecmp(v7, "http://www.w3.org/1999/xhtml"))
        RepairAttrValue((uint64_t)a1, v5, "xmlns", "http://www.w3.org/1999/xhtml");
    }
    else if (v6)
    {
      RemoveAttribute((uint64_t)a1, v5, v6);
    }
  }
}

void FixAnchors(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  unsigned __int8 *v12;
  unsigned __int8 *v13;
  uint64_t v14;

  if (a2)
  {
    v6 = a2;
    while (1)
    {
      v8 = *(_QWORD *)(v6 + 16);
      if (IsAnchorElement(a1, v6))
        break;
LABEL_26:
      v14 = *(_QWORD *)(v6 + 24);
      if (v14)
        FixAnchors(a1, v14, a3, a4);
      v6 = v8;
      if (!v8)
        return;
    }
    v9 = AttrGetById(v6, 79);
    v10 = AttrGetById(v6, 62);
    v11 = v10;
    if (v9 && v10)
    {
      v12 = (unsigned __int8 *)v9[6];
      v13 = (unsigned __int8 *)v11[6];
      if ((v12 != 0) != (v13 != 0) || v12 && v13 && tmbstrcmp(v12, v13))
        ReportAttrError(a1, v6, (uint64_t)v9, 60);
    }
    else
    {
      if ((_DWORD)a4 && v9)
      {
        if ((*(_DWORD *)(*(_QWORD *)(a1 + 104) + 40) & NodeAttributeVersions(v6, 62)) != 0)
        {
          if (!IsValidHTMLID(v9[6]))
          {
            ReportAttrError(a1, v6, (uint64_t)v9, 74);
            if ((_DWORD)a3)
              goto LABEL_23;
            goto LABEL_21;
          }
          RepairAttrValue(a1, v6, "id", (_BYTE *)v9[6]);
        }
        goto LABEL_20;
      }
      if ((_DWORD)a3
        && v10
        && (*(_DWORD *)(*(_QWORD *)(a1 + 104) + 40) & NodeAttributeVersions(v6, 79)) != 0)
      {
        RepairAttrValue(a1, v6, "name", (_BYTE *)v11[6]);
      }
    }
    if (!(_DWORD)a4 && v11)
    {
      RemoveAttribute(a1, v6, v11);
      if ((_DWORD)a3)
        goto LABEL_23;
      goto LABEL_21;
    }
LABEL_20:
    if ((_DWORD)a3)
    {
LABEL_23:
      if (!AttrGetById(v6, 79) && !AttrGetById(v6, 62))
        RemoveAnchorByNode(a1, v6);
      goto LABEL_26;
    }
LABEL_21:
    if (v9)
      RemoveAttribute(a1, v6, v9);
    goto LABEL_23;
  }
}

unsigned __int8 **CreateProps(unsigned __int8 **a1, _BYTE *a2)
{
  _BYTE *v3;
  void *v4;
  int v5;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  int v8;
  unsigned __int8 *v9;
  unsigned __int8 *v10;
  int v11;
  unsigned __int8 *v12;
  int v13;
  int v14;
  int v15;
  unsigned __int8 **v16;
  unsigned __int8 **v17;
  unsigned __int8 **v18;
  int v19;
  unsigned __int8 **v20;

  v3 = tmbstrdup(a2);
  v4 = v3;
  v5 = *v3;
  if (*v3)
  {
    v6 = v3;
    while (1)
    {
      v7 = v6;
      while (v5 == 32)
      {
        v8 = *++v7;
        v5 = v8;
      }
      v9 = v7 + 2;
      v10 = v7;
      if (!v5)
        break;
      while (v5 != 58)
      {
        v11 = *++v10;
        v5 = v11;
        ++v9;
        if (!v11)
          goto LABEL_31;
      }
      v12 = v10;
      do
      {
        v6 = v9;
        v14 = *++v12;
        v13 = v14;
        ++v9;
      }
      while (v14 == 32);
      while (v13 && v13 != 59)
      {
        v15 = *v6++;
        v13 = v15;
      }
      *v10 = 0;
      *(v6 - 1) = 0;
      if (a1)
      {
        v16 = 0;
        v17 = a1;
        while (1)
        {
          v18 = v17;
          v19 = tmbstrcmp(*v17, v7);
          if (!v19)
            break;
          if (v19 >= 1)
          {
            v20 = (unsigned __int8 **)MemAlloc(0x18uLL);
            *v20 = tmbstrdup(v7);
            v20[1] = tmbstrdup(v12);
            v20[2] = (unsigned __int8 *)v18;
            if (!v16)
              goto LABEL_28;
            goto LABEL_26;
          }
          v17 = (unsigned __int8 **)v18[2];
          v16 = v18;
          if (!v17)
            goto LABEL_23;
        }
      }
      else
      {
        v18 = 0;
LABEL_23:
        v20 = (unsigned __int8 **)MemAlloc(0x18uLL);
        *v20 = tmbstrdup(v7);
        v20[1] = tmbstrdup(v12);
        v20[2] = 0;
        v16 = v18;
        if (!v18)
          goto LABEL_28;
LABEL_26:
        v16[2] = (unsigned __int8 *)v20;
      }
      v20 = a1;
LABEL_28:
      *v10 = 58;
      if (v13)
      {
        *(v6 - 1) = 59;
        v5 = *v6;
        a1 = v20;
        if (*v6)
          continue;
      }
      goto LABEL_32;
    }
  }
LABEL_31:
  v20 = a1;
LABEL_32:
  MemFree(v4);
  return v20;
}

_QWORD *CleanNode(uint64_t a1, _BOOL8 a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t *v15;
  char *v16;
  uint64_t *v17;
  _QWORD *v18;
  int *v19;
  int v20;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD *v25;
  _DWORD *v26;
  _DWORD *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  _QWORD *v31;
  __int128 *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  _DWORD *v39;
  _QWORD *v40;
  int *v41;
  int v42;
  _QWORD *v44;
  _QWORD *v45;
  uint64_t v46;
  _DWORD *v47;
  uint64_t v48;
  unsigned int v49;
  BOOL v50;
  uint64_t v51;
  _QWORD *v53;
  _QWORD *v54;
  _DWORD *v55;
  _QWORD *v56;
  int *v57;
  int v58;
  int *v59;
  int v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD *v67;
  int *v68;
  int v69;
  uint64_t v70;
  _BOOL8 v71;
  _BYTE v72[128];
  uint64_t v73;

  v2 = a2;
  v73 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 768);
  v71 = a2;
  if (!nodeIsElement(a2))
    return (_QWORD *)v2;
  while (1)
  {
    if (!v2)
      goto LABEL_23;
    v10 = *(int **)(v2 + 56);
    if (!v10)
      goto LABEL_23;
    v11 = *v10;
    if (*v10 == 29 || v11 == 115 || v11 == 76)
    {
      v12 = *(_QWORD *)(v2 + 24);
      if (v12)
      {
        if (!*(_QWORD *)(v12 + 16))
        {
          v27 = *(_DWORD **)(v12 + 56);
          if (v27)
          {
            if (*v27 == 61 && *(_DWORD *)(v12 + 96))
            {
              *(_QWORD *)(v2 + 56) = LookupTagDef(30);
              MemFree(*(void **)(v2 + 64));
              *(_QWORD *)(v2 + 64) = tmbstrdup("div");
              v28 = a1;
              v29 = v2;
              v30 = "margin-left: 2em";
LABEL_122:
              AddStyleProperty(v28, v29, v30);
              goto LABEL_123;
            }
          }
        }
      }
      v11 = *v10;
    }
    if (v11 == 115 || v11 == 76)
    {
      v13 = *(_QWORD *)(v2 + 24);
      if (v13)
      {
        if (!*(_QWORD *)(v13 + 16))
        {
          v31 = *(_QWORD **)(v13 + 24);
          if (v31)
          {
            if ((int *)v31[7] == v10 && !v31[2])
              break;
          }
        }
      }
    }
    v14 = *v10;
    if (v14 != 20)
    {
      if ((_DWORD)v4)
      {
        if (v14 == 30)
        {
          v18 = *(_QWORD **)(v2 + 24);
          if (v18)
          {
            if (!v18[2])
            {
              v39 = (_DWORD *)v18[7];
              if (v39)
              {
                if (*v39 == 30)
                {
                  if ((_DWORD)v4 != 2)
                    goto LABEL_72;
                  if (!AttrGetById(*(_QWORD *)(v2 + 24), 62) || !AttrGetById(v2, 62))
                  {
                    v40 = (_QWORD *)v18[5];
                    if (v40)
                    {
                      while (1)
                      {
                        v41 = (int *)v40[1];
                        if (!v41)
                          goto LABEL_70;
                        v42 = *v41;
                        if (!*v41)
                          goto LABEL_70;
                        if (v42 != 135 && v42 != 25)
                          break;
                        v44 = (_QWORD *)*v40;
LABEL_71:
                        v40 = v44;
                        if (!v44)
                          goto LABEL_72;
                      }
                      v45 = AttrGetById(v2, v42);
                      if (v45)
                        RemoveAttribute(a1, v2, v45);
LABEL_70:
                      DetachAttribute((uint64_t)v18, v40);
                      v44 = (_QWORD *)*v40;
                      *v40 = 0;
                      InsertAttributeAtEnd(v2, (uint64_t)v40);
                      goto LABEL_71;
                    }
LABEL_72:
                    MergeStyles(a1, v2, (uint64_t)v18);
LABEL_123:
                    StripOnlyChild(a1, v2);
                    goto LABEL_106;
                  }
                }
              }
            }
          }
        }
      }
LABEL_23:
      v19 = *(int **)(v2 + 56);
      if ((v19[8] & 0xE8) == 0)
        goto LABEL_81;
      v20 = *v19;
      if ((v20 - 61) <= 0x33 && ((1 << (v20 - 61)) & 0x8080000000001) != 0)
        goto LABEL_80;
      if (v20 != 19)
      {
        v22 = (_QWORD *)(v2 + 40);
        v23 = *(_QWORD **)(v2 + 40);
        if (v23)
        {
          v24 = 0;
          while (1)
          {
            v25 = v23;
            v26 = (_DWORD *)v23[1];
            if (v26)
            {
              if (*v26 == 7)
                break;
            }
            v23 = (_QWORD *)*v25;
            v24 = v25;
            if (!*v25)
              goto LABEL_78;
          }
          if (v24)
            v22 = v24;
          *v22 = *v25;
          v35 = v25[6];
          if (v35)
          {
            tmbstrcpy(v72, "text-align: ");
            v36 = 0;
            while (1)
            {
              v37 = ToLower(*(char *)(v35 + v36));
              v72[v36 + 12] = v37;
              if (!v37)
                break;
              if (++v36 == 115)
              {
                v38 = 127;
                goto LABEL_76;
              }
            }
            v38 = v36 + 12;
LABEL_76:
            v72[v38] = 0;
            AddStyleProperty(a1, v2, v72);
          }
          FreeAttribute(a1, (uint64_t)v25);
        }
      }
LABEL_78:
      v46 = *(_QWORD *)(v2 + 24);
      if (!v46)
        goto LABEL_80;
      if (*(_QWORD *)(v46 + 16))
        goto LABEL_80;
      v59 = *(int **)(v46 + 56);
      if (!v59)
        goto LABEL_80;
      v60 = *v59;
      if (v60 != 49)
      {
        if (v60 == 36)
          goto LABEL_119;
        if (v60 == 8)
        {
LABEL_118:
          MergeStyles(a1, v2, v46);
          v28 = a1;
          v29 = v2;
          v30 = "font-weight: bold";
          goto LABEL_122;
        }
LABEL_80:
        v19 = *(int **)(v2 + 56);
        if (v19)
        {
LABEL_81:
          if (*v19 != 36)
            goto LABEL_82;
LABEL_85:
          v47 = *(_DWORD **)(v2 + 56);
          if (!v47 || *v47 != 36)
            return (_QWORD *)v71;
          if (*(_DWORD *)(a1 + 368))
          {
            DiscardContainer(a1, (uint64_t *)v2, (uint64_t *)&v71);
          }
          else
          {
            if (*(_QWORD *)(*(_QWORD *)v2 + 24) == v2 && !*(_QWORD *)(v2 + 16))
            {
              v48 = *(_QWORD *)(*(_QWORD *)v2 + 56);
              if ((*(_BYTE *)(v48 + 32) & 0xE8) != 0)
              {
                v49 = *(_DWORD *)v48 - 61;
                v50 = v49 > 0x33;
                v51 = (1 << v49) & 0x8080000000001;
                if (v50 || v51 == 0)
                  return (_QWORD *)v71;
              }
            }
            AddFontStyles(a1, v2, *(uint64_t ***)(v2 + 40), v5, v6, v7, v8, v9);
            v53 = *(_QWORD **)(v2 + 40);
            if (v53)
            {
              v54 = 0;
              do
              {
                v56 = (_QWORD *)*v53;
                v55 = (_DWORD *)v53[1];
                if (v55 && *v55 == 135)
                {
                  *v53 = 0;
                  v54 = v53;
                }
                else
                {
                  FreeAttribute(a1, (uint64_t)v53);
                }
                v53 = v56;
              }
              while (v56);
            }
            else
            {
              v54 = 0;
            }
            *(_QWORD *)(v2 + 40) = v54;
            RenameElem(v2, 98);
          }
          goto LABEL_106;
        }
LABEL_82:
        if (!nodeHasCM(v2, 528))
          goto LABEL_85;
        v46 = *(_QWORD *)(v2 + 24);
        if (!v46)
          goto LABEL_85;
        if (*(_QWORD *)(v46 + 16))
          goto LABEL_85;
        v57 = *(int **)(v46 + 56);
        if (!v57)
          goto LABEL_85;
        v58 = *v57;
        if (v58 != 49)
        {
          if (v58 != 36)
          {
            if (v58 == 8 && *(_DWORD *)(a1 + 352))
              goto LABEL_118;
            goto LABEL_85;
          }
LABEL_119:
          MergeStyles(a1, v2, v46);
          AddFontStyles(a1, v2, *(uint64_t ***)(v46 + 40), v61, v62, v63, v64, v65);
          goto LABEL_123;
        }
        if (!*(_DWORD *)(a1 + 352))
          goto LABEL_85;
      }
      MergeStyles(a1, v2, v46);
      v28 = a1;
      v29 = v2;
      v30 = "font-style: italic";
      goto LABEL_122;
    }
    if (*(_DWORD *)(a1 + 368))
    {
      if (*(_QWORD *)(v2 + 24))
      {
        v15 = *(uint64_t **)(v2 + 32);
        DiscardContainer(a1, (uint64_t *)v2, (uint64_t *)&v71);
        v16 = InferredTag(a1, 17);
        v17 = v15;
      }
      else
      {
        v33 = *(uint64_t **)(v2 + 8);
        v32 = *(__int128 **)(v2 + 16);
        v34 = *(_QWORD *)v2;
        DiscardContainer(a1, (uint64_t *)v2, (uint64_t *)&v71);
        v16 = InferredTag(a1, 17);
        if (v32)
        {
          InsertNodeBeforeElement(v32, (uint64_t)v16);
          goto LABEL_106;
        }
        if (!v33)
        {
          InsertNodeAtStart(v34, v16);
          goto LABEL_106;
        }
        v17 = v33;
      }
      InsertNodeAfterElement(v17, (uint64_t *)v16);
    }
    else
    {
      RenameElem(v2, 30);
      AddStyleProperty(a1, v2, "text-align: center");
    }
LABEL_106:
    v2 = v71;
    if (!nodeIsElement(v71))
      return (_QWORD *)v71;
  }
  v31[2] = *(_QWORD *)(v2 + 16);
  *(_OWORD *)v31 = *(_OWORD *)v2;
  FixNodeLinks(v31);
  *(_QWORD *)(v13 + 24) = 0;
  FreeNode(a1, v13);
  *(_QWORD *)(v2 + 16) = 0;
  *(_QWORD *)(v2 + 24) = 0;
  FreeNode(a1, v2);
  v67 = (_QWORD *)v31[1];
  if (v67)
  {
    v68 = (int *)v67[7];
    if (v68)
    {
      v69 = *v68;
      if (v69 == 115 || v69 == 76)
      {
        v70 = v67[4];
        if (v70)
        {
          v67[2] = v31[2];
          FixNodeLinks(v67);
          *v31 = v70;
          v31[2] = 0;
          v31[1] = *(_QWORD *)(v70 + 32);
          FixNodeLinks(v31);
          CleanNode(a1, v31);
        }
      }
    }
  }
  return v31;
}

void MergeStyles(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v6;
  _DWORD *v7;
  unsigned __int8 *v8;
  uint64_t **v9;
  uint64_t *v10;
  _QWORD *v11;
  _QWORD *v12;
  _DWORD *v13;
  _BYTE *v14;
  unsigned __int8 *v15;
  _BYTE *v16;
  _BYTE *v17;
  uint64_t v18;
  uint64_t **v19;
  uint64_t *v20;
  _QWORD *v21;
  uint64_t *v22;
  uint64_t *v23;

  v6 = *(_QWORD **)(a3 + 40);
  if (v6)
  {
    while (1)
    {
      v7 = (_DWORD *)v6[1];
      if (v7)
      {
        if (*v7 == 25)
          break;
      }
      v6 = (_QWORD *)*v6;
      if (!v6)
        goto LABEL_5;
    }
    v8 = (unsigned __int8 *)v6[6];
  }
  else
  {
LABEL_5:
    v8 = 0;
  }
  v9 = *(uint64_t ***)(a2 + 40);
  if (!v9)
    goto LABEL_11;
  while (1)
  {
    v10 = v9[1];
    if (v10)
    {
      if (*(_DWORD *)v10 == 25)
        break;
    }
    v9 = (uint64_t **)*v9;
    if (!v9)
      goto LABEL_11;
  }
  v15 = (unsigned __int8 *)v9[6];
  if (v15)
  {
    if (v8)
    {
      v16 = tmbstrlen(v9[6]);
      v17 = tmbstrlen(v8);
      v18 = (uint64_t)MemAlloc((size_t)&v17[(_QWORD)v16 + 2]);
      tmbstrcpy((_BYTE *)v18, v15);
      v16[v18] = 32;
      tmbstrcpy(&v16[v18 + 1], v8);
      MemFree(v9[6]);
      v9[6] = (uint64_t *)v18;
    }
  }
  else
  {
LABEL_11:
    if (v8)
    {
      v11 = NewAttributeEx(a1, "class", v8, 34);
      InsertAttributeAtStart(a2, v11);
    }
  }
  v12 = *(_QWORD **)(a3 + 40);
  if (v12)
  {
    while (1)
    {
      v13 = (_DWORD *)v12[1];
      if (v13)
      {
        if (*v13 == 135)
          break;
      }
      v12 = (_QWORD *)*v12;
      if (!v12)
        goto LABEL_17;
    }
    v14 = (_BYTE *)v12[6];
  }
  else
  {
LABEL_17:
    v14 = 0;
  }
  v19 = *(uint64_t ***)(a2 + 40);
  if (!v19)
    goto LABEL_26;
  while (1)
  {
    v20 = v19[1];
    if (v20)
    {
      if (*(_DWORD *)v20 == 135)
        break;
    }
    v19 = (uint64_t **)*v19;
    if (!v19)
      goto LABEL_26;
  }
  v22 = v19[6];
  if (v22)
  {
    if (v14)
    {
      v23 = (uint64_t *)MergeProperties(v22, v14);
      MemFree(v19[6]);
      v19[6] = v23;
    }
  }
  else
  {
LABEL_26:
    if (v14)
    {
      v21 = NewAttributeEx(a1, "style", v14, 34);
      InsertAttributeAtStart(a2, v21);
    }
  }
}

void AddFontStyles(uint64_t a1, uint64_t a2, uint64_t **a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t **v8;
  unsigned __int8 *v11;
  int *v12;
  int v13;
  _DWORD *v14;
  int v15;
  char **v16;
  const char *v17;
  char *v18;
  char v19[256];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v8 = a3;
    while (1)
    {
      v11 = (unsigned __int8 *)v8[6];
      if (!v11)
        goto LABEL_30;
      v12 = (int *)v8[1];
      if (!v12)
        goto LABEL_30;
      v13 = *v12;
      if (v13 == 31)
        break;
      if (v13 == 130)
      {
        if (a2)
        {
          v14 = *(_DWORD **)(a2 + 56);
          if (v14)
          {
            if (*v14 == 79)
            {
              if (!tmbstrcmp((unsigned __int8 *)v8[6], "6"))
              {
                v18 = "h1";
LABEL_35:
                MemFree(*(void **)(a2 + 64));
                *(_QWORD *)(a2 + 64) = tmbstrdup(v18);
                FindTag(a1, a2);
                goto LABEL_30;
              }
              if (!tmbstrcmp(v11, "5"))
              {
                v18 = "h2";
                goto LABEL_35;
              }
              if (!tmbstrcmp(v11, "4"))
              {
                v18 = "h3";
                goto LABEL_35;
              }
            }
          }
        }
        v15 = *v11;
        if (*v11)
        {
          if ((v15 - 48) >= 7)
          {
            if (v15 == 45)
              v16 = FontSize2Name_minussizes;
            else
              v16 = FontSize2Name_plussizes;
            if (v15 == 45)
              v17 = "smaller";
            else
              v17 = "larger";
            if (v11[1] - 48 > 6)
            {
LABEL_28:
              tmbsnprintf(v19, 64, "font-size: %s", a4, a5, a6, a7, a8, (char)v17);
              goto LABEL_29;
            }
            v15 = v11[1];
          }
          else
          {
            v16 = FontSize2Name_sizes;
          }
          v17 = v16[v15 - 48];
          if (v17)
            goto LABEL_28;
        }
      }
      else if (v13 == 49)
      {
        tmbsnprintf(v19, 256, "font-family: %s", a4, a5, a6, a7, a8, (char)v8[6]);
LABEL_29:
        AddStyleProperty(a1, a2, v19);
      }
LABEL_30:
      v8 = (uint64_t **)*v8;
      if (!v8)
        return;
    }
    tmbsnprintf(v19, 128, "color: %s", a4, a5, a6, a7, a8, (char)v8[6]);
    goto LABEL_29;
  }
}

void AddColorRule(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  if (a2)
  {
    if (a3)
    {
      AddStringLiteral(a1, a2);
      AddStringLiteral(a1, " { color: ");
      AddStringLiteral(a1, a3);
      AddStringLiteral(a1, " }\n");
    }
  }
}

void InitConfig(uint64_t a1)
{
  ClearMemory((void *)(a1 + 112), 0x5B0uLL);
  ResetConfigToDefault(a1);
}

void ResetConfigToDefault(uint64_t a1)
{
  int *v2;
  uint64_t i;
  void *v4;
  void *v5;

  v2 = option_defs;
  for (i = 112; i != 824; i += 8)
  {
    if (v2[4])
      v4 = (void *)*((_QWORD *)v2 + 3);
    else
      v4 = (void *)*((_QWORD *)v2 + 6);
    v5 = v4;
    CopyOptionValue((uint64_t)v2, (void **)(a1 + i), &v5);
    v2 += 14;
  }
  FreeDeclaredTags(a1, 0);
}

void FreeConfig(_DWORD *a1)
{
  ResetConfigToDefault((uint64_t)a1);
  TakeConfigSnapshot(a1);
}

void TakeConfigSnapshot(_DWORD *a1)
{
  int *v2;
  uint64_t i;

  AdjustConfig(a1);
  v2 = option_defs;
  for (i = 28; i != 206; i += 2)
  {
    CopyOptionValue((uint64_t)v2, (void **)&a1[i + 180], (void **)&a1[i]);
    v2 += 14;
  }
}

int *lookupOption(char *a1)
{
  int *v2;

  v2 = option_defs;
  while (tmbstrcasecmp(a1, *((char **)v2 + 1)))
  {
    v2 += 14;
    if (v2 >= dword_24C377790)
      return 0;
  }
  return v2;
}

int *getOption(unsigned int a1)
{
  if (a1 >= 0x59)
    return 0;
  else
    return &option_defs[14 * a1];
}

BOOL SetOptionInt(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (a2 <= 0x58)
    *(_QWORD *)(a1 + 8 * a2 + 112) = a3;
  return a2 < 0x59;
}

BOOL SetOptionBool(uint64_t a1, unsigned int a2, unsigned int a3)
{
  if (a2 <= 0x58)
    *(_QWORD *)(a1 + 8 * a2 + 112) = a3;
  return a2 < 0x59;
}

BOOL ResetOptionToDefault(uint64_t a1, unsigned int a2)
{
  unsigned int v2;
  int *v5;
  void **v6;
  void *v7;
  void *v9;

  v2 = a2 - 1;
  if (a2 - 1 <= 0x57)
  {
    v5 = &option_defs[14 * a2];
    v6 = (void **)(a1 + 8 * a2 + 112);
    if (v5[4])
      v7 = *(void **)&option_defs[14 * a2 + 6];
    else
      v7 = *(void **)&option_defs[14 * a2 + 12];
    v9 = v7;
    CopyOptionValue((uint64_t)v5, v6, &v9);
  }
  return v2 < 0x58;
}

void CopyOptionValue(uint64_t a1, void **a2, void **a3)
{
  void *v6;
  _BYTE *v7;

  if (*(_DWORD *)(a1 + 16) || (v6 = *a2) != 0 && v6 != *(void **)(a1 + 48) && (MemFree(v6), *(_DWORD *)(a1 + 16)))
  {
    *a2 = *a3;
  }
  else
  {
    v7 = *a3;
    if (*a3)
    {
      if (v7 != *(_BYTE **)(a1 + 48))
        v7 = tmbstrdup(v7);
    }
    *a2 = v7;
  }
}

_DWORD *AdjustConfig(_DWORD *result)
{
  _DWORD *v1;
  unint64_t v2;

  v1 = result;
  if (result[132])
    *((_QWORD *)result + 65) = 1;
  if (!result[66])
    *((_QWORD *)result + 15) = 0;
  if (!*((_QWORD *)result + 16))
    *((_QWORD *)result + 16) = 0x7FFFFFFFLL;
  if (result[136])
  {
    result[388] |= 2u;
    result = DefineTag(result, 2, "o:p");
  }
  if (v1[70])
  {
    *((_OWORD *)v1 + 18) = xmmword_20AB64430;
    *((_QWORD *)v1 + 63) = 1;
  }
  else if (v1[74])
  {
    *((_QWORD *)v1 + 36) = 1;
    *((_QWORD *)v1 + 40) = 0;
    *((_QWORD *)v1 + 41) = 0;
  }
  v2 = *((_QWORD *)v1 + 20);
  if ((v2 > 0xB || ((1 << v2) & 0xE13) == 0) && v1[72])
    *((_QWORD *)v1 + 39) = 1;
  if (v1[72])
  {
    if (v2 - 9 <= 2)
      *((_QWORD *)v1 + 86) = 1;
    *((_QWORD *)v1 + 54) = 1;
    *((_QWORD *)v1 + 34) = 0;
  }
  return result;
}

void ResetConfigToSnapshot(_QWORD *a1)
{
  int *v2;
  uint64_t i;

  v2 = option_defs;
  for (i = 14; i != 103; ++i)
  {
    CopyOptionValue((uint64_t)v2, (void **)&a1[i], (void **)&a1[i + 90]);
    v2 += 14;
  }
  FreeDeclaredTags((uint64_t)a1, 0);
  ReparseTagDecls(a1);
}

void ReparseTagDecls(_QWORD *a1)
{
  FreeDeclaredTags((uint64_t)a1, 0);
  if (a1[89])
    ReparseTagType((uint64_t)a1, 0x4Bu);
  if (a1[90])
    ReparseTagType((uint64_t)a1, 0x4Cu);
  if (a1[91])
    ReparseTagType((uint64_t)a1, 0x4Du);
  if (a1[92])
    ReparseTagType((uint64_t)a1, 0x4Eu);
}

_DWORD *CopyConfig(_DWORD *result, _DWORD *a2)
{
  _QWORD *v3;
  int *v4;
  uint64_t i;

  if (result != a2)
  {
    v3 = result;
    TakeConfigSnapshot(result);
    v4 = option_defs;
    for (i = 28; i != 206; i += 2)
    {
      CopyOptionValue((uint64_t)v4, (void **)&v3[(unint64_t)i / 2], (void **)&a2[i]);
      v4 += 14;
    }
    ReparseTagDecls(v3);
    return AdjustConfig(v3);
  }
  return result;
}

Bool tidyFileExists(ctmbstr filename)
{
  unsigned __int8 *v2;
  int v3;

  v2 = ExpandTilde((unsigned __int8 *)filename);
  v3 = access((const char *)v2, 0);
  if (v2 != (unsigned __int8 *)filename)
    MemFree(v2);
  return v3 == 0;
}

unsigned __int8 *ExpandTilde(unsigned __int8 *a1)
{
  unsigned __int8 *v1;
  unsigned __int8 *v2;
  char *v3;
  unsigned __int8 *v4;
  _BYTE *v5;
  _BYTE *v6;

  v1 = a1;
  if (a1)
  {
    if (*a1 == 126)
    {
      v2 = a1 + 1;
      if (a1[1] == 47)
      {
        v3 = getenv("HOME");
        if (v3)
        {
          v4 = (unsigned __int8 *)v3;
          v5 = tmbstrlen(v1 + 1);
          v6 = tmbstrlen(v4);
          v1 = (unsigned __int8 *)MemAlloc((size_t)&v6[(_QWORD)v5 + 1]);
          tmbstrcpy(v1, v4);
          tmbstrcat(v1, v2);
        }
      }
    }
  }
  return v1;
}

uint64_t ParseConfigFile()
{
  return ParseConfigFileEnc();
}

uint64_t ParseConfigFileEnc()
{
  uint64_t v0;
  char *v1;
  char *v2;
  unsigned __int8 *v3;
  unsigned __int8 *v4;
  uint64_t v5;
  unsigned int v6;
  unsigned __int8 *v7;
  FILE *v8;
  int CharEncodingFromOptName;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void **v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int Char;
  int i;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unsigned int j;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  unsigned int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unsigned int v58;
  uint64_t v59;
  int v60;
  unsigned int v61;
  unint64_t v62;
  char v63;
  BOOL v64;
  BOOL v65;
  int v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char v75;
  uint64_t v76;
  int v77;
  uint64_t v78;
  unsigned int v79;
  _BYTE v80[8192];
  _OWORD v81[4];
  uint64_t v82;

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v5 = v0;
  v82 = *MEMORY[0x24BDAC8D0];
  v6 = *(_DWORD *)(v0 + 4872);
  v7 = ExpandTilde(v3);
  v8 = fopen((const char *)v7, "r");
  CharEncodingFromOptName = GetCharEncodingFromOptName(v2);
  if (!v8 || CharEncodingFromOptName < 0)
  {
    FileError(v5, (char)v7, 2, v10, v11, v12, v13, v14);
    return 0xFFFFFFFFLL;
  }
  else
  {
    v15 = v5 + 112;
    v16 = FileInput(v5, (uint64_t)v8, CharEncodingFromOptName);
    *(_QWORD *)(v5 + 1560) = v16;
    if (v16)
      Char = ReadChar((uint64_t)v16, v17, v18, v19, v20, v21, v22, v23);
    else
      Char = -1;
    *(_DWORD *)(v5 + 1556) = Char;
    for (i = SkipWhite(v5 + 112); i != -1; i = *(_DWORD *)(v5 + 1556))
    {
      memset(v81, 0, sizeof(v81));
      if (i != 35 && i != 47)
      {
        v38 = 0;
        while (i != -1 && i != 10)
        {
          if (i == 58)
            goto LABEL_43;
          *((_BYTE *)v81 + v38) = i;
          if (*(_DWORD *)(v5 + 1556) == -1)
          {
            if (v38 == 62)
              goto LABEL_10;
            i = -1;
          }
          else
          {
            v39 = *(_QWORD *)(v5 + 1560);
            if (v39)
              i = ReadChar(v39, v27, v28, v29, v30, v31, v32, v33);
            else
              i = -1;
            *(_DWORD *)(v5 + 1556) = i;
            if (v38 == 62)
            {
              if (i != 58)
                goto LABEL_10;
LABEL_43:
              v40 = option_defs;
              while (tmbstrcasecmp((char *)v81, *((char **)v40 + 1)))
              {
                v40 += 14;
                if (v40 >= dword_24C377790)
                {
                  v40 = 0;
                  break;
                }
              }
              if (*(_DWORD *)(v5 + 1556) != -1)
              {
                v48 = *(_QWORD *)(v5 + 1560);
                if (v48)
                  v49 = ReadChar(v48, v41, v42, v43, v44, v45, v46, v47);
                else
                  v49 = -1;
                *(_DWORD *)(v5 + 1556) = v49;
              }
              if (v40)
              {
                (*((void (**)(uint64_t, int *))v40 + 4))(v5, v40);
              }
              else if (*(_QWORD *)(v5 + 4864))
              {
                v50 = SkipWhite(v15);
                v58 = v50;
                v79 = v6;
                v78 = v15;
                if (v50 == 39 || v50 == 34)
                {
                  if (*(_DWORD *)(v5 + 1556) == -1)
                  {
                    v61 = v50;
                    v58 = -1;
                  }
                  else
                  {
                    v59 = *(_QWORD *)(v5 + 1560);
                    if (v59)
                      v60 = ReadChar(v59, v51, v52, v53, v54, v55, v56, v57);
                    else
                      v60 = -1;
                    *(_DWORD *)(v5 + 1556) = v60;
                    v61 = v58;
                    v58 = v60;
                  }
                }
                else
                {
                  v61 = 0;
                }
                v62 = 0;
                v63 = 0;
                v64 = 1;
                while (1)
                {
                  v65 = v58 + 1 > 0xE || ((1 << (v58 + 1)) & 0x4801) == 0;
                  if (!v65 || v61 && v58 == v61)
                    break;
                  v66 = IsWhite(v58);
                  if (v63 & 1 | (v66 == 0))
                  {
                    if (v66)
                      v75 = 32;
                    else
                      v75 = v58;
                    v80[v62] = v75;
                    if (*(_DWORD *)(v5 + 1556) == -1)
                    {
                      v58 = -1;
                    }
                    else
                    {
                      v76 = *(_QWORD *)(v5 + 1560);
                      if (v76)
                        v58 = ReadChar(v76, v67, v68, v69, v70, v71, v72, v73);
                      else
                        v58 = -1;
                      *(_DWORD *)(v5 + 1556) = v58;
                    }
                    v64 = v62 < 0x1FFD;
                    v63 = 1;
                    ++v62;
                    v77 = 8190;
                    if (v62 == 8190)
                      goto LABEL_94;
                  }
                  else
                  {
                    if (*(_DWORD *)(v5 + 1556) == -1)
                    {
                      v58 = -1;
                    }
                    else
                    {
                      v74 = *(_QWORD *)(v5 + 1560);
                      if (v74)
                        v58 = ReadChar(v74, v67, v68, v69, v70, v71, v72, v73);
                      else
                        v58 = -1;
                      *(_DWORD *)(v5 + 1556) = v58;
                    }
                    v63 = 0;
                    if (!v64)
                      break;
                  }
                }
                v77 = v62;
LABEL_94:
                v80[v77] = 0;
                if (!(*(unsigned int (**)(_OWORD *, _BYTE *))(v5 + 4864))(v81, v80))
                  ReportUnknownOption(v5, (char)v81, v28, v29, v30, v31, v32, v33);
                v6 = v79;
                v15 = v78;
              }
              else
              {
                ReportUnknownOption(v5, (char)v81, v42, v43, v44, v45, v46, v47);
              }
              goto LABEL_10;
            }
          }
          ++v38;
        }
      }
      do
      {
LABEL_10:
        for (j = *(_DWORD *)(v5 + 1556); j != -1 && j != 10; *(_DWORD *)(v5 + 1556) = j)
        {
          if (j == 13)
          {
            v36 = *(_QWORD *)(v5 + 1560);
            if (v36)
              j = ReadChar(v36, v27, v28, v29, v30, v31, v32, v33);
            else
              j = -1;
            *(_DWORD *)(v5 + 1556) = j;
            break;
          }
          v35 = *(_QWORD *)(v5 + 1560);
          if (v35)
            j = ReadChar(v35, v27, v28, v29, v30, v31, v32, v33);
          else
            j = -1;
        }
        if (j == 10)
        {
          v37 = *(_QWORD *)(v5 + 1560);
          if (v37)
            j = ReadChar(v37, v27, v28, v29, v30, v31, v32, v33);
          else
            j = -1;
          *(_DWORD *)(v5 + 1556) = j;
        }
      }
      while (IsWhite(j));
    }
    freeFileSource((uint64_t *)(*(_QWORD *)(v5 + 1560) + 48), 1);
    freeStreamIn(*(void ***)(v5 + 1560));
    *(_QWORD *)(v5 + 1560) = 0;
    if (v7 != v4)
      MemFree(v7);
    AdjustConfig((_DWORD *)v5);
    return *(_DWORD *)(v5 + 4872) > v6;
  }
}

uint64_t SkipWhite(uint64_t a1)
{
  unsigned int i;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  for (i = *(_DWORD *)(a1 + 1444);
        IsWhite(i) && !IsNewline(*(_DWORD *)(a1 + 1444));
        *(_DWORD *)(a1 + 1444) = i)
  {
    v10 = *(_QWORD *)(a1 + 1448);
    if (v10)
      i = ReadChar(v10, v3, v4, v5, v6, v7, v8, v9);
    else
      i = -1;
  }
  return *(unsigned int *)(a1 + 1444);
}

uint64_t ParseConfigOption(uint64_t a1, char *a2, byte *a3)
{
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(char *, byte *);
  uint64_t result;

  v6 = option_defs;
  do
  {
    if (!tmbstrcasecmp(a2, *((char **)v6 + 1)))
      return ParseConfigValue(a1, *v6, a3, v8, v9, v10, v11, v12);
    v6 += 14;
  }
  while (v6 < dword_24C377790);
  v13 = *(uint64_t (**)(char *, byte *))(a1 + 4864);
  if (!v13 || (result = v13(a2, a3), !(_DWORD)result))
  {
    ReportUnknownOption(a1, (char)a2, v7, v8, v9, v10, v11, v12);
    return 0;
  }
  return result;
}

uint64_t ParseConfigValue(uint64_t a1, unsigned int a2, byte *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v11;
  _DWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int Char;
  uint64_t v21;
  TidyBuffer buf;

  if (a2 <= 0x58 && a3)
  {
    memset(&buf, 0, sizeof(buf));
    v11 = tmbstrlen(a3);
    tidyBufAttach(&buf, a3, v11 + 1);
    v12 = BufferInput(a1, &buf, 1);
    *(_QWORD *)(a1 + 1560) = v12;
    if (v12)
      Char = ReadChar((uint64_t)v12, v13, v14, v15, v16, v17, v18, v19);
    else
      Char = -1;
    *(_DWORD *)(a1 + 1556) = Char;
    v21 = (*(uint64_t (**)(uint64_t, int *))&option_defs[14 * a2 + 8])(a1, &option_defs[14 * a2]);
    freeStreamIn(*(void ***)(a1 + 1560));
    *(_QWORD *)(a1 + 1560) = 0;
    tidyBufDetach(&buf);
  }
  else
  {
    ReportBadArgument(a1, *(_QWORD *)&option_defs[14 * a2 + 2], (uint64_t)a3, a4, a5, a6, a7, a8);
    return 0;
  }
  return v21;
}

uint64_t AdjustCharEncoding(_QWORD *a1, unsigned int a2)
{
  uint64_t v2;
  uint64_t v3;

  if (a2 > 0xD)
    return 0;
  v2 = qword_20AB64450[a2];
  v3 = qword_20AB644C0[a2];
  a1[18] = a2;
  a1[19] = v3;
  a1[20] = v2;
  return 1;
}

const char *CharEncodingName(int a1)
{
  const char *result;

  result = (const char *)GetEncodingNameFromTidyId(a1);
  if (!result)
    return "unknown";
  return result;
}

const char *CharEncodingOptName(int a1)
{
  const char *result;

  result = (const char *)GetEncodingOptNameFromTidyId(a1);
  if (!result)
    return "unknown";
  return result;
}

uint64_t getOptionList()
{
  return 1;
}

int *getNextOption(uint64_t a1, unint64_t *a2)
{
  unint64_t v2;
  int *result;
  unint64_t v4;

  v2 = *a2;
  if (*a2 != 0 && *a2 < 0x59)
    result = &option_defs[14 * v2];
  else
    result = 0;
  v4 = ((*a2 != 0) & (*a2 < 0x59)) + v2;
  if (v4 >= 0x59)
    v4 = 0;
  *a2 = v4;
  return result;
}

BOOL getOptionPickList(_BOOL8 result)
{
  if (result)
    return *(_QWORD *)(result + 40) != 0;
  return result;
}

uint64_t getNextOptionPick(uint64_t a1, unint64_t *a2)
{
  unint64_t v2;
  BOOL v3;
  uint64_t v4;
  uint64_t result;
  unint64_t v6;

  v2 = *a2;
  if (*a2)
    v3 = v2 > 0xF;
  else
    v3 = 1;
  if (v3 || (v4 = *(_QWORD *)(a1 + 40)) == 0)
  {
    result = 0;
LABEL_10:
    v6 = 0;
    goto LABEL_11;
  }
  result = *(_QWORD *)(v4 + 8 * v2 - 8);
  if (!result || !*(_QWORD *)(v4 + 8 * v2))
    goto LABEL_10;
  v6 = v2 + 1;
LABEL_11:
  *a2 = v6;
  return result;
}

BOOL ConfigDiffThanSnapshot(uint64_t a1)
{
  return memcmp((const void *)(a1 + 112), (const void *)(a1 + 832), 0x164uLL) != 0;
}

BOOL ConfigDiffThanDefault(uint64_t a1)
{
  uint64_t *v1;
  char **v2;
  uint64_t v3;
  uint64_t v4;
  _BOOL8 result;
  char *v6;

  v1 = (uint64_t *)(a1 + 112);
  v2 = &off_24C376490;
  do
  {
    v3 = *v1;
    if (*((_DWORD *)v2 - 12))
      v4 = (uint64_t)*(v2 - 5);
    else
      v4 = (uint64_t)*(v2 - 2);
    result = v3 != v4;
    if (v3 != v4)
      break;
    ++v1;
    v6 = *v2;
    v2 += 7;
  }
  while (v6);
  return result;
}

uint64_t SaveConfigFile(uint64_t a1, char *__filename)
{
  uint64_t v3;
  uint64_t v4;
  FILE *v5;
  FILE *v6;
  _DWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = *(_QWORD *)(a1 + 160);
  v4 = *(_QWORD *)(a1 + 168);
  v5 = fopen(__filename, "wb");
  if (!v5)
    return 0xFFFFFFFFLL;
  v6 = v5;
  v7 = FileOutput((uint64_t)v5, v3, v4);
  v14 = SaveConfigToStream(a1, (uint64_t)v7, v8, v9, v10, v11, v12, v13);
  fclose(v6);
  MemFree(v7);
  return v14;
}

uint64_t SaveConfigToStream(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  int *i;
  uint64_t v12;
  int v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  unsigned __int8 *v19;
  unsigned __int8 *v20;
  _OWORD v22[2];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v10 = a1 + 112;
  for (i = &dword_24C376450; *((_QWORD *)i + 1); i += 14)
  {
    if (!*((_QWORD *)i + 4))
      goto LABEL_27;
    v12 = *i;
    v13 = i[4];
    v14 = *(char **)(v10 + 8 * v12);
    if (v13)
      v15 = (char *)*((_QWORD *)i + 3);
    else
      v15 = (char *)*((_QWORD *)i + 6);
    if (v14 == v15)
    {
      if ((_DWORD)v12 != 9)
        goto LABEL_27;
    }
    else if ((_DWORD)v12 != 9)
    {
      if (!*((_QWORD *)i + 5))
      {
        if (v13 == 2)
        {
          if (v14)
            v14 = "yes";
          else
            v14 = "no";
        }
        else if (v13 == 1)
        {
          memset(v22, 0, sizeof(v22));
          tmbsnprintf((char *)v22, 32, "%lu", a4, a5, a6, a7, a8, (char)v14);
          v14 = (char *)v22;
        }
        else if (v13)
        {
          goto LABEL_27;
        }
        WriteOptionString((uint64_t)i, v14, a2);
LABEL_27:
        LODWORD(v19) = 0;
        goto LABEL_28;
      }
      v16 = (uint64_t)i;
      goto LABEL_17;
    }
    v17 = *(_QWORD *)(a1 + 176);
    if (v17 == 1)
      goto LABEL_27;
    if (v17 != 4)
    {
      v16 = (uint64_t)i;
      v14 = *(char **)(a1 + 176);
LABEL_17:
      LODWORD(v19) = WriteOptionPick(v16, (unint64_t)v14, a2);
      goto LABEL_28;
    }
    v18 = tmbstrlen(v14);
    v19 = (unsigned __int8 *)MemAlloc((size_t)(v18 + 2));
    if (v19)
    {
      v20 = v19;
      *(_WORD *)v19 = 34;
      tmbstrcat(v19, *(unsigned __int8 **)(v10 + 8 * v12));
      tmbstrcat(v20, "\"");
      WriteOptionString((uint64_t)i, v20, a2);
      MemFree(v20);
      goto LABEL_27;
    }
LABEL_28:
    if ((_DWORD)v19)
      return 0xFFFFFFFFLL;
  }
  return 0;
}

uint64_t SaveConfigSink(uint64_t a1, _OWORD *a2)
{
  _DWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = UserOutput(a2, *(_DWORD *)(a1 + 160), *(_DWORD *)(a1 + 168));
  v10 = SaveConfigToStream(a1, (uint64_t)v3, v4, v5, v6, v7, v8, v9);
  MemFree(v3);
  return v10;
}

uint64_t ParseInt(uint64_t a1, unsigned int *a2)
{
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int Char;
  uint64_t v16;

  v4 = a1 + 112;
  v5 = SkipWhite(a1 + 112);
  if (IsDigit(v5))
  {
    v13 = 0;
    do
    {
      if (*(_DWORD *)(a1 + 1556) == -1)
      {
        Char = -1;
      }
      else
      {
        v14 = *(_QWORD *)(a1 + 1560);
        if (v14)
          Char = ReadChar(v14, v6, v7, v8, v9, v10, v11, v12);
        else
          Char = -1;
        *(_DWORD *)(a1 + 1556) = Char;
      }
      v13 = v5 - 48 + 10 * v13;
      v5 = Char;
    }
    while (IsDigit(Char));
    v16 = *a2;
    if (v16 <= 0x58)
      *(_QWORD *)(v4 + 8 * v16) = v13;
    return 1;
  }
  else
  {
    ReportBadArgument(a1, *((_QWORD *)a2 + 1), v7, v8, v9, v10, v11, v12);
    return 0;
  }
}

uint64_t ParseCharEnc(uint64_t a1, unsigned int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t Char;
  unsigned int CharEncodingFromOptName;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _OWORD v27[4];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  memset(v27, 0, sizeof(v27));
  v4 = a1 + 112;
  v5 = SkipWhite(a1 + 112);
  if ((_DWORD)v5 == -1)
  {
    v8 = 0;
  }
  else
  {
    v6 = v5;
    v7 = 0;
    while (1)
    {
      v8 = v7;
      if (IsWhite(v6))
        break;
      *((_BYTE *)v27 + v8) = ToLower(v6);
      if (*(_DWORD *)(a1 + 1556) == -1)
        goto LABEL_11;
      v16 = *(_QWORD *)(a1 + 1560);
      if (!v16)
      {
        *(_DWORD *)(a1 + 1556) = -1;
LABEL_11:
        ++v8;
        break;
      }
      Char = ReadChar(v16, v9, v10, v11, v12, v13, v14, v15);
      *(_DWORD *)(a1 + 1556) = Char;
      if (v8 <= 0x3C)
      {
        v6 = Char;
        v7 = v8 + 1;
        if ((_DWORD)Char != -1)
          continue;
      }
      goto LABEL_11;
    }
  }
  *((_BYTE *)v27 + v8) = 0;
  CharEncodingFromOptName = GetCharEncodingFromOptName((char *)v27);
  if ((CharEncodingFromOptName & 0x80000000) != 0)
  {
    ReportBadArgument(a1, *((_QWORD *)a2 + 1), v19, v20, v21, v22, v23, v24);
    return 0;
  }
  else
  {
    v25 = *a2;
    if (v25 < 0x59)
    {
      *(_QWORD *)(v4 + 8 * v25) = CharEncodingFromOptName;
      if (*a2 == 4)
        AdjustCharEncoding((_QWORD *)a1, CharEncodingFromOptName);
    }
    return 1;
  }
}

uint64_t ParseNewline(uint64_t a1, unsigned int *a2)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  unint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unsigned int Char;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[3];

  v29[2] = *MEMORY[0x24BDAC8D0];
  v29[0] = 0;
  v29[1] = 0;
  v4 = a1 + 112;
  v5 = SkipWhite(a1 + 112);
  if (v5 == -1)
  {
    v8 = v29;
  }
  else
  {
    v6 = v5;
    v7 = 0;
    v8 = v29;
    while (1)
    {
      if (IsWhite(v6))
      {
        v8 = (char *)v29 + v7;
        goto LABEL_16;
      }
      if (v6 == 10 || v6 == 13)
        goto LABEL_16;
      *((_BYTE *)v29 + v7) = v6;
      if (*(_DWORD *)(a1 + 1556) == -1)
        break;
      v16 = *(_QWORD *)(a1 + 1560);
      if (!v16)
      {
        *(_DWORD *)(a1 + 1556) = -1;
        break;
      }
      v17 = v7 + 1;
      Char = ReadChar(v16, v9, v10, v11, v12, v13, v14, v15);
      *(_DWORD *)(a1 + 1556) = Char;
      if (Char != -1)
      {
        v6 = Char;
        v8 = (char *)v29 + v17;
        if (v7++ < 0xF)
          continue;
      }
      v8 = (char *)v29 + v17;
      goto LABEL_16;
    }
    v8 = (char *)v29 + v7 + 1;
  }
LABEL_16:
  *v8 = 0;
  if (tmbstrcasecmp((char *)v29, "lf"))
  {
    if (tmbstrcasecmp((char *)v29, "crlf"))
    {
      if (tmbstrcasecmp((char *)v29, "cr"))
      {
        ReportBadArgument(a1, *((_QWORD *)a2 + 1), v20, v21, v22, v23, v24, v25);
        return 0;
      }
      v27 = 2;
    }
    else
    {
      v27 = 1;
    }
  }
  else
  {
    v27 = 0;
  }
  v28 = *a2;
  if (v28 <= 0x58)
    *(_QWORD *)(v4 + 8 * v28) = v27;
  return 1;
}

uint64_t ParseDocType(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int Char;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _OWORD v25[2];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  memset(v25, 0, sizeof(v25));
  v4 = SkipWhite(a1 + 112);
  if (v4 == -1)
  {
    v7 = 0;
  }
  else
  {
    v5 = v4;
    if (v4 == 34 || v4 == 39)
    {
      ParseString();
      v6 = 4;
      goto LABEL_25;
    }
    v8 = 0;
    while (1)
    {
      v7 = v8;
      if (IsWhite(v5))
        break;
      *((_BYTE *)v25 + v7) = v5;
      if (*(_DWORD *)(a1 + 1556) == -1)
        goto LABEL_14;
      v16 = *(_QWORD *)(a1 + 1560);
      if (!v16)
      {
        *(_DWORD *)(a1 + 1556) = -1;
LABEL_14:
        ++v7;
        break;
      }
      Char = ReadChar(v16, v9, v10, v11, v12, v13, v14, v15);
      *(_DWORD *)(a1 + 1556) = Char;
      if (v7 <= 0x1D)
      {
        v5 = Char;
        v8 = v7 + 1;
        if (Char != -1)
          continue;
      }
      goto LABEL_14;
    }
  }
  *((_BYTE *)v25 + v7) = 0;
  if (tmbstrcasecmp((char *)v25, "auto"))
  {
    if (tmbstrcasecmp((char *)v25, "omit"))
    {
      if (tmbstrcasecmp((char *)v25, "strict"))
      {
        if (tmbstrcasecmp((char *)v25, "loose")
          && tmbstrcasecmp((char *)v25, "transitional"))
        {
          ReportBadArgument(a1, *(_QWORD *)(a2 + 8), v18, v19, v20, v21, v22, v23);
          return 0;
        }
        v6 = 3;
      }
      else
      {
        v6 = 2;
      }
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = 1;
  }
LABEL_25:
  *(_QWORD *)(a1 + 176) = v6;
  return 1;
}

uint64_t ParseRepeatAttr(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  unsigned int v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int Char;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t result;
  _OWORD v24[4];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  memset(v24, 0, sizeof(v24));
  v4 = SkipWhite(a1 + 112);
  if (v4 == -1)
  {
    v7 = 0;
  }
  else
  {
    v5 = v4;
    v6 = 0;
    while (1)
    {
      v7 = v6;
      if (IsWhite(v5))
        break;
      *((_BYTE *)v24 + v7) = v5;
      if (*(_DWORD *)(a1 + 1556) == -1)
        goto LABEL_11;
      v15 = *(_QWORD *)(a1 + 1560);
      if (!v15)
      {
        *(_DWORD *)(a1 + 1556) = -1;
LABEL_11:
        ++v7;
        break;
      }
      Char = ReadChar(v15, v8, v9, v10, v11, v12, v13, v14);
      *(_DWORD *)(a1 + 1556) = Char;
      if (v7 <= 0x3D)
      {
        v5 = Char;
        v6 = v7 + 1;
        if (Char != -1)
          continue;
      }
      goto LABEL_11;
    }
  }
  *((_BYTE *)v24 + v7) = 0;
  if (tmbstrcasecmp((char *)v24, "keep-first"))
  {
    if (tmbstrcasecmp((char *)v24, "keep-last"))
    {
      ReportBadArgument(a1, *(_QWORD *)(a2 + 8), v17, v18, v19, v20, v21, v22);
      return 0;
    }
    else
    {
      result = 1;
      *(_QWORD *)(a1 + 192) = 1;
    }
  }
  else
  {
    *(_QWORD *)(a1 + 192) = 0;
    return 1;
  }
  return result;
}

uint64_t ParseString()
{
  uint64_t v0;
  unsigned int *v1;
  unsigned int *v2;
  uint64_t v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  int Char;
  unsigned int v15;
  unint64_t v16;
  char v17;
  uint64_t v18;
  BOOL v19;
  BOOL v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  _BYTE v33[8192];
  uint64_t v34;

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v3 = v0;
  v34 = *MEMORY[0x24BDAC8D0];
  v4 = SkipWhite(v0 + 112);
  v12 = v4;
  if (v4 == 39 || v4 == 34)
  {
    if (*(_DWORD *)(v3 + 1556) == -1)
    {
      v15 = v4;
      v12 = -1;
    }
    else
    {
      v13 = *(_QWORD *)(v3 + 1560);
      if (v13)
        Char = ReadChar(v13, v5, v6, v7, v8, v9, v10, v11);
      else
        Char = -1;
      *(_DWORD *)(v3 + 1556) = Char;
      v15 = v12;
      v12 = Char;
    }
  }
  else
  {
    v15 = 0;
  }
  v16 = 0;
  v17 = 0;
  v18 = 8190;
  v19 = 1;
  while (1)
  {
    v20 = v12 + 1 > 0xE || ((1 << (v12 + 1)) & 0x4801) == 0;
    if (!v20 || v15 && v12 == v15)
      break;
    v21 = IsWhite(v12);
    if (v17 & 1 | (v21 == 0))
    {
      if (v21)
        v30 = 32;
      else
        v30 = v12;
      v33[v16] = v30;
      if (*(_DWORD *)(v3 + 1556) == -1)
      {
        v12 = -1;
      }
      else
      {
        v31 = *(_QWORD *)(v3 + 1560);
        if (v31)
          v12 = ReadChar(v31, v22, v23, v24, v25, v26, v27, v28);
        else
          v12 = -1;
        *(_DWORD *)(v3 + 1556) = v12;
      }
      v19 = v16 < 0x1FFD;
      v17 = 1;
      if (++v16 == 8190)
        goto LABEL_39;
    }
    else
    {
      if (*(_DWORD *)(v3 + 1556) == -1)
      {
        v12 = -1;
      }
      else
      {
        v29 = *(_QWORD *)(v3 + 1560);
        if (v29)
          v12 = ReadChar(v29, v22, v23, v24, v25, v26, v27, v28);
        else
          v12 = -1;
        *(_DWORD *)(v3 + 1556) = v12;
      }
      v17 = 0;
      if (!v19)
        break;
    }
  }
  v18 = v16;
LABEL_39:
  v33[v18] = 0;
  SetOptionValue((_BYTE *)v3, *v2, v33);
  return 1;
}

uint64_t ParseName(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int Char;
  _BYTE v18[1024];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  bzero(v18, 0x400uLL);
  v4 = SkipWhite(a1 + 112);
  if (v4 == -1)
    goto LABEL_13;
  v11 = v4;
  v12 = 0;
  while (1)
  {
    v13 = v12;
    if (IsWhite(v11))
      break;
    v18[v13] = v11;
    if (*(_DWORD *)(a1 + 1556) == -1)
      goto LABEL_10;
    v15 = *(_QWORD *)(a1 + 1560);
    if (!v15)
    {
      *(_DWORD *)(a1 + 1556) = -1;
LABEL_10:
      ++v13;
      break;
    }
    Char = ReadChar(v15, v14, v5, v6, v7, v8, v9, v10);
    *(_DWORD *)(a1 + 1556) = Char;
    if (v13 <= 0x3FC)
    {
      v11 = Char;
      v12 = v13 + 1;
      if (Char != -1)
        continue;
    }
    goto LABEL_10;
  }
  v18[v13] = 0;
  if (!(_DWORD)v13)
  {
LABEL_13:
    ReportBadArgument(a1, *(_QWORD *)(a2 + 8), v5, v6, v7, v8, v9, v10);
    return 0;
  }
  else
  {
    SetOptionValue((_BYTE *)a1, *(_DWORD *)a2, v18);
    return 1;
  }
}

uint64_t ParseBool(uint64_t a1, unsigned int *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  v6 = 0;
  result = ParseTriState(0, a1, (uint64_t)a2, &v6);
  if ((_DWORD)result)
  {
    v5 = *a2;
    if (v5 <= 0x58)
      *(_QWORD *)(a1 + 8 * v5 + 112) = v6 != 0;
  }
  return result;
}

uint64_t ParseAutoBool(uint64_t a1, unsigned int *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  v6 = 0;
  result = ParseTriState(2, a1, (uint64_t)a2, &v6);
  if ((_DWORD)result)
  {
    v5 = *a2;
    if (v5 <= 0x58)
      *(_QWORD *)(a1 + 8 * v5 + 112) = v6;
  }
  return result;
}

uint64_t ParseCSS1Selector(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int Char;
  _OWORD v18[16];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  memset(v18, 0, sizeof(v18));
  v4 = SkipWhite(a1 + 112);
  if (v4 == -1)
  {
    LOBYTE(v18[0]) = 0;
  }
  else
  {
    v11 = v4;
    v12 = 0;
    while (1)
    {
      v13 = v12;
      if (IsWhite(v11))
        break;
      *((_BYTE *)v18 + v13) = v11;
      if (*(_DWORD *)(a1 + 1556) == -1)
        goto LABEL_11;
      v15 = *(_QWORD *)(a1 + 1560);
      if (!v15)
      {
        *(_DWORD *)(a1 + 1556) = -1;
LABEL_11:
        ++v13;
        break;
      }
      Char = ReadChar(v15, v14, v5, v6, v7, v8, v9, v10);
      *(_DWORD *)(a1 + 1556) = Char;
      if (v13 <= 0xFC)
      {
        v11 = Char;
        v12 = v13 + 1;
        if (Char != -1)
          continue;
      }
      goto LABEL_11;
    }
    *((_BYTE *)v18 + v13) = 0;
    if ((_DWORD)v13 && IsCSS1Selector((uint64_t)v18))
    {
      *((_BYTE *)v18 + v13) = 45;
      *((_BYTE *)v18 + (v13 + 1)) = 0;
      SetOptionValue((_BYTE *)a1, *(_DWORD *)a2, v18);
      return 1;
    }
  }
  ReportBadArgument(a1, *(_QWORD *)(a2 + 8), v5, v6, v7, v8, v9, v10);
  return 0;
}

BOOL ParseTagNames(uint64_t a1, unsigned int *a2)
{
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  unsigned int Char;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unsigned int v37;
  uint64_t v38;
  unsigned __int8 *v39;
  _BYTE *v40;
  _BYTE *v41;
  unsigned __int8 *v42;
  uint64_t v44;
  unsigned __int8 v45[1024];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v44 = a1 + 112;
  v4 = SkipWhite(a1 + 112);
  v11 = *a2 - 75;
  if (v11 >= 4)
  {
    ReportUnknownOption(a1, *((_QWORD *)a2 + 1), v5, v6, v7, v8, v9, v10);
    return 0;
  }
  Char = v4;
  v13 = dword_20AB64440[v11];
  SetOptionValue((_BYTE *)a1, *a2, 0);
  FreeDeclaredTags(a1, v13);
  v21 = 0;
  *(_DWORD *)(a1 + 1552) |= v13;
  while (1)
  {
    if (Char <= 0x2C && ((1 << Char) & 0x100100000200) != 0)
    {
      if (*(_DWORD *)(a1 + 1556) == -1)
        return v21 != 0;
      v22 = *(_QWORD *)(a1 + 1560);
      if (v22)
        Char = ReadChar(v22, v14, v15, v16, v17, v18, v19, v20);
      else
        Char = -1;
      *(_DWORD *)(a1 + 1556) = Char;
      goto LABEL_10;
    }
    if (Char == 13 || Char == 10)
      break;
LABEL_25:
    if (Char == -1)
      return v21 != 0;
    v34 = 0;
    while (1)
    {
      v35 = v34;
      if (IsWhite(Char) || Char == 44)
        break;
      v45[v35] = Char;
      if (*(_DWORD *)(a1 + 1556) == -1)
      {
        Char = -1;
LABEL_36:
        ++v35;
        break;
      }
      v36 = *(_QWORD *)(a1 + 1560);
      if (!v36)
      {
        Char = -1;
        *(_DWORD *)(a1 + 1556) = -1;
        goto LABEL_36;
      }
      v37 = ReadChar(v36, v14, v15, v16, v17, v18, v19, v20);
      Char = v37;
      *(_DWORD *)(a1 + 1556) = v37;
      if (v35 <= 0x3FC)
      {
        v34 = v35 + 1;
        if (v37 != -1)
          continue;
      }
      goto LABEL_36;
    }
    v45[v35] = 0;
    if ((_DWORD)v35)
    {
      v38 = *a2;
      v39 = *(unsigned __int8 **)(v44 + 8 * v38);
      if (v39)
      {
        v40 = tmbstrlen(v45);
        v41 = tmbstrlen(v39);
        v39 = tmbstrndup((uint64_t)v39, (uint64_t)&v41[(_QWORD)v40 + 3]);
        tmbstrcat(v39, ", ");
        tmbstrcat(v39, v45);
        v42 = v39;
      }
      else
      {
        v42 = v45;
      }
      DefineTag((_DWORD *)a1, v13, v45);
      SetOptionValue((_BYTE *)a1, v38, v42);
      if (v39)
        MemFree(v39);
      ++v21;
    }
LABEL_10:
    if (Char == -1)
      return v21 != 0;
  }
  if (*(_DWORD *)(a1 + 1556) == -1)
  {
    v32 = 0xFFFFFFFFLL;
    goto LABEL_23;
  }
  v23 = *(_QWORD *)(a1 + 1560);
  if (!v23)
    goto LABEL_21;
  v24 = ReadChar(v23, v14, v15, v16, v17, v18, v19, v20);
  v32 = v24;
  *(_DWORD *)(a1 + 1556) = v24;
  if (Char == 13 && (_DWORD)v24 == 10)
  {
    v33 = *(_QWORD *)(a1 + 1560);
    if (v33)
    {
      v32 = ReadChar(v33, v25, v26, v27, v28, v29, v30, v31);
LABEL_22:
      *(_DWORD *)(a1 + 1556) = v32;
      goto LABEL_23;
    }
LABEL_21:
    v32 = 0xFFFFFFFFLL;
    goto LABEL_22;
  }
LABEL_23:
  if (IsWhite(v32))
  {
    Char = v32;
    goto LABEL_25;
  }
  v45[0] = 0;
  UngetChar((void *)v32, *(_QWORD *)(a1 + 1560));
  UngetChar((void *)0xA, *(_QWORD *)(a1 + 1560));
  return v21 != 0;
}

_BYTE *SetOptionValue(_BYTE *result, unsigned int a2, _BYTE *a3)
{
  uint64_t v4;
  _BYTE *v5;
  void *v6;

  if (a2 <= 0x58)
  {
    v4 = a2;
    v5 = result + 112;
    if (!option_defs[14 * a2 + 4])
    {
      v6 = *(void **)&v5[8 * a2];
      if (v6)
      {
        if (v6 != *(void **)&option_defs[14 * a2 + 12])
          MemFree(v6);
      }
    }
    result = tmbstrdup(a3);
    *(_QWORD *)&v5[8 * v4] = result;
  }
  return result;
}

uint64_t ParseTriState(int a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t result;

  v8 = SkipWhite(a2 + 112);
  v15 = v8 - 48;
  if ((v8 - 48) <= 0x3E)
  {
    if (((1 << v15) & 0x4040000040400001) != 0)
    {
      *a4 = 0;
      return 1;
    }
    if (((1 << v15) & 0x21000000002) != 0)
      goto LABEL_8;
  }
  if (v8 == 121 || v8 == 116)
  {
LABEL_8:
    result = 1;
    *a4 = 1;
  }
  else
  {
    if (a1 == 2 && (v8 & 0xFFFFFFDF) == 0x41)
    {
      *a4 = 2;
      return 1;
    }
    ReportBadArgument(a2, *(_QWORD *)(a3 + 8), v9, v10, v11, v12, v13, v14);
    return 0;
  }
  return result;
}

void ReparseTagType(uint64_t a1, unsigned int a2)
{
  byte *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = tmbstrdup(*(_BYTE **)(a1 + 8 * a2 + 112));
  ParseConfigValue(a1, a2, v4, v5, v6, v7, v8, v9);
  MemFree(v4);
}

uint64_t WriteOptionString(uint64_t a1, _BYTE *a2, uint64_t a3)
{
  _BYTE *v5;
  char v6;
  unsigned __int8 *v7;
  int v8;
  char v9;
  unsigned __int8 *v10;
  int v11;

  v5 = *(_BYTE **)(a1 + 8);
  v6 = *v5;
  if (*v5)
  {
    v7 = v5 + 1;
    do
    {
      WriteChar(v6, a3);
      v8 = *v7++;
      v6 = v8;
    }
    while (v8);
  }
  WriteChar(58, a3);
  WriteChar(32, a3);
  v9 = *a2;
  if (*a2)
  {
    v10 = a2 + 1;
    do
    {
      WriteChar(v9, a3);
      v11 = *v10++;
      v9 = v11;
    }
    while (v11);
  }
  return WriteChar(10, a3);
}

uint64_t WriteOptionPick(uint64_t a1, unint64_t a2, uint64_t a3)
{
  unint64_t v4;
  _BYTE *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  v4 = 0;
  do
  {
    v5 = *(_BYTE **)(*(_QWORD *)(a1 + 40) + 8 * v4);
    v6 = v4 + 1;
    if (v4 >= a2)
      break;
    ++v4;
  }
  while (v5);
  v7 = a2 + 1;
  v8 = 0xFFFFFFFFLL;
  if (v7 == v6 && v5)
  {
    WriteOptionString(a1, v5, a3);
    return 0;
  }
  return v8;
}

uint64_t EntityInfo(char *a1, int a2, _DWORD *a3, int *a4)
{
  unsigned __int8 *v7;
  int v8;
  int v9;
  unsigned __int8 *v10;
  char **v11;
  unsigned __int8 *v12;
  uint64_t result;
  int v14;
  int v15;

  v7 = (unsigned __int8 *)(a1 + 1);
  v8 = a1[1];
  if (a1[1])
  {
    if (v8 == 35)
    {
      v9 = a1[2];
      if (v9 == 120 || !a2 && v9 == 88)
        sscanf(a1 + 3, "%x");
      else
        sscanf(a1 + 2, "%u");
      *a3 = 0;
      v15 = 0x1FFF;
    }
    else
    {
      v10 = "quot";
      v11 = &off_24C379D88;
      while (v8 != *v10 || tmbstrcmp(v7, v10))
      {
        v12 = (unsigned __int8 *)*v11;
        v11 += 2;
        v10 = v12;
        if (!v12)
          goto LABEL_11;
      }
      *a3 = *((_DWORD *)v11 - 1);
      v15 = *((_DWORD *)v11 - 2);
    }
    *a4 = v15;
    return 1;
  }
  else
  {
LABEL_11:
    result = 0;
    *a3 = 0;
    if (a2)
      v14 = 0x10000;
    else
      v14 = 57344;
    *a4 = v14;
  }
  return result;
}

const char *EntityName(int a1, int a2)
{
  char **v2;
  const char *v3;
  char **v4;
  const char *v5;
  int v6;

  if (a1 == 34)
  {
    v2 = &entities;
    v3 = "quot";
LABEL_6:
    if (((_DWORD)v2[1] & a2) != 0)
      return v3;
    else
      return 0;
  }
  else
  {
    v4 = &entities;
    v2 = &entities;
    while (1)
    {
      v5 = v2[2];
      v2 += 2;
      v3 = v5;
      if (!v5)
        return 0;
      v6 = *((_DWORD *)v4 + 7);
      v4 = v2;
      if (v6 == a1)
        goto LABEL_6;
    }
  }
}

uint64_t initFileSource(_QWORD *a1, uint64_t a2)
{
  _QWORD *v4;

  a1[1] = filesrc_getByte;
  a1[2] = filesrc_ungetByte;
  a1[3] = filesrc_eof;
  v4 = MemAlloc(0x20uLL);
  ClearMemory(v4, 0x20uLL);
  *v4 = a2;
  *a1 = v4;
  return 0;
}

uint64_t filesrc_getByte(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 16))
    return tidyBufPopByte((TidyBuffer *)(a1 + 8));
  else
    return fgetc(*(FILE **)a1);
}

BOOL filesrc_eof(uint64_t a1)
{
  return !*(_DWORD *)(a1 + 16) && feof(*(FILE **)a1) != 0;
}

void filesrc_ungetByte(uint64_t a1, byte a2)
{
  tidyBufPutByte((TidyBuffer *)(a1 + 8), a2);
}

void freeFileSource(uint64_t *a1, int a2)
{
  uint64_t v2;

  v2 = *a1;
  if (a2 && v2 && *(_QWORD *)v2)
    fclose(*(FILE **)v2);
  tidyBufFree((TidyBuffer *)(v2 + 8));
  MemFree((void *)v2);
}

uint64_t filesink_putByte(FILE *a1, int a2)
{
  return fputc(a2, a1);
}

_QWORD *initFileSink(_QWORD *result, uint64_t a2)
{
  *result = a2;
  result[1] = filesink_putByte;
  return result;
}

_QWORD *DupAttrs(uint64_t a1, __int128 *a2)
{
  _QWORD *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;

  if (!a2)
    return 0;
  v4 = NewAttribute();
  v6 = a2[1];
  v5 = a2[2];
  v7 = *a2;
  v4[6] = *((_QWORD *)a2 + 6);
  *((_OWORD *)v4 + 1) = v6;
  *((_OWORD *)v4 + 2) = v5;
  *(_OWORD *)v4 = v7;
  *v4 = DupAttrs(a1, *(_QWORD *)a2);
  v4[5] = tmbstrdup(*((_BYTE **)a2 + 5));
  v4[6] = tmbstrdup(*((_BYTE **)a2 + 6));
  v4[1] = FindAttribute(a1, (uint64_t)v4);
  v8 = *((_QWORD *)a2 + 2);
  if (v8)
    v9 = CloneNode(a1, v8);
  else
    v9 = 0;
  v4[2] = v9;
  v10 = *((_QWORD *)a2 + 3);
  if (v10)
    v11 = CloneNode(a1, v10);
  else
    v11 = 0;
  v4[3] = v11;
  return v4;
}

_QWORD *PushInline(_QWORD *result, uint64_t a2)
{
  _DWORD *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  unsigned int v7;
  unsigned int v8;
  char *v9;
  unsigned int v10;
  _DWORD *v11;
  char *v12;

  if (!*(_DWORD *)(a2 + 96))
  {
    v3 = *(_DWORD **)(a2 + 56);
    if (v3)
    {
      if ((v3[8] & 0x810) == 0x10)
      {
        v4 = (uint64_t)result;
        v5 = result[13];
        v6 = *(_DWORD *)(v5 + 148);
        if (*v3 != 36)
        {
          v10 = v6 - 1;
          while ((v10 & 0x80000000) == 0)
          {
            v11 = *(_DWORD **)(*(_QWORD *)(v5 + 136) + 32 * v10-- + 8);
            if (v11 == v3)
              return result;
          }
        }
        v7 = *(_DWORD *)(v5 + 144);
        if (v6 + 1 <= v7)
        {
          v9 = *(char **)(v5 + 136);
        }
        else
        {
          v8 = 2 * v7;
          if (!v7)
            v8 = 12;
          *(_DWORD *)(v5 + 144) = v8;
          v9 = (char *)MemRealloc(*(void **)(v5 + 136), 32 * v8);
          *(_QWORD *)(v5 + 136) = v9;
          v6 = *(_DWORD *)(v5 + 148);
          v3 = *(_DWORD **)(a2 + 56);
        }
        v12 = &v9[32 * v6];
        *((_QWORD *)v12 + 1) = v3;
        *((_QWORD *)v12 + 2) = tmbstrdup(*(_BYTE **)(a2 + 64));
        result = DupAttrs(v4, *(__int128 **)(a2 + 40));
        *((_QWORD *)v12 + 3) = result;
        ++*(_DWORD *)(v5 + 148);
      }
    }
  }
  return result;
}

uint64_t IsPushed(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 104);
  v3 = *(_DWORD *)(v2 + 148) - 1;
  while ((v3 & 0x80000000) == 0)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(v2 + 136) + 32 * v3-- + 8);
    if (v4 == *(_QWORD *)(a2 + 56))
      return 1;
  }
  return 0;
}

void PopInline(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  _DWORD *v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a1 + 104);
  if (!a2)
    goto LABEL_14;
  v4 = *(_DWORD **)(a2 + 56);
  if (!v4 || (v4[8] & 0x810) != 0x10)
    return;
  if (*v4 == 1)
  {
    LODWORD(v5) = *(_DWORD *)(v3 + 148);
    do
    {
      if (!(_DWORD)v5)
        break;
      PopIStack(a1);
      v5 = *(unsigned int *)(v3 + 148);
    }
    while (**(_DWORD **)(*(_QWORD *)(v3 + 136) + 32 * v5 + 8) != 1);
  }
  else
  {
LABEL_14:
    if (*(_DWORD *)(v3 + 148))
    {
      PopIStack(a1);
      if (*(_QWORD *)(v3 + 128) >= *(_QWORD *)(v3 + 136) + 32 * (unint64_t)*(unsigned int *)(v3 + 148))
        *(_QWORD *)(v3 + 128) = 0;
    }
  }
}

void PopIStack(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v1 = *(_QWORD *)(a1 + 104);
  v2 = (*(_DWORD *)(v1 + 148) - 1);
  *(_DWORD *)(v1 + 148) = v2;
  v3 = *(_QWORD *)(v1 + 136) + 32 * v2;
  v5 = (_QWORD *)(v3 + 24);
  v4 = *(_QWORD **)(v3 + 24);
  if (v4)
  {
    do
    {
      *v5 = *v4;
      FreeAttribute(a1, (uint64_t)v4);
      v4 = (_QWORD *)*v5;
    }
    while (*v5);
  }
  MemFree(*(void **)(v3 + 16));
  *(_QWORD *)(v3 + 16) = 0;
}

BOOL IsPushedLast(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  _BOOL8 result;

  v3 = *(_QWORD *)(a1 + 104);
  result = 0;
  if (!a2 || (v4 = *(_QWORD *)(a2 + 56)) != 0 && (*(_DWORD *)(v4 + 32) & 0x810) == 0x10)
  {
    v5 = *(_DWORD *)(v3 + 148);
    if (v5)
    {
      if (*(_QWORD *)(*(_QWORD *)(v3 + 136) + 32 * (v5 - 1) + 8) == *(_QWORD *)(a3 + 56))
        return 1;
    }
  }
  return result;
}

uint64_t InlineDup(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  v2 = *(_QWORD *)(a1 + 104);
  v3 = *(unsigned int *)(v2 + 152);
  result = (*(_DWORD *)(v2 + 148) - v3);
  if ((int)result >= 1)
  {
    v5 = *(_QWORD *)(v2 + 136) + 32 * v3;
    *(_QWORD *)(v2 + 120) = a2;
    *(_QWORD *)(v2 + 128) = v5;
  }
  return result;
}

uint64_t DeferDup(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 104);
  *(_QWORD *)(v1 + 120) = 0;
  *(_QWORD *)(v1 + 128) = 0;
  return result;
}

char *InsertedToken(uint64_t a1)
{
  uint64_t v1;
  char *v2;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = *(_QWORD *)(a1 + 104);
  v2 = *(char **)(v1 + 120);
  if (*(_QWORD *)(v1 + 128))
  {
    if (!v2)
      *(int32x2_t *)v1 = vrev64_s32(*(int32x2_t *)(*(_QWORD *)(a1 + 4832) + 32));
    v2 = NewNode((_QWORD *)v1);
    *((_DWORD *)v2 + 20) = 5;
    *((_DWORD *)v2 + 24) = 1;
    *((_QWORD *)v2 + 9) = *(_QWORD *)(v1 + 48);
    v4 = *(_QWORD *)(v1 + 128);
    v5 = tmbstrdup(*(_BYTE **)(v4 + 16));
    *((_QWORD *)v2 + 7) = *(_QWORD *)(v4 + 8);
    *((_QWORD *)v2 + 8) = v5;
    *((_QWORD *)v2 + 5) = DupAttrs(a1, *(__int128 **)(v4 + 24));
    v6 = *(_QWORD *)(v1 + 136);
    v7 = ((unint64_t)(*(_QWORD *)(v1 + 128) - v6) >> 5) + 1;
    v8 = v6 + 32 * v7;
    if (v7 >= *(_DWORD *)(v1 + 148))
      v9 = 0;
    else
      v9 = v8;
    *(_QWORD *)(v1 + 128) = v9;
  }
  else
  {
    *(_QWORD *)(v1 + 120) = 0;
  }
  return v2;
}

uint64_t HTMLVersion(uint64_t a1)
{
  _DWORD *v1;
  int v2;
  int v3;
  unint64_t v4;
  int v5;
  unsigned int v6;
  int v7;
  BOOL v9;
  int *v10;
  char v11;
  BOOL v12;

  v1 = *(_DWORD **)(a1 + 104);
  v2 = v1[9];
  if (*(_DWORD *)(a1 + 288) || (v3 = v1[7]) != 0)
    LOBYTE(v3) = *(_DWORD *)(a1 + 304) == 0;
  v4 = 0;
  v5 = 0;
  v6 = 0;
  v7 = v1[8];
  v9 = (v2 & 0x1FFC) != 0 || (*(_QWORD *)(a1 + 176) & 0xFFFFFFFELL) == 2;
  v10 = &dword_24C37AD5C;
  do
  {
    if (v4 < 0xC)
      v11 = v3;
    else
      v11 = 0;
    v12 = v4 < 6 && v9;
    if ((v11 & 1) == 0 && !v12 && (*v10 & v7) != 0 && v5 - 1 >= *(v10 - 1))
    {
      v6 = v4;
      v5 = *(v10 - 1);
    }
    ++v4;
    v10 += 8;
  }
  while (v4 != 17);
  if (v5)
    return *((unsigned int *)&W3C_Doctypes + 8 * v6 + 1);
  else
    return 0;
}

uint64_t ConstrainVersion(uint64_t result, int a2)
{
  *(_DWORD *)(*(_QWORD *)(result + 104) + 32) &= a2 | 0xE000;
  return result;
}

uint64_t IsWhite(unsigned int a1)
{
  if (a1 > 0x7F)
    return 0;
  else
    return (lexmap[a1] >> 3) & 1;
}

uint64_t IsNewline(unsigned int a1)
{
  if (a1 > 0x7F)
    return 0;
  else
    return (lexmap[a1] >> 4) & 1;
}

uint64_t IsDigit(unsigned int a1)
{
  if (a1 > 0x7F)
    return 0;
  else
    return lexmap[a1] & 1;
}

uint64_t IsLetter(unsigned int a1)
{
  if (a1 > 0x7F)
    return 0;
  else
    return (lexmap[a1] >> 1) & 1;
}

uint64_t IsNamechar(unsigned int a1)
{
  if (a1 > 0x7F)
    return 0;
  else
    return (lexmap[a1] >> 2) & 1;
}

BOOL IsXMLLetter(unsigned int a1)
{
  int32x4_t v1;
  int32x4_t v2;
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v7;

  v1.i32[0] = a1 & 0xFFFFFFDF;
  v1.i32[1] = a1;
  v1.i32[2] = a1;
  v1.i32[3] = a1;
  v2 = vdupq_n_s32(a1);
  v3 = 1;
  if ((vmaxv_u8((uint8x8_t)vmovn_s16(vuzp1q_s16((int16x8_t)vcgtq_u32((uint32x4_t)xmmword_20AB64550, (uint32x4_t)vaddq_s32(v1, (int32x4_t)xmmword_20AB64530)), (int16x8_t)vcgtq_u32((uint32x4_t)xmmword_20AB64560, (uint32x4_t)vaddq_s32(v2, (int32x4_t)xmmword_20AB64540))))) & 1) != 0)return v3;
  if (a1 - 461 < 0x24)
    return v3;
  if (a1 - 506 < 0x1E)
    return v3;
  if (a1 - 592 < 0x59)
    return v3;
  v4 = a1 & 0xFFFFFFF8;
  if ((a1 & 0xFFFFFFF8) == 0xF8)
    return v3;
  v5 = a1 & 0xFFFFFFFE;
  if ((a1 & 0xFFFFFFFE) == 0x1F4 || a1 - 699 < 7 || a1 - 902 <= 6 && ((1 << (a1 + 122)) & 0x5D) != 0)
    return v3;
  if (a1 - 910 < 0x14 || a1 - 931 < 0x2C)
    return v3;
  if (a1 - 976 < 0x11 && ((0x1547Fu >> (a1 + 48)) & 1) != 0)
    return 1;
  v3 = 1;
  if ((vmaxv_u8((uint8x8_t)vmovn_s16(vuzp1q_s16((int16x8_t)vcgtq_u32((uint32x4_t)xmmword_20AB64590, (uint32x4_t)vaddq_s32(v2, (int32x4_t)xmmword_20AB64570)), (int16x8_t)vcgtq_u32((uint32x4_t)xmmword_20AB645A0, (uint32x4_t)vaddq_s32(v2, (int32x4_t)xmmword_20AB64580))))) & 1) != 0)return v3;
  if (a1 - 1232 < 0x1C)
    return v3;
  if (a1 - 1262 < 8)
    return v3;
  if (v5 == 1272)
    return v3;
  v3 = 1;
  if ((vmaxv_u8((uint8x8_t)vmovn_s16(vuzp1q_s16((int16x8_t)vcgtq_u32((uint32x4_t)xmmword_20AB645D0, (uint32x4_t)vaddq_s32(v2, (int32x4_t)xmmword_20AB645B0)), (int16x8_t)vcgtq_u32((uint32x4_t)xmmword_20AB645E0, (uint32x4_t)vaddq_s32(v2, (int32x4_t)xmmword_20AB645C0))))) & 1) != 0)return v3;
  if (a1 - 1728 < 0xF)
    return v3;
  if (a1 == 1369)
    return v3;
  v7 = a1 & 0xFFFFFFFC;
  if ((a1 & 0xFFFFFFFC) == 0x6D0 || a1 - 1749 <= 0x11 && ((1 << (a1 + 43)) & 0x30001) != 0)
    return v3;
  v3 = 1;
  if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vcgtq_u32((uint32x4_t)xmmword_20AB64600, (uint32x4_t)vaddq_s32(v2, (int32x4_t)xmmword_20AB645F0)))) & 1) != 0|| a1 - 2451 < 0x16|| a1 == 2365)
  {
    return v3;
  }
  if (a1 - 2474 >= 9)
  {
    if (a1 - 2579 < 0x16)
      return 1;
  }
  else
  {
    v3 = 1;
    if (((0x17Fu >> (a1 + 86)) & 1) != 0 || a1 - 2579 < 0x16)
      return v3;
  }
  v3 = 1;
  if (a1 - 2602 <= 0x34 && ((1 << (a1 - 42)) & 0x1780000000DB7FLL) != 0
    || a1 - 2524 <= 0x34 && ((1 << (a1 + 36)) & 0x187E000030003BLL) != 0
    || a1 - 2486 < 4)
  {
    return v3;
  }
  if (a1 - 2674 < 3)
    return 1;
  if (a1 - 2693 >= 9)
  {
    if (a1 - 2707 < 0x16)
      return 1;
  }
  else
  {
    v3 = 1;
    if (((0x17Fu >> (a1 + 123)) & 1) != 0 || a1 - 2707 < 0x16)
      return v3;
  }
  v3 = 1;
  if (a1 - 2730 <= 0x36 && ((1 << (a1 + 86)) & 0x4000000008FB7FLL) != 0 || a1 - 2703 < 3)
    return v3;
  if (a1 - 2835 < 0x16)
    return 1;
  v3 = 1;
  if (a1 - 2821 <= 0x38 && ((1 << (a1 - 5)) & 0x11E6FE000000CFFLL) != 0)
    return v3;
  if (a1 - 2911 <= 0x3D && ((1 << (a1 - 95)) & 0x2C7B8FC000000007) != 0)
    return v3;
  if (a1 - 2908 < 2)
    return v3;
  v3 = 1;
  if ((vmaxv_u8((uint8x8_t)vmovn_s16(vuzp1q_s16((int16x8_t)vcgtq_u32((uint32x4_t)xmmword_20AB64630, (uint32x4_t)vaddq_s32(v2, (int32x4_t)xmmword_20AB64610)), (int16x8_t)vcgtq_u32((uint32x4_t)xmmword_20AB64640, (uint32x4_t)vaddq_s32(v2, (int32x4_t)xmmword_20AB64620))))) & 1) != 0)return v3;
  if ((vaddvq_s32((int32x4_t)vandq_s8((int8x16_t)vcgtq_u32((uint32x4_t)xmmword_20AB64660, (uint32x4_t)vaddq_s32(v2, (int32x4_t)xmmword_20AB64650)), (int8x16_t)xmmword_20AB64670)) & 0xF) != 0)return v3;
  if (a1 - 3242 < 0xA)
    return v3;
  if (v5 == 2974)
    return v3;
  if (v5 == 3168)
    return v3;
  if (a1 - 3253 < 5)
    return v3;
  if (a1 == 3294)
    return v3;
  v3 = 1;
  if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vcgtq_u32((uint32x4_t)xmmword_20AB64690, (uint32x4_t)vaddq_s32(v2, (int32x4_t)xmmword_20AB64680)))) & 1) != 0|| a1 - 3585 < 0x2E|| v5 == 3296|| v5 == 3424|| a1 - 3632 <= 0x15 && ((1 << (a1 - 48)) & 0x3F000D) != 0)
  {
    return v3;
  }
  if (a1 - 3713 <= 0xC && ((1 << (a1 + 127)) & 0x12CB) != 0 || v7 == 3732 || a1 - 3737 < 7)
    return v3;
  if (a1 - 3745 >= 7)
  {
    if (v5 == 3754)
      return 1;
  }
  else
  {
    v3 = 1;
    if (((0x57u >> (a1 + 95)) & 1) != 0 || v5 == 3754)
      return v3;
  }
  if (a1 - 3757 <= 0x10)
  {
    v3 = 1;
    if (((1 << (a1 + 83)) & 0x1006B) != 0)
      return v3;
  }
  v3 = 1;
  if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vcgtq_u32((uint32x4_t)xmmword_20AB646B0, (uint32x4_t)vaddq_s32(v2, (int32x4_t)xmmword_20AB646A0)))) & 1) != 0|| v4 == 3904)
  {
    return v3;
  }
  if (a1 - 4352 >= 0xA)
  {
    if (a1 - 4363 < 2)
      return 1;
  }
  else
  {
    v3 = 1;
    if (((0x2EDu >> a1) & 1) != 0 || a1 - 4363 < 2)
      return v3;
  }
  v3 = 1;
  if (a1 - 4412 <= 0x2D && ((1 << (a1 - 60)) & 0x2AB823150015) != 0 || a1 - 4366 < 5)
    return v3;
  if (a1 - 4461 < 2
    || a1 - 4466 <= 0x39 && ((1 << (a1 - 114)) & 0x24010000000000BLL) != 0
    || v5 == 4526)
  {
    return 1;
  }
  v3 = 1;
  if (a1 - 4538 <= 0x3F && ((1 << (a1 + 70)) & 0x80420000000001FDLL) != 0)
    return v3;
  if (a1 - 4535 < 2)
    return v3;
  v3 = 1;
  if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vcgtq_u32((uint32x4_t)xmmword_20AB646D0, (uint32x4_t)vaddq_s32(v2, (int32x4_t)xmmword_20AB646C0)))) & 1) != 0)return v3;
  if (a1 - 7968 < 0x26)
    return v3;
  if (a1 - 8008 < 6)
    return v3;
  v3 = 1;
  if (a1 - 8064 < 0x35 || a1 - 8031 < 0x1F || a1 == 8029 || v4 == 8016 || (a1 & 0xFFFFFFFD) == 0x1F59)
    return v3;
  if (a1 - 8118 < 9 && ((0x17Fu >> (a1 + 74)) & 1) != 0)
    return 1;
  v3 = 1;
  if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vcgtq_u32((uint32x4_t)xmmword_20AB646F0, (uint32x4_t)vaddq_s32(v2, (int32x4_t)xmmword_20AB646E0)))) & 1) == 0&& a1 - 8178 >= 3&& v7 != 8144&& a1 - 8182 >= 7&& (a1 - 8486 > 8 || ((1 << (a1 - 38)) & 0x131) == 0))
  {
    v3 = 1;
    if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vcgtq_u32((uint32x4_t)xmmword_20AB64710, (uint32x4_t)vaddq_s32(v2, (int32x4_t)xmmword_20AB64700)))) & 1) == 0&& (a1 - 44032) >> 2 >= 0xAE9)
    {
      return a1 == 12295 || a1 - 19968 < 0x51A6 || a1 - 12321 < 9;
    }
  }
  return v3;
}

BOOL IsXMLNamechar(signed int a1)
{
  _BOOL8 result;
  int32x4_t v3;
  int32x4_t v4;
  uint32x4_t v5;

  if (IsXMLLetter(a1)
    || (a1 - 45) <= 0x32 && ((1 << (a1 - 45)) & 0x4000000002003) != 0)
  {
    return 1;
  }
  v3 = vdupq_n_s32(a1);
  result = 1;
  if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vcgtq_u32((uint32x4_t)xmmword_20AB64730, (uint32x4_t)vaddq_s32(v3, (int32x4_t)xmmword_20AB64720)))) & 1) == 0&& (a1 & 0xFFFFFFFE) != 0x360)
  {
    if (a1 <= 1749)
    {
      if ((a1 - 1611) <= 0x25 && ((1 << (a1 - 75)) & 0x20000000FFLL) != 0
        || (a1 - 1467) <= 9 && ((1 << (a1 + 69)) & 0x2D7) != 0)
      {
        return result;
      }
    }
    else if ((a1 - 1750) <= 0x17 && ((1 << (a1 + 42)) & 0xF67FFF) != 0
           || (a1 - 2305) <= 0x3B && ((1 << (a1 - 1)) & 0x800000000000007) != 0)
    {
      return result;
    }
    if ((a1 - 2366) < 0x10)
      return result;
    if (a1 <= 2747)
    {
      if (a1 > 2561)
      {
        if ((a1 - 2620) <= 0x35 && ((1 << (a1 - 60)) & 0x3000000003987DLL) != 0
          || (a1 - 2689) < 3
          || a1 == 2562)
        {
          return result;
        }
      }
      else if ((a1 - 2492) <= 0x27 && ((1 << (a1 + 68)) & 0xC0080399FDLL) != 0
             || (a1 - 2385) <= 0x32 && ((1 << (a1 - 81)) & 0x700000006000FLL) != 0)
      {
        return result;
      }
    }
    else if (a1 <= 2875)
    {
      if ((a1 - 2748) <= 0x11 && ((1 << (a1 + 68)) & 0x3BBFD) != 0 || (a1 - 2817) < 3)
        return result;
    }
    else if ((a1 - 2876) <= 0x1B && ((1 << (a1 - 60)) & 0xC0398FD) != 0
           || (a1 - 3006) <= 0x19 && ((1 << (a1 + 66)) & 0x200F71F) != 0
           || (a1 - 2946) < 2)
    {
      return result;
    }
    if (a1 > 3269)
    {
      if ((a1 - 3390) <= 0x19 && ((1 << (a1 - 62)) & 0x200F73F) != 0
        || (a1 - 3270) <= 0x3D && ((1 << (a1 + 58)) & 0x30000000000180F7) != 0
        || a1 == 3633)
      {
        return result;
      }
    }
    else if (a1 <= 3141)
    {
      if ((a1 - 3134) < 7 || (a1 - 3073) < 3)
        return result;
    }
    else if ((a1 - 3142) <= 0x3D && ((1 << (a1 - 70)) & 0x30000000000180F7) != 0
           || (a1 - 3262) < 7)
    {
      return result;
    }
    if ((a1 - 3636) >= 7
      && ((a1 - 3761) > 0x1C || ((1 << (a1 + 79)) & 0x1F800DF9) == 0)
      && (a1 - 3655) >= 8
      && ((a1 - 3864) > 0x27 || ((1 << (a1 - 24)) & 0xC2A0000003) == 0)
      && (a1 - 3953) >= 0x14
      && (a1 - 3974) >= 6
      && ((a1 - 3984) >= 8 || ((0xBFu >> (a1 + 112)) & 1) == 0)
      && (a1 - 3993) >= 0x15
      && ((a1 - 4017) >= 9 || ((0x17Fu >> (a1 + 79)) & 1) == 0)
      && a1 != 8417
      && (a1 - 8400) >= 0xD
      && (a1 - 12330) >= 6
      && (a1 - 12441) >= 2)
    {
      v4.i32[0] = a1 & 0xFFFFFF7E;
      v4.i32[1] = a1;
      v4.i32[2] = a1;
      v4.i32[3] = a1 & 0xFFFFFF7E;
      v3.i32[3] = a1 & 0xFFFFFF7E;
      v5.i64[0] = 0xA0000000ALL;
      v5.i64[1] = 0xA0000000ALL;
      if ((vmaxv_u8((uint8x8_t)vmovn_s16(vuzp1q_s16((int16x8_t)vcgtq_u32(v5, (uint32x4_t)vaddq_s32(v3, (int32x4_t)xmmword_20AB64750)), (int16x8_t)vcgtq_u32((uint32x4_t)xmmword_20AB64760, (uint32x4_t)vaddq_s32(v4, (int32x4_t)xmmword_20AB64740))))) & 1) == 0&& (a1 - 3430) >= 0xA&& (a1 & 0xFFFFFF7E) - 3664 >= 0xA&& (a1 - 3872) >= 0xA)
      {
        if (a1 <= 3781)
        {
          if (a1 > 902)
          {
            if (a1 == 903 || a1 == 1600 || a1 == 3654)
              return result;
          }
          else if ((a1 - 720) < 2 || a1 == 183)
          {
            return result;
          }
          return (a1 - 12540) < 3;
        }
        if (((a1 - 12293) > 0x30 || ((1 << (a1 - 5)) & 0x1F00000000001) == 0)
          && (a1 - 12445) >= 2
          && a1 != 3782)
        {
          return (a1 - 12540) < 3;
        }
      }
    }
  }
  return result;
}

uint64_t IsUpper(unsigned int a1)
{
  if (a1 > 0x7F)
    return 0;
  else
    return (lexmap[a1] >> 6) & 1;
}

uint64_t ToLower(uint64_t result)
{
  if (result <= 0x7F && (lexmap[result] & 0x40) != 0)
    return (result + 32);
  return result;
}

uint64_t ToUpper(uint64_t result)
{
  if (result <= 0x7F && (lexmap[result] & 0x20) != 0)
    return (result - 32);
  return result;
}

_DWORD *NewLexer(uint64_t a1)
{
  _DWORD *v2;
  _DWORD *v3;

  v2 = MemAlloc(0xA8uLL);
  v3 = v2;
  if (v2)
  {
    ClearMemory(v2, 0xA8uLL);
    *(_QWORD *)v3 = 0x100000001;
    v3[14] = 0;
    *((_QWORD *)v3 + 4) = 0xFFFFLL;
    *((_QWORD *)v3 + 10) = a1;
  }
  return v3;
}

void FreeLexer(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v1 = *(_QWORD *)(a1 + 104);
  if (!v1)
    return;
  FreeStyles(a1);
  v3 = *(_QWORD *)(v1 + 72);
  if (*(_DWORD *)(v1 + 12))
  {
    FreeNode(a1, v3);
LABEL_5:
    FreeNode(a1, *(_QWORD *)(v1 + 64));
    goto LABEL_7;
  }
  if (v3)
    goto LABEL_5;
LABEL_7:
  while (*(_DWORD *)(v1 + 148))
    PopInline(a1, 0);
  MemFree(*(void **)(v1 + 136));
  MemFree(*(void **)(v1 + 104));
  MemFree((void *)v1);
  *(_QWORD *)(a1 + 104) = 0;
}

void FreeNode(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;

  if (a2)
  {
    v2 = a2;
    do
    {
      v4 = *(_QWORD *)(v2 + 16);
      FreeAttrs(a1, v2);
      FreeNode(a1, *(_QWORD *)(v2 + 24));
      MemFree(*(void **)(v2 + 64));
      if (*(_DWORD *)(v2 + 80))
        MemFree((void *)v2);
      else
        *(_QWORD *)(v2 + 24) = 0;
      v2 = v4;
    }
    while (v4);
  }
}

void AddCharToLexer(uint64_t a1, unsigned int a2)
{
  uint64_t i;
  char v4;
  size_t v5;
  unsigned int v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v11 = 0;
  v13 = 0;
  v12 = 0;
  if (EncodeCharToUTF8Bytes(a2, &v12, 0, &v11))
  {
    LOWORD(v12) = -16401;
    BYTE2(v12) = -67;
    v11 = 3;
  }
  else if (v11 < 1)
  {
    return;
  }
  for (i = 0; i < v11; ++i)
  {
    v4 = *((_BYTE *)&v12 + i);
    LODWORD(v5) = *(_DWORD *)(a1 + 112);
    v6 = *(_DWORD *)(a1 + 116) + 2;
    if (v6 >= v5)
    {
      do
      {
        if ((_DWORD)v5)
          v5 = (2 * v5);
        else
          v5 = 0x2000;
      }
      while (v6 >= v5);
      v7 = (char *)MemRealloc(*(void **)(a1 + 104), v5);
      if (v7)
      {
        v8 = v7;
        ClearMemory(&v7[*(unsigned int *)(a1 + 112)], (v5 - *(_DWORD *)(a1 + 112)));
        *(_QWORD *)(a1 + 104) = v8;
        *(_DWORD *)(a1 + 112) = v5;
      }
    }
    v9 = *(_QWORD *)(a1 + 104);
    v10 = *(unsigned int *)(a1 + 116);
    *(_DWORD *)(a1 + 116) = v10 + 1;
    *(_BYTE *)(v9 + v10) = v4;
    *(_BYTE *)(*(_QWORD *)(a1 + 104) + *(unsigned int *)(a1 + 116)) = 0;
  }
}

char *NewNode(_QWORD *a1)
{
  char *v2;

  v2 = (char *)MemAlloc(0x68uLL);
  ClearMemory(v2, 0x68uLL);
  if (a1)
    *(_QWORD *)(v2 + 84) = *a1;
  *((_DWORD *)v2 + 20) = 4;
  return v2;
}

char *CloneNode(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char *v5;
  char *v6;
  int v7;
  _BYTE *v8;

  v4 = *(_QWORD *)(a1 + 104);
  v5 = NewNode((_QWORD *)v4);
  v6 = v5;
  v7 = *(_DWORD *)(v4 + 116);
  *((_DWORD *)v5 + 18) = v7;
  *((_DWORD *)v5 + 19) = v7;
  if (a2)
  {
    *(_QWORD *)v5 = *(_QWORD *)a2;
    *((_DWORD *)v5 + 20) = *(_DWORD *)(a2 + 80);
    *(_QWORD *)(v5 + 92) = *(_QWORD *)(a2 + 92);
    v8 = *(_BYTE **)(a2 + 64);
    *((_QWORD *)v6 + 7) = *(_QWORD *)(a2 + 56);
    *((_QWORD *)v6 + 8) = tmbstrdup(v8);
    *((_QWORD *)v6 + 5) = DupAttrs(a1, *(_QWORD *)(a2 + 40));
  }
  return v6;
}

uint64_t FreeAttrs(uint64_t result, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v4;
  int *v5;
  int v6;

  v2 = *(_QWORD **)(a2 + 40);
  if (v2)
  {
    v4 = result;
    do
    {
      if (v2[5])
      {
        v5 = (int *)v2[1];
        if (v5)
        {
          v6 = *v5;
          if ((v6 == 79 || v6 == 62) && IsAnchorElement(v4, a2))
            RemoveAnchorByNode(v4, a2);
        }
      }
      *(_QWORD *)(a2 + 40) = *v2;
      result = FreeAttribute(v4, v2);
      v2 = *(_QWORD **)(a2 + 40);
    }
    while (v2);
  }
  return result;
}

void FreeAttribute(uint64_t a1, uint64_t a2)
{
  FreeNode(a1, *(_QWORD *)(a2 + 16));
  FreeNode(a1, *(_QWORD *)(a2 + 24));
  MemFree(*(void **)(a2 + 40));
  MemFree(*(void **)(a2 + 48));
  MemFree((void *)a2);
}

uint64_t DetachAttribute(uint64_t result, _QWORD *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;

  v2 = 0;
  v3 = (_QWORD *)(result + 40);
  v4 = (_QWORD *)(result + 40);
  while (1)
  {
    v4 = (_QWORD *)*v4;
    if (!v4)
      break;
    v5 = v2;
    v2 = v4;
    if (v4 == a2)
    {
      if (v5)
        v3 = v5;
      *v3 = *a2;
      return result;
    }
  }
  return result;
}

void RemoveAttribute(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;

  v3 = 0;
  v4 = (_QWORD *)(a2 + 40);
  v5 = (_QWORD *)(a2 + 40);
  while (1)
  {
    v5 = (_QWORD *)*v5;
    if (!v5)
      break;
    v6 = v3;
    v3 = v5;
    if (v5 == a3)
    {
      if (v6)
        v4 = v6;
      *v4 = *a3;
      break;
    }
  }
  FreeAttribute(a1, (uint64_t)a3);
}

double TextToken(uint64_t a1)
{
  char *v2;
  double result;

  v2 = NewNode((_QWORD *)a1);
  result = *(double *)(a1 + 48);
  *((double *)v2 + 9) = result;
  return result;
}

char *NewLineNode(uint64_t a1)
{
  char *v2;

  v2 = NewNode((_QWORD *)a1);
  *((_DWORD *)v2 + 18) = *(_DWORD *)(a1 + 116);
  AddCharToLexer(a1, 0xAu);
  *((_DWORD *)v2 + 19) = *(_DWORD *)(a1 + 116);
  return v2;
}

char *NewLiteralTextNode(uint64_t a1, _BYTE *a2)
{
  char *v4;
  int v5;
  unsigned int v6;
  unsigned __int8 *v7;
  unsigned int v8;

  v4 = NewNode((_QWORD *)a1);
  v5 = *(_DWORD *)(a1 + 116);
  *((_DWORD *)v4 + 18) = v5;
  v6 = *a2;
  if (*a2)
  {
    v7 = a2 + 1;
    do
    {
      AddCharToLexer(a1, v6);
      v8 = *v7++;
      v6 = v8;
    }
    while (v8);
    v5 = *(_DWORD *)(a1 + 116);
  }
  *((_DWORD *)v4 + 19) = v5;
  return v4;
}

void AddStringLiteral(uint64_t a1, unsigned __int8 *a2)
{
  unsigned int v3;
  unsigned __int8 *v5;
  unsigned int v6;

  v3 = *a2;
  if (v3)
  {
    v5 = a2 + 1;
    do
    {
      AddCharToLexer(a1, v3);
      v6 = *v5++;
      v3 = v6;
    }
    while (v6);
  }
}

uint64_t FindDocType(uint64_t result)
{
  if (result)
  {
    for (result = *(_QWORD *)(result + 24); result; result = *(_QWORD *)(result + 16))
    {
      if (*(_DWORD *)(result + 80) == 1)
        break;
    }
  }
  return result;
}

_QWORD *FindContainer(_QWORD **a1)
{
  _QWORD *i;

  if (!a1)
    return 0;
  for (i = *a1; i; i = (_QWORD *)*i)
  {
    if (!nodeHasCM((_BOOL8)i, 16))
      break;
  }
  return i;
}

_QWORD *FindHTML(_QWORD *result)
{
  _DWORD *v1;

  if (result)
  {
    for (result = (_QWORD *)result[3]; result; result = (_QWORD *)result[2])
    {
      v1 = (_DWORD *)result[7];
      if (v1 && *v1 == 48)
        break;
    }
  }
  return result;
}

uint64_t FindXmlDecl(uint64_t result)
{
  if (result)
  {
    for (result = *(_QWORD *)(result + 24); result; result = *(_QWORD *)(result + 16))
    {
      if (*(_DWORD *)(result + 80) == 13)
        break;
    }
  }
  return result;
}

_QWORD *FindHEAD(_QWORD *result)
{
  _QWORD *v1;
  _DWORD *v2;
  _DWORD *v3;

  if (result)
  {
    v1 = (_QWORD *)result[3];
    if (v1)
    {
      while (1)
      {
        v2 = (_DWORD *)v1[7];
        if (v2)
        {
          if (*v2 == 48)
            break;
        }
        v1 = (_QWORD *)v1[2];
        if (!v1)
          return 0;
      }
      for (result = (_QWORD *)v1[3]; result; result = (_QWORD *)result[2])
      {
        v3 = (_DWORD *)result[7];
        if (v3 && *v3 == 46)
          break;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

_QWORD *FindTITLE(_QWORD *a1)
{
  _QWORD *result;
  _DWORD *v2;

  result = FindHEAD(a1);
  if (result)
  {
    for (result = (_QWORD *)result[3]; result; result = (_QWORD *)result[2])
    {
      v2 = (_DWORD *)result[7];
      if (v2 && *v2 == 111)
        break;
    }
  }
  return result;
}

_QWORD *FindBody(_QWORD *result)
{
  _QWORD *v1;
  _DWORD *v2;
  int *v3;
  int v4;
  _QWORD *v5;
  _DWORD *v6;
  uint64_t v7;
  _DWORD *v8;

  if (!result)
    return result;
  v1 = (_QWORD *)result[3];
  if (!v1)
    return 0;
  while (1)
  {
    v2 = (_DWORD *)v1[7];
    if (v2)
    {
      if (*v2 == 48)
        break;
    }
    v1 = (_QWORD *)v1[2];
    if (!v1)
      return 0;
  }
  result = (_QWORD *)v1[3];
  if (result)
  {
    while (1)
    {
      v3 = (int *)result[7];
      if (v3)
      {
        v4 = *v3;
        if (v4 == 16)
          return result;
        if (v4 == 39)
          break;
      }
      result = (_QWORD *)result[2];
      if (!result)
        return result;
    }
    v5 = (_QWORD *)result[3];
    if (v5)
    {
      while (1)
      {
        v6 = (_DWORD *)v5[7];
        if (v6)
        {
          if (*v6 == 71)
            break;
        }
        result = 0;
        v5 = (_QWORD *)v5[2];
        if (!v5)
          return result;
      }
      v7 = v5[3];
      if (v7)
      {
        while (1)
        {
          v8 = *(_DWORD **)(v7 + 56);
          if (v8)
          {
            if (*v8 == 16)
              break;
          }
          result = 0;
          v7 = *(_QWORD *)(v7 + 16);
          if (!v7)
            return result;
        }
        return (_QWORD *)v7;
      }
    }
    return 0;
  }
  return result;
}

uint64_t AddGenerator(_QWORD *a1)
{
  uint64_t result;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _DWORD *v11;
  _QWORD *v12;
  char *v13;
  _QWORD *v14;
  _QWORD *v15;
  char *v16;
  _BYTE *v17;
  char *v18;
  char v19[256];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  result = (uint64_t)FindHEAD(a1);
  if (result)
  {
    v3 = result;
    v4 = tidyReleaseDate();
    tmbsnprintf(v19, 256, "HTML Tidy for Mac OS X (vers %s), see www.w3.org", v5, v6, v7, v8, v9, v4);
    v10 = *(_QWORD *)(v3 + 24);
    if (v10)
    {
      while (1)
      {
        v11 = *(_DWORD **)(v10 + 56);
        if (v11)
        {
          if (*v11 == 67)
          {
            v12 = AttrGetById(v10, 79);
            if (v12)
            {
              v13 = (char *)v12[6];
              if (v13)
              {
                if (!tmbstrcasecmp(v13, "generator"))
                {
                  v14 = AttrGetById(v10, 35);
                  if (v14)
                  {
                    v15 = v14;
                    v16 = (char *)v14[6];
                    if (v16)
                    {
                      if (!tmbstrncasecmp(v16, "HTML Tidy", 9))
                        break;
                    }
                  }
                }
              }
            }
          }
        }
        v10 = *(_QWORD *)(v10 + 16);
        if (!v10)
          goto LABEL_14;
      }
      MemFree((void *)v15[6]);
      v17 = tmbstrdup(v19);
      result = 0;
      v15[6] = v17;
    }
    else
    {
LABEL_14:
      if (a1[93])
      {
        return 0;
      }
      else
      {
        v18 = InferredTag((uint64_t)a1, 67);
        AddAttribute((uint64_t)a1, (uint64_t)v18, "name", "generator");
        AddAttribute((uint64_t)a1, (uint64_t)v18, "content", v19);
        InsertNodeAtStart(v3, v18);
        return 1;
      }
    }
  }
  return result;
}

char *InferredTag(uint64_t a1, int a2)
{
  _QWORD *v3;
  char *v4;
  int *v5;
  _BYTE *v6;

  v3 = *(_QWORD **)(a1 + 104);
  v4 = NewNode(v3);
  v5 = LookupTagDef(a2);
  *((_DWORD *)v4 + 20) = 5;
  *((_DWORD *)v4 + 24) = 1;
  v6 = tmbstrdup(*((_BYTE **)v5 + 1));
  *((_QWORD *)v4 + 7) = v5;
  *((_QWORD *)v4 + 8) = v6;
  *((_QWORD *)v4 + 9) = v3[6];
  return v4;
}

uint64_t ApparentVersion(uint64_t a1)
{
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(a1 + 104);
  v2 = *(_DWORD *)(v1 + 36);
  if ((v2 == 4096 || v2 == 2048) && (*(_DWORD *)(v1 + 32) & v2) != 0)
    return *(unsigned int *)(v1 + 36);
  else
    return HTMLVersion(a1);
}

uint64_t HTMLVersionNameFromCode(int a1)
{
  uint64_t v1;

  v1 = 0;
  while (*(_DWORD *)((char *)&W3C_Doctypes + v1 + 4) != a1)
  {
    v1 += 32;
    if (v1 == 544)
      return 0;
  }
  return *(_QWORD *)((char *)&W3C_Doctypes + v1 + 8);
}

BOOL WarnMissingSIInEmittedDocType(uint64_t a1)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  unint64_t v4;
  int *v5;
  int v6;
  uint64_t v8;

  v1 = *(_QWORD *)(a1 + 104);
  if (*(_DWORD *)(v1 + 28))
    return 0;
  v2 = *(_DWORD *)(v1 + 40);
  v3 = 4u;
  while (*(_DWORD *)((char *)&W3C_Doctypes + v3) != v2)
  {
    v3 += 32;
    if (v3 == 548)
      return 0;
  }
  if (v3 == 548)
    return 0;
  v4 = -17;
  v5 = &dword_24C37AD5C;
  while (1)
  {
    v6 = *v5;
    v5 += 8;
    if (v6 == v2)
      break;
    if (__CFADD__(v4++, 1))
      return 0;
  }
  if (v4 < 0xFFFFFFFFFFFFFFF5)
    return 0;
  if (!a1)
    return 0;
  v8 = *(_QWORD *)(a1 + 24);
  if (!v8)
    return 0;
  while (*(_DWORD *)(v8 + 80) != 1)
  {
    v8 = *(_QWORD *)(v8 + 16);
    if (!v8)
      return 0;
  }
  return !GetAttrByName(v8, "SYSTEM");
}

uint64_t SetXHTMLDocType(uint64_t a1)
{
  _DWORD *v2;
  _DWORD *i;
  int v4;
  uint64_t result;
  _BYTE *v6;
  int v7;
  int v8;
  int v9;

  v2 = *(_DWORD **)(a1 + 104);
  for (i = *(_DWORD **)(a1 + 24); i; i = (_DWORD *)*((_QWORD *)i + 2))
  {
    if (i[20] == 1)
      break;
  }
  v4 = *(_DWORD *)(a1 + 176);
  v2[10] = ApparentVersion(a1);
  if (v4 == 4)
  {
    if (!*(_QWORD *)(a1 + 184))
      return 0;
    goto LABEL_10;
  }
  if (v4)
  {
LABEL_10:
    if (i)
    {
      v6 = tmbstrtolower(*((_BYTE **)i + 8));
    }
    else
    {
      i = NewDocTypeNode(a1);
      v6 = tmbstrdup("html");
    }
    *((_QWORD *)i + 8) = v6;
    switch(v4)
    {
      case 1:
        v7 = v2[8];
        if ((v7 & 0x800) == 0)
          goto LABEL_22;
        if (v2[9] == 2048)
        {
          if (!GetAttrByName((uint64_t)i, "SYSTEM"))
            RepairAttrValue(a1, (uint64_t)i, "SYSTEM", "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd");
          v8 = 2048;
LABEL_27:
          v2[10] = v8;
          return 1;
        }
        if ((v7 & 0x7FC) == 0)
        {
          RepairAttrValue(a1, (uint64_t)i, "PUBLIC", "-//W3C//DTD XHTML 1.1//EN");
          RepairAttrValue(a1, (uint64_t)i, "SYSTEM", "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd");
          result = 0;
          v9 = 2048;
          goto LABEL_35;
        }
LABEL_22:
        if ((v7 & 0x1000) != 0 && v2[9] == 4096)
        {
          if (!GetAttrByName((uint64_t)i, "SYSTEM"))
            RepairAttrValue(a1, (uint64_t)i, "SYSTEM", "http://www.w3.org/TR/xhtml-basic/xhtml-basic10.dtd");
          v8 = 4096;
          goto LABEL_27;
        }
        if ((v7 & 0x124) != 0)
        {
LABEL_29:
          RepairAttrValue(a1, (uint64_t)i, "PUBLIC", "-//W3C//DTD XHTML 1.0 Strict//EN");
          RepairAttrValue(a1, (uint64_t)i, "SYSTEM", "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd");
          result = 0;
          v9 = 256;
LABEL_35:
          v2[10] = v9;
          return result;
        }
        if ((v7 & 0x490) != 0)
        {
          RepairAttrValue(a1, (uint64_t)i, "PUBLIC", "-//W3C//DTD XHTML 1.0 Frameset//EN");
          RepairAttrValue(a1, (uint64_t)i, "SYSTEM", "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd");
          result = 0;
          v9 = 1024;
          goto LABEL_35;
        }
        if ((v7 & 0x6DB) != 0)
        {
LABEL_34:
          RepairAttrValue(a1, (uint64_t)i, "PUBLIC", "-//W3C//DTD XHTML 1.0 Transitional//EN");
          RepairAttrValue(a1, (uint64_t)i, "SYSTEM", "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd");
          result = 0;
          v9 = 512;
          goto LABEL_35;
        }
        DiscardElement(a1, (uint64_t *)i);
        break;
      case 2:
        goto LABEL_29;
      case 3:
        goto LABEL_34;
      case 4:
        RepairAttrValue(a1, (uint64_t)i, "PUBLIC", *(_BYTE **)(a1 + 184));
        RepairAttrValue(a1, (uint64_t)i, "SYSTEM", &unk_20AB66763);
        return 0;
      default:
        return 0;
    }
    return 0;
  }
  if (i)
    DiscardElement(a1, (uint64_t *)i);
  return 1;
}

_DWORD *NewDocTypeNode(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v3;

  if (!a1)
    return 0;
  v1 = *(_QWORD *)(a1 + 24);
  if (!v1)
    return 0;
  while (1)
  {
    v2 = *(_DWORD **)(v1 + 56);
    if (v2)
    {
      if (*v2 == 48)
        break;
    }
    v1 = *(_QWORD *)(v1 + 16);
    if (!v1)
      return 0;
  }
  v3 = MemAlloc(0x68uLL);
  ClearMemory(v3, 0x68uLL);
  v3[20] = 1;
  InsertNodeBeforeElement((__int128 *)v1, (uint64_t)v3);
  return v3;
}

uint64_t FixDocType(uint64_t a1)
{
  _DWORD *v2;
  uint64_t v3;
  _DWORD *v4;
  int v5;
  int v6;
  _BOOL4 v8;
  uint64_t result;
  int v10;
  _BYTE *v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  _BYTE *v15;

  v2 = *(_DWORD **)(a1 + 104);
  v3 = *(_QWORD *)(a1 + 24);
  if (v3)
  {
    v4 = *(_DWORD **)(a1 + 24);
    do
    {
      if (v4[20] == 1)
        break;
      v4 = (_DWORD *)*((_QWORD *)v4 + 2);
    }
    while (v4);
  }
  else
  {
    v4 = 0;
  }
  v5 = *(_DWORD *)(a1 + 176);
  if (!v5)
  {
    if (v4)
      DiscardElement(a1, (uint64_t *)v4);
    v2[10] = ApparentVersion(a1);
    return 1;
  }
  if (v5 == 1)
  {
    v6 = v2[9];
    if ((v6 & v2[8]) != 0)
    {
      if ((v6 & 0x1F00) == 0)
        goto LABEL_49;
      if (v2[7] && v3 != 0)
      {
        while (*(_DWORD *)(v3 + 80) != 1)
        {
          v3 = *(_QWORD *)(v3 + 16);
LABEL_49:
          if (!v3)
            goto LABEL_16;
        }
        v2[10] = v6;
        return 1;
      }
    }
  }
LABEL_16:
  if (*(_DWORD *)(a1 + 288))
    return 1;
  if (v4)
  {
    v8 = GetAttrByName((uint64_t)v4, "SYSTEM") != 0;
    if ((v5 & 0xFFFFFFFE) == 2)
    {
      DiscardElement(a1, (uint64_t *)v4);
      v4 = 0;
    }
  }
  else
  {
    v8 = 0;
  }
  if (v5 != 1)
  {
    if (v5 == 2)
    {
      v10 = 32;
    }
    else
    {
      if (v5 != 3)
      {
        result = 0;
        v2[10] = 0;
        return result;
      }
      v10 = 64;
    }
    v2[10] = v10;
    if (!v4)
      goto LABEL_35;
    goto LABEL_32;
  }
  result = HTMLVersion(a1);
  v10 = result;
  v2[10] = result;
  if ((_DWORD)result)
  {
    if (!v4)
    {
LABEL_35:
      v4 = NewDocTypeNode(a1);
      v11 = tmbstrdup("html");
LABEL_36:
      *((_QWORD *)v4 + 8) = v11;
      v12 = 0;
      while (*(_DWORD *)((char *)&W3C_Doctypes + v12 + 4) != v10)
      {
        v12 += 32;
        if (v12 == 544)
        {
          v13 = 0;
          goto LABEL_41;
        }
      }
      v13 = *(_BYTE **)((char *)&W3C_Doctypes + v12 + 16);
LABEL_41:
      RepairAttrValue(a1, (uint64_t)v4, "PUBLIC", v13);
      if (v8)
      {
        v14 = 0;
        while (*(_DWORD *)((char *)&W3C_Doctypes + v14 + 4) != v10)
        {
          v14 += 32;
          if (v14 == 544)
          {
            v15 = 0;
            goto LABEL_48;
          }
        }
        v15 = *(_BYTE **)((char *)&W3C_Doctypes + v14 + 24);
LABEL_48:
        RepairAttrValue(a1, (uint64_t)v4, "SYSTEM", v15);
      }
      return 1;
    }
LABEL_32:
    v11 = tmbstrtolower(*((_BYTE **)v4 + 8));
    goto LABEL_36;
  }
  return result;
}

uint64_t FixXmlDecl(_QWORD *a1)
{
  _QWORD *v2;
  char *v3;
  __int128 *v4;
  _QWORD *AttrByName;
  uint64_t v6;
  _BYTE *EncodingNameFromTidyId;

  v2 = (_QWORD *)a1[13];
  v3 = (char *)a1[3];
  if (!v3 || *((_DWORD *)v3 + 20) != 13)
  {
    v3 = NewNode(v2);
    *((_DWORD *)v3 + 20) = 13;
    v4 = (__int128 *)a1[3];
    if (v4)
      InsertNodeBeforeElement(v4, (uint64_t)v3);
    else
      a1[3] = v3;
  }
  AttrByName = GetAttrByName((uint64_t)v3, "version");
  if (!GetAttrByName((uint64_t)v3, "encoding"))
  {
    v6 = a1[20];
    if (v6 != 4)
    {
      EncodingNameFromTidyId = (_BYTE *)GetEncodingNameFromTidyId(v6);
      if (EncodingNameFromTidyId)
        AddAttribute((uint64_t)a1, (uint64_t)v3, "encoding", EncodingNameFromTidyId);
    }
  }
  if (!AttrByName)
    AddAttribute((uint64_t)a1, (uint64_t)v3, "version", "1.0");
  return 1;
}

uint64_t UngetToken(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(result + 104) + 12) = 1;
  return result;
}

char *GetToken(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  _QWORD *v14;
  int32x2_t *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int v24;
  unsigned int v25;
  int v26;
  int v27;
  unsigned int v28;
  _BOOL4 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unsigned int v53;
  char *v54;
  char *v55;
  _BYTE *v56;
  int v57;
  char *v58;
  char *v59;
  _BYTE *v60;
  int v61;
  uint64_t v62;
  uint64_t v63;
  unsigned int v64;
  uint64_t v65;
  _DWORD *v66;
  int32x2_t *v67;
  int v68;
  int Char;
  uint64_t v70;
  void *v71;
  int v72;
  _DWORD *v73;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  int v82;
  int v83;
  uint64_t v84;
  uint64_t v85;
  int v86;
  int v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  int v95;
  unsigned int v96;
  unsigned int v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  int v106;
  uint64_t v107;
  unsigned int v108;
  uint64_t v109;
  uint64_t v110;
  _QWORD *v111;
  _DWORD *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  _BYTE *v117;
  uint64_t v118;
  void *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  _QWORD *v123;
  _QWORD *v124;
  void *v125;
  int v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  void *v134;
  unsigned int v135;
  int v136;
  int v137;
  int v138;
  int v139;
  uint64_t v140;
  int v141;
  unsigned int v142;
  void *v143;
  unsigned int v144;
  int v145;
  int v146;
  int v147;
  unsigned int v148;
  unsigned int v149;
  uint64_t v150;
  int v151;
  uint64_t v152;
  unsigned int v153;
  _QWORD *v154;
  char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  void *v163;
  char v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  int v172;
  int v173;
  _DWORD *v174;
  uint64_t v175;
  int v176;
  char *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  unsigned int v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  unsigned int v193;
  unsigned int v194;
  int v195;
  uint64_t v197;
  int v198;
  int v199;
  uint64_t v200;
  uint64_t v201;
  int v202;
  _BYTE *v203;
  char *v204;
  _DWORD *v205;
  int v206;
  char *v207;
  char *v208;
  int v209;
  _QWORD *AttrByName;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  unsigned int j;
  uint64_t v215;
  _QWORD *v216;
  uint64_t v217;
  _QWORD *v218;
  unsigned int v219;
  _QWORD *v220;
  int v221;
  unsigned int v222;
  unsigned int v223;
  int v224;
  char *v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  _QWORD *v233;
  int v234;
  uint64_t v235;
  int *v236;
  int v237;
  void *v239;
  unsigned int v240;
  int v241;
  uint64_t v242;
  int v243;
  uint64_t v244;
  uint64_t v245;
  unsigned int i;
  uint64_t v247;
  int *v248;
  int v249;
  int v250;
  int *v251;
  int v252;
  int v253;
  unsigned int v254;
  _QWORD *v255;
  uint64_t v256;
  uint64_t v258;
  int v259;
  _BOOL4 v260;
  _QWORD *v261;
  char *v262;
  _BYTE *v263;
  char v264;
  _BOOL4 v265;
  uint64_t v266;
  int v267;
  uint64_t v268;
  char *v269;
  int v270;

  v9 = *(_QWORD *)(a1 + 104);
  v10 = *(char **)(v9 + 72);
  if (*(_DWORD *)(v9 + 12))
  {
    if (v10)
    {
      *(_DWORD *)(v9 + 12) = 0;
      return v10;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    *(_QWORD *)(v9 + 72) = 0;
LABEL_6:
    *(_DWORD *)(v9 + 12) = 0;
    v10 = *(char **)(v9 + 64);
    if (*((_DWORD *)v10 + 20) == 4 && (*(_QWORD *)(v9 + 128) || *(_QWORD *)(v9 + 120)))
    {
      v10 = InsertedToken(a1);
      *(_QWORD *)(v9 + 72) = v10;
    }
    return v10;
  }
  v11 = a2;
  if ((*(_QWORD *)(v9 + 128) || *(_QWORD *)(v9 + 120)) && *(_DWORD *)(v9 + 148))
  {
    v12 = InsertedToken(a1);
    v10 = v12;
    goto LABEL_14;
  }
  if ((_DWORD)a2 != 4)
  {
    v270 = 0;
    *(_QWORD *)(v9 + 64) = 0;
    v67 = *(int32x2_t **)(a1 + 4832);
    *(int32x2_t *)v9 = vrev64_s32(v67[4]);
    *(_DWORD *)(v9 + 8) = 0;
    v68 = *(_DWORD *)(v9 + 116);
    *(_DWORD *)(v9 + 48) = v68;
    *(_DWORD *)(v9 + 52) = v68;
    Char = ReadChar((uint64_t)v67, a2, a3, a4, a5, a6, a7, a8);
    if (Char == -1)
    {
LABEL_231:
      v147 = *(_DWORD *)(v9 + 56);
      if (v147 == 4)
      {
        ReportError(a1, 0, 0, 29);
        v152 = *(unsigned int *)(v9 + 116);
        *(_DWORD *)(v9 + 52) = v152;
        *(_BYTE *)(*(_QWORD *)(v9 + 104) + v152) = 0;
        *(_DWORD *)(v9 + 56) = 0;
        *(_DWORD *)(v9 + 8) = 0;
        v220 = *(_QWORD **)(a1 + 104);
        v12 = NewNode(v220);
        v10 = v12;
        v221 = 2;
        goto LABEL_245;
      }
      if (v147)
        return 0;
      v148 = *(_DWORD *)(v9 + 116);
      *(_DWORD *)(v9 + 52) = v148;
      if (v148 <= *(_DWORD *)(v9 + 48))
        return 0;
      UngetChar((void *)0xFFFFFFFFLL, *(_QWORD *)(a1 + 4832));
LABEL_235:
      v149 = *(_DWORD *)(v9 + 116) - 1;
      if (*(_BYTE *)(*(_QWORD *)(v9 + 104) + v149) == 32)
      {
        *(_DWORD *)(v9 + 116) = v149;
        *(_DWORD *)(v9 + 52) = v149;
      }
LABEL_237:
      v12 = NewNode((_QWORD *)v9);
      v10 = v12;
      v150 = *(_QWORD *)(v9 + 48);
      goto LABEL_246;
    }
    LODWORD(v70) = Char;
    v71 = 0;
    v72 = 0;
    v73 = lexmap;
    while (2)
    {
      if (*(_DWORD *)(v9 + 16))
      {
        AddCharToLexer(v9, 0x20u);
        *(_DWORD *)(v9 + 8) = 1;
        *(_DWORD *)(v9 + 16) = 0;
      }
      if ((_DWORD)v11 == 2 && (_DWORD)v70 == 160)
        v70 = 32;
      else
        v70 = v70;
      AddCharToLexer(v9, v70);
      switch(*(_DWORD *)(v9 + 56))
      {
        case 0:
          if (v70 > 0x7F)
            goto LABEL_170;
          v82 = v73[v70];
          if ((v82 & 8) != 0 && !(_DWORD)v11)
          {
            v83 = *(_DWORD *)(v9 + 116);
            if (v83 == *(_DWORD *)(v9 + 48) + 1)
            {
              v11 = 0;
              *(_DWORD *)(v9 + 116) = v83 - 1;
              *(_DWORD *)(v9 + 8) = 0;
LABEL_84:
              *(int32x2_t *)v9 = vrev64_s32(*(int32x2_t *)(*(_QWORD *)(a1 + 4832) + 32));
              goto LABEL_194;
            }
          }
          if ((_DWORD)v70 == 60)
          {
            v126 = 1;
LABEL_177:
            *(_DWORD *)(v9 + 56) = v126;
            goto LABEL_194;
          }
          if ((v82 & 8) == 0)
          {
            if ((_DWORD)v70 == 38 && (_DWORD)v11 != 3)
              ParseEntity(a1, v11, v76, v77, v78, v79, v80, v81);
LABEL_170:
            if (v11 <= 1)
              v11 = 1;
            else
              v11 = v11;
            goto LABEL_173;
          }
          if (*(_DWORD *)(v9 + 8))
          {
            if ((v11 - 4) <= 0xFFFFFFFD)
            {
              --*(_DWORD *)(v9 + 116);
              goto LABEL_84;
            }
          }
          else
          {
            *(_DWORD *)(v9 + 8) = 1;
            if ((v11 - 4) <= 0xFFFFFFFD && (_DWORD)v70 != 32)
            {
              v138 = *(_DWORD *)(v9 + 116);
              if (v138)
                *(_BYTE *)(*(_QWORD *)(v9 + 104) + (v138 - 1)) = 32;
            }
          }
          goto LABEL_194;
        case 1:
          if ((_DWORD)v70 == 47)
          {
            v84 = ReadChar(*(_QWORD *)(a1 + 4832), v75, v76, v77, v78, v79, v80, v81);
            if ((_DWORD)v84 == -1)
            {
LABEL_159:
              v133 = *(_QWORD *)(a1 + 4832);
LABEL_160:
              UngetChar((void *)v84, v133);
            }
            else
            {
              v85 = v84;
              AddCharToLexer(v9, v84);
              if (v85 > 0x7F || (v73[v85] & 2) == 0)
              {
LABEL_150:
                *(_DWORD *)(v9 + 8) = 0;
LABEL_151:
                *(_DWORD *)(v9 + 56) = 0;
                goto LABEL_194;
              }
              v86 = *(_DWORD *)(v9 + 116) - 3;
              *(_DWORD *)(v9 + 116) = v86;
              *(_DWORD *)(v9 + 52) = v86;
              UngetChar((void *)v85, *(_QWORD *)(a1 + 4832));
              *(_DWORD *)(v9 + 56) = 2;
              *(_BYTE *)(*(_QWORD *)(v9 + 104) + *(unsigned int *)(v9 + 116)) = 0;
              *(_DWORD *)(*(_QWORD *)(a1 + 4832) + 32) -= 2;
              if (*(_DWORD *)(v9 + 52) > *(_DWORD *)(v9 + 48))
              {
                if (!(_DWORD)v11)
                  goto LABEL_235;
                goto LABEL_237;
              }
            }
          }
          else
          {
            if ((_DWORD)v11 == 3)
              goto LABEL_150;
            if ((int)v70 > 36)
            {
              if ((_DWORD)v70 == 37)
              {
                v135 = *(_DWORD *)(v9 + 116) - 2;
                *(_DWORD *)(v9 + 116) = v135;
                v136 = 10;
                goto LABEL_191;
              }
              if ((_DWORD)v70 == 63)
              {
                v135 = *(_DWORD *)(v9 + 116) - 2;
                *(_DWORD *)(v9 + 116) = v135;
                *(_DWORD *)(v9 + 56) = 6;
LABEL_192:
                *(_DWORD *)(v9 + 52) = v135;
                if (v135 > *(_DWORD *)(v9 + 48))
                  goto LABEL_237;
LABEL_193:
                *(_DWORD *)(v9 + 48) = v135;
                goto LABEL_194;
              }
            }
            else
            {
              if ((_DWORD)v70 == 33)
              {
                v137 = ReadChar(*(_QWORD *)(a1 + 4832), v75, v76, v77, v78, v79, v80, v81);
                if (v137 == 45)
                {
                  if (ReadChar(*(_QWORD *)(a1 + 4832), v75, v76, v77, v78, v79, v80, v81) != 45)
                  {
                    ReportError(a1, 0, 0, 29);
                    goto LABEL_224;
                  }
                  v135 = *(_DWORD *)(v9 + 116) - 2;
                  *(_DWORD *)(v9 + 116) = v135;
                  v136 = 4;
                  goto LABEL_191;
                }
                if ((v137 & 0xFFFFFFDF) == 0x44)
                {
                  v139 = *(_DWORD *)(v9 + 116) - 2;
                  *(_DWORD *)(v9 + 116) = v139;
                  *(_DWORD *)(v9 + 52) = v139;
                  *(_DWORD *)(v9 + 56) = 5;
                  do
                  {
                    v140 = ReadChar(*(_QWORD *)(a1 + 4832), v75, v76, v77, v78, v79, v80, v81);
                    if ((_DWORD)v140 == -1 || (_DWORD)v140 == 62)
                      goto LABEL_217;
                    if (v140 > 0x7F)
                      v141 = 0;
                    else
                      v141 = (v73[v140] >> 3) & 1;
                  }
                  while (!v141);
                  do
                    v140 = ReadChar(*(_QWORD *)(a1 + 4832), v75, v76, v77, v78, v79, v80, v81);
                  while ((_DWORD)v140 != -1
                       && (_DWORD)v140 != 62
                       && v140 <= 0x7F
                       && (v73[v140] & 8) != 0);
LABEL_217:
                  UngetChar((void *)v140, *(_QWORD *)(a1 + 4832));
                  if (*(_DWORD *)(v9 + 52) > *(_DWORD *)(v9 + 48))
                    goto LABEL_237;
                  v11 = 0;
                  v135 = *(_DWORD *)(v9 + 116);
                  goto LABEL_193;
                }
                if (v137 == 91)
                {
                  v135 = *(_DWORD *)(v9 + 116) - 2;
                  *(_DWORD *)(v9 + 116) = v135;
                  v136 = 9;
LABEL_191:
                  *(_DWORD *)(v9 + 56) = v136;
                  goto LABEL_192;
                }
                do
                {
LABEL_224:
                  v143 = (void *)ReadChar(*(_QWORD *)(a1 + 4832), v75, v76, v77, v78, v79, v80, v81);
                  if ((_DWORD)v143 == 62)
                    goto LABEL_227;
                }
                while ((_DWORD)v143 != -1);
                UngetChar(v143, *(_QWORD *)(a1 + 4832));
LABEL_227:
                v144 = *(_DWORD *)(v9 + 116) - 2;
                *(_DWORD *)(v9 + 116) = v144;
                *(_BYTE *)(*(_QWORD *)(v9 + 104) + v144) = 0;
                goto LABEL_151;
              }
              if ((_DWORD)v70 == 35)
              {
                v135 = *(_DWORD *)(v9 + 116) - 2;
                *(_DWORD *)(v9 + 116) = v135;
                v136 = 11;
                goto LABEL_191;
              }
            }
            if (v70 > 0x7F)
              goto LABEL_200;
            if ((v73[v70] & 2) == 0)
            {
              if ((_DWORD)v70 == 38)
              {
                UngetChar((void *)0x26, *(_QWORD *)(a1 + 4832));
                --*(_DWORD *)(v9 + 116);
              }
LABEL_200:
              *(_DWORD *)(v9 + 56) = 0;
LABEL_173:
              *(_DWORD *)(v9 + 8) = 0;
              goto LABEL_194;
            }
            UngetChar((void *)v70, *(_QWORD *)(a1 + 4832));
            UngetChar((void *)0x3C, *(_QWORD *)(a1 + 4832));
            --*(_DWORD *)(*(_QWORD *)(a1 + 4832) + 32);
            v142 = *(_DWORD *)(v9 + 116) - 2;
            *(_DWORD *)(v9 + 116) = v142;
            *(_DWORD *)(v9 + 52) = v142;
            *(_DWORD *)(v9 + 56) = 3;
            if (v142 > *(_DWORD *)(v9 + 48))
              goto LABEL_237;
          }
LABEL_194:
          LODWORD(v70) = ReadChar(*(_QWORD *)(a1 + 4832), v75, v76, v77, v78, v79, v80, v81);
          if ((_DWORD)v70 == -1)
            goto LABEL_231;
          continue;
        case 2:
          *(_DWORD *)(v9 + 48) = *(_DWORD *)(v9 + 116) - 1;
          *(_DWORD *)(*(_QWORD *)(a1 + 4832) + 32) += 2;
          v87 = ParseTagName(a1, v75, v76, v77, v78, v79, v80, v81);
          *(_QWORD *)(v9 + 64) = TagToken(a1, 6);
          v95 = *(_DWORD *)(v9 + 48);
          *(_DWORD *)(v9 + 52) = v95;
          *(_DWORD *)(v9 + 116) = v95;
          while (2)
          {
            if (v87 != -1)
            {
              if (v87 != 62)
              {
                v87 = ReadChar(*(_QWORD *)(a1 + 4832), v88, v89, v90, v91, v92, v93, v94);
                continue;
              }
              *(_DWORD *)(v9 + 56) = 0;
              *(_DWORD *)(v9 + 8) = 0;
              return *(char **)(v9 + 64);
            }
            break;
          }
          FreeNode(a1, *(_QWORD *)(v9 + 64));
          goto LABEL_194;
        case 3:
          v164 = ReadChar(*(_QWORD *)(a1 + 4832), v75, v76, v77, v78, v79, v80, v81);
          v172 = *(_DWORD *)(v9 + 116);
          if (v172)
          {
            *(_BYTE *)(*(_QWORD *)(v9 + 104) + (v172 - 1)) = v164;
            v173 = *(_DWORD *)(v9 + 116) - 1;
          }
          else
          {
            v173 = -1;
          }
          *(_DWORD *)(v9 + 48) = v173;
          v224 = ParseTagName(a1, v165, v166, v167, v168, v169, v170, v171);
          v270 = 0;
          v225 = TagToken(a1, 5);
          *(_QWORD *)(v9 + 64) = v225;
          if (v224 == 62)
          {
            v233 = 0;
          }
          else
          {
            if (v224 == 47)
              UngetChar((void *)0x2F, *(_QWORD *)(a1 + 4832));
            v233 = ParseAttrs(a1, &v270, v227, v228, v229, v230, v231, v232);
            v225 = *(char **)(v9 + 64);
            if (v270)
              *((_DWORD *)v225 + 20) = 7;
          }
          *((_QWORD *)v225 + 5) = v233;
          v234 = *(_DWORD *)(v9 + 48);
          *(_DWORD *)(v9 + 52) = v234;
          *(_DWORD *)(v9 + 116) = v234;
          if ((_DWORD)v11 != 2 && *((_DWORD *)v225 + 20) == 5)
          {
            v235 = *((_QWORD *)v225 + 7);
            if (!v235 || (*(_BYTE *)(v235 + 32) & 1) == 0)
              goto LABEL_346;
          }
          v236 = (int *)*((_QWORD *)v225 + 7);
          if (v236)
          {
            v237 = *v236;
            if (v237 == 47 || v237 == 17)
            {
LABEL_346:
              v239 = (void *)ReadChar(*(_QWORD *)(a1 + 4832), v226, v227, v228, v229, v230, v231, v232);
              LODWORD(v236) = 1;
              if ((_DWORD)v239 != 10 && (_DWORD)v239 != 12)
              {
                UngetChar(v239, *(_QWORD *)(a1 + 4832));
                LODWORD(v236) = 1;
              }
            }
            else
            {
              LODWORD(v236) = 0;
            }
          }
          *(_DWORD *)(v9 + 8) = (_DWORD)v236;
          *(_DWORD *)(v9 + 56) = 0;
          v247 = *(_QWORD *)(v9 + 64);
          v248 = *(int **)(v247 + 56);
          if (!v248)
          {
            ReportFatal(a1, 0, *(_QWORD *)(v9 + 64), 22, v229, v230, v231, v232, v264);
            return *(char **)(v9 + 64);
          }
          if (*(_DWORD *)(a1 + 280))
            return *(char **)(v9 + 64);
          v249 = v248[4];
          *(_DWORD *)(*(_QWORD *)(a1 + 104) + 32) &= v249 | 0xE000;
          if ((v249 & 0xE000) == 0)
            goto LABEL_392;
          if (*(_DWORD *)(a1 + 344))
          {
            v250 = *v248;
            if (v250 == 69 || v250 == 117)
              goto LABEL_392;
          }
          ReportError(a1, 0, v247, 21);
          v251 = *(int **)(v247 + 56);
          if (!v251)
            goto LABEL_392;
          v252 = *v251;
          switch(v252)
          {
            case ';':
              v253 = 2;
              break;
            case 'E':
              v253 = 4;
              break;
            case 'a':
              v253 = 1;
              break;
            default:
              goto LABEL_392;
          }
          *(_DWORD *)(a1 + 4904) |= v253;
LABEL_392:
          RepairDuplicateAttributes(a1, v247);
          return *(char **)(v9 + 64);
        case 4:
          if ((_DWORD)v70 != 45)
            goto LABEL_194;
          v96 = ReadChar(*(_QWORD *)(a1 + 4832), v75, v76, v77, v78, v79, v80, v81);
          AddCharToLexer(v9, v96);
          if (v96 != 45)
            goto LABEL_194;
          v97 = ReadChar(*(_QWORD *)(a1 + 4832), v75, v76, v77, v78, v79, v80, v81);
          if (v97 == 62)
            goto LABEL_247;
          while (1)
          {
            if (!v72)
            {
              v98 = *(_QWORD *)(a1 + 4832);
              *(_DWORD *)v9 = *(_DWORD *)(v98 + 36);
              *(_DWORD *)(v9 + 4) = *(_DWORD *)(v98 + 32) - 3;
            }
            if (*(_DWORD *)(a1 + 384))
              *(_BYTE *)(*(_QWORD *)(v9 + 104) + (*(_DWORD *)(v9 + 116) - 2)) = 61;
            ++v72;
            if (v97 != 45)
              break;
            AddCharToLexer(v9, 0x2Du);
            v97 = ReadChar(*(_QWORD *)(a1 + 4832), v99, v100, v101, v102, v103, v104, v105);
            if (v97 == 62)
            {
LABEL_247:
              if (v72)
                ReportError(a1, 0, 0, 29);
              v153 = *(_DWORD *)(v9 + 116) - 2;
              *(_DWORD *)(v9 + 116) = v153;
              *(_DWORD *)(v9 + 52) = v153;
              *(_BYTE *)(*(_QWORD *)(v9 + 104) + v153) = 0;
              *(_DWORD *)(v9 + 56) = 0;
              *(_DWORD *)(v9 + 8) = 0;
              v154 = *(_QWORD **)(a1 + 104);
              v155 = NewNode(v154);
              *((_DWORD *)v155 + 20) = 2;
              *((_QWORD *)v155 + 9) = v154[6];
              *(_QWORD *)(v9 + 64) = v155;
              v163 = (void *)ReadChar(*(_QWORD *)(a1 + 4832), v156, v157, v158, v159, v160, v161, v162);
              if ((_DWORD)v163 == 10)
              {
                v10 = *(char **)(v9 + 64);
                *((_DWORD *)v10 + 25) = 1;
                return v10;
              }
              UngetChar(v163, *(_QWORD *)(a1 + 4832));
              return *(char **)(v9 + 64);
            }
          }
          *(_BYTE *)(*(_QWORD *)(v9 + 104) + (*(_DWORD *)(v9 + 116) - 1)) = 61;
          AddCharToLexer(v9, v97);
          goto LABEL_194;
        case 5:
          v174 = v73;
          UngetChar((void *)v70, *(_QWORD *)(a1 + 4832));
          --*(_DWORD *)(v9 + 116);
          v175 = *(_QWORD *)(a1 + 104);
          v176 = *(_DWORD *)(v175 + 116);
          v177 = NewNode((_QWORD *)v175);
          *((_DWORD *)v177 + 20) = 1;
          v266 = (uint64_t)v177;
          *((_QWORD *)v177 + 9) = *(_QWORD *)(v175 + 48);
          *(_DWORD *)(v175 + 8) = 0;
          v185 = ReadChar(*(_QWORD *)(a1 + 4832), v178, v179, v180, v181, v182, v183, v184);
          if (v185 == -1)
            goto LABEL_318;
          v193 = v185;
          v194 = 0;
          v195 = 1;
          v265 = 1;
          break;
        case 6:
          v106 = *(_DWORD *)(v9 + 116);
          v107 = *(unsigned int *)(v9 + 48);
          if (v106 - (_DWORD)v107 != 3)
            goto LABEL_108;
          if (!tmbstrncmp((unsigned __int8 *)(*(_QWORD *)(v9 + 104) + v107), "php", 3))
          {
            v126 = 12;
            goto LABEL_177;
          }
          v106 = *(_DWORD *)(v9 + 116);
          LODWORD(v107) = *(_DWORD *)(v9 + 48);
LABEL_108:
          if (v106 - (_DWORD)v107 == 4
            && !tmbstrncmp((unsigned __int8 *)(*(_QWORD *)(v9 + 104) + v107), "xml", 3)
            && (*(char *)(*(_QWORD *)(v9 + 104) + (*(_DWORD *)(v9 + 48) + 3)) & 0x80000000) == 0
            && (v73[*(unsigned __int8 *)(*(_QWORD *)(v9 + 104) + (*(_DWORD *)(v9 + 48) + 3))] & 8) != 0)
          {
            v71 = 0;
            v126 = 13;
            goto LABEL_177;
          }
          if (!*(_DWORD *)(a1 + 504) && !*(_DWORD *)(v9 + 28))
            goto LABEL_115;
          if ((_DWORD)v70 != 63)
            goto LABEL_194;
          v108 = ReadChar(*(_QWORD *)(a1 + 4832), v75, v76, v77, v78, v79, v80, v81);
          if (v108 != -1)
          {
            LODWORD(v70) = v108;
            AddCharToLexer(v9, v108);
LABEL_115:
            if ((_DWORD)v70 == 62)
            {
              v241 = *(_DWORD *)(v9 + 116);
              v242 = (v241 - 1);
              *(_DWORD *)(v9 + 116) = v242;
              if (v241 == 1)
              {
                *(_DWORD *)(v9 + 52) = 0;
                **(_BYTE **)(v9 + 104) = 0;
                v255 = *(_QWORD **)(a1 + 104);
                v10 = NewNode(v255);
                *((_DWORD *)v10 + 20) = 3;
                *((_QWORD *)v10 + 9) = v255[6];
                *(_QWORD *)(v9 + 64) = v10;
              }
              else
              {
                v243 = *(_DWORD *)(v9 + 48);
                v244 = *(_QWORD *)(v9 + 104);
                if ((_DWORD)v242 == v243)
                {
                  LODWORD(v245) = 0;
                }
                else
                {
                  v256 = 0;
                  if ((v242 - v243) <= 1)
                    v245 = 1;
                  else
                    v245 = (v242 - v243);
                  while (*(char *)(v244 + (v243 + v256)) < 0
                       || (v73[*(unsigned __int8 *)(v244 + (v243 + v256))] & 8) == 0)
                  {
                    if (v245 == ++v256)
                      goto LABEL_384;
                  }
                  LODWORD(v245) = v256;
                }
LABEL_384:
                v258 = (v241 - 2);
                v259 = *(unsigned __int8 *)(v244 + v258);
                v260 = v259 == 63;
                if (v259 == 63)
                {
                  *(_DWORD *)(v9 + 116) = v258;
                  v242 = v258;
                }
                else
                {
                  LODWORD(v258) = v242;
                }
                *(_DWORD *)(v9 + 48) = v245 + v243;
                *(_DWORD *)(v9 + 52) = v258;
                *(_BYTE *)(v244 + v242) = 0;
                v261 = *(_QWORD **)(a1 + 104);
                v262 = NewNode(v261);
                *((_DWORD *)v262 + 20) = 3;
                *((_QWORD *)v262 + 9) = v261[6];
                *(_QWORD *)(v9 + 64) = v262;
                *((_DWORD *)v262 + 23) = v260;
                v263 = tmbstrndup(*(_QWORD *)(v9 + 104) + *(unsigned int *)(v9 + 48) - v245, v245);
                v10 = *(char **)(v9 + 64);
                *((_QWORD *)v10 + 8) = v263;
              }
              *(_DWORD *)(v9 + 56) = 0;
              *(_DWORD *)(v9 + 8) = 0;
              return v10;
            }
            goto LABEL_194;
          }
          ReportError(a1, 0, 0, 36);
          v133 = *(_QWORD *)(a1 + 4832);
          v84 = 0xFFFFFFFFLL;
          goto LABEL_160;
        case 8:
          if ((_DWORD)v70 != 93)
          {
            if ((_DWORD)v70 == 38 && !*(_QWORD *)(a1 + 160) && *(_DWORD *)(a1 + 664))
            {
              v109 = 0;
              LODWORD(v75) = 97;
              do
              {
                AddCharToLexer(v9, v75);
                v75 = aAmp_0[++v109];
              }
              while (v109 != 4);
            }
            goto LABEL_194;
          }
          v84 = ReadChar(*(_QWORD *)(a1 + 4832), v75, v76, v77, v78, v79, v80, v81);
          v133 = *(_QWORD *)(a1 + 4832);
          if ((_DWORD)v84 == 93)
          {
            v134 = (void *)ReadChar(*(_QWORD *)(a1 + 4832), v133, v127, v128, v129, v130, v131, v132);
            if ((_DWORD)v134 == 62)
            {
              v254 = *(_DWORD *)(v9 + 116) - 1;
              *(_DWORD *)(v9 + 116) = v254;
              *(_DWORD *)(v9 + 52) = v254;
              *(_BYTE *)(*(_QWORD *)(v9 + 104) + v254) = 0;
              *(_DWORD *)(v9 + 56) = 0;
              *(_DWORD *)(v9 + 8) = 0;
              v220 = *(_QWORD **)(a1 + 104);
              v12 = NewNode(v220);
              v10 = v12;
              v221 = 8;
LABEL_245:
              *((_DWORD *)v12 + 20) = v221;
              v150 = v220[6];
LABEL_246:
              *((_QWORD *)v12 + 9) = v150;
LABEL_14:
              *(_QWORD *)(v9 + 64) = v12;
              return v10;
            }
            UngetChar(v134, *(_QWORD *)(a1 + 4832));
            v133 = *(_QWORD *)(a1 + 4832);
            v84 = 93;
          }
          goto LABEL_160;
        case 9:
          if ((_DWORD)v70 != 93)
          {
            if ((_DWORD)v70 == 91)
            {
              v110 = *(unsigned int *)(v9 + 48);
              if (*(_DWORD *)(v9 + 116) == (_DWORD)v110 + 6
                && !tmbstrncmp((unsigned __int8 *)(*(_QWORD *)(v9 + 104) + v110), "CDATA[", 6))
              {
                *(_DWORD *)(v9 + 56) = 8;
                *(_DWORD *)(v9 + 116) -= 6;
              }
            }
            goto LABEL_194;
          }
          v84 = ReadChar(*(_QWORD *)(a1 + 4832), v75, v76, v77, v78, v79, v80, v81);
          if ((_DWORD)v84 == 62)
          {
            v240 = *(_DWORD *)(v9 + 116) - 1;
            *(_DWORD *)(v9 + 116) = v240;
            *(_DWORD *)(v9 + 52) = v240;
            *(_BYTE *)(*(_QWORD *)(v9 + 104) + v240) = 0;
            *(_DWORD *)(v9 + 56) = 0;
            *(_DWORD *)(v9 + 8) = 0;
            v220 = *(_QWORD **)(a1 + 104);
            v12 = NewNode(v220);
            v10 = v12;
            v221 = 9;
            goto LABEL_245;
          }
          goto LABEL_159;
        case 0xA:
          if ((_DWORD)v70 != 37)
            goto LABEL_194;
          v84 = ReadChar(*(_QWORD *)(a1 + 4832), v75, v76, v77, v78, v79, v80, v81);
          if ((_DWORD)v84 != 62)
            goto LABEL_159;
          v219 = *(_DWORD *)(v9 + 116) - 1;
          *(_DWORD *)(v9 + 116) = v219;
          *(_DWORD *)(v9 + 52) = v219;
          *(_BYTE *)(*(_QWORD *)(v9 + 104) + v219) = 0;
          *(_DWORD *)(v9 + 56) = 0;
          *(_DWORD *)(v9 + 8) = 0;
          v220 = *(_QWORD **)(a1 + 104);
          v12 = NewNode(v220);
          v10 = v12;
          v221 = 10;
          goto LABEL_245;
        case 0xB:
          if ((_DWORD)v70 != 35)
            goto LABEL_194;
          v84 = ReadChar(*(_QWORD *)(a1 + 4832), v75, v76, v77, v78, v79, v80, v81);
          if ((_DWORD)v84 != 62)
            goto LABEL_159;
          v222 = *(_DWORD *)(v9 + 116) - 1;
          *(_DWORD *)(v9 + 116) = v222;
          *(_DWORD *)(v9 + 52) = v222;
          *(_BYTE *)(*(_QWORD *)(v9 + 104) + v222) = 0;
          *(_DWORD *)(v9 + 56) = 0;
          *(_DWORD *)(v9 + 8) = 0;
          v220 = *(_QWORD **)(a1 + 104);
          v12 = NewNode(v220);
          v10 = v12;
          v221 = 11;
          goto LABEL_245;
        case 0xC:
          if ((_DWORD)v70 != 63)
            goto LABEL_194;
          v84 = ReadChar(*(_QWORD *)(a1 + 4832), v75, v76, v77, v78, v79, v80, v81);
          if ((_DWORD)v84 != 62)
            goto LABEL_159;
          v223 = *(_DWORD *)(v9 + 116) - 1;
          *(_DWORD *)(v9 + 116) = v223;
          *(_DWORD *)(v9 + 52) = v223;
          *(_BYTE *)(*(_QWORD *)(v9 + 104) + v223) = 0;
          *(_DWORD *)(v9 + 56) = 0;
          *(_DWORD *)(v9 + 8) = 0;
          v220 = *(_QWORD **)(a1 + 104);
          v12 = NewNode(v220);
          v10 = v12;
          v221 = 12;
          goto LABEL_245;
        case 0xD:
          if (v70 > 0x7F)
            goto LABEL_142;
          if ((_DWORD)v70 != 63 && (v73[v70] & 8) != 0)
            goto LABEL_194;
          if ((_DWORD)v70 == 63)
          {
            v119 = v71;
          }
          else
          {
LABEL_142:
            v111 = v71;
            v112 = v73;
            v268 = 0;
            v269 = 0;
            v267 = 0;
            v270 = 0;
            UngetChar((void *)v70, *(_QWORD *)(a1 + 4832));
            v117 = ParseAttribute(a1, &v270, &v269, (uint64_t)&v268, v113, v114, v115, v116);
            if (!v117)
            {
              --*(_DWORD *)(v9 + 116);
              v217 = *(unsigned int *)(v9 + 48);
              *(_DWORD *)(v9 + 52) = v217;
              *(_BYTE *)(*(_QWORD *)(v9 + 104) + v217) = 0;
              *(_DWORD *)(v9 + 56) = 0;
              *(_DWORD *)(v9 + 8) = 0;
              v218 = *(_QWORD **)(a1 + 104);
              v10 = NewNode(v218);
              *((_DWORD *)v10 + 20) = 13;
              *((_QWORD *)v10 + 9) = v218[6];
              *(_QWORD *)(v9 + 64) = v10;
              *((_QWORD *)v10 + 5) = v111;
              return v10;
            }
            v118 = (uint64_t)v117;
            v119 = MemAlloc(0x38uLL);
            ClearMemory(v119, 0x38uLL);
            *((_QWORD *)v119 + 5) = v118;
            *((_QWORD *)v119 + 6) = ParseValue(a1, v118, 1, (uint64_t)&v270, &v267, v120, v121, v122);
            *((_DWORD *)v119 + 8) = v267;
            *((_QWORD *)v119 + 1) = FindAttribute(a1, (uint64_t)v119);
            v123 = v111;
            if (v111)
            {
              do
              {
                v124 = v123;
                v123 = (_QWORD *)*v123;
              }
              while (v123);
              *v124 = v119;
              v119 = v111;
            }
            v73 = v112;
          }
          v125 = (void *)ReadChar(*(_QWORD *)(a1 + 4832), v75, v76, v77, v78, v79, v80, v81);
          if ((_DWORD)v125 == 62)
          {
            --*(_DWORD *)(v9 + 116);
            v215 = *(unsigned int *)(v9 + 48);
            *(_DWORD *)(v9 + 52) = v215;
            *(_BYTE *)(*(_QWORD *)(v9 + 104) + v215) = 0;
            *(_DWORD *)(v9 + 56) = 0;
            *(_DWORD *)(v9 + 8) = 0;
            v216 = *(_QWORD **)(a1 + 104);
            v10 = NewNode(v216);
            *((_DWORD *)v10 + 20) = 13;
            *((_QWORD *)v10 + 9) = v216[6];
            *(_QWORD *)(v9 + 64) = v10;
            *((_QWORD *)v10 + 5) = v119;
            return v10;
          }
          UngetChar(v125, *(_QWORD *)(a1 + 4832));
          v71 = v119;
          goto LABEL_194;
        default:
          goto LABEL_194;
      }
      break;
    }
    while (1)
    {
      if (v195 != 4 && v193 == 10)
        v197 = 32;
      else
        v197 = v193;
      if (v197 > 0x7F || v195 == 4 || (v174[v197] & 8) == 0)
      {
        AddCharToLexer(v175, v197);
        v198 = 0;
      }
      else
      {
        if (*(_DWORD *)(v175 + 8))
          goto LABEL_310;
        AddCharToLexer(v175, v197);
        v198 = 1;
      }
      *(_DWORD *)(v175 + 8) = v198;
      switch(v195)
      {
        case 0:
          if (v197 > 0x7F)
            goto LABEL_302;
          if ((v174[v197] & 0x20) != 0)
          {
            if ((_DWORD)v197 == 112)
              goto LABEL_300;
            v199 = v197 - 32;
          }
          else
          {
            v199 = v197;
            if ((_DWORD)v197 == 80)
              goto LABEL_300;
          }
          if (v199 == 83)
          {
LABEL_300:
            v176 = *(_DWORD *)(v175 + 116) - 1;
LABEL_301:
            v195 = 2;
            break;
          }
LABEL_302:
          v195 = 0;
          if ((int)v197 > 61)
          {
            if ((_DWORD)v197 == 91)
            {
              v176 = *(_DWORD *)(v175 + 116);
LABEL_309:
              v195 = 4;
            }
            else if ((_DWORD)v197 == 62)
            {
              v209 = *(_DWORD *)(v175 + 116) - 1;
              *(_DWORD *)(v175 + 116) = v209;
              *(_DWORD *)(v266 + 76) = v209;
              AttrByName = GetAttrByName(v266, "SYSTEM");
              if (AttrByName)
                CheckUrl((_DWORD *)a1, v266, (uint64_t)AttrByName);
              v211 = *(_QWORD *)(v266 + 64);
              if (v211 && IsValidXMLID(v211))
              {
                v212 = v266;
              }
              else
              {
LABEL_318:
                ReportError(a1, 0, 0, 35);
                FreeNode(a1, v266);
                v212 = 0;
              }
              *(_QWORD *)(v9 + 64) = v212;
              v213 = *(unsigned int *)(v9 + 116);
              *(_DWORD *)(v9 + 52) = v213;
              *(_BYTE *)(*(_QWORD *)(v9 + 104) + v213) = 0;
              *(_DWORD *)(v9 + 56) = 0;
              *(_DWORD *)(v9 + 8) = 0;
              v10 = *(char **)(v9 + 64);
              if (*(_DWORD *)(v9 + 36) || !v10 || *(_DWORD *)(a1 + 280))
                return v10;
              *(_DWORD *)(v9 + 36) = FindGivenVersion(a1, *(_QWORD *)(v9 + 64));
              return *(char **)(v9 + 64);
            }
          }
          else if ((_DWORD)v197 == 34 || (_DWORD)v197 == 39)
          {
            v176 = *(_DWORD *)(v175 + 116);
            v195 = 3;
            v194 = v193;
          }
          break;
        case 1:
          if (v197 <= 0x7F && (v174[v197] & 8) != 0
            || (_DWORD)v197 == 91
            || (_DWORD)v197 == 62)
          {
            *(_QWORD *)(v266 + 64) = tmbstrndup(*(_QWORD *)(v175 + 104) + v176, (*(_DWORD *)(v175 + 116) + ~v176));
            if ((_DWORD)v197 == 91 || (_DWORD)v197 == 62)
            {
              --*(_DWORD *)(v175 + 116);
              v200 = *(_QWORD *)(a1 + 4832);
              v201 = v197;
LABEL_294:
              UngetChar((void *)v201, v200);
            }
LABEL_295:
            v195 = 0;
          }
          else
          {
            v195 = 1;
          }
          break;
        case 2:
          if (v197 > 0x7F)
            v202 = 0;
          else
            v202 = (v174[v197] >> 3) & 1;
          if ((_DWORD)v197 != 62 && !v202)
            goto LABEL_301;
          v208 = tmbstrndup(*(_QWORD *)(v175 + 104) + v176, (*(_DWORD *)(v175 + 116) + ~v176));
          v265 = tmbstrcasecmp(v208, "SYSTEM") != 0;
          MemFree(v208);
          if ((_DWORD)v197 != 62)
            goto LABEL_295;
          --*(_DWORD *)(v175 + 116);
          v200 = *(_QWORD *)(a1 + 4832);
          v201 = 62;
          goto LABEL_294;
        case 3:
          if ((_DWORD)v197 == v194)
          {
            v203 = tmbstrndup(*(_QWORD *)(v175 + 104) + v176, (*(_DWORD *)(v175 + 116) + ~v176));
            if (v265)
              v204 = "PUBLIC";
            else
              v204 = "SYSTEM";
            v205 = AddAttribute(a1, v266, (unsigned __int8 *)v204, v203);
            MemFree(v203);
            v265 = 0;
            v195 = 0;
            v205[8] = v194;
            v194 = 0;
          }
          else
          {
            v195 = 3;
          }
          break;
        case 4:
          if ((_DWORD)v197 != 93)
            goto LABEL_309;
          v206 = *(_DWORD *)(v175 + 116) - 1;
          *(_DWORD *)(v175 + 48) = v176;
          *(_DWORD *)(v175 + 52) = v206;
          v207 = (char *)MemAlloc(0x68uLL);
          ClearMemory(v207, 0x68uLL);
          *(_QWORD *)(v207 + 84) = *(_QWORD *)v175;
          *((_DWORD *)v207 + 20) = 4;
          *((_QWORD *)v207 + 9) = *(_QWORD *)(v175 + 48);
          InsertNodeAtEnd(v266, v207);
          goto LABEL_295;
        default:
          break;
      }
LABEL_310:
      v193 = ReadChar(*(_QWORD *)(a1 + 4832), v186, v187, v188, v189, v190, v191, v192);
      if (v193 == -1)
        goto LABEL_318;
    }
  }
  v13 = *(_QWORD *)(v9 + 88);
  v14 = AttrGetById(v13, 132);
  v15 = *(int32x2_t **)(a1 + 4832);
  *(int32x2_t *)v9 = vrev64_s32(v15[4]);
  *(_DWORD *)(v9 + 8) = 0;
  v16 = *(_DWORD *)(v9 + 116);
  *(_DWORD *)(v9 + 48) = v16;
  *(_DWORD *)(v9 + 52) = v16;
  v24 = ReadChar((uint64_t)v15, v17, v18, v19, v20, v21, v22, v23);
  if (v24 == -1)
  {
    v151 = *(_DWORD *)(v9 + 52);
    *(_DWORD *)(v9 + 48) = v151;
    *(_DWORD *)(v9 + 116) = v151;
LABEL_242:
    ReportError(a1, v13, 0, 6);
    goto LABEL_243;
  }
  v25 = v24;
  v26 = 0;
  v27 = 0;
  v28 = 0;
  v29 = 1;
  while (1)
  {
    AddCharToLexer(v9, v25);
    *(_DWORD *)(v9 + 52) = *(_DWORD *)(v9 + 116);
    if (v26 == 1)
    {
      if (v25 > 0x7F || (lexmap[v25] & 2) == 0)
      {
        v54 = *(char **)(v13 + 64);
        v55 = (char *)(*(_QWORD *)(v9 + 104) + v28);
        v56 = tmbstrlen(v54);
        v57 = tmbstrncasecmp(v54, v55, (uint64_t)v56);
        v26 = 0;
        if (!v57)
          ++v27;
        goto LABEL_38;
      }
      goto LABEL_28;
    }
    if (v26)
      break;
    if (v25 != 60)
    {
      if (v29)
        v29 = v25 <= 0x7F && (lexmap[v25] & 8) != 0;
      v53 = ReadChar(*(_QWORD *)(a1 + 4832), v30, v31, v32, v33, v34, v35, v36);
      v25 = v53;
      v26 = 0;
      goto LABEL_39;
    }
    v37 = ReadChar(*(_QWORD *)(a1 + 4832), v30, v31, v32, v33, v34, v35, v36);
    if (v37 > 0x7F || (lexmap[v37] & 2) == 0)
    {
      if ((_DWORD)v37 == 92)
      {
        AddCharToLexer(v9, 0x5Cu);
        v37 = ReadChar(*(_QWORD *)(a1 + 4832), v39, v40, v41, v42, v43, v44, v45);
        if ((_DWORD)v37 != 47)
          goto LABEL_35;
      }
      else if ((_DWORD)v37 != 47)
      {
        v38 = *(_QWORD *)(a1 + 4832);
LABEL_36:
        UngetChar((void *)v37, v38);
LABEL_37:
        v26 = 0;
        goto LABEL_38;
      }
      AddCharToLexer(v9, 0x2Fu);
      v37 = ReadChar(*(_QWORD *)(a1 + 4832), v46, v47, v48, v49, v50, v51, v52);
      if (v37 > 0x7F || (lexmap[v37] & 2) == 0)
      {
LABEL_35:
        v38 = *(_QWORD *)(a1 + 4832);
        goto LABEL_36;
      }
      UngetChar((void *)v37, *(_QWORD *)(a1 + 4832));
      v28 = *(_DWORD *)(v9 + 116);
      goto LABEL_31;
    }
    if (v13)
    {
      if (v14)
      {
        if (v29)
        {
          v66 = *(_DWORD **)(v13 + 56);
          if (v66)
          {
            if (*v66 == 92)
            {
              *(_DWORD *)(v9 + 116) = *(_DWORD *)(v9 + 48);
              UngetChar((void *)v37, *(_QWORD *)(a1 + 4832));
              UngetChar((void *)0x3C, *(_QWORD *)(a1 + 4832));
              return 0;
            }
          }
        }
      }
    }
    AddCharToLexer(v9, v37);
    v28 = *(_DWORD *)(v9 + 116) - 1;
LABEL_28:
    v26 = 1;
LABEL_38:
    v53 = ReadChar(*(_QWORD *)(a1 + 4832), v30, v31, v32, v33, v34, v35, v36);
    v25 = v53;
LABEL_39:
    if (v53 == -1)
    {
      v145 = 1;
      goto LABEL_228;
    }
  }
  if (v25 <= 0x7F && (lexmap[v25] & 2) != 0)
  {
LABEL_31:
    v26 = 2;
    goto LABEL_38;
  }
  v58 = *(char **)(v13 + 64);
  v59 = (char *)(*(_QWORD *)(v9 + 104) + v28);
  v60 = tmbstrlen(v58);
  v61 = tmbstrncasecmp(v58, v59, (uint64_t)v60);
  if (!v29 || !v61)
  {
    if (!v61)
    {
      if (v27 <= 0)
      {
        for (i = *(_DWORD *)(v9 + 116) - 1; i >= v28; --i)
          UngetChar((void *)*(char *)(*(_QWORD *)(v9 + 104) + i), *(_QWORD *)(a1 + 4832));
        UngetChar((void *)0x2F, *(_QWORD *)(a1 + 4832));
        UngetChar((void *)0x3C, *(_QWORD *)(a1 + 4832));
        v145 = 0;
        *(_DWORD *)(v9 + 116) = v28 - 2;
        goto LABEL_228;
      }
      --v27;
    }
    if (*(_BYTE *)(*(_QWORD *)(v9 + 104) + v28 - 2) != 92)
    {
      v62 = *(_QWORD *)(a1 + 4832);
      *(_DWORD *)v9 = *(_DWORD *)(v62 + 36);
      *(_DWORD *)(v9 + 4) = *(_DWORD *)(v62 + 32) - 3;
      ReportError(a1, 0, 0, 32);
      if (IsJavaScript(v13))
      {
        v63 = *(unsigned int *)(v9 + 116);
        v64 = v28 - 1;
        if (v63 > v28 - 1)
        {
          v65 = (v63 - 1);
          do
            *(_BYTE *)(*(_QWORD *)(v9 + 104) + v63--) = *(_BYTE *)(*(_QWORD *)(v9 + 104) + v65--);
          while (v64 < v63);
        }
        v26 = 0;
        *(_BYTE *)(*(_QWORD *)(v9 + 104) + v64) = 92;
        ++*(_DWORD *)(v9 + 116);
        goto LABEL_38;
      }
    }
    goto LABEL_37;
  }
  for (j = *(_DWORD *)(v9 + 116) - 1; j >= v28; --j)
    UngetChar((void *)*(char *)(*(_QWORD *)(v9 + 104) + j), *(_QWORD *)(a1 + 4832));
  UngetChar((void *)0x2F, *(_QWORD *)(a1 + 4832));
  UngetChar((void *)0x3C, *(_QWORD *)(a1 + 4832));
  v145 = 0;
LABEL_228:
  if (!v29)
  {
    *(_DWORD *)(v9 + 52) = *(_DWORD *)(v9 + 116);
    if ((v145 & 1) == 0)
      goto LABEL_243;
    goto LABEL_242;
  }
  v146 = *(_DWORD *)(v9 + 52);
  *(_DWORD *)(v9 + 48) = v146;
  *(_DWORD *)(v9 + 116) = v146;
  if (v145)
    goto LABEL_242;
LABEL_243:
  v10 = (char *)MemAlloc(0x68uLL);
  ClearMemory(v10, 0x68uLL);
  *(_QWORD *)(v10 + 84) = *(_QWORD *)v9;
  *((_DWORD *)v10 + 20) = 4;
  *((_QWORD *)v10 + 9) = *(_QWORD *)(v9 + 48);
  return v10;
}

void InitMap()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v0 = 13;
  v1 = 1u;
  do
  {
    lexmap[v0] |= 0x18u;
    v0 = asc_20AB67557[v1++];
  }
  while (v1 != 4);
  v2 = 0;
  v3 = 32;
  do
  {
    lexmap[v3] |= 8u;
    v3 = asc_20AB6755B[++v2];
  }
  while (v2 != 2);
  v4 = 0;
  v5 = 45;
  do
  {
    lexmap[v5] |= 4u;
    v5 = asc_20AB6755E[++v4];
  }
  while (v4 != 4);
  v6 = 48;
  v7 = 1u;
  do
  {
    lexmap[v6] |= 5u;
    v6 = a0123456789[v7++];
  }
  while (v7 != 11);
  v8 = 97;
  v9 = 1u;
  do
  {
    lexmap[v8] |= 0x26u;
    v8 = aAbcdefghijklmn[v9++];
  }
  while (v9 != 27);
  v10 = 65;
  v11 = 1u;
  do
  {
    lexmap[v10] |= 0x46u;
    v10 = aAbcdefghijklmn_0[v11++];
  }
  while (v11 != 27);
}

void *NewAttribute()
{
  void *v0;

  v0 = MemAlloc(0x38uLL);
  ClearMemory(v0, 0x38uLL);
  return v0;
}

void *NewAttributeEx(uint64_t a1, _BYTE *a2, _BYTE *a3, int a4)
{
  void *v8;

  v8 = MemAlloc(0x38uLL);
  ClearMemory(v8, 0x38uLL);
  *((_QWORD *)v8 + 5) = tmbstrdup(a2);
  *((_QWORD *)v8 + 6) = tmbstrdup(a3);
  *((_DWORD *)v8 + 8) = a4;
  *((_QWORD *)v8 + 1) = FindAttribute(a1, (uint64_t)v8);
  return v8;
}

_QWORD *InsertAttributeAtEnd(uint64_t a1, uint64_t a2)
{
  _QWORD *result;
  _QWORD *i;
  _QWORD *v4;

  v4 = *(_QWORD **)(a1 + 40);
  result = (_QWORD *)(a1 + 40);
  for (i = v4; i; i = (_QWORD *)*i)
    result = i;
  *result = a2;
  return result;
}

uint64_t InsertAttributeAtStart(uint64_t result, _QWORD *a2)
{
  *a2 = *(_QWORD *)(result + 40);
  *(_QWORD *)(result + 40) = a2;
  return result;
}

void ParseEntity(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  int v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  char i;
  uint64_t Char;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unsigned int v29;
  unsigned int v30;
  uint64_t v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unsigned int v37;
  uint64_t v38;
  unsigned int v39;
  int v40;
  unsigned int v41;

  v8 = a2;
  v10 = *(_DWORD *)(a1 + 280);
  v40 = 0;
  v11 = *(_QWORD *)(a1 + 104);
  v12 = *(_DWORD *)(v11 + 116);
  v13 = v12 - 1;
  v14 = *(_QWORD *)(a1 + 4832);
  v15 = *(_DWORD *)(v14 + 32) - 1;
  for (i = 1; ; i = 0)
  {
    Char = ReadChar(v14, a2, a3, a4, a5, a6, a7, a8);
    v18 = Char;
    if ((_DWORD)Char == -1)
      break;
    if ((_DWORD)Char == 59)
    {
      v19 = 0;
      goto LABEL_15;
    }
    if ((_DWORD)Char != 35 || (i & 1) == 0)
    {
      if (Char > 0x7F || (lexmap[Char] & 4) == 0)
      {
        UngetChar((void *)Char, *(_QWORD *)(a1 + 4832));
        break;
      }
    }
    else
    {
      if (!*(_DWORD *)(a1 + 680) || (*(_QWORD *)(a1 + 152) & 0xFFFFFFFFFFFFFFFELL) == 0xC)
      {
        UngetChar((void *)0x23, *(_QWORD *)(a1 + 4832));
        return;
      }
      LODWORD(v18) = 35;
    }
    AddCharToLexer(v11, v18);
    v14 = *(_QWORD *)(a1 + 4832);
  }
  v19 = 1;
LABEL_15:
  v41 = 0;
  *(_BYTE *)(*(_QWORD *)(v11 + 104) + *(unsigned int *)(v11 + 116)) = 0;
  if (!tmbstrcmp((unsigned __int8 *)(*(_QWORD *)(v11 + 104) + v13), "&apos")
    && !*(_DWORD *)(a1 + 288)
    && !*(_DWORD *)(v11 + 28)
    && !*(_DWORD *)(a1 + 296))
  {
    ReportEntityError(a1, 5, *(_QWORD *)(v11 + 104) + v13, 39, v20, v21, v22, v23);
  }
  if (EntityInfo((char *)(*(_QWORD *)(v11 + 104) + v13), v10, &v41, &v40)
    && (v41 & 0xFFFFFFE0) != 0x80
    && ((_DWORD)v18 == 59 || v41 < 0x100))
  {
    if ((_DWORD)v18 != 59)
    {
      *(_DWORD *)v11 = *(_DWORD *)(*(_QWORD *)(a1 + 4832) + 36);
      *(_DWORD *)(v11 + 4) = v15;
      ReportEntityError(a1, 1, *(_QWORD *)(v11 + 104) + v13, v18, v24, v25, v26, v27);
    }
    if (!*(_QWORD *)(a1 + 160))
      goto LABEL_50;
    *(_DWORD *)(v11 + 116) = v13;
    v30 = v41;
    if (v8 == 2 && v41 == 160)
    {
      v30 = 32;
      v41 = 32;
    }
    AddCharToLexer(v11, v30);
    if (v41 == 38 && !*(_DWORD *)(a1 + 432))
    {
      v31 = 0;
      v32 = 97;
      do
      {
        AddCharToLexer(v11, v32);
        v32 = aAmp_0[++v31];
      }
      while (v31 != 4);
    }
    *(_DWORD *)(*(_QWORD *)(a1 + 104) + 32) &= v40 | 0xE000;
  }
  else
  {
    *(_DWORD *)v11 = *(_DWORD *)(*(_QWORD *)(a1 + 4832) + 36);
    *(_DWORD *)(v11 + 4) = v15;
    if (*(_DWORD *)(v11 + 116) > v12)
    {
      if ((v41 & 0xFFFFFFE0) == 0x80)
      {
        v37 = DecodeWin1252(v41);
        if ((_DWORD)v18 != 59)
          ReportEntityError(a1, 2, *(_QWORD *)(v11 + 104) + v13, v18, v33, v34, v35, v36);
        ReportEncodingError(a1, 82, v41, v37 == 0, v33, v34, v35, v36);
        if (*(_QWORD *)(a1 + 160))
        {
          *(_DWORD *)(v11 + 116) = v13;
          if (!v37)
            return;
          v38 = v11;
          v39 = v37;
          goto LABEL_51;
        }
      }
      else
      {
        ReportEntityError(a1, 3, *(_QWORD *)(v11 + 104) + v13, v41, v24, v25, v26, v27);
      }
      if ((v19 & 1) != 0)
        return;
LABEL_50:
      v38 = v11;
      v39 = 59;
LABEL_51:
      AddCharToLexer(v38, v39);
      return;
    }
    if (!*(_QWORD *)(a1 + 160) && *(_DWORD *)(a1 + 432))
    {
      v28 = 0;
      v29 = 97;
      do
      {
        AddCharToLexer(v11, v29);
        v29 = aAmp_0[++v28];
      }
      while (v28 != 4);
    }
    ReportEntityError(a1, 4, *(_QWORD *)(v11 + 104) + v13, v41, v24, v25, v26, v27);
  }
}

uint64_t ParseTagName(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  unsigned int v15;
  unsigned int Char;

  v9 = *(_QWORD *)(a1 + 104);
  v10 = *(unsigned int *)(a1 + 280);
  if (!*(_DWORD *)(a1 + 280))
  {
    v11 = *(_QWORD *)(v9 + 104);
    v12 = *(unsigned int *)(v9 + 48);
    if ((*(char *)(v11 + v12) & 0x80000000) == 0)
    {
      v13 = *(unsigned __int8 *)(v11 + v12);
      if ((lexmap[v13] & 0x40) != 0)
        *(_BYTE *)(v11 + v12) = v13 + 32;
    }
  }
  while (1)
  {
    Char = ReadChar(*(_QWORD *)(a1 + 4832), a2, a3, a4, a5, a6, a7, a8);
    v15 = Char;
    if (Char == -1)
      break;
    if (v10)
    {
      if (!IsXMLNamechar(Char))
        break;
    }
    else
    {
      if (Char > 0x7F)
        break;
      v14 = lexmap[Char];
      if ((v14 & 4) == 0)
        break;
      if ((v14 & 0x40) != 0)
        v15 = Char + 32;
      else
        v15 = Char;
    }
    AddCharToLexer(v9, v15);
  }
  *(_DWORD *)(v9 + 52) = *(_DWORD *)(v9 + 116);
  return (char)v15;
}

char *TagToken(uint64_t a1, int a2)
{
  uint64_t v4;
  char *v5;
  int v6;

  v4 = *(_QWORD *)(a1 + 104);
  v5 = NewNode((_QWORD *)v4);
  *((_DWORD *)v5 + 20) = a2;
  *((_QWORD *)v5 + 8) = tmbstrndup(*(_QWORD *)(v4 + 104) + *(unsigned int *)(v4 + 48), (*(_DWORD *)(v4 + 52) - *(_DWORD *)(v4 + 48)));
  v6 = *(_DWORD *)(v4 + 48);
  *((_DWORD *)v5 + 18) = v6;
  *((_DWORD *)v5 + 19) = v6;
  if ((a2 - 5) <= 2)
    FindTag(a1, (uint64_t)v5);
  return v5;
}

_QWORD *ParseAttrs(uint64_t a1, _DWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  _BYTE *v17;
  _QWORD *v18;
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  char *v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD *v27;
  unsigned int v28;
  uint64_t v29;
  void *v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v37;
  char *v38;
  int v39;
  _QWORD *v40;

  v10 = *(_QWORD *)(a1 + 104);
  v39 = 0;
  v37 = 0;
  v38 = 0;
  v40 = 0;
  while (1)
  {
    v11 = *(_QWORD *)(a1 + 4832);
    if (!*(_DWORD *)(v11 + 4))
    {
      if (IsEOF(v11))
        return v40;
    }
    v12 = ParseAttribute(a1, a2, &v38, (uint64_t)&v37, a5, a6, a7, a8);
    if (v12)
    {
      v16 = v12;
      v17 = ParseValue(a1, (uint64_t)v12, 0, (uint64_t)a2, &v39, v13, v14, v15);
      if ((char)*v16 < 0 || (lexmap[*v16] & 2) == 0)
        goto LABEL_7;
      if ((unint64_t)tmbstrlen(v16) < 2)
      {
LABEL_24:
        v31 = MemAlloc(0x38uLL);
        ClearMemory(v31, 0x38uLL);
        *((_DWORD *)v31 + 8) = v39;
        *((_QWORD *)v31 + 5) = v16;
        *((_QWORD *)v31 + 6) = v17;
        *((_QWORD *)v31 + 1) = FindAttribute(a1, (uint64_t)v31);
        v32 = v40;
        if (v40)
        {
          do
          {
            v33 = v32;
            v32 = (_QWORD *)*v32;
          }
          while (v32);
        }
        else
        {
          v33 = &v40;
        }
        *v33 = v31;
      }
      else
      {
        v28 = 2;
        v29 = 1;
        while (((char)v16[v29] & 0x80000000) == 0 && (lexmap[v16[v29]] & 4) != 0)
        {
          v29 = v28;
          if ((unint64_t)tmbstrlen(v16) <= v28++)
            goto LABEL_24;
        }
LABEL_7:
        if (*(_DWORD *)(a1 + 280) && IsValidXMLID((uint64_t)v16))
          goto LABEL_24;
        v18 = MemAlloc(0x38uLL);
        ClearMemory(v18, 0x38uLL);
        v18[5] = v16;
        v18[6] = v17;
        if (*v16 && (v19 = tmbstrlen(v16)) != 0 && v16[(_QWORD)v19 - 1] == 34)
        {
          v20 = *(_QWORD *)(v10 + 64);
          v21 = a1;
          v22 = (uint64_t)v18;
          v23 = 59;
        }
        else
        {
          v20 = *(_QWORD *)(v10 + 64);
          v21 = a1;
          v22 = (uint64_t)v18;
          if (v17)
            v23 = 72;
          else
            v23 = 50;
        }
        ReportAttrError(v21, v20, v22, v23);
        FreeAttribute(a1, (uint64_t)v18);
      }
    }
    else
    {
      v24 = v38;
      if (v38)
      {
        v25 = MemAlloc(0x38uLL);
        ClearMemory(v25, 0x38uLL);
        v25[2] = v24;
        v26 = v40;
        if (!v40)
          goto LABEL_31;
        do
        {
          v27 = v26;
          v26 = (_QWORD *)*v26;
        }
        while (v26);
      }
      else
      {
        v34 = v37;
        if (!v37)
          return v40;
        v25 = MemAlloc(0x38uLL);
        ClearMemory(v25, 0x38uLL);
        v25[3] = v34;
        v35 = v40;
        if (!v40)
        {
LABEL_31:
          v27 = &v40;
          goto LABEL_32;
        }
        do
        {
          v27 = v35;
          v35 = (_QWORD *)*v35;
        }
        while (v35);
      }
LABEL_32:
      *v27 = v25;
    }
  }
}

char *FindGivenVersion(uint64_t a1, uint64_t a2)
{
  _QWORD *AttrByName;
  _QWORD *v4;
  char *v5;
  unint64_t v6;
  char **v7;
  uint64_t v9;
  _BYTE *v10;

  AttrByName = GetAttrByName(a2, "PUBLIC");
  if (!AttrByName)
    return 0;
  v4 = AttrByName;
  v5 = (char *)AttrByName[6];
  if (v5)
  {
    v6 = -17;
    v7 = &off_24C37AD68;
    while (tmbstrcasecmp(*v7, v5))
    {
      v7 += 4;
      if (__CFADD__(v6++, 1))
      {
        v5 = 0;
        goto LABEL_11;
      }
    }
    v5 = (char *)*((unsigned int *)v7 - 3);
    if (v6 >= 0xFFFFFFFFFFFFFFFBLL)
    {
      SetOptionBool(a1, 0x16u, 1u);
      SetOptionBool(a1, 0x17u, 1u);
      *(_DWORD *)(*(_QWORD *)(a1 + 104) + 28) = 1;
    }
LABEL_11:
    MemFree((void *)v4[6]);
    v9 = 0;
    while (*(_DWORD *)((char *)&W3C_Doctypes + v9 + 4) != (_DWORD)v5)
    {
      v9 += 32;
      if (v9 == 544)
      {
        v10 = 0;
        goto LABEL_16;
      }
    }
    v10 = *(_BYTE **)((char *)&W3C_Doctypes + v9 + 16);
LABEL_16:
    v4[6] = tmbstrdup(v10);
  }
  return v5;
}

_BYTE *ParseAttribute(uint64_t a1, _DWORD *a2, char **a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v12;
  uint64_t Char;
  uint64_t v14;
  _DWORD *v15;
  int v16;
  void *v17;
  _BYTE *result;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _DWORD *v27;
  unsigned int v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unsigned int v37;
  unsigned int v38;
  int v39;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _DWORD *v48;
  unsigned int v49;
  unsigned int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unsigned int v58;
  unsigned int v59;
  uint64_t v60;
  unsigned int v61;
  _QWORD *v62;
  char *v63;
  unsigned int v64;
  _QWORD *v65;
  char *v66;

  v8 = (_QWORD *)a4;
  v12 = *(_QWORD *)(a1 + 104);
  *a3 = 0;
  *(_QWORD *)a4 = 0;
  while (1)
  {
    while (1)
    {
      Char = ReadChar(*(_QWORD *)(a1 + 4832), (uint64_t)a2, (uint64_t)a3, a4, a5, a6, a7, a8);
      v14 = Char;
      if ((int)Char > 46)
        break;
      a4 = 58;
      if ((_DWORD)Char != 34 && (_DWORD)Char != 39)
      {
        if ((_DWORD)Char == -1)
        {
          ReportAttrError(a1, *(_QWORD *)(v12 + 64), 0, 75);
          UngetChar((void *)0xFFFFFFFFLL, *(_QWORD *)(a1 + 4832));
          return 0;
        }
        goto LABEL_15;
      }
LABEL_10:
      ReportAttrError(a1, *(_QWORD *)(v12 + 64), 0, a4);
    }
    if ((int)Char > 60)
    {
      if ((_DWORD)Char != 61)
      {
        if ((_DWORD)Char == 62)
          return 0;
        goto LABEL_15;
      }
      LODWORD(a4) = 69;
      goto LABEL_10;
    }
    if ((_DWORD)Char == 47)
    {
      v17 = (void *)ReadChar(*(_QWORD *)(a1 + 4832), (uint64_t)a2, (uint64_t)a3, a4, a5, a6, a7, a8);
      if ((_DWORD)v17 == 62)
      {
        result = 0;
        *a2 = 1;
        return result;
      }
      UngetChar(v17, *(_QWORD *)(a1 + 4832));
      v15 = (_DWORD *)(v12 + 116);
      v16 = *(_DWORD *)(v12 + 116);
LABEL_31:
      Char = v14;
      while ((_DWORD)Char != -1 && (_DWORD)Char != 60)
      {
        if ((_DWORD)v14 == 45 && ((_DWORD)Char == 39 || (_DWORD)Char == 34))
        {
          --*v15;
          break;
        }
        if (Char <= 0x7F)
        {
          v39 = lexmap[Char];
          if ((v39 & 8) != 0)
            goto LABEL_58;
          if ((v39 & 0x40) != 0 && *(_DWORD *)(a1 + 280) == 0)
            LODWORD(Char) = Char + 32;
        }
        LODWORD(v14) = Char;
        AddCharToLexer(v12, Char);
        Char = ReadChar(*(_QWORD *)(a1 + 4832), v41, v42, v43, v44, v45, v46, v47);
        if ((Char - 61) <= 1)
          break;
      }
LABEL_57:
      UngetChar((void *)Char, *(_QWORD *)(a1 + 4832));
LABEL_58:
      v60 = (*v15 - v16);
      if ((int)v60 < 1)
        result = 0;
      else
        result = tmbstrndup(*(_QWORD *)(v12 + 104) + v16, v60);
      *v15 = v16;
      return result;
    }
    if ((_DWORD)Char == 60)
      break;
LABEL_15:
    if (Char > 0x7F || (lexmap[Char] & 8) == 0)
    {
      v15 = (_DWORD *)(v12 + 116);
      v16 = *(_DWORD *)(v12 + 116);
      if ((Char - 61) < 2)
        goto LABEL_57;
      goto LABEL_31;
    }
  }
  v19 = (void *)ReadChar(*(_QWORD *)(a1 + 4832), (uint64_t)a2, (uint64_t)a3, a4, a5, a6, a7, a8);
  if ((_DWORD)v19 != 63)
  {
    if ((_DWORD)v19 == 37)
    {
      v27 = *(_DWORD **)(a1 + 104);
      v27[12] = v27[29];
      v28 = ReadChar(*(_QWORD *)(a1 + 4832), v20, v21, v22, v23, v24, v25, v26);
      if (v28 != -1)
      {
        v29 = v28;
        while (1)
        {
          AddCharToLexer((uint64_t)v27, v29);
          if (v29 == 37)
          {
            v37 = ReadChar(*(_QWORD *)(a1 + 4832), v30, v31, v32, v33, v34, v35, v36);
            if (v37 == -1)
              goto LABEL_63;
            v38 = v37;
            AddCharToLexer((uint64_t)v27, v37);
            if (v38 == 62)
              break;
          }
          v29 = ReadChar(*(_QWORD *)(a1 + 4832), v30, v31, v32, v33, v34, v35, v36);
          if (v29 == -1)
            goto LABEL_63;
        }
        v27[29] -= 2;
      }
LABEL_63:
      v61 = v27[29];
      v27[13] = v61;
      if (v61 <= v27[12])
      {
        v63 = 0;
      }
      else
      {
        v62 = *(_QWORD **)(a1 + 104);
        v63 = NewNode(v62);
        *((_DWORD *)v63 + 20) = 10;
        *((_QWORD *)v63 + 9) = v62[6];
        v61 = v27[13];
      }
      result = 0;
      v27[12] = v61;
      *a3 = v63;
      return result;
    }
    UngetChar(v19, *(_QWORD *)(a1 + 4832));
    UngetChar((void *)0x3C, *(_QWORD *)(a1 + 4832));
    ReportAttrError(a1, *(_QWORD *)(v12 + 64), 0, 52);
    return 0;
  }
  v48 = *(_DWORD **)(a1 + 104);
  v48[12] = v48[29];
  v49 = ReadChar(*(_QWORD *)(a1 + 4832), v20, v21, v22, v23, v24, v25, v26);
  if (v49 != -1)
  {
    v50 = v49;
    while (1)
    {
      AddCharToLexer((uint64_t)v48, v50);
      if (v50 == 63)
      {
        v58 = ReadChar(*(_QWORD *)(a1 + 4832), v51, v52, v53, v54, v55, v56, v57);
        if (v58 == -1)
          goto LABEL_68;
        v59 = v58;
        AddCharToLexer((uint64_t)v48, v58);
        if (v59 == 62)
          break;
      }
      v50 = ReadChar(*(_QWORD *)(a1 + 4832), v51, v52, v53, v54, v55, v56, v57);
      if (v50 == -1)
        goto LABEL_68;
    }
    v48[29] -= 2;
  }
LABEL_68:
  v64 = v48[29];
  v48[13] = v64;
  if (v64 <= v48[12])
  {
    v66 = 0;
  }
  else
  {
    v65 = *(_QWORD **)(a1 + 104);
    v66 = NewNode(v65);
    *((_DWORD *)v66 + 20) = 12;
    *((_QWORD *)v66 + 9) = v65[6];
    v64 = v48[13];
  }
  result = 0;
  v48[12] = v64;
  *v8 = v66;
  return result;
}

_BYTE *ParseValue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v10;
  uint64_t v13;
  uint64_t v14;
  uint64_t Char;
  void *v16;
  uint64_t v18;
  void *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  unsigned int v38;
  unsigned int v39;
  unsigned int v40;
  void *v41;
  int v42;
  int v43;
  _BYTE *result;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unsigned int v53;
  unsigned int v54;
  int v55;
  int v56;
  unsigned int v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  int v67;
  int v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  int v82;
  BOOL v83;
  uint64_t v84;
  int v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  int *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  int v96;
  uint64_t v97;
  uint64_t v98;
  int v99;
  uint64_t v100;
  int v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  int v105;
  uint64_t v106;
  int v107;
  _DWORD *v108;
  int *v109;
  int v110;
  unsigned __int8 *v111;

  v10 = a3;
  v13 = *(_QWORD *)(a1 + 104);
  *a5 = 34;
  v14 = *(unsigned int *)(a1 + 576);
  do
  {
    Char = ReadChar(*(_QWORD *)(a1 + 4832), a2, a3, a4, (uint64_t)a5, a6, a7, a8);
    v16 = (void *)Char;
    if ((_DWORD)Char == -1)
    {
      UngetChar((void *)Char, *(_QWORD *)(a1 + 4832));
LABEL_35:
      UngetChar(v16, *(_QWORD *)(a1 + 4832));
      return 0;
    }
  }
  while (Char <= 0x7F && (lexmap[Char] & 8) != 0);
  if (Char > 0x3D || ((1 << Char) & 0x2000008400000000) == 0)
    goto LABEL_35;
  v109 = a5;
  do
  {
    v18 = ReadChar(*(_QWORD *)(a1 + 4832), a2, a3, a4, (uint64_t)a5, a6, a7, a8);
    v19 = (void *)v18;
    if ((_DWORD)v18 == -1)
    {
      UngetChar((void *)v18, *(_QWORD *)(a1 + 4832));
LABEL_38:
      UngetChar(v19, *(_QWORD *)(a1 + 4832));
      LODWORD(v19) = 0;
      goto LABEL_39;
    }
  }
  while (v18 <= 0x7F && (lexmap[v18] & 8) != 0);
  if ((_DWORD)v18 != 34 && (_DWORD)v18 != 39)
  {
    if ((_DWORD)v18 == 60)
    {
      v20 = *(_DWORD *)(v13 + 116);
      AddCharToLexer(v13, 0x3Cu);
      v21 = *(_QWORD *)(a1 + 104);
      v29 = ReadChar(*(_QWORD *)(a1 + 4832), v22, v23, v24, v25, v26, v27, v28);
      AddCharToLexer(v21, v29);
      v37 = 34;
      v38 = v29 - 37;
LABEL_17:
      while (1)
      {
        v39 = ReadChar(*(_QWORD *)(a1 + 4832), v30, v31, v32, v33, v34, v35, v36);
        if (v39 == -1)
          break;
        v40 = v39;
        if (v39 == 62)
        {
          if (v38 <= 0x1B && ((1 << v38) & 0xC000001) != 0)
            AddCharToLexer(v21, 0x3Eu);
          else
            UngetChar((void *)0x3E, *(_QWORD *)(a1 + 4832));
          break;
        }
        if ((v38 > 0x1B || ((1 << v38) & 0xC000001) == 0) && v39 <= 0x7F && (lexmap[v39] & 8) != 0)
          break;
        AddCharToLexer(v21, v39);
        if (v40 == 39)
        {
          while (1)
          {
            v41 = (void *)ReadChar(*(_QWORD *)(a1 + 4832), v30, v31, v32, v33, v34, v35, v36);
            if ((_DWORD)v41 == 62)
              goto LABEL_125;
            v43 = (int)v41;
            if ((_DWORD)v41 == -1)
            {
LABEL_126:
              ReportAttrError(a1, *(_QWORD *)(v21 + 64), 0, 75);
              UngetChar((void *)0xFFFFFFFFLL, *(_QWORD *)(a1 + 4832));
              goto LABEL_127;
            }
            AddCharToLexer(v21, v41);
            if (v43 == 39)
              goto LABEL_17;
          }
        }
        if (v40 == 34)
        {
          while (1)
          {
            v41 = (void *)ReadChar(*(_QWORD *)(a1 + 4832), v30, v31, v32, v33, v34, v35, v36);
            if ((_DWORD)v41 == 62)
              break;
            v42 = (int)v41;
            if ((_DWORD)v41 == -1)
              goto LABEL_126;
            AddCharToLexer(v21, v41);
            v37 = 39;
            if (v42 == 34)
              goto LABEL_17;
          }
LABEL_125:
          UngetChar(v41, *(_QWORD *)(a1 + 4832));
          ReportAttrError(a1, *(_QWORD *)(v21 + 64), 0, 52);
LABEL_127:
          v37 = 0;
          break;
        }
      }
      *a5 = v37;
      v106 = (*(_DWORD *)(v13 + 116) - v20);
      *(_DWORD *)(v13 + 116) = v20;
      if ((int)v106 >= 1)
        return tmbstrndup(*(_QWORD *)(v13 + 104) + v20, v106);
      return 0;
    }
    goto LABEL_38;
  }
LABEL_39:
  v110 = *(_DWORD *)(v13 + 116);
  v111 = (unsigned __int8 *)a2;
  v45 = ReadChar(*(_QWORD *)(a1 + 4832), a2, a3, a4, (uint64_t)a5, a6, a7, a8);
  if (v45 != -1)
  {
    v53 = v45;
    v108 = (_DWORD *)a4;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    while (1)
    {
      if ((_DWORD)v19)
      {
        if (v53 == (_DWORD)v19)
          goto LABEL_96;
        if (((1 << v53) & 0x5000000000000400) != 0)
          v57 = v54 + 1;
        else
          v57 = v54;
        if (v53 <= 0x3E)
          v54 = v57;
        if (v53 == 62)
          v56 = 1;
      }
      else if ((int)v53 > 46)
      {
        switch(v53)
        {
          case '/':
            v66 = (void *)ReadChar(*(_QWORD *)(a1 + 4832), v46, v47, v48, v49, v50, v51, v52);
            v67 = v110;
            if ((_DWORD)v66 == 62 && !IsUrl(a1, v111))
            {
              *v108 = 1;
              UngetChar((void *)0x3E, *(_QWORD *)(a1 + 4832));
LABEL_143:
              v90 = v109;
              goto LABEL_97;
            }
            UngetChar(v66, *(_QWORD *)(a1 + 4832));
            LOBYTE(v68) = dword_254615424;
            if ((dword_254615424 & 8) != 0)
              goto LABEL_143;
            v53 = 47;
LABEL_77:
            if (v10 && (v68 & 0x40) != 0)
              v53 += 32;
            goto LABEL_82;
          case '<':
            UngetChar((void *)0x3C, *(_QWORD *)(a1 + 4832));
            UngetChar((void *)0x3E, *(_QWORD *)(a1 + 4832));
            ReportAttrError(a1, *(_QWORD *)(v13 + 64), 0, 52);
            goto LABEL_96;
          case '>':
            goto LABEL_131;
        }
      }
      else if (v53 == 34 || v53 == 39)
      {
        ReportAttrError(a1, *(_QWORD *)(v13 + 64), 0, 58);
        v65 = (void *)ReadChar(*(_QWORD *)(a1 + 4832), v58, v59, v60, v61, v62, v63, v64);
        if ((_DWORD)v65 == 62)
        {
          AddCharToLexer(v13, v53);
LABEL_131:
          v88 = *(_QWORD *)(a1 + 4832);
          v89 = 62;
          goto LABEL_95;
        }
        UngetChar(v65, *(_QWORD *)(a1 + 4832));
      }
      if (v53 == 92)
      {
        v87 = (void *)ReadChar(*(_QWORD *)(a1 + 4832), v46, v47, v48, v49, v50, v51, v52);
        if ((_DWORD)v87 == 10)
        {
          v53 = 10;
        }
        else
        {
          UngetChar(v87, *(_QWORD *)(a1 + 4832));
          v53 = 92;
        }
      }
      else
      {
        if (v53 == 38)
        {
          v55 = 38;
          AddCharToLexer(v13, 0x26u);
          ParseEntity(a1, 0, v69, v70, v71, v72, v73, v74);
          v82 = *(_DWORD *)(v13 + 116);
          v83 = v82 != 0;
          v84 = (v82 - 1);
          v85 = v83;
          if (!v14)
          {
            if (v85)
            {
              v86 = *(_QWORD *)(v13 + 104);
              if (*(_BYTE *)(v86 + v84) == 10)
                *(_BYTE *)(v86 + v84) = 32;
            }
          }
          goto LABEL_83;
        }
        if (v53 > 0x7F)
          goto LABEL_82;
      }
      v68 = lexmap[v53];
      if ((v68 & 8) == 0)
        goto LABEL_77;
      if (!(_DWORD)v19)
        goto LABEL_96;
      if (!v14)
      {
        if (v53 == 10 && IsUrl(a1, v111))
        {
          ReportAttrError(a1, *(_QWORD *)(v13 + 64), 0, 65);
          v55 = 10;
          goto LABEL_83;
        }
        if (v55 == 32)
        {
          if (IsUrl(a1, v111))
            ReportAttrError(a1, *(_QWORD *)(v13 + 64), 0, 87);
          v55 = 32;
          goto LABEL_83;
        }
        v53 = 32;
      }
LABEL_82:
      AddCharToLexer(v13, v53);
      v55 = v53;
LABEL_83:
      v53 = ReadChar(*(_QWORD *)(a1 + 4832), v75, v76, v77, v78, v79, v80, v81);
      if (v53 == -1)
        goto LABEL_94;
    }
  }
  v56 = 0;
  v54 = 0;
LABEL_94:
  ReportAttrError(a1, *(_QWORD *)(v13 + 64), 0, 75);
  v88 = *(_QWORD *)(a1 + 4832);
  v89 = 0xFFFFFFFFLL;
LABEL_95:
  UngetChar((void *)v89, v88);
LABEL_96:
  v90 = v109;
  v67 = v110;
LABEL_97:
  v91 = v67;
  if (!v14
    && v54 >= 0xB
    && v56
    && !IsScript(a1, v111)
    && (!IsUrl(a1, v111)
     || tmbstrncmp((unsigned __int8 *)(*(_QWORD *)(v13 + 104) + v67), "javascript:", 11))
    && tmbstrncmp((unsigned __int8 *)(*(_QWORD *)(v13 + 104) + v67), "<xml ", 5))
  {
    ReportFatal(a1, 0, 0, 16, v92, v93, v94, v95, (char)v108);
  }
  v96 = *(_DWORD *)(v13 + 116);
  v97 = (v96 - v67);
  *(_DWORD *)(v13 + 116) = v67;
  if ((_DWORD)v19 || (int)v97 >= 1)
  {
    if (!v14
      && (int)v97 >= 1
      && tmbstrcasecmp((char *)v111, "alt")
      && tmbstrcasecmp((char *)v111, "title")
      && tmbstrcasecmp((char *)v111, "value")
      && tmbstrcasecmp((char *)v111, "prompt"))
    {
      v98 = *(_QWORD *)(v13 + 104);
      v99 = v96 - 1;
      do
      {
        v100 = v97;
        v101 = *(char *)(v98 + v99);
        if (v101 < 0)
          break;
        --v97;
        if (!v100)
          break;
        --v99;
      }
      while ((lexmap[v101] & 8) != 0);
      if ((*(char *)(v98 + v67) & 0x80000000) == 0)
      {
        v102 = *(unsigned __int8 *)(v98 + v67);
        v103 = v98 + 1;
        v104 = (int)v100;
        while ((lexmap[v102] & 8) != 0)
        {
          LODWORD(v97) = v100 - 1;
          if ((int)v100 < 1 || v91 >= v104)
            break;
          v105 = *(char *)(v103 + v91++);
          ++v67;
          v102 = v105;
          --v104;
          LODWORD(v100) = v100 - 1;
          if (v105 < 0)
            goto LABEL_133;
        }
      }
      LODWORD(v97) = v100;
    }
LABEL_133:
    result = tmbstrndup(*(_QWORD *)(v13 + 104) + v67, (int)v97);
  }
  else
  {
    result = 0;
  }
  if ((_DWORD)v19)
    v107 = (int)v19;
  else
    v107 = 34;
  *v90 = v107;
  return result;
}

const char *ReleaseDate()
{
  return "31 October 2006 - Apple Inc. build 1475";
}

char *OptGetDocDesc(int a1)
{
  char *result;
  uint64_t i;
  uint64_t v4;
  int v5;

  result = (char *)&option_docs;
  if (a1 != 25)
  {
    for (i = 0; ; i += 24)
    {
      v4 = i + 24;
      if (i == 1944)
        break;
      v5 = *(_DWORD *)((char *)&option_docs + i + 24);
      if (v5 == a1)
        return (char *)&option_docs + v4;
    }
    return 0;
  }
  return result;
}

uint64_t FileError(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return message(a1, a3, "Can't open \"%s\"\n", a4, a5, a6, a7, a8, a2);
}

uint64_t message(uint64_t a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return messagePos(a1, a2, 0, 0, a3, &a9);
}

uint64_t ReportUnknownOption(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return message(a1, 2, "unknown option: %s", a4, a5, a6, a7, a8, a2);
}

uint64_t ReportBadArgument(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return message(a1, 2, "missing or malformed argument for option: %s", a4, a5, a6, a7, a8, a2);
}

uint64_t ReportEncodingWarning(uint64_t result, int a2, int a3)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (a2 == 80)
  {
    v4 = result;
    v5 = CharEncodingName(*(_DWORD *)(*(_QWORD *)(result + 4832) + 40));
    CharEncodingName(a3);
    result = messageLexer(v4, v6, "specified input encoding (%s) does not match actual input encoding (%s)", v7, v8, v9, v10, v11, v5);
    *(_DWORD *)(v4 + 4908) |= 0x10u;
  }
  return result;
}

uint64_t messageLexer(uint64_t a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  unsigned int *v10;
  uint64_t v11;
  uint64_t v12;

  v10 = *(unsigned int **)(a1 + 104);
  if (v10)
  {
    v11 = *v10;
    v12 = v10[1];
  }
  else
  {
    v11 = 0;
    v12 = 0;
  }
  return messagePos(a1, 1, v11, v12, a3, &a9);
}

uint64_t ReportEncodingError(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  int v12;
  _OWORD v13[2];
  uint64_t v14;

  v8 = result;
  v9 = 0;
  v14 = *MEMORY[0x24BDAC8D0];
  memset(v13, 0, sizeof(v13));
  if ((_DWORD)a4)
    v10 = "discarding";
  else
    v10 = "replacing";
  while (msgFormat[v9] != (_DWORD)a2)
  {
    v9 += 4;
    if (v9 == 836)
    {
      v11 = 0;
      goto LABEL_8;
    }
  }
  v11 = *(const char **)&msgFormat[v9 + 2];
LABEL_8:
  switch((int)a2)
  {
    case 'L':
      result = NtoS(a3, v13);
      v12 = 1;
      goto LABEL_14;
    case 'M':
      result = NtoS(a3, v13);
      v12 = 2;
      goto LABEL_14;
    case 'N':
      result = tmbsnprintf((char *)v13, 32, "U+%04X", a4, a5, a6, a7, a8, a3);
      v12 = 4;
      goto LABEL_14;
    case 'O':
      result = tmbsnprintf((char *)v13, 32, "U+%04X", a4, a5, a6, a7, a8, a3);
      v12 = 8;
      goto LABEL_14;
    case 'R':
      result = NtoS(a3, v13);
      v12 = 64;
LABEL_14:
      *(_DWORD *)(v8 + 4908) |= v12;
      break;
    default:
      break;
  }
  if (v11)
    return messageLexer(v8, a2, v11, a4, a5, a6, a7, a8, (char)v10);
  return result;
}

uint64_t NtoS(uint64_t result, _BYTE *a2)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  _BYTE v5[40];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v5[0] = result - 10 * (((unint64_t)(1717986919 * (int)result) >> 34) + (1717986919 * (int)result < 0)) + 48;
  if ((result + 9) < 0x13)
  {
    LODWORD(v2) = 0;
LABEL_6:
    v3 = v2;
    v4 = a2;
    do
      *v4++ = v5[v3--];
    while (v3 != -1);
    goto LABEL_8;
  }
  v2 = 0;
  do
  {
    result = ((int)result / 10);
    v5[++v2] = result
             - 10 * (((unint64_t)(1717986919 * (int)result) >> 34) + (1717986919 * (int)result < 0))
             + 48;
  }
  while ((result + 9) >= 0x13);
  if ((v2 & 0x80000000) == 0)
    goto LABEL_6;
LABEL_8:
  a2[v2 + 1] = 0;
  return result;
}

uint64_t ReportEntityError(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  const char *v9;
  const char *v10;

  v8 = 0;
  while (msgFormat[v8] != (_DWORD)a2)
  {
    v8 += 4;
    if (v8 == 836)
      return result;
  }
  v9 = *(const char **)&msgFormat[v8 + 2];
  v10 = "NULL";
  if (a3)
    LOBYTE(v10) = a3;
  return messageLexer(result, a2, v9, a4, a5, a6, a7, a8, (char)v10);
}

uint64_t ReportAttrError(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v7;
  const char *v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16[64];
  uint64_t v17;

  v7 = 0;
  v17 = *MEMORY[0x24BDAC8D0];
  while (msgFormat[v7] != a4)
  {
    v7 += 4;
    if (v7 == 836)
    {
      v8 = 0;
      goto LABEL_6;
    }
  }
  v8 = *(const char **)&msgFormat[v7 + 2];
LABEL_6:
  result = (uint64_t)TagToString(a2, v16, 64);
  switch(a4)
  {
    case '0':
    case '1':
    case '2':
    case '3':
    case '5':
    case '9':
    case 'D':
    case 'H':
    case 'I':
      result = messageNode(a1, 1, a2, v8, v12, v13, v14, v15, (char)v16);
      break;
    case '4':
    case '6':
    case '7':
    case ':':
    case ';':
    case '<':
    case '=':
    case '>':
    case '?':
    case '@':
    case 'A':
    case 'B':
    case 'E':
    case 'F':
    case 'G':
    case 'J':
    case 'W':
      result = messageNode(a1, 1, a2, v8, v12, v13, v14, v15, (char)v16);
      break;
    case '8':
      result = messageNode(a1, 1, a2, v8, v12, v13, v14, v15, (char)v16);
      *(_DWORD *)(a1 + 4900) |= 8u;
      break;
    case 'K':
      **(int32x2_t **)(a1 + 104) = vrev64_s32(*(int32x2_t *)(*(_QWORD *)(a1 + 4832) + 32));
      result = messageLexer(a1, v10, v8, v11, v12, v13, v14, v15, (char)v16);
      break;
    default:
      return result;
  }
  return result;
}

_BYTE *TagToString(uint64_t a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  int v13;
  uint64_t v14;

  *a2 = 0;
  if (a1)
  {
    if (nodeIsElement(a1))
    {
      v14 = *(_QWORD *)(a1 + 64);
      v11 = "<%s>";
LABEL_4:
      tmbsnprintf(a2, a3, v11, v6, v7, v8, v9, v10, v14);
      return tmbstrlen(a2);
    }
    v13 = *(_DWORD *)(a1 + 80);
    if (v13 > 5)
    {
      if (v13 == 13)
      {
        v11 = "XML declaration";
        goto LABEL_4;
      }
      if (v13 == 6)
      {
        tmbsnprintf(a2, a3, "</%s>", v6, v7, v8, v9, v10, *(_QWORD *)(a1 + 64));
        return tmbstrlen(a2);
      }
    }
    else
    {
      if (v13 == 1)
      {
        v11 = "<!DOCTYPE>";
        goto LABEL_4;
      }
      if (v13 == 4)
      {
        v11 = "plain text";
        goto LABEL_4;
      }
    }
    if (*(_QWORD *)(a1 + 64))
      tmbsnprintf(a2, a3, "%s", v6, v7, v8, v9, v10, *(_QWORD *)(a1 + 64));
  }
  return tmbstrlen(a2);
}

uint64_t messageNode(uint64_t a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v11;
  uint64_t v12;
  unsigned int *v13;

  if (a3)
  {
    v11 = *(unsigned int *)(a3 + 84);
    v12 = *(unsigned int *)(a3 + 88);
  }
  else
  {
    v13 = *(unsigned int **)(a1 + 104);
    if (v13)
    {
      v11 = *v13;
      v12 = v13[1];
    }
    else
    {
      v11 = 0;
      v12 = 0;
    }
  }
  return messagePos(a1, a2, v11, v12, a4, &a9);
}

uint64_t ReportMissingAttr(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9[64];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  TagToString(a2, v9, 64);
  return messageNode(a1, 1, a2, "%s lacks \"%s\" attribute", v4, v5, v6, v7, (char)v9);
}

uint64_t DisplayHTMLTableAlgorithm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  char v95;
  char v96;
  char v97;
  char v98;
  char v99;
  char v100;
  char v101;
  char v102;
  char v103;
  char v104;
  char v105;
  char v106;
  char v107;
  char v108;

  tidy_out(a1, " \n", a3, a4, a5, a6, a7, a8, v95);
  tidy_out(a1, "      - First, search left from the cell's position to find row header cells.\n", v10, v11, v12, v13, v14, v15, v96);
  tidy_out(a1, "      - Then search upwards to find column header cells.\n", v16, v17, v18, v19, v20, v21, v97);
  tidy_out(a1, "      - The search in a given direction stops when the edge of the table is\n", v22, v23, v24, v25, v26, v27, v98);
  tidy_out(a1, "        reached or when a data cell is found after a header cell.\n", v28, v29, v30, v31, v32, v33, v99);
  tidy_out(a1, "      - Row headers are inserted into the list in the order they appear in\n", v34, v35, v36, v37, v38, v39, v100);
  tidy_out(a1, "        the table. \n", v40, v41, v42, v43, v44, v45, v101);
  tidy_out(a1, "      - For left-to-right tables, headers are inserted from left to right.\n", v46, v47, v48, v49, v50, v51, v102);
  tidy_out(a1, "      - Column headers are inserted after row headers, in \n", v52, v53, v54, v55, v56, v57, v103);
  tidy_out(a1, "        the order they appear in the table, from top to bottom. \n", v58, v59, v60, v61, v62, v63, v104);
  tidy_out(a1, "      - If a header cell has the headers attribute set, then the headers \n", v64, v65, v66, v67, v68, v69, v105);
  tidy_out(a1, "        referenced by this attribute are inserted into the list and the \n", v70, v71, v72, v73, v74, v75, v106);
  tidy_out(a1, "        search stops for the current direction.\n", v76, v77, v78, v79, v80, v81, v107);
  tidy_out(a1, "        TD cells that set the axis attribute are also treated as header cells.\n", v82, v83, v84, v85, v86, v87, v108);
  return tidy_out(a1, " \n", v88, v89, v90, v91, v92, v93, a9);
}

uint64_t tidy_out(uint64_t result, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v9;
  char v10;
  unsigned __int8 *v11;
  int v12;
  char v13;
  _BYTE v14[2055];

  *(_QWORD *)&v14[2047] = *MEMORY[0x24BDAC8D0];
  if (!*(_DWORD *)(result + 256))
  {
    v9 = result;
    result = tmbvsnprintf(&v13, 2048, a2, &a9);
    v10 = v13;
    if (v13)
    {
      v11 = v14;
      do
      {
        result = WriteChar(v10, *(_QWORD *)(v9 + 4848));
        v12 = *v11++;
        v10 = v12;
      }
      while (v12);
    }
  }
  return result;
}

uint64_t ReportAccessWarning(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v9;
  const char *v10;

  v9 = 0;
  while (msgFormat[v9] != a3)
  {
    v9 += 4;
    if (v9 == 836)
    {
      v10 = 0;
      goto LABEL_6;
    }
  }
  v10 = *(const char **)&msgFormat[v9 + 2];
LABEL_6:
  *(_DWORD *)(a1 + 4900) = 1;
  return messageNode(a1, 3, a2, v10, a5, a6, a7, a8, a9);
}

_BYTE *ReportWarning(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  _BYTE *result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _OWORD *v20;
  char v21;
  _OWORD v22[16];
  _OWORD v23[16];
  uint64_t v24;

  v8 = 0;
  v24 = *MEMORY[0x24BDAC8D0];
  if (a2)
    v9 = a2;
  else
    v9 = a3;
  while (msgFormat[v8] != a4)
  {
    v8 += 4;
    if (v8 == 836)
    {
      v10 = 0;
      goto LABEL_8;
    }
  }
  v10 = *(const char **)&msgFormat[v8 + 2];
LABEL_8:
  memset(v23, 0, sizeof(v23));
  memset(v22, 0, sizeof(v22));
  result = TagToString(a3, (char *)v23, 256);
  if (a4 > 39)
  {
    if (a4 != 85)
    {
      if (a4 != 40)
        return result;
      return (_BYTE *)messageNode(a1, 1, v9, v10, v12, v13, v14, v15, v21);
    }
    v20 = *(_OWORD **)(a3 + 64);
LABEL_17:
    v21 = (char)v20;
    return (_BYTE *)messageNode(a1, 1, v9, v10, v12, v13, v14, v15, v21);
  }
  if (a4 == 9)
  {
    v20 = v23;
    goto LABEL_17;
  }
  if (a4 == 20)
  {
    TagToString(a2, (char *)v22, 256);
    return (_BYTE *)messageNode(a1, 1, v9, v10, v16, v17, v18, v19, (char)v22);
  }
  return result;
}

_BYTE *ReportNotice(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v5;
  uint64_t v8;
  const char *v9;
  _BYTE *result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _OWORD v19[16];
  _OWORD v20[16];
  uint64_t v21;

  v5 = a3;
  v8 = 0;
  v21 = *MEMORY[0x24BDAC8D0];
  while (msgFormat[v8] != a4)
  {
    v8 += 4;
    if (v8 == 836)
    {
      v9 = 0;
      goto LABEL_6;
    }
  }
  v9 = *(const char **)&msgFormat[v8 + 2];
LABEL_6:
  memset(v20, 0, sizeof(v20));
  memset(v19, 0, sizeof(v19));
  result = TagToString(a3, (char *)v20, 256);
  if (a4 == 83)
  {
    if (a2)
      v5 = a2;
    TagToString(a2, (char *)v19, 256);
    return (_BYTE *)messageNode(a1, 1, v5, v9, v15, v16, v17, v18, (char)v19);
  }
  else if (a4 == 23)
  {
    TagToString(a2, (char *)v19, 256);
    return (_BYTE *)messageNode(a1, 1, a2, v9, v11, v12, v13, v14, (char)v19);
  }
  return result;
}

uint64_t ReportError(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _OWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _OWORD *v25;
  _OWORD v26[16];
  _OWORD v27[16];
  uint64_t v28;

  v8 = 0;
  v28 = *MEMORY[0x24BDAC8D0];
  memset(v27, 0, sizeof(v27));
  memset(&v26[2], 0, 224);
  if (a2)
    v9 = a2;
  else
    v9 = a3;
  memset(v26, 0, 32);
  while (msgFormat[v8] != a4)
  {
    v8 += 4;
    if (v8 == 836)
    {
      v10 = 0;
      goto LABEL_9;
    }
  }
  v10 = *(const char **)&msgFormat[v8 + 2];
LABEL_9:
  result = (uint64_t)TagToString(a3, (char *)v27, 256);
  switch(a4)
  {
    case 6:
      v21 = *(_QWORD *)(a2 + 64);
      goto LABEL_20;
    case 7:
      v21 = *(_QWORD *)(a2 + 64);
      goto LABEL_20;
    case 8:
      if (*(_DWORD *)(a1 + 4912))
        v23 = 4;
      else
        v23 = 1;
      v25 = v27;
      v22 = a1;
      goto LABEL_17;
    case 10:
    case 24:
      v21 = *(_QWORD *)(a3 + 64);
LABEL_20:
      LOBYTE(v25) = v21;
      goto LABEL_27;
    case 11:
      v25 = v27;
      goto LABEL_27;
    case 12:
    case 13:
    case 15:
    case 38:
      v16 = *(_OWORD **)(a3 + 64);
      goto LABEL_15;
    case 14:
    case 19:
    case 21:
    case 26:
    case 39:
      v16 = v27;
      goto LABEL_15;
    case 17:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 35:
    case 37:
      goto LABEL_27;
    case 23:
    case 25:
    case 36:
    case 41:
      TagToString(a2, (char *)v26, 256);
      return messageNode(a1, 1, a2, v10, v17, v18, v19, v20, (char)v26);
    case 42:
    case 44:
    case 45:
      goto LABEL_16;
    case 46:
    case 47:
      v16 = *(_OWORD **)(a3 + 64);
LABEL_15:
      LOBYTE(v25) = (_BYTE)v16;
LABEL_16:
      v22 = a1;
      v23 = 1;
LABEL_17:
      v24 = a3;
      goto LABEL_28;
    case 84:
      TagToString(a2, (char *)v26, 256);
      v25 = v26;
LABEL_27:
      v22 = a1;
      v23 = 1;
      v24 = v9;
LABEL_28:
      result = messageNode(v22, v23, v24, v10, v12, v13, v14, v15, (char)v25);
      break;
    default:
      return result;
  }
  return result;
}

uint64_t ReportFatal(uint64_t result, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _OWORD v18[16];
  uint64_t v19;

  v9 = a3;
  v10 = result;
  v11 = 0;
  v19 = *MEMORY[0x24BDAC8D0];
  memset(v18, 0, sizeof(v18));
  while (msgFormat[v11] != a4)
  {
    v11 += 4;
    if (v11 == 836)
    {
      v12 = 0;
      goto LABEL_6;
    }
  }
  v12 = *(const char **)&msgFormat[v11 + 2];
LABEL_6:
  switch(a4)
  {
    case 13:
      v13 = *(_QWORD *)(a3 + 64);
      goto LABEL_13;
    case 14:
    case 15:
    case 17:
    case 19:
    case 20:
    case 21:
      return result;
    case 16:
    case 18:
      if (a2)
        a3 = a2;
      result = messageNode(result, 4, a3, v12, a5, a6, a7, a8, a9);
      break;
    case 22:
      TagToString(a3, (char *)v18, 256);
      result = messageNode(v10, 4, v9, v12, v14, v15, v16, v17, (char)v18);
      break;
    default:
      if (a4 == 47)
      {
        v13 = *(_QWORD *)(a3 + 64);
LABEL_13:
        result = messageNode(result, 4, a3, v12, a5, a6, a7, a8, v13);
      }
      break;
  }
  return result;
}

_DWORD *ErrorSummary(_DWORD *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v9;
  unsigned int v10;
  const char *v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  int v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  const char *v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  int v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  uint64_t v330;
  uint64_t v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  uint64_t v335;
  uint64_t v336;
  uint64_t v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  uint64_t v341;
  uint64_t v342;
  uint64_t v343;
  uint64_t v344;
  uint64_t v345;
  uint64_t v346;
  uint64_t v347;
  uint64_t v348;
  uint64_t v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t v352;
  uint64_t v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  uint64_t v359;
  uint64_t v360;
  uint64_t v361;
  uint64_t v362;
  uint64_t v363;
  uint64_t v364;
  uint64_t v365;
  uint64_t v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t v369;
  uint64_t v370;
  uint64_t v371;
  uint64_t v372;
  uint64_t v373;
  uint64_t v374;
  uint64_t v375;
  uint64_t v376;
  uint64_t v377;
  uint64_t v378;
  uint64_t v379;
  uint64_t v380;
  uint64_t v381;
  uint64_t v382;
  uint64_t v383;
  uint64_t v384;
  uint64_t v385;
  uint64_t v386;
  uint64_t v387;
  uint64_t v388;
  uint64_t v389;
  uint64_t v390;
  uint64_t v391;
  uint64_t v392;
  uint64_t v393;
  uint64_t v394;
  uint64_t v395;
  uint64_t v396;
  uint64_t v397;
  uint64_t v398;
  uint64_t v399;
  uint64_t v400;
  uint64_t v401;
  char v402;
  char v403;
  char v404;
  char v405;
  char v406;
  char v407;
  char v408;
  char v409;
  char v410;
  char v411;
  char v412;
  char v413;
  char v414;
  char v415;
  char v416;
  char v417;
  char v418;
  char v419;
  char v420;
  char v421;
  char v422;
  char v423;
  char v424;
  char v425;
  char v426;
  char v427;
  char v428;
  char v429;
  char v430;
  char v431;
  char v432;
  char v433;
  char v434;
  char v435;
  char v436;
  char v437;
  char v438;
  char v439;
  char v440;
  char v441;
  char v442;
  char v443;
  char v444;
  char v445;
  char v446;
  char v447;
  char v448;
  char v449;
  char v450;
  char v451;
  char v452;
  char v453;
  char v454;
  char v455;
  char v456;
  char v457;
  char v458;
  char v459;
  char v460;
  char v461;
  char v462;

  v9 = (uint64_t)result;
  v10 = result[36] - 2;
  if (v10 > 6)
    v11 = "specified";
  else
    v11 = off_24C37C480[v10];
  v12 = result[1225];
  if ((v12 & 0x20) != 0)
    result[1225] = v12 & 0xFFFFFFCF;
  v13 = result[1227];
  if (v13)
  {
    if ((v13 & 1) != 0)
    {
      tidy_out((uint64_t)result, "It is unlikely that vendor-specific, system-dependent encodings\n", a3, a4, a5, a6, a7, a8, v402);
      tidy_out(v9, "work widely enough on the World Wide Web; you should avoid using the \n",
        v14,
        v15,
        v16,
        v17,
        v18,
        v19,
        v403);
      tidy_out(v9, "%s", v20, v21, v22, v23, v24, v25, (char)v11);
      tidy_out(v9, " character encoding, instead you are recommended to\n", v26, v27, v28, v29, v30, v31, v404);
      result = (_DWORD *)tidy_out(v9, "use named entities, e.g. &trade;.\n\n", v32, v33, v34, v35, v36, v37, v405);
      v13 = *(_DWORD *)(v9 + 4908);
    }
    if ((v13 & 0x42) != 0)
    {
      tidy_out(v9, "Character codes 128 to 159 (U+0080 to U+009F) are not allowed in HTML;\n",
        a3,
        a4,
        a5,
        a6,
        a7,
        a8,
        v402);
      tidy_out(v9, "even if they were, they would likely be unprintable control characters.\n", v38, v39, v40, v41, v42, v43, v406);
      tidy_out(v9, "Tidy assumed you wanted to refer to a character with the same byte value in the \n", v44, v45, v46, v47, v48, v49, v407);
      tidy_out(v9, "%s", v50, v51, v52, v53, v54, v55, (char)v11);
      result = (_DWORD *)tidy_out(v9, " encoding and replaced that reference with the Unicode equivalent.\n\n", v56, v57, v58, v59, v60, v61, v408);
      v13 = *(_DWORD *)(v9 + 4908);
    }
    if ((v13 & 4) != 0)
    {
      tidy_out(v9, "Character codes for UTF-8 must be in the range: U+0000 to U+10FFFF.\n", a3, a4, a5, a6, a7, a8, v402);
      tidy_out(v9, "The definition of UTF-8 in Annex D of ISO/IEC 10646-1:2000 also\n", v161, v162, v163, v164, v165, v166, v423);
      tidy_out(v9, "allows for the use of five- and six-byte sequences to encode\n", v167, v168, v169, v170, v171, v172, v424);
      tidy_out(v9, "characters that are outside the range of the Unicode character set;\n",
        v173,
        v174,
        v175,
        v176,
        v177,
        v178,
        v425);
      tidy_out(v9, "those five- and six-byte sequences are illegal for the use of\n", v179, v180, v181, v182, v183, v184, v426);
      tidy_out(v9, "UTF-8 as a transformation of Unicode characters. ISO/IEC 10646\n", v185, v186, v187, v188, v189, v190, v427);
      tidy_out(v9, "does not allow mapping of unpaired surrogates, nor U+FFFE and U+FFFF\n", v191, v192, v193, v194, v195, v196, v428);
      tidy_out(v9, "(but it does allow other noncharacters). For more information please refer to\n", v197, v198, v199, v200, v201, v202, v429);
      result = (_DWORD *)tidy_out(v9, "http://www.unicode.org/unicode and http://www.cl.cam.ac.uk/~mgk25/unicode.html\n\n", v203, v204, v205, v206, v207, v208, v430);
      v13 = *(_DWORD *)(v9 + 4908);
      if ((v13 & 8) == 0)
      {
LABEL_13:
        if ((v13 & 0x20) == 0)
          goto LABEL_15;
        goto LABEL_14;
      }
    }
    else if ((v13 & 8) == 0)
    {
      goto LABEL_13;
    }
    tidy_out(v9, "Character codes for UTF-16 must be in the range: U+0000 to U+10FFFF.\n", a3, a4, a5, a6, a7, a8, v402);
    tidy_out(v9, "The definition of UTF-16 in Annex C of ISO/IEC 10646-1:2000 does not allow the\n", v209, v210, v211, v212, v213, v214, v431);
    tidy_out(v9, "mapping of unpaired surrogates. For more information please refer to\n", v215, v216, v217, v218, v219, v220, v432);
    result = (_DWORD *)tidy_out(v9, "http://www.unicode.org/unicode and http://www.cl.cam.ac.uk/~mgk25/unicode.html\n\n", v221, v222, v223, v224, v225, v226, v433);
    if ((*(_DWORD *)(v9 + 4908) & 0x20) != 0)
    {
LABEL_14:
      tidy_out(v9, "URIs must be properly escaped, they must not contain unescaped\n", a3, a4, a5, a6, a7, a8, v402);
      tidy_out(v9, "characters below U+0021 including the space character and not\n", v62, v63, v64, v65, v66, v67, v409);
      tidy_out(v9, "above U+007E. Tidy escapes the URI for you as recommended by\n", v68, v69, v70, v71, v72, v73, v410);
      tidy_out(v9, "HTML 4.01 section B.2.1 and XML 1.0 section 4.2.2. Some user agents\n", v74, v75, v76, v77, v78, v79, v411);
      tidy_out(v9, "use another algorithm to escape such URIs and some server-sided\n", v80, v81, v82, v83, v84, v85, v412);
      tidy_out(v9, "scripts depend on that. If you want to depend on that, you must\n", v86, v87, v88, v89, v90, v91, v413);
      tidy_out(v9, "escape the URI by your own. For more information please refer to\n", v92, v93, v94, v95, v96, v97, v414);
      result = (_DWORD *)tidy_out(v9, "http://www.w3.org/International/O-URL-and-ident.html\n\n", v98, v99, v100, v101, v102, v103, v415);
    }
  }
LABEL_15:
  if (*(_DWORD *)(v9 + 4912))
  {
    tidy_out(v9, "You may need to move one or both of the <form> and </form>\n", a3, a4, a5, a6, a7, a8, v402);
    tidy_out(v9, "tags. HTML elements should be properly nested and form elements\n", v104, v105, v106, v107, v108, v109, v416);
    tidy_out(v9, "are no exception. For instance you should not place the <form>\n", v110, v111, v112, v113, v114, v115, v417);
    tidy_out(v9, "in one table cell and the </form> in another. If the <form> is\n", v116, v117, v118, v119, v120, v121, v418);
    tidy_out(v9, "placed before a table, the </form> cannot be placed inside the\n", v122, v123, v124, v125, v126, v127, v419);
    result = (_DWORD *)tidy_out(v9, "table! Note that one form can't be nested inside another!\n\n", v128, v129, v130, v131, v132, v133, v420);
  }
  v134 = *(_DWORD *)(v9 + 4900);
  if (v134)
  {
    if (*(_QWORD *)(v9 + 744))
    {
      tidy_out(v9, "For further advice on how to make your pages accessible, see\n", a3, a4, a5, a6, a7, a8, v402);
      tidy_out(v9, "%s", v135, v136, v137, v138, v139, v140, (char)"http://www.w3.org/WAI/GL");
      tidy_out(v9, " and\n", v141, v142, v143, v144, v145, v146, v421);
      tidy_out(v9, "%s", v147, v148, v149, v150, v151, v152, (char)"http://www.aprompt.ca/Tidy/accessibilitychecks.html");
      v159 = "You may also want to try \"http://www.cast.org/bobby/\" which is a free Web-based\n";
      v160 = ".\n";
LABEL_31:
      tidy_out(v9, v160, v153, v154, v155, v156, v157, v158, v422);
      tidy_out(v9, v159, v269, v270, v271, v272, v273, v274, v441);
      result = (_DWORD *)tidy_out(v9, "service for checking URLs for accessibility.\n\n", v275, v276, v277, v278, v279, v280, v442);
      goto LABEL_32;
    }
    if ((v134 & 4) != 0)
    {
      tidy_out(v9, "The table summary attribute should be used to describe\n", a3, a4, a5, a6, a7, a8, v402);
      tidy_out(v9, "the table structure. It is very helpful for people using\n", v336, v337, v338, v339, v340, v341, v452);
      tidy_out(v9, "non-visual browsers. The scope and headers attributes for\n", v342, v343, v344, v345, v346, v347, v453);
      tidy_out(v9, "table cells are useful for specifying which headers apply\n", v348, v349, v350, v351, v352, v353, v454);
      tidy_out(v9, "to each table cell, enabling non-visual browsers to provide\n", v354, v355, v356, v357, v358, v359, v455);
      tidy_out(v9, "a meaningful context for each cell.\n\n", v360, v361, v362, v363, v364, v365, v456);
      v134 = *(_DWORD *)(v9 + 4900);
      if ((v134 & 1) == 0)
      {
LABEL_25:
        if ((v134 & 8) == 0)
          goto LABEL_26;
        goto LABEL_46;
      }
    }
    else if ((v134 & 1) == 0)
    {
      goto LABEL_25;
    }
    tidy_out(v9, "The alt attribute should be used to give a short description\n", a3, a4, a5, a6, a7, a8, v402);
    tidy_out(v9, "of an image; longer descriptions should be given with the\n",
      v366,
      v367,
      v368,
      v369,
      v370,
      v371,
      v457);
    tidy_out(v9, "longdesc attribute which takes a URL linked to the description.\n", v372, v373, v374, v375, v376, v377, v458);
    tidy_out(v9, "These measures are needed for people using non-graphical browsers.\n\n", v378, v379, v380, v381, v382, v383, v459);
    v134 = *(_DWORD *)(v9 + 4900);
    if ((v134 & 8) == 0)
    {
LABEL_26:
      if ((v134 & 2) == 0)
      {
LABEL_28:
        if ((v134 & 0x30) == 0x10)
        {
          tidy_out(v9, "Pages designed using frames presents problems for\n", a3, a4, a5, a6, a7, a8, v402);
          tidy_out(v9, "people who are either blind or using a browser that\n", v239, v240, v241, v242, v243, v244, v436);
          tidy_out(v9, "doesn't support frames. A frames-based page should always\n", v245, v246, v247, v248, v249, v250, v437);
          tidy_out(v9, "include an alternative layout inside a NOFRAMES element.\n\n", v251, v252, v253, v254, v255, v256, v438);
        }
        tidy_out(v9, "For further advice on how to make your pages accessible\n", a3, a4, a5, a6, a7, a8, v402);
        tidy_out(v9, "see ", v257, v258, v259, v260, v261, v262, v439);
        tidy_out(v9, "http://www.w3.org/WAI/GL", v263, v264, v265, v266, v267, v268, v440);
        v159 = "\"http://www.cast.org/bobby/\" which is a free Web-based\n";
        v160 = ". You may also want to try\n";
        goto LABEL_31;
      }
LABEL_27:
      tidy_out(v9, "For hypertext links defined using a client-side image map, you\n", a3, a4, a5, a6, a7, a8, v402);
      tidy_out(v9, "need to use the alt attribute to provide a textual description\n", v227, v228, v229, v230, v231, v232, v434);
      tidy_out(v9, "of the link for people using non-graphical browsers.\n\n", v233, v234, v235, v236, v237, v238, v435);
      v134 = *(_DWORD *)(v9 + 4900);
      goto LABEL_28;
    }
LABEL_46:
    tidy_out(v9, "Use client-side image maps in preference to server-side image\n", a3, a4, a5, a6, a7, a8, v402);
    tidy_out(v9, "maps as the latter are inaccessible to people using non-\n", v384, v385, v386, v387, v388, v389, v460);
    tidy_out(v9, "graphical browsers. In addition, client-side maps are easier\n", v390, v391, v392, v393, v394, v395, v461);
    tidy_out(v9, "to set up and provide immediate feedback to users.\n\n", v396, v397, v398, v399, v400, v401, v462);
    v134 = *(_DWORD *)(v9 + 4900);
    if ((v134 & 2) == 0)
      goto LABEL_28;
    goto LABEL_27;
  }
LABEL_32:
  v281 = *(_DWORD *)(v9 + 4904);
  if (!v281)
    return result;
  if ((v281 & 2) != 0)
  {
    tidy_out(v9, "The Cascading Style Sheets (CSS) Positioning mechanism\n", a3, a4, a5, a6, a7, a8, v402);
    tidy_out(v9, "is recommended in preference to the proprietary <LAYER>\n", v282, v283, v284, v285, v286, v287, v443);
    result = (_DWORD *)tidy_out(v9, "element due to limited vendor support for LAYER.\n\n", v288, v289, v290, v291, v292, v293, v444);
    v281 = *(_DWORD *)(v9 + 4904);
    if ((v281 & 1) == 0)
    {
LABEL_35:
      if ((v281 & 8) == 0)
        goto LABEL_36;
      goto LABEL_41;
    }
  }
  else if ((v281 & 1) == 0)
  {
    goto LABEL_35;
  }
  tidy_out(v9, "You are recommended to use CSS for controlling white\n", a3, a4, a5, a6, a7, a8, v402);
  tidy_out(v9, "space (e.g. for indentation, margins and line spacing).\n", v294, v295, v296, v297, v298, v299, v445);
  result = (_DWORD *)tidy_out(v9, "The proprietary <SPACER> element has limited vendor support.\n\n", v300, v301, v302, v303, v304, v305, v446);
  v281 = *(_DWORD *)(v9 + 4904);
  if ((v281 & 8) == 0)
  {
LABEL_36:
    if ((v281 & 4) == 0)
      goto LABEL_37;
    goto LABEL_42;
  }
LABEL_41:
  tidy_out(v9, "You are recommended to use CSS to specify the font and\n", a3, a4, a5, a6, a7, a8, v402);
  tidy_out(v9, "properties such as its size and color. This will reduce\n", v306, v307, v308, v309, v310, v311, v447);
  tidy_out(v9, "the size of HTML files and make them easier to maintain\n", v312, v313, v314, v315, v316, v317, v448);
  result = (_DWORD *)tidy_out(v9, "compared with using <FONT> elements.\n\n", v318, v319, v320, v321, v322, v323, v449);
  v281 = *(_DWORD *)(v9 + 4904);
  if ((v281 & 4) == 0)
  {
LABEL_37:
    if ((v281 & 0x10) == 0)
      return result;
    return (_DWORD *)tidy_out(v9, "You are recommended to use CSS to specify page and link colors\n", a3, a4, a5, a6, a7, a8, a9);
  }
LABEL_42:
  tidy_out(v9, "You are recommended to use CSS to control line wrapping.\n", a3, a4, a5, a6, a7, a8, v402);
  tidy_out(v9, "Use \"white-space: nowrap\" to inhibit wrapping in place\n", v324, v325, v326, v327, v328, v329, v450);
  result = (_DWORD *)tidy_out(v9, "of inserting <NOBR>...</NOBR> into the markup.\n\n", v330, v331, v332, v333, v334, v335, v451);
  if ((*(_DWORD *)(v9 + 4904) & 0x10) != 0)
    return (_DWORD *)tidy_out(v9, "You are recommended to use CSS to specify page and link colors\n", a3, a4, a5, a6, a7, a8, a9);
  return result;
}

uint64_t NeedsAuthorIntervention(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v17;

  tidy_out(a1, "This document has errors that must be fixed before\n", a3, a4, a5, a6, a7, a8, v17);
  return tidy_out(a1, "using HTML Tidy to generate a tidied up version.\n\n", v10, v11, v12, v13, v14, v15, a9);
}

uint64_t GeneralInfo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v29;
  char v30;
  char v31;

  tidy_out(a1, "To learn more about HTML Tidy see http://tidy.sourceforge.net\n", a3, a4, a5, a6, a7, a8, v29);
  tidy_out(a1, "Please send bug reports to html-tidy@w3.org\n", v10, v11, v12, v13, v14, v15, v30);
  tidy_out(a1, "HTML and CSS specifications are available from http://www.w3.org/\n", v16, v17, v18, v19, v20, v21, v31);
  return tidy_out(a1, "Lobby your company to join W3C, see http://www.w3.org/Consortium\n", v22, v23, v24, v25, v26, v27, a9);
}

uint64_t AccessibilityHelloMessage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v23;
  char v24;

  tidy_out(a1, "\n", a3, a4, a5, a6, a7, a8, v23);
  tidy_out(a1, "Accessibility Checks: Version 0.1\n", v10, v11, v12, v13, v14, v15, v24);
  return tidy_out(a1, "\n", v16, v17, v18, v19, v20, v21, a9);
}

uint64_t ReportMarkupVersion(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v9 = result;
  if (*(_QWORD *)(result + 4952))
    result = message(result, 0, "Doctype given is \"%s\"", a4, a5, a6, a7, a8, *(_QWORD *)(result + 4952));
  if (!*(_DWORD *)(v9 + 280))
  {
    v10 = ApparentVersion(v9);
    v11 = HTMLVersionNameFromCode(v10);
    v17 = "HTML Proprietary";
    if (v11)
      LOBYTE(v17) = v11;
    message(v9, 0, "Document content looks like %s", v12, v13, v14, v15, v16, (char)v17);
    result = WarnMissingSIInEmittedDocType(v9);
    if ((_DWORD)result)
      return message(v9, 0, "No system identifier in emitted doctype", v18, v19, v20, v21, v22, a9);
  }
  return result;
}

uint64_t ReportNumWarnings(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  const char *v10;

  if (*(_QWORD *)(a1 + 4876))
  {
    tidy_out(a1, "%u %s, %u %s were found!", a3, a4, a5, a6, a7, a8, *(_DWORD *)(a1 + 4880));
    v10 = " Not all warnings/errors were shown.\n\n";
    if (*(_QWORD *)(a1 + 632) >= (unint64_t)*(unsigned int *)(a1 + 4876) && *(_DWORD *)(a1 + 248))
      v10 = "\n\n";
  }
  else
  {
    v10 = "No warnings or errors were found.\n\n";
  }
  return tidy_out(a1, v10, a3, a4, a5, a6, a7, a8, a9);
}

uint64_t messagePos(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, const char *a5, va_list a6)
{
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t, uint64_t, uint64_t, char *);
  uint64_t v18;
  char v19;
  unsigned __int8 *v20;
  int v21;
  char v22;
  unsigned __int8 *v23;
  int v24;
  char v25;
  unsigned __int8 *v26;
  int v27;
  char v28;
  _BYTE v29[63];
  char v30;
  _BYTE v31[2055];

  v9 = result;
  *(_QWORD *)&v31[2047] = *MEMORY[0x24BDAC8D0];
  v10 = *(unsigned int *)(result + 4876);
  v11 = *(_QWORD *)(result + 632);
  switch((int)a2)
  {
    case 0:
      ++*(_DWORD *)(result + 4888);
      goto LABEL_10;
    case 1:
      ++*(_DWORD *)(result + 4880);
      if (v11 <= v10 || !*(_DWORD *)(result + 248))
        return result;
      goto LABEL_11;
    case 2:
      ++*(_DWORD *)(result + 4872);
      goto LABEL_10;
    case 3:
      ++*(_DWORD *)(result + 4884);
      goto LABEL_10;
    case 4:
      *(_DWORD *)(result + 4876) = v10 + 1;
      goto LABEL_10;
    case 5:
      ++*(_DWORD *)(result + 4892);
      goto LABEL_10;
    default:
LABEL_10:
      if (v11 > v10)
      {
LABEL_11:
        tmbvsnprintf(&v30, 2048, a5, a6);
        v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, char *))(v9 + 4856);
        if (!v17 || (result = v17(v9, a2, a3, a4, &v30), (_DWORD)result))
        {
          if ((int)a3 >= 1 && (int)a4 >= 1)
          {
            v28 = 0;
            if (*(_DWORD *)(v9 + 560) && (v18 = *(_QWORD *)(v9 + 568)) != 0)
              tmbsnprintf(&v28, 64, "%s:%d:%d: ", v12, v13, v14, v15, v16, v18);
            else
              tmbsnprintf(&v28, 64, "line %d column %d - ", v12, v13, v14, v15, v16, a3);
            tmbstrlen(&v28);
            v19 = v28;
            if (v28)
            {
              v20 = v29;
              do
              {
                WriteChar(v19, *(_QWORD *)(v9 + 4848));
                v21 = *v20++;
                v19 = v21;
              }
              while (v21);
            }
          }
          v28 = 0;
          if (a2 <= 6)
            tmbstrncpy(&v28, off_24C37C4B8[(int)a2], 64);
          tmbstrlen(&v28);
          v22 = v28;
          if (v28)
          {
            v23 = v29;
            do
            {
              WriteChar(v22, *(_QWORD *)(v9 + 4848));
              v24 = *v23++;
              v22 = v24;
            }
            while (v24);
          }
          v25 = v30;
          if (v30)
          {
            v26 = v31;
            do
            {
              WriteChar(v25, *(_QWORD *)(v9 + 4848));
              v27 = *v26++;
              v25 = v27;
            }
            while (v27);
          }
          return WriteChar(10, *(_QWORD *)(v9 + 4848));
        }
      }
      return result;
  }
}

uint64_t CheckNodeIntegrity(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t **v6;

  v2 = a1[1];
  if (!v2 || *(uint64_t **)(v2 + 16) == a1)
  {
    v3 = a1[2];
    if (!v3 || *(uint64_t **)(v3 + 8) == a1)
    {
      v5 = *a1;
      if (!*a1 || (v2 || *(uint64_t **)(v5 + 24) == a1) && (v3 || *(uint64_t **)(v5 + 32) == a1))
      {
        v6 = (uint64_t **)a1[3];
        if (!v6)
          return 1;
        while (*v6 == a1)
        {
          result = CheckNodeIntegrity(v6);
          if (!(_DWORD)result)
            return result;
          v6 = (uint64_t **)v6[2];
          if (!v6)
            return 1;
        }
      }
    }
  }
  return 0;
}

uint64_t IsNewNode(uint64_t a1)
{
  uint64_t v1;

  if (a1 && (v1 = *(_QWORD *)(a1 + 56)) != 0)
    return *(_DWORD *)(v1 + 32) & 0x100000;
  else
    return 1;
}

_BYTE *CoerceNode(uint64_t a1, uint64_t a2, int a3, int a4, int a5)
{
  int *v9;
  void **v10;
  void *v11;
  _BYTE *result;

  v9 = LookupTagDef(a3);
  v10 = (void **)InferredTag(a1, *v9);
  if (a4)
  {
    ReportWarning(a1, a2, (uint64_t)v10, 20);
  }
  else if (a5)
  {
    ReportError(a1, a2, (uint64_t)v10, 84);
  }
  else
  {
    ReportNotice(a1, a2, (uint64_t)v10, 83);
  }
  MemFree(v10[8]);
  MemFree(v10);
  v11 = *(void **)(a2 + 64);
  *(_QWORD *)(a2 + 48) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a2 + 56) = v9;
  *(_DWORD *)(a2 + 80) = 5;
  *(_DWORD *)(a2 + 96) = 1;
  MemFree(v11);
  result = tmbstrdup(*((_BYTE **)v9 + 1));
  *(_QWORD *)(a2 + 64) = result;
  return result;
}

uint64_t *RemoveNode(uint64_t *result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = result[1];
  if (v1)
    *(_QWORD *)(v1 + 16) = result[2];
  v2 = result[2];
  if (v2)
    *(_QWORD *)(v2 + 8) = v1;
  v3 = *result;
  if (*result)
  {
    if (*(uint64_t **)(v3 + 24) == result)
      *(_QWORD *)(v3 + 24) = v2;
    if (*(uint64_t **)(v3 + 32) == result)
      *(_QWORD *)(v3 + 32) = result[1];
  }
  *result = 0;
  result[1] = 0;
  result[2] = 0;
  return result;
}

uint64_t DiscardElement(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;

  if (!a2)
    return 0;
  v4 = a2[2];
  RemoveNode(a2);
  FreeNode(a1, (uint64_t)a2);
  return v4;
}

uint64_t InsertNodeAtStart(uint64_t result, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;

  *a2 = result;
  v2 = *(_QWORD *)(result + 24);
  v3 = (_QWORD *)(v2 + 8);
  if (!v2)
    v3 = (_QWORD *)(result + 32);
  *v3 = a2;
  a2[1] = 0;
  a2[2] = v2;
  *(_QWORD *)(result + 24) = a2;
  return result;
}

uint64_t InsertNodeAtEnd(uint64_t result, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(result + 32);
  *a2 = result;
  a2[1] = v2;
  if (v2)
    v3 = (_QWORD *)(v2 + 16);
  else
    v3 = (_QWORD *)(result + 24);
  *v3 = a2;
  *(_QWORD *)(result + 32) = a2;
  return result;
}

__int128 *InsertNodeBeforeElement(__int128 *result, uint64_t a2)
{
  __int128 v2;
  uint64_t v3;

  *(_QWORD *)(a2 + 16) = result;
  v2 = *result;
  *(_OWORD *)a2 = *result;
  *((_QWORD *)result + 1) = a2;
  v3 = *(_QWORD *)(a2 + 8);
  if (v3)
    *(_QWORD *)(v3 + 16) = a2;
  if (*(__int128 **)(v2 + 24) == result)
    *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t *InsertNodeAfterElement(uint64_t *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t **v3;
  uint64_t *v4;
  uint64_t v5;

  v2 = *result;
  *a2 = *result;
  if (v2)
  {
    v4 = *(uint64_t **)(v2 + 32);
    v3 = (uint64_t **)(v2 + 32);
    if (v4 == result)
      goto LABEL_5;
  }
  v5 = result[2];
  a2[2] = v5;
  if (v5)
  {
    v3 = (uint64_t **)(v5 + 8);
LABEL_5:
    *v3 = a2;
  }
  result[2] = (uint64_t)a2;
  a2[1] = (uint64_t)result;
  return result;
}

uint64_t TrimEmptyElement(uint64_t a1, uint64_t a2)
{
  int *v5;
  int v6;
  int v7;
  unsigned int v10;
  BOOL v11;
  int *v12;
  unsigned int v13;

  if (!nodeIsText(a2))
  {
    if (*(_QWORD *)(a2 + 24))
      return *(_QWORD *)(a2 + 16);
    v5 = *(int **)(a2 + 56);
    if (!v5)
      return *(_QWORD *)(a2 + 16);
    v6 = v5[8];
    if ((v6 & 8) != 0)
    {
      if (*(_QWORD *)(a2 + 40))
        return *(_QWORD *)(a2 + 16);
    }
    v7 = *v5;
    if (v7 == 79)
    {
      if ((v6 & 0x201) != 0 || *(_DWORD *)(a1 + 376) == 0)
        return *(_QWORD *)(a2 + 16);
    }
    else
    {
      if (v7 == 1)
      {
        if ((v6 & 0x201) != 0 || *(_QWORD *)(a2 + 40) != 0)
          return *(_QWORD *)(a2 + 16);
        goto LABEL_22;
      }
      v11 = (v6 & 0x201) != 0 || v7 == 6;
      if (v11 || v7 == 75)
        return *(_QWORD *)(a2 + 16);
      if (v7 != 92)
      {
LABEL_37:
        v13 = v7 - 50;
        if (v13 <= 0x3D && ((1 << v13) & 0x2200000000000001) != 0)
          return *(_QWORD *)(a2 + 16);
        goto LABEL_22;
      }
      if (AttrGetById(a2, 132))
        return *(_QWORD *)(a2 + 16);
      v12 = *(int **)(a2 + 56);
      if (v12)
      {
        v7 = *v12;
        goto LABEL_37;
      }
    }
LABEL_22:
    if (!AttrGetById(a2, 62) && !AttrGetById(a2, 79) && !AttrGetById(a2, 38))
    {
      v10 = **(_DWORD **)(a2 + 56);
      if (v10 > 0x18 || ((1 << v10) & 0x1010001) == 0)
        goto LABEL_2;
    }
    return *(_QWORD *)(a2 + 16);
  }
LABEL_2:
  if (*(_DWORD *)(a2 + 80) != 4)
    ReportNotice(a1, a2, 0, 23);
  return DiscardElement(a1, (uint64_t *)a2);
}

uint64_t DropEmptyElements(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;

  if (a2)
  {
    v2 = a2;
    do
    {
      v4 = *(_QWORD *)(v2 + 16);
      if (*(_QWORD *)(v2 + 24))
        DropEmptyElements(a1);
      if (nodeIsElement(v2) || nodeIsText(v2) && *(_DWORD *)(v2 + 72) >= *(_DWORD *)(v2 + 76))
        v4 = TrimEmptyElement(a1, v2);
      v2 = v4;
    }
    while (v4);
  }
  return 0;
}

BOOL IsBlank(uint64_t a1, uint64_t a2)
{
  _BOOL8 result;
  uint64_t v5;
  int v6;

  result = nodeIsText(a2);
  if (result)
  {
    v5 = *(unsigned int *)(a2 + 72);
    v6 = *(_DWORD *)(a2 + 76);
    if (v6 == (_DWORD)v5)
      return 1;
    else
      return v6 == (_DWORD)v5 + 1 && *(_BYTE *)(*(_QWORD *)(a1 + 104) + v5) == 32;
  }
  return result;
}

uint64_t ParseBlock(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _DWORD *v8;
  int v9;
  uint64_t v11;
  _DWORD *v12;
  _QWORD *v13;
  _DWORD *v14;
  int v15;
  char *Token;
  uint64_t v17;
  int v18;
  int v19;
  int *v20;
  int v21;
  _QWORD *v22;
  _DWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  _DWORD *v31;
  _DWORD *v32;
  uint64_t v33;
  char **v34;
  _DWORD *v35;
  unsigned int v36;
  BOOL v37;
  uint64_t v38;
  int *v40;
  int v41;
  _DWORD *v42;
  uint64_t v43;
  char **v44;
  uint64_t v45;
  int *v46;
  int v47;
  _DWORD *v48;
  unsigned int v49;
  _DWORD *v50;
  int *v51;
  _DWORD *v52;
  _QWORD *v53;
  _DWORD *v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  char **v58;
  _DWORD *v59;
  uint64_t v60;
  int v61;
  _QWORD *v62;
  int v63;

  v8 = *(_DWORD **)(a2 + 56);
  v9 = v8[8];
  if ((v9 & 1) != 0)
    return result;
  v11 = result;
  v12 = *(_DWORD **)(result + 104);
  if (*v8 != 37 || (v13 = *(_QWORD **)a2) == 0)
  {
LABEL_7:
    if ((v9 & 0x800) != 0)
      goto LABEL_11;
LABEL_8:
    v15 = 0;
    if ((v9 & 0x20000) != 0)
      goto LABEL_13;
    goto LABEL_12;
  }
  while (1)
  {
    v14 = (_DWORD *)v13[7];
    if (v14)
    {
      if (*v14 == 37)
        break;
    }
    v13 = (_QWORD *)*v13;
    if (!v13)
      goto LABEL_7;
  }
  ReportError(result, a2, 0, 25);
  v9 = *(_DWORD *)(*(_QWORD *)(a2 + 56) + 32);
  if ((v9 & 0x800) == 0)
    goto LABEL_8;
LABEL_11:
  v15 = v12[38];
  v12[38] = v12[37];
  if ((v9 & 0x20000) == 0)
LABEL_12:
    InlineDup(v11, 0);
LABEL_13:
  Token = GetToken(v11, 0, a3, a4, a5, a6, a7, a8);
  if (Token)
  {
    v17 = 0;
    v18 = 1;
    do
    {
      v19 = *((_DWORD *)Token + 20);
      v20 = (int *)*((_QWORD *)Token + 7);
      if (v19 == 6)
      {
        if (!v20)
          goto LABEL_30;
        if (v20 == *(int **)(a2 + 56) || *(int **)(a2 + 48) == v20)
        {
          FreeNode(v11, (uint64_t)Token);
          if ((*(_BYTE *)(*(_QWORD *)(a2 + 56) + 33) & 8) != 0)
          {
            while (v12[37] > v12[38])
              PopInline(v11, 0);
            v12[38] = v15;
          }
          *(_DWORD *)(a2 + 92) = 1;
          return TrimSpaces(v11, a2);
        }
      }
      else if (!v20)
      {
        goto LABEL_47;
      }
      v21 = *v20;
      if (v21 == 16)
      {
        v22 = *(_QWORD **)a2;
        if (*(_QWORD *)a2)
        {
          while (1)
          {
            v23 = (_DWORD *)v22[7];
            if (v23)
            {
              if (*v23 == 46)
                goto LABEL_150;
            }
            v22 = (_QWORD *)*v22;
            if (!v22)
              goto LABEL_26;
          }
        }
      }
      else
      {
LABEL_26:
        if (v21 != 46 && v21 != 48 && v21 != 16)
        {
          if (v19 == 6)
          {
            if (v21 == 79)
            {
              *((_DWORD *)Token + 20) = 7;
              *((_DWORD *)Token + 24) = 1;
            }
            else if (v21 == 17)
            {
              *((_DWORD *)Token + 20) = 5;
            }
            else
            {
              v30 = *(_QWORD **)a2;
              if (*(_QWORD *)a2)
              {
                while (1)
                {
                  v31 = (_DWORD *)v30[7];
                  if (v31)
                  {
                    if (*v31 == v21)
                      break;
                  }
                  v30 = (_QWORD *)*v30;
                  if (!v30)
                    goto LABEL_43;
                }
LABEL_150:
                UngetToken(v11);
                break;
              }
LABEL_43:
              if (v12[6])
              {
                if (nodeHasCM((_BOOL8)Token, 128) || (v32 = (_DWORD *)*((_QWORD *)Token + 7)) != 0 && *v32 == 104)
                {
LABEL_161:
                  UngetToken(v11);
                  return TrimSpaces(v11, a2);
                }
              }
            }
          }
LABEL_47:
          if (nodeIsText((_BOOL8)Token))
          {
            if (!v18 || (*(_BYTE *)(*(_QWORD *)(a2 + 56) + 34) & 2) != 0 || (int)InlineDup(v11, (uint64_t)Token) <= 0)
            {
              v33 = *(_QWORD *)(a2 + 32);
              *(_QWORD *)Token = a2;
              *((_QWORD *)Token + 1) = v33;
              if (v33)
                v34 = (char **)(v33 + 16);
              else
                v34 = (char **)(a2 + 24);
              *v34 = Token;
              *(_QWORD *)(a2 + 32) = Token;
              v35 = *(_DWORD **)(a2 + 56);
              if (v35)
              {
                v36 = *v35 - 15;
                v37 = v36 > 0x3B;
                v38 = (1 << v36) & 0x802000000400003;
                if (!v37 && v38 != 0)
                  ConstrainVersion(v11, -293);
              }
              v18 = 0;
              v17 = 1;
              goto LABEL_32;
            }
            goto LABEL_51;
          }
          if (InsertMisc((_QWORD *)a2, (uint64_t)Token))
            goto LABEL_32;
          v40 = (int *)*((_QWORD *)Token + 7);
          if (!v40)
          {
LABEL_30:
            ReportError(v11, a2, (uint64_t)Token, 8);
            goto LABEL_31;
          }
          v41 = *v40;
          if (v41 == 7)
          {
            v42 = *(_DWORD **)(a2 + 56);
            if (!v42 || *v42 != 64)
              goto LABEL_30;
            goto LABEL_70;
          }
          if (v41 == 80)
          {
            if (!nodeHasCM(a2, 4096))
              goto LABEL_30;
LABEL_70:
            if (nodeIsElement((_BOOL8)Token))
            {
              v43 = *(_QWORD *)(a2 + 32);
              *(_QWORD *)Token = a2;
              *((_QWORD *)Token + 1) = v43;
              if (v43)
                v44 = (char **)(v43 + 16);
              else
                v44 = (char **)(a2 + 24);
              *v44 = Token;
              *(_QWORD *)(a2 + 32) = Token;
              goto LABEL_32;
            }
            goto LABEL_30;
          }
          if (nodeHasCM((_BOOL8)Token, 16))
          {
LABEL_76:
            if (nodeIsElement((_BOOL8)Token))
            {
              v45 = *((_QWORD *)Token + 7);
              if ((*(_BYTE *)(v45 + 32) & 0x10) == 0)
              {
                v17 = 0;
                v18 = 1;
                goto LABEL_125;
              }
              if (!v18)
                goto LABEL_124;
              if (*((_DWORD *)Token + 24))
              {
                v18 = 1;
                goto LABEL_124;
              }
              if ((*(_BYTE *)(*(_QWORD *)(a2 + 56) + 34) & 2) != 0)
              {
                v18 = 0;
LABEL_124:
                v17 = 1;
LABEL_125:
                if (*(_DWORD *)v45 == 17)
                  TrimSpaces(v11, a2);
LABEL_127:
                v57 = *(_QWORD *)(a2 + 32);
                *(_QWORD *)Token = a2;
                *((_QWORD *)Token + 1) = v57;
                if (v57)
                  v58 = (char **)(v57 + 16);
                else
                  v58 = (char **)(a2 + 24);
                *v58 = Token;
                *(_QWORD *)(a2 + 32) = Token;
                if (*((_DWORD *)Token + 24))
                  ReportError(v11, a2, (uint64_t)Token, 15);
                ParseTag(v11, (uint64_t)Token);
                goto LABEL_32;
              }
              if ((int)InlineDup(v11, (uint64_t)Token) <= 0)
              {
                v18 = 0;
                v45 = *((_QWORD *)Token + 7);
                v17 = 1;
                if (v45)
                  goto LABEL_125;
                goto LABEL_127;
              }
LABEL_51:
              v18 = 0;
              goto LABEL_32;
            }
            if (*((_DWORD *)Token + 20) == 6)
              PopInline(v11, (uint64_t)Token);
            goto LABEL_30;
          }
          if (!nodeIsElement((_BOOL8)Token))
          {
            v50 = (_DWORD *)*((_QWORD *)Token + 7);
            if (v50 && *v50 == 37)
              *(_DWORD *)(v11 + 4912) = 1;
            goto LABEL_30;
          }
          v46 = *(int **)(a2 + 56);
          if (!v46)
          {
LABEL_87:
            if (nodeHasCM((_BOOL8)Token, 8))
            {
              if (v12[5])
              {
                if (!nodeHasCM(a2, 0x8000))
                  ReportError(v11, a2, (uint64_t)Token, 7);
                UngetToken(v11);
                if (nodeHasCM(a2, 2048))
                  goto LABEL_165;
                return TrimSpaces(v11, a2);
              }
            }
            else
            {
              v51 = (int *)*((_QWORD *)Token + 7);
              if ((v51[8] & 4) != 0)
              {
LABEL_122:
                MoveToHead((_QWORD *)v11, a2, (uint64_t *)Token);
                goto LABEL_32;
              }
              v52 = *(_DWORD **)(a2 + 56);
              if (v52)
              {
                if (*v52 == 37)
                {
                  v53 = *(_QWORD **)a2;
                  if (*(_QWORD *)a2)
                  {
                    v54 = (_DWORD *)v53[7];
                    if (v54)
                    {
                      if (*v54 == 106 && *((_DWORD *)v53 + 24))
                      {
                        v55 = *v51;
                        if (v55 == 109)
                        {
                          ReportError(v11, a2, (uint64_t)Token, 8);
                          FreeNode(v11, (uint64_t)Token);
                          v62 = *(_QWORD **)a2;
                          MemFree(*(void **)(*(_QWORD *)a2 + 64));
                          v62[8] = tmbstrdup("th");
                          v62[7] = LookupTagDef(109);
                          goto LABEL_32;
                        }
                        if (v55 == 106)
                          goto LABEL_30;
                      }
                    }
                  }
                }
              }
              if (!nodeHasCM(a2, 0x8000) && !*(_DWORD *)(a2 + 96))
                ReportError(v11, a2, (uint64_t)Token, 7);
              UngetToken(v11);
              if (nodeHasCM((_BOOL8)Token, 32))
              {
                if (*(_QWORD *)a2)
                {
                  v56 = *(_QWORD *)(*(_QWORD *)a2 + 56);
                  if (v56)
                  {
                    if (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v56 + 40) == ParseList)
                      return TrimSpaces(v11, a2);
                  }
                }
                Token = InferredTag(v11, 115);
                AddClassNoIndent(v11, (uint64_t)Token);
              }
              else
              {
                if (nodeHasCM((_BOOL8)Token, 64))
                {
                  if (*(_QWORD *)a2)
                  {
                    v59 = *(_DWORD **)(*(_QWORD *)a2 + 56);
                    if (v59)
                    {
                      if (*v59 == 31)
                        return TrimSpaces(v11, a2);
                    }
                  }
                  v60 = v11;
                  v61 = 31;
                }
                else
                {
                  result = nodeHasCM((_BOOL8)Token, 128);
                  if (!(_DWORD)result)
                  {
                    result = nodeHasCM((_BOOL8)Token, 512);
                    if (!(_DWORD)result)
                    {
                      if (!nodeHasCM(a2, 2048))
                        return TrimSpaces(v11, a2);
                      while (v12[37] > v12[38])
                        PopInline(v11, 0);
LABEL_165:
                      v12[38] = v15;
                      return TrimSpaces(v11, a2);
                    }
                  }
                  if (v12[6])
                    return result;
                  v60 = v11;
                  v61 = 104;
                }
                Token = InferredTag(v60, v61);
              }
            }
            goto LABEL_76;
          }
          v47 = *v46;
          if (v47 != 109 && v47 != 106)
          {
            if (v47 == 61)
            {
              v48 = (_DWORD *)*((_QWORD *)Token + 7);
              if (v48)
              {
                v49 = *v48 - 38;
                if (v49 <= 0x28 && ((1 << v49) & 0x18000000003) != 0)
                  goto LABEL_30;
              }
            }
            goto LABEL_87;
          }
          if (nodeHasCM((_BOOL8)Token, 4))
            goto LABEL_122;
          if (nodeHasCM((_BOOL8)Token, 32))
          {
            UngetToken(v11);
            Token = InferredTag(v11, 115);
            AddClassNoIndent(v11, (uint64_t)Token);
            goto LABEL_135;
          }
          if (nodeHasCM((_BOOL8)Token, 64))
          {
            UngetToken(v11);
            Token = InferredTag(v11, 31);
LABEL_135:
            v12[5] = 1;
          }
          if (!nodeHasCM((_BOOL8)Token, 8))
            goto LABEL_161;
          goto LABEL_76;
        }
      }
      if (nodeIsElement((_BOOL8)Token))
        goto LABEL_30;
LABEL_31:
      FreeNode(v11, (uint64_t)Token);
LABEL_32:
      Token = GetToken(v11, v17, v24, v25, v26, v27, v28, v29);
    }
    while (Token);
  }
  v63 = *(_DWORD *)(*(_QWORD *)(a2 + 56) + 32);
  if ((v63 & 0x8000) == 0)
  {
    ReportError(v11, a2, (uint64_t)Token, 6);
    v63 = *(_DWORD *)(*(_QWORD *)(a2 + 56) + 32);
  }
  if ((v63 & 0x800) != 0)
  {
    while (v12[37] > v12[38])
      PopInline(v11, 0);
    goto LABEL_165;
  }
  return TrimSpaces(v11, a2);
}

BOOL TrimSpaces(_BOOL8 result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  _DWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;

  v3 = result;
  v4 = *(_QWORD *)(a2 + 24);
  v5 = *(_DWORD **)(a2 + 56);
  if (!v5 || *v5 != 82)
  {
    v6 = *(_QWORD **)a2;
    if (*(_QWORD *)a2)
    {
      while (1)
      {
        v7 = v6[7];
        if (v7)
        {
          if (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 40) == ParsePre)
            break;
        }
        v6 = (_QWORD *)*v6;
        if (!v6)
          goto LABEL_7;
      }
    }
    else
    {
LABEL_7:
      if (nodeIsText(*(_QWORD *)(a2 + 24)))
        TrimInitialSpace(v3, (__int128 *)a2, v4);
      v8 = *(_QWORD *)(a2 + 32);
      result = nodeIsText(v8);
      if (result)
      {
        v9 = *(_QWORD *)(v3 + 104);
        result = nodeIsText(v8);
        if (result)
        {
          v10 = *(_DWORD *)(v8 + 76);
          if (v10 > *(_DWORD *)(v8 + 72))
          {
            v11 = v10 - 1;
            if (*(_BYTE *)(*(_QWORD *)(v9 + 104) + v11) == 32)
            {
              *(_DWORD *)(v8 + 76) = v11;
              if ((*(_DWORD *)(*(_QWORD *)(a2 + 56) + 32) & 0x410) == 0x10)
                *(_DWORD *)(v9 + 16) = 1;
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t InsertMisc(_QWORD *a1, uint64_t a2)
{
  unsigned int v4;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t result;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;

  v4 = *(_DWORD *)(a2 + 80);
  if (v4 <= 0xD)
  {
    if (((1 << v4) & 0x1F0C) != 0)
      goto LABEL_3;
    if (v4 == 13)
    {
      v11 = a1;
      while (v11)
      {
        v12 = v11;
        v11 = (_QWORD *)*v11;
        if (!v11)
        {
          v9 = v12 + 3;
          v13 = v12[3];
          if (v13 && *(_DWORD *)(v13 + 80) == 13)
            break;
          *(_QWORD *)a2 = v12;
          v15 = v12 + 4;
          if (v13)
            v15 = (uint64_t *)(v13 + 8);
          *v15 = a2;
          *(_QWORD *)(a2 + 8) = 0;
          *(_QWORD *)(a2 + 16) = v13;
          goto LABEL_6;
        }
      }
    }
  }
  if (!*(_QWORD *)(a2 + 56))
    return 0;
  result = nodeIsElement(a2);
  if (!(_DWORD)result)
    return result;
  result = nodeCMIsEmpty(a2);
  if (!(_DWORD)result)
    return result;
  v14 = *(_QWORD *)(a2 + 56);
  if (v14)
  {
    if (*(_DWORD *)v14)
      return 0;
  }
  if ((*(_BYTE *)(v14 + 17) & 0xE0) == 0)
    return 0;
LABEL_3:
  *(_QWORD *)a2 = a1;
  v5 = a1 + 3;
  v7 = a1[4];
  v6 = a1 + 4;
  *(_QWORD *)(a2 + 8) = v7;
  v8 = (uint64_t *)(v7 + 16);
  if (v7)
    v5 = v8;
  *v5 = a2;
  v9 = v6;
LABEL_6:
  *v9 = a2;
  return 1;
}

void MoveToHead(_QWORD *a1, uint64_t a2, uint64_t *a3)
{
  _QWORD *HEAD;
  uint64_t v7;
  uint64_t **v8;

  RemoveNode(a3);
  if (nodeIsElement((_BOOL8)a3))
  {
    ReportError((uint64_t)a1, a2, (uint64_t)a3, 11);
    HEAD = FindHEAD(a1);
    v7 = HEAD[4];
    *a3 = (uint64_t)HEAD;
    a3[1] = v7;
    if (v7)
      v8 = (uint64_t **)(v7 + 16);
    else
      v8 = (uint64_t **)(HEAD + 3);
    *v8 = a3;
    HEAD[4] = a3;
    if (*(_QWORD *)(a3[7] + 40))
      ParseTag((uint64_t)a1, (uint64_t)a3);
  }
  else
  {
    ReportError((uint64_t)a1, a2, (uint64_t)a3, 8);
    FreeNode((uint64_t)a1, (uint64_t)a3);
  }
}

void AddClassNoIndent(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a1 + 776))
  {
    if (*(_DWORD *)(a1 + 344))
      AddStyleAsClass(a1, a2, "padding-left: 2ex; margin-left: 0ex; margin-top: 0ex; margin-bottom: 0ex");
    else
      AddStyleProperty(a1, a2, "padding-left: 2ex; margin-left: 0ex; margin-top: 0ex; margin-bottom: 0ex");
  }
}

void ParseList(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  char *Token;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  _DWORD *v22;
  uint64_t v23;
  char **v24;
  _QWORD *v25;
  _DWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;

  if ((*(_BYTE *)(*(_QWORD *)(a2 + 56) + 32) & 1) != 0)
    return;
  v10 = *(_QWORD *)(a1 + 104);
  *(_QWORD *)(v10 + 128) = 0;
  Token = GetToken(a1, 0, a3, a4, a5, a6, a7, a8);
  if (!Token)
  {
LABEL_38:
    v27 = a1;
    v28 = a2;
    v29 = 0;
    v30 = 6;
    goto LABEL_39;
  }
  v12 = Token;
  while (1)
  {
    if (*((_QWORD *)v12 + 7) == *(_QWORD *)(a2 + 56) && *((_DWORD *)v12 + 20) == 6)
    {
      FreeNode(a1, (uint64_t)v12);
      *(_DWORD *)(a2 + 92) = 1;
      return;
    }
    if (!InsertMisc((_QWORD *)a2, (uint64_t)v12))
      break;
LABEL_29:
    v12 = GetToken(a1, 0, v13, v14, v15, v16, v17, v18);
    if (!v12)
      goto LABEL_38;
  }
  v19 = *((_DWORD *)v12 + 20);
  v20 = *((_QWORD *)v12 + 7);
  if (v19 != 4)
  {
    if (v20)
    {
      if (v19 != 6)
        goto LABEL_16;
      if (*(_DWORD *)v20 == 37)
      {
        *(_DWORD *)(a1 + 4912) = 1;
      }
      else
      {
        v25 = (_QWORD *)a2;
        if ((*(_BYTE *)(v20 + 32) & 0x10) != 0)
        {
          ReportError(a1, a2, (uint64_t)v12, 8);
          PopInline(a1, (uint64_t)v12);
          goto LABEL_15;
        }
        while (1)
        {
          v25 = (_QWORD *)*v25;
          if (!v25)
            break;
          v26 = (_DWORD *)v25[7];
          if (v26)
          {
            if (*v26 == 16)
              break;
          }
          if ((_DWORD *)v20 == v26)
          {
            ReportError(a1, a2, (uint64_t)v12, 7);
            UngetToken(a1);
            return;
          }
        }
      }
    }
    ReportError(a1, a2, (uint64_t)v12, 8);
LABEL_15:
    FreeNode(a1, (uint64_t)v12);
    goto LABEL_29;
  }
  if (!v20)
    goto LABEL_17;
LABEL_16:
  if (*(_DWORD *)v20 == 61)
  {
LABEL_25:
    v23 = *(_QWORD *)(a2 + 32);
    *(_QWORD *)v12 = a2;
    *((_QWORD *)v12 + 1) = v23;
    if (v23)
      v24 = (char **)(v23 + 16);
    else
      v24 = (char **)(a2 + 24);
    *v24 = v12;
    *(_QWORD *)(a2 + 32) = v12;
    ParseTag(a1, (uint64_t)v12);
    goto LABEL_29;
  }
LABEL_17:
  UngetToken(a1);
  v21 = *((_QWORD *)v12 + 7);
  if (!v21 || (*(_BYTE *)(v21 + 32) & 8) == 0 || !*(_DWORD *)(v10 + 20))
  {
    if (*(_DWORD *)(v10 + 24))
    {
      if (nodeHasCM((_BOOL8)v12, 896))
        return;
      v22 = (_DWORD *)*((_QWORD *)v12 + 7);
      if (v22)
      {
        if (*v22 == 104)
          return;
      }
    }
    v12 = InferredTag(a1, 61);
    AddStyleProperty(a1, (uint64_t)v12, "list-style: none");
    ReportError(a1, a2, (uint64_t)v12, 12);
    goto LABEL_25;
  }
  v27 = a1;
  v28 = a2;
  v29 = (uint64_t)v12;
  v30 = 7;
LABEL_39:
  ReportError(v27, v28, v29, v30);
}

uint64_t ParseTag(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t (*v5)(void);

  v2 = *(_QWORD *)(result + 104);
  v3 = *(_QWORD *)(a2 + 56);
  v4 = *(_DWORD *)(v3 + 32);
  if ((v4 & 1) != 0)
  {
    *(_DWORD *)(v2 + 8) = 0;
    if (!*(_QWORD *)(v3 + 40))
      return result;
  }
  else if ((v4 & 0x10) == 0)
  {
    *(_DWORD *)(v2 + 16) = 0;
  }
  v5 = *(uint64_t (**)(void))(v3 + 40);
  if (v5)
  {
    if (*(_DWORD *)(a2 + 80) != 7)
      return v5();
  }
  return result;
}

void ParseInline(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _DWORD *v13;
  int *v14;
  int v15;
  int v16;
  uint64_t v17;
  char *Token;
  char *v19;
  uint64_t v20;
  int v21;
  _DWORD *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char **v31;
  int *v32;
  int v33;
  int v34;
  _DWORD *v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int v38;
  BOOL v39;
  uint64_t v40;
  _QWORD *v41;
  _DWORD *v42;
  _DWORD *v43;
  uint64_t v44;
  char **v45;
  _QWORD *v46;
  _DWORD *v47;
  uint64_t v48;
  char **v49;
  char *v50;
  uint64_t v51;
  char **v52;
  int *v53;
  int v54;
  _DWORD *v55;
  int v56;
  char *v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  char **v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char **v65;
  char *v66;
  uint64_t v67;
  char **v68;
  char *v69;
  uint64_t v70;
  _QWORD *v71;
  int v72;
  _BOOL4 IsElement;
  int v74;
  uint64_t v75;
  char **v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  char **v81;
  _DWORD *v82;
  uint64_t v83;
  char **v84;
  _DWORD *v85;
  _QWORD *v86;
  _DWORD *v87;
  _DWORD *v88;
  _DWORD *v89;
  uint64_t v90;
  uint64_t v91;
  char **v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  uint64_t v96;
  char **v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char **v102;
  uint64_t v103;
  _DWORD *v104;
  _DWORD *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  _DWORD *v109;
  _DWORD *v110;
  _DWORD *v111;

  if ((*(_BYTE *)(*(_QWORD *)(a2 + 56) + 32) & 1) != 0)
    return;
  v4 = a2;
  v6 = *(_QWORD *)(a1 + 104);
  if ((nodeHasCM(a2, 8) || (v13 = *(_DWORD **)(v4 + 56)) != 0 && *v13 == 32) && !nodeHasCM(v4, 0x20000))
  {
    InlineDup(a1, 0);
  }
  else if (nodeHasCM(v4, 16))
  {
    PushInline((_QWORD *)a1, v4);
  }
  v14 = *(int **)(v4 + 56);
  if (!v14)
    goto LABEL_15;
  v15 = *v14;
  if (v15 == 69)
  {
    v16 = 4;
    goto LABEL_14;
  }
  if (v15 == 36)
  {
    v16 = 8;
LABEL_14:
    *(_DWORD *)(a1 + 4904) |= v16;
  }
LABEL_15:
  if (a3 == 2)
    v17 = 2;
  else
    v17 = 1;
  Token = GetToken(a1, v17, v7, v8, v9, v10, v11, v12);
  if (!Token)
  {
LABEL_220:
    if ((*(_BYTE *)(*(_QWORD *)(v4 + 56) + 33) & 0x80) == 0)
      ReportError(a1, v4, 0, 6);
    return;
  }
  v19 = Token;
  while (1)
  {
    v20 = *((_QWORD *)v19 + 7);
    if (v20 != *(_QWORD *)(v4 + 56))
      goto LABEL_27;
    v21 = *((_DWORD *)v19 + 20);
    if (v21 != 5)
    {
      if (v21 == 6)
      {
        if ((*(_BYTE *)(v20 + 32) & 0x10) != 0)
          PopInline(a1, (uint64_t)v19);
        FreeNode(a1, (uint64_t)v19);
        if (a3 != 2)
          TrimSpaces(a1, v4);
        v105 = *(_DWORD **)(v4 + 56);
        if (v105)
        {
          if (*v105 == 36)
          {
            v106 = *(_QWORD *)(v4 + 24);
            if (v106)
            {
              if (v106 == *(_QWORD *)(v4 + 32))
              {
                v109 = *(_DWORD **)(v106 + 56);
                if (v109)
                {
                  if (*v109 == 1)
                  {
                    *(_QWORD *)(v106 + 16) = *(_QWORD *)(v4 + 16);
                    *(_OWORD *)v106 = *(_OWORD *)v4;
                    *(_QWORD *)(v4 + 8) = 0;
                    *(_QWORD *)(v4 + 16) = 0;
                    *(_QWORD *)v4 = v106;
                    *(_OWORD *)(v4 + 24) = *(_OWORD *)(v106 + 24);
                    *(_QWORD *)(v106 + 24) = v4;
                    FixNodeLinks((_QWORD *)v106);
                    FixNodeLinks((_QWORD *)v4);
                  }
                }
              }
            }
          }
        }
        *(_DWORD *)(v4 + 92) = 1;
        goto LABEL_251;
      }
LABEL_27:
      if (IsPushed(a1, (uint64_t)v19))
      {
        if (*((_DWORD *)v19 + 20) == 5)
        {
          v22 = (_DWORD *)*((_QWORD *)v19 + 7);
          if (v22)
          {
            if (*v22 == 83)
            {
              v23 = 40;
LABEL_32:
              ReportWarning(a1, v4, (uint64_t)v19, v23);
              goto LABEL_33;
            }
          }
        }
      }
      goto LABEL_33;
    }
    if (!IsPushed(a1, (uint64_t)v19))
      goto LABEL_27;
    if (*((_DWORD *)v19 + 24))
      goto LABEL_27;
    if (*(_DWORD *)(v4 + 96))
      goto LABEL_27;
    v37 = *((_QWORD *)v19 + 7);
    if (!v37 || (*(_BYTE *)(v37 + 32) & 0x10) == 0)
      goto LABEL_27;
    v38 = *(_DWORD *)v37;
    v39 = v38 - 83 > 0x14 || ((1 << (v38 - 83)) & 0x18A001) == 0;
    if (!v39 || v38 <= 0x24 && ((1 << v38) & 0x1000002002) != 0)
      goto LABEL_27;
    v40 = *((_QWORD *)v19 + 5);
    if (*(_QWORD *)(v4 + 24))
    {
      if (!v40)
      {
        ReportWarning(a1, v4, (uint64_t)v19, 85);
        *((_DWORD *)v19 + 20) = 6;
        goto LABEL_169;
      }
    }
    else if (!v40)
    {
      goto LABEL_219;
    }
    if (!*(_QWORD *)(v4 + 40))
    {
LABEL_219:
      v23 = 9;
      goto LABEL_32;
    }
LABEL_33:
    if (nodeIsText((_BOOL8)v19))
    {
      if (a3 != 2 && !*(_QWORD *)(v4 + 24))
        TrimSpaces(a1, v4);
      if (*((_DWORD *)v19 + 18) >= *((_DWORD *)v19 + 19))
        goto LABEL_47;
      v30 = *(_QWORD *)(v4 + 32);
      *(_QWORD *)v19 = v4;
      *((_QWORD *)v19 + 1) = v30;
      if (v30)
        v31 = (char **)(v30 + 16);
      else
        v31 = (char **)(v4 + 24);
      goto LABEL_41;
    }
    if (InsertMisc((_QWORD *)v4, (uint64_t)v19))
      goto LABEL_48;
    v32 = (int *)*((_QWORD *)v19 + 7);
    if (!v32)
      goto LABEL_46;
    v33 = *v32;
    if (v33 == 48)
    {
      if (!nodeIsElement((_BOOL8)v19))
        goto LABEL_236;
      goto LABEL_46;
    }
    if (v33 == 79)
    {
      v34 = *((_DWORD *)v19 + 20);
      if (v34 == 6)
        goto LABEL_86;
      if (v34 != 5)
        goto LABEL_99;
      if (a3 == 2)
        goto LABEL_56;
      v35 = *(_DWORD **)(v4 + 56);
      if (v35)
      {
        if (*v35 == 32)
          goto LABEL_56;
      }
      v41 = *(_QWORD **)v4;
      if (*(_QWORD *)v4)
      {
        while (1)
        {
          v42 = (_DWORD *)v41[7];
          if (v42)
          {
            if (*v42 == 32)
              break;
          }
          v41 = (_QWORD *)*v41;
          if (!v41)
            goto LABEL_75;
        }
LABEL_56:
        *((_QWORD *)v19 + 7) = LookupTagDef(17);
        MemFree(*((void **)v19 + 8));
        *((_QWORD *)v19 + 8) = tmbstrdup("br");
        TrimSpaces(a1, v4);
        v36 = *(_QWORD *)(v4 + 32);
        *(_QWORD *)v19 = v4;
        *((_QWORD *)v19 + 1) = v36;
        if (v36)
          v31 = (char **)(v36 + 16);
        else
          v31 = (char **)(v4 + 24);
LABEL_41:
        *v31 = v19;
        *(_QWORD *)(v4 + 32) = v19;
        goto LABEL_48;
      }
LABEL_75:
      if (v4)
      {
        v43 = *(_DWORD **)(v4 + 56);
        if (v43)
        {
          if (*v43 == 4)
          {
            ConstrainVersion(a1, -293);
            v44 = *(_QWORD *)(v4 + 32);
            *(_QWORD *)v19 = v4;
            *((_QWORD *)v19 + 1) = v44;
            if (v44)
              v45 = (char **)(v44 + 16);
            else
              v45 = (char **)(v4 + 24);
            *v45 = v19;
            *(_QWORD *)(v4 + 32) = v19;
            (*(void (**)(uint64_t, char *, uint64_t))(*((_QWORD *)v19 + 7) + 40))(a1, v19, v17);
            goto LABEL_48;
          }
        }
      }
    }
    if (v33 == 17)
    {
      if (*((_DWORD *)v19 + 20) == 6)
        *((_DWORD *)v19 + 20) = 5;
      goto LABEL_99;
    }
    if (v33 == 80)
      goto LABEL_46;
    if (*((_DWORD *)v19 + 20) == 6)
      break;
LABEL_99:
    if (nodeHasCM((_BOOL8)v19, 0x4000) && nodeHasCM(v4, 0x4000))
    {
      v107 = a1;
      v108 = v4;
      if (*((_QWORD *)v19 + 7) != *(_QWORD *)(v4 + 56))
      {
LABEL_240:
        ReportError(v107, v108, (uint64_t)v19, 7);
LABEL_236:
        UngetToken(a1);
        goto LABEL_237;
      }
      goto LABEL_257;
    }
    v53 = (int *)*((_QWORD *)v19 + 7);
    if (v53)
    {
      v54 = *v53;
      if (*v53 == 1 && !*((_DWORD *)v19 + 24))
      {
        if (v4)
        {
          v85 = *(_DWORD **)(v4 + 56);
          if (v85)
          {
            if (*v85 == 1)
              goto LABEL_166;
          }
        }
        v86 = *(_QWORD **)v4;
        if (*(_QWORD *)v4)
        {
          while (1)
          {
            v87 = (_DWORD *)v86[7];
            if (v87)
            {
              if (*v87 == 1)
                break;
            }
            v86 = (_QWORD *)*v86;
            if (!v86)
              goto LABEL_104;
          }
LABEL_166:
          if (*((_DWORD *)v19 + 20) == 6 || *((_QWORD *)v19 + 5))
          {
            UngetToken(a1);
            ReportError(a1, v4, (uint64_t)v19, 7);
            goto LABEL_237;
          }
          *((_DWORD *)v19 + 20) = 6;
          ReportError(a1, v4, (uint64_t)v19, 24);
LABEL_169:
          UngetToken(a1);
          goto LABEL_48;
        }
      }
LABEL_104:
      v55 = *(_DWORD **)(v4 + 56);
      v56 = v55[8];
      if ((v56 & 0x4000) != 0)
      {
        switch(v54)
        {
          case 20:
            goto LABEL_140;
          case 47:
            if (nodeIsElement((_BOOL8)v19))
            {
              ReportError(a1, v4, (uint64_t)v19, 11);
              v90 = *(_QWORD *)(v4 + 24);
              v91 = *(_QWORD *)v4;
              *(_QWORD *)v19 = *(_QWORD *)v4;
              if (!v90)
              {
                *((_QWORD *)v19 + 1) = *(_QWORD *)(v4 + 8);
                *((_QWORD *)v19 + 2) = v4;
                *(_QWORD *)(v4 + 8) = v19;
                v103 = *((_QWORD *)v19 + 1);
                if (v103)
                  *(_QWORD *)(v103 + 16) = v19;
                if (*(_QWORD *)(v91 + 24) == v4)
                  *(_QWORD *)(v91 + 24) = v19;
                goto LABEL_48;
              }
              if (v91 && (v93 = *(_QWORD *)(v91 + 32), v92 = (char **)(v91 + 32), v93 == v4))
              {
LABEL_190:
                *v92 = v19;
              }
              else
              {
                v94 = *(_QWORD *)(v4 + 16);
                *((_QWORD *)v19 + 2) = v94;
                if (v94)
                {
                  v92 = (char **)(v94 + 8);
                  goto LABEL_190;
                }
              }
              *(_QWORD *)(v4 + 16) = v19;
              *((_QWORD *)v19 + 1) = v4;
              if (a3 != 2)
                TrimSpaces(a1, v4);
              v95 = CloneNode(a1, v4);
              v4 = (uint64_t)v95;
              v96 = *(_QWORD *)v19;
              *(_QWORD *)v95 = *(_QWORD *)v19;
              if (v96 && (v98 = *(char **)(v96 + 32), v97 = (char **)(v96 + 32), v98 == v19))
              {
LABEL_197:
                *v97 = v95;
              }
              else
              {
                v99 = *((_QWORD *)v19 + 2);
                *((_QWORD *)v95 + 2) = v99;
                if (v99)
                {
                  v97 = (char **)(v99 + 8);
                  goto LABEL_197;
                }
              }
              *((_QWORD *)v19 + 2) = v95;
              *((_QWORD *)v95 + 1) = v19;
              goto LABEL_48;
            }
LABEL_46:
            ReportError(a1, v4, (uint64_t)v19, 8);
LABEL_47:
            FreeNode(a1, (uint64_t)v19);
            goto LABEL_48;
          case 30:
LABEL_140:
            if (!nodeIsElement((_BOOL8)v19))
              goto LABEL_46;
            ReportError(a1, v4, (uint64_t)v19, 11);
            if (!*(_QWORD *)(v4 + 24))
            {
              InsertNodeAsParent((_QWORD *)v4, v19);
              goto LABEL_48;
            }
            v75 = *(_QWORD *)v4;
            *(_QWORD *)v19 = *(_QWORD *)v4;
            if (v75 && (v77 = *(_QWORD *)(v75 + 32), v76 = (char **)(v75 + 32), v77 == v4))
            {
LABEL_146:
              *v76 = v19;
            }
            else
            {
              v78 = *(_QWORD *)(v4 + 16);
              *((_QWORD *)v19 + 2) = v78;
              if (v78)
              {
                v76 = (char **)(v78 + 8);
                goto LABEL_146;
              }
            }
            *(_QWORD *)(v4 + 16) = v19;
            *((_QWORD *)v19 + 1) = v4;
            if (a3 != 2)
              TrimSpaces(a1, v4);
            v79 = CloneNode(a1, v4);
            v4 = (uint64_t)v79;
            v80 = *((_QWORD *)v19 + 4);
            *(_QWORD *)v79 = v19;
            *((_QWORD *)v79 + 1) = v80;
            if (v80)
              v81 = (char **)(v80 + 16);
            else
              v81 = (char **)(v19 + 24);
            *v81 = v79;
            *((_QWORD *)v19 + 4) = v79;
            goto LABEL_48;
        }
      }
      else if (*v55 == 32 && *v53 == 47)
      {
        if (!nodeIsElement((_BOOL8)v19))
          goto LABEL_46;
        ReportError(a1, v4, (uint64_t)v19, 11);
        v57 = InferredTag(a1, 26);
        v58 = v57;
        v59 = *(_QWORD *)(v4 + 24);
        v60 = *(_QWORD *)v4;
        *(_QWORD *)v57 = *(_QWORD *)v4;
        if (!v59)
        {
          *((_QWORD *)v57 + 1) = *(_QWORD *)(v4 + 8);
          *((_QWORD *)v57 + 2) = v4;
          *(_QWORD *)(v4 + 8) = v57;
          v100 = *((_QWORD *)v57 + 1);
          if (v100)
            *(_QWORD *)(v100 + 16) = v57;
          if (*(_QWORD *)(v60 + 24) == v4)
            *(_QWORD *)(v60 + 24) = v57;
          v101 = *((_QWORD *)v57 + 4);
          *(_QWORD *)v19 = v57;
          *((_QWORD *)v19 + 1) = v101;
          if (v101)
            v102 = (char **)(v101 + 16);
          else
            v102 = (char **)(v57 + 24);
          *v102 = v19;
          *((_QWORD *)v57 + 4) = v19;
          goto LABEL_48;
        }
        if (!v60 || (v62 = *(_QWORD *)(v60 + 32), v61 = (char **)(v60 + 32), v62 != v4))
        {
          v63 = *(_QWORD *)(v4 + 16);
          *((_QWORD *)v57 + 2) = v63;
          if (!v63)
            goto LABEL_114;
          v61 = (char **)(v63 + 8);
        }
        *v61 = v57;
LABEL_114:
        *(_QWORD *)(v4 + 16) = v57;
        *((_QWORD *)v57 + 1) = v4;
        v64 = *((_QWORD *)v57 + 4);
        *(_QWORD *)v19 = v57;
        *((_QWORD *)v19 + 1) = v64;
        if (v64)
          v65 = (char **)(v64 + 16);
        else
          v65 = (char **)(v57 + 24);
        *v65 = v19;
        *((_QWORD *)v57 + 4) = v19;
        if (a3 != 2)
          TrimSpaces(a1, v4);
        v66 = CloneNode(a1, v4);
        v4 = (uint64_t)v66;
        v67 = *(_QWORD *)v58;
        *(_QWORD *)v66 = *(_QWORD *)v58;
        if (!v67 || (v69 = *(char **)(v67 + 32), v68 = (char **)(v67 + 32), v69 != v58))
        {
          v70 = *((_QWORD *)v58 + 2);
          *((_QWORD *)v66 + 2) = v70;
          if (!v70)
          {
LABEL_124:
            *((_QWORD *)v58 + 2) = v66;
            *((_QWORD *)v66 + 1) = v58;
            goto LABEL_48;
          }
          v68 = (char **)(v70 + 8);
        }
        *v68 = v66;
        goto LABEL_124;
      }
    }
    else
    {
      v56 = *(_DWORD *)(*(_QWORD *)(v4 + 56) + 32);
    }
    if (*((_DWORD *)v19 + 20) == 6)
    {
      v71 = (_QWORD *)v4;
      while (1)
      {
        v71 = (_QWORD *)*v71;
        if (!v71)
          break;
        if (v53 == (int *)v71[7])
        {
          if ((v56 & 0x8000) == 0 && !*(_DWORD *)(v4 + 96))
            ReportError(a1, v4, (uint64_t)v19, 7);
          if (!IsPushedLast(a1, v4, (uint64_t)v19))
            goto LABEL_236;
          goto LABEL_235;
        }
      }
    }
    v72 = v53[8] & 0x10 | v56 & 0x20000;
    IsElement = nodeIsElement((_BOOL8)v19);
    if (v72)
    {
      if (IsElement)
      {
        if (*((_DWORD *)v19 + 24))
          ReportError(a1, v4, (uint64_t)v19, 15);
        v82 = (_DWORD *)*((_QWORD *)v19 + 7);
        if (v82 && *v82 == 17)
          TrimSpaces(a1, v4);
        v83 = *(_QWORD *)(v4 + 32);
        *(_QWORD *)v19 = v4;
        *((_QWORD *)v19 + 1) = v83;
        if (v83)
          v84 = (char **)(v83 + 16);
        else
          v84 = (char **)(v4 + 24);
        *v84 = v19;
        *(_QWORD *)(v4 + 32) = v19;
        ParseTag(a1, (uint64_t)v19);
        goto LABEL_48;
      }
      goto LABEL_46;
    }
    if (!IsElement)
      goto LABEL_46;
    if ((*(_BYTE *)(*(_QWORD *)(v4 + 56) + 33) & 0x80) == 0)
      ReportError(a1, v4, (uint64_t)v19, 7);
    v74 = *(_DWORD *)(*((_QWORD *)v19 + 7) + 32);
    if ((v74 & 0xC) != 4)
    {
      v110 = *(_DWORD **)(v4 + 56);
      if (v110 && *v110 == 1)
      {
        if ((v74 & 0x4000) != 0)
        {
          if (!*(_QWORD *)(v4 + 24))
          {
            DiscardElement(a1, (uint64_t *)v4);
            UngetToken(a1);
            return;
          }
        }
        else
        {
LABEL_235:
          PopInline(a1, v4);
        }
      }
      goto LABEL_236;
    }
    MoveToHead((_QWORD *)a1, v4, (uint64_t *)v19);
LABEL_48:
    v19 = GetToken(a1, v17, v24, v25, v26, v27, v28, v29);
    if (!v19)
      goto LABEL_220;
  }
  if (v33 == 79)
  {
LABEL_86:
    v46 = *(_QWORD **)v4;
    if (!*(_QWORD *)v4)
    {
LABEL_90:
      CoerceNode(a1, (uint64_t)v19, 17, 0, 0);
      TrimSpaces(a1, v4);
      v48 = *(_QWORD *)(v4 + 32);
      *(_QWORD *)v19 = v4;
      *((_QWORD *)v19 + 1) = v48;
      if (v48)
        v49 = (char **)(v48 + 16);
      else
        v49 = (char **)(v4 + 24);
      *v49 = v19;
      *(_QWORD *)(v4 + 32) = v19;
      v50 = InferredTag(a1, 17);
      v51 = *(_QWORD *)(v4 + 32);
      *(_QWORD *)v50 = v4;
      *((_QWORD *)v50 + 1) = v51;
      if (v51)
        v52 = (char **)(v51 + 16);
      else
        v52 = (char **)(v4 + 24);
      *v52 = v50;
      *(_QWORD *)(v4 + 32) = v50;
      goto LABEL_48;
    }
    while (1)
    {
      v47 = (_DWORD *)v46[7];
      if (v47)
      {
        if (*v47 == 79)
          goto LABEL_99;
      }
      v46 = (_QWORD *)*v46;
      if (!v46)
        goto LABEL_90;
    }
  }
  if (!nodeHasCM((_BOOL8)v19, 16)
    || (v88 = (_DWORD *)*((_QWORD *)v19 + 7)) != 0 && *v88 == 1
    || nodeHasCM((_BOOL8)v19, 2048)
    || !nodeHasCM(v4, 16))
  {
    if (*(_DWORD *)(v6 + 24))
    {
      if (nodeHasCM((_BOOL8)v19, 128) || (v89 = (_DWORD *)*((_QWORD *)v19 + 7)) != 0 && *v89 == 104)
      {
        UngetToken(a1);
        goto LABEL_251;
      }
    }
    goto LABEL_99;
  }
  PopInline(a1, v4);
  if (v4)
  {
    v104 = *(_DWORD **)(v4 + 56);
    if (v104)
    {
      if (*v104 == 1)
        goto LABEL_46;
    }
  }
  v111 = (_DWORD *)*((_QWORD *)v19 + 7);
  if (v111 && *v111 == 1 && v111 != *(_DWORD **)(v4 + 56))
  {
    v107 = a1;
    v108 = v4;
    goto LABEL_240;
  }
  v107 = a1;
  v108 = v4;
LABEL_257:
  ReportError(v107, v108, (uint64_t)v19, 10);
  FreeNode(a1, (uint64_t)v19);
LABEL_237:
  if (a3 == 2)
    return;
LABEL_251:
  TrimSpaces(a1, v4);
}

_QWORD *InsertNodeAsParent(_QWORD *result, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  a2[3] = result;
  a2[4] = result;
  *a2 = *result;
  *result = a2;
  v2 = *a2;
  if (*(_QWORD **)(*a2 + 24) == result)
    *(_QWORD *)(v2 + 24) = a2;
  if (*(_QWORD **)(v2 + 32) == result)
    *(_QWORD *)(v2 + 32) = a2;
  a2[1] = result[1];
  result[1] = 0;
  v3 = a2[1];
  if (v3)
    *(_QWORD *)(v3 + 16) = a2;
  a2[2] = result[2];
  result[2] = 0;
  v4 = a2[2];
  if (v4)
    *(_QWORD *)(v4 + 8) = a2;
  return result;
}

void ParseEmpty(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char *Token;

  if (*(_DWORD *)(*(_QWORD *)(a1 + 104) + 28))
  {
    Token = GetToken(a1, a3, a3, a4, a5, a6, a7, a8);
    if (Token)
    {
      if (*((_DWORD *)Token + 20) == 6 && *((_QWORD *)Token + 7) == *(_QWORD *)(a2 + 56))
      {
        FreeNode(a1, (uint64_t)Token);
      }
      else
      {
        ReportError(a1, a2, (uint64_t)Token, 41);
        UngetToken(a1);
      }
    }
  }
}

void ParseDefList(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v10;
  char *Token;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int *v19;
  int v20;
  _QWORD *v21;
  int *v22;
  int v23;
  int v24;
  uint64_t v25;
  char **v26;
  uint64_t v27;
  uint64_t v28;
  char **v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  char **v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int v46;

  if ((*(_BYTE *)(*(_QWORD *)(a2 + 56) + 32) & 1) != 0)
    return;
  v8 = a2;
  v10 = *(_QWORD *)(a1 + 104);
  *(_QWORD *)(v10 + 128) = 0;
  Token = GetToken(a1, 0, a3, a4, a5, a6, a7, a8);
  if (!Token)
  {
LABEL_53:
    v43 = a1;
    v44 = v8;
    v45 = 0;
    v46 = 6;
    goto LABEL_54;
  }
  v12 = Token;
  while (1)
  {
    while (1)
    {
      if (*((_QWORD *)v12 + 7) == *(_QWORD *)(v8 + 56) && *((_DWORD *)v12 + 20) == 6)
      {
        FreeNode(a1, (uint64_t)v12);
        *(_DWORD *)(v8 + 92) = 1;
        return;
      }
      if (!InsertMisc((_QWORD *)v8, (uint64_t)v12))
        break;
LABEL_28:
      v12 = GetToken(a1, 0, v13, v14, v15, v16, v17, v18);
      if (!v12)
        goto LABEL_53;
    }
    if (nodeIsText((_BOOL8)v12))
    {
      UngetToken(a1);
      v12 = InferredTag(a1, 32);
      ReportError(a1, v8, (uint64_t)v12, 12);
    }
    v19 = (int *)*((_QWORD *)v12 + 7);
    if (!v19)
      goto LABEL_27;
    v20 = *((_DWORD *)v12 + 20);
    if (v20 == 6)
    {
      v21 = (_QWORD *)v8;
      if (*v19 == 37)
      {
        *(_DWORD *)(a1 + 4912) = 1;
        goto LABEL_27;
      }
      while (1)
      {
        v21 = (_QWORD *)*v21;
        if (!v21)
          break;
        v22 = (int *)v21[7];
        if (v22 && *v22 == 16)
          goto LABEL_27;
        if (v19 == v22)
        {
          ReportError(a1, v8, (uint64_t)v12, 7);
          UngetToken(a1);
          return;
        }
      }
      if (!v12)
        break;
    }
    v23 = *v19;
    if (v23 == 26 || v23 == 32)
      goto LABEL_26;
    if (v23 != 20)
      break;
    v27 = *(_QWORD *)(v8 + 24);
    v28 = *(_QWORD *)v8;
    *(_QWORD *)v12 = *(_QWORD *)v8;
    if (v27)
    {
      if (v28 && (v29 = (char **)(v28 + 32), *(_QWORD *)(v28 + 32) == v8))
      {
LABEL_39:
        *v29 = v12;
        v28 = *(_QWORD *)v12;
      }
      else
      {
        v30 = *(_QWORD *)(v8 + 16);
        *((_QWORD *)v12 + 2) = v30;
        if (v30)
        {
          v29 = (char **)(v30 + 8);
          goto LABEL_39;
        }
      }
      *(_QWORD *)(v8 + 16) = v12;
      *((_QWORD *)v12 + 1) = v8;
      goto LABEL_45;
    }
    *((_QWORD *)v12 + 1) = *(_QWORD *)(v8 + 8);
    *((_QWORD *)v12 + 2) = v8;
    *(_QWORD *)(v8 + 8) = v12;
    v31 = *((_QWORD *)v12 + 1);
    if (v31)
      *(_QWORD *)(v31 + 16) = v12;
    if (*(_QWORD *)(v28 + 24) == v8)
      *(_QWORD *)(v28 + 24) = v12;
LABEL_45:
    *(_DWORD *)(v10 + 20) = 0;
    ParseTag(a1, (uint64_t)v12);
    *(_DWORD *)(v10 + 20) = 1;
    if (*(char **)(v28 + 32) == v12)
    {
      v38 = InferredTag(a1, 31);
      v8 = (uint64_t)v38;
      v39 = *(_QWORD *)v12;
      *(_QWORD *)v38 = *(_QWORD *)v12;
      if (v39 && (v41 = *(char **)(v39 + 32), v40 = (char **)(v39 + 32), v41 == v12))
      {
LABEL_50:
        *v40 = v38;
      }
      else
      {
        v42 = *((_QWORD *)v12 + 2);
        *((_QWORD *)v38 + 2) = v42;
        if (v42)
        {
          v40 = (char **)(v42 + 8);
          goto LABEL_50;
        }
      }
      *((_QWORD *)v12 + 2) = v38;
      *((_QWORD *)v38 + 1) = v12;
    }
    v12 = GetToken(a1, 0, v32, v33, v34, v35, v36, v37);
    if (!v12)
      goto LABEL_53;
  }
  UngetToken(a1);
  v24 = *(_DWORD *)(*((_QWORD *)v12 + 7) + 32);
  if ((v24 & 0x18) != 0)
  {
    if ((v24 & 0x10) == 0 && *(_DWORD *)(v10 + 20))
      return;
    v12 = InferredTag(a1, 26);
    ReportError(a1, v8, (uint64_t)v12, 12);
    v20 = *((_DWORD *)v12 + 20);
LABEL_26:
    if (v20 != 6)
    {
      v25 = *(_QWORD *)(v8 + 32);
      *(_QWORD *)v12 = v8;
      *((_QWORD *)v12 + 1) = v25;
      if (v25)
        v26 = (char **)(v25 + 16);
      else
        v26 = (char **)(v8 + 24);
      *v26 = v12;
      *(_QWORD *)(v8 + 32) = v12;
      ParseTag(a1, (uint64_t)v12);
      goto LABEL_28;
    }
LABEL_27:
    ReportError(a1, v8, (uint64_t)v12, 8);
    FreeNode(a1, (uint64_t)v12);
    goto LABEL_28;
  }
  v43 = a1;
  v44 = v8;
  v45 = (uint64_t)v12;
  v46 = 11;
LABEL_54:
  ReportError(v43, v44, v45, v46);
}

char *ParseRow(char *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  _DWORD *v10;
  char *v11;
  int v12;
  _BOOL4 HasCM;
  int *v14;
  int v15;
  _QWORD *v16;
  _DWORD *v17;
  _BOOL4 v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _DWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  _DWORD *v31;
  int *v32;
  int v33;
  int v34;
  uint64_t v35;
  char **v36;
  int v37;

  if ((*(_BYTE *)(*(_QWORD *)(a2 + 56) + 32) & 1) != 0)
    return result;
  v9 = (uint64_t)result;
  v10 = (_DWORD *)*((_QWORD *)result + 13);
  result = GetToken((uint64_t)result, 0, a3, a4, a5, a6, a7, a8);
  if (!result)
    return result;
  v11 = result;
  while (1)
  {
    v12 = *((_DWORD *)v11 + 20);
    if (*((_QWORD *)v11 + 7) == *(_QWORD *)(a2 + 56))
      break;
    if (v12 != 6)
      goto LABEL_27;
    HasCM = nodeHasCM((_BOOL8)v11, 130);
    v14 = (int *)*((_QWORD *)v11 + 7);
    if (HasCM)
    {
      if (v14)
        v15 = *v14;
      else
        v15 = 0;
    }
    else
    {
      if (!v14)
        goto LABEL_20;
      v15 = *v14;
      if (*v14 != 104)
        goto LABEL_19;
    }
    v16 = *(_QWORD **)a2;
    if (*(_QWORD *)a2)
    {
      do
      {
        v17 = (_DWORD *)v16[7];
        if (v17)
        {
          if (*v17 == v15)
            return (char *)UngetToken(v9);
        }
        v16 = (_QWORD *)*v16;
      }
      while (v16);
    }
    if (v14)
    {
      v15 = *v14;
LABEL_19:
      if (v15 == 37)
        goto LABEL_22;
    }
LABEL_20:
    v18 = nodeHasCM((_BOOL8)v11, 24);
    v14 = (int *)*((_QWORD *)v11 + 7);
    if (v18)
    {
      if (v14)
      {
LABEL_22:
        if (*v14 == 37)
          *(_DWORD *)(v9 + 4912) = 1;
      }
      goto LABEL_34;
    }
    if (v14)
    {
      v19 = *v14;
      if (v19 == 109 || v19 == 106)
        goto LABEL_34;
    }
LABEL_27:
    if (!InsertMisc((_QWORD *)a2, (uint64_t)v11))
    {
      v26 = (_DWORD *)*((_QWORD *)v11 + 7);
      if (v26)
      {
        if (*v26 == 104)
          goto LABEL_34;
      }
      else if (*((_DWORD *)v11 + 20) != 4)
      {
        goto LABEL_34;
      }
      if (nodeHasCM((_BOOL8)v11, 256))
        return (char *)UngetToken(v9);
      if (*((_DWORD *)v11 + 20) == 6)
      {
LABEL_34:
        v27 = v9;
        v28 = a2;
        v29 = (uint64_t)v11;
        v30 = 8;
LABEL_35:
        ReportError(v27, v28, v29, v30);
        FreeNode(v9, (uint64_t)v11);
        goto LABEL_36;
      }
      v31 = (_DWORD *)*((_QWORD *)v11 + 7);
      if (v31 && *v31 == 37)
      {
        UngetToken(v9);
        v11 = InferredTag(v9, 106);
        ReportError(v9, a2, (uint64_t)v11, 12);
        if (!v11 || (v32 = (int *)*((_QWORD *)v11 + 7)) == 0)
        {
LABEL_57:
          v27 = v9;
          v28 = a2;
          v29 = (uint64_t)v11;
          v30 = 11;
          goto LABEL_35;
        }
      }
      else
      {
        if (nodeIsText((_BOOL8)v11) || nodeHasCM((_BOOL8)v11, 24))
        {
          MoveBeforeTable((_QWORD *)a2, (uint64_t)v11);
          ReportError(v9, a2, (uint64_t)v11, 11);
          v33 = v10[5];
          *(_QWORD *)(v10 + 5) = 0x100000000;
          if (*((_DWORD *)v11 + 20) != 4)
            ParseTag(v9, (uint64_t)v11);
          v10[5] = v33;
          v10[6] = 0;
          goto LABEL_36;
        }
        v32 = (int *)*((_QWORD *)v11 + 7);
        if ((v32[8] & 4) != 0)
        {
          ReportError(v9, a2, (uint64_t)v11, 11);
          MoveToHead((_QWORD *)v9, a2, (uint64_t *)v11);
          goto LABEL_36;
        }
      }
      v34 = *v32;
      if (v34 == 106 || v34 == 109)
      {
        v35 = *(_QWORD *)(a2 + 32);
        *(_QWORD *)v11 = a2;
        *((_QWORD *)v11 + 1) = v35;
        if (v35)
          v36 = (char **)(v35 + 16);
        else
          v36 = (char **)(a2 + 24);
        *v36 = v11;
        *(_QWORD *)(a2 + 32) = v11;
        v37 = v10[5];
        v10[5] = 0;
        ParseTag(v9, (uint64_t)v11);
        v10[5] = v37;
        while (v10[37] > v10[38])
          PopInline(v9, 0);
        goto LABEL_36;
      }
      goto LABEL_57;
    }
LABEL_36:
    result = GetToken(v9, 0, v20, v21, v22, v23, v24, v25);
    v11 = result;
    if (!result)
      return result;
  }
  if (v12 == 6)
  {
    FreeNode(v9, (uint64_t)v11);
    *(_DWORD *)(a2 + 92) = 1;
  }
  else
  {
    UngetToken(v9);
  }
  return (char *)FixEmptyRow(v9, a2);
}

uint64_t FixEmptyRow(uint64_t result, uint64_t a2)
{
  char **v2;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char **v7;

  v2 = (char **)(a2 + 24);
  if (!*(_QWORD *)(a2 + 24))
  {
    v4 = result;
    v5 = InferredTag(result, 106);
    v6 = *(_QWORD *)(a2 + 32);
    *(_QWORD *)v5 = a2;
    *((_QWORD *)v5 + 1) = v6;
    if (v6)
      v7 = (char **)(v6 + 16);
    else
      v7 = v2;
    *v7 = v5;
    *(_QWORD *)(a2 + 32) = v5;
    return ReportError(v4, a2, (uint64_t)v5, 12);
  }
  return result;
}

_QWORD *MoveBeforeTable(_QWORD *result, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  _DWORD *v4;
  __int128 v5;
  uint64_t v6;
  _QWORD *v7;
  __int128 v8;
  uint64_t v9;

  v2 = (_QWORD *)*result;
  if (*result)
  {
    v3 = (_QWORD *)*result;
    while (1)
    {
      v4 = (_DWORD *)v3[7];
      if (v4)
      {
        if (*v4 == 104)
          break;
      }
      v3 = (_QWORD *)*v3;
      if (!v3)
        goto LABEL_6;
    }
    *(_QWORD *)(a2 + 16) = v3;
    v8 = *(_OWORD *)v3;
    *(_OWORD *)a2 = *(_OWORD *)v3;
    v3[1] = a2;
    v9 = *(_QWORD *)(a2 + 8);
    if (v9)
      *(_QWORD *)(v9 + 16) = a2;
    v7 = (_QWORD *)(v8 + 24);
    if (*(_QWORD **)(v8 + 24) == v3)
      goto LABEL_13;
  }
  else
  {
LABEL_6:
    *(_QWORD *)(a2 + 16) = v2;
    v5 = *(_OWORD *)v2;
    *(_OWORD *)a2 = *(_OWORD *)v2;
    v2[1] = a2;
    v6 = *(_QWORD *)(a2 + 8);
    if (v6)
      *(_QWORD *)(v6 + 16) = a2;
    v7 = (_QWORD *)(v5 + 24);
    if (*(_QWORD **)(v5 + 24) == v2)
LABEL_13:
      *v7 = a2;
  }
  return result;
}

void ParseRowGroup(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  char *Token;
  char *v12;
  _DWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int *v20;
  int v21;
  int v22;
  uint64_t v23;
  _BOOL4 HasCM;
  _QWORD *v25;
  unsigned int v26;
  int v27;
  uint64_t v28;
  char **v29;

  if ((*(_BYTE *)(*(_QWORD *)(a2 + 56) + 32) & 1) != 0)
    return;
  v10 = *(_QWORD *)(a1 + 104);
  Token = GetToken(a1, 0, a3, a4, a5, a6, a7, a8);
  if (!Token)
    return;
  v12 = Token;
  while (1)
  {
    v13 = (_DWORD *)*((_QWORD *)v12 + 7);
    if (v13 == *(_DWORD **)(a2 + 56))
      break;
    if (v13 && *v13 == 104 && *((_DWORD *)v12 + 20) == 6)
      goto LABEL_50;
    if (!InsertMisc((_QWORD *)a2, (uint64_t)v12))
    {
      v20 = (int *)*((_QWORD *)v12 + 7);
      v21 = *((_DWORD *)v12 + 20);
      if (v20)
      {
        if (v21 == 6)
          goto LABEL_14;
        v22 = *v20;
        if (v22 == 109 || v22 == 106)
        {
          UngetToken(a1);
          v12 = InferredTag(a1, 112);
          ReportError(a1, a2, (uint64_t)v12, 12);
          goto LABEL_14;
        }
LABEL_22:
        if (nodeIsText((_BOOL8)v12) || nodeHasCM((_BOOL8)v12, 24))
        {
          MoveBeforeTable((_QWORD *)a2, (uint64_t)v12);
          ReportError(a1, a2, (uint64_t)v12, 11);
          *(_DWORD *)(v10 + 24) = 1;
          if (*((_DWORD *)v12 + 20) != 4)
            ParseTag(a1, (uint64_t)v12);
          *(_DWORD *)(v10 + 24) = 0;
          goto LABEL_43;
        }
        if ((*(_BYTE *)(*((_QWORD *)v12 + 7) + 32) & 4) != 0)
        {
          ReportError(a1, a2, (uint64_t)v12, 11);
          MoveToHead((_QWORD *)a1, a2, (uint64_t *)v12);
          goto LABEL_43;
        }
LABEL_14:
        v23 = *((_QWORD *)v12 + 7);
        if (*((_DWORD *)v12 + 20) == 6)
        {
          if (v23 && *(_DWORD *)v23 == 37)
          {
LABEL_20:
            *(_DWORD *)(a1 + 4912) = 1;
            goto LABEL_42;
          }
          HasCM = nodeHasCM((_BOOL8)v12, 24);
          v23 = *((_QWORD *)v12 + 7);
          if (HasCM)
          {
            if (v23 && *(_DWORD *)v23 == 37)
              goto LABEL_20;
LABEL_42:
            ReportError(a1, a2, (uint64_t)v12, 8);
            FreeNode(a1, (uint64_t)v12);
            goto LABEL_43;
          }
          v25 = (_QWORD *)a2;
          if (v23)
          {
            v26 = *(_DWORD *)v23 - 106;
            v25 = (_QWORD *)a2;
            if (v26 <= 6)
            {
              v25 = (_QWORD *)a2;
              if (((1 << v26) & 0x49) != 0)
                goto LABEL_42;
            }
          }
          while (1)
          {
            v25 = (_QWORD *)*v25;
            if (!v25)
              break;
            if (v23 == v25[7])
              goto LABEL_50;
          }
        }
        v27 = *((_DWORD *)v12 + 20);
        if ((*(_BYTE *)(v23 + 33) & 1) != 0)
        {
          if (v27 != 6)
            goto LABEL_50;
        }
        else if (v27 != 6)
        {
          if (*(_DWORD *)v23 != 112)
          {
            v12 = InferredTag(a1, 112);
            ReportError(a1, a2, (uint64_t)v12, 12);
            UngetToken(a1);
          }
          v28 = *(_QWORD *)(a2 + 32);
          *(_QWORD *)v12 = a2;
          *((_QWORD *)v12 + 1) = v28;
          if (v28)
            v29 = (char **)(v28 + 16);
          else
            v29 = (char **)(a2 + 24);
          *v29 = v12;
          *(_QWORD *)(a2 + 32) = v12;
          ParseTag(a1, (uint64_t)v12);
          goto LABEL_43;
        }
        goto LABEL_42;
      }
      if (v21 == 4)
        goto LABEL_22;
      goto LABEL_42;
    }
LABEL_43:
    v12 = GetToken(a1, 0, v14, v15, v16, v17, v18, v19);
    if (!v12)
      return;
  }
  if (*((_DWORD *)v12 + 20) == 6)
  {
    *(_DWORD *)(a2 + 92) = 1;
    FreeNode(a1, (uint64_t)v12);
    return;
  }
LABEL_50:
  UngetToken(a1);
}

void ParseColGroup(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char *Token;
  char *v11;
  _DWORD *v12;
  int v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _DWORD *v21;
  uint64_t v22;
  char **v23;

  if ((*(_BYTE *)(*(_QWORD *)(a2 + 56) + 32) & 1) == 0)
  {
    Token = GetToken(a1, 0, a3, a4, a5, a6, a7, a8);
    if (Token)
    {
      v11 = Token;
      do
      {
        v12 = (_DWORD *)*((_QWORD *)v11 + 7);
        v13 = *((_DWORD *)v11 + 20);
        if (v12 == *(_DWORD **)(a2 + 56))
        {
          if (v13 == 6)
          {
            FreeNode(a1, (uint64_t)v11);
            *(_DWORD *)(a2 + 92) = 1;
            return;
          }
        }
        else if (v13 == 6)
        {
          v14 = (_QWORD *)a2;
          if (v12)
          {
            v14 = (_QWORD *)a2;
            if (*v12 == 37)
            {
              *(_DWORD *)(a1 + 4912) = 1;
LABEL_18:
              ReportError(a1, a2, (uint64_t)v11, 8);
              FreeNode(a1, (uint64_t)v11);
              goto LABEL_23;
            }
          }
          while (1)
          {
            v14 = (_QWORD *)*v14;
            if (!v14)
              break;
            if (v12 == (_DWORD *)v14[7])
              goto LABEL_25;
          }
        }
        if (nodeIsText((_BOOL8)v11))
          goto LABEL_25;
        if (!InsertMisc((_QWORD *)a2, (uint64_t)v11))
        {
          v21 = (_DWORD *)*((_QWORD *)v11 + 7);
          if (v21)
          {
            if (*v21 != 23)
            {
LABEL_25:
              UngetToken(a1);
              return;
            }
            if (*((_DWORD *)v11 + 20) != 6)
            {
              v22 = *(_QWORD *)(a2 + 32);
              *(_QWORD *)v11 = a2;
              *((_QWORD *)v11 + 1) = v22;
              if (v22)
                v23 = (char **)(v22 + 16);
              else
                v23 = (char **)(a2 + 24);
              *v23 = v11;
              *(_QWORD *)(a2 + 32) = v11;
              ParseTag(a1, (uint64_t)v11);
              goto LABEL_23;
            }
          }
          goto LABEL_18;
        }
LABEL_23:
        v11 = GetToken(a1, 0, v15, v16, v17, v18, v19, v20);
      }
      while (v11);
    }
  }
}

void ParseTableTag(uint64_t a1, uint64_t a2)
{
  _DWORD *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *Token;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _DWORD *v20;
  int v21;
  unsigned int v22;
  BOOL v23;
  int v24;
  _DWORD *v26;
  __int128 v27;
  uint64_t v28;
  _BOOL4 HasCM;
  _QWORD *v30;
  uint64_t v31;
  char **v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;

  v4 = *(_DWORD **)(a1 + 104);
  DeferDup(a1);
  v5 = v4[38];
  v4[38] = v4[37];
  Token = GetToken(a1, 0, v6, v7, v8, v9, v10, v11);
  if (!Token)
  {
LABEL_43:
    v33 = a1;
    v34 = a2;
    v35 = 0;
    v36 = 6;
    goto LABEL_44;
  }
  v13 = Token;
  while (1)
  {
    if (*((_QWORD *)v13 + 7) == *(_QWORD *)(a2 + 56) && *((_DWORD *)v13 + 20) == 6)
    {
      FreeNode(a1, (uint64_t)v13);
      v4[38] = v5;
      *(_DWORD *)(a2 + 92) = 1;
      return;
    }
    if (!InsertMisc((_QWORD *)a2, (uint64_t)v13))
      break;
LABEL_39:
    v13 = GetToken(a1, 0, v14, v15, v16, v17, v18, v19);
    if (!v13)
      goto LABEL_43;
  }
  v20 = (_DWORD *)*((_QWORD *)v13 + 7);
  v21 = *((_DWORD *)v13 + 20);
  if (v20)
  {
    if (v21 == 6)
      goto LABEL_13;
    v22 = *v20 - 104;
    v23 = v22 > 5;
    v24 = (1 << v22) & 0x25;
    if (!v23 && v24 != 0)
    {
      UngetToken(a1);
      v13 = InferredTag(a1, 112);
      ReportError(a1, a2, (uint64_t)v13, 12);
      goto LABEL_13;
    }
  }
  else if (v21 != 4)
  {
    goto LABEL_38;
  }
  if (nodeIsText((_BOOL8)v13) || nodeHasCM((_BOOL8)v13, 24))
  {
    *((_QWORD *)v13 + 2) = a2;
    v27 = *(_OWORD *)a2;
    *(_OWORD *)v13 = *(_OWORD *)a2;
    *(_QWORD *)(a2 + 8) = v13;
    v28 = *((_QWORD *)v13 + 1);
    if (v28)
      *(_QWORD *)(v28 + 16) = v13;
    if (*(_QWORD *)(v27 + 24) == a2)
      *(_QWORD *)(v27 + 24) = v13;
    ReportError(a1, a2, (uint64_t)v13, 11);
    v4[6] = 1;
    if (*((_DWORD *)v13 + 20) != 4)
      ParseTag(a1, (uint64_t)v13);
    v4[6] = 0;
    goto LABEL_39;
  }
  if ((*(_BYTE *)(*((_QWORD *)v13 + 7) + 32) & 4) != 0)
  {
    MoveToHead((_QWORD *)a1, a2, (uint64_t *)v13);
    goto LABEL_39;
  }
LABEL_13:
  if (*((_DWORD *)v13 + 20) == 6)
  {
    v26 = (_DWORD *)*((_QWORD *)v13 + 7);
    if (v26 && *v26 == 37)
    {
      *(_DWORD *)(a1 + 4912) = 1;
LABEL_38:
      ReportError(a1, a2, (uint64_t)v13, 8);
      FreeNode(a1, (uint64_t)v13);
      goto LABEL_39;
    }
    if (nodeHasCM((_BOOL8)v13, 640))
      goto LABEL_38;
    HasCM = nodeHasCM((_BOOL8)v13, 24);
    v30 = (_QWORD *)a2;
    if (HasCM)
      goto LABEL_38;
    while (1)
    {
      v30 = (_QWORD *)*v30;
      if (!v30)
        break;
      if (*((_QWORD *)v13 + 7) == v30[7])
      {
        ReportError(a1, a2, (uint64_t)v13, 7);
        UngetToken(a1);
        goto LABEL_45;
      }
    }
  }
  if ((*(_BYTE *)(*((_QWORD *)v13 + 7) + 32) & 0x80) != 0)
  {
    if (nodeIsElement((_BOOL8)v13))
    {
      v31 = *(_QWORD *)(a2 + 32);
      *(_QWORD *)v13 = a2;
      *((_QWORD *)v13 + 1) = v31;
      if (v31)
        v32 = (char **)(v31 + 16);
      else
        v32 = (char **)(a2 + 24);
      *v32 = v13;
      *(_QWORD *)(a2 + 32) = v13;
      ParseTag(a1, (uint64_t)v13);
      goto LABEL_39;
    }
    goto LABEL_38;
  }
  UngetToken(a1);
  v33 = a1;
  v34 = a2;
  v35 = (uint64_t)v13;
  v36 = 11;
LABEL_44:
  ReportError(v33, v34, v35, v36);
LABEL_45:
  v4[38] = v5;
}

uint64_t ParsePre(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *Token;
  char *v11;
  _DWORD *v12;
  _DWORD *v13;
  int v14;
  _QWORD *v15;
  _DWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char **v24;
  _DWORD *v25;
  _DWORD *v26;
  _DWORD *v27;
  uint64_t v28;
  char **v29;
  _DWORD *v30;
  _DWORD *v31;
  _DWORD *v32;
  _QWORD *v33;
  char **v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  char **v39;
  char *v40;
  uint64_t v41;

  if ((*(_BYTE *)(*(_QWORD *)(a2 + 56) + 32) & 1) != 0)
    return result;
  v2 = a2;
  v3 = result;
  InlineDup(result, 0);
  Token = GetToken(v3, 2, v4, v5, v6, v7, v8, v9);
  if (!Token)
    return ReportError(v3, v2, 0, 6);
  v11 = Token;
  while (1)
  {
    if (*((_DWORD *)v11 + 20) == 6)
    {
      v12 = (_DWORD *)*((_QWORD *)v11 + 7);
      v13 = *(_DWORD **)(v2 + 56);
      if (v12 == v13)
        goto LABEL_23;
      v14 = v12 ? *v12 : 0;
      v15 = *(_QWORD **)v2;
      if (*(_QWORD *)v2)
      {
        while (1)
        {
          v16 = (_DWORD *)v15[7];
          if (v16)
          {
            if (*v16 == v14)
              break;
          }
          v15 = (_QWORD *)*v15;
          if (!v15)
            goto LABEL_13;
        }
LABEL_23:
        if (!v12 || (*v12 | 0x20) != 0x30)
        {
          if (v12 == v13)
          {
            FreeNode(v3, (uint64_t)v11);
          }
          else
          {
            ReportError(v3, v2, (uint64_t)v11, 7);
            UngetToken(v3);
          }
          *(_DWORD *)(v2 + 92) = 1;
          return TrimSpaces(v3, v2);
        }
        goto LABEL_25;
      }
    }
LABEL_13:
    if (nodeIsText((_BOOL8)v11))
      goto LABEL_14;
    if (!InsertMisc((_QWORD *)v2, (uint64_t)v11))
      break;
LABEL_26:
    v11 = GetToken(v3, 2, v17, v18, v19, v20, v21, v22);
    if (!v11)
      return ReportError(v3, v2, 0, 6);
  }
  v25 = (_DWORD *)*((_QWORD *)v11 + 7);
  if (!v25)
    goto LABEL_25;
  if (*v25 == 79)
  {
LABEL_21:
    if (*((_DWORD *)v11 + 20) == 5)
    {
      ReportError(v3, v2, (uint64_t)v11, 14);
      TrimSpaces(v3, v2);
      CoerceNode(v3, (uint64_t)v11, 17, 0, 0);
      FreeAttrs(v3, (uint64_t)v11);
LABEL_14:
      v23 = *(_QWORD *)(v2 + 32);
      *(_QWORD *)v11 = v2;
      *((_QWORD *)v11 + 1) = v23;
      if (v23)
        v24 = (char **)(v23 + 16);
      else
        v24 = (char **)(v2 + 24);
      *v24 = v11;
      *(_QWORD *)(v2 + 32) = v11;
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  if (nodeIsText((_BOOL8)v11)
    || (v30 = (_DWORD *)*((_QWORD *)v11 + 7)) != 0 && *v30 != 80 && nodeHasCM((_BOOL8)v11, 1048592))
  {
    v26 = (_DWORD *)*((_QWORD *)v11 + 7);
    if (v26 && *v26 == 79)
      goto LABEL_21;
    if (nodeIsElement((_BOOL8)v11))
    {
      v27 = (_DWORD *)*((_QWORD *)v11 + 7);
      if (v27 && *v27 == 17)
        TrimSpaces(v3, v2);
      v28 = *(_QWORD *)(v2 + 32);
      *(_QWORD *)v11 = v2;
      *((_QWORD *)v11 + 1) = v28;
      if (v28)
        v29 = (char **)(v28 + 16);
      else
        v29 = (char **)(v2 + 24);
      *v29 = v11;
      *(_QWORD *)(v2 + 32) = v11;
      ParseTag(v3, (uint64_t)v11);
      goto LABEL_26;
    }
LABEL_25:
    ReportError(v3, v2, (uint64_t)v11, 8);
    FreeNode(v3, (uint64_t)v11);
    goto LABEL_26;
  }
  if (*((_DWORD *)v11 + 20) == 6)
  {
    if (*(_DWORD *)(*(_QWORD *)(v3 + 104) + 24))
    {
      if (nodeHasCM((_BOOL8)v11, 128) || (v31 = (_DWORD *)*((_QWORD *)v11 + 7)) != 0 && *v31 == 104)
      {
        UngetToken(v3);
        return TrimSpaces(v3, v2);
      }
    }
    goto LABEL_25;
  }
  if (!nodeHasCM((_BOOL8)v11, 640))
  {
    v32 = (_DWORD *)*((_QWORD *)v11 + 7);
    if (!v32 || *v32 != 104)
    {
      v33 = *(_QWORD **)v2;
      *(_QWORD *)v11 = *(_QWORD *)v2;
      if (v33 && (v35 = v33[4], v34 = (char **)(v33 + 4), v35 == v2))
      {
LABEL_55:
        *v34 = v11;
      }
      else
      {
        v36 = *(_QWORD *)(v2 + 16);
        *((_QWORD *)v11 + 2) = v36;
        if (v36)
        {
          v34 = (char **)(v36 + 8);
          goto LABEL_55;
        }
      }
      *(_QWORD *)(v2 + 16) = v11;
      *((_QWORD *)v11 + 1) = v2;
      ReportError(v3, v2, (uint64_t)v11, 7);
      ParseTag(v3, (uint64_t)v11);
      v37 = InferredTag(v3, 82);
      ReportError(v3, v2, (uint64_t)v37, 15);
      v38 = *(_QWORD *)v11;
      *(_QWORD *)v37 = *(_QWORD *)v11;
      if (v38 && (v40 = *(char **)(v38 + 32), v39 = (char **)(v38 + 32), v40 == v11))
      {
LABEL_60:
        *v39 = v37;
      }
      else
      {
        v41 = *((_QWORD *)v11 + 2);
        *((_QWORD *)v37 + 2) = v41;
        if (v41)
        {
          v39 = (char **)(v41 + 8);
          goto LABEL_60;
        }
      }
      *((_QWORD *)v11 + 2) = v37;
      *((_QWORD *)v37 + 1) = v11;
      v2 = (uint64_t)v37;
      goto LABEL_26;
    }
  }
  if (!*(_DWORD *)(*(_QWORD *)(v3 + 104) + 24))
    ReportError(v3, v2, (uint64_t)v11, 7);
  return UngetToken(v3);
}

char *ParseOptGroup(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char *result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int *v18;
  int v19;
  uint64_t v20;
  uint64_t *v21;

  *(_QWORD *)(*(_QWORD *)(a1 + 104) + 128) = 0;
  result = GetToken(a1, 0, a3, a4, a5, a6, a7, a8);
  if (result)
  {
    v11 = (uint64_t)result;
    do
    {
      if (*(_QWORD *)(v11 + 56) == *(_QWORD *)(a2 + 56) && *(_DWORD *)(v11 + 80) == 6)
      {
        FreeNode(a1, v11);
        *(_DWORD *)(a2 + 92) = 1;
        return (char *)TrimSpaces(a1, a2);
      }
      if (!InsertMisc((_QWORD *)a2, v11))
      {
        if (*(_DWORD *)(v11 + 80) == 5)
        {
          v18 = *(int **)(v11 + 56);
          if (v18)
          {
            v19 = *v18;
            if (v19 == 78)
              goto LABEL_11;
            if (v19 == 77)
            {
              ReportError(a1, a2, v11, 19);
LABEL_11:
              v20 = *(_QWORD *)(a2 + 32);
              *(_QWORD *)v11 = a2;
              *(_QWORD *)(v11 + 8) = v20;
              if (v20)
                v21 = (uint64_t *)(v20 + 16);
              else
                v21 = (uint64_t *)(a2 + 24);
              *v21 = v11;
              *(_QWORD *)(a2 + 32) = v11;
              ParseTag(a1, v11);
              goto LABEL_16;
            }
          }
        }
        ReportError(a1, a2, v11, 8);
        FreeNode(a1, v11);
      }
LABEL_16:
      result = GetToken(a1, 0, v12, v13, v14, v15, v16, v17);
      v11 = (uint64_t)result;
    }
    while (result);
  }
  return result;
}

uint64_t ParseSelect(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char *Token;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _DWORD *v18;
  unsigned int v19;
  BOOL v20;
  int v21;
  BOOL v22;
  uint64_t v23;
  char **v24;

  *(_QWORD *)(*(_QWORD *)(a1 + 104) + 128) = 0;
  Token = GetToken(a1, 0, a3, a4, a5, a6, a7, a8);
  if (!Token)
    return ReportError(a1, a2, 0, 6);
  v11 = Token;
  while (*((_QWORD *)v11 + 7) != *(_QWORD *)(a2 + 56) || *((_DWORD *)v11 + 20) != 6)
  {
    if (!InsertMisc((_QWORD *)a2, (uint64_t)v11))
    {
      if (*((_DWORD *)v11 + 20) == 5
        && (v18 = (_DWORD *)*((_QWORD *)v11 + 7)) != 0
        && ((v19 = *v18 - 77, v20 = v19 > 0xF, v21 = (1 << v19) & 0x8003, !v20) ? (v22 = v21 == 0) : (v22 = 1), !v22))
      {
        v23 = *(_QWORD *)(a2 + 32);
        *(_QWORD *)v11 = a2;
        *((_QWORD *)v11 + 1) = v23;
        if (v23)
          v24 = (char **)(v23 + 16);
        else
          v24 = (char **)(a2 + 24);
        *v24 = v11;
        *(_QWORD *)(a2 + 32) = v11;
        ParseTag(a1, (uint64_t)v11);
      }
      else
      {
        ReportError(a1, a2, (uint64_t)v11, 8);
        FreeNode(a1, (uint64_t)v11);
      }
    }
    v11 = GetToken(a1, 0, v12, v13, v14, v15, v16, v17);
    if (!v11)
      return ReportError(a1, a2, 0, 6);
  }
  FreeNode(a1, (uint64_t)v11);
  *(_DWORD *)(a2 + 92) = 1;
  return TrimSpaces(a1, a2);
}

char *ParseText(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _DWORD *v10;
  uint64_t v11;
  char v12;
  char *result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;

  *(_QWORD *)(*(_QWORD *)(a1 + 104) + 128) = 0;
  if (a2 && (v10 = *(_DWORD **)(a2 + 56)) != 0 && *v10 == 107)
  {
    v11 = 2;
    v12 = 1;
  }
  else
  {
    v12 = 0;
    v11 = 1;
  }
  result = GetToken(a1, v11, a3, a4, a5, a6, a7, a8);
  if (!result)
  {
LABEL_27:
    if ((*(_BYTE *)(*(_QWORD *)(a2 + 56) + 33) & 0x80) == 0)
      return (char *)ReportError(a1, a2, 0, 6);
    return result;
  }
  v14 = (uint64_t)result;
  while (1)
  {
    if (*(_QWORD *)(v14 + 56) == *(_QWORD *)(a2 + 56) && *(_DWORD *)(v14 + 80) == 6)
    {
      FreeNode(a1, v14);
      *(_DWORD *)(a2 + 92) = 1;
      return (char *)TrimSpaces(a1, a2);
    }
    if (!InsertMisc((_QWORD *)a2, v14))
      break;
LABEL_26:
    result = GetToken(a1, v11, v15, v16, v17, v18, v19, v20);
    v14 = (uint64_t)result;
    if (!result)
      goto LABEL_27;
  }
  if (nodeIsText(v14))
  {
    if (*(_QWORD *)(a2 + 24))
      v21 = 1;
    else
      v21 = v12;
    if ((v21 & 1) == 0)
      TrimSpaces(a1, a2);
    if (*(_DWORD *)(v14 + 72) < *(_DWORD *)(v14 + 76))
    {
      v22 = *(_QWORD *)(a2 + 32);
      *(_QWORD *)v14 = a2;
      *(_QWORD *)(v14 + 8) = v22;
      if (v22)
        v23 = (uint64_t *)(v22 + 16);
      else
        v23 = (uint64_t *)(a2 + 24);
      *v23 = v14;
      *(_QWORD *)(a2 + 32) = v14;
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  v24 = *(_QWORD *)(v14 + 56);
  if (v24 && (*(_DWORD *)(v24 + 32) & 0x410) == 0x10)
  {
    ReportError(a1, a2, v14, 8);
LABEL_25:
    FreeNode(a1, v14);
    goto LABEL_26;
  }
  if ((*(_BYTE *)(*(_QWORD *)(a2 + 56) + 33) & 0x80) == 0)
    ReportError(a1, a2, v14, 7);
  UngetToken(a1);
  return (char *)TrimSpaces(a1, a2);
}

uint64_t ParseTitle(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char *Token;
  char *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char **v20;

  Token = GetToken(a1, 1, a3, a4, a5, a6, a7, a8);
  if (!Token)
    return ReportError(a1, a2, 0, 6);
  v11 = Token;
  while (1)
  {
    if (*((_QWORD *)v11 + 7) == *(_QWORD *)(a2 + 56))
    {
      v12 = *((_DWORD *)v11 + 20);
      if (v12 == 5)
      {
        ReportError(a1, a2, (uint64_t)v11, 24);
        *((_DWORD *)v11 + 20) = 6;
        UngetToken(a1);
        goto LABEL_19;
      }
      if (v12 == 6)
      {
        FreeNode(a1, (uint64_t)v11);
        *(_DWORD *)(a2 + 92) = 1;
        return TrimSpaces(a1, a2);
      }
    }
    if (nodeIsText((_BOOL8)v11))
    {
      if (!*(_QWORD *)(a2 + 24))
        TrimInitialSpace(a1, (__int128 *)a2, (uint64_t)v11);
      if (*((_DWORD *)v11 + 18) < *((_DWORD *)v11 + 19))
      {
        v19 = *(_QWORD *)(a2 + 32);
        *(_QWORD *)v11 = a2;
        *((_QWORD *)v11 + 1) = v19;
        if (v19)
          v20 = (char **)(v19 + 16);
        else
          v20 = (char **)(a2 + 24);
        *v20 = v11;
        *(_QWORD *)(a2 + 32) = v11;
        goto LABEL_19;
      }
      goto LABEL_17;
    }
    if (!InsertMisc((_QWORD *)a2, (uint64_t)v11))
      break;
LABEL_19:
    v11 = GetToken(a1, 1, v13, v14, v15, v16, v17, v18);
    if (!v11)
      return ReportError(a1, a2, 0, 6);
  }
  if (!*((_QWORD *)v11 + 7))
  {
    ReportError(a1, a2, (uint64_t)v11, 8);
LABEL_17:
    FreeNode(a1, (uint64_t)v11);
    goto LABEL_19;
  }
  ReportError(a1, a2, (uint64_t)v11, 7);
  UngetToken(a1);
  return TrimSpaces(a1, a2);
}

char *TrimInitialSpace(uint64_t a1, __int128 *a2, uint64_t a3)
{
  _QWORD *v5;
  char *result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;

  v5 = *(_QWORD **)(a1 + 104);
  result = (char *)nodeIsText(a3);
  if ((_DWORD)result)
  {
    v7 = *(unsigned int *)(a3 + 72);
    if (*(_BYTE *)(v5[13] + v7) == 32 && v7 < *(_DWORD *)(a3 + 76))
    {
      if ((*(_DWORD *)(*((_QWORD *)a2 + 7) + 32) & 0x410) == 0x10)
      {
        v8 = *((_QWORD *)a2 + 1);
        result = (char *)nodeIsText(v8);
        if ((_DWORD)result)
        {
          v9 = *(unsigned int *)(v8 + 76);
          v10 = v5[13];
          if (!(_DWORD)v9 || *(_BYTE *)(v10 + (v9 - 1)) != 32)
          {
            *(_DWORD *)(v8 + 76) = v9 + 1;
            *(_BYTE *)(v10 + v9) = 32;
          }
          ++*((_DWORD *)a2 + 18);
        }
        else
        {
          result = NewNode(v5);
          v11 = *((unsigned int *)a2 + 18);
          *((_DWORD *)a2 + 18) = v11 + 1;
          *((_DWORD *)result + 18) = v11;
          *((_DWORD *)result + 19) = *((_DWORD *)a2 + 18);
          *(_BYTE *)(v5[13] + v11) = 32;
          *((_QWORD *)result + 2) = a2;
          v12 = *a2;
          *(_OWORD *)result = *a2;
          *((_QWORD *)a2 + 1) = result;
          v13 = *((_QWORD *)result + 1);
          if (v13)
            *(_QWORD *)(v13 + 16) = result;
          if (*(__int128 **)(v12 + 24) == a2)
            *(_QWORD *)(v12 + 24) = result;
        }
      }
      ++*(_DWORD *)(a3 + 72);
    }
  }
  return result;
}

void ParseScript(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char *Token;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char **v18;
  char *v19;
  _DWORD *v20;
  uint64_t v21;
  uint64_t v22;

  *(_QWORD *)(*(_QWORD *)(a1 + 104) + 88) = a2;
  Token = GetToken(a1, 4, a3, a4, a5, a6, a7, a8);
  *(_QWORD *)(*(_QWORD *)(a1 + 104) + 88) = 0;
  if (!Token)
  {
    v21 = a1;
    v22 = a2;
LABEL_13:
    ReportError(v21, v22, 0, 6);
    return;
  }
  v17 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)Token = a2;
  *((_QWORD *)Token + 1) = v17;
  if (v17)
    v18 = (char **)(v17 + 16);
  else
    v18 = (char **)(a2 + 24);
  *v18 = Token;
  *(_QWORD *)(a2 + 32) = Token;
  v19 = GetToken(a1, 0, v11, v12, v13, v14, v15, v16);
  if (!v19)
  {
    v21 = a1;
    v22 = a2;
    goto LABEL_13;
  }
  if (*((_DWORD *)v19 + 20) == 6 && (v20 = (_DWORD *)*((_QWORD *)v19 + 7)) != 0 && *v20 == **(_DWORD **)(a2 + 56))
  {
    FreeNode(a1, (uint64_t)v19);
  }
  else
  {
    ReportError(a1, a2, (uint64_t)v19, 6);
    UngetToken(a1);
  }
}

uint64_t IsJavaScript(uint64_t a1)
{
  _QWORD *v1;
  int *v2;
  int v3;
  _BYTE *v4;

  v1 = *(_QWORD **)(a1 + 40);
  if (v1)
  {
    while (1)
    {
      v2 = (int *)v1[1];
      if (v2)
      {
        v3 = *v2;
        if (v3 == 142 || v3 == 66)
        {
          v4 = (_BYTE *)v1[6];
          if (v4)
          {
            if (tmbsubstr(v4, "javascript"))
              break;
          }
        }
      }
      v1 = (_QWORD *)*v1;
      if (!v1)
        return 0;
    }
  }
  return 1;
}

void ParseHead(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  char *Token;
  char *v12;
  int v13;
  int v14;
  _DWORD *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned __int8 *v23;
  uint64_t v24;
  int *v25;
  int v26;
  int v27;
  _QWORD *HTML;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  char **v32;

  v10 = a1[13];
  Token = GetToken((uint64_t)a1, 0, a3, a4, a5, a6, a7, a8);
  if (!Token)
    return;
  v12 = Token;
  v13 = 0;
  v14 = 0;
  while (1)
  {
    v15 = (_DWORD *)*((_QWORD *)v12 + 7);
    if (v15 == *(_DWORD **)(a2 + 56))
    {
      v16 = *((_DWORD *)v12 + 20);
      if (v16 == 6)
      {
        FreeNode((uint64_t)a1, (uint64_t)v12);
        *(_DWORD *)(a2 + 92) = 1;
        return;
      }
    }
    else
    {
      if (!v15 || *v15 != 48)
        goto LABEL_10;
      v16 = *((_DWORD *)v12 + 20);
    }
    if (v16 == 5)
      goto LABEL_9;
LABEL_10:
    if (nodeIsText((_BOOL8)v12))
      goto LABEL_45;
    if (*((_DWORD *)v12 + 20) == 3)
    {
      v23 = (unsigned __int8 *)*((_QWORD *)v12 + 8);
      if (v23)
      {
        if (!tmbstrcmp(v23, "xml-stylesheet"))
        {
          ReportError((uint64_t)a1, a2, (uint64_t)v12, 11);
          HTML = FindHTML(a1);
          *((_QWORD *)v12 + 2) = HTML;
          v29 = *(_OWORD *)HTML;
          *(_OWORD *)v12 = *(_OWORD *)HTML;
          HTML[1] = v12;
          v30 = *((_QWORD *)v12 + 1);
          if (v30)
            *(_QWORD *)(v30 + 16) = v12;
          if (*(_QWORD **)(v29 + 24) == HTML)
            *(_QWORD *)(v29 + 24) = v12;
          goto LABEL_30;
        }
      }
    }
    if (!InsertMisc((_QWORD *)a2, (uint64_t)v12))
      break;
LABEL_30:
    v12 = GetToken((uint64_t)a1, 0, v17, v18, v19, v20, v21, v22);
    if (!v12)
      return;
  }
  if (*((_DWORD *)v12 + 20) == 1)
  {
    InsertDocType((uint64_t)a1, (_QWORD *)a2, (uint64_t)v12);
    goto LABEL_30;
  }
  v24 = *((_QWORD *)v12 + 7);
  if (!v24)
    goto LABEL_9;
  if ((*(_BYTE *)(v24 + 32) & 4) != 0)
  {
    if (nodeIsElement((_BOOL8)v12))
    {
      v25 = (int *)*((_QWORD *)v12 + 7);
      if (!v25)
        goto LABEL_36;
      v26 = *v25;
      if (v26 == 9)
      {
        if (v13 < 1)
        {
          ++v13;
          goto LABEL_36;
        }
        v27 = 46;
        ++v13;
      }
      else
      {
        if (v26 != 74)
        {
          if (v26 == 111)
          {
            if (v14 > 0)
            {
              v27 = 46;
              ++v14;
              goto LABEL_35;
            }
            ++v14;
          }
LABEL_36:
          v31 = *(_QWORD *)(a2 + 32);
          *(_QWORD *)v12 = a2;
          *((_QWORD *)v12 + 1) = v31;
          if (v31)
            v32 = (char **)(v31 + 16);
          else
            v32 = (char **)(a2 + 24);
          *v32 = v12;
          *(_QWORD *)(a2 + 32) = v12;
          ParseTag((uint64_t)a1, (uint64_t)v12);
          goto LABEL_30;
        }
        v27 = 11;
      }
LABEL_35:
      ReportError((uint64_t)a1, a2, (uint64_t)v12, v27);
      goto LABEL_36;
    }
LABEL_9:
    ReportError((uint64_t)a1, a2, (uint64_t)v12, 8);
    FreeNode((uint64_t)a1, (uint64_t)v12);
    goto LABEL_30;
  }
  if (!*(_DWORD *)(v10 + 28))
    goto LABEL_46;
LABEL_45:
  ReportError((uint64_t)a1, a2, (uint64_t)v12, 11);
LABEL_46:
  UngetToken((uint64_t)a1);
}

void InsertDocType(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  _DWORD *v6;
  __int128 v7;
  uint64_t v8;

  if (FindDocType(a1))
  {
    ReportError(a1, (uint64_t)a2, a3, 8);
    FreeNode(a1, a3);
  }
  else
  {
    ReportError(a1, (uint64_t)a2, a3, 34);
    if (!a2)
      goto LABEL_6;
    while (1)
    {
      v6 = (_DWORD *)a2[7];
      if (v6)
      {
        if (*v6 == 48)
          break;
      }
      do
LABEL_6:
        a2 = (_QWORD *)*a2;
      while (!a2);
    }
    *(_QWORD *)(a3 + 16) = a2;
    v7 = *(_OWORD *)a2;
    *(_OWORD *)a3 = *(_OWORD *)a2;
    a2[1] = a3;
    v8 = *(_QWORD *)(a3 + 8);
    if (v8)
      *(_QWORD *)(v8 + 16) = a3;
    if (*(_QWORD **)(v7 + 24) == a2)
      *(_QWORD *)(v7 + 24) = a3;
  }
}

void ParseBody(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *Token;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  int v20;
  int *v21;
  int *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _DWORD *v29;
  int v30;
  _DWORD *v31;
  int v32;
  uint64_t v33;
  char **v34;
  uint64_t v35;
  BOOL v36;
  char v37;
  uint64_t v38;
  char **v39;
  int *v40;
  int v41;
  int v42;
  uint64_t v43;
  int v44;
  int *v45;
  int v46;
  uint64_t v47;
  char **v48;
  _DWORD *v49;
  int v50;

  v4 = a1[13];
  BumpObject((uint64_t)a1, *(_QWORD *)a2);
  Token = GetToken((uint64_t)a1, 0, v5, v6, v7, v8, v9, v10);
  if (!Token)
    return;
  v18 = Token;
  v19 = 0;
  v20 = 1;
  while (1)
  {
    v21 = (int *)*((_QWORD *)v18 + 7);
    v22 = *(int **)(a2 + 56);
    if (v21 == v22 && *((_DWORD *)v18 + 20) == 5)
      goto LABEL_9;
    if (v21 && *v21 == 48)
    {
      if (nodeIsElement((_BOOL8)v18) || *(_DWORD *)(v4 + 100))
LABEL_9:
        ReportError((uint64_t)a1, a2, (uint64_t)v18, 8);
      else
        *(_DWORD *)(v4 + 100) = 1;
LABEL_10:
      FreeNode((uint64_t)a1, (uint64_t)v18);
      goto LABEL_96;
    }
    if (*(_DWORD *)(v4 + 96) && (*((_DWORD *)v18 + 20) - 5) <= 2)
    {
      ReportError((uint64_t)a1, a2, (uint64_t)v18, 27);
      v21 = (int *)*((_QWORD *)v18 + 7);
      v22 = *(int **)(a2 + 56);
    }
    if (v21 == v22 && *((_DWORD *)v18 + 20) == 6)
    {
      *(_DWORD *)(a2 + 92) = 1;
      TrimSpaces((_BOOL8)a1, a2);
      FreeNode((uint64_t)a1, (uint64_t)v18);
      *(_DWORD *)(v4 + 96) = 1;
      if (*(_QWORD *)a2)
      {
        v29 = *(_DWORD **)(*(_QWORD *)a2 + 56);
        if (v29)
        {
          if (*v29 == 71)
            return;
        }
      }
LABEL_43:
      v19 = 0;
      goto LABEL_96;
    }
    if (v21)
      break;
LABEL_33:
    v36 = nodeIsText((_BOOL8)v18)
       && (v35 = *((unsigned int *)v18 + 18), *((_DWORD *)v18 + 19) <= (v35 + 1))
       && *(_BYTE *)(*(_QWORD *)(v4 + 104) + v35) == 32;
    if (InsertMisc((_QWORD *)a2, (uint64_t)v18))
      goto LABEL_96;
    if (nodeIsText((_BOOL8)v18))
    {
      v37 = !v36;
      if ((_DWORD)v19)
        v37 = 1;
      if ((v37 & 1) != 0)
      {
        ConstrainVersion((uint64_t)a1, -294);
        if (v20 && (int)InlineDup((uint64_t)a1, (uint64_t)v18) > 0)
        {
          v20 = 0;
        }
        else
        {
          v20 = 0;
          v38 = *(_QWORD *)(a2 + 32);
          *(_QWORD *)v18 = a2;
          *((_QWORD *)v18 + 1) = v38;
          if (v38)
            v39 = (char **)(v38 + 16);
          else
            v39 = (char **)(a2 + 24);
          *v39 = v18;
          *(_QWORD *)(a2 + 32) = v18;
          v19 = 1;
        }
        goto LABEL_96;
      }
      FreeNode((uint64_t)a1, (uint64_t)v18);
      goto LABEL_43;
    }
    if (*((_DWORD *)v18 + 20) == 1)
    {
      InsertDocType((uint64_t)a1, (_QWORD *)a2, (uint64_t)v18);
      goto LABEL_96;
    }
    v40 = (int *)*((_QWORD *)v18 + 7);
    if (!v40)
      goto LABEL_9;
    v41 = *v40;
    if (*v40 == 80)
      goto LABEL_9;
    *(_DWORD *)(v4 + 20) = 0;
    if (v41 != 53)
    {
      if (nodeHasCM((_BOOL8)v18, 8) || nodeHasCM((_BOOL8)v18, 16))
        goto LABEL_77;
      v40 = (int *)*((_QWORD *)v18 + 7);
    }
    v42 = v40[8];
    if ((v42 & 4) == 0)
    {
      ReportError((uint64_t)a1, a2, (uint64_t)v18, 11);
      v40 = (int *)*((_QWORD *)v18 + 7);
      v42 = v40[8];
    }
    if ((v42 & 2) != 0)
    {
      if (*v40 == 16 && *(_DWORD *)(a2 + 96) && !*(_QWORD *)(a2 + 40))
      {
        *(_QWORD *)(a2 + 40) = *((_QWORD *)v18 + 5);
        *((_QWORD *)v18 + 5) = 0;
      }
      goto LABEL_10;
    }
    if ((v42 & 4) != 0)
    {
      MoveToHead(a1, a2, (uint64_t *)v18);
      goto LABEL_96;
    }
    if ((v42 & 0x20) != 0)
    {
      UngetToken((uint64_t)a1);
      v18 = InferredTag((uint64_t)a1, 115);
      AddClassNoIndent((uint64_t)a1, (uint64_t)v18);
    }
    else
    {
      if ((v42 & 0x40) != 0)
      {
        UngetToken((uint64_t)a1);
        v43 = (uint64_t)a1;
        v44 = 31;
      }
      else if ((v42 & 0x380) != 0)
      {
        UngetToken((uint64_t)a1);
        v43 = (uint64_t)a1;
        v44 = 104;
      }
      else
      {
        if (*v40 != 53)
        {
          if (!nodeHasCM((_BOOL8)v18, 1536))
            goto LABEL_112;
          goto LABEL_10;
        }
        UngetToken((uint64_t)a1);
        v43 = (uint64_t)a1;
        v44 = 37;
      }
      v18 = InferredTag(v43, v44);
    }
    *(_DWORD *)(v4 + 20) = 1;
LABEL_77:
    if (*((_DWORD *)v18 + 20) != 6)
      goto LABEL_85;
    v45 = (int *)*((_QWORD *)v18 + 7);
    if (v45)
    {
      v46 = *v45;
      if (v46 == 79)
      {
        *((_DWORD *)v18 + 20) = 7;
        *((_DWORD *)v18 + 24) = 1;
        goto LABEL_85;
      }
      if (v46 == 17)
      {
        *((_DWORD *)v18 + 20) = 5;
        goto LABEL_85;
      }
    }
    if (nodeHasCM((_BOOL8)v18, 16))
      PopInline((uint64_t)a1, (uint64_t)v18);
LABEL_85:
    if (!nodeIsElement((_BOOL8)v18))
      goto LABEL_9;
    if (!nodeHasCM((_BOOL8)v18, 16) || nodeHasCM((_BOOL8)v18, 0x20000))
    {
      v19 = 0;
LABEL_89:
      v20 = 1;
LABEL_90:
      if (*((_DWORD *)v18 + 24))
        ReportError((uint64_t)a1, a2, (uint64_t)v18, 15);
      v47 = *(_QWORD *)(a2 + 32);
      *(_QWORD *)v18 = a2;
      *((_QWORD *)v18 + 1) = v47;
      if (v47)
        v48 = (char **)(v47 + 16);
      else
        v48 = (char **)(a2 + 24);
      *v48 = v18;
      *(_QWORD *)(a2 + 32) = v18;
      ParseTag((uint64_t)a1, (uint64_t)v18);
      goto LABEL_96;
    }
    v49 = (_DWORD *)*((_QWORD *)v18 + 7);
    if (v49 && *v49 == 52)
      v50 = -293;
    else
      v50 = -294;
    ConstrainVersion((uint64_t)a1, v50);
    if (!v20)
    {
LABEL_106:
      v19 = 1;
      goto LABEL_90;
    }
    if (*((_DWORD *)v18 + 24))
    {
      v19 = 1;
      goto LABEL_89;
    }
    v20 = 0;
    if ((int)InlineDup((uint64_t)a1, (uint64_t)v18) <= 0)
      goto LABEL_106;
LABEL_96:
    v18 = GetToken((uint64_t)a1, v19, v23, v24, v25, v26, v27, v28);
    if (!v18)
      return;
  }
  v30 = *v21;
  if ((v30 - 38) >= 2)
  {
    if (v30 != 71)
      goto LABEL_33;
    v32 = *((_DWORD *)v18 + 20);
    if (v32 != 6)
    {
      if (v32 == 5)
      {
        v33 = *(_QWORD *)(a2 + 32);
        *(_QWORD *)v18 = a2;
        *((_QWORD *)v18 + 1) = v33;
        if (v33)
          v34 = (char **)(v33 + 16);
        else
          v34 = (char **)(a2 + 24);
        *v34 = v18;
        *(_QWORD *)(a2 + 32) = v18;
        ParseBlock((uint64_t)a1, (uint64_t)v18, v12, v13, v14, v15, v16, v17);
        goto LABEL_96;
      }
      goto LABEL_33;
    }
  }
  if (!*(_QWORD *)a2)
    goto LABEL_33;
  v31 = *(_DWORD **)(*(_QWORD *)a2 + 56);
  if (!v31 || *v31 != 71)
    goto LABEL_33;
  TrimSpaces((_BOOL8)a1, a2);
LABEL_112:
  UngetToken((uint64_t)a1);
}

void ParseNoFrames(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  char *Token;
  char *v12;
  int *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _DWORD *v21;
  int v22;
  uint64_t v23;
  char **v24;
  _QWORD *Body;
  _QWORD *v26;
  uint64_t v27;
  char **v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  char **v32;
  uint64_t v33;
  char **v34;

  if (!*(_QWORD *)(a1 + 744))
    *(_DWORD *)(a1 + 4900) |= 0x20u;
  v10 = *(_QWORD *)(a1 + 104);
  Token = GetToken(a1, 0, a3, a4, a5, a6, a7, a8);
  if (!Token)
  {
LABEL_48:
    ReportError(a1, a2, 0, 6);
    return;
  }
  v12 = Token;
  while (1)
  {
    v13 = (int *)*((_QWORD *)v12 + 7);
    if (v13 == *(int **)(a2 + 56) && *((_DWORD *)v12 + 20) == 6)
    {
      FreeNode(a1, (uint64_t)v12);
      *(_DWORD *)(a2 + 92) = 1;
      TrimSpaces(a1, a2);
      return;
    }
    if (v13)
    {
      v14 = *v13;
      if (v14 == 48)
      {
        if (nodeIsElement((_BOOL8)v12))
          goto LABEL_25;
        goto LABEL_26;
      }
      if ((v14 - 38) <= 1)
        break;
    }
    if (!InsertMisc((_QWORD *)a2, (uint64_t)v12))
    {
      v21 = (_DWORD *)*((_QWORD *)v12 + 7);
      if (v21 && *v21 == 16 && *((_DWORD *)v12 + 20) == 5)
      {
        v22 = *(_DWORD *)(v10 + 96);
        v23 = *(_QWORD *)(a2 + 32);
        *(_QWORD *)v12 = a2;
        *((_QWORD *)v12 + 1) = v23;
        if (v23)
          v24 = (char **)(v23 + 16);
        else
          v24 = (char **)(a2 + 24);
        *v24 = v12;
        *(_QWORD *)(a2 + 32) = v12;
        ParseTag(a1, (uint64_t)v12);
        if (v22)
        {
          if (FindBody((_QWORD *)a1) != (_QWORD *)v12)
          {
            CoerceNode(a1, (uint64_t)v12, 30, 0, 0);
            Body = FindBody((_QWORD *)a1);
            if (Body)
            {
              v26 = Body;
              RemoveNode((uint64_t *)v12);
              v27 = v26[4];
              *(_QWORD *)v12 = v26;
              *((_QWORD *)v12 + 1) = v27;
              if (v27)
                v28 = (char **)(v27 + 16);
              else
                v28 = (char **)(v26 + 3);
              *v28 = v12;
              v26[4] = v12;
            }
          }
        }
        goto LABEL_36;
      }
      if (nodeIsText((_BOOL8)v12) || *((_QWORD *)v12 + 7) && *((_DWORD *)v12 + 20) != 6)
      {
        v29 = FindBody((_QWORD *)a1);
        if (v29)
        {
          v30 = v29;
          if (nodeIsText((_BOOL8)v12))
          {
            UngetToken(a1);
            v12 = InferredTag(a1, 79);
            ReportError(a1, a2, (uint64_t)v12, 27);
          }
          v31 = v30[4];
          *(_QWORD *)v12 = v30;
          *((_QWORD *)v12 + 1) = v31;
          if (v31)
            v32 = (char **)(v31 + 16);
          else
            v32 = (char **)(v30 + 3);
          *v32 = v12;
          v30[4] = v12;
LABEL_35:
          ParseTag(a1, (uint64_t)v12);
          goto LABEL_36;
        }
        if (!*(_DWORD *)(v10 + 96))
        {
          UngetToken(a1);
          v12 = InferredTag(a1, 16);
          if (*(_DWORD *)(a1 + 288))
            ReportError(a1, a2, (uint64_t)v12, 15);
          v33 = *(_QWORD *)(a2 + 32);
          *(_QWORD *)v12 = a2;
          *((_QWORD *)v12 + 1) = v33;
          if (v33)
            v34 = (char **)(v33 + 16);
          else
            v34 = (char **)(a2 + 24);
          *v34 = v12;
          *(_QWORD *)(a2 + 32) = v12;
          goto LABEL_35;
        }
      }
LABEL_25:
      ReportError(a1, a2, (uint64_t)v12, 8);
LABEL_26:
      FreeNode(a1, (uint64_t)v12);
    }
LABEL_36:
    v12 = GetToken(a1, 0, v15, v16, v17, v18, v19, v20);
    if (!v12)
      goto LABEL_48;
  }
  TrimSpaces(a1, a2);
  if (*((_DWORD *)v12 + 20) == 6)
  {
    ReportError(a1, a2, (uint64_t)v12, 8);
    FreeNode(a1, (uint64_t)v12);
  }
  else
  {
    ReportError(a1, a2, (uint64_t)v12, 7);
    UngetToken(a1);
  }
}

uint64_t ParseFrameSet(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  char *Token;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BOOL4 IsElement;
  uint64_t v20;
  int v21;
  uint64_t v22;
  char **v23;
  uint64_t v24;
  char **v25;

  if (!*(_QWORD *)(a1 + 744))
    *(_DWORD *)(a1 + 4900) |= 0x10u;
  v10 = *(_QWORD *)(a1 + 104);
  Token = GetToken(a1, 0, a3, a4, a5, a6, a7, a8);
  if (!Token)
    return ReportError(a1, a2, 0, 6);
  v12 = Token;
  while (*((_QWORD *)v12 + 7) != *(_QWORD *)(a2 + 56) || *((_DWORD *)v12 + 20) != 6)
  {
    if (!InsertMisc((_QWORD *)a2, (uint64_t)v12))
    {
      if (!*((_QWORD *)v12 + 7))
        goto LABEL_24;
      IsElement = nodeIsElement((_BOOL8)v12);
      v20 = *((_QWORD *)v12 + 7);
      if (!IsElement)
      {
        if (v20)
        {
LABEL_14:
          if (*(_DWORD *)v20 == 16)
          {
            UngetToken(a1);
            v12 = InferredTag(a1, 71);
            ReportError(a1, a2, (uint64_t)v12, 15);
          }
        }
LABEL_16:
        v21 = *((_DWORD *)v12 + 20);
        if (v21 == 7)
        {
          if ((*(_BYTE *)(*((_QWORD *)v12 + 7) + 33) & 0x20) != 0)
          {
            v24 = *(_QWORD *)(a2 + 32);
            *(_QWORD *)v12 = a2;
            *((_QWORD *)v12 + 1) = v24;
            if (v24)
              v25 = (char **)(v24 + 16);
            else
              v25 = (char **)(a2 + 24);
            *v25 = v12;
            *(_QWORD *)(a2 + 32) = v12;
            goto LABEL_25;
          }
        }
        else if (v21 == 5 && (*(_BYTE *)(*((_QWORD *)v12 + 7) + 33) & 0x20) != 0)
        {
          v22 = *(_QWORD *)(a2 + 32);
          *(_QWORD *)v12 = a2;
          *((_QWORD *)v12 + 1) = v22;
          if (v22)
            v23 = (char **)(v22 + 16);
          else
            v23 = (char **)(a2 + 24);
          *v23 = v12;
          *(_QWORD *)(a2 + 32) = v12;
          *(_DWORD *)(v10 + 20) = 0;
          ParseTag(a1, (uint64_t)v12);
          goto LABEL_25;
        }
LABEL_24:
        ReportError(a1, a2, (uint64_t)v12, 8);
        FreeNode(a1, (uint64_t)v12);
        goto LABEL_25;
      }
      if (!v20)
        goto LABEL_16;
      if ((*(_BYTE *)(v20 + 32) & 4) == 0)
        goto LABEL_14;
      MoveToHead((_QWORD *)a1, a2, (uint64_t *)v12);
    }
LABEL_25:
    v12 = GetToken(a1, 0, v13, v14, v15, v16, v17, v18);
    if (!v12)
      return ReportError(a1, a2, 0, 6);
  }
  FreeNode(a1, (uint64_t)v12);
  *(_DWORD *)(a2 + 92) = 1;
  return TrimSpaces(a1, a2);
}

void ParseHTML(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *Token;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  _DWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char **v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int *v43;
  int v44;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  char **v49;
  uint64_t i;
  _DWORD *v51;
  char *v52;
  uint64_t v53;
  char **v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  char **v59;
  uint64_t v60;
  char **v61;
  char *v62;
  uint64_t v63;
  char **v64;
  uint64_t v65;
  char **v66;
  char v67;

  SetOptionBool((uint64_t)a1, 0x15u, 0);
  Token = GetToken((uint64_t)a1, 0, v4, v5, v6, v7, v8, v9);
  if (Token)
  {
    v17 = Token;
    while (1)
    {
      v18 = (_DWORD *)*((_QWORD *)v17 + 7);
      if (v18)
      {
        if (*v18 == 46)
          break;
      }
      if (v18 == (_DWORD *)a2[7] && (*((_DWORD *)v17 + 20) - 5) <= 1)
      {
        ReportError((uint64_t)a1, (uint64_t)a2, (uint64_t)v17, 8);
        FreeNode((uint64_t)a1, (uint64_t)v17);
      }
      else if (!InsertMisc(a2, (uint64_t)v17))
      {
        UngetToken((uint64_t)a1);
        goto LABEL_12;
      }
      v17 = GetToken((uint64_t)a1, 0, v19, v20, v21, v22, v23, v24);
      if (!v17)
        goto LABEL_12;
    }
  }
  else
  {
LABEL_12:
    v17 = InferredTag((uint64_t)a1, 46);
  }
  v25 = a2[4];
  *(_QWORD *)v17 = a2;
  *((_QWORD *)v17 + 1) = v25;
  if (v25)
    v26 = (char **)(v25 + 16);
  else
    v26 = (char **)(a2 + 3);
  *v26 = v17;
  a2[4] = v17;
  ParseHead(a1, (uint64_t)v17, v11, v12, v13, v14, v15, v16);
  v33 = GetToken((uint64_t)a1, 0, v27, v28, v29, v30, v31, v32);
  if (v33)
  {
    v34 = v33;
    v35 = 0;
    v36 = 0;
    while (*((_QWORD *)v34 + 7) != a2[7])
    {
      if (!InsertMisc(a2, (uint64_t)v34))
      {
        v43 = (int *)*((_QWORD *)v34 + 7);
        if (!v43)
          goto LABEL_37;
        v44 = *v43;
        switch(v44)
        {
          case 71:
            if (*((_DWORD *)v34 + 20) == 5)
            {
              if (!v36)
              {
                ReportError((uint64_t)a1, (uint64_t)a2, (uint64_t)v34, 8);
                FreeNode((uint64_t)a1, (uint64_t)v34);
                v34 = InferredTag((uint64_t)a1, 16);
                goto LABEL_90;
              }
              if (v35)
              {
                FreeNode((uint64_t)a1, (uint64_t)v34);
                v34 = v35;
              }
              else
              {
                v60 = *((_QWORD *)v36 + 4);
                *(_QWORD *)v34 = v36;
                *((_QWORD *)v34 + 1) = v60;
                if (v60)
                  v61 = (char **)(v60 + 16);
                else
                  v61 = (char **)(v36 + 24);
                *v61 = v34;
                *((_QWORD *)v36 + 4) = v34;
                v35 = v34;
              }
              v55 = (uint64_t)a1;
              v56 = (uint64_t)v34;
              goto LABEL_69;
            }
            break;
          case 39:
            if (*((_DWORD *)v34 + 20) == 5)
            {
              v47 = v34;
              if (v36)
              {
                ReportFatal((uint64_t)a1, (uint64_t)a2, (uint64_t)v34, 18, v39, v40, v41, v42, v67);
                v47 = v36;
              }
              v48 = a2[4];
              *(_QWORD *)v34 = a2;
              *((_QWORD *)v34 + 1) = v48;
              if (v48)
                v49 = (char **)(v48 + 16);
              else
                v49 = (char **)(a2 + 3);
              *v49 = v34;
              a2[4] = v34;
              ParseTag((uint64_t)a1, (uint64_t)v34);
              for (i = *((_QWORD *)v47 + 3); i; i = *(_QWORD *)(i + 16))
              {
                v51 = *(_DWORD **)(i + 56);
                if (v51 && *v51 == 71)
                  v35 = (char *)i;
              }
              v36 = v47;
              goto LABEL_70;
            }
            break;
          case 16:
            if (*((_DWORD *)v34 + 20) == 5)
            {
              if (a1[93] || !v36)
                goto LABEL_89;
              UngetToken((uint64_t)a1);
              if (v35)
              {
                if (*((_DWORD *)v35 + 20) == 7)
                  *((_DWORD *)v35 + 20) = 5;
              }
              else
              {
                v57 = InferredTag((uint64_t)a1, 71);
                v35 = v57;
                v58 = *((_QWORD *)v36 + 4);
                *(_QWORD *)v57 = v36;
                *((_QWORD *)v57 + 1) = v58;
                if (v58)
                  v59 = (char **)(v58 + 16);
                else
                  v59 = (char **)(v36 + 24);
                *v59 = v57;
                *((_QWORD *)v36 + 4) = v57;
                ReportError((uint64_t)a1, (uint64_t)a2, (uint64_t)v57, 15);
              }
              goto LABEL_68;
            }
            break;
          default:
LABEL_37:
            if (!nodeIsElement((_BOOL8)v34) || (v46 = *((_QWORD *)v34 + 7)) == 0)
            {
              UngetToken((uint64_t)a1);
              if (!v36)
                goto LABEL_88;
LABEL_44:
              if (v35)
              {
                ReportError((uint64_t)a1, (uint64_t)a2, (uint64_t)v34, 26);
                if (*((_DWORD *)v35 + 20) == 7)
                  *((_DWORD *)v35 + 20) = 5;
              }
              else
              {
                v52 = InferredTag((uint64_t)a1, 71);
                v35 = v52;
                v53 = *((_QWORD *)v36 + 4);
                *(_QWORD *)v52 = v36;
                *((_QWORD *)v52 + 1) = v53;
                if (v53)
                  v54 = (char **)(v53 + 16);
                else
                  v54 = (char **)(v36 + 24);
                *v54 = v52;
                *((_QWORD *)v36 + 4) = v52;
              }
              ConstrainVersion((uint64_t)a1, 1168);
LABEL_68:
              v55 = (uint64_t)a1;
              v56 = (uint64_t)v35;
LABEL_69:
              ParseTag(v55, v56);
              goto LABEL_70;
            }
            if ((*(_BYTE *)(v46 + 32) & 4) != 0)
            {
              MoveToHead(a1, (uint64_t)a2, (uint64_t *)v34);
              goto LABEL_70;
            }
            if (!v36)
            {
              UngetToken((uint64_t)a1);
LABEL_88:
              v34 = InferredTag((uint64_t)a1, 16);
LABEL_89:
              ConstrainVersion((uint64_t)a1, -1169);
LABEL_90:
              v65 = a2[4];
              *(_QWORD *)v34 = a2;
              *((_QWORD *)v34 + 1) = v65;
              if (v65)
                v66 = (char **)(v65 + 16);
              else
                v66 = (char **)(a2 + 3);
              *v66 = v34;
              a2[4] = v34;
              ParseTag((uint64_t)a1, (uint64_t)v34);
              return;
            }
            if (*(_DWORD *)v46 != 38)
            {
              UngetToken((uint64_t)a1);
              goto LABEL_44;
            }
            break;
        }
LABEL_35:
        ReportError((uint64_t)a1, (uint64_t)a2, (uint64_t)v34, 8);
LABEL_36:
        FreeNode((uint64_t)a1, (uint64_t)v34);
      }
LABEL_70:
      v34 = GetToken((uint64_t)a1, 0, v37, v38, v39, v40, v41, v42);
      if (!v34)
      {
        if (v36)
          return;
        goto LABEL_83;
      }
    }
    if (*((_DWORD *)v34 + 20) != 5 && v36 == 0)
      goto LABEL_35;
    goto LABEL_36;
  }
LABEL_83:
  v62 = InferredTag((uint64_t)a1, 16);
  v63 = a2[4];
  *(_QWORD *)v62 = a2;
  *((_QWORD *)v62 + 1) = v63;
  if (v63)
    v64 = (char **)(v63 + 16);
  else
    v64 = (char **)(a2 + 3);
  *v64 = v62;
  a2[4] = v62;
  ParseBody(a1, (uint64_t)v62);
}

void ParseDocument(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char *Token;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  char **v20;
  _DWORD *v21;
  _QWORD *v22;
  char *v23;
  uint64_t v24;
  _DWORD *v25;
  uint64_t v26;
  char **v27;
  char *v28;
  uint64_t v29;
  char **v30;
  _QWORD *HEAD;
  char *v32;
  uint64_t v33;
  char **v34;
  _QWORD *Body;
  uint64_t *v36;
  char *v37;
  uint64_t v38;
  __int128 v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t **v43;

  Token = GetToken(a1, 0, a3, a4, a5, a6, a7, a8);
  if (!Token)
    goto LABEL_38;
  v10 = Token;
  v11 = 0;
  while (1)
  {
    if (*((_DWORD *)v10 + 20) == 13)
    {
      if (FindXmlDecl(a1) && *(_QWORD *)(a1 + 24))
        goto LABEL_11;
      if (*((_DWORD *)v10 + 21) != 1 || *((_DWORD *)v10 + 22) != 1)
        ReportError(a1, a1, (uint64_t)v10, 45);
    }
    if (!InsertMisc((_QWORD *)a1, (uint64_t)v10))
      break;
LABEL_12:
    v10 = GetToken(a1, 0, v12, v13, v14, v15, v16, v17);
    if (!v10)
      goto LABEL_38;
  }
  v18 = *((_DWORD *)v10 + 20);
  if (v18 == 6)
  {
LABEL_11:
    ReportError(a1, a1, (uint64_t)v10, 8);
    FreeNode(a1, (uint64_t)v10);
    goto LABEL_12;
  }
  if (v18 != 5)
  {
    if (v18 != 1)
      goto LABEL_31;
    if (!v11)
    {
      v19 = *(_QWORD *)(a1 + 32);
      *(_QWORD *)v10 = a1;
      *((_QWORD *)v10 + 1) = v19;
      if (v19)
        v20 = (char **)(v19 + 16);
      else
        v20 = (char **)(a1 + 24);
      *v20 = v10;
      *(_QWORD *)(a1 + 32) = v10;
      v11 = v10;
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  v21 = (_DWORD *)*((_QWORD *)v10 + 7);
  if (!v21)
    goto LABEL_31;
  if (*v21 == 48)
  {
    v22 = AttrGetById((uint64_t)v10, 154);
    if (v22)
    {
      v23 = (char *)v22[6];
      if (v23)
      {
        if (!tmbstrcasecmp(v23, "http://www.w3.org/1999/xhtml"))
        {
          v24 = *(unsigned int *)(a1 + 304);
          *(_DWORD *)(*(_QWORD *)(a1 + 104) + 28) = 1;
          SetOptionBool(a1, 0x17u, v24 == 0);
          SetOptionBool(a1, 0x16u, v24 == 0);
          if (!v24)
          {
            SetOptionBool(a1, 0x1Au, 0);
            SetOptionBool(a1, 0x1Bu, 0);
          }
        }
      }
    }
  }
  if (*((_DWORD *)v10 + 20) != 5 || (v25 = (_DWORD *)*((_QWORD *)v10 + 7)) == 0 || *v25 != 48)
  {
LABEL_31:
    UngetToken(a1);
    v10 = InferredTag(a1, 48);
  }
  if (!FindDocType(a1))
    ReportError(a1, 0, 0, 44);
  v26 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)v10 = a1;
  *((_QWORD *)v10 + 1) = v26;
  if (v26)
    v27 = (char **)(v26 + 16);
  else
    v27 = (char **)(a1 + 24);
  *v27 = v10;
  *(_QWORD *)(a1 + 32) = v10;
  ParseHTML((_QWORD *)a1, v10);
LABEL_38:
  if (*(_QWORD *)(a1 + 744))
    AccessibilityChecks(a1);
  if (!FindHTML((_QWORD *)a1))
  {
    v28 = InferredTag(a1, 48);
    v29 = *(_QWORD *)(a1 + 32);
    *(_QWORD *)v28 = a1;
    *((_QWORD *)v28 + 1) = v29;
    if (v29)
      v30 = (char **)(v29 + 16);
    else
      v30 = (char **)(a1 + 24);
    *v30 = v28;
    *(_QWORD *)(a1 + 32) = v28;
    ParseHTML((_QWORD *)a1, v28);
  }
  if (!FindTITLE((_QWORD *)a1))
  {
    HEAD = FindHEAD((_QWORD *)a1);
    ReportError(a1, (uint64_t)HEAD, 0, 17);
    v32 = InferredTag(a1, 111);
    v33 = HEAD[4];
    *(_QWORD *)v32 = HEAD;
    *((_QWORD *)v32 + 1) = v33;
    if (v33)
      v34 = (char **)(v33 + 16);
    else
      v34 = (char **)(HEAD + 3);
    *v34 = v32;
    HEAD[4] = v32;
  }
  if (*(_DWORD *)(a1 + 816))
    SanitizeNodesAgainstXSS(a1, a1);
  AttributeChecks(a1, (_QWORD *)a1);
  ReplaceObsoleteElements((_BYTE *)a1, (_QWORD *)a1);
  DropEmptyElements(a1, a1);
  CleanSpaces(a1, (unsigned int *)a1);
  if (*(_DWORD *)(a1 + 520))
  {
    Body = FindBody((_QWORD *)a1);
    if (Body)
    {
      v36 = (uint64_t *)Body[3];
      while (v36)
      {
        while ((!nodeIsText((_BOOL8)v36) || IsBlank(*(_QWORD *)(a1 + 104), (uint64_t)v36))
             && (!nodeIsElement((_BOOL8)v36) || !nodeCMIsOnlyInline((_BOOL8)v36)))
        {
          v36 = (uint64_t *)v36[2];
          if (!v36)
            goto LABEL_72;
        }
        v37 = InferredTag(a1, 79);
        v38 = (uint64_t)v37;
        *((_QWORD *)v37 + 2) = v36;
        v39 = *(_OWORD *)v36;
        *(_OWORD *)v37 = *(_OWORD *)v36;
        v36[1] = (uint64_t)v37;
        v40 = *((_QWORD *)v37 + 1);
        if (v40)
          *(_QWORD *)(v40 + 16) = v37;
        if (*(uint64_t **)(v39 + 24) == v36)
          *(_QWORD *)(v39 + 24) = v37;
        do
        {
          if (nodeIsElement((_BOOL8)v36) && !nodeCMIsOnlyInline((_BOOL8)v36))
            break;
          v41 = (uint64_t *)v36[2];
          RemoveNode(v36);
          v42 = *(_QWORD *)(v38 + 32);
          *v36 = v38;
          v36[1] = v42;
          v43 = (uint64_t **)(v42 ? v42 + 16 : v38 + 24);
          *v43 = v36;
          *(_QWORD *)(v38 + 32) = v36;
          v36 = v41;
        }
        while (v41);
        TrimSpaces(a1, v38);
      }
    }
  }
LABEL_72:
  if (*(_DWORD *)(a1 + 528))
    EncloseBlockText(a1, (_QWORD *)a1);
}

void SanitizeNodesAgainstXSS(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  int *v7;
  int v8;
  BOOL v9;
  unsigned int v10;
  BOOL v11;
  int v12;
  BOOL v13;

  if (a2)
  {
    v2 = a2;
    v4 = *(unsigned int *)(a1 + 280);
    do
    {
      v5 = v2;
      v2 = *(_QWORD *)(v2 + 16);
      if (v4)
      {
        v6 = *(char **)(v5 + 64);
        if (!v6
          || tmbstrcasecmp(v6, "frameset")
          && tmbstrcasecmp(*(char **)(v5 + 64), "script")
          && tmbstrcasecmp(*(char **)(v5 + 64), "iframe")
          && tmbstrcasecmp(*(char **)(v5 + 64), "object")
          && tmbstrcasecmp(*(char **)(v5 + 64), "frame")
          && tmbstrcasecmp(*(char **)(v5 + 64), "embed")
          && tmbstrcasecmp(*(char **)(v5 + 64), "style")
          && tmbstrcasecmp(*(char **)(v5 + 64), "link")
          && tmbstrcasecmp(*(char **)(v5 + 64), "meta")
          && tmbstrcasecmp(*(char **)(v5 + 64), "applet"))
        {
          goto LABEL_27;
        }
      }
      else
      {
        v7 = *(int **)(v5 + 56);
        if (!v7
          || ((v8 = *v7, (v8 - 6) <= 0x3D)
            ? (v9 = ((1 << (v8 - 6)) & 0x2100100310000001) == 0)
            : (v9 = 1),
              v9
           && ((v10 = v8 - 75, v11 = v10 > 0x1A, v12 = (1 << v10) & 0x4020001, !v11) ? (v13 = v12 == 0) : (v13 = 1), v13)))
        {
LABEL_27:
          if (*(_QWORD *)(v5 + 24))
            SanitizeNodesAgainstXSS(a1);
          continue;
        }
      }
      RemoveNode((uint64_t *)v5);
      FreeNode(a1, v5);
    }
    while (v2);
  }
}

uint64_t AttributeChecks(uint64_t result, _QWORD *a2)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v5)(uint64_t, _QWORD *);

  if (a2)
  {
    v2 = a2;
    v3 = result;
    do
    {
      v4 = (_QWORD *)v2[2];
      result = nodeIsElement((_BOOL8)v2);
      if ((_DWORD)result)
      {
        v5 = *(uint64_t (**)(uint64_t, _QWORD *))(v2[7] + 48);
        if (v5)
          result = v5(v3, v2);
        else
          result = CheckAttributes(v3, (uint64_t)v2);
      }
      if (v2[3])
        result = AttributeChecks(v3);
      v2 = v4;
    }
    while (v4);
  }
  return result;
}

_BYTE *ReplaceObsoleteElements(_BYTE *result, _QWORD *a2)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  int *v5;
  int v6;
  int *v8;
  unsigned int v9;
  BOOL v10;
  uint64_t v11;

  if (a2)
  {
    v2 = a2;
    v3 = (uint64_t)result;
    while (1)
    {
      v4 = (_QWORD *)v2[2];
      v5 = (int *)v2[7];
      if (v5)
      {
        v6 = *v5;
        if (v6 != 66 && v6 != 29)
          goto LABEL_11;
        result = CoerceNode(v3, (uint64_t)v2, 115, 1, 1);
        v8 = (int *)v2[7];
        if (v8)
          break;
      }
LABEL_16:
      if (v2[3])
        result = (_BYTE *)ReplaceObsoleteElements(v3);
      v2 = v4;
      if (!v4)
        return result;
    }
    v6 = *v8;
LABEL_11:
    v9 = v6 - 63;
    v10 = v9 > 0x37;
    v11 = (1 << v9) & 0x80000000040001;
    if (!v10 && v11 != 0)
      result = CoerceNode(v3, (uint64_t)v2, 82, 1, 1);
    goto LABEL_16;
  }
  return result;
}

void CleanSpaces(uint64_t a1, unsigned int *a2)
{
  unsigned int *v2;
  unsigned int *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _DWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _DWORD *v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int i;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;

  if (a2)
  {
    v2 = a2;
    while (1)
    {
      v4 = v2;
      v2 = (unsigned int *)*((_QWORD *)v2 + 2);
      if (nodeIsText((_BOOL8)v4) && nodeIsText((_BOOL8)v4))
      {
        v5 = *(_QWORD *)v4;
        if (*(_DWORD *)(*(_QWORD *)v4 + 80) != 1)
          break;
      }
LABEL_6:
      if (nodeIsText((_BOOL8)v4) && nodeIsText((_BOOL8)v4))
      {
        v6 = *(_QWORD *)v4;
        if (*(_DWORD *)(*(_QWORD *)v4 + 80) != 1)
        {
          v12 = *(_QWORD **)v4;
          do
          {
            v13 = v12[7];
            if (v13 && *(uint64_t (**)(uint64_t, uint64_t))(v13 + 40) == ParsePre)
              goto LABEL_9;
            v12 = (_QWORD *)*v12;
          }
          while (v12);
          v14 = *(_QWORD *)(v6 + 56);
          if (v14
            && *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 40) == ParseScript)
          {
            goto LABEL_9;
          }
          v15 = *((_QWORD *)v4 + 2);
          if (!v15)
          {
            if (nodeHasCM(v6, 16))
            {
              v18 = *(_QWORD *)(*(_QWORD *)v4 + 16);
              if (!v18 || nodeHasCM(v18, 16))
                goto LABEL_9;
            }
LABEL_52:
            v20 = v4[18];
            for (i = v4[19];
                  i > v20 && IsWhite(*(char *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 104) + i - 1));
                  v4[19] = i)
            {
              v20 = v4[18];
              i = v4[19] - 1;
            }
            goto LABEL_9;
          }
          v16 = *(_DWORD **)(v15 + 56);
          if (v16 && *v16 == 17)
            goto LABEL_52;
          if (!nodeHasCM(*((_QWORD *)v4 + 2), 16))
          {
            if ((*(_DWORD *)(v15 + 80) | 2) == 7)
              goto LABEL_52;
            if (nodeIsText(v15))
            {
              v17 = *(unsigned int *)(v15 + 72);
              if (v17 < *(_DWORD *)(v15 + 76))
              {
                if (IsWhite(*(char *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 104) + v17)))
                  goto LABEL_52;
              }
            }
          }
        }
      }
LABEL_9:
      if (nodeIsText((_BOOL8)v4) && v4[18] >= v4[19])
      {
        RemoveNode((uint64_t *)v4);
        FreeNode(a1, (uint64_t)v4);
        if (!v2)
          return;
      }
      else
      {
        if (*((_QWORD *)v4 + 3))
          CleanSpaces(a1);
        if (!v2)
          return;
      }
    }
    v7 = *(_QWORD **)v4;
    do
    {
      v8 = v7[7];
      if (v8 && *(uint64_t (**)(uint64_t, uint64_t))(v8 + 40) == ParsePre)
        goto LABEL_6;
      v7 = (_QWORD *)*v7;
    }
    while (v7);
    v9 = *(_QWORD *)(v5 + 56);
    if (v9
      && *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 40) == ParseScript)
    {
      goto LABEL_6;
    }
    v10 = *((_QWORD *)v4 + 1);
    if (v10)
    {
      v11 = *(_DWORD **)(v10 + 56);
      if (v11 && *v11 == 17)
      {
LABEL_57:
        v21 = v4[18];
        v22 = v4[19];
        while (v21 < v22 && IsWhite(*(char *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 104) + v21)))
        {
          v22 = v4[19];
          v21 = v4[18] + 1;
          v4[18] = v21;
        }
        goto LABEL_6;
      }
    }
    else
    {
      if (!nodeHasCM(v5, 16))
        goto LABEL_57;
      v10 = *((_QWORD *)v4 + 1);
      if (!v10)
        goto LABEL_46;
    }
    if (!nodeHasCM(v10, 16) && nodeIsElement(*((_QWORD *)v4 + 1)))
      goto LABEL_57;
    if (*((_QWORD *)v4 + 1))
      goto LABEL_6;
LABEL_46:
    if (*(_QWORD *)(*(_QWORD *)v4 + 8) || nodeHasCM(**(_QWORD **)v4, 16))
      goto LABEL_6;
    goto LABEL_57;
  }
}

uint64_t EncloseBlockText(uint64_t result, _QWORD *a2)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  _DWORD *v5;
  unsigned int v6;
  BOOL v7;
  uint64_t v8;
  uint64_t *v10;
  char *v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t **v17;

  if (a2)
  {
    v2 = a2;
    v3 = result;
    do
    {
      v4 = v2;
      while (1)
      {
        v2 = (_QWORD *)v4[2];
        if (v4[3])
          result = EncloseBlockText(v3);
        v5 = (_DWORD *)v4[7];
        if (!v5)
          break;
        v6 = *v5 - 15;
        v7 = v6 > 0x3B;
        v8 = (1 << v6) & 0x800000000400001;
        if (v7 || v8 == 0)
          break;
        v10 = (uint64_t *)v4[3];
        if (!v10)
          break;
        if (!nodeIsText(v4[3]) || IsBlank(*(_QWORD *)(v3 + 104), (uint64_t)v10))
        {
          result = nodeIsElement((_BOOL8)v10);
          if (!(_DWORD)result)
            break;
          result = nodeCMIsOnlyInline((_BOOL8)v10);
          if (!(_DWORD)result)
            break;
        }
        v11 = InferredTag(v3, 79);
        v12 = (uint64_t)v11;
        *((_QWORD *)v11 + 2) = v10;
        v13 = *(_OWORD *)v10;
        *(_OWORD *)v11 = *(_OWORD *)v10;
        v10[1] = (uint64_t)v11;
        v14 = *((_QWORD *)v11 + 1);
        if (v14)
          *(_QWORD *)(v14 + 16) = v11;
        if (*(uint64_t **)(v13 + 24) == v10)
          *(_QWORD *)(v13 + 24) = v11;
        do
        {
          if (nodeIsElement((_BOOL8)v10) && !nodeCMIsOnlyInline((_BOOL8)v10))
            break;
          v15 = (uint64_t *)v10[2];
          RemoveNode(v10);
          v16 = *(_QWORD *)(v12 + 32);
          *v10 = v12;
          v10[1] = v16;
          v17 = (uint64_t **)(v16 ? v16 + 16 : v12 + 24);
          *v17 = v10;
          *(_QWORD *)(v12 + 32) = v10;
          v10 = v15;
        }
        while (v15);
        result = TrimSpaces(v3, v12);
      }
    }
    while (v2);
  }
  return result;
}

uint64_t XMLPreserveWhiteSpace(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  _DWORD *v4;
  uint64_t v5;
  unsigned int *v6;
  unsigned int v7;
  BOOL v8;
  int v9;
  BOOL v10;
  char *v11;

  v3 = *(_QWORD **)(a2 + 40);
  if (v3)
  {
    while (1)
    {
      v4 = (_DWORD *)v3[1];
      if (v4)
      {
        if (*v4 == 153)
          break;
      }
      v3 = (_QWORD *)*v3;
      if (!v3)
        goto LABEL_5;
    }
    v11 = (char *)v3[6];
    return v11 && !tmbstrcasecmp(v11, "preserve");
  }
LABEL_5:
  v5 = *(_QWORD *)(a2 + 64);
  if (v5)
  {
    v6 = *(unsigned int **)(a2 + 56);
    if (!v6
      || ((v7 = *v6, v5 = 1, v7 -= 82, v8 = v7 > 0x13, v9 = (1 << v7) & 0x80401, !v8) ? (v10 = v9 == 0) : (v10 = 1),
          v10))
    {
      if (FindParser(a1, a2) == (int *)ParsePre)
        return 1;
      return tmbstrcasecmp(*(char **)(a2 + 64), "xsl:text") == 0;
    }
  }
  return v5;
}

uint64_t ParseXMLDocument(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;

  SetOptionBool(a1, 0x15u, 1u);
  result = (uint64_t)GetToken(a1, 0, v2, v3, v4, v5, v6, v7);
  if (result)
  {
    v9 = result;
    v10 = 0;
    do
    {
      v11 = a1;
      if (*(_DWORD *)(v9 + 80) == 6)
      {
        v12 = 0;
        v13 = v9;
        v14 = 13;
      }
      else
      {
        if (InsertMisc((_QWORD *)a1, v9))
          goto LABEL_7;
        v21 = *(_DWORD *)(v9 + 80);
        if (v21 == 5)
        {
          v22 = *(_QWORD *)(a1 + 32);
          *(_QWORD *)v9 = a1;
          *(_QWORD *)(v9 + 8) = v22;
          if (v22)
            v23 = (uint64_t *)(v22 + 16);
          else
            v23 = (uint64_t *)(a1 + 24);
          *v23 = v9;
          *(_QWORD *)(a1 + 32) = v9;
          ParseXMLElement(a1, v9, 0);
          goto LABEL_7;
        }
        if (v21 == 7)
        {
          v24 = *(_QWORD *)(a1 + 32);
          *(_QWORD *)v9 = a1;
          *(_QWORD *)(v9 + 8) = v24;
          if (v24)
            v25 = (uint64_t *)(v24 + 16);
          else
            v25 = (uint64_t *)(a1 + 24);
          *v25 = v9;
          *(_QWORD *)(a1 + 32) = v9;
          goto LABEL_7;
        }
        if (v21 == 1 && !v10)
        {
          v26 = *(_QWORD *)(a1 + 32);
          *(_QWORD *)v9 = a1;
          *(_QWORD *)(v9 + 8) = v26;
          if (v26)
            v27 = (uint64_t *)(v26 + 16);
          else
            v27 = (uint64_t *)(a1 + 24);
          *v27 = v9;
          *(_QWORD *)(a1 + 32) = v9;
          v10 = v9;
          goto LABEL_7;
        }
        v11 = a1;
        v12 = a1;
        v13 = v9;
        v14 = 8;
      }
      ReportError(v11, v12, v13, v14);
      FreeNode(a1, v9);
LABEL_7:
      result = (uint64_t)GetToken(a1, 0, v15, v16, v17, v18, v19, v20);
      v9 = result;
    }
    while (result);
  }
  if (*(_DWORD *)(a1 + 312))
    result = FixXmlDecl((_QWORD *)a1);
  if (*(_DWORD *)(a1 + 816))
  {
    SanitizeNodesAgainstXSS(a1, a1);
    return AttributeChecks(a1, (_QWORD *)a1);
  }
  return result;
}

uint64_t ParseXMLElement(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *Token;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  int v21;
  unsigned __int8 *v22;
  unsigned __int8 *v23;
  uint64_t v24;
  char **v25;
  uint64_t v26;
  _BOOL4 IsText;
  uint64_t v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t result;
  unsigned int v32;
  char v33;

  LODWORD(v3) = a3;
  v6 = *(_QWORD *)(a1 + 104);
  if (XMLPreserveWhiteSpace(a1, a2))
    v3 = 2;
  else
    v3 = v3;
  Token = GetToken(a1, v3, v7, v8, v9, v10, v11, v12);
  if (Token)
  {
    v20 = Token;
    do
    {
      v21 = *((_DWORD *)v20 + 20);
      if (v21 == 6)
      {
        v22 = (unsigned __int8 *)*((_QWORD *)v20 + 8);
        if (!v22)
          goto LABEL_13;
        v23 = *(unsigned __int8 **)(a2 + 64);
        if (!v23)
          goto LABEL_13;
        if (!tmbstrcmp(v22, v23))
        {
          FreeNode(a1, (uint64_t)v20);
          *(_DWORD *)(a2 + 92) = 1;
          break;
        }
        v21 = *((_DWORD *)v20 + 20);
      }
      if (v21 == 5)
      {
        ParseXMLElement(a1, v20, v3);
LABEL_15:
        v24 = *(_QWORD *)(a2 + 32);
        *(_QWORD *)v20 = a2;
        *((_QWORD *)v20 + 1) = v24;
        if (v24)
          v25 = (char **)(v24 + 16);
        else
          v25 = (char **)(a2 + 24);
        *v25 = v20;
        *(_QWORD *)(a2 + 32) = v20;
        goto LABEL_19;
      }
      if (v21 != 6)
        goto LABEL_15;
LABEL_13:
      ReportFatal(a1, a2, (uint64_t)v20, 47, v16, v17, v18, v19, v33);
      FreeNode(a1, (uint64_t)v20);
LABEL_19:
      v20 = GetToken(a1, v3, v14, v15, v16, v17, v18, v19);
    }
    while (v20);
  }
  v26 = *(_QWORD *)(a2 + 24);
  IsText = nodeIsText(v26);
  if ((_DWORD)v3 != 2 && IsText)
  {
    v28 = *(unsigned int *)(v26 + 72);
    if (*(_BYTE *)(*(_QWORD *)(v6 + 104) + v28) == 32)
    {
      v29 = v28 + 1;
      *(_DWORD *)(v26 + 72) = v29;
      if (v29 >= *(_DWORD *)(v26 + 76))
        DiscardElement(a1, (uint64_t *)v26);
    }
  }
  v30 = *(_QWORD *)(a2 + 32);
  result = nodeIsText(v30);
  if ((_DWORD)v3 != 2 && (_DWORD)result)
  {
    v32 = *(_DWORD *)(v30 + 76);
    if (!v32)
      return DiscardElement(a1, (uint64_t *)v30);
    if (*(_BYTE *)(*(_QWORD *)(v6 + 104) + v32 - 1) == 32)
      *(_DWORD *)(v30 + 76) = --v32;
    if (*(_DWORD *)(v30 + 72) >= v32)
      return DiscardElement(a1, (uint64_t *)v30);
  }
  return result;
}

BOOL nodeCMIsOnlyInline(_BOOL8 a1)
{
  _BOOL8 result;

  result = nodeHasCM(a1, 16);
  if (result)
    return !nodeHasCM(a1, 8);
  return result;
}

void InitPrintBuf(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 + 4776;
  ClearMemory((void *)(a1 + 4776), 0x38uLL);
  *(_QWORD *)(v1 + 44) = -1;
  *(_QWORD *)(v1 + 36) = -1;
  *(_QWORD *)(v1 + 28) = -1;
}

void FreePrintBuf(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 + 4776;
  MemFree(*(void **)(a1 + 4776));
  ClearMemory((void *)v1, 0x38uLL);
  *(_QWORD *)(v1 + 44) = -1;
  *(_QWORD *)(v1 + 36) = -1;
  *(_QWORD *)(v1 + 28) = -1;
}

uint64_t PFlushLine(uint64_t a1, int a2)
{
  int v4;
  int v5;
  int v6;
  unint64_t v7;
  unint64_t v8;
  int v9;
  uint64_t result;

  v4 = *(_DWORD *)(a1 + 4788);
  if (v4)
  {
    if (*(_QWORD *)(a1 + 128) <= (unint64_t)((*(_DWORD *)(a1 + 4804) & ~(*(int *)(a1 + 4804) >> 31))
                                                   + v4))
      WrapLine((_DWORD *)a1);
    if (WantIndent((_DWORD *)a1))
    {
      v5 = *(_DWORD *)(a1 + 4804);
      if (v5 >= 1)
      {
        v6 = v5 & ~(v5 >> 31);
        do
        {
          WriteChar(32, *(_QWORD *)(a1 + 4840));
          --v6;
        }
        while (v6);
      }
    }
    LODWORD(v7) = *(_DWORD *)(a1 + 4788);
    if ((_DWORD)v7)
    {
      v8 = 0;
      do
      {
        WriteChar(*(unsigned int *)(*(_QWORD *)(a1 + 4776) + 4 * v8++), *(_QWORD *)(a1 + 4840));
        v7 = *(unsigned int *)(a1 + 4788);
      }
      while (v8 < v7);
    }
    v9 = *(_DWORD *)(a1 + 4812);
    if ((v9 & 0x80000000) == 0 && v9 < (int)v7)
      WriteChar(92, *(_QWORD *)(a1 + 4840));
    ResetLine(a1 + 4776);
    *(_DWORD *)(a1 + 4788) = 0;
  }
  result = WriteChar(10, *(_QWORD *)(a1 + 4840));
  *(_DWORD *)(a1 + 4804) = a2;
  return result;
}

BOOL WantIndent(_DWORD *a1)
{
  int v1;
  int v2;
  int v4;
  _BOOL4 v5;

  if ((int)a1[1201] < 1)
    return 0;
  v1 = a1[1198];
  v2 = a1[1202];
  if (v2)
  {
    if (v2 < 1)
      goto LABEL_8;
    LOBYTE(v2) = v2 >= v1;
  }
  if ((v2 & 1) == 0 && !a1[124])
    return 0;
LABEL_8:
  v4 = a1[1203];
  v5 = v4 >= v1;
  if (v4 < 1)
    v5 = 1;
  return v4 && v5;
}

uint64_t ResetLine(uint64_t result)
{
  int v1;
  int v2;
  BOOL v3;
  int v4;
  int v5;
  int v6;

  if (*(_DWORD *)(result + 24))
  {
    *(_QWORD *)(result + 28) = *(_QWORD *)(result + 40);
    *(_DWORD *)(result + 36) = *(_DWORD *)(result + 48);
    *(_QWORD *)(result + 40) = -1;
    *(_DWORD *)(result + 48) = -1;
  }
  v1 = *(_DWORD *)(result + 16);
  v2 = *(_DWORD *)(result + 36);
  if (v1)
  {
    v3 = __OFSUB__(v2, v1);
    v4 = v2 - v1;
    if (!((v4 < 0) ^ v3 | (v4 == 0)))
      *(_DWORD *)(result + 36) = v4;
    v5 = *(_DWORD *)(result + 32);
    v3 = __OFSUB__(v5, v1);
    v6 = v5 - v1;
    if (!((v6 < 0) ^ v3 | (v6 == 0)))
      *(_DWORD *)(result + 32) = v6;
  }
  else
  {
    if (v2 >= 1)
      *(_DWORD *)(result + 36) = 0;
    if (*(int *)(result + 32) >= 1)
      *(_DWORD *)(result + 32) = 0;
  }
  *(_DWORD *)(result + 24) = 0;
  *(_DWORD *)(result + 16) = 0;
  return result;
}

void PrintBody(unsigned int *a1)
{
  _QWORD *Body;
  uint64_t i;

  Body = FindBody(a1);
  if (Body)
  {
    for (i = Body[3]; i; i = *(_QWORD *)(i + 16))
      PPrintTree(a1, 0, 0, i);
  }
}

void PPrintTree(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unsigned int v8;
  uint64_t v9;
  uint64_t i;
  int v11;
  uint64_t (**v13)(uint64_t, uint64_t);
  int v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  int *v18;
  int v19;
  uint64_t v20;
  _DWORD *v21;
  _DWORD *v22;
  uint64_t v23;
  uint64_t v24;
  int *v25;
  int v26;
  BOOL v27;
  uint64_t v28;
  uint64_t j;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  _DWORD *v33;
  unsigned int v34;
  uint64_t v35;
  _DWORD *v36;
  uint64_t k;
  uint64_t v38;
  uint64_t v39;
  _BOOL8 v40;
  uint64_t v41;
  _DWORD *v42;
  _DWORD *v43;
  _DWORD *v44;
  _DWORD *v45;
  _DWORD *v46;

  if (!a4)
    return;
  v8 = a1[30];
  v9 = a1[74];
  switch(*(_DWORD *)(a4 + 80))
  {
    case 0:
      for (i = *(_QWORD *)(a4 + 24); i; i = *(_QWORD *)(i + 16))
        PPrintTree(a1, a2, a3, i);
      return;
    case 1:
      PPrintDocType((uint64_t)a1, a3, a4);
      return;
    case 2:
      PPrintComment((uint64_t)a1, a3, a4);
      return;
    case 3:
      PPrintPI((uint64_t)a1, a3, a4);
      return;
    case 4:
      PPrintText((uint64_t)a1, a2, a3, a4);
      return;
    case 8:
      PPrintCDATA((uint64_t)a1, a3, a4);
      return;
    case 9:
      PPrintSection((uint64_t)a1, a3, a4);
      return;
    case 0xA:
      PPrintAsp(a1, a3, a4);
      return;
    case 0xB:
      PPrintJste(a1, a3, a4);
      return;
    case 0xC:
      PPrintPhp((uint64_t)a1, a3, a4);
      return;
    case 0xD:
      PPrintXmlDecl((uint64_t)a1, a3, a4);
      return;
    default:
      if (!nodeCMIsEmpty(a4))
      {
        v11 = *(_DWORD *)(a4 + 80);
        if (v11 != 7 || v9 != 0)
        {
          if (v11 == 7)
            *(_DWORD *)(a4 + 80) = 5;
          v13 = *(uint64_t (***)(uint64_t, uint64_t))(a4 + 56);
          if (v13)
          {
            if (v13[5] == ParsePre)
              goto LABEL_22;
            v14 = *(_DWORD *)v13;
            if (v14 == 92 || v14 == 101)
            {
              PPrintScriptStyle((uint64_t)a1, a2 | 0x19, a3, (_QWORD *)a4);
              return;
            }
            if (v14 == 107)
            {
LABEL_22:
              v15 = a1[188];
              PCondFlushLine((uint64_t)a1, a3);
              PCondFlushLine((uint64_t)a1, a3);
              if (v15 && *(_QWORD *)a4 && *(_QWORD *)(*(_QWORD *)a4 + 24) != a4)
                PFlushLine((uint64_t)a1, a3);
              PPrintTag((uint64_t)a1, a2, a3, a4);
              PFlushLine((uint64_t)a1, 0);
              v16 = *(_QWORD *)(a4 + 24);
              if (v16)
              {
                v17 = a2 | 9;
                do
                {
                  PPrintTree(a1, v17, 0, v16);
                  v16 = *(_QWORD *)(v16 + 16);
                }
                while (v16);
              }
              PCondFlushLine((uint64_t)a1, 0);
              PPrintEndTag((uint64_t)a1, a4);
              if (a1[66] || !*(_QWORD *)(a4 + 16))
                return;
LABEL_135:
              PFlushLine((uint64_t)a1, a3);
              return;
            }
          }
          if (nodeCMIsInline(a4))
          {
            if (a1[86] && (v22 = *(_DWORD **)(a4 + 56)) != 0 && *v22 == 69)
            {
              v23 = *(_QWORD *)(a4 + 24);
              if (v23)
              {
                v24 = a2 | 8;
                do
                {
                  PPrintTree(a1, v24, a3, v23);
                  v23 = *(_QWORD *)(v23 + 16);
                }
                while (v23);
              }
            }
            else
            {
              PPrintTag((uint64_t)a1, a2, a3, a4);
              if (ShouldIndent((uint64_t)a1, a4))
              {
                v28 = v8 + a3;
                PCondFlushLine((uint64_t)a1, v28);
                for (j = *(_QWORD *)(a4 + 24); j; j = *(_QWORD *)(j + 16))
                  PPrintTree(a1, a2, v28, j);
                PCondFlushLine((uint64_t)a1, a3);
              }
              else
              {
                for (k = *(_QWORD *)(a4 + 24); k; k = *(_QWORD *)(k + 16))
                  PPrintTree(a1, a2, a3, k);
              }
              PPrintEndTag((uint64_t)a1, a4);
            }
            return;
          }
          v30 = a1[66];
          v31 = a1[68];
          v32 = a1[188];
          if (a1[188])
          {
            if (*(_QWORD *)a4)
            {
              if (*(_QWORD *)(*(_QWORD *)a4 + 24) != a4)
              {
                v33 = *(_DWORD **)(a4 + 56);
                if (!v33 || *v33 != 48)
                  PFlushLine((uint64_t)a1, a3);
              }
            }
          }
          if (ShouldIndent((uint64_t)a1, a4))
            v34 = v8;
          else
            v34 = 0;
          v35 = v34 + a3;
          PCondFlushLine((uint64_t)a1, a3);
          if (v30 == 2 && *(_QWORD *)(a4 + 8))
            PFlushLine((uint64_t)a1, a3);
          if (!v31 || !nodeHasCM(a4, 0x200000) || *(_QWORD *)(a4 + 40))
          {
            PPrintTag((uint64_t)a1, a2, a3, a4);
            if (ShouldIndent((uint64_t)a1, a4))
            {
              v36 = *(_DWORD **)(a4 + 56);
              if (!v36 || *v36 != 61 || !nodeIsText(*(_QWORD *)(a4 + 24)))
                PCondFlushLine((uint64_t)a1, v35);
            }
            else if (nodeHasCM(a4, 2)
                   || (v43 = *(_DWORD **)(a4 + 56)) != 0 && *v43 == 71
                   || nodeHasCM(a4, 4) && ((v44 = *(_DWORD **)(a4 + 56)) == 0 || *v44 != 111))
            {
              PFlushLine((uint64_t)a1, v35);
            }
          }
          v38 = *(_QWORD *)(a4 + 24);
          if (v38)
          {
            v39 = 0;
            do
            {
              v40 = v39;
              v39 = v38;
              if (v40 && !v30 && nodeIsText(v40) && *(_QWORD *)(v39 + 56) && !nodeHasCM(v39, 16))
                PFlushLine((uint64_t)a1, v35);
              PPrintTree(a1, a2, v35, v39);
              v38 = *(_QWORD *)(v39 + 16);
            }
            while (v38);
          }
          if (ShouldIndent((uint64_t)a1, a4))
          {
            PCondFlushLine((uint64_t)a1, a3);
            if (v31 && nodeHasCM(a4, 0x8000))
              goto LABEL_132;
            goto LABEL_127;
          }
          if (v31)
          {
            if (nodeHasCM(a4, 0x8000))
              goto LABEL_132;
          }
          else if (nodeHasCM(a4, 2)
                 || (v45 = *(_DWORD **)(a4 + 56)) != 0 && *v45 == 71
                 || nodeHasCM(a4, 4) && ((v46 = *(_DWORD **)(a4 + 56)) == 0 || *v46 != 111))
          {
            PCondFlushLine((uint64_t)a1, a3);
            goto LABEL_127;
          }
          if (v32)
          {
            v41 = *(_QWORD *)(a4 + 24);
            if (v41)
            {
              while (!nodeIsText(v41))
              {
                v41 = *(_QWORD *)(v41 + 16);
                if (!v41)
                  goto LABEL_124;
              }
            }
            else
            {
LABEL_124:
              PFlushLine((uint64_t)a1, a3);
            }
          }
LABEL_127:
          PPrintEndTag((uint64_t)a1, a4);
          if (!v30 && !v31)
          {
            v42 = *(_DWORD **)(a4 + 56);
            if (!v42)
            {
              if (!v32)
                goto LABEL_135;
              goto LABEL_133;
            }
            if (!v32 && *v42 != 48)
              goto LABEL_135;
          }
LABEL_132:
          if (!v32)
            return;
LABEL_133:
          if (!*(_QWORD *)(a4 + 16) || !nodeHasCM(a4, 232))
            return;
          goto LABEL_135;
        }
      }
      if (!nodeHasCM(a4, 16))
        PCondFlushLine((uint64_t)a1, a3);
      v18 = *(int **)(a4 + 56);
      if (!v18)
        goto LABEL_64;
      v19 = *v18;
      if (*v18 != 17)
        goto LABEL_59;
      v20 = *(_QWORD *)(a4 + 8);
      if (!v20)
        goto LABEL_58;
      v21 = *(_DWORD **)(v20 + 56);
      if (v21)
      {
        if ((a2 & 1) != 0 || *v21 == 17)
          goto LABEL_58;
      }
      else if ((a2 & 1) != 0)
      {
        goto LABEL_58;
      }
      if (a1[98])
      {
        PFlushLine((uint64_t)a1, a3);
        v18 = *(int **)(a4 + 56);
        if (!v18)
          goto LABEL_64;
      }
LABEL_58:
      v19 = *v18;
LABEL_59:
      if (v19 == 47 && a1[188] && *(_QWORD *)a4 && *(_QWORD *)(*(_QWORD *)a4 + 24) != a4)
        PFlushLine((uint64_t)a1, a3);
LABEL_64:
      PPrintTag((uint64_t)a1, a2, a3, a4);
      if (*(_QWORD *)(a4 + 16))
      {
        v25 = *(int **)(a4 + 56);
        if (v25)
        {
          v26 = *v25;
          if (v26 == 80 || v26 == 7)
          {
            PCondFlushLine((uint64_t)a1, a3);
            return;
          }
          v27 = v26 == 17 && (a2 & 1) == 0;
          if (v27 || v26 == 47)
            goto LABEL_135;
        }
      }
      return;
  }
}

void PPrintText(uint64_t a1, char a2, unsigned int a3, uint64_t a4)
{
  unsigned int v8;
  int v9;
  int v10;
  int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  int v21;
  unsigned int v22;
  int v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;

  v8 = *(_DWORD *)(a4 + 72);
  v9 = *(_DWORD *)(a4 + 76);
  v26 = 0;
  v10 = TextEndsWithNewline(*(_QWORD *)(a1 + 104), a4, a2);
  v11 = TextStartsWithWhitespace(*(_QWORD *)(a1 + 104), a4, v8, a2);
  v12 = v9 - (v10 & ~(v10 >> 31));
  if (v11 >= a3)
    v13 = a3;
  else
    v13 = v11;
  v14 = v13 + v8;
  if (v14 >= v12)
    v14 = v12;
  if (v11 >= 1)
    v8 = v14;
  while (v8 < v12)
  {
    CheckWrapIndent((_DWORD *)a1, a3);
    v20 = (char *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 104) + v8);
    v21 = *v20;
    v22 = *v20;
    v26 = v22;
    if (v21 < 0)
    {
      v8 += GetUTF8(v20, (int *)&v26);
      v22 = v26;
    }
    if (v22 == 10)
    {
      PFlushLine(a1, a3);
      v23 = TextStartsWithWhitespace(*(_QWORD *)(a1 + 104), a4, v8 + 1, a2);
      if (v23 >= 1)
      {
        if (v23 >= a3)
          v24 = a3;
        else
          v24 = v23;
        v25 = v24 + v8;
        if (v25 >= v12)
          v8 = v12;
        else
          v8 = v25;
      }
    }
    else
    {
      PPrintChar(a1, v22, a2, v15, v16, v17, v18, v19);
    }
    ++v8;
  }
}

void PPrintComment(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v6;
  int v7;

  v6 = a1 + 4776;
  v7 = *(_DWORD *)(a1 + 4788);
  if (*(_QWORD *)(a1 + 128) <= (unint64_t)(v7 + a2))
  {
    if (!*(_DWORD *)(a1 + 4800))
    {
      *(_DWORD *)(a1 + 4816) = a2;
      *(_DWORD *)(a1 + 4800) = 1;
    }
  }
  else
  {
    if ((*(_DWORD *)(a1 + 4804) & 0x80000000) != 0)
      *(_DWORD *)(a1 + 4804) = a2;
    *(_DWORD *)(a1 + 4792) = v7;
  }
  AddString(a1 + 4776, "<!--");
  PPrintText(a1, 2, 0, a3);
  AddString(v6, "--");
  AddChar(v6, 62);
  if (*(_DWORD *)(a3 + 100))
  {
    if (*(_QWORD *)(a3 + 16))
      PFlushLine(a1, a2);
  }
}

uint64_t PPrintDocType(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  _QWORD *AttrByName;
  _QWORD *v10;
  int v11;
  int v12;
  char *v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;

  v6 = a1 + 4776;
  v7 = *(unsigned int *)(a1 + 128);
  v8 = *(_QWORD *)(a1 + 120);
  AttrByName = GetAttrByName(a3, "PUBLIC");
  v10 = GetAttrByName(a3, "SYSTEM");
  v11 = *(_DWORD *)(a1 + 4788);
  if (*(_QWORD *)(a1 + 128) <= (unint64_t)(v11 + a2))
  {
    if (!*(_DWORD *)(a1 + 4800))
    {
      *(_DWORD *)(a1 + 4816) = a2;
      *(_DWORD *)(a1 + 4800) = 1;
    }
  }
  else
  {
    if ((*(_DWORD *)(a1 + 4804) & 0x80000000) != 0)
      *(_DWORD *)(a1 + 4804) = a2;
    *(_DWORD *)(a1 + 4792) = v11;
  }
  PCondFlushLine(a1, a2);
  AddString(v6, "<!DOCTYPE ");
  v12 = *(_DWORD *)(a1 + 4788);
  if (*(_QWORD *)(a1 + 128) <= (unint64_t)(v12 + a2))
  {
    if (!*(_DWORD *)(a1 + 4800))
    {
      *(_DWORD *)(a1 + 4816) = a2;
      *(_DWORD *)(a1 + 4800) = 1;
    }
  }
  else
  {
    if ((*(_DWORD *)(a1 + 4804) & 0x80000000) != 0)
      *(_DWORD *)(a1 + 4804) = a2;
    *(_DWORD *)(a1 + 4792) = v12;
  }
  v13 = *(char **)(a3 + 64);
  if (v13)
    AddString(v6, v13);
  if (!AttrByName
    || !AttrByName[6]
    || (AddString(v6, " PUBLIC "),
        AddChar(v6, *((_DWORD *)AttrByName + 8)),
        AddString(v6, (char *)AttrByName[6]),
        AddChar(v6, *((_DWORD *)AttrByName + 8)),
        !AttrByName[6])
    || !v10)
  {
    if (!v10)
      goto LABEL_33;
    goto LABEL_29;
  }
  v14 = (_BYTE *)v10[6];
  if (!v14)
  {
LABEL_29:
    if (v10[6])
      AddString(v6, " SYSTEM ");
    goto LABEL_31;
  }
  v15 = *(unsigned int *)(a1 + 4788);
  v16 = v15 - (_QWORD)tmbstrlen(v14);
  v17 = v16 - 3;
  if (v16 == 3 || (unint64_t)&tmbstrlen((_BYTE *)v10[6])[v16 - 1] >= v7)
    goto LABEL_25;
  v18 = (2 * v8);
  if (!(_DWORD)v8)
    v18 = 4;
  if (v17 > v18)
LABEL_25:
    LODWORD(v17) = 0;
  PCondFlushLine(a1, v17);
  if (*(_DWORD *)(a1 + 4788))
    AddChar(v6, 32);
LABEL_31:
  if (v10[6])
  {
    AddChar(v6, *((_DWORD *)v10 + 8));
    AddString(v6, (char *)v10[6]);
    AddChar(v6, *((_DWORD *)v10 + 8));
  }
LABEL_33:
  if (*(_QWORD *)(a3 + 24))
  {
    PCondFlushLine(a1, a2);
    AddChar(v6, 91);
    PPrintText(a1, 16, 0, *(_QWORD *)(a3 + 24));
    AddChar(v6, 93);
  }
  v19 = *(unsigned int *)(a1 + 4788);
  if (*(_QWORD *)(a1 + 128) <= v19)
  {
    if (!*(_DWORD *)(a1 + 4800))
    {
      *(_DWORD *)(a1 + 4816) = 0;
      *(_DWORD *)(a1 + 4800) = 1;
    }
  }
  else
  {
    if ((*(_DWORD *)(a1 + 4804) & 0x80000000) != 0)
      *(_DWORD *)(a1 + 4804) = 0;
    *(_DWORD *)(a1 + 4792) = v19;
  }
  AddChar(v6, 62);
  return PCondFlushLine(a1, a2);
}

uint64_t PPrintPI(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v6;
  int v7;
  char *v8;
  int v9;
  int v10;
  int v12;

  v6 = a1 + 4776;
  v7 = *(_DWORD *)(a1 + 4788);
  if (*(_QWORD *)(a1 + 128) <= (unint64_t)(v7 + a2))
  {
    if (!*(_DWORD *)(a1 + 4800))
    {
      *(_DWORD *)(a1 + 4816) = a2;
      *(_DWORD *)(a1 + 4800) = 1;
    }
  }
  else
  {
    if ((*(_DWORD *)(a1 + 4804) & 0x80000000) != 0)
      *(_DWORD *)(a1 + 4804) = a2;
    *(_DWORD *)(a1 + 4792) = v7;
  }
  v12 = 0;
  AddString(a1 + 4776, "<?");
  v8 = *(char **)(a3 + 64);
  if (v8)
  {
    v9 = *v8;
    if (*v8)
    {
      do
      {
        v12 = v9;
        if ((v9 & 0x80) != 0)
        {
          v8 += GetUTF8(v8, &v12);
          v9 = v12;
        }
        AddChar(v6, v9);
        v10 = *++v8;
        v9 = v10;
      }
      while (v10);
    }
  }
  PPrintText(a1, 16, a2, a3);
  if (*(_DWORD *)(a1 + 288) || *(_DWORD *)(a1 + 296) || *(_DWORD *)(a3 + 92))
    AddChar(v6, 63);
  AddChar(v6, 62);
  return PCondFlushLine(a1, a2);
}

uint64_t PPrintXmlDecl(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v6;
  int v7;
  unint64_t v8;
  unsigned int v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *AttrByName;
  int v13;

  v6 = a1 + 4776;
  v7 = *(_DWORD *)(a1 + 4788);
  v8 = *(_QWORD *)(a1 + 128);
  if (v8 <= (v7 + a2))
  {
    if (!*(_DWORD *)(a1 + 4800))
    {
      *(_DWORD *)(a1 + 4816) = a2;
      *(_DWORD *)(a1 + 4800) = 1;
    }
  }
  else
  {
    if ((*(_DWORD *)(a1 + 4804) & 0x80000000) != 0)
      *(_DWORD *)(a1 + 4804) = a2;
    *(_DWORD *)(a1 + 4792) = v7;
  }
  SetOptionInt(a1, 2u, 0xFFFFFFFFLL);
  v9 = *(_DWORD *)(a1 + 328);
  SetOptionBool(a1, 0x1Bu, 0);
  AddString(v6, "<?xml");
  v10 = AttrGetById(a3, 147);
  if (v10)
    PPrintAttribute(a1, a2, a3, (uint64_t)v10);
  v11 = AttrGetById(a3, 47);
  if (v11)
    PPrintAttribute(a1, a2, a3, (uint64_t)v11);
  AttrByName = GetAttrByName(a3, "standalone");
  if (AttrByName)
    PPrintAttribute(a1, a2, a3, (uint64_t)AttrByName);
  SetOptionBool(a1, 0x1Bu, v9);
  v13 = *(_DWORD *)(a3 + 76);
  if (!v13 || *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 104) + (v13 - 1)) != 63)
    AddChar(v6, 63);
  AddChar(v6, 62);
  SetOptionInt(a1, 2u, v8);
  return PFlushLine(a1, a2);
}

BOOL PPrintCDATA(uint64_t a1, unsigned int a2, uint64_t a3)
{
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;

  if (*(_DWORD *)(a1 + 616))
    v5 = a2;
  else
    v5 = 0;
  v6 = a1 + 4776;
  PCondFlushLine(a1, v5);
  v7 = *(unsigned int *)(a1 + 128);
  SetOptionInt(a1, 2u, 0xFFFFFFFFLL);
  AddString(v6, "<![CDATA[");
  PPrintText(a1, 2, v5, a3);
  AddString(v6, "]]>");
  PCondFlushLine(a1, v5);
  return SetOptionInt(a1, 2u, v7);
}

BOOL PPrintSection(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v6;
  char v7;

  v6 = *(unsigned int *)(a1 + 128);
  if (*(_DWORD *)(a1 + 456))
  {
    v7 = 16;
  }
  else
  {
    v7 = 2;
    SetOptionInt(a1, 2u, 0xFFFFFFFFLL);
  }
  AddString(a1 + 4776, "<![");
  PPrintText(a1, v7, a2, a3);
  AddString(a1 + 4776, "]>");
  return SetOptionInt(a1, 2u, v6);
}

BOOL PPrintAsp(unsigned int *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  char v9;

  v6 = a1[116];
  v7 = a1[32];
  if (a1[116])
    v8 = a1[118] == 0;
  else
    v8 = 1;
  if (v8)
    SetOptionInt((uint64_t)a1, 2u, 0xFFFFFFFFLL);
  AddString((uint64_t)(a1 + 1194), "<%");
  if (v6)
    v9 = 16;
  else
    v9 = 2;
  PPrintText((uint64_t)a1, v9, a2, a3);
  AddString((uint64_t)(a1 + 1194), "%>");
  return SetOptionInt((uint64_t)a1, 2u, v7);
}

BOOL PPrintJste(unsigned int *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v6;
  char v7;

  v6 = a1[32];
  if (!a1[116])
    SetOptionInt((uint64_t)a1, 2u, 0xFFFFFFFFLL);
  AddString((uint64_t)(a1 + 1194), "<#");
  if (a1[118])
    v7 = 16;
  else
    v7 = 2;
  PPrintText((uint64_t)a1, v7, a2, a3);
  AddString((uint64_t)(a1 + 1194), "#>");
  return SetOptionInt((uint64_t)a1, 2u, v6);
}

BOOL PPrintPhp(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v6;
  char v7;

  v6 = *(unsigned int *)(a1 + 128);
  if (*(_DWORD *)(a1 + 480))
  {
    v7 = 16;
  }
  else
  {
    v7 = 2;
    SetOptionInt(a1, 2u, 0xFFFFFFFFLL);
  }
  AddString(a1 + 4776, "<?");
  PPrintText(a1, v7, a2, a3);
  AddString(a1 + 4776, "?>");
  return SetOptionInt(a1, 2u, v6);
}

uint64_t PCondFlushLine(uint64_t result, int a2)
{
  int v2;
  uint64_t v4;
  int v5;
  int v6;
  unint64_t v7;
  unint64_t v8;
  int v9;

  v2 = *(_DWORD *)(result + 4788);
  if (v2)
  {
    v4 = result;
    if (*(_QWORD *)(result + 128) <= (unint64_t)((*(_DWORD *)(result + 4804) & ~(*(int *)(result + 4804) >> 31))
                                                       + v2))
      WrapLine((_DWORD *)result);
    if (WantIndent((_DWORD *)v4))
    {
      v5 = *(_DWORD *)(v4 + 4804);
      if (v5 >= 1)
      {
        v6 = v5 & ~(v5 >> 31);
        do
        {
          WriteChar(32, *(_QWORD *)(v4 + 4840));
          --v6;
        }
        while (v6);
      }
    }
    LODWORD(v7) = *(_DWORD *)(v4 + 4788);
    if ((_DWORD)v7)
    {
      v8 = 0;
      do
      {
        WriteChar(*(unsigned int *)(*(_QWORD *)(v4 + 4776) + 4 * v8++), *(_QWORD *)(v4 + 4840));
        v7 = *(unsigned int *)(v4 + 4788);
      }
      while (v8 < v7);
    }
    v9 = *(_DWORD *)(v4 + 4812);
    if ((v9 & 0x80000000) == 0 && v9 < (int)v7)
      WriteChar(92, *(_QWORD *)(v4 + 4840));
    ResetLine(v4 + 4776);
    result = WriteChar(10, *(_QWORD *)(v4 + 4840));
    *(_DWORD *)(v4 + 4804) = a2;
    *(_DWORD *)(v4 + 4788) = 0;
  }
  return result;
}

void PPrintTag(uint64_t a1, char a2, unsigned int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  unsigned int v14;
  _QWORD *i;
  _BOOL4 v17;
  unsigned int v18;
  _DWORD *v19;
  _DWORD *v20;
  int v21;

  v8 = a1 + 4776;
  v9 = *(unsigned int *)(a1 + 320);
  v10 = *(unsigned int *)(a1 + 296);
  v11 = *(unsigned int *)(a1 + 288);
  v12 = *(char **)(a4 + 64);
  AddChar(a1 + 4776, 60);
  if (*(_DWORD *)(a4 + 80) == 6)
    AddChar(v8, 47);
  v21 = 0;
  if (v12)
  {
    v13 = *v12;
    if (*v12)
    {
      do
      {
        v21 = v13;
        if ((v13 & 0x80) != 0)
        {
          v12 += GetUTF8(v12, &v21);
          LODWORD(v13) = v21;
        }
        else if (v9)
        {
          LODWORD(v13) = ToUpper(v13);
          v21 = v13;
        }
        AddChar(v8, v13);
        v14 = *++v12;
        v13 = v14;
      }
      while (v14);
    }
  }
  if (*(_DWORD *)(a1 + 288)
    && *(_DWORD *)(a1 + 512)
    && !GetAttrByName(a4, "xml:space")
    && XMLPreserveWhiteSpace(a1, a4))
  {
    AddAttribute(a1, a4, "xml:space", "preserve");
  }
  for (i = *(_QWORD **)(a4 + 40); i; i = (_QWORD *)*i)
  {
    if (i[5])
    {
      PPrintAttribute(a1, a3, a4, (uint64_t)i);
    }
    else if (i[2])
    {
      AddChar(v8, 32);
      PPrintAsp((unsigned int *)a1, a3, i[2]);
    }
    else if (i[3])
    {
      AddChar(v8, 32);
      PPrintPhp(a1, a3, i[3]);
    }
  }
  if (v11 | v10 && (*(_DWORD *)(a4 + 80) == 7 || nodeCMIsEmpty(a4)))
  {
    AddChar(v8, 32);
    AddChar(v8, 47);
  }
  AddChar(v8, 62);
  v17 = *(_DWORD *)(a4 + 80) != 7 || v10 != 0;
  if ((a2 & 1) == 0 && v17)
  {
    v18 = *(_DWORD *)(a1 + 128);
    CheckWrapIndent((_DWORD *)a1, a3);
    if (*(_DWORD *)(a1 + 4788) + a3 >= v18)
    {
      if ((a2 & 8) != 0
        || (v20 = *(_DWORD **)(a4 + 56)) != 0 && *v20 == 17
        || AfterSpace(*(_QWORD *)(a1 + 104), a4))
      {
        PCondFlushLine(a1, a3);
      }
    }
    else if ((a2 & 8) == 0 && (!nodeCMIsInline(a4) || (v19 = *(_DWORD **)(a4 + 56)) != 0 && *v19 == 17))
    {
      if (AfterSpace(*(_QWORD *)(a1 + 104), a4))
        *(_DWORD *)(a1 + 4792) = *(_DWORD *)(a1 + 4788);
    }
  }
}

void PPrintEndTag(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  unsigned int v6;
  int v7;

  v2 = a1 + 4776;
  v3 = *(unsigned int *)(a1 + 320);
  v4 = *(char **)(a2 + 64);
  v7 = 0;
  AddString(a1 + 4776, "</");
  if (v4)
  {
    v5 = *v4;
    if (*v4)
    {
      do
      {
        v7 = v5;
        if ((v5 & 0x80) != 0)
        {
          v4 += GetUTF8(v4, &v7);
          LODWORD(v5) = v7;
        }
        else if (v3)
        {
          LODWORD(v5) = ToUpper(v5);
          v7 = v5;
        }
        AddChar(v2, v5);
        v6 = *++v4;
        v5 = v6;
      }
      while (v6);
    }
  }
  AddChar(v2, 62);
}

void PPrintScriptStyle(uint64_t a1, int a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v8;
  char *v9;
  _QWORD *v10;
  _DWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  unsigned int *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  char *v27;

  v8 = a1 + 4776;
  v9 = (char *)*(unsigned int *)(a1 + 296);
  v10 = a4;
  while (1)
  {
    v11 = (_DWORD *)v10[7];
    if (v11)
    {
      if (*v11 == 46)
        break;
    }
    v10 = (_QWORD *)*v10;
    if (!v10)
      goto LABEL_7;
  }
  PFlushLine(a1, a3);
LABEL_7:
  PPrintTag(a1, a2, a3, (uint64_t)a4);
  PFlushLine(a1, 0);
  v27 = v9;
  if (v9)
  {
    if (a4[3])
    {
      v12 = AttrGetById((uint64_t)a4, 142);
      if (!v12)
        goto LABEL_18;
      v13 = v12;
      v14 = (char *)v12[6];
      if (!v14)
        goto LABEL_18;
      if (!tmbstrcasecmp(v14, "text/javascript"))
      {
        v9 = (char *)&unk_20AB66763;
        v17 = "//";
        goto LABEL_20;
      }
      v15 = (char *)v13[6];
      if (v15)
      {
        if (!tmbstrcasecmp(v15, "text/css"))
        {
          v9 = "*/";
          v17 = "/*";
          goto LABEL_20;
        }
        v16 = (char *)v13[6];
        v17 = (char *)&unk_20AB66763;
        if (v16)
        {
          v9 = (char *)&unk_20AB66763;
          if (!tmbstrcasecmp(v16, "text/vbscript"))
            v17 = "'";
          goto LABEL_20;
        }
      }
      else
      {
LABEL_18:
        v17 = (char *)&unk_20AB66763;
      }
      v9 = (char *)&unk_20AB66763;
LABEL_20:
      v18 = (unsigned int *)a4[3];
      if (v18[20] == 4
        && tmbsubstrn(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 104) + v18[18], (int)(v18[19] - v18[18] + 1), "<![CDATA["))
      {
        v19 = v9;
        LOBYTE(v9) = 1;
      }
      else
      {
        v20 = *(unsigned int *)(a1 + 128);
        SetOptionInt(a1, 2u, 0xFFFFFFFFLL);
        AddString(v8, v17);
        AddString(v8, "<![CDATA[");
        v19 = v9;
        AddString(v8, v9);
        PCondFlushLine(a1, a3);
        SetOptionInt(a1, 2u, v20);
        LOBYTE(v9) = 0;
      }
      goto LABEL_26;
    }
    LOBYTE(v9) = 0;
  }
  v17 = (char *)&unk_20AB66763;
  v19 = (char *)&unk_20AB66763;
LABEL_26:
  v21 = a4[3];
  if (!v21)
    goto LABEL_32;
  v22 = a2 | 0x19u;
  v23 = -1;
  do
  {
    PPrintTree(a1, v22, a3, v21);
    if (v21 == a4[4])
      v23 = TextEndsWithNewline(*(_QWORD *)(a1 + 104), v21, 16);
    v21 = *(_QWORD *)(v21 + 16);
  }
  while (v21);
  if (v23 < 0)
LABEL_32:
    PCondFlushLine(a1, a3);
  v24 = a4[3];
  if (v24)
    v25 = (char)v9;
  else
    v25 = 1;
  if (v27 && (v25 & 1) == 0)
  {
    v26 = *(unsigned int *)(a1 + 128);
    SetOptionInt(a1, 2u, 0xFFFFFFFFLL);
    AddString(v8, v17);
    AddString(v8, "]]>");
    AddString(v8, v19);
    SetOptionInt(a1, 2u, v26);
    PCondFlushLine(a1, a3);
    v24 = a4[3];
  }
  if (v24 && *(_DWORD *)(a1 + 4804) != (_DWORD)a3)
    *(_DWORD *)(a1 + 4804) = a3;
  PPrintEndTag(a1, (uint64_t)a4);
  if (!*(_DWORD *)(a1 + 264) && a4[2] && !nodeHasCM((_BOOL8)a4, 16) && !nodeIsText((_BOOL8)a4))
    PFlushLine(a1, a3);
}

BOOL ShouldIndent(uint64_t a1, uint64_t a2)
{
  int v2;
  _DWORD *v4;
  uint64_t v5;
  _BOOL8 result;
  _DWORD *v7;
  unsigned int v8;
  BOOL v9;
  unint64_t v10;
  _DWORD *v12;

  v2 = *(_DWORD *)(a1 + 264);
  if (!v2)
    return 0;
  v4 = *(_DWORD **)(a2 + 56);
  if (v4)
  {
    if (*v4 == 107)
      return 0;
  }
  if (v2 == 2)
  {
    if (*(_QWORD *)(a2 + 24) && nodeHasCM(a2, 0x40000))
    {
      v5 = *(_QWORD *)(a2 + 24);
      if (v5)
      {
        while (1)
        {
          result = nodeHasCM(v5, 8);
          if (result)
            break;
          v5 = *(_QWORD *)(v5 + 16);
          if (!v5)
            return result;
        }
        return 1;
      }
      return 0;
    }
    if (nodeHasCM(a2, 0x4000))
      return 0;
    v7 = *(_DWORD **)(a2 + 56);
    if (v7)
    {
      v8 = *v7 - 48;
      v9 = v8 > 0x3F;
      v10 = (1 << v8) & 0x8000000080000001;
      if (!v9 && v10 != 0)
        return 0;
    }
  }
  if (nodeHasCM(a2, 3072))
    return 1;
  v12 = *(_DWORD **)(a2 + 56);
  if (v12)
  {
    if (*v12 == 64)
      return 1;
  }
  if (nodeHasCM(a2, 16))
    return 0;
  return *(_QWORD *)(a2 + 24) != 0;
}

void PPrintXMLTree(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  unsigned int v11;
  uint64_t v12;
  _BOOL4 IsText;
  _BOOL4 v14;
  uint64_t v15;
  uint64_t v16;

  if (a4)
  {
    v5 = a3;
    v8 = a1[74];
    switch(*(_DWORD *)(a4 + 80))
    {
      case 0:
        for (i = *(_QWORD *)(a4 + 24); i; i = *(_QWORD *)(i + 16))
          PPrintXMLTree(a1, a2, v5, i);
        return;
      case 1:
        PPrintDocType((uint64_t)a1, a3, a4);
        return;
      case 2:
        PCondFlushLine((uint64_t)a1, a3);
        PPrintComment((uint64_t)a1, v5, a4);
        return;
      case 3:
        PPrintPI((uint64_t)a1, a3, a4);
        return;
      case 4:
        PPrintText((uint64_t)a1, a2, a3, a4);
        return;
      case 8:
        PPrintCDATA((uint64_t)a1, a3, a4);
        return;
      case 9:
        PPrintSection((uint64_t)a1, a3, a4);
        return;
      case 0xA:
        PPrintAsp(a1, a3, a4);
        return;
      case 0xB:
        PPrintJste(a1, a3, a4);
        return;
      case 0xC:
        PPrintPhp((uint64_t)a1, a3, a4);
        return;
      case 0xD:
        PPrintXmlDecl((uint64_t)a1, a3, a4);
        return;
      default:
        if (nodeHasCM(a4, 1) || (*(_DWORD *)(a4 + 80) == 7 ? (v10 = v8 == 0) : (v10 = 0), v10))
        {
          PCondFlushLine((uint64_t)a1, v5);
          PPrintTag((uint64_t)a1, a2, v5, a4);
          return;
        }
        v11 = a1[30];
        v12 = *(_QWORD *)(a4 + 24);
        if (v12)
        {
          while (1)
          {
            IsText = nodeIsText(v12);
            v14 = !IsText;
            if (IsText)
              break;
            v12 = *(_QWORD *)(v12 + 16);
            if (!v12)
              goto LABEL_28;
          }
          v11 = 0;
        }
        else
        {
          v14 = 1;
        }
LABEL_28:
        PCondFlushLine((uint64_t)a1, v5);
        if (XMLPreserveWhiteSpace((uint64_t)a1, a4))
        {
          LODWORD(v5) = 0;
          v14 = 1;
          v15 = 0;
        }
        else
        {
          v15 = v11 + v5;
        }
        PPrintTag((uint64_t)a1, a2, v5, a4);
        v16 = *(_QWORD *)(a4 + 24);
        if (!v14)
          goto LABEL_34;
        if (v16)
        {
          PFlushLine((uint64_t)a1, v15);
          v16 = *(_QWORD *)(a4 + 24);
LABEL_34:
          while (v16)
          {
            PPrintXMLTree(a1, a2, v15, v16);
            v16 = *(_QWORD *)(v16 + 16);
          }
          if (v14 && *(_QWORD *)(a4 + 24))
            PCondFlushLine((uint64_t)a1, v5);
        }
        PPrintEndTag((uint64_t)a1, a4);
        break;
    }
  }
}

_DWORD *WrapLine(_DWORD *result)
{
  _DWORD *v1;
  uint64_t v2;
  int v3;
  int v4;
  unint64_t v5;
  unint64_t v6;
  int v7;
  BOOL v8;

  if (result[1198])
  {
    v1 = result;
    v2 = (uint64_t)(result + 1194);
    if (!WantIndent(result))
      goto LABEL_7;
    v3 = v1[1201];
    if (v3 < 1)
      goto LABEL_7;
    v4 = v3 & ~(v3 >> 31);
    do
    {
      WriteChar(32, *((_QWORD *)v1 + 605));
      --v4;
    }
    while (v4);
    LODWORD(v5) = v1[1198];
    if ((_DWORD)v5)
    {
LABEL_7:
      v6 = 0;
      do
      {
        WriteChar(*(unsigned int *)(*((_QWORD *)v1 + 597) + 4 * v6++), *((_QWORD *)v1 + 605));
        v5 = v1[1198];
      }
      while (v6 < v5);
    }
    v7 = v1[1203];
    if (!v7 || (v7 >= 1 ? (v8 = v7 < (int)v5) : (v8 = 0), v8))
      WriteChar(92, *((_QWORD *)v1 + 605));
    WriteChar(10, *((_QWORD *)v1 + 605));
    return (_DWORD *)ResetLineAfterWrap(v2);
  }
  return result;
}

uint64_t ResetLineAfterWrap(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  _DWORD *v3;
  int *v4;
  unint64_t v5;
  int v6;
  int v8;
  int v9;

  v2 = *(unsigned int *)(result + 12);
  v1 = *(unsigned int *)(result + 16);
  if (v2 <= v1)
  {
    v9 = 0;
  }
  else
  {
    v3 = *(_DWORD **)result;
    v4 = (int *)(*(_QWORD *)result + 4 * v1);
    v5 = *(_QWORD *)result + 4 * v2;
    v6 = *(_DWORD *)(result + 32);
    if (v6)
    {
      if (v6 < 1 || v6 >= (int)v1)
      {
        do
        {
          if (*v4 != 32)
            break;
          ++v4;
          LODWORD(v1) = v1 + 1;
          *(_DWORD *)(result + 16) = v1;
        }
        while ((unint64_t)v4 < v5);
      }
    }
    if ((unint64_t)v4 < v5)
    {
      do
      {
        v8 = *v4++;
        *v3++ = v8;
      }
      while ((unint64_t)v4 < v5);
      LODWORD(v2) = *(_DWORD *)(result + 12);
      LODWORD(v1) = *(_DWORD *)(result + 16);
    }
    v9 = v2 - v1;
  }
  *(_DWORD *)(result + 12) = v9;
  return ResetLine(result);
}

uint64_t TextEndsWithNewline(uint64_t a1, uint64_t a2, char a3)
{
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  unsigned __int8 *v10;
  unsigned int v11;
  uint64_t v12;
  unsigned int v14;
  unsigned int v16;

  if ((a3 & 0x12) == 0)
    return 0xFFFFFFFFLL;
  if (!nodeIsText(a2))
    return 0xFFFFFFFFLL;
  v6 = *(_DWORD *)(a2 + 72);
  v5 = *(_DWORD *)(a2 + 76);
  if (v5 <= v6)
    return 0xFFFFFFFFLL;
  v7 = v5 - 1;
  v8 = *(_QWORD *)(a1 + 104);
  if (v5 - 1 <= v6)
  {
    v9 = *(_DWORD *)(a2 + 76);
  }
  else
  {
    v9 = *(_DWORD *)(a2 + 76);
    v10 = (unsigned __int8 *)(v8 + v7);
    while (1)
    {
      v11 = *v10--;
      v12 = (1 << v11) & 0x100002200;
      if (v11 > 0x20 || v12 == 0)
        break;
      v14 = v9 - 2;
      --v9;
      if (v6 >= v14)
      {
        v9 = v6 + 1;
        v7 = *(_DWORD *)(a2 + 72);
        goto LABEL_16;
      }
    }
    v7 = v9 - 1;
  }
LABEL_16:
  v16 = v5 - v9;
  if (*(_BYTE *)(v8 + v7) == 10)
    return v16;
  else
    return 0xFFFFFFFFLL;
}

uint64_t TextStartsWithWhitespace(uint64_t a1, uint64_t a2, unsigned int a3, char a4)
{
  uint64_t v7;
  unsigned int v8;
  BOOL v9;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t result;

  if ((a4 & 0x12) == 0 || !nodeIsText(a2))
    return 0xFFFFFFFFLL;
  v8 = *(_DWORD *)(a2 + 72);
  v7 = *(unsigned int *)(a2 + 76);
  v9 = v7 <= v8 || v8 > a3;
  if (v9 || v7 <= a3)
    return 0xFFFFFFFFLL;
  v11 = a3;
  while (1)
  {
    v12 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 104) + v11);
    v9 = v12 > 0x20;
    v13 = (1 << v12) & 0x100002200;
    if (v9 || v13 == 0)
      break;
    if (v7 == ++v11)
    {
      LODWORD(v11) = *(_DWORD *)(a2 + 76);
      break;
    }
  }
  result = v11 - a3;
  if (v11 <= a3)
    return 0xFFFFFFFFLL;
  return result;
}

_DWORD *CheckWrapIndent(_DWORD *result, int a2)
{
  _DWORD *v3;

  if (*((_QWORD *)result + 16) <= (unint64_t)((result[1201] & ~((int)result[1201] >> 31))
                                                    + result[1197]))
  {
    v3 = result;
    result = WrapLine(result);
    if ((v3[1201] & 0x80000000) != 0)
      v3[1201] = a2;
  }
  return result;
}

void PPrintChar(uint64_t a1, unsigned int a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  unint64_t v15;
  uint64_t *v16;
  unint64_t v17;
  int v18;
  int v19;
  int v20;
  const char *v21;
  int v22;
  char v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v11 = a1 + 4776;
  v12 = *(_QWORD *)(a1 + 160);
  v13 = *(unsigned int *)(a1 + 416);
  if (a2 == 32 && (a3 & 0x17) == 0)
  {
    if ((a3 & 8) != 0)
    {
      if (*(_DWORD *)(a1 + 408) || *(_DWORD *)(a1 + 280))
        v14 = "&#160;";
      else
        v14 = "&nbsp;";
      goto LABEL_15;
    }
    *(_DWORD *)(a1 + 4792) = *(_DWORD *)(a1 + 4788);
  }
  if ((a3 & 0x12) != 0)
  {
LABEL_6:
    AddChar(a1 + 4776, a2);
    return;
  }
  if ((a3 & 0x10) != 0)
    goto LABEL_33;
  switch(a2)
  {
    case '&':
      if (*(_DWORD *)(a1 + 432))
      {
        if (!v12)
          goto LABEL_6;
        v14 = "&amp;";
        goto LABEL_15;
      }
      goto LABEL_33;
    case '>':
      v14 = "&gt;";
      goto LABEL_15;
    case '<':
      v14 = "&lt;";
LABEL_15:
      AddString(a1 + 4776, v14);
      return;
  }
  if (a2 == 34 && v13)
  {
    v14 = "&quot;";
    goto LABEL_15;
  }
  if (a2 == 39 && v13)
  {
    v14 = "&#39;";
    goto LABEL_15;
  }
  if (a2 != 160 || !(_DWORD)v12)
  {
LABEL_33:
    switch((int)v12)
    {
      case 0:
      case 5:
      case 13:
        goto LABEL_6;
      case 3:
        goto LABEL_54;
      case 4:
      case 9:
      case 10:
      case 11:
        if ((a3 & 1) != 0 || !*(_QWORD *)(a1 + 760))
          goto LABEL_51;
        v15 = 0x2000;
        v16 = &qword_20AB64970;
        break;
      case 12:
        AddChar(a1 + 4776, a2);
        if ((a3 & 1) == 0 && (a2 & 0xFF00) == 0xA100 && *(_QWORD *)(a1 + 760))
        {
          v18 = *(_DWORD *)(a1 + 4788);
          if (a2 - 41389 < 0xFFFFFFB0 || (a2 & 1) == 0)
            ++v18;
          *(_DWORD *)(a1 + 4792) = v18;
        }
        return;
      default:
        goto LABEL_58;
    }
    while (v15 <= a2)
    {
      if (v15 == a2)
      {
        v19 = *(_DWORD *)(a1 + 4788);
        if ((*(_DWORD *)(v16 - 1) & 0xFFFFFFFE) != 4)
          ++v19;
        *(_DWORD *)(a1 + 4792) = v19;
        break;
      }
      v17 = *v16;
      v16 += 2;
      v15 = v17;
      if (!v17)
        break;
    }
LABEL_51:
    if ((v12 - 9) < 3 || (_DWORD)v12 == 4)
      goto LABEL_6;
    if ((_DWORD)v12 == 3)
    {
LABEL_54:
      if (a2 < 0x100)
      {
        if (a2 - 127 > 0x20)
          goto LABEL_6;
        goto LABEL_69;
      }
      v20 = HTMLVersion(a1);
      if (*(_DWORD *)(a1 + 408))
        goto LABEL_69;
      v21 = EntityName(a2, v20);
      if (!v21)
        goto LABEL_69;
    }
    else
    {
LABEL_58:
      if (*(_DWORD *)(a1 + 280))
      {
        if (a2 < 0x80 || (_DWORD)v12 != 1)
          goto LABEL_6;
        goto LABEL_69;
      }
      if ((_DWORD)v12 != 1 || a2 <= 0x7E && (a2 > 0x1F || a2 == 9))
        goto LABEL_6;
      v22 = HTMLVersion(a1);
      if (*(_DWORD *)(a1 + 408) || (v21 = EntityName(a2, v22)) == 0)
      {
LABEL_69:
        tmbsnprintf(v23, 128, "&#%u;", a4, a5, a6, a7, a8, a2);
LABEL_70:
        AddString(v11, v23);
        return;
      }
    }
    tmbsnprintf(v23, 128, "&%s;", a4, a5, a6, a7, a8, (char)v21);
    goto LABEL_70;
  }
  if (*(_DWORD *)(a1 + 424))
  {
    if (*(_DWORD *)(a1 + 408) || *(_DWORD *)(a1 + 280))
      v14 = "&#160;";
    else
      v14 = "&nbsp;";
    goto LABEL_15;
  }
  AddChar(a1 + 4776, 160);
}

void AddString(uint64_t a1, char *a2)
{
  char *v2;
  uint64_t v4;
  _BYTE *v5;
  unsigned int v6;
  _DWORD *v7;
  int v8;

  v2 = a2;
  v4 = *(unsigned int *)(a1 + 12);
  v5 = tmbstrlen(a2);
  v6 = (_DWORD)v5 + v4;
  if ((unint64_t)&v5[v4] >= *(unsigned int *)(a1 + 8))
    expand(a1, v6);
  if (v5)
  {
    v7 = (_DWORD *)(*(_QWORD *)a1 + 4 * v4);
    do
    {
      v8 = *v2++;
      *v7++ = v8;
      --v5;
    }
    while (v5);
  }
  *(_DWORD *)(a1 + 12) = v6;
}

void AddChar(uint64_t a1, int a2)
{
  uint64_t v4;

  v4 = *(unsigned int *)(a1 + 12);
  if ((v4 + 1) >= *(_DWORD *)(a1 + 8))
    expand(a1, v4 + 1);
  *(_DWORD *)(*(_QWORD *)a1 + 4 * v4) = a2;
  ++*(_DWORD *)(a1 + 12);
}

void expand(uint64_t a1, unsigned int a2)
{
  int v3;
  unsigned int v4;
  char *v5;
  char *v6;

  v3 = *(_DWORD *)(a1 + 8);
  if (!v3)
    v3 = 256;
  do
  {
    v4 = v3;
    v3 *= 2;
  }
  while (v4 <= a2);
  v5 = (char *)MemRealloc(*(void **)a1, 4 * v4);
  if (v5)
  {
    v6 = v5;
    ClearMemory(&v5[4 * *(unsigned int *)(a1 + 8)], 4 * (v4 - *(_DWORD *)(a1 + 8)));
    *(_DWORD *)(a1 + 8) = v4;
    *(_QWORD *)a1 = v6;
  }
}

void PPrintAttribute(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  _BYTE *v13;
  unsigned int v14;
  _QWORD *v15;
  _BOOL8 v16;
  uint64_t v17;
  unsigned __int8 *v18;
  unsigned int v19;
  uint64_t v20;
  int v21;
  int *v22;
  int v23;
  int v24;
  uint64_t v25;
  unsigned int v26;
  unsigned __int8 *v27;
  int v28;
  uint64_t v29;
  int v30;
  int v31;
  int v32;
  _BOOL4 v33;
  _BOOL4 IsEvent;
  int v35;
  int v36;
  unsigned int v37;
  int v38;

  v8 = *(unsigned int *)(a1 + 288);
  v9 = *(unsigned int *)(a1 + 296);
  v36 = *(_DWORD *)(a1 + 440);
  v10 = *(unsigned int *)(a1 + 328);
  v11 = *(unsigned int *)(a1 + 496);
  v12 = *(_DWORD *)(a1 + 120);
  v13 = *(_BYTE **)(a3 + 64);
  if (v13)
  {
    v14 = tmbstrlen(v13);
    if (nodeHasCM(a3, 16)
      && (*(_QWORD *)a3 ? (v15 = *(_QWORD **)a3) : (v15 = (_QWORD *)a3), ShouldIndent(a1, (uint64_t)v15)))
    {
      if (FindContainer((_QWORD **)a3))
        v12 = v14 + 2;
    }
    else
    {
      v12 = v14 + 2;
    }
  }
  v16 = a3;
  v17 = *(_QWORD *)(a3 + 40);
  v18 = *(unsigned __int8 **)(a4 + 40);
  if (v11)
    v19 = v12;
  else
    v19 = 0;
  v37 = v19;
  v38 = 0;
  if (v11)
  {
    v20 = v16;
    if (nodeIsElement(v16) && v17 != a4)
    {
      a2 += v12;
      PCondFlushLine(a1, a2);
    }
  }
  else
  {
    v20 = v16;
  }
  CheckWrapIndent((_DWORD *)a1, a2);
  if (v8 | v9 || !*(_QWORD *)(a4 + 8))
    goto LABEL_30;
  if (IsScript(a1, v18))
  {
    v21 = *(_DWORD *)(a1 + 448);
    goto LABEL_31;
  }
  v22 = *(int **)(a4 + 8);
  if (!v22)
  {
    if (v36)
    {
LABEL_29:
      v21 = 1;
      goto LABEL_31;
    }
LABEL_30:
    v21 = 0;
    goto LABEL_31;
  }
  v21 = 0;
  v23 = *v22;
  if (v23 != 35 && v23 != 145)
  {
    v21 = 0;
    if (v23 != 9)
    {
      if (v36)
        goto LABEL_29;
    }
  }
LABEL_31:
  v24 = *(_DWORD *)(a1 + 4788);
  if (v17 == a4)
  {
LABEL_36:
    if (v24)
      AddChar(a1 + 4776, 32);
    goto LABEL_41;
  }
  if (*(_QWORD *)(a1 + 128) > (unint64_t)(v24 + a2))
  {
    if ((*(_DWORD *)(a1 + 4804) & 0x80000000) != 0)
      *(_DWORD *)(a1 + 4804) = a2;
    *(_DWORD *)(a1 + 4792) = v24;
    goto LABEL_36;
  }
  if (!*(_DWORD *)(a1 + 4800))
  {
    *(_DWORD *)(a1 + 4816) = a2;
    *(_DWORD *)(a1 + 4800) = 1;
  }
  PFlushLine(a1, a2 + v37);
LABEL_41:
  v25 = *v18;
  if (*v18)
  {
    do
    {
      v38 = v25;
      if ((v25 & 0x80) != 0)
      {
        v18 += GetUTF8((char *)v18, &v38);
        LODWORD(v25) = v38;
      }
      else if (v10)
      {
        LODWORD(v25) = ToUpper(v25);
        v38 = v25;
      }
      AddChar(a1 + 4776, v25);
      v26 = *++v18;
      v25 = v26;
    }
    while (v26);
  }
  CheckWrapIndent((_DWORD *)a1, a2);
  v27 = *(unsigned __int8 **)(a4 + 48);
  if (v27)
  {
    v28 = *(_DWORD *)(a4 + 32);
    v29 = a1;
    v30 = a2;
    v31 = v21;
    v32 = 0;
LABEL_61:
    PPrintAttrValue(v29, v30, v27, v28, v31, v32);
    return;
  }
  v33 = IsBoolAttribute(a4);
  IsEvent = attrIsEvent(a4);
  if (v8)
  {
    if (v33)
      v27 = *(unsigned __int8 **)(a4 + 40);
    else
      v27 = (unsigned __int8 *)&unk_20AB66763;
    v28 = *(_DWORD *)(a4 + 32);
    v29 = a1;
    v30 = a2;
    v31 = 0;
    goto LABEL_60;
  }
  if (!v33 && !IsNewNode(v20))
  {
    v28 = *(_DWORD *)(a4 + 32);
    v27 = (unsigned __int8 *)&unk_20AB66763;
    v29 = a1;
    v30 = a2;
    v31 = 1;
LABEL_60:
    v32 = IsEvent;
    goto LABEL_61;
  }
  v35 = *(_DWORD *)(a1 + 4788);
  if (*(_QWORD *)(a1 + 128) <= (unint64_t)(v35 + a2))
  {
    if (!*(_DWORD *)(a1 + 4800))
    {
      *(_DWORD *)(a1 + 4816) = a2;
      *(_DWORD *)(a1 + 4800) = 1;
    }
  }
  else
  {
    if ((*(_DWORD *)(a1 + 4804) & 0x80000000) != 0)
      *(_DWORD *)(a1 + 4804) = a2;
    *(_DWORD *)(a1 + 4792) = v35;
  }
}

void PPrintAttrValue(uint64_t a1, int a2, unsigned __int8 *a3, int a4, int a5, int a6)
{
  char *v9;
  uint64_t v12;
  uint64_t v13;
  char v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int *v22;
  unsigned int v23;
  uint64_t v24;
  _BOOL4 v25;
  _BOOL4 v26;
  const char *v27;
  int v28;
  int v29;
  unsigned int v30;
  int v31;
  unsigned int v32;
  int v33;
  int v34;
  BOOL v35;
  int v36;
  int v37;
  int v38;
  int *v39;
  int v40;
  int v41;
  unint64_t v42;
  unint64_t v43;
  int v44;
  uint64_t v47;
  int v48;
  int *v49;
  int *v50;
  int v51;
  _BOOL4 v52;
  _BOOL4 v53;
  char v54;
  char *v55;
  int v56;
  unsigned int v57;
  unsigned int v58;

  v9 = (char *)a3;
  v12 = a1 + 4776;
  v13 = *(unsigned int *)(a1 + 448);
  if (a5)
    v14 = 4;
  else
    v14 = 5;
  v54 = v14;
  if (a3)
  {
    if (*a3 == 60)
    {
      v15 = a3[1];
      if (v15 == 37 || v15 == 64 || !tmbstrncmp(a3, "<?php", 5))
        v54 |= 0x10u;
    }
  }
  if (!a4)
    a4 = 34;
  AddChar(v12, 61);
  if (!*(_DWORD *)(a1 + 288) || *(_DWORD *)(a1 + 296))
  {
    v16 = *(_DWORD *)(a1 + 4788);
    if (*(_QWORD *)(a1 + 128) <= (unint64_t)(v16 + a2))
    {
      if (!*(_DWORD *)(a1 + 4800))
      {
        *(_DWORD *)(a1 + 4816) = a2;
        *(_DWORD *)(a1 + 4800) = 1;
      }
    }
    else
    {
      if ((*(_DWORD *)(a1 + 4804) & 0x80000000) != 0)
        *(_DWORD *)(a1 + 4804) = a2;
      *(_DWORD *)(a1 + 4792) = v16;
    }
    CheckWrapIndent((_DWORD *)a1, a2);
  }
  AddChar(v12, a4);
  if (!v9)
    goto LABEL_94;
  v57 = *(_DWORD *)(a1 + 128);
  v22 = (int *)(a1 + 4804);
  v23 = *(_DWORD *)(a1 + 4800);
  v24 = a1 + 4804 + 12 * v23;
  v56 = *(_DWORD *)(a1 + 4788);
  *(_DWORD *)(v24 + 4) = v56;
  *(_DWORD *)(v24 + 8) = -1;
  if (!*v9)
    goto LABEL_93;
  v25 = a4 == 39;
  v26 = a4 == 34;
  v27 = "&#39;";
  if (a4 == 34)
    v27 = "&quot;";
  v55 = (char *)v27;
  if (!a6)
  {
    v26 = 0;
    v25 = 0;
  }
  if (!v13)
  {
    v26 = 0;
    v25 = 0;
  }
  v52 = v25;
  v53 = v26;
  v28 = -1;
  do
  {
    v58 = 0;
    v29 = *v9;
    v30 = (char)v29;
    v58 = (char)v29;
    if (a5 && v29 == 32)
    {
      v31 = *(_DWORD *)(a1 + 4788);
      if (*(_QWORD *)(a1 + 128) <= (unint64_t)(v31 + a2))
      {
        v32 = *(_DWORD *)(a1 + 4800);
        if (!v32)
        {
          *(_DWORD *)(a1 + 4816) = a2;
          *(_DWORD *)(a1 + 4800) = 1;
          v33 = *(_DWORD *)(a1 + 4792);
          v34 = *(_DWORD *)(a1 + 4812);
          v35 = __OFSUB__(v34, v33);
          v36 = v34 - v33;
          if (!((v36 < 0) ^ v35 | (v36 == 0)))
          {
            *(_DWORD *)(a1 + 4824) = v36;
            *(_DWORD *)(a1 + 4812) = -1;
          }
          v37 = *(_DWORD *)(a1 + 4808);
          v35 = __OFSUB__(v37, v33);
          v38 = v37 - v33;
          if (!((v38 < 0) ^ v35 | (v38 == 0)))
          {
            *(_DWORD *)(a1 + 4820) = v38;
            *(_DWORD *)(a1 + 4808) = -1;
          }
          v32 = 1;
        }
      }
      else
      {
        if (*v22 < 0)
          *v22 = a2;
        *(_DWORD *)(a1 + 4792) = v31;
        v32 = *(_DWORD *)(a1 + 4800);
      }
      v39 = &v22[3 * v32];
      v39[1] = v56;
      v39[2] = v28;
    }
    else if (!a5)
    {
      goto LABEL_63;
    }
    if (*(_DWORD *)(a1 + 4792))
    {
      v40 = *(_DWORD *)(a1 + 4804);
      v41 = v40 & ~(v40 >> 31);
      if (v41 + *(_DWORD *)(a1 + 4788) >= v57)
      {
        if (!WantIndent((_DWORD *)a1) || v40 < 1)
          goto LABEL_51;
        do
        {
          WriteChar(32, *(_QWORD *)(a1 + 4840));
          --v41;
        }
        while (v41);
        LODWORD(v42) = *(_DWORD *)(a1 + 4792);
        if ((_DWORD)v42)
        {
LABEL_51:
          v43 = 0;
          do
          {
            WriteChar(*(unsigned int *)(*(_QWORD *)(a1 + 4776) + 4 * v43++), *(_QWORD *)(a1 + 4840));
            v42 = *(unsigned int *)(a1 + 4792);
          }
          while (v43 < v42);
        }
        v44 = *(_DWORD *)(a1 + 4812);
        if (v44 < (int)v42 && v44 > 0 || v44 == 0)
          v47 = 92;
        else
          v47 = 32;
        WriteChar(v47, *(_QWORD *)(a1 + 4840));
        WriteChar(10, *(_QWORD *)(a1 + 4840));
        ResetLineAfterWrap(v12);
        v30 = v58;
      }
    }
LABEL_63:
    if (v30 == a4)
    {
      AddString(v12, v55);
LABEL_86:
      ++v9;
      continue;
    }
    if (v30 == 39)
    {
      if (*(_DWORD *)(a1 + 416))
        AddString(v12, "&#39;");
      else
        AddChar(v12, 39);
      if (!v53)
        goto LABEL_86;
LABEL_82:
      v49 = &v22[3 * *(unsigned int *)(a1 + 4800)];
      v51 = v49[2];
      v50 = v49 + 2;
      if (v51 < 0)
        v28 = *(_DWORD *)(a1 + 4788);
      else
        v28 = -1;
      *v50 = v28;
      goto LABEL_86;
    }
    if (v30 == 34)
    {
      if (*(_DWORD *)(a1 + 416))
        AddString(v12, "&quot;");
      else
        AddChar(v12, 34);
      if (!v52)
        goto LABEL_86;
      goto LABEL_82;
    }
    if (v30 >= 0x80)
    {
      v9 += GetUTF8(v9, (int *)&v58);
      v30 = v58;
    }
    ++v9;
    if (v30 == 10)
    {
      if (v28 < 0)
      {
        if (*(_DWORD *)(a1 + 576))
          v48 = 0;
        else
          v48 = a2;
      }
      else
      {
        v48 = 0;
      }
      PFlushLine(a1, v48);
    }
    else
    {
      PPrintChar(a1, v30, v54, v17, v18, v19, v20, v21);
    }
  }
  while (*v9);
  v23 = *(_DWORD *)(a1 + 4800);
LABEL_93:
  *(_QWORD *)&v22[3 * v23 + 1] = -1;
LABEL_94:
  AddChar(v12, a4);
}

uint64_t AfterSpace(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v4;
  uint64_t v5;
  uint64_t result;
  unsigned int v7;
  unsigned int v8;
  char *v9;
  int v10;
  _DWORD *v12;
  int v13;

  v2 = a2;
  v4 = nodeCMIsEmpty(a2);
  while (1)
  {
    if (!nodeCMIsInline(v2))
      return 1;
    v5 = *(_QWORD *)(v2 + 8);
    if (v5)
      break;
    if (v4)
    {
      result = nodeCMIsInline(*(_QWORD *)v2);
      if (!(_DWORD)result)
        return result;
    }
    v2 = *(_QWORD *)v2;
  }
  if (nodeIsText(*(_QWORD *)(v2 + 8)) && (v8 = *(_DWORD *)(v5 + 72), v7 = *(_DWORD *)(v5 + 76), v7 > v8))
  {
    v13 = 0;
    do
    {
      v9 = (char *)(*(_QWORD *)(a1 + 104) + v8);
      v10 = *v9;
      v13 = *v9;
      if (v10 < 0)
      {
        v8 += GetUTF8(v9, &v13);
        v7 = *(_DWORD *)(v5 + 76);
      }
      ++v8;
    }
    while (v8 < v7);
    return v13 == 32 || v13 == 10;
  }
  else
  {
    v12 = *(_DWORD **)(v5 + 56);
    return v12 && *v12 == 17;
  }
}

void *StdErrOutput()
{
  if (!qword_253EBD7C0)
    qword_253EBD7C0 = *MEMORY[0x24BDAC8D8];
  return &stderrStreamOut;
}

void ReleaseStreamOut(FILE **a1)
{
  if (a1 != (FILE **)&stdoutStreamOut && a1 != 0 && a1 != (FILE **)&stderrStreamOut)
  {
    if (!*((_DWORD *)a1 + 3))
      fclose(a1[2]);
    MemFree(a1);
  }
}

_DWORD *initStreamIn(uint64_t a1, int a2)
{
  _DWORD *v4;

  v4 = MemAlloc(0x58uLL);
  ClearMemory(v4, 0x58uLL);
  *((_QWORD *)v4 + 4) = 0x100000001;
  v4[10] = a2;
  *v4 = 0;
  *((_QWORD *)v4 + 10) = a1;
  v4[5] = 5;
  *((_QWORD *)v4 + 1) = MemAlloc(0x14uLL);
  return v4;
}

void freeStreamIn(void **a1)
{
  MemFree(a1[1]);
  MemFree(a1);
}

void **FileInput(uint64_t a1, uint64_t a2, int a3)
{
  void **inited;

  inited = (void **)initStreamIn(a1, a3);
  if (initFileSource(inited + 6, a2))
  {
    MemFree(inited[1]);
    MemFree(inited);
    return 0;
  }
  else
  {
    *((_DWORD *)inited + 11) = 0;
  }
  return inited;
}

_DWORD *BufferInput(uint64_t a1, TidyBuffer *a2, int a3)
{
  _DWORD *inited;

  inited = initStreamIn(a1, a3);
  tidyInitInputBuffer((TidyInputSource *)(inited + 12), a2);
  inited[11] = 1;
  return inited;
}

__n128 UserInput(uint64_t a1, uint64_t a2, int a3)
{
  _DWORD *inited;
  __n128 result;

  inited = initStreamIn(a1, a3);
  result = *(__n128 *)(a2 + 16);
  *((_OWORD *)inited + 3) = *(_OWORD *)a2;
  *((__n128 *)inited + 4) = result;
  inited[11] = 2;
  return result;
}

uint64_t ReadBOMEncoding(uint64_t a1)
{
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  int v10;

  v2 = (*(uint64_t (**)(_QWORD))(a1 + 56))(*(_QWORD *)(a1 + 48));
  if (v2 == -1)
    return 0xFFFFFFFFLL;
  v3 = v2;
  v4 = (*(uint64_t (**)(_QWORD))(a1 + 56))(*(_QWORD *)(a1 + 48));
  if (v4 == -1)
  {
LABEL_17:
    (*(void (**)(_QWORD, _QWORD))(a1 + 64))(*(_QWORD *)(a1 + 48), v3);
    return 0xFFFFFFFFLL;
  }
  v5 = v4;
  v6 = v4 + (v3 << 8);
  if (v6 == 65534)
  {
    if ((*(_DWORD *)(a1 + 40) | 2) == 0xB)
      return 9;
    v9 = *(_QWORD *)(a1 + 80);
    v7 = 9;
    v10 = 9;
LABEL_21:
    ReportEncodingWarning(v9, 80, v10);
    return v7;
  }
  if (v6 != 65279)
  {
    v8 = (*(uint64_t (**)(_QWORD))(a1 + 56))(*(_QWORD *)(a1 + 48));
    if (v8 != -1)
    {
      if ((v5 << 8) + (v3 << 16) + v8 == 15711167)
      {
        if (*(_DWORD *)(a1 + 40) == 4)
          return 4;
        v9 = *(_QWORD *)(a1 + 80);
        v7 = 4;
        v10 = 4;
        goto LABEL_21;
      }
      (*(void (**)(_QWORD, _QWORD))(a1 + 64))(*(_QWORD *)(a1 + 48), v8);
    }
    (*(void (**)(_QWORD, _QWORD))(a1 + 64))(*(_QWORD *)(a1 + 48), v5);
    goto LABEL_17;
  }
  if ((*(_DWORD *)(a1 + 40) & 0xFFFFFFFE) != 0xA)
  {
    v9 = *(_QWORD *)(a1 + 80);
    v7 = 10;
    v10 = 10;
    goto LABEL_21;
  }
  return 10;
}

uint64_t ReadChar(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v9;
  int v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  int v16;
  uint64_t v17;
  _BOOL4 valid;
  int v19;
  unsigned int *v20;
  uint64_t v21;
  int32x2_t *v22;
  unsigned int v23;
  uint64_t v24;
  unint64_t v25;
  int v26;
  int v27;
  BOOL v28;
  int v29;
  void *CharFromStream;
  int v31;
  int v32;
  int v33;
  unsigned int v34;

  v9 = *(_DWORD *)(*(_QWORD *)(a1 + 80) + 136);
  v10 = *(_DWORD *)(a1 + 4);
  if (!v10)
  {
    v26 = *(_DWORD *)(a1 + 32);
    *(_DWORD *)(a1 + 28) = v26;
    v27 = *(_DWORD *)(a1 + 24);
    v28 = __OFSUB__(v27, 1);
    v29 = v27 - 1;
    if (v29 < 0 == v28)
    {
      *(_DWORD *)(a1 + 32) = v26 + 1;
      *(_DWORD *)(a1 + 24) = v29;
      return 32;
    }
  }
  if (!v10)
    goto LABEL_7;
LABEL_3:
  v11 = *(_QWORD *)(a1 + 8);
  v12 = *(_DWORD *)(a1 + 16) - 1;
  *(_DWORD *)(a1 + 16) = v12;
  v13 = *(unsigned int *)(v11 + 4 * v12);
  if (!v12)
    *(_DWORD *)(a1 + 4) = 0;
  if ((_DWORD)v13 == 10)
  {
    v32 = *(_DWORD *)(a1 + 36) + 1;
LABEL_65:
    *(_DWORD *)(a1 + 32) = 1;
    *(_DWORD *)(a1 + 36) = v32 + 1;
    return 10;
  }
  ++*(_DWORD *)(a1 + 32);
  while ((int)v13 > 9)
  {
    switch((_DWORD)v13)
    {
      case 0x1B:
        return v13;
      case 0xD:
        CharFromStream = (void *)ReadCharFromStream(a1);
        if ((_DWORD)CharFromStream != 10)
          UngetChar(CharFromStream, a1);
        v31 = *(_DWORD *)(a1 + 36) + 1;
        *(_DWORD *)(a1 + 32) = 1;
        *(_DWORD *)(a1 + 36) = v31;
        return 10;
      case 0xA:
        v32 = *(_DWORD *)(a1 + 36);
        goto LABEL_65;
    }
LABEL_15:
    if (v13 <= 0x1F)
      goto LABEL_49;
    v14 = *(_DWORD *)(a1 + 40);
    if (v14 - 9 < 3)
    {
      if (!IsValidUTF16FromUCS4(v13))
        goto LABEL_29;
      if (IsLowSurrogate(v13))
      {
        v15 = ReadCharFromStream(a1);
        if (v15 == -1)
          return 0xFFFFFFFFLL;
        v16 = v15;
        if (!IsHighSurrogate(v15))
        {
          v13 = 0;
          goto LABEL_29;
        }
        v17 = CombineSurrogatePair(v16, v13);
        valid = IsValidCombinedChar(v17);
        v13 = 0;
        if (!(_DWORD)v17 || !valid)
        {
LABEL_29:
          ReportEncodingError(*(_QWORD *)(a1 + 80), 79, v13, 1, a5, a6, a7, a8);
          v17 = 0;
        }
      }
      else
      {
        v17 = v13;
      }
      v14 = *(_DWORD *)(a1 + 40);
      v13 = v17;
      goto LABEL_31;
    }
    if (v14 <= 0xD && ((1 << v14) & 0x3031) != 0)
    {
      ++*(_DWORD *)(a1 + 32);
      return v13;
    }
LABEL_31:
    if (v14 == 2)
    {
      if ((v13 - 160) > 0x1E)
        goto LABEL_41;
      if ((int)v13 > 179)
      {
        switch((int)v13)
        {
          case 180:
            v24 = 381;
            goto LABEL_79;
          case 184:
            v24 = 382;
            goto LABEL_79;
          case 188:
            v24 = 338;
            goto LABEL_79;
          case 189:
            v24 = 339;
            goto LABEL_79;
          case 190:
            v24 = 376;
            goto LABEL_79;
          default:
            goto LABEL_41;
        }
      }
      switch((_DWORD)v13)
      {
        case 0xA4:
          v24 = 8364;
          goto LABEL_79;
        case 0xA6:
          v24 = 352;
          goto LABEL_79;
        case 0xA8:
          v24 = 353;
LABEL_79:
          ++*(_DWORD *)(a1 + 32);
          return v24;
      }
    }
    else
    {
      if (v14 == 8)
      {
        v19 = v13 & 0xFFFFFF80;
        v20 = IBM2Unicode;
      }
      else
      {
        if (v14 != 6)
          goto LABEL_41;
        v19 = v13 & 0xFFFFFF80;
        v20 = Mac2Unicode;
      }
      if (v19 == 128)
        v13 = v20[(v13 - 128)];
    }
LABEL_41:
    if ((v13 & 0xFFFFFFE0) == 0x80)
    {
      v21 = *(_QWORD *)(a1 + 80);
      v22 = *(int32x2_t **)(v21 + 104);
      if (v22)
        *v22 = vrev64_s32(*(int32x2_t *)(a1 + 32));
      v23 = v14 & 0xFFFFFFFE;
      v24 = Win2Unicode[(v13 - 128)];
      v25 = (0x2001A002uLL >> v13) & 1;
      if (v23 == 6 && v25)
      {
        ReportEncodingError(v21, 76, v13, 1, a5, a6, a7, a8);
        goto LABEL_49;
      }
      if (v23 != 6)
        ReportEncodingError(v21, 77, v13, v25, a5, a6, a7, a8);
    }
    else
    {
      v24 = v13;
    }
    if ((_DWORD)v24)
      goto LABEL_79;
LABEL_49:
    if (*(_DWORD *)(a1 + 4))
      goto LABEL_3;
LABEL_7:
    v13 = ReadCharFromStream(a1);
  }
  if ((_DWORD)v13 == -1)
    return v13;
  if ((_DWORD)v13 != 9)
    goto LABEL_15;
  v33 = *(_DWORD *)(a1 + 32);
  if (v9)
    v34 = ~((v33 - 1) % v9) + v9;
  else
    v34 = 0;
  *(_DWORD *)(a1 + 24) = v34;
  *(_DWORD *)(a1 + 32) = v33 + 1;
  return 32;
}

uint64_t ReadCharFromStream(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v5;
  int v6;
  int v7;
  BOOL v8;
  unsigned int v9;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t v21;

  v2 = (_QWORD *)(a1 + 48);
  if ((*(unsigned int (**)(_QWORD))(a1 + 72))(*(_QWORD *)(a1 + 48)))
    return 0xFFFFFFFFLL;
  v5 = (*(uint64_t (**)(_QWORD))(a1 + 56))(*(_QWORD *)(a1 + 48));
  v3 = v5;
  if ((_DWORD)v5 != -1)
  {
    v6 = *(_DWORD *)(a1 + 40);
    switch(v6)
    {
      case 4:
        v21 = 0;
        v11 = DecodeUTF8BytesToChar((unsigned int *)&v21 + 1, v5, 0, v2, (int *)&v21);
        if ((_DWORD)v21 == 1 && HIDWORD(v21) == -1 && v11 == 0)
          v3 = 0xFFFFFFFFLL;
        else
          v3 = HIDWORD(v21);
        if (v11)
        {
          v18 = *(_QWORD *)(a1 + 80);
          **(int32x2_t **)(v18 + 104) = vrev64_s32(*(int32x2_t *)(a1 + 32));
          ReportEncodingError(v18, 78, HIDWORD(v21), 0, v12, v13, v14, v15);
          return 65533;
        }
        return v3;
      case 5:
        if ((_DWORD)v5 != 27)
        {
          switch(*(_DWORD *)a1)
          {
            case 1:
              if ((_DWORD)v5 == 40)
              {
                v19 = 4;
              }
              else
              {
                if ((_DWORD)v5 != 36)
                  goto LABEL_34;
                v19 = 2;
              }
              goto LABEL_39;
            case 2:
              if ((_DWORD)v5 != 40)
                goto LABEL_38;
              v19 = 3;
              goto LABEL_39;
            case 3:
LABEL_38:
              v19 = 5;
              goto LABEL_39;
            case 4:
LABEL_34:
              *(_DWORD *)a1 = 0;
              return v3;
            case 5:
              return v5 | 0x80;
            default:
              return v3;
          }
        }
        v19 = 1;
LABEL_39:
        *(_DWORD *)a1 = v19;
        return v3;
      case 9:
        v20 = (*(uint64_t (**)(_QWORD))(a1 + 56))(*(_QWORD *)(a1 + 48));
        v8 = v20 == -1;
        v9 = v3 + (v20 << 8);
        goto LABEL_27;
      case 10:
      case 11:
        goto LABEL_6;
      case 12:
      case 13:
        if (v5 >= 0x80 && ((v5 - 161) > 0x3E || v6 != 13))
        {
LABEL_6:
          v7 = (*(uint64_t (**)(_QWORD))(a1 + 56))(*(_QWORD *)(a1 + 48));
          v8 = v7 == -1;
          v9 = v7 + ((_DWORD)v3 << 8);
LABEL_27:
          if (v8)
            v3 = 0xFFFFFFFFLL;
          else
            v3 = v9;
        }
        break;
      default:
        return v3;
    }
  }
  return v3;
}

void *UngetChar(void *result, uint64_t a2)
{
  int v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;

  if ((_DWORD)result != -1)
  {
    v3 = (int)result;
    *(_DWORD *)(a2 + 4) = 1;
    v4 = *(_DWORD *)(a2 + 16);
    v5 = *(_DWORD *)(a2 + 20);
    v6 = v4 + 1;
    result = *(void **)(a2 + 8);
    if (v4 + 1 >= v5)
    {
      *(_DWORD *)(a2 + 20) = v5 + 1;
      result = MemRealloc(result, 4 * (v5 + 1));
      *(_QWORD *)(a2 + 8) = result;
      v4 = *(_DWORD *)(a2 + 16);
      v6 = v4 + 1;
    }
    *(_DWORD *)(a2 + 16) = v6;
    *((_DWORD *)result + v4) = v3;
    if (v3 == 10)
      --*(_DWORD *)(a2 + 36);
    *(_DWORD *)(a2 + 32) = *(_DWORD *)(a2 + 28);
  }
  return result;
}

uint64_t DecodeMacRoman(uint64_t result)
{
  if ((result & 0xFFFFFF80) == 0x80)
    return Mac2Unicode[(result - 128)];
  return result;
}

uint64_t DecodeWin1252(uint64_t result)
{
  if ((result & 0xFFFFFFE0) == 0x80)
    return Win2Unicode[(result - 128)];
  return result;
}

_DWORD *FileOutput(uint64_t a1, int a2, int a3)
{
  _DWORD *v6;

  v6 = MemAlloc(0x20uLL);
  ClearMemory(v6, 0x20uLL);
  *v6 = a2;
  v6[1] = 0;
  v6[2] = a3;
  initFileSink((_QWORD *)v6 + 2, a1);
  v6[3] = 0;
  return v6;
}

TidyOutputSink *BufferOutput(TidyBuffer *a1, int a2, int a3)
{
  TidyOutputSink *v6;

  v6 = (TidyOutputSink *)MemAlloc(0x20uLL);
  ClearMemory(v6, 0x20uLL);
  LODWORD(v6->sinkData) = a2;
  HIDWORD(v6->sinkData) = 0;
  LODWORD(v6->putByte) = a3;
  tidyInitOutputBuffer(v6 + 1, a1);
  HIDWORD(v6->putByte) = 1;
  return v6;
}

_DWORD *UserOutput(_OWORD *a1, int a2, int a3)
{
  _DWORD *v6;

  v6 = MemAlloc(0x20uLL);
  ClearMemory(v6, 0x20uLL);
  *v6 = a2;
  v6[1] = 0;
  v6[2] = a3;
  *((_OWORD *)v6 + 1) = *a1;
  v6[3] = 2;
  return v6;
}

uint64_t WriteChar(uint64_t result, uint64_t a2)
{
  int v3;
  int v4;
  uint64_t v5;
  char v6;
  unsigned __int8 v7;
  char v8;
  char v9;
  char v10;
  char v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  int v16;
  uint64_t v17;
  uint64_t v18;
  int *v19;
  unsigned int v20;
  unsigned int v21;
  int v22;
  int v23;
  uint64_t v24;

  v3 = result;
  v24 = *MEMORY[0x24BDAC8D0];
  if ((_DWORD)result == 10)
  {
    v4 = *(_DWORD *)(a2 + 8);
    if (v4 == 2)
    {
      v3 = 13;
    }
    else
    {
      if (v4 == 1)
        result = WriteChar(13, a2);
      v3 = 10;
    }
  }
  switch(*(_DWORD *)a2)
  {
    case 2:
      if (v3 == 8364)
        v6 = -92;
      else
        v6 = v3;
      if (v3 == 382)
        v7 = -72;
      else
        v7 = v6;
      if (v3 == 381)
        v8 = -76;
      else
        v8 = v3;
      if (v3 == 376)
        v9 = -66;
      else
        v9 = v8;
      if (v3 <= 381)
        v7 = v9;
      if (v3 == 353)
        v10 = -88;
      else
        v10 = v3;
      if (v3 == 352)
        v11 = -90;
      else
        v11 = v10;
      if (v3 == 339)
        v12 = -67;
      else
        v12 = v3;
      if (v3 == 338)
        v13 = -68;
      else
        v13 = v12;
      if (v3 <= 351)
        v11 = v13;
      if (v3 <= 375)
        v7 = v11;
      v14 = *(_QWORD *)(a2 + 16);
      v15 = *(uint64_t (**)(uint64_t, uint64_t))(a2 + 24);
      goto LABEL_66;
    case 4:
      v22 = 0;
      result = EncodeCharToUTF8Bytes(v3, 0, a2 + 16, &v22);
      if (v22 <= 0)
      {
        (*(void (**)(_QWORD, uint64_t))(a2 + 24))(*(_QWORD *)(a2 + 16), 239);
        (*(void (**)(_QWORD, uint64_t))(a2 + 24))(*(_QWORD *)(a2 + 16), 191);
        return (*(uint64_t (**)(_QWORD, uint64_t))(a2 + 24))(*(_QWORD *)(a2 + 16), 191);
      }
      return result;
    case 5:
      if (v3 != 27)
      {
        switch(*(_DWORD *)(a2 + 4))
        {
          case 1:
            if (v3 == 40)
            {
              v16 = 4;
            }
            else
            {
              if (v3 != 36)
                goto LABEL_80;
              v16 = 2;
            }
            goto LABEL_84;
          case 2:
            if (v3 != 40)
              goto LABEL_83;
            v16 = 3;
            goto LABEL_84;
          case 3:
LABEL_83:
            v16 = 5;
            goto LABEL_84;
          case 4:
LABEL_80:
            *(_DWORD *)(a2 + 4) = 0;
            goto LABEL_85;
          case 5:
            LOBYTE(v3) = v3 & 0x7F;
            goto LABEL_85;
          default:
            goto LABEL_85;
        }
      }
      v16 = 1;
LABEL_84:
      *(_DWORD *)(a2 + 4) = v16;
      goto LABEL_85;
    case 6:
      if (v3 < 0x80)
        goto LABEL_85;
      v17 = 0;
      while (Mac2Unicode[v17] != v3)
      {
        if (++v17 == 128)
          return result;
      }
      goto LABEL_65;
    case 7:
      if (v3 < 0x80 || (v3 - 160) < 0x60)
        goto LABEL_85;
      v17 = 0;
      while (Win2Unicode[v17] != v3)
      {
        if (++v17 == 32)
          return result;
      }
      goto LABEL_65;
    case 8:
      if (v3 < 0x80)
        goto LABEL_85;
      v17 = 0;
      while (IBM2Unicode[v17] != v3)
      {
        if (++v17 == 128)
          return result;
      }
LABEL_65:
      v14 = *(_QWORD *)(a2 + 16);
      v15 = *(uint64_t (**)(uint64_t, uint64_t))(a2 + 24);
      v7 = v17 + 0x80;
LABEL_66:
      v18 = v7;
      return v15(v14, v18);
    case 9:
    case 0xA:
    case 0xB:
      result = IsValidUTF16FromUCS4(v3);
      if (!(_DWORD)result)
        return result;
      result = IsCombinedChar(v3);
      if ((_DWORD)result)
      {
        result = SplitSurrogatePair(v3, &v22, &v23);
        if (!(_DWORD)result)
          return result;
        v5 = 2;
      }
      else
      {
        v22 = v3;
        v5 = 1;
      }
      v19 = &v22;
      break;
    case 0xC:
    case 0xD:
      if (v3 > 0x7F)
        (*(void (**)(_QWORD, _QWORD))(a2 + 24))(*(_QWORD *)(a2 + 16), BYTE1(v3));
      goto LABEL_85;
    default:
LABEL_85:
      v14 = *(_QWORD *)(a2 + 16);
      v15 = *(uint64_t (**)(uint64_t, uint64_t))(a2 + 24);
      v18 = v3;
      return v15(v14, v18);
  }
  do
  {
    v21 = *v19++;
    v20 = v21;
    if ((*(_DWORD *)a2 - 10) >= 2)
    {
      if (*(_DWORD *)a2 != 9)
        goto LABEL_74;
      (*(void (**)(_QWORD, _QWORD))(a2 + 24))(*(_QWORD *)(a2 + 16), v20);
      v20 >>= 8;
    }
    else
    {
      (*(void (**)(_QWORD, _QWORD))(a2 + 24))(*(_QWORD *)(a2 + 16), BYTE1(v20));
    }
    result = (*(uint64_t (**)(_QWORD, _QWORD))(a2 + 24))(*(_QWORD *)(a2 + 16), v20);
LABEL_74:
    --v5;
  }
  while (v5);
  return result;
}

Bool tidyInitSource(TidyInputSource *source, void *srcData, TidyGetByteFunc gbFunc, TidyUngetByteFunc ugbFunc, TidyEOFFunc endFunc)
{
  BOOL v5;
  BOOL v8;
  Bool v9;

  if (source)
    v5 = srcData == 0;
  else
    v5 = 1;
  v8 = v5 || gbFunc == 0 || ugbFunc == 0 || endFunc == 0;
  v9 = !v8;
  if (!v8)
  {
    source->sourceData = srcData;
    source->getByte = gbFunc;
    source->ungetByte = ugbFunc;
    source->eof = endFunc;
  }
  return v9;
}

Bool tidyInitSink(TidyOutputSink *sink, void *snkData, TidyPutByteFunc pbFunc)
{
  BOOL v3;
  BOOL v4;
  Bool v5;

  if (sink)
    v3 = snkData == 0;
  else
    v3 = 1;
  v4 = v3 || pbFunc == 0;
  v5 = !v4;
  if (!v4)
  {
    sink->sinkData = snkData;
    sink->putByte = pbFunc;
  }
  return v5;
}

uint tidyGetByte(TidyInputSource *source)
{
  return ((uint64_t (*)(void *))source->getByte)(source->sourceData);
}

Bool tidyIsEOF(TidyInputSource *source)
{
  return ((unsigned int (*)(void *))source->eof)(source->sourceData);
}

void tidyUngetByte(TidyInputSource *source, uint byteValue)
{
  ((void (*)(void *, _QWORD))source->ungetByte)(source->sourceData, byteValue);
}

void tidyPutByte(TidyOutputSink *sink, uint byteValue)
{
  ((void (*)(void *, _QWORD))sink->putByte)(sink->sinkData, byteValue);
}

uint64_t IsEOF(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(a1 + 72))(*(_QWORD *)(a1 + 48));
}

_DWORD *outBOM(_DWORD *result)
{
  if (*result <= 0xBu && ((1 << *result) & 0xE10) != 0)
    return (_DWORD *)WriteChar(65279, (uint64_t)result);
  return result;
}

uint64_t GetEncodingNameFromTidyId(int a1)
{
  uint64_t v1;

  v1 = 0;
  while (enc2iana[v1] != a1)
  {
    v1 += 6;
    if ((_DWORD)(v1 * 4) == 288)
      return 0;
  }
  return *(_QWORD *)&enc2iana[v1 + 2];
}

uint64_t GetEncodingOptNameFromTidyId(int a1)
{
  uint64_t v1;

  v1 = 0;
  while (enc2iana[v1] != a1)
  {
    v1 += 6;
    if (v1 == 84)
      return 0;
  }
  return *(_QWORD *)&enc2iana[v1 + 4];
}

uint64_t GetCharEncodingFromOptName(char *a1)
{
  uint64_t v2;

  v2 = 0;
  while (tmbstrcasecmp(a1, *(char **)&enc2iana[v2 + 4]))
  {
    v2 += 6;
    if (v2 == 84)
      return 0xFFFFFFFFLL;
  }
  return enc2iana[v2];
}

Bool tidyNodeIsHTML(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 48;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsHEAD(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 46;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsTITLE(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 111;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsBASE(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 9;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsMETA(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 67;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsBODY(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 16;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsFRAMESET(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 39;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsFRAME(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 38;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsIFRAME(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 50;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsNOFRAMES(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 71;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsHR(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 47;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsH1(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 40;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsH2(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 41;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsPRE(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 82;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsLISTING(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 63;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsP(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 79;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsUL(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 115;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsOL(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 76;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsDL(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 31;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsDIR(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 29;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsLI(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 61;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsDT(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 32;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsDD(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 26;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsTABLE(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 104;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsCAPTION(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 19;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsTD(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 106;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsTH(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 109;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsTR(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 112;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsCOL(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 23;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsCOLGROUP(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 24;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsBR(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 17;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsA(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 1;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsLINK(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 62;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsB(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 8;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsI(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 49;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsSTRONG(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 100;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsEM(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 33;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsBIG(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 13;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsSMALL(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 96;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsPARAM(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 80;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsOPTION(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 78;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsOPTGROUP(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 77;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsIMG(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 52;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsMAP(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 64;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsAREA(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 7;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsNOBR(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 69;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsWBR(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 117;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsFONT(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 36;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsLAYER(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 59;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsSPACER(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 97;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsCENTER(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 20;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsSTYLE(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 101;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsSCRIPT(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 92;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsNOSCRIPT(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 74;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsFORM(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 37;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsTEXTAREA(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 107;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsBLOCKQUOTE(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 15;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsAPPLET(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 6;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsOBJECT(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 75;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsDIV(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 30;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsSPAN(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 98;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsINPUT(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 53;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsQ(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 83;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsLABEL(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 58;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsH3(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 42;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsH4(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 43;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsH5(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 44;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsH6(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 45;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsADDRESS(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 4;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsXMP(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 118;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsSELECT(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 93;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsBLINK(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 14;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsMARQUEE(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 65;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsEMBED(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 34;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsBASEFONT(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 10;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsISINDEX(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 55;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsS(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 90;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsSTRIKE(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 99;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsU(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 114;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

Bool tidyNodeIsMENU(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1 == 66;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

int *FindTag(uint64_t a1, uint64_t a2)
{
  int *result;
  unsigned __int8 *v4;

  if (*(_DWORD *)(a1 + 280))
  {
    result = *(int **)(a1 + 1568);
LABEL_3:
    *(_QWORD *)(a2 + 56) = result;
    return (int *)1;
  }
  v4 = *(unsigned __int8 **)(a2 + 64);
  if (!v4)
    return 0;
  result = lookup_0(a1 + 1568, v4);
  if (result)
    goto LABEL_3;
  return result;
}

int *lookup_0(uint64_t a1, unsigned __int8 *a2)
{
  signed __int8 v4;
  unsigned int v5;
  unsigned __int8 *v6;
  int v7;
  uint64_t v8;
  int *v9;
  _QWORD *v10;

  if (!a2)
    return 0;
  v4 = *a2;
  if (*a2)
  {
    v5 = 0;
    v6 = a2 + 1;
    do
    {
      v5 = 31 * v5 + v4;
      v7 = *v6++;
      v4 = v7;
    }
    while (v7);
    v8 = v5 % 0xB2;
  }
  else
  {
    v8 = 0;
  }
  v10 = *(_QWORD **)(a1 + 8 * v8 + 16);
  if (v10)
  {
    while (*v10)
    {
      if (!tmbstrcmp(a2, *(unsigned __int8 **)(*v10 + 8)))
        return (int *)*v10;
      v10 = (_QWORD *)v10[1];
      if (!v10)
        break;
    }
  }
  v9 = &dword_24C377808;
  while (tmbstrcmp(a2, *((unsigned __int8 **)v9 + 1)))
  {
    v9 += 16;
    if (v9 >= dword_24C3795C8)
    {
      v9 = *(int **)(a1 + 8);
      if (!v9)
        return v9;
      while (tmbstrcmp(a2, *((unsigned __int8 **)v9 + 1)))
      {
        v9 = (int *)*((_QWORD *)v9 + 7);
        if (!v9)
          return v9;
      }
      break;
    }
  }
  install(a1, (uint64_t)v9);
  return v9;
}

int *LookupTagDef(int a1)
{
  int *result;

  result = &dword_24C377808;
  while (*result != a1)
  {
    result += 16;
    if (result >= dword_24C3795C8)
      return 0;
  }
  return result;
}

int *FindParser(uint64_t a1, uint64_t a2)
{
  int *result;

  result = lookup_0(a1 + 1568, *(unsigned __int8 **)(a2 + 64));
  if (result)
    return (int *)*((_QWORD *)result + 5);
  return result;
}

_DWORD *DefineTag(_DWORD *result, int a2, unsigned __int8 *a3)
{
  int v3;
  _DWORD *v5;
  uint64_t v6;
  int v7;
  _DWORD *v8;

  v3 = a2 - 1;
  if ((a2 - 1) <= 7 && ((0x8Bu >> v3) & 1) != 0 && a3)
  {
    v5 = result;
    v6 = (uint64_t)*(&off_24C37C640 + v3);
    v7 = dword_20AB65D90[v3];
    result = lookup_0((uint64_t)(result + 392), a3);
    v8 = result;
    if (!result)
    {
      v8 = MemAlloc(0x40uLL);
      ClearMemory(v8, 0x40uLL);
      result = tmbstrdup(a3);
      *((_QWORD *)v8 + 1) = result;
      *((_QWORD *)v8 + 7) = *((_QWORD *)v5 + 197);
      *((_QWORD *)v5 + 197) = v8;
    }
    if (!*v8)
    {
      v8[4] = 57344;
      v8[8] |= v7;
      *((_QWORD *)v8 + 5) = v6;
      *((_QWORD *)v8 + 6) = 0;
      *((_QWORD *)v8 + 3) = 0;
    }
  }
  return result;
}

uint64_t GetDeclaredTagList(uint64_t a1)
{
  return *(_QWORD *)(a1 + 1576);
}

uint64_t GetNextDeclaredTag(uint64_t a1, int a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a3;
  if (*a3)
  {
    do
    {
      result = 0;
      switch(a2)
      {
        case 1:
          if ((*(_BYTE *)(v3 + 32) & 1) == 0)
            goto LABEL_12;
          goto LABEL_13;
        case 2:
          if ((*(_BYTE *)(v3 + 32) & 0x10) != 0)
            goto LABEL_13;
          goto LABEL_12;
        case 4:
          if ((*(_BYTE *)(v3 + 32) & 8) != 0
            && *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 40) == ParseBlock)
          {
            goto LABEL_13;
          }
          goto LABEL_12;
        case 8:
          if ((*(_BYTE *)(v3 + 32) & 8) != 0 && *(uint64_t (**)(uint64_t, uint64_t))(v3 + 40) == ParsePre)
LABEL_13:
            result = *(_QWORD *)(v3 + 8);
          else
LABEL_12:
            result = 0;
          break;
        default:
          break;
      }
      v3 = *(_QWORD *)(v3 + 56);
    }
    while (!result && v3);
  }
  else
  {
    result = 0;
  }
  *a3 = v3;
  return result;
}

void InitTags(uint64_t a1)
{
  void *v2;

  ClearMemory((void *)(a1 + 1568), 0x5A0uLL);
  v2 = MemAlloc(0x40uLL);
  ClearMemory(v2, 0x40uLL);
  *((_QWORD *)v2 + 1) = 0;
  *((_DWORD *)v2 + 4) = 0x10000;
  *((_DWORD *)v2 + 8) = 8;
  *((_QWORD *)v2 + 3) = 0;
  *((_QWORD *)v2 + 5) = 0;
  *((_QWORD *)v2 + 6) = 0;
  *(_QWORD *)(a1 + 1568) = v2;
}

void FreeDeclaredTags(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unsigned __int8 *v10;
  signed __int8 v11;
  unsigned int v12;
  unsigned __int8 *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  int v22;
  _QWORD *v23;
  _QWORD *v24;

  v2 = *(_QWORD *)(a1 + 1576);
  if (v2)
  {
    v4 = 0;
    v5 = (_QWORD *)(a1 + 1576);
    v6 = a2 - 1;
    do
    {
      while (1)
      {
        v7 = v2;
        v2 = *(_QWORD *)(v2 + 56);
        switch(v6)
        {
          case 0:
            if ((*(_BYTE *)(v7 + 32) & 1) == 0)
              goto LABEL_13;
            goto LABEL_15;
          case 1:
            if ((*(_BYTE *)(v7 + 32) & 0x10) != 0)
              goto LABEL_15;
            goto LABEL_13;
          case 3:
            if ((*(_BYTE *)(v7 + 32) & 8) == 0)
              goto LABEL_13;
            v8 = *(void **)(v7 + 40);
            v9 = ParseBlock;
            break;
          case 7:
            if ((*(_BYTE *)(v7 + 32) & 8) == 0)
              goto LABEL_13;
            v8 = *(void **)(v7 + 40);
            v9 = ParsePre;
            break;
          default:
            goto LABEL_15;
        }
        if (v8 == v9)
          break;
LABEL_13:
        v4 = v7;
        if (!v2)
          return;
      }
LABEL_15:
      v10 = *(unsigned __int8 **)(v7 + 8);
      v11 = *v10;
      if (*v10)
      {
        v12 = 0;
        v13 = v10 + 1;
        do
        {
          v12 = 31 * v12 + v11;
          v14 = *v13++;
          v11 = v14;
        }
        while (v14);
        v15 = v12 % 0xB2;
      }
      else
      {
        v15 = 0;
      }
      v16 = a1 + 8 * v15;
      v17 = *(_QWORD **)(v16 + 1584);
      if (v17)
      {
        v18 = 0;
        v19 = (_QWORD *)(v16 + 1584);
        do
        {
          v20 = v17;
          v21 = *v17;
          if (!v21)
            break;
          v22 = tmbstrcmp(v10, *(unsigned __int8 **)(v21 + 8));
          v17 = (_QWORD *)v20[1];
          if (!v22)
          {
            v23 = v18 + 1;
            if (!v18)
              v23 = v19;
            *v23 = v17;
            MemFree(v20);
            break;
          }
          v18 = v20;
        }
        while (v17);
      }
      MemFree(*(void **)(v7 + 8));
      MemFree((void *)v7);
      v24 = (_QWORD *)(v4 + 56);
      if (!v4)
        v24 = v5;
      *v24 = v2;
    }
    while (v2);
  }
}

void FreeTags(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  for (i = 0; i != 178; ++i)
  {
    v3 = a1 + 8 * i;
    v4 = *(_QWORD **)(v3 + 1584);
    if (v4)
    {
      do
      {
        v5 = (_QWORD *)v4[1];
        MemFree(v4);
        v4 = v5;
      }
      while (v5);
    }
    *(_QWORD *)(v3 + 1584) = 0;
  }
  FreeDeclaredTags(a1, 0);
  MemFree(*(void **)(a1 + 1568));
  ClearMemory((void *)(a1 + 1568), 0x5A0uLL);
}

uint64_t CheckAttributes(uint64_t result, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v4;
  _QWORD *v5;

  v2 = *(_QWORD **)(a2 + 40);
  if (v2)
  {
    v4 = result;
    do
    {
      v5 = (_QWORD *)*v2;
      result = CheckAttribute(v4, a2, v2);
      v2 = v5;
    }
    while (v5);
  }
  return result;
}

BOOL nodeIsText(_BOOL8 result)
{
  if (result)
    return *(_DWORD *)(result + 80) == 4;
  return result;
}

uint64_t nodeHasText(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  result = 0;
  if (a1 && a2)
  {
    v5 = *(unsigned int *)(a2 + 72);
    if (v5 >= *(_DWORD *)(a2 + 76))
    {
      return 0;
    }
    else
    {
      v6 = *(_QWORD *)(a1 + 104);
      while (IsWhite(*(char *)(*(_QWORD *)(v6 + 104) + v5)))
      {
        if (++v5 >= (unint64_t)*(unsigned int *)(a2 + 76))
          return 0;
      }
      return 1;
    }
  }
  return result;
}

BOOL nodeIsElement(_BOOL8 result)
{
  int v1;

  if (result)
  {
    v1 = *(_DWORD *)(result + 80);
    return v1 == 5 || v1 == 7;
  }
  return result;
}

BOOL nodeHasCM(_BOOL8 result, int a2)
{
  uint64_t v2;

  if (result)
  {
    v2 = *(_QWORD *)(result + 56);
    return v2 && (*(_DWORD *)(v2 + 32) & a2) != 0;
  }
  return result;
}

uint64_t nodeCMIsInline(uint64_t result)
{
  uint64_t v1;

  if (result)
  {
    v1 = *(_QWORD *)(result + 56);
    if (v1)
      return (*(_DWORD *)(v1 + 32) >> 4) & 1;
    else
      return 0;
  }
  return result;
}

uint64_t nodeCMIsEmpty(uint64_t result)
{
  uint64_t v1;

  if (result)
  {
    v1 = *(_QWORD *)(result + 56);
    if (v1)
      return *(_DWORD *)(v1 + 32) & 1;
    else
      return 0;
  }
  return result;
}

BOOL nodeIsHeader(_BOOL8 result)
{
  _DWORD *v1;

  if (result)
  {
    v1 = *(_DWORD **)(result + 56);
    return v1 && (*v1 - 40) < 6;
  }
  return result;
}

uint64_t nodeHeaderLevel(uint64_t result)
{
  int *v1;
  int v2;
  unsigned int v3;
  unsigned int v4;

  if (result)
  {
    v1 = *(int **)(result + 56);
    if (v1)
    {
      v2 = *v1;
      v3 = v2 - 40;
      v4 = v2 - 39;
      if (v3 >= 6)
        return 0;
      else
        return v4;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t install(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  _BYTE *v5;
  char v6;
  unsigned int v7;
  unsigned __int8 *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  if (a2)
  {
    v4 = MemAlloc(0x10uLL);
    *v4 = a2;
    v5 = *(_BYTE **)(a2 + 8);
    v6 = *v5;
    if (*v5)
    {
      v7 = 0;
      v8 = v5 + 1;
      do
      {
        v7 = 31 * v7 + v6;
        v9 = *v8++;
        v6 = v9;
      }
      while (v9);
      v10 = v7 % 0xB2;
    }
    else
    {
      v10 = 0;
    }
    v11 = a1 + 8 * v10;
    v4[1] = *(_QWORD *)(v11 + 16);
    *(_QWORD *)(v11 + 16) = v4;
  }
  return a2;
}

uint64_t CheckAREA(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  unint64_t v5;
  uint64_t result;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;

  v4 = AttrGetById(a2, 9);
  v5 = (unint64_t)AttrGetById(a2, 58);
  result = (uint64_t)AttrGetById(a2, 80);
  v7 = result;
  v8 = *(_QWORD **)(a2 + 40);
  if (v8)
  {
    do
    {
      v9 = (_QWORD *)*v8;
      result = CheckAttribute(a1, a2, v8);
      v8 = v9;
    }
    while (v9);
  }
  if (!v4 && !*(_QWORD *)(a1 + 744))
  {
    *(_DWORD *)(a1 + 4900) |= 2u;
    result = ReportMissingAttr(a1, a2);
  }
  if (!(v5 | v7))
    return ReportMissingAttr(a1, a2);
  return result;
}

char *CheckCaption(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  _QWORD *v5;
  char *result;
  uint64_t v7;
  char *v8;
  char *v9;
  char *v10;
  uint64_t v11;
  int v12;

  v4 = *(_QWORD **)(a2 + 40);
  if (v4)
  {
    do
    {
      v5 = (_QWORD *)*v4;
      CheckAttribute(a1, a2, v4);
      v4 = v5;
    }
    while (v5);
  }
  result = (char *)AttrGetById(a2, 7);
  if (result)
  {
    v7 = (uint64_t)result;
    result = (char *)*((_QWORD *)result + 6);
    if (result)
    {
      if (!tmbstrcasecmp(result, "left"))
        goto LABEL_14;
      v8 = *(char **)(v7 + 48);
      if (!v8)
        return (char *)ReportAttrError(a1, a2, v7, 51);
      if (tmbstrcasecmp(v8, "right"))
      {
        v9 = *(char **)(v7 + 48);
        if (!v9)
          return (char *)ReportAttrError(a1, a2, v7, 51);
        if (tmbstrcasecmp(v9, "top"))
        {
          v10 = *(char **)(v7 + 48);
          if (!v10 || tmbstrcasecmp(v10, "bottom"))
            return (char *)ReportAttrError(a1, a2, v7, 51);
        }
        v11 = a1;
        v12 = -4;
      }
      else
      {
LABEL_14:
        v11 = a1;
        v12 = 584;
      }
      return (char *)ConstrainVersion(v11, v12);
    }
  }
  return result;
}

uint64_t CheckFORM(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;

  result = (uint64_t)AttrGetById(a2, 5);
  v5 = result;
  v6 = *(_QWORD **)(a2 + 40);
  if (v6)
  {
    do
    {
      v7 = (_QWORD *)*v6;
      result = CheckAttribute(a1, a2, v6);
      v6 = v7;
    }
    while (v7);
  }
  if (!v5)
    return ReportMissingAttr(a1, a2);
  return result;
}

uint64_t CheckHTML(uint64_t result, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v4;
  _QWORD *v5;

  v2 = *(_QWORD **)(a2 + 40);
  if (v2)
  {
    v4 = result;
    do
    {
      v5 = (_QWORD *)*v2;
      result = CheckAttribute(v4, a2, v2);
      v2 = v5;
    }
    while (v5);
  }
  return result;
}

uint64_t CheckIMG(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  unint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t result;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  _BYTE *v12;

  v4 = AttrGetById(a2, 9);
  v5 = (unint64_t)AttrGetById(a2, 132);
  v6 = AttrGetById(a2, 143);
  v7 = AttrGetById(a2, 63);
  result = (uint64_t)AttrGetById(a2, 38);
  v9 = result;
  v10 = *(_QWORD **)(a2 + 40);
  if (v10)
  {
    do
    {
      v11 = (_QWORD *)*v10;
      result = CheckAttribute(a1, a2, v10);
      v10 = v11;
    }
    while (v11);
  }
  if (!v4)
  {
    if (!*(_QWORD *)(a1 + 744))
    {
      *(_DWORD *)(a1 + 4900) |= 1u;
      result = ReportMissingAttr(a1, a2);
    }
    v12 = *(_BYTE **)(a1 + 200);
    if (v12)
      result = (uint64_t)AddAttribute(a1, a2, "alt", v12);
  }
  if (!(v5 | v9))
    result = ReportMissingAttr(a1, a2);
  if (!*(_QWORD *)(a1 + 744) && v7 && !v6)
    return ReportAttrError(a1, a2, 0, 56);
  return result;
}

char *CheckLINK(uint64_t a1, uint64_t a2)
{
  char *result;
  char *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;

  result = (char *)AttrGetById(a2, 116);
  v5 = result;
  v6 = *(_QWORD **)(a2 + 40);
  if (v6)
  {
    do
    {
      v7 = (_QWORD *)*v6;
      result = (char *)CheckAttribute(a1, a2, v6);
      v6 = v7;
    }
    while (v7);
  }
  if (v5)
  {
    result = (char *)*((_QWORD *)v5 + 6);
    if (result)
    {
      result = (char *)tmbstrcasecmp(result, "stylesheet");
      if (!(_DWORD)result)
      {
        result = (char *)AttrGetById(a2, 142);
        if (!result)
        {
          AddAttribute(a1, a2, "type", "text/css");
          v8 = AttrGetById(a2, 142);
          return (char *)ReportAttrError(a1, a2, (uint64_t)v8, 49);
        }
      }
    }
  }
  return result;
}

uint64_t CheckMETA(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;

  result = (uint64_t)AttrGetById(a2, 35);
  v5 = result;
  v6 = *(_QWORD **)(a2 + 40);
  if (v6)
  {
    do
    {
      v7 = (_QWORD *)*v6;
      result = CheckAttribute(a1, a2, v6);
      v6 = v7;
    }
    while (v7);
  }
  if (!v5)
    return ReportMissingAttr(a1, a2);
  return result;
}

_QWORD *CheckSCRIPT(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *result;
  char *v8;
  _QWORD *v9;
  char v10[16];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD **)(a2 + 40);
  if (v4)
  {
    do
    {
      v5 = (_QWORD *)*v4;
      CheckAttribute(a1, a2, v4);
      v4 = v5;
    }
    while (v5);
  }
  v6 = AttrGetById(a2, 66);
  result = AttrGetById(a2, 142);
  if (!result)
  {
    if (v6
      && (v10[0] = 0,
          tmbstrncpy(v10, (_BYTE *)v6[6], 16),
          v10[10] = 0,
          tmbstrncasecmp(v10, "javascript", 10))
      && tmbstrncasecmp(v10, "jscript", 7))
    {
      if (tmbstrcasecmp(v10, "vbscript"))
        goto LABEL_11;
      v8 = "text/vbscript";
    }
    else
    {
      v8 = "text/javascript";
    }
    AddAttribute(a1, a2, "type", v8);
LABEL_11:
    v9 = AttrGetById(a2, 142);
    if (v9)
      return (_QWORD *)ReportAttrError(a1, a2, (uint64_t)v9, 49);
    else
      return (_QWORD *)ReportMissingAttr(a1, a2);
  }
  return result;
}

_BYTE *CheckSTYLE(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _BYTE *v7;
  _BYTE *result;
  _DWORD *v9;

  v4 = AttrGetById(a2, 142);
  v5 = *(_QWORD **)(a2 + 40);
  if (v5)
  {
    do
    {
      v6 = (_QWORD *)*v5;
      CheckAttribute(a1, a2, v5);
      v5 = v6;
    }
    while (v6);
  }
  if (!v4 || (v7 = (_BYTE *)v4[6]) == 0 || (result = tmbstrlen(v7)) == 0)
  {
    v9 = RepairAttrValue(a1, a2, "type", "text/css");
    return (_BYTE *)ReportAttrError(a1, a2, (uint64_t)v9, 49);
  }
  return result;
}

uint64_t CheckTABLE(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  BOOL v8;
  uint64_t v9;

  result = (uint64_t)AttrGetById(a2, 136);
  v5 = result;
  v6 = *(_QWORD **)(a2 + 40);
  if (v6)
  {
    do
    {
      v7 = (_QWORD *)*v6;
      result = CheckAttribute(a1, a2, v6);
      v6 = v7;
    }
    while (v7);
  }
  if (*(_QWORD *)(a1 + 744))
    v8 = 0;
  else
    v8 = v5 == 0;
  if (v8)
  {
    *(_DWORD *)(a1 + 4900) |= 4u;
    result = ReportMissingAttr(a1, a2);
  }
  if (*(_DWORD *)(a1 + 288))
  {
    result = (uint64_t)AttrGetById(a2, 15);
    if (result)
    {
      v9 = result;
      if (!*(_QWORD *)(result + 48))
      {
        result = (uint64_t)tmbstrdup("1");
        *(_QWORD *)(v9 + 48) = result;
      }
    }
  }
  return result;
}

_QWORD *tidyDocCreate()
{
  _QWORD *v0;

  v0 = MemAlloc(0x1360uLL);
  ClearMemory(v0, 0x1360uLL);
  InitMap();
  InitTags((uint64_t)v0);
  InitAttrs((uint64_t)v0);
  InitConfig((uint64_t)v0);
  InitPrintBuf((uint64_t)v0);
  v0[606] = StdErrOutput();
  return v0;
}

void tidyDocRelease(uint64_t a1)
{
  void *v2;

  if (a1)
  {
    ReleaseStreamOut(*(FILE ***)(a1 + 4848));
    *(_QWORD *)(a1 + 4848) = 0;
    FreePrintBuf(a1);
    FreeLexer(a1);
    FreeNode(a1, a1);
    ClearMemory((void *)a1, 0x68uLL);
    v2 = *(void **)(a1 + 4952);
    if (v2)
      MemFree(v2);
    FreeConfig((_DWORD *)a1);
    FreeAttrTable(a1);
    FreeTags(a1);
    MemFree((void *)a1);
  }
}

void tidySetAppData(TidyDoc tdoc, void *appData)
{
  if (tdoc)
    *(_QWORD *)&tdoc[1230]._opaque = appData;
}

void *__cdecl tidyGetAppData(void *tdoc)
{
  if (tdoc)
    return (void *)*((_QWORD *)tdoc + 615);
  return tdoc;
}

Bool tidySetOptionCallback(TidyDoc tdoc, TidyOptCallback pOptCallback)
{
  if (tdoc)
  {
    *(_QWORD *)&tdoc[1216]._opaque = pOptCallback;
    LODWORD(tdoc) = 1;
  }
  return tdoc;
}

int tidyLoadConfig(TidyDoc tdoc, ctmbstr configFile)
{
  if (tdoc)
    return ParseConfigFile();
  else
    return -22;
}

int tidyLoadConfigEnc(TidyDoc tdoc, ctmbstr configFile, ctmbstr charenc)
{
  if (tdoc)
    return ParseConfigFileEnc();
  else
    return -22;
}

int tidySetCharEncoding(TidyDoc tdoc, ctmbstr encnam)
{
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (!tdoc)
    return -22;
  v3 = CharEncodingId(encnam);
  if ((v3 & 0x80000000) == 0 && AdjustCharEncoding(tdoc, v3))
    return 0;
  ReportBadArgument((uint64_t)tdoc, (char)"char-encoding", v4, v5, v6, v7, v8, v9);
  return -22;
}

int tidySetInCharEncoding(TidyDoc tdoc, ctmbstr encnam)
{
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (!tdoc)
    return -22;
  v3 = CharEncodingId(encnam);
  if ((v3 & 0x80000000) == 0 && SetOptionInt((uint64_t)tdoc, 5u, v3))
    return 0;
  ReportBadArgument((uint64_t)tdoc, (char)"in-char-encoding", v4, v5, v6, v7, v8, v9);
  return -22;
}

int tidySetOutCharEncoding(TidyDoc tdoc, ctmbstr encnam)
{
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (!tdoc)
    return -22;
  v3 = CharEncodingId(encnam);
  if ((v3 & 0x80000000) == 0 && SetOptionInt((uint64_t)tdoc, 6u, v3))
    return 0;
  ReportBadArgument((uint64_t)tdoc, (char)"out-char-encoding", v4, v5, v6, v7, v8, v9);
  return -22;
}

TidyOptionId tidyOptGetIdForName(ctmbstr optnam)
{
  int *v1;

  v1 = lookupOption((char *)optnam);
  if (v1)
    return *v1;
  else
    return 89;
}

TidyIterator tidyGetOptionList(TidyDoc tdoc)
{
  if (tdoc)
    return (TidyIterator)getOptionList();
  else
    return (TidyIterator)-1;
}

TidyOption tidyGetNextOption(TidyDoc tdoc, TidyIterator *pos)
{
  if (tdoc)
    return (TidyOption)getNextOption((uint64_t)tdoc, (unint64_t *)pos);
  if (pos)
    *pos = 0;
  return 0;
}

TidyOption tidyGetOption(TidyDoc tdoc, TidyOptionId optId)
{
  return (TidyOption)getOption(optId);
}

TidyOption tidyGetOptionByName(TidyDoc tdoc, ctmbstr optnam)
{
  return (TidyOption)lookupOption((char *)optnam);
}

TidyOptionId tidyOptGetId(TidyOption opt)
{
  if (opt)
    return opt->_opaque;
  else
    return 89;
}

ctmbstr tidyOptGetName(ctmbstr opt)
{
  if (opt)
    return (ctmbstr)*((_QWORD *)opt + 1);
  return opt;
}

TidyOptionType tidyOptGetType(TidyOption opt)
{
  if (opt)
    return opt[4]._opaque;
  else
    return -1;
}

TidyConfigCategory tidyOptGetCategory(TidyOption opt)
{
  if (opt)
    return opt[1]._opaque;
  else
    return -1;
}

ctmbstr tidyOptGetDefault(ctmbstr opt)
{
  if (opt)
  {
    if (*((_DWORD *)opt + 4))
      return 0;
    else
      return (ctmbstr)*((_QWORD *)opt + 6);
  }
  return opt;
}

ulong tidyOptGetDefaultInt(TidyOption opt)
{
  if (opt && opt[4]._opaque)
    return *(_QWORD *)&opt[6]._opaque;
  else
    return 0xFFFFFFFFLL;
}

Bool tidyOptGetDefaultBool(TidyOption opt)
{
  if (opt)
  {
    if (opt[4]._opaque)
      LODWORD(opt) = *(_QWORD *)&opt[6]._opaque != 0;
    else
      LODWORD(opt) = 0;
  }
  return opt;
}

Bool tidyOptIsReadOnly(TidyOption opt)
{
  return !opt || *(_QWORD *)&opt[8]._opaque == 0;
}

TidyIterator tidyOptGetPickList(TidyOption opt)
{
  if (opt)
    return (TidyIterator)getOptionPickList((_BOOL8)opt);
  else
    return (TidyIterator)-1;
}

ctmbstr tidyOptGetNextPick(ctmbstr opt, TidyIterator *pos)
{
  if (opt)
    return (ctmbstr)getNextOptionPick((uint64_t)opt, (unint64_t *)pos);
  return opt;
}

ctmbstr tidyOptGetValue(ctmbstr tdoc, TidyOptionId optId)
{
  if (tdoc)
    return *(ctmbstr *)&tdoc[8 * optId + 112];
  return tdoc;
}

Bool tidyOptSetValue(TidyDoc tdoc, TidyOptionId optId, ctmbstr val)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (tdoc)
    LODWORD(tdoc) = ParseConfigValue((uint64_t)tdoc, optId, (byte *)val, v3, v4, v5, v6, v7);
  return tdoc;
}

Bool tidyOptParseValue(TidyDoc tdoc, ctmbstr optnam, ctmbstr val)
{
  if (tdoc)
    LODWORD(tdoc) = ParseConfigOption((uint64_t)tdoc, (char *)optnam, (byte *)val);
  return tdoc;
}

ulong tidyOptGetInt(ulong tdoc, TidyOptionId optId)
{
  if (tdoc)
    return *(_QWORD *)(tdoc + 8 * optId + 112);
  return tdoc;
}

Bool tidyOptSetInt(TidyDoc tdoc, TidyOptionId optId, ulong val)
{
  if (tdoc)
    LODWORD(tdoc) = SetOptionInt((uint64_t)tdoc, optId, val);
  return tdoc;
}

Bool tidyOptGetBool(TidyDoc tdoc, TidyOptionId optId)
{
  TidyDoc v3;

  if (tdoc)
  {
    v3 = tdoc;
    tdoc = (TidyDoc)getOption(optId);
    if (tdoc)
      LODWORD(tdoc) = v3[2 * optId + 28];
  }
  return tdoc;
}

Bool tidyOptSetBool(TidyDoc tdoc, TidyOptionId optId, Bool val)
{
  if (tdoc)
    LODWORD(tdoc) = SetOptionBool((uint64_t)tdoc, optId, val);
  return tdoc;
}

ctmbstr tidyOptGetEncName(TidyDoc tdoc, TidyOptionId optId)
{
  if (tdoc)
    LODWORD(tdoc) = tdoc[2 * optId + 28];
  return CharEncodingOptName((int)tdoc);
}

ctmbstr tidyOptGetCurrPick(TidyDoc tdoc, TidyOptionId optId)
{
  int *Option;
  ctmbstr *v5;
  unsigned int opaque;
  ctmbstr result;
  BOOL v8;
  BOOL v9;
  uint64_t v10;
  BOOL v11;

  Option = getOption(optId);
  if (!Option)
    return 0;
  v5 = (ctmbstr *)*((_QWORD *)Option + 5);
  if (!v5)
    return 0;
  if (!tdoc)
  {
    result = *v5;
    if (*v5)
      return result;
    return 0;
  }
  opaque = tdoc[2 * optId + 28]._opaque;
  result = *v5;
  v8 = *v5 != 0;
  if (*v5)
    v9 = opaque == 0;
  else
    v9 = 1;
  if (!v9)
  {
    v10 = 1;
    do
    {
      result = v5[v10];
      v8 = result != 0;
      if (result)
        v11 = v10 >= opaque;
      else
        v11 = 1;
      ++v10;
    }
    while (!v11);
  }
  if (!v8)
    return 0;
  return result;
}

TidyIterator tidyOptGetDeclTagList(TidyIterator tdoc)
{
  if (tdoc)
    return (TidyIterator)GetDeclaredTagList((uint64_t)tdoc);
  return tdoc;
}

ctmbstr tidyOptGetNextDeclTag(TidyDoc tdoc, TidyOptionId optId, TidyIterator *iter)
{
  if (tdoc && optId - 75 <= 3)
    return (ctmbstr)GetNextDeclaredTag((uint64_t)tdoc, dword_20AB64440[optId - 75], (uint64_t *)iter);
  else
    return 0;
}

ctmbstr tidyOptGetDoc(TidyDoc tdoc, TidyOption opt)
{
  int opaque;
  ctmbstr result;

  if (opt)
    opaque = opt->_opaque;
  else
    opaque = 89;
  result = OptGetDocDesc(opaque);
  if (result)
    return (ctmbstr)*((_QWORD *)result + 1);
  return result;
}

TidyIterator tidyOptGetDocLinksList(TidyDoc tdoc, TidyOption opt)
{
  int opaque;
  char *DocDesc;
  TidyIterator result;

  if (opt)
    opaque = opt->_opaque;
  else
    opaque = 89;
  DocDesc = OptGetDocDesc(opaque);
  if (!DocDesc)
    return 0;
  result = (TidyIterator)*((_QWORD *)DocDesc + 2);
  if (!result)
    return 0;
  return result;
}

TidyOption tidyOptGetNextDocLinks(TidyDoc tdoc, TidyIterator *pos)
{
  TidyIterator v3;
  unsigned int opaque;
  TidyOption result;
  _TidyIterator *v6;
  int v7;
  _TidyIterator *v8;

  v3 = *pos;
  opaque = (*pos)->_opaque;
  if (opaque)
  {
    result = (TidyOption)getOption(opaque);
    v7 = v3[1]._opaque;
    v6 = v3 + 1;
    if (v7)
      v8 = v6;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
    result = 0;
  }
  *pos = v8;
  return result;
}

int tidyOptSaveFile(TidyDoc tdoc, ctmbstr cfgfil)
{
  if (tdoc)
    return SaveConfigFile((uint64_t)tdoc, (char *)cfgfil);
  else
    return -22;
}

int tidyOptSaveSink(TidyDoc tdoc, TidyOutputSink *sink)
{
  if (tdoc)
    return SaveConfigSink((uint64_t)tdoc, sink);
  else
    return -22;
}

Bool tidyOptSnapshot(TidyDoc tdoc)
{
  if (tdoc)
  {
    TakeConfigSnapshot(tdoc);
    LODWORD(tdoc) = 1;
  }
  return tdoc;
}

Bool tidyOptResetToSnapshot(TidyDoc tdoc)
{
  if (tdoc)
  {
    ResetConfigToSnapshot(tdoc);
    LODWORD(tdoc) = 1;
  }
  return tdoc;
}

Bool tidyOptResetAllToDefault(TidyDoc tdoc)
{
  if (tdoc)
  {
    ResetConfigToDefault((uint64_t)tdoc);
    LODWORD(tdoc) = 1;
  }
  return tdoc;
}

Bool tidyOptResetToDefault(TidyDoc tdoc, TidyOptionId opt)
{
  if (tdoc)
    LODWORD(tdoc) = ResetOptionToDefault((uint64_t)tdoc, opt);
  return tdoc;
}

Bool tidyOptDiffThanDefault(TidyDoc tdoc)
{
  if (tdoc)
    LODWORD(tdoc) = ConfigDiffThanDefault((uint64_t)tdoc);
  return tdoc;
}

Bool tidyOptDiffThanSnapshot(TidyDoc tdoc)
{
  if (tdoc)
    LODWORD(tdoc) = ConfigDiffThanSnapshot((uint64_t)tdoc);
  return tdoc;
}

Bool tidyOptCopyConfig(TidyDoc tdocTo, TidyDoc tdocFrom)
{
  Bool result;

  result = no;
  if (tdocTo)
  {
    if (tdocFrom)
    {
      CopyConfig(tdocTo, tdocFrom);
      return 1;
    }
  }
  return result;
}

Bool tidySetReportFilter(TidyDoc tdoc, TidyReportFilter filtCallback)
{
  if (tdoc)
  {
    *(_QWORD *)&tdoc[1214]._opaque = filtCallback;
    LODWORD(tdoc) = 1;
  }
  return tdoc;
}

FILE *__cdecl tidySetErrorFile(TidyDoc tdoc, ctmbstr errfilnam)
{
  char v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  FILE *v9;
  int opaque;
  int v11;

  if (!tdoc)
    return 0;
  v2 = (char)errfilnam;
  v9 = fopen(errfilnam, "wb");
  if (v9)
  {
    opaque = tdoc[40]._opaque;
    v11 = tdoc[42]._opaque;
    ReleaseStreamOut(*(FILE ***)&tdoc[1212]._opaque);
    *(_QWORD *)&tdoc[1212]._opaque = FileOutput((uint64_t)v9, opaque, v11);
  }
  else
  {
    FileError((uint64_t)tdoc, v2, 4, v4, v5, v6, v7, v8);
  }
  return v9;
}

int tidySetErrorBuffer(TidyDoc tdoc, TidyBuffer *errbuf)
{
  int opaque;
  int v5;
  TidyOutputSink *v6;

  if (!tdoc)
    return -22;
  opaque = tdoc[40]._opaque;
  v5 = tdoc[42]._opaque;
  ReleaseStreamOut(*(FILE ***)&tdoc[1212]._opaque);
  v6 = BufferOutput(errbuf, opaque, v5);
  *(_QWORD *)&tdoc[1212]._opaque = v6;
  if (v6)
    return 0;
  else
    return -12;
}

int tidySetErrorSink(TidyDoc tdoc, TidyOutputSink *sink)
{
  int opaque;
  int v5;
  _DWORD *v6;

  if (!tdoc)
    return -22;
  opaque = tdoc[40]._opaque;
  v5 = tdoc[42]._opaque;
  ReleaseStreamOut(*(FILE ***)&tdoc[1212]._opaque);
  v6 = UserOutput(sink, opaque, v5);
  *(_QWORD *)&tdoc[1212]._opaque = v6;
  if (v6)
    return 0;
  else
    return -12;
}

int tidyStatus(TidyDoc tdoc)
{
  if (!tdoc)
    return -22;
  if (tdoc[1219]._opaque)
    return 2;
  if (tdoc[1220]._opaque)
    return 1;
  return tdoc[1221]._opaque != 0;
}

int tidyDetectedHtmlVersion(TidyDoc tdoc)
{
  return 0;
}

Bool tidyDetectedXhtml(TidyDoc tdoc)
{
  return 0;
}

Bool tidyDetectedGenericXml(TidyDoc tdoc)
{
  return 0;
}

uint tidyErrorCount(TidyDoc tdoc)
{
  if (tdoc)
    return tdoc[1219]._opaque;
  else
    return -1;
}

uint tidyWarningCount(TidyDoc tdoc)
{
  if (tdoc)
    return tdoc[1220]._opaque;
  else
    return -1;
}

uint tidyAccessWarningCount(TidyDoc tdoc)
{
  if (tdoc)
    return tdoc[1221]._opaque;
  else
    return -1;
}

uint tidyConfigErrorCount(TidyDoc tdoc)
{
  if (tdoc)
    return tdoc[1218]._opaque;
  else
    return -1;
}

void tidyErrorSummary(TidyDoc tdoc)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  if (tdoc)
    ErrorSummary(tdoc, v1, v2, v3, v4, v5, v6, v7, v8);
}

void tidyGeneralInfo(TidyDoc tdoc)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  if (tdoc)
    GeneralInfo((uint64_t)tdoc, v1, v2, v3, v4, v5, v6, v7, v8);
}

uint64_t tidyDocParseFile(unint64_t a1, char *__filename)
{
  char v2;
  FILE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  __darwin_time_t tv_sec;
  void **v12;
  void **v13;
  uint64_t v14;
  stat v16;

  v2 = (char)__filename;
  v4 = fopen(__filename, "rb");
  memset(&v16, 0, sizeof(v16));
  ClearMemory((void *)(a1 + 4936), 0x10uLL);
  if (!v4)
  {
    FileError(a1, v2, 4, v5, v6, v7, v8, v9);
    return 4294967294;
  }
  if (*(_DWORD *)(a1 + 536))
  {
    v10 = fileno(v4);
    if (fstat(v10, &v16) != -1)
    {
      tv_sec = v16.st_mtimespec.tv_sec;
      *(_QWORD *)(a1 + 4936) = v16.st_atimespec.tv_sec;
      *(_QWORD *)(a1 + 4944) = tv_sec;
    }
  }
  v12 = FileInput(a1, (uint64_t)v4, *(_DWORD *)(a1 + 152));
  if (!v12)
  {
    fclose(v4);
    return 4294967294;
  }
  v13 = v12;
  v14 = tidyDocParseStream(a1, (uint64_t)v12);
  freeFileSource((uint64_t *)v13 + 6, 1);
  freeStreamIn(v13);
  return v14;
}

uint64_t tidyDocParseStdin(unint64_t a1)
{
  void **v2;
  uint64_t v3;

  v2 = FileInput(a1, *MEMORY[0x24BDAC8E0], *(_DWORD *)(a1 + 152));
  v3 = tidyDocParseStream(a1, (uint64_t)v2);
  freeStreamIn(v2);
  return v3;
}

uint64_t tidyDocParseString(unint64_t a1, byte *a2)
{
  unsigned int v4;
  void **v5;
  uint64_t v6;
  TidyBuffer buf;

  memset(&buf, 0, sizeof(buf));
  if (!a2)
    return 4294967274;
  v4 = tmbstrlen(a2);
  tidyBufAttach(&buf, a2, v4 + 1);
  v5 = (void **)BufferInput(a1, &buf, *(_DWORD *)(a1 + 152));
  v6 = tidyDocParseStream(a1, (uint64_t)v5);
  tidyBufDetach(&buf);
  freeStreamIn(v5);
  return v6;
}

uint64_t tidyDocParseBuffer(unint64_t a1, TidyBuffer *a2)
{
  void **v3;
  uint64_t v4;

  if (!a2)
    return 4294967274;
  v3 = (void **)BufferInput(a1, a2, *(_DWORD *)(a1 + 152));
  v4 = tidyDocParseStream(a1, (uint64_t)v3);
  freeStreamIn(v3);
  return v4;
}

uint64_t tidyDocParseSource(unint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void **v4;
  uint64_t v5;

  UserInput(a1, a2, *(_DWORD *)(a1 + 152));
  v4 = (void **)v3;
  v5 = tidyDocParseStream(a1, v3);
  freeStreamIn(v4);
  return v5;
}

uint64_t tidyDocParseStream(unint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  _DWORD *v6;
  int BOMEncoding;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = *(unsigned int *)(a1 + 280);
  *(_QWORD *)(a1 + 4832) = a2;
  TakeConfigSnapshot((_DWORD *)a1);
  FreeLexer(a1);
  FreeAnchors(a1);
  FreeNode(a1, a1);
  ClearMemory((void *)a1, 0x68uLL);
  v5 = *(void **)(a1 + 4952);
  if (v5)
    MemFree(v5);
  *(_QWORD *)(a1 + 4952) = 0;
  v6 = NewLexer(a1);
  *(_QWORD *)(a1 + 104) = v6;
  *(_QWORD *)(a1 + 84) = *(_QWORD *)v6;
  *(_DWORD *)(a1 + 4932) = 0;
  BOMEncoding = ReadBOMEncoding(a2);
  if (BOMEncoding != -1)
  {
    *(_DWORD *)(a2 + 40) = BOMEncoding;
    SetOptionInt(a1, 5u, BOMEncoding);
  }
  if (v4)
  {
    ParseXMLDocument(a1);
  }
  else
  {
    *(_DWORD *)(a1 + 4880) = 0;
    ParseDocument(a1, v8, v9, v10, v11, v12, v13, v14);
  }
  if (!CheckNodeIntegrity((uint64_t *)a1))
    FatalError("\nPanic - tree has lost its integrity\n");
  *(_QWORD *)(a1 + 4832) = 0;
  if (*(_DWORD *)(a1 + 4876))
    return 2;
  if (*(_DWORD *)(a1 + 4880))
    return 1;
  return *(_DWORD *)(a1 + 4884) != 0;
}

uint64_t tidyDocSaveFile(uint64_t a1, char *__filename)
{
  FILE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  FILE *v10;
  _DWORD *v11;
  uint64_t v12;
  utimbuf *v13;

  if (*(_DWORD *)(a1 + 4876) && *(_DWORD *)(a1 + 232) && !*(_DWORD *)(a1 + 624))
    return 2;
  v4 = fopen(__filename, "wb");
  if (v4)
  {
    v10 = v4;
    v11 = FileOutput((uint64_t)v4, *(_DWORD *)(a1 + 160), *(_DWORD *)(a1 + 168));
    v12 = tidyDocSaveStream(a1, v11);
    fclose(v10);
    MemFree(v11);
    if (*(_QWORD *)(a1 + 4936))
    {
      v13 = (utimbuf *)(a1 + 4936);
      utime(__filename, v13);
      ClearMemory(v13, 0x10uLL);
    }
  }
  else
  {
    FileError(a1, (char)__filename, 4, v5, v6, v7, v8, v9);
    return 4294967294;
  }
  return v12;
}

uint64_t tidyDocSaveStdout(uint64_t a1)
{
  FILE **v2;
  _DWORD *v3;
  uint64_t v4;

  v2 = (FILE **)MEMORY[0x24BDAC8E8];
  v3 = FileOutput(*MEMORY[0x24BDAC8E8], *(_DWORD *)(a1 + 160), *(_DWORD *)(a1 + 168));
  v4 = tidyDocSaveStream(a1, v3);
  fflush(*v2);
  fflush((FILE *)*MEMORY[0x24BDAC8D8]);
  MemFree(v3);
  return v4;
}

uint64_t tidyDocSaveString(uint64_t a1, void *a2, uint *a3)
{
  int v6;
  int v7;
  TidyOutputSink *v8;
  uint64_t v9;
  uint size;
  uint64_t v11;
  TidyBuffer __src;

  v6 = *(_DWORD *)(a1 + 160);
  v7 = *(_DWORD *)(a1 + 168);
  memset(&__src, 0, sizeof(__src));
  v8 = BufferOutput(&__src, v6, v7);
  v9 = tidyDocSaveStream(a1, v8);
  size = __src.size;
  if (__src.size <= *a3)
  {
    v11 = v9;
    memcpy(a2, __src.bp, __src.size);
  }
  else
  {
    v11 = 4294967284;
  }
  *a3 = size;
  tidyBufFree(&__src);
  MemFree(v8);
  return v11;
}

uint64_t tidyDocSaveBuffer(uint64_t a1, TidyBuffer *a2)
{
  TidyOutputSink *v3;
  uint64_t v4;

  if (!a2)
    return 4294967274;
  v3 = BufferOutput(a2, *(_DWORD *)(a1 + 160), *(_DWORD *)(a1 + 168));
  v4 = tidyDocSaveStream(a1, v3);
  MemFree(v3);
  return v4;
}

uint64_t tidyDocSaveSink(uint64_t a1, _OWORD *a2)
{
  _DWORD *v3;
  uint64_t v4;

  v3 = UserOutput(a2, *(_DWORD *)(a1 + 160), *(_DWORD *)(a1 + 168));
  v4 = tidyDocSaveStream(a1, v3);
  MemFree(v3);
  return v4;
}

uint64_t tidyDocSaveStream(uint64_t a1, _DWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  BOOL v13;
  uint64_t v15;
  uint64_t v16;

  v4 = *(unsigned int *)(a1 + 240);
  v5 = *(unsigned int *)(a1 + 624);
  v6 = *(_DWORD *)(a1 + 688);
  v7 = *(unsigned int *)(a1 + 288);
  v16 = *(unsigned int *)(a1 + 296);
  v15 = *(unsigned int *)(a1 + 584);
  v8 = *(unsigned int *)(a1 + 608);
  v9 = *(unsigned int *)(a1 + 344);
  v10 = *(unsigned int *)(a1 + 640);
  v11 = *(unsigned int *)(a1 + 336);
  if (*(_DWORD *)(a1 + 664))
    ConvertCDATANodes(a1, a1);
  if (v8)
    DropComments(a1, a1);
  if (v9)
  {
    DropFontElements(a1, (uint64_t *)a1);
    WbrToSpace(a1, (uint64_t *)a1);
  }
  if (v10)
    v12 = v9 == 0;
  else
    v12 = 1;
  v13 = v12 && v11 == 0;
  if (v13 || (DowngradeTypography(a1, a1), !v11))
  {
    ReplacePreformattedSpaces(a1, a1);
    if (!v4)
      goto LABEL_31;
  }
  else
  {
    NormalizeSpaces(*(_QWORD *)(a1 + 104), a1);
    if (!v4)
      goto LABEL_31;
  }
  if (!*(_DWORD *)(a1 + 4876) || v5)
  {
    if (v6 == 1 || *(_DWORD *)(a1 + 4932) && v6 == 2)
      outBOM(a2);
    *(_QWORD *)(a1 + 4840) = a2;
    if (!v7 || v16)
    {
      if (v15)
        PrintBody((unsigned int *)a1);
      else
        PPrintTree((unsigned int *)a1, 0, 0, a1);
    }
    else
    {
      PPrintXMLTree((unsigned int *)a1, 0, 0, a1);
    }
    PFlushLine(a1, 0);
    *(_QWORD *)(a1 + 4840) = 0;
  }
LABEL_31:
  ResetConfigToSnapshot((_QWORD *)a1);
  if (*(_DWORD *)(a1 + 4876))
    return 2;
  if (*(_DWORD *)(a1 + 4880))
    return 1;
  return *(_DWORD *)(a1 + 4884) != 0;
}

int tidyCleanAndRepair(TidyDoc tdoc)
{
  if (tdoc)
    return tidyDocCleanAndRepair((uint64_t)tdoc);
  else
    return -22;
}

uint64_t tidyDocCleanAndRepair(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *HEAD;
  uint64_t DocType;
  _QWORD *AttrByName;
  _QWORD *v21;
  _BYTE *v22;
  uint64_t *v23;
  uint64_t v24;

  if (*(_DWORD *)(a1 + 280))
    goto LABEL_33;
  v2 = *(unsigned int *)(a1 + 544);
  v3 = *(unsigned int *)(a1 + 344);
  v4 = *(unsigned int *)(a1 + 368);
  v5 = *(unsigned int *)(a1 + 304);
  v6 = *(unsigned int *)(a1 + 288);
  v7 = *(unsigned int *)(a1 + 296);
  v8 = *(unsigned int *)(a1 + 312);
  v9 = *(unsigned int *)(a1 + 552);
  v10 = *(_DWORD *)(a1 + 352);
  NestedEmphasis(a1, (uint64_t *)a1);
  List2BQ((_BYTE *)a1, a1);
  BQ2Div(a1, a1, v11, v12, v13, v14, v15, v16);
  if (v10)
    EmFromI((_BYTE *)a1, (_QWORD *)a1);
  if (v2 && IsWord2000((_QWORD *)a1))
  {
    DropSections(a1, a1);
    CleanWord2000(a1, a1);
    DropEmptyElements(a1, a1);
  }
  if (v3 | v4)
    CleanDocument(a1);
  v17 = *(_QWORD *)(a1 + 160);
  if (v17 && v17 != 5)
  {
    HEAD = FindHEAD((_QWORD *)a1);
    VerifyHTTPEquiv(a1, HEAD);
  }
  if (!CheckNodeIntegrity((uint64_t *)a1))
    FatalError("\nPanic - tree has lost its integrity\n");
  DocType = FindDocType(a1);
  if (DocType)
  {
    AttrByName = GetAttrByName(DocType, "PUBLIC");
    if (AttrByName)
    {
      v21 = AttrByName;
      v22 = (_BYTE *)AttrByName[6];
      if (v22)
      {
        if (*(_QWORD *)(a1 + 4952))
        {
          MemFree(*(void **)(a1 + 4952));
          v22 = (_BYTE *)v21[6];
        }
        *(_QWORD *)(a1 + 4952) = tmbstrdup(v22);
      }
    }
  }
  if (*(_QWORD *)(a1 + 24))
  {
    if (v5)
    {
      if (*(_DWORD *)(*(_QWORD *)(a1 + 104) + 28))
      {
        v23 = (uint64_t *)FindDocType(a1);
        if (v23)
          RemoveNode(v23);
      }
    }
    else if (v7)
    {
      SetXHTMLDocType(a1);
      v24 = 1;
      goto LABEL_28;
    }
    FixDocType(a1);
    v24 = 0;
LABEL_28:
    FixAnchors(a1, a1, 1, 1);
    FixXhtmlNamespace((_QWORD *)a1, v24);
    FixLanguageInformation(a1, a1, v24, 1);
    if (v9)
      AddGenerator((_QWORD *)a1);
  }
  if (v6 && v8)
    FixXmlDecl((_QWORD *)a1);
LABEL_33:
  if (*(_DWORD *)(a1 + 4876))
    return 2;
  if (*(_DWORD *)(a1 + 4880))
    return 1;
  return *(_DWORD *)(a1 + 4884) != 0;
}

int tidyRunDiagnostics(TidyDoc tdoc)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (tdoc)
    return tidyDocRunDiagnostics(tdoc, v1, v2, v3, v4, v5, v6, v7);
  else
    return -22;
}

uint64_t tidyDocRunDiagnostics(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  BOOL v18;
  char v20;
  char v21;

  v9 = a1[156];
  if (!a1[64])
  {
    ReportMarkupVersion((uint64_t)a1, a2, a3, a4, a5, a6, a7, a8, v20);
    ReportNumWarnings((uint64_t)a1, v10, v11, v12, v13, v14, v15, v16, v21);
  }
  v17 = a1[1219];
  if (v17)
    v18 = v9 == 0;
  else
    v18 = 0;
  if (v18)
  {
    NeedsAuthorIntervention((uint64_t)a1, a2, a3, a4, a5, a6, a7, a8, v20);
    v17 = a1[1219];
  }
  if (v17)
    return 2;
  if (a1[1220])
    return 1;
  return a1[1221] != 0;
}

TidyNode tidyGetHtml(TidyNode tdoc)
{
  if (tdoc)
    return (TidyNode)FindHTML(tdoc);
  return tdoc;
}

TidyNode tidyGetHead(TidyNode tdoc)
{
  if (tdoc)
    return (TidyNode)FindHEAD(tdoc);
  return tdoc;
}

TidyNode tidyGetBody(TidyNode tdoc)
{
  if (tdoc)
    return (TidyNode)FindBody(tdoc);
  return tdoc;
}

TidyNode tidyGetParent(TidyNode tnod)
{
  return *(TidyNode *)&tnod->_opaque;
}

TidyNode tidyGetChild(TidyNode tnod)
{
  return *(TidyNode *)&tnod[6]._opaque;
}

TidyNode tidyGetNext(TidyNode tnod)
{
  return *(TidyNode *)&tnod[4]._opaque;
}

TidyNode tidyGetPrev(TidyNode tnod)
{
  return *(TidyNode *)&tnod[2]._opaque;
}

TidyNodeType tidyNodeGetType(TidyNode tnod)
{
  if (tnod)
    LODWORD(tnod) = tnod[20];
  return tnod;
}

uint tidyNodeLine(TidyNode tnod)
{
  if (tnod)
    LODWORD(tnod) = tnod[21];
  return tnod;
}

uint tidyNodeColumn(TidyNode tnod)
{
  if (tnod)
    LODWORD(tnod) = tnod[22];
  return tnod;
}

ctmbstr tidyNodeGetName(ctmbstr tnod)
{
  if (tnod)
    return (ctmbstr)*((_QWORD *)tnod + 8);
  return tnod;
}

Bool tidyNodeHasText(TidyDoc tdoc, TidyNode tnod)
{
  if (tdoc)
    LODWORD(tdoc) = nodeHasText((uint64_t)tdoc, (uint64_t)tnod);
  return tdoc;
}

Bool tidyNodeGetText(TidyDoc tdoc, TidyNode tnod, TidyBuffer *buf)
{
  Bool result;
  TidyOutputSink *v6;
  int opaque;
  uint64_t v8;

  result = no;
  if (tdoc && tnod && buf)
  {
    v6 = BufferOutput(buf, tdoc[40]._opaque, tdoc[42]._opaque);
    opaque = tdoc[72]._opaque;
    v8 = tdoc[74]._opaque;
    *(_QWORD *)&tdoc[1210]._opaque = v6;
    if (!opaque || v8)
      PPrintTree((unsigned int *)tdoc, 0, 0, (uint64_t)tnod);
    else
      PPrintXMLTree((unsigned int *)tdoc, 0, 0, (uint64_t)tnod);
    PFlushLine((uint64_t)tdoc, 0);
    *(_QWORD *)&tdoc[1210]._opaque = 0;
    MemFree(v6);
    return 1;
  }
  return result;
}

Bool tidyNodeIsProp(TidyDoc tdoc, TidyNode tnod)
{
  unsigned int opaque;
  Bool result;
  uint64_t v4;

  if (!tnod)
    return 1;
  opaque = tnod[20]._opaque;
  result = yes;
  if (opaque <= 0xD)
  {
    if (((1 << opaque) & 0x211F) != 0)
    {
      return 0;
    }
    else if (((1 << opaque) & 0xE0) != 0)
    {
      v4 = *(_QWORD *)&tnod[14]._opaque;
      if (v4)
        return (*(_BYTE *)(v4 + 17) & 0xE0) != 0;
    }
  }
  return result;
}

TidyTagId tidyNodeGetId(TidyNode tnod)
{
  _DWORD *v1;

  if (tnod)
  {
    v1 = *(_DWORD **)&tnod[14]._opaque;
    if (v1)
      LODWORD(tnod) = *v1;
    else
      LODWORD(tnod) = 0;
  }
  return tnod;
}

TidyAttr tidyAttrFirst(TidyAttr tnod)
{
  if (tnod)
    return *(TidyAttr *)&tnod[10]._opaque;
  return tnod;
}

TidyAttr tidyAttrNext(TidyAttr tattr)
{
  if (tattr)
    return *(TidyAttr *)&tattr->_opaque;
  return tattr;
}

ctmbstr tidyAttrName(ctmbstr tattr)
{
  if (tattr)
    return (ctmbstr)*((_QWORD *)tattr + 5);
  return tattr;
}

ctmbstr tidyAttrValue(ctmbstr tattr)
{
  if (tattr)
    return (ctmbstr)*((_QWORD *)tattr + 6);
  return tattr;
}

TidyAttrId tidyAttrGetId(TidyAttr tattr)
{
  _DWORD *v1;

  if (tattr)
  {
    v1 = *(_DWORD **)&tattr[2]._opaque;
    if (v1)
      LODWORD(tattr) = *v1;
    else
      LODWORD(tattr) = 0;
  }
  return tattr;
}

Bool tidyAttrIsProp(TidyAttr tattr)
{
  uint64_t v1;

  return !tattr || (v1 = *(_QWORD *)&tattr[2]._opaque) == 0 || (*(_BYTE *)(v1 + 17) & 0xE0) != 0;
}

_BYTE *tmbstrdup(_BYTE *result)
{
  _BYTE *v1;
  size_t v2;
  uint64_t v4;
  int v5;

  if (result)
  {
    v1 = result;
    if (*result)
    {
      v2 = 1;
      while (v1[v2++])
        ;
    }
    else
    {
      v2 = 1;
    }
    result = MemAlloc(v2);
    v4 = 0;
    do
    {
      v5 = v1[v4];
      result[v4++] = v5;
    }
    while (v5);
  }
  return result;
}

_BYTE *tmbstrlen(_BYTE *result)
{
  uint64_t v1;
  _BYTE *v2;

  if (result)
  {
    if (*result)
    {
      v1 = 0;
      v2 = result + 1;
      do
        result = (_BYTE *)(v1 + 1);
      while (v2[v1++]);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

_BYTE *tmbstrndup(uint64_t a1, uint64_t a2)
{
  _BYTE *result;
  uint64_t v5;
  int v6;

  result = 0;
  if (a1 && a2)
  {
    result = MemAlloc(a2 + 1);
    v5 = 0;
    do
    {
      if (a2 == v5)
        break;
      v6 = *(unsigned __int8 *)(a1 + v5);
      result[v5++] = v6;
    }
    while (v6);
    result[v5] = 0;
  }
  return result;
}

uint64_t tmbstrncpy(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  char v3;
  unsigned __int8 *v4;
  int v5;

  if (a1 && a2 && a3)
  {
    v3 = *a2;
    if (*a2)
    {
      v4 = a2 + 1;
      do
      {
        if (!--a3)
          break;
        *a1++ = v3;
        v5 = *v4++;
        v3 = v5;
      }
      while (v5);
    }
    *a1 = 0;
  }
  return a3;
}

uint64_t tmbstrcpy(_BYTE *a1, unsigned __int8 *a2)
{
  int v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t result;
  int v6;

  v2 = *a2;
  *a1 = v2;
  if (!v2)
    return 0;
  v3 = 0;
  v4 = a1 + 1;
  do
  {
    result = v3 + 1;
    v6 = a2[v3 + 1];
    v4[v3++] = v6;
  }
  while (v6);
  return result;
}

uint64_t tmbstrcat(unsigned __int8 *a1, unsigned __int8 *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  int v6;

  while (*a1++)
    ;
  v3 = *a2;
  *(a1 - 1) = v3;
  if (!v3)
    return 0;
  v4 = 0;
  do
  {
    v5 = v4 + 1;
    v6 = a2[v4 + 1];
    a1[v4++] = v6;
  }
  while (v6);
  return v5;
}

uint64_t tmbstrcmp(unsigned __int8 *a1, unsigned __int8 *a2)
{
  int v2;
  int v3;
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  int v6;
  int v7;

  v2 = *a1;
  v3 = *a2;
  if (v2 == v3)
  {
    v4 = a2 + 1;
    v5 = a1 + 1;
    while (v2)
    {
      v6 = *v5++;
      v2 = v6;
      v7 = *v4++;
      LOBYTE(v3) = v7;
      if (v2 != v7)
        goto LABEL_5;
    }
    return 0;
  }
  else
  {
LABEL_5:
    if ((char)v2 > (char)v3)
      return 1;
    else
      return 0xFFFFFFFFLL;
  }
}

uint64_t tmbstrcasecmp(char *a1, char *a2)
{
  char *v3;
  char v4;
  int v5;
  unsigned int v6;
  int v7;
  unsigned int v8;

  v3 = a1;
  v4 = *a1;
  v5 = ToLower(*a1);
  if (v5 == ToLower(*a2))
  {
    while (v4)
    {
      v6 = *++v3;
      v4 = v6;
      v7 = ToLower(v6);
      v8 = *++a2;
      if (v7 != ToLower(v8))
        goto LABEL_4;
    }
    return 0;
  }
  else
  {
LABEL_4:
    if (*v3 > *a2)
      return 1;
    else
      return 0xFFFFFFFFLL;
  }
}

uint64_t tmbstrncmp(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  int v3;
  int v4;
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  uint64_t result;
  int v8;
  int v9;
  unsigned int v10;

  v3 = *a1;
  v4 = *a2;
  if (v3 == v4)
  {
    v5 = a2 + 1;
    v6 = a1 + 1;
    while (1)
    {
      result = 0;
      if (!v3 || !a3)
        break;
      --a3;
      v8 = *v6++;
      v3 = v8;
      v9 = *v5++;
      LOBYTE(v4) = v9;
      if (v3 != v9)
        goto LABEL_6;
    }
  }
  else
  {
LABEL_6:
    if ((char)v3 > (char)v4)
      v10 = 1;
    else
      v10 = -1;
    if (a3)
      return v10;
    else
      return 0;
  }
  return result;
}

uint64_t tmbstrncasecmp(char *a1, char *a2, uint64_t a3)
{
  char *v5;
  char v6;
  int v7;
  uint64_t result;
  unsigned int v9;
  int v10;
  unsigned int v11;

  v5 = a1;
  v6 = *a1;
  v7 = ToLower(*a1);
  if (v7 == ToLower(*a2))
  {
    while (1)
    {
      result = 0;
      if (!v6 || !a3)
        break;
      v9 = *++v5;
      v6 = v9;
      v10 = ToLower(v9);
      v11 = *++a2;
      --a3;
      if (v10 != ToLower(v11))
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    if (a3)
    {
      if (*v5 > *a2)
        return 1;
      else
        return 0xFFFFFFFFLL;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t tmbsubstrn(uint64_t a1, unint64_t a2, _BYTE *a3)
{
  unint64_t v3;
  BOOL v5;
  uint64_t v6;
  uint64_t v8;
  unsigned __int8 *v9;
  int v10;
  int v11;
  unsigned __int8 *i;
  unint64_t v13;
  unsigned __int8 *v14;
  unsigned __int8 *v15;
  int v16;
  int v17;
  int v18;

  if (a3 && *a3)
  {
    v3 = 0;
    while (a3[++v3])
      ;
    v5 = a2 >= v3;
    a2 -= v3;
    if (!v5)
      return 0;
  }
  else
  {
    v3 = 0;
  }
  v8 = 0;
  v11 = *a3;
  v9 = a3 + 1;
  v10 = v11;
  for (i = (unsigned __int8 *)(a1 + 1); ; ++i)
  {
    v6 = a1 + v8;
    v13 = v3;
    if (*(unsigned __int8 *)(a1 + v8) == v10)
      break;
LABEL_15:
    if (!v13)
      return v6;
    if (++v8 > a2)
      return 0;
  }
  v14 = i;
  v15 = v9;
  v16 = v10;
  v13 = v3;
  while (v16 && v13)
  {
    --v13;
    v17 = *v14++;
    v16 = v17;
    v18 = *v15++;
    if (v16 != v18)
      goto LABEL_15;
  }
  return v6;
}

_BYTE *tmbsubstr(_BYTE *a1, char *a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v10;
  uint64_t v11;
  _BYTE *v12;

  if (a1 && *a1)
  {
    v4 = 0;
    do
      v5 = v4 + 1;
    while (a1[++v4]);
    if (!a2)
      goto LABEL_12;
  }
  else
  {
    v5 = 0;
    if (!a2)
    {
LABEL_12:
      v8 = 0;
      goto LABEL_13;
    }
  }
  if (!*a2)
    goto LABEL_12;
  v7 = 0;
  do
    v8 = v7 + 1;
  while (a2[++v7]);
LABEL_13:
  v10 = v5 - v8;
  if (v5 < v8)
    return 0;
  v11 = 0;
  while (1)
  {
    v12 = &a1[v11];
    if (!tmbstrncasecmp(&a1[v11], a2, v8))
      break;
    if (++v11 > v10)
      return 0;
  }
  return v12;
}

_BYTE *tmbstrtolower(_BYTE *a1)
{
  char v2;
  unsigned __int8 *v3;
  int v4;

  v2 = *a1;
  if (*a1)
  {
    v3 = a1 + 1;
    do
    {
      *(v3 - 1) = ToLower(v2);
      v4 = *v3++;
      v2 = v4;
    }
    while (v4);
  }
  return a1;
}

_BYTE *tmbstrtoupper(_BYTE *a1)
{
  char v2;
  unsigned __int8 *v3;
  int v4;

  v2 = *a1;
  if (*a1)
  {
    v3 = a1 + 1;
    do
    {
      *(v3 - 1) = ToUpper(v2);
      v4 = *v3++;
      v2 = v4;
    }
    while (v4);
  }
  return a1;
}

uint64_t tmbvsnprintf(char *a1, uint64_t a2, const char *a3, va_list a4)
{
  uint64_t v5;
  uint64_t result;

  v5 = a2 - 1;
  result = vsnprintf(a1, a2 - 1, a3, a4);
  a1[v5] = 0;
  return result;
}

uint64_t tmbsnprintf(char *a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10;
  uint64_t result;

  v10 = a2 - 1;
  result = vsnprintf(a1, a2 - 1, a3, &a9);
  a1[v10] = 0;
  return result;
}

uint64_t DecodeUTF8BytesToChar(unsigned int *a1, unsigned int a2, char *a3, _QWORD *a4, int *a5)
{
  char *v7;
  unsigned __int8 v9;
  int v10;
  int v11;
  unsigned int v12;
  uint64_t result;
  int v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  int v22;
  _BOOL4 v23;
  int *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  int v28;
  uint64_t v29;
  unsigned __int8 *v30;
  int v31;
  unsigned int v32;
  char v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  if (a3)
    v7 = a3;
  else
    v7 = &v34;
  if (a2 == -1)
  {
    result = 0;
    *a1 = -1;
    *a5 = 1;
    return result;
  }
  v9 = a2;
  if (a2 < 0x80)
  {
    v10 = 0;
    v11 = 1;
    v12 = a2;
LABEL_15:
    v14 = 1;
    goto LABEL_16;
  }
  if ((a2 & 0xE0) == 0xC0)
  {
    v12 = a2 & 0x1F;
    v11 = 2;
LABEL_14:
    v10 = 1;
    goto LABEL_15;
  }
  if ((a2 & 0xF0) == 0xE0)
  {
    v12 = a2 & 0xF;
    v11 = 3;
    goto LABEL_14;
  }
  if ((a2 & 0xF8) == 0xF0)
  {
    v12 = a2 & 7;
    v11 = 4;
    goto LABEL_14;
  }
  if ((a2 & 0xFC) == 0xF8)
  {
    v14 = 0;
    v12 = a2 & 3;
    v11 = 5;
  }
  else
  {
    if ((a2 & 0xFE) != 0xFC)
    {
      v10 = 0;
      v14 = 0;
      v11 = 1;
      v12 = a2;
      goto LABEL_16;
    }
    v14 = 0;
    v12 = a2 & 1;
    v11 = 6;
  }
  v10 = 1;
LABEL_16:
  if (a3)
  {
    if (v10)
    {
      v15 = 0;
      if (v11 <= 2)
        v16 = 2;
      else
        v16 = v11;
      v17 = (v16 - 1);
      while (1)
      {
        v18 = v7[v15];
        if (!v18 || (v18 & 0xC0) != 0x80)
          break;
        v12 = v18 & 0x3F | (v12 << 6);
        if (v17 == ++v15)
          goto LABEL_39;
      }
      v11 = v15;
      goto LABEL_69;
    }
  }
  else if (a4)
  {
    if (v10)
    {
      v19 = 0;
      if (v11 <= 2)
        v20 = 2;
      else
        v20 = v11;
      v21 = (v20 - 1);
      while (1)
      {
        if (((unsigned int (*)(_QWORD))a4[3])(*a4))
          goto LABEL_39;
        v22 = ((uint64_t (*)(_QWORD))a4[1])(*a4);
        v7[v19] = v22;
        if (v22 == -1 || (v22 & 0xC0) != 0x80)
          break;
        v12 = v22 & 0x3F | (v12 << 6);
        if (v21 == ++v19)
          goto LABEL_39;
      }
      if (v22 != -1)
        ((void (*)(_QWORD, _QWORD))a4[2])(*a4, v22);
      v11 = v19;
LABEL_69:
      *a5 = v11;
      *a1 = v12;
      return 0xFFFFFFFFLL;
    }
  }
  else
  {
    v11 = 1;
    if ((v10 & 1) != 0)
      goto LABEL_69;
  }
LABEL_39:
  if (!v14)
    goto LABEL_69;
  v23 = v12 >> 1 == 0x7FFF;
  if (v12 < 0x110000)
    v23 = 1;
  if (v12 >> 1 == 0x7FFF)
    goto LABEL_69;
  if (!v23)
    goto LABEL_69;
  v24 = (int *)((char *)&offsetUTF8Sequences + 4 * v11);
  v25 = *(v24 - 1);
  if (v12 < validUTF8[5 * (int)v25])
    goto LABEL_69;
  v26 = *v24;
  if (v12 > validUTF8[5 * (int)v26 - 4])
    goto LABEL_69;
  if ((int)v25 >= (int)v26)
  {
    v28 = 1;
    goto LABEL_74;
  }
  v27 = (char *)&validUTF8[5 * (int)v25 + 3] + 1;
  v28 = 1;
  do
  {
    v29 = 0;
    v30 = (unsigned __int8 *)v27;
    v31 = v28;
    while (1)
    {
      v32 = v9;
      if (v29)
        v32 = v7[v29 - 1];
      if (v32 >= *(v30 - 1))
        break;
      if (v31)
        goto LABEL_61;
LABEL_59:
      v31 = 0;
      v28 = 0;
      ++v29;
      v30 += 2;
      if (v11 == v29)
        goto LABEL_62;
    }
    if (v32 <= *v30 || v31 == 0)
      goto LABEL_59;
LABEL_61:
    v28 = 1;
LABEL_62:
    ++v25;
    v27 += 20;
  }
  while (v25 != v26);
LABEL_74:
  *a5 = v11;
  *a1 = v12;
  if (v28)
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t EncodeCharToUTF8Bytes(unsigned int a1, uint64_t *a2, uint64_t a3, _DWORD *a4)
{
  uint64_t *v6;
  unsigned int v7;
  _BOOL4 v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  unsigned int v13;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v23 = 0;
  v22 = 0;
  if (a2)
    v6 = a2;
  else
    v6 = &v22;
  if (a1 <= 0x7F)
  {
    *(_BYTE *)v6 = a1;
    v7 = 1;
    v8 = 1;
    if (!a3)
    {
LABEL_24:
      *a4 = v7;
      return (v8 - 1);
    }
LABEL_21:
    if (v8)
    {
      v12 = v7;
      do
      {
        v13 = *(unsigned __int8 *)v6;
        v6 = (uint64_t *)((char *)v6 + 1);
        (*(void (**)(_QWORD, _QWORD))(a3 + 8))(*(_QWORD *)a3, v13);
        --v12;
      }
      while (v12);
    }
    goto LABEL_24;
  }
  if (a1 <= 0x7FF)
  {
    *(_BYTE *)v6 = (a1 >> 6) | 0xC0;
    v9 = &v22;
    if (a2)
      v9 = a2;
    *((_BYTE *)v9 + 1) = a1 & 0x3F | 0x80;
    v8 = 1;
    v7 = 2;
    if (!a3)
      goto LABEL_24;
    goto LABEL_21;
  }
  if (!HIWORD(a1))
  {
    *(_BYTE *)v6 = (a1 >> 12) | 0xE0;
    v10 = &v22;
    if (a2)
      v10 = a2;
    *((_BYTE *)v10 + 1) = (a1 >> 6) & 0x3F | 0x80;
    *((_BYTE *)v10 + 2) = a1 & 0x3F | 0x80;
    v8 = a1 >> 1 != 0x7FFF;
    v7 = 3;
    if (!a3)
      goto LABEL_24;
    goto LABEL_21;
  }
  if (!(a1 >> 21))
  {
    *(_BYTE *)v6 = (a1 >> 18) | 0xF0;
    v11 = &v22;
    if (a2)
      v11 = a2;
    *((_BYTE *)v11 + 1) = (a1 >> 12) & 0x3F | 0x80;
    *((_BYTE *)v11 + 2) = (a1 >> 6) & 0x3F | 0x80;
    *((_BYTE *)v11 + 3) = a1 & 0x3F | 0x80;
    v8 = a1 < 0x110000;
    v7 = 4;
    if (!a3)
      goto LABEL_24;
    goto LABEL_21;
  }
  if (a1 >> 26)
  {
    if ((a1 & 0x80000000) != 0)
    {
      v16 = 0;
      goto LABEL_32;
    }
    *(_BYTE *)v6 = (a1 >> 30) | 0xFC;
    v21 = &v22;
    if (a2)
      v21 = a2;
    *((_BYTE *)v21 + 1) = HIBYTE(a1) & 0x3F | 0x80;
    v15 = (a1 >> 18) & 0x3F;
    v16 = 6;
    v17 = 5;
    v18 = 4;
    v19 = 3;
    v20 = 2;
  }
  else
  {
    v15 = a1 >> 18;
    *(_BYTE *)v6 = HIBYTE(a1) | 0xF8;
    v16 = 5;
    v17 = 4;
    v18 = 3;
    v19 = 2;
    v20 = 1;
  }
  *((_BYTE *)v6 + v20) = v15 | 0x80;
  *((_BYTE *)v6 + v19) = (a1 >> 12) & 0x3F | 0x80;
  *((_BYTE *)v6 + v18) = (a1 >> 6) & 0x3F | 0x80;
  *((_BYTE *)v6 + v17) = a1 & 0x3F | 0x80;
LABEL_32:
  *a4 = v16;
  return 0xFFFFFFFFLL;
}

uint64_t GetUTF8(char *a1, int *a2)
{
  int v3;
  int v4;
  uint64_t v6;

  v6 = 0;
  v3 = DecodeUTF8BytesToChar((unsigned int *)&v6 + 1, *a1, a1 + 1, 0, (int *)&v6);
  v4 = HIDWORD(v6);
  if (v3)
    v4 = 65533;
  *a2 = v4;
  return (v6 - 1);
}

uint64_t PutUTF8(uint64_t a1, unsigned int a2)
{
  uint64_t v3;
  int v5;

  v5 = 0;
  if (EncodeCharToUTF8Bytes(a2, (uint64_t *)a1, 0, &v5))
  {
    *(_WORD *)a1 = -16401;
    *(_BYTE *)(a1 + 2) = -67;
    v3 = 3;
  }
  else
  {
    v3 = v5;
  }
  return a1 + v3;
}

BOOL IsValidUTF16FromUCS4(unsigned int a1)
{
  return a1 < 0x110000;
}

BOOL IsHighSurrogate(unsigned int a1)
{
  return a1 >> 10 == 55;
}

BOOL IsLowSurrogate(unsigned int a1)
{
  return a1 >> 10 == 54;
}

uint64_t CombineSurrogatePair(int a1, int a2)
{
  return (a1 + (a2 << 10) - 56613888);
}

uint64_t SplitSurrogatePair(int a1, _DWORD *a2, int *a3)
{
  uint64_t v3;

  LODWORD(v3) = (a1 & 0xFFFF0000) != 0;
  if ((~a1 & 0xFFFE) == 0)
    LODWORD(v3) = 0;
  if (!a3)
    LODWORD(v3) = 0;
  if (a2)
    v3 = v3;
  else
    v3 = 0;
  if ((_DWORD)v3 == 1)
  {
    *a2 = ((a1 - 0x10000) >> 10) + 55296;
    *a3 = a1 & 0x3FF | 0xDC00;
  }
  return v3;
}

BOOL IsValidCombinedChar(int a1)
{
  return (~a1 & 0xFFFE) != 0 && (a1 & 0xFFFF0000) != 0;
}

BOOL IsCombinedChar(int a1)
{
  return (a1 & 0xFFFF0000) != 0;
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x24BDAC838](*(_QWORD *)&a1, a2);
}

int access(const char *a1, int a2)
{
  return MEMORY[0x24BDAD038](a1, *(_QWORD *)&a2);
}

int atoi(const char *a1)
{
  return MEMORY[0x24BDAD258](a1);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void exit(int a1)
{
  MEMORY[0x24BDAE268](*(_QWORD *)&a1);
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

int feof(FILE *a1)
{
  return MEMORY[0x24BDAE328](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x24BDAE350](a1);
}

int fgetc(FILE *a1)
{
  return MEMORY[0x24BDAE368](a1);
}

int fileno(FILE *a1)
{
  return MEMORY[0x24BDAE390](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x24BDAE438](*(_QWORD *)&a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x24BDAE508](*(_QWORD *)&a1, a2);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x24BDAE5F0](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED88](ptr, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE70](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAFE60](a1, a2);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAFEA0](a1, a2);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x24BDAFFC8](__s1, __s2);
}

int utime(const char *a1, const utimbuf *a2)
{
  return MEMORY[0x24BDB02F0](a1, a2);
}

