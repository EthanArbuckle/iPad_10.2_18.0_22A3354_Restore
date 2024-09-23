void XML_SetProcessingInstructionHandler(XML_Parser parser, XML_ProcessingInstructionHandler handler)
{
  if (parser)
    *((_QWORD *)parser + 18) = handler;
}

void XML_SetNamespaceDeclHandler(XML_Parser parser, XML_StartNamespaceDeclHandler start, XML_EndNamespaceDeclHandler end)
{
  if (parser)
  {
    *((_QWORD *)parser + 27) = start;
    *((_QWORD *)parser + 28) = end;
  }
}

void XML_SetElementHandler(XML_Parser parser, XML_StartElementHandler start, XML_EndElementHandler end)
{
  if (parser)
  {
    *((_QWORD *)parser + 15) = start;
    *((_QWORD *)parser + 16) = end;
  }
}

void XML_SetCommentHandler(XML_Parser parser, XML_CommentHandler handler)
{
  if (parser)
    *((_QWORD *)parser + 19) = handler;
}

void XML_SetCharacterDataHandler(XML_Parser parser, XML_CharacterDataHandler handler)
{
  if (parser)
    *((_QWORD *)parser + 17) = handler;
}

void XML_SetCdataSectionHandler(XML_Parser parser, XML_StartCdataSectionHandler start, XML_EndCdataSectionHandler end)
{
  if (parser)
  {
    *((_QWORD *)parser + 20) = start;
    *((_QWORD *)parser + 21) = end;
  }
}

uint64_t doContent(uint64_t a1, int a2, uint64_t a3, unsigned __int8 *a4, uint64_t a5, unsigned __int8 **a6, int a7, int a8)
{
  int v8;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  int v17;
  int v18;
  unsigned __int8 *v20;
  unsigned __int8 *v21;
  unsigned __int8 *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  void (*v28)(_QWORD, char *, _QWORD);
  void (*v29)(_QWORD, char *);
  uint64_t v30;
  unsigned __int8 *v31;
  int v32;
  void (*v33)(_QWORD, _QWORD);
  _BYTE *v34;
  _BYTE *v35;
  char v36;
  unsigned __int8 *v37;
  int v38;
  _BYTE *v39;
  BOOL v40;
  char v41;
  unsigned __int8 *v42;
  int v43;
  void (*v44)(uint64_t, char **, uint64_t);
  uint64_t v45;
  char **v46;
  uint64_t v47;
  uint64_t v48;
  unsigned int v49;
  void (*v50)(_QWORD, char **, uint64_t);
  void (*v51)(_QWORD);
  void (*v52)(uint64_t, char **, uint64_t);
  uint64_t v53;
  char **v54;
  uint64_t v55;
  unsigned int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  unint64_t v61;
  uint64_t v62;
  int v63;
  char *v64;
  uint64_t v65;
  int v66;
  uint64_t v67;
  uint64_t v68;
  int v69;
  uint64_t v71;
  void (*v72)(_QWORD, _QWORD, _QWORD);
  _QWORD *v73;
  _QWORD *v74;
  _QWORD *v75;
  _QWORD *v76;
  _QWORD *v77;
  _QWORD *v78;
  unsigned __int8 *v79;
  uint64_t v80;
  uint64_t v81;
  unsigned __int8 *v82;
  char *v83;
  char *v84;
  _OWORD *v85;
  _OWORD *v86;
  uint64_t v87;
  void (*v88)(_QWORD, _QWORD);
  uint64_t v89;
  uint64_t v90;
  uint64_t Context;
  void (*v92)(_QWORD, char *, _QWORD);
  int v93;
  unsigned __int8 *v94;
  int v95;
  void (*v96)(uint64_t, unsigned __int8 *, uint64_t);
  uint64_t v97;
  unsigned __int8 *v98;
  uint64_t v99;
  void (*v100)(_QWORD, char **, uint64_t);
  uint64_t v102;
  unsigned __int8 **v103;
  uint64_t v104;
  uint64_t *v105;
  int v106;
  _QWORD *v107;
  uint64_t *v108;
  char *v111;
  __int128 v112;
  __int128 v113;
  unint64_t v114;
  unsigned __int8 *v115;
  unsigned __int8 *v116;

  v8 = a7;
  v116 = a4;
  v14 = *(_QWORD *)(a1 + 688);
  if (*(_QWORD *)(a1 + 304) == a3)
  {
    v15 = (_QWORD *)(a1 + 560);
    v16 = (_QWORD *)(a1 + 568);
  }
  else
  {
    v15 = *(_QWORD **)(a1 + 584);
    v16 = v15 + 1;
  }
  *v15 = a4;
  v107 = (_QWORD *)(a1 + 816);
  v108 = (uint64_t *)(a1 + 800);
  v104 = v14;
  v105 = (uint64_t *)(v14 + 160);
  while (2)
  {
    v115 = v116;
    v17 = (*(uint64_t (**)(uint64_t))(a3 + 8))(a3);
    v18 = v17;
    if (v17 == -3 || v17 == -5)
    {
      v20 = v116;
      if (v8)
        v21 = v116;
      else
        v21 = (unsigned __int8 *)a5;
    }
    else
    {
      v21 = v115;
      v20 = v116;
    }
    if (!accountingDiffTolerated(a1, v17, v20, (unint64_t)v21, 2841, a8))
    {
      accountingReportStats((_QWORD *)a1, " ABORTING\n");
      return 43;
    }
    v22 = v115;
    *v16 = v115;
    v23 = 17;
    switch(v18)
    {
      case -5:
        if (v8)
          goto LABEL_166;
        v96 = *(void (**)(uint64_t, unsigned __int8 *, uint64_t))(a1 + 136);
        if (v96)
        {
          if (*(_BYTE *)(a3 + 132))
          {
            v97 = *(_QWORD *)(a1 + 8);
            v98 = v116;
            v99 = (a5 - (_DWORD)v116);
          }
          else
          {
            v102 = *(_QWORD *)(a1 + 112);
            v111 = *(char **)(a1 + 104);
            (*(void (**)(uint64_t, unsigned __int8 **, uint64_t, char **, uint64_t))(a3 + 112))(a3, &v116, a5, &v111, v102);
            v96 = *(void (**)(uint64_t, unsigned __int8 *, uint64_t))(a1 + 136);
            v97 = *(_QWORD *)(a1 + 8);
            v98 = *(unsigned __int8 **)(a1 + 104);
            v99 = ((_DWORD)v111 - (_DWORD)v98);
          }
          v96(v97, v98, v99);
        }
        else if (*(_QWORD *)(a1 + 176))
        {
          reportDefault(a1, a3, (uint64_t)v116, a5);
        }
        if (!a2)
        {
          *v15 = a5;
          return 3;
        }
        if (*(_DWORD *)(a1 + 604) == a2)
          goto LABEL_193;
        *v15 = a5;
        return 13;
      case -4:
        if (v8)
          goto LABEL_166;
        if (a2 < 1)
          return 3;
        if (*(_DWORD *)(a1 + 604) != a2)
          return 13;
LABEL_166:
        v23 = 0;
        v94 = v116;
        goto LABEL_167;
      case -3:
        if (v8)
          goto LABEL_166;
        *v16 = a5;
        v100 = *(void (**)(_QWORD, char **, uint64_t))(a1 + 136);
        if (v100)
        {
          LOBYTE(v111) = 10;
          v100(*(_QWORD *)(a1 + 8), &v111, 1);
        }
        else if (*(_QWORD *)(a1 + 176))
        {
          reportDefault(a1, a3, (uint64_t)v116, a5);
        }
        if (!a2)
          return 3;
        if (*(_DWORD *)(a1 + 604) != a2)
          return 13;
LABEL_193:
        v23 = 0;
        *a6 = (unsigned __int8 *)a5;
        return v23;
      case -2:
        if (v8)
          goto LABEL_166;
        return 6;
      case -1:
        if (v8)
          goto LABEL_166;
        return 5;
      case 0:
        *v15 = v22;
        return 4;
      case 1:
      case 2:
        v111 = 0;
        v24 = *(_QWORD *)(a1 + 712);
        v106 = a2;
        if (v24)
        {
          *(_QWORD *)(a1 + 712) = *(_QWORD *)v24;
LABEL_69:
          *(_QWORD *)(v24 + 80) = 0;
          *(_QWORD *)v24 = *(_QWORD *)(a1 + 704);
          *(_QWORD *)(a1 + 704) = v24;
          *(_QWORD *)(v24 + 32) = 0;
          *(_QWORD *)(v24 + 40) = 0;
          *(_QWORD *)(v24 + 8) = &v116[*(int *)(a3 + 128)];
          v60 = (*(uint64_t (**)(uint64_t))(a3 + 56))(a3);
          *(_DWORD *)(v24 + 16) = v60;
          ++*(_DWORD *)(a1 + 604);
          v61 = *(_QWORD *)(v24 + 8) + v60;
          v114 = *(_QWORD *)(v24 + 8);
          v62 = *(_QWORD *)(v24 + 72);
          v111 = *(char **)(v24 + 64);
          v63 = (*(uint64_t (**)(uint64_t, unint64_t *, unint64_t, char **, uint64_t))(a3 + 112))(a3, &v114, v61, &v111, v62 - 1);
          v64 = v111;
          v65 = *(_QWORD *)(v24 + 64);
          v66 = (_DWORD)v111 - v65;
          if (v114 < v61 && v63 != 1)
          {
            v103 = a6;
            do
            {
              v67 = 2 * (*(_DWORD *)(v24 + 72) - (int)v65);
              v68 = (*(uint64_t (**)(void))(a1 + 32))();
              if (!v68)
                return 1;
              *(_QWORD *)(v24 + 64) = v68;
              *(_QWORD *)(v24 + 72) = v68 + v67;
              v111 = (char *)(v68 + v66);
              v69 = (*(uint64_t (**)(uint64_t, unint64_t *, unint64_t, char **, uint64_t))(a3 + 112))(a3, &v114, v61, &v111, v68 + v67 - 1);
              v64 = v111;
              v65 = *(_QWORD *)(v24 + 64);
              v66 = (_DWORD)v111 - v65;
            }
            while (v114 < v61 && v69 != 1);
            a6 = v103;
          }
          *(_DWORD *)(v24 + 48) = v66;
          *(_QWORD *)(v24 + 24) = v65;
          *v64 = 0;
          v71 = storeAtts(a1, a3, (uint64_t)v116, (char **)(v24 + 24), (uint64_t *)(v24 + 80), a8);
          if ((_DWORD)v71)
            return v71;
          v72 = *(void (**)(_QWORD, _QWORD, _QWORD))(a1 + 120);
          if (v72)
          {
            v72(*(_QWORD *)(a1 + 8), *(_QWORD *)(v24 + 24), *(_QWORD *)(a1 + 752));
            a2 = v106;
            v8 = a7;
          }
          else
          {
            a2 = v106;
            v8 = a7;
            if (*(_QWORD *)(a1 + 176))
              reportDefault(a1, a3, (uint64_t)v116, (uint64_t)v115);
          }
          v76 = *(_QWORD **)(a1 + 808);
          v77 = *(_QWORD **)(a1 + 800);
          if (v76)
          {
            if (!v77)
            {
LABEL_100:
              *v108 = 0;
              v107[1] = 0;
              v107[2] = 0;
              *v107 = 0;
              goto LABEL_143;
            }
            do
            {
              v78 = v77;
              v77 = (_QWORD *)*v77;
              *v78 = v76;
              v76 = v78;
            }
            while (v77);
          }
          else
          {
            v78 = *(_QWORD **)(a1 + 800);
          }
          *(_QWORD *)(a1 + 808) = v78;
          goto LABEL_100;
        }
        v58 = (*(uint64_t (**)(uint64_t))(a1 + 24))(88);
        if (!v58)
          return 1;
        v24 = v58;
        v59 = (*(uint64_t (**)(uint64_t))(a1 + 24))(32);
        *(_QWORD *)(v24 + 64) = v59;
        if (v59)
        {
          *(_QWORD *)(v24 + 72) = v59 + 32;
          goto LABEL_69;
        }
        (*(void (**)(uint64_t))(a1 + 40))(v24);
        return 1;
      case 3:
      case 4:
        v25 = (uint64_t)&v116[*(int *)(a3 + 128)];
        v114 = 0;
        v112 = 0u;
        v113 = 0u;
        v26 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 56))(a3, v25);
        v111 = (char *)poolStoreString(v108, a3, v25, v25 + v26);
        if (!v111)
          return 1;
        *(_QWORD *)(a1 + 832) = *(_QWORD *)(a1 + 824);
        v27 = storeAtts(a1, a3, (uint64_t)v116, &v111, (uint64_t *)&v114, 2);
        if ((_DWORD)v27)
        {
          v23 = v27;
          freeBindings(a1, v114);
          return v23;
        }
        *(_QWORD *)(a1 + 832) = *(_QWORD *)(a1 + 824);
        v28 = *(void (**)(_QWORD, char *, _QWORD))(a1 + 120);
        if (v28)
        {
          v28(*(_QWORD *)(a1 + 8), v111, *(_QWORD *)(a1 + 752));
          v29 = *(void (**)(_QWORD, char *))(a1 + 128);
          if (!v29)
            goto LABEL_84;
          if (*(_QWORD *)(a1 + 120))
          {
            *v15 = *v16;
            (*(void (**)(_QWORD, char *))(a1 + 128))(*(_QWORD *)(a1 + 8), v111);
            goto LABEL_84;
          }
LABEL_83:
          v29(*(_QWORD *)(a1 + 8), v111);
          goto LABEL_84;
        }
        v29 = *(void (**)(_QWORD, char *))(a1 + 128);
        if (v29)
          goto LABEL_83;
        if (*(_QWORD *)(a1 + 176))
          reportDefault(a1, a3, (uint64_t)v116, (uint64_t)v115);
LABEL_84:
        v73 = *(_QWORD **)(a1 + 808);
        v74 = *(_QWORD **)(a1 + 800);
        if (v73)
        {
          if (!v74)
            goto LABEL_90;
          do
          {
            v75 = v74;
            v74 = (_QWORD *)*v74;
            *v75 = v73;
            v73 = v75;
          }
          while (v74);
        }
        else
        {
          v75 = *(_QWORD **)(a1 + 800);
        }
        *(_QWORD *)(a1 + 808) = v75;
LABEL_90:
        *(_QWORD *)(a1 + 800) = 0;
        v107[1] = 0;
        v107[2] = 0;
        *v107 = 0;
        freeBindings(a1, v114);
        if (!*(_DWORD *)(a1 + 604))
          goto LABEL_147;
        goto LABEL_143;
      case 5:
        if (*(_DWORD *)(a1 + 604) == a2)
          return 13;
        v30 = *(_QWORD *)(a1 + 704);
        v31 = &v116[2 * *(int *)(a3 + 128)];
        v32 = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(a3 + 56))(a3, v31);
        if (v32 != *(_DWORD *)(v30 + 16) || memcmp(*(const void **)(v30 + 8), v31, v32))
        {
          *v15 = v31;
          return 7;
        }
        *(_QWORD *)(a1 + 704) = *(_QWORD *)v30;
        *(_QWORD *)v30 = *(_QWORD *)(a1 + 712);
        *(_QWORD *)(a1 + 712) = v30;
        --*(_DWORD *)(a1 + 604);
        v33 = *(void (**)(_QWORD, _QWORD))(a1 + 128);
        if (v33)
        {
          if (*(_BYTE *)(a1 + 472))
          {
            v34 = *(_BYTE **)(v30 + 32);
            if (v34)
            {
              v35 = (_BYTE *)(*(_QWORD *)(v30 + 24) + *(int *)(v30 + 52));
              v36 = *v34;
              if (*v34)
              {
                v37 = v34 + 1;
                do
                {
                  *v35++ = v36;
                  v38 = *v37++;
                  v36 = v38;
                }
                while (v38);
              }
              v39 = *(_BYTE **)(v30 + 40);
              if (*(_BYTE *)(a1 + 473))
                v40 = v39 == 0;
              else
                v40 = 1;
              if (!v40)
              {
                *v35++ = *(_BYTE *)(a1 + 908);
                v41 = *v39;
                if (*v39)
                {
                  v42 = v39 + 1;
                  do
                  {
                    *v35++ = v41;
                    v43 = *v42++;
                    v41 = v43;
                  }
                  while (v43);
                }
              }
              *v35 = 0;
              v33 = *(void (**)(_QWORD, _QWORD))(a1 + 128);
            }
          }
          v33(*(_QWORD *)(a1 + 8), *(_QWORD *)(v30 + 24));
        }
        else if (*(_QWORD *)(a1 + 176))
        {
          reportDefault(a1, a3, (uint64_t)v116, (uint64_t)v115);
        }
        v87 = *(_QWORD *)(v30 + 80);
        if (v87)
        {
          do
          {
            v88 = *(void (**)(_QWORD, _QWORD))(a1 + 224);
            v89 = v87;
            if (v88)
            {
              v88(*(_QWORD *)(a1 + 8), **(_QWORD **)v87);
              v89 = *(_QWORD *)(v30 + 80);
            }
            v90 = *(_QWORD *)(v89 + 8);
            *(_QWORD *)(v30 + 80) = v90;
            *(_QWORD *)(v87 + 8) = *(_QWORD *)(a1 + 728);
            *(_QWORD *)(a1 + 728) = v87;
            *(_QWORD *)(*(_QWORD *)v87 + 8) = *(_QWORD *)(v87 + 16);
            v87 = v90;
          }
          while (v90);
        }
        v8 = a7;
        if (*(_DWORD *)(a1 + 604))
          goto LABEL_143;
LABEL_147:
        v95 = *(_DWORD *)(a1 + 920);
        if (v95 == 2)
        {
          *v15 = v115;
          return 35;
        }
        else if (v95 == 3)
        {
          *(_QWORD *)(a1 + 544) = epilogProcessor;
          *v15 = v115;
LABEL_145:
          v23 = 0;
          v94 = v115;
LABEL_167:
          *a6 = v94;
        }
        else
        {
          return epilogProcessor(a1, v115, a5, a6);
        }
        return v23;
      case 6:
        v44 = *(void (**)(uint64_t, char **, uint64_t))(a1 + 136);
        if (v44)
        {
          if (*(_BYTE *)(a3 + 132))
          {
            v45 = *(_QWORD *)(a1 + 8);
            v46 = (char **)v116;
            v47 = ((_DWORD)v22 - (_DWORD)v116);
            goto LABEL_60;
          }
          while (1)
          {
            v48 = *(_QWORD *)(a1 + 112);
            v111 = *(char **)(a1 + 104);
            v49 = (*(uint64_t (**)(uint64_t, unsigned __int8 **, unsigned __int8 *, char **, uint64_t))(a3 + 112))(a3, &v116, v22, &v111, v48);
            *v16 = v116;
            v44(*(_QWORD *)(a1 + 8), *(char ***)(a1 + 104), v111 - *(_QWORD *)(a1 + 104));
            if (v49 <= 1)
              break;
            *v15 = v116;
            v22 = v115;
          }
          goto LABEL_61;
        }
        v8 = a7;
        if (!*(_QWORD *)(a1 + 176))
          goto LABEL_143;
LABEL_102:
        v79 = v116;
        v80 = a1;
        v81 = a3;
        v82 = v22;
        goto LABEL_142;
      case 7:
        v50 = *(void (**)(_QWORD, char **, uint64_t))(a1 + 136);
        if (!v50)
          goto LABEL_49;
        LOBYTE(v111) = 10;
        v50(*(_QWORD *)(a1 + 8), &v111, 1);
        goto LABEL_143;
      case 8:
        v51 = *(void (**)(_QWORD))(a1 + 160);
        if (v51)
        {
          v51(*(_QWORD *)(a1 + 8));
        }
        else if (*(_QWORD *)(a1 + 176))
        {
          reportDefault(a1, a3, (uint64_t)v116, (uint64_t)v22);
        }
        v71 = doCdataSection(a1, a3, &v115, a5, a6, v8, a8);
        if ((_DWORD)v71)
          return v71;
        if (v115)
          goto LABEL_143;
        v23 = 0;
        *(_QWORD *)(a1 + 544) = cdataSectionProcessor;
        return v23;
      case 9:
        LOBYTE(v111) = 0;
        LOBYTE(v111) = (*(uint64_t (**)(uint64_t, unsigned __int8 *, unsigned __int8 *))(a3 + 88))(a3, &v116[*(int *)(a3 + 128)], &v22[-*(int *)(a3 + 128)]);
        if ((_BYTE)v111)
        {
          accountingDiffTolerated(a1, 9, (unsigned __int8 *)&v111, (unint64_t)&v111 + 1, 2907, 1);
          v52 = *(void (**)(uint64_t, char **, uint64_t))(a1 + 136);
          if (v52)
          {
            v53 = *(_QWORD *)(a1 + 8);
            v54 = &v111;
            v55 = 1;
LABEL_56:
            v52(v53, v54, v55);
            goto LABEL_143;
          }
LABEL_140:
          if (!*(_QWORD *)(a1 + 176))
            goto LABEL_143;
LABEL_141:
          v82 = v115;
          v79 = v116;
          v80 = a1;
          v81 = a3;
LABEL_142:
          reportDefault(v80, v81, (uint64_t)v79, (uint64_t)v82);
          goto LABEL_143;
        }
        v83 = (char *)poolStoreString(v105, a3, (uint64_t)&v116[*(int *)(a3 + 128)], (uint64_t)&v115[-*(int *)(a3 + 128)]);
        if (!v83)
          return 1;
        v84 = v83;
        v85 = lookup(a1, (uint64_t *)v104, v83, 0);
        v86 = v85;
        *(_QWORD *)(v104 + 184) = *(_QWORD *)(v104 + 192);
        if (!*(_BYTE *)(v104 + 257) || *(_BYTE *)(v104 + 258))
        {
          if (!v85)
            return 11;
          if (!*((_BYTE *)v85 + 58))
            return 24;
LABEL_113:
          if (*((_BYTE *)v85 + 56))
            return 12;
          if (*((_QWORD *)v85 + 6))
            return 15;
          if (*((_QWORD *)v85 + 1))
          {
            if (*(_BYTE *)(a1 + 600))
            {
              v71 = processInternalEntity(a1, (uint64_t)v85, 0);
              v8 = a7;
              if ((_DWORD)v71)
                return v71;
              goto LABEL_143;
            }
            v52 = *(void (**)(uint64_t, char **, uint64_t))(a1 + 256);
            v8 = a7;
            if (v52)
            {
              v53 = *(_QWORD *)(a1 + 8);
              v54 = *(char ***)v86;
              v55 = 0;
              goto LABEL_56;
            }
            goto LABEL_140;
          }
          if (!*(_QWORD *)(a1 + 240))
            goto LABEL_136;
          v23 = 1;
          *((_BYTE *)v85 + 56) = 1;
          Context = getContext(a1);
          *((_BYTE *)v86 + 56) = 0;
          v8 = a7;
          if (!Context)
            return v23;
          if (!(*(unsigned int (**)(_QWORD, uint64_t, _QWORD, _QWORD, _QWORD))(a1 + 240))(*(_QWORD *)(a1 + 248), Context, *((_QWORD *)v86 + 4), *((_QWORD *)v86 + 3), *((_QWORD *)v86 + 5)))return 21;
          *(_QWORD *)(a1 + 824) = *(_QWORD *)(a1 + 832);
          goto LABEL_143;
        }
        if (v85)
          goto LABEL_113;
        v92 = *(void (**)(_QWORD, char *, _QWORD))(a1 + 256);
        if (!v92)
        {
LABEL_136:
          v8 = a7;
          if (!*(_QWORD *)(a1 + 176))
            goto LABEL_143;
          goto LABEL_141;
        }
        v92(*(_QWORD *)(a1 + 8), v84, 0);
LABEL_61:
        v8 = a7;
LABEL_143:
        v93 = *(_DWORD *)(a1 + 920);
        v116 = v115;
        *v15 = v115;
        if (v93 == 2)
          return 35;
        if (v93 == 3)
          goto LABEL_145;
        continue;
      case 10:
        v56 = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(a3 + 80))(a3, v116);
        if ((v56 & 0x80000000) != 0)
          return 14;
        v44 = *(void (**)(uint64_t, char **, uint64_t))(a1 + 136);
        if (!v44)
          goto LABEL_136;
        v57 = *(_QWORD *)(a1 + 8);
        v47 = XmlUtf8Encode(v56, &v111);
        v46 = &v111;
        v45 = v57;
LABEL_60:
        v44(v45, v46, v47);
        goto LABEL_61;
      case 11:
        if (!reportProcessingInstruction(a1, a3, (uint64_t)v116, (uint64_t)v22))
          return 1;
        goto LABEL_143;
      case 12:
        return v23;
      case 13:
        if (!reportComment(a1, a3, (uint64_t)v116, (uint64_t)v22))
          return 1;
        goto LABEL_143;
      default:
LABEL_49:
        if (!*(_QWORD *)(a1 + 176))
          goto LABEL_143;
        goto LABEL_102;
    }
  }
}

uint64_t accountingDiffTolerated(uint64_t a1, int a2, unsigned __int8 *a3, unint64_t a4, int a5, int a6)
{
  unsigned __int8 *v9;
  _BOOL8 v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  float CurrentAmplification;
  FILE **v20;
  const char *v21;
  uint64_t i;
  FILE *v23;
  char *v24;
  unsigned __int8 *v25;
  FILE *v26;
  int v27;
  char *v28;
  FILE *v29;
  int v30;
  char *v31;

  v9 = a3;
  if ((a2 + 4) >= 5)
  {
    if (a6 == 2)
      return 1;
  }
  else
  {
    v10 = 1;
    if (((0x1Du >> (a2 + 4)) & 1) != 0 || a6 == 2)
      return v10;
  }
  v11 = -1;
  v12 = a1;
  do
  {
    v13 = v12;
    v12 = *(_QWORD *)(v12 + 912);
    ++v11;
  }
  while (v12);
  v14 = a4 - (_QWORD)a3;
  v15 = v13 == a1 && a6 == 0;
  v16 = 952;
  if (v15)
    v16 = 944;
  v17 = *(_QWORD *)(v13 + v16);
  if (__CFADD__(v14, v17))
    return 0;
  *(_QWORD *)(v13 + v16) = v17 + v14;
  v18 = *(_QWORD *)(v13 + 952) + *(_QWORD *)(v13 + 944);
  CurrentAmplification = accountingGetCurrentAmplification((_QWORD *)v13);
  v10 = v18 < *(_QWORD *)(v13 + 976) || CurrentAmplification <= *(float *)(v13 + 968);
  if (*(_QWORD *)(v13 + 960) >= 2uLL)
  {
    accountingReportStats((_QWORD *)v13, "");
    if (*(_QWORD *)(v13 + 912))
      accountingDiffTolerated_cold_1();
    v20 = (FILE **)MEMORY[0x24BDAC8D8];
    v21 = "EXP";
    if (!a6)
      v21 = "DIR";
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], " (+%6ld bytes %s|%d, xmlparse.c:%d) %*s\"", a4 - (_QWORD)v9, v21, v11, a5, 10, "");
    if (v14 < 25 || *(_QWORD *)(v13 + 960) > 2uLL)
    {
      if ((unint64_t)v9 < a4)
      {
        do
        {
          v29 = *v20;
          v30 = *v9++;
          v31 = unsignedCharToPrintable(v30);
          fputs(v31, v29);
          --v14;
        }
        while (v14);
      }
    }
    else
    {
      for (i = 0; i != 10; ++i)
      {
        v23 = *v20;
        v24 = unsignedCharToPrintable(v9[i]);
        fputs(v24, v23);
      }
      fwrite("[..]", 4uLL, 1uLL, *v20);
      v25 = (unsigned __int8 *)(a4 - 10);
      do
      {
        v26 = *v20;
        v27 = *v25++;
        v28 = unsignedCharToPrintable(v27);
        fputs(v28, v26);
      }
      while ((unint64_t)v25 < a4);
    }
    fwrite("\"\n", 2uLL, 1uLL, *v20);
  }
  return v10;
}

float accountingGetCurrentAmplification(_QWORD *a1)
{
  unint64_t v1;
  float result;

  v1 = a1[118];
  if (v1)
    result = (float)(a1[119] + v1) / (float)v1;
  else
    result = 1.0;
  if (a1[114])
    accountingGetCurrentAmplification_cold_1();
  return result;
}

uint64_t normal_contentTok(uint64_t a1, unsigned __int8 *a2, unint64_t a3, unsigned __int8 **a4)
{
  unsigned __int8 *v6;
  uint64_t result;
  unsigned __int8 *v9;
  unsigned __int8 *v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int v14;
  uint64_t v15;
  unint64_t v16;
  unsigned int v17;
  unsigned __int8 *v19;
  unsigned __int8 *v20;
  unint64_t v21;
  unsigned __int8 *v22;
  int v23;
  unint64_t v24;
  unsigned int v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unsigned __int8 *v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  int v33;
  uint64_t v35;

  if ((unint64_t)a2 >= a3)
    return 4294967292;
  v6 = a2;
  switch(*(_BYTE *)(a1 + *a2 + 136))
  {
    case 0:
    case 1:
    case 8:
      goto LABEL_3;
    case 2:
      v10 = a2 + 1;
      v11 = a3 - (_QWORD)(a2 + 1);
      if ((uint64_t)v11 < 1)
        return 0xFFFFFFFFLL;
      v12 = 1;
      switch(*(_BYTE *)(a1 + *v10 + 136))
      {
        case 5:
          if (v11 < 2)
            return 4294967294;
          if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 440))(a1, a2 + 1)
            || !(*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 416))(a1, v6 + 1))
          {
            goto LABEL_98;
          }
          v12 = 2;
          goto LABEL_9;
        case 6:
          if (v11 < 3)
            return 4294967294;
          if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 448))(a1, a2 + 1)
            || !(*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 424))(a1, v6 + 1))
          {
            goto LABEL_98;
          }
          v12 = 3;
          goto LABEL_9;
        case 7:
          if (v11 < 4)
            return 4294967294;
          if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 456))(a1, a2 + 1)
            || !(*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 432))(a1, v6 + 1))
          {
            goto LABEL_98;
          }
          v12 = 4;
LABEL_9:
          v6 = &v10[v12];
          v13 = a3 - (_QWORD)&v10[v12];
          if ((uint64_t)v13 < 1)
            return 0xFFFFFFFFLL;
          v14 = 0;
          while (2)
          {
            v15 = 1;
            switch(*(_BYTE *)(a1 + *v6 + 136))
            {
              case 5:
                if (v13 < 2)
                  return 4294967294;
                if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 440))(a1, v6)
                  || !(*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 392))(a1, v6))
                {
                  goto LABEL_3;
                }
                goto LABEL_40;
              case 6:
                if (v13 < 3)
                  return 4294967294;
                if (!(*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 448))(a1, v6)
                  && (*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 400))(a1, v6))
                {
                  goto LABEL_19;
                }
                goto LABEL_3;
              case 7:
                if (v13 < 4)
                  return 4294967294;
                if (!(*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 456))(a1, v6)
                  && (*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 408))(a1, v6))
                {
                  goto LABEL_23;
                }
                goto LABEL_3;
              case 9:
              case 0xA:
              case 0x15:
                v31 = a3 - (_QWORD)++v6;
                if ((uint64_t)(a3 - (_QWORD)v6) < 1)
                  return 0xFFFFFFFFLL;
                result = 0xFFFFFFFFLL;
                while (2)
                {
                  switch(*(_BYTE *)(a1 + *v6 + 136))
                  {
                    case 5:
                      if (v31 < 2)
                        return 4294967294;
                      if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 440))(a1, v6)
                        || !(*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 416))(a1, v6))
                      {
                        goto LABEL_3;
                      }
                      v35 = 3;
                      break;
                    case 6:
                      if (v31 < 3)
                        return 4294967294;
                      if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 448))(a1, v6)
                        || !(*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 424))(a1, v6))
                      {
                        goto LABEL_3;
                      }
                      v35 = 4;
                      break;
                    case 7:
                      if (v31 < 4)
                        return 4294967294;
                      if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 456))(a1, v6)
                        || !(*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 432))(a1, v6))
                      {
                        goto LABEL_3;
                      }
                      v35 = 5;
                      break;
                    case 9:
                    case 0xA:
                    case 0x15:
                      ++v6;
                      if ((uint64_t)--v31 > 0)
                        continue;
                      return result;
                    case 0xB:
                      goto LABEL_162;
                    case 0x11:
                      goto LABEL_163;
                    case 0x16:
                    case 0x18:
                      v35 = 2;
                      return normal_scanAtts(a1, &v6[v35 - 1], a3, a4);
                    default:
                      goto LABEL_3;
                  }
                  return normal_scanAtts(a1, &v6[v35 - 1], a3, a4);
                }
              case 0xB:
LABEL_162:
                *a4 = v6 + 1;
                return 2;
              case 0x11:
LABEL_163:
                v19 = v6 + 1;
                if ((uint64_t)(a3 - (_QWORD)(v6 + 1)) < 1)
                  return 0xFFFFFFFFLL;
                if (*v19 != 62)
                  goto LABEL_56;
                *a4 = v6 + 2;
                return 4;
              case 0x16:
              case 0x18:
              case 0x19:
              case 0x1A:
              case 0x1B:
                goto LABEL_41;
              case 0x17:
                if (v14)
                  goto LABEL_3;
                v10 = v6 + 1;
                v16 = a3 - (_QWORD)(v6 + 1);
                if ((uint64_t)v16 < 1)
                  return 0xFFFFFFFFLL;
                v17 = *(unsigned __int8 *)(a1 + *v10 + 136);
                if (v17 > 0x15)
                {
                  if (v17 != 22 && v17 != 24)
                    goto LABEL_98;
                  v14 = 1;
LABEL_40:
                  v15 = 2;
                }
                else
                {
                  switch(v17)
                  {
                    case 5u:
                      if (v16 < 2)
                        return 4294967294;
                      if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 440))(a1, v6 + 1)
                        || !(*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 416))(a1, v6 + 1))
                      {
                        goto LABEL_98;
                      }
                      v14 = 1;
LABEL_19:
                      v15 = 3;
                      break;
                    case 6u:
                      if (v16 < 3)
                        return 4294967294;
                      if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 448))(a1, v6 + 1)
                        || !(*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 424))(a1, v6 + 1))
                      {
                        goto LABEL_98;
                      }
                      v14 = 1;
LABEL_23:
                      v15 = 4;
                      break;
                    case 7u:
                      if (v16 >= 4)
                      {
                        if (!(*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 456))(a1, v6 + 1)
                          && (*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 432))(a1, v6 + 1))
                        {
                          v14 = 1;
                          v15 = 5;
                          break;
                        }
LABEL_98:
                        result = 0;
                        *a4 = v10;
                        return result;
                      }
                      return 4294967294;
                    default:
                      goto LABEL_98;
                  }
                }
LABEL_41:
                v6 += v15;
                v13 = a3 - (_QWORD)v6;
                result = 0xFFFFFFFFLL;
                if ((uint64_t)(a3 - (_QWORD)v6) <= 0)
                  return result;
                continue;
              default:
                goto LABEL_3;
            }
          }
        case 0xF:
          return normal_scanPi((_BYTE *)a1, (char *)a2 + 2, a3, (char **)a4);
        case 0x10:
          v19 = a2 + 2;
          if ((uint64_t)(a3 - (_QWORD)(a2 + 2)) < 1)
            return 0xFFFFFFFFLL;
          v23 = *(unsigned __int8 *)(a1 + *v19 + 136);
          if (v23 != 20)
          {
            if (v23 != 27)
              goto LABEL_56;
            return normal_scanComment((_BYTE *)a1, a2 + 3, a3, a4);
          }
          v29 = a2 + 3;
          if ((uint64_t)(a3 - (_QWORD)(a2 + 3)) < 6)
            return 0xFFFFFFFFLL;
          v30 = 0;
          v19 = a2 + 9;
          while (v29[v30] == big2_scanCdataSection_CDATA_LSQB[v30])
          {
            if (++v30 == 6)
            {
              result = 8;
              goto LABEL_137;
            }
          }
          result = 0;
          v19 = &v29[v30];
          goto LABEL_137;
        case 0x11:
          v6 = a2 + 2;
          v24 = a3 - (_QWORD)(a2 + 2);
          if ((uint64_t)v24 < 1)
            return 0xFFFFFFFFLL;
          result = 0;
          v25 = *(unsigned __int8 *)(a1 + *v6 + 136);
          if (v25 > 6)
          {
            if (v25 == 7)
            {
              if (v24 < 4)
                return 4294967294;
              if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 456))(a1, a2 + 2))
                goto LABEL_3;
              result = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(a1 + 432))(a1, v6);
              if (!(_DWORD)result)
                goto LABEL_4;
              v26 = 4;
            }
            else
            {
              v26 = 1;
              if (v25 != 22 && v25 != 24)
                goto LABEL_4;
            }
            goto LABEL_121;
          }
          if (v25 == 5)
          {
            if (v24 < 2)
              return 4294967294;
            if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 440))(a1, a2 + 2))
              goto LABEL_3;
            result = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(a1 + 416))(a1, v6);
            if (!(_DWORD)result)
              goto LABEL_4;
            v26 = 2;
            goto LABEL_121;
          }
          if (v25 != 6)
            goto LABEL_4;
          if (v24 < 3)
            return 4294967294;
          if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 448))(a1, a2 + 2))
            goto LABEL_3;
          result = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(a1 + 424))(a1, v6);
          if ((_DWORD)result)
          {
            v26 = 3;
LABEL_121:
            v6 += v26;
            v27 = a3 - (_QWORD)v6;
            if ((uint64_t)(a3 - (_QWORD)v6) < 1)
              return 0xFFFFFFFFLL;
            while (2)
            {
              result = 0;
              v28 = 1;
              switch(*(_BYTE *)(a1 + *v6 + 136))
              {
                case 5:
                  if (v27 < 2)
                    return 4294967294;
                  if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 440))(a1, v6))
                    goto LABEL_3;
                  result = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(a1 + 392))(a1, v6);
                  if (!(_DWORD)result)
                    goto LABEL_4;
                  v28 = 2;
                  goto LABEL_123;
                case 6:
                  if (v27 < 3)
                    return 4294967294;
                  if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 448))(a1, v6))
                    goto LABEL_3;
                  result = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(a1 + 400))(a1, v6);
                  if (!(_DWORD)result)
                    goto LABEL_4;
                  v28 = 3;
                  goto LABEL_123;
                case 7:
                  if (v27 < 4)
                    return 4294967294;
                  if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 456))(a1, v6))
                    goto LABEL_3;
                  result = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(a1 + 408))(a1, v6);
                  if (!(_DWORD)result)
                    goto LABEL_4;
                  v28 = 4;
LABEL_123:
                  v6 += v28;
                  v27 = a3 - (_QWORD)v6;
                  result = 0xFFFFFFFFLL;
                  if ((uint64_t)(a3 - (_QWORD)v6) <= 0)
                    return result;
                  continue;
                case 9:
                case 0xA:
                case 0x15:
                  v32 = a3 - (_QWORD)++v6;
                  if ((uint64_t)(a3 - (_QWORD)v6) < 1)
                    return 0xFFFFFFFFLL;
                  result = 0xFFFFFFFFLL;
                  break;
                case 0xB:
                  goto LABEL_192;
                case 0x16:
                case 0x17:
                case 0x18:
                case 0x19:
                case 0x1A:
                case 0x1B:
                  goto LABEL_123;
                default:
                  goto LABEL_4;
              }
              break;
            }
            while (1)
            {
              v33 = *(unsigned __int8 *)(a1 + *v6 + 136);
              if ((v33 - 9) >= 2 && v33 != 21)
                break;
              ++v6;
              if ((uint64_t)--v32 <= 0)
                return result;
            }
            if (v33 == 11)
            {
LABEL_192:
              ++v6;
              result = 5;
              goto LABEL_4;
            }
            goto LABEL_3;
          }
          break;
        case 0x16:
        case 0x18:
          goto LABEL_9;
        default:
          goto LABEL_98;
      }
      goto LABEL_4;
    case 3:
      return normal_scanRef(a1, a2 + 1, a3, a4);
    case 4:
      v9 = a2 + 1;
      if ((uint64_t)(a3 - (_QWORD)(a2 + 1)) < 1)
        return 4294967291;
      if (*v9 != 93)
        goto LABEL_73;
      v19 = a2 + 2;
      if ((uint64_t)(a3 - (_QWORD)(a2 + 2)) < 1)
        return 4294967291;
      if (*v19 == 62)
      {
LABEL_56:
        result = 0;
        goto LABEL_137;
      }
      goto LABEL_73;
    case 5:
      if ((uint64_t)(a3 - (_QWORD)a2) < 2)
        return 4294967294;
      if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 440))(a1, a2))
        goto LABEL_3;
      v9 = v6 + 2;
      goto LABEL_73;
    case 6:
      if ((uint64_t)(a3 - (_QWORD)a2) < 3)
        return 4294967294;
      if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 448))(a1, a2))
        goto LABEL_3;
      v9 = v6 + 3;
      goto LABEL_73;
    case 7:
      if ((uint64_t)(a3 - (_QWORD)a2) < 4)
        return 4294967294;
      if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 456))(a1, a2))
      {
LABEL_3:
        result = 0;
LABEL_4:
        *a4 = v6;
        return result;
      }
      v9 = v6 + 4;
LABEL_73:
      v21 = a3 - (_QWORD)v9;
      if ((uint64_t)(a3 - (_QWORD)v9) < 1)
      {
        v22 = v9;
LABEL_94:
        *a4 = v22;
        return 6;
      }
      break;
    case 9:
      v20 = a2 + 1;
      if ((uint64_t)(a3 - (_QWORD)(a2 + 1)) < 1)
        return 4294967293;
      if (*(_BYTE *)(a1 + a2[1] + 136) == 10)
        v20 = a2 + 2;
LABEL_70:
      *a4 = v20;
      return 7;
    case 0xA:
      v20 = a2 + 1;
      goto LABEL_70;
    default:
      v9 = a2 + 1;
      goto LABEL_73;
  }
  while (2)
  {
    switch(*(_BYTE *)(a1 + *v9 + 136))
    {
      case 0:
      case 1:
      case 2:
      case 3:
      case 8:
      case 9:
      case 0xA:
        goto LABEL_92;
      case 4:
        if (v21 < 2)
          goto LABEL_92;
        v22 = v9 + 1;
        if (v9[1] != 93)
          goto LABEL_90;
        if (v21 < 3)
        {
LABEL_92:
          *a4 = v9;
          return 6;
        }
        if (v9[2] != 62)
        {
LABEL_90:
          v21 = a3 - (_QWORD)v22;
          v9 = v22;
          if ((uint64_t)(a3 - (_QWORD)v22) <= 0)
            goto LABEL_94;
          continue;
        }
        result = 0;
        v19 = v9 + 2;
LABEL_137:
        *a4 = v19;
        return result;
      case 5:
        if (v21 < 2 || (*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 440))(a1, v9))
          goto LABEL_92;
        v22 = v9 + 2;
        goto LABEL_90;
      case 6:
        if (v21 < 3 || (*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 448))(a1, v9))
          goto LABEL_92;
        v22 = v9 + 3;
        goto LABEL_90;
      case 7:
        if (v21 < 4 || (*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 456))(a1, v9))
          goto LABEL_92;
        v22 = v9 + 4;
        goto LABEL_90;
      default:
        v22 = v9 + 1;
        goto LABEL_90;
    }
  }
}

uint64_t storeAtts(uint64_t a1, uint64_t a2, uint64_t a3, char **a4, uint64_t *a5, int a6)
{
  uint64_t v11;
  _OWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  _OWORD *AttributeId;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  BOOL v32;
  unsigned __int8 *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t result;
  _QWORD *v37;
  char *v38;
  _OWORD *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unsigned __int8 *v51;
  _QWORD *v52;
  _QWORD *v53;
  uint64_t v54;
  unsigned int v55;
  unsigned __int8 v56;
  uint64_t v58;
  unsigned int v59;
  uint64_t v60;
  uint64_t v61;
  _QWORD *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t *v65;
  unint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  _OWORD *v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  int v75;
  unint64_t v76;
  char v77;
  _BYTE *v78;
  int v79;
  uint64_t v80;
  char *v81;
  char *v82;
  char v83;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  unsigned int v91;
  _BYTE *v92;
  unsigned __int8 *v93;
  BOOL v94;
  BOOL v95;
  unsigned __int8 *v96;
  unsigned __int8 *v97;
  int v98;
  int v99;
  int v100;
  int v101;
  BOOL v102;
  uint64_t v103;
  char *v104;
  _BYTE *v105;
  char v106;
  uint64_t v108;
  uint64_t *v109;
  uint64_t v110;
  uint64_t i;
  uint64_t v112;
  uint64_t v113;
  char *v114;
  int v115;
  char *v116;
  BOOL v117;
  uint64_t v118;
  uint64_t v120;
  signed int v121;
  int v123;
  int v124;
  char *v125;
  char *v126;
  _QWORD *v127;
  uint64_t j;
  char *v129;
  uint64_t v130;
  unsigned int v131;
  uint64_t *v132;
  unint64_t v133;
  char **v134;
  uint64_t v135;
  int v136;
  unint64_t v137;
  int v138;
  uint64_t v139;
  uint64_t v141;
  int8x16_t v142;
  uint64_t v143;
  uint64_t v144;
  _QWORD v145[5];

  v145[3] = *MEMORY[0x24BDAC8D0];
  v11 = *(_QWORD *)(a1 + 688);
  v12 = lookup(a1, (uint64_t *)(v11 + 40), *a4, 0);
  if (!v12)
  {
    v38 = (char *)poolCopyString((uint64_t *)(v11 + 160), *a4);
    if (!v38)
      return 1;
    v39 = lookup(a1, (uint64_t *)(v11 + 40), v38, 0x28uLL);
    if (!v39)
      return 1;
    v12 = v39;
    if (*(_BYTE *)(a1 + 472))
    {
      if (!setElementTypePrefix(a1, (uint64_t)v39))
        return 1;
    }
  }
  v13 = *((unsigned int *)v12 + 6);
  v14 = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, _QWORD))(a2 + 72))(a2, a3, *(unsigned int *)(a1 + 736), *(_QWORD *)(a1 + 752));
  if ((int)v14 > (int)(v13 ^ 0x7FFFFFFF))
    return 1;
  v15 = v14;
  v16 = *(_DWORD *)(a1 + 736);
  if ((int)v14 + (int)v13 > v16)
  {
    if ((int)v13 > 2147483631 || (int)v14 > 2147483631 - (int)v13)
      return 1;
    v18 = v14 + v13 + 16;
    *(_DWORD *)(a1 + 736) = v18;
    v19 = (*(uint64_t (**)(_QWORD, uint64_t))(a1 + 32))(*(_QWORD *)(a1 + 752), 32 * v18);
    if (!v19)
    {
      *(_DWORD *)(a1 + 736) = v16;
      return 1;
    }
    *(_QWORD *)(a1 + 752) = v19;
    if ((int)v15 > v16)
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a2 + 72))(a2, a3, v15, v19);
  }
  v134 = a4;
  v135 = v11;
  v141 = *(_QWORD *)(a1 + 752);
  if ((int)v15 >= 1)
  {
    v136 = a6;
    v20 = 0;
    v138 = 0;
    v21 = 0;
    v22 = v15;
    while (1)
    {
      v23 = *(_QWORD *)(*(_QWORD *)(a1 + 752) + 32 * v20);
      v24 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 56))(a2, v23);
      AttributeId = getAttributeId(a1, a2, v23, v23 + v24);
      if (!AttributeId)
        return 1;
      v26 = (uint64_t)AttributeId;
      if (*(_BYTE *)(*(_QWORD *)AttributeId - 1))
      {
        if (*(_QWORD *)(a1 + 304) == a2)
          *(_QWORD *)(a1 + 560) = *(_QWORD *)(*(_QWORD *)(a1 + 752) + 32 * v20);
        return 8;
      }
      *(_BYTE *)(*(_QWORD *)AttributeId - 1) = 1;
      v27 = v21 + 1;
      *(_QWORD *)(v141 + 8 * v21) = *(_QWORD *)AttributeId;
      v28 = *(_QWORD *)(a1 + 752);
      v29 = v28 + 32 * v20;
      if (*(_BYTE *)(v29 + 24))
      {
        v30 = poolStoreString((uint64_t *)(a1 + 800), a2, *(_QWORD *)(v29 + 8), *(_QWORD *)(v29 + 16));
        v31 = v141;
        *(_QWORD *)(v141 + 8 * (int)v27) = v30;
        if (!v30)
          return 1;
      }
      else
      {
        if (*((_BYTE *)AttributeId + 16))
          v32 = (int)v13 < 1;
        else
          v32 = 1;
        if (v32)
        {
LABEL_26:
          v35 = 1;
        }
        else
        {
          v33 = (unsigned __int8 *)(*((_QWORD *)v12 + 4) + 8);
          v34 = v13;
          while (AttributeId != *((_OWORD **)v33 - 1))
          {
            v33 += 24;
            if (!--v34)
              goto LABEL_26;
          }
          v35 = *v33;
        }
        result = storeAttributeValue(a1, a2, v35, *(unsigned __int8 **)(v28 + 32 * v20 + 8), *(_QWORD *)(v28 + 32 * v20 + 16), (uint64_t *)(a1 + 800), v136);
        if ((_DWORD)result)
          return result;
        v31 = v141;
        *(_QWORD *)(v141 + 8 * v27) = *(_QWORD *)(a1 + 832);
      }
      *(_QWORD *)(a1 + 832) = *(_QWORD *)(a1 + 824);
      v37 = *(_QWORD **)(v26 + 8);
      if (v37)
      {
        if (*(_BYTE *)(v26 + 17))
        {
          result = addBinding(a1, v37, v26, *(unsigned __int8 **)(v31 + 8 * (int)v27), a5);
          if ((_DWORD)result)
            return result;
        }
        else
        {
          v21 += 2;
          ++v138;
          *(_BYTE *)(*(_QWORD *)v26 - 1) = 2;
        }
      }
      else
      {
        v21 += 2;
      }
      if (++v20 == v22)
        goto LABEL_44;
    }
  }
  v21 = 0;
  v138 = 0;
LABEL_44:
  *(_DWORD *)(a1 + 740) = v21;
  v40 = (uint64_t *)*((_QWORD *)v12 + 2);
  if (v40)
  {
    v41 = *v40;
    v42 = v141;
    v43 = v138;
    if (*(_BYTE *)(*v40 - 1))
    {
      v44 = v135;
      if (v21 < 1)
        goto LABEL_58;
      v45 = 0;
      while (*(_QWORD *)(v141 + 8 * v45) != v41)
      {
        v45 += 2;
        if (v21 <= (int)v45)
          goto LABEL_58;
      }
    }
    else
    {
      LODWORD(v45) = -1;
      v44 = v135;
    }
  }
  else
  {
    LODWORD(v45) = -1;
    v44 = v135;
    v42 = v141;
    v43 = v138;
  }
  *(_DWORD *)(a1 + 744) = v45;
LABEL_58:
  if ((int)v13 >= 1)
  {
    v46 = 0;
    v47 = 24 * v13;
    do
    {
      v48 = *((_QWORD *)v12 + 4);
      v49 = *(_QWORD *)(v48 + v46);
      v50 = *(_QWORD *)v49;
      if (!*(_BYTE *)(*(_QWORD *)v49 - 1))
      {
        v51 = *(unsigned __int8 **)(v48 + v46 + 16);
        if (v51)
        {
          v52 = *(_QWORD **)(v49 + 8);
          if (v52)
          {
            if (*(_BYTE *)(v49 + 17))
            {
              result = addBinding(a1, v52, v49, v51, a5);
              v42 = v141;
              if ((_DWORD)result)
                return result;
              goto LABEL_61;
            }
            *(_BYTE *)(v50 - 1) = 2;
            ++v43;
          }
          else
          {
            *(_BYTE *)(v50 - 1) = 1;
          }
          v53 = (_QWORD *)(v42 + 8 * v21);
          *v53 = **(_QWORD **)(v48 + v46);
          v21 += 2;
          v53[1] = *(_QWORD *)(v48 + v46 + 16);
        }
      }
LABEL_61:
      v46 += 24;
    }
    while (v47 != v46);
  }
  v54 = v21;
  *(_QWORD *)(v42 + 8 * v21) = 0;
  if (!v43)
  {
LABEL_145:
    LODWORD(v64) = 0;
LABEL_146:
    if ((int)v64 < (int)v54)
    {
      v110 = (int)v64;
      do
      {
        *(_BYTE *)(*(_QWORD *)(v42 + 8 * v110) - 1) = 0;
        v110 += 2;
      }
      while (v110 < v54);
    }
    for (i = *a5; i; i = *(_QWORD *)(i + 8))
      *(_BYTE *)(**(_QWORD **)(i + 24) - 1) = 0;
    if (*(_BYTE *)(a1 + 472))
    {
      v112 = *((_QWORD *)v12 + 1);
      if (v112)
      {
        v113 = *(_QWORD *)(v112 + 8);
        if (!v113)
          return 27;
        v114 = *v134;
        do
          v115 = *v114++;
        while (v115 != 58);
LABEL_159:
        v116 = **(char ***)v113;
        if (*(_BYTE *)(a1 + 473))
          v117 = v116 == 0;
        else
          v117 = 1;
        if (v117)
        {
          LODWORD(v118) = 0;
        }
        else
        {
          v118 = 0;
          while (v116[v118++])
            ;
        }
        v120 = 0;
        v134[1] = v114;
        v121 = *(_DWORD *)(v113 + 40);
        v134[2] = v116;
        *((_DWORD *)v134 + 7) = v121;
        *((_DWORD *)v134 + 8) = v118;
        while (v114[v120++])
          ;
        if (v121 > (int)(v118 ^ 0x7FFFFFFF) || (int)((v118 + v121) ^ 0x7FFFFFFF) <= (int)v120 - 1)
          return 1;
        v123 = v120 + v118 + v121;
        if (v123 <= *(_DWORD *)(v113 + 44))
        {
          v126 = *(char **)(v113 + 32);
        }
        else
        {
          if (v123 > 2147483623)
            return 1;
          v124 = v123 + 24;
          v125 = (char *)(*(uint64_t (**)(_QWORD))(a1 + 24))(v123 + 24);
          if (!v125)
            return 1;
          v126 = v125;
          *(_DWORD *)(v113 + 44) = v124;
          memcpy(v125, *(const void **)(v113 + 32), *(int *)(v113 + 40));
          v127 = *(_QWORD **)(a1 + 704);
          for (j = *(_QWORD *)(v113 + 32); v127; v127 = (_QWORD *)*v127)
          {
            if (v127[3] == j)
              v127[3] = v126;
          }
          (*(void (**)(uint64_t))(a1 + 40))(j);
          *(_QWORD *)(v113 + 32) = v126;
          v121 = *(_DWORD *)(v113 + 40);
        }
        v129 = &v126[v121];
        memcpy(v129, v114, v120);
        if ((_DWORD)v118)
        {
          v129[v120 - 1] = *(_BYTE *)(a1 + 908);
          memcpy(&v129[v120], **(const void ***)v113, (int)v118);
        }
        result = 0;
        *v134 = *(char **)(v113 + 32);
        return result;
      }
      v113 = *(_QWORD *)(v44 + 312);
      if (v113)
      {
        v114 = *v134;
        goto LABEL_159;
      }
    }
    return 0;
  }
  v55 = *(unsigned __int8 *)(a1 + 776);
  if (v55 > 0x1F)
    return 1;
  if ((2 * v43) >> v55)
  {
    v56 = *(_BYTE *)(a1 + 776);
    while (v43 >> v56++)
      ;
    *(_BYTE *)(a1 + 776) = v56;
    if (v56 > 2u)
    {
      if (v56 >= 0x20u)
        goto LABEL_166;
    }
    else
    {
      v56 = 3;
      *(_BYTE *)(a1 + 776) = 3;
    }
    v60 = (*(uint64_t (**)(_QWORD, uint64_t))(a1 + 32))(*(_QWORD *)(a1 + 760), 24 << v56);
    if (v60)
    {
      v59 = 1 << v56;
      *(_QWORD *)(a1 + 760) = v60;
      v42 = v141;
      goto LABEL_83;
    }
LABEL_166:
    *(_BYTE *)(a1 + 776) = v55;
    return 1;
  }
  v58 = *(_QWORD *)(a1 + 768);
  v59 = 1 << v55;
  if (v58)
    goto LABEL_85;
  v60 = *(_QWORD *)(a1 + 760);
LABEL_83:
  v61 = v59;
  v62 = (_QWORD *)(v60 + 24 * v59 - 24);
  v58 = 0xFFFFFFFFLL;
  do
  {
    *v62 = 0xFFFFFFFFLL;
    v62 -= 3;
    --v61;
  }
  while (v61);
LABEL_85:
  v63 = v58 - 1;
  *(_QWORD *)(a1 + 768) = v58 - 1;
  if ((int)v54 < 1)
    goto LABEL_145;
  v64 = 0;
  v65 = (uint64_t *)(v44 + 80);
  v66 = v59 - 1;
  v130 = ~v66;
  v133 = v66;
  v137 = v66 >> 2;
  v139 = v63;
  v131 = v59;
  v132 = (uint64_t *)(v44 + 80);
  while (1)
  {
    v67 = *(char **)(v42 + 8 * v64);
    if (*(v67 - 1) != 2)
    {
      *(v67 - 1) = 0;
      goto LABEL_143;
    }
    v145[0] = 0;
    v68 = a1;
    do
    {
      v69 = v68;
      v68 = *(_QWORD *)(v68 + 912);
    }
    while (v68);
    v70 = *(_QWORD *)(v69 + 936);
    v142.i64[0] = 0x736F6D6570736575;
    v142.i64[1] = v70 ^ 0x646F72616E646F6DLL;
    v143 = 0x6C7967656E657261;
    v144 = v70 ^ 0x7465646279746573;
    v145[1] = v145;
    v145[2] = 0;
    *(v67 - 1) = 0;
    v71 = lookup(a1, v65, v67, 0);
    if (!v71)
      return 1;
    v72 = *((_QWORD *)v71 + 1);
    if (!v72)
      return 1;
    v73 = *(_QWORD *)(v72 + 8);
    if (!v73)
      return 27;
    LODWORD(v74) = *(_DWORD *)(v73 + 40);
    if ((_DWORD)v74)
    {
      v75 = v43;
      v76 = 0;
      do
      {
        v77 = *(_BYTE *)(*(_QWORD *)(v73 + 32) + v76);
        v78 = *(_BYTE **)(a1 + 824);
        if (v78 == *(_BYTE **)(a1 + 816))
        {
          if (!poolGrow((uint64_t *)(a1 + 800)))
            return 1;
          v78 = *(_BYTE **)(a1 + 824);
        }
        *(_QWORD *)(a1 + 824) = v78 + 1;
        *v78 = v77;
        ++v76;
        v74 = *(unsigned int *)(v73 + 40);
      }
      while (v76 < v74);
      v43 = v75;
      v44 = v135;
    }
    sip24_update(v142.i64, *(char **)(v73 + 32), (int)v74);
    do
      v79 = *v67++;
    while (v79 != 58);
    if (*v67)
    {
      v80 = 0;
      do
        v81 = &v67[v80++];
      while (v81[1]);
    }
    else
    {
      v80 = 0;
    }
    sip24_update(v142.i64, v67, v80);
    do
    {
      v82 = *(char **)(a1 + 824);
      if (v82 == *(char **)(a1 + 816))
      {
        if (!poolGrow((uint64_t *)(a1 + 800)))
          return 1;
        v82 = *(char **)(a1 + 824);
      }
      v83 = *v67;
      *(_QWORD *)(a1 + 824) = v82 + 1;
      *v82 = v83;
    }
    while (*v67++);
    sip24_final(&v142);
    v86 = v85;
    v87 = v85 & v133;
    v88 = *(_QWORD *)(a1 + 760);
    v89 = *(_QWORD *)(v88 + 24 * (v85 & v133));
    v90 = v139;
    if (v89 == v139)
      break;
    v42 = v141;
LABEL_135:
    if (*(_BYTE *)(a1 + 473))
    {
      *(_BYTE *)(*(_QWORD *)(a1 + 824) - 1) = *(_BYTE *)(a1 + 908);
      v104 = **(char ***)v73;
      do
      {
        v105 = *(_BYTE **)(a1 + 824);
        if (v105 == *(_BYTE **)(a1 + 816))
        {
          if (!poolGrow((uint64_t *)(a1 + 800)))
            return 1;
          v105 = *(_BYTE **)(a1 + 824);
          v42 = v141;
          v90 = v139;
        }
        v106 = *v104;
        *(_QWORD *)(a1 + 824) = v105 + 1;
        *v105 = v106;
      }
      while (*v104++);
    }
    v108 = *(_QWORD *)(a1 + 832);
    *(_QWORD *)(a1 + 832) = *(_QWORD *)(a1 + 824);
    *(_QWORD *)(v42 + 8 * v64) = v108;
    v109 = (uint64_t *)(*(_QWORD *)(a1 + 760) + 24 * v87);
    *v109 = v90;
    v109[1] = v86;
    v109[2] = v108;
    if (!--v43)
    {
      LODWORD(v64) = v64 + 2;
      goto LABEL_146;
    }
    v65 = v132;
LABEL_143:
    v64 += 2;
    if ((int)v54 <= (int)v64)
      goto LABEL_146;
  }
  v91 = 0;
  v42 = v141;
  while (1)
  {
    if (v86 == *(_QWORD *)(v88 + 24 * v87 + 8))
    {
      v92 = *(_BYTE **)(a1 + 832);
      v93 = *(unsigned __int8 **)(v88 + 24 * v87 + 16);
      v94 = *v92 == 0;
      if (*v92)
        v95 = *v92 == *v93;
      else
        v95 = 0;
      if (v95)
      {
        v96 = v93 + 1;
        v97 = v92 + 1;
        do
        {
          v99 = *v97++;
          v98 = v99;
          v94 = v99 == 0;
          v101 = *v96++;
          v100 = v101;
          if (v98)
            v102 = v98 == v100;
          else
            v102 = 0;
        }
        while (v102);
      }
      if (v94)
        return 8;
    }
    if (!v91)
      v91 = ((v86 & (unint64_t)v130) >> (*(_BYTE *)(a1 + 776) - 1)) & v137 | 1;
    if (v87 >= v91)
      v103 = -(uint64_t)v91;
    else
      v103 = v131 - v91;
    v87 += v103;
    if (*(_QWORD *)(v88 + 24 * v87) != v139)
      goto LABEL_135;
  }
}

uint64_t poolStoreString(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  _BYTE *v6;

  result = poolAppend(a1, a2, a3, a4);
  if (result)
  {
    v6 = (_BYTE *)a1[3];
    if (v6 == (_BYTE *)a1[2])
    {
      if (!poolGrow(a1))
        return 0;
      v6 = (_BYTE *)a1[3];
    }
    a1[3] = (uint64_t)(v6 + 1);
    *v6 = 0;
    return a1[4];
  }
  return result;
}

uint64_t poolAppend(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v7;
  uint64_t v9;

  v9 = a3;
  v7 = a1 + 3;
  if (a1[3])
    goto LABEL_3;
  while (poolGrow(a1))
  {
LABEL_3:
    if ((*(unsigned int (**)(uint64_t, uint64_t *, uint64_t, uint64_t *, uint64_t))(a2 + 112))(a2, &v9, a4, v7, a1[2]) < 2)return a1[4];
  }
  return 0;
}

uint64_t utf8_toUtf8(uint64_t a1, const void **a2, unint64_t a3, void **a4, uint64_t a5)
{
  unint64_t v6;
  const void *v8;
  int64_t v9;
  int64_t v10;
  _BOOL4 v11;
  size_t v12;
  unint64_t v14;

  v6 = a3;
  v14 = a3;
  v8 = *a2;
  v9 = a3 - (_QWORD)*a2;
  v10 = a5 - (_QWORD)*a4;
  if (v9 > v10)
  {
    v6 = (unint64_t)v8 + v10;
    v14 = (unint64_t)v8 + v10;
  }
  _INTERNAL_trim_to_complete_utf8_characters((unint64_t)v8, &v14);
  v11 = v14 < v6;
  v12 = v14 - (_QWORD)*a2;
  memcpy(*a4, *a2, v12);
  *a2 = (char *)*a2 + v12;
  *a4 = (char *)*a4 + v12;
  if (v9 <= v10)
    return v11;
  else
    return 2;
}

unint64_t _INTERNAL_trim_to_complete_utf8_characters(unint64_t result, unint64_t *a2)
{
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  char v5;
  char v6;

  v2 = *a2;
  if (*a2 > result)
  {
    v3 = 0;
    v4 = *a2;
    while (1)
    {
      v6 = *(_BYTE *)--v4;
      v5 = v6;
      if ((v6 & 0xF8) == 0xF0)
      {
        if ((unint64_t)(v3 - 3) <= 0xFFFFFFFFFFFFFFFBLL)
        {
          v2 += 3;
          break;
        }
      }
      else if ((v5 & 0xF0) == 0xE0)
      {
        if ((unint64_t)(v3 - 2) <= 0xFFFFFFFFFFFFFFFCLL)
        {
          v2 += 2;
          break;
        }
      }
      else
      {
        if ((v5 & 0xE0) != 0xC0)
        {
          if ((v5 & 0x80) == 0)
            break;
          goto LABEL_12;
        }
        if ((unint64_t)(v3 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          ++v2;
          break;
        }
      }
      v3 = 0;
LABEL_12:
      ++v3;
      v2 = v4;
      if (v4 <= result)
      {
        v2 = result;
        break;
      }
    }
  }
  *a2 = v2;
  return result;
}

uint64_t normal_nameLength(uint64_t a1, unsigned __int8 *a2)
{
  unsigned __int8 *i;
  unsigned int v3;

  for (i = a2; ; i += qword_21C61BF70[(char)v3])
  {
    v3 = *(unsigned __int8 *)(a1 + *i + 136) - 5;
    if (v3 >= 0x19 || ((0x17E0007u >> v3) & 1) == 0)
      break;
  }
  return ((_DWORD)i - (_DWORD)a2);
}

_OWORD *getAttributeId(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  _BYTE *v11;
  _BYTE *v12;
  _OWORD *v13;
  _OWORD *v14;
  uint64_t v15;
  _BYTE *v16;
  int v17;
  _OWORD *v18;
  uint64_t v19;
  uint64_t i;
  _BYTE *v21;
  char v22;
  _OWORD *v23;

  v8 = *(_QWORD *)(a1 + 688);
  v9 = *(_BYTE **)(v8 + 184);
  if (v9 == *(_BYTE **)(v8 + 176))
  {
    if (!poolGrow((uint64_t *)(v8 + 160)))
      return 0;
    v9 = *(_BYTE **)(v8 + 184);
  }
  *(_QWORD *)(v8 + 184) = v9 + 1;
  *v9 = 0;
  v10 = poolStoreString((uint64_t *)(v8 + 160), a2, a3, a4);
  if (!v10)
    return 0;
  v11 = (_BYTE *)v10;
  v12 = (_BYTE *)(v10 + 1);
  v13 = lookup(a1, (uint64_t *)(v8 + 80), (char *)(v10 + 1), 0x18uLL);
  v14 = v13;
  if (v13)
  {
    if (*(_BYTE **)v13 != v12)
    {
      v15 = *(_QWORD *)(v8 + 192);
LABEL_8:
      *(_QWORD *)(v8 + 184) = v15;
      return v14;
    }
    v16 = *(_BYTE **)(v8 + 184);
    *(_QWORD *)(v8 + 192) = v16;
    if (!*(_BYTE *)(a1 + 472))
      return v14;
    v17 = *v12;
    if (v17 == 120 && v11[2] == 109 && v11[3] == 108 && v11[4] == 110 && v11[5] == 115)
    {
      if (v11[6] == 58)
      {
        v18 = lookup(a1, (uint64_t *)(v8 + 120), v11 + 7, 0x10uLL);
        goto LABEL_38;
      }
      if (!v11[6])
      {
        v18 = (_OWORD *)(v8 + 304);
LABEL_38:
        *((_QWORD *)v14 + 1) = v18;
        *((_BYTE *)v14 + 17) = 1;
        return v14;
      }
    }
    v19 = 0;
    if (!*v12)
      return v14;
    while (v17 != 58)
    {
      v17 = v11[v19++ + 2];
      if (!v17)
        return v14;
    }
    if (v19)
    {
      for (i = 0; i != v19; ++i)
      {
        v21 = *(_BYTE **)(v8 + 184);
        if (v21 == *(_BYTE **)(v8 + 176))
        {
          if (!poolGrow((uint64_t *)(v8 + 160)))
            return 0;
          v21 = *(_BYTE **)(v8 + 184);
        }
        v22 = v12[i];
        *(_QWORD *)(v8 + 184) = v21 + 1;
        *v21 = v22;
      }
      v16 = *(_BYTE **)(v8 + 184);
    }
    if (v16 == *(_BYTE **)(v8 + 176))
    {
      if (!poolGrow((uint64_t *)(v8 + 160)))
        return 0;
      v16 = *(_BYTE **)(v8 + 184);
    }
    *(_QWORD *)(v8 + 184) = v16 + 1;
    *v16 = 0;
    v23 = lookup(a1, (uint64_t *)(v8 + 120), *(char **)(v8 + 192), 0x10uLL);
    *((_QWORD *)v14 + 1) = v23;
    if (v23)
    {
      v15 = *(_QWORD *)(v8 + 192);
      if (*(_QWORD *)v23 == v15)
      {
        *(_QWORD *)(v8 + 192) = *(_QWORD *)(v8 + 184);
        return v14;
      }
      goto LABEL_8;
    }
    return 0;
  }
  return v14;
}

_OWORD *lookup(uint64_t a1, uint64_t *a2, char *a3, size_t a4)
{
  __n128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _OWORD *result;
  unsigned int v14;
  unsigned __int8 *v15;
  unsigned __int8 *v16;
  int v17;
  int v18;
  int v19;
  unint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  unsigned int v24;
  _OWORD *v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t i;
  char **v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  BOOL v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;

  if (!a2[2])
  {
    if (a4)
    {
      *((_BYTE *)a2 + 8) = 6;
      a2[2] = 64;
      result = (_OWORD *)(*(uint64_t (**)(uint64_t))a2[4])(512);
      *a2 = (uint64_t)result;
      if (!result)
      {
        a2[2] = 0;
        return result;
      }
      result[30] = 0u;
      result[31] = 0u;
      result[28] = 0u;
      result[29] = 0u;
      result[26] = 0u;
      result[27] = 0u;
      result[24] = 0u;
      result[25] = 0u;
      result[22] = 0u;
      result[23] = 0u;
      result[20] = 0u;
      result[21] = 0u;
      result[18] = 0u;
      result[19] = 0u;
      result[16] = 0u;
      result[17] = 0u;
      result[14] = 0u;
      result[15] = 0u;
      result[12] = 0u;
      result[13] = 0u;
      result[10] = 0u;
      result[11] = 0u;
      result[8] = 0u;
      result[9] = 0u;
      result[6] = 0u;
      result[7] = 0u;
      result[4] = 0u;
      result[5] = 0u;
      result[2] = 0u;
      result[3] = 0u;
      *result = 0u;
      result[1] = 0u;
      v8.n128_u64[0] = (unint64_t)hash(a1, a3);
      v12 = (a2[2] - 1) & v40;
      goto LABEL_45;
    }
    return 0;
  }
  v8.n128_u64[0] = (unint64_t)hash(a1, a3);
  v10 = v9;
  v11 = a2[2];
  v12 = (v11 - 1) & v9;
  result = *(_OWORD **)(*a2 + 8 * v12);
  if (!result)
  {
LABEL_14:
    if (a4)
    {
      v22 = *((_BYTE *)a2 + 8);
      if (!((unint64_t)a2[3] >> (v22 - 1)))
      {
LABEL_45:
        *(_QWORD *)(*a2 + 8 * v12) = (*(uint64_t (**)(size_t, __n128))a2[4])(a4, v8);
        result = *(_OWORD **)(*a2 + 8 * v12);
        if (result)
        {
          bzero(result, a4);
          v41 = *a2;
          **(_QWORD **)(*a2 + 8 * v12) = a3;
          ++a2[3];
          return *(_OWORD **)(v41 + 8 * v12);
        }
        return result;
      }
      v23 = v22 + 1;
      v24 = (v22 + 1);
      if (v24 <= 0x3C)
      {
        result = (_OWORD *)(*(uint64_t (**)(uint64_t, __n128))a2[4])(8 << v23, v8);
        if (!result)
          return result;
        v25 = result;
        v42 = v24;
        v26 = 1 << v23;
        v27 = (1 << v23) - 1;
        bzero(result, 8 << v23);
        v28 = a2[2];
        if (v28)
        {
          for (i = 0; i < v28; ++i)
          {
            v30 = *(char ***)(*a2 + 8 * i);
            if (v30)
            {
              hash(a1, *v30);
              v32 = v31 & v27;
              if (*((_QWORD *)v25 + (v31 & v27)))
              {
                LODWORD(v33) = 0;
                do
                {
                  if ((_DWORD)v33)
                    v33 = v33;
                  else
                    v33 = ((v31 & (unint64_t)-v26) >> (v42 - 1)) & (v27 >> 2) | 1;
                  v34 = v32 >= v33;
                  v35 = v32 - v33;
                  if (v34)
                    v36 = 0;
                  else
                    v36 = 1 << v23;
                  v32 = v35 + v36;
                }
                while (*((_QWORD *)v25 + v32));
              }
              *((_QWORD *)v25 + v32) = *(_QWORD *)(*a2 + 8 * i);
              v28 = a2[2];
            }
          }
        }
        (*(void (**)(_QWORD))(a2[4] + 16))(*a2);
        *a2 = (uint64_t)v25;
        *((_BYTE *)a2 + 8) = v23;
        a2[2] = v26;
        v12 = v27 & v10;
        if (*((_QWORD *)v25 + (v27 & v10)))
        {
          LODWORD(v37) = 0;
          do
          {
            if ((_DWORD)v37)
              v37 = v37;
            else
              v37 = ((v10 & (unint64_t)-v26) >> (v42 - 1)) & (v27 >> 2) | 1;
            v38 = v12 - v37;
            if (v12 >= v37)
              v39 = 0;
            else
              v39 = 1 << v23;
            v12 = v38 + v39;
          }
          while (*((_QWORD *)v25 + v38 + v39));
        }
        goto LABEL_45;
      }
    }
    return 0;
  }
  v14 = 0;
  while (*a3 != **(_BYTE **)result)
  {
LABEL_8:
    if (!v14)
      v14 = ((v10 & (unint64_t)-v11) >> (*((_BYTE *)a2 + 8) - 1)) & ((unint64_t)(v11 - 1) >> 2) | 1;
    v20 = v12 - v14;
    if (v12 >= v14)
      v21 = 0;
    else
      v21 = a2[2];
    v12 = v20 + v21;
    result = *(_OWORD **)(*a2 + 8 * (v20 + v21));
    if (!result)
      goto LABEL_14;
  }
  v15 = (unsigned __int8 *)(*(_QWORD *)result + 1);
  v16 = (unsigned __int8 *)(a3 + 1);
  v17 = *a3;
  while (v17)
  {
    v18 = *v16++;
    v17 = v18;
    v19 = *v15++;
    if (v17 != v19)
      goto LABEL_8;
  }
  return result;
}

int8x8_t hash(uint64_t a1, char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int8x16_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x24BDAC8D0];
  do
  {
    v2 = a1;
    a1 = *(_QWORD *)(a1 + 912);
  }
  while (a1);
  v3 = *(_QWORD *)(v2 + 936);
  v8.i64[0] = 0x736F6D6570736575;
  v8.i64[1] = v3 ^ 0x646F72616E646F6DLL;
  v9 = 0x6C7967656E657261;
  v10 = v3 ^ 0x7465646279746573;
  v11[1] = v11;
  v11[2] = 0;
  if (*a2)
  {
    v4 = 0;
    do
      v5 = v4 + 1;
    while (a2[++v4]);
  }
  else
  {
    v5 = 0;
  }
  v11[0] = 0;
  sip24_update(v8.i64, a2, v5);
  return sip24_final(&v8);
}

uint64_t *sip24_update(uint64_t *a1, char *a2, uint64_t a3)
{
  char *v3;
  unint64_t v5;
  _BYTE **v6;
  uint64_t *v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  char *v11;
  char v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a2;
  v5 = (unint64_t)&a2[a3];
  v6 = (_BYTE **)(a1 + 5);
  v7 = a1 + 4;
  v8 = (uint64_t)&a2[a3 - 1];
  do
  {
    if ((unint64_t)v3 >= v5)
    {
      v13 = 0;
    }
    else
    {
      v9 = *v6;
      if (*v6 >= (_BYTE *)v6)
      {
        v13 = 1;
      }
      else
      {
        v10 = v8 - (_QWORD)v3;
        while (1)
        {
          v11 = v3;
          v12 = *v3++;
          *v6 = v9 + 1;
          *v9 = v12;
          if (!v10)
            break;
          v9 = *v6;
          --v10;
          if (*v6 >= (_BYTE *)v6)
            goto LABEL_11;
        }
        v3 = (char *)v5;
LABEL_11:
        v13 = (unint64_t)(v11 + 1) < v5;
      }
    }
    if (*v6 < (_BYTE *)v6)
      break;
    v14 = a1[4];
    a1[3] ^= v14;
    sip_round(a1, 2);
    *a1 ^= v14;
    v15 = a1[6] + 8;
    a1[5] = (uint64_t)v7;
    a1[6] = v15;
  }
  while (v13);
  return a1;
}

int8x8_t sip24_final(int8x16_t *a1)
{
  __int32 v2;
  unint64_t v3;
  int8x16_t v4;

  v2 = a1[2].i32[2] - ((_DWORD)a1 + 32);
  v3 = (unint64_t)(v2 + a1[3].i32[0]) << 56;
  switch((char)v2)
  {
    case 1:
      goto LABEL_8;
    case 2:
      goto LABEL_7;
    case 3:
      goto LABEL_6;
    case 4:
      goto LABEL_5;
    case 5:
      goto LABEL_4;
    case 6:
      goto LABEL_3;
    case 7:
      v3 |= (unint64_t)a1[2].u8[6] << 48;
LABEL_3:
      v3 |= (unint64_t)a1[2].u8[5] << 40;
LABEL_4:
      v3 |= (unint64_t)a1[2].u8[4] << 32;
LABEL_5:
      v3 |= (unint64_t)a1[2].u8[3] << 24;
LABEL_6:
      v3 |= (unint64_t)a1[2].u8[2] << 16;
LABEL_7:
      v3 |= (unint64_t)a1[2].u8[1] << 8;
LABEL_8:
      v3 |= a1[2].u8[0];
      break;
    default:
      break;
  }
  a1[1].i64[1] ^= v3;
  sip_round(a1->i64, 2);
  a1->i64[0] ^= v3;
  a1[1].i64[0] ^= 0xFFuLL;
  sip_round(a1->i64, 4);
  v4 = veorq_s8(*a1, a1[1]);
  return veor_s8(*(int8x8_t *)v4.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v4, v4, 8uLL));
}

uint64_t *sip_round(uint64_t *result, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (a2 >= 1)
  {
    v2 = *result;
    v3 = result[1];
    v5 = result[2];
    v4 = result[3];
    do
    {
      v6 = v2 + v3;
      v7 = v6 ^ __ROR8__(v3, 51);
      v8 = v5 + v4;
      v9 = __ROR8__(v4, 48);
      v2 = (v8 ^ v9) + __ROR8__(v6, 32);
      v4 = v2 ^ __ROR8__(v8 ^ v9, 43);
      v10 = v8 + v7;
      v3 = v10 ^ __ROR8__(v7, 47);
      v5 = __ROR8__(v10, 32);
      --a2;
    }
    while (a2);
    *result = v2;
    result[1] = v3;
    result[2] = v5;
    result[3] = v4;
  }
  return result;
}

uint64_t poolGrow(uint64_t *a1)
{
  uint64_t v2;
  const void *v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  BOOL v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  _BYTE *v23;
  uint64_t v24;

  v2 = a1[1];
  if (!v2)
    goto LABEL_5;
  v3 = (const void *)a1[4];
  if (!v3)
  {
    v20 = *(_QWORD *)v2;
    *a1 = v2;
    a1[1] = v20;
    *(_QWORD *)v2 = 0;
    a1[4] = v2 + 12;
    a1[2] = v2 + 12 + *(int *)(v2 + 8);
    a1[3] = v2 + 12;
    return 1;
  }
  v4 = a1[2] - (_QWORD)v3;
  if (v4 >= *(int *)(v2 + 8))
  {
LABEL_5:
    v9 = a1[4];
    v10 = *((_DWORD *)a1 + 4) - v9;
    if (*a1)
      v11 = v9 == *a1 + 12;
    else
      v11 = 0;
    if (v11)
    {
      v14 = 2 * v10;
      if (((2 * v10) & 0x80000000) == 0 && v14 && (int)(v14 + 12) >= 1)
      {
        v16 = a1[3];
        result = (*(uint64_t (**)(void))(a1[5] + 8))();
        if (!result)
          return result;
        *a1 = result;
        *(_DWORD *)(result + 8) = v14;
        v18 = result + 12 + v16 - v9;
        a1[4] = result + 12;
        v19 = result + 12 + v14;
LABEL_28:
        a1[2] = v19;
        a1[3] = v18;
        return 1;
      }
    }
    else if ((v10 & 0x80000000) == 0)
    {
      if (v10 < 0x400)
      {
        v12 = 1024;
        v13 = 1036;
LABEL_23:
        result = (*(uint64_t (**)(_QWORD))a1[5])(v13);
        if (!result)
          return result;
        v21 = result;
        *(_DWORD *)(result + 8) = v12;
        *(_QWORD *)result = *a1;
        *a1 = result;
        v23 = (_BYTE *)a1[3];
        v22 = (_BYTE *)a1[4];
        if (v23 == v22)
        {
          v24 = a1[3];
        }
        else
        {
          memcpy((void *)(result + 12), v22, v23 - v22);
          v24 = a1[3];
          v23 = (_BYTE *)a1[4];
        }
        v18 = v21 + 12 + v24 - (_QWORD)v23;
        a1[4] = v21 + 12;
        v19 = v21 + 12 + v12;
        goto LABEL_28;
      }
      if (v10 <= 0x3FFFFFF9)
      {
        v12 = 2 * v10;
        v13 = 2 * v10 + 12;
        goto LABEL_23;
      }
    }
    return 0;
  }
  v5 = *(_QWORD *)v2;
  *(_QWORD *)v2 = *a1;
  *a1 = v2;
  a1[1] = v5;
  memcpy((void *)(v2 + 12), v3, v4);
  v6 = *a1;
  v7 = *a1 + 12;
  v8 = v7 + a1[3] - a1[4];
  a1[4] = v7;
  a1[2] = v7 + *(int *)(v6 + 8);
  a1[3] = v8;
  return 1;
}

uint64_t poolCopyString(uint64_t *a1, char *a2)
{
  _BYTE *v4;
  char v5;
  uint64_t result;

  while (1)
  {
    v4 = (_BYTE *)a1[3];
    if (v4 == (_BYTE *)a1[2])
      break;
LABEL_4:
    v5 = *a2;
    a1[3] = (uint64_t)(v4 + 1);
    *v4 = v5;
    if (!*a2++)
    {
      result = a1[4];
      a1[4] = a1[3];
      return result;
    }
  }
  if (poolGrow(a1))
  {
    v4 = (_BYTE *)a1[3];
    goto LABEL_4;
  }
  return 0;
}

uint64_t addBinding(uint64_t a1, _QWORD *a2, uint64_t a3, unsigned __int8 *a4, uint64_t *a5)
{
  unsigned __int8 v10;
  _BYTE *v11;
  int v12;
  uint64_t result;
  unint64_t v14;
  int v15;
  int v16;
  unint64_t v17;
  int v18;
  BOOL v19;
  int v20;
  size_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void (*v25)(_QWORD, _QWORD, unsigned __int8 *);
  unsigned __int8 *v26;

  v10 = *a4;
  v11 = (_BYTE *)*a2;
  if (*a4)
  {
    if (v11)
    {
      if (*v11 == 120 && v11[1] == 109 && v11[2] == 108)
      {
        v12 = v11[3];
        if (!v11[3])
        {
          LODWORD(v11) = 1;
          result = 38;
LABEL_12:
          v14 = 0;
          v15 = 1;
          v16 = 1;
          while (1)
          {
            v17 = v14;
            if (v16 && (v14 > 0x24 || addBinding_xmlNamespace[v14] != v10))
              v16 = 0;
            if (v15)
              v18 = v12;
            else
              v18 = 0;
            if (v18 == 1 && (v17 > 0x1D || addBinding_xmlnsNamespace[v17] != v10))
              v15 = 0;
            if (*(_BYTE *)(a1 + 472) && *(unsigned __int8 *)(a1 + 908) == v10)
              break;
LABEL_27:
            v14 = v17 + 1;
            v10 = a4[v17 + 1];
            if (!v10)
              goto LABEL_28;
          }
          switch(v10)
          {
            case '!':
            case '#':
            case '$':
            case '%':
            case '&':
            case '\'':
            case '(':
            case ')':
            case '*':
            case '+':
            case ',':
            case '-':
            case '.':
            case '/':
            case '0':
            case '1':
            case '2':
            case '3':
            case '4':
            case '5':
            case '6':
            case '7':
            case '8':
            case '9':
            case ':':
            case ';':
            case '=':
            case '?':
            case '@':
            case 'A':
            case 'B':
            case 'C':
            case 'D':
            case 'E':
            case 'F':
            case 'G':
            case 'H':
            case 'I':
            case 'J':
            case 'K':
            case 'L':
            case 'M':
            case 'N':
            case 'O':
            case 'P':
            case 'Q':
            case 'R':
            case 'S':
            case 'T':
            case 'U':
            case 'V':
            case 'W':
            case 'X':
            case 'Y':
            case 'Z':
            case '[':
            case ']':
            case '_':
            case 'a':
            case 'b':
            case 'c':
            case 'd':
            case 'e':
            case 'f':
            case 'g':
            case 'h':
            case 'i':
            case 'j':
            case 'k':
            case 'l':
            case 'm':
            case 'n':
            case 'o':
            case 'p':
            case 'q':
            case 'r':
            case 's':
            case 't':
            case 'u':
            case 'v':
            case 'w':
            case 'x':
            case 'y':
            case 'z':
            case '~':
              goto LABEL_27;
            default:
              result = 2;
              break;
          }
          return result;
        }
        if (v12 == 110 && v11[4] == 115 && !v11[5])
          return 39;
      }
      LODWORD(v11) = 0;
    }
    v12 = 1;
    result = 40;
    goto LABEL_12;
  }
  if (v11)
    return 28;
  LODWORD(v14) = 0;
  v16 = 1;
  result = 40;
  v15 = 1;
LABEL_28:
  if (v16)
    v19 = (_DWORD)v14 == 36;
  else
    v19 = 0;
  v20 = v19;
  if ((_DWORD)v11 == v20)
  {
    if (v15 && (_DWORD)v14 == 29)
      return 40;
    if (*(_BYTE *)(a1 + 908))
      v21 = (v14 + 1);
    else
      v21 = v14;
    v22 = *(_QWORD *)(a1 + 728);
    if (v22)
    {
      if ((int)v21 <= *(_DWORD *)(v22 + 44))
      {
        v23 = *(void **)(v22 + 32);
        goto LABEL_54;
      }
      if (v21 <= 0x7FFFFFE7)
      {
        v23 = (void *)(*(uint64_t (**)(_QWORD, _QWORD))(a1 + 32))(*(_QWORD *)(v22 + 32), (v21 + 24));
        if (v23)
        {
          *(_QWORD *)(v22 + 32) = v23;
          *(_DWORD *)(v22 + 44) = v21 + 24;
LABEL_54:
          *(_QWORD *)(a1 + 728) = *(_QWORD *)(v22 + 8);
          goto LABEL_55;
        }
      }
    }
    else
    {
      v22 = (*(uint64_t (**)(uint64_t))(a1 + 24))(48);
      result = 1;
      if (!v22 || v21 > 0x7FFFFFE7)
        return result;
      v23 = (void *)(*(uint64_t (**)(_QWORD))(a1 + 24))((v21 + 24));
      *(_QWORD *)(v22 + 32) = v23;
      if (v23)
      {
        *(_DWORD *)(v22 + 44) = v21 + 24;
LABEL_55:
        *(_DWORD *)(v22 + 40) = v21;
        memcpy(v23, a4, v21);
        if (*(_BYTE *)(a1 + 908))
          *(_BYTE *)(*(_QWORD *)(v22 + 32) + (int)v21 - 1) = *(_BYTE *)(a1 + 908);
        *(_QWORD *)v22 = a2;
        *(_QWORD *)(v22 + 16) = a2[1];
        *(_QWORD *)(v22 + 24) = a3;
        if (!*a4 && (_QWORD *)(*(_QWORD *)(a1 + 688) + 304) == a2)
          v24 = 0;
        else
          v24 = v22;
        a2[1] = v24;
        *(_QWORD *)(v22 + 8) = *a5;
        *a5 = v22;
        if (a3)
        {
          v25 = *(void (**)(_QWORD, _QWORD, unsigned __int8 *))(a1 + 216);
          if (v25)
          {
            if (a2[1])
              v26 = a4;
            else
              v26 = 0;
            v25(*(_QWORD *)(a1 + 8), *a2, v26);
          }
        }
        return 0;
      }
      (*(void (**)(uint64_t))(a1 + 40))(v22);
    }
    return 1;
  }
  return result;
}

uint64_t normal_getAtts(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  int v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  int v18;
  uint64_t v19;
  int v20;

  result = 0;
  v6 = 0;
  v7 = 1;
  while (2)
  {
    v8 = a2;
    v10 = *(unsigned __int8 *)++a2;
    v9 = v10;
    v11 = v7;
    switch(*(_BYTE *)(a1 + v10 + 136))
    {
      case 3:
        if ((int)result < a3)
          *(_BYTE *)(a4 + 32 * (int)result + 24) = 0;
        continue;
      case 5:
        if (!(_DWORD)v7)
        {
          v11 = 1;
          if ((int)result < a3)
          {
            v13 = a4 + 32 * (int)result;
            *(_QWORD *)v13 = a2;
            *(_BYTE *)(v13 + 24) = 1;
          }
        }
        a2 = v8 + 2;
        v7 = v11;
        continue;
      case 6:
        if (!(_DWORD)v7)
        {
          v11 = 1;
          if ((int)result < a3)
          {
            v14 = a4 + 32 * (int)result;
            *(_QWORD *)v14 = a2;
            *(_BYTE *)(v14 + 24) = 1;
          }
        }
        a2 = v8 + 3;
        v7 = v11;
        continue;
      case 7:
        if (!(_DWORD)v7)
        {
          v11 = 1;
          if ((int)result < a3)
          {
            v15 = a4 + 32 * (int)result;
            *(_QWORD *)v15 = a2;
            *(_BYTE *)(v15 + 24) = 1;
          }
        }
        a2 = v8 + 4;
        v7 = v11;
        continue;
      case 9:
      case 0xA:
        v7 = 0;
        if ((_DWORD)v11 != 1)
        {
          v7 = v11;
          if ((_DWORD)v11 == 2 && (int)result < a3)
          {
            *(_BYTE *)(a4 + 32 * (int)result + 24) = 0;
            v7 = 2;
          }
        }
        continue;
      case 0xB:
      case 0x11:
        v7 = 2;
        if ((_DWORD)v11 == 2)
          continue;
        return result;
      case 0xC:
        if ((_DWORD)v7 == 2)
        {
          v7 = 2;
          if (v6 == 12)
          {
            if ((int)result < a3)
              *(_QWORD *)(a4 + 32 * (int)result + 16) = a2;
            v7 = 0;
            result = (result + 1);
            v6 = 12;
          }
        }
        else
        {
          v6 = 12;
          v7 = 2;
          if ((int)result < a3)
          {
            *(_QWORD *)(a4 + 32 * (int)result + 8) = v8 + 2;
            v6 = 12;
            v7 = 2;
          }
        }
        continue;
      case 0xD:
        if ((_DWORD)v7 == 2)
        {
          v7 = 2;
          if (v6 == 13)
          {
            if ((int)result < a3)
              *(_QWORD *)(a4 + 32 * (int)result + 16) = a2;
            v7 = 0;
            result = (result + 1);
            v6 = 13;
          }
        }
        else
        {
          v6 = 13;
          v7 = 2;
          if ((int)result < a3)
          {
            *(_QWORD *)(a4 + 32 * (int)result + 8) = v8 + 2;
            v6 = 13;
            v7 = 2;
          }
        }
        continue;
      case 0x15:
        v7 = 0;
        if ((_DWORD)v11 != 1)
        {
          v7 = v11;
          if ((_DWORD)v11 == 2 && (int)result < a3)
          {
            v16 = a4 + 32 * (int)result;
            v18 = *(unsigned __int8 *)(v16 + 24);
            v17 = (_BYTE *)(v16 + 24);
            v7 = 2;
            if (v18)
            {
              if (v9 != 32
                || a2 == *(_QWORD *)(a4 + 32 * (int)result + 8)
                || (v19 = *(unsigned __int8 *)(v8 + 2), v19 == 32)
                || (v20 = *(unsigned __int8 *)(a1 + v19 + 136), v7 = 2, v6 == v20))
              {
                *v17 = 0;
                v7 = 2;
              }
            }
          }
        }
        continue;
      case 0x16:
      case 0x18:
      case 0x1D:
        if (!(_DWORD)v7)
        {
          v7 = 1;
          if ((int)result < a3)
          {
            v12 = a4 + 32 * (int)result;
            *(_QWORD *)v12 = a2;
            *(_BYTE *)(v12 + 24) = 1;
          }
        }
        continue;
      default:
        continue;
    }
  }
}

uint64_t setElementTypePrefix(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _BYTE *v7;
  uint64_t result;
  char v9;
  _BYTE *v10;
  uint64_t v11;

  v4 = 0;
  v5 = *(_QWORD *)(a1 + 688);
  v6 = *(char **)a2;
  while (1)
  {
    if (!v6[v4])
      return 1;
    if (v6[v4] == 58)
      break;
    ++v4;
  }
  for (; v4; --v4)
  {
    v7 = *(_BYTE **)(v5 + 184);
    if (v7 == *(_BYTE **)(v5 + 176))
    {
      result = poolGrow((uint64_t *)(v5 + 160));
      if (!(_DWORD)result)
        return result;
      v7 = *(_BYTE **)(v5 + 184);
    }
    v9 = *v6++;
    *(_QWORD *)(v5 + 184) = v7 + 1;
    *v7 = v9;
  }
  v10 = *(_BYTE **)(v5 + 184);
  if (v10 == *(_BYTE **)(v5 + 176))
  {
    result = poolGrow((uint64_t *)(v5 + 160));
    if (!(_DWORD)result)
      return result;
    v10 = *(_BYTE **)(v5 + 184);
  }
  *(_QWORD *)(v5 + 184) = v10 + 1;
  *v10 = 0;
  result = (uint64_t)lookup(a1, (uint64_t *)(v5 + 120), *(char **)(v5 + 192), 0x10uLL);
  if (result)
  {
    v11 = *(_QWORD *)(v5 + 192);
    if (*(_QWORD *)result == v11)
      *(_QWORD *)(v5 + 192) = *(_QWORD *)(v5 + 184);
    else
      *(_QWORD *)(v5 + 184) = v11;
    *(_QWORD *)(a2 + 8) = result;
    return 1;
  }
  return result;
}

uint64_t normal_scanAtts(uint64_t a1, unsigned __int8 *a2, uint64_t a3, unsigned __int8 **a4)
{
  unint64_t v4;
  unsigned __int8 *v7;
  int v9;
  uint64_t result;
  unsigned __int8 *v11;
  uint64_t v12;
  int v13;
  unsigned __int8 *v15;
  unsigned int v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unsigned int v20;
  unsigned int v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  unsigned __int8 *v26;

  v26 = a2;
  v4 = a3 - (_QWORD)a2;
  if (a3 - (uint64_t)a2 < 1)
    return 0xFFFFFFFFLL;
  v7 = a2;
  v9 = 0;
  v25 = a3 - 2;
  while (1)
  {
    result = 0;
    v11 = v7;
    switch(*(_BYTE *)(a1 + *v7 + 136))
    {
      case 5:
        if (v4 < 2)
          return 4294967294;
        if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 440))(a1, v7))
          goto LABEL_103;
        result = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(a1 + 392))(a1, v7);
        if (!(_DWORD)result)
          goto LABEL_104;
        v7 += 2;
        goto LABEL_5;
      case 6:
        if (v4 < 3)
          return 4294967294;
        if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 448))(a1, v7))
          goto LABEL_103;
        result = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(a1 + 400))(a1, v7);
        if (!(_DWORD)result)
          goto LABEL_104;
        v7 += 3;
        goto LABEL_5;
      case 7:
        if (v4 < 4)
          return 4294967294;
        if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 456))(a1, v7))
          goto LABEL_103;
        result = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(a1 + 408))(a1, v7);
        if (!(_DWORD)result)
          goto LABEL_104;
        v7 += 4;
        goto LABEL_5;
      case 8:
      case 0xB:
      case 0xC:
      case 0xD:
      case 0xF:
      case 0x10:
      case 0x11:
      case 0x12:
      case 0x13:
      case 0x14:
        goto LABEL_105;
      case 9:
      case 0xA:
      case 0x15:
        v12 = a3 - (_QWORD)++v7;
        if (a3 - (uint64_t)v7 < 1)
          return 0xFFFFFFFFLL;
        while (1)
        {
          v13 = *(unsigned __int8 *)(a1 + *v7 + 136);
          if ((v13 - 9) >= 2 && v13 != 21)
            break;
          ++v7;
          if (--v12 <= 0)
            return 0xFFFFFFFFLL;
        }
        if (v13 != 14)
          goto LABEL_103;
        v26 = v7;
LABEL_18:
        v15 = v7 + 1;
        if (a3 - (uint64_t)(v7 + 1) < 1)
          return 0xFFFFFFFFLL;
        v16 = *(unsigned __int8 *)(a1 + *v15 + 136);
        if ((v16 & 0xFE) != 0xC)
        {
          v17 = v25 - (_QWORD)v7;
          while (1)
          {
            v7 = v15;
            if (v16 > 0x15 || ((1 << v16) & 0x200600) == 0)
              break;
            if (v17 <= 0)
              return 0xFFFFFFFFLL;
            ++v15;
            v16 = *(unsigned __int8 *)(a1 + v7[1] + 136);
            --v17;
            if ((v16 & 0xFE) == 0xC)
              goto LABEL_25;
          }
LABEL_103:
          result = 0;
LABEL_104:
          v11 = v7;
LABEL_105:
          *a4 = v11;
          return result;
        }
LABEL_25:
        v7 += 2;
        v26 = v7;
        v18 = a3 - (_QWORD)v7;
        if (a3 - (uint64_t)v7 < 1)
          return 0xFFFFFFFFLL;
        break;
      case 0xE:
        goto LABEL_18;
      case 0x16:
      case 0x18:
      case 0x19:
      case 0x1A:
      case 0x1B:
        ++v7;
        goto LABEL_5;
      case 0x17:
        if (v9)
          goto LABEL_103;
        v11 = v7 + 1;
        v26 = v7 + 1;
        v19 = a3 - (_QWORD)(v7 + 1);
        if ((uint64_t)v19 < 1)
          return 0xFFFFFFFFLL;
        result = 0;
        v20 = *(unsigned __int8 *)(a1 + *v11 + 136);
        if (v20 <= 6)
        {
          if (v20 == 5)
          {
            if (v19 < 2)
              return 4294967294;
            if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 440))(a1, v7 + 1))
            {
LABEL_122:
              result = 0;
              goto LABEL_105;
            }
            result = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(a1 + 416))(a1, v7 + 1);
            if (!(_DWORD)result)
              goto LABEL_105;
            v7 += 3;
          }
          else
          {
            if (v20 != 6)
              goto LABEL_105;
            if (v19 < 3)
              return 4294967294;
            if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 448))(a1, v7 + 1))
              goto LABEL_122;
            result = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(a1 + 424))(a1, v7 + 1);
            if (!(_DWORD)result)
              goto LABEL_105;
            v7 += 4;
          }
        }
        else if (v20 == 7)
        {
          if (v19 < 4)
            return 4294967294;
          if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 456))(a1, v7 + 1))
            goto LABEL_122;
          result = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(a1 + 432))(a1, v7 + 1);
          if (!(_DWORD)result)
            goto LABEL_105;
          v7 += 5;
        }
        else
        {
          if (v20 != 24 && v20 != 22)
            goto LABEL_105;
          v7 += 2;
        }
        v26 = v7;
        v9 = 1;
        goto LABEL_6;
      default:
        goto LABEL_104;
    }
LABEL_26:
    if (*(unsigned __int8 *)(a1 + *v7 + 136) != v16)
      break;
    v11 = v7 + 1;
    v26 = v7 + 1;
    if (a3 - (uint64_t)(v7 + 1) < 1)
      return 0xFFFFFFFFLL;
    result = 0;
    v22 = *(unsigned __int8 *)(a1 + *v11 + 136);
    if (v22 > 0xA)
    {
      if (v22 != 21)
      {
        if (v22 == 11)
        {
LABEL_111:
          ++v11;
          result = 1;
          goto LABEL_105;
        }
        if (v22 != 17)
          goto LABEL_105;
LABEL_113:
        v26 = v11 + 1;
        if (a3 - (uint64_t)(v11 + 1) >= 1)
        {
          v24 = v11[1];
          if (v24 == 62)
            v11 += 2;
          else
            ++v11;
          if (v24 == 62)
            result = 3;
          else
            result = 0;
          goto LABEL_105;
        }
        return 0xFFFFFFFFLL;
      }
    }
    else if (v22 - 9 >= 2)
    {
      goto LABEL_105;
    }
    v11 = v7 + 2;
    v23 = a3 - (_QWORD)(v7 + 2);
    if (v23 < 1)
      return 0xFFFFFFFFLL;
    v7 += 6;
    while (2)
    {
      switch(*(_BYTE *)(a1 + *(v7 - 4) + 136))
      {
        case 5:
          if ((unint64_t)v23 < 2)
            return 4294967294;
          if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 440))(a1, v7 - 4))
            goto LABEL_122;
          result = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(a1 + 416))(a1, v7 - 4);
          if (!(_DWORD)result)
            goto LABEL_105;
          v9 = 0;
          v7 -= 2;
          goto LABEL_5;
        case 6:
          if ((unint64_t)v23 < 3)
            return 4294967294;
          if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 448))(a1, v7 - 4))
            goto LABEL_122;
          result = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(a1 + 424))(a1, v7 - 4);
          if (!(_DWORD)result)
            goto LABEL_105;
          v9 = 0;
          --v7;
          goto LABEL_5;
        case 7:
          if ((unint64_t)v23 < 4)
            return 4294967294;
          if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 456))(a1, v7 - 4))
          {
            result = 0;
            v11 = v7 - 4;
            goto LABEL_105;
          }
          result = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(a1 + 432))(a1, v7 - 4);
          if (!(_DWORD)result)
            goto LABEL_105;
          v9 = 0;
LABEL_5:
          v26 = v7;
          break;
        case 9:
        case 0xA:
        case 0x15:
          ++v11;
          --v23;
          ++v7;
          result = 0xFFFFFFFFLL;
          if (v23 <= 0)
            return result;
          continue;
        case 0xB:
          v11 = v7 - 4;
          goto LABEL_111;
        case 0x11:
          v11 = v7 - 4;
          goto LABEL_113;
        case 0x16:
        case 0x18:
          v9 = 0;
          v7 -= 3;
          goto LABEL_5;
        default:
          result = 0;
          v11 = v7 - 4;
          goto LABEL_105;
      }
      break;
    }
LABEL_6:
    v4 = a3 - (_QWORD)v7;
    if (a3 - (uint64_t)v7 <= 0)
      return 0xFFFFFFFFLL;
  }
  result = 0;
  v11 = v7;
  switch(*(_BYTE *)(a1 + *v7 + 136))
  {
    case 0:
    case 1:
    case 2:
    case 8:
      goto LABEL_105;
    case 3:
      result = normal_scanRef(a1, v7 + 1, a3, &v26);
      if ((int)result >= 1)
      {
        v7 = v26;
LABEL_41:
        v18 = a3 - (_QWORD)v7;
        if (a3 - (uint64_t)v7 <= 0)
          return 0xFFFFFFFFLL;
        goto LABEL_26;
      }
      if (!(_DWORD)result)
      {
        v11 = v26;
        goto LABEL_105;
      }
      return result;
    case 5:
      if (v18 < 2)
        return 4294967294;
      if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 440))(a1, v7))
        goto LABEL_103;
      v7 += 2;
      goto LABEL_40;
    case 6:
      if (v18 < 3)
        return 4294967294;
      if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 448))(a1, v7))
        goto LABEL_103;
      v7 += 3;
      goto LABEL_40;
    case 7:
      if (v18 < 4)
        return 4294967294;
      if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 456))(a1, v7))
        goto LABEL_103;
      v7 += 4;
LABEL_40:
      v26 = v7;
      goto LABEL_41;
    default:
      ++v7;
      goto LABEL_40;
  }
}

uint64_t freeBindings(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v4)(_QWORD, _QWORD);
  uint64_t v5;
  _QWORD *v6;

  if (a2)
  {
    v2 = a2;
    v3 = (_QWORD *)result;
    do
    {
      v4 = (uint64_t (*)(_QWORD, _QWORD))v3[28];
      if (v4)
        result = v4(v3[1], **(_QWORD **)v2);
      v6 = *(_QWORD **)v2;
      v5 = *(_QWORD *)(v2 + 8);
      *(_QWORD *)(v2 + 8) = v3[91];
      v3[91] = v2;
      v6[1] = *(_QWORD *)(v2 + 16);
      v2 = v5;
    }
    while (v5);
  }
  return result;
}

uint64_t storeAttributeValue(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 *a4, uint64_t a5, uint64_t *a6, int a7)
{
  int v8;
  uint64_t result;
  _BYTE *v10;

  v8 = a3;
  result = appendAttributeValue(a1, a2, a3, a4, a5, a6, a7);
  if (!(_DWORD)result)
  {
    v10 = (_BYTE *)a6[3];
    if (!v8 && v10 != (_BYTE *)a6[4] && *(v10 - 1) == 32)
      a6[3] = (uint64_t)--v10;
    if (v10 == (_BYTE *)a6[2])
    {
      if (!poolGrow(a6))
        return 1;
      v10 = (_BYTE *)a6[3];
    }
    result = 0;
    a6[3] = (uint64_t)(v10 + 1);
    *v10 = 0;
  }
  return result;
}

uint64_t reportDefault(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = a3;
  if (*(_BYTE *)(a2 + 132))
    return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(a1 + 176))(*(_QWORD *)(a1 + 8), a3, (a4 - a3));
  if (*(_QWORD *)(a1 + 304) == a2)
  {
    v8 = (_QWORD *)(a1 + 560);
    v9 = (_QWORD *)(a1 + 568);
  }
  else
  {
    v8 = *(_QWORD **)(a1 + 584);
    v9 = v8 + 1;
  }
  do
  {
    v10 = *(_QWORD *)(a1 + 112);
    v12 = *(_QWORD *)(a1 + 104);
    v11 = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t *, uint64_t))(a2 + 112))(a2, &v13, a4, &v12, v10);
    *v9 = v13;
    result = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1 + 176))(*(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 104), v12 - *(_QWORD *)(a1 + 104));
    *v8 = v13;
  }
  while (v11 > 1);
  return result;
}

void XML_SetUserData(XML_Parser parser, void *userData)
{
  uint64_t v2;
  uint64_t v3;

  if (parser)
  {
    v3 = *(_QWORD *)parser;
    v2 = *((_QWORD *)parser + 1);
    *(_QWORD *)parser = userData;
    if (v2 == v3)
      *((_QWORD *)parser + 1) = userData;
  }
}

void XML_ParserFree(XML_Parser parser)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(_QWORD);

  if (parser)
  {
    v2 = (_QWORD *)*((_QWORD *)parser + 88);
    if (v2)
      goto LABEL_5;
    while (1)
    {
      v2 = (_QWORD *)*((_QWORD *)parser + 89);
      if (!v2)
        break;
      *((_QWORD *)parser + 89) = 0;
      do
      {
LABEL_5:
        v3 = (_QWORD *)*v2;
        (*((void (**)(_QWORD))parser + 5))(v2[8]);
        v4 = v2[10];
        if (v4)
        {
          do
          {
            v5 = *(_QWORD *)(v4 + 8);
            (*((void (**)(_QWORD))parser + 5))(*(_QWORD *)(v4 + 32));
            (*((void (**)(uint64_t))parser + 5))(v4);
            v4 = v5;
          }
          while (v5);
        }
        (*((void (**)(_QWORD *))parser + 5))(v2);
        v2 = v3;
      }
      while (v3);
    }
    v6 = *((_QWORD *)parser + 73);
    if (v6)
      goto LABEL_12;
    while (1)
    {
      v6 = *((_QWORD *)parser + 74);
      if (!v6)
        break;
      *((_QWORD *)parser + 74) = 0;
      do
      {
LABEL_12:
        v7 = *(_QWORD *)(v6 + 16);
        (*((void (**)(void))parser + 5))();
        v6 = v7;
      }
      while (v7);
    }
    v8 = *((_QWORD *)parser + 91);
    if (v8)
    {
      do
      {
        v9 = *(_QWORD *)(v8 + 8);
        (*((void (**)(_QWORD))parser + 5))(*(_QWORD *)(v8 + 32));
        (*((void (**)(uint64_t))parser + 5))(v8);
        v8 = v9;
      }
      while (v9);
    }
    v10 = *((_QWORD *)parser + 90);
    if (v10)
    {
      do
      {
        v11 = *(_QWORD *)(v10 + 8);
        (*((void (**)(_QWORD))parser + 5))(*(_QWORD *)(v10 + 32));
        (*((void (**)(uint64_t))parser + 5))(v10);
        v10 = v11;
      }
      while (v11);
    }
    poolDestroy((uint64_t)parser + 800);
    poolDestroy((uint64_t)parser + 848);
    (*((void (**)(_QWORD))parser + 5))(*((_QWORD *)parser + 58));
    if (!*((_BYTE *)parser + 928))
    {
      v12 = (_QWORD *)*((_QWORD *)parser + 86);
      if (v12)
      {
        v13 = (uint64_t *)v12[5];
        if (v13)
          v14 = &v13[v12[7]];
        else
          v14 = 0;
        v15 = *((_QWORD *)parser + 114);
        while (v13 != v14)
        {
          v17 = *v13++;
          v16 = v17;
          if (v17 && *(_DWORD *)(v16 + 28))
            (*((void (**)(_QWORD))parser + 5))(*(_QWORD *)(v16 + 32));
        }
        hashTableDestroy(v12);
        hashTableDestroy(v12 + 33);
        hashTableDestroy(v12 + 5);
        hashTableDestroy(v12 + 10);
        hashTableDestroy(v12 + 15);
        poolDestroy((uint64_t)(v12 + 20));
        poolDestroy((uint64_t)(v12 + 26));
        if (!v15)
        {
          (*((void (**)(_QWORD))parser + 5))(v12[44]);
          (*((void (**)(_QWORD))parser + 5))(v12[41]);
        }
        (*((void (**)(_QWORD *))parser + 5))(v12);
      }
    }
    (*((void (**)(_QWORD))parser + 5))(*((_QWORD *)parser + 94));
    (*((void (**)(_QWORD))parser + 5))(*((_QWORD *)parser + 112));
    (*((void (**)(_QWORD))parser + 5))(*((_QWORD *)parser + 2));
    (*((void (**)(_QWORD))parser + 5))(*((_QWORD *)parser + 13));
    (*((void (**)(_QWORD))parser + 5))(*((_QWORD *)parser + 95));
    (*((void (**)(_QWORD))parser + 5))(*((_QWORD *)parser + 60));
    v18 = (void (*)(_QWORD))*((_QWORD *)parser + 63);
    if (v18)
      v18(*((_QWORD *)parser + 61));
    (*((void (**)(XML_Parser))parser + 5))(parser);
  }
}

uint64_t hashTableDestroy(_QWORD *a1)
{
  unint64_t v2;

  if (a1[2])
  {
    v2 = 0;
    do
      (*(void (**)(_QWORD))(a1[4] + 16))(*(_QWORD *)(*a1 + 8 * v2++));
    while (v2 < a1[2]);
  }
  return (*(uint64_t (**)(_QWORD))(a1[4] + 16))(*a1);
}

_QWORD *poolDestroy(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *result;
  _QWORD *v5;

  v2 = *(_QWORD **)a1;
  if (v2)
  {
    do
    {
      v3 = (_QWORD *)*v2;
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      v2 = v3;
    }
    while (v3);
  }
  result = *(_QWORD **)(a1 + 8);
  if (result)
  {
    do
    {
      v5 = (_QWORD *)*result;
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      result = v5;
    }
    while (v5);
  }
  return result;
}

uint64_t appendAttributeValue(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 *a4, uint64_t a5, uint64_t *a6, int a7)
{
  int v14;
  uint64_t appended;
  unsigned __int8 *v16;
  unsigned __int8 v17;
  unsigned int v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  char *v22;
  _BYTE *v23;
  char v24;
  char *v25;
  _OWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  unsigned __int8 v37;
  _BYTE v38[4];
  unint64_t v39;

  v36 = (uint64_t *)(a1 + 848);
  v34 = *(_QWORD *)(a1 + 688) + 160;
  v35 = *(_QWORD *)(a1 + 688);
  while (2)
  {
    v39 = (unint64_t)a4;
    v14 = (*(uint64_t (**)(uint64_t, unsigned __int8 *, uint64_t, unint64_t *))(a2 + 32))(a2, a4, a5, &v39);
    if (!accountingDiffTolerated(a1, v14, a4, v39, 5998, a7))
    {
      accountingReportStats((_QWORD *)a1, " ABORTING\n");
      return 43;
    }
    appended = 0;
    switch(v14)
    {
      case -4:
        return appended;
      case -3:
        v39 = (unint64_t)&a4[*(int *)(a2 + 128)];
        goto LABEL_6;
      case -2:
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      case 8:
        goto LABEL_57;
      case -1:
        if (*(_QWORD *)(a1 + 304) == a2)
          *(_QWORD *)(a1 + 560) = a4;
        return 4;
      case 0:
        if (*(_QWORD *)(a1 + 304) == a2)
          *(_QWORD *)(a1 + 560) = v39;
        return 4;
      case 6:
        if (!poolAppend(a6, a2, (uint64_t)a4, v39))
          return 1;
        goto LABEL_22;
      case 7:
        goto LABEL_6;
      case 9:
        v37 = 0;
        v37 = (*(uint64_t (**)(uint64_t, unsigned __int8 *, unint64_t))(a2 + 88))(a2, &a4[*(int *)(a2 + 128)], v39 - *(int *)(a2 + 128));
        if (v37)
        {
          accountingDiffTolerated(a1, 9, &v37, (unint64_t)v38, 6067, 1);
          v16 = (unsigned __int8 *)a6[3];
          if (v16 == (unsigned __int8 *)a6[2])
          {
            if (!poolGrow(a6))
              return 1;
            v16 = (unsigned __int8 *)a6[3];
          }
          v17 = v37;
          a6[3] = (uint64_t)(v16 + 1);
LABEL_21:
          *v16 = v17;
LABEL_22:
          a4 = (unsigned __int8 *)v39;
          continue;
        }
        v25 = (char *)poolStoreString(v36, a2, (uint64_t)&a4[*(int *)(a2 + 128)], v39 - *(int *)(a2 + 128));
        if (!v25)
          return 1;
        v26 = lookup(a1, (uint64_t *)v35, v25, 0);
        v27 = (uint64_t)v26;
        *(_QWORD *)(a1 + 872) = *(_QWORD *)(a1 + 880);
        if ((uint64_t *)v34 == a6)
        {
          if (!*(_DWORD *)(a1 + 532))
            goto LABEL_47;
          if (*(_BYTE *)(v35 + 258))
          {
            if (*(_QWORD *)(a1 + 584))
              goto LABEL_47;
          }
          else if (*(_BYTE *)(v35 + 257))
          {
            goto LABEL_47;
          }
LABEL_39:
          if (!v26)
            return 11;
          if (!*((_BYTE *)v26 + 58))
            return 24;
        }
        else
        {
          if (!*(_BYTE *)(v35 + 257) || *(_BYTE *)(v35 + 258))
            goto LABEL_39;
LABEL_47:
          if (!v26)
            goto LABEL_22;
        }
        if (!*((_BYTE *)v26 + 56))
        {
          if (*((_QWORD *)v26 + 6))
          {
            v32 = *(_QWORD *)(a1 + 304);
            appended = 15;
            goto LABEL_71;
          }
          v28 = *((_QWORD *)v26 + 1);
          if (!v28)
          {
            v32 = *(_QWORD *)(a1 + 304);
            appended = 16;
            goto LABEL_71;
          }
          v29 = v28 + *((int *)v26 + 4);
          *((_BYTE *)v26 + 56) = 1;
          entityTrackingOnOpen(a1, (uint64_t)v26, 6148);
          appended = appendAttributeValue(a1, *(_QWORD *)(a1 + 456), a3, *(_QWORD *)(v27 + 8), v29, a6, 1);
          v30 = a1;
          do
          {
            v31 = v30;
            v30 = *(_QWORD *)(v30 + 912);
          }
          while (v30);
          entityTrackingReportStats(v31, v27, "CLOSE", 6155);
          --*(_DWORD *)(v31 + 988);
          *(_BYTE *)(v27 + 56) = 0;
          if ((_DWORD)appended)
            return appended;
          goto LABEL_22;
        }
        v32 = *(_QWORD *)(a1 + 304);
        appended = 12;
LABEL_71:
        if (v32 == a2)
          *(_QWORD *)(a1 + 560) = a4;
        return appended;
      case 10:
        v18 = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(a2 + 80))(a2, a4);
        if ((v18 & 0x80000000) != 0)
        {
          if (*(_QWORD *)(a1 + 304) == a2)
            *(_QWORD *)(a1 + 560) = a4;
          return 14;
        }
        if ((_DWORD)a3 || v18 != 32 || (v19 = a6[3], v19 != a6[4]) && *(_BYTE *)(v19 - 1) != 32)
        {
          v20 = XmlUtf8Encode(v18, v38);
          if (v20 >= 1)
          {
            v21 = v20;
            v22 = v38;
            do
            {
              v23 = (_BYTE *)a6[3];
              if (v23 == (_BYTE *)a6[2])
              {
                if (!poolGrow(a6))
                  return 1;
                v23 = (_BYTE *)a6[3];
              }
              v24 = *v22++;
              a6[3] = (uint64_t)(v23 + 1);
              *v23 = v24;
              --v21;
            }
            while (v21);
          }
        }
        goto LABEL_22;
      default:
        if (v14 != 39)
        {
LABEL_57:
          if (*(_QWORD *)(a1 + 304) == a2)
            *(_QWORD *)(a1 + 560) = a4;
          return 23;
        }
LABEL_6:
        v16 = (unsigned __int8 *)a6[3];
        if (!(_DWORD)a3 && (v16 == (unsigned __int8 *)a6[4] || *(v16 - 1) == 32))
          goto LABEL_22;
        if (v16 == (unsigned __int8 *)a6[2])
        {
          if (!poolGrow(a6))
            return 1;
          v16 = (unsigned __int8 *)a6[3];
        }
        a6[3] = (uint64_t)(v16 + 1);
        v17 = 32;
        goto LABEL_21;
    }
  }
}

uint64_t normal_attributeValueTok(uint64_t a1, unsigned __int8 *a2, unint64_t a3, unsigned __int8 **a4)
{
  unsigned __int8 *v4;
  uint64_t v5;
  uint64_t result;
  unsigned __int8 *v7;

  if ((unint64_t)a2 >= a3)
    return 4294967292;
  if ((uint64_t)(a3 - (_QWORD)a2) < 1)
    return 0xFFFFFFFFLL;
  v4 = a2;
  while (2)
  {
    v5 = 2;
    switch(*(_BYTE *)(a1 + *v4 + 136))
    {
      case 2:
        result = 0;
        *a4 = v4;
        return result;
      case 3:
        if (v4 != a2)
          goto LABEL_9;
        return normal_scanRef(a1, a2 + 1, a3, a4);
      case 5:
        goto LABEL_8;
      case 6:
        v5 = 3;
        goto LABEL_8;
      case 7:
        v5 = 4;
        goto LABEL_8;
      case 9:
        if (v4 != a2)
          goto LABEL_9;
        v7 = a2 + 1;
        if ((uint64_t)(a3 - (_QWORD)(a2 + 1)) < 1)
        {
          result = 4294967293;
        }
        else
        {
          if (*(_BYTE *)(a1 + a2[1] + 136) == 10)
            v7 = a2 + 2;
LABEL_22:
          *a4 = v7;
          result = 7;
        }
        break;
      case 0xA:
        if (v4 != a2)
          goto LABEL_9;
        v7 = a2 + 1;
        goto LABEL_22;
      case 0x15:
        if (v4 != a2)
          goto LABEL_9;
        *a4 = a2 + 1;
        return 39;
      default:
        v5 = 1;
LABEL_8:
        v4 += v5;
        if ((uint64_t)(a3 - (_QWORD)v4) > 0)
          continue;
LABEL_9:
        *a4 = v4;
        result = 6;
        break;
    }
    return result;
  }
}

XML_Status XML_Parse(XML_Parser parser, const char *s, int len, int isFinal)
{
  int v8;
  int v9;
  void *Buffer;

  if (!parser || len < 0)
  {
    if (!parser)
      return 0;
    goto LABEL_10;
  }
  if (!s && len)
  {
LABEL_10:
    v9 = 41;
    goto LABEL_11;
  }
  v8 = *((_DWORD *)parser + 230);
  if (v8)
  {
    if (v8 == 2)
    {
      v9 = 36;
      goto LABEL_11;
    }
    if (v8 == 3)
    {
      v9 = 33;
LABEL_11:
      *((_DWORD *)parser + 138) = v9;
      return 0;
    }
  }
  else if (!*((_QWORD *)parser + 114) && !startParsing((uint64_t)parser))
  {
    v9 = 1;
    goto LABEL_11;
  }
  *((_DWORD *)parser + 230) = 1;
  Buffer = XML_GetBuffer(parser, len);
  if (!Buffer)
    return 0;
  if (len)
  {
    if (!s)
      XML_Parse_cold_1();
    memcpy(Buffer, s, len);
  }
  return XML_ParseBuffer(parser, len, isFinal);
}

void *__cdecl XML_GetBuffer(void *parser, int len)
{
  void *v2;
  int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v23;
  const void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  if (parser)
  {
    v2 = parser;
    if (len < 0)
      goto LABEL_56;
    v3 = *((_DWORD *)parser + 230);
    if (v3 == 2)
    {
      parser = 0;
      v4 = 36;
      goto LABEL_58;
    }
    if (v3 == 3)
    {
      parser = 0;
      v4 = 33;
LABEL_58:
      *((_DWORD *)v2 + 138) = v4;
      return parser;
    }
    *((_DWORD *)parser + 25) = len;
    v5 = *((_QWORD *)parser + 8);
    if (v5)
    {
      v6 = *((_QWORD *)parser + 7);
      if (v6)
        v7 = v5 - v6;
      else
        v7 = 0;
    }
    else
    {
      v7 = 0;
    }
    if (v7 >= len && *((_QWORD *)parser + 2))
      return (void *)*((_QWORD *)parser + 7);
    parser = (void *)*((_QWORD *)parser + 7);
    if (parser)
    {
      v8 = *((_QWORD *)v2 + 6);
      v9 = v8 ? (_DWORD)parser - v8 : 0;
    }
    else
    {
      v9 = 0;
    }
    v10 = v9 + len;
    if (v10 < 0)
      goto LABEL_56;
    v11 = *((_QWORD *)v2 + 6);
    if (v11)
    {
      v12 = *((_QWORD *)v2 + 2);
      v13 = v12 ? v11 - v12 : 0;
    }
    else
    {
      v13 = 0;
    }
    v14 = v13 >= 1024 ? 1024 : v13;
    if (v14 > (v10 ^ 0x7FFFFFFF))
      goto LABEL_56;
    v15 = v14 + v10;
    v16 = *((_QWORD *)v2 + 2);
    if (!v16)
      goto LABEL_41;
    if (v11)
    {
      LODWORD(v17) = v5 - v16;
      if (v5)
        v18 = v5 - v16;
      else
        v18 = 0;
      if (v18 >= v15)
      {
        if (v11 - v16 <= v14)
        {
LABEL_62:
          *((_QWORD *)v2 + 72) = 0;
          *((_OWORD *)v2 + 35) = 0u;
          return parser;
        }
        v19 = (int)v11 - (int)v16 - (uint64_t)v14;
        memmove(*((void **)v2 + 2), (const void *)(v16 + v19), (size_t)parser + v14 - v11);
        v20 = *((_QWORD *)v2 + 6);
        parser = (void *)(*((_QWORD *)v2 + 7) - v19);
        *((_QWORD *)v2 + 7) = parser;
        v21 = (char *)(v20 - v19);
LABEL_61:
        *((_QWORD *)v2 + 6) = v21;
        goto LABEL_62;
      }
    }
    else
    {
      LODWORD(v17) = v5 - v16;
    }
    if (!v5 || !(_DWORD)v17)
LABEL_41:
      LODWORD(v17) = 1024;
    do
      v17 = (2 * v17);
    while ((int)v17 < v15 && (int)v17 > 0);
    if ((int)v17 <= 0)
    {
LABEL_56:
      parser = 0;
    }
    else
    {
      parser = (void *)(*((uint64_t (**)(uint64_t))v2 + 3))(v17);
      if (parser)
      {
        v21 = (char *)parser;
        *((_QWORD *)v2 + 8) = (char *)parser + v17;
        v23 = *((_QWORD *)v2 + 6);
        if (v23)
        {
          v24 = (const void *)(v23 - v14);
          v25 = *((_QWORD *)v2 + 7);
          v26 = v25 - v23;
          if (!v25)
            v26 = 0;
          memcpy(parser, v24, v26 + v14);
          (*((void (**)(_QWORD))v2 + 5))(*((_QWORD *)v2 + 2));
          *((_QWORD *)v2 + 2) = v21;
          v27 = *((_QWORD *)v2 + 7);
          if (v27)
          {
            v28 = *((_QWORD *)v2 + 6);
            v27 -= v28;
            if (!v28)
              v27 = 0;
          }
          v21 += v14;
          parser = &v21[v27];
          *((_QWORD *)v2 + 7) = &v21[v27];
        }
        else
        {
          *((_QWORD *)v2 + 7) = parser;
          *((_QWORD *)v2 + 2) = parser;
        }
        goto LABEL_61;
      }
    }
    v4 = 1;
    goto LABEL_58;
  }
  return parser;
}

uint64_t startParsing(uint64_t a1)
{
  uint64_t v2;
  uint64_t __buf;

  if (!*(_QWORD *)(a1 + 936))
  {
    __buf = 0;
    arc4random_buf(&__buf, 8uLL);
    v2 = __buf;
    if (getDebugLevel("EXPAT_ENTROPY_DEBUG"))
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "expat: Entropy: %s --> 0x%0*lx (%lu bytes)\n", "arc4random_buf", 16, v2, 8);
    *(_QWORD *)(a1 + 936) = v2;
  }
  if (*(_BYTE *)(a1 + 472))
    return setContext(a1, "xml=http://www.w3.org/XML/1998/namespace");
  else
    return 1;
}

XML_Parser XML_ParserCreateNS(const XML_Char *encoding, XML_Char namespaceSeparator)
{
  _BYTE v3[2];

  v3[0] = namespaceSeparator;
  v3[1] = 0;
  return (XML_Parser)parserCreate((unsigned __int8 *)encoding, 0, v3, 0);
}

uint64_t parserCreate(unsigned __int8 *a1, __int128 *a2, _BYTE *a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (**v17)(uint64_t);
  uint64_t v18;

  if (a2)
  {
    v8 = (*(uint64_t (**)(uint64_t))a2)(1008);
    v9 = v8;
    if (!v8)
      return v9;
    v10 = *a2;
    *(_OWORD *)(v8 + 24) = *a2;
    v11 = *((_QWORD *)a2 + 2);
    v12 = (uint64_t (*)(uint64_t))v10;
  }
  else
  {
    v13 = malloc_type_malloc(0x3F0uLL, 0x10F0040299F7DE7uLL);
    v9 = (uint64_t)v13;
    if (!v13)
      return v9;
    v12 = (uint64_t (*)(uint64_t))MEMORY[0x24BDAED08];
    v14 = MEMORY[0x24BDAFAB0];
    v13[3] = MEMORY[0x24BDAED08];
    v13[4] = v14;
    v11 = MEMORY[0x24BDAE450];
  }
  *(_QWORD *)(v9 + 40) = v11;
  *(_QWORD *)(v9 + 16) = 0;
  *(_QWORD *)(v9 + 64) = 0;
  *(_DWORD *)(v9 + 736) = 16;
  v15 = v12(512);
  *(_QWORD *)(v9 + 752) = v15;
  if (!v15)
    goto LABEL_21;
  v16 = (*(uint64_t (**)(uint64_t))(v9 + 24))(1024);
  *(_QWORD *)(v9 + 104) = v16;
  if (!v16)
  {
LABEL_20:
    (*(void (**)(_QWORD))(v9 + 40))(*(_QWORD *)(v9 + 752));
LABEL_21:
    (*(void (**)(uint64_t))(v9 + 40))(v9);
    return 0;
  }
  v17 = (uint64_t (**)(uint64_t))(v9 + 24);
  *(_QWORD *)(v9 + 112) = v16 + 1024;
  v18 = a4;
  if (!a4)
  {
    v18 = (*v17)(360);
    if (v18)
    {
      *(_OWORD *)(v18 + 160) = 0u;
      *(_OWORD *)(v18 + 176) = 0u;
      *(_QWORD *)(v18 + 192) = 0;
      *(_QWORD *)(v18 + 200) = v17;
      *(_OWORD *)(v18 + 208) = 0u;
      *(_OWORD *)(v18 + 224) = 0u;
      *(_QWORD *)(v18 + 240) = 0;
      *(_QWORD *)(v18 + 248) = v17;
      *(_BYTE *)(v18 + 8) = 0;
      *(_QWORD *)v18 = 0;
      *(_QWORD *)(v18 + 16) = 0;
      *(_QWORD *)(v18 + 24) = 0;
      *(_BYTE *)(v18 + 48) = 0;
      *(_QWORD *)(v18 + 32) = v17;
      *(_QWORD *)(v18 + 40) = 0;
      *(_QWORD *)(v18 + 56) = 0;
      *(_QWORD *)(v18 + 64) = 0;
      *(_BYTE *)(v18 + 88) = 0;
      *(_QWORD *)(v18 + 72) = v17;
      *(_QWORD *)(v18 + 80) = 0;
      *(_QWORD *)(v18 + 96) = 0;
      *(_QWORD *)(v18 + 104) = 0;
      *(_BYTE *)(v18 + 128) = 0;
      *(_QWORD *)(v18 + 112) = v17;
      *(_QWORD *)(v18 + 120) = 0;
      *(_QWORD *)(v18 + 136) = 0;
      *(_QWORD *)(v18 + 144) = 0;
      *(_QWORD *)(v18 + 152) = v17;
      *(_BYTE *)(v18 + 272) = 0;
      *(_QWORD *)(v18 + 264) = 0;
      *(_QWORD *)(v18 + 280) = 0;
      *(_QWORD *)(v18 + 288) = 0;
      *(_QWORD *)(v18 + 296) = v17;
      *(_QWORD *)(v18 + 304) = 0;
      *(_QWORD *)(v18 + 312) = 0;
      *(_BYTE *)(v18 + 320) = 0;
      *(_OWORD *)(v18 + 328) = 0u;
      *(_OWORD *)(v18 + 344) = 0u;
      *(_DWORD *)(v18 + 256) = 1;
      goto LABEL_11;
    }
    *(_QWORD *)(v9 + 688) = 0;
    (*(void (**)(_QWORD))(v9 + 40))(*(_QWORD *)(v9 + 104));
    goto LABEL_20;
  }
LABEL_11:
  *(_QWORD *)(v9 + 688) = v18;
  *(_QWORD *)(v9 + 728) = 0;
  *(_QWORD *)(v9 + 712) = 0;
  *(_QWORD *)(v9 + 592) = 0;
  *(_DWORD *)(v9 + 904) = 0;
  *(_QWORD *)(v9 + 896) = 0;
  *(_QWORD *)(v9 + 264) = 0;
  *(_QWORD *)(v9 + 496) = 0;
  *(_BYTE *)(v9 + 908) = 33;
  *(_WORD *)(v9 + 472) = 0;
  *(_QWORD *)(v9 + 464) = 0;
  *(_OWORD *)(v9 + 800) = 0u;
  *(_OWORD *)(v9 + 816) = 0u;
  *(_QWORD *)(v9 + 832) = 0;
  *(_BYTE *)(v9 + 776) = 0;
  *(_OWORD *)(v9 + 760) = 0u;
  *(_QWORD *)(v9 + 840) = v17;
  *(_QWORD *)(v9 + 880) = 0;
  *(_OWORD *)(v9 + 848) = 0u;
  *(_OWORD *)(v9 + 864) = 0u;
  *(_QWORD *)(v9 + 888) = v17;
  parserInit(v9, a1);
  if (a1 && !*(_QWORD *)(v9 + 464))
  {
    if (a4)
      *(_QWORD *)(v9 + 688) = 0;
    XML_ParserFree((XML_Parser)v9);
    return 0;
  }
  if (a3)
  {
    *(_BYTE *)(v9 + 472) = 1;
    *(_QWORD *)(v9 + 456) = XmlGetUtf8InternalEncodingNS();
    *(_BYTE *)(v9 + 908) = *a3;
  }
  else
  {
    *(_QWORD *)(v9 + 456) = XmlGetUtf8InternalEncoding();
  }
  return v9;
}

unint64_t parserInit(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v4;
  unint64_t result;

  *(_QWORD *)(a1 + 544) = prologInitProcessor;
  XmlPrologStateInit(a1 + 512);
  if (a2)
    *(_QWORD *)(a1 + 464) = copyString(a2, (uint64_t (**)(size_t))(a1 + 24));
  *(_QWORD *)(a1 + 696) = 0;
  XmlInitEncoding(a1 + 312, (_QWORD *)(a1 + 304), 0);
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 152) = 0u;
  *(_OWORD *)(a1 + 168) = 0u;
  *(_OWORD *)(a1 + 184) = 0u;
  *(_OWORD *)(a1 + 200) = 0u;
  *(_OWORD *)(a1 + 216) = 0u;
  *(_OWORD *)(a1 + 232) = 0u;
  *(_QWORD *)(a1 + 248) = a1;
  *(_QWORD *)(a1 + 256) = 0;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 288) = 0u;
  v4 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 48) = v4;
  *(_QWORD *)(a1 + 56) = v4;
  *(_QWORD *)(a1 + 88) = 0;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_BYTE *)(a1 + 96) = 1;
  *(_DWORD *)(a1 + 100) = 0;
  *(_OWORD *)(a1 + 608) = 0u;
  *(_OWORD *)(a1 + 624) = 0u;
  *(_OWORD *)(a1 + 640) = 0u;
  *(_OWORD *)(a1 + 656) = 0u;
  *(_OWORD *)(a1 + 666) = 0u;
  *(_OWORD *)(a1 + 784) = 0u;
  *(_DWORD *)(a1 + 552) = 0;
  *(_OWORD *)(a1 + 560) = 0u;
  *(_OWORD *)(a1 + 576) = 0u;
  *(_BYTE *)(a1 + 600) = 1;
  *(_DWORD *)(a1 + 604) = 0;
  *(_QWORD *)(a1 + 704) = 0;
  *(_QWORD *)(a1 + 720) = 0;
  *(_DWORD *)(a1 + 740) = 0;
  *(_QWORD *)(a1 + 504) = 0;
  *(_QWORD *)(a1 + 912) = 0;
  *(_DWORD *)(a1 + 920) = 0;
  *(_WORD *)(a1 + 928) = 0;
  *(_DWORD *)(a1 + 932) = 0;
  *(_QWORD *)(a1 + 936) = 0;
  *(_QWORD *)(a1 + 480) = 0;
  *(_QWORD *)(a1 + 488) = 0;
  *(_OWORD *)(a1 + 944) = 0u;
  *(_OWORD *)(a1 + 960) = 0u;
  *(_QWORD *)(a1 + 976) = 0;
  *(_QWORD *)(a1 + 960) = getDebugLevel("EXPAT_ACCOUNTING_DEBUG");
  *(_DWORD *)(a1 + 968) = 1120403456;
  *(_QWORD *)(a1 + 976) = 0x800000;
  *(_QWORD *)(a1 + 984) = 0;
  *(_QWORD *)(a1 + 1000) = 0;
  *(_QWORD *)(a1 + 992) = 0;
  result = getDebugLevel("EXPAT_ENTITY_DEBUG");
  *(_QWORD *)(a1 + 1000) = result;
  return result;
}

unint64_t getDebugLevel(const char *a1)
{
  char *v1;
  const char *v2;
  unint64_t v3;
  char *__endptr;

  v1 = getenv(a1);
  if (!v1)
    return 0;
  v2 = v1;
  *__error() = 0;
  __endptr = 0;
  v3 = strtoul(v2, &__endptr, 10);
  if (*__error() || __endptr == v2 || *__endptr)
  {
    v3 = 0;
    *__error() = 0;
  }
  return v3;
}

double XmlPrologStateInit(uint64_t a1)
{
  double result;

  *(_QWORD *)a1 = prolog0;
  *(_QWORD *)&result = 0x100000000;
  *(_QWORD *)(a1 + 16) = 0x100000000;
  *(_DWORD *)(a1 + 24) = 0;
  return result;
}

uint64_t XmlInitEncoding(uint64_t a1, _QWORD *a2, unsigned __int8 *a3)
{
  int EncodingIndex;

  EncodingIndex = getEncodingIndex(a3);
  if (EncodingIndex == -1)
    return 0;
  *(_BYTE *)(a1 + 133) = EncodingIndex;
  *(_QWORD *)a1 = initScanProlog;
  *(_QWORD *)(a1 + 8) = initScanContent;
  *(_QWORD *)(a1 + 96) = initUpdatePosition;
  *(_QWORD *)(a1 + 136) = a2;
  *a2 = a1;
  return 1;
}

uint64_t (**XmlGetUtf8InternalEncodingNS())()
{
  return internal_utf8_encoding_ns;
}

uint64_t setContext(uint64_t a1, _BYTE *a2)
{
  _BYTE *v2;
  uint64_t v3;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t *v7;
  _BYTE *v8;
  int v9;
  _BYTE *v10;
  _OWORD *v11;
  _BYTE *v12;
  _QWORD *v13;
  char **v14;
  char *v15;
  uint64_t v16;
  _BYTE *v17;
  int v18;
  int v19;
  _BYTE *v21;
  _BYTE *v22;

  if (!a2)
    return 0;
  v2 = a2;
  v3 = 1;
  if (*a2)
  {
    v5 = (uint64_t *)(a1 + 800);
    v6 = *(uint64_t **)(a1 + 688);
    v7 = (uint64_t *)(a1 + 720);
    v8 = a2;
    while (1)
    {
      v9 = *v2;
      if (*v2)
      {
        if (v9 == 61)
        {
          v12 = *(_BYTE **)(a1 + 824);
          v13 = v6 + 38;
          if (v12 == *(_BYTE **)(a1 + 832))
            goto LABEL_29;
          if (v12 == *(_BYTE **)(a1 + 816))
          {
            if (!poolGrow(v5))
              return 0;
            v12 = *(_BYTE **)(a1 + 824);
          }
          *(_QWORD *)(a1 + 824) = v12 + 1;
          *v12 = 0;
          v14 = (char **)lookup(a1, v6 + 15, *(char **)(a1 + 832), 0x10uLL);
          if (!v14)
            return 0;
          v13 = v14;
          v15 = *(char **)(a1 + 832);
          if (*v14 == v15)
          {
            v16 = poolCopyString(v6 + 20, *v14);
            *v13 = v16;
            if (!v16)
              return 0;
            v15 = *(char **)(a1 + 832);
          }
          *(_QWORD *)(a1 + 824) = v15;
LABEL_29:
          while (1)
          {
            v19 = *++v2;
            v18 = v19;
            if (!v19 || v18 == 12)
              break;
            v17 = *(_BYTE **)(a1 + 824);
            if (v17 == *(_BYTE **)(a1 + 816))
            {
              if (!poolGrow(v5))
                return 0;
              LOBYTE(v18) = *v2;
              v17 = *(_BYTE **)(a1 + 824);
            }
            *(_QWORD *)(a1 + 824) = v17 + 1;
            *v17 = v18;
          }
          v21 = *(_BYTE **)(a1 + 824);
          if (v21 == *(_BYTE **)(a1 + 816))
          {
            if (!poolGrow(v5))
              return 0;
            v21 = *(_BYTE **)(a1 + 824);
          }
          *(_QWORD *)(a1 + 824) = v21 + 1;
          *v21 = 0;
          if (addBinding(a1, v13, 0, *(unsigned __int8 **)(a1 + 832), v7))
            return 0;
          *(_QWORD *)(a1 + 824) = *(_QWORD *)(a1 + 832);
          if (*v2)
            v8 = v2 + 1;
          else
            v8 = v2;
          goto LABEL_41;
        }
        if (v9 != 12)
        {
          v22 = *(_BYTE **)(a1 + 824);
          if (v22 == *(_BYTE **)(a1 + 816))
          {
            if (!poolGrow(v5))
              return 0;
            LOBYTE(v9) = *v2;
            v22 = *(_BYTE **)(a1 + 824);
          }
          *(_QWORD *)(a1 + 824) = v22 + 1;
          *v22 = v9;
          ++v2;
          goto LABEL_46;
        }
      }
      v10 = *(_BYTE **)(a1 + 824);
      if (v10 == *(_BYTE **)(a1 + 816))
      {
        if (!poolGrow(v5))
          return 0;
        v10 = *(_BYTE **)(a1 + 824);
      }
      *(_QWORD *)(a1 + 824) = v10 + 1;
      *v10 = 0;
      v11 = lookup(a1, v6, *(char **)(a1 + 832), 0);
      if (v11)
        *((_BYTE *)v11 + 56) = 1;
      if (*v2)
        v8 = v2 + 1;
      else
        v8 = v2;
      *(_QWORD *)(a1 + 824) = *(_QWORD *)(a1 + 832);
LABEL_41:
      v2 = v8;
LABEL_46:
      if (!*v8)
        return 1;
    }
  }
  return v3;
}

XML_Status XML_ParseBuffer(XML_Parser parser, int len, int isFinal)
{
  int v6;
  XML_Status v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  unsigned int v12;

  if (!parser)
    return 0;
  v6 = *((_DWORD *)parser + 230);
  if (v6)
  {
    if (v6 == 2)
    {
      v7 = XML_STATUS_ERROR;
      v8 = 36;
      goto LABEL_23;
    }
    if (v6 == 3)
    {
      v7 = XML_STATUS_ERROR;
      v8 = 33;
LABEL_23:
      *((_DWORD *)parser + 138) = v8;
      return v7;
    }
  }
  else
  {
    if (!*((_QWORD *)parser + 6))
    {
      v7 = XML_STATUS_ERROR;
      v8 = 42;
      goto LABEL_23;
    }
    if (!*((_QWORD *)parser + 114) && !startParsing((uint64_t)parser))
    {
      v7 = XML_STATUS_ERROR;
      v8 = 1;
      goto LABEL_23;
    }
  }
  *((_DWORD *)parser + 230) = 1;
  v9 = *((_QWORD *)parser + 6);
  *((_QWORD *)parser + 72) = v9;
  v10 = *((_QWORD *)parser + 7) + len;
  *((_QWORD *)parser + 7) = v10;
  *((_QWORD *)parser + 9) += len;
  *((_QWORD *)parser + 10) = v10;
  *((_BYTE *)parser + 924) = isFinal;
  v11 = callProcessor((uint64_t)parser, v9, v10, (_QWORD *)parser + 6);
  *((_DWORD *)parser + 138) = v11;
  if (!v11)
  {
    v12 = *((_DWORD *)parser + 230);
    if (v12 >= 2)
    {
      if (v12 == 3)
        v7 = XML_STATUS_SUSPENDED;
      else
        v7 = XML_STATUS_OK;
    }
    else
    {
      if (isFinal)
      {
        *((_DWORD *)parser + 230) = 2;
        return 1;
      }
      v7 = XML_STATUS_OK;
    }
    (*(void (**)(void))(*((_QWORD *)parser + 38) + 96))();
    *((_QWORD *)parser + 72) = *((_QWORD *)parser + 6);
    return v7;
  }
  v7 = XML_STATUS_ERROR;
  *((_QWORD *)parser + 71) = *((_QWORD *)parser + 70);
  *((_QWORD *)parser + 68) = errorProcessor;
  return v7;
}

uint64_t prologProcessor(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, unsigned __int8 **a4)
{
  uint64_t v8;
  unsigned __int8 *v10;

  v10 = a2;
  v8 = (**(uint64_t (***)(void))(a1 + 304))();
  return doProlog((_QWORD *)a1, *(_QWORD *)(a1 + 304), a2, a3, v8, v10, a4, *(_BYTE *)(a1 + 924) == 0, 1, 0);
}

uint64_t normal_scanPi(_BYTE *a1, char *a2, uint64_t a3, char **a4)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char *v9;
  unsigned int v11;
  uint64_t v12;
  uint64_t result;
  char *v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  char *v20;
  unsigned __int8 *v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;

  v6 = a3 - (_QWORD)a2;
  if (a3 - (uint64_t)a2 < 1)
    return 0xFFFFFFFFLL;
  v23 = v4;
  v24 = v5;
  v9 = a2;
  v11 = a1[*a2 + 136];
  if (v11 > 0x15)
  {
    if (v11 != 22 && v11 != 24)
      goto LABEL_34;
    v12 = 1;
  }
  else
  {
    switch(v11)
    {
      case 5u:
        if (v6 < 2)
          return 4294967294;
        if ((*((unsigned int (**)(_BYTE *, char *))a1 + 55))(a1, a2)
          || !(*((unsigned int (**)(_BYTE *, char *))a1 + 52))(a1, v9))
        {
          goto LABEL_34;
        }
        v12 = 2;
        break;
      case 6u:
        if (v6 < 3)
          return 4294967294;
        if ((*((unsigned int (**)(_BYTE *, char *))a1 + 56))(a1, a2)
          || !(*((unsigned int (**)(_BYTE *, char *))a1 + 53))(a1, v9))
        {
          goto LABEL_34;
        }
        v12 = 3;
        break;
      case 7u:
        if (v6 >= 4)
        {
          if (!(*((unsigned int (**)(_BYTE *, char *))a1 + 57))(a1, a2)
            && (*((unsigned int (**)(_BYTE *, char *))a1 + 54))(a1, v9))
          {
            v12 = 4;
            break;
          }
LABEL_34:
          result = 0;
          *a4 = v9;
          return result;
        }
        return 4294967294;
      default:
        goto LABEL_34;
    }
  }
  v15 = &v9[v12];
  v16 = a3 - (_QWORD)&v9[v12];
  if ((uint64_t)v16 < 1)
    return 0xFFFFFFFFLL;
  v22 = 0;
  while (2)
  {
    v17 = 1;
    switch(a1[*v15 + 136])
    {
      case 5:
        if (v16 < 2)
          return 4294967294;
        if ((*((unsigned int (**)(_BYTE *, char *))a1 + 55))(a1, v15)
          || !(*((unsigned int (**)(_BYTE *, char *))a1 + 49))(a1, v15))
        {
          goto LABEL_44;
        }
        v17 = 2;
        goto LABEL_20;
      case 6:
        if (v16 < 3)
          return 4294967294;
        if ((*((unsigned int (**)(_BYTE *, char *))a1 + 56))(a1, v15)
          || !(*((unsigned int (**)(_BYTE *, char *))a1 + 50))(a1, v15))
        {
          goto LABEL_44;
        }
        v17 = 3;
        goto LABEL_20;
      case 7:
        if (v16 < 4)
          return 4294967294;
        if ((*((unsigned int (**)(_BYTE *, char *))a1 + 57))(a1, v15)
          || !(*((unsigned int (**)(_BYTE *, char *))a1 + 51))(a1, v15))
        {
          goto LABEL_44;
        }
        v17 = 4;
LABEL_20:
        v15 += v17;
        v16 = a3 - (_QWORD)v15;
        if (a3 - (uint64_t)v15 <= 0)
          return 0xFFFFFFFFLL;
        continue;
      case 9:
      case 0xA:
      case 0x15:
        result = normal_checkPiTarget(v9, (uint64_t)v15, &v22);
        if (!(_DWORD)result)
          goto LABEL_45;
        v9 = v15 + 1;
        v18 = a3 - (_QWORD)(v15 + 1);
        if ((uint64_t)v18 >= 1)
        {
          while (2)
          {
            switch(a1[*v9 + 136])
            {
              case 0:
              case 1:
              case 8:
                goto LABEL_34;
              case 5:
                if (v18 < 2)
                  return 4294967294;
                if ((*((unsigned int (**)(_BYTE *, char *))a1 + 55))(a1, v9))
                  goto LABEL_34;
                v19 = v9 + 2;
                goto LABEL_61;
              case 6:
                if (v18 < 3)
                  return 4294967294;
                if ((*((unsigned int (**)(_BYTE *, char *))a1 + 56))(a1, v9))
                  goto LABEL_34;
                v19 = v9 + 3;
                goto LABEL_61;
              case 7:
                if (v18 < 4)
                  return 4294967294;
                if ((*((unsigned int (**)(_BYTE *, char *))a1 + 57))(a1, v9))
                  goto LABEL_34;
                v19 = v9 + 4;
LABEL_61:
                v18 = a3 - (_QWORD)v19;
                result = 0xFFFFFFFFLL;
                v9 = v19;
                if (a3 - (uint64_t)v19 <= 0)
                  return result;
                continue;
              case 0xF:
                v19 = v9 + 1;
                if (a3 - (uint64_t)(v9 + 1) < 1)
                  return 0xFFFFFFFFLL;
                if (*v19 != 62)
                  goto LABEL_61;
                v21 = (unsigned __int8 *)(v9 + 2);
                goto LABEL_72;
              default:
                v19 = v9 + 1;
                goto LABEL_61;
            }
          }
        }
        return 0xFFFFFFFFLL;
      case 0xF:
        result = normal_checkPiTarget(v9, (uint64_t)v15, &v22);
        if (!(_DWORD)result)
          goto LABEL_45;
        v20 = v15 + 1;
        if (a3 - (uint64_t)(v15 + 1) < 1)
          return 0xFFFFFFFFLL;
        if (*v20 == 62)
        {
          v21 = (unsigned __int8 *)(v15 + 2);
LABEL_72:
          *a4 = (char *)v21;
          result = v22;
        }
        else
        {
LABEL_64:
          result = 0;
          *a4 = v20;
        }
        break;
      case 0x16:
      case 0x18:
      case 0x19:
      case 0x1A:
      case 0x1B:
        goto LABEL_20;
      case 0x1D:
LABEL_44:
        result = 0;
LABEL_45:
        *a4 = v15;
        return result;
      default:
        v20 = v15;
        goto LABEL_64;
    }
    return result;
  }
}

BOOL normal_checkPiTarget(char *a1, uint64_t a2, _DWORD *a3)
{
  int v3;
  int v4;
  int v5;
  int v6;

  *a3 = 11;
  if (a2 - (_QWORD)a1 != 3)
    return 1;
  v3 = *a1;
  if (v3 == 120)
  {
    v4 = 0;
  }
  else
  {
    if (v3 != 88)
      return 1;
    v4 = 1;
  }
  v5 = a1[1];
  if (v5 != 109)
  {
    if (v5 != 77)
      return 1;
    v4 = 1;
  }
  v6 = a1[2];
  if (v6 != 108)
    return v6 != 76;
  if (v4)
    return 0;
  *a3 = 12;
  return 1;
}

uint64_t initScan(_QWORD *a1, uint64_t a2, int a3, unsigned __int8 *a4, unsigned __int8 *a5, _QWORD *a6)
{
  uint64_t (***v6)(void);
  int v7;
  unsigned int v8;
  uint64_t (**v9)(void);
  uint64_t v10;
  int v12;
  int v13;
  uint64_t (**v14)(void);
  uint64_t (*v15)(void);
  uint64_t (**v16)(void);

  if (a4 >= a5)
    return 4294967292;
  v6 = *(uint64_t (****)(void))(a2 + 136);
  if (a4 + 1 == a5)
  {
    if ((*(char *)(a2 + 133) - 3) < 3)
      return 0xFFFFFFFFLL;
    v12 = *a4;
    if ((v12 - 239) <= 0x10 && ((1 << (v12 + 17)) & 0x18001) != 0)
    {
      v10 = 0xFFFFFFFFLL;
      if (a3 != 1 || *(_BYTE *)(a2 + 133))
        return v10;
    }
    else
    {
      v10 = 0xFFFFFFFFLL;
      if (!*a4 || v12 == 60)
        return v10;
    }
LABEL_45:
    v16 = (uint64_t (**)(void))a1[*(char *)(a2 + 133)];
    goto LABEL_46;
  }
  v7 = a4[1] | (*a4 << 8);
  if (v7 > 65278)
  {
    if (v7 == 65534)
    {
      if (a3 != 1 || *(_BYTE *)(a2 + 133))
      {
        *a6 = a4 + 2;
        v9 = (uint64_t (**)(void))a1[5];
        goto LABEL_32;
      }
      goto LABEL_45;
    }
    if (v7 == 65279)
    {
      if (a3 != 1 || *(_BYTE *)(a2 + 133))
      {
        *a6 = a4 + 2;
        v9 = (uint64_t (**)(void))a1[4];
        goto LABEL_32;
      }
      goto LABEL_45;
    }
  }
  else
  {
    if (v7 == 15360)
    {
      v13 = *(unsigned __int8 *)(a2 + 133);
      if (v13 == 4)
      {
        if (a3 == 1)
          goto LABEL_45;
      }
      else if (a3 == 1 && v13 == 3)
      {
        goto LABEL_45;
      }
      v16 = (uint64_t (**)(void))a1[5];
LABEL_46:
      *v6 = v16;
      v15 = v16[a3];
      return v15();
    }
    if (v7 == 61371)
    {
      if (a3 != 1 || (v8 = *(unsigned __int8 *)(a2 + 133), v8 > 5) || ((1 << v8) & 0x39) == 0)
      {
        if (a4 + 2 != a5)
        {
          if (a4[2] == 191)
          {
            *a6 = a4 + 3;
            v9 = (uint64_t (**)(void))a1[2];
LABEL_32:
            *v6 = v9;
            return 14;
          }
          goto LABEL_45;
        }
        return 0xFFFFFFFFLL;
      }
      goto LABEL_45;
    }
  }
  if (!*a4)
  {
    if (a3 != 1 || *(_BYTE *)(a2 + 133) != 5)
    {
      v16 = (uint64_t (**)(void))a1[4];
      goto LABEL_46;
    }
    goto LABEL_45;
  }
  if (a3 == 1 || a4[1])
    goto LABEL_45;
  v14 = (uint64_t (**)(void))a1[5];
  *v6 = v14;
  v15 = *v14;
  return v15();
}

uint64_t prologInitProcessor(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, unsigned __int8 **a4)
{
  uint64_t result;

  result = initializeEncoding(a1);
  if (!(_DWORD)result)
  {
    *(_QWORD *)(a1 + 544) = prologProcessor;
    return prologProcessor(a1, a2, a3, a4);
  }
  return result;
}

uint64_t normal_updatePosition(uint64_t result, unsigned __int8 *a2, uint64_t a3, _QWORD *a4)
{
  if (a3 - (uint64_t)a2 >= 1)
  {
    while (2)
    {
      switch(*(_BYTE *)(result + *a2 + 136))
      {
        case 5:
          a2 += 2;
          goto LABEL_7;
        case 6:
          a2 += 3;
          goto LABEL_7;
        case 7:
          a2 += 4;
          goto LABEL_7;
        case 9:
          ++*a4;
          if (a3 - (uint64_t)(a2 + 1) < 1)
          {
            ++a2;
          }
          else if (*(_BYTE *)(result + a2[1] + 136) == 10)
          {
            a2 += 2;
          }
          else
          {
            ++a2;
          }
          a4[1] = 0;
          goto LABEL_8;
        case 0xA:
          ++*a4;
          a4[1] = 0;
          ++a2;
          goto LABEL_8;
        default:
          ++a2;
LABEL_7:
          ++a4[1];
LABEL_8:
          if (a3 - (uint64_t)a2 <= 0)
            return result;
          continue;
      }
    }
  }
  return result;
}

uint64_t initializeEncoding(uint64_t a1)
{
  unsigned __int8 *v2;
  int inited;

  v2 = *(unsigned __int8 **)(a1 + 464);
  if (*(_BYTE *)(a1 + 472))
    inited = XmlInitEncodingNS(a1 + 312, (_QWORD *)(a1 + 304), v2);
  else
    inited = XmlInitEncoding(a1 + 312, (_QWORD *)(a1 + 304), v2);
  if (inited)
    return 0;
  else
    return handleUnknownEncoding(a1, *(_QWORD *)(a1 + 464));
}

uint64_t initScanPrologNS(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, _QWORD *a4)
{
  return initScan(&encodingsNS, a1, 0, a2, a3, a4);
}

uint64_t doProlog(_QWORD *a1, uint64_t a2, unsigned __int8 *a3, unsigned __int8 *a4, uint64_t a5, unsigned __int8 *a6, unsigned __int8 **a7, int a8, char a9, int a10)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 **v16;
  unsigned int (**v17)(uint64_t, uint64_t, unsigned __int8 *, unsigned __int8 *, uint64_t);
  unsigned __int8 *v18;
  uint64_t v19;
  unsigned int v20;
  BOOL v21;
  int v22;
  int v23;
  const char *v24;
  const char *v25;
  char v26;
  unsigned __int8 *v27;
  char *v28;
  int v29;
  unsigned __int8 *v30;
  int v31;
  _BYTE *v32;
  _BYTE *v33;
  _QWORD *v34;
  _QWORD *v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  unsigned __int8 *v39;
  int v40;
  _BYTE *v41;
  _BYTE *v42;
  _QWORD *v43;
  _QWORD *v44;
  _QWORD *v45;
  uint64_t v46;
  int v47;
  char *v48;
  char *v49;
  _OWORD *v50;
  uint64_t v51;
  void (*v52)(_QWORD, char *, uint64_t);
  unsigned __int8 *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _OWORD *v58;
  _BYTE *v59;
  _BYTE *v60;
  _BYTE *v61;
  _BYTE *v62;
  void (*v63)(_QWORD, _QWORD, _QWORD, _QWORD, uint64_t);
  _QWORD *v64;
  uint64_t v65;
  _QWORD *v66;
  _QWORD *v67;
  _QWORD *v68;
  char *v69;
  char *v70;
  _OWORD *v71;
  BOOL v72;
  char *v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  _QWORD *v81;
  _QWORD *v82;
  _BYTE *v83;
  _BYTE *v84;
  _OWORD *AttributeId;
  const char *v86;
  _OWORD *ElementType;
  _OWORD *v88;
  uint64_t v89;
  uint64_t v90;
  int v91;
  unsigned int v92;
  uint64_t (*v93)(uint64_t);
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  _BYTE *v103;
  uint64_t v104;
  unint64_t v105;
  _BYTE *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  _BYTE *v110;
  uint64_t v112;
  int v113;
  unsigned int v114;
  int *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  BOOL v119;
  _DWORD *v120;
  uint64_t v121;
  uint64_t v122;
  unsigned __int8 *v123;
  unsigned int v124;
  uint64_t v125;
  _DWORD *v126;
  _OWORD *v127;
  unint64_t v128;
  uint64_t v129;
  int v131;
  int v132;
  unsigned int (*v133)(_QWORD);
  unsigned int (*v134)(_QWORD);
  _OWORD *v135;
  uint64_t v136;
  uint64_t v137;
  int v138;
  uint64_t v139;
  uint64_t v140;
  char v141;
  _QWORD *v142;
  uint64_t v143;
  uint64_t (*v144)(uint64_t);
  uint64_t v145;
  unsigned int ScaffoldPart;
  uint64_t v147;
  unsigned int (*v148)(_QWORD);
  void (*v149)(_QWORD);
  int v150;
  uint64_t v151;
  unsigned int v152;
  char v153;
  _OWORD *v154;
  unsigned int (*v155)(_QWORD);
  uint64_t *v157;
  uint64_t *v158;
  uint64_t *v160;
  _QWORD *v161;
  uint64_t *v162;
  unsigned __int8 **v164;
  unsigned __int8 **v165;
  unsigned __int8 *v166;

  v13 = a2;
  v14 = (uint64_t)a1;
  v166 = a6;
  v15 = a1[86];
  if (a1[38] == a2)
  {
    v164 = (unsigned __int8 **)(a1 + 70);
    v16 = (unsigned __int8 **)(a1 + 71);
  }
  else
  {
    v164 = (unsigned __int8 **)a1[73];
    v16 = v164 + 1;
  }
  v165 = v16;
  v17 = (unsigned int (**)(uint64_t, uint64_t, unsigned __int8 *, unsigned __int8 *, uint64_t))(a1 + 64);
  v160 = (uint64_t *)(v15 + 160);
  v157 = (uint64_t *)(v15 + 264);
  v158 = a1 + 81;
  v161 = a1 + 102;
  v162 = a1 + 100;
  while (2)
  {
    *v164 = a3;
    v18 = v166;
    *v165 = v166;
    if ((int)a5 <= 0)
    {
      if (a8 && (_DWORD)a5)
      {
LABEL_355:
        v19 = 0;
        *a7 = a3;
        return v19;
      }
      if ((_DWORD)a5 != -15)
      {
        v19 = 5;
        switch((int)a5)
        {
          case -4:
            if (v13 == *(_QWORD *)(v14 + 304))
            {
              if (!*(_BYTE *)(v14 + 928))
                return 3;
            }
            else if (!*(_BYTE *)(*(_QWORD *)(v14 + 584) + 36))
            {
              goto LABEL_355;
            }
            if ((*v17)(v14 + 512, 4294967292, a4, a4, v13) != -1)
              goto LABEL_355;
            v19 = 29;
            break;
          case -2:
            return 6;
          case -1:
            return v19;
          case 0:
            *v164 = v18;
            return 4;
          default:
            a5 = -(int)a5;
            v166 = a4;
            v18 = a4;
            goto LABEL_12;
        }
        return v19;
      }
      a5 = 15;
    }
LABEL_12:
    v20 = (*v17)(v14 + 512, a5, a3, v18, v13);
    v21 = v20 > 0x39 || ((1 << v20) & 0x200000000000006) == 0;
    if (v21 && !accountingDiffTolerated(v14, a5, a3, (unint64_t)v166, 4787, a10))
    {
      accountingReportStats((_QWORD *)v14, " ABORTING\n");
      return 43;
    }
    v22 = 0;
    v23 = 1;
    switch(v20)
    {
      case 0xFFFFFFFF:
        if ((_DWORD)a5 == 12)
          v152 = 17;
        else
          v152 = 2;
        if ((_DWORD)a5 == 28)
          return 10;
        else
          return v152;
      case 0u:
        if ((_DWORD)a5 != 14)
          goto LABEL_338;
        goto LABEL_340;
      case 1u:
        v53 = v166;
        v54 = v14;
        v55 = 0;
        goto LABEL_255;
      case 2u:
        if (!*(_BYTE *)(v14 + 929))
          goto LABEL_387;
        v153 = *(_BYTE *)(v15 + 257);
        *(_BYTE *)(v15 + 257) = 1;
        if (!*(_DWORD *)(v14 + 932) || !*(_QWORD *)(v14 + 240))
          goto LABEL_387;
        v154 = lookup(v14, v157, "#", 0x40uLL);
        if (!v154)
          return 1;
        *((_QWORD *)v154 + 4) = *(_QWORD *)(v14 + 696);
        *(_BYTE *)(v15 + 259) = 0;
        if (!(*(unsigned int (**)(_QWORD, _QWORD))(v14 + 240))(*(_QWORD *)(v14 + 248), 0))
          return 21;
        if (*(_BYTE *)(v15 + 259))
        {
          if (!*(_BYTE *)(v15 + 258))
          {
            v155 = *(unsigned int (**)(_QWORD))(v14 + 232);
            if (v155)
            {
              if (!v155(*(_QWORD *)(v14 + 8)))
                return 22;
            }
          }
        }
        else
        {
          *(_BYTE *)(v15 + 257) = v153;
        }
LABEL_387:
        *(_QWORD *)(v14 + 544) = contentProcessor;
        return contentProcessor(v14, a3, (uint64_t)a4, a7);
      case 3u:
        if (!*(_QWORD *)(v14 + 184))
          goto LABEL_338;
        goto LABEL_340;
      case 4u:
        if (!*(_QWORD *)(v14 + 184))
          goto LABEL_98;
        v56 = poolStoreString(v162, v13, (uint64_t)a3, (uint64_t)v166);
        *(_QWORD *)(v14 + 616) = v56;
        if (!v56)
          return 1;
        v23 = 0;
        *(_QWORD *)(v14 + 832) = *(_QWORD *)(v14 + 824);
        *(_QWORD *)(v14 + 632) = 0;
LABEL_98:
        *(_QWORD *)(v14 + 624) = 0;
        goto LABEL_337;
      case 5u:
        *(_BYTE *)(v14 + 929) = 0;
        *(_BYTE *)(v15 + 257) = 1;
        if (*(_QWORD *)(v14 + 184))
        {
          v57 = poolStoreString(v162, v13, (uint64_t)&a3[*(int *)(v13 + 128)], (uint64_t)&v166[-*(int *)(v13 + 128)]);
          *(_QWORD *)(v14 + 624) = v57;
          if (!v57)
            return 1;
          v23 = 0;
          *(_QWORD *)(v14 + 832) = *(_QWORD *)(v14 + 824);
        }
        else
        {
          *(_QWORD *)(v14 + 624) = "#";
        }
        if (!*(_BYTE *)(v15 + 258) && !*(_DWORD *)(v14 + 932))
        {
          v134 = *(unsigned int (**)(_QWORD))(v14 + 232);
          if (v134)
          {
            if (!v134(*(_QWORD *)(v14 + 8)))
              return 22;
          }
        }
        if (*(_QWORD *)(v14 + 608))
          goto LABEL_277;
        v135 = lookup(v14, v157, "#", 0x40uLL);
        *(_QWORD *)(v14 + 608) = v135;
        if (!v135)
          return 1;
        *((_QWORD *)v135 + 5) = 0;
LABEL_277:
        if (!*(_BYTE *)(v15 + 256) || !*(_QWORD *)(v14 + 608))
          goto LABEL_337;
        v136 = poolStoreString(v160, v13, (uint64_t)&a3[*(int *)(v13 + 128)], (uint64_t)&v166[-*(int *)(v13 + 128)]);
        v137 = *(_QWORD *)(v14 + 608);
        *(_QWORD *)(v137 + 24) = v136;
        if (!v136)
          return 1;
        *(_QWORD *)(v137 + 32) = *(_QWORD *)(v14 + 696);
        *(_QWORD *)(v15 + 192) = *(_QWORD *)(v15 + 184);
        if (v20 == 13)
          goto LABEL_281;
        goto LABEL_337;
      case 6u:
        *(_BYTE *)(v14 + 929) = 0;
        v58 = lookup(v14, v157, "#", 0x40uLL);
        *(_QWORD *)(v14 + 608) = v58;
        v19 = 1;
        if (!v58)
          return v19;
        *(_BYTE *)(v15 + 257) = 1;
        if (*(_QWORD *)(v14 + 184))
        {
          if (!(*(unsigned int (**)(uint64_t, unsigned __int8 *, unsigned __int8 *, unsigned __int8 **))(v13 + 104))(v13, a3, v166, v164))return 32;
          v59 = (_BYTE *)poolStoreString(v162, v13, (uint64_t)&a3[*(int *)(v13 + 128)], (uint64_t)&v166[-*(int *)(v13 + 128)]);
          if (!v59)
            return v19;
          v60 = v59;
          normalizePublicId(v59);
          v23 = 0;
          *(_QWORD *)(v14 + 832) = *(_QWORD *)(v14 + 824);
          *(_QWORD *)(v14 + 632) = v60;
        }
        else
        {
LABEL_107:
          if (!(*(unsigned int (**)(uint64_t, unsigned __int8 *, unsigned __int8 *, unsigned __int8 **))(v13 + 104))(v13, a3, v166, v164))return 32;
        }
        if (!*(_BYTE *)(v15 + 256) || !*(_QWORD *)(v14 + 608))
          goto LABEL_337;
        v61 = (_BYTE *)poolStoreString(v160, v13, (uint64_t)&a3[*(int *)(v13 + 128)], (uint64_t)&v166[-*(int *)(v13 + 128)]);
        if (!v61)
          return 1;
        v62 = v61;
        normalizePublicId(v61);
        *(_QWORD *)(*(_QWORD *)(v14 + 608) + 40) = v62;
        *(_QWORD *)(v15 + 192) = *(_QWORD *)(v15 + 184);
        if (v20 != 14)
          goto LABEL_337;
LABEL_281:
        if (!*(_QWORD *)(v14 + 288))
          goto LABEL_337;
        goto LABEL_340;
      case 7u:
        v63 = *(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, uint64_t))(v14 + 184);
        if (!v63)
          goto LABEL_338;
        v63(*(_QWORD *)(v14 + 8), *(_QWORD *)(v14 + 616), *(_QWORD *)(v14 + 624), *(_QWORD *)(v14 + 632), 1);
        *(_QWORD *)(v14 + 616) = 0;
        v64 = *(_QWORD **)(v14 + 808);
        v44 = *(_QWORD **)(v14 + 800);
        if (!v64)
          goto LABEL_266;
        if (!v44)
          goto LABEL_268;
        do
        {
          v45 = v44;
          v44 = (_QWORD *)*v44;
          *v45 = v64;
          v64 = v45;
        }
        while (v44);
        goto LABEL_267;
      case 8u:
        if (a9 != 1)
          return 4;
        v65 = *(_QWORD *)(v14 + 616);
        if (!v65)
          goto LABEL_302;
        (*(void (**)(_QWORD, uint64_t, _QWORD, _QWORD, _QWORD))(v14 + 184))(*(_QWORD *)(v14 + 8), v65, *(_QWORD *)(v14 + 624), *(_QWORD *)(v14 + 632), 0);
        v66 = *(_QWORD **)(v14 + 808);
        v67 = *(_QWORD **)(v14 + 800);
        if (v66)
        {
          if (!v67)
            goto LABEL_301;
          do
          {
            v68 = v67;
            v67 = (_QWORD *)*v67;
            *v68 = v66;
            v66 = v68;
          }
          while (v67);
        }
        else
        {
          v68 = *(_QWORD **)(v14 + 800);
        }
        *(_QWORD *)(v14 + 808) = v68;
LABEL_301:
        v23 = 0;
        *v162 = 0;
        v161[1] = 0;
        v161[2] = 0;
        *v161 = 0;
LABEL_302:
        if (!*(_QWORD *)(v14 + 624) && !*(_BYTE *)(v14 + 929))
          goto LABEL_335;
        v141 = *(_BYTE *)(v15 + 257);
        *(_BYTE *)(v15 + 257) = 1;
        if (!*(_DWORD *)(v14 + 932) || !*(_QWORD *)(v14 + 240))
          goto LABEL_334;
        v142 = lookup(v14, v157, "#", 0x40uLL);
        if (!v142)
          return 1;
        if (*(_BYTE *)(v14 + 929))
        {
          v143 = *(_QWORD *)(v14 + 696);
          v142[4] = v143;
        }
        else
        {
          v143 = v142[4];
        }
        *(_BYTE *)(v15 + 259) = 0;
        if (!(*(unsigned int (**)(_QWORD, _QWORD, uint64_t, _QWORD, _QWORD))(v14 + 240))(*(_QWORD *)(v14 + 248), 0, v143, v142[3], v142[5]))return 21;
        if (*(_BYTE *)(v15 + 259))
        {
          if (!*(_BYTE *)(v15 + 258))
          {
            v148 = *(unsigned int (**)(_QWORD))(v14 + 232);
            if (v148)
            {
              if (!v148(*(_QWORD *)(v14 + 8)))
                return 22;
            }
          }
        }
        else if (!*(_QWORD *)(v14 + 624))
        {
          *(_BYTE *)(v15 + 257) = v141;
        }
LABEL_334:
        *(_BYTE *)(v14 + 929) = 0;
LABEL_335:
        v149 = *(void (**)(_QWORD))(v14 + 192);
        if (!v149)
          goto LABEL_337;
        v149(*(_QWORD *)(v14 + 8));
        goto LABEL_340;
      case 9u:
        if ((*(unsigned int (**)(uint64_t, unsigned __int8 *, unsigned __int8 *))(v13 + 88))(v13, a3, v166))
          goto LABEL_136;
        if (!*(_BYTE *)(v15 + 256))
          goto LABEL_135;
        v69 = (char *)poolStoreString(v160, v13, (uint64_t)a3, (uint64_t)v166);
        if (!v69)
          return 1;
        v70 = v69;
        v71 = lookup(v14, (uint64_t *)v15, v69, 0x40uLL);
        *(_QWORD *)(v14 + 608) = v71;
        if (!v71)
          return 1;
        if (*(char **)v71 != v70)
        {
LABEL_135:
          *(_QWORD *)(v15 + 184) = *(_QWORD *)(v15 + 192);
LABEL_136:
          *(_QWORD *)(v14 + 608) = 0;
          goto LABEL_338;
        }
        *(_QWORD *)(v15 + 192) = *(_QWORD *)(v15 + 184);
        *((_QWORD *)v71 + 5) = 0;
        *((_BYTE *)v71 + 57) = 0;
        if (*(_QWORD *)(v14 + 912))
          v72 = 1;
        else
LABEL_310:
          v72 = *(_QWORD *)(v14 + 584) != 0;
LABEL_311:
        *((_BYTE *)v71 + 58) = !v72;
LABEL_312:
        if (!*(_QWORD *)(v14 + 288))
          goto LABEL_338;
        goto LABEL_340;
      case 0xAu:
        if (!*(_BYTE *)(v15 + 256))
          goto LABEL_135;
        v73 = (char *)poolStoreString(v160, v13, (uint64_t)a3, (uint64_t)v166);
        if (!v73)
          return 1;
        v74 = v73;
        v71 = lookup(v14, v157, v73, 0x40uLL);
        *(_QWORD *)(v14 + 608) = v71;
        if (!v71)
          return 1;
        if (*(char **)v71 != v74)
          goto LABEL_135;
        *(_QWORD *)(v15 + 192) = *(_QWORD *)(v15 + 184);
        *((_QWORD *)v71 + 5) = 0;
        v72 = 1;
        *((_BYTE *)v71 + 57) = 1;
        if (!*(_QWORD *)(v14 + 912))
          goto LABEL_310;
        goto LABEL_311;
      case 0xBu:
        if (!*(_BYTE *)(v15 + 256))
          goto LABEL_338;
        goto LABEL_312;
      case 0xCu:
        if (!*(_BYTE *)(v15 + 256))
          goto LABEL_338;
        v19 = storeEntityValue(v14, v13, &a3[*(int *)(v13 + 128)], (uint64_t)&v166[-*(int *)(v13 + 128)], 2);
        v75 = *(_QWORD *)(v14 + 608);
        v76 = *(_QWORD *)(v15 + 240);
        if (v75)
        {
          *(_QWORD *)(v75 + 8) = v76;
          v77 = *(_QWORD *)(v15 + 232);
          *(_DWORD *)(v75 + 16) = v77 - v76;
          *(_QWORD *)(v15 + 240) = v77;
          if (*(_QWORD *)(v14 + 288))
          {
            *v165 = a3;
            (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(v14 + 288))(*(_QWORD *)(v14 + 8), **(_QWORD **)(v14 + 608), *(unsigned __int8 *)(*(_QWORD *)(v14 + 608) + 57), *(_QWORD *)(*(_QWORD *)(v14 + 608) + 8), *(unsigned int *)(*(_QWORD *)(v14 + 608) + 16), *(_QWORD *)(v14 + 696), 0, 0, 0);
            v23 = 0;
          }
        }
        else
        {
          *(_QWORD *)(v15 + 232) = v76;
        }
        if ((_DWORD)v19)
          return v19;
        goto LABEL_337;
      case 0xDu:
        goto LABEL_277;
      case 0xEu:
        goto LABEL_107;
      case 0xFu:
        if (!*(_BYTE *)(v15 + 256) || !*(_QWORD *)(v14 + 608) || !*(_QWORD *)(v14 + 288))
          goto LABEL_338;
        *v165 = a3;
        (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(v14 + 288))(*(_QWORD *)(v14 + 8), **(_QWORD **)(v14 + 608), *(unsigned __int8 *)(*(_QWORD *)(v14 + 608) + 57), 0, 0, *(_QWORD *)(*(_QWORD *)(v14 + 608) + 32), *(_QWORD *)(*(_QWORD *)(v14 + 608) + 24), *(_QWORD *)(*(_QWORD *)(v14 + 608) + 40), 0);
        goto LABEL_340;
      case 0x10u:
        if (!*(_BYTE *)(v15 + 256) || !*(_QWORD *)(v14 + 608))
          goto LABEL_338;
        v78 = poolStoreString(v160, v13, (uint64_t)a3, (uint64_t)v166);
        *(_QWORD *)(*(_QWORD *)(v14 + 608) + 48) = v78;
        if (!v78)
          return 1;
        *(_QWORD *)(v15 + 192) = *(_QWORD *)(v15 + 184);
        if (*(_QWORD *)(v14 + 200))
        {
          *v165 = a3;
          (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(v14 + 200))(*(_QWORD *)(v14 + 8), **(_QWORD **)(v14 + 608), *(_QWORD *)(*(_QWORD *)(v14 + 608) + 32), *(_QWORD *)(*(_QWORD *)(v14 + 608) + 24), *(_QWORD *)(*(_QWORD *)(v14 + 608) + 40), *(_QWORD *)(*(_QWORD *)(v14 + 608) + 48));
          goto LABEL_340;
        }
        if (!*(_QWORD *)(v14 + 288))
          goto LABEL_338;
        *v165 = a3;
        (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(v14 + 288))(*(_QWORD *)(v14 + 8), **(_QWORD **)(v14 + 608), 0, 0, 0, *(_QWORD *)(*(_QWORD *)(v14 + 608) + 32), *(_QWORD *)(*(_QWORD *)(v14 + 608) + 24), *(_QWORD *)(*(_QWORD *)(v14 + 608) + 40), *(_QWORD *)(*(_QWORD *)(v14 + 608) + 48));
        goto LABEL_340;
      case 0x11u:
        if (!*(_QWORD *)(v14 + 208))
          goto LABEL_338;
        goto LABEL_340;
      case 0x12u:
        *v158 = 0;
        v158[1] = 0;
        if (!*(_QWORD *)(v14 + 208))
          goto LABEL_338;
        v79 = poolStoreString(v162, v13, (uint64_t)a3, (uint64_t)v166);
        *v158 = v79;
        if (!v79)
          return 1;
        goto LABEL_179;
      case 0x13u:
        if (!*v158 || !*(_QWORD *)(v14 + 208))
          goto LABEL_161;
        v80 = poolStoreString(v162, v13, (uint64_t)&a3[*(int *)(v13 + 128)], (uint64_t)&v166[-*(int *)(v13 + 128)]);
        if (!v80)
          return 1;
        *v165 = a3;
        (*(void (**)(_QWORD, _QWORD, _QWORD, uint64_t, _QWORD))(v14 + 208))(*(_QWORD *)(v14 + 8), *(_QWORD *)(v14 + 648), *(_QWORD *)(v14 + 696), v80, *(_QWORD *)(v14 + 656));
        v23 = 0;
LABEL_161:
        v81 = *(_QWORD **)(v14 + 808);
        v35 = *(_QWORD **)(v14 + 800);
        if (!v81)
          goto LABEL_172;
        if (!v35)
          goto LABEL_174;
        do
        {
          v36 = v35;
          v35 = (_QWORD *)*v35;
          *v36 = v81;
          v81 = v36;
        }
        while (v35);
        goto LABEL_173;
      case 0x14u:
        if (*(_QWORD *)(v14 + 656) && *(_QWORD *)(v14 + 208))
        {
          *v165 = a3;
          (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(v14 + 208))(*(_QWORD *)(v14 + 8), *(_QWORD *)(v14 + 648), *(_QWORD *)(v14 + 696), 0, *(_QWORD *)(v14 + 656));
          v23 = 0;
        }
        v82 = *(_QWORD **)(v14 + 808);
        v35 = *(_QWORD **)(v14 + 800);
        if (!v82)
          goto LABEL_172;
        if (!v35)
          goto LABEL_174;
        do
        {
          v36 = v35;
          v35 = (_QWORD *)*v35;
          *v36 = v82;
          v82 = v36;
        }
        while (v35);
        goto LABEL_173;
      case 0x15u:
        if (!(*(unsigned int (**)(uint64_t, unsigned __int8 *, unsigned __int8 *, unsigned __int8 **))(v13 + 104))(v13, a3, v166, v164))return 32;
        if (!*v158)
          goto LABEL_338;
        v83 = (_BYTE *)poolStoreString(v162, v13, (uint64_t)&a3[*(int *)(v13 + 128)], (uint64_t)&v166[-*(int *)(v13 + 128)]);
        if (!v83)
          return 1;
        v84 = v83;
        normalizePublicId(v83);
        *(_QWORD *)(v14 + 656) = v84;
LABEL_179:
        *(_QWORD *)(v14 + 832) = *(_QWORD *)(v14 + 824);
        goto LABEL_340;
      case 0x16u:
        AttributeId = getAttributeId(v14, v13, (uint64_t)a3, (uint64_t)v166);
        *(_QWORD *)(v14 + 672) = AttributeId;
        if (!AttributeId)
          return 1;
        *(_WORD *)(v14 + 680) = 0;
        *(_QWORD *)(v14 + 640) = 0;
        goto LABEL_191;
      case 0x17u:
        *(_BYTE *)(v14 + 680) = 1;
        v86 = "CDATA";
        goto LABEL_190;
      case 0x18u:
        *(_BYTE *)(v14 + 681) = 1;
        v86 = "ID";
        goto LABEL_190;
      case 0x19u:
        v86 = "IDREF";
        goto LABEL_190;
      case 0x1Au:
        v86 = "IDREFS";
        goto LABEL_190;
      case 0x1Bu:
        v86 = "ENTITY";
        goto LABEL_190;
      case 0x1Cu:
        v86 = "ENTITIES";
        goto LABEL_190;
      case 0x1Du:
        v86 = "NMTOKEN";
        goto LABEL_190;
      case 0x1Eu:
        v86 = "NMTOKENS";
LABEL_190:
        *(_QWORD *)(v14 + 640) = v86;
        goto LABEL_191;
      case 0x1Fu:
      case 0x20u:
        if (!*(_BYTE *)(v15 + 256) || !*(_QWORD *)(v14 + 280))
          goto LABEL_338;
        v24 = "(";
        if (v20 == 32)
          v24 = "NOTATION(";
        if (*(_QWORD *)(v14 + 640))
          v25 = "|";
        else
          v25 = v24;
        v26 = *v25;
        if (!*v25)
          goto LABEL_32;
        v27 = (unsigned __int8 *)(v25 + 1);
        do
        {
          v28 = *(char **)(v14 + 824);
          if (v28 == *(char **)(v14 + 816))
          {
            if (!poolGrow(v162))
              return 1;
            v28 = *(char **)(v14 + 824);
          }
          *(_QWORD *)(v14 + 824) = v28 + 1;
          *v28 = v26;
          v29 = *v27++;
          v26 = v29;
        }
        while (v29);
LABEL_32:
        if (!*(_QWORD *)(v14 + 832) || !poolAppend(v162, v13, (uint64_t)a3, (uint64_t)v166))
          return 1;
        *(_QWORD *)(v14 + 640) = *(_QWORD *)(v14 + 832);
        goto LABEL_340;
      case 0x21u:
        goto LABEL_191;
      case 0x22u:
        ElementType = getElementType(v14, v13, (uint64_t)a3, (uint64_t)v166);
        *(_QWORD *)(v14 + 664) = ElementType;
        if (!ElementType)
          return 1;
LABEL_191:
        if (!*(_BYTE *)(v15 + 256) || !*(_QWORD *)(v14 + 280))
          goto LABEL_338;
        goto LABEL_340;
      case 0x23u:
      case 0x24u:
        if (!*(_BYTE *)(v15 + 256))
          goto LABEL_50;
        if (!defineAttribute(*(_QWORD *)(v14 + 664), *(_QWORD *)(v14 + 672), *(unsigned __int8 *)(v14 + 680), *(unsigned __int8 *)(v14 + 681), 0, v14))return 1;
        if (!*(_QWORD *)(v14 + 280))
          goto LABEL_50;
        v30 = *(unsigned __int8 **)(v14 + 640);
        if (!v30)
          goto LABEL_50;
        v31 = *v30;
        if (v31 != 40 && (v31 != 78 || v30[1] != 79))
          goto LABEL_49;
        v32 = *(_BYTE **)(v14 + 824);
        if (v32 != *(_BYTE **)(v14 + 816))
          goto LABEL_45;
        if (!poolGrow(v162))
          return 1;
        v32 = *(_BYTE **)(v14 + 824);
LABEL_45:
        *(_QWORD *)(v14 + 824) = v32 + 1;
        *v32 = 41;
        v33 = *(_BYTE **)(v14 + 824);
        if (v33 != *(_BYTE **)(v14 + 816))
          goto LABEL_48;
        if (!poolGrow(v162))
          return 1;
        v33 = *(_BYTE **)(v14 + 824);
LABEL_48:
        *(_QWORD *)(v14 + 824) = v33 + 1;
        *v33 = 0;
        *(_QWORD *)(v14 + 640) = *(_QWORD *)(v14 + 832);
        *(_QWORD *)(v14 + 832) = *(_QWORD *)(v14 + 824);
LABEL_49:
        *v165 = a3;
        (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, BOOL))(v14 + 280))(*(_QWORD *)(v14 + 8), **(_QWORD **)(v14 + 664), **(_QWORD **)(v14 + 672), *(_QWORD *)(v14 + 640), 0, v20 == 36);
        v23 = 0;
LABEL_50:
        v34 = *(_QWORD **)(v14 + 808);
        v35 = *(_QWORD **)(v14 + 800);
        if (v34)
        {
          if (!v35)
            goto LABEL_174;
          do
          {
            v36 = v35;
            v35 = (_QWORD *)*v35;
            *v36 = v34;
            v34 = v36;
          }
          while (v35);
        }
        else
        {
LABEL_172:
          v36 = v35;
        }
LABEL_173:
        *(_QWORD *)(v14 + 808) = v36;
LABEL_174:
        *v162 = 0;
        v161[1] = 0;
        v161[2] = 0;
        *v161 = 0;
        goto LABEL_337;
      case 0x25u:
      case 0x26u:
        if (!*(_BYTE *)(v15 + 256))
          goto LABEL_338;
        v37 = storeAttributeValue(v14, v13, *(unsigned __int8 *)(v14 + 680), &a3[*(int *)(v13 + 128)], (uint64_t)&v166[-*(int *)(v13 + 128)], v160, 2);
        if ((_DWORD)v37)
          return v37;
        v38 = *(_QWORD *)(v15 + 192);
        *(_QWORD *)(v15 + 192) = *(_QWORD *)(v15 + 184);
        if (!defineAttribute(*(_QWORD *)(v14 + 664), *(_QWORD *)(v14 + 672), *(unsigned __int8 *)(v14 + 680), 0, v38, v14))return 1;
        if (!*(_QWORD *)(v14 + 280))
          goto LABEL_338;
        v39 = *(unsigned __int8 **)(v14 + 640);
        if (!v39)
          goto LABEL_338;
        v40 = *v39;
        if (v40 != 40 && (v40 != 78 || v39[1] != 79))
          goto LABEL_69;
        v41 = *(_BYTE **)(v14 + 824);
        if (v41 != *(_BYTE **)(v14 + 816))
          goto LABEL_65;
        if (!poolGrow(v162))
          return 1;
        v41 = *(_BYTE **)(v14 + 824);
LABEL_65:
        *(_QWORD *)(v14 + 824) = v41 + 1;
        *v41 = 41;
        v42 = *(_BYTE **)(v14 + 824);
        if (v42 != *(_BYTE **)(v14 + 816))
          goto LABEL_68;
        if (!poolGrow(v162))
          return 1;
        v42 = *(_BYTE **)(v14 + 824);
LABEL_68:
        *(_QWORD *)(v14 + 824) = v42 + 1;
        *v42 = 0;
        *(_QWORD *)(v14 + 640) = *(_QWORD *)(v14 + 832);
        *(_QWORD *)(v14 + 832) = *(_QWORD *)(v14 + 824);
LABEL_69:
        *v165 = a3;
        (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, uint64_t, BOOL))(v14 + 280))(*(_QWORD *)(v14 + 8), **(_QWORD **)(v14 + 664), **(_QWORD **)(v14 + 672), *(_QWORD *)(v14 + 640), v38, v20 == 38);
        v43 = *(_QWORD **)(v14 + 808);
        v44 = *(_QWORD **)(v14 + 800);
        if (v43)
        {
          if (!v44)
            goto LABEL_268;
          do
          {
            v45 = v44;
            v44 = (_QWORD *)*v44;
            *v45 = v43;
            v43 = v45;
          }
          while (v44);
        }
        else
        {
LABEL_266:
          v45 = v44;
        }
LABEL_267:
        *(_QWORD *)(v14 + 808) = v45;
LABEL_268:
        *v162 = 0;
        v161[1] = 0;
        v161[2] = 0;
        *v161 = 0;
        goto LABEL_340;
      case 0x27u:
        goto LABEL_320;
      case 0x28u:
        if (!*(_QWORD *)(v14 + 272))
          goto LABEL_338;
        v88 = getElementType(v14, v13, (uint64_t)a3, (uint64_t)v166);
        *(_QWORD *)(v14 + 664) = v88;
        v19 = 1;
        if (!v88)
          return v19;
        *(_QWORD *)(v15 + 344) = 0;
        *(_BYTE *)(v15 + 320) = 1;
        goto LABEL_340;
      case 0x29u:
      case 0x2Au:
        if (!*(_BYTE *)(v15 + 320))
          goto LABEL_338;
        if (!*(_QWORD *)(v14 + 272))
          goto LABEL_80;
        v46 = (*(uint64_t (**)(uint64_t))(v14 + 24))(32);
        v19 = 1;
        if (!v46)
          return v19;
        *(_QWORD *)(v46 + 24) = 0;
        if (v20 == 41)
          v47 = 2;
        else
          v47 = 1;
        *(_QWORD *)(v46 + 12) = 0;
        *(_QWORD *)(v46 + 4) = 0;
        *(_DWORD *)v46 = v47;
        *v165 = a3;
        (*(void (**)(_QWORD, _QWORD, uint64_t))(v14 + 272))(*(_QWORD *)(v14 + 8), **(_QWORD **)(v14 + 664), v46);
        v23 = 0;
LABEL_80:
        *(_BYTE *)(v15 + 320) = 0;
        goto LABEL_337;
      case 0x2Bu:
        if (!*(_BYTE *)(v15 + 320))
          goto LABEL_338;
        v89 = *(_QWORD *)(v15 + 328);
        v90 = 32 * *(int *)(*(_QWORD *)(v15 + 352) + 4 * *(int *)(v15 + 348) - 4);
        v91 = 3;
        goto LABEL_319;
      case 0x2Cu:
        v92 = *(_DWORD *)(v14 + 904);
        if (*(_DWORD *)(v14 + 520) < v92)
          goto LABEL_315;
        if (v92)
        {
          if ((v92 & 0x80000000) != 0)
            return 1;
          v93 = *(uint64_t (**)(uint64_t))(v14 + 32);
          v94 = *(_QWORD *)(v14 + 896);
          *(_DWORD *)(v14 + 904) = 2 * v92;
          v95 = v93(v94);
          if (!v95)
          {
            *(_DWORD *)(v14 + 904) >>= 1;
            return 1;
          }
          *(_QWORD *)(v14 + 896) = v95;
          v96 = *(_QWORD *)(v15 + 352);
          if (v96)
          {
            v97 = (*(uint64_t (**)(uint64_t, uint64_t))(v14 + 32))(v96, 4 * *(unsigned int *)(v14 + 904));
            if (!v97)
              return 1;
            *(_QWORD *)(v15 + 352) = v97;
          }
          goto LABEL_315;
        }
        v144 = *(uint64_t (**)(uint64_t))(v14 + 24);
        *(_DWORD *)(v14 + 904) = 32;
        v145 = v144(32);
        *(_QWORD *)(v14 + 896) = v145;
        if (v145)
        {
LABEL_315:
          *(_BYTE *)(*(_QWORD *)(v14 + 896) + *(unsigned int *)(v14 + 520)) = 0;
          if (!*(_BYTE *)(v15 + 320))
            goto LABEL_338;
          ScaffoldPart = nextScaffoldPart(v14);
          if ((ScaffoldPart & 0x80000000) != 0)
            return 1;
          v147 = *(_QWORD *)(v15 + 352);
          if (!v147)
            doProlog_cold_1();
          *(_DWORD *)(v147 + 4 * (int)(*(_DWORD *)(v15 + 348))++) = ScaffoldPart;
          v89 = *(_QWORD *)(v15 + 328);
          v90 = 32 * ScaffoldPart;
          v91 = 6;
LABEL_319:
          *(_DWORD *)(v89 + v90) = v91;
LABEL_320:
          if (!*(_QWORD *)(v14 + 272))
          {
LABEL_338:
            if (*(_QWORD *)(v14 + 176))
              reportDefault(v14, v13, (uint64_t)a3, (uint64_t)v166);
          }
LABEL_340:
          v150 = *(_DWORD *)(v14 + 920);
          if (v150 == 2)
            return 35;
          if (v150 == 3)
          {
            v19 = 0;
            *a7 = v166;
            return v19;
          }
          a3 = v166;
          a5 = (*(uint64_t (**)(uint64_t, unsigned __int8 *, unsigned __int8 *, unsigned __int8 **))v13)(v13, v166, a4, &v166);
          continue;
        }
        *(_DWORD *)(v14 + 904) = 0;
        return 1;
      case 0x2Du:
        goto LABEL_211;
      case 0x2Eu:
        v22 = 2;
        goto LABEL_211;
      case 0x2Fu:
        v22 = 1;
        goto LABEL_211;
      case 0x30u:
        v22 = 3;
LABEL_211:
        if (!*(_BYTE *)(v15 + 320))
          goto LABEL_338;
        v98 = *(_QWORD *)(v14 + 272);
        v23 = v98 == 0;
        v99 = *(int *)(v15 + 348) - 1;
        *(_DWORD *)(v15 + 348) = v99;
        *(_DWORD *)(*(_QWORD *)(v15 + 328) + 32 * *(int *)(*(_QWORD *)(v15 + 352) + 4 * v99) + 4) = v22;
        if ((_DWORD)v99)
          goto LABEL_337;
        if (!v98)
          goto LABEL_226;
        v100 = *(_QWORD *)(v14 + 688);
        v101 = (*(uint64_t (**)(uint64_t))(v14 + 24))(*(unsigned int *)(v100 + 336) + 32
                                                                                             * *(unsigned int *)(v100 + 344));
        if (!v101)
          return 1;
        v102 = *(unsigned int *)(v100 + 344);
        *(_DWORD *)(v101 + 16) = 0;
        if ((_DWORD)v102)
        {
          v103 = (_BYTE *)(v101 + 32 * v102);
          v104 = v101 + 32;
          v105 = v101;
          v106 = v103;
          do
          {
            v107 = *(int *)(v105 + 16);
            v108 = *(_QWORD *)(v100 + 328);
            v109 = *(_QWORD *)(v108 + 32 * v107);
            *(_QWORD *)v105 = v109;
            if ((_DWORD)v109 == 4)
            {
              *(_QWORD *)(v105 + 8) = v106;
              v110 = *(_BYTE **)(v108 + 32 * v107 + 8);
              do
                *v106++ = *v110;
              while (*v110++);
              *(_DWORD *)(v105 + 16) = 0;
              *(_QWORD *)(v105 + 24) = 0;
            }
            else
            {
              *(_QWORD *)(v105 + 8) = 0;
              v112 = v108 + 32 * v107;
              v113 = *(_DWORD *)(v112 + 24);
              *(_DWORD *)(v105 + 16) = v113;
              *(_QWORD *)(v105 + 24) = v104;
              if (v113)
              {
                v114 = 0;
                v115 = (int *)(v112 + 16);
                do
                {
                  v116 = *v115;
                  *(_DWORD *)(v104 + 16) = v116;
                  v104 += 32;
                  ++v114;
                  v115 = (int *)(v108 + 32 * v116 + 28);
                }
                while (v114 < *(_DWORD *)(v105 + 16));
              }
            }
            v105 += 32;
          }
          while (v105 < (unint64_t)v103);
        }
        *v165 = a3;
        (*(void (**)(_QWORD, _QWORD, uint64_t))(v14 + 272))(*(_QWORD *)(v14 + 8), **(_QWORD **)(v14 + 664), v101);
LABEL_226:
        *(_BYTE *)(v15 + 320) = 0;
        *(_DWORD *)(v15 + 336) = 0;
        goto LABEL_337;
      case 0x31u:
        v117 = *(_QWORD *)(v14 + 896);
        v118 = *(unsigned int *)(v14 + 520);
        if (*(_BYTE *)(v117 + v118) == 44)
          return 2;
        if (*(_BYTE *)(v117 + v118))
          v119 = 1;
        else
          v119 = *(_BYTE *)(v15 + 320) == 0;
        if (!v119)
        {
          v120 = (_DWORD *)(*(_QWORD *)(v15 + 328)
                          + 32 * *(int *)(*(_QWORD *)(v15 + 352) + 4 * *(int *)(v15 + 348) - 4));
          if (*v120 != 3)
          {
            *v120 = 5;
            v23 = *(_QWORD *)(v14 + 272) == 0;
          }
        }
        *(_BYTE *)(v117 + v118) = 124;
        goto LABEL_337;
      case 0x32u:
        v121 = *(_QWORD *)(v14 + 896);
        v122 = *(unsigned int *)(v14 + 520);
        if (*(_BYTE *)(v121 + v122) == 124)
          return 2;
        *(_BYTE *)(v121 + v122) = 44;
        if (!*(_BYTE *)(v15 + 320))
          goto LABEL_338;
        goto LABEL_320;
      case 0x33u:
        if (!*(_BYTE *)(v15 + 320))
          goto LABEL_338;
        v23 = 0;
        v123 = v166;
        goto LABEL_244;
      case 0x34u:
        v23 = 2;
        goto LABEL_242;
      case 0x35u:
        goto LABEL_242;
      case 0x36u:
        v23 = 3;
LABEL_242:
        if (!*(_BYTE *)(v15 + 320))
          goto LABEL_338;
        v123 = &v166[-*(int *)(v13 + 128)];
LABEL_244:
        v124 = nextScaffoldPart(v14);
        if ((v124 & 0x80000000) != 0)
          return 1;
        v125 = v124;
        v126 = (_DWORD *)(*(_QWORD *)(v15 + 328) + 32 * v124);
        *v126 = 4;
        v126[1] = v23;
        v127 = getElementType(v14, v13, (uint64_t)a3, (uint64_t)v123);
        if (!v127)
          return 1;
        v128 = 0;
        v129 = *(_QWORD *)v127;
        *(_QWORD *)(*(_QWORD *)(v15 + 328) + 32 * v125 + 8) = *(_QWORD *)v127;
        while (*(unsigned __int8 *)(v129 + v128++))
          ;
        v131 = *(_DWORD *)(v15 + 336);
        if (v128 > ~v131)
          return 1;
        *(_DWORD *)(v15 + 336) = v131 + v128;
        goto LABEL_320;
      case 0x37u:
        if (!reportProcessingInstruction(v14, v13, (uint64_t)a3, (uint64_t)v166))
          return 1;
        goto LABEL_340;
      case 0x38u:
        if (!reportComment(v14, v13, (uint64_t)a3, (uint64_t)v166))
          return 1;
        goto LABEL_340;
      case 0x39u:
        v53 = v166;
        v54 = v14;
        v55 = 1;
LABEL_255:
        v37 = processXmlDecl(v54, v55, a3, (unint64_t)v53);
        if ((_DWORD)v37)
          return v37;
        v13 = *(_QWORD *)(v14 + 304);
        goto LABEL_340;
      case 0x3Au:
        if (*(_QWORD *)(v14 + 176))
          reportDefault(v14, v13, (uint64_t)a3, (uint64_t)v166);
        v37 = doIgnoreSection(v14, v13, &v166, (uint64_t)a4, a7, a8);
        if ((_DWORD)v37)
          return v37;
        if (v166)
          goto LABEL_340;
        v19 = 0;
        *(_QWORD *)(v14 + 544) = ignoreSectionProcessor;
        return v19;
      case 0x3Bu:
      case 0x3Cu:
        *(_BYTE *)(v15 + 257) = 1;
        if (!*(_DWORD *)(v14 + 932))
        {
          v132 = *(unsigned __int8 *)(v15 + 258);
          *(_BYTE *)(v15 + 256) = v132;
          if (v132)
            goto LABEL_337;
LABEL_263:
          v133 = *(unsigned int (**)(_QWORD))(v14 + 232);
          if (v133 && !v133(*(_QWORD *)(v14 + 8)))
            return 22;
          goto LABEL_337;
        }
        v48 = (char *)poolStoreString(v160, v13, (uint64_t)&a3[*(int *)(v13 + 128)], (uint64_t)&v166[-*(int *)(v13 + 128)]);
        if (!v48)
          return 1;
        v49 = v48;
        v50 = lookup(v14, v157, v48, 0);
        v51 = (uint64_t)v50;
        *(_QWORD *)(v15 + 184) = *(_QWORD *)(v15 + 192);
        if (!*(_DWORD *)(v14 + 532))
          goto LABEL_86;
        if (*(_BYTE *)(v15 + 258))
        {
          if (!*(_QWORD *)(v14 + 584))
            goto LABEL_284;
        }
        else if (!*(_BYTE *)(v15 + 257))
        {
LABEL_284:
          if (!v50)
            return 11;
          if (!*((_BYTE *)v50 + 58))
            return 24;
          goto LABEL_286;
        }
LABEL_86:
        if (!v50)
        {
          *(_BYTE *)(v15 + 256) = *(_BYTE *)(v15 + 258);
          if (v20 == 60)
          {
            v52 = *(void (**)(_QWORD, char *, uint64_t))(v14 + 256);
            if (v52)
            {
              v52(*(_QWORD *)(v14 + 8), v49, 1);
              goto LABEL_340;
            }
          }
          goto LABEL_338;
        }
LABEL_286:
        if (*((_BYTE *)v50 + 56))
          return 12;
        if (*((_QWORD *)v50 + 1))
        {
          v37 = processInternalEntity(v14, (uint64_t)v50, v20 == 60);
          if ((_DWORD)v37)
            return v37;
          goto LABEL_340;
        }
        if (!*(_QWORD *)(v14 + 240))
        {
          *(_BYTE *)(v15 + 256) = *(_BYTE *)(v15 + 258);
          goto LABEL_338;
        }
        *(_BYTE *)(v15 + 259) = 0;
        *((_BYTE *)v50 + 56) = 1;
        entityTrackingOnOpen(v14, (uint64_t)v50, 5541);
        v138 = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(v14 + 240))(*(_QWORD *)(v14 + 248), 0, *(_QWORD *)(v51 + 32), *(_QWORD *)(v51 + 24), *(_QWORD *)(v51 + 40));
        v139 = v14;
        if (!v138)
        {
          do
          {
            v151 = v14;
            v14 = *(_QWORD *)(v14 + 912);
          }
          while (v14);
          entityTrackingReportStats(v151, v51, "CLOSE", 5545);
          --*(_DWORD *)(v151 + 988);
          *(_BYTE *)(v51 + 56) = 0;
          return 21;
        }
        do
        {
          v140 = v139;
          v139 = *(_QWORD *)(v139 + 912);
        }
        while (v139);
        entityTrackingReportStats(v140, v51, "CLOSE", 5549);
        --*(_DWORD *)(v140 + 988);
        *(_BYTE *)(v51 + 56) = 0;
        if (!*(_BYTE *)(v15 + 259))
        {
          *(_BYTE *)(v15 + 256) = *(_BYTE *)(v15 + 258);
          goto LABEL_340;
        }
        v23 = 0;
        if (!*(_BYTE *)(v15 + 258))
          goto LABEL_263;
LABEL_337:
        if (!v23)
          goto LABEL_340;
        goto LABEL_338;
      default:
        goto LABEL_338;
    }
  }
}

uint64_t epilogProcessor(uint64_t a1, unsigned __int8 *a2, uint64_t a3, unsigned __int8 **a4)
{
  unsigned __int8 *v5;
  int v7;
  uint64_t result;
  int v9;

  v5 = a2;
  *(_QWORD *)(a1 + 544) = epilogProcessor;
  *(_QWORD *)(a1 + 560) = a2;
  while (1)
  {
    v7 = (**(uint64_t (***)(void))(a1 + 304))();
    if (!accountingDiffTolerated(a1, v7, v5, 0, 5754, 0))
    {
      accountingReportStats((_QWORD *)a1, " ABORTING\n");
      return 43;
    }
    *(_QWORD *)(a1 + 568) = 0;
    result = 9;
    if (v7 > 12)
    {
      if (v7 == 13)
      {
        if (!reportComment(a1, *(_QWORD *)(a1 + 304), (uint64_t)v5, 0))
          return 1;
      }
      else
      {
        if (v7 != 15)
          return result;
        if (*(_QWORD *)(a1 + 176))
          reportDefault(a1, *(_QWORD *)(a1 + 304), (uint64_t)v5, 0);
      }
      goto LABEL_12;
    }
    if (v7 != 11)
      break;
    if (!reportProcessingInstruction(a1, *(_QWORD *)(a1 + 304), (uint64_t)v5, 0))
      return 1;
LABEL_12:
    v5 = 0;
    *(_QWORD *)(a1 + 560) = 0;
    v9 = *(_DWORD *)(a1 + 920);
    if (v9 == 2)
      return 35;
    if (v9 == 3)
    {
LABEL_26:
      result = 0;
      *a4 = v5;
      return result;
    }
  }
  switch(v7)
  {
    case -4:
      goto LABEL_26;
    case -3:
      return result;
    case -2:
      if (!*(_BYTE *)(a1 + 924))
        goto LABEL_26;
      return 6;
    case -1:
      if (!*(_BYTE *)(a1 + 924))
        goto LABEL_26;
      return 5;
    case 0:
      *(_QWORD *)(a1 + 560) = 0;
      return 4;
    default:
      if (v7 != -15)
        return result;
      if (*(_QWORD *)(a1 + 176))
      {
        reportDefault(a1, *(_QWORD *)(a1 + 304), (uint64_t)v5, 0);
        if (*(_DWORD *)(a1 + 920) == 2)
          return 35;
      }
      result = 0;
      *a4 = 0;
      break;
  }
  return result;
}

uint64_t normal_prologTok(uint64_t a1, unsigned __int8 *a2, unint64_t a3, char **a4)
{
  unsigned __int8 *v5;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char *v11;
  unint64_t v12;
  unsigned int v13;
  char *v16;
  int v17;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  int v23;
  unsigned __int8 *v26;
  int v27;
  unint64_t v28;
  unsigned int v29;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unsigned int v34;

  if ((unint64_t)a2 < a3)
  {
    v5 = a2;
    v8 = 18;
    v9 = 1;
    switch(*(_BYTE *)(a1 + *a2 + 136))
    {
      case 2:
        v16 = (char *)(a2 + 1);
        if ((uint64_t)(a3 - (_QWORD)(a2 + 1)) < 1)
          return 0xFFFFFFFFLL;
        v17 = *(unsigned __int8 *)(a1 + *v16 + 136);
        switch(*(_BYTE *)(a1 + *v16 + 136))
        {
          case 0xF:
            return normal_scanPi((_BYTE *)a1, (char *)a2 + 2, a3, a4);
          case 0x10:
            return normal_scanDecl((_BYTE *)a1, a2 + 2, a3, (unsigned __int8 **)a4);
          case 0x11:
          case 0x12:
          case 0x13:
          case 0x14:
          case 0x15:
          case 0x17:
            goto LABEL_154;
          case 0x16:
          case 0x18:
            goto LABEL_141;
          default:
            if ((v17 - 5) >= 3 && v17 != 29)
              goto LABEL_154;
LABEL_141:
            *a4 = (char *)a2;
            v8 = 29;
            break;
        }
        return v8;
      case 4:
        v19 = (char *)(a2 + 1);
        v20 = a3 - (_QWORD)(a2 + 1);
        if (v20 < 1)
          return 4294967270;
        if (*v19 != 93)
          goto LABEL_136;
        if ((unint64_t)v20 < 2)
          return 0xFFFFFFFFLL;
        if (a2[2] == 62)
        {
          *a4 = (char *)(a2 + 3);
          return 34;
        }
        else
        {
LABEL_136:
          *a4 = v19;
          return 26;
        }
      case 5:
        if ((uint64_t)(a3 - (_QWORD)a2) < 2)
          return 4294967294;
        if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 440))(a1, a2))
          goto LABEL_134;
        if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 416))(a1, v5))
          goto LABEL_70;
        if (!(*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 392))(a1, v5))
          goto LABEL_134;
        v8 = 19;
LABEL_70:
        v9 = 2;
        goto LABEL_4;
      case 6:
        if ((uint64_t)(a3 - (_QWORD)a2) < 3)
          return 4294967294;
        if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 448))(a1, a2))
          goto LABEL_134;
        if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 424))(a1, v5))
          goto LABEL_76;
        if (!(*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 400))(a1, v5))
          goto LABEL_134;
        v8 = 19;
LABEL_76:
        v9 = 3;
        goto LABEL_4;
      case 7:
        if ((uint64_t)(a3 - (_QWORD)a2) < 4)
          return 4294967294;
        if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 456))(a1, a2))
          goto LABEL_134;
        if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 432))(a1, v5))
          goto LABEL_153;
        if (!(*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 408))(a1, v5))
          goto LABEL_134;
        v8 = 19;
LABEL_153:
        v9 = 4;
LABEL_4:
        v5 += v9;
        v10 = a3 - (_QWORD)v5;
        if ((uint64_t)(a3 - (_QWORD)v5) < 1)
          return -(int)v8;
        while (2)
        {
          switch(*(_BYTE *)(a1 + *v5 + 136))
          {
            case 5:
              if (v10 < 2)
                return 4294967294;
              if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 440))(a1, v5)
                || !(*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 392))(a1, v5))
              {
                goto LABEL_134;
              }
              v11 = (char *)(v5 + 2);
              goto LABEL_7;
            case 6:
              if (v10 < 3)
                return 4294967294;
              if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 448))(a1, v5)
                || !(*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 400))(a1, v5))
              {
                goto LABEL_134;
              }
              v11 = (char *)(v5 + 3);
              goto LABEL_7;
            case 7:
              if (v10 < 4)
                return 4294967294;
              if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 456))(a1, v5)
                || !(*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 408))(a1, v5))
              {
                goto LABEL_134;
              }
              v11 = (char *)(v5 + 4);
              goto LABEL_7;
            case 9:
            case 0xA:
            case 0xB:
            case 0x14:
            case 0x15:
            case 0x1E:
            case 0x20:
            case 0x23:
            case 0x24:
              goto LABEL_135;
            case 0xF:
              if ((_DWORD)v8 == 19)
                goto LABEL_134;
              *a4 = (char *)(v5 + 1);
              return 30;
            case 0x16:
            case 0x18:
            case 0x19:
            case 0x1A:
            case 0x1B:
              v11 = (char *)(v5 + 1);
              goto LABEL_7;
            case 0x17:
              v11 = (char *)(v5 + 1);
              if ((_DWORD)v8 == 41)
              {
                v8 = 19;
                goto LABEL_7;
              }
              if ((_DWORD)v8 != 18)
                goto LABEL_7;
              v12 = a3 - (_QWORD)v11;
              if ((uint64_t)(a3 - (_QWORD)v11) < 1)
                return 0xFFFFFFFFLL;
              v13 = *(unsigned __int8 *)(a1 + *v11 + 136);
              v8 = 19;
              if (v13 > 0x15)
              {
                if (v13 - 24 >= 4 && v13 != 22)
                {
                  if (v13 == 29)
                    goto LABEL_49;
LABEL_7:
                  v10 = a3 - (_QWORD)v11;
                  v5 = (unsigned __int8 *)v11;
                  if ((uint64_t)(a3 - (_QWORD)v11) <= 0)
                    return -(int)v8;
                  continue;
                }
                v11 = (char *)(v5 + 2);
LABEL_47:
                v8 = 41;
                goto LABEL_7;
              }
              if (v13 == 5)
              {
                if (v12 < 2)
                  return 4294967294;
                if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 440))(a1, v5 + 1)
                  || !(*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 392))(a1, v5 + 1))
                {
                  goto LABEL_49;
                }
                v11 = (char *)(v5 + 3);
                goto LABEL_47;
              }
              if (v13 != 6)
              {
                if (v13 != 7)
                  goto LABEL_7;
                if (v12 < 4)
                  return 4294967294;
                if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 456))(a1, v5 + 1)
                  || !(*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 408))(a1, v5 + 1))
                {
                  goto LABEL_49;
                }
                v11 = (char *)(v5 + 5);
                goto LABEL_47;
              }
              if (v12 < 3)
                return 4294967294;
              if (!(*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 448))(a1, v5 + 1)
                && (*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 400))(a1, v5 + 1))
              {
                v11 = (char *)(v5 + 4);
                goto LABEL_47;
              }
LABEL_49:
              v8 = 0;
              *a4 = v11;
              break;
            case 0x21:
              if ((_DWORD)v8 == 19)
                goto LABEL_134;
              *a4 = (char *)(v5 + 1);
              return 31;
            case 0x22:
              if ((_DWORD)v8 == 19)
                goto LABEL_134;
              *a4 = (char *)(v5 + 1);
              return 32;
            default:
              goto LABEL_134;
          }
          return v8;
        }
      case 9:
        if (a2 + 1 != (unsigned __int8 *)a3)
          goto LABEL_80;
        *a4 = (char *)a3;
        return 4294967281;
      case 0xA:
      case 0x15:
LABEL_80:
        v21 = (char *)(a2 + 1);
        v22 = a3 - (_QWORD)(a2 + 1);
        if (v22 < 1)
          goto LABEL_91;
        do
        {
          v23 = *(unsigned __int8 *)(a1 + *v21 + 136);
          if (v23 != 21 && v23 != 10 && (v23 != 9 || v21 + 1 == (char *)a3))
            goto LABEL_91;
          ++v21;
          --v22;
        }
        while (v22 > 0);
        v21 = (char *)a3;
LABEL_91:
        *a4 = v21;
        return 15;
      case 0xB:
        *a4 = (char *)(a2 + 1);
        return 17;
      case 0xC:
        v26 = a2 + 1;
        v27 = 12;
        return normal_scanLit(v27, (_BYTE *)a1, v26, a3, (unsigned __int8 **)a4);
      case 0xD:
        v26 = a2 + 1;
        v27 = 13;
        return normal_scanLit(v27, (_BYTE *)a1, v26, a3, (unsigned __int8 **)a4);
      case 0x13:
        v5 = a2 + 1;
        v28 = a3 - (_QWORD)(a2 + 1);
        if ((uint64_t)v28 < 1)
          return 0xFFFFFFFFLL;
        v8 = 0;
        v29 = *(unsigned __int8 *)(a1 + *v5 + 136);
        if (v29 <= 6)
        {
          if (v29 == 5)
          {
            if (v28 >= 2)
            {
              if (!(*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 440))(a1, v5)
                && (*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 416))(a1, v5))
              {
                v31 = 2;
                goto LABEL_105;
              }
              goto LABEL_134;
            }
          }
          else
          {
            if (v29 != 6)
              goto LABEL_135;
            if (v28 >= 3)
            {
              if (!(*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 448))(a1, v5)
                && (*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 424))(a1, v5))
              {
                v31 = 3;
                goto LABEL_105;
              }
LABEL_134:
              v8 = 0;
LABEL_135:
              *a4 = (char *)v5;
              return v8;
            }
          }
        }
        else
        {
          if (v29 != 7)
          {
            if (v29 != 22 && v29 != 24)
              goto LABEL_135;
            v31 = 1;
LABEL_105:
            v5 += v31;
            v32 = a3 - (_QWORD)v5;
            if ((uint64_t)(a3 - (_QWORD)v5) < 1)
              return 4294967276;
            do
            {
              v8 = 0;
              v33 = 1;
              switch(*(_BYTE *)(a1 + *v5 + 136))
              {
                case 5:
                  if (v32 < 2)
                    return 4294967294;
                  if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 440))(a1, v5)
                    || !(*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 392))(a1, v5))
                  {
                    goto LABEL_134;
                  }
                  v33 = 2;
                  break;
                case 6:
                  if (v32 < 3)
                    return 4294967294;
                  if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 448))(a1, v5)
                    || !(*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 400))(a1, v5))
                  {
                    goto LABEL_134;
                  }
                  v33 = 3;
                  break;
                case 7:
                  if (v32 < 4)
                    return 4294967294;
                  if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 456))(a1, v5)
                    || !(*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 408))(a1, v5))
                  {
                    goto LABEL_134;
                  }
                  v33 = 4;
                  break;
                case 9:
                case 0xA:
                case 0xB:
                case 0x15:
                case 0x1E:
                case 0x20:
                case 0x24:
                  v8 = 20;
                  goto LABEL_135;
                case 0x16:
                case 0x18:
                case 0x19:
                case 0x1A:
                case 0x1B:
                  break;
                default:
                  goto LABEL_135;
              }
              v5 += v33;
              v32 = a3 - (_QWORD)v5;
              v8 = 4294967276;
            }
            while ((uint64_t)(a3 - (_QWORD)v5) > 0);
            return v8;
          }
          if (v28 >= 4)
          {
            if (!(*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 456))(a1, v5)
              && (*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 432))(a1, v5))
            {
              v31 = 4;
              goto LABEL_105;
            }
            goto LABEL_134;
          }
        }
        return 4294967294;
      case 0x14:
        *a4 = (char *)(a2 + 1);
        return 25;
      case 0x16:
      case 0x18:
        goto LABEL_4;
      case 0x17:
      case 0x19:
      case 0x1A:
      case 0x1B:
        v8 = 19;
        v9 = 1;
        goto LABEL_4;
      case 0x1E:
        return normal_scanPercent(a1, a2 + 1, a3, (unsigned __int8 **)a4);
      case 0x1F:
        *a4 = (char *)(a2 + 1);
        return 23;
      case 0x20:
        v16 = (char *)(a2 + 1);
        if ((uint64_t)(a3 - (_QWORD)(a2 + 1)) < 1)
          return 4294967272;
        v34 = *(unsigned __int8 *)(a1 + *v16 + 136);
        if (v34 > 0x1F)
        {
          switch(*(_BYTE *)(a1 + *v16 + 136))
          {
            case ' ':
            case '#':
            case '$':
              goto LABEL_143;
            case '!':
              *a4 = (char *)(a2 + 2);
              v8 = 36;
              break;
            case '"':
              *a4 = (char *)(a2 + 2);
              v8 = 37;
              break;
            default:
              goto LABEL_154;
          }
          return v8;
        }
        if (v34 - 9 < 3)
          goto LABEL_143;
        if (v34 == 15)
        {
          *a4 = (char *)(a2 + 2);
          return 35;
        }
        else
        {
          if (v34 == 21)
          {
LABEL_143:
            *a4 = v16;
            return 24;
          }
LABEL_154:
          v8 = 0;
          *a4 = v16;
        }
        return v8;
      case 0x23:
        *a4 = (char *)(a2 + 1);
        return 38;
      case 0x24:
        *a4 = (char *)(a2 + 1);
        return 21;
      default:
        goto LABEL_134;
    }
  }
  return 4294967292;
}

uint64_t prolog1(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;

  result = 0;
  switch(a2)
  {
    case 11:
      return 55;
    case 12:
      goto LABEL_5;
    case 13:
      return 56;
    case 14:
    case 15:
      return result;
    case 16:
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t, const char *))(a5 + 48))(a5, a3 + 2 * *(int *)(a5 + 128), a4, "DOCTYPE"))goto LABEL_11;
      *(_QWORD *)a1 = doctype0;
      result = 3;
      break;
    default:
      if (a2 == 29)
      {
        *(_QWORD *)a1 = error;
        result = 2;
      }
      else
      {
LABEL_5:
        if (a2 != 28 || *(_DWORD *)(a1 + 20))
        {
LABEL_11:
          *(_QWORD *)a1 = error;
          result = 0xFFFFFFFFLL;
        }
        else
        {
          result = 59;
        }
      }
      break;
  }
  return result;
}

uint64_t reportProcessingInstruction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;

  if (*(_QWORD *)(a1 + 144))
  {
    v7 = a3 + 2 * *(int *)(a2 + 128);
    v8 = v7 + (*(int (**)(uint64_t, uint64_t))(a2 + 56))(a2, v7);
    result = poolStoreString((uint64_t *)(a1 + 800), a2, v7, v8);
    if (result)
    {
      v10 = result;
      *(_QWORD *)(a1 + 832) = *(_QWORD *)(a1 + 824);
      v11 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 64))(a2, v8);
      result = poolStoreString((uint64_t *)(a1 + 800), a2, v11, a4 - 2 * *(int *)(a2 + 128));
      if (result)
      {
        v12 = result;
        normalizeLines((_BYTE *)result);
        (*(void (**)(_QWORD, uint64_t, uint64_t))(a1 + 144))(*(_QWORD *)(a1 + 8), v10, v12);
        v13 = *(_QWORD **)(a1 + 808);
        v14 = *(_QWORD **)(a1 + 800);
        if (v13)
        {
          if (!v14)
          {
LABEL_13:
            *(_QWORD *)(a1 + 800) = 0;
            *(_QWORD *)(a1 + 816) = 0;
            *(_QWORD *)(a1 + 832) = 0;
            result = 1;
            *(_QWORD *)(a1 + 824) = 0;
            return result;
          }
          do
          {
            v15 = v14;
            v14 = (_QWORD *)*v14;
            *v15 = v13;
            v13 = v15;
          }
          while (v14);
        }
        else
        {
          v15 = *(_QWORD **)(a1 + 800);
        }
        *(_QWORD *)(a1 + 808) = v15;
        goto LABEL_13;
      }
    }
  }
  else
  {
    if (*(_QWORD *)(a1 + 176))
      reportDefault(a1, a2, a3, a4);
    return 1;
  }
  return result;
}

_BYTE *normalizeLines(_BYTE *result)
{
  int v1;
  _BYTE *v2;
  int v3;

  while (1)
  {
    v1 = *result;
    if (!*result)
      break;
    if (v1 == 13)
    {
      v2 = result;
      do
      {
        if (v1 == 13)
        {
          *v2 = 10;
          v3 = *++result;
          if (v3 == 10)
            ++result;
        }
        else
        {
          ++result;
          *v2 = v1;
        }
        ++v2;
        v1 = *result;
      }
      while (*result);
      *v2 = 0;
      return result;
    }
    ++result;
  }
  return result;
}

unsigned __int8 *normal_skipS(uint64_t a1, unsigned __int8 *a2)
{
  unsigned int v2;
  BOOL v3;
  int v4;

  while (1)
  {
    v2 = *(unsigned __int8 *)(a1 + *a2 + 136);
    v3 = v2 > 0x15;
    v4 = (1 << v2) & 0x200600;
    if (v3 || v4 == 0)
      break;
    ++a2;
  }
  return a2;
}

uint64_t prolog0(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;
  void *v7;

  result = 0;
  v7 = prolog1;
  switch(a2)
  {
    case 11:
      result = 55;
      goto LABEL_14;
    case 12:
      result = 1;
      goto LABEL_14;
    case 13:
      result = 56;
      goto LABEL_14;
    case 14:
      return result;
    case 15:
      goto LABEL_14;
    case 16:
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t, const char *))(a5 + 48))(a5, a3 + 2 * *(int *)(a5 + 128), a4, "DOCTYPE"))goto LABEL_12;
      result = 3;
      v7 = doctype0;
      goto LABEL_14;
    default:
      if (a2 == 29)
      {
        result = 2;
      }
      else
      {
        if (a2 == 28 && !*(_DWORD *)(a1 + 20))
          return 59;
LABEL_12:
        result = 0xFFFFFFFFLL;
      }
      v7 = error;
LABEL_14:
      *(_QWORD *)a1 = v7;
      return result;
  }
}

uint64_t contentProcessor(uint64_t a1, unsigned __int8 *a2, uint64_t a3, unsigned __int8 **a4)
{
  uint64_t v5;

  v5 = doContent(a1, 0, *(_QWORD *)(a1 + 304), a2, a3, a4, *(_BYTE *)(a1 + 924) == 0, 0);
  if (!(_DWORD)v5 && !storeRawNames(a1))
    return 1;
  return v5;
}

uint64_t storeRawNames(uint64_t a1)
{
  uint64_t **i;
  uint64_t v3;
  uint64_t *v4;
  char *v5;
  uint64_t *v6;
  size_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t *v10;
  uint64_t *v11;

  for (i = *(uint64_t ***)(a1 + 704); i; i = (uint64_t **)*i)
  {
    v3 = *((int *)i + 12) + 1;
    v4 = i[8];
    v5 = (char *)v4 + v3;
    v6 = i[1];
    if (v6 == (uint64_t *)((char *)v4 + v3))
      break;
    v7 = *((int *)i + 4);
    if (2147483646 - *((int *)i + 12) < v7)
      return 0;
    if ((char *)i[9] - (char *)v4 < (int)v7 + (int)v3)
    {
      v8 = (int)v7 + (int)v3;
      result = (*(uint64_t (**)(void))(a1 + 32))();
      if (!result)
        return result;
      v10 = i[8];
      if (i[3] == v10)
        i[3] = (uint64_t *)result;
      v11 = i[4];
      if (v11)
        i[4] = (uint64_t *)(result + (char *)v11 - (char *)v10);
      i[8] = (uint64_t *)result;
      i[9] = (uint64_t *)(result + v8);
      v5 = (char *)(result + v3);
      v6 = i[1];
      v7 = *((int *)i + 4);
    }
    memcpy(v5, v6, v7);
    i[1] = (uint64_t *)v5;
  }
  return 1;
}

uint64_t XmlInitEncodingNS(uint64_t a1, _QWORD *a2, unsigned __int8 *a3)
{
  int EncodingIndex;

  EncodingIndex = getEncodingIndex(a3);
  if (EncodingIndex == -1)
    return 0;
  *(_BYTE *)(a1 + 133) = EncodingIndex;
  *(_QWORD *)a1 = initScanPrologNS;
  *(_QWORD *)(a1 + 8) = initScanContentNS;
  *(_QWORD *)(a1 + 96) = initUpdatePosition;
  *(_QWORD *)(a1 + 136) = a2;
  *a2 = a1;
  return 1;
}

uint64_t getEncodingIndex(unsigned __int8 *a1)
{
  uint64_t v2;

  if (!a1)
    return 6;
  v2 = 0;
  while (!streqci(a1, (unsigned __int8 *)getEncodingIndex_encodingNames[v2]))
  {
    if (++v2 == 6)
      return 0xFFFFFFFFLL;
  }
  return v2;
}

BOOL utf8_isInvalid3(uint64_t a1, unsigned __int8 *a2)
{
  unsigned int v3;
  int v4;
  unsigned int v5;
  unsigned int v6;

  if (((char)a2[2] & 0x80000000) == 0)
    return 1;
  v3 = a2[2];
  v4 = *a2;
  if (v4 != 239)
  {
    if (v3 > 0xBF)
      return 1;
    v5 = a2[1];
    if (v4 == 224)
      return (v5 + 64) < 0xE0u;
    goto LABEL_11;
  }
  v5 = a2[1];
  if (v5 != 191)
  {
    if (v3 > 0xBF)
      return 1;
LABEL_11:
    if ((v5 & 0x80) != 0)
      goto LABEL_12;
    return 1;
  }
  if (v3 > 0xBD)
    return 1;
  v5 = 191;
LABEL_12:
  if (v4 == 237)
    v6 = 159;
  else
    v6 = 191;
  return v5 > v6;
}

XML_Parser XML_ParserCreate(const XML_Char *encoding)
{
  return (XML_Parser)parserCreate((unsigned __int8 *)encoding, 0, 0, 0);
}

XML_Parser XML_ParserCreate_MM(const XML_Char *encoding, const XML_Memory_Handling_Suite *memsuite, const XML_Char *namespaceSeparator)
{
  return (XML_Parser)parserCreate((unsigned __int8 *)encoding, (__int128 *)memsuite, namespaceSeparator, 0);
}

XML_Bool XML_ParserReset(XML_Parser parser, const XML_Char *encoding)
{
  XML_Parser v2;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(_QWORD);
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  _QWORD *v33;
  _QWORD *v34;
  _QWORD *v35;
  _QWORD *v36;
  _QWORD *v37;
  _QWORD *v38;

  if (parser)
  {
    v2 = parser;
    if (*((_QWORD *)parser + 114))
    {
      LOBYTE(parser) = 0;
      return parser;
    }
    v4 = (_QWORD *)*((_QWORD *)parser + 88);
    if (v4)
    {
      v5 = (_QWORD *)*((_QWORD *)parser + 89);
      do
      {
        v6 = v4;
        v4 = (_QWORD *)*v4;
        *v6 = v5;
        v7 = v6[10];
        if (v7)
        {
          v8 = *((_QWORD *)parser + 91);
          do
          {
            v9 = v7;
            v7 = *(_QWORD *)(v7 + 8);
            *(_QWORD *)(v9 + 8) = v8;
            v8 = v9;
          }
          while (v7);
          *((_QWORD *)parser + 91) = v9;
        }
        v6[10] = 0;
        v5 = v6;
      }
      while (v4);
      *((_QWORD *)parser + 89) = v6;
    }
    v10 = *((_QWORD *)parser + 73);
    if (v10)
    {
      v11 = *((_QWORD *)parser + 74);
      do
      {
        v12 = v10;
        v10 = *(_QWORD *)(v10 + 16);
        *(_QWORD *)(v12 + 16) = v11;
        v11 = v12;
      }
      while (v10);
      *((_QWORD *)parser + 74) = v12;
    }
    v13 = *((_QWORD *)parser + 90);
    if (v13)
    {
      v14 = *((_QWORD *)parser + 91);
      do
      {
        v15 = v13;
        v13 = *(_QWORD *)(v13 + 8);
        *(_QWORD *)(v15 + 8) = v14;
        v14 = v15;
      }
      while (v13);
      *((_QWORD *)parser + 91) = v15;
    }
    (*((void (**)(_QWORD))parser + 5))(*((_QWORD *)parser + 60));
    v16 = (void (*)(_QWORD))*((_QWORD *)v2 + 63);
    if (v16)
      v16(*((_QWORD *)v2 + 61));
    v17 = (_QWORD *)*((_QWORD *)v2 + 101);
    v18 = (_QWORD *)*((_QWORD *)v2 + 100);
    if (v17)
    {
      if (!v18)
        goto LABEL_28;
      do
      {
        v19 = v18;
        v18 = (_QWORD *)*v18;
        *v19 = v17;
        v17 = v19;
      }
      while (v18);
    }
    else
    {
      v19 = (_QWORD *)*((_QWORD *)v2 + 100);
    }
    *((_QWORD *)v2 + 101) = v19;
LABEL_28:
    *((_QWORD *)v2 + 100) = 0;
    *((_QWORD *)v2 + 102) = 0;
    *((_QWORD *)v2 + 104) = 0;
    *((_QWORD *)v2 + 103) = 0;
    v20 = (_QWORD *)*((_QWORD *)v2 + 107);
    v21 = (_QWORD *)*((_QWORD *)v2 + 106);
    if (v20)
    {
      if (!v21)
        goto LABEL_34;
      do
      {
        v22 = v21;
        v21 = (_QWORD *)*v21;
        *v22 = v20;
        v20 = v22;
      }
      while (v21);
    }
    else
    {
      v22 = (_QWORD *)*((_QWORD *)v2 + 106);
    }
    *((_QWORD *)v2 + 107) = v22;
LABEL_34:
    *((_QWORD *)v2 + 106) = 0;
    *((_QWORD *)v2 + 108) = 0;
    *((_QWORD *)v2 + 110) = 0;
    *((_QWORD *)v2 + 109) = 0;
    (*((void (**)(_QWORD))v2 + 5))(*((_QWORD *)v2 + 58));
    *((_QWORD *)v2 + 58) = 0;
    parserInit((uint64_t)v2, (unsigned __int8 *)encoding);
    v23 = *((_QWORD *)v2 + 86);
    v24 = *(uint64_t **)(v23 + 40);
    if (v24)
      v25 = &v24[*(_QWORD *)(v23 + 56)];
    else
      v25 = 0;
    while (v24 != v25)
    {
      v27 = *v24++;
      v26 = v27;
      if (v27 && *(_DWORD *)(v26 + 28))
        (*((void (**)(_QWORD))v2 + 5))(*(_QWORD *)(v26 + 32));
    }
    if (*(_QWORD *)(v23 + 16))
    {
      v28 = 0;
      do
      {
        (*(void (**)(_QWORD))(*(_QWORD *)(v23 + 32) + 16))(*(_QWORD *)(*(_QWORD *)v23 + 8 * v28));
        *(_QWORD *)(*(_QWORD *)v23 + 8 * v28++) = 0;
      }
      while (v28 < *(_QWORD *)(v23 + 16));
    }
    *(_QWORD *)(v23 + 24) = 0;
    *(_BYTE *)(v23 + 259) = 0;
    if (*(_QWORD *)(v23 + 280))
    {
      v29 = 0;
      do
      {
        (*(void (**)(_QWORD))(*(_QWORD *)(v23 + 296) + 16))(*(_QWORD *)(*(_QWORD *)(v23 + 264) + 8 * v29));
        *(_QWORD *)(*(_QWORD *)(v23 + 264) + 8 * v29++) = 0;
      }
      while (v29 < *(_QWORD *)(v23 + 280));
    }
    *(_QWORD *)(v23 + 288) = 0;
    if (*(_QWORD *)(v23 + 56))
    {
      v30 = 0;
      do
      {
        (*(void (**)(_QWORD))(*(_QWORD *)(v23 + 72) + 16))(*(_QWORD *)(*(_QWORD *)(v23 + 40) + 8 * v30));
        *(_QWORD *)(*(_QWORD *)(v23 + 40) + 8 * v30++) = 0;
      }
      while (v30 < *(_QWORD *)(v23 + 56));
    }
    *(_QWORD *)(v23 + 64) = 0;
    if (*(_QWORD *)(v23 + 96))
    {
      v31 = 0;
      do
      {
        (*(void (**)(_QWORD))(*(_QWORD *)(v23 + 112) + 16))(*(_QWORD *)(*(_QWORD *)(v23 + 80) + 8 * v31));
        *(_QWORD *)(*(_QWORD *)(v23 + 80) + 8 * v31++) = 0;
      }
      while (v31 < *(_QWORD *)(v23 + 96));
    }
    *(_QWORD *)(v23 + 104) = 0;
    if (*(_QWORD *)(v23 + 136))
    {
      v32 = 0;
      do
      {
        (*(void (**)(_QWORD))(*(_QWORD *)(v23 + 152) + 16))(*(_QWORD *)(*(_QWORD *)(v23 + 120) + 8 * v32));
        *(_QWORD *)(*(_QWORD *)(v23 + 120) + 8 * v32++) = 0;
      }
      while (v32 < *(_QWORD *)(v23 + 136));
    }
    *(_QWORD *)(v23 + 144) = 0;
    v34 = *(_QWORD **)(v23 + 160);
    v33 = *(_QWORD **)(v23 + 168);
    if (v33)
    {
      if (!v34)
        goto LABEL_62;
      do
      {
        v35 = v34;
        v34 = (_QWORD *)*v34;
        *v35 = v33;
        v33 = v35;
      }
      while (v34);
    }
    else
    {
      v35 = *(_QWORD **)(v23 + 160);
    }
    *(_QWORD *)(v23 + 168) = v35;
LABEL_62:
    *(_QWORD *)(v23 + 160) = 0;
    *(_QWORD *)(v23 + 184) = 0;
    *(_QWORD *)(v23 + 192) = 0;
    *(_QWORD *)(v23 + 176) = 0;
    v37 = *(_QWORD **)(v23 + 208);
    v36 = *(_QWORD **)(v23 + 216);
    if (v36)
    {
      if (!v37)
      {
LABEL_68:
        *(_QWORD *)(v23 + 208) = 0;
        *(_QWORD *)(v23 + 232) = 0;
        *(_QWORD *)(v23 + 240) = 0;
        *(_QWORD *)(v23 + 224) = 0;
        *(_QWORD *)(v23 + 304) = 0;
        *(_QWORD *)(v23 + 312) = 0;
        *(_BYTE *)(v23 + 320) = 0;
        (*((void (**)(_QWORD))v2 + 5))(*(_QWORD *)(v23 + 352));
        *(_QWORD *)(v23 + 352) = 0;
        (*((void (**)(_QWORD))v2 + 5))(*(_QWORD *)(v23 + 328));
        *(_QWORD *)(v23 + 328) = 0;
        *(_QWORD *)(v23 + 336) = 0;
        *(_QWORD *)(v23 + 344) = 0;
        LOBYTE(parser) = 1;
        *(_WORD *)(v23 + 256) = 1;
        *(_BYTE *)(v23 + 258) = 0;
        return parser;
      }
      do
      {
        v38 = v37;
        v37 = (_QWORD *)*v37;
        *v38 = v36;
        v36 = v38;
      }
      while (v37);
    }
    else
    {
      v38 = *(_QWORD **)(v23 + 208);
    }
    *(_QWORD *)(v23 + 216) = v38;
    goto LABEL_68;
  }
  return parser;
}

XML_Status XML_SetEncoding(XML_Parser parser, const XML_Char *encoding)
{
  XML_Parser v2;

  if (parser)
  {
    v2 = parser;
    if ((*((_DWORD *)parser + 230) | 2) == 3)
    {
      LODWORD(parser) = 0;
    }
    else
    {
      (*((void (**)(_QWORD))parser + 5))(*((_QWORD *)parser + 58));
      if (encoding)
      {
        parser = (XML_Parser)copyString((unsigned __int8 *)encoding, (uint64_t (**)(size_t))v2 + 3);
        *((_QWORD *)v2 + 58) = parser;
        if (!parser)
          return parser;
      }
      else
      {
        *((_QWORD *)v2 + 58) = 0;
      }
      LODWORD(parser) = 1;
    }
  }
  return parser;
}

void *copyString(unsigned __int8 *a1, uint64_t (**a2)(size_t))
{
  size_t v3;
  void *v5;
  void *v6;

  v3 = 0;
  while (a1[v3++])
    ;
  v5 = (void *)(*a2)(v3);
  v6 = v5;
  if (v5)
    memcpy(v5, a1, v3);
  return v6;
}

XML_Parser XML_ExternalEntityParserCreate(XML_Parser parser, const XML_Char *context, const XML_Char *encoding)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  XML_ParserStruct *v9;
  char v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  __int128 *v14;
  __int16 *v15;
  unsigned __int8 *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char ***v21;
  char ***v22;
  void *v23;
  char **v24;
  char **v25;
  char *v26;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  _BYTE *v32;
  uint64_t v33;
  _OWORD *v34;
  _OWORD *v35;
  char **v36;
  _OWORD *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  _OWORD *v42;
  _OWORD *v43;
  uint64_t v44;
  uint64_t v45;
  char **v46;
  int v47;
  char **v48;
  uint64_t v49;
  uint64_t v50;
  _OWORD *v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  int v66;
  uint64_t *v67;
  int v68;
  uint64_t *v69;
  uint64_t v71;
  __int16 v72;

  if (!parser)
    return 0;
  v64 = *(_OWORD *)((char *)parser + 136);
  v65 = *(_OWORD *)((char *)parser + 120);
  v62 = *(_OWORD *)((char *)parser + 168);
  v63 = *(_OWORD *)((char *)parser + 152);
  v60 = *(_OWORD *)((char *)parser + 216);
  v61 = *(_OWORD *)((char *)parser + 200);
  v58 = *((_OWORD *)parser + 16);
  v59 = *(_OWORD *)((char *)parser + 232);
  v56 = *((_OWORD *)parser + 18);
  v57 = *((_OWORD *)parser + 17);
  v5 = *((_QWORD *)parser + 83);
  v7 = *(_QWORD *)parser;
  v6 = *((_QWORD *)parser + 1);
  v8 = *((_BYTE *)parser + 600);
  v9 = (XML_ParserStruct *)*((_QWORD *)parser + 31);
  v68 = *((_DWORD *)parser + 233);
  v66 = *((_DWORD *)parser + 134);
  v10 = *((_BYTE *)parser + 473);
  v11 = *((_QWORD *)parser + 117);
  v12 = *((_BYTE *)parser + 96);
  v71 = *((_QWORD *)parser + 86);
  if (context)
    v13 = 0;
  else
    v13 = *((_QWORD *)parser + 86);
  if (*((_BYTE *)parser + 472))
  {
    v72 = *((unsigned __int8 *)parser + 908);
    v14 = (__int128 *)((char *)parser + 24);
    v15 = &v72;
    v16 = (unsigned __int8 *)encoding;
  }
  else
  {
    v14 = (__int128 *)((char *)parser + 24);
    v16 = (unsigned __int8 *)encoding;
    v15 = 0;
  }
  v17 = parserCreate(v16, v14, v15, v13);
  v18 = v17;
  if (v17)
  {
    *(_OWORD *)(v17 + 120) = v65;
    *(_OWORD *)(v17 + 136) = v64;
    *(_OWORD *)(v17 + 152) = v63;
    *(_OWORD *)(v17 + 168) = v62;
    *(_OWORD *)(v17 + 200) = v61;
    *(_OWORD *)(v17 + 216) = v60;
    *(_OWORD *)(v17 + 232) = v59;
    *(_OWORD *)(v17 + 256) = v58;
    *(_OWORD *)(v17 + 272) = v57;
    *(_OWORD *)(v17 + 288) = v56;
    *(_QWORD *)(v17 + 664) = v5;
    if (v7 == v6)
      v19 = v7;
    else
      v19 = v17;
    *(_QWORD *)v17 = v7;
    *(_QWORD *)(v17 + 8) = v19;
    if (v9 != parser)
      *(_QWORD *)(v17 + 248) = v9;
    *(_BYTE *)(v17 + 600) = v8;
    *(_BYTE *)(v17 + 473) = v10;
    *(_QWORD *)(v17 + 936) = v11;
    *(_BYTE *)(v17 + 96) = v12;
    *(_QWORD *)(v17 + 912) = parser;
    *(_DWORD *)(v17 + 932) = v68;
    *(_DWORD *)(v17 + 536) = v66;
    if (context)
    {
      v20 = *(_QWORD *)(v17 + 688);
      v21 = *(char ****)(v71 + 120);
      if (v21)
        v22 = &v21[*(_QWORD *)(v71 + 136)];
      else
        v22 = 0;
      while (v21 != v22)
      {
        v25 = *v21++;
        v24 = v25;
        if (v25)
        {
          v26 = (char *)poolCopyString((uint64_t *)(v20 + 160), *v24);
          if (!v26 || !lookup((uint64_t)parser, (uint64_t *)(v20 + 120), v26, 0x10uLL))
            goto LABEL_24;
        }
      }
      v28 = *(uint64_t **)(v71 + 80);
      if (v28)
        v29 = &v28[*(_QWORD *)(v71 + 96)];
      else
        v29 = 0;
      while (v28 != v29)
      {
        v31 = *v28++;
        v30 = v31;
        if (v31)
        {
          v32 = *(_BYTE **)(v20 + 184);
          if (v32 == *(_BYTE **)(v20 + 176))
          {
            if (!poolGrow((uint64_t *)(v20 + 160)))
              goto LABEL_24;
            v32 = *(_BYTE **)(v20 + 184);
          }
          *(_QWORD *)(v20 + 184) = v32 + 1;
          *v32 = 0;
          v33 = poolCopyString((uint64_t *)(v20 + 160), *(char **)v30);
          if (!v33)
            goto LABEL_24;
          v34 = lookup((uint64_t)parser, (uint64_t *)(v20 + 80), (char *)(v33 + 1), 0x18uLL);
          if (!v34)
            goto LABEL_24;
          v35 = v34;
          *((_BYTE *)v34 + 16) = *(_BYTE *)(v30 + 16);
          v36 = *(char ***)(v30 + 8);
          if (v36)
          {
            *((_BYTE *)v34 + 17) = *(_BYTE *)(v30 + 17);
            v37 = (_OWORD *)(v20 + 304);
            if (v36 != (char **)(v71 + 304))
              v37 = lookup((uint64_t)parser, (uint64_t *)(v20 + 120), *v36, 0);
            *((_QWORD *)v35 + 1) = v37;
          }
        }
      }
      v38 = *(uint64_t **)(v71 + 40);
      if (v38)
        v67 = &v38[*(_QWORD *)(v71 + 56)];
      else
        v67 = 0;
      while (v38 != v67)
      {
        v40 = *v38++;
        v39 = v40;
        if (v40)
        {
          v69 = v38;
          v41 = (char *)poolCopyString((uint64_t *)(v20 + 160), *(char **)v39);
          if (!v41)
            goto LABEL_24;
          v42 = lookup((uint64_t)parser, (uint64_t *)(v20 + 40), v41, 0x28uLL);
          if (!v42)
            goto LABEL_24;
          v43 = v42;
          v44 = *(int *)(v39 + 24);
          if ((_DWORD)v44)
          {
            v45 = (*(uint64_t (**)(uint64_t))(v18 + 24))(24 * v44);
            *((_QWORD *)v43 + 4) = v45;
            if (!v45)
              goto LABEL_24;
          }
          v46 = *(char ***)(v39 + 16);
          if (v46)
            *((_QWORD *)v43 + 2) = lookup((uint64_t)parser, (uint64_t *)(v20 + 80), *v46, 0);
          v47 = *(_DWORD *)(v39 + 24);
          *((_DWORD *)v43 + 6) = v47;
          *((_DWORD *)v43 + 7) = v47;
          v48 = *(char ***)(v39 + 8);
          if (v48)
          {
            *((_QWORD *)v43 + 1) = lookup((uint64_t)parser, (uint64_t *)(v20 + 120), *v48, 0);
            v47 = *((_DWORD *)v43 + 6);
          }
          v38 = v69;
          if (v47 >= 1)
          {
            v49 = 0;
            v50 = 0;
            do
            {
              v51 = lookup((uint64_t)parser, (uint64_t *)(v20 + 80), **(char ***)(*(_QWORD *)(v39 + 32) + v49), 0);
              v52 = *((_QWORD *)v43 + 4) + v49;
              *(_QWORD *)v52 = v51;
              v53 = *(_QWORD *)(v39 + 32) + v49;
              *(_BYTE *)(v52 + 8) = *(_BYTE *)(v53 + 8);
              v54 = *(char **)(v53 + 16);
              if (v54)
              {
                v55 = poolCopyString((uint64_t *)(v20 + 160), v54);
                *(_QWORD *)(*((_QWORD *)v43 + 4) + v49 + 16) = v55;
                if (!v55)
                  goto LABEL_24;
              }
              else
              {
                *(_QWORD *)(v52 + 16) = 0;
              }
              ++v50;
              v49 += 24;
            }
            while (v50 < *((int *)v43 + 6));
            v38 = v69;
          }
        }
      }
      if (!copyEntityTable((uint64_t)parser, (uint64_t *)v20, (uint64_t *)(v20 + 160), v71)
        || !copyEntityTable((uint64_t)parser, (uint64_t *)(v20 + 264), (uint64_t *)(v20 + 160), v71 + 264)
        || (*(_DWORD *)(v20 + 256) = *(_DWORD *)(v71 + 256),
            *(_BYTE *)(v20 + 320) = *(_BYTE *)(v71 + 320),
            *(_QWORD *)(v20 + 328) = *(_QWORD *)(v71 + 328),
            *(_QWORD *)(v20 + 336) = *(_QWORD *)(v71 + 336),
            *(_DWORD *)(v20 + 348) = *(_DWORD *)(v71 + 348),
            *(_QWORD *)(v20 + 352) = *(_QWORD *)(v71 + 352),
            !setContext(v18, context)))
      {
LABEL_24:
        XML_ParserFree((XML_Parser)v18);
        return 0;
      }
      v23 = externalEntityInitProcessor;
    }
    else
    {
      *(_BYTE *)(v17 + 928) = 1;
      XmlPrologStateInitExternalEntity((_QWORD *)(v17 + 512));
      v23 = externalParEntInitProcessor;
    }
    *(_QWORD *)(v18 + 544) = v23;
  }
  return (XML_Parser)v18;
}

uint64_t externalEntityInitProcessor(uint64_t a1, unint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t result;

  result = initializeEncoding(a1);
  if (!(_DWORD)result)
  {
    *(_QWORD *)(a1 + 544) = externalEntityInitProcessor2;
    return externalEntityInitProcessor2(a1, a2, a3, a4);
  }
  return result;
}

uint64_t externalParEntInitProcessor(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, unsigned __int8 **a4)
{
  uint64_t result;

  result = initializeEncoding(a1);
  if (!(_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 688) + 259) = 1;
    if (*(_DWORD *)(a1 + 536))
    {
      *(_QWORD *)(a1 + 544) = entityValueInitProcessor;
      return entityValueInitProcessor(a1, a2, (uint64_t)a3, a4);
    }
    else
    {
      *(_QWORD *)(a1 + 544) = externalParEntProcessor;
      return externalParEntProcessor(a1, a2, a3, a4);
    }
  }
  return result;
}

void XML_UseParserAsHandlerArg(XML_Parser parser)
{
  if (parser)
    *((_QWORD *)parser + 1) = parser;
}

XML_Error XML_UseForeignDTD(XML_Parser parser, XML_Bool useDTD)
{
  XML_Error result;

  if (!parser)
    return 41;
  if ((*((_DWORD *)parser + 230) | 2) == 3)
    return 26;
  result = XML_ERROR_NONE;
  *((_BYTE *)parser + 929) = useDTD;
  return result;
}

void XML_SetReturnNSTriplet(XML_Parser parser, int do_nst)
{
  if (parser)
  {
    if ((*((_DWORD *)parser + 230) | 2) != 3)
      *((_BYTE *)parser + 473) = do_nst != 0;
  }
}

XML_Status XML_SetBase(XML_Parser parser, const XML_Char *base)
{
  XML_Parser v2;

  if (parser)
  {
    v2 = parser;
    if (base)
    {
      parser = (XML_Parser)poolCopyString((uint64_t *)(*((_QWORD *)parser + 86) + 160), (char *)base);
      if (!parser)
        return parser;
    }
    else
    {
      parser = 0;
    }
    *((_QWORD *)v2 + 87) = parser;
    LODWORD(parser) = 1;
  }
  return parser;
}

const XML_Char *__cdecl XML_GetBase(const XML_Char *parser)
{
  if (parser)
    return (const XML_Char *)*((_QWORD *)parser + 87);
  return parser;
}

int XML_GetSpecifiedAttributeCount(XML_Parser parser)
{
  if (parser)
    return *((_DWORD *)parser + 185);
  else
    return -1;
}

int XML_GetIdAttributeIndex(XML_Parser parser)
{
  if (parser)
    return *((_DWORD *)parser + 186);
  else
    return -1;
}

void XML_SetStartElementHandler(XML_Parser parser, XML_StartElementHandler handler)
{
  if (parser)
    *((_QWORD *)parser + 15) = handler;
}

void XML_SetEndElementHandler(XML_Parser parser, XML_EndElementHandler handler)
{
  if (parser)
    *((_QWORD *)parser + 16) = handler;
}

void XML_SetStartCdataSectionHandler(XML_Parser parser, XML_StartCdataSectionHandler start)
{
  if (parser)
    *((_QWORD *)parser + 20) = start;
}

void XML_SetEndCdataSectionHandler(XML_Parser parser, XML_EndCdataSectionHandler end)
{
  if (parser)
    *((_QWORD *)parser + 21) = end;
}

void XML_SetDefaultHandler(XML_Parser parser, XML_DefaultHandler handler)
{
  if (parser)
  {
    *((_QWORD *)parser + 22) = handler;
    *((_BYTE *)parser + 600) = 0;
  }
}

void XML_SetDefaultHandlerExpand(XML_Parser parser, XML_DefaultHandler handler)
{
  if (parser)
  {
    *((_QWORD *)parser + 22) = handler;
    *((_BYTE *)parser + 600) = 1;
  }
}

void XML_SetDoctypeDeclHandler(XML_Parser parser, XML_StartDoctypeDeclHandler start, XML_EndDoctypeDeclHandler end)
{
  if (parser)
  {
    *((_QWORD *)parser + 23) = start;
    *((_QWORD *)parser + 24) = end;
  }
}

void XML_SetStartDoctypeDeclHandler(XML_Parser parser, XML_StartDoctypeDeclHandler start)
{
  if (parser)
    *((_QWORD *)parser + 23) = start;
}

void XML_SetEndDoctypeDeclHandler(XML_Parser parser, XML_EndDoctypeDeclHandler end)
{
  if (parser)
    *((_QWORD *)parser + 24) = end;
}

void XML_SetUnparsedEntityDeclHandler(XML_Parser parser, XML_UnparsedEntityDeclHandler handler)
{
  if (parser)
    *((_QWORD *)parser + 25) = handler;
}

void XML_SetNotationDeclHandler(XML_Parser parser, XML_NotationDeclHandler handler)
{
  if (parser)
    *((_QWORD *)parser + 26) = handler;
}

void XML_SetStartNamespaceDeclHandler(XML_Parser parser, XML_StartNamespaceDeclHandler start)
{
  if (parser)
    *((_QWORD *)parser + 27) = start;
}

void XML_SetEndNamespaceDeclHandler(XML_Parser parser, XML_EndNamespaceDeclHandler end)
{
  if (parser)
    *((_QWORD *)parser + 28) = end;
}

void XML_SetNotStandaloneHandler(XML_Parser parser, XML_NotStandaloneHandler handler)
{
  if (parser)
    *((_QWORD *)parser + 29) = handler;
}

void XML_SetExternalEntityRefHandler(XML_Parser parser, XML_ExternalEntityRefHandler handler)
{
  if (parser)
    *((_QWORD *)parser + 30) = handler;
}

void XML_SetExternalEntityRefHandlerArg(XML_Parser parser, void *arg)
{
  void *v2;

  if (parser)
  {
    if (arg)
      v2 = arg;
    else
      v2 = parser;
    *((_QWORD *)parser + 31) = v2;
  }
}

void XML_SetSkippedEntityHandler(XML_Parser parser, XML_SkippedEntityHandler handler)
{
  if (parser)
    *((_QWORD *)parser + 32) = handler;
}

void XML_SetUnknownEncodingHandler(XML_Parser parser, XML_UnknownEncodingHandler handler, void *encodingHandlerData)
{
  if (parser)
  {
    *((_QWORD *)parser + 33) = handler;
    *((_QWORD *)parser + 62) = encodingHandlerData;
  }
}

void XML_SetElementDeclHandler(XML_Parser parser, XML_ElementDeclHandler eldecl)
{
  if (parser)
    *((_QWORD *)parser + 34) = eldecl;
}

void XML_SetAttlistDeclHandler(XML_Parser parser, XML_AttlistDeclHandler attdecl)
{
  if (parser)
    *((_QWORD *)parser + 35) = attdecl;
}

void XML_SetEntityDeclHandler(XML_Parser parser, XML_EntityDeclHandler handler)
{
  if (parser)
    *((_QWORD *)parser + 36) = handler;
}

void XML_SetXmlDeclHandler(XML_Parser parser, XML_XmlDeclHandler xmldecl)
{
  if (parser)
    *((_QWORD *)parser + 37) = xmldecl;
}

int XML_SetParamEntityParsing(XML_Parser parser, XML_ParamEntityParsing parsing)
{
  if (parser)
  {
    if ((*((_DWORD *)parser + 230) | 2) == 3)
    {
      LODWORD(parser) = 0;
    }
    else
    {
      *((_DWORD *)parser + 233) = parsing;
      LODWORD(parser) = 1;
    }
  }
  return (int)parser;
}

int XML_SetHashSalt(XML_Parser parser, unint64_t hash_salt)
{
  XML_Parser v2;

  while (parser)
  {
    v2 = parser;
    parser = (XML_Parser)*((_QWORD *)parser + 114);
    if (!parser)
    {
      if ((*((_DWORD *)v2 + 230) | 2) == 3)
      {
        LODWORD(parser) = 0;
      }
      else
      {
        *((_QWORD *)v2 + 117) = hash_salt;
        LODWORD(parser) = 1;
      }
      return (int)parser;
    }
  }
  return (int)parser;
}

uint64_t callProcessor(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  BOOL v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  BOOL v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;

  if (a3)
    v7 = a2 == 0;
  else
    v7 = 1;
  if (v7)
    v8 = 0;
  else
    v8 = a3 - a2;
  if (!*(_BYTE *)(a1 + 96) || *(_BYTE *)(a1 + 924))
    goto LABEL_19;
  v9 = *(_QWORD *)(a1 + 48);
  if (v9)
  {
    v10 = *(_QWORD *)(a1 + 16);
    v9 -= v10;
    if (!v10)
      v9 = 0;
  }
  v11 = v9 >= 0x400;
  v12 = v9 - 1024;
  if (!v11)
    v12 = 0;
  v13 = *(_QWORD *)(a1 + 64);
  if (v13)
  {
    v14 = *(_QWORD *)(a1 + 56);
    v13 -= v14;
    if (!v14)
      v13 = 0;
  }
  if (v8 < 2 * *(_QWORD *)(a1 + 88) && v13 + v12 >= *(int *)(a1 + 100))
  {
    result = 0;
    *a4 = a2;
  }
  else
  {
LABEL_19:
    result = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 544))(a1, a2);
    if (!(_DWORD)result)
    {
      result = 0;
      if (*a4 == a2)
        *(_QWORD *)(a1 + 88) = v8;
      else
        *(_QWORD *)(a1 + 88) = 0;
    }
  }
  return result;
}

uint64_t errorProcessor(uint64_t a1)
{
  return *(unsigned int *)(a1 + 552);
}

XML_Status XML_StopParser(XML_Parser parser, XML_Bool resumable)
{
  int v2;
  XML_Status v3;
  int v4;
  int v5;

  if (parser)
  {
    v2 = *((_DWORD *)parser + 230);
    if (v2 == 2)
    {
      v3 = XML_STATUS_ERROR;
      v4 = 36;
      goto LABEL_11;
    }
    if (v2 == 3)
    {
      if (resumable)
      {
        v3 = XML_STATUS_ERROR;
        v4 = 33;
LABEL_11:
        *((_DWORD *)parser + 138) = v4;
        return v3;
      }
    }
    else if (resumable)
    {
      if (*((_BYTE *)parser + 928))
      {
        v3 = XML_STATUS_ERROR;
        v4 = 37;
        goto LABEL_11;
      }
      v5 = 3;
LABEL_14:
      *((_DWORD *)parser + 230) = v5;
      return 1;
    }
    v5 = 2;
    goto LABEL_14;
  }
  return 0;
}

XML_Status XML_ResumeParser(XML_Parser parser)
{
  int v2;
  XML_Status v3;
  unsigned int v4;

  if (!parser)
    return 0;
  if (*((_DWORD *)parser + 230) == 3)
  {
    *((_DWORD *)parser + 230) = 1;
    v2 = callProcessor((uint64_t)parser, *((_QWORD *)parser + 6), *((_QWORD *)parser + 10), (_QWORD *)parser + 6);
    *((_DWORD *)parser + 138) = v2;
    if (!v2)
    {
      v4 = *((_DWORD *)parser + 230);
      if (v4 >= 2)
      {
        if (v4 == 3)
          v3 = XML_STATUS_SUSPENDED;
        else
          v3 = XML_STATUS_OK;
      }
      else
      {
        if (*((_BYTE *)parser + 924))
        {
          *((_DWORD *)parser + 230) = 2;
          return 1;
        }
        v3 = XML_STATUS_OK;
      }
      (*(void (**)(void))(*((_QWORD *)parser + 38) + 96))();
      *((_QWORD *)parser + 72) = *((_QWORD *)parser + 6);
      return v3;
    }
    v3 = XML_STATUS_ERROR;
    *((_QWORD *)parser + 71) = *((_QWORD *)parser + 70);
    *((_QWORD *)parser + 68) = errorProcessor;
  }
  else
  {
    v3 = XML_STATUS_ERROR;
    *((_DWORD *)parser + 138) = 34;
  }
  return v3;
}

void XML_GetParsingStatus(XML_Parser parser, XML_ParsingStatus *status)
{
  if (parser)
  {
    if (!status)
      XML_GetParsingStatus_cold_1();
    *status = *(XML_ParsingStatus *)((char *)parser + 920);
  }
}

XML_Error XML_GetErrorCode(XML_Parser parser)
{
  if (parser)
    return *((_DWORD *)parser + 138);
  else
    return 41;
}

XML_Index XML_GetCurrentByteIndex(XML_Parser parser)
{
  uint64_t v1;

  if (parser && (v1 = *((_QWORD *)parser + 70)) != 0)
    return *((_QWORD *)parser + 9) + v1 - *((_QWORD *)parser + 10);
  else
    return -1;
}

int XML_GetCurrentByteCount(XML_Parser parser)
{
  uint64_t v1;
  uint64_t v2;
  int v3;

  if (parser)
  {
    v1 = *((_QWORD *)parser + 71);
    if (v1)
    {
      v2 = *((_QWORD *)parser + 70);
      v3 = v1 - v2;
      if (v2)
        LODWORD(parser) = v3;
      else
        LODWORD(parser) = 0;
    }
    else
    {
      LODWORD(parser) = 0;
    }
  }
  return (int)parser;
}

const char *__cdecl XML_GetInputContext(const char *parser, int *offset, int *size)
{
  const char *v3;
  uint64_t v4;

  if (parser)
  {
    v3 = parser;
    v4 = *((_QWORD *)parser + 70);
    if (v4)
    {
      parser = (const char *)*((_QWORD *)parser + 2);
      if (parser)
      {
        if (offset)
          *offset = v4 - (_DWORD)parser;
        if (size)
          *size = *((_DWORD *)v3 + 14) - (_DWORD)parser;
      }
    }
    else
    {
      return 0;
    }
  }
  return parser;
}

XML_Size XML_GetCurrentLineNumber(XML_Size parser)
{
  _QWORD *v1;
  unint64_t v2;

  if (parser)
  {
    v1 = (_QWORD *)parser;
    v2 = *(_QWORD *)(parser + 560);
    if (v2)
    {
      if (v2 >= *(_QWORD *)(parser + 576))
      {
        (*(void (**)(void))(*(_QWORD *)(parser + 304) + 96))();
        v1[72] = v1[70];
      }
    }
    return v1[98] + 1;
  }
  return parser;
}

XML_Size XML_GetCurrentColumnNumber(XML_Size parser)
{
  _QWORD *v1;
  unint64_t v2;

  if (parser)
  {
    v1 = (_QWORD *)parser;
    v2 = *(_QWORD *)(parser + 560);
    if (v2)
    {
      if (v2 >= *(_QWORD *)(parser + 576))
      {
        (*(void (**)(void))(*(_QWORD *)(parser + 304) + 96))();
        v1[72] = v1[70];
      }
    }
    return v1[99];
  }
  return parser;
}

void XML_FreeContentModel(XML_Parser parser, XML_Content *model)
{
  if (parser)
    (*((void (**)(XML_Content *))parser + 5))(model);
}

void *__cdecl XML_MemMalloc(void *parser, size_t size)
{
  if (parser)
    return (void *)(*((uint64_t (**)(size_t))parser + 3))(size);
  return parser;
}

void *__cdecl XML_MemRealloc(void *parser, void *ptr, size_t size)
{
  if (parser)
    return (void *)(*((uint64_t (**)(void *, size_t))parser + 4))(ptr, size);
  return parser;
}

void XML_MemFree(XML_Parser parser, void *ptr)
{
  if (parser)
    (*((void (**)(void *))parser + 5))(ptr);
}

void XML_DefaultCurrent(XML_Parser parser)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (parser && *((_QWORD *)parser + 22))
  {
    v1 = (uint64_t *)*((_QWORD *)parser + 73);
    if (v1)
    {
      v2 = *((_QWORD *)parser + 57);
      v3 = *v1;
      v4 = v1[1];
    }
    else
    {
      v2 = *((_QWORD *)parser + 38);
      v3 = *((_QWORD *)parser + 70);
      v4 = *((_QWORD *)parser + 71);
    }
    reportDefault((uint64_t)parser, v2, v3, v4);
  }
}

const XML_LChar *__cdecl XML_ErrorString(XML_Error code)
{
  if (code - 1 > 0x2A)
    return 0;
  else
    return off_24E060A08[code - 1];
}

const XML_LChar *XML_ExpatVersion(void)
{
  return "expat_2.6.1";
}

XML_Expat_Version XML_ExpatVersionInfo(void)
{
  uint64_t v0;
  int v1;
  XML_Expat_Version result;

  v0 = 0x600000002;
  v1 = 1;
  result.major = v0;
  result.minor = HIDWORD(v0);
  result.micro = v1;
  return result;
}

const XML_Feature *XML_GetFeatureList(void)
{
  return (const XML_Feature *)&XML_GetFeatureList_features;
}

uint64_t XML_SetBillionLaughsAttackProtectionMaximumAmplification(uint64_t result, float a2)
{
  if (result)
  {
    if (*(_QWORD *)(result + 912) || a2 < 1.0)
    {
      return 0;
    }
    else
    {
      *(float *)(result + 968) = a2;
      return 1;
    }
  }
  return result;
}

uint64_t XML_SetBillionLaughsAttackProtectionActivationThreshold(uint64_t result, uint64_t a2)
{
  if (result)
  {
    if (*(_QWORD *)(result + 912))
    {
      return 0;
    }
    else
    {
      *(_QWORD *)(result + 976) = a2;
      return 1;
    }
  }
  return result;
}

uint64_t XML_SetReparseDeferralEnabled(uint64_t a1, unsigned int a2)
{
  uint64_t result;

  result = 0;
  if (a1)
  {
    if (a2 <= 1)
    {
      *(_BYTE *)(a1 + 96) = a2;
      return 1;
    }
  }
  return result;
}

uint64_t testingAccountingGetCountBytesDirect(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 944);
  return result;
}

uint64_t testingAccountingGetCountBytesIndirect(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 952);
  return result;
}

char *unsignedCharToPrintable(int a1)
{
  return off_24E060B60[a1 ^ 0x80u];
}

uint64_t handleUnknownEncoding(uint64_t a1, uint64_t a2)
{
  unsigned int (*v2)(_QWORD, uint64_t, _BYTE *);
  uint64_t (*v5)(_QWORD);
  int v6;
  uint64_t v7;
  uint64_t (*v8)(void);
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  _BYTE __b[1024];
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);

  v2 = *(unsigned int (**)(_QWORD, uint64_t, _BYTE *))(a1 + 264);
  if (!v2)
    return 18;
  memset(__b, 255, sizeof(__b));
  v13 = 0;
  v15 = 0;
  v14 = 0;
  if (!v2(*(_QWORD *)(a1 + 496), a2, __b))
  {
LABEL_9:
    if (v15)
      v15(v13);
    return 18;
  }
  v5 = *(uint64_t (**)(_QWORD))(a1 + 24);
  v6 = XmlSizeOfUnknownEncoding();
  v7 = v5(v6);
  *(_QWORD *)(a1 + 480) = v7;
  if (v7)
  {
    if (*(_BYTE *)(a1 + 472))
      v8 = (uint64_t (*)(void))XmlInitUnknownEncodingNS;
    else
      v8 = (uint64_t (*)(void))XmlInitUnknownEncoding;
    v9 = v8();
    if (v9)
    {
      v10 = v9;
      result = 0;
      *(_QWORD *)(a1 + 488) = v13;
      *(_QWORD *)(a1 + 504) = v15;
      *(_QWORD *)(a1 + 304) = v10;
      return result;
    }
    goto LABEL_9;
  }
  if (v15)
    v15(v13);
  return 1;
}

uint64_t processXmlDecl(uint64_t a1, uint64_t a2, unsigned __int8 *a3, unint64_t a4)
{
  uint64_t (*v8)(int, uint64_t, uint64_t, uint64_t, uint64_t *, uint64_t *, uint64_t *, uint64_t *, uint64_t *, int *);
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v30 = 0;
  v31 = 0;
  v28 = 0;
  v29 = 0;
  v27 = -1;
  if (!accountingDiffTolerated(a1, 12, a3, a4, 4356, 0))
  {
    accountingReportStats((_QWORD *)a1, " ABORTING\n");
    return 43;
  }
  if (*(_BYTE *)(a1 + 472))
    v8 = XmlParseXmlDeclNS;
  else
    v8 = XmlParseXmlDecl;
  v9 = (uint64_t *)(a1 + 560);
  if (!v8(a2, *(_QWORD *)(a1 + 304), (uint64_t)a3, a4, (uint64_t *)(a1 + 560), &v29, &v28, &v31, &v30, (int *)&v27))
  {
    if ((_DWORD)a2)
      return 31;
    else
      return 30;
  }
  if (!(_DWORD)a2 && v27 == 1)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 688) + 258) = 1;
    if (*(_DWORD *)(a1 + 932) == 1)
      *(_DWORD *)(a1 + 932) = 0;
  }
  if (*(_QWORD *)(a1 + 296))
  {
    v10 = v31;
    if (v31)
    {
      v11 = *(_QWORD *)(a1 + 304);
      v12 = (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 56))(v11, v31);
      v13 = poolStoreString((uint64_t *)(a1 + 848), v11, v10, v10 + v12);
      if (!v13)
        return 1;
      v10 = v13;
      *(_QWORD *)(a1 + 880) = *(_QWORD *)(a1 + 872);
    }
    if (v29)
    {
      v14 = poolStoreString((uint64_t *)(a1 + 848), *(_QWORD *)(a1 + 304), v29, v28 - *(int *)(*(_QWORD *)(a1 + 304) + 128));
      if (!v14)
        return 1;
    }
    else
    {
      v14 = 0;
    }
    (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(a1 + 296))(*(_QWORD *)(a1 + 8), v14, v10, v27);
  }
  else
  {
    if (*(_QWORD *)(a1 + 176))
      reportDefault(a1, *(_QWORD *)(a1 + 304), (uint64_t)a3, a4);
    v10 = 0;
    v14 = 0;
  }
  if (*(_QWORD *)(a1 + 464))
    goto LABEL_27;
  if (v30)
  {
    v19 = *(_DWORD *)(v30 + 128);
    v20 = *(_QWORD *)(a1 + 304);
    if (v19 != *(_DWORD *)(v20 + 128) || v19 == 2 && v30 != v20)
    {
      *v9 = v31;
      return 19;
    }
    *(_QWORD *)(a1 + 304) = v30;
LABEL_27:
    if (!(v10 | v14))
      return 0;
    v16 = *(_QWORD **)(a1 + 856);
    v17 = *(_QWORD **)(a1 + 848);
    if (v16)
    {
      if (!v17)
      {
LABEL_47:
        result = 0;
        *(_QWORD *)(a1 + 848) = 0;
        *(_QWORD *)(a1 + 864) = 0;
        *(_QWORD *)(a1 + 880) = 0;
        *(_QWORD *)(a1 + 872) = 0;
        return result;
      }
      do
      {
        v18 = v17;
        v17 = (_QWORD *)*v17;
        *v18 = v16;
        v16 = v18;
      }
      while (v17);
    }
    else
    {
      v18 = *(_QWORD **)(a1 + 848);
    }
    *(_QWORD *)(a1 + 856) = v18;
    goto LABEL_47;
  }
  v21 = v31;
  if (!v31)
    goto LABEL_27;
  if (!v10)
  {
    v22 = *(_QWORD *)(a1 + 304);
    v23 = (*(uint64_t (**)(uint64_t, uint64_t))(v22 + 56))(v22, v31);
    v10 = poolStoreString((uint64_t *)(a1 + 848), v22, v21, v21 + v23);
    if (!v10)
      return 1;
  }
  result = handleUnknownEncoding(a1, v10);
  v24 = *(_QWORD **)(a1 + 856);
  v25 = *(_QWORD **)(a1 + 848);
  if (v24)
  {
    if (!v25)
      goto LABEL_52;
    do
    {
      v26 = v25;
      v25 = (_QWORD *)*v25;
      *v26 = v24;
      v24 = v26;
    }
    while (v25);
  }
  else
  {
    v26 = *(_QWORD **)(a1 + 848);
  }
  *(_QWORD *)(a1 + 856) = v26;
LABEL_52:
  *(_QWORD *)(a1 + 848) = 0;
  *(_QWORD *)(a1 + 864) = 0;
  *(_QWORD *)(a1 + 880) = 0;
  *(_QWORD *)(a1 + 872) = 0;
  if ((_DWORD)result == 18)
    *v9 = v31;
  return result;
}

_BYTE *normalizePublicId(_BYTE *result)
{
  int v1;
  uint64_t v2;
  _BYTE *v3;
  _BYTE *v4;

  LOBYTE(v1) = *result;
  if (!*result)
    goto LABEL_15;
  v2 = 1;
  v3 = result;
  do
  {
    v4 = v3;
    if ((char)v1 > 0x20 || ((1 << v1) & 0x100002400) == 0)
      goto LABEL_8;
    v3 = result;
    if (v4 == result)
      goto LABEL_10;
    if (*(v4 - 1) != 32)
    {
      LOBYTE(v1) = 32;
LABEL_8:
      *v4++ = v1;
    }
    v3 = v4;
LABEL_10:
    v1 = result[v2++];
  }
  while (v1);
  if (v3 != result)
  {
    if (*(v3 - 1) == 32)
      result = v3 - 1;
    else
      result = v3;
  }
LABEL_15:
  *result = 0;
  return result;
}

_OWORD *getElementType(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v5;
  char *v6;
  char *v7;
  _OWORD *v8;
  _OWORD *v9;

  v5 = *(uint64_t **)(a1 + 688);
  v6 = (char *)poolStoreString(v5 + 20, a2, a3, a4);
  if (!v6)
    return 0;
  v7 = v6;
  v8 = lookup(a1, v5 + 5, v6, 0x28uLL);
  v9 = v8;
  if (v8)
  {
    if (*(char **)v8 != v7)
    {
      v5[23] = v5[24];
      return v9;
    }
    v5[24] = v5[23];
    if (setElementTypePrefix(a1, (uint64_t)v8))
      return v9;
    return 0;
  }
  return v9;
}

uint64_t defineAttribute(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6)
{
  int v10;
  _QWORD *v11;
  uint64_t v12;
  int v13;
  uint64_t result;
  int v15;
  uint64_t v16;

  v10 = *(_DWORD *)(a1 + 24);
  if (a4 || a5)
  {
    if (v10 >= 1)
    {
      v11 = *(_QWORD **)(a1 + 32);
      v12 = *(unsigned int *)(a1 + 24);
      while (*v11 != a2)
      {
        v11 += 3;
        if (!--v12)
          goto LABEL_7;
      }
      return 1;
    }
LABEL_7:
    if (a4 && !*(_QWORD *)(a1 + 16) && !*(_BYTE *)(a2 + 17))
      *(_QWORD *)(a1 + 16) = a2;
  }
  if (v10 != *(_DWORD *)(a1 + 28))
  {
    result = *(_QWORD *)(a1 + 32);
LABEL_16:
    v15 = *(_DWORD *)(a1 + 24);
    v16 = result + 24 * v15;
    *(_QWORD *)v16 = a2;
    *(_QWORD *)(v16 + 16) = a5;
    *(_BYTE *)(v16 + 8) = a3;
    if (!a3)
      *(_BYTE *)(a2 + 16) = 1;
    *(_DWORD *)(a1 + 24) = v15 + 1;
    return 1;
  }
  v13 = v10;
  if (!v10)
  {
    *(_DWORD *)(a1 + 28) = 8;
    result = (*(uint64_t (**)(uint64_t))(a6 + 24))(192);
    *(_QWORD *)(a1 + 32) = result;
    if (!result)
    {
      *(_DWORD *)(a1 + 28) = 0;
      return result;
    }
    goto LABEL_16;
  }
  if (v10 > 0x3FFFFFFF)
    return 0;
  result = (*(uint64_t (**)(_QWORD, uint64_t))(a6 + 32))(*(_QWORD *)(a1 + 32), 48 * v10);
  if (result)
  {
    *(_DWORD *)(a1 + 28) = 2 * v13;
    *(_QWORD *)(a1 + 32) = result;
    goto LABEL_16;
  }
  return result;
}

uint64_t storeEntityValue(uint64_t a1, uint64_t a2, unsigned __int8 *a3, uint64_t a4, int a5)
{
  _QWORD *v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  _BYTE *v17;
  unsigned int v18;
  int v19;
  uint64_t v20;
  char *v21;
  _BYTE *v22;
  char v23;
  _BYTE v25[4];
  unint64_t v26;

  v10 = *(_QWORD **)(a1 + 688);
  v12 = v10[26];
  v11 = v10 + 26;
  v13 = *(_DWORD *)(a1 + 536);
  *(_DWORD *)(a1 + 536) = 1;
  if (!v12 && !poolGrow(v11))
    return 1;
  while (2)
  {
    v26 = (unint64_t)a3;
    v14 = (*(uint64_t (**)(uint64_t, unsigned __int8 *, uint64_t, unint64_t *))(a2 + 40))(a2, a3, a4, &v26);
    if (!accountingDiffTolerated(a1, v14, a3, v26, 6211, a5))
    {
      accountingReportStats((_QWORD *)a1, " ABORTING\n");
      v16 = 43;
      goto LABEL_35;
    }
    v15 = v14 + 4;
    v16 = 0;
    switch(v15)
    {
      case 0:
        goto LABEL_35;
      case 1:
        v26 = (unint64_t)&a3[*(int *)(a2 + 128)];
        goto LABEL_8;
      case 3:
        if (*(_QWORD *)(a1 + 304) == a2)
          *(_QWORD *)(a1 + 560) = a3;
        goto LABEL_31;
      case 4:
        if (*(_QWORD *)(a1 + 304) == a2)
          *(_QWORD *)(a1 + 560) = v26;
LABEL_31:
        v16 = 4;
        goto LABEL_35;
      case 10:
      case 13:
        if (!poolAppend(v11, a2, (uint64_t)a3, v26))
          goto LABEL_21;
        goto LABEL_12;
      case 11:
LABEL_8:
        v17 = (_BYTE *)v10[29];
        if ((_BYTE *)v10[28] != v17)
          goto LABEL_11;
        if (!poolGrow(v11))
          goto LABEL_21;
        v17 = (_BYTE *)v10[29];
LABEL_11:
        v10[29] = v17 + 1;
        *v17 = 10;
        goto LABEL_12;
      case 14:
        v18 = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(a2 + 80))(a2, a3);
        if ((v18 & 0x80000000) == 0)
        {
          v19 = XmlUtf8Encode(v18, v25);
          if (v19 >= 1)
          {
            v20 = v19;
            v21 = v25;
            do
            {
              v22 = (_BYTE *)v10[29];
              if ((_BYTE *)v10[28] == v22)
              {
                if (!poolGrow(v11))
                {
LABEL_21:
                  v16 = 1;
                  goto LABEL_35;
                }
                v22 = (_BYTE *)v10[29];
              }
              v23 = *v21++;
              v10[29] = v22 + 1;
              *v22 = v23;
              --v20;
            }
            while (v20);
          }
LABEL_12:
          a3 = (unsigned __int8 *)v26;
          continue;
        }
        if (*(_QWORD *)(a1 + 304) == a2)
          *(_QWORD *)(a1 + 560) = a3;
        v16 = 14;
LABEL_35:
        *(_DWORD *)(a1 + 536) = v13;
        return v16;
      default:
        if (*(_QWORD *)(a1 + 304) == a2)
          *(_QWORD *)(a1 + 560) = a3;
        v16 = 23;
        goto LABEL_35;
    }
  }
}

uint64_t doIgnoreSection(uint64_t a1, uint64_t a2, unsigned __int8 **a3, uint64_t a4, _QWORD *a5, int a6)
{
  unsigned __int8 *v11;
  _QWORD *v12;
  unsigned __int8 **v13;
  int v14;
  uint64_t v15;
  uint64_t result;
  unsigned __int8 *v17;

  v11 = *a3;
  v17 = *a3;
  if (*(_QWORD *)(a1 + 304) == a2)
  {
    v12 = (_QWORD *)(a1 + 560);
    *(_QWORD *)(a1 + 560) = v11;
    v13 = (unsigned __int8 **)(a1 + 568);
  }
  else
  {
    v12 = *(_QWORD **)(a1 + 584);
    v13 = (unsigned __int8 **)(v12 + 1);
  }
  *v12 = v11;
  *a3 = 0;
  v14 = (*(uint64_t (**)(uint64_t, unsigned __int8 *, uint64_t, unsigned __int8 **))(a2 + 24))(a2, v11, a4, &v17);
  if (accountingDiffTolerated(a1, v14, v11, (unint64_t)v17, 4264, 0))
  {
    v15 = (uint64_t)v17;
    *v13 = v17;
    switch(v14)
    {
      case -4:
      case -1:
        if (a6)
          goto LABEL_17;
        result = 2;
        break;
      case -3:
        goto LABEL_15;
      case -2:
        if (a6)
        {
LABEL_17:
          result = 0;
          *a5 = v11;
        }
        else
        {
          result = 6;
        }
        break;
      case 0:
        *v12 = v15;
        result = 4;
        break;
      default:
        if (v14 == 42)
        {
          if (*(_QWORD *)(a1 + 176))
          {
            reportDefault(a1, a2, (uint64_t)v11, v15);
            v15 = (uint64_t)v17;
          }
          *a3 = (unsigned __int8 *)v15;
          *a5 = v15;
          if (*(_DWORD *)(a1 + 920) == 2)
            result = 35;
          else
            result = 0;
        }
        else
        {
LABEL_15:
          *v12 = v15;
          result = 23;
        }
        break;
    }
  }
  else
  {
    accountingReportStats((_QWORD *)a1, " ABORTING\n");
    return 43;
  }
  return result;
}

uint64_t ignoreSectionProcessor(uint64_t a1, unsigned __int8 *a2, uint64_t a3, _QWORD *a4)
{
  uint64_t result;
  unsigned __int8 *v8;
  unsigned __int8 *v9;

  v9 = a2;
  result = doIgnoreSection(a1, *(_QWORD *)(a1 + 304), &v9, a3, a4, *(_BYTE *)(a1 + 924) == 0);
  if (!(_DWORD)result)
  {
    v8 = v9;
    if (v9)
    {
      *(_QWORD *)(a1 + 544) = prologProcessor;
      return prologProcessor(a1, v8, a3, a4);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t nextScaffoldPart(uint64_t a1)
{
  uint64_t v2;
  _DWORD *v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _DWORD *v11;
  uint64_t v12;
  _DWORD *v13;
  int v14;
  int v15;
  uint64_t v16;

  v2 = *(_QWORD *)(a1 + 688);
  if (!*(_QWORD *)(v2 + 352))
  {
    v3 = (_DWORD *)(*(uint64_t (**)(uint64_t))(a1 + 24))(4 * *(unsigned int *)(a1 + 904));
    *(_QWORD *)(v2 + 352) = v3;
    if (!v3)
      return 0xFFFFFFFFLL;
    *v3 = 0;
  }
  v4 = *(unsigned int *)(v2 + 344);
  v5 = *(_DWORD *)(v2 + 340);
  v6 = *(_QWORD *)(v2 + 328);
  if (v4 >= v5)
  {
    if (v6)
    {
      if ((v5 & 0x80000000) == 0)
      {
        v6 = (*(uint64_t (**)(void))(a1 + 32))();
        if (v6)
        {
          v7 = 2 * *(_DWORD *)(v2 + 340);
LABEL_11:
          *(_DWORD *)(v2 + 340) = v7;
          *(_QWORD *)(v2 + 328) = v6;
          v4 = *(unsigned int *)(v2 + 344);
          goto LABEL_12;
        }
      }
    }
    else
    {
      v6 = (*(uint64_t (**)(uint64_t))(a1 + 24))(1024);
      if (v6)
      {
        v7 = 32;
        goto LABEL_11;
      }
    }
    return 0xFFFFFFFFLL;
  }
LABEL_12:
  *(_DWORD *)(v2 + 344) = v4 + 1;
  v8 = *(_DWORD *)(v2 + 348);
  if (v8)
  {
    v9 = *(int *)(*(_QWORD *)(v2 + 352) + 4 * (v8 - 1));
    v10 = v6 + 32 * v9;
    v11 = (_DWORD *)(v10 + 20);
    v12 = *(int *)(v10 + 20);
    if ((_DWORD)v12)
      *(_DWORD *)(v6 + 32 * v12 + 28) = v4;
    v15 = *(_DWORD *)(v10 + 24);
    v13 = (_DWORD *)(v10 + 24);
    v14 = v15;
    if (!v15)
      *(_DWORD *)(v6 + 32 * v9 + 16) = v4;
    *v11 = v4;
    *v13 = v14 + 1;
  }
  v16 = v6 + 32 * (int)v4;
  *(_QWORD *)(v16 + 16) = 0;
  *(_QWORD *)(v16 + 24) = 0;
  return v4;
}

uint64_t processInternalEntity(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (**v11)(_QWORD, uint64_t, uint64_t, uint64_t *);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = *(_QWORD *)(a1 + 592);
  if (v6)
  {
    *(_QWORD *)(a1 + 592) = *(_QWORD *)(v6 + 16);
  }
  else
  {
    v6 = (*(uint64_t (**)(uint64_t))(a1 + 24))(40);
    if (!v6)
      return 1;
  }
  *(_BYTE *)(a2 + 56) = 1;
  entityTrackingOnOpen(a1, a2, 5834);
  *(_DWORD *)(a2 + 20) = 0;
  v7 = *(_QWORD *)(a1 + 584);
  *(_QWORD *)(a1 + 584) = v6;
  *(_QWORD *)(v6 + 16) = v7;
  *(_QWORD *)(v6 + 24) = a2;
  v8 = *(unsigned int *)(a1 + 604);
  *(_DWORD *)(v6 + 32) = v8;
  *(_BYTE *)(v6 + 36) = a3;
  *(_QWORD *)v6 = 0;
  *(_QWORD *)(v6 + 8) = 0;
  v9 = *(_QWORD *)(a2 + 8);
  v10 = v9 + *(int *)(a2 + 16);
  v16 = v9;
  v11 = *(uint64_t (***)(_QWORD, uint64_t, uint64_t, uint64_t *))(a1 + 456);
  if (*(_BYTE *)(a2 + 57))
  {
    v12 = (*v11)(*(_QWORD *)(a1 + 456), v9, v10, &v16);
    result = doProlog(a1, *(_QWORD *)(a1 + 456), v9, v10, v12, v16, &v16, 0, 0);
    if ((_DWORD)result)
      return result;
  }
  else
  {
    result = doContent(a1, v8, v11, v9, v10, &v16, 0, 1);
    if ((_DWORD)result)
      return result;
  }
  if (v10 == v16 || *(_DWORD *)(a1 + 920) != 3)
  {
    if (*(_QWORD *)(*(_QWORD *)(a1 + 584) + 24) == a2)
    {
      v14 = a1;
      do
      {
        v15 = v14;
        v14 = *(_QWORD *)(v14 + 912);
      }
      while (v14);
      entityTrackingReportStats(v15, a2, "CLOSE", 5868);
      result = 0;
      --*(_DWORD *)(v15 + 988);
      *(_BYTE *)(a2 + 56) = 0;
      *(_QWORD *)(a1 + 584) = *(_QWORD *)(v6 + 16);
      *(_QWORD *)(v6 + 16) = *(_QWORD *)(a1 + 592);
      *(_QWORD *)(a1 + 592) = v6;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    result = 0;
    *(_DWORD *)(a2 + 20) = v16 - v9;
    *(_QWORD *)(a1 + 544) = internalEntityProcessor;
  }
  return result;
}

uint64_t entityTrackingOnOpen(uint64_t a1, uint64_t a2, int a3)
{
  _DWORD *v4;
  unsigned int v5;
  unsigned int v6;

  do
  {
    v4 = (_DWORD *)a1;
    a1 = *(_QWORD *)(a1 + 912);
  }
  while (a1);
  ++v4[246];
  v5 = v4[247] + 1;
  v4[247] = v5;
  v6 = v4[248];
  if (v5 > v6)
    v4[248] = v6 + 1;
  return entityTrackingReportStats((uint64_t)v4, a2, "OPEN ", a3);
}

uint64_t reportComment(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;

  if (*(_QWORD *)(a1 + 152))
  {
    result = poolStoreString((uint64_t *)(a1 + 800), a2, a3 + 4 * *(int *)(a2 + 128), a4 - 3 * *(int *)(a2 + 128));
    if (!result)
      return result;
    v6 = result;
    normalizeLines((_BYTE *)result);
    (*(void (**)(_QWORD, uint64_t))(a1 + 152))(*(_QWORD *)(a1 + 8), v6);
    v7 = *(_QWORD **)(a1 + 808);
    v8 = *(_QWORD **)(a1 + 800);
    if (v7)
    {
      if (!v8)
      {
LABEL_12:
        *(_QWORD *)(a1 + 800) = 0;
        *(_QWORD *)(a1 + 816) = 0;
        *(_QWORD *)(a1 + 832) = 0;
        result = 1;
        *(_QWORD *)(a1 + 824) = 0;
        return result;
      }
      do
      {
        v9 = v8;
        v8 = (_QWORD *)*v8;
        *v9 = v7;
        v7 = v9;
      }
      while (v8);
    }
    else
    {
      v9 = *(_QWORD **)(a1 + 800);
    }
    *(_QWORD *)(a1 + 808) = v9;
    goto LABEL_12;
  }
  if (*(_QWORD *)(a1 + 176))
    reportDefault(a1, a2, a3, a4);
  return 1;
}

_QWORD *accountingReportStats(_QWORD *result, const char *a2)
{
  _QWORD *v3;
  float CurrentAmplification;

  do
  {
    v3 = result;
    result = (_QWORD *)result[114];
  }
  while (result);
  if (v3[120])
  {
    CurrentAmplification = accountingGetCurrentAmplification(v3);
    return (_QWORD *)fprintf((FILE *)*MEMORY[0x24BDAC8D8], "expat: Accounting(%p): Direct %10llu, indirect %10llu, amplification %8.2f%s", v3, v3[118], v3[119], CurrentAmplification, a2);
  }
  return result;
}

uint64_t getContext(uint64_t a1)
{
  uint64_t v2;
  _BYTE *v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t i;
  _BYTE *v7;
  char v8;
  char ***v9;
  char ***v10;
  char ***v11;
  char **v12;
  char **v13;
  _BYTE *v14;
  char v15;
  unsigned __int8 *v16;
  _BYTE *v17;
  int v18;
  uint64_t v19;
  uint64_t j;
  _BYTE *v21;
  char v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD *v25;
  _BYTE *v26;
  _BYTE *v27;
  _BYTE *v28;
  char v29;
  unsigned __int8 *v30;
  _BYTE *v31;
  int v32;
  _BYTE *v33;

  v2 = *(_QWORD *)(a1 + 688);
  v3 = *(_BYTE **)(v2 + 312);
  if (v3)
  {
    v4 = *(_BYTE **)(a1 + 824);
    if (v4 == *(_BYTE **)(a1 + 816))
    {
      if (!poolGrow((uint64_t *)(a1 + 800)))
        return 0;
      v4 = *(_BYTE **)(a1 + 824);
    }
    *(_QWORD *)(a1 + 824) = v4 + 1;
    *v4 = 61;
    v5 = *(_DWORD *)(*(_QWORD *)(v2 + 312) + 40) - (*(_BYTE *)(a1 + 908) != 0);
    if ((int)v5 >= 1)
    {
      for (i = 0; i != v5; ++i)
      {
        v7 = *(_BYTE **)(a1 + 824);
        if (v7 == *(_BYTE **)(a1 + 816))
        {
          if (!poolGrow((uint64_t *)(a1 + 800)))
            return 0;
          v7 = *(_BYTE **)(a1 + 824);
        }
        v8 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v2 + 312) + 32) + i);
        *(_QWORD *)(a1 + 824) = v7 + 1;
        *v7 = v8;
      }
    }
    LODWORD(v3) = 1;
  }
  v9 = *(char ****)(v2 + 120);
  if (v9)
    v10 = &v9[*(_QWORD *)(v2 + 136)];
  else
    v10 = 0;
  while (v9 != v10)
  {
    v11 = v9;
    v13 = *v9++;
    v12 = v13;
    if (v13 && v12[1])
    {
      if ((_DWORD)v3)
      {
        v14 = *(_BYTE **)(a1 + 824);
        if (v14 == *(_BYTE **)(a1 + 816))
        {
          if (!poolGrow((uint64_t *)(a1 + 800)))
            return 0;
          v14 = *(_BYTE **)(a1 + 824);
        }
        *(_QWORD *)(a1 + 824) = v14 + 1;
        *v14 = 12;
      }
      v15 = **v12;
      if (v15)
      {
        v16 = (unsigned __int8 *)(*v12 + 1);
        do
        {
          v17 = *(_BYTE **)(a1 + 824);
          if (v17 == *(_BYTE **)(a1 + 816))
          {
            if (!poolGrow((uint64_t *)(a1 + 800)))
              return 0;
            v15 = *(v16 - 1);
            v17 = *(_BYTE **)(a1 + 824);
          }
          *(_QWORD *)(a1 + 824) = v17 + 1;
          *v17 = v15;
          v18 = *v16++;
          v15 = v18;
        }
        while (v18);
      }
      v3 = *(_BYTE **)(a1 + 824);
      if (v3 == *(_BYTE **)(a1 + 816))
      {
        if (!poolGrow((uint64_t *)(a1 + 800)))
          return 0;
        v3 = *(_BYTE **)(a1 + 824);
      }
      v9 = v11 + 1;
      *(_QWORD *)(a1 + 824) = v3 + 1;
      *v3 = 61;
      v19 = *((_DWORD *)v12[1] + 10) - (*(_BYTE *)(a1 + 908) != 0);
      LODWORD(v3) = 1;
      if ((int)v19 >= 1)
      {
        for (j = 0; j != v19; ++j)
        {
          v21 = *(_BYTE **)(a1 + 824);
          if (v21 == *(_BYTE **)(a1 + 816))
          {
            if (!poolGrow((uint64_t *)(a1 + 800)))
              return 0;
            v21 = *(_BYTE **)(a1 + 824);
          }
          v22 = *(_BYTE *)(*((_QWORD *)v12[1] + 4) + j);
          *(_QWORD *)(a1 + 824) = v21 + 1;
          *v21 = v22;
        }
        LODWORD(v3) = 1;
      }
    }
  }
  v23 = *(_QWORD **)v2;
  if (*(_QWORD *)v2)
    v24 = &v23[*(_QWORD *)(v2 + 16)];
  else
    v24 = 0;
  while (v23 != v24)
  {
    v25 = v23;
    v27 = (_BYTE *)*v23++;
    v26 = v27;
    if (v27 && v26[56])
    {
      if ((_DWORD)v3)
      {
        v28 = *(_BYTE **)(a1 + 824);
        if (v28 == *(_BYTE **)(a1 + 816))
        {
          if (!poolGrow((uint64_t *)(a1 + 800)))
            return 0;
          v28 = *(_BYTE **)(a1 + 824);
        }
        *(_QWORD *)(a1 + 824) = v28 + 1;
        *v28 = 12;
      }
      v23 = v25 + 1;
      v29 = **(_BYTE **)v26;
      LODWORD(v3) = 1;
      if (v29)
      {
        v30 = (unsigned __int8 *)(*(_QWORD *)v26 + 1);
        do
        {
          v31 = *(_BYTE **)(a1 + 824);
          if (v31 == *(_BYTE **)(a1 + 816))
          {
            if (!poolGrow((uint64_t *)(a1 + 800)))
              return 0;
            v29 = *(v30 - 1);
            v31 = *(_BYTE **)(a1 + 824);
          }
          *(_QWORD *)(a1 + 824) = v31 + 1;
          *v31 = v29;
          v32 = *v30++;
          v29 = v32;
        }
        while (v32);
        LODWORD(v3) = 1;
      }
    }
  }
  v33 = *(_BYTE **)(a1 + 824);
  if (v33 != *(_BYTE **)(a1 + 816))
    goto LABEL_60;
  if (poolGrow((uint64_t *)(a1 + 800)))
  {
    v33 = *(_BYTE **)(a1 + 824);
LABEL_60:
    *(_QWORD *)(a1 + 824) = v33 + 1;
    *v33 = 0;
    return *(_QWORD *)(a1 + 832);
  }
  return 0;
}

uint64_t doCdataSection(uint64_t a1, uint64_t a2, unsigned __int8 **a3, uint64_t a4, unsigned __int8 **a5, int a6, int a7)
{
  unsigned __int8 *v11;
  unsigned __int8 **v12;
  unsigned __int8 **v13;
  int v14;
  unsigned __int8 *v15;
  void (*v16)(_QWORD, unsigned __int8 *, _QWORD);
  uint64_t v17;
  unsigned int v18;
  void (*v19)(_QWORD, uint64_t *, uint64_t);
  int v20;
  uint64_t result;
  unsigned __int8 *v22;
  void (*v23)(_QWORD);
  unsigned __int8 **v24;
  unsigned __int8 *v25;
  uint64_t v28;
  unsigned __int8 *v29;
  unsigned __int8 *v30;

  v11 = *a3;
  v30 = *a3;
  if (*(_QWORD *)(a1 + 304) == a2)
  {
    v12 = (unsigned __int8 **)(a1 + 560);
    *(_QWORD *)(a1 + 560) = v11;
    v13 = (unsigned __int8 **)(a1 + 568);
  }
  else
  {
    v12 = *(unsigned __int8 ***)(a1 + 584);
    v13 = v12 + 1;
  }
  *v12 = v11;
  *a3 = 0;
  while (2)
  {
    v29 = v30;
    v14 = (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
    if (!accountingDiffTolerated(a1, v14, v30, (unint64_t)v29, 4112, a7))
    {
      accountingReportStats((_QWORD *)a1, " ABORTING\n");
      return 43;
    }
    v15 = v29;
    *v13 = v29;
    switch(v14)
    {
      case -4:
      case -1:
        if (a6)
          goto LABEL_29;
        return 20;
      case -3:
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
        goto LABEL_27;
      case -2:
        if (a6)
        {
LABEL_29:
          result = 0;
          v22 = v30;
          goto LABEL_30;
        }
        return 6;
      case 0:
        *v12 = v15;
        return 4;
      case 6:
        v16 = *(void (**)(_QWORD, unsigned __int8 *, _QWORD))(a1 + 136);
        if (!v16)
          goto LABEL_15;
        if (*(_BYTE *)(a2 + 132))
        {
          v16(*(_QWORD *)(a1 + 8), v30, ((_DWORD)v15 - (_DWORD)v30));
        }
        else
        {
          while (1)
          {
            v17 = *(_QWORD *)(a1 + 112);
            v28 = *(_QWORD *)(a1 + 104);
            v18 = (*(uint64_t (**)(uint64_t, unsigned __int8 **, unsigned __int8 *, uint64_t *, uint64_t))(a2 + 112))(a2, &v30, v15, &v28, v17);
            *v13 = v29;
            v16(*(_QWORD *)(a1 + 8), *(unsigned __int8 **)(a1 + 104), v28 - *(_QWORD *)(a1 + 104));
            if (v18 <= 1)
              break;
            *v12 = v30;
            v15 = v29;
          }
        }
        goto LABEL_17;
      case 7:
        v19 = *(void (**)(_QWORD, uint64_t *, uint64_t))(a1 + 136);
        if (v19)
        {
          LOBYTE(v28) = 10;
          v19(*(_QWORD *)(a1 + 8), &v28, 1);
        }
        else
        {
LABEL_15:
          if (*(_QWORD *)(a1 + 176))
            reportDefault(a1, a2, (uint64_t)v30, (uint64_t)v15);
        }
LABEL_17:
        v30 = v29;
        *v12 = v29;
        v20 = *(_DWORD *)(a1 + 920);
        if (v20 == 2)
          return 35;
        if (v20 != 3)
          continue;
        result = 0;
        v22 = v29;
LABEL_30:
        *a5 = v22;
        return result;
      default:
        if (v14 == 40)
        {
          v23 = *(void (**)(_QWORD))(a1 + 168);
          if (v23)
          {
            v23(*(_QWORD *)(a1 + 8));
            v24 = a5;
          }
          else
          {
            v24 = a5;
            if (*(_QWORD *)(a1 + 176))
              reportDefault(a1, a2, (uint64_t)v30, (uint64_t)v15);
          }
          v25 = v29;
          *a3 = v29;
          *v24 = v25;
          if (*(_DWORD *)(a1 + 920) == 2)
            return 35;
          else
            return 0;
        }
        else
        {
LABEL_27:
          *v12 = v15;
          return 23;
        }
    }
  }
}

uint64_t cdataSectionProcessor(uint64_t a1, unsigned __int8 *a2, uint64_t a3, unsigned __int8 **a4)
{
  uint64_t result;
  unsigned __int8 *v8;
  unsigned __int8 *v9;

  v9 = a2;
  result = doCdataSection(a1, *(_QWORD *)(a1 + 304), &v9, a3, a4, *(_BYTE *)(a1 + 924) == 0, 0);
  if (!(_DWORD)result)
  {
    v8 = v9;
    if (v9)
    {
      if (*(_QWORD *)(a1 + 912))
      {
        *(_QWORD *)(a1 + 544) = externalEntityContentProcessor;
        return externalEntityContentProcessor(a1, (uint64_t)v8, a3, (uint64_t)a4);
      }
      else
      {
        *(_QWORD *)(a1 + 544) = contentProcessor;
        return contentProcessor(a1);
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t externalEntityContentProcessor(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;

  v5 = doContent(a1, 1, *(_QWORD *)(a1 + 304), a2, a3, a4, *(_BYTE *)(a1 + 924) == 0, 1);
  if (!(_DWORD)v5 && !storeRawNames(a1))
    return 1;
  return v5;
}

uint64_t internalEntityProcessor(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  uint64_t v22;

  v4 = *(_QWORD *)(a1 + 584);
  if (!v4)
    return 23;
  v9 = *(_QWORD *)(v4 + 24);
  v10 = *(_QWORD *)(v9 + 8);
  v11 = v10 + *(int *)(v9 + 20);
  v12 = v10 + *(int *)(v9 + 16);
  v22 = v11;
  if (*(_BYTE *)(v9 + 57))
  {
    v13 = (**(uint64_t (***)(void))(a1 + 456))();
    v14 = doProlog(a1, *(_QWORD *)(a1 + 456), v11, v12, v13, v22, &v22, 0, 1);
  }
  else
  {
    v14 = doContent(a1, *(unsigned int *)(v4 + 32), *(_QWORD *)(a1 + 456), v11, v12, &v22, 0, 1);
  }
  v15 = v14;
  if (!(_DWORD)v14)
  {
    v17 = a1;
    if (v12 == v22 || (v17 = a1, *(_DWORD *)(a1 + 920) != 3))
    {
      do
      {
        v18 = v17;
        v17 = *(_QWORD *)(v17 + 912);
      }
      while (v17);
      entityTrackingReportStats(v18, v9, "CLOSE", 5919);
      --*(_DWORD *)(v18 + 988);
      *(_BYTE *)(v9 + 56) = 0;
      v19 = *(_QWORD *)(v4 + 16);
      *(_QWORD *)(a1 + 584) = v19;
      *(_QWORD *)(v4 + 16) = *(_QWORD *)(a1 + 592);
      *(_QWORD *)(a1 + 592) = v4;
      if (v19 && *(_DWORD *)(a1 + 920) == 3)
      {
        return 0;
      }
      else if (*(_BYTE *)(v9 + 57))
      {
        *(_QWORD *)(a1 + 544) = prologProcessor;
        v20 = (**(uint64_t (***)(void))(a1 + 304))();
        LOBYTE(v21) = 1;
        return doProlog(a1, *(_QWORD *)(a1 + 304), a2, a3, v20, v22, a4, *(_BYTE *)(a1 + 924) == 0, v21);
      }
      else
      {
        *(_QWORD *)(a1 + 544) = contentProcessor;
        v15 = doContent(a1, *(_QWORD *)(a1 + 912) != 0, *(_QWORD *)(a1 + 304), a2, a3, a4, *(_BYTE *)(a1 + 924) == 0, 0);
        if (!(_DWORD)v15 && !storeRawNames(a1))
          return 1;
      }
    }
    else
    {
      v15 = 0;
      *(_DWORD *)(v9 + 20) = v22 - *(_DWORD *)(v9 + 8);
    }
  }
  return v15;
}

uint64_t entityTrackingReportStats(uint64_t result, uint64_t a2, const char *a3, int a4)
{
  const char *v4;

  if (*(_QWORD *)(result + 912))
    entityTrackingReportStats_cold_1();
  if (*(_QWORD *)(result + 1000))
  {
    v4 = "%";
    if (!*(_BYTE *)(a2 + 57))
      v4 = "&";
    return fprintf((FILE *)*MEMORY[0x24BDAC8D8], "expat: Entities(%p): Count %9d, depth %2d/%2d %*s%s%s; %s length %d (xmlparse.c:%d)\n",
             (const void *)result,
             *(_DWORD *)(result + 984),
             *(_DWORD *)(result + 988),
             *(_DWORD *)(result + 992),
             2 * *(_DWORD *)(result + 988) - 2,
             "",
             v4,
             *(const char **)a2,
             a3,
             *(_DWORD *)(a2 + 16),
             a4);
  }
  return result;
}

uint64_t externalEntityInitProcessor2(uint64_t a1, unint64_t a2, uint64_t a3, _QWORD *a4)
{
  unsigned __int8 *v6;
  int v8;
  uint64_t result;

  v6 = (unsigned __int8 *)a2;
  v8 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 304) + 8))();
  if (v8 == -2)
  {
    if (*(_BYTE *)(a1 + 924))
    {
      *(_QWORD *)(a1 + 560) = v6;
      return 6;
    }
LABEL_12:
    result = 0;
    *a4 = v6;
    return result;
  }
  if (v8 == -1)
  {
    if (*(_BYTE *)(a1 + 924))
    {
      *(_QWORD *)(a1 + 560) = v6;
      return 5;
    }
    goto LABEL_12;
  }
  if (v8 != 14)
  {
LABEL_7:
    *(_QWORD *)(a1 + 544) = externalEntityInitProcessor3;
    return externalEntityInitProcessor3(a1, (unint64_t)v6, a3, a4);
  }
  if (accountingDiffTolerated(a1, 14, v6, a2, 2717, 0))
  {
    v6 = (unsigned __int8 *)a2;
    if (a2 != a3)
      goto LABEL_7;
    v6 = (unsigned __int8 *)a3;
    if (*(_BYTE *)(a1 + 924))
      goto LABEL_7;
    result = 0;
    *a4 = a3;
  }
  else
  {
    accountingReportStats((_QWORD *)a1, " ABORTING\n");
    return 43;
  }
  return result;
}

uint64_t externalEntityInitProcessor3(uint64_t a1, unint64_t a2, uint64_t a3, _QWORD *a4)
{
  unsigned __int8 *v6;
  int v8;
  uint64_t result;
  int v10;

  v6 = (unsigned __int8 *)a2;
  *(_QWORD *)(a1 + 560) = a2;
  v8 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 304) + 8))();
  *(_QWORD *)(a1 + 568) = a2;
  switch(v8)
  {
    case -2:
      if (*(_BYTE *)(a1 + 924))
        return 6;
LABEL_12:
      result = 0;
      *a4 = v6;
      return result;
    case -1:
      if (*(_BYTE *)(a1 + 924))
        return 5;
      goto LABEL_12;
    case 12:
      result = processXmlDecl(a1, 1, v6, a2);
      if ((_DWORD)result)
        return result;
      v10 = *(_DWORD *)(a1 + 920);
      if (v10 == 2)
        return 35;
      if (v10 == 3)
      {
        result = 0;
        *a4 = a2;
        return result;
      }
      v6 = (unsigned __int8 *)a2;
      break;
  }
  *(_QWORD *)(a1 + 544) = externalEntityContentProcessor;
  *(_DWORD *)(a1 + 604) = 1;
  return externalEntityContentProcessor(a1, (uint64_t)v6, a3, (uint64_t)a4);
}

uint64_t entityValueInitProcessor(uint64_t a1, unsigned __int8 *a2, uint64_t a3, unsigned __int8 **a4)
{
  unsigned __int8 *v6;
  int v8;
  unint64_t v9;
  unsigned __int8 *v10;
  BOOL v11;
  uint64_t result;

  v6 = a2;
  *(_QWORD *)(a1 + 560) = a2;
  v8 = (**(uint64_t (***)(void))(a1 + 304))();
  v9 = (unint64_t)a2;
  *(_QWORD *)(a1 + 568) = a2;
  if (v8 >= 1)
  {
    v10 = v6;
    while (1)
    {
      switch(v8)
      {
        case 14:
          if (!accountingDiffTolerated(a1, 14, v10, v9, 4563, 0))
          {
            accountingReportStats((_QWORD *)a1, " ABORTING\n");
            return 43;
          }
          v9 = (unint64_t)a2;
          *a4 = a2;
          v10 = a2;
          break;
        case 29:
          *a4 = (unsigned __int8 *)v9;
          return 2;
        case 12:
          result = processXmlDecl(a1, 0, v6, v9);
          if (!(_DWORD)result)
          {
            if (*(_DWORD *)(a1 + 920) == 2)
            {
              return 35;
            }
            else
            {
              *a4 = a2;
              *(_QWORD *)(a1 + 544) = entityValueProcessor;
              return entityValueProcessor(a1, a2, a3, a4);
            }
          }
          return result;
      }
      v6 = (unsigned __int8 *)v9;
      *(_QWORD *)(a1 + 560) = v9;
      v8 = (**(uint64_t (***)(void))(a1 + 304))();
      v9 = (unint64_t)a2;
      *(_QWORD *)(a1 + 568) = a2;
      if (v8 < 1)
        goto LABEL_12;
    }
  }
  v10 = v6;
LABEL_12:
  if (v8)
    v11 = *(_BYTE *)(a1 + 924) == 0;
  else
    v11 = 0;
  if (v11)
  {
    result = 0;
    *a4 = v10;
  }
  else if ((v8 + 2) >= 3)
  {
    return storeEntityValue(a1, *(_QWORD *)(a1 + 304), v10, a3, 0);
  }
  else
  {
    return (4 - v8);
  }
  return result;
}

uint64_t externalParEntProcessor(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, unsigned __int8 **a4)
{
  unsigned __int8 *v6;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t result;
  unsigned __int8 *v12;

  v6 = a2;
  v12 = a2;
  v8 = (**(uint64_t (***)(void))(a1 + 304))();
  v9 = v8;
  if ((int)v8 <= 0)
  {
    if ((_DWORD)v8)
      v10 = *(_BYTE *)(a1 + 924) == 0;
    else
      v10 = 0;
    if (!v10)
    {
      if ((v8 + 2) < 3)
        return (4 - v8);
      goto LABEL_11;
    }
    result = 0;
    *a4 = v6;
  }
  else
  {
    if ((_DWORD)v8 != 14)
    {
LABEL_11:
      *(_QWORD *)(a1 + 544) = prologProcessor;
      return doProlog((_QWORD *)a1, *(_QWORD *)(a1 + 304), v6, a3, v9, v12, a4, *(_BYTE *)(a1 + 924) == 0, 1, 0);
    }
    if (accountingDiffTolerated(a1, 14, v6, (unint64_t)v12, 4616, 0))
    {
      v6 = v12;
      v9 = (**(uint64_t (***)(void))(a1 + 304))();
      goto LABEL_11;
    }
    accountingReportStats((_QWORD *)a1, " ABORTING\n");
    return 43;
  }
  return result;
}

uint64_t entityValueProcessor(uint64_t a1, unsigned __int8 *a2, uint64_t a3, unsigned __int8 **a4)
{
  uint64_t (**v8)(_QWORD);
  int i;
  BOOL v10;
  uint64_t result;

  v8 = *(uint64_t (***)(_QWORD))(a1 + 304);
  for (i = (*v8)(v8); i >= 1; i = (*v8)(v8))
    ;
  if (i)
    v10 = *(_BYTE *)(a1 + 924) == 0;
  else
    v10 = 0;
  if (v10)
  {
    result = 0;
    *a4 = a2;
  }
  else if ((i + 2) >= 3)
  {
    return storeEntityValue(a1, (uint64_t)v8, a2, a3, 0);
  }
  else
  {
    return (4 - i);
  }
  return result;
}

uint64_t copyEntityTable(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t a4)
{
  uint64_t *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  char *v18;
  int v19;
  int v20;
  _BYTE *v21;
  char v22;
  uint64_t v23;
  char *v24;
  uint64_t *v25;

  v7 = *(uint64_t **)a4;
  if (*(_QWORD *)a4)
    v8 = &v7[*(_QWORD *)(a4 + 16)];
  else
    v8 = 0;
  v9 = 0;
  v10 = 0;
  while (1)
  {
    do
    {
      if (v7 == v8)
        return 1;
      v12 = *v7++;
      v11 = v12;
    }
    while (!v12);
    result = poolCopyString(a3, *(char **)v11);
    if (!result)
      return result;
    result = (uint64_t)lookup(a1, a2, (char *)result, 0x40uLL);
    if (!result)
      return result;
    v14 = result;
    v15 = *(char **)(v11 + 24);
    if (!v15)
      break;
    result = poolCopyString(a3, v15);
    if (!result)
      return result;
    *(_QWORD *)(v14 + 24) = result;
    v16 = *(_QWORD *)(v11 + 32);
    if (v16)
    {
      if (v16 != v9)
      {
        result = poolCopyString(a3, *(char **)(v11 + 32));
        v10 = result;
        v9 = v16;
        if (!result)
          return result;
      }
      *(_QWORD *)(v14 + 32) = v10;
    }
    v17 = *(char **)(v11 + 40);
    if (v17)
    {
      result = poolCopyString(a3, v17);
      if (!result)
        return result;
      *(_QWORD *)(v14 + 40) = result;
    }
LABEL_28:
    v24 = *(char **)(v11 + 48);
    if (v24)
    {
      result = poolCopyString(a3, v24);
      if (!result)
        return result;
      *(_QWORD *)(v14 + 48) = result;
    }
    *(_WORD *)(v14 + 57) = *(_WORD *)(v11 + 57);
  }
  v25 = a2;
  v18 = *(char **)(v11 + 8);
  v19 = *(_DWORD *)(v11 + 16);
  if (!a3[3])
  {
    result = poolGrow(a3);
    if (!(_DWORD)result)
      return result;
  }
  if (v19 >= 1)
  {
    v20 = v19 + 1;
    do
    {
      v21 = (_BYTE *)a3[3];
      if (v21 == (_BYTE *)a3[2])
      {
        result = poolGrow(a3);
        if (!(_DWORD)result)
          return result;
        v21 = (_BYTE *)a3[3];
      }
      v22 = *v18++;
      a3[3] = (uint64_t)(v21 + 1);
      *v21 = v22;
      --v20;
    }
    while (v20 > 1);
  }
  v23 = a3[4];
  a3[4] = a3[3];
  if (v23)
  {
    *(_QWORD *)(v14 + 8) = v23;
    *(_DWORD *)(v14 + 16) = *(_DWORD *)(v11 + 16);
    a2 = v25;
    goto LABEL_28;
  }
  return 0;
}

_QWORD *XmlPrologStateInitExternalEntity(_QWORD *result)
{
  *result = externalSubset0;
  result[2] = 0;
  return result;
}

void externalSubset0(_DWORD *a1, const xmlChar *a2, const xmlChar *a3, const xmlChar *a4)
{
  *(_QWORD *)a1 = externalSubset1;
  if ((_DWORD)a2 != 12)
    externalSubset1(a1, a2, a3, a4);
}

uint64_t doctype0(uint64_t a1, int a2)
{
  uint64_t result;
  void *v4;

  if (a2 == 15)
    return 3;
  result = 4;
  v4 = doctype1;
  if (a2 != 18 && a2 != 41)
  {
    result = 0xFFFFFFFFLL;
    v4 = error;
    if (a2 == 28 && !*(_DWORD *)(a1 + 20))
      return 59;
  }
  *(_QWORD *)a1 = v4;
  return result;
}

uint64_t error()
{
  return 0;
}

uint64_t doctype1(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;
  void *v7;

  if (a2 > 17)
  {
    if (a2 == 18)
    {
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t, const char *))(a5 + 48))(a5, a3, a4, "SYSTEM"))
      {
        result = 3;
        v7 = doctype3;
        goto LABEL_17;
      }
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t, const char *))(a5 + 48))(a5, a3, a4, "PUBLIC"))
      {
        result = 3;
        v7 = doctype2;
        goto LABEL_17;
      }
LABEL_16:
      result = 0xFFFFFFFFLL;
      v7 = error;
      goto LABEL_17;
    }
    if (a2 == 25)
    {
      result = 7;
      v7 = internalSubset;
      goto LABEL_17;
    }
LABEL_11:
    if (a2 == 28 && !*(_DWORD *)(a1 + 20))
      return 59;
    goto LABEL_16;
  }
  if (a2 == 15)
    return 3;
  if (a2 != 17)
    goto LABEL_11;
  result = 8;
  v7 = prolog2;
LABEL_17:
  *(_QWORD *)a1 = v7;
  return result;
}

void internalSubset(void *ctx, const xmlChar *name, const xmlChar *ExternalID, const xmlChar *SystemID)
{
  uint64_t v4;
  uint64_t v6;

  if ((int)name > 25)
  {
    if ((_DWORD)name == 26)
    {
      *(_QWORD *)ctx = doctype5;
    }
    else if ((_DWORD)name != 28)
    {
LABEL_17:
      *(_QWORD *)ctx = error;
    }
  }
  else
  {
    switch((int)name)
    {
      case 11:
      case 13:
      case 15:
        return;
      case 12:
      case 14:
        goto LABEL_17;
      case 16:
        v6 = v4;
        if ((*(unsigned int (**)(uint64_t, const xmlChar *, const xmlChar *, const char *))(v4 + 48))(v4, &ExternalID[2 * *(int *)(v4 + 128)], SystemID, "ENTITY"))
        {
          *(_QWORD *)ctx = entity0;
          return;
        }
        if ((*(unsigned int (**)(uint64_t, const xmlChar *, const xmlChar *, const char *))(v6 + 48))(v6, &ExternalID[2 * *(int *)(v6 + 128)], SystemID, "ATTLIST"))
        {
          *(_QWORD *)ctx = attlist0;
          return;
        }
        if ((*(unsigned int (**)(uint64_t, const xmlChar *, const xmlChar *, const char *))(v6 + 48))(v6, &ExternalID[2 * *(int *)(v6 + 128)], SystemID, "ELEMENT"))
        {
          *(_QWORD *)ctx = element0;
          return;
        }
        if (!(*(unsigned int (**)(uint64_t, const xmlChar *, const xmlChar *, const char *))(v6 + 48))(v6, &ExternalID[2 * *(int *)(v6 + 128)], SystemID, "NOTATION"))goto LABEL_17;
        *(_QWORD *)ctx = notation0;
        break;
      default:
        if ((_DWORD)name != -4)
          goto LABEL_17;
        return;
    }
  }
}

uint64_t prolog2(uint64_t a1, int a2)
{
  unint64_t v3;
  uint64_t result;

  HIDWORD(v3) = a2 - 11;
  LODWORD(v3) = a2 - 11;
  result = 0;
  switch((v3 >> 1))
  {
    case 0u:
      result = 55;
      break;
    case 1u:
      result = 56;
      break;
    case 2u:
      return result;
    case 9u:
      *(_QWORD *)a1 = error;
      result = 2;
      break;
    default:
      if (a2 != 28 || *(_DWORD *)(a1 + 20))
      {
        *(_QWORD *)a1 = error;
        result = 0xFFFFFFFFLL;
      }
      else
      {
        result = 59;
      }
      break;
  }
  return result;
}

uint64_t doctype3(uint64_t a1, int a2)
{
  uint64_t result;
  void *v4;

  if (a2 == 15)
    return 3;
  if (a2 == 27)
  {
    result = 5;
    v4 = doctype4;
  }
  else
  {
    result = 0xFFFFFFFFLL;
    v4 = error;
    if (a2 == 28 && !*(_DWORD *)(a1 + 20))
      return 59;
  }
  *(_QWORD *)a1 = v4;
  return result;
}

uint64_t doctype2(uint64_t a1, int a2)
{
  uint64_t result;
  void *v4;

  if (a2 == 15)
    return 3;
  if (a2 == 27)
  {
    result = 6;
    v4 = doctype3;
  }
  else
  {
    result = 0xFFFFFFFFLL;
    v4 = error;
    if (a2 == 28 && !*(_DWORD *)(a1 + 20))
      return 59;
  }
  *(_QWORD *)a1 = v4;
  return result;
}

uint64_t entity0(uint64_t a1, int a2)
{
  uint64_t result;
  void *v4;

  result = 11;
  if (a2 != 15)
  {
    if (a2 == 22)
    {
      v4 = entity1;
      goto LABEL_10;
    }
    if (a2 == 18)
    {
      result = 9;
      v4 = entity2;
LABEL_10:
      *(_QWORD *)a1 = v4;
      return result;
    }
    result = 0xFFFFFFFFLL;
    v4 = error;
    if (a2 != 28 || *(_DWORD *)(a1 + 20))
      goto LABEL_10;
    return 59;
  }
  return result;
}

uint64_t attlist0(uint64_t a1, int a2)
{
  uint64_t result;
  void *v4;

  if (a2 == 15)
    return 33;
  result = 34;
  v4 = attlist1;
  if (a2 != 18 && a2 != 41)
  {
    result = 0xFFFFFFFFLL;
    v4 = error;
    if (a2 == 28 && !*(_DWORD *)(a1 + 20))
      return 59;
  }
  *(_QWORD *)a1 = v4;
  return result;
}

uint64_t element0(uint64_t a1, int a2)
{
  uint64_t result;
  void *v4;

  if (a2 == 15)
    return 39;
  result = 40;
  v4 = element1;
  if (a2 != 18 && a2 != 41)
  {
    result = 0xFFFFFFFFLL;
    v4 = error;
    if (a2 == 28 && !*(_DWORD *)(a1 + 20))
      return 59;
  }
  *(_QWORD *)a1 = v4;
  return result;
}

uint64_t notation0(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t result;

  if ((_DWORD)a2 == 15)
    return 17;
  if ((_DWORD)a2 == 18)
  {
    v3 = notation1;
    result = a2;
  }
  else
  {
    result = 0xFFFFFFFFLL;
    v3 = error;
    if ((_DWORD)a2 == 28 && !*(_DWORD *)(a1 + 20))
      return 59;
  }
  *(_QWORD *)a1 = v3;
  return result;
}

uint64_t doctype5(uint64_t a1, int a2)
{
  uint64_t result;
  void *v4;

  if (a2 == 15)
    return 3;
  if (a2 == 17)
  {
    result = 8;
    v4 = prolog2;
  }
  else
  {
    result = 0xFFFFFFFFLL;
    v4 = error;
    if (a2 == 28 && !*(_DWORD *)(a1 + 20))
      return 59;
  }
  *(_QWORD *)a1 = v4;
  return result;
}

uint64_t entity1(uint64_t a1, int a2)
{
  uint64_t result;
  void *v4;

  if (a2 == 15)
    return 11;
  if (a2 == 18)
  {
    result = 10;
    v4 = entity7;
  }
  else
  {
    result = 0xFFFFFFFFLL;
    v4 = error;
    if (a2 == 28 && !*(_DWORD *)(a1 + 20))
      return 59;
  }
  *(_QWORD *)a1 = v4;
  return result;
}

uint64_t entity2(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t (*v9)(uint64_t, int);

  switch(a2)
  {
    case 15:
      return 11;
    case 27:
      *(_QWORD *)a1 = declClose;
      *(_DWORD *)(a1 + 12) = 11;
      return 12;
    case 18:
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t, const char *))(a5 + 48))(a5, a3, a4, "SYSTEM"))
      {
        v9 = entity4;
LABEL_13:
        *(_QWORD *)a1 = v9;
        return 11;
      }
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t, const char *))(a5 + 48))(a5, a3, a4, "PUBLIC"))
      {
        v9 = entity3;
        goto LABEL_13;
      }
      break;
    default:
      if (a2 == 28 && !*(_DWORD *)(a1 + 20))
        return 59;
      break;
  }
  *(_QWORD *)a1 = error;
  return 0xFFFFFFFFLL;
}

uint64_t entity7(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t (*v9)(uint64_t, int);

  switch(a2)
  {
    case 15:
      return 11;
    case 27:
      *(_QWORD *)a1 = declClose;
      *(_DWORD *)(a1 + 12) = 11;
      return 12;
    case 18:
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t, const char *))(a5 + 48))(a5, a3, a4, "SYSTEM"))
      {
        v9 = entity9;
LABEL_13:
        *(_QWORD *)a1 = v9;
        return 11;
      }
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t, const char *))(a5 + 48))(a5, a3, a4, "PUBLIC"))
      {
        v9 = entity8;
        goto LABEL_13;
      }
      break;
    default:
      if (a2 == 28 && !*(_DWORD *)(a1 + 20))
        return 59;
      break;
  }
  *(_QWORD *)a1 = error;
  return 0xFFFFFFFFLL;
}

uint64_t entity9(uint64_t a1, int a2)
{
  uint64_t result;
  void *v4;

  if (a2 == 15)
    return 11;
  if (a2 == 27)
  {
    result = 13;
    v4 = entity10;
  }
  else
  {
    result = 0xFFFFFFFFLL;
    v4 = error;
    if (a2 == 28 && !*(_DWORD *)(a1 + 20))
      return 59;
  }
  *(_QWORD *)a1 = v4;
  return result;
}

uint64_t entity8(uint64_t a1, int a2)
{
  uint64_t result;
  void *v4;

  if (a2 == 15)
    return 11;
  if (a2 == 27)
  {
    result = 14;
    v4 = entity9;
  }
  else
  {
    result = 0xFFFFFFFFLL;
    v4 = error;
    if (a2 == 28 && !*(_DWORD *)(a1 + 20))
      return 59;
  }
  *(_QWORD *)a1 = v4;
  return result;
}

uint64_t declClose(uint64_t a1, int a2)
{
  void *v3;

  if (a2 == 17)
  {
    if (*(_DWORD *)(a1 + 20))
      v3 = internalSubset;
    else
      v3 = externalSubset1;
    *(_QWORD *)a1 = v3;
    return *(unsigned int *)(a1 + 12);
  }
  if (a2 == 15)
    return *(unsigned int *)(a1 + 12);
  if (a2 == 28 && !*(_DWORD *)(a1 + 20))
    return 59;
  *(_QWORD *)a1 = error;
  return 0xFFFFFFFFLL;
}

uint64_t entity10(uint64_t a1, int a2)
{
  void *v2;
  uint64_t v3;

  if (a2 == 15)
    return 11;
  if (a2 == 17)
  {
    if (*(_DWORD *)(a1 + 20))
      v2 = internalSubset;
    else
      v2 = externalSubset1;
    v3 = 15;
    goto LABEL_11;
  }
  v3 = 0xFFFFFFFFLL;
  v2 = error;
  if (a2 != 28 || *(_DWORD *)(a1 + 20))
  {
LABEL_11:
    *(_QWORD *)a1 = v2;
    return v3;
  }
  return 59;
}

void externalSubset1(_DWORD *a1, const xmlChar *a2, const xmlChar *a3, const xmlChar *a4)
{
  int v4;

  if ((int)a2 > 25)
  {
    if ((_DWORD)a2 != 26)
    {
      if ((_DWORD)a2 != 34)
      {
        if ((_DWORD)a2 == 33)
        {
          *(_QWORD *)a1 = condSect0;
          return;
        }
        goto LABEL_14;
      }
      v4 = a1[4];
      if (v4)
      {
        a1[4] = v4 - 1;
        return;
      }
    }
LABEL_12:
    *(_QWORD *)a1 = error;
    return;
  }
  if ((_DWORD)a2 == -4)
  {
    if (!a1[4])
      return;
    goto LABEL_12;
  }
  if ((_DWORD)a2 != 15)
LABEL_14:
    internalSubset(a1, a2, a3, a4);
}

uint64_t condSect0(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;
  void *v10;

  if (a2 == 15)
    return 0;
  if (a2 != 18)
  {
    if (a2 == 28 && !*(_DWORD *)(a1 + 20))
      return 59;
    goto LABEL_11;
  }
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t, const char *))(a5 + 48))(a5, a3, a4, "INCLUDE"))
  {
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t, const char *))(a5 + 48))(a5, a3, a4, "IGNORE"))
    {
      result = 0;
      v10 = condSect2;
      goto LABEL_12;
    }
LABEL_11:
    result = 0xFFFFFFFFLL;
    v10 = error;
    goto LABEL_12;
  }
  result = 0;
  v10 = condSect1;
LABEL_12:
  *(_QWORD *)a1 = v10;
  return result;
}

uint64_t condSect1(uint64_t a1, int a2)
{
  uint64_t v2;

  if (a2 == 15)
    return 0;
  if (a2 == 25)
  {
    v2 = 0;
    *(_QWORD *)a1 = externalSubset1;
    ++*(_DWORD *)(a1 + 16);
  }
  else if (a2 != 28 || *(_DWORD *)(a1 + 20))
  {
    *(_QWORD *)a1 = error;
    return 0xFFFFFFFFLL;
  }
  else
  {
    return 59;
  }
  return v2;
}

uint64_t condSect2(uint64_t a1, int a2)
{
  uint64_t result;
  uint64_t (*v4)();

  if (a2 == 15)
    return 0;
  if (a2 == 25)
  {
    result = 58;
    v4 = externalSubset1;
  }
  else
  {
    result = 0xFFFFFFFFLL;
    v4 = error;
    if (a2 == 28 && !*(_DWORD *)(a1 + 20))
      return 59;
  }
  *(_QWORD *)a1 = v4;
  return result;
}

uint64_t entity4(uint64_t a1, int a2)
{
  uint64_t result;
  void *v4;

  if (a2 == 15)
    return 11;
  if (a2 == 27)
  {
    result = 13;
    v4 = entity5;
  }
  else
  {
    result = 0xFFFFFFFFLL;
    v4 = error;
    if (a2 == 28 && !*(_DWORD *)(a1 + 20))
      return 59;
  }
  *(_QWORD *)a1 = v4;
  return result;
}

uint64_t entity3(uint64_t a1, int a2)
{
  uint64_t result;
  void *v4;

  if (a2 == 15)
    return 11;
  if (a2 == 27)
  {
    result = 14;
    v4 = entity4;
  }
  else
  {
    result = 0xFFFFFFFFLL;
    v4 = error;
    if (a2 == 28 && !*(_DWORD *)(a1 + 20))
      return 59;
  }
  *(_QWORD *)a1 = v4;
  return result;
}

uint64_t entity5(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  uint64_t result;

  if (a2 == 15)
    return 11;
  if (a2 != 18)
  {
    if (a2 == 17)
    {
      v6 = internalSubset;
      if (!*(_DWORD *)(a1 + 20))
        v6 = externalSubset1;
      result = 15;
      goto LABEL_14;
    }
    if (a2 == 28 && !*(_DWORD *)(a1 + 20))
      return 59;
    goto LABEL_13;
  }
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t, const char *))(a5 + 48))(a5, a3, a4, "NDATA"))
  {
LABEL_13:
    result = 0xFFFFFFFFLL;
    v6 = error;
    goto LABEL_14;
  }
  result = 11;
  v6 = entity6;
LABEL_14:
  *(_QWORD *)a1 = v6;
  return result;
}

uint64_t entity6(uint64_t a1, int a2)
{
  if (a2 == 15)
    return 11;
  if (a2 == 18)
  {
    *(_QWORD *)a1 = declClose;
    *(_DWORD *)(a1 + 12) = 11;
    return 16;
  }
  else if (a2 != 28 || *(_DWORD *)(a1 + 20))
  {
    *(_QWORD *)a1 = error;
    return 0xFFFFFFFFLL;
  }
  else
  {
    return 59;
  }
}

uint64_t attlist1(uint64_t a1, int a2)
{
  void *v2;
  uint64_t v3;

  if (a2 > 17)
  {
    v3 = 22;
    v2 = attlist2;
    if (a2 == 18 || a2 == 41)
      goto LABEL_13;
  }
  else
  {
    if (a2 == 15)
      return 33;
    if (a2 == 17)
    {
      if (*(_DWORD *)(a1 + 20))
        v2 = internalSubset;
      else
        v2 = externalSubset1;
      v3 = 33;
      goto LABEL_13;
    }
  }
  v3 = 0xFFFFFFFFLL;
  v2 = error;
  if (a2 != 28 || *(_DWORD *)(a1 + 20))
  {
LABEL_13:
    *(_QWORD *)a1 = v2;
    return v3;
  }
  return 59;
}

uint64_t attlist2(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t i;
  uint64_t (*v11)(uint64_t, int);

  switch(a2)
  {
    case 15:
      return 33;
    case 23:
      v11 = attlist3;
LABEL_14:
      *(_QWORD *)a1 = v11;
      return 33;
    case 18:
      for (i = 0; i != 8; ++i)
      {
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t, char *))(a5 + 48))(a5, a3, a4, attlist2_types[i]))
        {
          *(_QWORD *)a1 = attlist8;
          return (i + 23);
        }
      }
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t, const char *))(a5 + 48))(a5, a3, a4, "NOTATION"))
        break;
      v11 = attlist5;
      goto LABEL_14;
  }
  if (a2 == 28 && !*(_DWORD *)(a1 + 20))
    return 59;
  *(_QWORD *)a1 = error;
  return 0xFFFFFFFFLL;
}

uint64_t attlist8(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;
  uint64_t (*v10)();

  if (a2 == 15)
    return 33;
  if (a2 == 27)
  {
    result = 37;
    goto LABEL_8;
  }
  if (a2 != 20)
  {
    if (a2 == 28 && !*(_DWORD *)(a1 + 20))
      return 59;
    goto LABEL_16;
  }
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t, const char *))(a5 + 48))(a5, a3 + *(int *)(a5 + 128), a4, "IMPLIED"))
  {
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t, const char *))(a5 + 48))(a5, a3 + *(int *)(a5 + 128), a4, "REQUIRED"))
    {
      result = 36;
      goto LABEL_8;
    }
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t, const char *))(a5 + 48))(a5, a3 + *(int *)(a5 + 128), a4, "FIXED"))
    {
      result = 33;
      v10 = (uint64_t (*)())attlist9;
      goto LABEL_17;
    }
LABEL_16:
    result = 0xFFFFFFFFLL;
    v10 = error;
    goto LABEL_17;
  }
  result = 35;
LABEL_8:
  v10 = attlist1;
LABEL_17:
  *(_QWORD *)a1 = v10;
  return result;
}

uint64_t attlist5(uint64_t a1, int a2)
{
  uint64_t result;
  void *v4;

  result = 33;
  if (a2 != 15)
  {
    if (a2 == 23)
    {
      v4 = attlist6;
LABEL_8:
      *(_QWORD *)a1 = v4;
      return result;
    }
    result = 0xFFFFFFFFLL;
    v4 = error;
    if (a2 != 28 || *(_DWORD *)(a1 + 20))
      goto LABEL_8;
    return 59;
  }
  return result;
}

uint64_t attlist3(uint64_t a1, int a2)
{
  uint64_t result;
  void *v4;

  result = 31;
  v4 = attlist4;
  if ((a2 - 18) < 2)
  {
LABEL_7:
    *(_QWORD *)a1 = v4;
    return result;
  }
  if (a2 != 15)
  {
    if (a2 != 41)
    {
      result = 0xFFFFFFFFLL;
      v4 = error;
      if (a2 == 28 && !*(_DWORD *)(a1 + 20))
        return 59;
    }
    goto LABEL_7;
  }
  return 33;
}

uint64_t attlist9(uint64_t a1, int a2)
{
  uint64_t result;
  uint64_t (*v4)();

  if (a2 == 15)
    return 33;
  if (a2 == 27)
  {
    result = 38;
    v4 = attlist1;
  }
  else
  {
    result = 0xFFFFFFFFLL;
    v4 = error;
    if (a2 == 28 && !*(_DWORD *)(a1 + 20))
      return 59;
  }
  *(_QWORD *)a1 = v4;
  return result;
}

uint64_t attlist6(uint64_t a1, int a2)
{
  uint64_t result;
  void *v4;

  if (a2 == 15)
    return 33;
  if (a2 == 18)
  {
    result = 32;
    v4 = attlist7;
  }
  else
  {
    result = 0xFFFFFFFFLL;
    v4 = error;
    if (a2 == 28 && !*(_DWORD *)(a1 + 20))
      return 59;
  }
  *(_QWORD *)a1 = v4;
  return result;
}

uint64_t attlist7(uint64_t a1, int a2)
{
  uint64_t result;
  uint64_t (*v4)();

  result = 33;
  if (a2 != 15)
  {
    if (a2 == 24)
    {
      v4 = (uint64_t (*)())attlist8;
      goto LABEL_10;
    }
    if (a2 == 21)
    {
      v4 = attlist6;
LABEL_10:
      *(_QWORD *)a1 = v4;
      return result;
    }
    result = 0xFFFFFFFFLL;
    v4 = error;
    if (a2 != 28 || *(_DWORD *)(a1 + 20))
      goto LABEL_10;
    return 59;
  }
  return result;
}

uint64_t attlist4(uint64_t a1, int a2)
{
  uint64_t result;
  uint64_t (*v4)();

  result = 33;
  if (a2 != 15)
  {
    if (a2 == 24)
    {
      v4 = (uint64_t (*)())attlist8;
      goto LABEL_10;
    }
    if (a2 == 21)
    {
      v4 = attlist3;
LABEL_10:
      *(_QWORD *)a1 = v4;
      return result;
    }
    result = 0xFFFFFFFFLL;
    v4 = error;
    if (a2 != 28 || *(_DWORD *)(a1 + 20))
      goto LABEL_10;
    return 59;
  }
  return result;
}

uint64_t element1(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  switch(a2)
  {
    case 15:
      return 39;
    case 23:
      *(_QWORD *)a1 = element2;
      *(_DWORD *)(a1 + 8) = 1;
      return 44;
    case 18:
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t, const char *))(a5 + 48))(a5, a3, a4, "EMPTY"))
      {
        *(_QWORD *)a1 = declClose;
        *(_DWORD *)(a1 + 12) = 39;
        return 42;
      }
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t, const char *))(a5 + 48))(a5, a3, a4, "ANY"))
      {
        *(_QWORD *)a1 = declClose;
        *(_DWORD *)(a1 + 12) = 39;
        return 41;
      }
      break;
    default:
      if (a2 == 28 && !*(_DWORD *)(a1 + 20))
        return 59;
      break;
  }
  *(_QWORD *)a1 = error;
  return 0xFFFFFFFFLL;
}

uint64_t element2(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;
  void *v7;

  result = 51;
  v7 = element7;
  switch(a2)
  {
    case 18:
      goto LABEL_14;
    case 19:
    case 21:
    case 22:
    case 24:
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
      goto LABEL_6;
    case 20:
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t, const char *))(a5 + 48))(a5, a3 + *(int *)(a5 + 128), a4, "PCDATA"))goto LABEL_13;
      result = 43;
      v7 = element3;
      goto LABEL_14;
    case 23:
      *(_DWORD *)(a1 + 8) = 2;
      result = 44;
      v7 = element6;
      goto LABEL_14;
    case 30:
      result = 53;
      goto LABEL_14;
    case 31:
      result = 52;
      goto LABEL_14;
    case 32:
      result = 54;
      goto LABEL_14;
    default:
      if (a2 == 15)
        return 39;
      if (a2 != 41)
      {
LABEL_6:
        if (a2 == 28 && !*(_DWORD *)(a1 + 20))
          return 59;
LABEL_13:
        result = 0xFFFFFFFFLL;
        v7 = error;
      }
LABEL_14:
      *(_QWORD *)a1 = v7;
      return result;
  }
}

uint64_t element3(uint64_t a1, int a2)
{
  if (a2 > 23)
  {
    if (a2 == 36)
    {
      *(_QWORD *)a1 = declClose;
      *(_DWORD *)(a1 + 12) = 39;
      return 46;
    }
    if (a2 == 24)
    {
      *(_QWORD *)a1 = declClose;
      *(_DWORD *)(a1 + 12) = 39;
      return 45;
    }
  }
  else
  {
    if (a2 == 15)
      return 39;
    if (a2 == 21)
    {
      *(_QWORD *)a1 = element4;
      return 39;
    }
  }
  if (a2 == 28 && !*(_DWORD *)(a1 + 20))
    return 59;
  *(_QWORD *)a1 = error;
  return 0xFFFFFFFFLL;
}

uint64_t element6(uint64_t a1, int a2)
{
  uint64_t result;

  if (a2 <= 22)
  {
    if (a2 == 15)
    {
      return 39;
    }
    else if (a2 == 18)
    {
LABEL_6:
      *(_QWORD *)a1 = element7;
      return 51;
    }
    else
    {
LABEL_8:
      if (a2 != 28 || *(_DWORD *)(a1 + 20))
      {
        *(_QWORD *)a1 = error;
        return 0xFFFFFFFFLL;
      }
      else
      {
        return 59;
      }
    }
  }
  else
  {
    switch(a2)
    {
      case 23:
        ++*(_DWORD *)(a1 + 8);
        result = 44;
        break;
      case 24:
      case 25:
      case 26:
      case 27:
      case 28:
      case 29:
        goto LABEL_8;
      case 30:
        *(_QWORD *)a1 = element7;
        result = 53;
        break;
      case 31:
        *(_QWORD *)a1 = element7;
        result = 52;
        break;
      case 32:
        *(_QWORD *)a1 = element7;
        result = 54;
        break;
      default:
        if (a2 != 41)
          goto LABEL_8;
        goto LABEL_6;
    }
  }
  return result;
}

uint64_t element7(uint64_t a1, int a2)
{
  int v2;
  uint64_t result;
  int v4;
  int v5;
  int v6;

  if (a2 <= 34)
  {
    switch(a2)
    {
      case 15:
        return 39;
      case 21:
        *(_QWORD *)a1 = element6;
        return 49;
      case 24:
        v4 = *(_DWORD *)(a1 + 8) - 1;
        *(_DWORD *)(a1 + 8) = v4;
        if (!v4)
        {
          *(_QWORD *)a1 = declClose;
          *(_DWORD *)(a1 + 12) = 39;
        }
        return 45;
      default:
LABEL_21:
        if (a2 != 28 || *(_DWORD *)(a1 + 20))
        {
          *(_QWORD *)a1 = error;
          return 0xFFFFFFFFLL;
        }
        else
        {
          return 59;
        }
    }
  }
  else
  {
    switch(a2)
    {
      case '#':
        v2 = *(_DWORD *)(a1 + 8) - 1;
        *(_DWORD *)(a1 + 8) = v2;
        if (!v2)
        {
          *(_QWORD *)a1 = declClose;
          *(_DWORD *)(a1 + 12) = 39;
        }
        result = 47;
        break;
      case '$':
        v5 = *(_DWORD *)(a1 + 8) - 1;
        *(_DWORD *)(a1 + 8) = v5;
        if (!v5)
        {
          *(_QWORD *)a1 = declClose;
          *(_DWORD *)(a1 + 12) = 39;
        }
        result = 46;
        break;
      case '%':
        v6 = *(_DWORD *)(a1 + 8) - 1;
        *(_DWORD *)(a1 + 8) = v6;
        if (!v6)
        {
          *(_QWORD *)a1 = declClose;
          *(_DWORD *)(a1 + 12) = 39;
        }
        result = 48;
        break;
      case '&':
        *(_QWORD *)a1 = element6;
        result = 50;
        break;
      default:
        goto LABEL_21;
    }
  }
  return result;
}

uint64_t element4(uint64_t a1, int a2)
{
  uint64_t result;
  void *v4;

  if (a2 == 15)
    return 39;
  result = 51;
  v4 = element5;
  if (a2 != 18 && a2 != 41)
  {
    result = 0xFFFFFFFFLL;
    v4 = error;
    if (a2 == 28 && !*(_DWORD *)(a1 + 20))
      return 59;
  }
  *(_QWORD *)a1 = v4;
  return result;
}

uint64_t element5(uint64_t a1, int a2)
{
  switch(a2)
  {
    case 15:
      return 39;
    case 21:
      *(_QWORD *)a1 = element4;
      return 39;
    case 36:
      *(_QWORD *)a1 = declClose;
      *(_DWORD *)(a1 + 12) = 39;
      return 46;
    default:
      if (a2 != 28 || *(_DWORD *)(a1 + 20))
      {
        *(_QWORD *)a1 = error;
        return 0xFFFFFFFFLL;
      }
      else
      {
        return 59;
      }
  }
}

uint64_t notation1(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;
  void *v10;

  if (a2 == 15)
    return 17;
  if (a2 != 18)
  {
    if (a2 == 28 && !*(_DWORD *)(a1 + 20))
      return 59;
    goto LABEL_11;
  }
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t, const char *))(a5 + 48))(a5, a3, a4, "SYSTEM"))
  {
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t, const char *))(a5 + 48))(a5, a3, a4, "PUBLIC"))
    {
      result = 17;
      v10 = notation2;
      goto LABEL_12;
    }
LABEL_11:
    result = 0xFFFFFFFFLL;
    v10 = error;
    goto LABEL_12;
  }
  result = 17;
  v10 = notation3;
LABEL_12:
  *(_QWORD *)a1 = v10;
  return result;
}

uint64_t notation3(uint64_t a1, int a2)
{
  if (a2 == 15)
    return 17;
  if (a2 == 27)
  {
    *(_QWORD *)a1 = declClose;
    *(_DWORD *)(a1 + 12) = 17;
    return 19;
  }
  else if (a2 != 28 || *(_DWORD *)(a1 + 20))
  {
    *(_QWORD *)a1 = error;
    return 0xFFFFFFFFLL;
  }
  else
  {
    return 59;
  }
}

uint64_t notation2(uint64_t a1, int a2)
{
  uint64_t result;
  void *v4;

  if (a2 == 15)
    return 17;
  if (a2 == 27)
  {
    result = 21;
    v4 = notation4;
  }
  else
  {
    result = 0xFFFFFFFFLL;
    v4 = error;
    if (a2 == 28 && !*(_DWORD *)(a1 + 20))
      return 59;
  }
  *(_QWORD *)a1 = v4;
  return result;
}

uint64_t notation4(uint64_t a1, int a2)
{
  void *v3;

  switch(a2)
  {
    case 15:
      return 17;
    case 17:
      if (*(_DWORD *)(a1 + 20))
        v3 = internalSubset;
      else
        v3 = externalSubset1;
      *(_QWORD *)a1 = v3;
      return 20;
    case 27:
      *(_QWORD *)a1 = declClose;
      *(_DWORD *)(a1 + 12) = 17;
      return 19;
    default:
      if (a2 != 28 || *(_DWORD *)(a1 + 20))
      {
        *(_QWORD *)a1 = error;
        return 0xFFFFFFFFLL;
      }
      else
      {
        return 59;
      }
  }
}

uint64_t doctype4(uint64_t a1, int a2)
{
  uint64_t v2;
  void *v3;

  switch(a2)
  {
    case 15:
      return 3;
    case 25:
      v2 = 7;
      v3 = internalSubset;
      goto LABEL_10;
    case 17:
      v2 = 8;
      v3 = prolog2;
LABEL_10:
      *(_QWORD *)a1 = v3;
      return v2;
  }
  v2 = 0xFFFFFFFFLL;
  v3 = error;
  if (a2 != 28 || *(_DWORD *)(a1 + 20))
    goto LABEL_10;
  return 59;
}

uint64_t XmlUtf8Encode(unsigned int a1, _BYTE *a2)
{
  if ((a1 & 0x80000000) != 0)
    return 0;
  if (a1 <= 0x7F)
  {
    *a2 = a1;
    return 1;
  }
  if (a1 <= 0x7FF)
  {
    *a2 = (a1 >> 6) | 0xC0;
    a2[1] = a1 & 0x3F | 0x80;
    return 2;
  }
  if (!HIWORD(a1))
  {
    *a2 = (a1 >> 12) | 0xE0;
    a2[1] = (a1 >> 6) & 0x3F | 0x80;
    a2[2] = a1 & 0x3F | 0x80;
    return 3;
  }
  if (HIWORD(a1) > 0x10u)
    return 0;
  *a2 = (a1 >> 18) | 0xF0;
  a2[1] = (a1 >> 12) & 0x3F | 0x80;
  a2[2] = (a1 >> 6) & 0x3F | 0x80;
  a2[3] = a1 & 0x3F | 0x80;
  return 4;
}

uint64_t XmlUtf16Encode(unsigned int a1, _WORD *a2)
{
  if ((a1 & 0x80000000) != 0)
    return 0;
  if (!HIWORD(a1))
  {
    *a2 = a1;
    return 1;
  }
  if (HIWORD(a1) > 0x10u)
    return 0;
  *a2 = ((a1 + 67043328) >> 10) - 10240;
  a2[1] = a1 & 0x3FF | 0xDC00;
  return 2;
}

uint64_t XmlSizeOfUnknownEncoding()
{
  return 2016;
}

_QWORD *XmlInitUnknownEncoding(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t i;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int v13;
  BOOL v14;
  _BYTE *v16;
  __int16 v17;
  _QWORD *result;
  int v19;
  char *v20;
  char v21;

  memcpy(a1, latin1_encoding, 0x1D0uLL);
  for (i = 0; i != 128; ++i)
  {
    if (*((_BYTE *)&latin1_encoding[17] + i))
      v9 = *((_BYTE *)&latin1_encoding[17] + i) == 28;
    else
      v9 = 1;
    if (!v9 && i != *(_DWORD *)(a2 + 4 * i))
      return 0;
  }
  v10 = 0;
  v11 = 993;
  do
  {
    v12 = *(unsigned int *)(a2 + 4 * v10);
    if ((_DWORD)v12 == -1)
    {
      *((_BYTE *)a1 + v10 + 136) = 1;
      goto LABEL_25;
    }
    if ((v12 & 0x80000000) != 0)
    {
      result = 0;
      if (!a3 || v12 < 0xFFFFFFFC)
        return result;
      *((_BYTE *)a1 + v10 + 136) = 3 - v12;
      *((_BYTE *)a1 + v11 - 1) = 0;
      *((_WORD *)a1 + v10 + 240) = 0;
      goto LABEL_38;
    }
    if (v12 > 0x7F)
    {
      if ((checkCharRefNumber(*(unsigned int *)(a2 + 4 * v10)) & 0x80000000) == 0)
      {
        if (WORD1(v12))
          return 0;
        v19 = v12 >> 5;
        if ((namingBitmap[v19 | (8 * nmstrtPages[v12 >> 8])] & (1 << v12)) != 0)
        {
          v20 = (char *)a1 + v10;
          v21 = 22;
        }
        else
        {
          v20 = (char *)a1 + v10;
          if ((namingBitmap[v19 | (8 * namePages[v12 >> 8])] & (1 << v12)) != 0)
            v21 = 26;
          else
            v21 = 28;
        }
        v20[136] = v21;
        *((_BYTE *)a1 + v11 - 1) = XmlUtf8Encode(v12, (_BYTE *)a1 + v11);
        *((_WORD *)a1 + v10 + 240) = v12;
        goto LABEL_38;
      }
      *((_BYTE *)a1 + v10 + 136) = 0;
LABEL_25:
      *((_WORD *)a1 + v10 + 240) = -1;
      *(_WORD *)((char *)a1 + v11 - 1) = 1;
      goto LABEL_38;
    }
    v13 = *((unsigned __int8 *)&latin1_encoding[17] + v12);
    if (*((_BYTE *)&latin1_encoding[17] + v12))
      v14 = v13 == 28;
    else
      v14 = 1;
    if (!v14 && v10 != v12)
      return 0;
    *((_BYTE *)a1 + v10 + 136) = v13;
    v16 = (char *)a1 + v11;
    *(v16 - 1) = 1;
    *v16 = v12;
    if ((_DWORD)v12)
      v17 = v12;
    else
      v17 = -1;
    *((_WORD *)a1 + v10 + 240) = v17;
LABEL_38:
    ++v10;
    v11 += 4;
  }
  while (v10 != 256);
  a1[58] = a3;
  a1[59] = a4;
  if (a3)
  {
    a1[49] = unknown_isName;
    a1[50] = unknown_isName;
    a1[51] = unknown_isName;
    a1[52] = unknown_isNmstrt;
    a1[53] = unknown_isNmstrt;
    a1[54] = unknown_isNmstrt;
    a1[55] = unknown_isInvalid;
    a1[56] = unknown_isInvalid;
    a1[57] = unknown_isInvalid;
  }
  a1[14] = unknown_toUtf8;
  a1[15] = unknown_toUtf16;
  return a1;
}

uint64_t checkCharRefNumber(uint64_t result)
{
  int v1;

  v1 = (int)result >> 8;
  if ((((int)result >> 8) - 216) < 8)
    return 0xFFFFFFFFLL;
  if (v1 == 255)
  {
    if (result >> 1 == 0x7FFF)
      return 0xFFFFFFFFLL;
  }
  else if (!v1 && !*((_BYTE *)&latin1_encoding[17] + (int)result))
  {
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t unknown_isName(uint64_t a1)
{
  unsigned int v1;

  v1 = (*(uint64_t (**)(_QWORD))(a1 + 464))(*(_QWORD *)(a1 + 472));
  if (HIWORD(v1))
    return 0;
  else
    return namingBitmap[(v1 >> 5) | (8 * namePages[(unint64_t)v1 >> 8])] & (1 << v1);
}

uint64_t unknown_isNmstrt(uint64_t a1)
{
  unsigned int v1;

  v1 = (*(uint64_t (**)(_QWORD))(a1 + 464))(*(_QWORD *)(a1 + 472));
  if (HIWORD(v1))
    return 0;
  else
    return namingBitmap[(v1 >> 5) | (8 * nmstrtPages[(unint64_t)v1 >> 8])] & (1 << v1);
}

uint64_t unknown_isInvalid(uint64_t a1)
{
  uint64_t v1;

  v1 = (*(uint64_t (**)(_QWORD))(a1 + 464))(*(_QWORD *)(a1 + 472));
  if (WORD1(v1))
    return 1;
  else
    return checkCharRefNumber(v1) >> 31;
}

uint64_t unknown_toUtf8(uint64_t a1, uint64_t *a2, unsigned __int8 *a3, void **a4, uint64_t a5)
{
  unsigned __int8 *v6;
  uint64_t v11;
  unsigned int v12;
  _BYTE *v13;
  uint64_t v14;
  unsigned int v15;
  unsigned int v16;
  _BYTE v18[4];

  v6 = (unsigned __int8 *)*a2;
  if (v6 == a3)
    return 0;
  while (1)
  {
    v11 = a1 + 4 * *v6;
    v12 = *(char *)(v11 + 992);
    if (!*(_BYTE *)(v11 + 992))
      break;
    if (a5 - (uint64_t)*a4 < *(char *)(v11 + 992))
      return 2;
    v13 = (_BYTE *)(v11 + 993);
    v14 = (uint64_t)(v6 + 1);
LABEL_7:
    *a2 = v14;
    memcpy(*a4, v13, (int)v12);
    *a4 = (char *)*a4 + (int)v12;
    v6 = (unsigned __int8 *)*a2;
    if ((unsigned __int8 *)*a2 == a3)
      return 0;
  }
  v15 = (*(uint64_t (**)(_QWORD))(a1 + 464))(*(_QWORD *)(a1 + 472));
  v16 = XmlUtf8Encode(v15, v18);
  if (a5 - (uint64_t)*a4 >= v16)
  {
    v12 = v16;
    v14 = *(unsigned __int8 *)(a1 + *(unsigned __int8 *)*a2 + 136) + *a2 - 3;
    v13 = v18;
    goto LABEL_7;
  }
  return 2;
}

uint64_t unknown_toUtf16(uint64_t a1, uint64_t *a2, unint64_t a3, _QWORD *a4, _WORD *a5)
{
  unsigned __int8 *v6;
  _WORD *v11;
  __int16 v12;
  uint64_t v13;
  _WORD *v14;

  v6 = (unsigned __int8 *)*a2;
  if ((unint64_t)v6 >= a3)
    return 0;
  v11 = (_WORD *)*a4;
  while (v11 < a5)
  {
    v12 = *(_WORD *)(a1 + 2 * *v6 + 480);
    if (v12)
    {
      v13 = (uint64_t)(v6 + 1);
    }
    else
    {
      v12 = (*(uint64_t (**)(_QWORD))(a1 + 464))(*(_QWORD *)(a1 + 472));
      v13 = *(unsigned __int8 *)(a1 + *(unsigned __int8 *)*a2 + 136) + *a2 - 3;
    }
    *a2 = v13;
    v14 = (_WORD *)*a4;
    *v14 = v12;
    v11 = v14 + 1;
    *a4 = v11;
    v6 = (unsigned __int8 *)*a2;
    if (*a2 >= a3)
      return 0;
  }
  if (v11 == a5)
    return 2;
  else
    return 0;
}

uint64_t (**XmlGetUtf8InternalEncoding())()
{
  return internal_utf8_encoding;
}

uint64_t (**XmlGetUtf16InternalEncoding())()
{
  return internal_little2_encoding;
}

uint64_t initScanProlog(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, _QWORD *a4)
{
  return initScan(&encodings, a1, 0, a2, a3, a4);
}

uint64_t initScanContent(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, _QWORD *a4)
{
  return initScan(&encodings, a1, 1, a2, a3, a4);
}

uint64_t initUpdatePosition(uint64_t a1, unsigned __int8 *a2, uint64_t a3, _QWORD *a4)
{
  return normal_updatePosition((uint64_t)utf8_encoding, a2, a3, a4);
}

uint64_t XmlParseXmlDecl(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t *a6, _QWORD *a7, uint64_t *a8, _QWORD *a9, int *a10)
{
  return doParseXmlDecl((uint64_t (*)(uint64_t, uint64_t, uint64_t))findEncoding, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
}

uint64_t doParseXmlDecl(uint64_t (*a1)(uint64_t, uint64_t, uint64_t), int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6, uint64_t *a7, _QWORD *a8, uint64_t *a9, _QWORD *a10, int *a11)
{
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t i;
  BOOL v21;
  uint64_t result;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  int v29;
  unsigned int v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char v39;
  uint64_t v40;

  v35 = 0;
  v36 = 0;
  v34 = 0;
  v17 = *(int *)(a3 + 128);
  v37 = a4 + 5 * v17;
  v18 = a5 - 2 * v17;
  v19 = parsePseudoAttribute(a3, v37, v18, &v35, (uint64_t)&v34, (uint64_t)&v36, &v37);
  i = v35;
  if (v19)
    v21 = v35 == 0;
  else
    v21 = 1;
  if (v21)
    goto LABEL_6;
  v23 = v34;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t, const char *))(a3 + 48))(a3, v35, v34, "version"))
  {
    if (a7)
      *a7 = v36;
    v25 = v37;
    if (a8)
      *a8 = v37;
    if (!parsePseudoAttribute(a3, v25, v18, &v35, (uint64_t)&v34, (uint64_t)&v36, &v37))
      goto LABEL_6;
    i = v35;
    if (!v35)
    {
      if (!a2)
        return 1;
LABEL_6:
      i = v37;
      goto LABEL_7;
    }
    v23 = v34;
  }
  else if (!a2)
  {
    goto LABEL_7;
  }
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t, const char *))(a3 + 48))(a3, i, v23, "encoding"))
  {
LABEL_27:
    v27 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, const char *))(a3 + 48))(a3, i, v23, "standalone");
    if (a2 || !v27)
      goto LABEL_7;
    i = v36;
    v28 = v37;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t, const char *))(a3 + 48))(a3, v36, v37 - *(int *)(a3 + 128), "yes"))
    {
      if (!a11)
      {
LABEL_38:
        for (i = v28; ; i += *(int *)(a3 + 128))
        {
          v40 = i;
          v38 = &v39;
          (*(void (**)(uint64_t, uint64_t *, uint64_t, char **, uint64_t *))(a3 + 112))(a3, &v40, v18, &v38, &v40);
          v30 = v38 == &v39 ? -1 : v39;
          v31 = v30 > 0x20;
          v32 = (1 << v30) & 0x100002600;
          if (v31 || v32 == 0)
            break;
        }
        if (i == v18)
          return 1;
LABEL_7:
        result = 0;
        *a6 = i;
        return result;
      }
      v29 = 1;
    }
    else
    {
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t, const char *))(a3 + 48))(a3, i, v28 - *(int *)(a3 + 128), "no"))goto LABEL_7;
      if (!a11)
        goto LABEL_38;
      v29 = 0;
    }
    *a11 = v29;
    goto LABEL_38;
  }
  i = v36;
  v40 = v36;
  v38 = &v39;
  (*(void (**)(uint64_t, uint64_t *, uint64_t, char **, uint64_t *))(a3 + 112))(a3, &v40, v18, &v38, &v40);
  if (v38 == &v39 || (v39 & 0xFFFFFFDF) - 65 > 0x19)
    goto LABEL_7;
  if (a9)
    *a9 = i;
  v26 = v37;
  if (a10)
    *a10 = a1(a3, i, v37 - *(int *)(a3 + 128));
  if (!parsePseudoAttribute(a3, v26, v18, &v35, (uint64_t)&v34, (uint64_t)&v36, &v37))
    goto LABEL_6;
  i = v35;
  if (v35)
  {
    v23 = v34;
    goto LABEL_27;
  }
  return 1;
}

uint64_t (**findEncoding(uint64_t a1, uint64_t a2, uint64_t a3))()
{
  uint64_t v4;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  _OWORD v9[7];
  __int128 v10;
  uint64_t v11;

  v4 = a1;
  v11 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  memset(v9, 0, sizeof(v9));
  v7 = v9;
  v8 = a2;
  (*(void (**)(uint64_t, uint64_t *, uint64_t, _BYTE **, char *))(a1 + 112))(a1, &v8, a3, &v7, (char *)&v10 + 15);
  if (v8 != a3)
    return 0;
  *v7 = 0;
  if (!streqci((unsigned __int8 *)v9, "UTF-16") || *(_DWORD *)(v4 + 128) != 2)
  {
    v6 = 0;
    while (!streqci((unsigned __int8 *)v9, (unsigned __int8 *)getEncodingIndex_encodingNames[v6]))
    {
      if (++v6 == 6)
        return 0;
    }
    if (v6 != 0xFFFFFFFFLL)
      return (&encodings)[v6];
    return 0;
  }
  return (uint64_t (**)())v4;
}

uint64_t (**XmlGetUtf16InternalEncodingNS())()
{
  return internal_little2_encoding_ns;
}

uint64_t initScanContentNS(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, _QWORD *a4)
{
  return initScan(&encodingsNS, a1, 1, a2, a3, a4);
}

uint64_t XmlParseXmlDeclNS(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t *a6, _QWORD *a7, uint64_t *a8, _QWORD *a9, int *a10)
{
  return doParseXmlDecl((uint64_t (*)(uint64_t, uint64_t, uint64_t))findEncodingNS, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
}

uint64_t (**findEncodingNS(uint64_t a1, uint64_t a2, uint64_t a3))()
{
  uint64_t v4;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  _OWORD v9[7];
  __int128 v10;
  uint64_t v11;

  v4 = a1;
  v11 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  memset(v9, 0, sizeof(v9));
  v7 = v9;
  v8 = a2;
  (*(void (**)(uint64_t, uint64_t *, uint64_t, _BYTE **, char *))(a1 + 112))(a1, &v8, a3, &v7, (char *)&v10 + 15);
  if (v8 != a3)
    return 0;
  *v7 = 0;
  if (!streqci((unsigned __int8 *)v9, "UTF-16") || *(_DWORD *)(v4 + 128) != 2)
  {
    v6 = 0;
    while (!streqci((unsigned __int8 *)v9, (unsigned __int8 *)getEncodingIndex_encodingNames[v6]))
    {
      if (++v6 == 6)
        return 0;
    }
    if (v6 != 0xFFFFFFFFLL)
      return (&encodingsNS)[v6];
    return 0;
  }
  return (uint64_t (**)())v4;
}

_QWORD *XmlInitUnknownEncodingNS(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *result;

  result = XmlInitUnknownEncoding(a1, a2, a3, a4);
  if (result)
    *((_BYTE *)result + 194) = 23;
  return result;
}

uint64_t normal_cdataSectionTok(_BYTE *a1, unsigned __int8 *a2, unint64_t a3, unsigned __int8 **a4)
{
  unsigned __int8 *v6;
  int v8;
  uint64_t result;
  unsigned __int8 *v10;
  unint64_t v11;
  uint64_t v12;

  if ((unint64_t)a2 >= a3)
    return 4294967292;
  v6 = a2;
  v8 = a1[*a2 + 136];
  result = 0;
  switch(v8)
  {
    case 0:
    case 1:
    case 8:
      goto LABEL_42;
    case 4:
      v10 = a2 + 1;
      if ((uint64_t)(a3 - (_QWORD)(a2 + 1)) < 1)
        return 0xFFFFFFFFLL;
      if (*v10 != 93)
        goto LABEL_10;
      if ((uint64_t)(a3 - (_QWORD)(a2 + 2)) < 1)
        return 0xFFFFFFFFLL;
      if (a2[2] != 62)
        goto LABEL_10;
      v6 = a2 + 3;
      result = 40;
      goto LABEL_42;
    case 5:
      if ((uint64_t)(a3 - (_QWORD)a2) < 2)
        goto LABEL_31;
      if ((*((unsigned int (**)(_BYTE *, unsigned __int8 *))a1 + 55))(a1, a2))
        goto LABEL_41;
      v10 = v6 + 2;
      goto LABEL_10;
    case 6:
      if ((uint64_t)(a3 - (_QWORD)a2) < 3)
        goto LABEL_31;
      if ((*((unsigned int (**)(_BYTE *, unsigned __int8 *))a1 + 56))(a1, a2))
        goto LABEL_41;
      v10 = v6 + 3;
      goto LABEL_10;
    case 7:
      if ((uint64_t)(a3 - (_QWORD)a2) >= 4)
      {
        if ((*((unsigned int (**)(_BYTE *, unsigned __int8 *))a1 + 57))(a1, a2))
        {
LABEL_41:
          result = 0;
        }
        else
        {
          v10 = v6 + 4;
LABEL_10:
          v11 = a3 - (_QWORD)v10;
          if ((uint64_t)(a3 - (_QWORD)v10) < 1)
          {
            result = 6;
            v6 = v10;
          }
          else
          {
            v6 = v10;
            while (2)
            {
              v12 = 1;
              result = 6;
              switch(a1[*v6 + 136])
              {
                case 0:
                case 1:
                case 4:
                case 8:
                case 9:
                case 0xA:
                  break;
                case 5:
                  if (v11 >= 2)
                  {
                    if ((*((unsigned int (**)(_BYTE *, unsigned __int8 *))a1 + 55))(a1, v6))
                      goto LABEL_23;
                    v12 = 2;
                    goto LABEL_22;
                  }
                  break;
                case 6:
                  if (v11 >= 3)
                  {
                    if ((*((unsigned int (**)(_BYTE *, unsigned __int8 *))a1 + 56))(a1, v6))
                      goto LABEL_23;
                    v12 = 3;
                    goto LABEL_22;
                  }
                  break;
                case 7:
                  if (v11 >= 4)
                  {
                    if ((*((unsigned int (**)(_BYTE *, unsigned __int8 *))a1 + 57))(a1, v6))
                      goto LABEL_23;
                    v12 = 4;
                    goto LABEL_22;
                  }
                  break;
                default:
LABEL_22:
                  v6 += v12;
                  v11 = a3 - (_QWORD)v6;
                  if ((uint64_t)(a3 - (_QWORD)v6) > 0)
                    continue;
LABEL_23:
                  result = 6;
                  break;
              }
              break;
            }
          }
        }
LABEL_42:
        *a4 = v6;
      }
      else
      {
LABEL_31:
        result = 4294967294;
      }
      break;
    case 9:
      if ((uint64_t)(a3 - (_QWORD)(a2 + 1)) < 1)
        return 0xFFFFFFFFLL;
      if (a1[a2[1] + 136] == 10)
        v6 = a2 + 2;
      else
        v6 = a2 + 1;
LABEL_37:
      result = 7;
      goto LABEL_42;
    case 10:
      v6 = a2 + 1;
      goto LABEL_37;
    default:
      v10 = a2 + 1;
      goto LABEL_10;
  }
  return result;
}

uint64_t normal_ignoreSectionTok(_BYTE *a1, unsigned __int8 *a2, uint64_t a3, unsigned __int8 **a4)
{
  unint64_t v4;
  unsigned __int8 *v7;
  int v9;
  uint64_t result;
  unsigned __int8 *v11;

  v4 = a3 - (_QWORD)a2;
  if (a3 - (uint64_t)a2 < 1)
    return 0xFFFFFFFFLL;
  v7 = a2;
  v9 = 0;
  while (2)
  {
    result = 0;
    switch(a1[*v7 + 136])
    {
      case 0:
      case 1:
      case 8:
        goto LABEL_31;
      case 2:
        v11 = v7 + 1;
        if (a3 - (uint64_t)(v7 + 1) < 1)
          return 0xFFFFFFFFLL;
        if (*v11 != 33)
          goto LABEL_26;
        v11 = v7 + 2;
        if (a3 - (uint64_t)(v7 + 2) < 1)
          return 0xFFFFFFFFLL;
        if (*v11 == 91)
        {
          v11 = v7 + 3;
          ++v9;
        }
        goto LABEL_26;
      case 4:
        v11 = v7 + 1;
        if (a3 - (uint64_t)(v7 + 1) < 1)
          return 0xFFFFFFFFLL;
        if (*v11 != 93)
          goto LABEL_26;
        v11 = v7 + 2;
        if (a3 - (uint64_t)(v7 + 2) < 1)
          return 0xFFFFFFFFLL;
        if (*v11 != 62)
          goto LABEL_26;
        v11 = v7 + 3;
        if (v9)
        {
          --v9;
LABEL_26:
          v4 = a3 - (_QWORD)v11;
          v7 = v11;
          if (a3 - (uint64_t)v11 <= 0)
            return 0xFFFFFFFFLL;
          continue;
        }
        result = 42;
        v7 += 3;
LABEL_31:
        *a4 = v7;
        return result;
      case 5:
        if (v4 < 2)
          return 4294967294;
        if ((*((unsigned int (**)(_BYTE *, unsigned __int8 *))a1 + 55))(a1, v7))
          goto LABEL_30;
        v11 = v7 + 2;
        goto LABEL_26;
      case 6:
        if (v4 < 3)
          return 4294967294;
        if ((*((unsigned int (**)(_BYTE *, unsigned __int8 *))a1 + 56))(a1, v7))
          goto LABEL_30;
        v11 = v7 + 3;
        goto LABEL_26;
      case 7:
        if (v4 < 4)
          return 4294967294;
        if ((*((unsigned int (**)(_BYTE *, unsigned __int8 *))a1 + 57))(a1, v7))
        {
LABEL_30:
          result = 0;
          goto LABEL_31;
        }
        v11 = v7 + 4;
        goto LABEL_26;
      default:
        v11 = v7 + 1;
        goto LABEL_26;
    }
  }
}

uint64_t normal_entityValueTok(uint64_t a1, unsigned __int8 *a2, unint64_t a3, unsigned __int8 **a4)
{
  unsigned __int8 *v4;
  uint64_t v5;
  uint64_t result;
  unsigned __int8 *v7;

  if ((unint64_t)a2 >= a3)
    return 4294967292;
  if ((uint64_t)(a3 - (_QWORD)a2) < 1)
    return 0xFFFFFFFFLL;
  v4 = a2;
  while (2)
  {
    v5 = 2;
    switch(*(_BYTE *)(a1 + *v4 + 136))
    {
      case 3:
        if (v4 != a2)
          goto LABEL_10;
        return normal_scanRef(a1, a2 + 1, a3, a4);
      case 4:
      case 8:
        goto LABEL_8;
      case 5:
        goto LABEL_9;
      case 6:
        v5 = 3;
        goto LABEL_9;
      case 7:
        v5 = 4;
        goto LABEL_9;
      case 9:
        if (v4 != a2)
          goto LABEL_10;
        v7 = a2 + 1;
        if ((uint64_t)(a3 - (_QWORD)(a2 + 1)) < 1)
          return 4294967293;
        if (*(_BYTE *)(a1 + a2[1] + 136) == 10)
          v7 = a2 + 2;
LABEL_23:
        *a4 = v7;
        return 7;
      case 0xA:
        if (v4 != a2)
          goto LABEL_10;
        v7 = a2 + 1;
        goto LABEL_23;
      default:
        if (*(_BYTE *)(a1 + *v4 + 136) != 30)
        {
LABEL_8:
          v5 = 1;
LABEL_9:
          v4 += v5;
          if ((uint64_t)(a3 - (_QWORD)v4) <= 0)
            goto LABEL_10;
          continue;
        }
        if (v4 == a2)
        {
          LODWORD(result) = normal_scanPercent(a1, a2 + 1, a3, a4);
          if ((_DWORD)result == 22)
            return 0;
          else
            return result;
        }
        else
        {
LABEL_10:
          *a4 = v4;
          return 6;
        }
    }
  }
}

BOOL normal_nameMatchesAscii(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, _BYTE *a4)
{
  int v4;
  unsigned __int8 *v5;
  uint64_t v6;
  BOOL v7;
  int v8;

  v4 = *a4;
  if (!*a4)
    return a2 == a3;
  v5 = a4 + 1;
  v6 = a3 - a2;
  while (1)
  {
    v7 = v6-- < 1;
    if (v7 || *a2 != v4)
      break;
    ++a2;
    v8 = *v5++;
    v4 = v8;
    if (!v8)
      return a2 == a3;
  }
  return 0;
}

uint64_t normal_charRefNumber(uint64_t a1, unsigned __int8 *a2)
{
  int v2;
  int v3;
  uint64_t v4;
  unsigned __int8 *v5;
  int v6;
  unsigned __int8 *v7;
  unsigned int v8;
  int v9;

  v2 = a2[2];
  if (v2 == 59)
  {
LABEL_4:
    v4 = 0;
    return checkCharRefNumber(v4);
  }
  if (v2 == 120)
  {
    v3 = a2[3];
    if (v3 == 59)
      goto LABEL_4;
    v4 = 0;
    v7 = a2 + 4;
    while (1)
    {
      v8 = (char)v3 - 48;
      if (v8 <= 0x36)
      {
        if (((1 << v8) & 0x3FF) != 0)
        {
          v4 = v8 | (16 * (_DWORD)v4);
          goto LABEL_18;
        }
        if (((1 << v8) & 0x7E0000) != 0)
        {
          v4 = ((char)v3 + 16 * v4 - 55);
LABEL_18:
          if ((int)v4 >= 1114112)
            return 0xFFFFFFFFLL;
          goto LABEL_19;
        }
        if (((1 << v8) & 0x7E000000000000) != 0)
        {
          v4 = ((char)v3 + 16 * v4 - 87);
          goto LABEL_18;
        }
      }
LABEL_19:
      v9 = *v7++;
      LOBYTE(v3) = v9;
      if (v9 == 59)
        return checkCharRefNumber(v4);
    }
  }
  LODWORD(v4) = 0;
  v5 = a2 + 3;
  while (1)
  {
    v4 = (10 * v4 + (char)v2 - 48);
    if ((int)v4 >= 1114112)
      break;
    v6 = *v5++;
    LOBYTE(v2) = v6;
    if (v6 == 59)
      return checkCharRefNumber(v4);
  }
  return 0xFFFFFFFFLL;
}

uint64_t normal_predefinedEntityName(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  unsigned int v5;
  int v7;

  v3 = a3 - (_QWORD)a2;
  if (a3 - (_QWORD)a2 == 4)
  {
    v7 = (char)*a2;
    if (v7 == 97)
    {
      if (a2[1] == 112 && a2[2] == 111 && a2[3] == 115)
        return 39;
    }
    else if (v7 == 113 && a2[1] == 117 && a2[2] == 111 && a2[3] == 116)
    {
      return 34;
    }
    return 0;
  }
  if (v3 == 3)
  {
    if (*a2 == 97 && a2[1] == 109 && a2[2] == 112)
      return 38;
    return 0;
  }
  if (v3 != 2 || a2[1] != 116)
    return 0;
  v4 = *a2;
  if (v4 == 103)
    v5 = 62;
  else
    v5 = 0;
  if (v4 == 108)
    return 60;
  else
    return v5;
}

uint64_t normal_isPublicId(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  unsigned __int8 *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t result;

  v4 = (unsigned __int8 *)(a2 + 1);
  v5 = ~(a2 + 1) + a3;
  if (v5 >= 1)
  {
    do
    {
      v6 = *v4;
      v7 = (char)v6;
      v8 = *(unsigned __int8 *)(a1 + v6 + 136);
      if (v8 <= 0x23)
      {
        if (((1 << v8) & 0xFCB8FE600) != 0)
          goto LABEL_4;
        if (((1 << v8) & 0x4400000) != 0)
        {
          if ((v7 & 0x80000000) == 0)
            goto LABEL_4;
        }
        else if (v8 == 21)
        {
          if (v7 == 9)
            goto LABEL_14;
          goto LABEL_4;
        }
      }
      if (v7 != 64 && v7 != 36)
      {
LABEL_14:
        result = 0;
        *a4 = v4;
        return result;
      }
LABEL_4:
      ++v4;
      --v5;
    }
    while (v5 > 0);
  }
  return 1;
}

uint64_t latin1_toUtf8(uint64_t a1, char **a2, char *a3, _BYTE **a4, _BYTE *a5)
{
  char *i;
  int v6;
  _BYTE *v7;
  char v8;
  _BYTE *v9;
  char v10;
  char *v11;

  while (2)
  {
    for (i = *a2; ; *a2 = i)
    {
      if (i == a3)
        return 0;
      v6 = *i;
      v7 = *a4;
      if ((v6 & 0x80000000) == 0)
        break;
      if (a5 - v7 < 2)
        return 2;
      *a4 = v7 + 1;
      *v7 = (v6 >> 6) | 0xC0;
      v8 = v6 & 0x3F | 0x80;
      v9 = (*a4)++;
      *v9 = v8;
      i = *a2 + 1;
    }
    if (v7 != a5)
    {
      *a2 = i + 1;
      v10 = *i;
      v11 = (*a4)++;
      *v11 = v10;
      continue;
    }
    break;
  }
  return 2;
}

uint64_t latin1_toUtf16(uint64_t a1, unint64_t *a2, unint64_t a3, _QWORD *a4, _WORD *a5)
{
  unsigned __int8 *v5;
  _WORD *v6;
  _WORD *v7;

  v5 = (unsigned __int8 *)*a2;
  if (*a2 >= a3)
    return 0;
  v6 = (_WORD *)*a4;
  while (v6 < a5)
  {
    *a2 = (unint64_t)(v5 + 1);
    v7 = (_WORD *)*a4;
    *v7 = *v5;
    v6 = v7 + 1;
    *a4 = v6;
    v5 = (unsigned __int8 *)*a2;
    if (*a2 >= a3)
      return 0;
  }
  if (v6 == a5)
    return 2;
  else
    return 0;
}

uint64_t normal_scanLit(int a1, _BYTE *a2, unsigned __int8 *a3, uint64_t a4, unsigned __int8 **a5)
{
  unint64_t v5;
  unsigned __int8 *v8;
  int v11;
  uint64_t result;
  unsigned int v13;
  BOOL v14;
  int v15;

  v5 = a4 - (_QWORD)a3;
  if (a4 - (uint64_t)a3 < 1)
    return 0xFFFFFFFFLL;
  v8 = a3;
  while (2)
  {
    v11 = a2[*v8 + 136];
    switch(a2[*v8 + 136])
    {
      case 0:
      case 1:
      case 8:
        goto LABEL_19;
      case 5:
        if (v5 < 2)
          return 4294967294;
        if ((*((unsigned int (**)(_BYTE *, unsigned __int8 *))a2 + 55))(a2, v8))
          goto LABEL_19;
        v8 += 2;
        goto LABEL_16;
      case 6:
        if (v5 < 3)
          return 4294967294;
        if ((*((unsigned int (**)(_BYTE *, unsigned __int8 *))a2 + 56))(a2, v8))
          goto LABEL_19;
        v8 += 3;
        goto LABEL_16;
      case 7:
        if (v5 >= 4)
        {
          if ((*((unsigned int (**)(_BYTE *, unsigned __int8 *))a2 + 57))(a2, v8))
          {
LABEL_19:
            result = 0;
            *a5 = v8;
            return result;
          }
          v8 += 4;
LABEL_16:
          v5 = a4 - (_QWORD)v8;
          if (a4 - (uint64_t)v8 <= 0)
            return 0xFFFFFFFFLL;
          continue;
        }
        return 4294967294;
      case 0xC:
      case 0xD:
        ++v8;
        if (v11 != a1)
          goto LABEL_16;
        if (a4 - (uint64_t)v8 < 1)
          return 4294967269;
        *a5 = v8;
        v13 = a2[*v8 + 136];
        v14 = v13 > 0x1E;
        v15 = (1 << v13) & 0x40300E00;
        if (v14 || v15 == 0)
          return 0;
        else
          return 27;
      default:
        ++v8;
        goto LABEL_16;
    }
  }
}

uint64_t normal_scanDecl(_BYTE *a1, unsigned __int8 *a2, uint64_t a3, unsigned __int8 **a4)
{
  unsigned __int8 *v4;
  uint64_t v5;
  uint64_t result;
  unsigned int v7;
  BOOL v8;
  int v9;

  if (a3 - (uint64_t)a2 < 1)
    return 0xFFFFFFFFLL;
  switch(a1[*a2 + 136])
  {
    case 0x14:
      *a4 = a2 + 1;
      result = 33;
      break;
    case 0x16:
    case 0x18:
      v4 = a2 + 1;
      v5 = a3 - (_QWORD)(a2 + 1);
      if (v5 < 1)
        return 0xFFFFFFFFLL;
      while (2)
      {
        switch(a1[*v4 + 136])
        {
          case 0x15:
            goto LABEL_11;
          case 0x16:
          case 0x18:
            ++v4;
            if (--v5 <= 0)
              return 0xFFFFFFFFLL;
            continue;
          case 0x17:
          case 0x19:
          case 0x1A:
          case 0x1B:
          case 0x1C:
          case 0x1D:
            goto LABEL_17;
          case 0x1E:
            if ((unint64_t)v5 < 2)
              return 0xFFFFFFFFLL;
            v7 = a1[v4[1] + 136];
            v8 = v7 > 0x1E;
            v9 = (1 << v7) & 0x40200600;
            if (!v8 && v9 != 0)
              goto LABEL_17;
            goto LABEL_11;
          default:
            if (a1[*v4 + 136] - 9 >= 2)
            {
LABEL_17:
              result = 0;
              *a4 = v4;
            }
            else
            {
LABEL_11:
              *a4 = v4;
              result = 16;
            }
            break;
        }
        break;
      }
      break;
    case 0x1B:
      result = normal_scanComment(a1, a2 + 1, a3, a4);
      break;
    default:
      result = 0;
      *a4 = a2;
      break;
  }
  return result;
}

uint64_t normal_scanPercent(uint64_t a1, unsigned __int8 *a2, uint64_t a3, unsigned __int8 **a4)
{
  unint64_t v4;
  unsigned __int8 *v6;
  uint64_t result;
  uint64_t v10;
  unint64_t v11;
  unsigned int v12;
  uint64_t v13;

  v4 = a3 - (_QWORD)a2;
  if (a3 - (uint64_t)a2 < 1)
    return 0xFFFFFFFFLL;
  v6 = a2;
  result = 0;
  v10 = 1;
  switch(*(_BYTE *)(a1 + *a2 + 136))
  {
    case 5:
      if (v4 < 2)
        return 4294967294;
      if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 440))(a1, a2))
        goto LABEL_16;
      result = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(a1 + 416))(a1, v6);
      if (!(_DWORD)result)
        goto LABEL_17;
      v10 = 2;
      break;
    case 6:
      if (v4 < 3)
        return 4294967294;
      if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 448))(a1, a2))
        goto LABEL_16;
      result = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(a1 + 424))(a1, v6);
      if (!(_DWORD)result)
        goto LABEL_17;
      v10 = 3;
      break;
    case 7:
      if (v4 < 4)
        return 4294967294;
      if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 456))(a1, a2))
        goto LABEL_16;
      result = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(a1 + 432))(a1, v6);
      if (!(_DWORD)result)
        goto LABEL_17;
      v10 = 4;
      break;
    case 9:
    case 0xA:
    case 0x15:
      result = 22;
      goto LABEL_17;
    case 0x16:
    case 0x18:
      break;
    default:
      goto LABEL_17;
  }
  v6 += v10;
  v11 = a3 - (_QWORD)v6;
  if (a3 - (uint64_t)v6 < 1)
    return 0xFFFFFFFFLL;
  while (1)
  {
    v12 = *(unsigned __int8 *)(a1 + *v6 + 136);
    if (v12 > 0x11)
      break;
    switch(v12)
    {
      case 5u:
        if (v11 < 2)
          return 4294967294;
        if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 440))(a1, v6))
          goto LABEL_16;
        result = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(a1 + 392))(a1, v6);
        if (!(_DWORD)result)
          goto LABEL_17;
        v13 = 2;
        break;
      case 6u:
        if (v11 < 3)
          return 4294967294;
        if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 448))(a1, v6))
          goto LABEL_16;
        result = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(a1 + 400))(a1, v6);
        if (!(_DWORD)result)
          goto LABEL_17;
        v13 = 3;
        break;
      case 7u:
        if (v11 < 4)
          return 4294967294;
        if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 456))(a1, v6))
          goto LABEL_16;
        result = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(a1 + 408))(a1, v6);
        if (!(_DWORD)result)
          goto LABEL_17;
        v13 = 4;
        break;
      default:
        goto LABEL_16;
    }
LABEL_44:
    v6 += v13;
    v11 = a3 - (_QWORD)v6;
    if (a3 - (uint64_t)v6 <= 0)
      return 0xFFFFFFFFLL;
  }
  if (v12 - 24 < 4 || v12 == 22)
  {
    v13 = 1;
    goto LABEL_44;
  }
  if (v12 != 18)
  {
LABEL_16:
    result = 0;
    goto LABEL_17;
  }
  ++v6;
  result = 28;
LABEL_17:
  *a4 = v6;
  return result;
}

uint64_t normal_scanComment(_BYTE *a1, unsigned __int8 *a2, uint64_t a3, unsigned __int8 **a4)
{
  unsigned __int8 *v5;
  unint64_t v7;
  uint64_t result;
  unsigned __int8 *v10;
  int v11;

  if (a3 - (uint64_t)a2 < 1)
    return 0xFFFFFFFFLL;
  v5 = a2;
  if (*a2 != 45)
  {
LABEL_22:
    result = 0;
    goto LABEL_23;
  }
  v5 = a2 + 1;
  v7 = a3 - (_QWORD)(a2 + 1);
  if ((uint64_t)v7 < 1)
    return 0xFFFFFFFFLL;
  while (2)
  {
    result = 0;
    switch(a1[*v5 + 136])
    {
      case 0:
      case 1:
      case 8:
        goto LABEL_23;
      case 2:
      case 3:
      case 4:
        goto LABEL_12;
      case 5:
        if (v7 < 2)
          return 4294967294;
        if ((*((unsigned int (**)(_BYTE *, unsigned __int8 *))a1 + 55))(a1, v5))
          goto LABEL_22;
        v10 = v5 + 2;
        goto LABEL_19;
      case 6:
        if (v7 < 3)
          return 4294967294;
        if ((*((unsigned int (**)(_BYTE *, unsigned __int8 *))a1 + 56))(a1, v5))
          goto LABEL_22;
        v10 = v5 + 3;
        goto LABEL_19;
      case 7:
        if (v7 < 4)
          return 4294967294;
        if ((*((unsigned int (**)(_BYTE *, unsigned __int8 *))a1 + 57))(a1, v5))
          goto LABEL_22;
        v10 = v5 + 4;
        goto LABEL_19;
      default:
        if (a1[*v5 + 136] != 27)
        {
LABEL_12:
          v10 = v5 + 1;
LABEL_19:
          v7 = a3 - (_QWORD)v10;
          v5 = v10;
          if (a3 - (uint64_t)v10 <= 0)
            return 0xFFFFFFFFLL;
          continue;
        }
        v10 = v5 + 1;
        if (a3 - (uint64_t)(v5 + 1) < 1)
          return 0xFFFFFFFFLL;
        if (*v10 != 45)
          goto LABEL_19;
        if (a3 - (uint64_t)(v5 + 2) < 1)
          return 0xFFFFFFFFLL;
        v11 = v5[2];
        if (v11 == 62)
          v5 += 3;
        else
          v5 += 2;
        if (v11 == 62)
          result = 13;
        else
          result = 0;
LABEL_23:
        *a4 = v5;
        return result;
    }
  }
}

uint64_t normal_scanRef(uint64_t a1, unsigned __int8 *a2, uint64_t a3, unsigned __int8 **a4)
{
  unint64_t v4;
  unsigned __int8 *v7;
  uint64_t result;
  unsigned int v10;
  uint64_t v11;
  unint64_t v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  unsigned int v22;
  int v23;

  v4 = a3 - (_QWORD)a2;
  if (a3 - (uint64_t)a2 < 1)
    return 0xFFFFFFFFLL;
  v7 = a2;
  result = 0;
  v10 = *(unsigned __int8 *)(a1 + *a2 + 136);
  if (v10 <= 0x12)
  {
    switch(v10)
    {
      case 5u:
        if (v4 >= 2)
        {
          if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 440))(a1, a2))
            goto LABEL_59;
          result = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(a1 + 416))(a1, v7);
          if (!(_DWORD)result)
            goto LABEL_60;
          v11 = 2;
          goto LABEL_18;
        }
        break;
      case 6u:
        if (v4 >= 3)
        {
          if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 448))(a1, a2))
            goto LABEL_59;
          result = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(a1 + 424))(a1, v7);
          if (!(_DWORD)result)
            goto LABEL_60;
          v11 = 3;
          goto LABEL_18;
        }
        break;
      case 7u:
        if (v4 >= 4)
        {
          if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 456))(a1, a2))
            goto LABEL_59;
          result = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(a1 + 432))(a1, v7);
          if (!(_DWORD)result)
            goto LABEL_60;
          v11 = 4;
LABEL_18:
          v7 += v11;
          v13 = a3 - (_QWORD)v7;
          if (a3 - (uint64_t)v7 >= 1)
          {
            while (1)
            {
              v14 = *(unsigned __int8 *)(a1 + *v7 + 136);
              if (v14 > 0x11)
              {
                if (v14 - 24 >= 4 && v14 != 22)
                {
                  if (v14 == 18)
                  {
                    ++v7;
                    result = 9;
                    goto LABEL_60;
                  }
LABEL_59:
                  result = 0;
                  goto LABEL_60;
                }
                v15 = 1;
              }
              else
              {
                switch(v14)
                {
                  case 5u:
                    if (v13 < 2)
                      return 4294967294;
                    if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 440))(a1, v7))
                      goto LABEL_59;
                    result = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(a1 + 392))(a1, v7);
                    if (!(_DWORD)result)
                      goto LABEL_60;
                    v15 = 2;
                    break;
                  case 6u:
                    if (v13 < 3)
                      return 4294967294;
                    if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 448))(a1, v7))
                      goto LABEL_59;
                    result = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(a1 + 400))(a1, v7);
                    if (!(_DWORD)result)
                      goto LABEL_60;
                    v15 = 3;
                    break;
                  case 7u:
                    if (v13 < 4)
                      return 4294967294;
                    if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 456))(a1, v7))
                      goto LABEL_59;
                    result = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(a1 + 408))(a1, v7);
                    if (!(_DWORD)result)
                      goto LABEL_60;
                    v15 = 4;
                    break;
                  default:
                    goto LABEL_59;
                }
              }
              v7 += v15;
              v13 = a3 - (_QWORD)v7;
              if (a3 - (uint64_t)v7 <= 0)
                return 0xFFFFFFFFLL;
            }
          }
          return 0xFFFFFFFFLL;
        }
        break;
      default:
        goto LABEL_60;
    }
    return 4294967294;
  }
  if (v10 != 19)
  {
    if (v10 == 22 || v10 == 24)
    {
      v11 = 1;
      goto LABEL_18;
    }
LABEL_60:
    *a4 = v7;
    return result;
  }
  if (a3 - (uint64_t)(a2 + 1) >= 1)
  {
    v17 = a2[1];
    if (v17 != 120)
    {
      if (*(_BYTE *)(a1 + v17 + 136) != 25)
      {
        result = 0;
        v7 = a2 + 1;
        goto LABEL_60;
      }
      v7 = a2 + 2;
      v20 = v4 - 2;
      while (v20-- >= 1)
      {
        v22 = *v7++;
        v23 = *(unsigned __int8 *)(a1 + v22 + 136);
        if (v23 != 25)
        {
          if (v23 != 18)
          {
            result = 0;
            --v7;
            goto LABEL_60;
          }
          goto LABEL_77;
        }
      }
      return 0xFFFFFFFFLL;
    }
    if (a3 - (uint64_t)(a2 + 2) >= 1)
    {
      if ((*(_BYTE *)(a1 + a2[2] + 136) & 0xFE) != 0x18)
      {
        result = 0;
        v7 = a2 + 2;
        goto LABEL_60;
      }
      v7 = a2 + 3;
      v18 = a3 - (_QWORD)(a2 + 3);
      if (v18 >= 1)
      {
        result = 0xFFFFFFFFLL;
        while (1)
        {
          v19 = *(unsigned __int8 *)(a1 + *v7 + 136);
          if ((v19 - 24) >= 2)
            break;
          ++v7;
          if (--v18 <= 0)
            return result;
        }
        if (v19 != 18)
          goto LABEL_59;
        ++v7;
LABEL_77:
        result = 10;
        goto LABEL_60;
      }
    }
  }
  return 0xFFFFFFFFLL;
}

uint64_t utf8_toUtf16(uint64_t a1, unint64_t *a2, unint64_t a3, _WORD **a4, unint64_t a5)
{
  _WORD *v5;
  unsigned __int8 *v6;
  _BOOL4 v7;
  uint64_t result;
  uint64_t v10;
  int v11;
  unsigned __int8 v12;
  __int16 v13;

  v5 = *a4;
  v6 = (unsigned __int8 *)*a2;
  v7 = *a2 < a3;
  if (*a2 < a3 && (unint64_t)v5 < a5)
  {
    do
    {
      v10 = *v6;
      v11 = *(unsigned __int8 *)(a1 + v10 + 136);
      switch(v11)
      {
        case 7:
          if ((uint64_t)(a5 - (_QWORD)v5) < 4)
          {
            result = 2;
            goto LABEL_25;
          }
          if ((uint64_t)(a3 - (_QWORD)v6) < 4)
          {
LABEL_23:
            result = 1;
            goto LABEL_25;
          }
          v12 = v6[2];
          v13 = v6[3] & 0x3F;
          *v5 = (((((v6[1] & 0x3F) << 12) & 0xFFE3F03F | ((*v6 & 7) << 18) | ((v12 & 0x3F) << 6)) + 16711680) >> 10) | 0xD800;
          v5[1] = v13 & 0xF03F | ((v12 & 0x3F) << 6) | 0xDC00;
          v5 += 2;
          v6 += 4;
          break;
        case 6:
          if ((uint64_t)(a3 - (_QWORD)v6) < 3)
            goto LABEL_23;
          *v5++ = ((_WORD)v10 << 12) | ((v6[1] & 0x3F) << 6) | v6[2] & 0x3F;
          v6 += 3;
          break;
        case 5:
          if ((uint64_t)(a3 - (_QWORD)v6) < 2)
            goto LABEL_23;
          *v5++ = v6[1] & 0x3F | ((v10 & 0x1F) << 6);
          v6 += 2;
          break;
        default:
          ++v6;
          *v5++ = (char)v10;
          break;
      }
      v7 = (unint64_t)v6 < a3;
    }
    while ((unint64_t)v6 < a3 && (unint64_t)v5 < a5);
  }
  if (v7)
    result = 2;
  else
    result = 0;
LABEL_25:
  *a2 = (unint64_t)v6;
  *a4 = v5;
  return result;
}

uint64_t utf8_isName2(uint64_t a1, unsigned __int8 *a2)
{
  return (1 << a2[1]) & namingBitmap[(2 * (*a2 & 3)) | (8 * namePages[((unint64_t)*a2 >> 2) & 7]) | (a2[1] >> 5) & 1];
}

uint64_t utf8_isName3(uint64_t a1, _BYTE *a2)
{
  return (1 << a2[2]) & namingBitmap[(2 * (a2[1] & 3)) | (8
                                                                      * namePages[(16 * (*a2 & 0xF)) | ((unint64_t)a2[1] >> 2) & 0xF]) | (a2[2] >> 5) & 1];
}

uint64_t isNever()
{
  return 0;
}

uint64_t utf8_isNmstrt2(uint64_t a1, unsigned __int8 *a2)
{
  return (1 << a2[1]) & namingBitmap[(2 * (*a2 & 3)) | (8
                                                                    * nmstrtPages[((unint64_t)*a2 >> 2) & 7]) | (a2[1] >> 5) & 1];
}

uint64_t utf8_isNmstrt3(uint64_t a1, _BYTE *a2)
{
  return (1 << a2[2]) & namingBitmap[(2 * (a2[1] & 3)) | (8
                                                                      * nmstrtPages[(16 * (*a2 & 0xF)) | ((unint64_t)a2[1] >> 2) & 0xF]) | (a2[2] >> 5) & 1];
}

BOOL utf8_isInvalid2(uint64_t a1, unsigned __int8 *a2)
{
  if (*a2 < 0xC2u)
    return 1;
  if ((a2[1] & 0x80u) != 0)
    return a2[1] > 0xBFu;
  return 1;
}

uint64_t utf8_isInvalid4(uint64_t a1, unsigned __int8 *a2)
{
  int v3;
  unsigned int v4;
  unsigned int v5;
  _BOOL4 v6;

  if ((char)a2[3] > -65 || (char)a2[2] > -65)
    return 1;
  v3 = *a2;
  v4 = a2[1];
  if (v3 == 240)
    return (v4 + 64) < 0xD0u;
  if (v3 == 244)
    v5 = 143;
  else
    v5 = 191;
  v6 = v4 > v5;
  return (v4 & 0x80) == 0 || v6;
}

uint64_t little2_prologTok(uint64_t a1, unsigned __int8 *a2, unint64_t a3, uint64_t *a4)
{
  uint64_t v6;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  unsigned __int8 *v11;
  int v12;
  unsigned int v13;
  int v14;
  int v15;
  unsigned __int8 *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned __int8 *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int v24;
  _BYTE *v25;
  uint64_t v26;
  unsigned __int8 *v27;
  uint64_t v28;
  int v29;
  unsigned __int8 *v32;
  int v33;
  int v34;
  int v35;

  if ((unint64_t)a2 >= a3)
    return 4294967292;
  if (((a3 - (_QWORD)a2) & 0xFFFFFFFFFFFFFFFELL) == 0 || ((a3 - (_QWORD)a2) & 1) == 0)
    v6 = a3;
  else
    v6 = (uint64_t)&a2[(a3 - (_QWORD)a2) & 0xFFFFFFFFFFFFFFFELL];
  if (a3 - (_QWORD)a2 == 1)
    return 0xFFFFFFFFLL;
  v9 = a2[1];
  if (a2[1] > 0xDBu)
  {
    if ((v9 - 220) < 4)
      goto LABEL_16;
    if ((_DWORD)v9 == 255)
    {
      LODWORD(v10) = *a2;
      if (v10 > 0xFD)
        goto LABEL_16;
      goto LABEL_29;
    }
LABEL_28:
    LODWORD(v10) = *a2;
LABEL_29:
    v13 = v10 >> 5;
    v14 = namingBitmap[(v10 >> 5) | (8 * nmstrtPages[v9])];
    v15 = 1 << v10;
    if ((v15 & v14) != 0)
    {
      result = 18;
    }
    else
    {
      if ((namingBitmap[v13 | (8 * namePages[v9])] & v15) == 0)
        goto LABEL_16;
LABEL_32:
      result = 19;
    }
LABEL_33:
    v16 = a2 + 2;
    v17 = v6 - (_QWORD)(a2 + 2);
    if (v17 < 2)
      return -(int)result;
    while (1)
    {
      v18 = v16[1];
      if (v16[1] > 0xDBu)
        break;
      if (v16[1])
      {
        if ((v18 - 216) < 4)
        {
LABEL_75:
          if ((unint64_t)v17 < 4)
            return 4294967294;
LABEL_76:
          result = 0;
LABEL_77:
          *a4 = (uint64_t)v16;
          return result;
        }
LABEL_49:
        LODWORD(v19) = *v16;
        goto LABEL_50;
      }
      v19 = *v16;
      switch(*(_BYTE *)(a1 + v19 + 136))
      {
        case 6:
          if ((unint64_t)v17 >= 3)
            goto LABEL_76;
          return 4294967294;
        case 7:
          goto LABEL_75;
        case 9:
        case 0xA:
        case 0xB:
        case 0x14:
        case 0x15:
        case 0x1E:
        case 0x20:
        case 0x23:
        case 0x24:
          goto LABEL_77;
        case 0xF:
          if ((_DWORD)result == 19)
            goto LABEL_76;
          *a4 = (uint64_t)(v16 + 2);
          return 30;
        case 0x16:
        case 0x18:
        case 0x19:
        case 0x1A:
        case 0x1B:
          goto LABEL_51;
        case 0x17:
          v20 = v16 + 2;
          if ((_DWORD)result == 41)
            goto LABEL_42;
          if ((_DWORD)result != 18)
            break;
          v21 = v6 - (_QWORD)v20;
          if (v6 - (uint64_t)v20 < 2)
            return 0xFFFFFFFFLL;
          v22 = v16[3];
          if (v16[3] > 0xDBu)
          {
            if ((v22 - 220) < 4)
              goto LABEL_42;
            if ((_DWORD)v22 == 255)
            {
              LODWORD(v23) = *v20;
              if (v23 > 0xFD)
              {
LABEL_42:
                result = 19;
                break;
              }
              goto LABEL_64;
            }
LABEL_63:
            LODWORD(v23) = *v20;
            goto LABEL_64;
          }
          if (v16[3])
          {
            if ((v22 - 216) < 4)
              goto LABEL_72;
            goto LABEL_63;
          }
          v23 = *v20;
          v24 = *(unsigned __int8 *)(a1 + v23 + 136);
          result = 19;
          if (v24 > 0x17)
          {
            if (v24 - 24 >= 4)
            {
              if (v24 != 29)
                break;
LABEL_64:
              if (((namingBitmap[(v23 >> 5) | (8 * namePages[v22])] >> v23) & 1) == 0)
                goto LABEL_73;
            }
LABEL_65:
            v20 = v16 + 4;
            result = 41;
            break;
          }
          if (*(unsigned __int8 *)(a1 + v23 + 136) <= 0x15u)
          {
            switch(v24)
            {
              case 5u:
                goto LABEL_73;
              case 6u:
                if (v21 >= 3)
                {
LABEL_73:
                  result = 0;
                  *a4 = (uint64_t)v20;
                  return result;
                }
                return 4294967294;
              case 7u:
LABEL_72:
                if (v21 >= 4)
                  goto LABEL_73;
                return 4294967294;
            }
          }
          else if (v24 == 22)
          {
            goto LABEL_65;
          }
          break;
        case 0x1D:
          goto LABEL_50;
        case 0x21:
          if ((_DWORD)result == 19)
            goto LABEL_76;
          *a4 = (uint64_t)(v16 + 2);
          return 31;
        case 0x22:
          if ((_DWORD)result == 19)
            goto LABEL_76;
          *a4 = (uint64_t)(v16 + 2);
          return 32;
        default:
          goto LABEL_76;
      }
LABEL_52:
      v17 = v6 - (_QWORD)v20;
      v16 = v20;
      if (v6 - (uint64_t)v20 <= 1)
        return -(int)result;
    }
    if ((_DWORD)v18 != 255)
    {
      if ((v18 - 220) < 4)
        goto LABEL_76;
      goto LABEL_49;
    }
    LODWORD(v19) = *v16;
    if (v19 > 0xFD)
      goto LABEL_76;
LABEL_50:
    if (((namingBitmap[(v19 >> 5) | (8 * namePages[v18])] >> v19) & 1) == 0)
      goto LABEL_76;
LABEL_51:
    v20 = v16 + 2;
    goto LABEL_52;
  }
  if ((v9 - 216) < 4)
  {
LABEL_13:
    if (v6 - (uint64_t)a2 < 4)
      return 4294967294;
LABEL_16:
    result = 0;
    *a4 = (uint64_t)a2;
    return result;
  }
  if (a2[1])
    goto LABEL_28;
  v10 = *a2;
  result = 18;
  switch(*(_BYTE *)(a1 + v10 + 136))
  {
    case 2:
      v11 = a2 + 2;
      if (v6 - (uint64_t)(a2 + 2) < 2)
        return 0xFFFFFFFFLL;
      v12 = a2[3];
      if ((v12 - 220) < 4)
        goto LABEL_112;
      if (!a2[3])
      {
        v35 = *(unsigned __int8 *)(a1 + *v11 + 136);
        switch(*(_BYTE *)(a1 + *v11 + 136))
        {
          case 0xF:
            result = little2_scanPi(a1, (char *)a2 + 4, v6, a4);
            break;
          case 0x10:
            result = little2_scanDecl(a1, a2 + 4, v6, a4);
            break;
          case 0x11:
          case 0x12:
          case 0x13:
          case 0x14:
          case 0x15:
          case 0x17:
            goto LABEL_112;
          case 0x16:
          case 0x18:
            goto LABEL_139;
          default:
            if ((v35 - 5) < 3 || v35 == 29)
              goto LABEL_139;
            goto LABEL_112;
        }
        return result;
      }
      if (v12 != 255 || *v11 <= 0xFDu)
      {
LABEL_139:
        *a4 = (uint64_t)a2;
        return 29;
      }
      goto LABEL_112;
    case 4:
      v25 = a2 + 2;
      v26 = v6 - (_QWORD)(a2 + 2);
      if (v26 < 2)
        return 4294967270;
      if (a2[3] || *v25 != 93)
        goto LABEL_117;
      if ((unint64_t)v26 < 4)
        return 0xFFFFFFFFLL;
      if (a2[5] || a2[4] != 62)
      {
LABEL_117:
        *a4 = (uint64_t)v25;
        return 26;
      }
      else
      {
        *a4 = (uint64_t)(a2 + 6);
        return 34;
      }
    case 5:
      if (v6 - (uint64_t)a2 >= 2)
        goto LABEL_16;
      return 4294967294;
    case 6:
      if (v6 - (uint64_t)a2 >= 3)
        goto LABEL_16;
      return 4294967294;
    case 7:
      goto LABEL_13;
    case 9:
      if (a2 + 2 != (unsigned __int8 *)v6)
        goto LABEL_90;
      *a4 = v6;
      return 4294967281;
    case 0xA:
    case 0x15:
LABEL_90:
      v27 = a2 + 2;
      v28 = v6 - (_QWORD)(a2 + 2);
      if (v28 >= 2)
      {
        do
        {
          if (v27[1])
            break;
          v29 = *(unsigned __int8 *)(a1 + *v27 + 136);
          if (v29 != 21 && v29 != 10 && (v29 != 9 || v27 + 2 == (unsigned __int8 *)v6))
            break;
          v27 += 2;
          v28 -= 2;
        }
        while (v28 > 1);
      }
      *a4 = (uint64_t)v27;
      return 15;
    case 0xB:
      *a4 = (uint64_t)(a2 + 2);
      return 17;
    case 0xC:
      v32 = a2 + 2;
      v33 = 12;
      return little2_scanLit(v33, a1, v32, v6, (unsigned __int8 **)a4);
    case 0xD:
      v32 = a2 + 2;
      v33 = 13;
      return little2_scanLit(v33, a1, v32, v6, (unsigned __int8 **)a4);
    case 0x13:
      return little2_scanPoundName(a1, a2 + 2, v6, a4);
    case 0x14:
      *a4 = (uint64_t)(a2 + 2);
      return 25;
    case 0x16:
    case 0x18:
      goto LABEL_33;
    case 0x17:
    case 0x19:
    case 0x1A:
    case 0x1B:
      goto LABEL_32;
    case 0x1D:
      goto LABEL_29;
    case 0x1E:
      return little2_scanPercent(a1, a2 + 2, v6, a4);
    case 0x1F:
      *a4 = (uint64_t)(a2 + 2);
      return 23;
    case 0x20:
      v11 = a2 + 2;
      if (v6 - (uint64_t)(a2 + 2) < 2)
        return 4294967272;
      if (a2[3])
        goto LABEL_112;
      v34 = *(unsigned __int8 *)(a1 + *v11 + 136);
      if (v34 <= 31)
      {
        if ((v34 - 9) >= 3)
        {
          if (v34 == 15)
          {
            *a4 = (uint64_t)(a2 + 4);
            return 35;
          }
          if (v34 != 21)
          {
LABEL_112:
            result = 0;
            *a4 = (uint64_t)v11;
            return result;
          }
        }
LABEL_133:
        *a4 = (uint64_t)v11;
        return 24;
      }
      switch(v34)
      {
        case ' ':
        case '#':
        case '$':
          goto LABEL_133;
        case '!':
          *a4 = (uint64_t)(a2 + 4);
          result = 36;
          break;
        case '"':
          *a4 = (uint64_t)(a2 + 4);
          result = 37;
          break;
        default:
          goto LABEL_112;
      }
      break;
    case 0x23:
      *a4 = (uint64_t)(a2 + 2);
      return 38;
    case 0x24:
      *a4 = (uint64_t)(a2 + 2);
      return 21;
    default:
      goto LABEL_16;
  }
  return result;
}

uint64_t little2_contentTok(uint64_t a1, unsigned __int8 *a2, unint64_t a3, uint64_t *a4)
{
  char v4;
  unint64_t v5;
  BOOL v6;
  uint64_t v7;
  unsigned int v9;
  unsigned __int8 *v10;
  unsigned __int8 *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unsigned int v15;
  unsigned __int8 *v16;
  _BYTE *v17;
  unsigned __int8 *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned __int8 *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unsigned int v29;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unsigned int v37;
  uint64_t v38;
  uint64_t i;
  uint64_t v40;
  uint64_t v41;
  int v42;
  int v44;

  if ((unint64_t)a2 >= a3)
    return 4294967292;
  v4 = a3 - (_BYTE)a2;
  v5 = (a3 - (_QWORD)a2) & 0xFFFFFFFFFFFFFFFELL;
  if (v5)
    v6 = ((a3 - (_QWORD)a2) & 1) == 0;
  else
    v6 = 1;
  if (!v6)
    a3 = (unint64_t)&a2[v5];
  if ((v4 & 1) != 0 && !v5)
    return 0xFFFFFFFFLL;
  v9 = a2[1];
  if (v9 > 0xDB)
  {
    if (v9 - 220 < 4 || v9 == 255 && *a2 > 0xFDu)
    {
LABEL_17:
      v7 = 0;
      *a4 = (uint64_t)a2;
      return v7;
    }
  }
  else
  {
    if (v9 - 216 < 4)
    {
LABEL_14:
      if ((uint64_t)(a3 - (_QWORD)a2) < 4)
        return 4294967294;
      v10 = a2 + 4;
      goto LABEL_29;
    }
    if (!a2[1])
    {
      switch(*(_BYTE *)(a1 + *a2 + 136))
      {
        case 0:
        case 1:
        case 8:
          goto LABEL_17;
        case 2:
          v11 = a2 + 2;
          v12 = a3 - (_QWORD)(a2 + 2);
          if (v12 < 2)
            return 0xFFFFFFFFLL;
          v13 = a2[3];
          if (a2[3] > 0xDBu)
          {
            if ((v13 - 220) < 4)
              goto LABEL_78;
            if ((_DWORD)v13 == 255)
            {
              LODWORD(v19) = *v11;
              if (v19 > 0xFD)
                goto LABEL_78;
              goto LABEL_88;
            }
          }
          else
          {
            if ((v13 - 216) < 4)
            {
LABEL_24:
              if ((unint64_t)v12 < 4)
                return 4294967294;
LABEL_78:
              v7 = 0;
              goto LABEL_79;
            }
            if (!a2[3])
            {
              v19 = *v11;
              switch(*(_BYTE *)(a1 + v19 + 136))
              {
                case 5:
                case 8:
                case 9:
                case 0xA:
                case 0xB:
                case 0xC:
                case 0xD:
                case 0xE:
                case 0x12:
                case 0x13:
                case 0x14:
                case 0x15:
                case 0x17:
                  goto LABEL_78;
                case 6:
                  if ((unint64_t)v12 >= 3)
                    goto LABEL_78;
                  return 4294967294;
                case 7:
                  goto LABEL_24;
                case 0xF:
                  return little2_scanPi(a1, (char *)a2 + 4, a3, a4);
                case 0x10:
                  v11 = a2 + 4;
                  if ((uint64_t)(a3 - (_QWORD)(a2 + 4)) < 2)
                    return 0xFFFFFFFFLL;
                  if (a2[5])
                    goto LABEL_78;
                  v31 = *(unsigned __int8 *)(a1 + *v11 + 136);
                  if (v31 != 20)
                  {
                    if (v31 != 27)
                      goto LABEL_78;
                    return little2_scanComment(a1, a2 + 6, a3, a4);
                  }
                  v11 = a2 + 6;
                  if ((uint64_t)(a3 - (_QWORD)(a2 + 6)) < 12)
                    return 0xFFFFFFFFLL;
                  v38 = 0;
                  while (!v11[1] && *v11 == big2_scanCdataSection_CDATA_LSQB[v38])
                  {
                    ++v38;
                    v11 += 2;
                    if (v38 == 6)
                    {
                      v7 = 8;
                      v11 = a2 + 18;
                      goto LABEL_79;
                    }
                  }
                  goto LABEL_78;
                case 0x11:
                  v11 = a2 + 4;
                  v32 = a3 - (_QWORD)(a2 + 4);
                  if (v32 < 2)
                    return 0xFFFFFFFFLL;
                  v33 = a2[5];
                  if (a2[5] > 0xDBu)
                  {
                    if ((v33 - 220) < 4)
                      goto LABEL_78;
                    if ((_DWORD)v33 == 255)
                    {
                      LODWORD(v34) = *v11;
                      if (v34 > 0xFD)
                        goto LABEL_78;
                      goto LABEL_181;
                    }
                  }
                  else
                  {
                    if ((v33 - 216) < 4)
                      goto LABEL_138;
                    if (!a2[5])
                    {
                      v7 = 0;
                      v34 = *v11;
                      v37 = *(unsigned __int8 *)(a1 + v34 + 136);
                      if (v37 <= 0x15)
                      {
                        if (v37 == 6)
                        {
LABEL_203:
                          if ((unint64_t)v32 < 3)
                            return 4294967294;
                          goto LABEL_78;
                        }
                        if (v37 != 7)
                          goto LABEL_79;
LABEL_138:
                        if ((unint64_t)v32 < 4)
                          return 4294967294;
                        goto LABEL_78;
                      }
                      if (v37 == 22 || v37 == 24)
                        goto LABEL_182;
                      if (v37 != 29)
                        goto LABEL_79;
LABEL_181:
                      if (((namingBitmap[(v34 >> 5) | (8 * nmstrtPages[v33])] >> v34) & 1) == 0)
                        goto LABEL_78;
LABEL_182:
                      v11 = a2 + 6;
                      if ((uint64_t)(a3 - (_QWORD)(a2 + 6)) < 2)
                        return 0xFFFFFFFFLL;
                      for (i = a3 - (_QWORD)a2 - 8; ; i -= 2)
                      {
                        v40 = v11[1];
                        if (v11[1] > 0xDBu)
                          break;
                        if (v11[1])
                        {
                          if ((v40 - 216) < 4)
                          {
LABEL_209:
                            if ((unint64_t)(i + 2) < 4)
                              return 4294967294;
                            goto LABEL_78;
                          }
LABEL_195:
                          LODWORD(v41) = *v11;
                          goto LABEL_196;
                        }
                        v41 = *v11;
                        v42 = *(unsigned __int8 *)(a1 + v41 + 136);
                        if ((v42 - 22) >= 6)
                        {
                          if (v42 != 29)
                          {
                            v7 = 0;
                            switch(*(_BYTE *)(a1 + v41 + 136))
                            {
                              case 6:
                                if ((unint64_t)(i + 2) >= 3)
                                  goto LABEL_78;
                                return 4294967294;
                              case 7:
                                goto LABEL_209;
                              case 8:
                                goto LABEL_79;
                              case 9:
                              case 0xA:
                                goto LABEL_215;
                              case 0xB:
                                goto LABEL_226;
                              default:
                                if (v42 != 21)
                                  goto LABEL_79;
LABEL_215:
                                if (i < 2)
                                  return 0xFFFFFFFFLL;
                                v11 += 2;
                                break;
                            }
                            while (1)
                            {
                              if (v11[1])
                                goto LABEL_78;
                              v44 = *(unsigned __int8 *)(a1 + *v11 + 136);
                              if ((v44 - 9) >= 2 && v44 != 21)
                                break;
                              v11 += 2;
                              i -= 2;
                              v7 = 0xFFFFFFFFLL;
                              if (i <= 1)
                                return v7;
                            }
                            if (v44 == 11)
                            {
LABEL_226:
                              v11 += 2;
                              v7 = 5;
                              goto LABEL_79;
                            }
                            goto LABEL_78;
                          }
                          goto LABEL_196;
                        }
LABEL_197:
                        v11 += 2;
                        v7 = 0xFFFFFFFFLL;
                        if (i <= 1)
                          return v7;
                      }
                      if ((_DWORD)v40 != 255)
                      {
                        if ((v40 - 220) < 4)
                          goto LABEL_78;
                        goto LABEL_195;
                      }
                      LODWORD(v41) = *v11;
                      if (v41 > 0xFD)
                        goto LABEL_78;
LABEL_196:
                      if (((namingBitmap[(v41 >> 5) | (8 * namePages[v40])] >> v41) & 1) == 0)
                        goto LABEL_78;
                      goto LABEL_197;
                    }
                  }
                  LODWORD(v34) = *v11;
                  goto LABEL_181;
                case 0x16:
                case 0x18:
                  goto LABEL_89;
                default:
                  if (*(_BYTE *)(a1 + v19 + 136) != 29)
                    goto LABEL_78;
                  goto LABEL_88;
              }
            }
          }
          LODWORD(v19) = *v11;
LABEL_88:
          if (((namingBitmap[(v19 >> 5) | (8 * nmstrtPages[v13])] >> v19) & 1) == 0)
            goto LABEL_78;
LABEL_89:
          v11 = a2 + 4;
          v20 = a3 - (_QWORD)(a2 + 4);
          if (v20 < 2)
            return 0xFFFFFFFFLL;
          v21 = 0;
          while (1)
          {
            v22 = v11[1];
            if (v11[1] > 0xDBu)
            {
              if ((_DWORD)v22 == 255)
              {
                LODWORD(v23) = *v11;
                if (v23 > 0xFD)
                  goto LABEL_78;
                goto LABEL_112;
              }
              if ((v22 - 220) < 4)
                goto LABEL_78;
            }
            else
            {
              if (!v11[1])
              {
                v23 = *v11;
                v24 = 2;
                switch(*(_BYTE *)(a1 + v23 + 136))
                {
                  case 6:
                    if ((unint64_t)v20 >= 3)
                      goto LABEL_78;
                    return 4294967294;
                  case 7:
                    goto LABEL_125;
                  case 9:
                  case 0xA:
                  case 0x15:
                    v11 += 2;
                    v32 = a3 - (_QWORD)v11;
                    if ((uint64_t)(a3 - (_QWORD)v11) < 2)
                      return 0xFFFFFFFFLL;
                    while (2)
                    {
                      v35 = v11[1];
                      if (!v11[1])
                      {
                        v36 = *v11;
                        switch(*(_BYTE *)(a1 + v36 + 136))
                        {
                          case 6:
                            goto LABEL_203;
                          case 7:
                            goto LABEL_138;
                          case 9:
                          case 0xA:
                          case 0x15:
                            v11 += 2;
                            v32 -= 2;
                            v7 = 0xFFFFFFFFLL;
                            if (v32 <= 1)
                              return v7;
                            continue;
                          case 0xB:
                            goto LABEL_171;
                          case 0x11:
                            goto LABEL_172;
                          case 0x16:
                          case 0x18:
                            return little2_scanAtts(a1, v11 + 2, a3, (unsigned __int8 **)a4);
                          case 0x1D:
                            v35 = 0;
                            goto LABEL_212;
                          default:
                            goto LABEL_78;
                        }
                      }
                      break;
                    }
                    if ((v35 - 216) < 4)
                      goto LABEL_138;
                    if ((v35 - 220) < 4)
                      goto LABEL_78;
                    if ((_DWORD)v35 == 255)
                    {
                      LODWORD(v36) = *v11;
                      if (v36 > 0xFD)
                        goto LABEL_78;
                      v35 = 0xFFu;
                    }
                    else
                    {
                      LODWORD(v36) = *v11;
                    }
LABEL_212:
                    if (((namingBitmap[(v36 >> 5) | (8 * nmstrtPages[v35])] >> v36) & 1) == 0)
                      goto LABEL_78;
                    return little2_scanAtts(a1, v11 + 2, a3, (unsigned __int8 **)a4);
                  case 0xB:
LABEL_171:
                    *a4 = (uint64_t)(v11 + 2);
                    return 2;
                  case 0x11:
LABEL_172:
                    v17 = v11 + 2;
                    if ((uint64_t)(a3 - (_QWORD)(v11 + 2)) < 2)
                      return 0xFFFFFFFFLL;
                    if (v11[3] || *v17 != 62)
                      goto LABEL_63;
                    *a4 = (uint64_t)(v11 + 4);
                    return 4;
                  case 0x16:
                  case 0x18:
                  case 0x19:
                  case 0x1A:
                  case 0x1B:
                    goto LABEL_114;
                  case 0x17:
                    if (v21)
                      goto LABEL_78;
                    v25 = v11 + 2;
                    v26 = a3 - (_QWORD)(v11 + 2);
                    if (v26 < 2)
                      return 0xFFFFFFFFLL;
                    v27 = v11[3];
                    if (v11[3] > 0xDBu)
                    {
                      if ((_DWORD)v27 == 255)
                      {
                        LODWORD(v28) = *v25;
                        if (v28 > 0xFD)
                          goto LABEL_179;
                        goto LABEL_123;
                      }
                      if ((v27 - 220) < 4)
                        goto LABEL_179;
                    }
                    else
                    {
                      if (!v11[3])
                      {
                        v28 = *v25;
                        v29 = *(unsigned __int8 *)(a1 + v28 + 136);
                        if (v29 <= 0x15)
                        {
                          if (v29 != 5)
                          {
                            if (v29 == 6)
                            {
                              if ((unint64_t)v26 < 3)
                                return 4294967294;
                            }
                            else if (v29 == 7)
                            {
LABEL_147:
                              if ((unint64_t)v26 < 4)
                                return 4294967294;
                            }
                          }
LABEL_179:
                          v7 = 0;
                          *a4 = (uint64_t)v25;
                          return v7;
                        }
                        if (v29 == 22 || v29 == 24)
                          goto LABEL_124;
                        if (v29 != 29)
                          goto LABEL_179;
LABEL_123:
                        if (((namingBitmap[(v28 >> 5) | (8 * nmstrtPages[v27])] >> v28) & 1) == 0)
                          goto LABEL_179;
LABEL_124:
                        v21 = 1;
                        v24 = 4;
                        goto LABEL_114;
                      }
                      if ((v27 - 216) < 4)
                        goto LABEL_147;
                    }
                    LODWORD(v28) = *v25;
                    goto LABEL_123;
                  case 0x1D:
                    goto LABEL_112;
                  default:
                    goto LABEL_78;
                }
              }
              if ((v22 - 216) < 4)
              {
LABEL_125:
                if ((unint64_t)v20 >= 4)
                  goto LABEL_78;
                return 4294967294;
              }
            }
            LODWORD(v23) = *v11;
LABEL_112:
            if (((namingBitmap[(v23 >> 5) | (8 * namePages[v22])] >> v23) & 1) == 0)
              goto LABEL_78;
            v24 = 2;
LABEL_114:
            v11 += v24;
            v20 = a3 - (_QWORD)v11;
            v7 = 0xFFFFFFFFLL;
            if ((uint64_t)(a3 - (_QWORD)v11) <= 1)
              return v7;
          }
        case 3:
          return little2_scanRef(a1, a2 + 2, a3, a4);
        case 4:
          v10 = a2 + 2;
          if ((uint64_t)(a3 - (_QWORD)(a2 + 2)) < 2)
            return 4294967291;
          if (a2[3] || *v10 != 93)
            goto LABEL_29;
          v17 = a2 + 4;
          if ((uint64_t)(a3 - (_QWORD)(a2 + 4)) < 2)
            return 4294967291;
          if (!a2[5] && *v17 == 62)
          {
LABEL_63:
            v7 = 0;
            *a4 = (uint64_t)v17;
            return v7;
          }
          goto LABEL_29;
        case 5:
          if ((uint64_t)(a3 - (_QWORD)a2) >= 2)
            break;
          return 4294967294;
        case 6:
          if ((uint64_t)(a3 - (_QWORD)a2) < 3)
            return 4294967294;
          v10 = a2 + 3;
          goto LABEL_29;
        case 7:
          goto LABEL_14;
        case 9:
          v18 = a2 + 2;
          if ((uint64_t)(a3 - (_QWORD)(a2 + 2)) < 2)
            return 4294967293;
          if (!a2[3] && *(_BYTE *)(a1 + a2[2] + 136) == 10)
            v18 = a2 + 4;
LABEL_74:
          *a4 = (uint64_t)v18;
          return 7;
        case 0xA:
          v18 = a2 + 2;
          goto LABEL_74;
        default:
          break;
      }
    }
  }
  v10 = a2 + 2;
LABEL_29:
  v14 = a3 - (_QWORD)v10;
  if ((uint64_t)(a3 - (_QWORD)v10) < 2)
  {
    v16 = v10;
LABEL_53:
    *a4 = (uint64_t)v16;
    return 6;
  }
  while (1)
  {
    v15 = v10[1];
    if (v15 > 0xDB)
    {
      if (v15 == 255)
      {
        if (*v10 > 0xFDu)
          goto LABEL_54;
      }
      else if (v15 - 220 < 4)
      {
LABEL_54:
        *a4 = (uint64_t)v10;
        return 6;
      }
      goto LABEL_47;
    }
    if (v15 - 216 >= 4)
      break;
LABEL_32:
    if (v14 <= 3)
      goto LABEL_54;
    v16 = v10 + 4;
LABEL_48:
    v14 = a3 - (_QWORD)v16;
    v10 = v16;
    if ((uint64_t)(a3 - (_QWORD)v16) <= 1)
      goto LABEL_53;
  }
  if (v10[1])
  {
LABEL_47:
    v16 = v10 + 2;
    goto LABEL_48;
  }
  switch(*(_BYTE *)(a1 + *v10 + 136))
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 8:
    case 9:
    case 0xA:
      goto LABEL_54;
    case 4:
      if (v14 < 4)
        goto LABEL_54;
      v16 = v10 + 2;
      if (v10[3] || *v16 != 93)
        goto LABEL_48;
      if (v14 < 6)
        goto LABEL_54;
      if (v10[5] || v10[4] != 62)
        goto LABEL_48;
      v7 = 0;
      v11 = v10 + 4;
      break;
    case 6:
      if (v14 <= 2)
        goto LABEL_54;
      v16 = v10 + 3;
      goto LABEL_48;
    case 7:
      goto LABEL_32;
    default:
      goto LABEL_47;
  }
LABEL_79:
  *a4 = (uint64_t)v11;
  return v7;
}

uint64_t little2_cdataSectionTok(uint64_t a1, unsigned __int8 *a2, unint64_t a3, unsigned __int8 **a4)
{
  unint64_t v4;
  BOOL v5;
  unsigned __int8 *v6;
  uint64_t v7;
  unsigned int v8;
  unsigned __int8 *v9;
  unint64_t v10;
  unsigned int v11;
  uint64_t v12;
  unsigned int v13;

  if ((unint64_t)a2 >= a3)
    return 4294967292;
  v4 = (a3 - (_QWORD)a2) & 0xFFFFFFFFFFFFFFFELL;
  if (v4)
    v5 = ((a3 - (_QWORD)a2) & 1) == 0;
  else
    v5 = 1;
  v6 = &a2[v4];
  if (v5)
    v6 = (unsigned __int8 *)a3;
  if ((((_BYTE)a3 - (_BYTE)a2) & 1) == 0 || v4)
  {
    v8 = a2[1];
    if (v8 > 0xDB)
    {
      if (v8 - 220 < 4 || v8 == 255 && *a2 > 0xFDu)
      {
        v7 = 0;
        goto LABEL_51;
      }
    }
    else
    {
      if (v8 - 216 < 4)
      {
LABEL_13:
        if (v6 - a2 < 4)
          return 4294967294;
        v9 = a2 + 4;
        goto LABEL_30;
      }
      if (!a2[1])
      {
        v7 = 0;
        switch(*(_BYTE *)(a1 + *a2 + 136))
        {
          case 0:
          case 1:
          case 8:
            goto LABEL_51;
          case 4:
            v9 = a2 + 2;
            if (v6 - (a2 + 2) < 2)
              return 0xFFFFFFFFLL;
            if (a2[3] || *v9 != 93)
              goto LABEL_30;
            if (v6 - (a2 + 4) < 2)
              return 0xFFFFFFFFLL;
            if (a2[5] || a2[4] != 62)
              goto LABEL_30;
            a2 += 6;
            v7 = 40;
            goto LABEL_51;
          case 5:
            if (v6 - a2 >= 2)
              goto LABEL_29;
            return 4294967294;
          case 6:
            if (v6 - a2 < 3)
              return 4294967294;
            v9 = a2 + 3;
            goto LABEL_30;
          case 7:
            goto LABEL_13;
          case 9:
            v9 = a2 + 2;
            if (v6 - (a2 + 2) < 2)
              return 0xFFFFFFFFLL;
            if (a2[3])
            {
              v7 = 7;
              goto LABEL_50;
            }
            if (*(_BYTE *)(a1 + a2[2] + 136) == 10)
              a2 += 4;
            else
              a2 += 2;
LABEL_61:
            v7 = 7;
            break;
          case 0xA:
            a2 += 2;
            goto LABEL_61;
          default:
            goto LABEL_29;
        }
        goto LABEL_51;
      }
    }
LABEL_29:
    v9 = a2 + 2;
LABEL_30:
    v10 = v6 - v9;
    if (v6 - v9 >= 2)
    {
      while (1)
      {
        v11 = v9[1];
        if (v11 > 0xDB)
          break;
        if (v11 - 216 < 4)
          goto LABEL_33;
        v12 = 2;
        if (!v9[1])
        {
          v13 = *(unsigned __int8 *)(a1 + *v9 + 136);
          if (v13 <= 0xA)
          {
            if (v13 == 6)
            {
              if (v10 < 3)
                goto LABEL_49;
              v12 = 3;
              goto LABEL_48;
            }
            if (v13 != 7)
            {
              v12 = 2;
              if (((1 << v13) & 0x713) != 0)
                goto LABEL_49;
              goto LABEL_48;
            }
LABEL_33:
            if (v10 < 4)
              goto LABEL_49;
            v12 = 4;
            goto LABEL_48;
          }
          goto LABEL_37;
        }
LABEL_48:
        v9 += v12;
        v10 = v6 - v9;
        if (v6 - v9 <= 1)
          goto LABEL_49;
      }
      if (v11 != 255)
      {
        v12 = 2;
        if (v11 - 220 < 4)
          goto LABEL_49;
        goto LABEL_48;
      }
      if (*v9 > 0xFDu)
        goto LABEL_49;
LABEL_37:
      v12 = 2;
      goto LABEL_48;
    }
LABEL_49:
    v7 = 6;
LABEL_50:
    a2 = v9;
LABEL_51:
    *a4 = a2;
    return v7;
  }
  return 0xFFFFFFFFLL;
}

uint64_t little2_ignoreSectionTok(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, unsigned __int8 **a4)
{
  unsigned __int8 *v4;
  unint64_t v5;
  int v6;
  unsigned int v7;
  unsigned __int8 *v8;
  uint64_t v9;

  v4 = &a2[(a3 - a2) & 0xFFFFFFFFFFFFFFFELL];
  if (((a3 - a2) & 1) == 0)
    v4 = a3;
  v5 = v4 - a2;
  if (v4 - a2 < 2)
    return 0xFFFFFFFFLL;
  v6 = 0;
  while (1)
  {
    v7 = a2[1];
    if (v7 > 0xDB)
    {
      if (v7 == 255)
      {
        if (*a2 > 0xFDu)
          goto LABEL_37;
      }
      else if (v7 - 220 < 4)
      {
LABEL_37:
        v9 = 0;
        goto LABEL_38;
      }
      goto LABEL_22;
    }
    if (v7 - 216 >= 4)
      break;
LABEL_7:
    if (v5 < 4)
      return 4294967294;
    v8 = a2 + 4;
LABEL_23:
    v5 = v4 - v8;
    a2 = v8;
    if (v4 - v8 <= 1)
      return 0xFFFFFFFFLL;
  }
  if (a2[1])
  {
LABEL_22:
    v8 = a2 + 2;
    goto LABEL_23;
  }
  v9 = 0;
  switch(*(_BYTE *)(a1 + *a2 + 136))
  {
    case 0:
    case 1:
    case 8:
      goto LABEL_38;
    case 2:
      v8 = a2 + 2;
      if (v4 - (a2 + 2) < 2)
        return 0xFFFFFFFFLL;
      if (a2[3] || *v8 != 33)
        goto LABEL_23;
      v8 = a2 + 4;
      if (v4 - (a2 + 4) < 2)
        return 0xFFFFFFFFLL;
      if (!a2[5] && *v8 == 91)
      {
        ++v6;
        v8 = a2 + 6;
      }
      goto LABEL_23;
    case 4:
      v8 = a2 + 2;
      if (v4 - (a2 + 2) < 2)
        return 0xFFFFFFFFLL;
      if (a2[3] || *v8 != 93)
        goto LABEL_23;
      v8 = a2 + 4;
      if (v4 - (a2 + 4) < 2)
        return 0xFFFFFFFFLL;
      if (a2[5] || *v8 != 62)
        goto LABEL_23;
      v8 = a2 + 6;
      if (v6)
      {
        --v6;
        goto LABEL_23;
      }
      v9 = 42;
      a2 += 6;
LABEL_38:
      *a4 = a2;
      return v9;
    case 6:
      if (v5 < 3)
        return 4294967294;
      v8 = a2 + 3;
      goto LABEL_23;
    case 7:
      goto LABEL_7;
    default:
      goto LABEL_22;
  }
}

uint64_t little2_attributeValueTok(uint64_t a1, unsigned __int8 *a2, unint64_t a3, unsigned __int8 **a4)
{
  unsigned __int8 *v4;
  uint64_t v5;
  uint64_t result;
  unsigned __int8 *v7;

  if ((unint64_t)a2 >= a3)
    return 4294967292;
  if ((uint64_t)(a3 - (_QWORD)a2) < 2)
    return 0xFFFFFFFFLL;
  v4 = a2;
  while (v4[1] - 216 < 4)
  {
LABEL_5:
    v5 = 4;
LABEL_6:
    v4 += v5;
    if ((uint64_t)(a3 - (_QWORD)v4) <= 1)
    {
LABEL_27:
      *a4 = v4;
      return 6;
    }
  }
  if (v4[1])
  {
    v5 = 2;
    goto LABEL_6;
  }
  v5 = 2;
  switch(*(_BYTE *)(a1 + *v4 + 136))
  {
    case 2:
      result = 0;
      *a4 = v4;
      return result;
    case 3:
      if (v4 != a2)
        goto LABEL_27;
      return little2_scanRef(a1, a2 + 2, a3, a4);
    case 4:
    case 5:
    case 8:
      goto LABEL_6;
    case 6:
      v5 = 3;
      goto LABEL_6;
    case 7:
      goto LABEL_5;
    case 9:
      if (v4 != a2)
        goto LABEL_27;
      v7 = a2 + 2;
      if ((uint64_t)(a3 - (_QWORD)(a2 + 2)) < 2)
      {
        result = 4294967293;
      }
      else
      {
        if (!a2[3] && *(_BYTE *)(a1 + a2[2] + 136) == 10)
          v7 = a2 + 4;
LABEL_29:
        *a4 = v7;
        result = 7;
      }
      break;
    case 0xA:
      if (v4 != a2)
        goto LABEL_27;
      v7 = a2 + 2;
      goto LABEL_29;
    default:
      if (*(_BYTE *)(a1 + *v4 + 136) != 21)
        goto LABEL_6;
      if (v4 != a2)
        goto LABEL_27;
      *a4 = a2 + 2;
      result = 39;
      break;
  }
  return result;
}

uint64_t little2_entityValueTok(uint64_t a1, unsigned __int8 *a2, unint64_t a3, unsigned __int8 **a4)
{
  unsigned __int8 *v4;
  uint64_t v5;
  uint64_t result;
  unsigned __int8 *v7;

  if ((unint64_t)a2 >= a3)
    return 4294967292;
  if ((uint64_t)(a3 - (_QWORD)a2) < 2)
    return 0xFFFFFFFFLL;
  v4 = a2;
  while (v4[1] - 216 < 4)
  {
LABEL_5:
    v5 = 4;
LABEL_6:
    v4 += v5;
    if ((uint64_t)(a3 - (_QWORD)v4) <= 1)
    {
LABEL_28:
      *a4 = v4;
      return 6;
    }
  }
  if (v4[1])
  {
    v5 = 2;
    goto LABEL_6;
  }
  v5 = 2;
  switch(*(_BYTE *)(a1 + *v4 + 136))
  {
    case 3:
      if (v4 != a2)
        goto LABEL_28;
      return little2_scanRef(a1, a2 + 2, a3, a4);
    case 4:
    case 5:
    case 8:
      goto LABEL_6;
    case 6:
      v5 = 3;
      goto LABEL_6;
    case 7:
      goto LABEL_5;
    case 9:
      if (v4 != a2)
        goto LABEL_28;
      v7 = a2 + 2;
      if ((uint64_t)(a3 - (_QWORD)(a2 + 2)) < 2)
      {
        result = 4294967293;
      }
      else
      {
        if (!a2[3] && *(_BYTE *)(a1 + a2[2] + 136) == 10)
          v7 = a2 + 4;
LABEL_31:
        *a4 = v7;
        result = 7;
      }
      break;
    case 0xA:
      if (v4 != a2)
        goto LABEL_28;
      v7 = a2 + 2;
      goto LABEL_31;
    default:
      if (*(_BYTE *)(a1 + *v4 + 136) != 30)
        goto LABEL_6;
      if (v4 != a2)
        goto LABEL_28;
      LODWORD(result) = little2_scanPercent(a1, a2 + 2, a3, a4);
      if ((_DWORD)result == 22)
        result = 0;
      else
        result = result;
      break;
  }
  return result;
}

BOOL little2_nameMatchesAscii(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, _BYTE *a4)
{
  int v4;
  unsigned __int8 *v5;
  uint64_t v6;
  BOOL v7;
  int v8;

  v4 = *a4;
  if (!*a4)
    return a2 == a3;
  v5 = a4 + 1;
  v6 = a3 - a2;
  while (1)
  {
    v7 = v6 < 2;
    v6 -= 2;
    if (v7 || a2[1] || *a2 != v4)
      break;
    a2 += 2;
    v8 = *v5++;
    v4 = v8;
    if (!v8)
      return a2 == a3;
  }
  return 0;
}

uint64_t little2_nameLength(uint64_t a1, unsigned __int8 *a2)
{
  unsigned __int8 *i;
  unsigned int v3;
  uint64_t v4;
  unsigned int v5;

  for (i = a2; ; i += v4)
  {
    v3 = i[1];
    if (v3 > 0xDB)
    {
      if (v3 == 255)
      {
        if (*i > 0xFDu)
          return ((_DWORD)i - (_DWORD)a2);
        v4 = 2;
      }
      else
      {
        v4 = 2;
        if (v3 - 220 < 4)
          return ((_DWORD)i - (_DWORD)a2);
      }
      continue;
    }
    if (v3 - 216 < 4)
    {
      v4 = 4;
      continue;
    }
    v4 = 2;
    if (!i[1])
      break;
LABEL_5:
    ;
  }
  v5 = *(unsigned __int8 *)(a1 + *i + 136) - 5;
  if (v5 < 0x19 && ((0x17E0007u >> v5) & 1) != 0)
  {
    v4 = qword_21C61C038[(char)v5];
    goto LABEL_5;
  }
  return ((_DWORD)i - (_DWORD)a2);
}

unsigned __int8 *little2_skipS(uint64_t a1, unsigned __int8 *a2)
{
  unsigned __int8 *v2;
  unsigned int v3;
  BOOL v4;
  int v5;
  int v7;

  if (!a2[1])
  {
    while (1)
    {
      v3 = *(unsigned __int8 *)(a1 + *a2 + 136);
      v4 = v3 > 0x15;
      v5 = (1 << v3) & 0x200600;
      if (v4 || v5 == 0)
        break;
      v2 = a2 + 2;
      v7 = a2[3];
      a2 += 2;
      if (v7)
        return v2;
    }
  }
  return a2;
}

uint64_t little2_getAtts(uint64_t a1, unsigned __int8 *a2, int a3, uint64_t a4)
{
  uint64_t result;
  int v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  unsigned __int8 *v10;
  unsigned __int8 *v11;
  unsigned __int8 *v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  int v20;
  unsigned int v21;
  int v22;
  uint64_t v23;

  result = 0;
  v6 = 0;
  v7 = 1;
  while (1)
  {
    while (1)
    {
      v8 = v7;
      v10 = a2 + 3;
      v9 = a2[3];
      v11 = a2 + 2;
      if (v9 > 0xDB)
        break;
      v12 = a2;
      if (v9 - 216 >= 4)
      {
        if (a2[3])
          goto LABEL_16;
        v14 = *v11;
        a2 += 2;
        switch(*(_BYTE *)(a1 + v14 + 136))
        {
          case 3:
            a2 = v11;
            if ((int)result < a3)
            {
              *(_BYTE *)(a4 + 32 * (int)result + 24) = 0;
              a2 = v11;
            }
            continue;
          case 5:
          case 0x16:
          case 0x18:
          case 0x1D:
            goto LABEL_16;
          case 6:
            a2 = v10;
            if (!(_DWORD)v7)
            {
              v7 = 1;
              a2 = v10;
              if ((int)result < a3)
              {
                v17 = a4 + 32 * (int)result;
                *(_QWORD *)v17 = v11;
                *(_BYTE *)(v17 + 24) = 1;
                a2 = v10;
              }
            }
            continue;
          case 7:
            goto LABEL_4;
          case 9:
          case 0xA:
            v7 = 0;
            a2 = v11;
            if ((_DWORD)v8 == 1)
              continue;
            a2 = v11;
            v7 = v8;
            if ((_DWORD)v8 != 2)
              continue;
            a2 = v11;
            if ((int)result >= a3)
              continue;
            *(_BYTE *)(a4 + 32 * (int)result + 24) = 0;
            goto LABEL_66;
          case 0xB:
          case 0x11:
            v7 = 2;
            a2 = v11;
            if ((_DWORD)v8 == 2)
              continue;
            return result;
          case 0xC:
            if ((_DWORD)v7 == 2)
            {
              v7 = 2;
              a2 = v11;
              if (v6 == 12)
              {
                if ((int)result < a3)
                  *(_QWORD *)(a4 + 32 * (int)result + 16) = v11;
                v7 = 0;
                result = (result + 1);
                v6 = 12;
                a2 = v11;
              }
              continue;
            }
            v6 = 12;
            v7 = 2;
            a2 = v11;
            if ((int)result >= a3)
              continue;
            *(_QWORD *)(a4 + 32 * (int)result + 8) = v12 + 4;
            v6 = 12;
            goto LABEL_66;
          case 0xD:
            if ((_DWORD)v7 == 2)
            {
              v7 = 2;
              a2 = v11;
              if (v6 == 13)
              {
                if ((int)result < a3)
                  *(_QWORD *)(a4 + 32 * (int)result + 16) = v11;
                v7 = 0;
                result = (result + 1);
                v6 = 13;
                a2 = v11;
              }
              continue;
            }
            v6 = 13;
            v7 = 2;
            a2 = v11;
            if ((int)result >= a3)
              continue;
            *(_QWORD *)(a4 + 32 * (int)result + 8) = v12 + 4;
            v6 = 13;
            goto LABEL_66;
          case 0x15:
            v7 = 0;
            a2 = v11;
            if ((_DWORD)v8 == 1)
              continue;
            a2 = v11;
            v7 = v8;
            if ((_DWORD)v8 != 2)
              continue;
            a2 = v11;
            if ((int)result >= a3)
              continue;
            v18 = a4 + 32 * (int)result;
            v20 = *(unsigned __int8 *)(v18 + 24);
            v19 = (_BYTE *)(v18 + 24);
            v7 = 2;
            a2 = v11;
            if (!v20)
              continue;
            if (v11 == *(unsigned __int8 **)(a4 + 32 * (int)result + 8) || (_DWORD)v14 != 32)
              goto LABEL_65;
            v21 = v12[5];
            if (v21 > 0xDB)
            {
              if (v21 - 220 < 4)
              {
                v22 = 8;
                goto LABEL_64;
              }
              if (v21 == 255 && v12[4] > 0xFDu)
              {
                v22 = 0;
                goto LABEL_64;
              }
LABEL_63:
              v22 = 29;
              goto LABEL_64;
            }
            if (v21 - 216 < 4)
            {
              v22 = 7;
              goto LABEL_64;
            }
            if (v12[5])
              goto LABEL_63;
            v23 = v12[4];
            if (v23 == 32)
              goto LABEL_65;
            v22 = *(unsigned __int8 *)(a1 + v23 + 136);
LABEL_64:
            v7 = 2;
            a2 = v11;
            if (v22 != v6)
              continue;
LABEL_65:
            *v19 = 0;
LABEL_66:
            v7 = 2;
            a2 = v11;
            break;
          default:
            continue;
        }
      }
      else
      {
LABEL_4:
        if (!(_DWORD)v7)
        {
          v8 = 1;
          if ((int)result < a3)
          {
            v16 = a4 + 32 * (int)result;
            *(_QWORD *)v16 = v11;
            *(_BYTE *)(v16 + 24) = 1;
          }
        }
        a2 = v12 + 4;
        v7 = v8;
      }
    }
    a2 += 2;
    if (v9 - 220 >= 4)
    {
      if (v9 == 255)
      {
        v13 = *v11 <= 0xFDu && (_DWORD)v7 == 0;
        a2 = v11;
        if (v13)
          goto LABEL_17;
      }
      else
      {
LABEL_16:
        a2 = v11;
        if (!(_DWORD)v7)
        {
LABEL_17:
          v7 = 1;
          a2 = v11;
          if ((int)result < a3)
          {
            v15 = a4 + 32 * (int)result;
            *(_QWORD *)v15 = v11;
            *(_BYTE *)(v15 + 24) = 1;
            a2 = v11;
          }
        }
      }
    }
  }
}

uint64_t little2_charRefNumber(uint64_t a1, _BYTE *a2)
{
  uint64_t v2;
  _BYTE *i;
  int v4;
  int v5;
  _BYTE *j;
  int v7;

  if (!a2[5] && a2[4] == 120)
  {
    v2 = 0;
    for (i = a2 + 7; ; i += 2)
    {
      if (!*i)
      {
        v4 = (char)*(i - 1);
        if (v4 == 59)
          return checkCharRefNumber(v2);
        v5 = v4 - 48;
        if ((v4 - 48) <= 0x36)
        {
          if (((1 << v5) & 0x3FF) != 0)
          {
            v2 = v5 | (16 * v2);
          }
          else if (((1 << v5) & 0x7E0000) != 0)
          {
            v2 = (v4 + 16 * v2 - 55);
          }
          else
          {
            if (((1 << v5) & 0x7E000000000000) == 0)
              continue;
            v2 = (v4 + 16 * v2 - 87);
          }
          if ((int)v2 >= 1114112)
            return 0xFFFFFFFFLL;
        }
      }
    }
  }
  v2 = 0;
  for (j = a2 + 5; *j; j += 2)
  {
    v7 = -1;
LABEL_19:
    v2 = (v7 + 10 * v2 - 48);
    if ((int)v2 >= 1114112)
      return 0xFFFFFFFFLL;
  }
  v7 = (char)*(j - 1);
  if (v7 != 59)
    goto LABEL_19;
  return checkCharRefNumber(v2);
}

uint64_t little2_predefinedEntityName(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  unsigned int v5;
  int v7;

  v3 = (a3 - (uint64_t)a2) / 2;
  if (v3 == 4)
  {
    if (!a2[1])
    {
      v7 = (char)*a2;
      if (v7 == 97)
      {
        if (!a2[3] && a2[2] == 112 && !a2[5] && a2[4] == 111 && !a2[7] && a2[6] == 115)
          return 39;
      }
      else if (v7 == 113 && !a2[3] && a2[2] == 117 && !a2[5] && a2[4] == 111 && !a2[7] && a2[6] == 116)
      {
        return 34;
      }
    }
    return 0;
  }
  if (v3 == 3)
  {
    if (!a2[1] && *a2 == 97 && !a2[3] && a2[2] == 109 && !a2[5] && a2[4] == 112)
      return 38;
    return 0;
  }
  if (v3 != 2 || a2[3] || a2[2] != 116 || a2[1])
    return 0;
  v4 = *a2;
  if (v4 == 103)
    v5 = 62;
  else
    v5 = 0;
  if (v4 == 108)
    return 60;
  else
    return v5;
}

uint64_t little2_updatePosition(uint64_t result, unsigned __int8 *a2, uint64_t a3, _QWORD *a4)
{
  unsigned __int8 *v4;

  if (a3 - (uint64_t)a2 >= 2)
  {
    do
    {
      if (a2[1] - 216 >= 4)
      {
        if (!a2[1])
        {
          switch(*(_BYTE *)(result + *a2 + 136))
          {
            case 6:
              a2 += 3;
              goto LABEL_7;
            case 7:
              goto LABEL_3;
            case 9:
              ++*a4;
              v4 = a2 + 2;
              if (a3 - (uint64_t)(a2 + 2) >= 2 && !a2[3] && *(_BYTE *)(result + a2[2] + 136) == 10)
                v4 = a2 + 4;
              a4[1] = 0;
              a2 = v4;
              break;
            case 0xA:
              ++*a4;
              a4[1] = 0;
              a2 += 2;
              break;
            default:
              goto LABEL_6;
          }
          continue;
        }
LABEL_6:
        a2 += 2;
      }
      else
      {
LABEL_3:
        a2 += 4;
      }
LABEL_7:
      ++a4[1];
    }
    while (a3 - (uint64_t)a2 > 1);
  }
  return result;
}

uint64_t little2_isPublicId(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  unsigned __int8 *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t result;

  v4 = (unsigned __int8 *)(a2 + 2);
  v5 = a3 - (a2 + 2) - 2;
  if (v5 >= 2)
  {
    do
    {
      if (v4[1])
      {
LABEL_15:
        result = 0;
        *a4 = v4;
        return result;
      }
      v6 = *v4;
      v7 = (char)v6;
      v8 = *(unsigned __int8 *)(a1 + v6 + 136);
      if (v8 <= 0x23)
      {
        if (((1 << v8) & 0xFCB8FE600) != 0)
          goto LABEL_5;
        if (((1 << v8) & 0x4400000) != 0)
        {
          if ((v7 & 0x80000000) == 0)
            goto LABEL_5;
        }
        else if (v8 == 21)
        {
          if (v7 == 9)
            goto LABEL_15;
          goto LABEL_5;
        }
      }
      if (v7 != 64 && v7 != 36)
        goto LABEL_15;
LABEL_5:
      v4 += 2;
      v5 -= 2;
    }
    while (v5 > 1);
  }
  return 1;
}

uint64_t little2_toUtf8(uint64_t a1, unsigned __int8 **a2, uint64_t a3, _BYTE **a4, _BYTE *a5)
{
  unsigned __int8 *v5;
  int64_t v6;
  unsigned __int8 *v7;
  unsigned int v8;
  int v9;
  unsigned int v10;
  _BYTE *v11;
  unint64_t v12;
  char v13;
  char v14;
  _BYTE *v15;
  _BYTE *v16;
  unsigned int v17;
  _BYTE *v18;
  unsigned int v19;
  char v20;
  _BYTE *v21;
  _BYTE *v22;
  _BYTE *v23;
  uint64_t result;

  v5 = *a2;
  v6 = (a3 - (_QWORD)*a2) & 0xFFFFFFFFFFFFFFFELL;
  if (v6 >= 1)
  {
    v7 = &v5[v6];
    do
    {
      v8 = *v5;
      v9 = (char)v8;
      v10 = v5[1];
      if (v10 - 1 >= 7)
      {
        if (v10 - 216 < 4)
        {
          v16 = *a4;
          if (a5 - *a4 < 4)
            goto LABEL_21;
          if (v7 - v5 < 4)
          {
            result = 1;
            goto LABEL_23;
          }
          v17 = ((v8 >> 6) & 0xFFFFFFF3 | (4 * (v10 & 3))) + 1;
          *a4 = v16 + 1;
          *v16 = (v17 >> 2) | 0xF0;
          LOBYTE(v17) = (v8 >> 2) & 0xF | (16 * (v17 & 3)) | 0x80;
          v18 = (*a4)++;
          *v18 = v17;
          v19 = v5[2];
          v5 += 2;
          v20 = (v19 >> 6) & 0xC3 | (16 * (v9 & 3)) | (4 * (v5[1] & 3)) | 0x80;
          v21 = (*a4)++;
          *v21 = v20;
          LOBYTE(v9) = v19 & 0x3F | 0x80;
          v22 = *a4;
          goto LABEL_11;
        }
        if (v5[1])
        {
          v23 = *a4;
          if (a5 - *a4 < 3)
          {
LABEL_21:
            result = 2;
            goto LABEL_23;
          }
          *a4 = v23 + 1;
          *v23 = (v10 >> 4) | 0xE0;
          v13 = (4 * (v10 & 0xF)) | (v9 >> 6) | 0x80;
          v11 = *a4;
          goto LABEL_6;
        }
        if (((char)v8 & 0x80000000) == 0)
        {
          v22 = *a4;
          if (*a4 == a5)
            goto LABEL_21;
LABEL_11:
          *a4 = v22 + 1;
          *v22 = v9;
          goto LABEL_12;
        }
      }
      v11 = *a4;
      if (a5 - *a4 < 2)
        goto LABEL_21;
      HIDWORD(v12) = v5[1];
      LODWORD(v12) = v9 << 24;
      v13 = (v12 >> 30) | 0xC0;
LABEL_6:
      *a4 = v11 + 1;
      *v11 = v13;
      v14 = v9 & 0x3F | 0x80;
      v15 = (*a4)++;
      *v15 = v14;
LABEL_12:
      v5 += 2;
    }
    while (v5 < v7);
  }
  result = 0;
LABEL_23:
  *a2 = v5;
  return result;
}

uint64_t little2_toUtf16(uint64_t a1, char **a2, uint64_t a3, unint64_t *a4, unint64_t a5)
{
  char *v5;
  int64_t v6;
  char *v7;
  uint64_t result;
  uint64_t v9;
  _WORD *v10;

  v5 = *a2;
  v6 = (a3 - (_QWORD)*a2) & 0xFFFFFFFFFFFFFFFELL;
  v7 = &(*a2)[v6];
  if (v6 <= (uint64_t)(a5 - *a4))
  {
    result = 0;
  }
  else
  {
    result = (*(v7 - 1) & 0xF8) == 216;
    v9 = -2;
    if ((*(v7 - 1) & 0xF8) != 0xD8)
      v9 = 0;
    v7 += v9;
  }
  while (v5 < v7)
  {
    v10 = (_WORD *)*a4;
    if (*a4 >= a5)
    {
      if (*a4 == a5)
        return 2;
      return result;
    }
    *v10 = *(_WORD *)v5;
    *a4 = (unint64_t)(v10 + 1);
    v5 = *a2 + 2;
    *a2 = v5;
  }
  return result;
}

uint64_t little2_scanLit(int a1, uint64_t a2, unsigned __int8 *a3, uint64_t a4, unsigned __int8 **a5)
{
  unint64_t v5;
  unsigned int v6;
  unsigned __int8 *v7;
  uint64_t result;
  unsigned int v9;
  BOOL v10;
  int v11;

  v5 = a4 - (_QWORD)a3;
  if (a4 - (uint64_t)a3 < 2)
    return 0xFFFFFFFFLL;
  while (1)
  {
    v6 = a3[1];
    if (v6 > 0xDB)
    {
      if (v6 == 255)
      {
        if (*a3 > 0xFDu)
          goto LABEL_20;
      }
      else if (v6 - 220 < 4)
      {
LABEL_20:
        result = 0;
        *a5 = a3;
        return result;
      }
      goto LABEL_14;
    }
    if (v6 - 216 >= 4)
    {
      if (!a3[1])
      {
        switch(*(_BYTE *)(a2 + *a3 + 136))
        {
          case 0:
          case 1:
          case 8:
            goto LABEL_20;
          case 6:
            if (v5 < 3)
              return 4294967294;
            v7 = a3 + 3;
            goto LABEL_15;
          case 7:
            goto LABEL_4;
          case 0xC:
          case 0xD:
            v7 = a3 + 2;
            if (*(unsigned __int8 *)(a2 + *a3 + 136) != a1)
              goto LABEL_15;
            if (a4 - (uint64_t)v7 < 2)
              return 4294967269;
            *a5 = v7;
            if (a3[3])
              return 0;
            v9 = *(unsigned __int8 *)(a2 + *v7 + 136);
            v10 = v9 > 0x1E;
            v11 = (1 << v9) & 0x40300E00;
            if (v10 || v11 == 0)
              return 0;
            else
              return 27;
          default:
            break;
        }
      }
LABEL_14:
      v7 = a3 + 2;
      goto LABEL_15;
    }
LABEL_4:
    if (v5 < 4)
      return 4294967294;
    v7 = a3 + 4;
LABEL_15:
    v5 = a4 - (_QWORD)v7;
    a3 = v7;
    if (a4 - (uint64_t)v7 <= 1)
      return 0xFFFFFFFFLL;
  }
}

uint64_t little2_scanDecl(uint64_t a1, unsigned __int8 *a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v4;
  unsigned __int8 *v5;
  uint64_t v6;
  unsigned int v8;
  BOOL v9;
  int v10;

  if (a3 - (uint64_t)a2 < 2)
    return 0xFFFFFFFFLL;
  if (!a2[1])
  {
    switch(*(_BYTE *)(a1 + *a2 + 136))
    {
      case 0x14:
        *a4 = a2 + 2;
        return 33;
      case 0x16:
      case 0x18:
        v5 = a2 + 2;
        v6 = a3 - (_QWORD)(a2 + 2);
        if (v6 < 2)
          return 0xFFFFFFFFLL;
        while (2)
        {
          if (v5[1])
          {
LABEL_20:
            v4 = 0;
            *a4 = v5;
          }
          else
          {
            switch(*(_BYTE *)(a1 + *v5 + 136))
            {
              case 0x15:
                goto LABEL_13;
              case 0x16:
              case 0x18:
                v5 += 2;
                v6 -= 2;
                v4 = 0xFFFFFFFFLL;
                if (v6 > 1)
                  continue;
                return v4;
              case 0x17:
              case 0x19:
              case 0x1A:
              case 0x1B:
              case 0x1C:
              case 0x1D:
                goto LABEL_20;
              case 0x1E:
                if ((unint64_t)v6 < 4)
                  return 0xFFFFFFFFLL;
                if (!v5[3])
                {
                  v8 = *(unsigned __int8 *)(a1 + v5[2] + 136);
                  v9 = v8 > 0x1E;
                  v10 = (1 << v8) & 0x40200600;
                  if (!v9 && v10 != 0)
                    goto LABEL_20;
                }
                goto LABEL_13;
              default:
                if (*(unsigned __int8 *)(a1 + *v5 + 136) - 9 >= 2)
                  goto LABEL_20;
LABEL_13:
                *a4 = v5;
                v4 = 16;
                break;
            }
          }
          return v4;
        }
      case 0x1B:
        return little2_scanComment(a1, a2 + 2, a3, a4);
      default:
        break;
    }
  }
  v4 = 0;
  *a4 = a2;
  return v4;
}

uint64_t little2_scanPi(uint64_t a1, char *a2, uint64_t a3, uint64_t *a4)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  unsigned int v13;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unsigned __int8 *v18;
  unsigned __int8 *v19;
  uint64_t v20;
  unint64_t v21;
  unsigned __int8 *v22;
  unsigned int v23;
  unsigned __int8 *v24;
  uint64_t v25;
  unsigned int v26;

  v4 = a3 - (_QWORD)a2;
  v5 = a3 - (_QWORD)a2 - 2;
  if (a3 - (uint64_t)a2 < 2)
    return 0xFFFFFFFFLL;
  v10 = a2[1];
  if (a2[1] > 0xDBu)
  {
    if ((v10 - 220) < 4)
      goto LABEL_7;
    if ((_DWORD)v10 == 255)
    {
      LODWORD(v12) = *a2;
      if (v12 > 0xFD)
        goto LABEL_7;
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  if ((v10 - 216) < 4)
    goto LABEL_4;
  if (a2[1])
  {
LABEL_17:
    LODWORD(v12) = *a2;
    goto LABEL_18;
  }
  v12 = *a2;
  v13 = *(unsigned __int8 *)(a1 + v12 + 136);
  if (v13 <= 0x15)
  {
    if (v13 == 5)
      goto LABEL_7;
    if (v13 == 6)
    {
      if (v4 < 3)
        return 4294967294;
      goto LABEL_7;
    }
    if (v13 != 7)
      goto LABEL_7;
LABEL_4:
    if (v4 < 4)
      return 4294967294;
LABEL_7:
    result = 0;
    *a4 = (uint64_t)a2;
    return result;
  }
  if (v13 != 22 && v13 != 24)
  {
    if (v13 != 29)
      goto LABEL_7;
LABEL_18:
    if (((namingBitmap[(v12 >> 5) | (8 * nmstrtPages[v10])] >> v12) & 1) == 0)
      goto LABEL_7;
  }
  if (v5 < 2)
    return 0xFFFFFFFFLL;
  v15 = 0;
  v26 = 0;
  result = 0xFFFFFFFFLL;
  while (1)
  {
    v16 = (unint64_t)&a2[v15];
    v17 = a2[v15 + 3];
    if (a2[v15 + 3] <= 0xDBu)
    {
      if (!a2[v15 + 3])
      {
        v16 = *(unsigned __int8 *)(v16 + 2);
        switch(*(_BYTE *)(a1 + v16 + 136))
        {
          case 5:
            goto LABEL_45;
          case 6:
            if ((unint64_t)v5 >= 3)
              goto LABEL_45;
            return 4294967294;
          case 7:
            goto LABEL_44;
          case 9:
          case 0xA:
          case 0x15:
            v19 = (unsigned __int8 *)&a2[v15];
            v20 = (uint64_t)&a2[v15 + 2];
            result = little2_checkPiTarget(a2, v20, &v26);
            if (!(_DWORD)result)
            {
              *a4 = v20;
              return result;
            }
            v21 = v5 - 2;
            if (v5 - 2 < 2)
              return 0xFFFFFFFFLL;
            v22 = v19 + 4;
            result = 0xFFFFFFFFLL;
            while (2)
            {
              v23 = v22[1];
              if (v23 <= 0xDB)
              {
                if (v23 - 216 < 4)
                {
LABEL_54:
                  if (v21 < 4)
                    return 4294967294;
                  v24 = v22 + 4;
LABEL_65:
                  v21 = a3 - (_QWORD)v24;
                  v22 = v24;
                  if (a3 - (uint64_t)v24 <= 1)
                    return result;
                  continue;
                }
                if (!v22[1])
                {
                  switch(*(_BYTE *)(a1 + *v22 + 136))
                  {
                    case 0:
                    case 1:
                    case 8:
                      goto LABEL_83;
                    case 6:
                      if (v21 < 3)
                        return 4294967294;
                      v24 = v22 + 3;
                      goto LABEL_65;
                    case 7:
                      goto LABEL_54;
                    case 0xF:
                      v24 = v22 + 2;
                      if (a3 - (uint64_t)(v22 + 2) < 2)
                        return 0xFFFFFFFFLL;
                      if (v22[3] || *v24 != 62)
                        goto LABEL_65;
                      v25 = (uint64_t)(v22 + 4);
                      break;
                    default:
                      goto LABEL_64;
                  }
LABEL_79:
                  *a4 = v25;
                  return v26;
                }
LABEL_64:
                v24 = v22 + 2;
                goto LABEL_65;
              }
              break;
            }
            if (v23 == 255)
            {
              if (*v22 <= 0xFDu)
                goto LABEL_64;
            }
            else if (v23 - 220 >= 4)
            {
              goto LABEL_64;
            }
LABEL_83:
            result = 0;
            *a4 = (uint64_t)v22;
            return result;
          case 0xF:
            result = little2_checkPiTarget(a2, (uint64_t)&a2[v15 + 2], &v26);
            if (!(_DWORD)result)
            {
              *a4 = (uint64_t)&a2[v15 + 2];
              return result;
            }
            if (v5 - 2 < 2)
              return 0xFFFFFFFFLL;
            v18 = (unsigned __int8 *)&a2[v15 + 4];
            if (!a2[v15 + 5] && *v18 == 62)
            {
              v25 = (uint64_t)&a2[v15 + 6];
              goto LABEL_79;
            }
            goto LABEL_41;
          case 0x16:
          case 0x18:
          case 0x19:
          case 0x1A:
          case 0x1B:
            goto LABEL_38;
          case 0x1D:
            goto LABEL_37;
          default:
            goto LABEL_40;
        }
      }
      if ((v17 - 216) < 4)
      {
LABEL_44:
        if ((unint64_t)v5 >= 4)
        {
LABEL_45:
          result = 0;
          v18 = (unsigned __int8 *)&a2[v15 + 2];
          goto LABEL_46;
        }
        return 4294967294;
      }
      goto LABEL_36;
    }
    if ((_DWORD)v17 == 255)
    {
      LODWORD(v16) = *(unsigned __int8 *)(v16 + 2);
      if (v16 > 0xFD)
        break;
      goto LABEL_37;
    }
    if ((v17 - 220) < 4)
      break;
LABEL_36:
    LODWORD(v16) = *(unsigned __int8 *)(v16 + 2);
LABEL_37:
    if (((namingBitmap[(v16 >> 5) | (8 * namePages[v17])] >> v16) & 1) == 0)
      goto LABEL_45;
LABEL_38:
    v5 -= 2;
    v15 += 2;
    if (v5 <= 1)
      return result;
  }
LABEL_40:
  v18 = (unsigned __int8 *)&a2[v15 + 2];
LABEL_41:
  result = 0;
LABEL_46:
  *a4 = (uint64_t)v18;
  return result;
}

uint64_t little2_scanPercent(uint64_t a1, unsigned __int8 *a2, uint64_t a3, _QWORD *a4)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;

  v4 = a3 - (_QWORD)a2;
  if (a3 - (uint64_t)a2 < 2)
    return 0xFFFFFFFFLL;
  v5 = a2[1];
  if (a2[1] > 0xDBu)
  {
    if ((v5 - 220) < 4 || (_DWORD)v5 == 255 && *a2 > 0xFDu)
      goto LABEL_7;
  }
  else
  {
    if ((v5 - 216) < 4)
      goto LABEL_4;
    if (!a2[1])
    {
      v6 = 0;
      v7 = *(unsigned __int8 *)(a1 + *a2 + 136);
      if (v7 > 0x14)
      {
        switch(*(_BYTE *)(a1 + *a2 + 136))
        {
          case 0x15:
          case 0x1E:
            goto LABEL_35;
          case 0x16:
          case 0x18:
            goto LABEL_15;
          case 0x1D:
            goto LABEL_14;
          default:
            goto LABEL_8;
        }
      }
      if (v7 - 9 < 2)
      {
LABEL_35:
        v6 = 22;
        goto LABEL_8;
      }
      if (v7 == 6)
      {
        if (v4 >= 3)
          goto LABEL_7;
        return 4294967294;
      }
      if (v7 != 7)
        goto LABEL_8;
LABEL_4:
      if (v4 >= 4)
        goto LABEL_7;
      return 4294967294;
    }
  }
LABEL_14:
  if (((namingBitmap[(*a2 >> 5) | (8 * nmstrtPages[v5])] >> *a2) & 1) == 0)
    goto LABEL_7;
LABEL_15:
  a2 += 2;
  v8 = a3 - (_QWORD)a2;
  if (a3 - (uint64_t)a2 < 2)
    return 0xFFFFFFFFLL;
  while (1)
  {
    v9 = a2[1];
    if (a2[1] <= 0xDBu)
      break;
    if ((_DWORD)v9 == 255)
    {
      LODWORD(v10) = *a2;
      if (v10 > 0xFD)
        goto LABEL_7;
      goto LABEL_26;
    }
    if ((v9 - 220) < 4)
      goto LABEL_7;
LABEL_25:
    LODWORD(v10) = *a2;
LABEL_26:
    if (((namingBitmap[(v10 >> 5) | (8 * namePages[v9])] >> v10) & 1) == 0)
      goto LABEL_7;
LABEL_27:
    a2 += 2;
    v8 -= 2;
    v6 = 0xFFFFFFFFLL;
    if (v8 <= 1)
      return v6;
  }
  if (!a2[1])
  {
    v6 = 0;
    v10 = *a2;
    v11 = *(unsigned __int8 *)(a1 + v10 + 136);
    switch(*(_BYTE *)(a1 + v10 + 136))
    {
      case 0x12:
        a2 += 2;
        v6 = 28;
        goto LABEL_8;
      case 0x13:
      case 0x14:
      case 0x15:
      case 0x17:
      case 0x1C:
        goto LABEL_8;
      case 0x16:
      case 0x18:
      case 0x19:
      case 0x1A:
      case 0x1B:
        goto LABEL_27;
      case 0x1D:
        goto LABEL_26;
      default:
        if (v11 != 6)
        {
          if (v11 != 7)
            goto LABEL_8;
          goto LABEL_40;
        }
        if ((unint64_t)v8 < 3)
          return 4294967294;
        break;
    }
    goto LABEL_7;
  }
  if ((v9 - 216) >= 4)
    goto LABEL_25;
LABEL_40:
  if ((unint64_t)v8 < 4)
    return 4294967294;
LABEL_7:
  v6 = 0;
LABEL_8:
  *a4 = a2;
  return v6;
}

uint64_t little2_scanPoundName(uint64_t a1, unsigned __int8 *a2, uint64_t a3, _QWORD *a4)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3 - (_QWORD)a2;
  if (a3 - (uint64_t)a2 < 2)
    return 0xFFFFFFFFLL;
  v5 = a2[1];
  if (a2[1] > 0xDBu)
  {
    if ((v5 - 220) >= 4 && ((_DWORD)v5 != 255 || *a2 <= 0xFDu))
      goto LABEL_21;
    goto LABEL_8;
  }
  if ((v5 - 216) < 4)
    goto LABEL_4;
  if (a2[1])
    goto LABEL_21;
  v6 = 0;
  v8 = *(unsigned __int8 *)(a1 + *a2 + 136);
  if (v8 <= 0x15)
  {
    if (v8 != 6)
    {
      if (v8 == 7)
      {
LABEL_4:
        if (v4 >= 4)
          goto LABEL_8;
        return 4294967294;
      }
LABEL_9:
      *a4 = a2;
      return v6;
    }
    if (v4 < 3)
      return 4294967294;
LABEL_8:
    v6 = 0;
    goto LABEL_9;
  }
  if (v8 == 22 || v8 == 24)
    goto LABEL_22;
  if (v8 != 29)
    goto LABEL_9;
LABEL_21:
  if (((namingBitmap[(*a2 >> 5) | (8 * nmstrtPages[v5])] >> *a2) & 1) == 0)
    goto LABEL_8;
LABEL_22:
  a2 += 2;
  v10 = a3 - (_QWORD)a2;
  if (a3 - (uint64_t)a2 < 2)
    return 4294967276;
  while (1)
  {
    v11 = a2[1];
    if (a2[1] <= 0xDBu)
      break;
    if ((_DWORD)v11 == 255)
    {
      LODWORD(v12) = *a2;
      if (v12 > 0xFD)
        goto LABEL_8;
      goto LABEL_33;
    }
    if ((v11 - 220) < 4)
      goto LABEL_8;
LABEL_32:
    LODWORD(v12) = *a2;
LABEL_33:
    if (((namingBitmap[(v12 >> 5) | (8 * namePages[v11])] >> v12) & 1) == 0)
      goto LABEL_8;
LABEL_34:
    a2 += 2;
    v10 -= 2;
    v6 = 4294967276;
    if (v10 <= 1)
      return v6;
  }
  if (!a2[1])
  {
    v6 = 0;
    v12 = *a2;
    switch(*(_BYTE *)(a1 + v12 + 136))
    {
      case 6:
        if ((unint64_t)v10 >= 3)
          goto LABEL_8;
        return 4294967294;
      case 7:
        goto LABEL_40;
      case 9:
      case 0xA:
      case 0xB:
      case 0x15:
      case 0x1E:
      case 0x20:
      case 0x24:
        v6 = 20;
        goto LABEL_9;
      case 0x16:
      case 0x18:
      case 0x19:
      case 0x1A:
      case 0x1B:
        goto LABEL_34;
      case 0x1D:
        goto LABEL_33;
      default:
        goto LABEL_9;
    }
  }
  if ((v11 - 216) >= 4)
    goto LABEL_32;
LABEL_40:
  if ((unint64_t)v10 >= 4)
    goto LABEL_8;
  return 4294967294;
}

uint64_t little2_scanComment(uint64_t a1, unsigned __int8 *a2, uint64_t a3, _QWORD *a4)
{
  unint64_t v4;
  unsigned int v5;
  unsigned __int8 *v6;
  uint64_t v7;
  int v9;

  if (a3 - (uint64_t)a2 < 2)
    return 0xFFFFFFFFLL;
  if (a2[1] || *a2 != 45)
  {
LABEL_26:
    v7 = 0;
    goto LABEL_27;
  }
  a2 += 2;
  v4 = a3 - (_QWORD)a2;
  if (a3 - (uint64_t)a2 < 2)
    return 0xFFFFFFFFLL;
  while (1)
  {
    v5 = a2[1];
    if (v5 > 0xDB)
    {
      if (v5 == 255)
      {
        if (*a2 > 0xFDu)
          goto LABEL_26;
      }
      else if (v5 - 220 < 4)
      {
        goto LABEL_26;
      }
      goto LABEL_23;
    }
    if (v5 - 216 >= 4)
      break;
LABEL_7:
    if (v4 < 4)
      return 4294967294;
    v6 = a2 + 4;
LABEL_24:
    v4 = a3 - (_QWORD)v6;
    v7 = 0xFFFFFFFFLL;
    a2 = v6;
    if (a3 - (uint64_t)v6 <= 1)
      return v7;
  }
  if (a2[1])
  {
LABEL_23:
    v6 = a2 + 2;
    goto LABEL_24;
  }
  v7 = 0;
  switch(*(_BYTE *)(a1 + *a2 + 136))
  {
    case 0:
    case 1:
    case 8:
      break;
    case 2:
    case 3:
    case 4:
    case 5:
      goto LABEL_23;
    case 6:
      if (v4 < 3)
        return 4294967294;
      v6 = a2 + 3;
      goto LABEL_24;
    case 7:
      goto LABEL_7;
    default:
      if (*(_BYTE *)(a1 + *a2 + 136) != 27)
        goto LABEL_23;
      v6 = a2 + 2;
      if (a3 - (uint64_t)(a2 + 2) < 2)
        return 0xFFFFFFFFLL;
      if (a2[3] || *v6 != 45)
        goto LABEL_24;
      if (a3 - (uint64_t)(a2 + 4) < 2)
        return 0xFFFFFFFFLL;
      if (a2[5])
      {
        v7 = 0;
        a2 += 4;
      }
      else
      {
        v9 = a2[4];
        if (v9 == 62)
          a2 += 6;
        else
          a2 += 4;
        if (v9 == 62)
          v7 = 13;
        else
          v7 = 0;
      }
      break;
  }
LABEL_27:
  *a4 = a2;
  return v7;
}

BOOL little2_checkPiTarget(char *a1, uint64_t a2, _DWORD *a3)
{
  int v4;
  int v5;
  int v6;
  int v7;

  *a3 = 11;
  if (a2 - (_QWORD)a1 != 6 || a1[1])
    return 1;
  v4 = *a1;
  if (v4 == 120)
  {
    v5 = 0;
  }
  else
  {
    if (v4 != 88)
      return 1;
    v5 = 1;
  }
  if (a1[3])
    return 1;
  v6 = a1[2];
  if (v6 != 109)
  {
    if (v6 != 77)
      return 1;
    v5 = 1;
  }
  if (a1[5])
    return 1;
  v7 = a1[4];
  if (v7 == 108)
  {
    if (v5)
      return 0;
    *a3 = 12;
    return 1;
  }
  return v7 != 76;
}

uint64_t little2_scanRef(uint64_t a1, unsigned __int8 *a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  unsigned __int8 *v8;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  BOOL v17;
  int v18;

  v4 = a3 - (_QWORD)a2;
  if (a3 - (uint64_t)a2 < 2)
    return 0xFFFFFFFFLL;
  v5 = a2[1];
  if (a2[1] > 0xDBu)
  {
    if ((v5 - 220) < 4 || (_DWORD)v5 == 255 && *a2 > 0xFDu)
      goto LABEL_7;
    goto LABEL_26;
  }
  if ((v5 - 216) < 4)
    goto LABEL_4;
  if (a2[1])
    goto LABEL_26;
  v6 = 0;
  v7 = *(unsigned __int8 *)(a1 + *a2 + 136);
  if (v7 > 0x15)
  {
    if (v7 == 22 || v7 == 24)
      goto LABEL_27;
    if (v7 != 29)
      goto LABEL_8;
LABEL_26:
    if (((namingBitmap[(*a2 >> 5) | (8 * nmstrtPages[v5])] >> *a2) & 1) == 0)
      goto LABEL_7;
LABEL_27:
    a2 += 2;
    v4 = a3 - (_QWORD)a2;
    if (a3 - (uint64_t)a2 < 2)
      return 0xFFFFFFFFLL;
    while (1)
    {
      v10 = a2[1];
      if (a2[1] > 0xDBu)
      {
        if ((_DWORD)v10 == 255)
        {
          LODWORD(v11) = *a2;
          if (v11 > 0xFD)
            goto LABEL_7;
          goto LABEL_38;
        }
        if ((v10 - 220) < 4)
          goto LABEL_7;
      }
      else
      {
        if (!a2[1])
        {
          v6 = 0;
          v11 = *a2;
          v12 = *(unsigned __int8 *)(a1 + v11 + 136);
          switch(*(_BYTE *)(a1 + v11 + 136))
          {
            case 0x12:
              a2 += 2;
              v6 = 9;
              goto LABEL_8;
            case 0x13:
            case 0x14:
            case 0x15:
            case 0x17:
            case 0x1C:
              goto LABEL_8;
            case 0x16:
            case 0x18:
            case 0x19:
            case 0x1A:
            case 0x1B:
              goto LABEL_39;
            case 0x1D:
              goto LABEL_38;
            default:
              if (v12 == 6)
                goto LABEL_53;
              if (v12 != 7)
                goto LABEL_8;
              goto LABEL_4;
          }
        }
        if ((v10 - 216) < 4)
          goto LABEL_4;
      }
      LODWORD(v11) = *a2;
LABEL_38:
      if (((namingBitmap[(v11 >> 5) | (8 * namePages[v10])] >> v11) & 1) == 0)
        goto LABEL_7;
LABEL_39:
      a2 += 2;
      v4 -= 2;
      v6 = 0xFFFFFFFFLL;
      if (v4 <= 1)
        return v6;
    }
  }
  if (v7 == 6)
  {
LABEL_53:
    if ((unint64_t)v4 < 3)
      return 4294967294;
    goto LABEL_7;
  }
  if (v7 != 7)
  {
    if (v7 != 19)
      goto LABEL_8;
    v8 = a2 + 2;
    if (a3 - (uint64_t)(a2 + 2) >= 2)
    {
      if (a2[3])
        goto LABEL_16;
      v13 = *v8;
      if (v13 == 120)
      {
        if (a3 - (uint64_t)(a2 + 4) >= 2)
        {
          if (a2[5] || (*(_BYTE *)(a1 + a2[4] + 136) & 0xFE) != 0x18)
          {
            v6 = 0;
            a2 += 4;
            goto LABEL_8;
          }
          a2 += 6;
          v14 = a3 - (_QWORD)a2;
          if (a3 - (uint64_t)a2 >= 2)
          {
            while (!a2[1])
            {
              v15 = *(unsigned __int8 *)(a1 + *a2 + 136);
              if ((v15 - 24) >= 2)
              {
                if (v15 != 18)
                  goto LABEL_7;
                a2 += 2;
                v6 = 10;
                goto LABEL_8;
              }
              a2 += 2;
              v14 -= 2;
              v6 = 0xFFFFFFFFLL;
              if (v14 <= 1)
                return v6;
            }
            goto LABEL_7;
          }
        }
      }
      else
      {
        if (*(_BYTE *)(a1 + v13 + 136) != 25)
        {
LABEL_16:
          v6 = 0;
LABEL_17:
          a2 = v8;
          goto LABEL_8;
        }
        v8 = a2 + 4;
        v16 = v4 - 4;
        while (1)
        {
          v17 = v16 < 2;
          v16 -= 2;
          if (v17)
            break;
          a2 = v8;
          if (v8[1])
            goto LABEL_7;
          v8 += 2;
          v18 = *(unsigned __int8 *)(a1 + *a2 + 136);
          if (v18 != 25)
          {
            if (v18 != 18)
              goto LABEL_7;
            v6 = 10;
            goto LABEL_17;
          }
        }
      }
    }
    return 0xFFFFFFFFLL;
  }
LABEL_4:
  if ((unint64_t)v4 >= 4)
  {
LABEL_7:
    v6 = 0;
LABEL_8:
    *a4 = a2;
    return v6;
  }
  return 4294967294;
}

uint64_t little2_scanAtts(uint64_t a1, unsigned __int8 *a2, uint64_t a3, unsigned __int8 **a4)
{
  unint64_t v4;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  int v13;
  unsigned __int8 *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t i;
  unsigned int v21;
  unsigned int v24;
  int v25;
  unsigned __int8 **v26;
  unsigned int v27;
  uint64_t v28;
  int v29;
  unsigned int v30;
  int v31;
  unsigned __int8 *v32;

  v32 = a2;
  v4 = a3 - (_QWORD)a2;
  if (a3 - (uint64_t)a2 < 2)
    return 0xFFFFFFFFLL;
  v7 = 0;
  v8 = a3 - 4;
  while (1)
  {
    v9 = a2[1];
    if (a2[1] <= 0xDBu)
      break;
    if ((_DWORD)v9 != 255)
    {
      if ((v9 - 220) < 4)
        goto LABEL_106;
LABEL_21:
      LODWORD(v11) = *a2;
      goto LABEL_22;
    }
    LODWORD(v11) = *a2;
    if (v11 > 0xFD)
      goto LABEL_106;
LABEL_22:
    if (((namingBitmap[(v11 >> 5) | (8 * namePages[v9])] >> v11) & 1) == 0)
      goto LABEL_106;
LABEL_23:
    a2 += 2;
    v32 = a2;
LABEL_24:
    v4 = a3 - (_QWORD)a2;
    if (a3 - (uint64_t)a2 <= 1)
      return 0xFFFFFFFFLL;
  }
  if (a2[1])
  {
    if ((v9 - 216) < 4)
    {
LABEL_101:
      if (v4 >= 4)
      {
LABEL_106:
        result = 0;
        goto LABEL_107;
      }
      return 4294967294;
    }
    goto LABEL_21;
  }
  result = 0;
  v11 = *a2;
  switch(*(_BYTE *)(a1 + v11 + 136))
  {
    case 6:
      if (v4 >= 3)
        goto LABEL_106;
      return 4294967294;
    case 7:
      goto LABEL_101;
    case 9:
    case 0xA:
    case 0x15:
      a2 += 2;
      v12 = a3 - (_QWORD)a2;
      if (a3 - (uint64_t)a2 < 2)
        return 0xFFFFFFFFLL;
      while (2)
      {
        if (a2[1])
          goto LABEL_106;
        v13 = *(unsigned __int8 *)(a1 + *a2 + 136);
        if ((v13 - 9) < 2 || v13 == 21)
        {
          a2 += 2;
          v12 -= 2;
          if (v12 <= 1)
            return 0xFFFFFFFFLL;
          continue;
        }
        break;
      }
      if (v13 != 14)
        goto LABEL_106;
      v32 = a2;
LABEL_36:
      v15 = a2 + 2;
      if (a3 - (uint64_t)(a2 + 2) < 2)
        return 0xFFFFFFFFLL;
      for (i = v8 - (_QWORD)a2; ; i -= 2)
      {
        if (v15[1])
          goto LABEL_113;
        v21 = *(unsigned __int8 *)(a1 + *v15 + 136);
        if ((v21 & 0xFE) == 0xC)
          break;
        if (v21 > 0x15 || ((1 << v21) & 0x200600) == 0)
          goto LABEL_113;
        v15 += 2;
        result = 0xFFFFFFFFLL;
        if (i <= 1)
          return result;
      }
      v15 += 2;
      v32 = v15;
      if (i < 2)
        return 0xFFFFFFFFLL;
      while (2)
      {
        v24 = v15[1];
        if (v24 > 0xDB)
        {
          if (v24 - 220 < 4)
          {
            v25 = 8;
            goto LABEL_62;
          }
          if (v24 == 255 && *v15 > 0xFDu)
          {
            v25 = 0;
            goto LABEL_62;
          }
        }
        else
        {
          if (v24 - 216 < 4)
          {
            v25 = 7;
            goto LABEL_62;
          }
          if (!v15[1])
          {
            v25 = *(unsigned __int8 *)(a1 + *v15 + 136);
            goto LABEL_62;
          }
        }
        v25 = 29;
LABEL_62:
        if (v25 == v21)
        {
          a2 = v15 + 2;
          v32 = v15 + 2;
          if (a3 - (uint64_t)(v15 + 2) < 2)
            return 0xFFFFFFFFLL;
          if (v15[3])
            goto LABEL_106;
          result = 0;
          v27 = *(unsigned __int8 *)(a1 + *a2 + 136);
          if (v27 <= 0xA)
          {
            if (v27 - 9 >= 2)
              goto LABEL_107;
            goto LABEL_88;
          }
          if (v27 == 21)
          {
LABEL_88:
            a2 = v15 + 4;
            v28 = a3 - (_QWORD)(v15 + 4);
            if (v28 < 2)
              return 0xFFFFFFFFLL;
            while (2)
            {
              v29 = a2[1];
              if (!a2[1])
              {
                result = 0;
                switch(*(_BYTE *)(a1 + *a2 + 136))
                {
                  case 6:
                    if ((unint64_t)v28 >= 3)
                      goto LABEL_106;
                    return 4294967294;
                  case 7:
                    goto LABEL_103;
                  case 9:
                  case 0xA:
                  case 0x15:
                    a2 += 2;
                    v28 -= 2;
                    result = 0xFFFFFFFFLL;
                    if (v28 <= 1)
                      return result;
                    continue;
                  case 0xB:
                    goto LABEL_128;
                  case 0x11:
                    goto LABEL_118;
                  case 0x16:
                  case 0x18:
                    goto LABEL_100;
                  case 0x1D:
                    goto LABEL_98;
                  default:
                    goto LABEL_107;
                }
              }
              break;
            }
            if ((v29 - 216) < 4)
            {
LABEL_103:
              if ((unint64_t)v28 >= 4)
                goto LABEL_106;
              return 4294967294;
            }
            if ((v29 - 220) < 4)
              goto LABEL_106;
            if (v29 == 255)
            {
              v32 = a2;
              v30 = *a2;
              if (v30 > 0xFD)
                goto LABEL_106;
            }
            else
            {
LABEL_98:
              v32 = a2;
              v30 = *a2;
            }
            if (((namingBitmap[(v30 >> 5) | (8 * nmstrtPages[a2[1]])] >> v30) & 1) == 0)
              goto LABEL_106;
LABEL_100:
            v7 = 0;
            goto LABEL_23;
          }
          if (v27 == 11)
          {
LABEL_128:
            a2 += 2;
            result = 1;
            goto LABEL_107;
          }
          if (v27 != 17)
          {
LABEL_107:
            *a4 = a2;
            return result;
          }
LABEL_118:
          v15 = a2 + 2;
          v32 = a2 + 2;
          if (a3 - (uint64_t)(a2 + 2) >= 2)
          {
            if (!a2[3])
            {
              v31 = a2[2];
              if (v31 == 62)
                a2 += 4;
              else
                a2 += 2;
              if (v31 == 62)
                result = 3;
              else
                result = 0;
              goto LABEL_107;
            }
            goto LABEL_113;
          }
          return 0xFFFFFFFFLL;
        }
        switch(v25)
        {
          case 0:
          case 1:
          case 2:
          case 8:
            goto LABEL_113;
          case 3:
            v26 = a4;
            result = little2_scanRef(a1, v15 + 2, a3, &v32);
            if ((int)result >= 1)
            {
              v15 = v32;
              a4 = v26;
LABEL_72:
              i = a3 - (_QWORD)v15;
              result = 0xFFFFFFFFLL;
              if (a3 - (uint64_t)v15 <= 1)
                return result;
              continue;
            }
            if (!(_DWORD)result)
            {
              a4 = v26;
              a2 = v32;
              goto LABEL_107;
            }
            return result;
          case 6:
            if ((unint64_t)i < 3)
              return 4294967294;
            v15 += 3;
            goto LABEL_71;
          case 7:
            if ((unint64_t)i < 4)
              return 4294967294;
            v15 += 4;
            goto LABEL_71;
          default:
            v15 += 2;
LABEL_71:
            v32 = v15;
            goto LABEL_72;
        }
      }
    case 0xE:
      goto LABEL_36;
    case 0x16:
    case 0x18:
    case 0x19:
    case 0x1A:
    case 0x1B:
      goto LABEL_23;
    case 0x17:
      if (v7)
        goto LABEL_106;
      v15 = a2 + 2;
      v32 = a2 + 2;
      v16 = a3 - (_QWORD)(a2 + 2);
      if (v16 < 2)
        return 0xFFFFFFFFLL;
      v17 = a2[3];
      if (a2[3] > 0xDBu)
      {
        if ((_DWORD)v17 == 255)
        {
          LODWORD(v18) = *v15;
          if (v18 > 0xFD)
            goto LABEL_113;
LABEL_78:
          if (((namingBitmap[(v18 >> 5) | (8 * nmstrtPages[v17])] >> v18) & 1) == 0)
            goto LABEL_113;
          goto LABEL_79;
        }
        if ((v17 - 220) < 4)
          goto LABEL_113;
      }
      else
      {
        if (!a2[3])
        {
          v18 = *v15;
          v19 = *(unsigned __int8 *)(a1 + v18 + 136);
          if (v19 <= 0x17)
          {
            if (v19 != 22)
            {
              if (v19 == 6)
              {
                if ((unint64_t)v16 < 3)
                  return 4294967294;
              }
              else if (v19 == 7)
              {
LABEL_112:
                if ((unint64_t)v16 < 4)
                  return 4294967294;
              }
LABEL_113:
              result = 0;
              a2 = v15;
              goto LABEL_107;
            }
          }
          else if (v19 != 24)
          {
            if (v19 != 29)
              goto LABEL_113;
            goto LABEL_78;
          }
LABEL_79:
          a2 += 4;
          v32 = a2;
          v7 = 1;
          goto LABEL_24;
        }
        if ((v17 - 216) < 4)
          goto LABEL_112;
      }
      LODWORD(v18) = *v15;
      goto LABEL_78;
    case 0x1D:
      goto LABEL_22;
    default:
      goto LABEL_107;
  }
}

BOOL streqci(unsigned __int8 *a1, unsigned __int8 *a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;

  do
  {
    v3 = *a1++;
    v2 = v3;
    v5 = *a2++;
    v4 = v5;
    if ((v2 - 97) < 0x1A)
      LOBYTE(v2) = v2 - 32;
    if ((v4 - 97) < 0x1A)
      LOBYTE(v4) = v4 - 32;
    if (v2 == v4)
      v6 = 2 * (v2 == 0);
    else
      v6 = 1;
  }
  while (!v6);
  return v6 == 2;
}

uint64_t ascii_toUtf8(uint64_t a1, char **a2, unint64_t a3, unint64_t *a4, unint64_t a5)
{
  char *v5;
  char v6;
  _BYTE *v7;

  while (1)
  {
    v5 = *a2;
    if ((unint64_t)*a2 >= a3)
      return 0;
    if (*a4 >= a5)
      break;
    *a2 = v5 + 1;
    v6 = *v5;
    v7 = (_BYTE *)(*a4)++;
    *v7 = v6;
  }
  if (*a4 != a5)
    return 0;
  return 2;
}

uint64_t big2_prologTok(uint64_t a1, unsigned __int8 *a2, unint64_t a3, uint64_t *a4)
{
  uint64_t v6;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  int v12;
  unsigned int v13;
  int v14;
  int v15;
  unsigned __int8 *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned __int8 *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int v24;
  _BYTE *v25;
  uint64_t v26;
  _BYTE *v27;
  uint64_t v28;
  int v29;
  unsigned __int8 *v32;
  int v33;
  int v34;
  int v35;

  if ((unint64_t)a2 >= a3)
    return 4294967292;
  if (((a3 - (_QWORD)a2) & 0xFFFFFFFFFFFFFFFELL) == 0 || ((a3 - (_QWORD)a2) & 1) == 0)
    v6 = a3;
  else
    v6 = (uint64_t)&a2[(a3 - (_QWORD)a2) & 0xFFFFFFFFFFFFFFFELL];
  if (a3 - (_QWORD)a2 == 1)
    return 0xFFFFFFFFLL;
  v9 = *a2;
  if (*a2 > 0xDBu)
  {
    if ((v9 - 220) < 4)
      goto LABEL_16;
    if ((_DWORD)v9 == 255)
    {
      LODWORD(v10) = a2[1];
      if (v10 > 0xFD)
        goto LABEL_16;
      goto LABEL_29;
    }
LABEL_28:
    LODWORD(v10) = a2[1];
LABEL_29:
    v13 = v10 >> 5;
    v14 = namingBitmap[(v10 >> 5) | (8 * nmstrtPages[v9])];
    v15 = 1 << v10;
    if ((v15 & v14) != 0)
    {
      result = 18;
    }
    else
    {
      if ((namingBitmap[v13 | (8 * namePages[v9])] & v15) == 0)
        goto LABEL_16;
LABEL_32:
      result = 19;
    }
LABEL_33:
    v16 = a2 + 2;
    v17 = v6 - (_QWORD)(a2 + 2);
    if (v17 < 2)
      return -(int)result;
    while (1)
    {
      v18 = *v16;
      if (*v16 > 0xDBu)
        break;
      if (*v16)
      {
        if ((v18 - 216) < 4)
        {
LABEL_75:
          if ((unint64_t)v17 < 4)
            return 4294967294;
LABEL_76:
          result = 0;
LABEL_77:
          *a4 = (uint64_t)v16;
          return result;
        }
LABEL_49:
        LODWORD(v19) = v16[1];
        goto LABEL_50;
      }
      v19 = v16[1];
      switch(*(_BYTE *)(a1 + v19 + 136))
      {
        case 6:
          if ((unint64_t)v17 >= 3)
            goto LABEL_76;
          return 4294967294;
        case 7:
          goto LABEL_75;
        case 9:
        case 0xA:
        case 0xB:
        case 0x14:
        case 0x15:
        case 0x1E:
        case 0x20:
        case 0x23:
        case 0x24:
          goto LABEL_77;
        case 0xF:
          if ((_DWORD)result == 19)
            goto LABEL_76;
          *a4 = (uint64_t)(v16 + 2);
          return 30;
        case 0x16:
        case 0x18:
        case 0x19:
        case 0x1A:
        case 0x1B:
          goto LABEL_51;
        case 0x17:
          v20 = v16 + 2;
          if ((_DWORD)result == 41)
            goto LABEL_42;
          if ((_DWORD)result != 18)
            break;
          v21 = v6 - (_QWORD)v20;
          if (v6 - (uint64_t)v20 < 2)
            return 0xFFFFFFFFLL;
          v22 = *v20;
          if (*v20 > 0xDBu)
          {
            if ((v22 - 220) < 4)
              goto LABEL_42;
            if ((_DWORD)v22 == 255)
            {
              LODWORD(v23) = v16[3];
              if (v23 > 0xFD)
              {
LABEL_42:
                result = 19;
                break;
              }
              goto LABEL_64;
            }
LABEL_63:
            LODWORD(v23) = v16[3];
            goto LABEL_64;
          }
          if (*v20)
          {
            if ((v22 - 216) < 4)
              goto LABEL_72;
            goto LABEL_63;
          }
          v23 = v16[3];
          v24 = *(unsigned __int8 *)(a1 + v23 + 136);
          result = 19;
          if (v24 > 0x17)
          {
            if (v24 - 24 >= 4)
            {
              if (v24 != 29)
                break;
LABEL_64:
              if (((namingBitmap[(v23 >> 5) | (8 * namePages[v22])] >> v23) & 1) == 0)
                goto LABEL_73;
            }
LABEL_65:
            v20 = v16 + 4;
            result = 41;
            break;
          }
          if (*(unsigned __int8 *)(a1 + v23 + 136) <= 0x15u)
          {
            switch(v24)
            {
              case 5u:
                goto LABEL_73;
              case 6u:
                if (v21 >= 3)
                {
LABEL_73:
                  result = 0;
                  *a4 = (uint64_t)v20;
                  return result;
                }
                return 4294967294;
              case 7u:
LABEL_72:
                if (v21 >= 4)
                  goto LABEL_73;
                return 4294967294;
            }
          }
          else if (v24 == 22)
          {
            goto LABEL_65;
          }
          break;
        case 0x1D:
          goto LABEL_50;
        case 0x21:
          if ((_DWORD)result == 19)
            goto LABEL_76;
          *a4 = (uint64_t)(v16 + 2);
          return 31;
        case 0x22:
          if ((_DWORD)result == 19)
            goto LABEL_76;
          *a4 = (uint64_t)(v16 + 2);
          return 32;
        default:
          goto LABEL_76;
      }
LABEL_52:
      v17 = v6 - (_QWORD)v20;
      v16 = v20;
      if (v6 - (uint64_t)v20 <= 1)
        return -(int)result;
    }
    if ((_DWORD)v18 != 255)
    {
      if ((v18 - 220) < 4)
        goto LABEL_76;
      goto LABEL_49;
    }
    LODWORD(v19) = v16[1];
    if (v19 > 0xFD)
      goto LABEL_76;
LABEL_50:
    if (((namingBitmap[(v19 >> 5) | (8 * namePages[v18])] >> v19) & 1) == 0)
      goto LABEL_76;
LABEL_51:
    v20 = v16 + 2;
    goto LABEL_52;
  }
  if ((v9 - 216) < 4)
  {
LABEL_13:
    if (v6 - (uint64_t)a2 < 4)
      return 4294967294;
LABEL_16:
    result = 0;
    *a4 = (uint64_t)a2;
    return result;
  }
  if (*a2)
    goto LABEL_28;
  v10 = a2[1];
  result = 18;
  switch(*(_BYTE *)(a1 + v10 + 136))
  {
    case 2:
      v11 = a2 + 2;
      if (v6 - (uint64_t)(a2 + 2) < 2)
        return 0xFFFFFFFFLL;
      v12 = *v11;
      if ((v12 - 220) < 4)
        goto LABEL_112;
      if (!*v11)
      {
        v35 = *(unsigned __int8 *)(a1 + a2[3] + 136);
        switch(*(_BYTE *)(a1 + a2[3] + 136))
        {
          case 0xF:
            result = big2_scanPi(a1, a2 + 4, v6, a4);
            break;
          case 0x10:
            result = big2_scanDecl(a1, a2 + 4, v6, a4);
            break;
          case 0x11:
          case 0x12:
          case 0x13:
          case 0x14:
          case 0x15:
          case 0x17:
            goto LABEL_112;
          case 0x16:
          case 0x18:
            goto LABEL_139;
          default:
            if ((v35 - 5) < 3 || v35 == 29)
              goto LABEL_139;
            goto LABEL_112;
        }
        return result;
      }
      if (v12 != 255 || a2[3] <= 0xFDu)
      {
LABEL_139:
        *a4 = (uint64_t)a2;
        return 29;
      }
      goto LABEL_112;
    case 4:
      v25 = a2 + 2;
      v26 = v6 - (_QWORD)(a2 + 2);
      if (v26 < 2)
        return 4294967270;
      if (*v25 || a2[3] != 93)
        goto LABEL_117;
      if ((unint64_t)v26 < 4)
        return 0xFFFFFFFFLL;
      if (a2[4] || a2[5] != 62)
      {
LABEL_117:
        *a4 = (uint64_t)v25;
        return 26;
      }
      else
      {
        *a4 = (uint64_t)(a2 + 6);
        return 34;
      }
    case 5:
      if (v6 - (uint64_t)a2 >= 2)
        goto LABEL_16;
      return 4294967294;
    case 6:
      if (v6 - (uint64_t)a2 >= 3)
        goto LABEL_16;
      return 4294967294;
    case 7:
      goto LABEL_13;
    case 9:
      if (a2 + 2 != (unsigned __int8 *)v6)
        goto LABEL_90;
      *a4 = v6;
      return 4294967281;
    case 0xA:
    case 0x15:
LABEL_90:
      v27 = a2 + 2;
      v28 = v6 - (_QWORD)(a2 + 2);
      if (v28 >= 2)
      {
        do
        {
          if (*v27)
            break;
          v29 = *(unsigned __int8 *)(a1 + v27[1] + 136);
          if (v29 != 21 && v29 != 10 && (v29 != 9 || v27 + 2 == (_BYTE *)v6))
            break;
          v27 += 2;
          v28 -= 2;
        }
        while (v28 > 1);
      }
      *a4 = (uint64_t)v27;
      return 15;
    case 0xB:
      *a4 = (uint64_t)(a2 + 2);
      return 17;
    case 0xC:
      v32 = a2 + 2;
      v33 = 12;
      return big2_scanLit(v33, a1, v32, v6, (unsigned __int8 **)a4);
    case 0xD:
      v32 = a2 + 2;
      v33 = 13;
      return big2_scanLit(v33, a1, v32, v6, (unsigned __int8 **)a4);
    case 0x13:
      return big2_scanPoundName(a1, a2 + 2, v6, a4);
    case 0x14:
      *a4 = (uint64_t)(a2 + 2);
      return 25;
    case 0x16:
    case 0x18:
      goto LABEL_33;
    case 0x17:
    case 0x19:
    case 0x1A:
    case 0x1B:
      goto LABEL_32;
    case 0x1D:
      goto LABEL_29;
    case 0x1E:
      return big2_scanPercent(a1, a2 + 2, v6, a4);
    case 0x1F:
      *a4 = (uint64_t)(a2 + 2);
      return 23;
    case 0x20:
      v11 = a2 + 2;
      if (v6 - (uint64_t)(a2 + 2) < 2)
        return 4294967272;
      if (*v11)
        goto LABEL_112;
      v34 = *(unsigned __int8 *)(a1 + a2[3] + 136);
      if (v34 <= 31)
      {
        if ((v34 - 9) >= 3)
        {
          if (v34 == 15)
          {
            *a4 = (uint64_t)(a2 + 4);
            return 35;
          }
          if (v34 != 21)
          {
LABEL_112:
            result = 0;
            *a4 = (uint64_t)v11;
            return result;
          }
        }
LABEL_133:
        *a4 = (uint64_t)v11;
        return 24;
      }
      switch(v34)
      {
        case ' ':
        case '#':
        case '$':
          goto LABEL_133;
        case '!':
          *a4 = (uint64_t)(a2 + 4);
          result = 36;
          break;
        case '"':
          *a4 = (uint64_t)(a2 + 4);
          result = 37;
          break;
        default:
          goto LABEL_112;
      }
      break;
    case 0x23:
      *a4 = (uint64_t)(a2 + 2);
      return 38;
    case 0x24:
      *a4 = (uint64_t)(a2 + 2);
      return 21;
    default:
      goto LABEL_16;
  }
  return result;
}

uint64_t big2_contentTok(uint64_t a1, unsigned __int8 *a2, unint64_t a3, unsigned __int8 **a4)
{
  char v4;
  unint64_t v5;
  BOOL v6;
  uint64_t v7;
  unsigned int v9;
  unsigned __int8 *v10;
  unsigned __int8 *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unsigned int v15;
  unsigned __int8 *v16;
  unsigned __int8 *v17;
  unsigned __int8 *v18;
  uint64_t v19;
  unsigned __int8 *v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unsigned __int8 *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unsigned int v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unsigned __int8 *v36;
  uint64_t v37;
  uint64_t v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  BOOL v45;
  int v46;

  if ((unint64_t)a2 >= a3)
    return 4294967292;
  v4 = a3 - (_BYTE)a2;
  v5 = (a3 - (_QWORD)a2) & 0xFFFFFFFFFFFFFFFELL;
  if (v5)
    v6 = ((a3 - (_QWORD)a2) & 1) == 0;
  else
    v6 = 1;
  if (!v6)
    a3 = (unint64_t)&a2[v5];
  if ((v4 & 1) != 0 && !v5)
    return 0xFFFFFFFFLL;
  v9 = *a2;
  if (v9 > 0xDB)
  {
    if (v9 - 220 < 4 || v9 == 255 && a2[1] > 0xFDu)
    {
LABEL_17:
      v7 = 0;
      *a4 = a2;
      return v7;
    }
    goto LABEL_28;
  }
  if (v9 - 216 < 4)
  {
LABEL_14:
    if ((uint64_t)(a3 - (_QWORD)a2) < 4)
      return 4294967294;
    v10 = a2 + 4;
    goto LABEL_29;
  }
  if (*a2)
  {
LABEL_28:
    v10 = a2 + 2;
LABEL_29:
    v14 = a3 - (_QWORD)v10;
    if ((uint64_t)(a3 - (_QWORD)v10) < 2)
    {
      v16 = v10;
LABEL_53:
      *a4 = v16;
      return 6;
    }
    while (1)
    {
      v15 = *v10;
      if (v15 > 0xDB)
        break;
      if (v15 - 216 >= 4)
      {
        if (!*v10)
        {
          switch(*(_BYTE *)(a1 + v10[1] + 136))
          {
            case 0:
            case 1:
            case 2:
            case 3:
            case 8:
            case 9:
            case 0xA:
              goto LABEL_54;
            case 4:
              if (v14 < 4)
                goto LABEL_54;
              v16 = v10 + 2;
              if (v10[2] || v10[3] != 93)
                goto LABEL_48;
              if (v14 < 6)
                goto LABEL_54;
              if (v10[4] || v10[5] != 62)
                goto LABEL_48;
              v7 = 0;
              v11 = v10 + 4;
              break;
            case 6:
              if (v14 <= 2)
                goto LABEL_54;
              v16 = v10 + 3;
              goto LABEL_48;
            case 7:
              goto LABEL_32;
            default:
              goto LABEL_47;
          }
          goto LABEL_79;
        }
        goto LABEL_47;
      }
LABEL_32:
      if (v14 <= 3)
        goto LABEL_54;
      v16 = v10 + 4;
LABEL_48:
      v14 = a3 - (_QWORD)v16;
      v10 = v16;
      if ((uint64_t)(a3 - (_QWORD)v16) <= 1)
        goto LABEL_53;
    }
    if (v15 == 255)
    {
      if (v10[1] > 0xFDu)
        goto LABEL_54;
    }
    else if (v15 - 220 < 4)
    {
LABEL_54:
      *a4 = v10;
      return 6;
    }
LABEL_47:
    v16 = v10 + 2;
    goto LABEL_48;
  }
  switch(*(_BYTE *)(a1 + a2[1] + 136))
  {
    case 0:
    case 1:
    case 8:
      goto LABEL_17;
    case 2:
      v11 = a2 + 2;
      v12 = a3 - (_QWORD)(a2 + 2);
      if (v12 < 2)
        return 0xFFFFFFFFLL;
      v13 = *v11;
      if (*v11 > 0xDBu)
      {
        if ((v13 - 220) < 4)
          goto LABEL_78;
        if ((_DWORD)v13 == 255)
        {
          LODWORD(v19) = a2[3];
          if (v19 > 0xFD)
            goto LABEL_78;
          goto LABEL_88;
        }
LABEL_87:
        LODWORD(v19) = a2[3];
LABEL_88:
        if (((namingBitmap[(v19 >> 5) | (8 * nmstrtPages[v13])] >> v19) & 1) == 0)
          goto LABEL_78;
LABEL_89:
        v20 = a2 + 4;
        v21 = a3 - (_QWORD)(a2 + 4);
        if (v21 < 2)
          return 0xFFFFFFFFLL;
        v22 = 0;
        while (1)
        {
          v23 = *v20;
          if (*v20 > 0xDBu)
            break;
          if (*v20)
          {
            if ((v23 - 216) < 4)
            {
LABEL_124:
              if ((unint64_t)v21 >= 4)
              {
LABEL_125:
                v7 = 0;
                *a4 = v20;
                return v7;
              }
              return 4294967294;
            }
LABEL_109:
            LODWORD(v24) = v20[1];
            goto LABEL_110;
          }
          v24 = v20[1];
          v25 = 2;
          switch(*(_BYTE *)(a1 + v24 + 136))
          {
            case 6:
              if ((unint64_t)v21 >= 3)
                goto LABEL_125;
              return 4294967294;
            case 7:
              goto LABEL_124;
            case 9:
            case 0xA:
            case 0x15:
              v35 = a3 - (_QWORD)v20 - 2;
              if (v35 < 2)
                return 0xFFFFFFFFLL;
              v36 = v20 + 4;
              while (2)
              {
                v37 = *(v36 - 2);
                if (!*(v36 - 2))
                {
                  v38 = *(v36 - 1);
                  switch(*(_BYTE *)(a1 + v38 + 136))
                  {
                    case 6:
                      if ((unint64_t)v35 >= 3)
                        goto LABEL_220;
                      return 4294967294;
                    case 7:
                      goto LABEL_195;
                    case 9:
                    case 0xA:
                    case 0x15:
                      v35 -= 2;
                      v36 += 2;
                      v7 = 0xFFFFFFFFLL;
                      if (v35 <= 1)
                        return v7;
                      continue;
                    case 0xB:
                      v20 = v36 - 2;
                      goto LABEL_211;
                    case 0x11:
                      v20 = v36 - 2;
                      goto LABEL_213;
                    case 0x16:
                    case 0x18:
                      return big2_scanAtts(a1, v36, a3, a4);
                    case 0x1D:
                      v37 = 0;
                      goto LABEL_218;
                    default:
                      goto LABEL_220;
                  }
                }
                break;
              }
              if ((v37 - 216) < 4)
              {
LABEL_195:
                if ((unint64_t)v35 < 4)
                  return 4294967294;
              }
              else
              {
                if ((v37 - 220) < 4)
                  goto LABEL_220;
                if ((_DWORD)v37 == 255)
                {
                  LODWORD(v38) = *(v36 - 1);
                  if (v38 > 0xFD)
                    goto LABEL_220;
                  v37 = 0xFFu;
                }
                else
                {
                  LODWORD(v38) = *(v36 - 1);
                }
LABEL_218:
                if (((namingBitmap[(v38 >> 5) | (8 * nmstrtPages[v37])] >> v38) & 1) != 0)
                  return big2_scanAtts(a1, v36, a3, a4);
              }
LABEL_220:
              v7 = 0;
              v11 = v36 - 2;
              goto LABEL_79;
            case 0xB:
LABEL_211:
              *a4 = v20 + 2;
              return 2;
            case 0x11:
LABEL_213:
              v11 = v20 + 2;
              if ((uint64_t)(a3 - (_QWORD)(v20 + 2)) < 2)
                return 0xFFFFFFFFLL;
              if (*v11 || v20[3] != 62)
                goto LABEL_78;
              *a4 = v20 + 4;
              return 4;
            case 0x16:
            case 0x18:
            case 0x19:
            case 0x1A:
            case 0x1B:
              break;
            case 0x17:
              if (v22)
                goto LABEL_125;
              v26 = v20 + 2;
              v27 = a3 - (_QWORD)(v20 + 2);
              if (v27 < 2)
                return 0xFFFFFFFFLL;
              v28 = *v26;
              if (*v26 > 0xDBu)
              {
                if ((_DWORD)v28 == 255)
                {
                  LODWORD(v29) = v20[3];
                  if (v29 > 0xFD)
                    goto LABEL_174;
                  goto LABEL_121;
                }
                if ((v28 - 220) < 4)
                  goto LABEL_174;
                goto LABEL_120;
              }
              if (*v26)
              {
                if ((v28 - 216) < 4)
                  goto LABEL_146;
LABEL_120:
                LODWORD(v29) = v20[3];
LABEL_121:
                if (((namingBitmap[(v29 >> 5) | (8 * nmstrtPages[v28])] >> v29) & 1) == 0)
                  goto LABEL_174;
                v22 = 1;
LABEL_123:
                v25 = 4;
                break;
              }
              v29 = v20[3];
              v30 = *(unsigned __int8 *)(a1 + v29 + 136);
              if (v30 <= 0x15)
              {
                if (v30 != 5)
                {
                  if (v30 == 6)
                  {
                    if ((unint64_t)v27 < 3)
                      return 4294967294;
                  }
                  else if (v30 == 7)
                  {
LABEL_146:
                    if ((unint64_t)v27 < 4)
                      return 4294967294;
                  }
                }
LABEL_174:
                v7 = 0;
                *a4 = v26;
                return v7;
              }
              v22 = 1;
              if (v30 == 22)
                goto LABEL_123;
              v25 = 4;
              if (v30 != 24)
              {
                if (v30 != 29)
                  goto LABEL_174;
                goto LABEL_121;
              }
              break;
            case 0x1D:
              goto LABEL_110;
            default:
              goto LABEL_125;
          }
LABEL_112:
          v20 += v25;
          v21 = a3 - (_QWORD)v20;
          v7 = 0xFFFFFFFFLL;
          if ((uint64_t)(a3 - (_QWORD)v20) <= 1)
            return v7;
        }
        if ((_DWORD)v23 != 255)
        {
          if ((v23 - 220) < 4)
            goto LABEL_125;
          goto LABEL_109;
        }
        LODWORD(v24) = v20[1];
        if (v24 > 0xFD)
          goto LABEL_125;
LABEL_110:
        if (((namingBitmap[(v24 >> 5) | (8 * namePages[v23])] >> v24) & 1) == 0)
          goto LABEL_125;
        v25 = 2;
        goto LABEL_112;
      }
      if ((v13 - 216) < 4)
      {
LABEL_24:
        if ((unint64_t)v12 < 4)
          return 4294967294;
LABEL_78:
        v7 = 0;
        goto LABEL_79;
      }
      if (*v11)
        goto LABEL_87;
      v19 = a2[3];
      switch(*(_BYTE *)(a1 + v19 + 136))
      {
        case 5:
        case 8:
        case 9:
        case 0xA:
        case 0xB:
        case 0xC:
        case 0xD:
        case 0xE:
        case 0x12:
        case 0x13:
        case 0x14:
        case 0x15:
        case 0x17:
          goto LABEL_78;
        case 6:
          if ((unint64_t)v12 >= 3)
            goto LABEL_78;
          return 4294967294;
        case 7:
          goto LABEL_24;
        case 0xF:
          return big2_scanPi(a1, a2 + 4, a3, (uint64_t *)a4);
        case 0x10:
          v11 = a2 + 4;
          if ((uint64_t)(a3 - (_QWORD)(a2 + 4)) < 2)
            return 0xFFFFFFFFLL;
          if (*v11)
            goto LABEL_78;
          v31 = *(unsigned __int8 *)(a1 + a2[5] + 136);
          if (v31 != 20)
          {
            if (v31 != 27)
              goto LABEL_78;
            return big2_scanComment(a1, a2 + 6, a3, a4);
          }
          v11 = a2 + 6;
          if ((uint64_t)(a3 - (_QWORD)(a2 + 6)) < 12)
            return 0xFFFFFFFFLL;
          v40 = 0;
          while (!*v11 && v11[1] == big2_scanCdataSection_CDATA_LSQB[v40])
          {
            ++v40;
            v11 += 2;
            if (v40 == 6)
            {
              v7 = 8;
              v11 = a2 + 18;
              goto LABEL_79;
            }
          }
          goto LABEL_78;
        case 0x11:
          v11 = a2 + 4;
          v32 = a3 - (_QWORD)(a2 + 4);
          if (v32 < 2)
            return 0xFFFFFFFFLL;
          v33 = *v11;
          if (*v11 > 0xDBu)
          {
            if ((v33 - 220) < 4)
              goto LABEL_78;
            if ((_DWORD)v33 == 255)
            {
              LODWORD(v34) = a2[5];
              if (v34 > 0xFD)
                goto LABEL_78;
              goto LABEL_176;
            }
LABEL_175:
            LODWORD(v34) = a2[5];
            goto LABEL_176;
          }
          if ((v33 - 216) < 4)
          {
LABEL_137:
            if ((unint64_t)v32 < 4)
              return 4294967294;
            goto LABEL_78;
          }
          if (*v11)
            goto LABEL_175;
          v7 = 0;
          v34 = a2[5];
          v39 = *(unsigned __int8 *)(a1 + v34 + 136);
          if (v39 <= 0x15)
          {
            if (v39 == 6)
            {
              if ((unint64_t)v32 < 3)
                return 4294967294;
              goto LABEL_78;
            }
            if (v39 != 7)
              goto LABEL_79;
            goto LABEL_137;
          }
          if (v39 != 22 && v39 != 24)
          {
            if (v39 != 29)
              goto LABEL_79;
LABEL_176:
            if (((namingBitmap[(v34 >> 5) | (8 * nmstrtPages[v33])] >> v34) & 1) == 0)
              goto LABEL_78;
          }
          if ((uint64_t)(a3 - (_QWORD)a2 - 6) < 2)
            return 0xFFFFFFFFLL;
          v41 = a3 - (_QWORD)a2 - 8;
          v11 = a2 + 8;
          while (1)
          {
            v42 = *(v11 - 2);
            if (*(v11 - 2) > 0xDBu)
            {
              if ((_DWORD)v42 == 255)
              {
                LODWORD(v43) = *(v11 - 1);
                if (v43 > 0xFD)
                  goto LABEL_207;
                goto LABEL_191;
              }
              if ((v42 - 220) < 4)
                goto LABEL_207;
LABEL_190:
              LODWORD(v43) = *(v11 - 1);
              goto LABEL_191;
            }
            if (*(v11 - 2))
            {
              if ((v42 - 216) < 4)
              {
LABEL_206:
                if ((unint64_t)(v41 + 2) < 4)
                  return 4294967294;
LABEL_207:
                v7 = 0;
                v11 -= 2;
                goto LABEL_79;
              }
              goto LABEL_190;
            }
            v43 = *(v11 - 1);
            v44 = *(unsigned __int8 *)(a1 + v43 + 136);
            if ((v44 - 22) < 6)
              goto LABEL_192;
            if (v44 != 29)
              break;
LABEL_191:
            if (((namingBitmap[(v43 >> 5) | (8 * namePages[v42])] >> v43) & 1) == 0)
              goto LABEL_207;
LABEL_192:
            v11 += 2;
            v7 = 0xFFFFFFFFLL;
            v45 = v41 <= 1;
            v41 -= 2;
            if (v45)
              return v7;
          }
          switch(*(_BYTE *)(a1 + v43 + 136))
          {
            case 6:
              if ((unint64_t)(v41 + 2) >= 3)
                goto LABEL_207;
              return 4294967294;
            case 7:
              goto LABEL_206;
            case 8:
              goto LABEL_207;
            case 9:
            case 0xA:
              goto LABEL_222;
            case 0xB:
              goto LABEL_233;
            default:
              if (v44 != 21)
                goto LABEL_207;
LABEL_222:
              if (v41 < 2)
                return 0xFFFFFFFFLL;
              break;
          }
          while (1)
          {
            if (*v11)
              goto LABEL_78;
            v46 = *(unsigned __int8 *)(a1 + v11[1] + 136);
            if ((v46 - 9) >= 2 && v46 != 21)
              break;
            v11 += 2;
            v41 -= 2;
            v7 = 0xFFFFFFFFLL;
            if (v41 <= 1)
              return v7;
          }
          if (v46 != 11)
            goto LABEL_78;
          v11 += 2;
LABEL_233:
          v7 = 5;
LABEL_79:
          *a4 = v11;
          return v7;
        case 0x16:
        case 0x18:
          goto LABEL_89;
        default:
          if (*(_BYTE *)(a1 + v19 + 136) != 29)
            goto LABEL_78;
          goto LABEL_88;
      }
    case 3:
      return big2_scanRef(a1, a2 + 2, a3, a4);
    case 4:
      v10 = a2 + 2;
      if ((uint64_t)(a3 - (_QWORD)(a2 + 2)) < 2)
        return 4294967291;
      if (*v10 || a2[3] != 93)
        goto LABEL_29;
      v17 = a2 + 4;
      if ((uint64_t)(a3 - (_QWORD)(a2 + 4)) < 2)
        return 4294967291;
      if (!*v17 && a2[5] == 62)
      {
        v7 = 0;
        *a4 = v17;
        return v7;
      }
      goto LABEL_29;
    case 5:
      if ((uint64_t)(a3 - (_QWORD)a2) >= 2)
        goto LABEL_28;
      return 4294967294;
    case 6:
      if ((uint64_t)(a3 - (_QWORD)a2) < 3)
        return 4294967294;
      v10 = a2 + 3;
      goto LABEL_29;
    case 7:
      goto LABEL_14;
    case 9:
      v18 = a2 + 2;
      if ((uint64_t)(a3 - (_QWORD)(a2 + 2)) < 2)
        return 4294967293;
      if (!*v18 && *(_BYTE *)(a1 + a2[3] + 136) == 10)
        v18 = a2 + 4;
LABEL_74:
      *a4 = v18;
      return 7;
    case 0xA:
      v18 = a2 + 2;
      goto LABEL_74;
    default:
      goto LABEL_28;
  }
}

uint64_t big2_cdataSectionTok(uint64_t a1, unsigned __int8 *a2, unint64_t a3, unsigned __int8 **a4)
{
  unint64_t v4;
  BOOL v5;
  unsigned __int8 *v6;
  uint64_t v7;
  unsigned int v8;
  unsigned __int8 *v9;
  unint64_t v10;
  unsigned int v11;
  uint64_t v12;
  unsigned int v13;

  if ((unint64_t)a2 >= a3)
    return 4294967292;
  v4 = (a3 - (_QWORD)a2) & 0xFFFFFFFFFFFFFFFELL;
  if (v4)
    v5 = ((a3 - (_QWORD)a2) & 1) == 0;
  else
    v5 = 1;
  v6 = &a2[v4];
  if (v5)
    v6 = (unsigned __int8 *)a3;
  if ((((_BYTE)a3 - (_BYTE)a2) & 1) == 0 || v4)
  {
    v8 = *a2;
    if (v8 > 0xDB)
    {
      if (v8 - 220 < 4 || v8 == 255 && a2[1] > 0xFDu)
      {
        v7 = 0;
        goto LABEL_51;
      }
    }
    else
    {
      if (v8 - 216 < 4)
      {
LABEL_13:
        if (v6 - a2 < 4)
          return 4294967294;
        v9 = a2 + 4;
        goto LABEL_30;
      }
      if (!*a2)
      {
        v7 = 0;
        switch(*(_BYTE *)(a1 + a2[1] + 136))
        {
          case 0:
          case 1:
          case 8:
            goto LABEL_51;
          case 4:
            v9 = a2 + 2;
            if (v6 - (a2 + 2) < 2)
              return 0xFFFFFFFFLL;
            if (*v9 || a2[3] != 93)
              goto LABEL_30;
            if (v6 - (a2 + 4) < 2)
              return 0xFFFFFFFFLL;
            if (a2[4] || a2[5] != 62)
              goto LABEL_30;
            a2 += 6;
            v7 = 40;
            goto LABEL_51;
          case 5:
            if (v6 - a2 >= 2)
              goto LABEL_29;
            return 4294967294;
          case 6:
            if (v6 - a2 < 3)
              return 4294967294;
            v9 = a2 + 3;
            goto LABEL_30;
          case 7:
            goto LABEL_13;
          case 9:
            v9 = a2 + 2;
            if (v6 - (a2 + 2) < 2)
              return 0xFFFFFFFFLL;
            if (*v9)
            {
              v7 = 7;
              goto LABEL_50;
            }
            if (*(_BYTE *)(a1 + a2[3] + 136) == 10)
              a2 += 4;
            else
              a2 += 2;
LABEL_61:
            v7 = 7;
            break;
          case 0xA:
            a2 += 2;
            goto LABEL_61;
          default:
            goto LABEL_29;
        }
        goto LABEL_51;
      }
    }
LABEL_29:
    v9 = a2 + 2;
LABEL_30:
    v10 = v6 - v9;
    if (v6 - v9 >= 2)
    {
      while (1)
      {
        v11 = *v9;
        if (v11 > 0xDB)
          break;
        if (v11 - 216 < 4)
          goto LABEL_33;
        v12 = 2;
        if (!*v9)
        {
          v13 = *(unsigned __int8 *)(a1 + v9[1] + 136);
          if (v13 <= 0xA)
          {
            if (v13 == 6)
            {
              if (v10 < 3)
                goto LABEL_49;
              v12 = 3;
              goto LABEL_48;
            }
            if (v13 != 7)
            {
              v12 = 2;
              if (((1 << v13) & 0x713) != 0)
                goto LABEL_49;
              goto LABEL_48;
            }
LABEL_33:
            if (v10 < 4)
              goto LABEL_49;
            v12 = 4;
            goto LABEL_48;
          }
          goto LABEL_37;
        }
LABEL_48:
        v9 += v12;
        v10 = v6 - v9;
        if (v6 - v9 <= 1)
          goto LABEL_49;
      }
      if (v11 != 255)
      {
        v12 = 2;
        if (v11 - 220 < 4)
          goto LABEL_49;
        goto LABEL_48;
      }
      if (v9[1] > 0xFDu)
        goto LABEL_49;
LABEL_37:
      v12 = 2;
      goto LABEL_48;
    }
LABEL_49:
    v7 = 6;
LABEL_50:
    a2 = v9;
LABEL_51:
    *a4 = a2;
    return v7;
  }
  return 0xFFFFFFFFLL;
}

uint64_t big2_ignoreSectionTok(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, _QWORD *a4)
{
  unsigned __int8 *v4;
  unint64_t v5;
  int v6;
  unsigned int v7;
  unsigned __int8 *v8;
  uint64_t v9;

  v4 = &a2[(a3 - a2) & 0xFFFFFFFFFFFFFFFELL];
  if (((a3 - a2) & 1) == 0)
    v4 = a3;
  v5 = v4 - a2;
  if (v4 - a2 < 2)
    return 0xFFFFFFFFLL;
  v6 = 0;
  while (1)
  {
    v7 = *a2;
    if (v7 > 0xDB)
    {
      if (v7 == 255)
      {
        if (a2[1] > 0xFDu)
          goto LABEL_37;
      }
      else if (v7 - 220 < 4)
      {
LABEL_37:
        v9 = 0;
        goto LABEL_38;
      }
      goto LABEL_22;
    }
    if (v7 - 216 >= 4)
      break;
LABEL_7:
    if (v5 < 4)
      return 4294967294;
    v8 = a2 + 4;
LABEL_23:
    v5 = v4 - v8;
    a2 = v8;
    if (v4 - v8 <= 1)
      return 0xFFFFFFFFLL;
  }
  if (*a2)
  {
LABEL_22:
    v8 = a2 + 2;
    goto LABEL_23;
  }
  v9 = 0;
  switch(*(_BYTE *)(a1 + a2[1] + 136))
  {
    case 0:
    case 1:
    case 8:
      goto LABEL_38;
    case 2:
      v8 = a2 + 2;
      if (v4 - (a2 + 2) < 2)
        return 0xFFFFFFFFLL;
      if (*v8 || a2[3] != 33)
        goto LABEL_23;
      v8 = a2 + 4;
      if (v4 - (a2 + 4) < 2)
        return 0xFFFFFFFFLL;
      if (!*v8 && a2[5] == 91)
      {
        ++v6;
        v8 = a2 + 6;
      }
      goto LABEL_23;
    case 4:
      v8 = a2 + 2;
      if (v4 - (a2 + 2) < 2)
        return 0xFFFFFFFFLL;
      if (*v8 || a2[3] != 93)
        goto LABEL_23;
      v8 = a2 + 4;
      if (v4 - (a2 + 4) < 2)
        return 0xFFFFFFFFLL;
      if (*v8 || a2[5] != 62)
        goto LABEL_23;
      v8 = a2 + 6;
      if (v6)
      {
        --v6;
        goto LABEL_23;
      }
      v9 = 42;
      a2 += 6;
LABEL_38:
      *a4 = a2;
      return v9;
    case 6:
      if (v5 < 3)
        return 4294967294;
      v8 = a2 + 3;
      goto LABEL_23;
    case 7:
      goto LABEL_7;
    default:
      goto LABEL_22;
  }
}

uint64_t big2_attributeValueTok(uint64_t a1, unsigned __int8 *a2, unint64_t a3, unsigned __int8 **a4)
{
  unsigned __int8 *v4;
  uint64_t v5;
  uint64_t result;
  unsigned __int8 *v7;

  if ((unint64_t)a2 >= a3)
    return 4294967292;
  if ((uint64_t)(a3 - (_QWORD)a2) < 2)
    return 0xFFFFFFFFLL;
  v4 = a2;
  while (*v4 - 216 < 4)
  {
LABEL_5:
    v5 = 4;
LABEL_6:
    v4 += v5;
    if ((uint64_t)(a3 - (_QWORD)v4) <= 1)
    {
LABEL_27:
      *a4 = v4;
      return 6;
    }
  }
  if (*v4)
  {
    v5 = 2;
    goto LABEL_6;
  }
  v5 = 2;
  switch(*(_BYTE *)(a1 + v4[1] + 136))
  {
    case 2:
      result = 0;
      *a4 = v4;
      return result;
    case 3:
      if (v4 != a2)
        goto LABEL_27;
      return big2_scanRef(a1, a2 + 2, a3, a4);
    case 4:
    case 5:
    case 8:
      goto LABEL_6;
    case 6:
      v5 = 3;
      goto LABEL_6;
    case 7:
      goto LABEL_5;
    case 9:
      if (v4 != a2)
        goto LABEL_27;
      v7 = a2 + 2;
      if ((uint64_t)(a3 - (_QWORD)(a2 + 2)) < 2)
      {
        result = 4294967293;
      }
      else
      {
        if (!*v7 && *(_BYTE *)(a1 + a2[3] + 136) == 10)
          v7 = a2 + 4;
LABEL_29:
        *a4 = v7;
        result = 7;
      }
      break;
    case 0xA:
      if (v4 != a2)
        goto LABEL_27;
      v7 = a2 + 2;
      goto LABEL_29;
    default:
      if (*(_BYTE *)(a1 + v4[1] + 136) != 21)
        goto LABEL_6;
      if (v4 != a2)
        goto LABEL_27;
      *a4 = a2 + 2;
      result = 39;
      break;
  }
  return result;
}

uint64_t big2_entityValueTok(uint64_t a1, unsigned __int8 *a2, unint64_t a3, unsigned __int8 **a4)
{
  unsigned __int8 *v4;
  uint64_t v5;
  uint64_t result;
  unsigned __int8 *v7;

  if ((unint64_t)a2 >= a3)
    return 4294967292;
  if ((uint64_t)(a3 - (_QWORD)a2) < 2)
    return 0xFFFFFFFFLL;
  v4 = a2;
  while (*v4 - 216 < 4)
  {
LABEL_5:
    v5 = 4;
LABEL_6:
    v4 += v5;
    if ((uint64_t)(a3 - (_QWORD)v4) <= 1)
    {
LABEL_28:
      *a4 = v4;
      return 6;
    }
  }
  if (*v4)
  {
    v5 = 2;
    goto LABEL_6;
  }
  v5 = 2;
  switch(*(_BYTE *)(a1 + v4[1] + 136))
  {
    case 3:
      if (v4 != a2)
        goto LABEL_28;
      return big2_scanRef(a1, a2 + 2, a3, a4);
    case 4:
    case 5:
    case 8:
      goto LABEL_6;
    case 6:
      v5 = 3;
      goto LABEL_6;
    case 7:
      goto LABEL_5;
    case 9:
      if (v4 != a2)
        goto LABEL_28;
      v7 = a2 + 2;
      if ((uint64_t)(a3 - (_QWORD)(a2 + 2)) < 2)
      {
        result = 4294967293;
      }
      else
      {
        if (!*v7 && *(_BYTE *)(a1 + a2[3] + 136) == 10)
          v7 = a2 + 4;
LABEL_31:
        *a4 = v7;
        result = 7;
      }
      break;
    case 0xA:
      if (v4 != a2)
        goto LABEL_28;
      v7 = a2 + 2;
      goto LABEL_31;
    default:
      if (*(_BYTE *)(a1 + v4[1] + 136) != 30)
        goto LABEL_6;
      if (v4 != a2)
        goto LABEL_28;
      LODWORD(result) = big2_scanPercent(a1, a2 + 2, a3, a4);
      if ((_DWORD)result == 22)
        result = 0;
      else
        result = result;
      break;
  }
  return result;
}

BOOL big2_nameMatchesAscii(uint64_t a1, _BYTE *a2, _BYTE *a3, _BYTE *a4)
{
  int v4;
  unsigned __int8 *v5;
  uint64_t v6;
  BOOL v7;
  BOOL v8;
  int v9;

  v4 = *a4;
  if (!*a4)
    return a2 == a3;
  v5 = a4 + 1;
  v6 = a3 - a2;
  while (1)
  {
    v8 = __OFSUB__(v6, 2);
    v7 = v6 - 2 < 0;
    v6 -= 2;
    if (v7 != v8 || *a2 || a2[1] != v4)
      break;
    a2 += 2;
    v9 = *v5++;
    v4 = v9;
    if (!v9)
      return a2 == a3;
  }
  return 0;
}

uint64_t big2_nameLength(uint64_t a1, unsigned __int8 *a2)
{
  unsigned __int8 *i;
  unsigned int v3;
  uint64_t v4;
  unsigned int v5;

  for (i = a2; ; i += v4)
  {
    v3 = *i;
    if (v3 > 0xDB)
    {
      if (v3 == 255)
      {
        if (i[1] > 0xFDu)
          return ((_DWORD)i - (_DWORD)a2);
        v4 = 2;
      }
      else
      {
        v4 = 2;
        if (v3 - 220 < 4)
          return ((_DWORD)i - (_DWORD)a2);
      }
      continue;
    }
    if (v3 - 216 < 4)
    {
      v4 = 4;
      continue;
    }
    v4 = 2;
    if (!*i)
      break;
LABEL_5:
    ;
  }
  v5 = *(unsigned __int8 *)(a1 + i[1] + 136) - 5;
  if (v5 < 0x19 && ((0x17E0007u >> v5) & 1) != 0)
  {
    v4 = qword_21C61C038[(char)v5];
    goto LABEL_5;
  }
  return ((_DWORD)i - (_DWORD)a2);
}

_BYTE *big2_skipS(uint64_t a1, _BYTE *a2)
{
  unsigned int v2;
  BOOL v3;
  int v4;
  int v6;

  if (!*a2)
  {
    do
    {
      v2 = *(unsigned __int8 *)(a1 + a2[1] + 136);
      v3 = v2 > 0x15;
      v4 = (1 << v2) & 0x200600;
      if (v3 || v4 == 0)
        break;
      v6 = a2[2];
      a2 += 2;
    }
    while (!v6);
  }
  return a2;
}

uint64_t big2_getAtts(uint64_t a1, unsigned __int8 *a2, int a3, uint64_t a4)
{
  uint64_t result;
  int v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 *v9;
  unsigned __int8 *v10;
  unsigned int v11;
  BOOL v12;
  uint64_t v13;
  unsigned __int8 *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  int v20;
  unsigned int v21;
  int v22;
  uint64_t v23;

  result = 0;
  v6 = 0;
  v7 = 1;
  while (1)
  {
    while (1)
    {
      v8 = v7;
      v9 = a2;
      v10 = a2 + 2;
      v11 = a2[2];
      if (v11 > 0xDB)
        break;
      if (v11 - 216 >= 4)
      {
        if (a2[2])
          goto LABEL_16;
        v14 = a2 + 3;
        v13 = a2[3];
        a2 += 2;
        switch(*(_BYTE *)(a1 + v13 + 136))
        {
          case 3:
            a2 = v10;
            if ((int)result < a3)
            {
              *(_BYTE *)(a4 + 32 * (int)result + 24) = 0;
              a2 = v10;
            }
            continue;
          case 5:
          case 0x16:
          case 0x18:
          case 0x1D:
            goto LABEL_16;
          case 6:
            a2 = v9 + 3;
            if (!(_DWORD)v7)
            {
              v7 = 1;
              a2 = v9 + 3;
              if ((int)result < a3)
              {
                v17 = a4 + 32 * (int)result;
                *(_QWORD *)v17 = v10;
                *(_BYTE *)(v17 + 24) = 1;
                a2 = v14;
              }
            }
            continue;
          case 7:
            goto LABEL_4;
          case 9:
          case 0xA:
            v7 = 0;
            a2 = v10;
            if ((_DWORD)v8 == 1)
              continue;
            a2 = v10;
            v7 = v8;
            if ((_DWORD)v8 != 2)
              continue;
            a2 = v10;
            if ((int)result >= a3)
              continue;
            *(_BYTE *)(a4 + 32 * (int)result + 24) = 0;
            goto LABEL_66;
          case 0xB:
          case 0x11:
            v7 = 2;
            a2 = v10;
            if ((_DWORD)v8 == 2)
              continue;
            return result;
          case 0xC:
            if ((_DWORD)v7 == 2)
            {
              v7 = 2;
              a2 = v10;
              if (v6 == 12)
              {
                if ((int)result < a3)
                  *(_QWORD *)(a4 + 32 * (int)result + 16) = v10;
                v7 = 0;
                result = (result + 1);
                v6 = 12;
                a2 = v10;
              }
              continue;
            }
            v6 = 12;
            v7 = 2;
            a2 = v10;
            if ((int)result >= a3)
              continue;
            *(_QWORD *)(a4 + 32 * (int)result + 8) = v9 + 4;
            v6 = 12;
            goto LABEL_66;
          case 0xD:
            if ((_DWORD)v7 == 2)
            {
              v7 = 2;
              a2 = v10;
              if (v6 == 13)
              {
                if ((int)result < a3)
                  *(_QWORD *)(a4 + 32 * (int)result + 16) = v10;
                v7 = 0;
                result = (result + 1);
                v6 = 13;
                a2 = v10;
              }
              continue;
            }
            v6 = 13;
            v7 = 2;
            a2 = v10;
            if ((int)result >= a3)
              continue;
            *(_QWORD *)(a4 + 32 * (int)result + 8) = v9 + 4;
            v6 = 13;
            goto LABEL_66;
          case 0x15:
            v7 = 0;
            a2 = v10;
            if ((_DWORD)v8 == 1)
              continue;
            a2 = v10;
            v7 = v8;
            if ((_DWORD)v8 != 2)
              continue;
            a2 = v10;
            if ((int)result >= a3)
              continue;
            v18 = a4 + 32 * (int)result;
            v20 = *(unsigned __int8 *)(v18 + 24);
            v19 = (_BYTE *)(v18 + 24);
            v7 = 2;
            a2 = v10;
            if (!v20)
              continue;
            if (v10 == *(unsigned __int8 **)(a4 + 32 * (int)result + 8) || (_DWORD)v13 != 32)
              goto LABEL_65;
            v21 = v9[4];
            if (v21 > 0xDB)
            {
              if (v21 - 220 < 4)
              {
                v22 = 8;
                goto LABEL_64;
              }
              if (v21 == 255 && v9[5] > 0xFDu)
              {
                v22 = 0;
                goto LABEL_64;
              }
LABEL_63:
              v22 = 29;
              goto LABEL_64;
            }
            if (v21 - 216 < 4)
            {
              v22 = 7;
              goto LABEL_64;
            }
            if (v9[4])
              goto LABEL_63;
            v23 = v9[5];
            if (v23 == 32)
              goto LABEL_65;
            v22 = *(unsigned __int8 *)(a1 + v23 + 136);
LABEL_64:
            v7 = 2;
            a2 = v10;
            if (v22 != v6)
              continue;
LABEL_65:
            *v19 = 0;
LABEL_66:
            v7 = 2;
            a2 = v10;
            break;
          default:
            continue;
        }
      }
      else
      {
LABEL_4:
        if (!(_DWORD)v7)
        {
          v8 = 1;
          if ((int)result < a3)
          {
            v16 = a4 + 32 * (int)result;
            *(_QWORD *)v16 = v10;
            *(_BYTE *)(v16 + 24) = 1;
          }
        }
        a2 = v9 + 4;
        v7 = v8;
      }
    }
    a2 += 2;
    if (v11 - 220 >= 4)
    {
      if (v11 == 255)
      {
        v12 = v9[3] <= 0xFDu && (_DWORD)v7 == 0;
        a2 = v10;
        if (v12)
          goto LABEL_17;
      }
      else
      {
LABEL_16:
        a2 = v10;
        if (!(_DWORD)v7)
        {
LABEL_17:
          v7 = 1;
          a2 = v10;
          if ((int)result < a3)
          {
            v15 = a4 + 32 * (int)result;
            *(_QWORD *)v15 = v10;
            *(_BYTE *)(v15 + 24) = 1;
            a2 = v10;
          }
        }
      }
    }
  }
}

uint64_t big2_charRefNumber(uint64_t a1, _BYTE *a2)
{
  uint64_t v2;
  char *i;
  int v4;
  int v5;
  char *j;
  int v7;

  if (!a2[4] && a2[5] == 120)
  {
    v2 = 0;
    for (i = a2 + 7; ; i += 2)
    {
      if (!*(i - 1))
      {
        v4 = *i;
        if (v4 == 59)
          return checkCharRefNumber(v2);
        v5 = v4 - 48;
        if ((v4 - 48) <= 0x36)
        {
          if (((1 << v5) & 0x3FF) != 0)
          {
            v2 = v5 | (16 * v2);
          }
          else if (((1 << v5) & 0x7E0000) != 0)
          {
            v2 = (v4 + 16 * v2 - 55);
          }
          else
          {
            if (((1 << v5) & 0x7E000000000000) == 0)
              continue;
            v2 = (v4 + 16 * v2 - 87);
          }
          if ((int)v2 >= 1114112)
            return 0xFFFFFFFFLL;
        }
      }
    }
  }
  v2 = 0;
  for (j = a2 + 5; *(j - 1); j += 2)
  {
    v7 = -1;
LABEL_19:
    v2 = (v7 + 10 * v2 - 48);
    if ((int)v2 >= 1114112)
      return 0xFFFFFFFFLL;
  }
  v7 = *j;
  if (v7 != 59)
    goto LABEL_19;
  return checkCharRefNumber(v2);
}

uint64_t big2_predefinedEntityName(uint64_t a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  unsigned int v5;
  int v7;

  v3 = (a3 - (uint64_t)a2) / 2;
  if (v3 == 4)
  {
    if (!*a2)
    {
      v7 = (char)a2[1];
      if (v7 == 97)
      {
        if (!a2[2] && a2[3] == 112 && !a2[4] && a2[5] == 111 && !a2[6] && a2[7] == 115)
          return 39;
      }
      else if (v7 == 113 && !a2[2] && a2[3] == 117 && !a2[4] && a2[5] == 111 && !a2[6] && a2[7] == 116)
      {
        return 34;
      }
    }
    return 0;
  }
  if (v3 == 3)
  {
    if (!*a2 && a2[1] == 97 && !a2[2] && a2[3] == 109 && !a2[4] && a2[5] == 112)
      return 38;
    return 0;
  }
  if (v3 != 2 || a2[2] || a2[3] != 116 || *a2)
    return 0;
  v4 = a2[1];
  if (v4 == 103)
    v5 = 62;
  else
    v5 = 0;
  if (v4 == 108)
    return 60;
  else
    return v5;
}

uint64_t big2_updatePosition(uint64_t result, unsigned __int8 *a2, uint64_t a3, _QWORD *a4)
{
  unsigned __int8 *v4;

  if (a3 - (uint64_t)a2 >= 2)
  {
    do
    {
      if (*a2 - 216 >= 4)
      {
        if (!*a2)
        {
          switch(*(_BYTE *)(result + a2[1] + 136))
          {
            case 6:
              a2 += 3;
              goto LABEL_7;
            case 7:
              goto LABEL_3;
            case 9:
              ++*a4;
              v4 = a2 + 2;
              if (a3 - (uint64_t)(a2 + 2) >= 2 && !*v4 && *(_BYTE *)(result + a2[3] + 136) == 10)
                v4 = a2 + 4;
              a4[1] = 0;
              a2 = v4;
              break;
            case 0xA:
              ++*a4;
              a4[1] = 0;
              a2 += 2;
              break;
            default:
              goto LABEL_6;
          }
          continue;
        }
LABEL_6:
        a2 += 2;
      }
      else
      {
LABEL_3:
        a2 += 4;
      }
LABEL_7:
      ++a4[1];
    }
    while (a3 - (uint64_t)a2 > 1);
  }
  return result;
}

uint64_t big2_isPublicId(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t result;

  v4 = (_BYTE *)(a2 + 2);
  v5 = a3 - (a2 + 2) - 2;
  if (v5 >= 2)
  {
    do
    {
      if (*v4)
      {
LABEL_15:
        result = 0;
        *a4 = v4;
        return result;
      }
      v6 = v4[1];
      v7 = (char)v6;
      v8 = *(unsigned __int8 *)(a1 + v6 + 136);
      if (v8 <= 0x23)
      {
        if (((1 << v8) & 0xFCB8FE600) != 0)
          goto LABEL_5;
        if (((1 << v8) & 0x4400000) != 0)
        {
          if ((v7 & 0x80000000) == 0)
            goto LABEL_5;
        }
        else if (v8 == 21)
        {
          if (v7 == 9)
            goto LABEL_15;
          goto LABEL_5;
        }
      }
      if (v7 != 64 && v7 != 36)
        goto LABEL_15;
LABEL_5:
      v4 += 2;
      v5 -= 2;
    }
    while (v5 > 1);
  }
  return 1;
}

uint64_t big2_toUtf8(uint64_t a1, unsigned __int8 **a2, uint64_t a3, _BYTE **a4, _BYTE *a5)
{
  unsigned __int8 *v5;
  int64_t v6;
  unsigned __int8 *v7;
  unsigned int v8;
  int v9;
  unsigned int v10;
  _BYTE *v11;
  unint64_t v12;
  char v13;
  char v14;
  _BYTE *v15;
  _BYTE *v16;
  unsigned int v17;
  _BYTE *v18;
  unsigned __int8 v19;
  _BYTE *v20;
  _BYTE *v21;
  _BYTE *v22;
  uint64_t result;

  v5 = *a2;
  v6 = (a3 - (_QWORD)*a2) & 0xFFFFFFFFFFFFFFFELL;
  if (v6 >= 1)
  {
    v7 = &v5[v6];
    do
    {
      v8 = v5[1];
      v9 = (char)v8;
      v10 = *v5;
      if (v10 - 1 >= 7)
      {
        if (v10 - 216 < 4)
        {
          v16 = *a4;
          if (a5 - *a4 < 4)
            goto LABEL_21;
          if (v7 - v5 < 4)
          {
            result = 1;
            goto LABEL_23;
          }
          v17 = ((v8 >> 6) & 0xFFFFFFF3 | (4 * (v10 & 3))) + 1;
          *a4 = v16 + 1;
          *v16 = (v17 >> 2) | 0xF0;
          LOBYTE(v17) = (v8 >> 2) & 0xF | (16 * (v17 & 3)) | 0x80;
          v18 = (*a4)++;
          *v18 = v17;
          v19 = v5[2];
          v5 += 2;
          LOBYTE(v18) = v5[1];
          v20 = (*a4)++;
          *v20 = (v18 >> 6) & 0xC3 | (16 * (v9 & 3)) | (4 * (v19 & 3)) | 0x80;
          LOBYTE(v9) = v18 & 0x3F | 0x80;
          v21 = *a4;
          goto LABEL_11;
        }
        if (*v5)
        {
          v22 = *a4;
          if (a5 - *a4 < 3)
          {
LABEL_21:
            result = 2;
            goto LABEL_23;
          }
          *a4 = v22 + 1;
          *v22 = (v10 >> 4) | 0xE0;
          v13 = (4 * (v10 & 0xF)) | (v9 >> 6) | 0x80;
          v11 = *a4;
          goto LABEL_6;
        }
        if (((char)v8 & 0x80000000) == 0)
        {
          v21 = *a4;
          if (*a4 == a5)
            goto LABEL_21;
LABEL_11:
          *a4 = v21 + 1;
          *v21 = v9;
          goto LABEL_12;
        }
      }
      v11 = *a4;
      if (a5 - *a4 < 2)
        goto LABEL_21;
      HIDWORD(v12) = *v5;
      LODWORD(v12) = v9 << 24;
      v13 = (v12 >> 30) | 0xC0;
LABEL_6:
      *a4 = v11 + 1;
      *v11 = v13;
      v14 = v9 & 0x3F | 0x80;
      v15 = (*a4)++;
      *v15 = v14;
LABEL_12:
      v5 += 2;
    }
    while (v5 < v7);
  }
  result = 0;
LABEL_23:
  *a2 = v5;
  return result;
}

uint64_t big2_toUtf16(uint64_t a1, unsigned __int16 **a2, uint64_t a3, unint64_t *a4, unint64_t a5)
{
  unsigned __int16 *v5;
  int64_t v6;
  unsigned __int16 *v7;
  int v8;
  uint64_t result;
  _WORD *v10;

  v5 = *a2;
  v6 = (a3 - (_QWORD)*a2) & 0xFFFFFFFFFFFFFFFELL;
  v7 = (unsigned __int16 *)((char *)*a2 + v6);
  if (v6 <= (uint64_t)(a5 - *a4))
  {
    result = 0;
  }
  else
  {
    v8 = *(_BYTE *)(v7 - 1) & 0xF8;
    result = v8 == 216;
    if (v8 == 216)
      --v7;
  }
  while (v5 < v7)
  {
    v10 = (_WORD *)*a4;
    if (*a4 >= a5)
    {
      if (*a4 == a5)
        return 2;
      return result;
    }
    *v10 = bswap32(*v5) >> 16;
    *a4 = (unint64_t)(v10 + 1);
    v5 = *a2 + 1;
    *a2 = v5;
  }
  return result;
}

uint64_t big2_scanLit(int a1, uint64_t a2, unsigned __int8 *a3, uint64_t a4, unsigned __int8 **a5)
{
  unint64_t v5;
  unsigned int v6;
  unsigned __int8 *v7;
  uint64_t result;
  unsigned int v9;
  BOOL v10;
  int v11;

  v5 = a4 - (_QWORD)a3;
  if (a4 - (uint64_t)a3 < 2)
    return 0xFFFFFFFFLL;
  while (1)
  {
    v6 = *a3;
    if (v6 > 0xDB)
    {
      if (v6 == 255)
      {
        if (a3[1] > 0xFDu)
          goto LABEL_20;
      }
      else if (v6 - 220 < 4)
      {
LABEL_20:
        result = 0;
        *a5 = a3;
        return result;
      }
      goto LABEL_14;
    }
    if (v6 - 216 >= 4)
    {
      if (!*a3)
      {
        switch(*(_BYTE *)(a2 + a3[1] + 136))
        {
          case 0:
          case 1:
          case 8:
            goto LABEL_20;
          case 6:
            if (v5 < 3)
              return 4294967294;
            v7 = a3 + 3;
            goto LABEL_15;
          case 7:
            goto LABEL_4;
          case 0xC:
          case 0xD:
            v7 = a3 + 2;
            if (*(unsigned __int8 *)(a2 + a3[1] + 136) != a1)
              goto LABEL_15;
            if (a4 - (uint64_t)v7 < 2)
              return 4294967269;
            *a5 = v7;
            if (*v7)
              return 0;
            v9 = *(unsigned __int8 *)(a2 + a3[3] + 136);
            v10 = v9 > 0x1E;
            v11 = (1 << v9) & 0x40300E00;
            if (v10 || v11 == 0)
              return 0;
            else
              return 27;
          default:
            break;
        }
      }
LABEL_14:
      v7 = a3 + 2;
      goto LABEL_15;
    }
LABEL_4:
    if (v5 < 4)
      return 4294967294;
    v7 = a3 + 4;
LABEL_15:
    v5 = a4 - (_QWORD)v7;
    a3 = v7;
    if (a4 - (uint64_t)v7 <= 1)
      return 0xFFFFFFFFLL;
  }
}

uint64_t big2_scanDecl(uint64_t a1, _BYTE *a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  unsigned int v8;
  BOOL v9;
  int v10;

  if (a3 - (uint64_t)a2 < 2)
    return 0xFFFFFFFFLL;
  if (!*a2)
  {
    switch(*(_BYTE *)(a1 + a2[1] + 136))
    {
      case 0x14:
        *a4 = a2 + 2;
        return 33;
      case 0x16:
      case 0x18:
        v5 = a2 + 2;
        v6 = a3 - (_QWORD)(a2 + 2);
        if (v6 < 2)
          return 0xFFFFFFFFLL;
        while (2)
        {
          if (*v5)
          {
LABEL_20:
            v4 = 0;
            *a4 = v5;
          }
          else
          {
            switch(*(_BYTE *)(a1 + v5[1] + 136))
            {
              case 0x15:
                goto LABEL_13;
              case 0x16:
              case 0x18:
                v5 += 2;
                v6 -= 2;
                v4 = 0xFFFFFFFFLL;
                if (v6 > 1)
                  continue;
                return v4;
              case 0x17:
              case 0x19:
              case 0x1A:
              case 0x1B:
              case 0x1C:
              case 0x1D:
                goto LABEL_20;
              case 0x1E:
                if ((unint64_t)v6 < 4)
                  return 0xFFFFFFFFLL;
                if (!v5[2])
                {
                  v8 = *(unsigned __int8 *)(a1 + v5[3] + 136);
                  v9 = v8 > 0x1E;
                  v10 = (1 << v8) & 0x40200600;
                  if (!v9 && v10 != 0)
                    goto LABEL_20;
                }
                goto LABEL_13;
              default:
                if (*(unsigned __int8 *)(a1 + v5[1] + 136) - 9 >= 2)
                  goto LABEL_20;
LABEL_13:
                *a4 = v5;
                v4 = 16;
                break;
            }
          }
          return v4;
        }
      case 0x1B:
        return big2_scanComment(a1, a2 + 2, a3, a4);
      default:
        break;
    }
  }
  v4 = 0;
  *a4 = a2;
  return v4;
}

uint64_t big2_scanPi(uint64_t a1, unsigned __int8 *a2, uint64_t a3, uint64_t *a4)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  unsigned int v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned __int8 *v19;
  uint64_t v20;
  unint64_t v21;
  unsigned __int8 *v22;
  unsigned int v23;
  unsigned __int8 *v24;
  uint64_t v25;
  unsigned __int8 *v26;
  unsigned int v27;

  v4 = a3 - (_QWORD)a2;
  v5 = a3 - (_QWORD)a2 - 2;
  if (a3 - (uint64_t)a2 < 2)
    return 0xFFFFFFFFLL;
  v10 = *a2;
  if (*a2 > 0xDBu)
  {
    if ((v10 - 220) < 4)
      goto LABEL_7;
    if ((_DWORD)v10 == 255)
    {
      LODWORD(v12) = a2[1];
      if (v12 > 0xFD)
        goto LABEL_7;
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  if ((v10 - 216) < 4)
    goto LABEL_4;
  if (*a2)
  {
LABEL_17:
    LODWORD(v12) = a2[1];
    goto LABEL_18;
  }
  v12 = a2[1];
  v13 = *(unsigned __int8 *)(a1 + v12 + 136);
  if (v13 <= 0x15)
  {
    if (v13 == 5)
      goto LABEL_7;
    if (v13 == 6)
    {
      if (v4 < 3)
        return 4294967294;
      goto LABEL_7;
    }
    if (v13 != 7)
      goto LABEL_7;
LABEL_4:
    if (v4 < 4)
      return 4294967294;
LABEL_7:
    result = 0;
    *a4 = (uint64_t)a2;
    return result;
  }
  if (v13 != 22 && v13 != 24)
  {
    if (v13 != 29)
      goto LABEL_7;
LABEL_18:
    if (((namingBitmap[(v12 >> 5) | (8 * nmstrtPages[v10])] >> v12) & 1) == 0)
      goto LABEL_7;
  }
  if (v5 < 2)
    return 0xFFFFFFFFLL;
  v15 = 0;
  v27 = 0;
  result = 0xFFFFFFFFLL;
  while (1)
  {
    v16 = a2[v15 + 2];
    if (a2[v15 + 2] <= 0xDBu)
    {
      if (!a2[v15 + 2])
      {
        v17 = a2[v15 + 3];
        switch(*(_BYTE *)(a1 + v17 + 136))
        {
          case 5:
            goto LABEL_45;
          case 6:
            if ((unint64_t)v5 >= 3)
              goto LABEL_45;
            return 4294967294;
          case 7:
            goto LABEL_44;
          case 9:
          case 0xA:
          case 0x15:
            v19 = &a2[v15];
            v20 = (uint64_t)&a2[v15 + 2];
            result = big2_checkPiTarget(a2, v20, &v27);
            if (!(_DWORD)result)
            {
              *a4 = v20;
              return result;
            }
            v21 = v5 - 2;
            if (v5 - 2 < 2)
              return 0xFFFFFFFFLL;
            v22 = v19 + 4;
            result = 0xFFFFFFFFLL;
            while (2)
            {
              v23 = *v22;
              if (v23 <= 0xDB)
              {
                if (v23 - 216 < 4)
                {
LABEL_54:
                  if (v21 < 4)
                    return 4294967294;
                  v24 = v22 + 4;
LABEL_65:
                  v21 = a3 - (_QWORD)v24;
                  v22 = v24;
                  if (a3 - (uint64_t)v24 <= 1)
                    return result;
                  continue;
                }
                if (!*v22)
                {
                  switch(*(_BYTE *)(a1 + v22[1] + 136))
                  {
                    case 0:
                    case 1:
                    case 8:
                      goto LABEL_83;
                    case 6:
                      if (v21 < 3)
                        return 4294967294;
                      v24 = v22 + 3;
                      goto LABEL_65;
                    case 7:
                      goto LABEL_54;
                    case 0xF:
                      v24 = v22 + 2;
                      if (a3 - (uint64_t)(v22 + 2) < 2)
                        return 0xFFFFFFFFLL;
                      if (*v24 || v22[3] != 62)
                        goto LABEL_65;
                      v25 = (uint64_t)(v22 + 4);
                      break;
                    default:
                      goto LABEL_64;
                  }
LABEL_79:
                  *a4 = v25;
                  return v27;
                }
LABEL_64:
                v24 = v22 + 2;
                goto LABEL_65;
              }
              break;
            }
            if (v23 == 255)
            {
              if (v22[1] <= 0xFDu)
                goto LABEL_64;
            }
            else if (v23 - 220 >= 4)
            {
              goto LABEL_64;
            }
LABEL_83:
            result = 0;
            *a4 = (uint64_t)v22;
            return result;
          case 0xF:
            v26 = &a2[v15];
            result = big2_checkPiTarget(a2, (uint64_t)&a2[v15 + 2], &v27);
            if (!(_DWORD)result)
            {
              *a4 = (uint64_t)&a2[v15 + 2];
              return result;
            }
            if (v5 - 2 < 2)
              return 0xFFFFFFFFLL;
            v18 = (uint64_t)(v26 + 4);
            if (!v26[4] && a2[v15 + 5] == 62)
            {
              v25 = (uint64_t)&a2[v15 + 6];
              goto LABEL_79;
            }
            goto LABEL_41;
          case 0x16:
          case 0x18:
          case 0x19:
          case 0x1A:
          case 0x1B:
            goto LABEL_38;
          case 0x1D:
            goto LABEL_37;
          default:
            goto LABEL_40;
        }
      }
      if ((v16 - 216) < 4)
      {
LABEL_44:
        if ((unint64_t)v5 >= 4)
        {
LABEL_45:
          result = 0;
          v18 = (uint64_t)&a2[v15 + 2];
          goto LABEL_46;
        }
        return 4294967294;
      }
      goto LABEL_36;
    }
    if ((_DWORD)v16 == 255)
    {
      LODWORD(v17) = a2[v15 + 3];
      if (v17 > 0xFD)
        break;
      goto LABEL_37;
    }
    if ((v16 - 220) < 4)
      break;
LABEL_36:
    LODWORD(v17) = a2[v15 + 3];
LABEL_37:
    if (((namingBitmap[(v17 >> 5) | (8 * namePages[v16])] >> v17) & 1) == 0)
      goto LABEL_45;
LABEL_38:
    v5 -= 2;
    v15 += 2;
    if (v5 <= 1)
      return result;
  }
LABEL_40:
  v18 = (uint64_t)&a2[v15 + 2];
LABEL_41:
  result = 0;
LABEL_46:
  *a4 = v18;
  return result;
}

uint64_t big2_scanPercent(uint64_t a1, unsigned __int8 *a2, uint64_t a3, _QWORD *a4)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;

  v4 = a3 - (_QWORD)a2;
  v5 = a3 - (_QWORD)a2 - 2;
  if (a3 - (uint64_t)a2 < 2)
    return 0xFFFFFFFFLL;
  v6 = *a2;
  if (*a2 > 0xDBu)
  {
    if ((v6 - 220) < 4 || (_DWORD)v6 == 255 && a2[1] > 0xFDu)
      goto LABEL_7;
  }
  else
  {
    if ((v6 - 216) < 4)
      goto LABEL_4;
    if (!*a2)
    {
      v7 = 0;
      v8 = *(unsigned __int8 *)(a1 + a2[1] + 136);
      if (v8 > 0x14)
      {
        switch(*(_BYTE *)(a1 + a2[1] + 136))
        {
          case 0x15:
          case 0x1E:
            goto LABEL_36;
          case 0x16:
          case 0x18:
            goto LABEL_15;
          case 0x1D:
            goto LABEL_14;
          default:
            goto LABEL_8;
        }
      }
      if (v8 - 9 < 2)
      {
LABEL_36:
        v7 = 22;
        goto LABEL_8;
      }
      if (v8 == 6)
      {
        if (v4 < 3)
          return 4294967294;
        goto LABEL_7;
      }
      if (v8 != 7)
        goto LABEL_8;
LABEL_4:
      if (v4 < 4)
        return 4294967294;
LABEL_7:
      v7 = 0;
      goto LABEL_8;
    }
  }
LABEL_14:
  if (((namingBitmap[(a2[1] >> 5) | (8 * nmstrtPages[v6])] >> a2[1]) & 1) == 0)
    goto LABEL_7;
LABEL_15:
  if (v5 < 2)
    return 0xFFFFFFFFLL;
  for (a2 += 4; ; a2 += 2)
  {
    v9 = *(a2 - 2);
    if (*(a2 - 2) <= 0xDBu)
      break;
    if ((_DWORD)v9 != 255)
    {
      if ((v9 - 220) < 4)
        goto LABEL_42;
LABEL_26:
      LODWORD(v10) = *(a2 - 1);
      goto LABEL_27;
    }
    LODWORD(v10) = *(a2 - 1);
    if (v10 > 0xFD)
      goto LABEL_42;
LABEL_27:
    if (((namingBitmap[(v10 >> 5) | (8 * namePages[v9])] >> v10) & 1) == 0)
      goto LABEL_42;
LABEL_28:
    v5 -= 2;
    v7 = 0xFFFFFFFFLL;
    if (v5 <= 1)
      return v7;
  }
  if (!*(a2 - 2))
  {
    v10 = *(a2 - 1);
    v11 = *(unsigned __int8 *)(a1 + v10 + 136);
    switch(*(_BYTE *)(a1 + v10 + 136))
    {
      case 0x12:
        v7 = 28;
        goto LABEL_8;
      case 0x13:
      case 0x14:
      case 0x15:
      case 0x17:
      case 0x1C:
        goto LABEL_42;
      case 0x16:
      case 0x18:
      case 0x19:
      case 0x1A:
      case 0x1B:
        goto LABEL_28;
      case 0x1D:
        goto LABEL_27;
      default:
        if (v11 != 6)
        {
          if (v11 != 7)
            goto LABEL_42;
          goto LABEL_41;
        }
        if ((unint64_t)v5 < 3)
          return 4294967294;
        break;
    }
    goto LABEL_42;
  }
  if ((v9 - 216) >= 4)
    goto LABEL_26;
LABEL_41:
  if ((unint64_t)v5 < 4)
    return 4294967294;
LABEL_42:
  v7 = 0;
  a2 -= 2;
LABEL_8:
  *a4 = a2;
  return v7;
}

uint64_t big2_scanPoundName(uint64_t a1, unsigned __int8 *a2, uint64_t a3, _QWORD *a4)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3 - (_QWORD)a2;
  if (a3 - (uint64_t)a2 < 2)
    return 0xFFFFFFFFLL;
  v5 = *a2;
  if (*a2 > 0xDBu)
  {
    if ((v5 - 220) >= 4 && ((_DWORD)v5 != 255 || a2[1] <= 0xFDu))
      goto LABEL_21;
    goto LABEL_8;
  }
  if ((v5 - 216) < 4)
    goto LABEL_4;
  if (*a2)
    goto LABEL_21;
  v6 = 0;
  v8 = *(unsigned __int8 *)(a1 + a2[1] + 136);
  if (v8 <= 0x15)
  {
    if (v8 != 6)
    {
      if (v8 == 7)
      {
LABEL_4:
        if (v4 >= 4)
          goto LABEL_8;
        return 4294967294;
      }
LABEL_9:
      *a4 = a2;
      return v6;
    }
    if (v4 < 3)
      return 4294967294;
LABEL_8:
    v6 = 0;
    goto LABEL_9;
  }
  if (v8 == 22 || v8 == 24)
    goto LABEL_22;
  if (v8 != 29)
    goto LABEL_9;
LABEL_21:
  if (((namingBitmap[(a2[1] >> 5) | (8 * nmstrtPages[v5])] >> a2[1]) & 1) == 0)
    goto LABEL_8;
LABEL_22:
  a2 += 2;
  v10 = a3 - (_QWORD)a2;
  if (a3 - (uint64_t)a2 < 2)
    return 4294967276;
  while (1)
  {
    v11 = *a2;
    if (*a2 <= 0xDBu)
      break;
    if ((_DWORD)v11 == 255)
    {
      LODWORD(v12) = a2[1];
      if (v12 > 0xFD)
        goto LABEL_8;
      goto LABEL_33;
    }
    if ((v11 - 220) < 4)
      goto LABEL_8;
LABEL_32:
    LODWORD(v12) = a2[1];
LABEL_33:
    if (((namingBitmap[(v12 >> 5) | (8 * namePages[v11])] >> v12) & 1) == 0)
      goto LABEL_8;
LABEL_34:
    a2 += 2;
    v10 -= 2;
    v6 = 4294967276;
    if (v10 <= 1)
      return v6;
  }
  if (!*a2)
  {
    v6 = 0;
    v12 = a2[1];
    switch(*(_BYTE *)(a1 + v12 + 136))
    {
      case 6:
        if ((unint64_t)v10 >= 3)
          goto LABEL_8;
        return 4294967294;
      case 7:
        goto LABEL_40;
      case 9:
      case 0xA:
      case 0xB:
      case 0x15:
      case 0x1E:
      case 0x20:
      case 0x24:
        v6 = 20;
        goto LABEL_9;
      case 0x16:
      case 0x18:
      case 0x19:
      case 0x1A:
      case 0x1B:
        goto LABEL_34;
      case 0x1D:
        goto LABEL_33;
      default:
        goto LABEL_9;
    }
  }
  if ((v11 - 216) >= 4)
    goto LABEL_32;
LABEL_40:
  if ((unint64_t)v10 >= 4)
    goto LABEL_8;
  return 4294967294;
}

uint64_t big2_scanComment(uint64_t a1, unsigned __int8 *a2, uint64_t a3, _QWORD *a4)
{
  unint64_t v4;
  unsigned int v5;
  unsigned __int8 *v6;
  uint64_t v7;
  int v9;

  if (a3 - (uint64_t)a2 < 2)
    return 0xFFFFFFFFLL;
  if (*a2 || a2[1] != 45)
  {
LABEL_26:
    v7 = 0;
    goto LABEL_27;
  }
  a2 += 2;
  v4 = a3 - (_QWORD)a2;
  if (a3 - (uint64_t)a2 < 2)
    return 0xFFFFFFFFLL;
  while (1)
  {
    v5 = *a2;
    if (v5 > 0xDB)
    {
      if (v5 == 255)
      {
        if (a2[1] > 0xFDu)
          goto LABEL_26;
      }
      else if (v5 - 220 < 4)
      {
        goto LABEL_26;
      }
      goto LABEL_23;
    }
    if (v5 - 216 >= 4)
      break;
LABEL_7:
    if (v4 < 4)
      return 4294967294;
    v6 = a2 + 4;
LABEL_24:
    v4 = a3 - (_QWORD)v6;
    v7 = 0xFFFFFFFFLL;
    a2 = v6;
    if (a3 - (uint64_t)v6 <= 1)
      return v7;
  }
  if (*a2)
  {
LABEL_23:
    v6 = a2 + 2;
    goto LABEL_24;
  }
  v7 = 0;
  switch(*(_BYTE *)(a1 + a2[1] + 136))
  {
    case 0:
    case 1:
    case 8:
      break;
    case 2:
    case 3:
    case 4:
    case 5:
      goto LABEL_23;
    case 6:
      if (v4 < 3)
        return 4294967294;
      v6 = a2 + 3;
      goto LABEL_24;
    case 7:
      goto LABEL_7;
    default:
      if (*(_BYTE *)(a1 + a2[1] + 136) != 27)
        goto LABEL_23;
      v6 = a2 + 2;
      if (a3 - (uint64_t)(a2 + 2) < 2)
        return 0xFFFFFFFFLL;
      if (*v6 || a2[3] != 45)
        goto LABEL_24;
      if (a3 - (uint64_t)(a2 + 4) < 2)
        return 0xFFFFFFFFLL;
      if (a2[4])
      {
        v7 = 0;
        a2 += 4;
      }
      else
      {
        v9 = a2[5];
        if (v9 == 62)
          a2 += 6;
        else
          a2 += 4;
        if (v9 == 62)
          v7 = 13;
        else
          v7 = 0;
      }
      break;
  }
LABEL_27:
  *a4 = a2;
  return v7;
}

BOOL big2_checkPiTarget(_BYTE *a1, uint64_t a2, _DWORD *a3)
{
  int v4;
  int v5;
  int v6;
  int v7;

  *a3 = 11;
  if (a2 - (_QWORD)a1 != 6 || *a1)
    return 1;
  v4 = (char)a1[1];
  if (v4 == 120)
  {
    v5 = 0;
  }
  else
  {
    if (v4 != 88)
      return 1;
    v5 = 1;
  }
  if (a1[2])
    return 1;
  v6 = (char)a1[3];
  if (v6 != 109)
  {
    if (v6 != 77)
      return 1;
    v5 = 1;
  }
  if (a1[4])
    return 1;
  v7 = (char)a1[5];
  if (v7 == 108)
  {
    if (v5)
      return 0;
    *a3 = 12;
    return 1;
  }
  return v7 != 76;
}

uint64_t big2_scanRef(uint64_t a1, unsigned __int8 *a2, uint64_t a3, _QWORD *a4)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  unsigned __int8 *v9;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  BOOL v18;
  int v19;

  v4 = a3 - (_QWORD)a2;
  v5 = a3 - (_QWORD)a2 - 2;
  if (a3 - (uint64_t)a2 < 2)
    return 0xFFFFFFFFLL;
  v6 = *a2;
  if (*a2 > 0xDBu)
  {
    if ((v6 - 220) < 4 || (_DWORD)v6 == 255 && a2[1] > 0xFDu)
      goto LABEL_7;
  }
  else
  {
    if ((v6 - 216) < 4)
      goto LABEL_4;
    if (!*a2)
    {
      v7 = 0;
      v8 = *(unsigned __int8 *)(a1 + a2[1] + 136);
      if (v8 <= 0x15)
      {
        if (v8 == 6)
        {
          if (v4 < 3)
            return 4294967294;
          goto LABEL_7;
        }
        if (v8 == 7)
        {
LABEL_4:
          if (v4 < 4)
            return 4294967294;
LABEL_7:
          v7 = 0;
          goto LABEL_8;
        }
        if (v8 != 19)
          goto LABEL_8;
        v9 = a2 + 2;
        if (a3 - (uint64_t)(a2 + 2) >= 2)
        {
          if (*v9)
            goto LABEL_16;
          v14 = a2[3];
          if (v14 == 120)
          {
            v9 = a2 + 4;
            if (a3 - (uint64_t)(a2 + 4) < 2)
              return 0xFFFFFFFFLL;
            if (!*v9 && (*(_BYTE *)(a1 + a2[5] + 136) & 0xFE) == 0x18)
            {
              a2 += 6;
              v15 = a3 - (_QWORD)a2;
              if (a3 - (uint64_t)a2 >= 2)
              {
                while (!*a2)
                {
                  v16 = *(unsigned __int8 *)(a1 + a2[1] + 136);
                  if ((v16 - 24) >= 2)
                  {
                    if (v16 != 18)
                      goto LABEL_7;
                    a2 += 2;
                    v7 = 10;
                    goto LABEL_8;
                  }
                  a2 += 2;
                  v15 -= 2;
                  v7 = 0xFFFFFFFFLL;
                  if (v15 <= 1)
                    return v7;
                }
                goto LABEL_7;
              }
              return 0xFFFFFFFFLL;
            }
          }
          else if (*(_BYTE *)(a1 + v14 + 136) == 25)
          {
            v9 = a2 + 4;
            v17 = v4 - 4;
            while (1)
            {
              v18 = v17 < 2;
              v17 -= 2;
              if (v18)
                return 0xFFFFFFFFLL;
              a2 = v9;
              if (*v9)
                goto LABEL_7;
              v19 = *(unsigned __int8 *)(a1 + v9[1] + 136);
              v9 += 2;
              if (v19 != 25)
              {
                if (v19 != 18)
                  goto LABEL_7;
                v7 = 10;
                goto LABEL_17;
              }
            }
          }
LABEL_16:
          v7 = 0;
LABEL_17:
          a2 = v9;
          goto LABEL_8;
        }
        return 0xFFFFFFFFLL;
      }
      if (v8 == 22 || v8 == 24)
        goto LABEL_27;
      if (v8 != 29)
        goto LABEL_8;
    }
  }
  if (((namingBitmap[(a2[1] >> 5) | (8 * nmstrtPages[v6])] >> a2[1]) & 1) == 0)
    goto LABEL_7;
LABEL_27:
  if (v5 < 2)
    return 0xFFFFFFFFLL;
  for (a2 += 4; ; a2 += 2)
  {
    v11 = *(a2 - 2);
    if (*(a2 - 2) <= 0xDBu)
      break;
    if ((_DWORD)v11 != 255)
    {
      if ((v11 - 220) < 4)
        goto LABEL_56;
LABEL_38:
      LODWORD(v12) = *(a2 - 1);
      goto LABEL_39;
    }
    LODWORD(v12) = *(a2 - 1);
    if (v12 > 0xFD)
      goto LABEL_56;
LABEL_39:
    if (((namingBitmap[(v12 >> 5) | (8 * namePages[v11])] >> v12) & 1) == 0)
      goto LABEL_56;
LABEL_40:
    v5 -= 2;
    v7 = 0xFFFFFFFFLL;
    if (v5 <= 1)
      return v7;
  }
  if (!*(a2 - 2))
  {
    v12 = *(a2 - 1);
    v13 = *(unsigned __int8 *)(a1 + v12 + 136);
    switch(*(_BYTE *)(a1 + v12 + 136))
    {
      case 0x12:
        v7 = 9;
        goto LABEL_8;
      case 0x13:
      case 0x14:
      case 0x15:
      case 0x17:
      case 0x1C:
        goto LABEL_56;
      case 0x16:
      case 0x18:
      case 0x19:
      case 0x1A:
      case 0x1B:
        goto LABEL_40;
      case 0x1D:
        goto LABEL_39;
      default:
        if (v13 != 6)
        {
          if (v13 != 7)
            goto LABEL_56;
          goto LABEL_55;
        }
        if ((unint64_t)v5 < 3)
          return 4294967294;
        break;
    }
    goto LABEL_56;
  }
  if ((v11 - 216) >= 4)
    goto LABEL_38;
LABEL_55:
  if ((unint64_t)v5 < 4)
    return 4294967294;
LABEL_56:
  v7 = 0;
  a2 -= 2;
LABEL_8:
  *a4 = a2;
  return v7;
}

uint64_t big2_scanAtts(uint64_t a1, unsigned __int8 *a2, uint64_t a3, unsigned __int8 **a4)
{
  unint64_t v4;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  int v13;
  unsigned __int8 *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t i;
  unsigned int v21;
  unsigned int v24;
  int v25;
  unsigned __int8 **v26;
  unsigned int v27;
  unsigned __int8 *v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int v31;
  int v32;
  unsigned __int8 *v33;

  v33 = a2;
  v4 = a3 - (_QWORD)a2;
  if (a3 - (uint64_t)a2 < 2)
    return 0xFFFFFFFFLL;
  v7 = 0;
  v8 = a3 - 4;
  while (1)
  {
    v9 = *a2;
    if (*a2 <= 0xDBu)
      break;
    if ((_DWORD)v9 == 255)
    {
      LODWORD(v11) = a2[1];
      if (v11 > 0xFD)
        goto LABEL_108;
      goto LABEL_22;
    }
    if ((v9 - 220) < 4)
      goto LABEL_108;
LABEL_21:
    LODWORD(v11) = a2[1];
LABEL_22:
    if (((namingBitmap[(v11 >> 5) | (8 * namePages[v9])] >> v11) & 1) == 0)
      goto LABEL_108;
LABEL_23:
    a2 += 2;
LABEL_24:
    v33 = a2;
LABEL_25:
    v4 = a3 - (_QWORD)a2;
    if (a3 - (uint64_t)a2 <= 1)
      return 0xFFFFFFFFLL;
  }
  if (*a2)
  {
    if ((v9 - 216) < 4)
    {
LABEL_103:
      if (v4 >= 4)
      {
LABEL_108:
        result = 0;
        goto LABEL_109;
      }
      return 4294967294;
    }
    goto LABEL_21;
  }
  result = 0;
  v11 = a2[1];
  switch(*(_BYTE *)(a1 + v11 + 136))
  {
    case 6:
      if (v4 >= 3)
        goto LABEL_108;
      return 4294967294;
    case 7:
      goto LABEL_103;
    case 9:
    case 0xA:
    case 0x15:
      a2 += 2;
      v12 = a3 - (_QWORD)a2;
      if (a3 - (uint64_t)a2 < 2)
        return 0xFFFFFFFFLL;
      while (2)
      {
        if (*a2)
          goto LABEL_108;
        v13 = *(unsigned __int8 *)(a1 + a2[1] + 136);
        if ((v13 - 9) < 2 || v13 == 21)
        {
          a2 += 2;
          v12 -= 2;
          if (v12 <= 1)
            return 0xFFFFFFFFLL;
          continue;
        }
        break;
      }
      if (v13 != 14)
        goto LABEL_108;
      v33 = a2;
LABEL_37:
      v15 = a2 + 2;
      if (a3 - (uint64_t)(a2 + 2) < 2)
        return 0xFFFFFFFFLL;
      for (i = v8 - (_QWORD)a2; ; i -= 2)
      {
        if (*v15)
          goto LABEL_115;
        v21 = *(unsigned __int8 *)(a1 + v15[1] + 136);
        if ((v21 & 0xFE) == 0xC)
          break;
        if (v21 > 0x15 || ((1 << v21) & 0x200600) == 0)
          goto LABEL_115;
        v15 += 2;
        result = 0xFFFFFFFFLL;
        if (i <= 1)
          return result;
      }
      v15 += 2;
      v33 = v15;
      if (i < 2)
        return 0xFFFFFFFFLL;
      while (2)
      {
        v24 = *v15;
        if (v24 > 0xDB)
        {
          if (v24 - 220 < 4)
          {
            v25 = 8;
            goto LABEL_63;
          }
          if (v24 == 255 && v15[1] > 0xFDu)
          {
            v25 = 0;
            goto LABEL_63;
          }
        }
        else
        {
          if (v24 - 216 < 4)
          {
            v25 = 7;
            goto LABEL_63;
          }
          if (!*v15)
          {
            v25 = *(unsigned __int8 *)(a1 + v15[1] + 136);
            goto LABEL_63;
          }
        }
        v25 = 29;
LABEL_63:
        if (v25 == v21)
        {
          a2 = v15 + 2;
          v33 = v15 + 2;
          if (a3 - (uint64_t)(v15 + 2) < 2)
            return 0xFFFFFFFFLL;
          if (*a2)
            goto LABEL_108;
          result = 0;
          v27 = *(unsigned __int8 *)(a1 + v15[3] + 136);
          if (v27 <= 0xA)
          {
            if (v27 - 9 >= 2)
              goto LABEL_109;
            goto LABEL_89;
          }
          if (v27 == 21)
          {
LABEL_89:
            v28 = v15 + 4;
            v29 = a3 - (_QWORD)(v15 + 4);
            if (v29 < 2)
              return 0xFFFFFFFFLL;
            a2 = v15 + 6;
            while (2)
            {
              v30 = *(a2 - 2);
              if (!*(a2 - 2))
              {
                switch(*(_BYTE *)(a1 + *(a2 - 1) + 136))
                {
                  case 6:
                    if ((unint64_t)v29 >= 3)
                      goto LABEL_106;
                    return 4294967294;
                  case 7:
                    goto LABEL_105;
                  case 9:
                  case 0xA:
                  case 0x15:
                    v28 += 2;
                    v29 -= 2;
                    a2 += 2;
                    result = 0xFFFFFFFFLL;
                    if (v29 <= 1)
                      return result;
                    continue;
                  case 0xB:
                    a2 -= 2;
                    goto LABEL_124;
                  case 0x11:
                    a2 -= 2;
                    goto LABEL_126;
                  case 0x16:
                  case 0x18:
                    goto LABEL_102;
                  case 0x1D:
                    goto LABEL_100;
                  default:
                    goto LABEL_106;
                }
              }
              break;
            }
            if ((v30 - 216) < 4)
            {
LABEL_105:
              if ((unint64_t)v29 >= 4)
              {
LABEL_106:
                result = 0;
                a2 -= 2;
                goto LABEL_109;
              }
              return 4294967294;
            }
            if ((v30 - 220) < 4)
              goto LABEL_106;
            if ((_DWORD)v30 == 255)
            {
              v33 = a2 - 2;
              v31 = *(a2 - 1);
              if (v31 >= 0xFE)
              {
                result = 0;
                a2 -= 2;
                goto LABEL_109;
              }
            }
            else
            {
LABEL_100:
              v33 = a2 - 2;
              v31 = *(a2 - 1);
            }
            if (((namingBitmap[(v31 >> 5) | (8 * nmstrtPages[v30])] >> v31) & 1) == 0)
            {
              result = 0;
              a2 = v28;
              goto LABEL_109;
            }
LABEL_102:
            v7 = 0;
            goto LABEL_24;
          }
          if (v27 == 11)
          {
LABEL_124:
            a2 += 2;
            result = 1;
            goto LABEL_109;
          }
          if (v27 != 17)
            goto LABEL_109;
LABEL_126:
          v15 = a2 + 2;
          v33 = a2 + 2;
          if (a3 - (uint64_t)(a2 + 2) >= 2)
          {
            if (!*v15)
            {
              v32 = a2[3];
              if (v32 == 62)
                a2 += 4;
              else
                a2 += 2;
              if (v32 == 62)
                result = 3;
              else
                result = 0;
              goto LABEL_109;
            }
LABEL_115:
            result = 0;
            a2 = v15;
LABEL_109:
            *a4 = a2;
            return result;
          }
          return 0xFFFFFFFFLL;
        }
        switch(v25)
        {
          case 0:
          case 1:
          case 2:
          case 8:
            goto LABEL_115;
          case 3:
            v26 = a4;
            result = big2_scanRef(a1, v15 + 2, a3, &v33);
            if ((int)result >= 1)
            {
              v15 = v33;
              a4 = v26;
LABEL_73:
              i = a3 - (_QWORD)v15;
              result = 0xFFFFFFFFLL;
              if (a3 - (uint64_t)v15 <= 1)
                return result;
              continue;
            }
            if (!(_DWORD)result)
            {
              a4 = v26;
              a2 = v33;
              goto LABEL_109;
            }
            return result;
          case 6:
            if ((unint64_t)i < 3)
              return 4294967294;
            v15 += 3;
            goto LABEL_72;
          case 7:
            if ((unint64_t)i < 4)
              return 4294967294;
            v15 += 4;
            goto LABEL_72;
          default:
            v15 += 2;
LABEL_72:
            v33 = v15;
            goto LABEL_73;
        }
      }
    case 0xE:
      goto LABEL_37;
    case 0x16:
    case 0x18:
    case 0x19:
    case 0x1A:
    case 0x1B:
      goto LABEL_23;
    case 0x17:
      if (v7)
        goto LABEL_108;
      v15 = a2 + 2;
      v33 = a2 + 2;
      v16 = a3 - (_QWORD)(a2 + 2);
      if (v16 < 2)
        return 0xFFFFFFFFLL;
      v17 = *v15;
      if (*v15 > 0xDBu)
      {
        if ((_DWORD)v17 == 255)
        {
          LODWORD(v18) = a2[3];
          if (v18 > 0xFD)
            goto LABEL_115;
LABEL_79:
          if (((namingBitmap[(v18 >> 5) | (8 * nmstrtPages[v17])] >> v18) & 1) == 0)
            goto LABEL_115;
          goto LABEL_80;
        }
        if ((v17 - 220) < 4)
          goto LABEL_115;
      }
      else
      {
        if (!*v15)
        {
          v18 = a2[3];
          v19 = *(unsigned __int8 *)(a1 + v18 + 136);
          if (v19 <= 0x17)
          {
            if (v19 != 22)
            {
              if (v19 == 6)
              {
                if ((unint64_t)v16 < 3)
                  return 4294967294;
              }
              else if (v19 == 7)
              {
LABEL_114:
                if ((unint64_t)v16 < 4)
                  return 4294967294;
              }
              goto LABEL_115;
            }
          }
          else if (v19 != 24)
          {
            if (v19 != 29)
              goto LABEL_115;
            goto LABEL_79;
          }
LABEL_80:
          a2 += 4;
          v33 = a2;
          v7 = 1;
          goto LABEL_25;
        }
        if ((v17 - 216) < 4)
          goto LABEL_114;
      }
      LODWORD(v18) = a2[3];
      goto LABEL_79;
    case 0x1D:
      goto LABEL_22;
    default:
      goto LABEL_109;
  }
}

uint64_t parsePseudoAttribute(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t a5, uint64_t a6, _QWORD *a7)
{
  uint64_t result;
  uint64_t v10;

  if (a2 == a3)
  {
    *a4 = 0;
    return 1;
  }
  else
  {
    v10 = a2;
    (*(void (**)(uint64_t, uint64_t *))(a1 + 112))(a1, &v10);
    result = 0;
    *a7 = a2;
  }
  return result;
}

void XML_Parse_cold_1()
{
  __assert_rtn("XML_Parse", "xmlparse.c", 2028, "s != NULL");
}

void XML_GetParsingStatus_cold_1()
{
  __assert_rtn("XML_GetParsingStatus", "xmlparse.c", 2299, "status != NULL");
}

void doProlog_cold_1()
{
  __assert_rtn("doProlog", "xmlparse.c", 5440, "dtd->scaffIndex != NULL");
}

void accountingDiffTolerated_cold_1()
{
  __assert_rtn("accountingReportDiff", "xmlparse.c", 7831, "! rootParser->m_parentParser");
}

void accountingGetCurrentAmplification_cold_1()
{
  __assert_rtn("accountingGetCurrentAmplification", "xmlparse.c", 7798, "! rootParser->m_parentParser");
}

void entityTrackingReportStats_cold_1()
{
  __assert_rtn("entityTrackingReportStats", "xmlparse.c", 7935, "! rootParser->m_parentParser");
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
  MEMORY[0x24BDAD160](__buf, __nbytes);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x24BDAE440](a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x24BDAE5F0](a1);
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

