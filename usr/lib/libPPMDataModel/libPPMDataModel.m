uint64_t OTAResistanceDataReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v6;
  char v7;
  unsigned int v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t result;
  unint64_t *v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t *v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v6 = (int *)MEMORY[0x24BE7AF30];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v7 = 0;
      v8 = 0;
      v9 = 0;
      while (1)
      {
        v10 = *v3;
        v11 = *(_QWORD *)(a2 + v10);
        v12 = v11 + 1;
        if (v11 == -1 || v12 > *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v6) + v11);
        *(_QWORD *)(a2 + v10) = v12;
        v9 |= (unint64_t)(v13 & 0x7F) << v7;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v7 += 7;
        if (v8++ >= 9)
        {
          v9 = 0;
          v15 = *v5;
          v16 = *(unsigned __int8 *)(a2 + v15);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *v5;
      v16 = *(unsigned __int8 *)(a2 + v15);
      if (*(_BYTE *)(a2 + v15))
        v9 = 0;
LABEL_14:
      v17 = v9 & 7;
      if (v16 || v17 == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v9 >> 3) == 2)
        break;
      if ((v9 >> 3) == 1)
      {
        if (v17 != 2)
          goto LABEL_41;
        result = PBReaderPlaceMark();
        if (!(_DWORD)result)
          return result;
        while (1)
        {
          v20 = (unint64_t *)(a2 + *v3);
          v21 = *v20;
          v22 = *(_QWORD *)(a2 + *v4);
          if (*v20 >= v22)
            break;
          v23 = *v5;
          if (*(_BYTE *)(a2 + v23))
            break;
          if (v21 > 0xFFFFFFFFFFFFFFFBLL || v21 + 4 > v22)
            *(_BYTE *)(a2 + v23) = 1;
          else
            *v20 = v21 + 4;
          PBRepeatedFloatAdd();
        }
LABEL_40:
        PBReaderRecallMark();
        goto LABEL_46;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_46:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    if (v17 != 2)
    {
LABEL_41:
      v28 = *v3;
      v29 = *(_QWORD *)(a2 + v28);
      if (v29 <= 0xFFFFFFFFFFFFFFFBLL && v29 + 4 <= *(_QWORD *)(a2 + *v4))
        *(_QWORD *)(a2 + v28) = v29 + 4;
      else
        *(_BYTE *)(a2 + v15) = 1;
      PBRepeatedFloatAdd();
      goto LABEL_46;
    }
    result = PBReaderPlaceMark();
    if (!(_DWORD)result)
      return result;
    while (1)
    {
      v24 = (unint64_t *)(a2 + *v3);
      v25 = *v24;
      v26 = *(_QWORD *)(a2 + *v4);
      if (*v24 >= v26)
        break;
      v27 = *v5;
      if (*(_BYTE *)(a2 + v27))
        break;
      if (v25 > 0xFFFFFFFFFFFFFFFBLL || v25 + 4 > v26)
        *(_BYTE *)(a2 + v27) = 1;
      else
        *v24 = v25 + 4;
      PBRepeatedFloatAdd();
    }
    goto LABEL_40;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t OTAParamRCReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  uint64_t v15;
  int v16;
  int v17;
  OTAResistanceData *v19;
  uint64_t v20;
  uint64_t result;
  unint64_t *v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t *v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t *v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t *v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t *v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t *v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t *v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  char v50;
  unsigned int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  char v56;
  unint64_t *v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  int v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  unint64_t v67;
  unint64_t *v68;
  unint64_t v69;
  unint64_t v70;
  uint64_t v71;
  unint64_t *v72;
  unint64_t v73;
  unint64_t v74;
  uint64_t v75;
  unint64_t *v76;
  unint64_t v77;
  unint64_t v78;
  uint64_t v79;
  unint64_t *v80;
  unint64_t v81;
  unint64_t v82;
  uint64_t v83;
  unint64_t *v84;
  unint64_t v85;
  unint64_t v86;
  uint64_t v87;
  unint64_t *v88;
  unint64_t v89;
  unint64_t v90;
  uint64_t v91;
  unint64_t *v92;
  unint64_t v93;
  unint64_t v94;
  uint64_t v95;
  unint64_t *v96;
  unint64_t v97;
  unint64_t v98;
  uint64_t v99;
  unint64_t *v100;
  unint64_t v101;
  unint64_t v102;
  uint64_t v103;
  unint64_t *v104;
  unint64_t v105;
  unint64_t v106;
  uint64_t v107;
  unint64_t *v108;
  unint64_t v109;
  unint64_t v110;
  uint64_t v111;
  unint64_t *v112;
  unint64_t v113;
  unint64_t v114;
  uint64_t v115;
  unint64_t *v116;
  unint64_t v117;
  unint64_t v118;
  uint64_t v119;
  unint64_t *v120;
  unint64_t v121;
  unint64_t v122;
  uint64_t v123;
  char v124;
  unsigned int v125;
  uint64_t v126;
  uint64_t v127;
  unint64_t v128;
  char v129;
  uint64_t v130;
  unint64_t v131;
  unint64_t *v132;
  unint64_t v133;
  unint64_t v134;
  uint64_t v135;
  unint64_t *v136;
  unint64_t v137;
  unint64_t v138;
  uint64_t v139;
  unint64_t *v140;
  unint64_t v141;
  unint64_t v142;
  uint64_t v143;
  unint64_t *v144;
  unint64_t v145;
  unint64_t v146;
  uint64_t v147;
  unint64_t *v148;
  unint64_t v149;
  unint64_t v150;
  uint64_t v151;
  uint64_t v152;
  unint64_t v153;
  unint64_t i;
  uint64_t v155;
  uint64_t v156;
  unint64_t v157;
  uint64_t v158;
  uint64_t v159;
  unint64_t v160;
  uint64_t v161;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *v5;
          v16 = *(unsigned __int8 *)(a2 + v15);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *v5;
      v16 = *(unsigned __int8 *)(a2 + v15);
      if (*(_BYTE *)(a2 + v15))
        v10 = 0;
LABEL_14:
      v17 = v10 & 7;
      if (v16 || v17 == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      switch((v10 >> 3))
      {
        case 1u:
          v19 = objc_alloc_init(OTAResistanceData);
          v20 = 792;
          goto LABEL_293;
        case 2u:
          v19 = objc_alloc_init(OTAResistanceData);
          v20 = 800;
          goto LABEL_293;
        case 3u:
          v19 = objc_alloc_init(OTAResistanceData);
          v20 = 688;
          goto LABEL_293;
        case 4u:
          v19 = objc_alloc_init(OTAResistanceData);
          v20 = 808;
          goto LABEL_293;
        case 5u:
          v19 = objc_alloc_init(OTAResistanceData);
          v20 = 696;
          goto LABEL_293;
        case 6u:
          v19 = objc_alloc_init(OTAResistanceData);
          v20 = 824;
          goto LABEL_293;
        case 7u:
          v19 = objc_alloc_init(OTAResistanceData);
          v20 = 832;
          goto LABEL_293;
        case 8u:
          v19 = objc_alloc_init(OTAResistanceData);
          v20 = 840;
          goto LABEL_293;
        case 9u:
          if (v17 != 2)
            goto LABEL_336;
          result = PBReaderPlaceMark();
          if (!(_DWORD)result)
            return result;
          while (1)
          {
            v22 = (unint64_t *)(a2 + *v3);
            v23 = *v22;
            v24 = *(_QWORD *)(a2 + *v4);
            if (*v22 >= v24)
              break;
            v25 = *v5;
            if (*(_BYTE *)(a2 + v25))
              break;
            if (v23 > 0xFFFFFFFFFFFFFFFBLL || v23 + 4 > v24)
              *(_BYTE *)(a2 + v25) = 1;
            else
              *v22 = v23 + 4;
            PBRepeatedFloatAdd();
          }
          goto LABEL_323;
        case 0xAu:
          if (v17 != 2)
            goto LABEL_336;
          result = PBReaderPlaceMark();
          if (!(_DWORD)result)
            return result;
          while (1)
          {
            v26 = (unint64_t *)(a2 + *v3);
            v27 = *v26;
            v28 = *(_QWORD *)(a2 + *v4);
            if (*v26 >= v28)
              break;
            v29 = *v5;
            if (*(_BYTE *)(a2 + v29))
              break;
            if (v27 > 0xFFFFFFFFFFFFFFFBLL || v27 + 4 > v28)
              *(_BYTE *)(a2 + v29) = 1;
            else
              *v26 = v27 + 4;
            PBRepeatedFloatAdd();
          }
          goto LABEL_323;
        case 0xBu:
          if (v17 != 2)
            goto LABEL_336;
          result = PBReaderPlaceMark();
          if (!(_DWORD)result)
            return result;
          while (1)
          {
            v30 = (unint64_t *)(a2 + *v3);
            v31 = *v30;
            v32 = *(_QWORD *)(a2 + *v4);
            if (*v30 >= v32)
              break;
            v33 = *v5;
            if (*(_BYTE *)(a2 + v33))
              break;
            if (v31 > 0xFFFFFFFFFFFFFFFBLL || v31 + 4 > v32)
              *(_BYTE *)(a2 + v33) = 1;
            else
              *v30 = v31 + 4;
            PBRepeatedFloatAdd();
          }
          goto LABEL_323;
        case 0xCu:
          if (v17 != 2)
            goto LABEL_336;
          result = PBReaderPlaceMark();
          if (!(_DWORD)result)
            return result;
          while (1)
          {
            v34 = (unint64_t *)(a2 + *v3);
            v35 = *v34;
            v36 = *(_QWORD *)(a2 + *v4);
            if (*v34 >= v36)
              break;
            v37 = *v5;
            if (*(_BYTE *)(a2 + v37))
              break;
            if (v35 > 0xFFFFFFFFFFFFFFFBLL || v35 + 4 > v36)
              *(_BYTE *)(a2 + v37) = 1;
            else
              *v34 = v35 + 4;
            PBRepeatedFloatAdd();
          }
          goto LABEL_323;
        case 0xDu:
          if (v17 != 2)
            goto LABEL_336;
          result = PBReaderPlaceMark();
          if (!(_DWORD)result)
            return result;
          while (1)
          {
            v38 = (unint64_t *)(a2 + *v3);
            v39 = *v38;
            v40 = *(_QWORD *)(a2 + *v4);
            if (*v38 >= v40)
              break;
            v41 = *v5;
            if (*(_BYTE *)(a2 + v41))
              break;
            if (v39 > 0xFFFFFFFFFFFFFFFBLL || v39 + 4 > v40)
              *(_BYTE *)(a2 + v41) = 1;
            else
              *v38 = v39 + 4;
            PBRepeatedFloatAdd();
          }
          goto LABEL_323;
        case 0xEu:
          if (v17 != 2)
            goto LABEL_336;
          result = PBReaderPlaceMark();
          if (!(_DWORD)result)
            return result;
          while (1)
          {
            v42 = (unint64_t *)(a2 + *v3);
            v43 = *v42;
            v44 = *(_QWORD *)(a2 + *v4);
            if (*v42 >= v44)
              break;
            v45 = *v5;
            if (*(_BYTE *)(a2 + v45))
              break;
            if (v43 > 0xFFFFFFFFFFFFFFFBLL || v43 + 4 > v44)
              *(_BYTE *)(a2 + v45) = 1;
            else
              *v42 = v43 + 4;
            PBRepeatedFloatAdd();
          }
          goto LABEL_323;
        case 0xFu:
          if (v17 != 2)
            goto LABEL_336;
          result = PBReaderPlaceMark();
          if (!(_DWORD)result)
            return result;
          while (1)
          {
            v46 = (unint64_t *)(a2 + *v3);
            v47 = *v46;
            v48 = *(_QWORD *)(a2 + *v4);
            if (*v46 >= v48)
              break;
            v49 = *v5;
            if (*(_BYTE *)(a2 + v49))
              break;
            if (v47 > 0xFFFFFFFFFFFFFFFBLL || v47 + 4 > v48)
              *(_BYTE *)(a2 + v49) = 1;
            else
              *v46 = v47 + 4;
            PBRepeatedFloatAdd();
          }
          goto LABEL_323;
        case 0x10u:
          v19 = objc_alloc_init(OTAResistanceData);
          v20 = 680;
          goto LABEL_293;
        case 0x11u:
          v19 = objc_alloc_init(OTABMUResistance);
          objc_storeStrong((id *)(a1 + 760), v19);
          if (!PBReaderPlaceMark() || !OTABMUResistanceReadFrom((uint64_t)v19, a2))
            goto LABEL_355;
          goto LABEL_295;
        case 0x12u:
          v50 = 0;
          v51 = 0;
          v52 = 0;
          while (2)
          {
            v53 = *v3;
            v54 = *(_QWORD *)(a2 + v53);
            v55 = v54 + 1;
            if (v54 == -1 || v55 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v56 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v54);
              *(_QWORD *)(a2 + v53) = v55;
              v52 |= (unint64_t)(v56 & 0x7F) << v50;
              if (v56 < 0)
              {
                v50 += 7;
                v14 = v51++ >= 9;
                if (v14)
                {
                  LODWORD(v52) = 0;
                  goto LABEL_330;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v52) = 0;
LABEL_330:
          v158 = 768;
          goto LABEL_335;
        case 0x13u:
          if (v17 != 2)
            goto LABEL_336;
          result = PBReaderPlaceMark();
          if (!(_DWORD)result)
            return result;
          while (1)
          {
            v57 = (unint64_t *)(a2 + *v3);
            v58 = *v57;
            v59 = *(_QWORD *)(a2 + *v4);
            if (*v57 >= v59)
              break;
            v60 = *v5;
            if (*(_BYTE *)(a2 + v60))
              break;
            if (v58 > 0xFFFFFFFFFFFFFFFBLL || v58 + 4 > v59)
              *(_BYTE *)(a2 + v60) = 1;
            else
              *v57 = v58 + 4;
            PBRepeatedFloatAdd();
          }
          goto LABEL_323;
        case 0x14u:
          v19 = objc_alloc_init(OTAResistanceData);
          v20 = 704;
          goto LABEL_293;
        case 0x15u:
          *(_BYTE *)(a1 + 868) |= 8u;
          v61 = *v3;
          v62 = *(_QWORD *)(a2 + v61);
          if (v62 <= 0xFFFFFFFFFFFFFFFBLL && v62 + 4 <= *(_QWORD *)(a2 + *v4))
          {
            v63 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v62);
            *(_QWORD *)(a2 + v61) = v62 + 4;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v63 = 0;
          }
          v161 = 780;
          goto LABEL_351;
        case 0x16u:
          *(_BYTE *)(a1 + 868) |= 0x10u;
          v64 = *v3;
          v65 = *(_QWORD *)(a2 + v64);
          if (v65 <= 0xFFFFFFFFFFFFFFFBLL && v65 + 4 <= *(_QWORD *)(a2 + *v4))
          {
            v63 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v65);
            *(_QWORD *)(a2 + v64) = v65 + 4;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v63 = 0;
          }
          v161 = 784;
          goto LABEL_351;
        case 0x17u:
          *(_BYTE *)(a1 + 868) |= 1u;
          v66 = *v3;
          v67 = *(_QWORD *)(a2 + v66);
          if (v67 <= 0xFFFFFFFFFFFFFFFBLL && v67 + 4 <= *(_QWORD *)(a2 + *v4))
          {
            v63 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v67);
            *(_QWORD *)(a2 + v66) = v67 + 4;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v63 = 0;
          }
          v161 = 752;
          goto LABEL_351;
        case 0x18u:
          if (v17 != 2)
            goto LABEL_336;
          result = PBReaderPlaceMark();
          if (!(_DWORD)result)
            return result;
          while (1)
          {
            v68 = (unint64_t *)(a2 + *v3);
            v69 = *v68;
            v70 = *(_QWORD *)(a2 + *v4);
            if (*v68 >= v70)
              break;
            v71 = *v5;
            if (*(_BYTE *)(a2 + v71))
              break;
            if (v69 > 0xFFFFFFFFFFFFFFFBLL || v69 + 4 > v70)
              *(_BYTE *)(a2 + v71) = 1;
            else
              *v68 = v69 + 4;
            PBRepeatedFloatAdd();
          }
          goto LABEL_323;
        case 0x19u:
          if (v17 != 2)
            goto LABEL_336;
          result = PBReaderPlaceMark();
          if (!(_DWORD)result)
            return result;
          while (1)
          {
            v72 = (unint64_t *)(a2 + *v3);
            v73 = *v72;
            v74 = *(_QWORD *)(a2 + *v4);
            if (*v72 >= v74)
              break;
            v75 = *v5;
            if (*(_BYTE *)(a2 + v75))
              break;
            if (v73 > 0xFFFFFFFFFFFFFFFBLL || v73 + 4 > v74)
              *(_BYTE *)(a2 + v75) = 1;
            else
              *v72 = v73 + 4;
            PBRepeatedFloatAdd();
          }
          goto LABEL_323;
        case 0x1Au:
          if (v17 != 2)
            goto LABEL_336;
          result = PBReaderPlaceMark();
          if (!(_DWORD)result)
            return result;
          while (1)
          {
            v76 = (unint64_t *)(a2 + *v3);
            v77 = *v76;
            v78 = *(_QWORD *)(a2 + *v4);
            if (*v76 >= v78)
              break;
            v79 = *v5;
            if (*(_BYTE *)(a2 + v79))
              break;
            if (v77 > 0xFFFFFFFFFFFFFFFBLL || v77 + 4 > v78)
              *(_BYTE *)(a2 + v79) = 1;
            else
              *v76 = v77 + 4;
            PBRepeatedFloatAdd();
          }
          goto LABEL_323;
        case 0x1Bu:
          if (v17 != 2)
            goto LABEL_336;
          result = PBReaderPlaceMark();
          if (!(_DWORD)result)
            return result;
          while (1)
          {
            v80 = (unint64_t *)(a2 + *v3);
            v81 = *v80;
            v82 = *(_QWORD *)(a2 + *v4);
            if (*v80 >= v82)
              break;
            v83 = *v5;
            if (*(_BYTE *)(a2 + v83))
              break;
            if (v81 > 0xFFFFFFFFFFFFFFFBLL || v81 + 4 > v82)
              *(_BYTE *)(a2 + v83) = 1;
            else
              *v80 = v81 + 4;
            PBRepeatedFloatAdd();
          }
          goto LABEL_323;
        case 0x1Cu:
          v19 = objc_alloc_init(OTAResistanceData);
          v20 = 816;
          goto LABEL_293;
        case 0x1Du:
          v19 = objc_alloc_init(OTAResistanceData);
          v20 = 848;
          goto LABEL_293;
        case 0x1Eu:
          v19 = objc_alloc_init(OTAResistanceData);
          v20 = 712;
          goto LABEL_293;
        case 0x1Fu:
          v19 = objc_alloc_init(OTAResistanceData);
          v20 = 720;
          goto LABEL_293;
        case 0x20u:
          v19 = objc_alloc_init(OTAResistanceData);
          v20 = 728;
          goto LABEL_293;
        case 0x21u:
          v19 = objc_alloc_init(OTAResistanceData);
          v20 = 736;
          goto LABEL_293;
        case 0x22u:
          v19 = objc_alloc_init(OTAResistanceData);
          v20 = 744;
          goto LABEL_293;
        case 0x23u:
          if (v17 != 2)
            goto LABEL_336;
          result = PBReaderPlaceMark();
          if (!(_DWORD)result)
            return result;
          while (1)
          {
            v84 = (unint64_t *)(a2 + *v3);
            v85 = *v84;
            v86 = *(_QWORD *)(a2 + *v4);
            if (*v84 >= v86)
              break;
            v87 = *v5;
            if (*(_BYTE *)(a2 + v87))
              break;
            if (v85 > 0xFFFFFFFFFFFFFFFBLL || v85 + 4 > v86)
              *(_BYTE *)(a2 + v87) = 1;
            else
              *v84 = v85 + 4;
            PBRepeatedFloatAdd();
          }
          goto LABEL_323;
        case 0x24u:
          if (v17 != 2)
            goto LABEL_336;
          result = PBReaderPlaceMark();
          if (!(_DWORD)result)
            return result;
          while (1)
          {
            v88 = (unint64_t *)(a2 + *v3);
            v89 = *v88;
            v90 = *(_QWORD *)(a2 + *v4);
            if (*v88 >= v90)
              break;
            v91 = *v5;
            if (*(_BYTE *)(a2 + v91))
              break;
            if (v89 > 0xFFFFFFFFFFFFFFFBLL || v89 + 4 > v90)
              *(_BYTE *)(a2 + v91) = 1;
            else
              *v88 = v89 + 4;
            PBRepeatedFloatAdd();
          }
          goto LABEL_323;
        case 0x25u:
          if (v17 != 2)
            goto LABEL_336;
          result = PBReaderPlaceMark();
          if (!(_DWORD)result)
            return result;
          while (1)
          {
            v92 = (unint64_t *)(a2 + *v3);
            v93 = *v92;
            v94 = *(_QWORD *)(a2 + *v4);
            if (*v92 >= v94)
              break;
            v95 = *v5;
            if (*(_BYTE *)(a2 + v95))
              break;
            if (v93 > 0xFFFFFFFFFFFFFFFBLL || v93 + 4 > v94)
              *(_BYTE *)(a2 + v95) = 1;
            else
              *v92 = v93 + 4;
            PBRepeatedFloatAdd();
          }
          goto LABEL_323;
        case 0x26u:
          if (v17 != 2)
            goto LABEL_336;
          result = PBReaderPlaceMark();
          if (!(_DWORD)result)
            return result;
          while (1)
          {
            v96 = (unint64_t *)(a2 + *v3);
            v97 = *v96;
            v98 = *(_QWORD *)(a2 + *v4);
            if (*v96 >= v98)
              break;
            v99 = *v5;
            if (*(_BYTE *)(a2 + v99))
              break;
            if (v97 > 0xFFFFFFFFFFFFFFFBLL || v97 + 4 > v98)
              *(_BYTE *)(a2 + v99) = 1;
            else
              *v96 = v97 + 4;
            PBRepeatedFloatAdd();
          }
          goto LABEL_323;
        case 0x27u:
          if (v17 != 2)
            goto LABEL_336;
          result = PBReaderPlaceMark();
          if (!(_DWORD)result)
            return result;
          while (1)
          {
            v100 = (unint64_t *)(a2 + *v3);
            v101 = *v100;
            v102 = *(_QWORD *)(a2 + *v4);
            if (*v100 >= v102)
              break;
            v103 = *v5;
            if (*(_BYTE *)(a2 + v103))
              break;
            if (v101 > 0xFFFFFFFFFFFFFFFBLL || v101 + 4 > v102)
              *(_BYTE *)(a2 + v103) = 1;
            else
              *v100 = v101 + 4;
            PBRepeatedFloatAdd();
          }
          goto LABEL_323;
        case 0x28u:
          if (v17 != 2)
            goto LABEL_336;
          result = PBReaderPlaceMark();
          if (!(_DWORD)result)
            return result;
          while (1)
          {
            v104 = (unint64_t *)(a2 + *v3);
            v105 = *v104;
            v106 = *(_QWORD *)(a2 + *v4);
            if (*v104 >= v106)
              break;
            v107 = *v5;
            if (*(_BYTE *)(a2 + v107))
              break;
            if (v105 > 0xFFFFFFFFFFFFFFFBLL || v105 + 4 > v106)
              *(_BYTE *)(a2 + v107) = 1;
            else
              *v104 = v105 + 4;
            PBRepeatedFloatAdd();
          }
          goto LABEL_323;
        case 0x29u:
          if (v17 != 2)
            goto LABEL_336;
          result = PBReaderPlaceMark();
          if (!(_DWORD)result)
            return result;
          while (1)
          {
            v108 = (unint64_t *)(a2 + *v3);
            v109 = *v108;
            v110 = *(_QWORD *)(a2 + *v4);
            if (*v108 >= v110)
              break;
            v111 = *v5;
            if (*(_BYTE *)(a2 + v111))
              break;
            if (v109 > 0xFFFFFFFFFFFFFFFBLL || v109 + 4 > v110)
              *(_BYTE *)(a2 + v111) = 1;
            else
              *v108 = v109 + 4;
            PBRepeatedFloatAdd();
          }
          goto LABEL_323;
        case 0x2Au:
          if (v17 != 2)
            goto LABEL_336;
          result = PBReaderPlaceMark();
          if (!(_DWORD)result)
            return result;
          while (1)
          {
            v112 = (unint64_t *)(a2 + *v3);
            v113 = *v112;
            v114 = *(_QWORD *)(a2 + *v4);
            if (*v112 >= v114)
              break;
            v115 = *v5;
            if (*(_BYTE *)(a2 + v115))
              break;
            if (v113 > 0xFFFFFFFFFFFFFFFBLL || v113 + 4 > v114)
              *(_BYTE *)(a2 + v115) = 1;
            else
              *v112 = v113 + 4;
            PBRepeatedFloatAdd();
          }
          goto LABEL_323;
        case 0x2Bu:
          if (v17 != 2)
            goto LABEL_336;
          result = PBReaderPlaceMark();
          if (!(_DWORD)result)
            return result;
          while (1)
          {
            v116 = (unint64_t *)(a2 + *v3);
            v117 = *v116;
            v118 = *(_QWORD *)(a2 + *v4);
            if (*v116 >= v118)
              break;
            v119 = *v5;
            if (*(_BYTE *)(a2 + v119))
              break;
            if (v117 > 0xFFFFFFFFFFFFFFFBLL || v117 + 4 > v118)
              *(_BYTE *)(a2 + v119) = 1;
            else
              *v116 = v117 + 4;
            PBRepeatedFloatAdd();
          }
          goto LABEL_323;
        case 0x2Cu:
          if (v17 != 2)
            goto LABEL_336;
          result = PBReaderPlaceMark();
          if (!(_DWORD)result)
            return result;
          while (1)
          {
            v120 = (unint64_t *)(a2 + *v3);
            v121 = *v120;
            v122 = *(_QWORD *)(a2 + *v4);
            if (*v120 >= v122)
              break;
            v123 = *v5;
            if (*(_BYTE *)(a2 + v123))
              break;
            if (v121 > 0xFFFFFFFFFFFFFFFBLL || v121 + 4 > v122)
              *(_BYTE *)(a2 + v123) = 1;
            else
              *v120 = v121 + 4;
            PBRepeatedFloatAdd();
          }
          goto LABEL_323;
        case 0x2Du:
          v124 = 0;
          v125 = 0;
          v52 = 0;
          *(_BYTE *)(a1 + 868) |= 2u;
          while (2)
          {
            v126 = *v3;
            v127 = *(_QWORD *)(a2 + v126);
            v128 = v127 + 1;
            if (v127 == -1 || v128 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v129 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v127);
              *(_QWORD *)(a2 + v126) = v128;
              v52 |= (unint64_t)(v129 & 0x7F) << v124;
              if (v129 < 0)
              {
                v124 += 7;
                v14 = v125++ >= 9;
                if (v14)
                {
                  LODWORD(v52) = 0;
                  goto LABEL_334;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v52) = 0;
LABEL_334:
          v158 = 772;
LABEL_335:
          *(_DWORD *)(a1 + v158) = v52;
          goto LABEL_352;
        case 0x2Eu:
          *(_BYTE *)(a1 + 868) |= 0x20u;
          v130 = *v3;
          v131 = *(_QWORD *)(a2 + v130);
          if (v131 <= 0xFFFFFFFFFFFFFFFBLL && v131 + 4 <= *(_QWORD *)(a2 + *v4))
          {
            v63 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v131);
            *(_QWORD *)(a2 + v130) = v131 + 4;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v63 = 0;
          }
          v161 = 864;
          goto LABEL_351;
        case 0x2Fu:
          if (v17 != 2)
            goto LABEL_336;
          result = PBReaderPlaceMark();
          if (!(_DWORD)result)
            return result;
          while (1)
          {
            v132 = (unint64_t *)(a2 + *v3);
            v133 = *v132;
            v134 = *(_QWORD *)(a2 + *v4);
            if (*v132 >= v134)
              break;
            v135 = *v5;
            if (*(_BYTE *)(a2 + v135))
              break;
            if (v133 > 0xFFFFFFFFFFFFFFFBLL || v133 + 4 > v134)
              *(_BYTE *)(a2 + v135) = 1;
            else
              *v132 = v133 + 4;
            PBRepeatedFloatAdd();
          }
          goto LABEL_323;
        case 0x30u:
          if (v17 != 2)
            goto LABEL_336;
          result = PBReaderPlaceMark();
          if (!(_DWORD)result)
            return result;
          while (1)
          {
            v136 = (unint64_t *)(a2 + *v3);
            v137 = *v136;
            v138 = *(_QWORD *)(a2 + *v4);
            if (*v136 >= v138)
              break;
            v139 = *v5;
            if (*(_BYTE *)(a2 + v139))
              break;
            if (v137 > 0xFFFFFFFFFFFFFFFBLL || v137 + 4 > v138)
              *(_BYTE *)(a2 + v139) = 1;
            else
              *v136 = v137 + 4;
            PBRepeatedFloatAdd();
          }
          goto LABEL_323;
        case 0x31u:
          if (v17 != 2)
            goto LABEL_336;
          result = PBReaderPlaceMark();
          if (!(_DWORD)result)
            return result;
          while (1)
          {
            v140 = (unint64_t *)(a2 + *v3);
            v141 = *v140;
            v142 = *(_QWORD *)(a2 + *v4);
            if (*v140 >= v142)
              break;
            v143 = *v5;
            if (*(_BYTE *)(a2 + v143))
              break;
            if (v141 > 0xFFFFFFFFFFFFFFFBLL || v141 + 4 > v142)
              *(_BYTE *)(a2 + v143) = 1;
            else
              *v140 = v141 + 4;
            PBRepeatedFloatAdd();
          }
          goto LABEL_323;
        case 0x32u:
          v19 = objc_alloc_init(OTAResistanceData);
          v20 = 856;
LABEL_293:
          objc_storeStrong((id *)(a1 + v20), v19);
          if (!PBReaderPlaceMark() || (OTAResistanceDataReadFrom((uint64_t)v19, a2) & 1) == 0)
          {
LABEL_355:

            return 0;
          }
LABEL_295:
          PBReaderRecallMark();

LABEL_352:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          break;
        case 0x33u:
          if (v17 != 2)
            goto LABEL_336;
          result = PBReaderPlaceMark();
          if (!(_DWORD)result)
            return result;
          while (1)
          {
            v144 = (unint64_t *)(a2 + *v3);
            v145 = *v144;
            v146 = *(_QWORD *)(a2 + *v4);
            if (*v144 >= v146)
              break;
            v147 = *v5;
            if (*(_BYTE *)(a2 + v147))
              break;
            if (v145 > 0xFFFFFFFFFFFFFFFBLL || v145 + 4 > v146)
              *(_BYTE *)(a2 + v147) = 1;
            else
              *v144 = v145 + 4;
            PBRepeatedFloatAdd();
          }
          goto LABEL_323;
        case 0x34u:
          if (v17 != 2)
            goto LABEL_336;
          result = PBReaderPlaceMark();
          if (!(_DWORD)result)
            return result;
          while (1)
          {
            v148 = (unint64_t *)(a2 + *v3);
            v149 = *v148;
            v150 = *(_QWORD *)(a2 + *v4);
            if (*v148 >= v150)
              break;
            v151 = *v5;
            if (*(_BYTE *)(a2 + v151))
              break;
            if (v149 > 0xFFFFFFFFFFFFFFFBLL || v149 + 4 > v150)
              *(_BYTE *)(a2 + v151) = 1;
            else
              *v148 = v149 + 4;
            PBRepeatedFloatAdd();
          }
          goto LABEL_323;
        case 0x35u:
          if (v17 == 2)
          {
            result = PBReaderPlaceMark();
            if (!(_DWORD)result)
              return result;
            v152 = *v3;
            v153 = *(_QWORD *)(a2 + v152);
            for (i = *(_QWORD *)(a2 + *v4); v153 < i; i = *(_QWORD *)(a2 + *v4))
            {
              v155 = *v5;
              if (*(_BYTE *)(a2 + v155))
                break;
              if (v153 <= 0xFFFFFFFFFFFFFFFBLL && v153 + 4 <= i)
                *(_QWORD *)(a2 + (int)v152) = v153 + 4;
              else
                *(_BYTE *)(a2 + v155) = 1;
              PBRepeatedFloatAdd();
              v152 = *v3;
              v153 = *(_QWORD *)(a2 + v152);
            }
LABEL_323:
            PBReaderRecallMark();
          }
          else
          {
LABEL_336:
            v159 = *v3;
            v160 = *(_QWORD *)(a2 + v159);
            if (v160 <= 0xFFFFFFFFFFFFFFFBLL && v160 + 4 <= *(_QWORD *)(a2 + *v4))
              *(_QWORD *)(a2 + v159) = v160 + 4;
            else
              *(_BYTE *)(a2 + v15) = 1;
            PBRepeatedFloatAdd();
          }
          goto LABEL_352;
        case 0x36u:
          *(_BYTE *)(a1 + 868) |= 4u;
          v156 = *v3;
          v157 = *(_QWORD *)(a2 + v156);
          if (v157 <= 0xFFFFFFFFFFFFFFFBLL && v157 + 4 <= *(_QWORD *)(a2 + *v4))
          {
            v63 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v157);
            *(_QWORD *)(a2 + v156) = v157 + 4;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v63 = 0;
          }
          v161 = 776;
LABEL_351:
          *(_DWORD *)(a1 + v161) = v63;
          goto LABEL_352;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          goto LABEL_352;
      }
    }
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL OTABMUResistanceReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  int v16;
  uint64_t v18;
  unint64_t v19;
  int v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  int *v37;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      switch((v10 >> 3))
      {
        case 1u:
          *(_WORD *)(a1 + 44) |= 0x80u;
          v18 = *v3;
          v19 = *(_QWORD *)(a2 + v18);
          if (v19 <= 0xFFFFFFFFFFFFFFFBLL && v19 + 4 <= *(_QWORD *)(a2 + *v4))
          {
            v20 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v19);
            *(_QWORD *)(a2 + v18) = v19 + 4;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v20 = 0;
          }
          v37 = &OBJC_IVAR___OTABMUResistance__traceResistance25C;
          goto LABEL_66;
        case 2u:
          *(_WORD *)(a1 + 44) |= 0x100u;
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          if (v22 <= 0xFFFFFFFFFFFFFFFBLL && v22 + 4 <= *(_QWORD *)(a2 + *v4))
          {
            v20 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v22);
            *(_QWORD *)(a2 + v21) = v22 + 4;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v20 = 0;
          }
          v37 = &OBJC_IVAR___OTABMUResistance__traceResistanceTemperatureCoeff;
          goto LABEL_66;
        case 3u:
          *(_WORD *)(a1 + 44) |= 0x40u;
          v23 = *v3;
          v24 = *(_QWORD *)(a2 + v23);
          if (v24 <= 0xFFFFFFFFFFFFFFFBLL && v24 + 4 <= *(_QWORD *)(a2 + *v4))
          {
            v20 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v24);
            *(_QWORD *)(a2 + v23) = v24 + 4;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v20 = 0;
          }
          v37 = &OBJC_IVAR___OTABMUResistance__systemEquivalentResistance;
          goto LABEL_66;
        case 4u:
          *(_WORD *)(a1 + 44) |= 1u;
          v25 = *v3;
          v26 = *(_QWORD *)(a2 + v25);
          if (v26 <= 0xFFFFFFFFFFFFFFFBLL && v26 + 4 <= *(_QWORD *)(a2 + *v4))
          {
            v20 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v26);
            *(_QWORD *)(a2 + v25) = v26 + 4;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v20 = 0;
          }
          v37 = &OBJC_IVAR___OTABMUResistance__downstreamCommonResistance;
          goto LABEL_66;
        case 5u:
          *(_WORD *)(a1 + 44) |= 2u;
          v27 = *v3;
          v28 = *(_QWORD *)(a2 + v27);
          if (v28 <= 0xFFFFFFFFFFFFFFFBLL && v28 + 4 <= *(_QWORD *)(a2 + *v4))
          {
            v20 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v28);
            *(_QWORD *)(a2 + v27) = v28 + 4;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v20 = 0;
          }
          v37 = &OBJC_IVAR___OTABMUResistance__downstreamNorthResistance;
          goto LABEL_66;
        case 6u:
          *(_WORD *)(a1 + 44) |= 8u;
          v29 = *v3;
          v30 = *(_QWORD *)(a2 + v29);
          if (v30 <= 0xFFFFFFFFFFFFFFFBLL && v30 + 4 <= *(_QWORD *)(a2 + *v4))
          {
            v20 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v30);
            *(_QWORD *)(a2 + v29) = v30 + 4;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v20 = 0;
          }
          v37 = &OBJC_IVAR___OTABMUResistance__resistanceGGToVcut;
          goto LABEL_66;
        case 7u:
          *(_WORD *)(a1 + 44) |= 0x10u;
          v31 = *v3;
          v32 = *(_QWORD *)(a2 + v31);
          if (v32 <= 0xFFFFFFFFFFFFFFFBLL && v32 + 4 <= *(_QWORD *)(a2 + *v4))
          {
            v20 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v32);
            *(_QWORD *)(a2 + v31) = v32 + 4;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v20 = 0;
          }
          v37 = &OBJC_IVAR___OTABMUResistance__resistancePMUToVcut;
          goto LABEL_66;
        case 8u:
          *(_WORD *)(a1 + 44) |= 0x20u;
          v33 = *v3;
          v34 = *(_QWORD *)(a2 + v33);
          if (v34 <= 0xFFFFFFFFFFFFFFFBLL && v34 + 4 <= *(_QWORD *)(a2 + *v4))
          {
            v20 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v34);
            *(_QWORD *)(a2 + v33) = v34 + 4;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v20 = 0;
          }
          v37 = &OBJC_IVAR___OTABMUResistance__resistanceVcutToPmax;
          goto LABEL_66;
        case 9u:
          *(_WORD *)(a1 + 44) |= 4u;
          v35 = *v3;
          v36 = *(_QWORD *)(a2 + v35);
          if (v36 <= 0xFFFFFFFFFFFFFFFBLL && v36 + 4 <= *(_QWORD *)(a2 + *v4))
          {
            v20 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v36);
            *(_QWORD *)(a2 + v35) = v36 + 4;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v20 = 0;
          }
          v37 = &OBJC_IVAR___OTABMUResistance__resistanceCellTabToGG;
LABEL_66:
          *(_DWORD *)(a1 + *v37) = v20;
          goto LABEL_67;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0)
            return 0;
LABEL_67:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          break;
      }
    }
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t PBDataWriterWriteFloatField()
{
  return MEMORY[0x24BE7AFA0]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x24BE7AFA8]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x24BE7AFE8]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x24BE7AFF0]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x24BE7B018]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x24BE7B038]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x24BE7B048]();
}

uint64_t PBRepeatedFloatAdd()
{
  return MEMORY[0x24BE7B090]();
}

uint64_t PBRepeatedFloatClear()
{
  return MEMORY[0x24BE7B098]();
}

uint64_t PBRepeatedFloatCopy()
{
  return MEMORY[0x24BE7B0A0]();
}

uint64_t PBRepeatedFloatHash()
{
  return MEMORY[0x24BE7B0A8]();
}

uint64_t PBRepeatedFloatIsEqual()
{
  return MEMORY[0x24BE7B0B0]();
}

uint64_t PBRepeatedFloatNSArray()
{
  return MEMORY[0x24BE7B0B8]();
}

uint64_t PBRepeatedFloatSet()
{
  return MEMORY[0x24BE7B0C0]();
}

float fmodf(float a1, float a2)
{
  float result;

  MEMORY[0x24BDAE3F8](a1, a2);
  return result;
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
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

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

