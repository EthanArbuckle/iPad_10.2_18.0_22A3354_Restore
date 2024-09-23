void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t ATXHeroEntriesPbReadFrom(char *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  char v11;
  unsigned int v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  BOOL v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  int v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t result;
  char v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  char v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  char v44;
  char v45;
  unsigned int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  char v51;
  char v52;
  unsigned int v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  char v58;
  char v59;
  unsigned int v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  char v65;
  char v66;
  unsigned int v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  char v72;
  unint64_t v73;
  unint64_t v74;
  unint64_t v75;
  void *v76;
  char v77;
  unsigned int v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  char v83;
  char v84;
  unsigned int v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  char v90;
  char v91;
  unsigned int v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  char v97;
  char v98;
  unsigned int v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  unint64_t v103;
  char v104;
  char v105;
  unsigned int v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  unint64_t v110;
  char v111;
  char v112;
  unsigned int v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  unint64_t v117;
  char v118;
  char v119;
  unsigned int v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  unint64_t v124;
  char v125;
  char v126;
  unsigned int v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  unint64_t v131;
  char v132;
  uint64_t v133;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    v8 = 0x254D86000uLL;
    v9 = 0x254D86000uLL;
    v10 = 0x254D86000uLL;
    while (2)
    {
      if (!*(_BYTE *)(a2 + *v5))
      {
        v11 = 0;
        v12 = 0;
        v13 = 0;
        while (1)
        {
          v14 = *v3;
          v15 = *(_QWORD *)(a2 + v14);
          v16 = v15 + 1;
          if (v15 == -1 || v16 > *(_QWORD *)(a2 + *v4))
            break;
          v17 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v15);
          *(_QWORD *)(a2 + v14) = v16;
          v13 |= (unint64_t)(v17 & 0x7F) << v11;
          if ((v17 & 0x80) == 0)
            goto LABEL_12;
          v11 += 7;
          v18 = v12++ >= 9;
          if (v18)
          {
            v13 = 0;
            v19 = *v5;
            v20 = *(unsigned __int8 *)(a2 + v19);
            goto LABEL_14;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
        v19 = *v5;
        v20 = *(unsigned __int8 *)(a2 + v19);
        if (*(_BYTE *)(a2 + v19))
          v13 = 0;
LABEL_14:
        v21 = v13 & 7;
        if (!v20 && v21 != 4)
        {
          switch((v13 >> 3))
          {
            case 1u:
              v23 = *v3;
              v24 = *(_QWORD *)(a2 + v23);
              if (v24 <= 0xFFFFFFFFFFFFFFFBLL && (v25 = v24 + 4, v24 + 4 <= *(_QWORD *)(a2 + *v4)))
              {
                v26 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v24);
                *(_QWORD *)(a2 + v23) = v25;
              }
              else
              {
                v26 = 0;
                *(_BYTE *)(a2 + v19) = 1;
              }
              v133 = 184;
              goto LABEL_185;
            case 2u:
              v27 = *v3;
              v28 = *(_QWORD *)(a2 + v27);
              if (v28 <= 0xFFFFFFFFFFFFFFFBLL && (v29 = v28 + 4, v28 + 4 <= *(_QWORD *)(a2 + *v4)))
              {
                v26 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v28);
                *(_QWORD *)(a2 + v27) = v29;
              }
              else
              {
                v26 = 0;
                *(_BYTE *)(a2 + v19) = 1;
              }
              v133 = 188;
LABEL_185:
              *(_DWORD *)&a1[v133] = v26;
              goto LABEL_186;
            case 3u:
              if (v21 != 2)
              {
                v84 = 0;
                v85 = 0;
                v86 = 0;
                while (1)
                {
                  v87 = *v3;
                  v88 = *(_QWORD *)(a2 + v87);
                  v89 = v88 + 1;
                  if (v88 == -1 || v89 > *(_QWORD *)(a2 + *v4))
                    goto LABEL_138;
                  v90 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v88);
                  *(_QWORD *)(a2 + v87) = v89;
                  v86 |= (unint64_t)(v90 & 0x7F) << v84;
                  if (v90 < 0)
                  {
                    v84 += 7;
                    v18 = v85++ >= 9;
                    if (!v18)
                      continue;
                  }
                  goto LABEL_139;
                }
              }
              result = PBReaderPlaceMark();
              if (!(_DWORD)result)
                return result;
              while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4) && !*(_BYTE *)(a2 + *v5))
              {
                v31 = 0;
                v32 = 0;
                v33 = 0;
                while (1)
                {
                  v34 = *v3;
                  v35 = *(_QWORD *)(a2 + v34);
                  v36 = v35 + 1;
                  if (v35 == -1 || v36 > *(_QWORD *)(a2 + *v4))
                    break;
                  v37 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v35);
                  *(_QWORD *)(a2 + v34) = v36;
                  v33 |= (unint64_t)(v37 & 0x7F) << v31;
                  if (v37 < 0)
                  {
                    v31 += 7;
                    v18 = v32++ >= 9;
                    if (!v18)
                      continue;
                  }
                  goto LABEL_37;
                }
                *(_BYTE *)(a2 + *v5) = 1;
LABEL_37:
                PBRepeatedInt32Add();
              }
              goto LABEL_123;
            case 4u:
              if (v21 != 2)
              {
                v91 = 0;
                v92 = 0;
                v93 = 0;
                while (1)
                {
                  v94 = *v3;
                  v95 = *(_QWORD *)(a2 + v94);
                  v96 = v95 + 1;
                  if (v95 == -1 || v96 > *(_QWORD *)(a2 + *v4))
                    break;
                  v97 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v95);
                  *(_QWORD *)(a2 + v94) = v96;
                  v93 |= (unint64_t)(v97 & 0x7F) << v91;
                  if (v97 < 0)
                  {
                    v91 += 7;
                    v18 = v92++ >= 9;
                    if (!v18)
                      continue;
                  }
                  goto LABEL_139;
                }
LABEL_138:
                *(_BYTE *)(a2 + *v5) = 1;
LABEL_139:
                PBRepeatedInt32Add();
                goto LABEL_186;
              }
              result = PBReaderPlaceMark();
              if (!(_DWORD)result)
                return result;
              while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4) && !*(_BYTE *)(a2 + *v5))
              {
                v38 = 0;
                v39 = 0;
                v40 = 0;
                while (1)
                {
                  v41 = *v3;
                  v42 = *(_QWORD *)(a2 + v41);
                  v43 = v42 + 1;
                  if (v42 == -1 || v43 > *(_QWORD *)(a2 + *v4))
                    break;
                  v44 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v42);
                  *(_QWORD *)(a2 + v41) = v43;
                  v40 |= (unint64_t)(v44 & 0x7F) << v38;
                  if (v44 < 0)
                  {
                    v38 += 7;
                    v18 = v39++ >= 9;
                    if (!v18)
                      continue;
                  }
                  goto LABEL_50;
                }
                *(_BYTE *)(a2 + *v5) = 1;
LABEL_50:
                PBRepeatedInt32Add();
              }
              goto LABEL_123;
            case 5u:
              if (v21 != 2)
              {
                v98 = 0;
                v99 = 0;
                v100 = 0;
                while (1)
                {
                  v101 = *v3;
                  v102 = *(_QWORD *)(a2 + v101);
                  v103 = v102 + 1;
                  if (v102 == -1 || v103 > *(_QWORD *)(a2 + *v4))
                    goto LABEL_168;
                  v104 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v102);
                  *(_QWORD *)(a2 + v101) = v103;
                  v100 |= (unint64_t)(v104 & 0x7F) << v98;
                  if (v104 < 0)
                  {
                    v98 += 7;
                    v18 = v99++ >= 9;
                    if (!v18)
                      continue;
                  }
                  goto LABEL_169;
                }
              }
              result = PBReaderPlaceMark();
              if (!(_DWORD)result)
                return result;
              while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4) && !*(_BYTE *)(a2 + *v5))
              {
                v45 = 0;
                v46 = 0;
                v47 = 0;
                while (1)
                {
                  v48 = *v3;
                  v49 = *(_QWORD *)(a2 + v48);
                  v50 = v49 + 1;
                  if (v49 == -1 || v50 > *(_QWORD *)(a2 + *v4))
                    break;
                  v51 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v49);
                  *(_QWORD *)(a2 + v48) = v50;
                  v47 |= (unint64_t)(v51 & 0x7F) << v45;
                  if (v51 < 0)
                  {
                    v45 += 7;
                    v18 = v46++ >= 9;
                    if (!v18)
                      continue;
                  }
                  goto LABEL_63;
                }
                *(_BYTE *)(a2 + *v5) = 1;
LABEL_63:
                PBRepeatedUInt32Add();
              }
              goto LABEL_123;
            case 6u:
              if (v21 != 2)
              {
                v105 = 0;
                v106 = 0;
                v107 = 0;
                while (1)
                {
                  v108 = *v3;
                  v109 = *(_QWORD *)(a2 + v108);
                  v110 = v109 + 1;
                  if (v109 == -1 || v110 > *(_QWORD *)(a2 + *v4))
                    break;
                  v111 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v109);
                  *(_QWORD *)(a2 + v108) = v110;
                  v107 |= (unint64_t)(v111 & 0x7F) << v105;
                  if (v111 < 0)
                  {
                    v105 += 7;
                    v18 = v106++ >= 9;
                    if (!v18)
                      continue;
                  }
                  goto LABEL_178;
                }
                *(_BYTE *)(a2 + *v5) = 1;
LABEL_178:
                PBRepeatedBOOLAdd();
                goto LABEL_186;
              }
              result = PBReaderPlaceMark();
              if (!(_DWORD)result)
                return result;
              while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4) && !*(_BYTE *)(a2 + *v5))
              {
                v52 = 0;
                v53 = 0;
                v54 = 0;
                while (1)
                {
                  v55 = *v3;
                  v56 = *(_QWORD *)(a2 + v55);
                  v57 = v56 + 1;
                  if (v56 == -1 || v57 > *(_QWORD *)(a2 + *v4))
                    break;
                  v58 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v56);
                  *(_QWORD *)(a2 + v55) = v57;
                  v54 |= (unint64_t)(v58 & 0x7F) << v52;
                  if (v58 < 0)
                  {
                    v52 += 7;
                    v18 = v53++ >= 9;
                    if (!v18)
                      continue;
                  }
                  goto LABEL_76;
                }
                *(_BYTE *)(a2 + *v5) = 1;
LABEL_76:
                PBRepeatedBOOLAdd();
              }
              goto LABEL_123;
            case 8u:
              if (v21 != 2)
              {
                v112 = 0;
                v113 = 0;
                v114 = 0;
                while (1)
                {
                  v115 = *v3;
                  v116 = *(_QWORD *)(a2 + v115);
                  v117 = v116 + 1;
                  if (v116 == -1 || v117 > *(_QWORD *)(a2 + *v4))
                    goto LABEL_168;
                  v118 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v116);
                  *(_QWORD *)(a2 + v115) = v117;
                  v114 |= (unint64_t)(v118 & 0x7F) << v112;
                  if (v118 < 0)
                  {
                    v112 += 7;
                    v18 = v113++ >= 9;
                    if (!v18)
                      continue;
                  }
                  goto LABEL_169;
                }
              }
              result = PBReaderPlaceMark();
              if (!(_DWORD)result)
                return result;
              while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4) && !*(_BYTE *)(a2 + *v5))
              {
                v59 = 0;
                v60 = 0;
                v61 = 0;
                while (1)
                {
                  v62 = *v3;
                  v63 = *(_QWORD *)(a2 + v62);
                  v64 = v63 + 1;
                  if (v63 == -1 || v64 > *(_QWORD *)(a2 + *v4))
                    break;
                  v65 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v63);
                  *(_QWORD *)(a2 + v62) = v64;
                  v61 |= (unint64_t)(v65 & 0x7F) << v59;
                  if (v65 < 0)
                  {
                    v59 += 7;
                    v18 = v60++ >= 9;
                    if (!v18)
                      continue;
                  }
                  goto LABEL_91;
                }
                *(_BYTE *)(a2 + *v5) = 1;
LABEL_91:
                PBRepeatedUInt32Add();
              }
              goto LABEL_123;
            case 9u:
              if (v21 != 2)
              {
                v119 = 0;
                v120 = 0;
                v121 = 0;
                while (1)
                {
                  v122 = *v3;
                  v123 = *(_QWORD *)(a2 + v122);
                  v124 = v123 + 1;
                  if (v123 == -1 || v124 > *(_QWORD *)(a2 + *v4))
                    break;
                  v125 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v123);
                  *(_QWORD *)(a2 + v122) = v124;
                  v121 |= (unint64_t)(v125 & 0x7F) << v119;
                  if (v125 < 0)
                  {
                    v119 += 7;
                    v18 = v120++ >= 9;
                    if (!v18)
                      continue;
                  }
                  goto LABEL_169;
                }
LABEL_168:
                *(_BYTE *)(a2 + *v5) = 1;
LABEL_169:
                PBRepeatedUInt32Add();
                goto LABEL_186;
              }
              result = PBReaderPlaceMark();
              if (!(_DWORD)result)
                return result;
              while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4) && !*(_BYTE *)(a2 + *v5))
              {
                v66 = 0;
                v67 = 0;
                v68 = 0;
                while (1)
                {
                  v69 = *v3;
                  v70 = *(_QWORD *)(a2 + v69);
                  v71 = v70 + 1;
                  if (v70 == -1 || v71 > *(_QWORD *)(a2 + *v4))
                    break;
                  v72 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v70);
                  *(_QWORD *)(a2 + v69) = v71;
                  v68 |= (unint64_t)(v72 & 0x7F) << v66;
                  if (v72 < 0)
                  {
                    v66 += 7;
                    v18 = v67++ >= 9;
                    if (!v18)
                      continue;
                  }
                  goto LABEL_104;
                }
                *(_BYTE *)(a2 + *v5) = 1;
LABEL_104:
                PBRepeatedUInt32Add();
              }
              goto LABEL_123;
            case 0xAu:
              v73 = v10;
              v74 = v9;
              v75 = v8;
              PBReaderReadData();
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              if (v76)
                objc_msgSend(a1, "addUrlHash:", v76);
              goto LABEL_109;
            case 0xBu:
              v73 = v10;
              v74 = v9;
              v75 = v8;
              PBReaderReadString();
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              if (v76)
                objc_msgSend(a1, "addPoiCategory:", v76);
LABEL_109:

              v8 = v75;
              v9 = v74;
              v10 = v73;
              goto LABEL_186;
            case 0xCu:
              if (v21 == 2)
              {
                result = PBReaderPlaceMark();
                if (!(_DWORD)result)
                  return result;
                while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4) && !*(_BYTE *)(a2 + *v5))
                {
                  v77 = 0;
                  v78 = 0;
                  v79 = 0;
                  while (1)
                  {
                    v80 = *v3;
                    v81 = *(_QWORD *)(a2 + v80);
                    v82 = v81 + 1;
                    if (v81 == -1 || v82 > *(_QWORD *)(a2 + *v4))
                      break;
                    v83 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v81);
                    *(_QWORD *)(a2 + v80) = v82;
                    v79 |= (unint64_t)(v83 & 0x7F) << v77;
                    if (v83 < 0)
                    {
                      v77 += 7;
                      v18 = v78++ >= 9;
                      if (!v18)
                        continue;
                    }
                    goto LABEL_122;
                  }
                  *(_BYTE *)(a2 + *v5) = 1;
LABEL_122:
                  PBRepeatedUInt64Add();
                }
LABEL_123:
                PBReaderRecallMark();
              }
              else
              {
                v126 = 0;
                v127 = 0;
                v128 = 0;
                while (1)
                {
                  v129 = *v3;
                  v130 = *(_QWORD *)(a2 + v129);
                  v131 = v130 + 1;
                  if (v130 == -1 || v131 > *(_QWORD *)(a2 + *v4))
                    break;
                  v132 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v130);
                  *(_QWORD *)(a2 + v129) = v131;
                  v128 |= (unint64_t)(v132 & 0x7F) << v126;
                  if (v132 < 0)
                  {
                    v126 += 7;
                    v18 = v127++ >= 9;
                    if (!v18)
                      continue;
                  }
                  goto LABEL_180;
                }
                *(_BYTE *)(a2 + *v5) = 1;
LABEL_180:
                PBRepeatedUInt64Add();
              }
LABEL_186:
              if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
                return *(_BYTE *)(a2 + *v5) == 0;
              continue;
            default:
              if ((PBReaderSkipValueWithTag() & 1) != 0)
                goto LABEL_186;
              return 0;
          }
        }
      }
      break;
    }
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_2147E7288(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

id __atxlog_handle_default()
{
  if (__atxlog_handle_default_onceToken != -1)
    dispatch_once(&__atxlog_handle_default_onceToken, &__block_literal_global_1);
  return (id)__atxlog_handle_default_log;
}

void ____atxlog_handle_default_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "general");
  v1 = (void *)__atxlog_handle_default_log;
  __atxlog_handle_default_log = (uint64_t)v0;

}

id __atxlog_handle_xpc()
{
  if (__atxlog_handle_xpc_onceToken != -1)
    dispatch_once(&__atxlog_handle_xpc_onceToken, &__block_literal_global_3);
  return (id)__atxlog_handle_xpc_log;
}

void ____atxlog_handle_xpc_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "xpc");
  v1 = (void *)__atxlog_handle_xpc_log;
  __atxlog_handle_xpc_log = (uint64_t)v0;

}

id __atxlog_handle_heuristic()
{
  if (__atxlog_handle_heuristic_onceToken != -1)
    dispatch_once(&__atxlog_handle_heuristic_onceToken, &__block_literal_global_5);
  return (id)__atxlog_handle_heuristic_log;
}

void ____atxlog_handle_heuristic_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "heuristic");
  v1 = (void *)__atxlog_handle_heuristic_log;
  __atxlog_handle_heuristic_log = (uint64_t)v0;

}

id __atxlog_handle_notifications()
{
  if (__atxlog_handle_notifications_onceToken != -1)
    dispatch_once(&__atxlog_handle_notifications_onceToken, &__block_literal_global_7);
  return (id)__atxlog_handle_notifications_log;
}

void ____atxlog_handle_notifications_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "notifications");
  v1 = (void *)__atxlog_handle_notifications_log;
  __atxlog_handle_notifications_log = (uint64_t)v0;

}

id __atxlog_handle_pmm()
{
  if (__atxlog_handle_pmm_onceToken != -1)
    dispatch_once(&__atxlog_handle_pmm_onceToken, &__block_literal_global_9);
  return (id)__atxlog_handle_pmm_log;
}

void ____atxlog_handle_pmm_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.mm", "GENERAL");
  v1 = (void *)__atxlog_handle_pmm_log;
  __atxlog_handle_pmm_log = (uint64_t)v0;

}

id __atxlog_handle_dailyroutines()
{
  if (__atxlog_handle_dailyroutines_onceToken != -1)
    dispatch_once(&__atxlog_handle_dailyroutines_onceToken, &__block_literal_global_12);
  return (id)__atxlog_handle_dailyroutines_log;
}

void ____atxlog_handle_dailyroutines_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "dailyroutines");
  v1 = (void *)__atxlog_handle_dailyroutines_log;
  __atxlog_handle_dailyroutines_log = (uint64_t)v0;

}

id __atxlog_handle_feedback()
{
  if (__atxlog_handle_feedback_onceToken != -1)
    dispatch_once(&__atxlog_handle_feedback_onceToken, &__block_literal_global_14);
  return (id)__atxlog_handle_feedback_log;
}

void ____atxlog_handle_feedback_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "feedback");
  v1 = (void *)__atxlog_handle_feedback_log;
  __atxlog_handle_feedback_log = (uint64_t)v0;

}

id __atxlog_handle_modes()
{
  if (__atxlog_handle_modes_onceToken != -1)
    dispatch_once(&__atxlog_handle_modes_onceToken, &__block_literal_global_16);
  return (id)__atxlog_handle_modes_log;
}

void ____atxlog_handle_modes_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "modes");
  v1 = (void *)__atxlog_handle_modes_log;
  __atxlog_handle_modes_log = (uint64_t)v0;

}

id __atxlog_handle_hero()
{
  if (__atxlog_handle_hero_onceToken != -1)
    dispatch_once(&__atxlog_handle_hero_onceToken, &__block_literal_global_18);
  return (id)__atxlog_handle_hero_log;
}

void ____atxlog_handle_hero_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "hero");
  v1 = (void *)__atxlog_handle_hero_log;
  __atxlog_handle_hero_log = (uint64_t)v0;

}

id __atxlog_handle_deletions()
{
  if (__atxlog_handle_deletions_onceToken != -1)
    dispatch_once(&__atxlog_handle_deletions_onceToken, &__block_literal_global_20);
  return (id)__atxlog_handle_deletions_log;
}

void ____atxlog_handle_deletions_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "deletions");
  v1 = (void *)__atxlog_handle_deletions_log;
  __atxlog_handle_deletions_log = (uint64_t)v0;

}

id __atxlog_handle_gi()
{
  if (__atxlog_handle_gi_onceToken != -1)
    dispatch_once(&__atxlog_handle_gi_onceToken, &__block_literal_global_22);
  return (id)__atxlog_handle_gi_log;
}

void ____atxlog_handle_gi_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "information");
  v1 = (void *)__atxlog_handle_gi_log;
  __atxlog_handle_gi_log = (uint64_t)v0;

}

id __atxlog_handle_timeline()
{
  if (__atxlog_handle_timeline_onceToken != -1)
    dispatch_once(&__atxlog_handle_timeline_onceToken, &__block_literal_global_24);
  return (id)__atxlog_handle_timeline_log;
}

void ____atxlog_handle_timeline_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "timeline");
  v1 = (void *)__atxlog_handle_timeline_log;
  __atxlog_handle_timeline_log = (uint64_t)v0;

}

id __atxlog_handle_relevant_shortcut()
{
  if (__atxlog_handle_relevant_shortcut_onceToken != -1)
    dispatch_once(&__atxlog_handle_relevant_shortcut_onceToken, &__block_literal_global_26);
  return (id)__atxlog_handle_relevant_shortcut_log;
}

void ____atxlog_handle_relevant_shortcut_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "relevant_shortcut");
  v1 = (void *)__atxlog_handle_relevant_shortcut_log;
  __atxlog_handle_relevant_shortcut_log = (uint64_t)v0;

}

id __atxlog_handle_relevance_model()
{
  if (__atxlog_handle_relevance_model_onceToken != -1)
    dispatch_once(&__atxlog_handle_relevance_model_onceToken, &__block_literal_global_28);
  return (id)__atxlog_handle_relevance_model_log;
}

void ____atxlog_handle_relevance_model_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "relevance_model");
  v1 = (void *)__atxlog_handle_relevance_model_log;
  __atxlog_handle_relevance_model_log = (uint64_t)v0;

}

id __atxlog_handle_watch()
{
  if (__atxlog_handle_watch_onceToken != -1)
    dispatch_once(&__atxlog_handle_watch_onceToken, &__block_literal_global_30);
  return (id)__atxlog_handle_watch_log;
}

void ____atxlog_handle_watch_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "watch");
  v1 = (void *)__atxlog_handle_watch_log;
  __atxlog_handle_watch_log = (uint64_t)v0;

}

id __atxlog_handle_ui()
{
  if (__atxlog_handle_ui_onceToken != -1)
    dispatch_once(&__atxlog_handle_ui_onceToken, &__block_literal_global_32);
  return (id)__atxlog_handle_ui_log;
}

void ____atxlog_handle_ui_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "UI");
  v1 = (void *)__atxlog_handle_ui_log;
  __atxlog_handle_ui_log = (uint64_t)v0;

}

id __atxlog_handle_blending()
{
  if (__atxlog_handle_blending_onceToken != -1)
    dispatch_once(&__atxlog_handle_blending_onceToken, &__block_literal_global_34);
  return (id)__atxlog_handle_blending_log;
}

void ____atxlog_handle_blending_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "blending");
  v1 = (void *)__atxlog_handle_blending_log;
  __atxlog_handle_blending_log = (uint64_t)v0;

}

id __atxlog_handle_blending_internal_cache()
{
  if (__atxlog_handle_blending_internal_cache_onceToken != -1)
    dispatch_once(&__atxlog_handle_blending_internal_cache_onceToken, &__block_literal_global_36);
  return (id)__atxlog_handle_blending_internal_cache_log;
}

void ____atxlog_handle_blending_internal_cache_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "blending_internal_cache");
  v1 = (void *)__atxlog_handle_blending_internal_cache_log;
  __atxlog_handle_blending_internal_cache_log = (uint64_t)v0;

}

id __atxlog_handle_blending_ecosystem()
{
  if (__atxlog_handle_blending_ecosystem_onceToken != -1)
    dispatch_once(&__atxlog_handle_blending_ecosystem_onceToken, &__block_literal_global_38);
  return (id)__atxlog_handle_blending_ecosystem_log;
}

void ____atxlog_handle_blending_ecosystem_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "blending_ecosystem");
  v1 = (void *)__atxlog_handle_blending_ecosystem_log;
  __atxlog_handle_blending_ecosystem_log = (uint64_t)v0;

}

id __atxlog_handle_home_screen()
{
  if (__atxlog_handle_home_screen_onceToken != -1)
    dispatch_once(&__atxlog_handle_home_screen_onceToken, &__block_literal_global_40);
  return (id)__atxlog_handle_home_screen_log;
}

void ____atxlog_handle_home_screen_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "homescreen");
  v1 = (void *)__atxlog_handle_home_screen_log;
  __atxlog_handle_home_screen_log = (uint64_t)v0;

}

id __atxlog_handle_sleep_schedule()
{
  if (__atxlog_handle_sleep_schedule_onceToken != -1)
    dispatch_once(&__atxlog_handle_sleep_schedule_onceToken, &__block_literal_global_42);
  return (id)__atxlog_handle_sleep_schedule_log;
}

void ____atxlog_handle_sleep_schedule_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "sleepschedule");
  v1 = (void *)__atxlog_handle_sleep_schedule_log;
  __atxlog_handle_sleep_schedule_log = (uint64_t)v0;

}

id __atxlog_handle_lock_screen()
{
  if (__atxlog_handle_lock_screen_onceToken != -1)
    dispatch_once(&__atxlog_handle_lock_screen_onceToken, &__block_literal_global_44);
  return (id)__atxlog_handle_lock_screen_log;
}

void ____atxlog_handle_lock_screen_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "lockscreen");
  v1 = (void *)__atxlog_handle_lock_screen_log;
  __atxlog_handle_lock_screen_log = (uint64_t)v0;

}

id __atxlog_handle_anchor()
{
  if (__atxlog_handle_anchor_onceToken != -1)
    dispatch_once(&__atxlog_handle_anchor_onceToken, &__block_literal_global_46);
  return (id)__atxlog_handle_anchor_log;
}

void ____atxlog_handle_anchor_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "anchor");
  v1 = (void *)__atxlog_handle_anchor_log;
  __atxlog_handle_anchor_log = (uint64_t)v0;

}

id __atxlog_handle_app_prediction()
{
  if (__atxlog_handle_app_prediction_onceToken != -1)
    dispatch_once(&__atxlog_handle_app_prediction_onceToken, &__block_literal_global_48);
  return (id)__atxlog_handle_app_prediction_log;
}

void ____atxlog_handle_app_prediction_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "app_prediction");
  v1 = (void *)__atxlog_handle_app_prediction_log;
  __atxlog_handle_app_prediction_log = (uint64_t)v0;

}

id __atxlog_handle_action_prediction()
{
  if (__atxlog_handle_action_prediction_onceToken != -1)
    dispatch_once(&__atxlog_handle_action_prediction_onceToken, &__block_literal_global_50);
  return (id)__atxlog_handle_action_prediction_log;
}

void ____atxlog_handle_action_prediction_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "action_prediction");
  v1 = (void *)__atxlog_handle_action_prediction_log;
  __atxlog_handle_action_prediction_log = (uint64_t)v0;

}

id __atxlog_handle_app_library()
{
  if (__atxlog_handle_app_library_onceToken != -1)
    dispatch_once(&__atxlog_handle_app_library_onceToken, &__block_literal_global_52);
  return (id)__atxlog_handle_app_library_log;
}

void ____atxlog_handle_app_library_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "app_library");
  v1 = (void *)__atxlog_handle_app_library_log;
  __atxlog_handle_app_library_log = (uint64_t)v0;

}

id __atxlog_handle_app_install()
{
  if (__atxlog_handle_app_install_onceToken != -1)
    dispatch_once(&__atxlog_handle_app_install_onceToken, &__block_literal_global_54);
  return (id)__atxlog_handle_app_install_log;
}

void ____atxlog_handle_app_install_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "app_install");
  v1 = (void *)__atxlog_handle_app_install_log;
  __atxlog_handle_app_install_log = (uint64_t)v0;

}

id __atxlog_handle_backup()
{
  if (__atxlog_handle_backup_onceToken != -1)
    dispatch_once(&__atxlog_handle_backup_onceToken, &__block_literal_global_56);
  return (id)__atxlog_handle_backup_log;
}

void ____atxlog_handle_backup_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "backup");
  v1 = (void *)__atxlog_handle_backup_log;
  __atxlog_handle_backup_log = (uint64_t)v0;

}

id __atxlog_handle_metrics()
{
  if (__atxlog_handle_metrics_onceToken != -1)
    dispatch_once(&__atxlog_handle_metrics_onceToken, &__block_literal_global_58);
  return (id)__atxlog_handle_metrics_log;
}

void ____atxlog_handle_metrics_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "metrics");
  v1 = (void *)__atxlog_handle_metrics_log;
  __atxlog_handle_metrics_log = (uint64_t)v0;

}

id __atxlog_handle_trial_assets()
{
  if (__atxlog_handle_trial_assets_onceToken != -1)
    dispatch_once(&__atxlog_handle_trial_assets_onceToken, &__block_literal_global_60);
  return (id)__atxlog_handle_trial_assets_log;
}

void ____atxlog_handle_trial_assets_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "trial_assets");
  v1 = (void *)__atxlog_handle_trial_assets_log;
  __atxlog_handle_trial_assets_log = (uint64_t)v0;

}

id __atxlog_handle_notification_management()
{
  if (__atxlog_handle_notification_management_onceToken != -1)
    dispatch_once(&__atxlog_handle_notification_management_onceToken, &__block_literal_global_62);
  return (id)__atxlog_handle_notification_management_log;
}

void ____atxlog_handle_notification_management_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "notification_management");
  v1 = (void *)__atxlog_handle_notification_management_log;
  __atxlog_handle_notification_management_log = (uint64_t)v0;

}

id __atxlog_handle_contextual_actions()
{
  if (__atxlog_handle_contextual_actions_onceToken != -1)
    dispatch_once(&__atxlog_handle_contextual_actions_onceToken, &__block_literal_global_64);
  return (id)__atxlog_handle_contextual_actions_log;
}

void ____atxlog_handle_contextual_actions_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "contextual_actions");
  v1 = (void *)__atxlog_handle_contextual_actions_log;
  __atxlog_handle_contextual_actions_log = (uint64_t)v0;

}

id __atxlog_handle_intents_helper()
{
  if (__atxlog_handle_intents_helper_onceToken != -1)
    dispatch_once(&__atxlog_handle_intents_helper_onceToken, &__block_literal_global_66);
  return (id)__atxlog_handle_intents_helper_log;
}

void ____atxlog_handle_intents_helper_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "intents_helper");
  v1 = (void *)__atxlog_handle_intents_helper_log;
  __atxlog_handle_intents_helper_log = (uint64_t)v0;

}

id __atxlog_handle_context_heuristic()
{
  if (__atxlog_handle_context_heuristic_onceToken != -1)
    dispatch_once(&__atxlog_handle_context_heuristic_onceToken, &__block_literal_global_68);
  return (id)__atxlog_handle_context_heuristic_log;
}

void ____atxlog_handle_context_heuristic_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "context_heuristic");
  v1 = (void *)__atxlog_handle_context_heuristic_log;
  __atxlog_handle_context_heuristic_log = (uint64_t)v0;

}

id __atxlog_handle_zkw_hide()
{
  if (__atxlog_handle_zkw_hide_onceToken != -1)
    dispatch_once(&__atxlog_handle_zkw_hide_onceToken, &__block_literal_global_70);
  return (id)__atxlog_handle_zkw_hide_log;
}

void ____atxlog_handle_zkw_hide_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "zkw_hide");
  v1 = (void *)__atxlog_handle_zkw_hide_log;
  __atxlog_handle_zkw_hide_log = (uint64_t)v0;

}

id __atxlog_handle_context_user_education_suggestions()
{
  if (__atxlog_handle_context_user_education_suggestions_onceToken != -1)
    dispatch_once(&__atxlog_handle_context_user_education_suggestions_onceToken, &__block_literal_global_72);
  return (id)__atxlog_handle_context_user_education_suggestions_log;
}

void ____atxlog_handle_context_user_education_suggestions_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "user_education_suggestions");
  v1 = (void *)__atxlog_handle_context_user_education_suggestions_log;
  __atxlog_handle_context_user_education_suggestions_log = (uint64_t)v0;

}

id __atxlog_handle_time_intelligence()
{
  if (__atxlog_handle_time_intelligence_onceToken != -1)
    dispatch_once(&__atxlog_handle_time_intelligence_onceToken, &__block_literal_global_74);
  return (id)__atxlog_handle_time_intelligence_log;
}

void ____atxlog_handle_time_intelligence_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "time");
  v1 = (void *)__atxlog_handle_time_intelligence_log;
  __atxlog_handle_time_intelligence_log = (uint64_t)v0;

}

id __atxlog_handle_contextual_engine()
{
  if (__atxlog_handle_contextual_engine_onceToken != -1)
    dispatch_once(&__atxlog_handle_contextual_engine_onceToken, &__block_literal_global_76);
  return (id)__atxlog_handle_contextual_engine_log;
}

void ____atxlog_handle_contextual_engine_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "contextualengine");
  v1 = (void *)__atxlog_handle_contextual_engine_log;
  __atxlog_handle_contextual_engine_log = (uint64_t)v0;

}

id __atxlog_handle_usage_insights()
{
  if (__atxlog_handle_usage_insights_onceToken != -1)
    dispatch_once(&__atxlog_handle_usage_insights_onceToken, &__block_literal_global_78);
  return (id)__atxlog_handle_usage_insights_log;
}

void ____atxlog_handle_usage_insights_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "usage_insights");
  v1 = (void *)__atxlog_handle_usage_insights_log;
  __atxlog_handle_usage_insights_log = (uint64_t)v0;

}

id __atxlog_handle_notification_categorization()
{
  if (__atxlog_handle_notification_categorization_onceToken != -1)
    dispatch_once(&__atxlog_handle_notification_categorization_onceToken, &__block_literal_global_80);
  return (id)__atxlog_handle_notification_categorization_log;
}

void ____atxlog_handle_notification_categorization_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "notification_categorization");
  v1 = (void *)__atxlog_handle_notification_categorization_log;
  __atxlog_handle_notification_categorization_log = (uint64_t)v0;

}

id __atxlog_handle_settings_actions()
{
  if (__atxlog_handle_settings_actions_onceToken != -1)
    dispatch_once(&__atxlog_handle_settings_actions_onceToken, &__block_literal_global_82);
  return (id)__atxlog_handle_settings_actions_log;
}

void ____atxlog_handle_settings_actions_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "settings_actions");
  v1 = (void *)__atxlog_handle_settings_actions_log;
  __atxlog_handle_settings_actions_log = (uint64_t)v0;

}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC358](data, *(_QWORD *)&len, md);
}

uint64_t GEOProactiveAppClipTileKeysNearLocation()
{
  return MEMORY[0x24BE3CAB8]();
}

uint64_t GEOTileLoaderClientIdentifier()
{
  return MEMORY[0x24BE3CAE8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

uint64_t PBDataWriterPlaceMark()
{
  return MEMORY[0x24BE7AF70]();
}

uint64_t PBDataWriterRecallMark()
{
  return MEMORY[0x24BE7AF78]();
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x24BE7AF80]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x24BE7AF88]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x24BE7AFA8]();
}

uint64_t PBDataWriterWriteSfixed32Field()
{
  return MEMORY[0x24BE7AFB8]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x24BE7AFD8]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x24BE7AFF0]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x24BE7B008]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x24BE7B018]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x24BE7B028]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x24BE7B030]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x24BE7B038]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x24BE7B048]();
}

uint64_t PBRepeatedBOOLAdd()
{
  return MEMORY[0x24BE7B058]();
}

uint64_t PBRepeatedBOOLClear()
{
  return MEMORY[0x24BE7B060]();
}

uint64_t PBRepeatedBOOLCopy()
{
  return MEMORY[0x24BE7B068]();
}

uint64_t PBRepeatedBOOLHash()
{
  return MEMORY[0x24BE7B070]();
}

uint64_t PBRepeatedBOOLIsEqual()
{
  return MEMORY[0x24BE7B078]();
}

uint64_t PBRepeatedBOOLNSArray()
{
  return MEMORY[0x24BE7B080]();
}

uint64_t PBRepeatedBOOLSet()
{
  return MEMORY[0x24BE7B088]();
}

uint64_t PBRepeatedInt32Add()
{
  return MEMORY[0x24BE7B0C8]();
}

uint64_t PBRepeatedInt32Clear()
{
  return MEMORY[0x24BE7B0D0]();
}

uint64_t PBRepeatedInt32Copy()
{
  return MEMORY[0x24BE7B0D8]();
}

uint64_t PBRepeatedInt32Hash()
{
  return MEMORY[0x24BE7B0E0]();
}

uint64_t PBRepeatedInt32IsEqual()
{
  return MEMORY[0x24BE7B0E8]();
}

uint64_t PBRepeatedInt32NSArray()
{
  return MEMORY[0x24BE7B0F0]();
}

uint64_t PBRepeatedInt32Set()
{
  return MEMORY[0x24BE7B0F8]();
}

uint64_t PBRepeatedUInt32Add()
{
  return MEMORY[0x24BE7B138]();
}

uint64_t PBRepeatedUInt32Clear()
{
  return MEMORY[0x24BE7B148]();
}

uint64_t PBRepeatedUInt32Copy()
{
  return MEMORY[0x24BE7B160]();
}

uint64_t PBRepeatedUInt32Hash()
{
  return MEMORY[0x24BE7B170]();
}

uint64_t PBRepeatedUInt32IsEqual()
{
  return MEMORY[0x24BE7B178]();
}

uint64_t PBRepeatedUInt32NSArray()
{
  return MEMORY[0x24BE7B190]();
}

uint64_t PBRepeatedUInt32Set()
{
  return MEMORY[0x24BE7B198]();
}

uint64_t PBRepeatedUInt64Add()
{
  return MEMORY[0x24BE7B1A8]();
}

uint64_t PBRepeatedUInt64Clear()
{
  return MEMORY[0x24BE7B1B0]();
}

uint64_t PBRepeatedUInt64Copy()
{
  return MEMORY[0x24BE7B1B8]();
}

uint64_t PBRepeatedUInt64Hash()
{
  return MEMORY[0x24BE7B1C0]();
}

uint64_t PBRepeatedUInt64IsEqual()
{
  return MEMORY[0x24BE7B1C8]();
}

uint64_t PBRepeatedUInt64NSArray()
{
  return MEMORY[0x24BE7B1D0]();
}

uint64_t PBRepeatedUInt64Set()
{
  return MEMORY[0x24BE7B1D8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
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

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
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

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

