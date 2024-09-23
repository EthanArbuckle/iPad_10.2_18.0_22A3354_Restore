uint64_t cmark_node_get_type(uint64_t result)
{
  if (result)
    return *(unsigned __int16 *)(result + 100);
  return result;
}

uint64_t cmark_parser_feed(uint64_t a1, _BYTE *a2, unint64_t a3)
{
  return S_parser_feed(a1, a2, a3, 0);
}

uint64_t cmark_parser_new(int a1)
{
  return cmark_parser_new_with_mem(a1, (uint64_t (**)(uint64_t, uint64_t))&CMARK_DEFAULT_MEM_ALLOCATOR);
}

uint64_t S_parser_feed(uint64_t result, _BYTE *a2, unint64_t a3, int a4)
{
  _BYTE *v5;
  uint64_t v6;
  _BYTE *v7;
  int v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  int v15;
  int v17;
  int v18;
  _DWORD *v19;
  const void *v20;
  int v21;
  int v22;

  v5 = a2;
  v6 = result;
  v7 = &a2[a3];
  v8 = *(_DWORD *)(result + 120);
  v9 = *(_QWORD *)(result + 128);
  v10 = 0xFFFFFFFFLL - v9;
  v11 = v9 + a3;
  if (v10 < a3)
    v11 = 0xFFFFFFFFLL;
  *(_QWORD *)(result + 128) = v11;
  if (*(_BYTE *)(result + 124) && *a2 == 10)
    v5 = a2 + 1;
  *(_BYTE *)(result + 124) = 0;
  if (v5 >= v7)
    return result;
  v12 = v8 & 0xC0000;
  v13 = a4 ^ 1;
  do
  {
    v14 = 0;
    while (1)
    {
      v15 = v5[v14];
      if (!v5[v14])
      {
        cmark_strbuf_put((_DWORD *)(v6 + 96), v5, v14);
        v19 = (_DWORD *)(v6 + 96);
        v20 = &S_parser_feed_repl;
        v21 = 3;
        goto LABEL_29;
      }
      if (v15 == 10 || v15 == 13)
        break;
      if (&v5[++v14] >= v7)
      {
        if (a4)
        {
          v17 = 0;
          goto LABEL_18;
        }
        v19 = (_DWORD *)(v6 + 96);
        v20 = v5;
        v21 = v14;
LABEL_29:
        result = (uint64_t)cmark_strbuf_put(v19, v20, v21);
        goto LABEL_30;
      }
    }
    v17 = 1;
LABEL_18:
    if (*(int *)(v6 + 116) < 1)
    {
      if (v12)
        v22 = v17 | v13;
      else
        v22 = 1;
      result = S_process_line(v6, v5, v14, v22);
    }
    else
    {
      cmark_strbuf_put((_DWORD *)(v6 + 96), v5, v14);
      if (v12)
        v18 = v17 | v13;
      else
        v18 = 1;
      S_process_line(v6, *(const void **)(v6 + 104), *(_DWORD *)(v6 + 116), v18);
      result = cmark_strbuf_clear(v6 + 96);
    }
LABEL_30:
    v5 += (int)v14;
    if (v5 >= v7)
      continue;
    if (*v5 == 13)
    {
      if (++v5 != v7)
        goto LABEL_35;
      *(_BYTE *)(v6 + 124) = 1;
      return result;
    }
    if (!*v5)
    {
      ++v5;
      continue;
    }
LABEL_35:
    if (v5 < v7 && *v5 == 10)
      ++v5;
  }
  while (v5 < v7);
  return result;
}

void cmark_register_plugin(unsigned int (*a1)(void))
{
  uint64_t *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;

  v2 = cmark_plugin_new();
  if (a1())
  {
    v3 = (_QWORD *)cmark_plugin_steal_syntax_extensions(v2);
    pthread_once(&extensions_once, (void (*)(void))initialize_extensions);
    pthread_mutex_lock(&extensions_lock);
    if (v3)
    {
      v4 = (_QWORD *)syntax_extensions;
      v5 = v3;
      do
      {
        v4 = cmark_llist_append((uint64_t (**)(uint64_t, uint64_t))&CMARK_DEFAULT_MEM_ALLOCATOR, v4, v5[1]);
        syntax_extensions = (uint64_t)v4;
        v5 = (_QWORD *)*v5;
      }
      while (v5);
    }
    pthread_mutex_unlock(&extensions_lock);
    cmark_llist_free((uint64_t)&CMARK_DEFAULT_MEM_ALLOCATOR, v3);
  }
  cmark_plugin_free((_QWORD **)v2);
}

uint64_t S_process_line(uint64_t a1, const void *a2, int a3, int a4)
{
  _DWORD *v8;
  int v9;
  int v10;
  BOOL v11;
  int *v12;
  unsigned __int8 *v13;
  int v14;
  int v15;
  int v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  BOOL v23;
  int v24;
  int v25;
  uint64_t v26;
  unsigned int v27;
  uint64_t v29;
  _BOOL4 v30;
  unsigned __int8 *v31;
  int v32;
  int v33;
  int v34;
  uint64_t v35;
  int v36;
  int v37;
  int v38;
  unsigned __int8 *v39;
  int v40;
  uint64_t v42;
  __int128 v43;
  unsigned __int8 *v44;
  uint64_t v45;
  int v46;
  int v47;
  int v49;
  int v50;
  int v51;
  unsigned __int8 *v52;
  unint64_t v53;
  int v54;
  void *v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  int v59;
  int v60;
  int v61;
  int v62;
  uint64_t v63;
  char v64;
  int v65;
  int v66;
  _BOOL4 v67;
  int v68;
  uint64_t v69;
  int v70;
  unint64_t v71;
  int *v72;
  uint64_t v73;
  uint64_t v74;
  _BOOL4 v75;
  int v76;
  int v77;
  int v78;
  int v79;
  int v80;
  int v81;
  _BOOL4 v82;
  unsigned __int8 *v83;
  int v84;
  int v85;
  int v87;
  int v88;
  uint64_t v89;
  int v90;
  unsigned __int8 *v91;
  int v92;
  int v93;
  int v94;
  uint64_t v95;
  int v96;
  unint64_t v97;
  _QWORD *v98;
  uint64_t (*v99)(void);
  uint64_t v100;
  int v102;
  int v103;
  uint64_t v104;
  unsigned __int8 *v105;
  uint64_t v106;
  uint64_t v107;
  int v108;
  unsigned __int8 *v109;
  int v110;
  size_t v111;
  void *v112;
  void *v113;
  void *v114;
  int v115;
  uint64_t v116;
  int v117;
  __int16 v118;
  __int16 v119;
  int v120;
  unsigned int (**v121)(void);
  int v122;
  unsigned __int8 *v123;
  int v124;
  uint64_t v126;
  int v127;
  int v128;
  uint64_t v129;
  int v130;
  int v131;
  int v132;
  unsigned __int8 *v133;
  int v134;
  int v135;
  int v137;
  uint64_t i;
  uint64_t v139;
  int v140;
  unsigned int v141;
  uint64_t v142;
  int v143;
  unsigned __int8 *v144;
  uint64_t v145;
  uint64_t v146;
  int v148;
  _BOOL4 v149;
  BOOL v150;
  int v151;
  int v152;
  uint64_t v154;
  uint64_t v155;
  uint64_t (**v156)(uint64_t, uint64_t);
  _DWORD *v157;
  int v158;
  char v159;
  int v160;
  int v161;
  int v162;
  uint64_t v163;
  BOOL v164;
  unint64_t v165;
  uint64_t v166;
  unsigned __int8 *v167;
  uint64_t v168;

  v8 = (_DWORD *)(a1 + 64);
  cmark_strbuf_clear(a1 + 64);
  if ((*(_BYTE *)(a1 + 121) & 2) != 0)
    cmark_utf8proc_check(v8, (uint64_t)a2, a3);
  else
    cmark_strbuf_put(v8, a2, a3);
  v167 = 0;
  v168 = 0;
  v9 = *(_DWORD *)(a1 + 84);
  if (a4)
  {
    if (!v9
      || ((v10 = *(unsigned __int8 *)(v9 + *(_QWORD *)(a1 + 72) - 1), v10 != 10) ? (v11 = v10 == 13) : (v11 = 1), !v11))
    {
      cmark_strbuf_putc((uint64_t)v8, 10);
      v9 = *(_DWORD *)(a1 + 84);
    }
  }
  v163 = (uint64_t)v8;
  *(_QWORD *)(a1 + 36) = 0;
  v12 = (int *)(a1 + 36);
  *(_WORD *)(a1 + 60) = 0;
  *(_QWORD *)(a1 + 44) = 0;
  *(_QWORD *)(a1 + 52) = 0;
  v13 = *(unsigned __int8 **)(a1 + 72);
  v167 = v13;
  v168 = v9;
  v14 = *(_DWORD *)(a1 + 32);
  if (!v14 && v9 >= 3)
  {
    v15 = *(unsigned __int16 *)v13;
    v16 = v13[2];
    if (v15 == 48111 && v16 == 191)
      *v12 = 3;
  }
  *(_DWORD *)(a1 + 32) = v14 + 1;
  v18 = *(_QWORD *)(a1 + 16);
  v19 = *(_QWORD *)(v18 + 56);
  if (!v19 || (*(_WORD *)(v19 + 102) & 1) == 0)
  {
LABEL_21:
    v20 = 1;
    goto LABEL_22;
  }
  while (1)
  {
    v18 = v19;
    v120 = *(unsigned __int16 *)(v19 + 100);
    S_find_first_nonspace(a1, (uint64_t *)&v167);
    v121 = *(unsigned int (***)(void))(v18 + 112);
    if (!v121)
      break;
    if (!*v121 || !(*v121)())
      goto LABEL_226;
LABEL_177:
    v19 = *(_QWORD *)(v18 + 56);
    if (!v19 || (*(_WORD *)(v19 + 102) & 1) == 0)
      goto LABEL_21;
  }
  switch(v120)
  {
    case 32770:
      v122 = *(_DWORD *)(a1 + 56);
      if (v122 > 3)
        goto LABEL_226;
      v123 = v167;
      if (v167[*(int *)(a1 + 44)] != 62)
        goto LABEL_226;
      S_advance_offset(a1, (uint64_t *)&v167, v122 + 1, 1);
      v124 = v123[*(int *)(a1 + 36)];
      if (v124 != 32 && v124 != 9)
        goto LABEL_177;
      v126 = a1;
      v127 = 1;
      goto LABEL_222;
    case 32772:
      v127 = *(_DWORD *)(v18 + 152) + *(_DWORD *)(v18 + 148);
      if (*(_DWORD *)(a1 + 56) >= v127)
      {
        v126 = a1;
LABEL_222:
        v137 = 1;
        goto LABEL_225;
      }
      if (*(_BYTE *)(a1 + 60) && *(_QWORD *)(v18 + 48))
      {
LABEL_224:
        v127 = *(_DWORD *)(a1 + 44) - *(_DWORD *)(a1 + 36);
        v126 = a1;
        v137 = 0;
LABEL_225:
        S_advance_offset(v126, (uint64_t *)&v167, v127, v137);
        goto LABEL_177;
      }
LABEL_226:
      v18 = *(_QWORD *)(v18 + 40);
      if (!v18)
        goto LABEL_263;
      v20 = 0;
LABEL_22:
      v166 = *(_QWORD *)(a1 + 24);
      v21 = v18;
      if ((*(_BYTE *)(a1 + 122) & 4) != 0)
        goto LABEL_162;
      v22 = 0;
      v23 = *(unsigned __int16 *)(v166 + 100) == 32776;
      v24 = *(unsigned __int16 *)(v18 + 100);
      v21 = v18;
      while ((v24 - 32775) <= 0xFFFFFFFD)
      {
        v164 = v23;
        ++v22;
        S_find_first_nonspace(a1, (uint64_t *)&v167);
        v25 = *(_DWORD *)(a1 + 56);
        if (v25 > 3)
          goto LABEL_26;
        v44 = v167;
        v45 = *(int *)(a1 + 44);
        if (v167[v45] == 62)
        {
          v46 = v45 + 1;
          S_advance_offset(a1, (uint64_t *)&v167, v45 + 1 - *(_DWORD *)(a1 + 36), 0);
          v47 = v44[*(int *)(a1 + 36)];
          if (v47 == 32 || v47 == 9)
            S_advance_offset(a1, (uint64_t *)&v167, 1, 1);
          v21 = add_child(a1, v21, 32770, v46);
          goto LABEL_143;
        }
        v162 = *(_DWORD *)(a1 + 56);
        v49 = _scan_at((uint64_t (*)(uint64_t))_scan_atx_heading_start, (uint64_t *)&v167, v45);
        v50 = *(_DWORD *)(a1 + 44);
        if (v49)
        {
          v51 = v49;
          S_advance_offset(a1, (uint64_t *)&v167, v50 + v49 - *(_DWORD *)(a1 + 36), 0);
          v21 = add_child(a1, v21, 32777, v50 + 1);
          v52 = v167;
          v53 = v22;
          v54 = v168;
          v55 = memchr(&v167[*(int *)(a1 + 44)], 35, (int)v168 - (uint64_t)*(int *)(a1 + 44));
          LODWORD(v56) = 0;
          v57 = (_DWORD)v55 - (_DWORD)v52;
          if (!v55)
            v57 = v54;
          v22 = v53;
          if (v52[v57] == 35)
          {
            v56 = 0;
            v58 = (uint64_t)&v52[v57 + 1];
            do
              v59 = *(unsigned __int8 *)(v58 + v56++);
            while (v59 == 35);
          }
          *(_DWORD *)(v21 + 144) = v56;
          *(_BYTE *)(v21 + 148) = 0;
          *(_DWORD *)(v21 + 96) = v51;
          goto LABEL_143;
        }
        v60 = _scan_at((uint64_t (*)(uint64_t))_scan_open_code_fence, (uint64_t *)&v167, *(_DWORD *)(a1 + 44));
        v61 = *(_DWORD *)(a1 + 44);
        if (v60)
        {
          v62 = v60;
          v63 = add_child(a1, v21, 32773, v61 + 1);
          v21 = v63;
          *(_BYTE *)(v63 + 179) = 1;
          *(_BYTE *)(v63 + 178) = v167[*(int *)(a1 + 44)];
          if (v62 >= 255)
            v64 = -1;
          else
            v64 = v62;
          *(_BYTE *)(v63 + 176) = v64;
          *(_BYTE *)(v63 + 177) = *(_DWORD *)(a1 + 44) - *(_DWORD *)(a1 + 36);
          *(_QWORD *)(v63 + 144) = &unk_21132FD7E;
          *(_QWORD *)(v63 + 152) = 0;
          v65 = *(_DWORD *)(a1 + 44) + v62 - *(_DWORD *)(a1 + 36);
          goto LABEL_76;
        }
        v66 = _scan_at((uint64_t (*)(uint64_t))_scan_html_block_start, (uint64_t *)&v167, v61);
        if (v66)
        {
LABEL_78:
          v21 = add_child(a1, v21, 32774, *(_DWORD *)(a1 + 44) + 1);
          *(_DWORD *)(v21 + 144) = v66;
          goto LABEL_143;
        }
        v78 = *(_DWORD *)(a1 + 44);
        if (v24 == 32776)
        {
          v79 = _scan_at((uint64_t (*)(uint64_t))_scan_setext_heading_line, (uint64_t *)&v167, v78);
          if (v79)
          {
            v80 = v79;
            if (resolve_reference_link_definitions(a1, v21))
            {
              *(_WORD *)(v21 + 100) = -32759;
              *(_DWORD *)(v21 + 144) = v80;
              *(_BYTE *)(v21 + 148) = 1;
              goto LABEL_91;
            }
            goto LABEL_143;
          }
          if (!(_DWORD)v20)
            goto LABEL_152;
        }
        else
        {
          v66 = _scan_at((uint64_t (*)(uint64_t))_scan_html_block_start_7, (uint64_t *)&v167, v78);
          if (v66)
            goto LABEL_78;
        }
        v87 = *(_DWORD *)(a1 + 44);
        if (*(_DWORD *)(a1 + 52) > v87)
          goto LABEL_152;
        v88 = v167[v87];
        if ((v88 - 42) > 0x35 || ((1 << (v88 - 42)) & 0x20000000000009) == 0)
          goto LABEL_151;
        v89 = v87 + 1;
        v90 = v167[v89];
        if (!v167[v89])
        {
          ++v87;
LABEL_151:
          *(_DWORD *)(a1 + 52) = v87;
LABEL_152:
          v25 = v162;
          if ((*(_BYTE *)(a1 + 121) & 0x20) != 0 && v22 <= 0x63)
          {
            v102 = _scan_at((uint64_t (*)(uint64_t))_scan_footnote_definition, (uint64_t *)&v167, *(_DWORD *)(a1 + 44));
            v25 = v162;
            if (v102)
            {
              v103 = v102;
              v104 = *(int *)(a1 + 44);
              v105 = &v167[v104 + 2];
              v106 = v102 - 3;
              if (v105[v106] == 93)
              {
                LODWORD(v107) = v102 - 2;
                v108 = v102 - 2;
              }
              else
              {
                v107 = v102 - 2;
                v109 = &v167[v104];
                do
                {
                  v108 = v106;
                  v110 = v109[v107];
                  LODWORD(v106) = v106 - 1;
                  --v107;
                }
                while (v110 != 93);
              }
              v111 = v106;
              v112 = (void *)(**(uint64_t (***)(_QWORD, uint64_t))a1)((int)v107, 1);
              if (v108 >= 2)
              {
                v113 = v112;
                memcpy(v112, v105, v111);
                v112 = v113;
              }
              *((_BYTE *)v112 + (int)v111) = 0;
              v114 = v112;
              S_advance_offset(a1, (uint64_t *)&v167, *(_DWORD *)(a1 + 44) + v103 - *(_DWORD *)(a1 + 36), 0);
              v21 = add_child(a1, v21, 32779, v103 + *(_DWORD *)(a1 + 44) + 1);
              *(_QWORD *)(v21 + 144) = v114;
              *(_QWORD *)(v21 + 152) = v111 | 0x100000000;
              *(_DWORD *)(v21 + 96) = v103;
              goto LABEL_143;
            }
          }
LABEL_26:
          if (v24 != 32771 && v25 > 3 || *(int *)(a1 + 56) > 3 || v22 > 0x63)
            goto LABEL_134;
          v156 = *(uint64_t (***)(uint64_t, uint64_t))a1;
          v26 = *(int *)(a1 + 44);
          v158 = *(unsigned __int16 *)(v21 + 100);
          v160 = v25;
          v27 = v167[v26];
          if (v27 > 0x2D || ((1 << v27) & 0x2C0000000000) == 0)
          {
            v155 = *(int *)(a1 + 44);
            v67 = cmark_isdigit(v27);
            v25 = v160;
            if (!v67)
              goto LABEL_134;
            v68 = 0;
            v69 = v155;
            v70 = -8;
            while (1)
            {
              v68 = v167[v69] + 10 * v68 - 48;
              if (!v70)
                break;
              v71 = v22;
              v72 = v12;
              v73 = v20;
              v74 = v69 + 1;
              v75 = cmark_isdigit(v167[v69 + 1]);
              ++v70;
              v69 = v74;
              v20 = v73;
              v12 = v72;
              v22 = v71;
              if (!v75)
              {
                v76 = v155 + v70 + 7;
                v77 = v155 + v70 + 8;
                goto LABEL_93;
              }
            }
            v76 = v155 + 8;
            v77 = v155 + 9;
LABEL_93:
            v25 = v160;
            if (v158 == 32776 && v68 != 1)
              goto LABEL_134;
            v81 = v167[v77];
            if (v81 != 46 && v81 != 41)
              goto LABEL_134;
            v154 = v76 + 2;
            v82 = cmark_isspace(v167[v154]);
            v25 = v160;
            if (!v82)
              goto LABEL_134;
            if (v158 != 32776)
              goto LABEL_130;
            v83 = &v167[v154];
            do
            {
              while (1)
              {
                v85 = *v83++;
                v84 = v85;
                if (v85 > 12)
                  break;
                if (v84 != 9)
                {
                  if (v84 != 10)
                    goto LABEL_130;
                  goto LABEL_134;
                }
              }
            }
            while (v84 == 32);
            if (v84 == 13)
              goto LABEL_134;
LABEL_130:
            v95 = (*v156)(1, 24);
            v25 = v160;
            *(_QWORD *)v95 = 2;
            *(_WORD *)(v95 + 20) = 0;
            *(_DWORD *)(v95 + 12) = v68;
            if (v81 == 46)
              v96 = 1;
            else
              v96 = 2;
            *(_DWORD *)(v95 + 16) = v96;
            if ((_DWORD)v154 == (_DWORD)v155)
            {
LABEL_134:
              if (v25 >= 4 && !v164 && !*(_BYTE *)(a1 + 60))
              {
                S_advance_offset(a1, (uint64_t *)&v167, 4, 1);
                v21 = add_child(a1, v21, 32773, *(_DWORD *)(a1 + 36) + 1);
                *(_DWORD *)(v21 + 176) = 0;
                *(_QWORD *)(v21 + 144) = &unk_21132FD7E;
                *(_QWORD *)(v21 + 152) = 0;
                goto LABEL_143;
              }
              v97 = v22;
              v98 = *(_QWORD **)(a1 + 136);
              if (v98)
              {
                while (1)
                {
                  v99 = *(uint64_t (**)(void))(v98[1] + 8);
                  if (v99)
                  {
                    v100 = v99();
                    if (v100)
                      break;
                  }
                  v98 = (_QWORD *)*v98;
                  if (!v98)
                    goto LABEL_162;
                }
                v21 = v100;
                v22 = v97;
                goto LABEL_143;
              }
              break;
            }
            v35 = v95;
            v157 = (_DWORD *)(v95 + 16);
            v165 = v22;
            v34 = v154 - v155;
          }
          else
          {
            v29 = v26 + 1;
            v30 = cmark_isspace(v167[v26 + 1]);
            v25 = v160;
            if (!v30)
              goto LABEL_134;
            if (v158 == 32776)
            {
              v31 = &v167[v29];
              do
              {
                do
                {
                  v33 = *v31++;
                  v32 = v33;
                }
                while (v33 == 9);
              }
              while (v32 == 32);
              if (v32 == 10)
                goto LABEL_134;
            }
            v165 = v22;
            v34 = 1;
            v35 = (*v156)(1, 24);
            *(_QWORD *)v35 = 1;
            *(_BYTE *)(v35 + 20) = v27;
            *(_DWORD *)(v35 + 16) = 0;
            v157 = (_DWORD *)(v35 + 16);
            *(_DWORD *)(v35 + 12) = 0;
            *(_BYTE *)(v35 + 21) = 0;
          }
          v161 = v34;
          S_advance_offset(a1, (uint64_t *)&v167, *(_DWORD *)(a1 + 44) + v34 - *(_DWORD *)(a1 + 36), 0);
          v36 = 0;
          v159 = *(_BYTE *)(a1 + 61);
          v38 = *(_DWORD *)(a1 + 36);
          v37 = *(_DWORD *)(a1 + 40);
          v39 = v167;
          while (1)
          {
            v40 = v39[*v12];
            if (v40 != 32 && v40 != 9)
              break;
            S_advance_offset(a1, (uint64_t *)&v167, 1, 1);
            v36 = *(_DWORD *)(a1 + 40) - v37;
            if (v36 >= 6)
              goto LABEL_48;
          }
          if ((v36 - 5) >= 0xFFFFFFFC)
          {
            if (v40 != 13 && v40 != 10)
            {
              *(_DWORD *)(v35 + 8) = v36 + v161;
              goto LABEL_50;
            }
LABEL_48:
            *(_DWORD *)(v35 + 8) = v161 + 1;
            *(_DWORD *)(a1 + 36) = v38;
            *(_DWORD *)(a1 + 40) = v37;
            *(_BYTE *)(a1 + 61) = v159;
          }
          else
          {
            *(_DWORD *)(v35 + 8) = v161 + 1;
            *(_DWORD *)(a1 + 36) = v38;
            *(_DWORD *)(a1 + 40) = v37;
            *(_BYTE *)(a1 + 61) = v159;
            if (v36 < 1)
            {
LABEL_50:
              *(_DWORD *)(v35 + 4) = *(_DWORD *)(a1 + 56);
              v22 = v165;
              if (v24 != 32771
                || *(_DWORD *)(v21 + 144) != *(_DWORD *)v35
                || *(_DWORD *)(v21 + 160) != *v157
                || *(unsigned __int8 *)(v21 + 164) != *(unsigned __int8 *)(v35 + 20))
              {
                v21 = add_child(a1, v21, 32771, *(_DWORD *)(a1 + 44) + 1);
                v42 = *(_QWORD *)(v35 + 16);
                *(_OWORD *)(v21 + 144) = *(_OWORD *)v35;
                *(_QWORD *)(v21 + 160) = v42;
              }
              v21 = add_child(a1, v21, 32772, *(_DWORD *)(a1 + 44) + 1);
              v43 = *(_OWORD *)v35;
              *(_QWORD *)(v21 + 160) = *(_QWORD *)(v35 + 16);
              *(_OWORD *)(v21 + 144) = v43;
              (*(void (**)(uint64_t))(*(_QWORD *)a1 + 16))(v35);
              goto LABEL_143;
            }
          }
          S_advance_offset(a1, (uint64_t *)&v167, 1, 1);
          goto LABEL_50;
        }
        v91 = &v167[v89 + 1];
        v92 = 1;
        v93 = v87 + 1;
        while (v90 == v88)
        {
          ++v92;
LABEL_123:
          ++v93;
          v94 = *v91++;
          v90 = v94;
          if (!v94)
            goto LABEL_124;
        }
        if (v90 == 32 || v90 == 9)
          goto LABEL_123;
LABEL_124:
        if (v92 < 3 || v90 != 13 && v90 != 10)
        {
          v87 = v93;
          goto LABEL_151;
        }
        if (v93 - v87 == -1)
          goto LABEL_152;
        v21 = add_child(a1, v21, 32778, v89);
LABEL_91:
        v65 = v168 + ~*(_DWORD *)(a1 + 36);
LABEL_76:
        S_advance_offset(a1, (uint64_t *)&v167, v65, 0);
LABEL_143:
        v23 = 0;
        v24 = *(unsigned __int16 *)(v21 + 100);
        if ((v24 - 32773) > 4 || ((1 << (v24 - 5)) & 0x19) == 0)
          continue;
        break;
      }
LABEL_162:
      if (v166 == *(_QWORD *)(a1 + 24))
      {
        S_find_first_nonspace(a1, (uint64_t *)&v167);
        v115 = *(unsigned __int8 *)(a1 + 60);
        if (*(_BYTE *)(a1 + 60))
        {
          v116 = *(_QWORD *)(v21 + 56);
          if (v116)
            *(_WORD *)(v116 + 102) |= 2u;
        }
        if (!v115 || (v117 = *(unsigned __int16 *)(v21 + 100), v117 == 32770) || v117 == 32777 || v117 == 32778)
        {
LABEL_173:
          v118 = 0;
          v119 = *(_WORD *)(v21 + 102) & 0xFFFD;
        }
        else
        {
          if (v117 != 32772)
          {
            if (v117 == 32773 && *(_BYTE *)(v21 + 179))
              goto LABEL_173;
LABEL_229:
            v119 = *(_WORD *)(v21 + 102) & 0xFFFD;
            goto LABEL_230;
          }
          if (*(_QWORD *)(v21 + 48))
            goto LABEL_229;
          v119 = *(_WORD *)(v21 + 102) & 0xFFFD;
          if (*(_DWORD *)(v21 + 80) == *(_DWORD *)(a1 + 32))
            v118 = 0;
          else
LABEL_230:
            v118 = 2;
        }
        *(_WORD *)(v21 + 102) = v118 | v119;
        for (i = *(_QWORD *)(v21 + 40); i; i = *(_QWORD *)(i + 40))
          *(_WORD *)(i + 102) &= ~2u;
        v139 = *(_QWORD *)(a1 + 24);
        if (v21 == v18
          && v139 != v18
          && (!v115 || (*(_BYTE *)(a1 + 122) & 0xC) != 0)
          && *(unsigned __int16 *)(v139 + 100) == 32776)
        {
          add_line(*(_QWORD *)(a1 + 24), (uint64_t)&v167, a1);
          goto LABEL_263;
        }
        while (v139 != v18)
        {
          v139 = finalize(a1, v139);
          *(_QWORD *)(a1 + 24) = v139;
          if (!v139)
            S_process_line_cold_4();
        }
        v140 = *(unsigned __int16 *)(v21 + 100);
        if (v140 == 32774)
        {
          add_line(v21, (uint64_t)&v167, a1);
          v141 = *(_DWORD *)(v21 + 144) - 1;
          if (v141 <= 4
            && _scan_at((uint64_t (*)(uint64_t))off_24CB96620[v141], (uint64_t *)&v167, *(_DWORD *)(a1 + 44)))
          {
            v142 = finalize(a1, v21);
            if (!*(_QWORD *)(a1 + 24))
              S_process_line_cold_3();
            v21 = v142;
          }
        }
        else
        {
          if (v140 == 32773)
            goto LABEL_261;
          if (!*(_BYTE *)(a1 + 60) || (*(_BYTE *)(a1 + 122) & 0xC) != 0)
          {
            if ((v140 & 0xFFFE) == 0x8008)
            {
              if (v140 == 32777 && !*(_BYTE *)(v21 + 148))
              {
                if (HIDWORD(v168))
                  S_process_line_cold_1();
                v148 = v168;
                if ((int)v168 >= 1)
                {
                  while (1)
                  {
                    v149 = cmark_isspace(v167[v148 - 1]);
                    v148 = v168 - 1;
                    v150 = (int)v168 <= 1;
                    if (!v149)
                      break;
                    LODWORD(v168) = v168 - 1;
                    if (v150)
                      goto LABEL_249;
                  }
                  if ((int)v168 > 1)
                  {
                    v151 = 0;
                    while (1)
                    {
                      v152 = v167[v148];
                      if (v152 != 35)
                        break;
                      ++v151;
                      v150 = v148-- <= 0;
                      if (v150)
                        goto LABEL_249;
                    }
                    if (v151)
                    {
                      if (v152 == 32 || v152 == 9)
                      {
                        LODWORD(v168) = v148;
                        if (HIDWORD(v168))
                          S_process_line_cold_1();
                        if (v148)
                        {
                          do
                          {
                            if (!cmark_isspace(v167[v148 - 1]))
                              break;
                            v148 = v168 - 1;
                            v150 = (int)v168 <= 1;
                            LODWORD(v168) = v168 - 1;
                          }
                          while (!v150);
                        }
                      }
                    }
                  }
                }
              }
LABEL_249:
              if ((*(_BYTE *)(a1 + 122) & 0xC) == 0)
LABEL_260:
                S_advance_offset(a1, (uint64_t *)&v167, *(_DWORD *)(a1 + 44) - *(_DWORD *)(a1 + 36), 0);
            }
            else
            {
              if ((*(_BYTE *)(a1 + 122) & 0xC) == 0)
              {
                v21 = add_child(a1, v21, 32776, *(_DWORD *)(a1 + 44) + 1);
                goto LABEL_260;
              }
              v21 = add_child(a1, v21, 32776, *(_DWORD *)(a1 + 36) + 1);
            }
LABEL_261:
            add_line(v21, (uint64_t)&v167, a1);
          }
        }
        *(_QWORD *)(a1 + 24) = v21;
      }
LABEL_263:
      v143 = v168;
      *(_DWORD *)(a1 + 88) = v168;
      if (v143)
      {
        v144 = v167;
        v145 = v143 - 1;
        if (v167[v145] != 10 || (*(_DWORD *)(a1 + 88) = v145, --v143, (_DWORD)v145))
        {
          v146 = v143 - 1;
          if (v144[v146] == 13)
            *(_DWORD *)(a1 + 88) = v146;
        }
      }
      return cmark_strbuf_clear(v163);
    case 32773:
      v128 = *(_DWORD *)(a1 + 56);
      if (*(_BYTE *)(v18 + 179))
      {
        if (v128 <= 3 && (v129 = *(int *)(a1 + 44), v167[v129] == *(unsigned __int8 *)(v18 + 178)))
          v130 = _scan_at((uint64_t (*)(uint64_t))_scan_close_code_fence, (uint64_t *)&v167, v129);
        else
          v130 = 0;
        if (v130 >= *(unsigned __int8 *)(v18 + 176))
        {
          S_advance_offset(a1, (uint64_t *)&v167, v130, 0);
          *(_QWORD *)(a1 + 24) = finalize(a1, v18);
          goto LABEL_263;
        }
        if (*(_BYTE *)(v18 + 177))
        {
          v133 = v167;
          v134 = *(unsigned __int8 *)(v18 + 177) + 1;
          do
          {
            v135 = v133[*v12];
            if (v135 != 32 && v135 != 9)
              break;
            S_advance_offset(a1, (uint64_t *)&v167, 1, 1);
            --v134;
          }
          while (v134 > 1);
        }
        goto LABEL_177;
      }
      if (v128 >= 4)
      {
LABEL_221:
        v126 = a1;
        v127 = 4;
        goto LABEL_222;
      }
      if (!*(_BYTE *)(a1 + 60))
        goto LABEL_226;
      goto LABEL_224;
    case 32774:
      v131 = *(_DWORD *)(v18 + 144);
      if ((v131 - 8) <= 0xFFFFFFF8)
        S_process_line_cold_5();
      if ((v131 - 1) < 5)
        goto LABEL_177;
      if ((v131 - 6) <= 1)
        goto LABEL_200;
      goto LABEL_226;
    case 32776:
LABEL_200:
      if (*(_BYTE *)(a1 + 60))
        goto LABEL_226;
      goto LABEL_177;
    case 32777:
      goto LABEL_226;
    case 32779:
      if (*(int *)(a1 + 56) >= 4)
        goto LABEL_221;
      if ((int)v168 < 1)
        goto LABEL_226;
      v132 = *v167;
      if (v132 != 10 && (v132 != 13 || v167[1] != 10))
        goto LABEL_226;
      goto LABEL_177;
    default:
      goto LABEL_177;
  }
}

_DWORD *cmark_strbuf_put(_DWORD *result, const void *a2, int a3)
{
  _DWORD *v5;
  uint64_t v6;

  if (a3 >= 1)
  {
    v5 = result;
    cmark_strbuf_grow((uint64_t)result, result[5] + a3);
    result = memmove((void *)(*((_QWORD *)v5 + 1) + (int)v5[5]), a2, a3);
    v6 = (int)v5[5] + (uint64_t)a3;
    v5[5] = v6;
    *(_BYTE *)(*((_QWORD *)v5 + 1) + v6) = 0;
  }
  return result;
}

uint64_t cmark_strbuf_clear(uint64_t result)
{
  *(_DWORD *)(result + 20) = 0;
  if (*(int *)(result + 16) >= 1)
    **(_BYTE **)(result + 8) = 0;
  return result;
}

__n128 cmark_parser_reset(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __n128 result;
  __int128 v7;
  __n128 v8;

  v2 = *(_DWORD *)(a1 + 120);
  v3 = *(_QWORD *)a1;
  v7 = *(_OWORD *)(a1 + 136);
  v8 = *(__n128 *)(a1 + 160);
  cmark_parser_dispose(a1);
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_QWORD *)a1 = v3;
  cmark_strbuf_init(v3, (uint64_t *)(a1 + 64), 256);
  cmark_strbuf_init(*(_QWORD *)a1, (uint64_t *)(a1 + 96), 0);
  v4 = *(_QWORD *)a1;
  v5 = (**(uint64_t (***)(uint64_t, uint64_t))a1)(1, 184);
  cmark_strbuf_init(v4, (uint64_t *)v5, 32);
  *(_DWORD *)(v5 + 100) = 98305;
  *(_QWORD *)(v5 + 80) = 0x100000001;
  *(_DWORD *)(v5 + 88) = 1;
  *(_QWORD *)(a1 + 8) = cmark_reference_map_new(*(uint64_t (***)(uint64_t, uint64_t))a1);
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v5;
  *(_OWORD *)(a1 + 136) = v7;
  *(_DWORD *)(a1 + 120) = v2;
  result = v8;
  *(__n128 *)(a1 + 160) = v8;
  return result;
}

uint64_t cmark_strbuf_grow(uint64_t result, int a2)
{
  uint64_t v2;
  int v3;
  unsigned int v4;
  uint64_t v5;

  if (a2 <= 0)
    cmark_strbuf_grow_cold_1();
  v2 = result;
  v3 = *(_DWORD *)(result + 16);
  if (v3 <= a2)
  {
    if (a2 >> 30)
      cmark_strbuf_grow_cold_2();
    v4 = ((a2 + (a2 >> 1)) & 0xFFFFFFF8) + 8;
    if (v3)
      v5 = *(_QWORD *)(result + 8);
    else
      v5 = 0;
    result = (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)v2 + 8))(v5, ((a2 + (a2 >> 1)) & 0xFFFFFFF8) + 8);
    *(_QWORD *)(v2 + 8) = result;
    *(_DWORD *)(v2 + 16) = v4;
  }
  return result;
}

uint64_t cmark_strbuf_init(uint64_t result, uint64_t *a2, int a3)
{
  *a2 = result;
  a2[1] = (uint64_t)&cmark_strbuf__initbuf;
  a2[2] = 0;
  if (a3 >= 1)
    return cmark_strbuf_grow((uint64_t)a2, a3);
  return result;
}

void *xrealloc(void *a1, size_t a2)
{
  void *result;

  result = malloc_type_realloc(a1, a2, 0xC424ACAFuLL);
  if (!result)
    xrealloc_cold_1();
  return result;
}

uint64_t cmark_parser_dispose(uint64_t a1)
{
  _QWORD *v2;
  uint64_t result;

  v2 = *(_QWORD **)(a1 + 16);
  if (v2)
    cmark_node_free(v2);
  result = *(_QWORD *)(a1 + 8);
  if (result)
    return cmark_map_free(result);
  return result;
}

uint64_t (***cmark_reference_map_new(uint64_t (**a1)(uint64_t, uint64_t)))(uint64_t, uint64_t)
{
  return cmark_map_new(a1, (uint64_t (**)(uint64_t, uint64_t))reference_free);
}

uint64_t (***cmark_map_new(uint64_t (**a1)(uint64_t, uint64_t), uint64_t (**a2)(uint64_t, uint64_t)))(uint64_t, uint64_t)
{
  uint64_t (***result)(uint64_t, uint64_t);

  result = (uint64_t (***)(uint64_t, uint64_t))(*a1)(1, 56);
  *result = a1;
  result[5] = (uint64_t (**)(uint64_t, uint64_t))0xFFFFFFFFLL;
  result[6] = a2;
  return result;
}

uint64_t cmark_parser_finish(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  int v4;
  unint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  int i;
  uint64_t node;
  uint64_t v12;
  uint64_t v13;
  unsigned int (*v14)(void);
  uint64_t (***v15)(uint64_t, uint64_t);
  uint64_t v16;
  int v17;
  int j;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _BYTE *v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t (**v33)(uint64_t, uint64_t);
  uint64_t v34;
  unsigned int v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  _QWORD *k;
  uint64_t (*v39)(void);
  uint64_t v40;
  uint64_t v41;
  _QWORD v43[2];
  uint64_t v44;
  char __str[8];
  void *v46;
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return 0;
  v3 = a1 + 96;
  v4 = *(_DWORD *)(a1 + 116);
  if (v4)
  {
    S_process_line(a1, *(const void **)(a1 + 104), v4, (*(_DWORD *)(a1 + 120) & 0xC0000) == 0);
    cmark_strbuf_clear(v3);
    v1 = *(_QWORD *)(a1 + 16);
  }
  if (*(_QWORD *)(a1 + 24) != v1)
  {
    v1 = *(_QWORD *)(a1 + 24);
    do
    {
      v1 = finalize(a1, v1);
      *(_QWORD *)(a1 + 24) = v1;
    }
    while (v1 != *(_QWORD *)(a1 + 16));
  }
  finalize(a1, v1);
  v5 = *(_QWORD *)(a1 + 128);
  v6 = *(_QWORD *)(a1 + 8);
  if (v5 <= 0x186A0)
    v5 = 100000;
  *(_QWORD *)(v6 + 40) = v5;
  v7 = *(_DWORD *)(a1 + 120);
  v8 = cmark_iter_new(*(_QWORD *)(a1 + 16));
  cmark_manage_extensions_special_characters(a1, 1);
  v9 = cmark_iter_next(v8);
  if (v9 != 1)
  {
    for (i = v9; i != 1; i = cmark_iter_next(v8))
    {
      node = cmark_iter_get_node(v8);
      if (i == 2)
      {
        v12 = node;
        v13 = *(_QWORD *)(node + 112);
        if (v13)
        {
          v14 = *(unsigned int (**)(void))(v13 + 88);
          if (v14)
          {
            if (!v14())
              continue;
LABEL_17:
            cmark_parse_inlines(a1, v12, v6, v7);
            continue;
          }
        }
        if ((*(_WORD *)(v12 + 100) & 0xFFFE) == 0x8008)
          goto LABEL_17;
      }
    }
  }
  cmark_manage_extensions_special_characters(a1, 0);
  cmark_iter_free(v8);
  if ((*(_BYTE *)(a1 + 121) & 0x20) != 0)
  {
    v15 = cmark_footnote_map_new(*(uint64_t (***)(uint64_t, uint64_t))a1);
    v16 = cmark_iter_new(*(_QWORD *)(a1 + 16));
    v17 = cmark_iter_next(v16);
    if (v17 != 1)
    {
      for (j = v17; j != 1; j = cmark_iter_next(v16))
      {
        v19 = cmark_iter_get_node(v16);
        if (j == 3 && *(unsigned __int16 *)(v19 + 100) == 32779)
          cmark_footnote_create((uint64_t *)v15, v19);
      }
    }
    cmark_iter_free(v16);
    v20 = cmark_iter_new(*(_QWORD *)(a1 + 16));
    v21 = cmark_iter_next(v20);
    if (v21 != 1)
    {
      v22 = v21;
      v23 = 0;
      do
      {
        v24 = cmark_iter_get_node(v20);
        if (v22 == 3)
        {
          v25 = v24;
          if (*(unsigned __int16 *)(v24 + 100) == 49163)
          {
            v26 = (_QWORD *)(v24 + 144);
            v27 = cmark_map_lookup((uint64_t *)v15, v24 + 144);
            if (v27)
            {
              if (!*((_DWORD *)v27 + 10))
                *((_DWORD *)v27 + 10) = ++v23;
              v28 = *((_QWORD *)v27 + 4);
              *(_QWORD *)(v25 + 136) = v28;
              v29 = *(_DWORD *)(v28 + 128) + 1;
              *(_DWORD *)(v28 + 128) = v29;
              *(_DWORD *)(v25 + 128) = v29;
              snprintf(__str, 0x20uLL, "%d", *((_DWORD *)v27 + 10));
              if (*(_DWORD *)(v25 + 156))
                (*(void (**)(_QWORD))(*(_QWORD *)a1 + 16))(*v26);
              *v26 = 0;
              *(_QWORD *)(v25 + 152) = 0;
              v43[0] = *(_QWORD *)a1;
              v43[1] = &cmark_strbuf__initbuf;
              v44 = 0;
              cmark_strbuf_puts(v43, __str);
              v30 = HIDWORD(v44);
              *(_QWORD *)(v25 + 144) = cmark_strbuf_detach((uint64_t)v43);
              *(_QWORD *)(v25 + 152) = v30 | 0x100000000;
            }
            else
            {
              v31 = (**(uint64_t (***)(uint64_t, uint64_t))a1)(1, 184);
              cmark_strbuf_init(*(_QWORD *)a1, (uint64_t *)v31, 0);
              *(_WORD *)(v31 + 100) = -16383;
              *(_QWORD *)__str = *(_QWORD *)a1;
              v46 = &cmark_strbuf__initbuf;
              v47 = 0;
              cmark_strbuf_puts(__str, "[^");
              cmark_strbuf_put(__str, *(const void **)(v25 + 144), *(_DWORD *)(v25 + 152));
              cmark_strbuf_putc((uint64_t)__str, 93);
              v32 = HIDWORD(v47);
              *(_QWORD *)(v31 + 144) = cmark_strbuf_detach((uint64_t)__str);
              *(_QWORD *)(v31 + 152) = v32 | 0x100000000;
              cmark_node_insert_after(v25, (_QWORD *)v31);
              cmark_node_free((_QWORD *)v25);
            }
          }
        }
        v22 = cmark_iter_next(v20);
      }
      while (v22 != 1);
    }
    cmark_iter_free(v20);
    v33 = v15[2];
    if (v33)
    {
      qsort(v33, (size_t)v15[3], 8uLL, (int (__cdecl *)(const void *, const void *))sort_footnote_by_ix);
      if (v15[3])
      {
        v34 = 0;
        v35 = 1;
        do
        {
          v36 = v15[2][v34];
          if (*((_DWORD *)v36 + 10))
          {
            cmark_node_append_child(*(_QWORD **)(a1 + 16), *((_QWORD **)v36 + 4));
            *((_QWORD *)v36 + 4) = 0;
          }
          else
          {
            cmark_node_unlink(*((_QWORD **)v36 + 4));
          }
          v34 = v35;
        }
        while ((unint64_t)v15[3] > v35++);
      }
    }
    cmark_unlink_footnotes_map(v15);
    cmark_map_free((uint64_t)v15);
  }
  cmark_consolidate_text_nodes(*(_QWORD **)(a1 + 16));
  cmark_strbuf_free(a1 + 64);
  cmark_strbuf_free(v3);
  for (k = *(_QWORD **)(a1 + 136); k; k = (_QWORD *)*k)
  {
    v39 = *(uint64_t (**)(void))(k[1] + 152);
    if (v39)
    {
      v40 = v39();
      if (v40)
        *(_QWORD *)(a1 + 16) = v40;
    }
  }
  v41 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = 0;
  cmark_parser_reset(a1);
  return v41;
}

uint64_t cmark_iter_new(uint64_t result)
{
  uint64_t v1;
  uint64_t (**v2)(_QWORD, _QWORD);

  if (result)
  {
    v1 = result;
    v2 = *(uint64_t (***)(_QWORD, _QWORD))result;
    result = (**(uint64_t (***)(uint64_t, uint64_t))result)(1, 48);
    *(_QWORD *)result = v2;
    *(_QWORD *)(result + 8) = v1;
    *(_DWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_DWORD *)(result + 32) = 2;
    *(_QWORD *)(result + 40) = v1;
  }
  return result;
}

uint64_t cmark_iter_free(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 16))(a1);
}

uint64_t finalize(uint64_t a1, uint64_t a2)
{
  __int16 v2;
  uint64_t v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int16 v15;
  _WORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned __int8 *v20;
  int v21;
  uint64_t v23;
  uint64_t v24;
  _BYTE *v25;
  int v26;
  _BOOL4 v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v37;
  int v38;
  _QWORD v40[2];
  uint64_t v41;

  v2 = *(_WORD *)(a2 + 102);
  if ((v2 & 1) == 0)
    finalize_cold_1();
  v5 = *(_QWORD *)(a2 + 40);
  *(_WORD *)(a2 + 102) = v2 & 0xFFFE;
  v6 = *(_DWORD *)(a1 + 84);
  if (v6)
  {
    v7 = *(unsigned __int16 *)(a2 + 100);
    if (v7 == 32769)
      goto LABEL_12;
    if (v7 == 32777)
    {
      if (*(_BYTE *)(a2 + 148))
        goto LABEL_12;
    }
    else if (v7 == 32773 && *(_BYTE *)(a2 + 179))
    {
      goto LABEL_12;
    }
    v8 = *(_DWORD *)(a1 + 32);
    if (v8 > *(_DWORD *)(a2 + 88))
    {
      *(_DWORD *)(a2 + 88) = v8 - 1;
      *(_DWORD *)(a2 + 92) = *(_DWORD *)(a1 + 88);
      goto LABEL_16;
    }
LABEL_12:
    *(_DWORD *)(a2 + 88) = *(_DWORD *)(a1 + 32);
    *(_DWORD *)(a2 + 92) = v6;
    v9 = *(_QWORD *)(a1 + 72);
    v10 = v6 - 1;
    if (*(_BYTE *)(v9 + v10) != 10 || (*(_DWORD *)(a2 + 92) = v10, --v6, (_DWORD)v10))
    {
      v11 = v6 - 1;
      if (*(_BYTE *)(v9 + v11) == 13)
        *(_DWORD *)(a2 + 92) = v11;
    }
    goto LABEL_16;
  }
  *(_DWORD *)(a2 + 88) = *(_DWORD *)(a1 + 32);
  *(_DWORD *)(a2 + 92) = *(_DWORD *)(a1 + 88);
  v7 = *(unsigned __int16 *)(a2 + 100);
LABEL_16:
  switch(v7)
  {
    case 32771:
      *(_BYTE *)(a2 + 165) = 1;
      v12 = *(_QWORD *)(a2 + 48);
      if (!v12)
        return v5;
      while ((*(_WORD *)(v12 + 102) & 2) == 0 || !*(_QWORD *)(v12 + 24))
      {
        v13 = *(_QWORD *)(v12 + 48);
        if (!v13)
          goto LABEL_79;
        v14 = *(_QWORD *)(v12 + 24);
        do
        {
          if (!v14 && !*(_QWORD *)(v13 + 24))
            break;
          v16 = (_WORD *)(v13 + 102);
          v15 = *(_WORD *)(v13 + 102);
          if ((v15 & 4) == 0)
          {
            v17 = v13;
            while (*(unsigned __int16 *)(v17 + 100) - 32771 <= 1)
            {
              v17 = *(_QWORD *)(v17 + 56);
              if (!v17)
                break;
              *v16 = v15 | 4;
              v16 = (_WORD *)(v17 + 102);
              v15 = *(_WORD *)(v17 + 102);
              if ((v15 & 4) != 0)
                goto LABEL_31;
            }
            *v16 = v15 | 4;
          }
LABEL_31:
          if ((v15 & 2) != 0)
            goto LABEL_55;
          v13 = *(_QWORD *)(v13 + 24);
        }
        while (v13);
        if (*(_BYTE *)(a2 + 165))
        {
LABEL_79:
          v12 = *(_QWORD *)(v12 + 24);
          if (v12)
            continue;
        }
        return v5;
      }
LABEL_55:
      *(_BYTE *)(a2 + 165) = 0;
      return v5;
    case 32773:
      v18 = *(unsigned int *)(a2 + 20);
      if (!*(_BYTE *)(a2 + 179))
      {
        if ((int)v18 < 1)
        {
LABEL_63:
          cmark_strbuf_clear(a2);
        }
        else
        {
          v29 = 0;
          v30 = *(_QWORD *)(a2 + 8);
          while (1)
          {
            v31 = *(unsigned __int8 *)(v30 + (v18 + v29 - 1));
            v32 = v31 > 0x20;
            v33 = (1 << v31) & 0x100002600;
            if (v32 || v33 == 0)
              break;
            --v29;
            if ((unint64_t)(v18 + v29 + 1) <= 1)
              goto LABEL_63;
          }
          if ((int)v18 >= (int)v18 + (int)v29)
          {
            v37 = v18 + v30 - 1;
            while (1)
            {
              v38 = *(unsigned __int8 *)(v37 + v29);
              if (v38 == 13 || v38 == 10)
                break;
              if ((_DWORD)++v29 == 1)
                goto LABEL_64;
            }
            cmark_strbuf_truncate(a2, v18 + v29 - 1);
          }
        }
LABEL_64:
        cmark_strbuf_putc(a2, 10);
        goto LABEL_65;
      }
      if ((int)v18 < 1)
LABEL_44:
        finalize_cold_2();
      v19 = 0;
      v20 = *(unsigned __int8 **)(a2 + 8);
      while (1)
      {
        v21 = v20[v19];
        if (v21 == 10 || v21 == 13)
          break;
        if (v18 == ++v19)
          goto LABEL_44;
      }
      v40[0] = *(_QWORD *)a1;
      v40[1] = &cmark_strbuf__initbuf;
      v41 = 0;
      houdini_unescape_html_f(v40, v20, v19);
      cmark_strbuf_trim((uint64_t)v40);
      cmark_strbuf_unescape((uint64_t)v40);
      v24 = HIDWORD(v41);
      *(_QWORD *)(a2 + 144) = cmark_strbuf_detach((uint64_t)v40);
      *(_QWORD *)(a2 + 152) = v24 | 0x100000000;
      v25 = (_BYTE *)(*(_QWORD *)(a2 + 8) + v19);
      v26 = *v25;
      v27 = v26 == 13;
      if (v26 == 13)
        ++v25;
      if (*v25 == 10)
        v28 = v27 + 1;
      else
        v28 = v27;
      cmark_strbuf_drop((void *)a2, v28 + v19);
LABEL_65:
      v35 = *(unsigned int *)(a2 + 20);
      *(_QWORD *)(a2 + 160) = cmark_strbuf_detach(a2);
      *(_QWORD *)(a2 + 168) = v35 | 0x100000000;
      return v5;
    case 32774:
      v23 = *(unsigned int *)(a2 + 20);
      *(_QWORD *)(a2 + 144) = cmark_strbuf_detach(a2);
      *(_QWORD *)(a2 + 152) = v23 | 0x100000000;
      return v5;
    case 32776:
      if ((resolve_reference_link_definitions(a1, a2) & 1) == 0 && (*(_BYTE *)(a1 + 122) & 0xC) == 0)
        cmark_node_free((_QWORD *)a2);
      return v5;
    default:
      return v5;
  }
}

uint64_t cmark_manage_extensions_special_characters(uint64_t result, int a2)
{
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t **i;
  _BOOL4 v7;
  unsigned int v8;

  v2 = *(_QWORD **)(result + 144);
  if (v2)
  {
    v4 = result;
    do
    {
      v5 = v2[1];
      for (i = *(uint64_t ***)(v5 + 32); i; i = (uint64_t **)*i)
      {
        v7 = *(_BYTE *)(v5 + 56) != 0;
        v8 = *((unsigned __int8 *)i + 8);
        if (a2)
          result = cmark_inlines_add_special_character(v4, v8, v7);
        else
          result = cmark_inlines_remove_special_character(v4, v8, v7);
      }
      v2 = (_QWORD *)*v2;
    }
    while (v2);
  }
  return result;
}

uint64_t cmark_inlines_remove_special_character(uint64_t result, unsigned int a2, int a3)
{
  *(_BYTE *)(*(_QWORD *)(result + 168) + a2) = 0;
  if (a3)
    *(_BYTE *)(*(_QWORD *)(result + 160) + a2) = 0;
  return result;
}

uint64_t cmark_inlines_add_special_character(uint64_t result, unsigned int a2, int a3)
{
  *(_BYTE *)(*(_QWORD *)(result + 168) + a2) = 1;
  if (a3)
    *(_BYTE *)(*(_QWORD *)(result + 160) + a2) = 1;
  return result;
}

uint64_t resolve_reference_link_definitions(uint64_t a1, uint64_t a2)
{
  _BYTE *v3;
  unsigned int v4;
  int v6;
  uint64_t v7;
  unsigned __int8 *v8;
  int v9;
  int v10;
  uint64_t result;
  __int128 v12;

  v3 = *(_BYTE **)(a2 + 8);
  *(_QWORD *)&v12 = v3;
  v4 = *(_DWORD *)(a2 + 20);
  *((_QWORD *)&v12 + 1) = v4;
  if (v4)
  {
    do
    {
      if (*v3 == 91)
      {
        v6 = cmark_parse_reference_inline(*(_QWORD *)a1, &v12, *(uint64_t **)(a1 + 8));
        if (v6)
          goto LABEL_8;
        v4 = DWORD2(v12);
        if (!DWORD2(v12))
          break;
      }
      if (*(_BYTE *)v12 != 94 || *(_BYTE *)(v12 + 1) != 91)
        break;
      v6 = cmark_parse_reference_attributes_inline(*(_QWORD *)a1, &v12, *(uint64_t **)(a1 + 8));
      if (!v6)
      {
        v4 = DWORD2(v12);
        break;
      }
LABEL_8:
      v3 = (_BYTE *)(v12 + v6);
      *(_QWORD *)&v12 = v3;
      v4 = DWORD2(v12) - v6;
      DWORD2(v12) -= v6;
    }
    while (DWORD2(v12));
  }
  cmark_strbuf_drop((void *)a2, *(_DWORD *)(a2 + 20) - v4);
  v7 = *(unsigned int *)(a2 + 20);
  if ((int)v7 < 1)
    return 0;
  v8 = *(unsigned __int8 **)(a2 + 8);
  while (1)
  {
    v10 = *v8++;
    v9 = v10;
    if (v10 > 12)
      break;
    if (v9 != 9)
    {
      result = 0;
      if (v9 == 10)
        return result;
      return 1;
    }
LABEL_17:
    if (!--v7)
      return 0;
  }
  if (v9 == 32)
    goto LABEL_17;
  result = 0;
  if (v9 == 13)
    return result;
  return 1;
}

_QWORD *postprocess(uint64_t a1, uint64_t (***a2)(uint64_t, uint64_t), _QWORD *a3)
{
  uint64_t v5;
  BOOL v7;
  int v8;
  uint64_t node;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  _BYTE *v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unsigned __int8 v28;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unsigned __int8 v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  _QWORD *v39;
  _BYTE *v40;
  _BYTE *v41;
  _QWORD *v42;
  _BYTE *v43;
  _BYTE *v44;
  size_t v45;
  _BYTE *v46;
  _BYTE *v47;
  size_t v48;
  _QWORD *v49;
  uint64_t v50;
  int v51;
  BOOL v52;
  int v53;
  uint64_t (***v54)(uint64_t, uint64_t);
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  uint64_t v64;
  char v65;
  uint64_t v66[2];
  uint64_t v67;

  cmark_consolidate_text_nodes(a3);
  v49 = a3;
  v5 = cmark_iter_new((uint64_t)a3);
  v51 = cmark_iter_next(v5);
  if (v51 == 1)
    goto LABEL_2;
  v7 = 0;
  v54 = a2;
  v50 = v5;
LABEL_4:
  v8 = v51;
  v52 = v7;
  do
  {
    node = cmark_iter_get_node(v5);
    v10 = node;
    if (v7)
    {
      if (v51 == 3)
      {
        v7 = *(unsigned __int16 *)(node + 100) != 49161;
        goto LABEL_79;
      }
LABEL_78:
      v7 = 1;
LABEL_79:
      v51 = cmark_iter_next(v5);
      if (v51 == 1)
        break;
      goto LABEL_4;
    }
    if (v8 != 2)
      goto LABEL_74;
    v11 = *(unsigned __int16 *)(node + 100);
    if (v11 != 49153)
    {
      if (v11 != 49161)
        goto LABEL_74;
      goto LABEL_78;
    }
    v12 = *(_QWORD *)(node + 144);
    v13 = *(unsigned int *)(node + 152);
    v14 = *(_DWORD *)(node + 156);
    *(_QWORD *)(node + 152) = v13;
    if (!(_DWORD)v13)
      goto LABEL_70;
    v53 = v14;
    v15 = 0;
    v16 = 0;
    v17 = (int)v13;
    v57 = v12 - 1;
    v58 = node;
    v56 = v12 + 1;
    v60 = v12;
    do
    {
      v18 = v12 + v15;
      v19 = (_BYTE *)(v12 + v15 + v16);
      v20 = memchr(v19, 64, v17 - v16);
      if (!v20)
        break;
      v21 = v20 - v19;
      if (v20 == v19)
        goto LABEL_50;
      v62 = v17;
      v22 = 0;
      v23 = 0;
      v24 = v57 + v15;
      v59 = v56 + v15;
      v65 = 1;
      v64 = v15;
      v55 = v57 + v15;
LABEL_15:
      v25 = 0;
      v61 = v16 + v21 + v15;
      v63 = v16 + v21;
      v26 = v16 + v21 + v18;
      v27 = v24 + v16;
      do
      {
        v28 = *(_BYTE *)(v27 + v21);
        if (!cmark_isalnum(v28) && !memchr(".+-_", v28, 5uLL))
        {
          if (v28 != 58 && v28 != 0)
            goto LABEL_29;
          if (validate_protocol("mailto:", v16 + v21 + v18, v25, v21))
          {
            v65 = 0;
          }
          else
          {
            if (!validate_protocol("xmpp:", v16 + v21 + v18, v25, v21))
              goto LABEL_29;
            v65 = 0;
            v23 = 1;
          }
        }
        --v27;
        ++v25;
      }
      while (v21 != v25);
      v25 = v21;
LABEL_29:
      v15 = v64;
      v17 = v62;
      if (!v25)
      {
LABEL_50:
        v16 += v21 + 1;
        v12 = v60;
        continue;
      }
      if (*(_BYTE *)(v60 + v61) != 64)
        postprocess_cold_2();
      v30 = v62 - v63;
      if (v62 - v63 < 2)
      {
        v32 = 1;
        v12 = v60;
LABEL_63:
        v15 = v64;
        v17 = v62;
        v16 = v32 + v63;
        continue;
      }
      v31 = v59 + v63;
      v32 = 1;
      while (1)
      {
        v33 = *(_BYTE *)(v31 + v32 - 1);
        if (!cmark_isalnum(v33))
        {
          if (v33 <= 0x2Eu)
          {
            if (v33 != 45)
            {
              if (v33 != 46 || v32 >= v30 - 1 || !cmark_isalnum(*(_BYTE *)(v31 + v32)))
                goto LABEL_51;
              ++v22;
            }
            goto LABEL_34;
          }
          if (v33 == 47)
          {
            if ((v23 & 1) == 0)
              goto LABEL_51;
            goto LABEL_34;
          }
          if (v33 != 95)
            break;
        }
LABEL_34:
        if (v30 == ++v32)
        {
          v32 = v62 - v63;
          goto LABEL_51;
        }
      }
      if (v33 == 64)
      {
        v15 = v64;
        v16 = v63 + 1;
        v21 = v32 - 1;
        v24 = v55;
        if (v21)
          goto LABEL_15;
        v17 = v62;
        goto LABEL_50;
      }
LABEL_51:
      v12 = v60;
      if (v32 < 2)
        goto LABEL_63;
      if (!v22)
        goto LABEL_63;
      v34 = v61 + v32 - 1;
      if (!cmark_isalpha(*(_BYTE *)(v60 + v34)) && *(_BYTE *)(v60 + v34) != 46)
        goto LABEL_63;
      v35 = autolink_delim(v26, v32);
      if (v35)
      {
        v36 = v35;
        v37 = (_QWORD *)cmark_node_new_with_mem(0xC009u, *v54);
        v66[1] = 0;
        v67 = 0;
        v66[0] = 0;
        cmark_strbuf_init((uint64_t)*v54, v66, 10);
        if ((v65 & 1) != 0)
          cmark_strbuf_puts(v66, "mailto:");
        cmark_strbuf_put(v66, (const void *)(v26 - v25), v36 + v25);
        v38 = HIDWORD(v67);
        v37[18] = cmark_strbuf_detach((uint64_t)v66);
        v37[19] = v38 | 0x100000000;
        v39 = (_QWORD *)cmark_node_new_with_mem(0xC001u, *v54);
        v40 = (_BYTE *)(**v54)((uint64_t)(((v36 + v25) << 32) + 0x100000000) >> 32, 1);
        v41 = v40;
        if ((int)v36 + (int)v25 >= 1)
          memcpy(v40, (const void *)(v60 + (int)v61 - (int)v25), (v36 + v25));
        v41[(int)v36 + (int)v25] = 0;
        v39[18] = v41;
        v39[19] = (v36 + v25) | 0x100000000;
        cmark_node_append_child(v37, v39);
        cmark_node_insert_after(v58, v37);
        v42 = (_QWORD *)cmark_node_new_with_mem(0xC001u, *v54);
        v42[18] = v60 + (int)v36 + (int)v61;
        v42[19] = (v62 - (v36 + v63));
        cmark_node_insert_after((uint64_t)v37, v42);
        *(_QWORD *)(v58 + 144) = v60 + (int)v64;
        *(_QWORD *)(v58 + 152) = (v63 - v25);
        v43 = (_BYTE *)(**v54)((int)v63 - (int)v25 + 1, 1);
        v44 = v43;
        v45 = *(unsigned int *)(v58 + 152);
        if ((int)v45 >= 1)
        {
          memcpy(v43, *(const void **)(v58 + 144), v45);
          LODWORD(v45) = *(_DWORD *)(v58 + 152);
        }
        v16 = 0;
        v44[(int)v45] = 0;
        *(_QWORD *)(v58 + 144) = v44;
        v15 = v36 + v63 + v64;
        *(_DWORD *)(v58 + 156) = 1;
        v58 = (uint64_t)v42;
        v17 = v62 - (v36 + v63);
      }
      else
      {
        v15 = v64;
        v16 = v63 + 1;
        v17 = v62;
      }
    }
    while (v16 < v17);
    v10 = v58;
    a2 = v54;
    if (*(_DWORD *)(v58 + 156))
      postprocess_cold_1();
    LODWORD(v13) = *(_DWORD *)(v58 + 152);
    v5 = v50;
    v7 = v52;
    v14 = v53;
LABEL_70:
    v46 = (_BYTE *)(**a2)((int)v13 + 1, 1);
    v47 = v46;
    v48 = *(unsigned int *)(v10 + 152);
    if ((int)v48 >= 1)
    {
      memcpy(v46, *(const void **)(v10 + 144), v48);
      LODWORD(v48) = *(_DWORD *)(v10 + 152);
    }
    v47[(int)v48] = 0;
    *(_QWORD *)(v10 + 144) = v47;
    *(_DWORD *)(v10 + 156) = 1;
    if (v14)
      ((void (*)(uint64_t))(*a2)[2])(v12);
LABEL_74:
    v8 = cmark_iter_next(v5);
  }
  while (v8 != 1);
LABEL_2:
  cmark_iter_free(v5);
  return v49;
}

uint64_t cmark_iter_get_node(uint64_t a1)
{
  return *(_QWORD *)(a1 + 24);
}

_QWORD *cmark_consolidate_text_nodes(_QWORD *result)
{
  _QWORD *v1;
  uint64_t (**v2)(uint64_t, uint64_t);
  uint64_t v3;
  int i;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[2];
  uint64_t v12;

  if (result)
  {
    v1 = result;
    v2 = (uint64_t (**)(uint64_t, uint64_t))*result;
    v3 = (*(uint64_t (**)(uint64_t, uint64_t))*result)(1, 48);
    *(_QWORD *)v3 = v2;
    *(_QWORD *)(v3 + 8) = v1;
    *(_DWORD *)(v3 + 16) = 0;
    *(_QWORD *)(v3 + 24) = 0;
    *(_DWORD *)(v3 + 32) = 2;
    *(_QWORD *)(v3 + 40) = v1;
    v11[0] = v2;
    v11[1] = &cmark_strbuf__initbuf;
    v12 = 0;
    for (i = cmark_iter_next(v3); i != 1; i = cmark_iter_next(v3))
    {
      if (i == 2)
      {
        v5 = *(_QWORD *)(v3 + 24);
        if (*(unsigned __int16 *)(v5 + 100) == 49153)
        {
          v6 = *(_QWORD *)(v5 + 24);
          if (v6)
          {
            if (*(unsigned __int16 *)(v6 + 100) == 49153)
            {
              cmark_strbuf_clear((uint64_t)v11);
              v7 = (_QWORD *)(v5 + 144);
              cmark_strbuf_put(v11, *(const void **)(v5 + 144), *(_DWORD *)(v5 + 152));
              v8 = *(_QWORD *)(v5 + 24);
              if (v8)
              {
                do
                {
                  if (*(unsigned __int16 *)(v8 + 100) != 49153)
                    break;
                  cmark_iter_next(v3);
                  cmark_strbuf_put(v11, *(const void **)(v8 + 144), *(_DWORD *)(v8 + 152));
                  *(_DWORD *)(v5 + 92) = *(_DWORD *)(v8 + 92);
                  v9 = *(_QWORD *)(v8 + 24);
                  cmark_node_free((_QWORD *)v8);
                  v8 = v9;
                }
                while (v9);
              }
              if (*(_DWORD *)(v5 + 156))
                (*(void (**)(_QWORD))(*(_QWORD *)v3 + 16))(*v7);
              *v7 = 0;
              *(_QWORD *)(v5 + 152) = 0;
              v10 = HIDWORD(v12);
              *(_QWORD *)(v5 + 144) = cmark_strbuf_detach((uint64_t)v11);
              *(_QWORD *)(v5 + 152) = v10 | 0x100000000;
            }
          }
        }
      }
    }
    cmark_strbuf_free((uint64_t)v11);
    return (_QWORD *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 16))(v3);
  }
  return result;
}

uint64_t cmark_iter_next(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  int v4;
  unsigned int v5;
  BOOL v6;
  int v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  int v11;

  result = *(unsigned int *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  *(_DWORD *)(a1 + 16) = result;
  *(_QWORD *)(a1 + 24) = v3;
  if ((_DWORD)result != 1)
  {
    if ((_DWORD)result == 2
      && (v4 = *(unsigned __int16 *)(v3 + 100), (v4 - 49153) >= 5)
      && ((v5 = v4 - 32773, v6 = v5 > 5, v7 = (1 << v5) & 0x23, !v6) ? (v8 = v7 == 0) : (v8 = 1), v8))
    {
      v10 = *(_QWORD *)(v3 + 48);
      if (!v10)
      {
        *(_DWORD *)(a1 + 32) = 3;
        return result;
      }
      v11 = 2;
    }
    else
    {
      if (v3 == *(_QWORD *)(a1 + 8))
      {
        *(_DWORD *)(a1 + 32) = 1;
        *(_QWORD *)(a1 + 40) = 0;
        return result;
      }
      v9 = *(_QWORD *)(v3 + 24);
      if (v9)
      {
        *(_DWORD *)(a1 + 32) = 2;
        *(_QWORD *)(a1 + 40) = v9;
        return result;
      }
      v10 = *(_QWORD *)(v3 + 40);
      if (!v10)
        cmark_iter_next_cold_1();
      v11 = 3;
    }
    *(_DWORD *)(a1 + 32) = v11;
    *(_QWORD *)(a1 + 40) = v10;
  }
  return result;
}

void *cmark_strbuf_drop(void *result, int a2)
{
  _DWORD *v2;
  int v3;
  int v4;
  int v5;

  if (a2 >= 1)
  {
    v2 = result;
    v3 = *((_DWORD *)result + 5);
    if (v3 >= a2)
      v4 = a2;
    else
      v4 = *((_DWORD *)result + 5);
    v5 = v3 - v4;
    *((_DWORD *)result + 5) = v3 - v4;
    if (v3 > a2)
    {
      result = memmove(*((void **)result + 1), (const void *)(*((_QWORD *)result + 1) + v4), v5);
      v5 = v2[5];
    }
    *(_BYTE *)(*((_QWORD *)v2 + 1) + v5) = 0;
  }
  return result;
}

uint64_t cmark_parser_free(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)a1;
  if (*(_QWORD *)(a1 + 144))
  {
    (*(void (**)(_QWORD))(v2 + 16))(*(_QWORD *)(a1 + 168));
    (*(void (**)(_QWORD))(v2 + 16))(*(_QWORD *)(a1 + 160));
  }
  cmark_parser_dispose(a1);
  cmark_strbuf_free(a1 + 64);
  cmark_strbuf_free(a1 + 96);
  cmark_llist_free(*(_QWORD *)a1, *(_QWORD **)(a1 + 136));
  cmark_llist_free(*(_QWORD *)a1, *(_QWORD **)(a1 + 144));
  return (*(uint64_t (**)(uint64_t))(v2 + 16))(a1);
}

uint64_t cmark_map_free(uint64_t result)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  if (result)
  {
    v1 = result;
    v2 = *(_QWORD **)(result + 8);
    if (v2)
    {
      do
      {
        v3 = (_QWORD *)*v2;
        (*(void (**)(uint64_t))(v1 + 48))(v1);
        v2 = v3;
      }
      while (v3);
    }
    (*(void (**)(_QWORD, _QWORD *))(*(_QWORD *)v1 + 16))(*(_QWORD *)(v1 + 16), v2);
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 16))(v1);
  }
  return result;
}

_QWORD *cmark_syntax_extension_new(const char *a1)
{
  _QWORD *v2;
  size_t v3;
  char *v4;

  v2 = CMARK_DEFAULT_MEM_ALLOCATOR(1uLL, 0xB8uLL);
  v3 = strlen(a1);
  v4 = (char *)CMARK_DEFAULT_MEM_ALLOCATOR(v3 + 1, 1uLL);
  v2[5] = v4;
  strcpy(v4, a1);
  return v2;
}

uint64_t cmark_parser_attach_syntax_extension(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;

  *(_QWORD *)(a1 + 136) = cmark_llist_append(*(uint64_t (***)(uint64_t, uint64_t))a1, *(_QWORD **)(a1 + 136), a2);
  if (*(_QWORD *)(a2 + 16) || *(_QWORD *)(a2 + 24))
  {
    v4 = *(_QWORD **)(a1 + 144);
    if (!v4)
    {
      *(_QWORD *)(a1 + 160) = (**(uint64_t (***)(uint64_t, uint64_t))a1)(1, 256);
      cmark_set_default_skip_chars((__int128 **)(a1 + 160), 1);
      *(_QWORD *)(a1 + 168) = (**(uint64_t (***)(uint64_t, uint64_t))a1)(1, 256);
      cmark_set_default_special_chars((__int128 **)(a1 + 168), 1);
      v4 = *(_QWORD **)(a1 + 144);
    }
    *(_QWORD *)(a1 + 144) = cmark_llist_append(*(uint64_t (***)(uint64_t, uint64_t))a1, v4, a2);
  }
  return 1;
}

_QWORD *cmark_llist_append(uint64_t (**a1)(uint64_t, uint64_t), _QWORD *a2, uint64_t a3)
{
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;

  v5 = (_QWORD *)(*a1)(1, 16);
  *v5 = 0;
  v5[1] = a3;
  if (!a2)
    return v5;
  v6 = a2;
  do
  {
    v7 = v6;
    v6 = (_QWORD *)*v6;
  }
  while (v6);
  *v7 = v5;
  return a2;
}

void *xcalloc(size_t a1, size_t a2)
{
  void *result;

  result = malloc_type_calloc(a1, a2, 0xA9181AE9uLL);
  if (!result)
    xcalloc_cold_1();
  return result;
}

uint64_t cmark_node_free(_QWORD *a1)
{
  _QWORD *v1;
  void (*v2)(_QWORD);
  uint64_t v3;
  void (*v4)(void);
  uint64_t v5;
  _QWORD *v6;
  uint64_t result;

  v1 = a1;
  S_node_unlink(a1);
  v1[3] = 0;
  do
  {
    cmark_strbuf_free((uint64_t)v1);
    if (v1[8])
    {
      v2 = (void (*)(_QWORD))v1[9];
      if (v2)
        v2(*v1);
    }
    if (v1[18])
    {
      v3 = v1[14];
      if (v3)
      {
        v4 = *(void (**)(void))(v3 + 168);
        if (v4)
          v4();
      }
    }
    free_node_as((uint64_t)v1);
    v5 = v1[7];
    v6 = (_QWORD *)v1[3];
    if (v5)
    {
      *(_QWORD *)(v5 + 24) = v6;
      v6 = (_QWORD *)v1[6];
      v1[3] = v6;
    }
    result = (*(uint64_t (**)(_QWORD *))(*v1 + 16))(v1);
    v1 = v6;
  }
  while (v6);
  return result;
}

uint64_t cmark_strbuf_free(uint64_t result)
{
  _QWORD *v1;

  if (result)
  {
    v1 = (_QWORD *)result;
    result = *(_QWORD *)(result + 8);
    if ((_UNKNOWN *)result != &cmark_strbuf__initbuf)
      result = (*(uint64_t (**)(void))(*v1 + 16))();
    v1[1] = &cmark_strbuf__initbuf;
    v1[2] = 0;
  }
  return result;
}

uint64_t free_node_as(uint64_t result)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  v1 = result;
  switch(*(_WORD *)(result + 100))
  {
    case 0xC001:
    case 0xC004:
    case 0xC005:
    case 0xC00B:
    case 0xC00C:
LABEL_7:
      v3 = (_QWORD *)(result + 144);
      if (!*(_DWORD *)(result + 156))
        goto LABEL_9;
      goto LABEL_8;
    case 0xC002:
    case 0xC003:
    case 0xC007:
    case 0xC008:
      return result;
    case 0xC006:
    case 0xC009:
    case 0xC00A:
LABEL_3:
      v2 = (_QWORD *)(result + 144);
      if (*(_DWORD *)(result + 156))
        result = (*(uint64_t (**)(_QWORD))(*(_QWORD *)result + 16))(*(_QWORD *)(result + 144));
      *v2 = 0;
      *(_QWORD *)(v1 + 152) = 0;
      v3 = (_QWORD *)(v1 + 160);
      if (*(_DWORD *)(v1 + 172))
LABEL_8:
        result = (*(uint64_t (**)(_QWORD))(*(_QWORD *)v1 + 16))(*v3);
LABEL_9:
      *v3 = 0;
      v3[1] = 0;
      break;
    default:
      switch(*(_WORD *)(result + 100))
      {
        case 0x8005:
        case 0x8007:
          goto LABEL_3;
        case 0x8006:
        case 0x800B:
          goto LABEL_7;
        default:
          return result;
      }
  }
  return result;
}

uint64_t cmark_find_syntax_extension(const char *a1)
{
  uint64_t *v2;
  uint64_t v3;

  pthread_once(&extensions_once, (void (*)(void))initialize_extensions);
  pthread_mutex_lock(&extensions_lock);
  v2 = &syntax_extensions;
  while (1)
  {
    v2 = (uint64_t *)*v2;
    if (!v2)
      break;
    v3 = v2[1];
    if (!strcmp(*(const char **)(v3 + 40), a1))
      goto LABEL_6;
  }
  v3 = 0;
LABEL_6:
  pthread_mutex_unlock(&extensions_lock);
  return v3;
}

uint64_t cmark_llist_free(uint64_t result, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;

  if (a2)
  {
    v2 = result;
    do
    {
      v3 = (_QWORD *)*a2;
      result = (*(uint64_t (**)(_QWORD *))(v2 + 16))(a2);
      a2 = v3;
    }
    while (v3);
  }
  return result;
}

_QWORD *S_node_unlink(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  if (result)
  {
    v1 = result[4];
    if (v1)
      *(_QWORD *)(v1 + 24) = result[3];
    v2 = result[3];
    if (v2)
      *(_QWORD *)(v2 + 32) = v1;
    v3 = result[5];
    if (v3)
    {
      if (*(_QWORD **)(v3 + 48) == result)
        *(_QWORD *)(v3 + 48) = v2;
      if (*(_QWORD **)(v3 + 56) == result)
        *(_QWORD *)(v3 + 56) = result[4];
    }
  }
  return result;
}

uint64_t cmark_parser_new_with_mem(int a1, uint64_t (**a2)(uint64_t, uint64_t))
{
  uint64_t v4;

  v4 = (*a2)(1, 176);
  *(_QWORD *)v4 = a2;
  *(_DWORD *)(v4 + 120) = a1;
  cmark_set_default_skip_chars((__int128 **)(v4 + 160), 0);
  cmark_set_default_special_chars((__int128 **)(v4 + 168), 0);
  cmark_parser_reset(v4);
  return v4;
}

__int128 **cmark_set_default_special_chars(__int128 **result, int a2)
{
  __int128 *v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  if (a2)
  {
    v2 = *result;
    v3 = cmark_set_default_special_chars_default_special_chars;
    v4 = *(_OWORD *)algn_254AA9550;
    v5 = unk_254AA9570;
    v2[2] = xmmword_254AA9560;
    v2[3] = v5;
    *v2 = v3;
    v2[1] = v4;
    v6 = xmmword_254AA9580;
    v7 = unk_254AA9590;
    v8 = unk_254AA95B0;
    v2[6] = xmmword_254AA95A0;
    v2[7] = v8;
    v2[4] = v6;
    v2[5] = v7;
    v9 = xmmword_254AA95C0;
    v10 = unk_254AA95D0;
    v11 = unk_254AA95F0;
    v2[10] = xmmword_254AA95E0;
    v2[11] = v11;
    v2[8] = v9;
    v2[9] = v10;
    v12 = xmmword_254AA9600;
    v13 = unk_254AA9610;
    v14 = unk_254AA9630;
    v2[14] = xmmword_254AA9620;
    v2[15] = v14;
    v2[12] = v12;
    v2[13] = v13;
  }
  else
  {
    *result = &cmark_set_default_special_chars_default_special_chars;
  }
  return result;
}

__int128 **cmark_set_default_skip_chars(__int128 **result, int a2)
{
  __int128 *v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  if (a2)
  {
    v2 = *result;
    v3 = cmark_set_default_skip_chars_default_skip_chars;
    v4 = unk_254AA9688;
    v5 = unk_254AA96A8;
    v2[2] = xmmword_254AA9698;
    v2[3] = v5;
    *v2 = v3;
    v2[1] = v4;
    v6 = xmmword_254AA96B8;
    v7 = unk_254AA96C8;
    v8 = unk_254AA96E8;
    v2[6] = xmmword_254AA96D8;
    v2[7] = v8;
    v2[4] = v6;
    v2[5] = v7;
    v9 = xmmword_254AA96F8;
    v10 = unk_254AA9708;
    v11 = unk_254AA9728;
    v2[10] = xmmword_254AA9718;
    v2[11] = v11;
    v2[8] = v9;
    v2[9] = v10;
    v12 = xmmword_254AA9738;
    v13 = unk_254AA9748;
    v14 = unk_254AA9768;
    v2[14] = xmmword_254AA9758;
    v2[15] = v14;
    v2[12] = v12;
    v2[13] = v13;
  }
  else
  {
    *result = &cmark_set_default_skip_chars_default_skip_chars;
  }
  return result;
}

_DWORD *add_line(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6;
  BOOL v7;
  int v8;
  int v9;
  int v10;
  int v11;

  if ((*(_WORD *)(a1 + 102) & 1) == 0)
    add_line_cold_1();
  if (*(_BYTE *)(a3 + 61))
  {
    v6 = *(_DWORD *)(a3 + 40);
    ++*(_DWORD *)(a3 + 36);
    v7 = -v6 < 0;
    v8 = -v6 & 3;
    v9 = v6 & 3;
    if (v7)
      v10 = v9;
    else
      v10 = -v8;
    v11 = v10 - 4;
    do
      cmark_strbuf_putc(a1, 32);
    while (!__CFADD__(v11++, 1));
  }
  return cmark_strbuf_put((_DWORD *)a1, (const void *)(*(_QWORD *)a2 + *(int *)(a3 + 36)), *(_DWORD *)(a2 + 8) - *(_DWORD *)(a3 + 36));
}

uint64_t add_child(uint64_t a1, uint64_t a2, int a3, int a4)
{
  uint64_t i;
  uint64_t (**v8)(_QWORD, _QWORD);
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;

  if (!a2)
    add_child_cold_1();
  for (i = a2; !cmark_node_can_contain_type(i, a3); i = finalize(a1, i))
    ;
  v8 = *(uint64_t (***)(_QWORD, _QWORD))a1;
  v9 = *(_DWORD *)(a1 + 32);
  v10 = (**(uint64_t (***)(uint64_t, uint64_t))a1)(1, 184);
  cmark_strbuf_init((uint64_t)v8, (uint64_t *)v10, 32);
  *(_WORD *)(v10 + 100) = a3;
  *(_WORD *)(v10 + 102) = 1;
  *(_DWORD *)(v10 + 80) = v9;
  *(_DWORD *)(v10 + 84) = a4;
  *(_DWORD *)(v10 + 88) = v9;
  *(_QWORD *)(v10 + 40) = i;
  v11 = *(_QWORD *)(i + 56);
  v12 = (uint64_t *)(i + 48);
  if (v11)
    v12 = (uint64_t *)(v11 + 24);
  *v12 = v10;
  *(_QWORD *)(v10 + 32) = v11;
  *(_QWORD *)(i + 56) = v10;
  return v10;
}

BOOL cmark_node_can_contain_type(uint64_t a1, int a2)
{
  _BOOL8 result;
  uint64_t v5;
  unsigned int (*v6)(void);
  int v7;
  BOOL v8;

  if (a2 == 32769)
    return 0;
  v5 = *(_QWORD *)(a1 + 112);
  if (v5)
  {
    v6 = *(unsigned int (**)(void))(v5 + 80);
    if (v6)
      return v6() != 0;
  }
  v7 = *(unsigned __int16 *)(a1 + 100);
  result = 1;
  switch(*(_WORD *)(a1 + 100))
  {
    case 0x8001:
    case 0x8002:
    case 0x8004:
    case 0x800B:
      v8 = a2 != 32772 && (a2 & 0xC000) == 0x8000;
      goto LABEL_15;
    case 0x8003:
      v8 = a2 == 32772;
      goto LABEL_15;
    case 0x8005:
    case 0x8006:
    case 0x800A:
      return 0;
    case 0x8007:
      return result;
    case 0x8008:
    case 0x8009:
      goto LABEL_14;
    default:
      if ((v7 - 49158) > 6 || v7 == 49163)
        return 0;
LABEL_14:
      v8 = (~a2 & 0xC000) == 0;
LABEL_15:
      result = v8;
      break;
  }
  return result;
}

uint64_t S_find_first_nonspace(uint64_t result, uint64_t *a2)
{
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  int v7;
  BOOL v9;
  int v10;
  int v11;
  int v12;

  v2 = *(int *)(result + 44);
  v3 = *(_DWORD *)(result + 36);
  if ((int)v2 <= v3)
  {
    v5 = *(_DWORD *)(result + 40);
    if (v5 <= 0)
      v10 = -(-v5 & 3);
    else
      v10 = *(_DWORD *)(result + 40) & 3;
    v11 = 4 - v10;
    *(_DWORD *)(result + 44) = v3;
    *(_DWORD *)(result + 48) = v5;
    v6 = *a2;
    v4 = v5;
    while (1)
    {
      while (1)
      {
        v2 = v3;
        v12 = *(unsigned __int8 *)(v6 + v3);
        if (v12 != 9)
          break;
        v3 = v2 + 1;
        v4 += v11;
        *(_DWORD *)(result + 44) = v2 + 1;
        *(_DWORD *)(result + 48) = v4;
        v11 = 4;
      }
      if (v12 != 32)
        break;
      v3 = v2 + 1;
      ++v4;
      *(_DWORD *)(result + 44) = v2 + 1;
      *(_DWORD *)(result + 48) = v4;
      if (!--v11)
        v11 = 4;
    }
  }
  else
  {
    v4 = *(_DWORD *)(result + 48);
    v5 = *(_DWORD *)(result + 40);
    v6 = *a2;
  }
  *(_DWORD *)(result + 56) = v4 - v5;
  v7 = *(unsigned __int8 *)(v6 + v2);
  v9 = v7 == 10 || v7 == 13;
  *(_BYTE *)(result + 60) = v9;
  return result;
}

BOOL cmark_isalnum(unsigned __int8 a1)
{
  return cmark_ctype_class[a1] - 3 < 2;
}

uint64_t core_extensions_registration(_QWORD **a1)
{
  _QWORD *table_extension;
  _QWORD *strikethrough_extension;
  _QWORD *autolink_extension;
  _QWORD *tagfilter_extension;
  _QWORD *tasklist_extension;

  table_extension = create_table_extension();
  cmark_plugin_register_syntax_extension(a1, (uint64_t)table_extension);
  strikethrough_extension = create_strikethrough_extension();
  cmark_plugin_register_syntax_extension(a1, (uint64_t)strikethrough_extension);
  autolink_extension = create_autolink_extension();
  cmark_plugin_register_syntax_extension(a1, (uint64_t)autolink_extension);
  tagfilter_extension = create_tagfilter_extension();
  cmark_plugin_register_syntax_extension(a1, (uint64_t)tagfilter_extension);
  tasklist_extension = create_tasklist_extension();
  cmark_plugin_register_syntax_extension(a1, (uint64_t)tasklist_extension);
  return 1;
}

uint64_t cmark_plugin_register_syntax_extension(_QWORD **a1, uint64_t a2)
{
  *a1 = cmark_llist_append((uint64_t (**)(uint64_t, uint64_t))&CMARK_DEFAULT_MEM_ALLOCATOR, *a1, a2);
  return 1;
}

_QWORD *create_tagfilter_extension()
{
  _QWORD *v0;

  v0 = cmark_syntax_extension_new("tagfilter");
  cmark_syntax_extension_set_html_filter_func((uint64_t)v0, (uint64_t)filter);
  return v0;
}

_QWORD *create_strikethrough_extension()
{
  _QWORD *v0;
  uint64_t (**default_mem_allocator)();
  _QWORD *v2;

  v0 = cmark_syntax_extension_new("strikethrough");
  cmark_syntax_extension_set_get_type_string_func((uint64_t)v0, (uint64_t)get_type_string_0);
  cmark_syntax_extension_set_can_contain_func((uint64_t)v0, (uint64_t)can_contain_0);
  cmark_syntax_extension_set_commonmark_render_func((uint64_t)v0, (uint64_t)commonmark_render_0);
  cmark_syntax_extension_set_latex_render_func((uint64_t)v0, (uint64_t)latex_render);
  cmark_syntax_extension_set_man_render_func((uint64_t)v0, (uint64_t)man_render);
  cmark_syntax_extension_set_html_render_func((uint64_t)v0, (uint64_t)html_render_0);
  cmark_syntax_extension_set_plaintext_render_func((uint64_t)v0, (uint64_t)plaintext_render);
  CMARK_NODE_STRIKETHROUGH = cmark_syntax_extension_add_node(1);
  cmark_syntax_extension_set_match_inline_func((uint64_t)v0, (uint64_t)match_0);
  cmark_syntax_extension_set_inline_from_delim_func((uint64_t)v0, (uint64_t)insert);
  default_mem_allocator = cmark_get_default_mem_allocator();
  v2 = cmark_llist_append((uint64_t (**)(uint64_t, uint64_t))default_mem_allocator, 0, 126);
  cmark_syntax_extension_set_special_inline_chars((uint64_t)v0, (uint64_t)v2);
  cmark_syntax_extension_set_emphasis((uint64_t)v0, 1);
  return v0;
}

_QWORD *create_table_extension()
{
  _QWORD *v0;

  v0 = cmark_syntax_extension_new("table");
  cmark_register_node_flag(&CMARK_NODE__TABLE_VISITED);
  cmark_syntax_extension_set_match_block_func(v0, (uint64_t)matches_0);
  cmark_syntax_extension_set_open_block_func((uint64_t)v0, (uint64_t)try_opening_table_block);
  cmark_syntax_extension_set_get_type_string_func((uint64_t)v0, (uint64_t)get_type_string_1);
  cmark_syntax_extension_set_can_contain_func((uint64_t)v0, (uint64_t)can_contain_1);
  cmark_syntax_extension_set_contains_inlines_func((uint64_t)v0, (uint64_t)contains_inlines);
  cmark_syntax_extension_set_commonmark_render_func((uint64_t)v0, (uint64_t)commonmark_render_1);
  cmark_syntax_extension_set_plaintext_render_func((uint64_t)v0, (uint64_t)commonmark_render_1);
  cmark_syntax_extension_set_latex_render_func((uint64_t)v0, (uint64_t)latex_render_0);
  cmark_syntax_extension_set_xml_attr_func((uint64_t)v0, (uint64_t)xml_attr_0);
  cmark_syntax_extension_set_man_render_func((uint64_t)v0, (uint64_t)man_render_0);
  cmark_syntax_extension_set_html_render_func((uint64_t)v0, (uint64_t)html_render_1);
  cmark_syntax_extension_set_opaque_alloc_func((uint64_t)v0, (uint64_t)opaque_alloc);
  cmark_syntax_extension_set_opaque_free_func((uint64_t)v0, (uint64_t)opaque_free);
  cmark_syntax_extension_set_commonmark_escape_func((uint64_t)v0, (uint64_t)escape);
  CMARK_NODE_TABLE = cmark_syntax_extension_add_node(0);
  CMARK_NODE_TABLE_ROW = cmark_syntax_extension_add_node(0);
  CMARK_NODE_TABLE_CELL = cmark_syntax_extension_add_node(0);
  return v0;
}

uint64_t cmark_syntax_extension_add_node(int a1)
{
  _DWORD *v1;
  uint64_t result;

  v1 = &CMARK_NODE_LAST_INLINE;
  if (!a1)
    v1 = &CMARK_NODE_LAST_BLOCK;
  if ((~*v1 & 0x3FFF) == 0)
    cmark_syntax_extension_add_node_cold_1();
  result = (*v1 + 1);
  *v1 = result;
  return result;
}

uint64_t cmark_syntax_extension_set_man_render_func(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 128) = a2;
  return result;
}

uint64_t cmark_syntax_extension_set_latex_render_func(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 112) = a2;
  return result;
}

_QWORD *create_tasklist_extension()
{
  _QWORD *v0;

  v0 = cmark_syntax_extension_new("tasklist");
  cmark_syntax_extension_set_match_block_func(v0, (uint64_t)matches);
  cmark_syntax_extension_set_get_type_string_func((uint64_t)v0, (uint64_t)get_type_string);
  cmark_syntax_extension_set_open_block_func((uint64_t)v0, (uint64_t)open_tasklist_item);
  cmark_syntax_extension_set_can_contain_func((uint64_t)v0, (uint64_t)can_contain);
  cmark_syntax_extension_set_commonmark_render_func((uint64_t)v0, (uint64_t)commonmark_render);
  cmark_syntax_extension_set_plaintext_render_func((uint64_t)v0, (uint64_t)commonmark_render);
  cmark_syntax_extension_set_html_render_func((uint64_t)v0, (uint64_t)html_render);
  cmark_syntax_extension_set_xml_attr_func((uint64_t)v0, (uint64_t)xml_attr);
  return v0;
}

uint64_t cmark_syntax_extension_set_plaintext_render_func(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 104) = a2;
  return result;
}

uint64_t cmark_syntax_extension_set_html_render_func(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 136) = a2;
  return result;
}

uint64_t cmark_syntax_extension_set_get_type_string_func(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 72) = a2;
  return result;
}

uint64_t cmark_syntax_extension_set_commonmark_render_func(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 96) = a2;
  return result;
}

uint64_t cmark_syntax_extension_set_can_contain_func(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 80) = a2;
  return result;
}

uint64_t cmark_syntax_extension_set_xml_attr_func(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 120) = a2;
  return result;
}

uint64_t cmark_syntax_extension_set_open_block_func(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 8) = a2;
  return result;
}

_QWORD *cmark_syntax_extension_set_match_block_func(_QWORD *result, uint64_t a2)
{
  *result = a2;
  return result;
}

_QWORD *create_autolink_extension()
{
  _QWORD *v0;
  uint64_t (**default_mem_allocator)();
  _QWORD *v2;
  _QWORD *v3;

  v0 = cmark_syntax_extension_new("autolink");
  cmark_syntax_extension_set_match_inline_func((uint64_t)v0, (uint64_t)match);
  cmark_syntax_extension_set_postprocess_func((uint64_t)v0, (uint64_t)postprocess);
  default_mem_allocator = cmark_get_default_mem_allocator();
  v2 = cmark_llist_append((uint64_t (**)(uint64_t, uint64_t))default_mem_allocator, 0, 58);
  v3 = cmark_llist_append((uint64_t (**)(uint64_t, uint64_t))default_mem_allocator, v2, 119);
  cmark_syntax_extension_set_special_inline_chars((uint64_t)v0, (uint64_t)v3);
  return v0;
}

uint64_t cmark_syntax_extension_set_special_inline_chars(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 32) = a2;
  return result;
}

uint64_t cmark_syntax_extension_set_match_inline_func(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 16) = a2;
  return result;
}

uint64_t (**cmark_get_default_mem_allocator())()
{
  return &CMARK_DEFAULT_MEM_ALLOCATOR;
}

uint64_t cmark_syntax_extension_set_postprocess_func(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 152) = a2;
  return result;
}

uint64_t cmark_syntax_extension_set_opaque_free_func(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 168) = a2;
  return result;
}

uint64_t cmark_syntax_extension_set_opaque_alloc_func(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 160) = a2;
  return result;
}

uint64_t cmark_syntax_extension_set_inline_from_delim_func(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 24) = a2;
  return result;
}

uint64_t cmark_syntax_extension_set_html_filter_func(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 144) = a2;
  return result;
}

uint64_t cmark_syntax_extension_set_emphasis(uint64_t result, int a2)
{
  *(_BYTE *)(result + 56) = a2 == 1;
  return result;
}

uint64_t cmark_syntax_extension_set_contains_inlines_func(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 88) = a2;
  return result;
}

uint64_t cmark_syntax_extension_set_commonmark_escape_func(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 176) = a2;
  return result;
}

uint64_t cmark_register_node_flag(_WORD *a1)
{
  __int16 v2;

  pthread_once(&nextflag_once, (void (*)(void))initialize_nextflag);
  pthread_mutex_lock(&nextflag_lock);
  if (*a1)
    cmark_register_node_flag_cold_2();
  v2 = cmark_register_node_flag_nextflag;
  if (!cmark_register_node_flag_nextflag)
    cmark_register_node_flag_cold_1();
  *a1 = cmark_register_node_flag_nextflag;
  cmark_register_node_flag_nextflag = 2 * v2;
  return pthread_mutex_unlock(&nextflag_lock);
}

uint64_t cmark_plugin_steal_syntax_extensions(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  *a1 = 0;
  return v1;
}

_QWORD *cmark_plugin_new()
{
  _QWORD *result;

  result = CMARK_DEFAULT_MEM_ALLOCATOR(1uLL, 8uLL);
  *result = 0;
  return result;
}

uint64_t _scan_at(uint64_t (*a1)(uint64_t), uint64_t *a2, int a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t result;
  char v7;

  v3 = *a2;
  if (!*a2)
    return 0;
  v5 = *((int *)a2 + 2);
  if ((int)v5 < a3)
    return 0;
  v7 = *(_BYTE *)(v3 + v5);
  *(_BYTE *)(v3 + v5) = 0;
  result = a1(v3 + a3);
  *(_BYTE *)(v3 + *((int *)a2 + 2)) = v7;
  return result;
}

uint64_t initialize_nextflag()
{
  return pthread_mutex_init(&nextflag_lock, 0);
}

uint64_t initialize_extensions()
{
  return pthread_mutex_init(&extensions_lock, 0);
}

void register_plugins()
{
  cmark_register_plugin((unsigned int (*)(void))core_extensions_registration);
}

uint64_t cmark_gfm_core_extensions_ensure_registered()
{
  return pthread_once(&registered_once, register_plugins);
}

void cmark_plugin_free(_QWORD **a1)
{
  cmark_llist_free_full((uint64_t)&CMARK_DEFAULT_MEM_ALLOCATOR, *a1, (void (*)(uint64_t, _QWORD))cmark_syntax_extension_free);
  ((void (__cdecl *)(void *))off_254AA9538)(a1);
}

uint64_t cmark_llist_free_full(uint64_t result, _QWORD *a2, void (*a3)(uint64_t, _QWORD))
{
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;

  if (a2)
  {
    v4 = a2;
    v5 = result;
    do
    {
      if (a3)
        a3(v5, v4[1]);
      v6 = (_QWORD *)*v4;
      result = (*(uint64_t (**)(_QWORD *))(v5 + 16))(v4);
      v4 = v6;
    }
    while (v6);
  }
  return result;
}

_BYTE *cmark_node_get_literal(uint64_t a1)
{
  _BYTE *v2;
  unsigned int v3;
  unsigned int v4;
  BOOL v5;
  int v6;
  _BYTE *v9;
  size_t v10;
  _BYTE *v11;
  size_t v12;

  if (!a1)
    return 0;
  v2 = 0;
  v3 = *(unsigned __int16 *)(a1 + 100);
  if (v3 > 0xC000)
  {
    v4 = v3 - 49153;
    v5 = v4 > 0xA;
    v6 = (1 << v4) & 0x419;
    if (v5 || v6 == 0)
      return v2;
LABEL_16:
    if (*(_DWORD *)(a1 + 156))
      return *(_BYTE **)(a1 + 144);
    v9 = (_BYTE *)(**(uint64_t (***)(uint64_t, uint64_t))a1)(*(int *)(a1 + 152) + 1, 1);
    v2 = v9;
    v10 = *(unsigned int *)(a1 + 152);
    if ((int)v10 >= 1)
    {
      memcpy(v9, *(const void **)(a1 + 144), v10);
      LODWORD(v10) = *(_DWORD *)(a1 + 152);
    }
    v2[(int)v10] = 0;
    *(_QWORD *)(a1 + 144) = v2;
    *(_DWORD *)(a1 + 156) = 1;
    return v2;
  }
  if (v3 != 32773)
  {
    if (v3 != 32774 && v3 != 32779)
      return v2;
    goto LABEL_16;
  }
  if (*(_DWORD *)(a1 + 172))
    return *(_BYTE **)(a1 + 160);
  v11 = (_BYTE *)(**(uint64_t (***)(uint64_t, uint64_t))a1)(*(int *)(a1 + 168) + 1, 1);
  v2 = v11;
  v12 = *(unsigned int *)(a1 + 168);
  if ((int)v12 >= 1)
  {
    memcpy(v11, *(const void **)(a1 + 160), v12);
    LODWORD(v12) = *(_DWORD *)(a1 + 168);
  }
  v2[(int)v12] = 0;
  *(_QWORD *)(a1 + 160) = v2;
  *(_DWORD *)(a1 + 172) = 1;
  return v2;
}

uint64_t cmark_parse_inlines(uint64_t autolink, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  int v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  unsigned int v15;
  int v17;
  int v18;
  int v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  int v25;
  unsigned __int8 *v26;
  int v27;
  int v28;
  int v30;
  int v31;
  uint64_t v32;
  uint64_t (**v33)(uint64_t, uint64_t);
  __int16 v34;
  uint64_t (**v35)(uint64_t, uint64_t);
  int v36;
  unint64_t v37;
  unsigned __int8 *v38;
  int v39;
  int v40;
  int v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  uint64_t v49;
  unsigned int v51;
  _BOOL4 is_punctuation;
  uint64_t v53;
  int v54;
  int v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  int v61;
  int v62;
  int v63;
  int v64;
  int v65;
  uint64_t v66;
  int v67;
  int v68;
  uint64_t v69;
  char v70;
  uint64_t v71;
  uint64_t v72;
  int v73;
  uint64_t v74;
  int v75;
  int v76;
  unsigned __int8 *v77;
  int v78;
  int v79;
  int v80;
  int v81;
  uint64_t v82;
  unsigned __int8 *v83;
  int v84;
  int v85;
  unsigned int v86;
  uint64_t v87;
  int v88;
  int v89;
  uint64_t v90;
  char v91;
  int v92;
  _BYTE *v93;
  int v94;
  int v95;
  BOOL (*v96);
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  int v100;
  uint64_t v101;
  uint64_t v102;
  int v103;
  int v104;
  int v105;
  int v106;
  int v107;
  int v108;
  uint64_t v109;
  int v110;
  uint64_t v112;
  int v113;
  int v114;
  unsigned __int8 *v115;
  int v116;
  int v117;
  int v118;
  uint64_t v119;
  int v120;
  int v121;
  int v122;
  int v123;
  int v124;
  int v125;
  int v126;
  int v127;
  int v128;
  const char *v129;
  uint64_t v130;
  int v131;
  int v132;
  int v133;
  uint64_t v134;
  int v135;
  int v136;
  _QWORD *v137;
  uint64_t v138;
  int v139;
  unsigned __int8 *v140;
  int v141;
  uint64_t v142;
  unsigned int v143;
  uint64_t v144;
  int v145;
  int v146;
  uint64_t v147;
  uint64_t v148;
  int v149;
  BOOL v151;
  int v152;
  int v153;
  uint64_t v154;
  uint64_t *v155;
  int v156;
  int v157;
  int v158;
  int v159;
  int v160;
  int v161;
  int v162;
  uint64_t v163;
  uint64_t v164;
  int v165;
  int v166;
  int v167;
  int v168;
  uint64_t v169;
  uint64_t v170;
  int v171;
  int v172;
  uint64_t v173;
  int v174;
  int v175;
  int v176;
  int v177;
  int v178;
  int v179;
  int v180;
  int v181;
  uint64_t (**v182)(uint64_t, uint64_t);
  unsigned int v183;
  unsigned int v184;
  int v185;
  uint64_t v186;
  uint64_t v187;
  int v188;
  int v189;
  int v190;
  int v191;
  int v192;
  int v193;
  int v194;
  int v195;
  int v196;
  _BYTE *v197;
  uint64_t v198;
  int v199;
  char v200;
  _BYTE *v201;
  uint64_t v202;
  uint64_t (**v203)(uint64_t, uint64_t);
  uint64_t v204;
  int v205;
  int v206;
  uint64_t v207;
  _QWORD *v208;
  _QWORD *v209;
  _QWORD *v210;
  int v211;
  int v212;
  int v213;
  int v214;
  uint64_t v215;
  int v216;
  int v217;
  int v218;
  int v219;
  int v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  int v224;
  int v225;
  int v226;
  int v227;
  int v228;
  int v229;
  int v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  _BYTE *v237;
  uint64_t v238;
  _BYTE *v239;
  uint64_t v240;
  int v241;
  uint64_t (**v242)(uint64_t, uint64_t);
  uint64_t v243;
  int v244;
  int v245;
  int v246;
  uint64_t v247;
  _QWORD *v248;
  _QWORD *v249;
  _QWORD *v250;
  int v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t (**v254)(uint64_t, uint64_t);
  uint64_t v255;
  __int16 v256;
  uint64_t v257;
  int v258;
  _QWORD *v259;
  _QWORD *v260;
  _QWORD *v261;
  uint64_t v262;
  _QWORD *v263;
  int v264;
  int v265;
  unsigned __int8 *v266;
  unsigned __int8 v267;
  uint64_t result;
  _BYTE *v269;
  _QWORD *v270;
  uint64_t v271;
  __int16 v272;
  int v273;
  uint64_t (**v274)(uint64_t, uint64_t);
  uint64_t v275;
  int v276;
  int v277;
  int v278;
  int v279;
  int v280;
  int v281;
  __int128 v282;
  __int128 v283;
  __int128 v284;
  __int128 v285;
  __int128 v286;
  __int128 v287;
  __int128 v288;
  __int128 v289;
  __int128 v290;
  __int128 v291;
  __int128 v292;
  __int128 v293;
  __int128 v294;
  __int128 v295;
  __int128 v296;
  __int128 v297;
  __int128 v298;
  __int128 v299;
  __int128 v300;
  __int128 v301;
  __int128 v302;
  _QWORD v303[3];
  uint64_t (**v304)(uint64_t, uint64_t);
  _BYTE *v305;
  uint64_t v306;
  void *v307;
  uint64_t v308;
  unsigned __int8 *v309;
  uint64_t v310;
  uint64_t v311;
  uint64_t v312;

  v5 = autolink;
  v302 = 0u;
  memset(v303, 0, sizeof(v303));
  v300 = 0u;
  v301 = 0u;
  v298 = 0u;
  v299 = 0u;
  v296 = 0u;
  v297 = 0u;
  v295 = 0u;
  v294 = 0u;
  v293 = 0u;
  v292 = 0u;
  v291 = 0u;
  v290 = 0u;
  v289 = 0u;
  v288 = 0u;
  v287 = 0u;
  v286 = 0u;
  v285 = 0u;
  v284 = 0u;
  v283 = 0u;
  v282 = 0u;
  v6 = *(_QWORD *)(a2 + 8);
  v7 = *(_DWORD *)(a2 + 20);
  v8 = *(_DWORD *)(a2 + 80);
  v9 = *(_DWORD *)(a2 + 84) + *(_DWORD *)(a2 + 96) - 1;
  v274 = *(uint64_t (***)(uint64_t, uint64_t))autolink;
  v275 = v6;
  v276 = v7;
  v277 = 0;
  v278 = 0;
  v279 = v8;
  v280 = 0;
  v281 = v9;
  *((_QWORD *)&v282 + 1) = a3;
  v296 = 0u;
  v297 = 0u;
  v298 = 0u;
  v299 = 0u;
  v300 = 0u;
  v301 = 0u;
  v302 = 0u;
  memset(v303, 0, 21);
  v283 = 0u;
  v284 = 0u;
  v285 = 0u;
  v286 = 0u;
  v288 = 0u;
  v289 = 0u;
  v290 = 0u;
  v291 = 0u;
  v292 = 0u;
  v293 = 0u;
  v294 = 0u;
  v295 = 0u;
  BYTE5(v303[2]) = 1;
  v272 = a4;
  v273 = a4 & 0xC0000;
  if ((a4 & 0xC0000) != 0)
  {
    if (v7 < 1)
      goto LABEL_430;
  }
  else
  {
    if (v7 < 1)
      goto LABEL_430;
    v266 = (unsigned __int8 *)(v6 + (v7 - 1));
    while (1)
    {
      v267 = *v266--;
      autolink = cmark_isspace(v267);
      if (!(_DWORD)autolink)
        break;
      v276 = --v7;
      if ((v7 + 1) <= 1)
        goto LABEL_430;
    }
  }
  v10 = 0;
  v270 = (_QWORD *)(v5 + 144);
  v11 = (uint64_t *)(a2 + 48);
  v271 = v5;
  while (2)
  {
    v12 = 0;
    v13 = v275;
    v14 = (_BYTE *)(v275 + v10);
    v15 = *v14;
    if (v15 <= 0x20)
    {
      if (v15 == 10 || v15 == 13)
      {
        if (v273)
        {
          v280 = v10 + 1;
          v12 = (*v274)(1, 184);
          autolink = cmark_strbuf_init((uint64_t)v274, (uint64_t *)v12, 0);
          *(_WORD *)(v12 + 100) = -16383;
          *(_QWORD *)(v12 + 144) = v14;
          *(_QWORD *)(v12 + 152) = 1;
          v17 = v279;
          v18 = v282 + v10 + 1 + v281;
          *(_DWORD *)(v12 + 80) = v279;
          *(_DWORD *)(v12 + 84) = v18;
          *(_DWORD *)(v12 + 88) = v17;
          *(_DWORD *)(v12 + 92) = v18;
        }
        else
        {
          v24 = *v14;
          v25 = v10;
          if (v15 == 13)
          {
            v25 = v10 + 1;
            v280 = v10 + 1;
            v24 = *(unsigned __int8 *)(v275 + v10 + 1);
          }
          if (v24 == 10)
            v280 = ++v25;
          ++v279;
          LODWORD(v282) = -v25;
          if (v25 < v7)
          {
            v26 = (unsigned __int8 *)(v275 + v25);
            while (1)
            {
              v28 = *v26++;
              v27 = v28;
              if (v28 != 32 && v27 != 9)
                break;
              v280 = ++v25;
              if (v7 == v25)
                goto LABEL_47;
            }
            if (!v27)
              cmark_parse_inlines_cold_1(autolink, a2, a3);
          }
LABEL_47:
          if (v10 >= 2
            && *(_BYTE *)(v275 + (v10 - 1)) == 32
            && *(_BYTE *)(v275 + (v10 - 2)) == 32)
          {
            v33 = v274;
            v12 = (*v274)(1, 184);
            autolink = cmark_strbuf_init((uint64_t)v33, (uint64_t *)v12, 0);
            v34 = -16381;
          }
          else
          {
            v35 = v274;
            v12 = (*v274)(1, 184);
            autolink = cmark_strbuf_init((uint64_t)v35, (uint64_t *)v12, 0);
            v34 = -16382;
          }
          *(_WORD *)(v12 + 100) = v34;
        }
      }
      else if (!*v14)
      {
        cmark_parse_inlines_cold_1(autolink, a2, a3);
      }
      goto LABEL_228;
    }
    switch(*v14)
    {
      case '!':
        v53 = v10 + 1;
        if (v10 + 1 >= v7)
          goto LABEL_79;
        if (*(_BYTE *)(v275 + v53) != 91)
        {
          if (!*(_BYTE *)(v275 + v53))
            cmark_parse_inlines_cold_1(autolink, a2, a3);
          goto LABEL_79;
        }
        v112 = v10 + 2;
        if ((int)v112 < v7)
        {
          if (*(_BYTE *)(v275 + v112) == 94)
          {
LABEL_79:
            v12 = 0;
            goto LABEL_228;
          }
          if (!*(_BYTE *)(v275 + v112))
            cmark_parse_inlines_cold_1(autolink, a2, a3);
        }
        v280 = v10 + 2;
        v12 = (*v274)(1, 184);
        cmark_strbuf_init((uint64_t)v274, (uint64_t *)v12, 0);
        *(_WORD *)(v12 + 100) = -16383;
        *(_QWORD *)(v12 + 144) = "![";
        *(_QWORD *)(v12 + 152) = 2;
        v113 = v279;
        v114 = v282 + v281 + 1;
        *(_DWORD *)(v12 + 80) = v279;
        *(_DWORD *)(v12 + 84) = v114 + v10;
        *(_DWORD *)(v12 + 88) = v113;
        *(_DWORD *)(v12 + 92) = v114 + v53;
        autolink = push_bracket((uint64_t)&v274, 1u, v12);
        goto LABEL_228;
      case '"':
      case '\'':
      case '*':
LABEL_16:
        LODWORD(v304) = 0;
        LODWORD(v311) = 0;
        if (!v10)
          goto LABEL_42;
        v21 = 0;
        while (2)
        {
          v22 = v10 + v21;
          v23 = *(unsigned __int8 *)(v275 + v10 - 1 + v21);
          if ((v23 & 0xC0) == 0x80)
          {
            if (v22 < 2)
              goto LABEL_39;
          }
          else if (v22 < 2 || !*(_BYTE *)(*(_QWORD *)(v5 + 160) + v23))
          {
LABEL_39:
            autolink = cmark_utf8proc_iterate((unsigned __int8 *)(v275 + v10 + v21 - 1), 1 - (int)v21, (unsigned int *)&v311);
            if ((_DWORD)autolink == -1 || (int)v311 <= 255 && *(_BYTE *)(*(_QWORD *)(v5 + 160) + v311))
LABEL_42:
              LODWORD(v311) = 10;
            if (v15 == 34 || v15 == 39)
            {
              v30 = v276;
              v31 = ++v280;
              LODWORD(v32) = 1;
            }
            else
            {
              v32 = 0;
              v30 = v276;
              v42 = v280;
              v43 = v280;
              v44 = v275 + v280;
              while (1)
              {
                if (v43 + v32 >= v276)
                {
                  v45 = 0;
                }
                else
                {
                  v45 = *(unsigned __int8 *)(v44 + v32);
                  if (!*(_BYTE *)(v44 + v32))
                    cmark_parse_inlines_cold_1(autolink, a2, a3);
                }
                if (v45 != v15)
                  break;
                v280 = v42 + v32++ + 1;
              }
              v31 = v43 + v32;
            }
            if (v31 == v30)
              goto LABEL_71;
            v46 = v31;
            v47 = v30;
            v48 = v30 - v31 + 1;
            do
            {
              v49 = v46 + 1;
              --v48;
              if (v46 >= v47)
                break;
            }
            while (*(unsigned __int8 *)(*(_QWORD *)(v5 + 160) + *(unsigned __int8 *)(v275 + v46++)));
            if (cmark_utf8proc_iterate((unsigned __int8 *)(v275 + v49 - 1), v48, (unsigned int *)&v304) == -1
              || (v51 = v304, (int)v304 <= 255)
              && *(_BYTE *)(*(_QWORD *)(v5 + 160) + v304))
            {
LABEL_71:
              v51 = 10;
              LODWORD(v304) = 10;
            }
            if ((_DWORD)v32)
            {
              if (cmark_utf8proc_is_space(v51))
                is_punctuation = 0;
              else
                is_punctuation = !cmark_utf8proc_is_punctuation((int)v304)
                              || cmark_utf8proc_is_space(v311)
                              || cmark_utf8proc_is_punctuation(v311);
              if (!cmark_utf8proc_is_space(v311))
              {
                v126 = !cmark_utf8proc_is_punctuation(v311)
                    || cmark_utf8proc_is_space(v304)
                    || cmark_utf8proc_is_punctuation((int)v304);
LABEL_191:
                if (v15 == 34 || v15 == 39)
                {
                  if (is_punctuation)
                  {
                    if ((_DWORD)v311 == 41)
                      is_punctuation = 0;
                    else
                      is_punctuation = ((_DWORD)v311 != 93) & ~v126;
                  }
                }
                else if (v15 == 95)
                {
                  v127 = !is_punctuation;
                  v128 = v126 ^ 1;
                  if (is_punctuation && (v128 & 1) == 0)
                    is_punctuation = cmark_utf8proc_is_punctuation(v311);
                  if (((v127 | v128) & 1) == 0)
                    v126 = cmark_utf8proc_is_punctuation((int)v304);
                  goto LABEL_212;
                }
                if ((v272 & 0x400) != 0 && v15 == 39)
                {
                  v129 = "’";
                }
                else
                {
                  if ((v272 & 0x400) == 0 || v15 != 34)
                  {
LABEL_212:
                    v129 = (const char *)(v275 - (int)v32 + v280);
                    v130 = v32;
LABEL_213:
                    v131 = v280;
                    v12 = (*v274)(1, 184);
                    autolink = cmark_strbuf_init((uint64_t)v274, (uint64_t *)v12, 0);
                    *(_QWORD *)(v12 + 144) = v129;
                    *(_QWORD *)(v12 + 152) = v130;
                    v132 = v279;
                    v133 = v281 + v282;
                    *(_WORD *)(v12 + 100) = -16383;
                    *(_DWORD *)(v12 + 80) = v132;
                    *(_DWORD *)(v12 + 84) = v131 - v32 + v133 + 1;
                    *(_DWORD *)(v12 + 88) = v132;
                    *(_DWORD *)(v12 + 92) = v133 + v131;
                    if (is_punctuation | v126)
                    {
                      v5 = v271;
                      if (v15 != 39 && v15 != 34 || (v272 & 0x400) != 0)
                      {
                        autolink = (*v274)(1, 48);
                        *(_BYTE *)(autolink + 32) = v15;
                        *(_DWORD *)(autolink + 36) = is_punctuation;
                        *(_DWORD *)(autolink + 40) = v126;
                        *(_QWORD *)(autolink + 16) = v12;
                        *(_DWORD *)(autolink + 24) = v280;
                        *(_DWORD *)(autolink + 28) = *(_DWORD *)(v12 + 152);
                        v134 = v283;
                        *(_QWORD *)autolink = v283;
                        *(_QWORD *)(autolink + 8) = 0;
                        if (v134)
                          *(_QWORD *)(v134 + 8) = autolink;
                        *(_QWORD *)&v283 = autolink;
                      }
                    }
                    else
                    {
                      v5 = v271;
                    }
                    goto LABEL_227;
                  }
                  if (v126)
                    v129 = "”";
                  else
                    v129 = "“";
                }
                v130 = 3;
                goto LABEL_213;
              }
            }
            else
            {
              is_punctuation = 0;
            }
            v126 = 0;
            goto LABEL_191;
          }
          --v21;
          continue;
        }
      case '#':
      case '$':
      case '%':
      case '(':
      case ')':
      case '+':
      case ',':
        goto LABEL_228;
      case '&':
        v304 = v274;
        v305 = &cmark_strbuf__initbuf;
        v306 = 0;
        v280 = v10 + 1;
        v54 = houdini_unescape_ent(&v304, (char *)(v275 + v10 + 1), v7 - (v10 + 1));
        v55 = v280;
        if (v54)
        {
          v280 += v54;
          v56 = v280;
          v57 = HIDWORD(v306);
          v58 = cmark_strbuf_detach((uint64_t)&v304);
          v59 = v57 | 0x100000000;
          v12 = (*v274)(1, 184);
          autolink = cmark_strbuf_init((uint64_t)v274, (uint64_t *)v12, 0);
          *(_WORD *)(v12 + 100) = -16383;
          *(_QWORD *)(v12 + 144) = v58;
          *(_QWORD *)(v12 + 152) = v59;
          v11 = (uint64_t *)(a2 + 48);
          v60 = v279;
          v61 = v281 + v282;
          *(_DWORD *)(v12 + 80) = v279;
          *(_DWORD *)(v12 + 84) = v61 + v55;
          *(_DWORD *)(v12 + 88) = v60;
          v62 = v61 + v56;
        }
        else
        {
          v12 = (*v274)(1, 184);
          autolink = cmark_strbuf_init((uint64_t)v274, (uint64_t *)v12, 0);
          *(_WORD *)(v12 + 100) = -16383;
          *(_QWORD *)(v12 + 144) = "&";
          *(_QWORD *)(v12 + 152) = 1;
          v107 = v279;
          v62 = v282 + v55 + v281;
          *(_DWORD *)(v12 + 80) = v279;
          *(_DWORD *)(v12 + 84) = v62;
          *(_DWORD *)(v12 + 88) = v107;
        }
        *(_DWORD *)(v12 + 92) = v62;
        goto LABEL_228;
      case '-':
        v63 = v10 + 1;
        v280 = v10 + 1;
        if ((v272 & 0x400) == 0 || v63 >= v7)
          goto LABEL_86;
        if (*(_BYTE *)(v275 + v63) != 45)
        {
          if (!*(_BYTE *)(v275 + v63))
            cmark_parse_inlines_cold_1(autolink, a2, a3);
LABEL_86:
          v12 = (*v274)(1, 184);
          autolink = cmark_strbuf_init((uint64_t)v274, (uint64_t *)v12, 0);
          *(_WORD *)(v12 + 100) = -16383;
          *(_QWORD *)(v12 + 144) = "-";
          *(_QWORD *)(v12 + 152) = 1;
          v64 = v279;
          v65 = v282 + v63 + v281;
          *(_DWORD *)(v12 + 80) = v279;
          *(_DWORD *)(v12 + 84) = v65;
          *(_DWORD *)(v12 + 88) = v64;
          *(_DWORD *)(v12 + 92) = v65;
          goto LABEL_228;
        }
        v115 = (unsigned __int8 *)(v275 + v63);
        v116 = v10 + 1;
        while (1)
        {
          v118 = *v115++;
          v117 = v118;
          if (v118 != 45)
            break;
          v280 = ++v116;
          if (v7 == v116)
          {
            v116 = v7;
            goto LABEL_184;
          }
        }
        if (!v117)
          cmark_parse_inlines_cold_1(autolink, a2, a3);
LABEL_184:
        v122 = v116 - v10;
        v304 = v274;
        v305 = &cmark_strbuf__initbuf;
        v306 = 0;
        if (v122 % 3)
        {
          if ((v122 & 1) == 0)
          {
            v123 = v122 / 2;
LABEL_315:
            if (v123 >= 1)
            {
              v184 = v123 + 1;
              do
              {
                cmark_strbuf_puts(&v304, "–");
                --v184;
              }
              while (v184 > 1);
            }
            v185 = v280;
            v186 = HIDWORD(v306);
            v187 = cmark_strbuf_detach((uint64_t)&v304);
            v12 = (*v274)(1, 184);
            autolink = cmark_strbuf_init((uint64_t)v274, (uint64_t *)v12, 0);
            *(_WORD *)(v12 + 100) = -16383;
            *(_QWORD *)(v12 + 144) = v187;
            *(_QWORD *)(v12 + 152) = v186 | 0x100000000;
            v188 = v279;
            v189 = v281 + v282;
            v190 = v281 + v282 + v63;
            *(_DWORD *)(v12 + 80) = v279;
            *(_DWORD *)(v12 + 84) = v190;
            *(_DWORD *)(v12 + 88) = v188;
            *(_DWORD *)(v12 + 92) = v189 + v185;
            v5 = v271;
            goto LABEL_228;
          }
          if (v122 % 3 == 2)
          {
            v122 -= 2;
            v123 = 1;
          }
          else
          {
            v122 -= 4;
            v123 = 2;
          }
        }
        else
        {
          v123 = 0;
        }
        if (v122 >= 3)
        {
          v183 = v122 / 3u + 1;
          do
          {
            cmark_strbuf_puts(&v304, "—");
            --v183;
          }
          while (v183 > 1);
        }
        goto LABEL_315;
      case '.':
        v66 = v10 + 1;
        v280 = v10 + 1;
        if ((v272 & 0x400) == 0 || (int)v66 >= v7)
          goto LABEL_91;
        if (*(_BYTE *)(v275 + v66) != 46)
        {
          if (!*(_BYTE *)(v275 + v66))
            cmark_parse_inlines_cold_1(autolink, a2, a3);
LABEL_91:
          v12 = (*v274)(1, 184);
          autolink = cmark_strbuf_init((uint64_t)v274, (uint64_t *)v12, 0);
          *(_WORD *)(v12 + 100) = -16383;
          *(_QWORD *)(v12 + 144) = ".";
          *(_QWORD *)(v12 + 152) = 1;
          v67 = v279;
          v68 = v282 + v66 + v281;
          *(_DWORD *)(v12 + 80) = v279;
          *(_DWORD *)(v12 + 84) = v68;
          *(_DWORD *)(v12 + 88) = v67;
LABEL_308:
          *(_DWORD *)(v12 + 92) = v68;
          goto LABEL_228;
        }
        v119 = v10 + 2;
        v280 = v10 + 2;
        if (v10 + 2 >= v7)
          goto LABEL_182;
        if (*(_BYTE *)(v275 + v119) == 46)
        {
          v280 = v10 + 3;
          v12 = (*v274)(1, 184);
          autolink = cmark_strbuf_init((uint64_t)v274, (uint64_t *)v12, 0);
          *(_WORD *)(v12 + 100) = -16383;
          *(_QWORD *)(v12 + 144) = "…";
          *(_QWORD *)(v12 + 152) = 3;
          v180 = v279;
          v181 = v282 + v281 + 1;
          *(_DWORD *)(v12 + 80) = v279;
          *(_DWORD *)(v12 + 84) = v181 + v10;
          *(_DWORD *)(v12 + 88) = v180;
          v68 = v181 + v119;
        }
        else
        {
          if (!*(_BYTE *)(v275 + v119))
            cmark_parse_inlines_cold_1(autolink, a2, a3);
LABEL_182:
          v12 = (*v274)(1, 184);
          autolink = cmark_strbuf_init((uint64_t)v274, (uint64_t *)v12, 0);
          *(_WORD *)(v12 + 100) = -16383;
          *(_QWORD *)(v12 + 144) = "..";
          *(_QWORD *)(v12 + 152) = 2;
          v120 = v279;
          v121 = v282 + v281 + 1;
          *(_DWORD *)(v12 + 80) = v279;
          *(_DWORD *)(v12 + 84) = v121 + v10;
          *(_DWORD *)(v12 + 88) = v120;
          v68 = v121 + v66;
        }
        v11 = (uint64_t *)(a2 + 48);
        goto LABEL_308;
      default:
        switch(*v14)
        {
          case '[':
            v280 = v10 + 1;
            v12 = (*v274)(1, 184);
            cmark_strbuf_init((uint64_t)v274, (uint64_t *)v12, 0);
            *(_WORD *)(v12 + 100) = -16383;
            *(_QWORD *)(v12 + 144) = "[";
            *(_QWORD *)(v12 + 152) = 1;
            v19 = v279;
            v5 = v271;
            v20 = v282 + v10 + 1 + v281;
            *(_DWORD *)(v12 + 80) = v279;
            *(_DWORD *)(v12 + 84) = v20;
            *(_DWORD *)(v12 + 88) = v19;
            *(_DWORD *)(v12 + 92) = v20;
            autolink = push_bracket((uint64_t)&v274, 0, v12);
            goto LABEL_228;
          case '\\':
            v69 = v10 + 1;
            v280 = v69;
            if ((int)v69 >= v7)
            {
              v70 = 0;
            }
            else
            {
              v70 = *(_BYTE *)(v275 + v69);
              if (!v70)
                cmark_parse_inlines_cold_1(autolink, a2, a3);
            }
            v96 = *(BOOL (**))(v5 + 152);
            if (!v96)
              v96 = cmark_ispunct;
            v97 = ((uint64_t (*)(_QWORD))v96)(v70);
            v100 = v280;
            v101 = v280;
            if ((_DWORD)v97)
            {
              ++v280;
              v102 = v275 + v101;
              v12 = (*v274)(1, 184);
              autolink = cmark_strbuf_init((uint64_t)v274, (uint64_t *)v12, 0);
              *(_WORD *)(v12 + 100) = -16383;
              *(_QWORD *)(v12 + 144) = v102;
              *(_QWORD *)(v12 + 152) = 1;
              v103 = v279;
              v104 = v281 + v282;
              v105 = v281 + v282 + v100;
              *(_DWORD *)(v12 + 80) = v279;
              *(_DWORD *)(v12 + 84) = v105;
              v106 = v104 + v100 + 1;
LABEL_277:
              *(_DWORD *)(v12 + 88) = v103;
              *(_DWORD *)(v12 + 92) = v106;
              goto LABEL_228;
            }
            if (v280 >= v276)
              goto LABEL_276;
            if (*(_BYTE *)(v275 + v280) == 13)
            {
              v100 = ++v280;
              v110 = 1;
            }
            else
            {
              if (!*(_BYTE *)(v275 + v280))
                cmark_parse_inlines_cold_1(v97, v98, v99);
              v110 = 0;
            }
            if (v100 >= v276)
              goto LABEL_275;
            if (*(_BYTE *)(v275 + v100) == 10)
            {
              v280 = v100 + 1;
            }
            else
            {
              if (!*(_BYTE *)(v275 + v100))
                cmark_parse_inlines_cold_1(v97, v98, v99);
LABEL_275:
              if (((v100 < v276) & ~v110) != 0)
              {
LABEL_276:
                v12 = (*v274)(1, 184);
                autolink = cmark_strbuf_init((uint64_t)v274, (uint64_t *)v12, 0);
                *(_WORD *)(v12 + 100) = -16383;
                *(_QWORD *)(v12 + 144) = "\\";
                *(_QWORD *)(v12 + 152) = 1;
                v103 = v279;
                v106 = v282 + v100 + v281;
                *(_DWORD *)(v12 + 80) = v279;
                *(_DWORD *)(v12 + 84) = v106;
                goto LABEL_277;
              }
            }
            v182 = v274;
            v12 = (*v274)(1, 184);
            autolink = cmark_strbuf_init((uint64_t)v182, (uint64_t *)v12, 0);
            *(_WORD *)(v12 + 100) = -16381;
            goto LABEL_228;
          case ']':
            v311 = 0;
            v312 = 0;
            v309 = 0;
            v310 = 0;
            v307 = 0;
            v308 = 0;
            v71 = v10 + 1;
            v280 = v10 + 1;
            v72 = *((_QWORD *)&v283 + 1);
            if (!*((_QWORD *)&v283 + 1))
              goto LABEL_399;
            v73 = *(_DWORD *)(*((_QWORD *)&v283 + 1) + 20);
            if (v73 != 2)
            {
              if (v73 != 1 && BYTE5(v303[2]) != 0)
              {
                *((_QWORD *)&v283 + 1) = **((_QWORD **)&v283 + 1);
                ((void (*)(uint64_t))v274[2])(v72);
                v156 = v280;
                v12 = (*v274)(1, 184);
                autolink = cmark_strbuf_init((uint64_t)v274, (uint64_t *)v12, 0);
                *(_WORD *)(v12 + 100) = -16383;
                *(_QWORD *)(v12 + 144) = "]";
                *(_QWORD *)(v12 + 152) = 1;
                v157 = v281;
                v158 = v279;
                v159 = v282 + v156;
                v5 = v271;
LABEL_400:
                v251 = v159 + v157;
                *(_DWORD *)(v12 + 80) = v158;
                *(_DWORD *)(v12 + 84) = v251;
                *(_DWORD *)(v12 + 88) = v158;
                *(_DWORD *)(v12 + 92) = v251;
                v11 = (uint64_t *)(a2 + 48);
                goto LABEL_228;
              }
              if ((int)v71 < v7)
              {
                if (*(_BYTE *)(v275 + v71) == 40)
                {
                  v191 = _scan_at((uint64_t (*)(uint64_t))_scan_spacechars, &v275, v10 + 2);
                  if ((v191 & 0x80000000) == 0)
                  {
                    v192 = v191 + 1;
                    v193 = manual_scan_link_url((uint64_t)&v275, v280 + v191 + 1, (uint64_t)&v311);
                    if ((v193 & 0x80000000) == 0)
                    {
                      v194 = v193 + v192 + v280;
                      v195 = _scan_at((uint64_t (*)(uint64_t))_scan_spacechars, &v275, v194);
                      v196 = v194 + v195;
                      if (v195)
                        v194 = _scan_at((uint64_t (*)(uint64_t))_scan_link_title, &v275, v196) + v196;
                      v230 = _scan_at((uint64_t (*)(uint64_t))_scan_spacechars, &v275, v194) + v194;
                      if (*(_BYTE *)(v275 + v230) == 41)
                      {
                        v280 = v230 + 1;
                        v309 = (unsigned __int8 *)(v275 + v196);
                        v310 = (v194 - v196);
                        v231 = cmark_clean_url((uint64_t)v274, (uint64_t)&v311);
                        v233 = v232;
                        v234 = cmark_clean_title((uint64_t)v274, &v309);
                        v236 = v235;
                        v269 = (_BYTE *)v231;
                        if (HIDWORD(v312))
                          ((void (*)(uint64_t))v274[2])(v311);
                        v237 = (_BYTE *)v234;
                        goto LABEL_402;
                      }
                      v280 = v10 + 1;
                    }
                  }
                }
                else if (!*(_BYTE *)(v275 + v71))
                {
                  cmark_parse_inlines_cold_1(autolink, a2, a3);
                }
              }
              v307 = &unk_21132FD7E;
              v308 = 0;
              if (link_label((uint64_t)&v274, (uint64_t)&v307, 0))
              {
                if ((_DWORD)v308 || *(_BYTE *)(v72 + 25))
                {
LABEL_378:
                  v239 = cmark_map_lookup(*((uint64_t **)&v282 + 1), (uint64_t)&v307);
                  if (HIDWORD(v308))
                    ((void (*)(void *))v274[2])(v307);
                  v307 = 0;
                  v308 = 0;
                  if (!v239 || v239[32])
                    goto LABEL_382;
                  v269 = chunk_clone(v274, (uint64_t)(v239 + 40));
                  v233 = v252;
                  v237 = chunk_clone(v274, (uint64_t)(v239 + 56));
                  v236 = v253;
LABEL_402:
                  v254 = v274;
                  v255 = (*v274)(1, 184);
                  cmark_strbuf_init((uint64_t)v254, (uint64_t *)v255, 0);
                  if (v73 == 1)
                    v256 = -16374;
                  else
                    v256 = -16375;
                  *(_WORD *)(v255 + 100) = v256;
                  *(_QWORD *)(v255 + 144) = v269;
                  *(_QWORD *)(v255 + 152) = v233;
                  *(_QWORD *)(v255 + 160) = v237;
                  *(_QWORD *)(v255 + 168) = v236;
                  v257 = *(_QWORD *)(v72 + 8);
                  *(_QWORD *)(v255 + 80) = *(_QWORD *)(v257 + 80);
                  v258 = v282 + v280 + v281;
                  *(_DWORD *)(v255 + 88) = v279;
                  *(_DWORD *)(v255 + 92) = v258;
                  cmark_node_insert_before(v257, (_QWORD *)v255);
                  v259 = *(_QWORD **)(v72 + 8);
                  v260 = (_QWORD *)v259[3];
                  if (v260)
                  {
                    do
                    {
                      v261 = (_QWORD *)v260[3];
                      cmark_node_unlink(v260);
                      v262 = *(_QWORD *)(v255 + 56);
                      v260[3] = 0;
                      v260[4] = v262;
                      v260[5] = v255;
                      *(_QWORD *)(v255 + 56) = v260;
                      if (v262)
                        v263 = (_QWORD *)(v262 + 24);
                      else
                        v263 = (_QWORD *)(v255 + 48);
                      *v263 = v260;
                      v260 = v261;
                    }
                    while (v261);
                    v259 = *(_QWORD **)(v72 + 8);
                    v5 = v271;
                  }
                  cmark_node_free(v259);
                  process_emphasis(v5, (uint64_t *)&v274, *(_DWORD *)(v72 + 16));
                  autolink = *((_QWORD *)&v283 + 1);
                  v11 = (uint64_t *)(a2 + 48);
                  if (*((_QWORD *)&v283 + 1))
                  {
                    *((_QWORD *)&v283 + 1) = **((_QWORD **)&v283 + 1);
                    autolink = ((uint64_t (*)(void))v274[2])();
                  }
                  if (v73 == 1)
                    goto LABEL_351;
                  v12 = 0;
                  BYTE5(v303[2]) = 1;
                  goto LABEL_228;
                }
              }
              else
              {
                v280 = v10 + 1;
                if (*(_BYTE *)(v72 + 25))
                {
LABEL_382:
                  if ((*(_BYTE *)(v5 + 121) & 0x20) != 0)
                  {
                    v240 = *(_QWORD *)(*(_QWORD *)(v72 + 8) + 24);
                    if (v240)
                    {
                      if (*(unsigned __int16 *)(v240 + 100) == 49153)
                      {
                        v241 = *(_DWORD *)(v240 + 152);
                        if (v241 >= 1
                          && **(_BYTE **)(v240 + 144) == 94
                          && (v241 > 1 || *(_QWORD *)(v240 + 24)))
                        {
                          v280 = v10 + 1;
                          v242 = v274;
                          v243 = (*v274)(1, 184);
                          cmark_strbuf_init((uint64_t)v242, (uint64_t *)v243, 0);
                          *(_WORD *)(v243 + 100) = -16373;
                          v244 = v279;
                          v245 = v282 + v280 + v281;
                          v246 = *(_DWORD *)(*(_QWORD *)(v72 + 8) + 84);
                          LODWORD(v247) = v245 - v246 - 2;
                          if (v246 + 2 <= v245)
                            v247 = v247;
                          else
                            v247 = 0;
                          *(_QWORD *)(v243 + 144) = *(_QWORD *)(v240 + 144) + 1;
                          *(_QWORD *)(v243 + 152) = v247;
                          *(_DWORD *)(v243 + 80) = v244;
                          *(_DWORD *)(v243 + 84) = v246;
                          *(_DWORD *)(v243 + 88) = v244;
                          *(_DWORD *)(v243 + 92) = v245;
                          cmark_node_insert_before(*(_QWORD *)(v72 + 8), (_QWORD *)v243);
                          process_emphasis(v5, (uint64_t *)&v274, *(_DWORD *)(v72 + 16));
                          v248 = *(_QWORD **)(v72 + 8);
                          v249 = (_QWORD *)v248[3];
                          if (v249)
                          {
                            v11 = (uint64_t *)(a2 + 48);
                            do
                            {
                              v250 = (_QWORD *)v249[3];
                              cmark_node_free(v249);
                              v249 = v250;
                            }
                            while (v250);
                            v248 = *(_QWORD **)(v72 + 8);
                            v5 = v271;
                          }
                          else
                          {
                            v11 = (uint64_t *)(a2 + 48);
                          }
                          cmark_node_free(v248);
                          goto LABEL_349;
                        }
                      }
                    }
                  }
                  if (*((_QWORD *)&v283 + 1))
                  {
                    *((_QWORD *)&v283 + 1) = **((_QWORD **)&v283 + 1);
                    ((void (*)(void))v274[2])();
                  }
                  v280 = v10 + 1;
LABEL_399:
                  v12 = (*v274)(1, 184);
                  autolink = cmark_strbuf_init((uint64_t)v274, (uint64_t *)v12, 0);
                  *(_WORD *)(v12 + 100) = -16383;
                  *(_QWORD *)(v12 + 144) = "]";
                  *(_QWORD *)(v12 + 152) = 1;
                  v157 = v281;
                  v158 = v279;
                  v159 = v282 + v71;
                  goto LABEL_400;
                }
              }
              if (HIDWORD(v308))
                ((void (*)(void *))v274[2])(v307);
              v238 = *(int *)(v72 + 16);
              v307 = (void *)(v275 + v238);
              v308 = (v10 - v238);
              goto LABEL_378;
            }
            if ((int)v71 >= v7)
              goto LABEL_330;
            if (*(_BYTE *)(v275 + v71) != 40)
            {
              if (!*(_BYTE *)(v275 + v71))
                cmark_parse_inlines_cold_1(autolink, a2, a3);
LABEL_330:
              v197 = 0;
              LODWORD(v198) = 0;
LABEL_331:
              v200 = 0;
              goto LABEL_332;
            }
            v169 = v10 + 2;
            if (v7 <= v10 + 2)
            {
              LODWORD(v173) = v10 + 2;
              goto LABEL_324;
            }
            v170 = 0;
            v171 = v10 + 2;
            while (1)
            {
              v172 = *(unsigned __int8 *)(v275 + v171);
              if (v172 != 92)
                break;
              v173 = v171 + 1;
              if ((int)v173 < v7)
              {
                if (!cmark_ispunct(*(_BYTE *)(v275 + v173)))
                {
                  v172 = *(unsigned __int8 *)(v275 + v171);
                  break;
                }
                LODWORD(v173) = v171 + 2;
              }
LABEL_293:
              v7 = v276;
              v171 = v173;
              if ((int)v173 >= v276)
                goto LABEL_324;
            }
            if (v172 == 40)
            {
              if ((unint64_t)++v170 > 0x20)
                goto LABEL_330;
              goto LABEL_292;
            }
            if (v172 != 41)
              goto LABEL_292;
            if (v170)
            {
              --v170;
LABEL_292:
              LODWORD(v173) = v171 + 1;
              goto LABEL_293;
            }
            v7 = v276;
            LODWORD(v173) = v171;
LABEL_324:
            if ((int)v173 >= v7)
              goto LABEL_330;
            v197 = (_BYTE *)(v275 + v169);
            LODWORD(v198) = v173 - v169;
            if ((int)v173 - (int)v169 < 0)
              goto LABEL_331;
            v199 = v198 + v280 + 1;
            if (*(_BYTE *)(v275 + v199) != 41)
              goto LABEL_331;
            v280 += v198 + 2;
            LODWORD(v198) = v199 - v169;
            if (v199 == (_DWORD)v169)
              v197 = 0;
            v200 = 1;
LABEL_332:
            v304 = (uint64_t (**)(uint64_t, uint64_t))&unk_21132FD7E;
            v305 = 0;
            if (link_label((uint64_t)&v274, (uint64_t)&v304, 0))
            {
              v201 = cmark_map_lookup(*((uint64_t **)&v282 + 1), (uint64_t)&v304);
              if (HIDWORD(v305))
                ((void (*)(uint64_t (**)(uint64_t, uint64_t)))v274[2])(v304);
              v304 = 0;
              v305 = 0;
              if (v201)
              {
                if (v201[32])
                {
                  v197 = chunk_clone(v274, (uint64_t)(v201 + 72));
                  v198 = v202;
                  goto LABEL_340;
                }
              }
            }
            if ((v200 & 1) != 0)
            {
              v198 = v198;
LABEL_340:
              v203 = v274;
              v204 = (*v274)(1, 184);
              cmark_strbuf_init((uint64_t)v203, (uint64_t *)v204, 0);
              *(_WORD *)(v204 + 100) = -16372;
              *(_QWORD *)(v204 + 144) = v197;
              *(_QWORD *)(v204 + 152) = v198;
              v205 = v279;
              v206 = v280;
              *(_DWORD *)(v204 + 88) = v279;
              *(_DWORD *)(v204 + 80) = v205;
              v207 = *(_QWORD *)(v72 + 8);
              *(_DWORD *)(v204 + 84) = *(_DWORD *)(v207 + 84);
              *(_DWORD *)(v204 + 92) = v282 + v206 + v281;
              cmark_node_insert_before(v207, (_QWORD *)v204);
              v208 = *(_QWORD **)(v72 + 8);
              v209 = (_QWORD *)v208[3];
              if (v209)
              {
                v11 = (uint64_t *)(a2 + 48);
                do
                {
                  v210 = (_QWORD *)v209[3];
                  cmark_node_append_child((_QWORD *)v204, v209);
                  v209 = v210;
                }
                while (v210);
                v208 = *(_QWORD **)(v72 + 8);
                v5 = v271;
              }
              else
              {
                v11 = (uint64_t *)(a2 + 48);
              }
              cmark_node_free(v208);
              process_emphasis(v5, (uint64_t *)&v274, *(_DWORD *)(v72 + 16));
LABEL_349:
              autolink = *((_QWORD *)&v283 + 1);
              if (*((_QWORD *)&v283 + 1))
              {
                *((_QWORD *)&v283 + 1) = **((_QWORD **)&v283 + 1);
                autolink = ((uint64_t (*)(void))v274[2])();
              }
LABEL_351:
              v12 = 0;
              goto LABEL_228;
            }
            if (*((_QWORD *)&v283 + 1))
            {
              *((_QWORD *)&v283 + 1) = **((_QWORD **)&v283 + 1);
              ((void (*)(void))v274[2])();
            }
            v211 = v280;
            v12 = (*v274)(1, 184);
            autolink = cmark_strbuf_init((uint64_t)v274, (uint64_t *)v12, 0);
            *(_WORD *)(v12 + 100) = -16383;
            *(_QWORD *)(v12 + 144) = "]";
            *(_QWORD *)(v12 + 152) = 1;
            v212 = v279;
            v213 = v282 + v211 + v281;
            *(_DWORD *)(v12 + 80) = v279;
            *(_DWORD *)(v12 + 84) = v213;
            *(_DWORD *)(v12 + 88) = v212;
            *(_DWORD *)(v12 + 92) = v213;
            v5 = v271;
            v11 = (uint64_t *)(a2 + 48);
LABEL_228:
            if (v280 == v10)
            {
              if (!v12)
              {
                v137 = v270;
                while (1)
                {
                  v137 = (_QWORD *)*v137;
                  if (!v137)
                    break;
                  autolink = (*(uint64_t (**)(void))(v137[1] + 16))();
                  if (autolink)
                  {
                    v12 = autolink;
                    goto LABEL_260;
                  }
                }
                v138 = v280;
                v139 = v280 + 1;
                if (v280 + 1 >= v276)
                {
LABEL_242:
                  v141 = v276;
                }
                else
                {
                  v140 = (unsigned __int8 *)(v275 + v280 + 1);
                  v141 = v280 + 1;
                  while (1)
                  {
                    v143 = *v140++;
                    v142 = v143;
                    if (*(_BYTE *)(*(_QWORD *)(v5 + 168) + v143) || (v272 & 0x400) != 0 && SMART_PUNCT_CHARS[v142])
                      break;
                    if (v276 == ++v141)
                      goto LABEL_242;
                  }
                }
                if (v141 == v280)
                {
                  ++v280;
                  v144 = v275 + v138;
                  v12 = (*v274)(1, 184);
                  autolink = cmark_strbuf_init((uint64_t)v274, (uint64_t *)v12, 0);
                  *(_WORD *)(v12 + 100) = -16383;
                  *(_QWORD *)(v12 + 144) = v144;
                  v5 = v271;
                  *(_QWORD *)(v12 + 152) = 1;
                  v145 = v279;
                  v146 = v282 + v139 + v281;
                  *(_DWORD *)(v12 + 80) = v279;
                  *(_DWORD *)(v12 + 84) = v146;
                  *(_DWORD *)(v12 + 88) = v145;
                }
                else
                {
                  v147 = (v141 - v280);
                  v148 = v275 + v280;
                  v280 = v141;
                  if (!v273 && v141 < v276)
                  {
                    v149 = *(unsigned __int8 *)(v275 + v141);
                    if (v149 == 10 || v149 == 13)
                    {
                      if ((int)v147 >= 1)
                      {
                        do
                        {
                          if (!cmark_isspace(*(_BYTE *)(v148 + (v147 - 1))))
                            break;
                          v151 = __OFSUB__((_DWORD)v147, 1);
                          v147 = (v147 - 1);
                        }
                        while (!(((int)v147 < 0) ^ v151 | ((_DWORD)v147 == 0)));
                      }
                    }
                    else if (!*(_BYTE *)(v275 + v141))
                    {
                      cmark_parse_inlines_cold_1(autolink, a2, a3);
                    }
                  }
                  v12 = (*v274)(1, 184);
                  autolink = cmark_strbuf_init((uint64_t)v274, (uint64_t *)v12, 0);
                  *(_WORD *)(v12 + 100) = -16383;
                  *(_QWORD *)(v12 + 144) = v148;
                  *(_QWORD *)(v12 + 152) = v147;
                  v152 = v279;
                  v153 = v281 + v282;
                  *(_DWORD *)(v12 + 80) = v279;
                  *(_DWORD *)(v12 + 84) = v153 + v139;
                  *(_DWORD *)(v12 + 88) = v152;
                  v146 = v153 + v141;
                  v11 = (uint64_t *)(a2 + 48);
                }
                *(_DWORD *)(v12 + 92) = v146;
              }
LABEL_260:
              v154 = *(_QWORD *)(a2 + 56);
              *(_QWORD *)(v12 + 24) = 0;
              *(_QWORD *)(v12 + 32) = v154;
              *(_QWORD *)(v12 + 40) = a2;
              *(_QWORD *)(a2 + 56) = v12;
              if (v154)
                v155 = (uint64_t *)(v154 + 24);
              else
                v155 = v11;
              *v155 = v12;
              v10 = v280;
            }
            else
            {
              if (v12)
                goto LABEL_260;
              v10 = v280;
            }
            v7 = v276;
            if (v10 < v276)
              continue;
LABEL_430:
            process_emphasis(v5, (uint64_t *)&v274, 0);
            while ((_QWORD)v283)
              remove_delimiter(&v274, (_QWORD *)v283);
            while (1)
            {
              result = *((_QWORD *)&v283 + 1);
              if (!*((_QWORD *)&v283 + 1))
                break;
              *((_QWORD *)&v283 + 1) = **((_QWORD **)&v283 + 1);
              ((void (*)(void))v274[2])();
            }
            return result;
          case '^':
            v74 = v10 + 1;
            if (v10 + 1 >= v7)
              goto LABEL_104;
            if (*(_BYTE *)(v275 + v74) == 91)
            {
              v280 = v10 + 2;
              v12 = (*v274)(1, 184);
              cmark_strbuf_init((uint64_t)v274, (uint64_t *)v12, 0);
              *(_WORD *)(v12 + 100) = -16383;
              *(_QWORD *)(v12 + 144) = "^[";
              *(_QWORD *)(v12 + 152) = 2;
              v124 = v279;
              v125 = v282 + v281 + 1;
              *(_DWORD *)(v12 + 80) = v279;
              *(_DWORD *)(v12 + 84) = v125 + v10;
              *(_DWORD *)(v12 + 88) = v124;
              *(_DWORD *)(v12 + 92) = v125 + v74;
              autolink = push_bracket((uint64_t)&v274, 2u, v12);
            }
            else
            {
              if (!*(_BYTE *)(v275 + v74))
                cmark_parse_inlines_cold_1(autolink, a2, a3);
LABEL_104:
              v12 = 0;
            }
            goto LABEL_228;
          case '_':
            goto LABEL_16;
            v75 = v7 - v10;
            v76 = 1;
            v77 = (unsigned __int8 *)(v275 + v10);
            v78 = v10;
            while (1)
            {
              v80 = *v77++;
              v79 = v80;
              if (v80 != 96)
                break;
              v280 = ++v78;
              ++v76;
              if (v7 == v78)
              {
                v78 = v7;
                goto LABEL_114;
              }
            }
            if (!v79)
              cmark_parse_inlines_cold_1(autolink, a2, a3);
            v75 = v76 - 1;
LABEL_114:
            if (v75 > 80 || BYTE4(v303[2]) && *((_DWORD *)&v284 + v75) <= v78)
              goto LABEL_226;
            v81 = v78;
            while (1)
            {
              if (v81 < v7)
              {
                v82 = v7 - (uint64_t)v81;
                v83 = (unsigned __int8 *)(v13 + v81);
                while (1)
                {
                  v85 = *v83++;
                  v84 = v85;
                  if (v85 == 96)
                    break;
                  if (!v84)
                    cmark_parse_inlines_cold_1(autolink, a2, a3);
                  v280 = ++v81;
                  if (!--v82)
                    goto LABEL_225;
                }
              }
              v86 = v7 - v81;
              if (v7 <= v81)
                break;
              v87 = 0;
              while (*(_BYTE *)(v13 + v81 + v87) == 96)
              {
                v280 = v81 + v87++ + 1;
                if (v7 - (uint64_t)v81 == v87)
                {
                  v81 = v7;
                  goto LABEL_131;
                }
              }
              if (!*(_BYTE *)(v13 + v81 + v87))
                cmark_parse_inlines_cold_1(autolink, a2, a3);
              v81 += v87;
              v86 = v87;
LABEL_131:
              if (v86 <= 0x50)
                *((_DWORD *)&v284 + v86) = v81 - v86;
              if (v86 == v75)
              {
                if (v81)
                {
                  v304 = v274;
                  v305 = &cmark_strbuf__initbuf;
                  v306 = 0;
                  v88 = v81 - v78;
                  cmark_strbuf_set((char *)&v304, (char *)(v13 + v78), (v81 - v78 - v75));
                  v89 = HIDWORD(v306);
                  if (SHIDWORD(v306) < 1)
                  {
                    v92 = 0;
                    goto LABEL_356;
                  }
                  v90 = 0;
                  v91 = 0;
                  v92 = 0;
                  v93 = v305;
                  while (1)
                  {
                    v94 = v93[v90];
                    if (v94 == 10)
                      break;
                    if (v94 != 13)
                      goto LABEL_142;
                    if (v93[v90 + 1] != 10)
                      break;
                    v95 = 13;
                    ++v90;
LABEL_143:
                    v91 |= v95 != 32;
                    if (v90 >= v89)
                    {
                      if ((v91 & 1) != 0 && *v93 == 32 && v93[v92 - 1] == 32)
                      {
                        cmark_strbuf_drop(&v304, 1);
                        v92 -= 2;
                      }
LABEL_356:
                      cmark_strbuf_truncate((uint64_t)&v304, v92);
                      v220 = v81 + ~v75;
                      v221 = HIDWORD(v306);
                      v222 = cmark_strbuf_detach((uint64_t)&v304);
                      v223 = v221 | 0x100000000;
                      v12 = (*v274)(1, 184);
                      cmark_strbuf_init((uint64_t)v274, (uint64_t *)v12, 0);
                      *(_QWORD *)(v12 + 144) = v222;
                      *(_QWORD *)(v12 + 152) = v223;
                      v224 = v281;
                      v225 = v279;
                      v226 = v282 + 1;
                      v227 = v281 + v78 + v282 + 1;
                      *(_DWORD *)(v12 + 80) = v279;
                      *(_DWORD *)(v12 + 84) = v227;
                      *(_WORD *)(v12 + 100) = -16380;
                      *(_DWORD *)(v12 + 88) = v225;
                      *(_DWORD *)(v12 + 92) = v220 + v224 + v226;
                      *(_DWORD *)(v12 + 104) = v75;
                      autolink = adjust_subj_node_newlines((uint64_t)&v274, v12, v88, v75, v272);
LABEL_227:
                      v11 = (uint64_t *)(a2 + 48);
                      goto LABEL_228;
                    }
                  }
                  LOBYTE(v94) = 32;
LABEL_142:
                  v93[v92++] = v94;
                  v93 = v305;
                  v89 = HIDWORD(v306);
                  v95 = v305[v90++];
                  goto LABEL_143;
                }
LABEL_226:
                v280 = v78;
                v12 = (*v274)(1, 184);
                autolink = cmark_strbuf_init((uint64_t)v274, (uint64_t *)v12, 0);
                *(_QWORD *)(v12 + 144) = v14;
                *(_QWORD *)(v12 + 152) = v75;
                v135 = v279;
                v136 = v10 + v282 + v281;
                *(_DWORD *)(v12 + 80) = v279;
                *(_DWORD *)(v12 + 84) = v136 + 1;
                *(_WORD *)(v12 + 100) = -16383;
                *(_DWORD *)(v12 + 88) = v135;
                *(_DWORD *)(v12 + 92) = v136 + v75;
                goto LABEL_227;
              }
            }
LABEL_225:
            BYTE4(v303[2]) = 1;
            goto LABEL_226;
          default:
            if (v15 != 60)
              goto LABEL_228;
            v280 = v10 + 1;
            v36 = _scan_at((uint64_t (*)(uint64_t))_scan_autolink_uri, &v275, v10 + 1);
            v37 = (v36 - 1);
            if (v36 >= 1)
            {
              v38 = (unsigned __int8 *)(v275 + v280);
              v280 += v36;
              v39 = v280 - 1;
              v40 = v280 - 1 - v36;
              v41 = 0;
LABEL_157:
              autolink = make_autolink((uint64_t)&v274, v40, v39, v38, v37, v41);
              v12 = autolink;
              goto LABEL_228;
            }
            v108 = _scan_at((uint64_t (*)(uint64_t))_scan_autolink_email, &v275, v280);
            v109 = v280;
            v37 = (v108 - 1);
            if (v108 >= 1)
            {
              v38 = (unsigned __int8 *)(v275 + v280);
              v280 += v108;
              v39 = v280 - 1;
              v40 = v280 - 1 - v108;
              v41 = 1;
              goto LABEL_157;
            }
            if (v280 + 2 > v276)
              goto LABEL_267;
            v176 = *(unsigned __int8 *)(v275 + v280);
            if (v176 == 63)
            {
              if ((v278 & 4) != 0)
                goto LABEL_267;
              v179 = _scan_at((uint64_t (*)(uint64_t))_scan_html_pi, &v275, v280 + 1) + 3;
              if (v280 + v179 > v276)
              {
                v228 = 4;
                goto LABEL_360;
              }
            }
            else
            {
              if (v176 == 33 && (v278 & 8) == 0)
              {
                v177 = *(unsigned __int8 *)(v275 + v280 + 1);
                if (v177 != 91)
                {
                  if (v177 == 45 && *(_BYTE *)(v275 + v280 + 2) == 45)
                  {
                    v178 = *(unsigned __int8 *)(v280 + v275 + 3);
                    if (v178 == 62)
                    {
                      v179 = 4;
                      goto LABEL_354;
                    }
                    if (v178 == 45 && *(_BYTE *)(v280 + v275 + 4) == 62)
                    {
                      v179 = 5;
LABEL_354:
                      v214 = v280;
                      v215 = v280 + v275 - 1;
                      v280 += v179;
                      v216 = v280;
                      v12 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))*v274)(1, 184, v109);
                      cmark_strbuf_init((uint64_t)v274, (uint64_t *)v12, 0);
                      *(_WORD *)(v12 + 100) = -16379;
                      *(_QWORD *)(v12 + 144) = v215;
                      *(_QWORD *)(v12 + 152) = (v179 + 1);
                      v11 = (uint64_t *)(a2 + 48);
                      v217 = v279;
                      v218 = v281 + v282;
                      v219 = v281 + v282 + v214;
                      *(_DWORD *)(v12 + 80) = v279;
                      *(_DWORD *)(v12 + 84) = v219;
                      *(_DWORD *)(v12 + 88) = v217;
                      *(_DWORD *)(v12 + 92) = v218 + v216;
                      autolink = adjust_subj_node_newlines((uint64_t)&v274, v12, v179, 1, v272);
                      goto LABEL_228;
                    }
                    v265 = _scan_at((uint64_t (*)(uint64_t))_scan_html_comment, &v275, v280 + 1);
                    if (v265 >= 1)
                    {
                      v179 = v265 + 1;
                      goto LABEL_354;
                    }
                    v228 = 8;
                    goto LABEL_360;
                  }
                  if ((v278 & 2) == 0)
                  {
                    v229 = _scan_at((uint64_t (*)(uint64_t))_scan_html_declaration, &v275, v280 + 1);
                    if (v229 >= 1)
                    {
                      v179 = v229 + 2;
                      if (v280 + v229 + 2 <= v276)
                        goto LABEL_354;
                      v228 = 2;
                      goto LABEL_360;
                    }
                  }
LABEL_267:
                  v160 = v280;
                  if ((v272 & 0x1000) != 0
                    && (v161 = _scan_at((uint64_t (*)(uint64_t))_scan_liberal_html_tag, &v275, v280),
                        v160 = v280,
                        v161 >= 1))
                  {
                    v162 = v161;
                    v163 = (v161 + 1);
                    v164 = v280 + v275 - 1;
                    v280 += v161;
                    v165 = v280;
                    v12 = (*v274)(1, 184);
                    cmark_strbuf_init((uint64_t)v274, (uint64_t *)v12, 0);
                    *(_WORD *)(v12 + 100) = -16379;
                    *(_QWORD *)(v12 + 144) = v164;
                    *(_QWORD *)(v12 + 152) = v163;
                    v166 = v279;
                    v167 = v281 + v282;
                    v168 = v281 + v282 + v160;
                    *(_DWORD *)(v12 + 80) = v279;
                    *(_DWORD *)(v12 + 84) = v168;
                    *(_DWORD *)(v12 + 88) = v166;
                    *(_DWORD *)(v12 + 92) = v167 + v165;
                    autolink = adjust_subj_node_newlines((uint64_t)&v274, v12, v162, 1, v272);
                  }
                  else
                  {
                    v12 = (*v274)(1, 184);
                    autolink = cmark_strbuf_init((uint64_t)v274, (uint64_t *)v12, 0);
                    *(_WORD *)(v12 + 100) = -16383;
                    *(_QWORD *)(v12 + 144) = "<";
                    *(_QWORD *)(v12 + 152) = 1;
                    v174 = v279;
                    v175 = v282 + v160 + v281;
                    *(_DWORD *)(v12 + 80) = v279;
                    *(_DWORD *)(v12 + 84) = v175;
                    *(_DWORD *)(v12 + 88) = v174;
                    *(_DWORD *)(v12 + 92) = v175;
                  }
                  goto LABEL_227;
                }
                if ((v278 & 1) != 0)
                  goto LABEL_267;
                v264 = _scan_at((uint64_t (*)(uint64_t))_scan_html_cdata, &v275, v280 + 2);
                if (v264 < 1)
                  goto LABEL_267;
                v179 = v264 + 5;
                if (v280 + v264 + 5 <= v276)
                  goto LABEL_354;
                v228 = 1;
LABEL_360:
                v278 |= v228;
                goto LABEL_267;
              }
              v179 = _scan_at((uint64_t (*)(uint64_t))_scan_html_tag, &v275, v280);
            }
            if (v179 >= 1)
              goto LABEL_354;
            goto LABEL_267;
        }
    }
  }
}

uint64_t match(uint64_t a1, uint64_t (***a2)(uint64_t, uint64_t), uint64_t a3, int a4, _DWORD *a5)
{
  uint64_t v9;
  uint64_t chunk;
  int offset;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  int v20;
  _DWORD *v21;
  unint64_t v22;
  int column;
  unsigned __int8 v24;
  unint64_t v26;
  unint64_t i;
  unint64_t v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  int v33;
  uint64_t v34;
  const char *v35;
  unint64_t v36;
  size_t v37;
  int v38;
  size_t v39;
  unint64_t v40;
  unint64_t v41;
  int v42;
  unint64_t v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int line;
  int v49;
  uint64_t v50;
  _QWORD *v51;
  int v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55[2];
  uint64_t v56;

  if (cmark_inline_parser_in_bracket((uint64_t)a5, 0)
    || cmark_inline_parser_in_bracket((uint64_t)a5, 1))
  {
    return 0;
  }
  if (a4 != 119)
  {
    if (a4 != 58)
      return 0;
    chunk = cmark_inline_parser_get_chunk((uint64_t)a5);
    offset = cmark_inline_parser_get_offset((uint64_t)a5);
    v13 = *(int *)(chunk + 8) - (uint64_t)offset;
    if (v13 < 4)
      return 0;
    v14 = offset;
    v15 = *(_QWORD *)chunk + offset;
    if (*(_BYTE *)(v15 + 1) != 47 || *(_BYTE *)(v15 + 2) != 47)
      return 0;
    v50 = offset;
    v51 = (_QWORD *)chunk;
    v52 = offset;
    if (offset < 1)
    {
      v18 = 0;
    }
    else
    {
      v16 = 0;
      v17 = offset + *(_QWORD *)chunk - 1;
      while (cmark_isalpha(*(_BYTE *)(v17 + v16)))
      {
        --v16;
        if (!(v14 + v16))
        {
          v18 = v14;
          goto LABEL_36;
        }
      }
      v18 = -(int)v16;
    }
LABEL_36:
    v34 = 0;
    v53 = v13;
    v54 = v15;
    v35 = (const char *)(v15 - v18);
    v49 = v18;
    v36 = v13 + v18;
    while (1)
    {
      v37 = strlen(sd_autolink_issafe_valid_uris[v34]);
      v38 = v36 - v37;
      if (v36 > v37)
      {
        v39 = v37;
        if (!strncasecmp(v35, sd_autolink_issafe_valid_uris[v34], v37)
          && is_valid_hostchar((unsigned __int8 *)&v35[v39], v38))
        {
          break;
        }
      }
      v9 = 0;
      if (++v34 == 3)
        return v9;
    }
    v40 = check_domain(v54 + 3, v53 - 3, 1);
    if (!v40)
      return 0;
    v41 = v40 + 3;
    if (v40 + 3 >= v53)
    {
      v42 = v52;
    }
    else
    {
      v42 = v52;
      do
      {
        if (cmark_isspace(*(_BYTE *)(v54 + v41)))
          break;
        if (*(_BYTE *)(v54 + v41) == 60)
          break;
        ++v41;
      }
      while (v41 < v53);
    }
    v43 = autolink_delim(v54, v41);
    if (!v43)
      return 0;
    v44 = v43;
    cmark_inline_parser_set_offset((uint64_t)a5, v42 + v43);
    cmark_node_unput(a3, v49);
    v9 = cmark_node_new_with_mem(0xC009u, *a2);
    v45 = v50 - v49;
    v46 = (v49 + v44);
    v47 = *v51 + v45;
    *(_QWORD *)(v9 + 144) = v47;
    *(_QWORD *)(v9 + 152) = v46;
    v31 = cmark_node_new_with_mem(0xC001u, *a2);
    *(_QWORD *)(v31 + 144) = v47;
    *(_QWORD *)(v31 + 152) = v46;
    cmark_node_append_child((_QWORD *)v9, (_QWORD *)v31);
    line = cmark_inline_parser_get_line((uint64_t)a5);
    *(_DWORD *)(v31 + 88) = line;
    *(_DWORD *)(v9 + 88) = line;
    *(_DWORD *)(v31 + 80) = line;
    *(_DWORD *)(v9 + 80) = line;
    *(_DWORD *)(v31 + 84) = v45;
    *(_DWORD *)(v9 + 84) = v45;
    goto LABEL_33;
  }
  v19 = cmark_inline_parser_get_chunk((uint64_t)a5);
  v20 = cmark_inline_parser_get_offset((uint64_t)a5);
  v21 = (_DWORD *)(*(_QWORD *)v19 + v20);
  v22 = *(int *)(v19 + 8) - (uint64_t)v20;
  column = cmark_inline_parser_get_column(a5);
  if (v20)
  {
    v24 = *((_BYTE *)v21 - 1);
    if (!memchr("*_~(", v24, 5uLL))
    {
      if (!cmark_isspace(v24) || v22 < 4)
        return 0;
      goto LABEL_24;
    }
  }
  if (v22 >= 4)
  {
LABEL_24:
    if (*v21 != 779581303)
      return 0;
    v26 = check_domain((uint64_t)v21, v22, 0);
    if (!v26)
      return 0;
    for (i = v26; i < v22 && !cmark_isspace(*((_BYTE *)v21 + i)) && *((_BYTE *)v21 + i) != 60; ++i)
      ;
    v28 = autolink_delim((uint64_t)v21, i);
    if (!v28)
      return 0;
    v29 = v28;
    cmark_inline_parser_set_offset((uint64_t)a5, v20 + v28);
    v9 = cmark_node_new_with_mem(0xC009u, *a2);
    v55[0] = 0;
    v55[1] = 0;
    v56 = 0;
    cmark_strbuf_init((uint64_t)*a2, v55, 10);
    cmark_strbuf_puts(v55, "http://");
    cmark_strbuf_put(v55, v21, v29);
    v30 = HIDWORD(v56);
    *(_QWORD *)(v9 + 144) = cmark_strbuf_detach((uint64_t)v55);
    *(_QWORD *)(v9 + 152) = v30 | 0x100000000;
    v31 = cmark_node_new_with_mem(0xC001u, *a2);
    *(_QWORD *)(v31 + 144) = *(_QWORD *)v19 + v20;
    *(_QWORD *)(v31 + 152) = v29;
    cmark_node_append_child((_QWORD *)v9, (_QWORD *)v31);
    v32 = cmark_inline_parser_get_line((uint64_t)a5);
    *(_DWORD *)(v31 + 88) = v32;
    *(_DWORD *)(v9 + 88) = v32;
    *(_DWORD *)(v31 + 80) = v32;
    *(_DWORD *)(v9 + 80) = v32;
    *(_DWORD *)(v31 + 84) = column - 1;
    *(_DWORD *)(v9 + 84) = column - 1;
LABEL_33:
    v33 = cmark_inline_parser_get_column(a5);
    *(_DWORD *)(v31 + 92) = v33 - 1;
    *(_DWORD *)(v9 + 92) = v33 - 1;
    return v9;
  }
  return 0;
}

_DWORD *match_0(uint64_t a1, uint64_t a2, uint64_t a3, int a4, _DWORD *a5)
{
  int v7;
  _DWORD *v8;
  int line;
  uint64_t v11;
  uint64_t v12;
  char __s[101];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (a4 != 126)
    return 0;
  v11 = 0;
  v12 = 0;
  v7 = cmark_inline_parser_scan_delimiters((uint64_t)a5, 100, 126, (_BOOL4 *)&v12 + 1, (_BOOL4 *)&v12, (_DWORD *)&v11 + 1, &v11);
  __memset_chk();
  __s[v7] = 0;
  v8 = (_DWORD *)cmark_node_new_with_mem(0xC001u, *(uint64_t (***)(uint64_t, uint64_t))a2);
  cmark_node_set_literal((uint64_t)v8, __s);
  line = cmark_inline_parser_get_line((uint64_t)a5);
  v8[22] = line;
  v8[20] = line;
  v8[21] = cmark_inline_parser_get_column(a5) - v7;
  if (v12 && (v7 == 2 || v7 == 1 && (*(_DWORD *)(a2 + 120) & 0x4000) == 0))
    cmark_inline_parser_push_delimiter((uint64_t)a5, 126, SHIDWORD(v12), v12, (uint64_t)v8);
  return v8;
}

uint64_t cmark_inline_parser_in_bracket(uint64_t a1, int a2)
{
  unsigned __int8 *v2;

  v2 = *(unsigned __int8 **)(a1 + 64);
  if (!v2)
    return 0;
  if (a2 == 2)
    return v2[28];
  if (a2 != 1)
  {
    if (!a2)
      return v2[26];
    return 0;
  }
  return v2[27];
}

void process_emphasis(uint64_t a1, uint64_t *a2, int a3)
{
  uint64_t i;
  _DWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *j;
  uint64_t v13;
  uint64_t **v14;
  _QWORD *v15;
  int v16;
  int v17;
  int v18;
  BOOL v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  int v33;
  _BOOL4 v35;
  int v36;
  _QWORD *v37;
  _QWORD *v38;
  BOOL v39;
  uint64_t v40;
  uint64_t v41;
  __int16 v42;
  _QWORD *v43;
  _QWORD *v44;
  uint64_t v45;
  _QWORD *v46;
  BOOL v47;
  __int128 v48;
  uint64_t v49;
  int v50;
  _BOOL4 v51;
  _QWORD *v52;
  int v53;
  int v54;
  _BYTE v55[1536];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  bzero(v55, 0x600uLL);
  for (i = 0; i != 1536; i += 512)
  {
    v7 = &v55[i];
    v7[42] = a3;
    v7[95] = a3;
    v7[39] = a3;
    v7[34] = a3;
  }
  v8 = a2[7];
  if (!v8)
    return;
  if (*(_DWORD *)(v8 + 24) >= a3)
  {
    v10 = a2[7];
    while (1)
    {
      v9 = v10;
      v10 = *(_QWORD *)v10;
      if (!v10)
        break;
      if (*(_DWORD *)(v10 + 24) < a3)
        goto LABEL_9;
    }
  }
  else
  {
    v9 = 0;
LABEL_9:
    if (!v9)
      goto LABEL_98;
  }
  v49 = a1;
  do
  {
    v11 = *(unsigned __int8 *)(v9 + 32);
    for (j = *(_QWORD **)(a1 + 144); j; j = (_QWORD *)*j)
    {
      v13 = j[1];
      v14 = (uint64_t **)(v13 + 32);
      while (1)
      {
        v14 = (uint64_t **)*v14;
        if (!v14)
          break;
        if ((_DWORD)v11 == *((unsigned __int8 *)v14 + 8))
          goto LABEL_18;
      }
    }
    v13 = 0;
LABEL_18:
    if (!*(_DWORD *)(v9 + 40))
    {
      v21 = *(_QWORD *)(v9 + 8);
      goto LABEL_94;
    }
    v15 = *(_QWORD **)v9;
    if (*(_QWORD *)v9)
    {
      do
      {
        v16 = *((_DWORD *)v15 + 6);
        if (v16 < a3)
          break;
        v17 = *(_DWORD *)(v9 + 28);
        v18 = v17 % 3;
        if (v16 < *(_DWORD *)&v55[512 * (uint64_t)(v17 % 3) + 4 * v11])
          break;
        if (*((_DWORD *)v15 + 9) && *((unsigned __int8 *)v15 + 32) == (_DWORD)v11)
        {
          if (*(_DWORD *)(v9 + 36))
          {
            if (!v18)
              goto LABEL_37;
          }
          else
          {
            if (v18)
              v19 = *((_DWORD *)v15 + 10) == 0;
            else
              v19 = 1;
            if (v19)
            {
LABEL_37:
              v20 = 1;
              if (v13)
                goto LABEL_34;
              goto LABEL_38;
            }
          }
          if ((715827882 - 1431655765 * (*((_DWORD *)v15 + 7) + v17)) > 0x55555554)
            goto LABEL_37;
        }
        v15 = (_QWORD *)*v15;
      }
      while (v15);
    }
    v20 = 0;
    if (v13)
    {
LABEL_34:
      if (v20)
      {
        v21 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t *, _QWORD *, uint64_t))(v13 + 24))(v13, a1, a2, v15, v9);
        goto LABEL_94;
      }
LABEL_91:
      v21 = *(_QWORD *)(v9 + 8);
      goto LABEL_92;
    }
LABEL_38:
    if (*(unsigned __int8 *)(v9 + 32) > 0x29u)
    {
      if ((_DWORD)v11 != 95)
      {
        v21 = v9;
        if ((_DWORD)v11 != 42)
          goto LABEL_89;
      }
      if (v20)
      {
        v30 = v15[2];
        v31 = *(_QWORD *)(v9 + 16);
        v32 = *(_DWORD *)(v30 + 152);
        v33 = *(_DWORD *)(v31 + 152);
        v35 = v33 < 2 || v32 < 2;
        v50 = *(_DWORD *)(v30 + 152);
        v51 = v35;
        if (v35)
          v36 = 1;
        else
          v36 = 2;
        v53 = v36;
        v54 = *(_DWORD *)(v31 + 152);
        *(_DWORD *)(v30 + 152) = v32 - v36;
        *(_DWORD *)(v31 + 152) = v33 - v36;
        v37 = *(_QWORD **)v9;
        if (*(_QWORD *)v9 && v37 != v15)
        {
          do
          {
            v38 = (_QWORD *)*v37;
            remove_delimiter(a2, v37);
            if (v38)
              v39 = v38 == v15;
            else
              v39 = 1;
            v37 = v38;
          }
          while (!v39);
        }
        v40 = *a2;
        v41 = (*(uint64_t (**)(uint64_t, uint64_t))*a2)(1, 184);
        cmark_strbuf_init(v40, (uint64_t *)v41, 0);
        if (v51)
          v42 = -16377;
        else
          v42 = -16376;
        *(_WORD *)(v41 + 100) = v42;
        v52 = (_QWORD *)v30;
        v43 = *(_QWORD **)(v30 + 24);
        if (v43 && v43 != (_QWORD *)v31)
        {
          do
          {
            v44 = (_QWORD *)v43[3];
            cmark_node_unlink(v43);
            v45 = *(_QWORD *)(v41 + 56);
            v43[3] = 0;
            v43[4] = v45;
            v43[5] = v41;
            *(_QWORD *)(v41 + 56) = v43;
            if (v45)
              v46 = (_QWORD *)(v45 + 24);
            else
              v46 = (_QWORD *)(v41 + 48);
            *v46 = v43;
            if (v44)
              v47 = v44 == (_QWORD *)v31;
            else
              v47 = 1;
            v43 = v44;
          }
          while (!v47);
        }
        cmark_node_insert_after((uint64_t)v52, (_QWORD *)v41);
        *(_QWORD *)&v48 = v52[10];
        *((_QWORD *)&v48 + 1) = *(_QWORD *)(v31 + 88);
        *(_OWORD *)(v41 + 80) = v48;
        if (v50 == v53)
        {
          cmark_node_free(v52);
          remove_delimiter(a2, v15);
        }
        v21 = v9;
        a1 = v49;
        if (v54 == v53)
        {
          cmark_node_free((_QWORD *)v31);
          v21 = *(_QWORD *)(v9 + 8);
          remove_delimiter(a2, (_QWORD *)v9);
        }
LABEL_89:
        if ((v20 & 1) != 0)
          goto LABEL_94;
        goto LABEL_92;
      }
      goto LABEL_91;
    }
    if ((_DWORD)v11 != 34)
    {
      v21 = v9;
      if ((_DWORD)v11 != 39)
        goto LABEL_89;
    }
    v22 = *(_QWORD *)(v9 + 16);
    v23 = (_QWORD *)(v22 + 144);
    if (*(_DWORD *)(v22 + 156))
      (*(void (**)(_QWORD))(*a2 + 16))(*v23);
    *v23 = 0;
    v23[1] = 0;
    v24 = *(_QWORD *)(v9 + 16);
    if (*(_BYTE *)(v9 + 32) == 39)
      v25 = "’";
    else
      v25 = "”";
    *(_QWORD *)(v24 + 144) = v25;
    *(_QWORD *)(v24 + 152) = 3;
    v21 = *(_QWORD *)(v9 + 8);
    if (v20)
    {
      v26 = v15[2];
      v27 = (_QWORD *)(v26 + 144);
      if (*(_DWORD *)(v26 + 156))
        (*(void (**)(_QWORD))(*a2 + 16))(*v27);
      *v27 = 0;
      v27[1] = 0;
      v28 = v15[2];
      if (*(_BYTE *)(v9 + 32) == 39)
        v29 = "‘";
      else
        v29 = "“";
      *(_QWORD *)(v28 + 144) = v29;
      *(_QWORD *)(v28 + 152) = 3;
      remove_delimiter(a2, v15);
      remove_delimiter(a2, (_QWORD *)v9);
      goto LABEL_94;
    }
LABEL_92:
    *(_DWORD *)&v55[512 * (uint64_t)(*(_DWORD *)(v9 + 28) % 3) + 4 * *(unsigned __int8 *)(v9 + 32)] = *(_DWORD *)(v9 + 24);
    if (!*(_DWORD *)(v9 + 36))
      remove_delimiter(a2, (_QWORD *)v9);
LABEL_94:
    v9 = v21;
  }
  while (v21);
  while (1)
  {
    v8 = a2[7];
LABEL_98:
    if (!v8 || *(_DWORD *)(v8 + 24) < a3)
      break;
    remove_delimiter(a2, (_QWORD *)v8);
  }
}

uint64_t try_opening_table_block(uint64_t a1, int a2, uint64_t a3, uint64_t a4, char *a5, int a6)
{
  int type;
  uint64_t v13;
  unint64_t v14;
  int first_nonspace;
  uint64_t v17;
  int v18;
  unsigned __int16 *v19;
  unsigned __int16 *v20;
  const char *string_content;
  int v22;
  unsigned __int16 *v23;
  unsigned __int16 *v24;
  uint64_t v25;
  int v26;
  int v27;
  unsigned __int16 *v28;
  int v29;
  char *v30;
  uint64_t *v31;
  unsigned __int16 *v32;
  uint64_t v33;
  unsigned int v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unsigned __int8 *v38;
  int v39;
  int v40;
  char v42;
  uint64_t v43;
  int v44;
  int v45;
  int v46;
  _BYTE *v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  int v54;
  int v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  int v59;
  unsigned __int16 *v60;
  unsigned __int16 *v61;
  int v62;
  uint64_t v63;
  unint64_t v64;
  unsigned int v65;
  unint64_t v66;
  unint64_t v67;
  uint64_t *v68;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  int v73;
  uint64_t v74;
  BOOL v75;
  uint64_t v76;
  unint64_t v77;
  unint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  int v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  int v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  int v91;
  int offset;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  char *v96;
  int v97;
  int v98;
  unsigned __int16 *v99;
  int v100;

  type = cmark_node_get_type(a4);
  if (!a2 && type == 32776)
  {
    if (((unsigned __int16)CMARK_NODE__TABLE_VISITED & *(_WORD *)(a4 + 102)) == 0)
    {
      first_nonspace = cmark_parser_get_first_nonspace(a3);
      if (_ext_scan_at((uint64_t (*)(uint64_t))_scan_table_start, (uint64_t)a5, a6, first_nonspace))
      {
        v17 = (uint64_t)&a5[(int)cmark_parser_get_first_nonspace(a3)];
        v18 = cmark_parser_get_first_nonspace(a3);
        v19 = row_from_string((uint64_t *)a3, v17, a6 - v18);
        if (v19)
        {
          v20 = v19;
          cmark_arena_push();
          string_content = (const char *)cmark_node_get_string_content(a4);
          v22 = strlen(string_content);
          v23 = row_from_string((uint64_t *)a3, (uint64_t)string_content, v22);
          if (v23)
          {
            v24 = v23;
            if (*v23 == *v20)
            {
              if (!cmark_arena_pop())
              {
LABEL_18:
                if (cmark_node_set_type(a4, CMARK_NODE_TABLE))
                {
                  v29 = *((_DWORD *)v24 + 1);
                  if (v29)
                  {
                    v30 = (char *)cmark_node_new_with_mem(0x8008u, *(uint64_t (***)(uint64_t, uint64_t))a3);
                    v31 = unescape_pipes(*(uint64_t (***)(uint64_t, uint64_t))a3, string_content, v29);
                    cmark_strbuf_trim((uint64_t)v31);
                    cmark_node_set_string_content(v30, (char *)v31[1]);
                    cmark_strbuf_free((uint64_t)v31);
                    (*(void (**)(uint64_t *))(*(_QWORD *)a3 + 16))(v31);
                    if (!cmark_node_insert_before(a4, v30))
                      (*(void (**)(char *))(*(_QWORD *)a3 + 16))(v30);
                  }
                  cmark_node_set_syntax_extension(a4, a1);
                  v32 = (unsigned __int16 *)(**(uint64_t (***)(uint64_t, uint64_t))a3)(1, 24);
                  *(_QWORD *)(a4 + 144) = v32;
                  if (CMARK_NODE_TABLE == *(unsigned __int16 *)(a4 + 100))
                    *v32 = *v24;
                  v33 = (**(uint64_t (***)(_QWORD, uint64_t))a3)(*v20, 1);
                  v34 = *v20;
                  if (*v20)
                  {
                    v35 = 0;
                    v36 = 0;
                    do
                    {
                      v37 = *(_QWORD *)(*((_QWORD *)v20 + 1) + v35);
                      v38 = *(unsigned __int8 **)(v37 + 8);
                      v39 = *v38;
                      v40 = v38[*(int *)(v37 + 20) - 1];
                      if (v39 == 58 || v40 == 58)
                      {
                        if (v40 == 58 && v39 == 58)
                          v42 = 99;
                        else
                          v42 = 108;
                        if (v39 != 58)
                          v42 = 114;
                        *(_BYTE *)(v33 + v36) = v42;
                        v34 = *v20;
                      }
                      ++v36;
                      v35 += 32;
                    }
                    while (v36 < v34);
                  }
                  if (CMARK_NODE_TABLE == *(unsigned __int16 *)(a4 + 100))
                    *(_QWORD *)(*(_QWORD *)(a4 + 144) + 8) = v33;
                  v43 = cmark_parser_add_child(a3, a4, CMARK_NODE_TABLE_ROW, *(unsigned int *)(a4 + 84));
                  cmark_node_set_syntax_extension(v43, a1);
                  v44 = *(_DWORD *)(a4 + 84);
                  v45 = strlen(string_content);
                  v46 = *(_DWORD *)(a4 + 80);
                  *(_DWORD *)(v43 + 88) = v46;
                  *(_DWORD *)(v43 + 92) = v44 + v45 - 2;
                  *(_DWORD *)(v43 + 80) = v46;
                  v47 = (_BYTE *)(**(uint64_t (***)(uint64_t, uint64_t))a3)(1, 1);
                  *(_QWORD *)(v43 + 144) = v47;
                  *v47 = 1;
                  if (*v24)
                  {
                    v99 = v20;
                    v48 = a1;
                    v49 = 0;
                    v50 = 0;
                    v51 = CMARK_NODE_TABLE_CELL;
                    do
                    {
                      v52 = *((_QWORD *)v24 + 1) + v49;
                      v53 = cmark_parser_add_child(a3, v43, v51, (*(_DWORD *)(v52 + 8) + *(_DWORD *)(a4 + 84)));
                      v54 = *(_DWORD *)(v52 + 12);
                      *(_DWORD *)(v53 + 96) = *(_DWORD *)(v52 + 16);
                      v55 = *(_DWORD *)(a4 + 80);
                      v56 = v54 + *(_DWORD *)(a4 + 84);
                      *(_DWORD *)(v53 + 80) = v55;
                      *(_DWORD *)(v53 + 88) = v55;
                      *(_DWORD *)(v53 + 92) = v56;
                      *(_QWORD *)(v53 + 144) = *(_QWORD *)(v52 + 24);
                      *(_QWORD *)(v52 + 24) = 0;
                      cmark_node_set_string_content((char *)v53, *(char **)(*(_QWORD *)v52 + 8));
                      cmark_node_set_syntax_extension(v53, v48);
                      v51 = CMARK_NODE_TABLE_CELL;
                      if (CMARK_NODE_TABLE_CELL == *(unsigned __int16 *)(v53 + 100))
                      {
                        v57 = *(_QWORD *)(v53 + 144);
                        if (v57)
                          *(_DWORD *)(v57 + 8) = v50;
                      }
                      ++v50;
                      v49 += 32;
                    }
                    while (v50 < *v24);
                    v20 = v99;
                  }
                  else
                  {
                    LODWORD(v50) = 0;
                  }
                  if (CMARK_NODE_TABLE == *(unsigned __int16 *)(a4 + 100))
                  {
                    ++*(_DWORD *)(*(_QWORD *)(a4 + 144) + 16);
                    *(_DWORD *)(*(_QWORD *)(a4 + 144) + 20) += v50;
                  }
                  v90 = a5;
                  v91 = strlen(a5);
                  offset = cmark_parser_get_offset(a3);
                  cmark_parser_advance_offset(a3, v90, ~offset + v91, 0);
                }
                v93 = *(_QWORD *)a3;
                free_row_cells(*(_QWORD *)a3, v24);
                (*(void (**)(unsigned __int16 *))(v93 + 16))(v24);
                v94 = *(_QWORD *)a3;
                free_row_cells(v94, v20);
                (*(void (**)(unsigned __int16 *))(v94 + 16))(v20);
                return a4;
              }
              v25 = (uint64_t)&a5[(int)cmark_parser_get_first_nonspace(a3)];
              v26 = cmark_parser_get_first_nonspace(a3);
              v20 = row_from_string((uint64_t *)a3, v25, a6 - v26);
              v27 = strlen(string_content);
              v28 = row_from_string((uint64_t *)a3, (uint64_t)string_content, v27);
              v24 = v28;
              if (v20 && v28)
              {
                if (*v28 == *v20)
                  goto LABEL_18;
              }
              else if (!v20)
              {
                goto LABEL_102;
              }
              v88 = *(_QWORD *)a3;
              free_row_cells(*(_QWORD *)a3, v20);
              (*(void (**)(unsigned __int16 *))(v88 + 16))(v20);
LABEL_102:
              if (v24)
              {
                v89 = *(_QWORD *)a3;
                free_row_cells(v89, v24);
                (*(void (**)(unsigned __int16 *))(v89 + 16))(v24);
              }
              return a4;
            }
            v74 = *(_QWORD *)a3;
            free_row_cells(*(_QWORD *)a3, v20);
            (*(void (**)(unsigned __int16 *))(v74 + 16))(v20);
            v63 = *(_QWORD *)a3;
            free_row_cells(v63, v24);
          }
          else
          {
            v63 = *(_QWORD *)a3;
            free_row_cells(v63, v20);
            v24 = v20;
          }
          (*(void (**)(unsigned __int16 *))(v63 + 16))(v24);
          cmark_arena_pop();
          *(_WORD *)(a4 + 102) |= CMARK_NODE__TABLE_VISITED;
        }
      }
    }
    return a4;
  }
  v13 = 0;
  if (!a2)
  {
    v14 = 0x253CFD000uLL;
    if (type == CMARK_NODE_TABLE)
    {
      if (!cmark_parser_is_blank(a3)
        && (!a4
         || CMARK_NODE_TABLE != *(unsigned __int16 *)(a4 + 100)
         || *(_DWORD *)(*(_QWORD *)(a4 + 144) + 16) * **(unsigned __int16 **)(a4 + 144)
          - *(_DWORD *)(*(_QWORD *)(a4 + 144) + 20) <= 0x80000))
      {
        v13 = cmark_parser_add_child(a3, a4, CMARK_NODE_TABLE_ROW, *(unsigned int *)(a4 + 84));
        cmark_node_set_syntax_extension(v13, a1);
        *(_DWORD *)(v13 + 92) = *(_DWORD *)(a4 + 92);
        *(_QWORD *)(v13 + 144) = (**(uint64_t (***)(uint64_t, uint64_t))a3)(1, 1);
        v58 = (uint64_t)&a5[(int)cmark_parser_get_first_nonspace(a3)];
        v59 = cmark_parser_get_first_nonspace(a3);
        v60 = row_from_string((uint64_t *)a3, v58, a6 - v59);
        if (v60)
        {
          v61 = v60;
          if (CMARK_NODE_TABLE == *(unsigned __int16 *)(a4 + 100))
            v62 = **(unsigned __int16 **)(a4 + 144);
          else
            v62 = -1;
          LODWORD(v64) = *v60;
          if ((*(_BYTE *)(a3 + 122) & 0x10) != 0 && *v60 && v62 >= 1)
          {
            v95 = a1;
            v65 = v62;
            v66 = 0;
            v97 = v65;
            v67 = v65;
            do
            {
              v68 = (uint64_t *)(*((_QWORD *)v61 + 1) + 32 * v66);
              if (!*(_DWORD *)(v68[3] + 4))
              {
                v70 = *(_QWORD *)(v13 + 32);
                while (v70)
                {
                  v71 = cmark_node_nth_child(v70, v66);
                  if (v71)
                  {
                    if (CMARK_NODE_TABLE_CELL != *(unsigned __int16 *)(v71 + 100))
                      goto LABEL_75;
                    v72 = *(_QWORD *)(v71 + 144);
                    if (!v72)
                      goto LABEL_75;
                    v73 = *(_DWORD *)(v72 + 4);
                    if (v73)
                    {
                      *(_DWORD *)(v72 + 4) = v73 + 1;
LABEL_75:
                      cmark_strbuf_truncate(*v68, 0);
                      break;
                    }
                    v70 = *(_QWORD *)(v70 + 32);
                  }
                }
              }
              ++v66;
              v64 = *v61;
            }
            while (v66 < v64 && v66 < v67);
            a1 = v95;
            v62 = v97;
            v14 = 0x253CFD000;
          }
          if ((_DWORD)v64)
            v75 = v62 < 1;
          else
            v75 = 1;
          if (v75)
          {
            LODWORD(v77) = 0;
            if (!a4)
            {
LABEL_93:
              if ((int)v77 < v62)
              {
                do
                {
                  v84 = cmark_parser_add_child(a3, v13, CMARK_NODE_TABLE_CELL, 0);
                  cmark_node_set_syntax_extension(v84, a1);
                  if (v84)
                  {
                    if (CMARK_NODE_TABLE_CELL == *(unsigned __int16 *)(v84 + 100))
                    {
                      v85 = *(_QWORD *)(v84 + 144);
                      if (v85)
                        *(_DWORD *)(v85 + 8) = v77;
                    }
                  }
                  LODWORD(v77) = v77 + 1;
                }
                while (v62 != (_DWORD)v77);
              }
              v86 = *(_QWORD *)a3;
              free_row_cells(*(_QWORD *)a3, v61);
              (*(void (**)(unsigned __int16 *))(v86 + 16))(v61);
              v87 = cmark_parser_get_offset(a3);
              cmark_parser_advance_offset(a3, a5, ~v87 + a6, 0);
              return v13;
            }
          }
          else
          {
            v98 = v62;
            v100 = a6;
            v96 = a5;
            v76 = 0;
            v77 = 0;
            v78 = v62;
            v79 = CMARK_NODE_TABLE_CELL;
            do
            {
              v80 = *((_QWORD *)v61 + 1) + v76;
              v81 = cmark_parser_add_child(a3, v13, v79, (*(_DWORD *)(v80 + 8) + *(_DWORD *)(a4 + 84)));
              v82 = *(_DWORD *)(v80 + 16);
              *(_DWORD *)(v81 + 92) = *(_DWORD *)(v80 + 12) + *(_DWORD *)(a4 + 84);
              *(_DWORD *)(v81 + 96) = v82;
              *(_QWORD *)(v81 + 144) = *(_QWORD *)(v80 + 24);
              *(_QWORD *)(v80 + 24) = 0;
              cmark_node_set_string_content((char *)v81, *(char **)(*(_QWORD *)v80 + 8));
              cmark_node_set_syntax_extension(v81, a1);
              v79 = CMARK_NODE_TABLE_CELL;
              if (CMARK_NODE_TABLE_CELL == *(unsigned __int16 *)(v81 + 100))
              {
                v83 = *(_QWORD *)(v81 + 144);
                if (v83)
                  *(_DWORD *)(v83 + 8) = v77;
              }
              if (++v77 >= *v61)
                break;
              v76 += 32;
            }
            while (v77 < v78);
            a5 = v96;
            v62 = v98;
            a6 = v100;
            v14 = 0x253CFD000uLL;
          }
          if (*(_DWORD *)(v14 + 2476) == *(unsigned __int16 *)(a4 + 100))
          {
            ++*(_DWORD *)(*(_QWORD *)(a4 + 144) + 16);
            *(_DWORD *)(*(_QWORD *)(a4 + 144) + 20) += v77;
          }
          goto LABEL_93;
        }
        cmark_node_free((_QWORD *)v13);
      }
      return 0;
    }
  }
  return v13;
}

uint64_t cmark_strbuf_putc(uint64_t a1, char a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  result = cmark_strbuf_grow(a1, *(_DWORD *)(a1 + 20) + 1);
  v5 = *(_QWORD *)(a1 + 8);
  v6 = *(int *)(a1 + 20);
  *(_DWORD *)(a1 + 20) = v6 + 1;
  *(_BYTE *)(v5 + v6) = a2;
  *(_BYTE *)(*(_QWORD *)(a1 + 8) + *(int *)(a1 + 20)) = 0;
  return result;
}

uint64_t cmark_strbuf_detach(uint64_t a1)
{
  uint64_t v1;

  if (!*(_DWORD *)(a1 + 16))
    return (**(uint64_t (***)(uint64_t, uint64_t))a1)(1, 1);
  v1 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = &cmark_strbuf__initbuf;
  *(_QWORD *)(a1 + 16) = 0;
  return v1;
}

BOOL cmark_isspace(unsigned __int8 a1)
{
  return cmark_ctype_class[a1] == 1;
}

BOOL cmark_isdigit(unsigned __int8 a1)
{
  return cmark_ctype_class[a1] == 3;
}

uint64_t cmark_inline_parser_get_offset(uint64_t a1)
{
  return *(unsigned int *)(a1 + 32);
}

uint64_t cmark_inline_parser_get_column(_DWORD *a1)
{
  return (a1[8] + a1[10] + a1[9] + 1);
}

uint64_t cmark_inline_parser_get_chunk(uint64_t a1)
{
  return a1 + 8;
}

uint64_t _scan_open_code_fence(unsigned __int8 *a1)
{
  int v2;
  uint64_t v3;
  uint64_t result;
  unsigned __int8 *v5;
  uint64_t v6;
  unsigned __int8 *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  unsigned int v16;
  unsigned int v17;
  BOOL v18;
  uint64_t v19;
  int v20;
  int v21;
  int v22;
  unsigned int v23;

  v2 = *a1;
  if (v2 != 126)
  {
    if (v2 != 96 || a1[1] != 96 || (_scan_open_code_fence_yybm[a1[2]] & 0x10) == 0)
      return 0;
    v3 = 0;
    do
      result = a1[v3++ + 3];
    while ((_scan_open_code_fence_yybm[result] & 0x10) != 0);
    v5 = &a1[v3];
    v6 = (uint64_t)&a1[v3 + 2];
    if (result > 0xDF)
    {
      v9 = (uint64_t)(v5 + 1);
      if (result > 0xEF)
      {
        if ((_DWORD)result == 240)
          goto LABEL_60;
        v11 = (_DWORD)result == 244;
        if (result >= 0xF4)
          goto LABEL_39;
        goto LABEL_57;
      }
      if (result < 0xE1)
        goto LABEL_50;
      if ((_DWORD)result == 237)
        goto LABEL_54;
      goto LABEL_43;
    }
    if (result > 0xC)
    {
      if ((_DWORD)result == 13)
        return (v3 + 2);
      if ((result & 0x80) == 0)
        goto LABEL_45;
      if (result >= 0xC2)
        goto LABEL_44;
      return 0;
    }
    if (!(_DWORD)result)
      return result;
    if ((_DWORD)result == 10)
      return (v3 + 2);
    while (1)
    {
      do
      {
LABEL_45:
        v17 = *(unsigned __int8 *)++v6;
        v16 = v17;
      }
      while ((_scan_open_code_fence_yybm[v17] & 0x40) != 0);
      v9 = v6 - 1;
      if (v16 > 0xEC)
      {
        if (v16 > 0xF0)
        {
          v11 = v16 == 244;
          if (v16 >= 0xF4)
          {
LABEL_39:
            if (!v11)
              return 0;
            v13 = *(char *)(v9 + 2);
            v12 = v9 + 2;
            if (v13 >= -112)
              return 0;
            v6 = v12;
          }
          else
          {
LABEL_57:
            v6 = v9 + 2;
            if (*(char *)(v9 + 2) >= -64)
              return 0;
          }
          goto LABEL_43;
        }
        if (v16 >= 0xEE)
        {
          if (v16 >= 0xF0)
          {
LABEL_60:
            v6 = v9 + 2;
            if ((*(_BYTE *)(v9 + 2) + 112) >= 0x30u)
              return 0;
          }
LABEL_43:
          v14 = *(char *)++v6;
          if (v14 >= -64)
            return 0;
          goto LABEL_44;
        }
LABEL_54:
        v6 = v9 + 2;
        if (*(char *)(v9 + 2) >= -96)
          return 0;
      }
      else
      {
        if (v16 <= 0xC1)
          goto LABEL_90;
        if (v16 >= 0xE0)
        {
          if (v16 != 224)
            goto LABEL_43;
LABEL_50:
          v6 = v9 + 2;
          if ((*(_BYTE *)(v9 + 2) & 0xE0) != 0xA0)
            return 0;
        }
      }
LABEL_44:
      v15 = *(char *)++v6;
      if (v15 >= -64)
        return 0;
    }
  }
  if (a1[1] != 126 || (_scan_open_code_fence_yybm[a1[2]] & 0x20) == 0)
    return 0;
  v3 = 0;
  do
    result = a1[v3++ + 3];
  while ((_scan_open_code_fence_yybm[result] & 0x20) != 0);
  v7 = &a1[v3];
  v8 = (uint64_t)&a1[v3 + 2];
  if (result > 0xDF)
  {
    v10 = (uint64_t)(v7 + 1);
    if (result > 0xEF)
    {
      if ((_DWORD)result == 240)
        goto LABEL_85;
      v18 = (_DWORD)result == 244;
      if (result >= 0xF4)
        goto LABEL_64;
      goto LABEL_82;
    }
    if (result < 0xE1)
      goto LABEL_75;
    if ((_DWORD)result == 237)
      goto LABEL_79;
    goto LABEL_68;
  }
  if (result > 0xC)
  {
    if ((_DWORD)result == 13)
      return (v3 + 2);
    if ((result & 0x80) == 0)
      goto LABEL_70;
    if (result >= 0xC2)
      goto LABEL_69;
    return 0;
  }
  if ((_DWORD)result)
  {
    if ((_DWORD)result == 10)
      return (v3 + 2);
    while (1)
    {
      do
      {
LABEL_70:
        v23 = *(unsigned __int8 *)++v8;
        v16 = v23;
      }
      while (_scan_open_code_fence_yybm[v23] < 0);
      v10 = v8 - 1;
      if (v16 > 0xEC)
      {
        if (v16 > 0xF0)
        {
          v18 = v16 == 244;
          if (v16 >= 0xF4)
          {
LABEL_64:
            if (!v18)
              return 0;
            v20 = *(char *)(v10 + 2);
            v19 = v10 + 2;
            if (v20 >= -112)
              return 0;
            v8 = v19;
          }
          else
          {
LABEL_82:
            v8 = v10 + 2;
            if (*(char *)(v10 + 2) >= -64)
              return 0;
          }
          goto LABEL_68;
        }
        if (v16 >= 0xEE)
        {
          if (v16 >= 0xF0)
          {
LABEL_85:
            v8 = v10 + 2;
            if ((*(_BYTE *)(v10 + 2) + 112) >= 0x30u)
              return 0;
          }
LABEL_68:
          v21 = *(char *)++v8;
          if (v21 >= -64)
            return 0;
          goto LABEL_69;
        }
LABEL_79:
        v8 = v10 + 2;
        if (*(char *)(v10 + 2) >= -96)
          return 0;
      }
      else
      {
        if (v16 <= 0xC1)
        {
LABEL_90:
          if (v16 - 14 >= 0xFFFFFFF3)
            return (v3 + 2);
          return 0;
        }
        if (v16 >= 0xE0)
        {
          if (v16 != 224)
            goto LABEL_68;
LABEL_75:
          v8 = v10 + 2;
          if ((*(_BYTE *)(v10 + 2) & 0xE0) != 0xA0)
            return 0;
        }
      }
LABEL_69:
      v22 = *(char *)++v8;
      if (v22 >= -64)
        return 0;
    }
  }
  return result;
}

uint64_t _scan_html_block_start_7(_BYTE *a1)
{
  unsigned int v1;
  unsigned int v2;
  _BYTE *i;
  unsigned int v4;
  unsigned int k;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  _BYTE *v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  BOOL v16;
  unsigned int v17;
  _BYTE *v18;
  _BYTE *v19;
  unsigned int v20;
  unsigned int v21;
  _BYTE *v22;
  char v23;
  int v24;
  _BYTE *v25;
  int v26;
  char v27;
  int v28;
  int v29;
  int v30;
  _BYTE *v31;
  unsigned int v32;
  unsigned int v33;
  _BYTE *v34;
  char v35;
  int v36;
  _BYTE *v37;
  int v38;
  char v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  unsigned int v46;
  unsigned int v47;
  unsigned int v48;
  unsigned int v49;
  unsigned int v50;
  int j;
  _BYTE *v52;
  _BYTE *v53;
  unsigned int v54;
  unsigned int v55;
  int v56;
  _BOOL4 v58;

  if (*a1 != 60)
    return 0;
  v1 = a1[1];
  if (v1 <= 0x40)
  {
    if (v1 != 47)
      return 0;
    v2 = a1[2];
    if (v2 < 0x41 || v2 >= 0x5B && v2 - 97 > 0x19)
      return 0;
    for (i = a1 + 3; ; ++i)
    {
      v4 = *i;
      if (v4 > 0x2F)
      {
        if (v4 > 0x40)
        {
          if (v4 >= 0x5B && v4 - 97 >= 0x1A)
            return 0;
        }
        else if (v4 > 0x39)
        {
          goto LABEL_178;
        }
      }
      else
      {
        if (v4 <= 0x1F)
        {
          if (v4 - 9 >= 5)
            return 0;
          do
          {
LABEL_174:
            while (1)
            {
              v50 = *++i;
              v4 = v50;
              if (v50 > 0x1F)
                break;
              if (v4 - 9 > 4)
                return 0;
            }
          }
          while (v4 == 32);
LABEL_178:
          if (v4 != 62)
            return 0;
LABEL_179:
          for (j = 1; ; j = 0)
          {
            v52 = i + 2;
            v53 = i;
            do
            {
              i = v52;
              v55 = *++v53;
              v54 = v55;
              ++v52;
            }
            while ((_scan_html_block_start_7_yybm[v55] & 4) != 0);
            if (v54 < 9)
              break;
            if (v54 > 0xA)
            {
              v58 = v54 == 11 || v54 > 0xD;
              if ((v58 & j & 1) != 0)
                return 0;
              return 7;
            }
            while (1)
            {
              v56 = *i;
              if ((_scan_html_block_start_7_yybm[*i] & 4) != 0)
                break;
              ++i;
              if ((v56 - 9) >= 2)
                return 7;
            }
          }
          if ((j & 1) != 0)
            return 0;
          return 7;
        }
        if (v4 != 45)
        {
          if (v4 != 32)
            return 0;
          goto LABEL_174;
        }
      }
    }
  }
  if (v1 >= 0x5B && v1 - 97 > 0x19)
    return 0;
  v8 = a1[2];
  i = a1 + 2;
  for (k = v8; (_scan_html_block_start_7_yybm[k] & 2) == 0; k = v9)
  {
    if (k > 0x3D)
    {
      if (k > 0x5A)
      {
        if (k - 97 >= 0x1A)
          return 0;
      }
      else
      {
        if (k < 0x3F)
          goto LABEL_179;
        if (k < 0x41)
          return 0;
      }
    }
    else if (k > 0x2E)
    {
      if (k == 47)
        goto LABEL_170;
      if (k >= 0x3A)
        return 0;
    }
    else if (k != 45)
    {
      return 0;
    }
    v9 = *++i;
  }
  do
  {
LABEL_164:
    v48 = *++i;
    v47 = v48;
  }
  while ((_scan_html_block_start_7_yybm[v48] & 2) != 0);
  if (v47 <= 0x3E)
  {
    if (v47 > 0x39)
    {
      if (v47 != 58)
      {
        if (v47 < 0x3E)
          return 0;
        goto LABEL_179;
      }
      goto LABEL_46;
    }
    v16 = v47 == 47;
    goto LABEL_168;
  }
  if (v47 > 0x5E)
  {
    v10 = 0;
    if (v47 == 96 || v47 > 0x7A)
      return v10;
  }
  else if (v47 - 65 >= 0x1A)
  {
    return 0;
  }
  while (1)
  {
    do
    {
LABEL_46:
      v11 = i;
      v13 = *++i;
      v12 = v13;
    }
    while ((_scan_html_block_start_7_yybm[v13] & 8) != 0);
    if (v12 > 0x2C)
      break;
    if (v12 > 0xD)
    {
      if (v12 != 32)
        return 0;
    }
    else if (v12 < 9)
    {
      return 0;
    }
    for (i = v11 + 2; ; ++i)
    {
      v14 = *i;
      if (v14 > 0x3C)
        break;
      if (v14 > 0x20)
      {
        v16 = v14 == 47;
        if (v14 > 0x2F)
        {
          v10 = 0;
          if (v14 != 58)
            return v10;
          goto LABEL_46;
        }
LABEL_168:
        if (!v16)
          return 0;
        goto LABEL_170;
      }
      if (v14 < 9 || v14 - 14 < 0x12)
        return 0;
    }
    if (v14 > 0x5A)
    {
      if (v14 > 0x5F)
      {
        v10 = 0;
        if (v14 == 96 || v14 >= 0x7B)
          return v10;
      }
      else
      {
        v10 = 0;
        if (v14 != 95)
          return v10;
      }
    }
    else
    {
      if (v14 < 0x3E)
        goto LABEL_76;
      if (v14 == 62)
        goto LABEL_179;
      v10 = 0;
      if (v14 < 0x41)
        return v10;
    }
  }
  if (v12 <= 0x3C)
  {
    if (v12 >= 0x30)
      return 0;
    goto LABEL_170;
  }
  if (v12 != 61)
  {
    if (v12 >= 0x3F)
      return 0;
    goto LABEL_179;
  }
LABEL_76:
  ++i;
  while (1)
  {
    v17 = *i;
    if ((_scan_html_block_start_7_yybm[*i] & 0x20) != 0)
      goto LABEL_155;
    if (v17 > 0xE0)
    {
      v31 = i - 1;
      goto LABEL_141;
    }
    if (v17 > 0x22)
      break;
    if (!*i)
      return 0;
    ++i;
    if (v17 >= 0x21)
    {
      v18 = i - 1;
      while (1)
      {
        do
        {
          v19 = v18;
          v21 = *++v18;
          v20 = v21;
        }
        while ((_scan_html_block_start_7_yybm[v21] & 0x40) != 0);
        if (v20 > 0xEC)
          break;
        if (v20 <= 0xC1)
        {
          if (v20 - 1 >= 0x22)
            return 0;
LABEL_137:
          v43 = v19[2];
          i = v19 + 2;
          if ((_scan_html_block_start_7_yybm[v19[2]] & 2) == 0)
          {
            if (v43 != 47)
            {
              if (v43 != 62)
                return 0;
              goto LABEL_179;
            }
LABEL_170:
            v49 = *++i;
            v4 = v49;
            goto LABEL_178;
          }
          goto LABEL_164;
        }
        if (v20 >= 0xE0)
        {
          if (v20 != 224)
            goto LABEL_103;
          v23 = v19[2];
          v22 = v19 + 2;
          if ((v23 & 0xE0) != 0xA0)
            return 0;
LABEL_93:
          v18 = v22;
        }
LABEL_104:
        v10 = 0;
        v30 = (char)*++v18;
        if (v30 >= -64)
          return v10;
      }
      if (v20 > 0xF0)
      {
        if (v20 >= 0xF4)
        {
          if (v20 != 244)
            return 0;
          v28 = (char)v19[2];
          v25 = v19 + 2;
          if (v28 >= -112)
            return 0;
        }
        else
        {
          v26 = (char)v19[2];
          v25 = v19 + 2;
          if (v26 >= -64)
            return 0;
        }
LABEL_102:
        v18 = v25;
LABEL_103:
        v29 = (char)*++v18;
        if (v29 >= -64)
          return 0;
        goto LABEL_104;
      }
      if (v20 >= 0xEE)
      {
        if (v20 >= 0xF0)
        {
          v27 = v19[2];
          v25 = v19 + 2;
          if ((v27 + 112) >= 0x30u)
            return 0;
          goto LABEL_102;
        }
        goto LABEL_103;
      }
      v24 = (char)v19[2];
      v22 = v19 + 2;
      if (v24 >= -96)
        return 0;
      goto LABEL_93;
    }
  }
  if (v17 <= 0x27)
  {
    while (1)
    {
      do
      {
        v19 = i;
        v33 = *++i;
        v32 = v33;
      }
      while (_scan_html_block_start_7_yybm[v33] < 0);
      if (v32 > 0xEC)
      {
        if (v32 > 0xF0)
        {
          if (v32 >= 0xF4)
          {
            if (v32 != 244)
              return 0;
            v40 = (char)v19[2];
            v37 = v19 + 2;
            if (v40 >= -112)
              return 0;
          }
          else
          {
            v38 = (char)v19[2];
            v37 = v19 + 2;
            if (v38 >= -64)
              return 0;
          }
LABEL_127:
          i = v37;
LABEL_128:
          v41 = (char)*++i;
          if (v41 >= -64)
            return 0;
          goto LABEL_129;
        }
        if (v32 >= 0xEE)
        {
          if (v32 >= 0xF0)
          {
            v39 = v19[2];
            v37 = v19 + 2;
            if ((v39 + 112) >= 0x30u)
              return 0;
            goto LABEL_127;
          }
          goto LABEL_128;
        }
        v36 = (char)v19[2];
        v34 = v19 + 2;
        if (v36 >= -96)
          return 0;
      }
      else
      {
        if (v32 <= 0xC1)
        {
          if (v32 - 1 >= 0x27)
            return 0;
          goto LABEL_137;
        }
        if (v32 < 0xE0)
          goto LABEL_129;
        if (v32 != 224)
          goto LABEL_128;
        v35 = v19[2];
        v34 = v19 + 2;
        if ((v35 & 0xE0) != 0xA0)
          return 0;
      }
      i = v34;
LABEL_129:
      v10 = 0;
      v42 = (char)*++i;
      if (v42 >= -64)
        return v10;
    }
  }
  if (v17 < 0xC2)
    return 0;
  if (v17 >= 0xE0)
  {
    v31 = i - 1;
LABEL_139:
    i = v31 + 2;
    if ((v31[2] & 0xE0) != 0xA0)
      return 0;
    goto LABEL_154;
  }
  while (1)
  {
    while (1)
    {
LABEL_154:
      v45 = (char)*++i;
      if (v45 > -65)
        return 0;
      do
      {
LABEL_155:
        v46 = *++i;
        v17 = v46;
      }
      while ((_scan_html_block_start_7_yybm[v46] & 0x20) != 0);
      v31 = i - 1;
      if (v17 <= 0xE0)
        break;
LABEL_141:
      if (v17 > 0xEF)
      {
        if (v17 == 240)
        {
          i = v31 + 2;
          if ((v31[2] + 112) >= 0x30u)
            return 0;
        }
        else if (v17 >= 0xF4)
        {
          if (v17 != 244)
            return 0;
          i = v31 + 2;
          if ((char)v31[2] >= -112)
            return 0;
        }
        else
        {
          i = v31 + 2;
          if ((char)v31[2] >= -64)
            return 0;
        }
LABEL_153:
        v44 = (char)*++i;
        if (v44 >= -64)
          return 0;
      }
      else
      {
        if (v17 != 237)
          goto LABEL_153;
        i = v31 + 2;
        if ((char)v31[2] >= -96)
          return 0;
      }
    }
    if (v17 <= 0x3D)
      break;
    if (v17 == 62)
      goto LABEL_179;
    if (v17 < 0xC2)
      return 0;
    if (v17 >= 0xE0)
      goto LABEL_139;
  }
  v10 = 0;
  if (v17 - 1 < 0x20)
    goto LABEL_164;
  return v10;
}

uint64_t _scan_html_block_start(unsigned __int8 *a1)
{
  uint64_t result;
  unsigned __int8 *v3;
  unsigned int v4;
  BOOL v5;
  unsigned __int8 *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  _BYTE *v11;
  unsigned __int8 *v12;
  unsigned int v13;
  unsigned __int8 *v14;
  int v15;
  unsigned int v16;
  unsigned __int8 *v17;
  unsigned int v18;
  unsigned __int8 *v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned __int8 *v23;
  int v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  unsigned __int8 *v30;
  int v31;
  _BYTE *v32;
  int v33;
  int v34;
  unsigned int v35;
  unsigned __int8 *v36;
  int v37;
  unsigned __int8 *v38;
  int v39;
  unsigned __int8 *v40;
  int v41;
  unsigned __int8 *v42;
  int v43;
  int v44;
  BOOL v45;
  unsigned int v46;
  _BYTE *v47;
  int v48;
  unsigned __int8 *v49;
  int v50;
  unsigned __int8 *v51;
  int v52;
  unsigned int v53;
  int v54;
  int v55;
  unsigned int v56;
  unsigned __int8 *v57;
  int v58;
  int v59;
  int v60;
  unsigned __int8 *v61;
  int v62;
  int v63;
  int v64;
  BOOL v65;
  unsigned int v66;
  unsigned int v67;
  unsigned __int8 *v68;
  int v69;
  unsigned __int8 *v70;
  int v71;
  int v72;
  unsigned __int8 *v73;
  int v74;
  unsigned int v75;
  int v76;
  _BYTE *v77;
  int v78;
  int v79;
  unsigned __int8 *v80;
  int v81;
  int v82;
  unsigned int v83;
  int v84;
  int v85;
  int v86;
  unsigned int v87;
  int v88;
  int v89;
  unsigned int v91;
  unsigned int v92;
  unsigned int v93;
  unsigned int v94;
  unsigned __int8 *v95;
  int v96;
  unsigned __int8 *v97;
  int v98;
  int v99;
  int v100;
  int v101;
  unsigned int v102;
  unsigned __int8 *v103;
  unsigned int v104;
  BOOL v105;
  int v106;
  int v107;
  int v108;
  int v109;
  unsigned __int8 *v110;
  int v111;
  int v112;
  int v113;
  int v114;

  if (*a1 != 60)
    return 0;
  result = 0;
  v3 = a1 + 1;
  switch(a1[1])
  {
    case '/':
      result = 0;
      v3 = a1 + 2;
      switch(a1[2])
      {
        case 'A':
        case 'a':
          goto LABEL_3;
        case 'B':
        case 'b':
          goto LABEL_33;
        case 'C':
        case 'c':
          goto LABEL_37;
        case 'D':
        case 'd':
          goto LABEL_41;
        case 'F':
        case 'f':
          goto LABEL_43;
        case 'H':
        case 'h':
          goto LABEL_47;
        case 'I':
        case 'i':
          goto LABEL_51;
        case 'L':
        case 'l':
          goto LABEL_56;
        case 'M':
        case 'm':
          goto LABEL_60;
        case 'N':
        case 'n':
          goto LABEL_64;
        case 'O':
        case 'o':
          goto LABEL_68;
        case 'P':
        case 'p':
          v92 = a1[3];
          v6 = a1 + 3;
          v91 = v92;
          if (v92 <= 0x2F)
            goto LABEL_405;
          if (v91 <= 0x40)
            goto LABEL_413;
          if ((v91 & 0xFFFFFFDF) != 0x41)
            return 0;
          goto LABEL_208;
        case 'S':
        case 's':
          v93 = a1[3];
          v11 = a1 + 3;
          if (v93 > 0x55)
          {
            if (v93 <= 0x6E)
            {
              if (v93 == 101)
                goto LABEL_234;
              return 0;
            }
            if (v93 == 111)
              goto LABEL_395;
            if (v93 == 117)
              goto LABEL_135;
          }
          else
          {
            if (v93 <= 0x4E)
            {
              if (v93 == 69)
                goto LABEL_234;
              return 0;
            }
            if (v93 == 79)
              goto LABEL_395;
            if (v93 >= 0x55)
              goto LABEL_135;
          }
          break;
        case 'T':
        case 't':
          result = 0;
          v94 = a1[3];
          v12 = a1 + 3;
          if (v94 > 0x60)
          {
            switch(a1[3])
            {
              case 'a':
                goto LABEL_141;
              case 'b':
                goto LABEL_358;
              case 'c':
              case 'e':
              case 'g':
                return result;
              case 'd':
                goto LABEL_363;
              case 'f':
                goto LABEL_374;
              case 'h':
                goto LABEL_378;
              case 'i':
                goto LABEL_383;
              default:
                if (v94 == 114)
                  goto LABEL_404;
                break;
            }
          }
          else
          {
            switch(a1[3])
            {
              case 'A':
                goto LABEL_141;
              case 'B':
                goto LABEL_358;
              case 'C':
              case 'E':
              case 'G':
                return result;
              case 'D':
                goto LABEL_363;
              case 'F':
                goto LABEL_374;
              case 'H':
                goto LABEL_378;
              case 'I':
                goto LABEL_383;
              default:
                if (v94 == 82)
                  goto LABEL_404;
                break;
            }
          }
          return result;
        case 'U':
        case 'u':
          goto LABEL_180;
        default:
          return result;
      }
      return 0;
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
    case '<':
    case '=':
    case '>':
    case '@':
    case 'E':
    case 'G':
    case 'J':
    case 'K':
    case 'Q':
    case 'R':
    case 'V':
    case 'W':
    case 'X':
    case 'Y':
    case 'Z':
    case '[':
    case '\\':
    case ']':
    case '^':
    case '_':
    case 'e':
    case 'g':
    case 'j':
    case 'k':
    case 'q':
    case 'r':
      return result;
    case '?':
      return 3;
    case 'A':
    case 'a':
LABEL_3:
      v4 = v3[1];
      if (v4 > 0x53)
      {
        if (v4 > 0x71)
        {
          if (v4 != 114)
          {
            if (v4 >= 0x74)
              return 0;
LABEL_270:
            if ((v3[2] & 0xDF) == 0x49)
            {
              v81 = v3[3];
              v23 = v3 + 3;
              if ((v81 & 0xFFFFFFDF) == 0x44)
                goto LABEL_399;
            }
            return 0;
          }
          goto LABEL_144;
        }
        v5 = v4 == 100;
      }
      else
      {
        v5 = v4 == 68;
        if (v4 > 0x44)
        {
          if (v4 < 0x52)
            return 0;
          if (v4 != 82)
            goto LABEL_270;
LABEL_144:
          if ((v3[2] & 0xDF) == 0x54 && (v3[3] & 0xDF) == 0x49)
          {
            v52 = v3[4];
            v51 = v3 + 4;
            if ((v52 & 0xFFFFFFDF) == 0x43)
            {
              v49 = v51;
LABEL_384:
              v111 = v49[1];
              v110 = v49 + 1;
              if ((v111 & 0xFFFFFFDF) == 0x4C)
                goto LABEL_398;
            }
          }
          return 0;
        }
      }
      if (v5 && (v3[2] & 0xDF) == 0x44 && (v3[3] & 0xDF) == 0x52 && (v3[4] & 0xDF) == 0x45)
      {
        v15 = v3[5];
        v14 = v3 + 5;
        if ((v15 & 0xFFFFFFDF) == 0x53)
          goto LABEL_201;
      }
      return 0;
    case 'B':
    case 'b':
LABEL_33:
      v17 = v3 + 1;
      v16 = v3[1];
      if (v16 > 0x4F)
      {
        if (v16 <= 0x6B)
        {
          if (v16 != 97)
            return 0;
LABEL_74:
          if ((v3[2] & 0xDF) != 0x53 || (v3[3] & 0xDF) != 0x45)
            return 0;
          v6 = v3 + 4;
          v29 = v3[4];
          if (v29 <= 0x2F)
            goto LABEL_184;
          if (v29 > 0x45)
          {
            if ((v29 & 0xFFFFFFDF) == 0x46 && (v3[5] & 0xDF) == 0x4F)
            {
              v31 = v3[6];
              v30 = v3 + 6;
              if ((v31 & 0xFFFFFFDF) == 0x4E)
                goto LABEL_268;
            }
            return 0;
          }
LABEL_274:
          if (v29 != 62)
            return 0;
          return 6;
        }
        if (v16 != 108)
        {
          if (v16 != 111)
            return 0;
LABEL_359:
          v100 = v17[1];
          v47 = v17 + 1;
          if ((v100 & 0xFFFFFFDF) != 0x44)
            return 0;
          goto LABEL_360;
        }
      }
      else
      {
        if (v16 <= 0x4B)
        {
          if (v16 != 65)
            return 0;
          goto LABEL_74;
        }
        if (v16 != 76)
        {
          if (v16 < 0x4F)
            return 0;
          goto LABEL_359;
        }
      }
      if ((v3[2] & 0xDF) == 0x4F
        && (v3[3] & 0xDF) == 0x43
        && (v3[4] & 0xDF) == 0x4B
        && (v3[5] & 0xDF) == 0x51
        && (v3[6] & 0xDF) == 0x55
        && (v3[7] & 0xDF) == 0x4F)
      {
        v63 = v3[8];
        v23 = v3 + 8;
        if ((v63 & 0xFFFFFFDF) == 0x54)
          goto LABEL_399;
      }
      return 0;
    case 'C':
    case 'c':
LABEL_37:
      v19 = v3 + 1;
      v18 = v3[1];
      if (v18 > 0x4F)
      {
        if (v18 > 0x64)
        {
          if (v18 != 101)
          {
            if (v18 != 111)
              return 0;
            goto LABEL_164;
          }
LABEL_219:
          v64 = v3[2];
          v57 = v3 + 2;
          v65 = (v64 & 0xFFFFFFDF) == 78;
          goto LABEL_220;
        }
        if (v18 != 97)
          return 0;
        goto LABEL_84;
      }
      if (v18 <= 0x44)
      {
        if (v18 == 65)
          goto LABEL_84;
        return 0;
      }
      if (v18 == 69)
        goto LABEL_219;
      if (v18 < 0x4F)
        return 0;
LABEL_164:
      if ((v3[2] & 0xDF) != 0x4C)
        return 0;
      v29 = v3[3];
      v6 = v3 + 3;
      if (v29 <= 0x2F)
      {
LABEL_184:
        if (v29 <= 0x1F)
        {
          v56 = v29 - 9;
LABEL_407:
          if (v56 >= 5)
            return 0;
          return 6;
        }
        if (v29 == 32)
          return 6;
        if (v29 < 0x2F)
          return 0;
        goto LABEL_371;
      }
      if (v29 <= 0x46)
        goto LABEL_274;
      if ((v29 & 0xFFFFFFDF) != 0x47)
        return 0;
LABEL_311:
      if ((v6[1] & 0xDF) != 0x52)
        return 0;
      if ((v6[2] & 0xDF) != 0x4F)
        return 0;
      if ((v6[3] & 0xDF) != 0x55)
        return 0;
      v86 = v6[4];
      v70 = v6 + 4;
      if ((v86 & 0xFFFFFFDF) != 0x50)
        return 0;
LABEL_228:
      v12 = v70;
LABEL_363:
      v104 = v12[1];
      v103 = v12 + 1;
      v102 = v104;
      if (v104 > 0x20)
      {
        v105 = v102 == 47;
        if (v102 > 0x2F)
          goto LABEL_372;
        v6 = v103;
        if (!v105)
          return 0;
LABEL_371:
        v102 = v6[1];
LABEL_372:
        if (v102 == 62)
          return 6;
        return 0;
      }
      result = 0;
      if (v102 >= 9)
      {
        v9 = v102 - 14;
LABEL_366:
        if (v9 >= 0x12)
          return 6;
      }
      return result;
    case 'D':
    case 'd':
LABEL_41:
      result = 0;
      v12 = v3 + 1;
      v20 = v3[1];
      if (v20 <= 0x63)
      {
        switch(v3[1])
        {
          case 'D':
          case 'L':
            goto LABEL_363;
          case 'E':
            goto LABEL_87;
          case 'F':
          case 'G':
          case 'H':
          case 'J':
          case 'K':
            return result;
          case 'I':
            goto LABEL_238;
          default:
            if (v20 == 84)
              goto LABEL_363;
            break;
        }
        return result;
      }
      switch(v3[1])
      {
        case 'd':
        case 'l':
          goto LABEL_363;
        case 'e':
LABEL_87:
          if ((v3[2] & 0xDF) != 0x54)
            return 0;
          if ((v3[3] & 0xDF) != 0x41)
            return 0;
          if ((v3[4] & 0xDF) != 0x49)
            return 0;
          v34 = v3[5];
          v14 = v3 + 5;
          if ((v34 & 0xFFFFFFDF) != 0x4C)
            return 0;
          goto LABEL_201;
        case 'f':
        case 'g':
        case 'h':
        case 'j':
        case 'k':
          return result;
        case 'i':
LABEL_238:
          v12 = v3 + 2;
          v75 = v3[2];
          if (v75 > 0x56)
          {
            if (v75 > 0x71)
            {
              v45 = (v75 & 0xFFFFFFFB) == 114;
              goto LABEL_361;
            }
            if (v75 != 97)
              return 0;
          }
          else
          {
            if (v75 > 0x51)
            {
              if (v75 != 82 && v75 < 0x56)
                return 0;
              goto LABEL_363;
            }
            if (v75 != 65)
              return 0;
          }
          if ((v3[3] & 0xDF) == 0x4C && (v3[4] & 0xDF) == 0x4F)
          {
            v85 = v3[5];
            v42 = v3 + 5;
            if ((v85 & 0xFFFFFFDF) == 0x47)
              goto LABEL_181;
          }
          return 0;
        default:
          if (v20 == 116)
            goto LABEL_363;
          return result;
      }
    case 'F':
    case 'f':
LABEL_43:
      v21 = v3[1];
      if (v21 > 0x52)
      {
        if (v21 <= 0x6E)
        {
          if (v21 != 105)
            return 0;
          goto LABEL_94;
        }
        if (v21 != 111)
        {
          if (v21 != 114)
            return 0;
          goto LABEL_171;
        }
      }
      else
      {
        if (v21 <= 0x4E)
        {
          if (v21 != 73)
            return 0;
LABEL_94:
          v35 = v3[2];
          if (v35 > 0x47)
          {
            if (v35 > 0x65)
            {
              if (v35 != 103)
                return 0;
LABEL_317:
              v87 = v3[3];
              if (v87 > 0x55)
              {
                if (v87 > 0x63)
                {
                  if (v87 != 117)
                    return 0;
LABEL_387:
                  v112 = v3[4];
                  v23 = v3 + 4;
                  if ((v112 & 0xFFFFFFDF) == 0x52)
                    goto LABEL_399;
                  return 0;
                }
                if (v87 != 99)
                  return 0;
              }
              else if (v87 != 67)
              {
                if (v87 < 0x55)
                  return 0;
                goto LABEL_387;
              }
              v98 = v3[4];
              v97 = v3 + 4;
              if ((v98 & 0xFFFFFFDF) != 0x41)
                return 0;
              v19 = v97;
LABEL_84:
              v33 = v19[1];
              v32 = v19 + 1;
              if ((v33 & 0xFFFFFFDF) != 0x50)
                return 0;
LABEL_235:
              if ((v32[1] & 0xDF) != 0x54)
                return 0;
              v74 = v32[2];
              v73 = v32 + 2;
              if ((v74 & 0xFFFFFFDF) != 0x49)
                return 0;
              v6 = v73;
LABEL_348:
              v96 = v6[1];
              v95 = v6 + 1;
              if ((v96 & 0xFFFFFFDF) != 0x4F)
                return 0;
              v40 = v95;
LABEL_113:
              v43 = v40[1];
              v42 = v40 + 1;
              if ((v43 & 0xFFFFFFDF) != 0x4E)
                return 0;
              goto LABEL_181;
            }
            if (v35 != 101)
              return 0;
          }
          else if (v35 != 69)
          {
            if (v35 < 0x47)
              return 0;
            goto LABEL_317;
          }
          if ((v3[3] & 0xDF) != 0x4C || (v3[4] & 0xDF) != 0x44)
            return 0;
          v53 = v3[5] & 0xDF;
LABEL_266:
          if (v53 != 83)
            return 0;
          v79 = v3[6];
          v30 = v3 + 6;
          if ((v79 & 0xFFFFFFDF) != 0x45)
            return 0;
LABEL_268:
          v80 = v30;
LABEL_376:
          v107 = v80[1];
          v12 = v80 + 1;
          if ((v107 & 0xFFFFFFDF) != 0x54)
            return 0;
          goto LABEL_363;
        }
        if (v21 != 79)
        {
          if (v21 < 0x52)
            return 0;
LABEL_171:
          if ((v3[2] & 0xDF) != 0x41 || (v3[3] & 0xDF) != 0x4D || (v3[4] & 0xDF) != 0x45)
            return 0;
          v6 = v3 + 5;
          v29 = v3[5];
          if (v29 <= 0x2F)
            goto LABEL_184;
          if (v29 <= 0x52)
            goto LABEL_274;
          v53 = v29 & 0xFFFFFFDF;
          goto LABEL_266;
        }
      }
      v67 = v3[2];
      v57 = v3 + 2;
      v66 = v67;
      if (v67 > 0x52)
      {
        v65 = v66 == 111;
        if (v66 > 0x6F)
        {
          if (v66 == 114)
            goto LABEL_325;
          return 0;
        }
LABEL_220:
        if (!v65)
          return 0;
LABEL_224:
        if ((v57[1] & 0xDF) == 0x54)
        {
          v69 = v57[2];
          v68 = v57 + 2;
          if ((v69 & 0xFFFFFFDF) == 0x45)
          {
            v6 = v68;
            goto LABEL_227;
          }
        }
        return 0;
      }
      if (v66 == 79)
        goto LABEL_224;
      if (v66 < 0x52)
        return 0;
LABEL_325:
      v89 = v57[1];
      v42 = v57 + 1;
      if ((v89 & 0xFFFFFFDF) != 0x4D)
        return 0;
      goto LABEL_181;
    case 'H':
    case 'h':
LABEL_47:
      v12 = v3 + 1;
      v22 = v3[1];
      if (v22 <= 0x53)
      {
        if (v22 <= 0x44)
        {
          if (v22 - 49 < 6)
            goto LABEL_363;
          return 0;
        }
        if (v22 != 69)
        {
          v45 = v22 == 82;
          goto LABEL_361;
        }
LABEL_252:
        if ((v3[2] & 0xDF) != 0x41 || (v3[3] & 0xDF) != 0x44)
          return 0;
        v29 = v3[4];
        v6 = v3 + 4;
        if (v29 <= 0x2F)
          goto LABEL_184;
        if (v29 > 0x44)
        {
          if ((v29 & 0xFFFFFFDF) != 0x45)
            return 0;
LABEL_227:
          v71 = v6[1];
          v70 = v6 + 1;
          if ((v71 & 0xFFFFFFDF) != 0x52)
            return 0;
          goto LABEL_228;
        }
        goto LABEL_274;
      }
      if (v22 > 0x71)
      {
        if (v22 == 114)
          goto LABEL_363;
        if (v22 != 116)
          return 0;
      }
      else if (v22 >= 0x55)
      {
        if (v22 != 101)
          return 0;
        goto LABEL_252;
      }
      v54 = v3[2];
      v3 += 2;
      if ((v54 & 0xFFFFFFDF) != 0x4D)
        return 0;
LABEL_180:
      v55 = v3[1];
      v42 = v3 + 1;
      if ((v55 & 0xFFFFFFDF) != 0x4C)
        return 0;
      goto LABEL_181;
    case 'I':
    case 'i':
LABEL_51:
      if ((v3[1] & 0xDF) != 0x46)
        return 0;
      if ((v3[2] & 0xDF) != 0x52)
        return 0;
      if ((v3[3] & 0xDF) != 0x41)
        return 0;
      v24 = v3[4];
      v23 = v3 + 4;
      if ((v24 & 0xFFFFFFDF) != 0x4D)
        return 0;
      goto LABEL_399;
    case 'L':
    case 'l':
LABEL_56:
      v25 = v3[1];
      if (v25 > 0x49)
      {
        if (v25 > 0x65)
        {
          if (v25 != 105)
            return 0;
LABEL_183:
          v6 = v3 + 2;
          v29 = v3[2];
          if (v29 <= 0x2F)
            goto LABEL_184;
          if (v29 <= 0x4D)
            goto LABEL_274;
          if ((v29 & 0xFFFFFFDF) != 0x4E)
            return 0;
LABEL_322:
          v88 = v3[3];
          v42 = v3 + 3;
          if ((v88 & 0xFFFFFFDF) != 0x4B)
            return 0;
          goto LABEL_181;
        }
        if (v25 != 101)
          return 0;
      }
      else if (v25 != 69)
      {
        if (v25 < 0x49)
          return 0;
        goto LABEL_183;
      }
      if ((v3[2] & 0xDF) == 0x47 && (v3[3] & 0xDF) == 0x45)
      {
        v37 = v3[4];
        v36 = v3 + 4;
        if ((v37 & 0xFFFFFFDF) == 0x4E)
        {
          v38 = v36;
LABEL_108:
          v39 = v38[1];
          v12 = v38 + 1;
          if ((v39 & 0xFFFFFFDF) == 0x44)
            goto LABEL_363;
        }
      }
      return 0;
    case 'M':
    case 'm':
LABEL_60:
      v26 = v3[1];
      if (v26 > 0x45)
      {
        if (v26 > 0x61)
        {
          if (v26 != 101)
            return 0;
LABEL_187:
          if ((v3[2] & 0xDF) != 0x4E || (v3[3] & 0xDF) != 0x55)
            return 0;
          v6 = v3 + 4;
          v29 = v3[4];
          if (v29 <= 0x2F)
            goto LABEL_184;
          if (v29 > 0x48)
          {
            if ((v29 & 0xFFFFFFDF) == 0x49 && (v3[5] & 0xDF) == 0x54)
            {
              v58 = v3[6];
              v57 = v3 + 6;
              if ((v58 & 0xFFFFFFDF) == 0x45)
                goto LABEL_325;
            }
            return 0;
          }
          goto LABEL_274;
        }
        if (v26 != 97)
          return 0;
      }
      else if (v26 != 65)
      {
        if (v26 < 0x45)
          return 0;
        goto LABEL_187;
      }
      v41 = v3[2];
      v40 = v3 + 2;
      if ((v41 & 0xFFFFFFDF) != 0x49)
        return 0;
      goto LABEL_113;
    case 'N':
    case 'n':
LABEL_64:
      v27 = v3[1];
      if (v27 > 0x4F)
      {
        if (v27 > 0x61)
        {
          if (v27 != 111)
            return 0;
LABEL_196:
          if ((v3[2] & 0xDF) == 0x46 && (v3[3] & 0xDF) == 0x52 && (v3[4] & 0xDF) == 0x41 && (v3[5] & 0xDF) == 0x4D)
          {
            v59 = v3[6];
            v14 = v3 + 6;
            if ((v59 & 0xFFFFFFDF) == 0x45)
            {
LABEL_201:
              v60 = v14[1];
              v42 = v14 + 1;
              if ((v60 & 0xFFFFFFDF) == 0x53)
                goto LABEL_181;
            }
          }
          return 0;
        }
        if (v27 != 97)
          return 0;
      }
      else if (v27 != 65)
      {
        if (v27 < 0x4F)
          return 0;
        goto LABEL_196;
      }
      v44 = v3[2];
      v42 = v3 + 2;
      if ((v44 & 0xFFFFFFDF) == 0x56)
        goto LABEL_181;
      return 0;
    case 'O':
    case 'o':
LABEL_68:
      v12 = v3 + 1;
      v28 = v3[1];
      if (v28 > 0x50)
      {
        v45 = v28 == 108;
        if (v28 <= 0x6C)
          goto LABEL_361;
        if (v28 != 112)
          return 0;
      }
      else
      {
        if (v28 == 76)
          goto LABEL_363;
        if (v28 < 0x50)
          return 0;
      }
      if ((v3[2] & 0xDF) != 0x54)
        return 0;
      v46 = v3[3];
      v6 = v3 + 3;
      if (v46 <= 0x49)
      {
        if (v46 == 71)
          goto LABEL_311;
        if (v46 >= 0x49)
          goto LABEL_348;
        return 0;
      }
      if (v46 <= 0x67)
      {
        if (v46 != 103)
          return 0;
        goto LABEL_311;
      }
      if (v46 != 105)
        return 0;
      goto LABEL_348;
    case 'P':
    case 'p':
      v8 = a1[2];
      v6 = a1 + 2;
      v7 = v8;
      if (v8 <= 0x3E)
      {
        if (v7 <= 0x20)
        {
          result = 0;
          if (v7 < 9)
            return result;
          v9 = v7 - 14;
          goto LABEL_366;
        }
        if (v7 == 47)
          goto LABEL_371;
        if (v7 < 0x3E)
          return 0;
        return 6;
      }
      if (v7 > 0x52)
      {
        if (v7 > 0x61)
        {
          if (v7 != 114)
            return 0;
LABEL_277:
          v82 = v6[1];
          v77 = v6 + 1;
          if ((v82 & 0xFFFFFFDF) != 0x45)
            return 0;
LABEL_278:
          v83 = v77[1];
          if (v83 <= 0x1F)
            return v83 - 9 < 5;
          return v83 == 62 || v83 == 32;
        }
        if (v7 != 97)
          return 0;
      }
      else if (v7 != 65)
      {
        if (v7 >= 0x52)
          goto LABEL_277;
        return 0;
      }
LABEL_208:
      if ((v6[1] & 0xDF) == 0x52)
      {
        v62 = v6[2];
        v61 = v6 + 2;
        if ((v62 & 0xFFFFFFDF) == 0x41)
        {
          v57 = v61;
          goto LABEL_325;
        }
      }
      return 0;
    case 'S':
    case 's':
      result = 0;
      v11 = a1 + 2;
      v10 = a1[2];
      if (v10 > 0x62)
      {
        if (a1[2] > 0x6Eu)
        {
          if (v10 != 111)
          {
            if (v10 != 116)
            {
              if (v10 != 117)
                return result;
LABEL_135:
              if ((v11[1] & 0xDF) != 0x4D)
                return 0;
              if ((v11[2] & 0xDF) != 0x4D)
                return 0;
              if ((v11[3] & 0xDF) != 0x41)
                return 0;
              v48 = v11[4];
              v47 = v11 + 4;
              if ((v48 & 0xFFFFFFDF) != 0x52)
                return 0;
LABEL_360:
              v101 = v47[1];
              v12 = v47 + 1;
              v45 = (v101 & 0xFFFFFFDF) == 89;
LABEL_361:
              if (!v45)
                return 0;
              goto LABEL_363;
            }
LABEL_244:
            if ((a1[3] & 0xDF) == 0x59)
            {
              v76 = a1[4];
              v6 = a1 + 4;
              if ((v76 & 0xFFFFFFDF) == 0x4C)
                goto LABEL_277;
            }
            return 0;
          }
LABEL_395:
          if ((v11[1] & 0xDF) != 0x55)
            return 0;
          if ((v11[2] & 0xDF) != 0x52)
            return 0;
          v113 = v11[3];
          v110 = v11 + 3;
          if ((v113 & 0xFFFFFFDF) != 0x43)
            return 0;
LABEL_398:
          v23 = v110;
LABEL_399:
          v114 = v23[1];
          v42 = v23 + 1;
          if ((v114 & 0xFFFFFFDF) != 0x45)
            return 0;
LABEL_181:
          v12 = v42;
          goto LABEL_363;
        }
        if (v10 != 99)
        {
          if (v10 != 101)
            return result;
LABEL_234:
          v72 = v11[1];
          v32 = v11 + 1;
          if ((v72 & 0xFFFFFFDF) != 0x43)
            return 0;
          goto LABEL_235;
        }
      }
      else
      {
        if (a1[2] > 0x4Eu)
        {
          if (v10 != 79)
          {
            if (v10 != 84)
            {
              if (v10 != 85)
                return result;
              goto LABEL_135;
            }
            goto LABEL_244;
          }
          goto LABEL_395;
        }
        if (v10 != 67)
        {
          if (v10 != 69)
            return result;
          goto LABEL_234;
        }
      }
      if ((a1[3] & 0xDF) == 0x52 && (a1[4] & 0xDF) == 0x49 && (a1[5] & 0xDF) == 0x50)
      {
        v78 = a1[6];
        v77 = a1 + 6;
        if ((v78 & 0xFFFFFFDF) == 0x54)
          goto LABEL_278;
      }
      return 0;
    case 'T':
    case 't':
      result = 0;
      v12 = a1 + 2;
      switch(a1[2])
      {
        case 'A':
LABEL_141:
          v50 = v12[1];
          v49 = v12 + 1;
          if ((v50 & 0xFFFFFFDF) != 0x42)
            return 0;
          goto LABEL_384;
        case 'B':
LABEL_358:
          v99 = v12[1];
          v17 = v12 + 1;
          if ((v99 & 0xFFFFFFDF) == 0x4F)
            goto LABEL_359;
          return 0;
        case 'C':
        case 'G':
        case 'J':
        case 'K':
        case 'L':
        case 'M':
        case 'N':
        case 'O':
        case 'P':
        case 'Q':
          return result;
        case 'D':
          goto LABEL_363;
        case 'E':
LABEL_280:
          if ((a1[3] & 0xDF) != 0x58)
            return 0;
          if ((a1[4] & 0xDF) != 0x54)
            return 0;
          if ((a1[5] & 0xDF) != 0x41)
            return 0;
          if ((a1[6] & 0xDF) != 0x52)
            return 0;
          if ((a1[7] & 0xDF) != 0x45)
            return 0;
          v84 = a1[8];
          v77 = a1 + 8;
          if ((v84 & 0xFFFFFFDF) != 0x41)
            return 0;
          goto LABEL_278;
        case 'F':
LABEL_374:
          if ((v12[1] & 0xDF) == 0x4F)
          {
            v106 = v12[2];
            v80 = v12 + 2;
            if ((v106 & 0xFFFFFFDF) == 0x4F)
              goto LABEL_376;
          }
          return 0;
        case 'H':
LABEL_378:
          v6 = v12 + 1;
          v91 = v12[1];
          if (v91 <= 0x2F)
            goto LABEL_405;
          if (v91 <= 0x44)
            goto LABEL_413;
          if ((v91 & 0xFFFFFFDF) != 0x45)
            return 0;
          v108 = v12[2];
          v38 = v12 + 2;
          if ((v108 & 0xFFFFFFDF) != 0x41)
            return 0;
          goto LABEL_108;
        case 'I':
LABEL_383:
          v109 = v12[1];
          v49 = v12 + 1;
          if ((v109 & 0xFFFFFFDF) == 0x54)
            goto LABEL_384;
          return 0;
        case 'R':
LABEL_404:
          v6 = v12 + 1;
          v91 = v12[1];
          if (v91 > 0x2F)
          {
            if (v91 > 0x40)
            {
              if ((v91 & 0xFFFFFFDF) == 0x41)
              {
                v3 = v12;
                if ((v12[2] & 0xDF) == 0x43)
                  goto LABEL_322;
              }
            }
            else
            {
LABEL_413:
              if (v91 == 62)
                return 6;
            }
          }
          else
          {
LABEL_405:
            if (v91 <= 0x1F)
            {
              v56 = v91 - 9;
              goto LABEL_407;
            }
            if (v91 == 32)
              return 6;
            if (v91 >= 0x2F)
              goto LABEL_371;
          }
          break;
        default:
          switch(a1[2])
          {
            case 'a':
              goto LABEL_141;
            case 'b':
              goto LABEL_358;
            case 'd':
              goto LABEL_363;
            case 'e':
              goto LABEL_280;
            case 'f':
              goto LABEL_374;
            case 'h':
              goto LABEL_378;
            case 'i':
              goto LABEL_383;
            case 'r':
              goto LABEL_404;
            default:
              return result;
          }
          return result;
      }
      return 0;
    case 'U':
    case 'u':
      goto LABEL_180;
    default:
      if (a1[1] != 33)
        return result;
      v13 = a1[2];
      if (v13 <= 0x40)
      {
        if (v13 != 45)
          return 0;
        return 2 * (a1[3] == 45);
      }
      if (v13 < 0x5B)
        return 4;
      if (v13 == 91
        && (a1[3] & 0xDF) == 0x43
        && (a1[4] & 0xDF) == 0x44
        && (a1[5] & 0xDF) == 0x41
        && (a1[6] & 0xDF) == 0x54
        && (a1[7] & 0xDF) == 0x41)
      {
        if (a1[8] == 91)
          return 5;
        else
          return 0;
      }
      return 0;
  }
}

uint64_t _scan_atx_heading_start(_BYTE *a1)
{
  _BYTE *v1;
  unsigned int v2;
  unsigned int v3;
  int v5;

  if (*a1 != 35)
    return 0;
  v1 = a1 + 1;
  v2 = a1[1];
  if (_scan_atx_heading_start_yybm[a1[1]] < 0)
    goto LABEL_29;
  if (v2 <= 0xC)
    goto LABEL_4;
  if (v2 != 13)
  {
    if (v2 != 35)
      return 0;
    v1 = a1 + 2;
    v2 = a1[2];
    if (_scan_atx_heading_start_yybm[a1[2]] < 0)
      goto LABEL_29;
    if (v2 <= 0xC)
      goto LABEL_4;
    if (v2 == 13)
      goto LABEL_31;
    if (v2 != 35)
      return 0;
    v1 = a1 + 3;
    v2 = a1[3];
    if (_scan_atx_heading_start_yybm[a1[3]] < 0)
      goto LABEL_29;
    if (v2 <= 0xC)
      goto LABEL_4;
    if (v2 == 13)
      goto LABEL_31;
    if (v2 != 35)
      return 0;
    v1 = a1 + 4;
    v2 = a1[4];
    if (_scan_atx_heading_start_yybm[a1[4]] < 0)
      goto LABEL_29;
    if (v2 <= 0xC)
      goto LABEL_4;
    if (v2 == 13)
      goto LABEL_31;
    if (v2 != 35)
      return 0;
    v1 = a1 + 5;
    v2 = a1[5];
    if (_scan_atx_heading_start_yybm[a1[5]] < 0)
      goto LABEL_29;
    if (v2 <= 0xC)
    {
LABEL_4:
      if (v2 - 9 < 2)
        goto LABEL_31;
      return 0;
    }
    if (v2 != 13)
    {
      if (v2 != 35)
        return 0;
      v1 = a1 + 6;
      v3 = a1[6];
      if ((_scan_atx_heading_start_yybm[a1[6]] & 0x80000000) == 0)
      {
        if (v3 >= 9 && (v3 < 0xB || v3 == 13))
          goto LABEL_31;
        return 0;
      }
      do
LABEL_29:
        v5 = *++v1;
      while (_scan_atx_heading_start_yybm[v5] < 0);
      return ((_DWORD)v1 - (_DWORD)a1);
    }
  }
LABEL_31:
  LODWORD(v1) = (_DWORD)v1 + 1;
  return ((_DWORD)v1 - (_DWORD)a1);
}

uint64_t S_advance_offset(uint64_t result, uint64_t *a2, int a3, int a4)
{
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  int v8;
  unsigned int v9;
  BOOL v10;
  unsigned int v11;

  if (a3 >= 1)
  {
    v4 = *a2;
    v5 = *(_DWORD *)(result + 36);
    do
    {
      if (*(_BYTE *)(v4 + v5) == 9)
      {
        v7 = *(_DWORD *)(result + 40);
        if (v7 <= 0)
          v8 = -(-v7 & 3);
        else
          v8 = *(_DWORD *)(result + 40) & 3;
        v9 = 4 - v8;
        if (a4)
        {
          v10 = v9 > a3;
          *(_BYTE *)(result + 61) = v9 > a3;
          if ((int)v9 >= a3)
            v9 = a3;
          v11 = v9 + v7;
          if (!v10)
            ++v5;
          *(_DWORD *)(result + 36) = v5;
          *(_DWORD *)(result + 40) = v11;
          a3 -= v9;
          continue;
        }
        *(_BYTE *)(result + 61) = 0;
        v6 = v9 + v7;
        ++v5;
      }
      else
      {
        if (!*(_BYTE *)(v4 + v5))
          return result;
        *(_BYTE *)(result + 61) = 0;
        ++v5;
        v6 = *(_DWORD *)(result + 40) + 1;
      }
      *(_DWORD *)(result + 36) = v5;
      *(_DWORD *)(result + 40) = v6;
      --a3;
    }
    while (a3 > 0);
  }
  return result;
}

_DWORD *cmark_utf8proc_check(_DWORD *result, uint64_t a2, int a3)
{
  _DWORD *v5;
  int v6;
  int v7;
  int v8;
  unsigned __int8 *v9;
  int v10;
  unsigned int v11;
  uint64_t v12;
  unsigned int v13;
  unsigned int v14;
  int v15;

  if (a3 < 1)
    return result;
  v5 = result;
  v6 = 0;
  do
  {
    v7 = 0;
    v8 = v6;
    while (1)
    {
      v9 = (unsigned __int8 *)(a2 + v8);
      v10 = (char)*v9;
      if (v10 < 1)
        break;
      ++v8;
LABEL_18:
      if (v8 >= a3)
      {
        v15 = 0;
        goto LABEL_43;
      }
    }
    v11 = *v9;
    if ((v10 & 0x80) == 0)
    {
      v15 = 1;
      v7 = 1;
      goto LABEL_43;
    }
    v12 = *v9;
    v7 = utf8proc_utf8class[v12];
    if (!utf8proc_utf8class[v12])
    {
LABEL_38:
      v7 = -1;
      goto LABEL_42;
    }
    if (a3 - v8 < v7)
    {
      v7 = v8 - a3;
      goto LABEL_16;
    }
    if (v7 == 4)
    {
      v13 = v9[1];
      if ((v13 & 0xC0) != 0x80)
        goto LABEL_38;
      if ((v9[2] & 0xC0) != 0x80)
        goto LABEL_40;
      if ((v9[3] & 0xC0) != 0x80)
        goto LABEL_41;
      if (v11 == 240)
      {
        if (v13 < 0x90)
        {
          v7 = -4;
          goto LABEL_42;
        }
      }
      else if (v11 >= 0xF4)
      {
        v7 = -4;
        if (v11 != 244 || v13 > 0x8F)
          goto LABEL_42;
      }
      v7 = 4;
      goto LABEL_17;
    }
    if (v7 != 3)
    {
      if (v7 == 2)
      {
        if ((v9[1] & 0xC0) != 0x80)
          goto LABEL_38;
        if (v11 < 0xC2)
          goto LABEL_40;
        v7 = 2;
        goto LABEL_17;
      }
LABEL_16:
      if (v7 < 0)
        goto LABEL_42;
LABEL_17:
      v8 += v7;
      goto LABEL_18;
    }
    v14 = v9[1];
    if ((v14 & 0xC0) != 0x80)
      goto LABEL_38;
    if ((v9[2] & 0xC0) != 0x80)
    {
LABEL_40:
      v7 = -2;
      goto LABEL_42;
    }
    if (v11 == 237)
    {
      if (v14 > 0x9F)
        goto LABEL_41;
LABEL_37:
      v7 = 3;
      goto LABEL_17;
    }
    if (v11 != 224 || v14 >= 0xA0)
      goto LABEL_37;
LABEL_41:
    v7 = -3;
LABEL_42:
    v7 = -v7;
    v15 = 1;
LABEL_43:
    if (v8 > v6)
      result = cmark_strbuf_put(v5, (const void *)(a2 + v6), v8 - v6);
    if (!v15)
      break;
    result = cmark_strbuf_put(v5, &encode_unknown_repl, 3);
    v6 = v7 + v8;
  }
  while (v7 + v8 < a3);
  return result;
}

uint64_t cmark_utf8proc_iterate(unsigned __int8 *a1, int a2, unsigned int *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  __int16 v8;
  int v9;

  v3 = 0xFFFFFFFFLL;
  *a3 = -1;
  if (!a2)
    return v3;
  v4 = *a1;
  v5 = utf8proc_utf8class[v4];
  if (!utf8proc_utf8class[v4] || (a2 & 0x80000000) == 0 && (int)v5 > a2)
    return 0xFFFFFFFFLL;
  if ((int)v5 >= 2)
  {
    v6 = 1;
    while ((a1[v6] & 0xC0) == 0x80)
    {
      if (v5 == ++v6)
        goto LABEL_9;
    }
    v5 = -(int)v6;
    if ((v5 & 0x80000000) == 0)
      goto LABEL_12;
    return 0xFFFFFFFFLL;
  }
LABEL_9:
  if ((v5 & 0x80000000) != 0)
    return 0xFFFFFFFFLL;
LABEL_12:
  switch((int)v5)
  {
    case 1:
      v7 = *a1;
      goto LABEL_22;
    case 2:
      v7 = a1[1] & 0x3F | ((v4 & 0x1F) << 6);
      if (v7 < 0x80)
        return 0xFFFFFFFFLL;
      goto LABEL_22;
    case 3:
      v8 = ((v4 & 0xF) << 12) | ((a1[1] & 0x3F) << 6);
      v7 = ((v4 & 0xF) << 12) | ((a1[1] & 0x3F) << 6) | a1[2] & 0x3F;
      v3 = 0xFFFFFFFFLL;
      if (v7 < 0x800 || (v8 & 0xF800) == 0xD800)
        return v3;
      goto LABEL_22;
    case 4:
      v9 = ((v4 & 7) << 18) | ((a1[1] & 0x3F) << 12);
      if ((v9 - 1114112) < 0xFFF00000)
        return 0xFFFFFFFFLL;
      v7 = a1[3] & 0x3F | ((a1[2] & 0x3F) << 6) | v9;
LABEL_22:
      *a3 = v7;
      v3 = v5;
      break;
    default:
      return 0xFFFFFFFFLL;
  }
  return v3;
}

_DWORD *cmark_utf8proc_encode_char(unsigned int a1, _DWORD *a2)
{
  int v2;
  char v3;
  char v5;
  char v6;
  char v7;
  char v8;

  if ((a1 & 0x80000000) != 0)
    cmark_utf8proc_encode_char_cold_1();
  if (a1 <= 0x7F)
  {
    v5 = a1;
LABEL_11:
    v2 = 1;
    return cmark_strbuf_put(a2, &v5, v2);
  }
  if (a1 <= 0x7FF)
  {
    v5 = (a1 >> 6) - 64;
    v6 = a1 & 0x3F | 0x80;
    v2 = 2;
    return cmark_strbuf_put(a2, &v5, v2);
  }
  if (a1 == 65534)
  {
    v3 = -2;
    goto LABEL_10;
  }
  if (a1 == 0xFFFF)
  {
    v3 = -1;
LABEL_10:
    v5 = v3;
    goto LABEL_11;
  }
  if (!HIWORD(a1))
  {
    v5 = (a1 >> 12) - 32;
    v6 = (a1 >> 6) & 0x3F | 0x80;
    v7 = a1 & 0x3F | 0x80;
    v2 = 3;
    return cmark_strbuf_put(a2, &v5, v2);
  }
  if (HIWORD(a1) <= 0x10u)
  {
    v5 = (a1 >> 18) - 16;
    v6 = (a1 >> 12) & 0x3F | 0x80;
    v7 = (a1 >> 6) & 0x3F | 0x80;
    v8 = a1 & 0x3F | 0x80;
    v2 = 4;
    return cmark_strbuf_put(a2, &v5, v2);
  }
  return cmark_strbuf_put(a2, &encode_unknown_repl, 3);
}

_DWORD *cmark_utf8proc_case_fold(_DWORD *result, unsigned __int8 *a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  _DWORD *v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  __int16 v11;
  __int16 v12;
  __int16 v13;
  uint64_t v14;
  int v15;
  __int16 v16;
  __int16 v17;
  __int16 v18;
  __int16 v19;
  __int16 v20;
  __int16 v21;
  char v22;
  __int16 v23;
  __int16 v24;
  __int16 v25;
  __int16 v26;
  __int16 v27;
  __int16 v28;
  __int16 v29;
  __int16 v30;
  __int16 v31;
  __int16 v32;
  __int16 v33;
  __int16 v34;
  __int16 v35;
  __int16 v36;
  __int16 v37;
  __int16 v38;
  __int16 v39;
  __int16 v40;
  __int16 v41;
  __int16 v42;
  __int16 v43;
  __int16 v44;
  __int16 v45;
  __int16 v46;
  __int16 v47;
  __int16 v48;
  __int16 v49;
  __int16 v50;
  __int16 v51;
  __int16 v52;
  __int16 v53;
  __int16 v54;
  __int16 v55;
  __int16 v56;
  __int16 v57;
  __int16 v58;
  __int16 v59;
  char v60;
  __int16 v61;
  __int16 v62;
  char v63;
  __int16 v64;
  __int16 v65;
  __int16 v66;
  __int16 v67;
  __int16 v68;
  __int16 v69;
  __int16 v70;
  __int16 v71;
  _DWORD *v72;
  int v73;
  _DWORD *v74;
  int v75;
  __int16 v76;
  __int16 v77;
  __int16 v78;
  __int16 v79;
  char v80;
  __int16 v81;
  __int16 v82;
  __int16 v83;
  __int16 v84;
  __int16 v85;
  __int16 v86;
  __int16 v87;
  __int16 v88;
  __int16 v89;
  __int16 v90;
  __int16 v91;
  __int16 v92;
  __int16 v93;
  __int16 v94;
  __int16 v95;
  __int16 v96;
  __int16 v97;
  __int16 v98;
  __int16 v99;
  __int16 v100;
  __int16 v101;
  __int16 v102;
  __int16 v103;
  __int16 v104;
  __int16 v105;
  __int16 v106;
  __int16 v107;
  char v108;
  __int16 v109;
  __int16 v110;
  __int16 v111;
  __int16 v112;
  __int16 v113;
  __int16 v114;
  _DWORD *v115;
  int v116;
  __int16 v117;
  BOOL v118;
  signed int v119;
  int v120;
  uint64_t v121;
  uint64_t v122;

  if (a3 >= 1)
  {
    v121 = v3;
    v122 = v4;
    v5 = a3;
    v7 = result;
    v119 = 0;
    do
    {
      v8 = cmark_utf8proc_iterate(a2, v5, (unsigned int *)&v119);
      if ((v8 & 0x80000000) != 0)
      {
        result = cmark_strbuf_put(v7, &encode_unknown_repl, 3);
        v9 = 1;
      }
      else
      {
        v9 = v8;
        if (v119 > 8485)
        {
          if (v119 > 43887)
          {
            if (v119 > 66735)
            {
              if (v119 > 71839)
              {
                switch(v119)
                {
                  case 125184:
                    v15 = -1566269712;
                    break;
                  case 125185:
                    v15 = -1549492496;
                    break;
                  case 125186:
                    v15 = -1532715280;
                    break;
                  case 125187:
                    v15 = -1515938064;
                    break;
                  case 125188:
                    v15 = -1499160848;
                    break;
                  case 125189:
                    v15 = -1482383632;
                    break;
                  case 125190:
                    v15 = -1465606416;
                    break;
                  case 125191:
                    v15 = -1448829200;
                    break;
                  case 125192:
                    v15 = -1432051984;
                    break;
                  case 125193:
                    v15 = -1415274768;
                    break;
                  case 125194:
                    v15 = -1398497552;
                    break;
                  case 125195:
                    v15 = -1381720336;
                    break;
                  case 125196:
                    v15 = -1364943120;
                    break;
                  case 125197:
                    v15 = -1348165904;
                    break;
                  case 125198:
                    v15 = -1331388688;
                    break;
                  case 125199:
                    v15 = -1314611472;
                    break;
                  case 125200:
                    v15 = -1297834256;
                    break;
                  case 125201:
                    v15 = -1281057040;
                    break;
                  case 125202:
                    v15 = -1264279824;
                    break;
                  case 125203:
                    v15 = -1247502608;
                    break;
                  case 125204:
                    v15 = -1230725392;
                    break;
                  case 125205:
                    v15 = -1213948176;
                    break;
                  case 125206:
                    v15 = -1197170960;
                    break;
                  case 125207:
                    v15 = -1180393744;
                    break;
                  case 125208:
                    v15 = -1163616528;
                    break;
                  case 125209:
                    v15 = -1146839312;
                    break;
                  case 125210:
                    v15 = -1130062096;
                    break;
                  case 125211:
                    v15 = -1113284880;
                    break;
                  case 125212:
                    v15 = -1096507664;
                    break;
                  case 125213:
                    v15 = -1079730448;
                    break;
                  case 125214:
                    v15 = -2136629520;
                    break;
                  case 125215:
                    v15 = -2119852304;
                    break;
                  case 125216:
                    v15 = -2103075088;
                    break;
                  case 125217:
                    v15 = -2086297872;
                    break;
                  default:
                    switch(v119)
                    {
                      case 71840:
                        v15 = -2136763920;
                        goto LABEL_725;
                      case 71841:
                        v15 = -2119986704;
                        goto LABEL_725;
                      case 71842:
                        v15 = -2103209488;
                        goto LABEL_725;
                      case 71843:
                        v15 = -2086432272;
                        goto LABEL_725;
                      case 71844:
                        v15 = -2069655056;
                        goto LABEL_725;
                      case 71845:
                        v15 = -2052877840;
                        goto LABEL_725;
                      case 71846:
                        v15 = -2036100624;
                        goto LABEL_725;
                      case 71847:
                        v15 = -2019323408;
                        goto LABEL_725;
                      case 71848:
                        v15 = -2002546192;
                        goto LABEL_725;
                      case 71849:
                        v15 = -1985768976;
                        goto LABEL_725;
                      case 71850:
                        v15 = -1968991760;
                        goto LABEL_725;
                      case 71851:
                        v15 = -1952214544;
                        goto LABEL_725;
                      case 71852:
                        v15 = -1935437328;
                        goto LABEL_725;
                      case 71853:
                        v15 = -1918660112;
                        goto LABEL_725;
                      case 71854:
                        v15 = -1901882896;
                        goto LABEL_725;
                      case 71855:
                        v15 = -1885105680;
                        goto LABEL_725;
                      case 71856:
                        v15 = -1868328464;
                        goto LABEL_725;
                      case 71857:
                        v15 = -1851551248;
                        goto LABEL_725;
                      case 71858:
                        v15 = -1834774032;
                        goto LABEL_725;
                      case 71859:
                        v15 = -1817996816;
                        goto LABEL_725;
                      case 71860:
                        v15 = -1801219600;
                        goto LABEL_725;
                      case 71861:
                        v15 = -1784442384;
                        goto LABEL_725;
                      case 71862:
                        v15 = -1767665168;
                        goto LABEL_725;
                      case 71863:
                        v15 = -1750887952;
                        goto LABEL_725;
                      case 71864:
                        v15 = -1734110736;
                        goto LABEL_725;
                      case 71865:
                        v15 = -1717333520;
                        goto LABEL_725;
                      case 71866:
                        v15 = -1700556304;
                        goto LABEL_725;
                      case 71867:
                        v15 = -1683779088;
                        goto LABEL_725;
                      case 71868:
                        v15 = -1667001872;
                        goto LABEL_725;
                      case 71869:
                        v15 = -1650224656;
                        goto LABEL_725;
                      case 71870:
                        v15 = -1633447440;
                        goto LABEL_725;
                      case 71871:
                        v15 = -1616670224;
                        goto LABEL_725;
                      default:
                        goto LABEL_148;
                    }
                }
              }
              else
              {
                switch(v119)
                {
                  case 68736:
                    v15 = -2135715600;
                    break;
                  case 68737:
                    v15 = -2118938384;
                    break;
                  case 68738:
                    v15 = -2102161168;
                    break;
                  case 68739:
                    v15 = -2085383952;
                    break;
                  case 68740:
                    v15 = -2068606736;
                    break;
                  case 68741:
                    v15 = -2051829520;
                    break;
                  case 68742:
                    v15 = -2035052304;
                    break;
                  case 68743:
                    v15 = -2018275088;
                    break;
                  case 68744:
                    v15 = -2001497872;
                    break;
                  case 68745:
                    v15 = -1984720656;
                    break;
                  case 68746:
                    v15 = -1967943440;
                    break;
                  case 68747:
                    v15 = -1951166224;
                    break;
                  case 68748:
                    v15 = -1934389008;
                    break;
                  case 68749:
                    v15 = -1917611792;
                    break;
                  case 68750:
                    v15 = -1900834576;
                    break;
                  case 68751:
                    v15 = -1884057360;
                    break;
                  case 68752:
                    v15 = -1867280144;
                    break;
                  case 68753:
                    v15 = -1850502928;
                    break;
                  case 68754:
                    v15 = -1833725712;
                    break;
                  case 68755:
                    v15 = -1816948496;
                    break;
                  case 68756:
                    v15 = -1800171280;
                    break;
                  case 68757:
                    v15 = -1783394064;
                    break;
                  case 68758:
                    v15 = -1766616848;
                    break;
                  case 68759:
                    v15 = -1749839632;
                    break;
                  case 68760:
                    v15 = -1733062416;
                    break;
                  case 68761:
                    v15 = -1716285200;
                    break;
                  case 68762:
                    v15 = -1699507984;
                    break;
                  case 68763:
                    v15 = -1682730768;
                    break;
                  case 68764:
                    v15 = -1665953552;
                    break;
                  case 68765:
                    v15 = -1649176336;
                    break;
                  case 68766:
                    v15 = -1632399120;
                    break;
                  case 68767:
                    v15 = -1615621904;
                    break;
                  case 68768:
                    v15 = -1598844688;
                    break;
                  case 68769:
                    v15 = -1582067472;
                    break;
                  case 68770:
                    v15 = -1565290256;
                    break;
                  case 68771:
                    v15 = -1548513040;
                    break;
                  case 68772:
                    v15 = -1531735824;
                    break;
                  case 68773:
                    v15 = -1514958608;
                    break;
                  case 68774:
                    v15 = -1498181392;
                    break;
                  case 68775:
                    v15 = -1481404176;
                    break;
                  case 68776:
                    v15 = -1464626960;
                    break;
                  case 68777:
                    v15 = -1447849744;
                    break;
                  case 68778:
                    v15 = -1431072528;
                    break;
                  case 68779:
                    v15 = -1414295312;
                    break;
                  case 68780:
                    v15 = -1397518096;
                    break;
                  case 68781:
                    v15 = -1380740880;
                    break;
                  case 68782:
                    v15 = -1363963664;
                    break;
                  case 68783:
                    v15 = -1347186448;
                    break;
                  case 68784:
                    v15 = -1330409232;
                    break;
                  case 68785:
                    v15 = -1313632016;
                    break;
                  case 68786:
                    v15 = -1296854800;
                    break;
                  default:
                    switch(v119)
                    {
                      case 66736:
                        v15 = -1735159568;
                        goto LABEL_725;
                      case 66737:
                        v15 = -1718382352;
                        goto LABEL_725;
                      case 66738:
                        v15 = -1701605136;
                        goto LABEL_725;
                      case 66739:
                        v15 = -1684827920;
                        goto LABEL_725;
                      case 66740:
                        v15 = -1668050704;
                        goto LABEL_725;
                      case 66741:
                        v15 = -1651273488;
                        goto LABEL_725;
                      case 66742:
                        v15 = -1634496272;
                        goto LABEL_725;
                      case 66743:
                        v15 = -1617719056;
                        goto LABEL_725;
                      case 66744:
                        v15 = -1600941840;
                        goto LABEL_725;
                      case 66745:
                        v15 = -1584164624;
                        goto LABEL_725;
                      case 66746:
                        v15 = -1567387408;
                        goto LABEL_725;
                      case 66747:
                        v15 = -1550610192;
                        goto LABEL_725;
                      case 66748:
                        v15 = -1533832976;
                        goto LABEL_725;
                      case 66749:
                        v15 = -1517055760;
                        goto LABEL_725;
                      case 66750:
                        v15 = -1500278544;
                        goto LABEL_725;
                      case 66751:
                        v15 = -1483501328;
                        goto LABEL_725;
                      case 66752:
                        v15 = -1466724112;
                        goto LABEL_725;
                      case 66753:
                        v15 = -1449946896;
                        goto LABEL_725;
                      case 66754:
                        v15 = -1433169680;
                        goto LABEL_725;
                      case 66755:
                        v15 = -1416392464;
                        goto LABEL_725;
                      case 66756:
                        v15 = -1399615248;
                        goto LABEL_725;
                      case 66757:
                        v15 = -1382838032;
                        goto LABEL_725;
                      case 66758:
                        v15 = -1366060816;
                        goto LABEL_725;
                      case 66759:
                        v15 = -1349283600;
                        goto LABEL_725;
                      case 66760:
                        v15 = -1332506384;
                        goto LABEL_725;
                      case 66761:
                        v15 = -1315729168;
                        goto LABEL_725;
                      case 66762:
                        v15 = -1298951952;
                        goto LABEL_725;
                      case 66763:
                        v15 = -1282174736;
                        goto LABEL_725;
                      case 66764:
                        v15 = -1265397520;
                        goto LABEL_725;
                      case 66765:
                        v15 = -1248620304;
                        goto LABEL_725;
                      case 66766:
                        v15 = -1231843088;
                        goto LABEL_725;
                      case 66767:
                        v15 = -1215065872;
                        goto LABEL_725;
                      case 66768:
                        v15 = -1198288656;
                        goto LABEL_725;
                      case 66769:
                        v15 = -1181511440;
                        goto LABEL_725;
                      case 66770:
                        v15 = -1164734224;
                        goto LABEL_725;
                      case 66771:
                        v15 = -1147957008;
                        goto LABEL_725;
                      default:
                        goto LABEL_148;
                    }
                }
              }
            }
            else
            {
              if (v119 <= 64255)
              {
                switch(v119)
                {
                  case 43888:
                    v11 = -28959;
                    goto LABEL_616;
                  case 43889:
                    v12 = -28959;
                    goto LABEL_988;
                  case 43890:
                    v38 = -28959;
                    goto LABEL_619;
                  case 43891:
                    v18 = -28959;
                    goto LABEL_990;
                  case 43892:
                    v39 = -28959;
                    goto LABEL_622;
                  case 43893:
                    v40 = -28959;
                    goto LABEL_992;
                  case 43894:
                    v41 = -28959;
                    goto LABEL_461;
                  case 43895:
                    v42 = -28959;
                    goto LABEL_994;
                  case 43896:
                    v43 = -28959;
                    goto LABEL_822;
                  case 43897:
                    v44 = -28959;
                    goto LABEL_996;
                  case 43898:
                    v82 = -28959;
                    goto LABEL_824;
                  case 43899:
                    v83 = -28959;
                    goto LABEL_998;
                  case 43900:
                    v84 = -28959;
                    goto LABEL_887;
                  case 43901:
                    v85 = -28959;
                    goto LABEL_227;
                  case 43902:
                    v86 = -28959;
                    goto LABEL_229;
                  case 43903:
                    v87 = -28959;
                    goto LABEL_231;
                  case 43904:
                    LOWORD(v120) = -28959;
                    v60 = -80;
                    goto LABEL_1029;
                  case 43905:
                    LOWORD(v120) = -28959;
                    v60 = -79;
                    goto LABEL_1029;
                  case 43906:
                    LOWORD(v120) = -28959;
                    v60 = -78;
                    goto LABEL_1029;
                  case 43907:
                    LOWORD(v120) = -28959;
                    v60 = -77;
                    goto LABEL_1029;
                  case 43908:
                    LOWORD(v120) = -28959;
                    v60 = -76;
                    goto LABEL_1029;
                  case 43909:
                    LOWORD(v120) = -28959;
                    v60 = -75;
                    goto LABEL_1029;
                  case 43910:
                    LOWORD(v120) = -28959;
                    v60 = -74;
                    goto LABEL_1029;
                  case 43911:
                    LOWORD(v120) = -28959;
                    v60 = -73;
                    goto LABEL_1029;
                  case 43912:
                    LOWORD(v120) = -28959;
                    v60 = -72;
                    goto LABEL_1029;
                  case 43913:
                    LOWORD(v120) = -28959;
                    v60 = -71;
                    goto LABEL_1029;
                  case 43914:
                    LOWORD(v120) = -28959;
                    v60 = -70;
                    goto LABEL_1029;
                  case 43915:
                    LOWORD(v120) = -28959;
                    v60 = -69;
                    goto LABEL_1029;
                  case 43916:
                    LOWORD(v120) = -28959;
                    v60 = -68;
                    goto LABEL_1029;
                  case 43917:
                    LOWORD(v120) = -28959;
                    v60 = -67;
                    goto LABEL_1029;
                  case 43918:
                    LOWORD(v120) = -28959;
                    v60 = -66;
                    goto LABEL_1029;
                  case 43919:
                    LOWORD(v120) = -28959;
                    v60 = -65;
                    goto LABEL_1029;
                  case 43920:
                    LOWORD(v120) = -28703;
                    v60 = 0x80;
                    goto LABEL_1029;
                  case 43921:
                    v19 = -28703;
                    goto LABEL_182;
                  case 43922:
                    v88 = -28703;
                    goto LABEL_627;
                  case 43923:
                    v89 = -28703;
                    goto LABEL_629;
                  case 43924:
                    v90 = -28703;
                    goto LABEL_631;
                  case 43925:
                    v91 = -28703;
                    goto LABEL_633;
                  case 43926:
                    v92 = -28703;
                    goto LABEL_781;
                  case 43927:
                    v93 = -28703;
                    goto LABEL_636;
                  case 43928:
                    v94 = -28703;
                    goto LABEL_784;
                  case 43929:
                    v95 = -28703;
                    goto LABEL_639;
                  case 43930:
                    v96 = -28703;
                    goto LABEL_787;
                  case 43931:
                    v97 = -28703;
                    goto LABEL_642;
                  case 43932:
                    v98 = -28703;
                    goto LABEL_944;
                  case 43933:
                    v99 = -28703;
                    goto LABEL_645;
                  case 43934:
                    v45 = -28703;
                    goto LABEL_792;
                  case 43935:
                    v100 = -28703;
                    goto LABEL_1016;
                  case 43936:
                    v13 = -28703;
                    goto LABEL_795;
                  case 43937:
                    v23 = -28703;
                    goto LABEL_1018;
                  case 43938:
                    v24 = -28703;
                    goto LABEL_798;
                  case 43939:
                    v25 = -28703;
                    goto LABEL_1020;
                  case 43940:
                    v26 = -28703;
                    goto LABEL_801;
                  case 43941:
                    v27 = -28703;
                    goto LABEL_1022;
                  case 43942:
                    v28 = -28703;
                    goto LABEL_804;
                  case 43943:
                    v29 = -28703;
                    goto LABEL_1024;
                  case 43944:
                    v30 = -28703;
                    goto LABEL_807;
                  case 43945:
                    v31 = -28703;
                    goto LABEL_1026;
                  case 43946:
                    v32 = -28703;
                    goto LABEL_810;
                  case 43947:
                    v33 = -28703;
                    goto LABEL_1028;
                  case 43948:
                    v34 = -28703;
                    goto LABEL_813;
                  case 43949:
                    v35 = -28703;
                    goto LABEL_984;
                  case 43950:
                    v36 = -28703;
                    goto LABEL_816;
                  case 43951:
                    v37 = -28703;
                    goto LABEL_986;
                  case 43952:
                    v11 = -28703;
                    goto LABEL_616;
                  case 43953:
                    v12 = -28703;
                    goto LABEL_988;
                  case 43954:
                    v38 = -28703;
                    goto LABEL_619;
                  case 43955:
                    v18 = -28703;
                    goto LABEL_990;
                  case 43956:
                    v39 = -28703;
                    goto LABEL_622;
                  case 43957:
                    v40 = -28703;
                    goto LABEL_992;
                  case 43958:
                    v41 = -28703;
                    goto LABEL_461;
                  case 43959:
                    v42 = -28703;
                    goto LABEL_994;
                  case 43960:
                    v43 = -28703;
                    goto LABEL_822;
                  case 43961:
                    v44 = -28703;
                    goto LABEL_996;
                  case 43962:
                    v82 = -28703;
                    goto LABEL_824;
                  case 43963:
                    v83 = -28703;
                    goto LABEL_998;
                  case 43964:
                    v84 = -28703;
                    goto LABEL_887;
                  case 43965:
                    v85 = -28703;
LABEL_227:
                    LOWORD(v120) = v85;
                    v60 = -83;
                    break;
                  case 43966:
                    v86 = -28703;
LABEL_229:
                    LOWORD(v120) = v86;
                    v60 = -82;
                    break;
                  case 43967:
                    v87 = -28703;
LABEL_231:
                    LOWORD(v120) = v87;
                    v60 = -81;
                    break;
                  default:
                    goto LABEL_148;
                }
                goto LABEL_1029;
              }
              switch(v119)
              {
                case 66560:
                  v15 = -1466920720;
                  break;
                case 66561:
                  v15 = -1450143504;
                  break;
                case 66562:
                  v15 = -1433366288;
                  break;
                case 66563:
                  v15 = -1416589072;
                  break;
                case 66564:
                  v15 = -1399811856;
                  break;
                case 66565:
                  v15 = -1383034640;
                  break;
                case 66566:
                  v15 = -1366257424;
                  break;
                case 66567:
                  v15 = -1349480208;
                  break;
                case 66568:
                  v15 = -1332702992;
                  break;
                case 66569:
                  v15 = -1315925776;
                  break;
                case 66570:
                  v15 = -1299148560;
                  break;
                case 66571:
                  v15 = -1282371344;
                  break;
                case 66572:
                  v15 = -1265594128;
                  break;
                case 66573:
                  v15 = -1248816912;
                  break;
                case 66574:
                  v15 = -1232039696;
                  break;
                case 66575:
                  v15 = -1215262480;
                  break;
                case 66576:
                  v15 = -1198485264;
                  break;
                case 66577:
                  v15 = -1181708048;
                  break;
                case 66578:
                  v15 = -1164930832;
                  break;
                case 66579:
                  v15 = -1148153616;
                  break;
                case 66580:
                  v15 = -1131376400;
                  break;
                case 66581:
                  v15 = -1114599184;
                  break;
                case 66582:
                  v15 = -1097821968;
                  break;
                case 66583:
                  v15 = -1081044752;
                  break;
                case 66584:
                  v15 = -2137943824;
                  break;
                case 66585:
                  v15 = -2121166608;
                  break;
                case 66586:
                  v15 = -2104389392;
                  break;
                case 66587:
                  v15 = -2087612176;
                  break;
                case 66588:
                  v15 = -2070834960;
                  break;
                case 66589:
                  v15 = -2054057744;
                  break;
                case 66590:
                  v15 = -2037280528;
                  break;
                case 66591:
                  v15 = -2020503312;
                  break;
                case 66592:
                  v15 = -2003726096;
                  break;
                case 66593:
                  v15 = -1986948880;
                  break;
                case 66594:
                  v15 = -1970171664;
                  break;
                case 66595:
                  v15 = -1953394448;
                  break;
                case 66596:
                  v15 = -1936617232;
                  break;
                case 66597:
                  v15 = -1919840016;
                  break;
                case 66598:
                  v15 = -1903062800;
                  break;
                case 66599:
                  v15 = -1886285584;
                  break;
                default:
                  switch(v119)
                  {
                    case 65313:
                      v19 = -16913;
LABEL_182:
                      LOWORD(v120) = v19;
                      v60 = -127;
                      goto LABEL_1029;
                    case 65314:
                      v88 = -16913;
LABEL_627:
                      LOWORD(v120) = v88;
                      v60 = -126;
                      goto LABEL_1029;
                    case 65315:
                      v89 = -16913;
LABEL_629:
                      LOWORD(v120) = v89;
                      v60 = -125;
                      goto LABEL_1029;
                    case 65316:
                      v90 = -16913;
LABEL_631:
                      LOWORD(v120) = v90;
                      v60 = -124;
                      goto LABEL_1029;
                    case 65317:
                      v91 = -16913;
LABEL_633:
                      LOWORD(v120) = v91;
                      v60 = -123;
                      goto LABEL_1029;
                    case 65318:
                      v92 = -16913;
                      goto LABEL_781;
                    case 65319:
                      v93 = -16913;
LABEL_636:
                      LOWORD(v120) = v93;
                      v60 = -121;
                      goto LABEL_1029;
                    case 65320:
                      v94 = -16913;
                      goto LABEL_784;
                    case 65321:
                      v95 = -16913;
LABEL_639:
                      LOWORD(v120) = v95;
                      v60 = -119;
                      goto LABEL_1029;
                    case 65322:
                      v96 = -16913;
                      goto LABEL_787;
                    case 65323:
                      v97 = -16913;
LABEL_642:
                      LOWORD(v120) = v97;
                      v60 = -117;
                      goto LABEL_1029;
                    case 65324:
                      v98 = -16913;
                      goto LABEL_944;
                    case 65325:
                      v99 = -16913;
LABEL_645:
                      LOWORD(v120) = v99;
                      v60 = -115;
                      goto LABEL_1029;
                    case 65326:
                      v45 = -16913;
                      goto LABEL_792;
                    case 65327:
                      v100 = -16913;
                      goto LABEL_1016;
                    case 65328:
                      v13 = -16913;
                      goto LABEL_795;
                    case 65329:
                      v23 = -16913;
                      goto LABEL_1018;
                    case 65330:
                      v24 = -16913;
                      goto LABEL_798;
                    case 65331:
                      v25 = -16913;
                      goto LABEL_1020;
                    case 65332:
                      v26 = -16913;
                      goto LABEL_801;
                    case 65333:
                      v27 = -16913;
                      goto LABEL_1022;
                    case 65334:
                      v28 = -16913;
                      goto LABEL_804;
                    case 65335:
                      v29 = -16913;
                      goto LABEL_1024;
                    case 65336:
                      v30 = -16913;
                      goto LABEL_807;
                    case 65337:
                      v31 = -16913;
                      goto LABEL_1026;
                    case 65338:
                      v32 = -16913;
                      goto LABEL_810;
                    default:
                      switch(v119)
                      {
                        case 64256:
                          v80 = 102;
LABEL_733:
                          LOBYTE(v120) = v80;
                          cmark_strbuf_put(v7, &v120, 1);
                          LOBYTE(v120) = v80;
                          goto LABEL_741;
                        case 64257:
                          LOBYTE(v120) = 102;
                          goto LABEL_737;
                        case 64258:
                          LOBYTE(v120) = 102;
                          goto LABEL_739;
                        case 64259:
                          LOBYTE(v120) = 102;
                          cmark_strbuf_put(v7, &v120, 1);
                          LOBYTE(v120) = 102;
LABEL_737:
                          cmark_strbuf_put(v7, &v120, 1);
                          LOBYTE(v120) = 105;
                          goto LABEL_741;
                        case 64260:
                          LOBYTE(v120) = 102;
                          cmark_strbuf_put(v7, &v120, 1);
                          LOBYTE(v120) = 102;
LABEL_739:
                          cmark_strbuf_put(v7, &v120, 1);
                          v22 = 108;
                          goto LABEL_740;
                        case 64261:
                        case 64262:
                          LOBYTE(v120) = 115;
                          cmark_strbuf_put(v7, &v120, 1);
                          v22 = 116;
                          goto LABEL_740;
                        case 64275:
                          v117 = -19243;
                          goto LABEL_746;
                        case 64276:
                          LOWORD(v120) = -19243;
                          cmark_strbuf_put(v7, &v120, 2);
                          v21 = -23083;
                          goto LABEL_138;
                        case 64277:
                          LOWORD(v120) = -19243;
                          cmark_strbuf_put(v7, &v120, 2);
                          v21 = -21547;
                          goto LABEL_138;
                        case 64278:
                          v117 = -16683;
LABEL_746:
                          LOWORD(v120) = v117;
                          cmark_strbuf_put(v7, &v120, 2);
                          v21 = -18731;
                          break;
                        case 64279:
                          LOWORD(v120) = -19243;
                          cmark_strbuf_put(v7, &v120, 2);
                          v21 = -21035;
                          goto LABEL_138;
                        default:
                          goto LABEL_148;
                      }
                      goto LABEL_138;
                  }
              }
            }
LABEL_725:
            v120 = v15;
            v74 = v7;
            v75 = 4;
            goto LABEL_1030;
          }
          if (v119 > 11263)
          {
            switch(v119)
            {
              case 11264:
                v16 = -20254;
LABEL_419:
                LOWORD(v120) = v16;
                v60 = -80;
                break;
              case 11265:
                v46 = -20254;
                goto LABEL_860;
              case 11266:
                v47 = -20254;
LABEL_755:
                LOWORD(v120) = v47;
                v60 = -78;
                break;
              case 11267:
                v48 = -20254;
                goto LABEL_897;
              case 11268:
                v49 = -20254;
LABEL_758:
                LOWORD(v120) = v49;
                v60 = -76;
                break;
              case 11269:
                v50 = -20254;
                goto LABEL_968;
              case 11270:
                v51 = -20254;
                goto LABEL_832;
              case 11271:
                v52 = -20254;
                goto LABEL_970;
              case 11272:
                v53 = -20254;
LABEL_763:
                LOWORD(v120) = v53;
                v60 = -72;
                break;
              case 11273:
                v54 = -20254;
                goto LABEL_936;
              case 11274:
                v55 = -20254;
LABEL_932:
                LOWORD(v120) = v55;
                v60 = -70;
                break;
              case 11275:
                v56 = -20254;
                goto LABEL_902;
              case 11276:
                v57 = -20254;
LABEL_934:
                LOWORD(v120) = v57;
                v60 = -68;
                break;
              case 11277:
                v58 = -20254;
                goto LABEL_904;
              case 11278:
                v59 = -20254;
LABEL_100:
                LOWORD(v120) = v59;
                v60 = -66;
                break;
              case 11279:
                v61 = -20254;
                goto LABEL_938;
              case 11280:
                v17 = -19998;
LABEL_772:
                LOWORD(v120) = v17;
                v60 = 0x80;
                break;
              case 11281:
                v20 = -19998;
                goto LABEL_1002;
              case 11282:
                v109 = -19998;
LABEL_775:
                LOWORD(v120) = v109;
                v60 = -126;
                break;
              case 11283:
                v101 = -19998;
                goto LABEL_1004;
              case 11284:
                v62 = -19998;
LABEL_778:
                LOWORD(v120) = v62;
                v60 = -124;
                break;
              case 11285:
                v102 = -19998;
                goto LABEL_1006;
              case 11286:
                v92 = -19998;
LABEL_781:
                LOWORD(v120) = v92;
                v60 = -122;
                break;
              case 11287:
                v103 = -19998;
                goto LABEL_1008;
              case 11288:
                v94 = -19998;
LABEL_784:
                LOWORD(v120) = v94;
                v60 = -120;
                break;
              case 11289:
                v104 = -19998;
                goto LABEL_1010;
              case 11290:
                v96 = -19998;
LABEL_787:
                LOWORD(v120) = v96;
                v60 = -118;
                break;
              case 11291:
                v81 = -19998;
                goto LABEL_1012;
              case 11292:
                v98 = -19998;
LABEL_944:
                LOWORD(v120) = v98;
                v60 = -116;
                break;
              case 11293:
                v105 = -19998;
                goto LABEL_1014;
              case 11294:
                v45 = -19998;
                goto LABEL_792;
              case 11295:
                v100 = -19998;
                goto LABEL_1016;
              case 11296:
                v13 = -19998;
LABEL_795:
                LOWORD(v120) = v13;
                v60 = -112;
                break;
              case 11297:
                v23 = -19998;
                goto LABEL_1018;
              case 11298:
                v24 = -19998;
LABEL_798:
                LOWORD(v120) = v24;
                v60 = -110;
                break;
              case 11299:
                v25 = -19998;
                goto LABEL_1020;
              case 11300:
                v26 = -19998;
LABEL_801:
                LOWORD(v120) = v26;
                v60 = -108;
                break;
              case 11301:
                v27 = -19998;
                goto LABEL_1022;
              case 11302:
                v28 = -19998;
LABEL_804:
                LOWORD(v120) = v28;
                v60 = -106;
                break;
              case 11303:
                v29 = -19998;
                goto LABEL_1024;
              case 11304:
                v30 = -19998;
LABEL_807:
                LOWORD(v120) = v30;
                v60 = -104;
                break;
              case 11305:
                v31 = -19998;
                goto LABEL_1026;
              case 11306:
                v32 = -19998;
LABEL_810:
                LOWORD(v120) = v32;
                v60 = -102;
                break;
              case 11307:
                v33 = -19998;
                goto LABEL_1028;
              case 11308:
                v34 = -19998;
LABEL_813:
                LOWORD(v120) = v34;
                v60 = -100;
                break;
              case 11309:
                v35 = -19998;
                goto LABEL_984;
              case 11310:
                v36 = -19998;
LABEL_816:
                LOWORD(v120) = v36;
                v60 = -98;
                break;
              case 11311:
              case 11312:
              case 11313:
              case 11314:
              case 11315:
              case 11316:
              case 11317:
              case 11318:
              case 11319:
              case 11320:
              case 11321:
              case 11322:
              case 11323:
              case 11324:
              case 11325:
              case 11326:
              case 11327:
              case 11328:
              case 11329:
              case 11330:
              case 11331:
              case 11332:
              case 11333:
              case 11334:
              case 11335:
              case 11336:
              case 11337:
              case 11338:
              case 11339:
              case 11340:
              case 11341:
              case 11342:
              case 11343:
              case 11344:
              case 11345:
              case 11346:
              case 11347:
              case 11348:
              case 11349:
              case 11350:
              case 11351:
              case 11352:
              case 11353:
              case 11354:
              case 11355:
              case 11356:
              case 11357:
              case 11358:
              case 11359:
              case 11361:
              case 11365:
              case 11366:
              case 11368:
              case 11370:
              case 11372:
              case 11377:
              case 11379:
              case 11380:
              case 11382:
              case 11383:
              case 11384:
              case 11385:
              case 11386:
              case 11387:
              case 11388:
              case 11389:
              case 11393:
              case 11395:
              case 11397:
              case 11399:
              case 11401:
              case 11403:
              case 11405:
              case 11407:
              case 11409:
              case 11411:
              case 11413:
              case 11415:
              case 11417:
              case 11419:
              case 11421:
              case 11423:
              case 11425:
              case 11427:
              case 11429:
              case 11431:
              case 11433:
              case 11435:
              case 11437:
              case 11439:
              case 11441:
              case 11443:
              case 11445:
              case 11447:
              case 11449:
              case 11451:
              case 11453:
              case 11455:
              case 11457:
              case 11459:
              case 11461:
              case 11463:
              case 11465:
              case 11467:
              case 11469:
              case 11471:
              case 11473:
              case 11475:
              case 11477:
              case 11479:
              case 11481:
              case 11483:
              case 11485:
              case 11487:
              case 11489:
              case 11491:
              case 11492:
              case 11493:
              case 11494:
              case 11495:
              case 11496:
              case 11497:
              case 11498:
              case 11500:
              case 11502:
              case 11503:
              case 11504:
              case 11505:
                goto LABEL_148;
              case 11360:
                v12 = -19998;
                goto LABEL_988;
              case 11362:
                v21 = -21559;
                goto LABEL_138;
              case 11363:
                v58 = -18975;
                goto LABEL_904;
              case 11364:
                v21 = -16951;
                goto LABEL_138;
              case 11367:
                v43 = -19998;
LABEL_822:
                LOWORD(v120) = v43;
                v60 = -88;
                break;
              case 11369:
                v82 = -19998;
LABEL_824:
                LOWORD(v120) = v82;
                v60 = -86;
                break;
              case 11371:
                v84 = -19998;
                goto LABEL_887;
              case 11373:
                v21 = -28215;
                goto LABEL_138;
              case 11374:
                v21 = -20023;
                goto LABEL_138;
              case 11375:
                v21 = -28471;
                goto LABEL_138;
              case 11376:
                v21 = -27959;
                goto LABEL_138;
              case 11378:
                v48 = -19998;
                goto LABEL_897;
              case 11381:
                v51 = -19998;
LABEL_832:
                LOWORD(v120) = v51;
                v60 = -74;
                break;
              case 11390:
                v21 = -16440;
                goto LABEL_138;
              case 11391:
                v21 = -32567;
                goto LABEL_138;
              case 11392:
                v20 = -19742;
                goto LABEL_1002;
              case 11394:
                v101 = -19742;
                goto LABEL_1004;
              case 11396:
                v102 = -19742;
                goto LABEL_1006;
              case 11398:
                v103 = -19742;
                goto LABEL_1008;
              case 11400:
                v104 = -19742;
                goto LABEL_1010;
              case 11402:
                v81 = -19742;
                goto LABEL_1012;
              case 11404:
                v105 = -19742;
                goto LABEL_1014;
              case 11406:
                v100 = -19742;
                goto LABEL_1016;
              case 11408:
                v23 = -19742;
                goto LABEL_1018;
              case 11410:
                v25 = -19742;
                goto LABEL_1020;
              case 11412:
                v27 = -19742;
                goto LABEL_1022;
              case 11414:
                v29 = -19742;
                goto LABEL_1024;
              case 11416:
                v31 = -19742;
                goto LABEL_1026;
              case 11418:
                v33 = -19742;
                goto LABEL_1028;
              case 11420:
                v35 = -19742;
                goto LABEL_984;
              case 11422:
                v37 = -19742;
                goto LABEL_986;
              case 11424:
                v12 = -19742;
                goto LABEL_988;
              case 11426:
                v18 = -19742;
                goto LABEL_990;
              case 11428:
                v40 = -19742;
LABEL_992:
                LOWORD(v120) = v40;
                v60 = -91;
                break;
              case 11430:
                v42 = -19742;
LABEL_994:
                LOWORD(v120) = v42;
                v60 = -89;
                break;
              case 11432:
                v44 = -19742;
LABEL_996:
                LOWORD(v120) = v44;
                v60 = -87;
                break;
              case 11434:
                v83 = -19742;
LABEL_998:
                LOWORD(v120) = v83;
                v60 = -85;
                break;
              case 11436:
                v106 = -19742;
LABEL_1000:
                LOWORD(v120) = v106;
                v60 = -83;
                break;
              case 11438:
                v107 = -19742;
LABEL_930:
                LOWORD(v120) = v107;
                v60 = -81;
                break;
              case 11440:
                v46 = -19742;
LABEL_860:
                LOWORD(v120) = v46;
                v60 = -79;
                break;
              case 11442:
                v48 = -19742;
                goto LABEL_897;
              case 11444:
                v50 = -19742;
LABEL_968:
                LOWORD(v120) = v50;
                v60 = -75;
                break;
              case 11446:
                v52 = -19742;
LABEL_970:
                LOWORD(v120) = v52;
                v60 = -73;
                break;
              case 11448:
                v54 = -19742;
LABEL_936:
                LOWORD(v120) = v54;
                v60 = -71;
                break;
              case 11450:
                v56 = -19742;
LABEL_902:
                LOWORD(v120) = v56;
                v60 = -69;
                break;
              case 11452:
                v58 = -19742;
LABEL_904:
                LOWORD(v120) = v58;
                v60 = -67;
                break;
              case 11454:
                v61 = -19742;
LABEL_938:
                LOWORD(v120) = v61;
                v60 = -65;
                break;
              case 11456:
                v20 = -19486;
LABEL_1002:
                LOWORD(v120) = v20;
                v60 = -127;
                break;
              case 11458:
                v101 = -19486;
LABEL_1004:
                LOWORD(v120) = v101;
                v60 = -125;
                break;
              case 11460:
                v102 = -19486;
LABEL_1006:
                LOWORD(v120) = v102;
                v60 = -123;
                break;
              case 11462:
                v103 = -19486;
LABEL_1008:
                LOWORD(v120) = v103;
                v60 = -121;
                break;
              case 11464:
                v104 = -19486;
LABEL_1010:
                LOWORD(v120) = v104;
                v60 = -119;
                break;
              case 11466:
                v81 = -19486;
LABEL_1012:
                LOWORD(v120) = v81;
                v60 = -117;
                break;
              case 11468:
                v105 = -19486;
LABEL_1014:
                LOWORD(v120) = v105;
                v60 = -115;
                break;
              case 11470:
                v100 = -19486;
LABEL_1016:
                LOWORD(v120) = v100;
                v60 = -113;
                break;
              case 11472:
                v23 = -19486;
LABEL_1018:
                LOWORD(v120) = v23;
                v60 = -111;
                break;
              case 11474:
                v25 = -19486;
LABEL_1020:
                LOWORD(v120) = v25;
                v60 = -109;
                break;
              case 11476:
                v27 = -19486;
LABEL_1022:
                LOWORD(v120) = v27;
                v60 = -107;
                break;
              case 11478:
                v29 = -19486;
LABEL_1024:
                LOWORD(v120) = v29;
                v60 = -105;
                break;
              case 11480:
                v31 = -19486;
LABEL_1026:
                LOWORD(v120) = v31;
                v60 = -103;
                break;
              case 11482:
                v33 = -19486;
LABEL_1028:
                LOWORD(v120) = v33;
                v60 = -101;
                break;
              case 11484:
                v35 = -19486;
LABEL_984:
                LOWORD(v120) = v35;
                v60 = -99;
                break;
              case 11486:
                v37 = -19486;
LABEL_986:
                LOWORD(v120) = v37;
                v60 = -97;
                break;
              case 11488:
                v12 = -19486;
LABEL_988:
                LOWORD(v120) = v12;
                v60 = -95;
                break;
              case 11490:
                v18 = -19486;
LABEL_990:
                LOWORD(v120) = v18;
                v60 = -93;
                break;
              case 11499:
                v84 = -19486;
LABEL_887:
                LOWORD(v120) = v84;
                v60 = -84;
                break;
              case 11501:
                LOWORD(v120) = -19486;
                v60 = -82;
                break;
              case 11506:
                v48 = -19486;
LABEL_897:
                LOWORD(v120) = v48;
                v60 = -77;
                break;
              default:
                switch(v119)
                {
                  case 42786:
                    v18 = -25366;
                    goto LABEL_990;
                  case 42787:
                  case 42789:
                  case 42791:
                  case 42793:
                  case 42795:
                  case 42797:
                  case 42799:
                  case 42800:
                  case 42801:
                  case 42803:
                  case 42805:
                  case 42807:
                  case 42809:
                  case 42811:
                  case 42813:
                  case 42815:
                  case 42817:
                  case 42819:
                  case 42821:
                  case 42823:
                  case 42825:
                  case 42827:
                  case 42829:
                  case 42831:
                  case 42833:
                  case 42835:
                  case 42837:
                  case 42839:
                  case 42841:
                  case 42843:
                  case 42845:
                  case 42847:
                  case 42849:
                  case 42851:
                  case 42853:
                  case 42855:
                  case 42857:
                  case 42859:
                  case 42861:
                  case 42863:
                  case 42864:
                  case 42865:
                  case 42866:
                  case 42867:
                  case 42868:
                  case 42869:
                  case 42870:
                  case 42871:
                  case 42872:
                  case 42874:
                  case 42876:
                  case 42879:
                  case 42881:
                  case 42883:
                  case 42885:
                  case 42887:
                  case 42888:
                  case 42889:
                  case 42890:
                  case 42892:
                  case 42894:
                  case 42895:
                  case 42897:
                  case 42899:
                  case 42900:
                  case 42901:
                  case 42903:
                  case 42905:
                  case 42907:
                  case 42909:
                  case 42911:
                  case 42913:
                  case 42915:
                  case 42917:
                  case 42919:
                  case 42921:
                  case 42927:
                  case 42933:
                    goto LABEL_148;
                  case 42788:
                    v40 = -25366;
                    goto LABEL_992;
                  case 42790:
                    v42 = -25366;
                    goto LABEL_994;
                  case 42792:
                    v44 = -25366;
                    goto LABEL_996;
                  case 42794:
                    v83 = -25366;
                    goto LABEL_998;
                  case 42796:
                    v106 = -25366;
                    goto LABEL_1000;
                  case 42798:
                    v107 = -25366;
                    goto LABEL_930;
                  case 42802:
                    v48 = -25366;
                    goto LABEL_897;
                  case 42804:
                    v50 = -25366;
                    goto LABEL_968;
                  case 42806:
                    v52 = -25366;
                    goto LABEL_970;
                  case 42808:
                    v54 = -25366;
                    goto LABEL_936;
                  case 42810:
                    v56 = -25366;
                    goto LABEL_902;
                  case 42812:
                    v58 = -25366;
                    goto LABEL_904;
                  case 42814:
                    v61 = -25366;
                    goto LABEL_938;
                  case 42816:
                    v20 = -25110;
                    goto LABEL_1002;
                  case 42818:
                    v101 = -25110;
                    goto LABEL_1004;
                  case 42820:
                    v102 = -25110;
                    goto LABEL_1006;
                  case 42822:
                    v103 = -25110;
                    goto LABEL_1008;
                  case 42824:
                    v104 = -25110;
                    goto LABEL_1010;
                  case 42826:
                    v81 = -25110;
                    goto LABEL_1012;
                  case 42828:
                    v105 = -25110;
                    goto LABEL_1014;
                  case 42830:
                    v100 = -25110;
                    goto LABEL_1016;
                  case 42832:
                    v23 = -25110;
                    goto LABEL_1018;
                  case 42834:
                    v25 = -25110;
                    goto LABEL_1020;
                  case 42836:
                    v27 = -25110;
                    goto LABEL_1022;
                  case 42838:
                    v29 = -25110;
                    goto LABEL_1024;
                  case 42840:
                    v31 = -25110;
                    goto LABEL_1026;
                  case 42842:
                    v33 = -25110;
                    goto LABEL_1028;
                  case 42844:
                    v35 = -25110;
                    goto LABEL_984;
                  case 42846:
                    v37 = -25110;
                    goto LABEL_986;
                  case 42848:
                    v12 = -25110;
                    goto LABEL_988;
                  case 42850:
                    v18 = -25110;
                    goto LABEL_990;
                  case 42852:
                    v40 = -25110;
                    goto LABEL_992;
                  case 42854:
                    v42 = -25110;
                    goto LABEL_994;
                  case 42856:
                    v44 = -25110;
                    goto LABEL_996;
                  case 42858:
                    v83 = -25110;
                    goto LABEL_998;
                  case 42860:
                    v106 = -25110;
                    goto LABEL_1000;
                  case 42862:
                    v107 = -25110;
                    goto LABEL_930;
                  case 42873:
                    v55 = -25110;
                    goto LABEL_932;
                  case 42875:
                    v57 = -25110;
                    goto LABEL_934;
                  case 42877:
                    v54 = -18975;
                    goto LABEL_936;
                  case 42878:
                    v61 = -25110;
                    goto LABEL_938;
                  case 42880:
                    v20 = -24854;
                    goto LABEL_1002;
                  case 42882:
                    v101 = -24854;
                    goto LABEL_1004;
                  case 42884:
                    v102 = -24854;
                    goto LABEL_1006;
                  case 42886:
                    v103 = -24854;
                    goto LABEL_1008;
                  case 42891:
                    v98 = -24854;
                    goto LABEL_944;
                  case 42893:
                    v21 = -23095;
                    goto LABEL_138;
                  case 42896:
                    v23 = -24854;
                    goto LABEL_1018;
                  case 42898:
                    v25 = -24854;
                    goto LABEL_1020;
                  case 42902:
                    v29 = -24854;
                    goto LABEL_1024;
                  case 42904:
                    v31 = -24854;
                    goto LABEL_1026;
                  case 42906:
                    v33 = -24854;
                    goto LABEL_1028;
                  case 42908:
                    v35 = -24854;
                    goto LABEL_984;
                  case 42910:
                    v37 = -24854;
                    goto LABEL_986;
                  case 42912:
                    v12 = -24854;
                    goto LABEL_988;
                  case 42914:
                    v18 = -24854;
                    goto LABEL_990;
                  case 42916:
                    v40 = -24854;
                    goto LABEL_992;
                  case 42918:
                    v42 = -24854;
                    goto LABEL_994;
                  case 42920:
                    v44 = -24854;
                    goto LABEL_996;
                  case 42922:
                    v21 = -22839;
                    goto LABEL_138;
                  case 42923:
                    v21 = -25399;
                    goto LABEL_138;
                  case 42924:
                    v21 = -24119;
                    goto LABEL_138;
                  case 42925:
                    v21 = -21303;
                    goto LABEL_138;
                  case 42926:
                    v21 = -21815;
                    goto LABEL_138;
                  case 42928:
                    v21 = -24886;
                    goto LABEL_138;
                  case 42929:
                    v21 = -30774;
                    goto LABEL_138;
                  case 42930:
                    v21 = -25142;
                    goto LABEL_138;
                  case 42931:
                    v25 = -21014;
                    goto LABEL_1020;
                  case 42932:
                    v50 = -24854;
                    goto LABEL_968;
                  case 42934:
                    v52 = -24854;
                    goto LABEL_970;
                  default:
                    switch(v119)
                    {
                      case 42560:
                        v20 = -26134;
                        goto LABEL_1002;
                      case 42562:
                        v101 = -26134;
                        goto LABEL_1004;
                      case 42564:
                        v102 = -26134;
                        goto LABEL_1006;
                      case 42566:
                        v103 = -26134;
                        goto LABEL_1008;
                      case 42568:
                        v104 = -26134;
                        goto LABEL_1010;
                      case 42570:
LABEL_147:
                        v81 = -26134;
                        goto LABEL_1012;
                      case 42572:
                        v105 = -26134;
                        goto LABEL_1014;
                      case 42574:
                        v100 = -26134;
                        goto LABEL_1016;
                      case 42576:
                        v23 = -26134;
                        goto LABEL_1018;
                      case 42578:
                        v25 = -26134;
                        goto LABEL_1020;
                      case 42580:
                        v27 = -26134;
                        goto LABEL_1022;
                      case 42582:
                        v29 = -26134;
                        goto LABEL_1024;
                      case 42584:
                        v31 = -26134;
                        goto LABEL_1026;
                      case 42586:
                        v33 = -26134;
                        goto LABEL_1028;
                      case 42588:
                        v35 = -26134;
                        goto LABEL_984;
                      case 42590:
                        v37 = -26134;
                        goto LABEL_986;
                      case 42592:
                        v12 = -26134;
                        goto LABEL_988;
                      case 42594:
                        v18 = -26134;
                        goto LABEL_990;
                      case 42596:
                        v40 = -26134;
                        goto LABEL_992;
                      case 42598:
                        v42 = -26134;
                        goto LABEL_994;
                      case 42600:
                        v44 = -26134;
                        goto LABEL_996;
                      case 42602:
                        v83 = -26134;
                        goto LABEL_998;
                      case 42604:
                        v106 = -26134;
                        goto LABEL_1000;
                      case 42624:
                        v20 = -25878;
                        goto LABEL_1002;
                      case 42626:
                        v101 = -25878;
                        goto LABEL_1004;
                      case 42628:
                        v102 = -25878;
                        goto LABEL_1006;
                      case 42630:
                        v103 = -25878;
                        goto LABEL_1008;
                      case 42632:
                        v104 = -25878;
                        goto LABEL_1010;
                      case 42634:
                        v81 = -25878;
                        goto LABEL_1012;
                      case 42636:
                        v105 = -25878;
                        goto LABEL_1014;
                      case 42638:
                        v100 = -25878;
                        goto LABEL_1016;
                      case 42640:
                        v23 = -25878;
                        goto LABEL_1018;
                      case 42642:
                        v25 = -25878;
                        goto LABEL_1020;
                      case 42644:
                        v27 = -25878;
                        goto LABEL_1022;
                      case 42646:
                        v29 = -25878;
                        goto LABEL_1024;
                      case 42648:
                        v31 = -25878;
                        goto LABEL_1026;
                      case 42650:
                        v33 = -25878;
                        goto LABEL_1028;
                      default:
                        goto LABEL_148;
                    }
                }
            }
LABEL_1029:
            BYTE2(v120) = v60;
            v74 = v7;
            v75 = 3;
            goto LABEL_1030;
          }
          if (v119 > 9397)
          {
            switch(v119)
            {
              case 9398:
                v13 = -27678;
                goto LABEL_795;
              case 9399:
                v23 = -27678;
                goto LABEL_1018;
              case 9400:
                v24 = -27678;
                goto LABEL_798;
              case 9401:
                v25 = -27678;
                goto LABEL_1020;
              case 9402:
                v26 = -27678;
                goto LABEL_801;
              case 9403:
                v27 = -27678;
                goto LABEL_1022;
              case 9404:
                v28 = -27678;
                goto LABEL_804;
              case 9405:
                v29 = -27678;
                goto LABEL_1024;
              case 9406:
                v30 = -27678;
                goto LABEL_807;
              case 9407:
                v31 = -27678;
                goto LABEL_1026;
              case 9408:
                v32 = -27678;
                goto LABEL_810;
              case 9409:
                v33 = -27678;
                goto LABEL_1028;
              case 9410:
                v34 = -27678;
                goto LABEL_813;
              case 9411:
                v35 = -27678;
                goto LABEL_984;
              case 9412:
                v36 = -27678;
                goto LABEL_816;
              case 9413:
                v37 = -27678;
                goto LABEL_986;
              case 9414:
                v11 = -27678;
LABEL_616:
                LOWORD(v120) = v11;
                v60 = -96;
                goto LABEL_1029;
              case 9415:
                v12 = -27678;
                goto LABEL_988;
              case 9416:
                v38 = -27678;
LABEL_619:
                LOWORD(v120) = v38;
                v60 = -94;
                goto LABEL_1029;
              case 9417:
                v18 = -27678;
                goto LABEL_990;
              case 9418:
                v39 = -27678;
LABEL_622:
                LOWORD(v120) = v39;
                v60 = -92;
                goto LABEL_1029;
              case 9419:
                v40 = -27678;
                goto LABEL_992;
              case 9420:
                v41 = -27678;
LABEL_461:
                LOWORD(v120) = v41;
                v60 = -90;
                goto LABEL_1029;
              case 9421:
                v42 = -27678;
                goto LABEL_994;
              case 9422:
                v43 = -27678;
                goto LABEL_822;
              case 9423:
                v44 = -27678;
                goto LABEL_996;
              default:
                goto LABEL_148;
            }
          }
          if (v119 > 8497)
          {
            switch(v119)
            {
              case 8544:
                v16 = -31262;
                goto LABEL_419;
              case 8545:
                v46 = -31262;
                goto LABEL_860;
              case 8546:
                v47 = -31262;
                goto LABEL_755;
              case 8547:
                v48 = -31262;
                goto LABEL_897;
              case 8548:
                v49 = -31262;
                goto LABEL_758;
              case 8549:
                v50 = -31262;
                goto LABEL_968;
              case 8550:
                v51 = -31262;
                goto LABEL_832;
              case 8551:
                v52 = -31262;
                goto LABEL_970;
              case 8552:
                v53 = -31262;
                goto LABEL_763;
              case 8553:
                v54 = -31262;
                goto LABEL_936;
              case 8554:
                v55 = -31262;
                goto LABEL_932;
              case 8555:
                v56 = -31262;
                goto LABEL_902;
              case 8556:
                v57 = -31262;
                goto LABEL_934;
              case 8557:
                v58 = -31262;
                goto LABEL_904;
              case 8558:
                v59 = -31262;
                goto LABEL_100;
              case 8559:
                v61 = -31262;
                goto LABEL_938;
              case 8560:
              case 8561:
              case 8562:
              case 8563:
              case 8564:
              case 8565:
              case 8566:
              case 8567:
              case 8568:
              case 8569:
              case 8570:
              case 8571:
              case 8572:
              case 8573:
              case 8574:
              case 8575:
              case 8576:
              case 8577:
              case 8578:
                goto LABEL_148;
              case 8579:
                v62 = -31006;
                goto LABEL_778;
              default:
                if (v119 != 8498)
                  goto LABEL_148;
                v45 = -31262;
                break;
            }
LABEL_792:
            LOWORD(v120) = v45;
            v60 = -114;
            goto LABEL_1029;
          }
          switch(v119)
          {
            case 8486:
              v21 = -30257;
              goto LABEL_138;
            case 8490:
              v22 = 107;
LABEL_740:
              LOBYTE(v120) = v22;
LABEL_741:
              v74 = v7;
              v75 = 1;
              goto LABEL_1030;
            case 8491:
              v21 = -23101;
              goto LABEL_138;
          }
        }
        else
        {
          if (v119 > 4255)
          {
            if (v119 <= 7679)
            {
              switch(v119)
              {
                case 4256:
                  v17 = -19230;
                  goto LABEL_772;
                case 4257:
                  v20 = -19230;
                  goto LABEL_1002;
                case 4258:
                  v109 = -19230;
                  goto LABEL_775;
                case 4259:
                  v101 = -19230;
                  goto LABEL_1004;
                case 4260:
                  v62 = -19230;
                  goto LABEL_778;
                case 4261:
                  v102 = -19230;
                  goto LABEL_1006;
                case 4262:
                  v92 = -19230;
                  goto LABEL_781;
                case 4263:
                  v103 = -19230;
                  goto LABEL_1008;
                case 4264:
                  v94 = -19230;
                  goto LABEL_784;
                case 4265:
                  v104 = -19230;
                  goto LABEL_1010;
                case 4266:
                  v96 = -19230;
                  goto LABEL_787;
                case 4267:
                  v81 = -19230;
                  goto LABEL_1012;
                case 4268:
                  v98 = -19230;
                  goto LABEL_944;
                case 4269:
                  v105 = -19230;
                  goto LABEL_1014;
                case 4270:
                  v45 = -19230;
                  goto LABEL_792;
                case 4271:
                  v100 = -19230;
                  goto LABEL_1016;
                case 4272:
                  v13 = -19230;
                  goto LABEL_795;
                case 4273:
                  v23 = -19230;
                  goto LABEL_1018;
                case 4274:
                  v24 = -19230;
                  goto LABEL_798;
                case 4275:
                  v25 = -19230;
                  goto LABEL_1020;
                case 4276:
                  v26 = -19230;
                  goto LABEL_801;
                case 4277:
                  v27 = -19230;
                  goto LABEL_1022;
                case 4278:
                  v28 = -19230;
                  goto LABEL_804;
                case 4279:
                  v29 = -19230;
                  goto LABEL_1024;
                case 4280:
                  v30 = -19230;
                  goto LABEL_807;
                case 4281:
                  v31 = -19230;
                  goto LABEL_1026;
                case 4282:
                  v32 = -19230;
                  goto LABEL_810;
                case 4283:
                  v33 = -19230;
                  goto LABEL_1028;
                case 4284:
                  v34 = -19230;
                  goto LABEL_813;
                case 4285:
                  v35 = -19230;
                  goto LABEL_984;
                case 4286:
                  v36 = -19230;
                  goto LABEL_816;
                case 4287:
                  v37 = -19230;
                  goto LABEL_986;
                case 4288:
                  v11 = -19230;
                  goto LABEL_616;
                case 4289:
                  v12 = -19230;
                  goto LABEL_988;
                case 4290:
                  v38 = -19230;
                  goto LABEL_619;
                case 4291:
                  v18 = -19230;
                  goto LABEL_990;
                case 4292:
                  v39 = -19230;
                  goto LABEL_622;
                case 4293:
                  v40 = -19230;
                  goto LABEL_992;
                case 4294:
                case 4296:
                case 4297:
                case 4298:
                case 4299:
                case 4300:
                  goto LABEL_148;
                case 4295:
                  v42 = -19230;
                  goto LABEL_994;
                case 4301:
                  v106 = -19230;
                  goto LABEL_1000;
                default:
                  switch(v119)
                  {
                    case 7296:
                      v21 = -19760;
                      goto LABEL_138;
                    case 7297:
                      v21 = -19248;
                      goto LABEL_138;
                    case 7298:
                      v21 = -16688;
                      goto LABEL_138;
                    case 7299:
                      v21 = -32303;
                      goto LABEL_138;
                    case 7300:
                    case 7301:
                      v21 = -32047;
                      goto LABEL_138;
                    case 7302:
                      v21 = -29999;
                      goto LABEL_138;
                    case 7303:
                      v21 = -23599;
                      goto LABEL_138;
                    case 7304:
                      goto LABEL_147;
                    default:
                      switch(v119)
                      {
                        case 5112:
                          v16 = -28703;
                          goto LABEL_419;
                        case 5113:
                          v46 = -28703;
                          goto LABEL_860;
                        case 5114:
                          v47 = -28703;
                          goto LABEL_755;
                        case 5115:
                          v48 = -28703;
                          goto LABEL_897;
                        case 5116:
                          v49 = -28703;
                          goto LABEL_758;
                        case 5117:
                          v50 = -28703;
                          goto LABEL_968;
                        default:
                          goto LABEL_148;
                      }
                  }
              }
            }
            switch(v119)
            {
              case 7680:
                v20 = -18207;
                goto LABEL_1002;
              case 7682:
                v101 = -18207;
                goto LABEL_1004;
              case 7684:
                v102 = -18207;
                goto LABEL_1006;
              case 7686:
                v103 = -18207;
                goto LABEL_1008;
              case 7688:
                v104 = -18207;
                goto LABEL_1010;
              case 7690:
                v81 = -18207;
                goto LABEL_1012;
              case 7692:
                v105 = -18207;
                goto LABEL_1014;
              case 7694:
                v100 = -18207;
                goto LABEL_1016;
              case 7696:
                v23 = -18207;
                goto LABEL_1018;
              case 7698:
                v25 = -18207;
                goto LABEL_1020;
              case 7700:
                v27 = -18207;
                goto LABEL_1022;
              case 7702:
                v29 = -18207;
                goto LABEL_1024;
              case 7704:
                v31 = -18207;
                goto LABEL_1026;
              case 7706:
                v33 = -18207;
                goto LABEL_1028;
              case 7708:
                v35 = -18207;
                goto LABEL_984;
              case 7710:
                v37 = -18207;
                goto LABEL_986;
              case 7712:
                v12 = -18207;
                goto LABEL_988;
              case 7714:
                v18 = -18207;
                goto LABEL_990;
              case 7716:
                v40 = -18207;
                goto LABEL_992;
              case 7718:
                v42 = -18207;
                goto LABEL_994;
              case 7720:
                v44 = -18207;
                goto LABEL_996;
              case 7722:
                v83 = -18207;
                goto LABEL_998;
              case 7724:
                v106 = -18207;
                goto LABEL_1000;
              case 7726:
                v107 = -18207;
                goto LABEL_930;
              case 7728:
                v46 = -18207;
                goto LABEL_860;
              case 7730:
                v48 = -18207;
                goto LABEL_897;
              case 7732:
                v50 = -18207;
                goto LABEL_968;
              case 7734:
                v52 = -18207;
                goto LABEL_970;
              case 7736:
                v54 = -18207;
                goto LABEL_936;
              case 7738:
                v56 = -18207;
                goto LABEL_902;
              case 7740:
                v58 = -18207;
                goto LABEL_904;
              case 7742:
                v61 = -18207;
                goto LABEL_938;
              case 7744:
                v20 = -17951;
                goto LABEL_1002;
              case 7746:
                v101 = -17951;
                goto LABEL_1004;
              case 7748:
                v102 = -17951;
                goto LABEL_1006;
              case 7750:
                v103 = -17951;
                goto LABEL_1008;
              case 7752:
                v104 = -17951;
                goto LABEL_1010;
              case 7754:
                v81 = -17951;
                goto LABEL_1012;
              case 7756:
                v105 = -17951;
                goto LABEL_1014;
              case 7758:
                v100 = -17951;
                goto LABEL_1016;
              case 7760:
                v23 = -17951;
                goto LABEL_1018;
              case 7762:
                v25 = -17951;
                goto LABEL_1020;
              case 7764:
                v27 = -17951;
                goto LABEL_1022;
              case 7766:
                v29 = -17951;
                goto LABEL_1024;
              case 7768:
                v31 = -17951;
                goto LABEL_1026;
              case 7770:
                v33 = -17951;
                goto LABEL_1028;
              case 7772:
                v35 = -17951;
                goto LABEL_984;
              case 7774:
                v37 = -17951;
                goto LABEL_986;
              case 7776:
              case 7835:
                v12 = -17951;
                goto LABEL_988;
              case 7778:
                v18 = -17951;
                goto LABEL_990;
              case 7780:
                v40 = -17951;
                goto LABEL_992;
              case 7782:
                v42 = -17951;
                goto LABEL_994;
              case 7784:
                v44 = -17951;
                goto LABEL_996;
              case 7786:
                v83 = -17951;
                goto LABEL_998;
              case 7788:
                v106 = -17951;
                goto LABEL_1000;
              case 7790:
                v107 = -17951;
                goto LABEL_930;
              case 7792:
                v46 = -17951;
                goto LABEL_860;
              case 7794:
                v48 = -17951;
                goto LABEL_897;
              case 7796:
                v50 = -17951;
                goto LABEL_968;
              case 7798:
                v52 = -17951;
                goto LABEL_970;
              case 7800:
                v54 = -17951;
                goto LABEL_936;
              case 7802:
                v56 = -17951;
                goto LABEL_902;
              case 7804:
                v58 = -17951;
                goto LABEL_904;
              case 7806:
                v61 = -17951;
                goto LABEL_938;
              case 7808:
                v20 = -17695;
                goto LABEL_1002;
              case 7810:
                v101 = -17695;
                goto LABEL_1004;
              case 7812:
                v102 = -17695;
                goto LABEL_1006;
              case 7814:
                v103 = -17695;
                goto LABEL_1008;
              case 7816:
                v104 = -17695;
                goto LABEL_1010;
              case 7818:
                v81 = -17695;
                goto LABEL_1012;
              case 7820:
                v105 = -17695;
                goto LABEL_1014;
              case 7822:
                v100 = -17695;
                goto LABEL_1016;
              case 7824:
                v23 = -17695;
                goto LABEL_1018;
              case 7826:
                v25 = -17695;
                goto LABEL_1020;
              case 7828:
                v27 = -17695;
                goto LABEL_1022;
              case 7830:
                LOBYTE(v120) = 104;
                cmark_strbuf_put(v7, &v120, 1);
                v21 = -20020;
                break;
              case 7831:
                LOBYTE(v120) = 116;
                cmark_strbuf_put(v7, &v120, 1);
                v21 = -30516;
                break;
              case 7832:
                v108 = 119;
                goto LABEL_310;
              case 7833:
                v108 = 121;
LABEL_310:
                LOBYTE(v120) = v108;
                cmark_strbuf_put(v7, &v120, 1);
                v21 = -30004;
                break;
              case 7834:
                LOBYTE(v120) = 97;
                cmark_strbuf_put(v7, &v120, 1);
                v21 = -16694;
                break;
              case 7838:
                v80 = 115;
                goto LABEL_733;
              case 7840:
                v12 = -17695;
                goto LABEL_988;
              case 7842:
                v18 = -17695;
                goto LABEL_990;
              case 7844:
                v40 = -17695;
                goto LABEL_992;
              case 7846:
                v42 = -17695;
                goto LABEL_994;
              case 7848:
                v44 = -17695;
                goto LABEL_996;
              case 7850:
                v83 = -17695;
                goto LABEL_998;
              case 7852:
                v106 = -17695;
                goto LABEL_1000;
              case 7854:
                v107 = -17695;
                goto LABEL_930;
              case 7856:
                v46 = -17695;
                goto LABEL_860;
              case 7858:
                v48 = -17695;
                goto LABEL_897;
              case 7860:
                v50 = -17695;
                goto LABEL_968;
              case 7862:
                v52 = -17695;
                goto LABEL_970;
              case 7864:
                v54 = -17695;
                goto LABEL_936;
              case 7866:
                v56 = -17695;
                goto LABEL_902;
              case 7868:
                v58 = -17695;
                goto LABEL_904;
              case 7870:
                v61 = -17695;
                goto LABEL_938;
              case 7872:
                v20 = -17439;
                goto LABEL_1002;
              case 7874:
                v101 = -17439;
                goto LABEL_1004;
              case 7876:
                v102 = -17439;
                goto LABEL_1006;
              case 7878:
                v103 = -17439;
                goto LABEL_1008;
              case 7880:
                v104 = -17439;
                goto LABEL_1010;
              case 7882:
                v81 = -17439;
                goto LABEL_1012;
              case 7884:
                v105 = -17439;
                goto LABEL_1014;
              case 7886:
                v100 = -17439;
                goto LABEL_1016;
              case 7888:
                v23 = -17439;
                goto LABEL_1018;
              case 7890:
                v25 = -17439;
                goto LABEL_1020;
              case 7892:
                v27 = -17439;
                goto LABEL_1022;
              case 7894:
                v29 = -17439;
                goto LABEL_1024;
              case 7896:
                v31 = -17439;
                goto LABEL_1026;
              case 7898:
                v33 = -17439;
                goto LABEL_1028;
              case 7900:
                v35 = -17439;
                goto LABEL_984;
              case 7902:
                v37 = -17439;
                goto LABEL_986;
              case 7904:
                v12 = -17439;
                goto LABEL_988;
              case 7906:
                v18 = -17439;
                goto LABEL_990;
              case 7908:
                v40 = -17439;
                goto LABEL_992;
              case 7910:
                v42 = -17439;
                goto LABEL_994;
              case 7912:
                v44 = -17439;
                goto LABEL_996;
              case 7914:
                v83 = -17439;
                goto LABEL_998;
              case 7916:
                v106 = -17439;
                goto LABEL_1000;
              case 7918:
                v107 = -17439;
                goto LABEL_930;
              case 7920:
                v46 = -17439;
                goto LABEL_860;
              case 7922:
                v48 = -17439;
                goto LABEL_897;
              case 7924:
                v50 = -17439;
                goto LABEL_968;
              case 7926:
                v52 = -17439;
                goto LABEL_970;
              case 7928:
                v54 = -17439;
                goto LABEL_936;
              case 7930:
                v56 = -17439;
                goto LABEL_902;
              case 7932:
                v58 = -17439;
                goto LABEL_904;
              case 7934:
                v61 = -17439;
                goto LABEL_938;
              case 7944:
                v17 = -17183;
                goto LABEL_772;
              case 7945:
                v20 = -17183;
                goto LABEL_1002;
              case 7946:
                v109 = -17183;
                goto LABEL_775;
              case 7947:
                v101 = -17183;
                goto LABEL_1004;
              case 7948:
                v62 = -17183;
                goto LABEL_778;
              case 7949:
                v102 = -17183;
                goto LABEL_1006;
              case 7950:
                v92 = -17183;
                goto LABEL_781;
              case 7951:
                v103 = -17183;
                goto LABEL_1008;
              case 7960:
                v13 = -17183;
                goto LABEL_795;
              case 7961:
                v23 = -17183;
                goto LABEL_1018;
              case 7962:
                v24 = -17183;
                goto LABEL_798;
              case 7963:
                v25 = -17183;
                goto LABEL_1020;
              case 7964:
                v26 = -17183;
                goto LABEL_801;
              case 7965:
                v27 = -17183;
                goto LABEL_1022;
              case 7976:
                v11 = -17183;
                goto LABEL_616;
              case 7977:
                v12 = -17183;
                goto LABEL_988;
              case 7978:
                v38 = -17183;
                goto LABEL_619;
              case 7979:
                v18 = -17183;
                goto LABEL_990;
              case 7980:
                v39 = -17183;
                goto LABEL_622;
              case 7981:
                v40 = -17183;
                goto LABEL_992;
              case 7982:
                v41 = -17183;
                goto LABEL_461;
              case 7983:
                v42 = -17183;
                goto LABEL_994;
              case 7992:
                v16 = -17183;
                goto LABEL_419;
              case 7993:
                v46 = -17183;
                goto LABEL_860;
              case 7994:
                v47 = -17183;
                goto LABEL_755;
              case 7995:
                v48 = -17183;
                goto LABEL_897;
              case 7996:
                v49 = -17183;
                goto LABEL_758;
              case 7997:
                v50 = -17183;
                goto LABEL_968;
              case 7998:
                v51 = -17183;
                goto LABEL_832;
              case 7999:
                v52 = -17183;
                goto LABEL_970;
              case 8008:
                v17 = -16927;
                goto LABEL_772;
              case 8009:
                v20 = -16927;
                goto LABEL_1002;
              case 8010:
                v109 = -16927;
                goto LABEL_775;
              case 8011:
                v101 = -16927;
                goto LABEL_1004;
              case 8012:
                v62 = -16927;
                goto LABEL_778;
              case 8013:
                v102 = -16927;
                goto LABEL_1006;
              case 8016:
                LOWORD(v120) = -31281;
                cmark_strbuf_put(v7, &v120, 2);
                v21 = -27700;
                break;
              case 8018:
                LOWORD(v120) = -31281;
                cmark_strbuf_put(v7, &v120, 2);
                v110 = -27700;
                goto LABEL_440;
              case 8020:
                LOWORD(v120) = -31281;
                cmark_strbuf_put(v7, &v120, 2);
                v79 = -27700;
                goto LABEL_145;
              case 8022:
                LOWORD(v120) = -31281;
                cmark_strbuf_put(v7, &v120, 2);
                v111 = -27700;
                goto LABEL_453;
              case 8025:
                v23 = -16927;
                goto LABEL_1018;
              case 8027:
                v25 = -16927;
                goto LABEL_1020;
              case 8029:
                v27 = -16927;
                goto LABEL_1022;
              case 8031:
                v29 = -16927;
                goto LABEL_1024;
              case 8040:
                v11 = -16927;
                goto LABEL_616;
              case 8041:
                v12 = -16927;
                goto LABEL_988;
              case 8042:
                v38 = -16927;
                goto LABEL_619;
              case 8043:
                v18 = -16927;
                goto LABEL_990;
              case 8044:
                v39 = -16927;
                goto LABEL_622;
              case 8045:
                v40 = -16927;
                goto LABEL_992;
              case 8046:
                v41 = -16927;
                goto LABEL_461;
              case 8047:
                v42 = -16927;
                goto LABEL_994;
              case 8064:
              case 8072:
                LOWORD(v120) = -17183;
                v63 = 0x80;
                goto LABEL_135;
              case 8065:
              case 8073:
                LOWORD(v120) = -17183;
                v63 = -127;
                goto LABEL_135;
              case 8066:
              case 8074:
                LOWORD(v120) = -17183;
                v63 = -126;
                goto LABEL_135;
              case 8067:
              case 8075:
                LOWORD(v120) = -17183;
                v63 = -125;
                goto LABEL_135;
              case 8068:
              case 8076:
                LOWORD(v120) = -17183;
                v63 = -124;
                goto LABEL_135;
              case 8069:
              case 8077:
                LOWORD(v120) = -17183;
                v63 = -123;
                goto LABEL_135;
              case 8070:
              case 8078:
                LOWORD(v120) = -17183;
                v63 = -122;
                goto LABEL_135;
              case 8071:
              case 8079:
                LOWORD(v120) = -17183;
                v63 = -121;
                goto LABEL_135;
              case 8080:
              case 8088:
                v64 = -17183;
                goto LABEL_120;
              case 8081:
              case 8089:
                v65 = -17183;
                goto LABEL_122;
              case 8082:
              case 8090:
                v66 = -17183;
                goto LABEL_124;
              case 8083:
              case 8091:
                v67 = -17183;
                goto LABEL_126;
              case 8084:
              case 8092:
                v68 = -17183;
                goto LABEL_128;
              case 8085:
              case 8093:
                v69 = -17183;
                goto LABEL_130;
              case 8086:
              case 8094:
                v70 = -17183;
                goto LABEL_132;
              case 8087:
              case 8095:
                v71 = -17183;
                goto LABEL_134;
              case 8096:
              case 8104:
                v64 = -16927;
LABEL_120:
                LOWORD(v120) = v64;
                v63 = -96;
                goto LABEL_135;
              case 8097:
              case 8105:
                v65 = -16927;
LABEL_122:
                LOWORD(v120) = v65;
                v63 = -95;
                goto LABEL_135;
              case 8098:
              case 8106:
                v66 = -16927;
LABEL_124:
                LOWORD(v120) = v66;
                v63 = -94;
                goto LABEL_135;
              case 8099:
              case 8107:
                v67 = -16927;
LABEL_126:
                LOWORD(v120) = v67;
                v63 = -93;
                goto LABEL_135;
              case 8100:
              case 8108:
                v68 = -16927;
LABEL_128:
                LOWORD(v120) = v68;
                v63 = -92;
                goto LABEL_135;
              case 8101:
              case 8109:
                v69 = -16927;
LABEL_130:
                LOWORD(v120) = v69;
                v63 = -91;
                goto LABEL_135;
              case 8102:
              case 8110:
                v70 = -16927;
LABEL_132:
                LOWORD(v120) = v70;
                v63 = -90;
                goto LABEL_135;
              case 8103:
              case 8111:
                v71 = -16927;
LABEL_134:
                LOWORD(v120) = v71;
                v63 = -89;
                goto LABEL_135;
              case 8114:
                LOWORD(v120) = -16927;
                v63 = -80;
                goto LABEL_135;
              case 8115:
              case 8124:
                v76 = -20018;
                goto LABEL_426;
              case 8116:
                v76 = -21298;
                goto LABEL_426;
              case 8118:
                v111 = -20018;
                goto LABEL_453;
              case 8119:
                v112 = -20018;
                goto LABEL_425;
              case 8120:
                v16 = -16671;
                goto LABEL_419;
              case 8121:
                v46 = -16671;
                goto LABEL_860;
              case 8122:
                v16 = -16927;
                goto LABEL_419;
              case 8123:
                v46 = -16927;
                goto LABEL_860;
              case 8126:
                goto LABEL_137;
              case 8130:
                LOWORD(v120) = -16927;
                v63 = -76;
LABEL_135:
                BYTE2(v120) = v63;
                v72 = v7;
                v73 = 3;
                goto LABEL_136;
              case 8131:
              case 8140:
                v76 = -18482;
                goto LABEL_426;
              case 8132:
                v76 = -20786;
                goto LABEL_426;
              case 8134:
                v111 = -18482;
                goto LABEL_453;
              case 8135:
                v112 = -18482;
LABEL_425:
                LOWORD(v120) = v112;
                cmark_strbuf_put(v7, &v120, 2);
                v76 = -32051;
LABEL_426:
                LOWORD(v120) = v76;
                v72 = v7;
                v73 = 2;
LABEL_136:
                cmark_strbuf_put(v72, &v120, v73);
LABEL_137:
                v21 = -17970;
                break;
              case 8136:
                v47 = -16927;
                goto LABEL_755;
              case 8137:
                v48 = -16927;
                goto LABEL_897;
              case 8138:
                v49 = -16927;
                goto LABEL_758;
              case 8139:
                v50 = -16927;
                goto LABEL_968;
              case 8146:
                v113 = -17970;
                goto LABEL_439;
              case 8147:
                v78 = -17970;
                goto LABEL_144;
              case 8150:
                v111 = -17970;
                goto LABEL_453;
              case 8151:
                v114 = -17970;
                goto LABEL_444;
              case 8152:
                v13 = -16415;
                goto LABEL_795;
              case 8153:
                v23 = -16415;
                goto LABEL_1018;
              case 8154:
                v51 = -16927;
                goto LABEL_832;
              case 8155:
                v52 = -16927;
                goto LABEL_970;
              case 8162:
                v113 = -31281;
LABEL_439:
                LOWORD(v120) = v113;
                cmark_strbuf_put(v7, &v120, 2);
                v110 = -30516;
LABEL_440:
                LOWORD(v120) = v110;
                cmark_strbuf_put(v7, &v120, 2);
                v21 = -32564;
                break;
              case 8163:
                v78 = -31281;
LABEL_144:
                LOWORD(v120) = v78;
                cmark_strbuf_put(v7, &v120, 2);
                v79 = -30516;
LABEL_145:
                LOWORD(v120) = v79;
                cmark_strbuf_put(v7, &v120, 2);
                v21 = -32308;
                break;
              case 8164:
                LOWORD(v120) = -32305;
                cmark_strbuf_put(v7, &v120, 2);
                v21 = -27700;
                break;
              case 8166:
                v111 = -31281;
                goto LABEL_453;
              case 8167:
                v114 = -31281;
LABEL_444:
                LOWORD(v120) = v114;
                cmark_strbuf_put(v7, &v120, 2);
                v111 = -30516;
                goto LABEL_453;
              case 8168:
                v11 = -16415;
                goto LABEL_616;
              case 8169:
                v12 = -16415;
                goto LABEL_988;
              case 8170:
                v55 = -16927;
                goto LABEL_932;
              case 8171:
                v56 = -16927;
                goto LABEL_902;
              case 8172:
                v40 = -16415;
                goto LABEL_992;
              case 8178:
                LOWORD(v120) = -16927;
                BYTE2(v120) = -68;
                v115 = v7;
                v116 = 3;
                goto LABEL_456;
              case 8179:
              case 8188:
                v77 = -30257;
                goto LABEL_455;
              case 8180:
                v77 = -28977;
                goto LABEL_455;
              case 8182:
                v111 = -30257;
LABEL_453:
                LOWORD(v120) = v111;
                cmark_strbuf_put(v7, &v120, 2);
                v21 = -32051;
                break;
              case 8183:
                LOWORD(v120) = -30257;
                cmark_strbuf_put(v7, &v120, 2);
                v77 = -32051;
LABEL_455:
                LOWORD(v120) = v77;
                v115 = v7;
                v116 = 2;
LABEL_456:
                cmark_strbuf_put(v115, &v120, v116);
                v21 = -17970;
                break;
              case 8184:
                v53 = -16927;
                goto LABEL_763;
              case 8185:
                v54 = -16927;
                goto LABEL_936;
              case 8186:
                v57 = -16927;
                goto LABEL_934;
              case 8187:
                v58 = -16927;
                goto LABEL_904;
              default:
                goto LABEL_148;
            }
LABEL_138:
            LOWORD(v120) = v21;
            v74 = v7;
            v75 = 2;
LABEL_1030:
            result = cmark_strbuf_put(v74, &v120, v75);
            goto LABEL_1031;
          }
          v10 = (v119 - 837);
          if (v10 <= 0x242)
            __asm { BR              X9 }
          v14 = (v119 - 65);
          if (v14 <= 0x20D)
            __asm { BR              X9 }
        }
LABEL_148:
        result = cmark_utf8proc_encode_char(v119, v7);
      }
LABEL_1031:
      a2 += v9;
      v118 = __OFSUB__(v5, v9);
      v5 -= v9;
    }
    while (!((v5 < 0) ^ v118 | (v5 == 0)));
  }
  return result;
}

uint64_t cmark_utf8proc_is_space(unsigned int a1)
{
  uint64_t result;
  _BOOL4 v3;
  int v4;
  int v5;
  unsigned int v6;

  result = 1;
  if (a1 > 0x20 || ((1 << a1) & 0x100003600) == 0)
  {
    v3 = a1 == 8287 || a1 == 12288;
    v4 = a1 == 8239 || v3;
    if (a1 - 0x2000 >= 0xB)
      v5 = v4;
    else
      v5 = 1;
    if (a1 == 5760)
      v6 = 1;
    else
      v6 = v5;
    if (a1 == 160)
      return 1;
    else
      return v6;
  }
  return result;
}

BOOL cmark_utf8proc_is_punctuation(int a1)
{
  _BOOL8 result;
  unsigned int v3;
  int32x4_t v4;
  unsigned int v5;
  int v6;
  unsigned __int16 v7;

  if (a1 > 127)
  {
    result = 1;
    if (a1 <= 1416)
    {
      if (a1 > 902)
      {
        if ((a1 - 1370) < 6 || a1 == 903)
          return result;
      }
      else if ((a1 - 161) <= 0x1E && ((1 << (a1 + 95)) & 0x44600441) != 0 || a1 == 894)
      {
        return result;
      }
    }
    else if (a1 <= 1522)
    {
      if ((a1 - 1417) <= 0x3D && ((1 << (a1 + 119)) & 0x24A0000000000003) != 0)
        return result;
    }
    else if ((a1 - 1523) <= 0x2C && ((1 << (a1 + 13)) & 0x190006C00003) != 0
           || (a1 - 1642) < 4
           || a1 == 1748)
    {
      return result;
    }
  }
  else if (cmark_ispunct(a1))
  {
    return 1;
  }
  result = 1;
  if ((a1 - 2096) < 0xF || (a1 - 1792) < 0xE || (a1 - 2039) < 3)
    return result;
  if (a1 <= 2799)
  {
    if ((a1 - 2404) <= 0xC && ((1 << (a1 - 100)) & 0x1003) != 0 || a1 == 2142)
      return result;
  }
  else if ((a1 - 3663) <= 0xC && ((1 << (a1 - 79)) & 0x1801) != 0 || a1 == 2800 || a1 == 3572)
  {
    return result;
  }
  if (a1 == 3860 || (a1 - 3844) < 0xF)
    return result;
  if (a1 > 4169)
  {
    if ((a1 - 4170) < 6 || a1 == 4347)
      return result;
  }
  else if ((a1 - 4048) <= 0xA && ((1 << (a1 + 48)) & 0x61F) != 0
         || (a1 - 3898) < 4
         || a1 == 3973)
  {
    return result;
  }
  if ((a1 - 4960) < 9)
    return result;
  if (a1 > 5940)
  {
    if ((a1 - 6100) <= 6 && a1 != 6103 || (a1 - 5941) < 2)
      return result;
  }
  else if ((a1 - 5741) <= 0x2F && ((1 << (a1 - 109)) & 0xC00000000003) != 0
         || (a1 - 5867) < 3
         || a1 == 5120)
  {
    return result;
  }
  if ((a1 - 6144) >= 0xB && (a1 - 6468) >= 2 && (a1 - 6686) >= 2)
  {
    v3 = a1 & 0xFFFFFFFC;
    if ((a1 & 0xFFFFFFFC) != 0x1BFC)
    {
      if (a1 <= 7001)
      {
        if ((a1 - 6816) <= 0xD && a1 != 6823)
          return result;
      }
      else if ((a1 - 7002) < 7 || (a1 - 7227) < 5 || (a1 - 7294) < 2)
      {
        return result;
      }
      v4 = vdupq_n_s32(a1);
      if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vcgtq_u32((uint32x4_t)xmmword_21132DC40, (uint32x4_t)vaddq_s32(v4, (int32x4_t)xmmword_21132DC30)))) & 1) == 0&& (a1 & 0xFFFFFFF8) != 0x1CC0&& a1 != 7379&& ((a1 - 8317) > 0x11 || ((1 << (a1 - 125)) & 0x30003) == 0)&& v3 != 8968&& (a1 - 9001) >= 2&& (vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vcgtq_u32((uint32x4_t)xmmword_21132DC60, (uint32x4_t)vaddq_s32(v4, (int32x4_t)xmmword_21132DC50)))) & 1) == 0&& v3 != 10712)
      {
        v5 = a1 & 0xFFFFFFFE;
        if ((a1 & 0xFFFFFFFE) != 0x29FC
          && ((a1 - 11513) > 6 || a1 == 11517)
          && a1 != 11632
          && (vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vcgtq_u32((uint32x4_t)xmmword_21132DC80, (uint32x4_t)vaddq_s32(v4, (int32x4_t)xmmword_21132DC70)))) & 1) == 0&& (a1 - 12308) >= 0xC)
        {
          if (a1 > 42508)
          {
            if ((a1 - 42509) < 3 || a1 == 42611)
              return result;
            v6 = 42622;
          }
          else if (a1 > 12538)
          {
            if ((a1 - 42238) < 2)
              return result;
            v6 = 12539;
          }
          else
          {
            if (a1 == 12336 || a1 == 12349)
              return result;
            v6 = 12448;
          }
          if (a1 != v6
            && (a1 - 42738) >= 6
            && v3 != 43124
            && v5 != 43214
            && (a1 - 43256) >= 3
            && ((a1 - 43310) > 0x31 || ((1 << (a1 - 46)) & 0x2000000000003) == 0)
            && (a1 - 43457) >= 0xD
            && v5 != 43486
            && (a1 - 65108) >= 0xE
            && (a1 - 65072) >= 0x23
            && (a1 - 65040) >= 0xA
            && v5 != 64830
            && a1 != 44011
            && v5 != 43760
            && v3 != 43612
            && v5 != 43742
            && ((a1 - 65281) > 9 || a1 == 65284)
            && ((a1 - 65123) > 8 || ((1 << (a1 - 99)) & 0x1A1) == 0)
            && v3 != 65292
            && ((a1 - 65311) > 0x3E || ((1 << (a1 - 31)) & 0x5000000170000003) == 0)
            && (a1 - 65306) >= 2
            && (a1 - 65375) >= 7)
          {
            if (a1 <= 66511)
            {
              if ((a1 - 65792) < 3)
                return result;
              v7 = 927;
            }
            else if (a1 <= 67670)
            {
              if (a1 == 66512)
                return result;
              v7 = 1391;
            }
            else
            {
              if (a1 == 67671 || a1 == 67871)
                return result;
              v7 = 2367;
            }
            if (a1 != (v7 | 0x10000) && (a1 - 68176) >= 9)
            {
              if (a1 > 68504)
              {
                if ((a1 - 69703) < 7 || (a1 - 68505) < 4 || (a1 - 69819) < 2)
                  return result;
              }
              else if ((a1 - 68336) < 7 || (a1 - 68409) < 7 || a1 == 68223)
              {
                return result;
              }
              if ((a1 - 69822) >= 4
                && v3 != 69952
                && v5 != 70004
                && (a1 - 70200) >= 6
                && ((a1 - 70085) > 8 || ((1 << (a1 + 59)) & 0x10F) == 0)
                && a1 != 70854
                && (a1 - 71105) >= 9
                && (a1 - 71233) >= 3)
              {
                if (a1 > 92916)
                {
                  if (((a1 - 92983) > 0xD || ((1 << (a1 - 55)) & 0x201F) == 0) && a1 != 92917)
                    return a1 == 113823;
                }
                else if ((a1 - 74864) >= 5 && (a1 - 92782) >= 2)
                {
                  return a1 == 113823;
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t cmark_render_commonmark(uint64_t *a1, uint64_t a2, int a3)
{
  uint64_t v5;

  v5 = *a1;
  if ((a2 & 4) != 0)
    a3 = 0;
  return cmark_render(v5, (uint64_t)a1, a2, a3, (uint64_t)outc, (unsigned int (*)(uint64_t *, uint64_t, uint64_t, uint64_t))S_render_node);
}

uint64_t cmark_render_commonmark_with_mem(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  if ((a2 & 4) != 0)
    a3 = 0;
  return cmark_render(a4, a1, a2, a3, (uint64_t)outc, (unsigned int (*)(uint64_t *, uint64_t, uint64_t, uint64_t))S_render_node);
}

_DWORD *outc(uint64_t a1, uint64_t a2, int a3, int a4, int a5)
{
  uint64_t v9;
  int v10;
  BOOL v11;
  int v12;
  _BOOL4 v13;
  _DWORD *result;
  int v15;
  char __str[20];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v9 = *(_QWORD *)(a1 + 8);
  v10 = *(_DWORD *)(v9 + 20);
  v11 = __OFSUB__(v10, 1);
  v12 = v10 - 1;
  if (v12 < 0 != v11)
  {
    v13 = 0;
    if (!a3)
      return cmark_render_code_point(a1, a4);
  }
  else
  {
    v13 = cmark_isdigit(*(_BYTE *)(*(_QWORD *)(v9 + 8) + v12));
    if (!a3)
      return cmark_render_code_point(a1, a4);
  }
  if (a4 > 127)
    return cmark_render_code_point(a1, a4);
  if (a3 != 3)
  {
    if (a3 == 2)
    {
      if ((a4 - 34) > 0x3E || ((1 << (a4 - 34)) & 0x4400000014000001) == 0)
        return cmark_render_code_point(a1, a4);
      goto LABEL_21;
    }
    if (a3 == 1)
    {
      if (a4 >= 32 && ((a4 - 60) > 0x24 || ((1 << (a4 - 60)) & 0x1B80000005) == 0))
      {
        switch(a4)
        {
          case '!':
          case '#':
          case '*':
            goto LABEL_21;
          case '"':
          case '$':
          case '%':
          case '\'':
          case '(':
          case ')':
            goto LABEL_31;
          case '&':
            if (cmark_isalpha(a5))
              goto LABEL_21;
            goto LABEL_33;
          default:
            if (a4 == 126)
              goto LABEL_21;
LABEL_31:
            if (a4 == 94 && a5 == 91)
              goto LABEL_21;
LABEL_33:
            if (*(_BYTE *)(a1 + 41))
            {
              switch(a4)
              {
                case ')':
                case '.':
                  if (!v13)
                    return cmark_render_code_point(a1, a4);
                  goto LABEL_40;
                case '*':
                case ',':
                  return cmark_render_code_point(a1, a4);
                case '+':
                case '-':
                  goto LABEL_38;
                default:
                  if (a4 != 61)
                    return cmark_render_code_point(a1, a4);
LABEL_38:
                  if (!v13)
                    goto LABEL_21;
                  if (a4 != 46)
                    return cmark_render_code_point(a1, a4);
LABEL_40:
                  if (a5 && !cmark_isspace(a5))
                    return cmark_render_code_point(a1, a4);
                  goto LABEL_21;
              }
            }
            break;
        }
        return cmark_render_code_point(a1, a4);
      }
      goto LABEL_21;
    }
    return cmark_render_code_point(a1, a4);
  }
  if (((a4 - 60) > 0x24 || ((1 << (a4 - 60)) & 0x1000000005) == 0)
    && !cmark_isspace(a4)
    && ((a4 - 40) > 0x34 || ((1 << (a4 - 40)) & 0x10000000000003) == 0))
  {
    return cmark_render_code_point(a1, a4);
  }
  if (cmark_isspace(a4))
  {
    snprintf(__str, 0x14uLL, "%%%2X", a4);
    result = cmark_strbuf_puts(*(_DWORD **)(a1 + 8), __str);
    v15 = *(_DWORD *)(a1 + 24) + 3;
    goto LABEL_25;
  }
LABEL_21:
  if (cmark_ispunct(a4))
  {
    cmark_render_ascii(a1, "\\");
    return cmark_render_code_point(a1, a4);
  }
  snprintf(__str, 0x14uLL, "&#%d;", a4);
  cmark_strbuf_puts(*(_DWORD **)(a1 + 8), __str);
  result = (_DWORD *)strlen(__str);
  v15 = *(_DWORD *)(a1 + 24) + (_DWORD)result;
LABEL_25:
  *(_DWORD *)(a1 + 24) = v15;
  return result;
}

uint64_t S_render_node(uint64_t a1, uint64_t a2, int a3, char a4)
{
  int v7;
  _BOOL4 v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(void);
  void (*v13)(uint64_t, uint64_t, _BYTE *, _BOOL8, uint64_t);
  _BYTE *literal;
  uint64_t v15;
  const char *v16;
  size_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  int v21;
  int v22;
  int v23;
  unint64_t v24;
  void (*v25)(uint64_t, uint64_t, _BYTE *, _QWORD, _QWORD);
  _BYTE *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t, const char *, _QWORD, _QWORD);
  const char *v31;
  void *v32;
  uint64_t v33;
  int v34;
  int v35;
  char v36;
  char *fence_info;
  int v38;
  char v39;
  const char *v40;
  size_t v41;
  size_t v42;
  size_t v43;
  signed int v44;
  unsigned int v45;
  uint64_t v46;
  int v47;
  int v48;
  unsigned int v49;
  unsigned int v50;
  unsigned int v51;
  void (*v52)(uint64_t, uint64_t, _BYTE *, _QWORD, _QWORD);
  _BYTE *v53;
  unsigned int v54;
  void (*v55)(uint64_t, uint64_t, _BYTE *, _QWORD, _QWORD);
  _BYTE *v56;
  int heading_level;
  unsigned int v58;
  void *v59;
  uint64_t v60;
  int v61;
  unsigned int v62;
  unint64_t v63;
  int v64;
  _BOOL4 v65;
  void (*v66)(uint64_t, uint64_t, _BYTE *, _QWORD, uint64_t);
  _BYTE *v67;
  _BYTE *v68;
  _BYTE *v69;
  void (*v70)(uint64_t, uint64_t, _BYTE *, _QWORD, _QWORD);
  _BYTE *attributes;
  int item_index;
  int list_delim;
  const char *v74;
  const char *v75;
  char *v76;
  void (*v77)(uint64_t, uint64_t, _BYTE *, _QWORD, uint64_t);
  _BYTE *url;
  _BYTE *title;
  _BYTE *v80;
  uint64_t v82;
  int v84;
  void (*v85)(uint64_t, uint64_t, _BYTE *, _BOOL8, _QWORD);
  _BYTE *v86;
  const char *v87;
  char v88;
  uint64_t v89;
  const char *v90;
  int v91;
  int v92;
  int v93;
  uint64_t v94;
  const char *v95;
  int v96;
  void (*v97)(uint64_t, uint64_t, _BYTE *, _QWORD, _QWORD);
  _BYTE *v98;
  _BYTE *v99;
  void (*v100)(uint64_t, uint64_t, _BYTE *, _QWORD, _QWORD);
  _BYTE *v101;
  __int16 v102;
  char __str[20];
  uint64_t v104;

  v104 = *MEMORY[0x24BDAC8D0];
  v102 = 0;
  v7 = *(_DWORD *)(a1 + 28);
  v8 = (a4 & 4) == 0;
  if (v7 < 1)
    v8 = 0;
  v9 = (a4 & 0x10) == 0 && v8;
  if (a3 == 2)
  {
    v10 = *(_QWORD *)(a2 + 40);
    if (v10 && *(unsigned __int16 *)(v10 + 100) == 32772)
    {
      LOBYTE(v10) = *(_BYTE *)(*(_QWORD *)(v10 + 40) + 165);
LABEL_15:
      *(_BYTE *)(a1 + 43) = v10;
    }
  }
  else if (*(unsigned __int16 *)(a2 + 100) == 32771)
  {
    v10 = *(_QWORD *)(a2 + 40);
    if (v10)
      LOBYTE(v10) = *(unsigned __int16 *)(v10 + 100) == 32772 && *(_BYTE *)(*(_QWORD *)(v10 + 40) + 165) != 0;
    goto LABEL_15;
  }
  v11 = *(_QWORD *)(a2 + 112);
  if (!v11 || (v12 = *(void (**)(void))(v11 + 96)) == 0)
  {
    switch(*(_WORD *)(a2 + 100))
    {
      case 0xC001:
        v13 = *(void (**)(uint64_t, uint64_t, _BYTE *, _BOOL8, uint64_t))(a1 + 72);
        literal = cmark_node_get_literal(a2);
        v15 = 1;
        v13(a1, a2, literal, v9, 1);
        return v15;
      case 0xC002:
        if ((a4 & 4) != 0)
          goto LABEL_29;
        if (!(v7 | a4 & 0x10) && !*(_BYTE *)(a1 + 42))
          goto LABEL_140;
        (*(void (**)(uint64_t, uint64_t, const char *, _BOOL8, _QWORD))(a1 + 72))(a1, a2, " ", v9, 0);
        return 1;
      case 0xC003:
        if ((a4 & 4) == 0)
LABEL_29:
          (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72))(a1, a2, "  ", 0, 0);
LABEL_140:
        (*(void (**)(uint64_t))(a1 + 56))(a1);
        return 1;
      case 0xC004:
        v16 = cmark_node_get_literal(a2);
        v17 = strlen(v16);
        v18 = 0;
        v19 = 0;
        if (v17 + 1 > 1)
          v20 = v17 + 1;
        else
          v20 = 1;
        v21 = 1;
        do
        {
          if ((v19 - 1) >= 0x1F)
            v22 = 0;
          else
            v22 = 1 << v19;
          v23 = v22 | v21;
          if (v16[v18] == 96)
          {
            ++v19;
          }
          else
          {
            v21 = v23;
            v19 = 0;
          }
          ++v18;
        }
        while (v20 != v18);
        if ((v21 & 1) != 0)
        {
          v24 = 0;
          do
          {
            v62 = v21;
            v63 = v24++;
            if (v63 > 0x1E)
              break;
            v21 = v62 >> 1;
          }
          while ((v62 & 2) != 0);
        }
        else
        {
          LODWORD(v24) = 0;
        }
        v65 = !v17 || (v64 = *(unsigned __int8 *)v16, v64 == 96) || v64 == 32 || (v16[v17 - 1] & 0xBF) == 32;
        if ((_DWORD)v24)
        {
          v84 = v24;
          do
          {
            --v84;
          }
          while (v84);
        }
        if (v65)
          (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72))(a1, a2, " ", 0, 0);
        v85 = *(void (**)(uint64_t, uint64_t, _BYTE *, _BOOL8, _QWORD))(a1 + 72);
        v86 = cmark_node_get_literal(a2);
        v85(a1, a2, v86, v9, 0);
        if (v65)
          (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72))(a1, a2, " ", 0, 0);
        if (!(_DWORD)v24)
          return 1;
        do
        {
          v15 = 1;
          LODWORD(v24) = v24 - 1;
        }
        while ((_DWORD)v24);
        return v15;
      case 0xC005:
        v25 = *(void (**)(uint64_t, uint64_t, _BYTE *, _QWORD, _QWORD))(a1 + 72);
        v26 = cmark_node_get_literal(a2);
        goto LABEL_122;
      case 0xC006:
        v25 = *(void (**)(uint64_t, uint64_t, _BYTE *, _QWORD, _QWORD))(a1 + 72);
        if (a3 == 2)
          v26 = cmark_node_get_on_enter(a2);
        else
          v26 = cmark_node_get_on_exit(a2);
LABEL_122:
        v25(a1, a2, v26, 0, 0);
        return 1;
      case 0xC007:
        v27 = *(_QWORD *)(a2 + 40);
        if (v27 && *(unsigned __int16 *)(v27 + 100) == 49159 && !*(_QWORD *)(a2 + 24) && !*(_QWORD *)(a2 + 32))
          v28 = "_";
        else
          v28 = "*";
        (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72))(a1, a2, v28, 0, 0);
        return 1;
      case 0xC008:
        v29 = *(_QWORD *)(a2 + 40);
        if (!v29 || *(unsigned __int16 *)(v29 + 100) != 49160)
          (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72))(a1, a2, "**", 0, 0);
        return 1;
      case 0xC009:
        if (!*(_DWORD *)(a2 + 152))
          goto LABEL_58;
        if (!_scan_at((uint64_t (*)(uint64_t))_scan_scheme, (uint64_t *)(a2 + 144), 0))
          goto LABEL_58;
        if (*(int *)(a2 + 168) > 0)
          goto LABEL_58;
        v89 = *(_QWORD *)(a2 + 48);
        if (!v89)
          goto LABEL_58;
        cmark_consolidate_text_nodes(*(_QWORD **)(a2 + 48));
        v90 = *(const char **)(a2 + 144);
        v91 = *(_DWORD *)(a2 + 152);
        v92 = strncmp(v90, "mailto:", 7uLL);
        v93 = v91 - 7;
        if (v92)
          v93 = v91;
        if (v93 != *(_DWORD *)(v89 + 152))
          goto LABEL_58;
        v94 = 7;
        if (v92)
          v94 = 0;
        if (strncmp(&v90[v94], *(const char **)(v89 + 144), v93))
        {
LABEL_58:
          v30 = *(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72);
          if (a3 == 2)
          {
            v31 = "[";
            goto LABEL_145;
          }
          v30(a1, a2, "](", 0, 0);
          v77 = *(void (**)(uint64_t, uint64_t, _BYTE *, _QWORD, uint64_t))(a1 + 72);
          url = cmark_node_get_url(a2);
          v77(a1, a2, url, 0, 3);
          title = cmark_node_get_title(a2);
          if (*title)
          {
            v80 = title;
            (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72))(a1, a2, " \"", 0, 0);
            (*(void (**)(uint64_t, uint64_t, _BYTE *, _QWORD, uint64_t))(a1 + 72))(a1, a2, v80, 0, 2);
            goto LABEL_143;
          }
          goto LABEL_144;
        }
        if (a3 != 2)
          return 1;
        (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72))(a1, a2, "<", 0, 0);
        v95 = cmark_node_get_url(a2);
        v96 = strncmp(v95, "mailto:", 7uLL);
        v97 = *(void (**)(uint64_t, uint64_t, _BYTE *, _QWORD, _QWORD))(a1 + 72);
        v98 = cmark_node_get_url(a2);
        v99 = v98;
        if (!v96)
          v99 = v98 + 7;
        v97(a1, a2, v99, 0, 0);
        (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72))(a1, a2, ">", 0, 0);
        return 0;
      case 0xC00A:
        v30 = *(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72);
        if (a3 == 2)
        {
          v31 = "![";
          goto LABEL_145;
        }
        v30(a1, a2, "](", 0, 0);
        v66 = *(void (**)(uint64_t, uint64_t, _BYTE *, _QWORD, uint64_t))(a1 + 72);
        v67 = cmark_node_get_url(a2);
        v66(a1, a2, v67, 0, 3);
        v68 = cmark_node_get_title(a2);
        if (*v68)
        {
          v69 = v68;
          (*(void (**)(uint64_t, uint64_t, const char *, _BOOL8, _QWORD))(a1 + 72))(a1, a2, " \"", v9, 0);
          (*(void (**)(uint64_t, uint64_t, _BYTE *, _QWORD, uint64_t))(a1 + 72))(a1, a2, v69, 0, 2);
LABEL_143:
          (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72))(a1, a2, "\"", 0, 0);
        }
        goto LABEL_144;
      case 0xC00B:
        if (a3 != 2)
          return 1;
        (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72))(a1, a2, "[^", 0, 0);
        v15 = 1;
        v32 = (void *)(**(uint64_t (***)(uint64_t, uint64_t))a1)(*(int *)(*(_QWORD *)(a2 + 136) + 152) + 1, 1);
        memmove(v32, *(const void **)(*(_QWORD *)(a2 + 136) + 144), *(int *)(*(_QWORD *)(a2 + 136) + 152));
        (*(void (**)(uint64_t, uint64_t, void *, _QWORD, _QWORD))(a1 + 72))(a1, a2, v32, 0, 0);
        (*(void (**)(void *))(*(_QWORD *)a1 + 16))(v32);
        (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72))(a1, a2, "]", 0, 0);
        return v15;
      case 0xC00C:
        v30 = *(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72);
        if (a3 == 2)
        {
          v31 = "^[";
        }
        else
        {
          v30(a1, a2, "](", 0, 0);
          v70 = *(void (**)(uint64_t, uint64_t, _BYTE *, _QWORD, _QWORD))(a1 + 72);
          attributes = cmark_node_get_attributes(a2);
          v70(a1, a2, attributes, 0, 0);
LABEL_144:
          v30 = *(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72);
          v31 = ")";
        }
LABEL_145:
        v30(a1, a2, v31, 0, 0);
        return 1;
      default:
        v15 = 1;
        switch(*(_WORD *)(a2 + 100))
        {
          case 0x8001:
            return v15;
          case 0x8002:
            if (a3 == 2)
            {
              (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72))(a1, a2, "> ", 0, 0);
              v15 = 1;
              *(_BYTE *)(a1 + 41) = 1;
              cmark_strbuf_puts(*(_DWORD **)(a1 + 16), "> ");
              return v15;
            }
            v60 = *(_QWORD *)(a1 + 16);
            v61 = *(_DWORD *)(v60 + 20) - 2;
            goto LABEL_114;
          case 0x8003:
            if (a3 == 2)
              return 1;
            v33 = *(_QWORD *)(a2 + 24);
            if (!v33)
              return 1;
            v34 = *(unsigned __int16 *)(v33 + 100);
            if (v34 != 32773 && v34 != 32771)
              return 1;
            (*(void (**)(uint64_t))(a1 + 56))(a1);
            (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72))(a1, a2, "<!-- end list -->", 0, 0);
            goto LABEL_137;
          case 0x8004:
            if (cmark_node_get_list_type(*(_QWORD *)(a2 + 40)) == 1)
            {
              v35 = 4;
            }
            else
            {
              item_index = cmark_node_get_item_index(a2);
              list_delim = cmark_node_get_list_delim(*(_QWORD *)(a2 + 40));
              v74 = ".";
              if (list_delim == 2)
                v74 = ")";
              v75 = " ";
              if (item_index < 10)
                v75 = "  ";
              snprintf(__str, 0x14uLL, "%d%s%s", item_index, v74, v75);
              v35 = strlen(__str);
            }
            if (a3 != 2)
            {
              cmark_strbuf_truncate(*(_QWORD *)(a1 + 16), *(_DWORD *)(*(_QWORD *)(a1 + 16) + 20) - v35);
              goto LABEL_140;
            }
            if (cmark_node_get_list_type(*(_QWORD *)(a2 + 40)) == 1)
              v76 = "  - ";
            else
              v76 = __str;
            (*(void (**)(uint64_t, uint64_t, char *, _QWORD, _QWORD))(a1 + 72))(a1, a2, v76, 0, 0);
            v15 = 1;
            for (*(_BYTE *)(a1 + 41) = 1; v35; v15 = 1)
            {
              --v35;
              cmark_strbuf_putc(*(_QWORD *)(a1 + 16), 32);
            }
            return v15;
          case 0x8005:
            if (!*(_QWORD *)(a2 + 32) && (v82 = *(_QWORD *)(a2 + 40)) != 0 && *(unsigned __int16 *)(v82 + 100) == 32772)
            {
              v36 = 1;
            }
            else
            {
              (*(void (**)(uint64_t))(a1 + 64))(a1);
              v36 = 0;
            }
            fence_info = cmark_node_get_fence_info(a2);
            v38 = *fence_info;
            if (strchr(fence_info, 96))
              v39 = 126;
            else
              v39 = 96;
            LOBYTE(v102) = v39;
            v40 = cmark_node_get_literal(a2);
            v41 = strlen(v40);
            if (v38)
              goto LABEL_81;
            v42 = v41;
            if (v41 < 3 || cmark_isspace(*v40))
              goto LABEL_81;
            v87 = &v40[v42];
            if (cmark_isspace(*(v87 - 1)))
            {
              if (cmark_isspace(*(v87 - 2)))
                v88 = 1;
              else
                v88 = v36;
              if ((v88 & 1) == 0)
                goto LABEL_189;
            }
            else if ((v36 & 1) == 0)
            {
LABEL_189:
              (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72))(a1, a2, "    ", 0, 0);
              cmark_strbuf_puts(*(_DWORD **)(a1 + 16), "    ");
              v100 = *(void (**)(uint64_t, uint64_t, _BYTE *, _QWORD, _QWORD))(a1 + 72);
              v101 = cmark_node_get_literal(a2);
              v100(a1, a2, v101, 0, 0);
              v60 = *(_QWORD *)(a1 + 16);
              v61 = *(_DWORD *)(v60 + 20) - 4;
LABEL_114:
              cmark_strbuf_truncate(v60, v61);
LABEL_137:
              (*(void (**)(uint64_t))(a1 + 64))(a1);
              return 1;
            }
LABEL_81:
            v43 = strlen(v40);
            v44 = 0;
            v45 = 0;
            v46 = 1;
            if (v43 + 1 > 1)
              v46 = v43 + 1;
            do
            {
              v48 = *(unsigned __int8 *)v40++;
              v47 = v48;
              if (v44 <= (int)v45)
                v49 = v45;
              else
                v49 = v44;
              if (v47 == 96)
              {
                ++v44;
              }
              else
              {
                v45 = v49;
                v44 = 0;
              }
              --v46;
            }
            while (v46);
            if (v45 <= 2)
              v50 = 2;
            else
              v50 = v45;
            if (v50 <= 0x7FFFFFFE)
            {
              v51 = v50 + 1;
              do
              {
                (*(void (**)(uint64_t, uint64_t, __int16 *, _QWORD, _QWORD))(a1 + 72))(a1, a2, &v102, 0, 0);
                --v51;
              }
              while (v51);
            }
            (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72))(a1, a2, " ", 0, 0);
            (*(void (**)(uint64_t, uint64_t, char *, _QWORD, _QWORD))(a1 + 72))(a1, a2, fence_info, 0, 0);
            (*(void (**)(uint64_t))(a1 + 56))(a1);
            v52 = *(void (**)(uint64_t, uint64_t, _BYTE *, _QWORD, _QWORD))(a1 + 72);
            v53 = cmark_node_get_literal(a2);
            v52(a1, a2, v53, 0, 0);
            (*(void (**)(uint64_t))(a1 + 56))(a1);
            if (v50 <= 0x7FFFFFFE)
            {
              v54 = v50 + 1;
              do
              {
                (*(void (**)(uint64_t, uint64_t, __int16 *, _QWORD, _QWORD))(a1 + 72))(a1, a2, &v102, 0, 0);
                --v54;
              }
              while (v54);
            }
            goto LABEL_137;
          case 0x8006:
            (*(void (**)(uint64_t))(a1 + 64))(a1);
            v55 = *(void (**)(uint64_t, uint64_t, _BYTE *, _QWORD, _QWORD))(a1 + 72);
            v56 = cmark_node_get_literal(a2);
            goto LABEL_135;
          case 0x8007:
            (*(void (**)(uint64_t))(a1 + 64))(a1);
            v55 = *(void (**)(uint64_t, uint64_t, _BYTE *, _QWORD, _QWORD))(a1 + 72);
            if (a3 == 2)
              v56 = cmark_node_get_on_enter(a2);
            else
              v56 = cmark_node_get_on_exit(a2);
LABEL_135:
            v55(a1, a2, v56, 0, 0);
            goto LABEL_137;
          case 0x8008:
            if (a3 == 2)
              return 1;
            goto LABEL_137;
          case 0x8009:
            if (a3 != 2)
            {
              *(_BYTE *)(a1 + 42) = 0;
              goto LABEL_137;
            }
            heading_level = cmark_node_get_heading_level(a2);
            if (heading_level >= 1)
            {
              v58 = heading_level + 1;
              do
              {
                (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72))(a1, a2, "#", 0, 0);
                --v58;
              }
              while (v58 > 1);
            }
            (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72))(a1, a2, " ", 0, 0);
            *(_WORD *)(a1 + 41) = 257;
            return 1;
          case 0x800A:
            (*(void (**)(uint64_t))(a1 + 64))(a1);
            (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72))(a1, a2, "-----", 0, 0);
            goto LABEL_137;
          case 0x800B:
            if (a3 == 2)
            {
              ++*(_DWORD *)(a1 + 80);
              (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72))(a1, a2, "[^", 0, 0);
              v15 = 1;
              v59 = (void *)(**(uint64_t (***)(uint64_t, uint64_t))a1)(*(int *)(a2 + 152) + 1, 1);
              memmove(v59, *(const void **)(a2 + 144), *(int *)(a2 + 152));
              (*(void (**)(uint64_t, uint64_t, void *, _QWORD, _QWORD))(a1 + 72))(a1, a2, v59, 0, 0);
              (*(void (**)(void *))(*(_QWORD *)a1 + 16))(v59);
              (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72))(a1, a2, "]:\n", 0, 0);
              cmark_strbuf_puts(*(_DWORD **)(a1 + 16), "    ");
              return v15;
            }
            cmark_strbuf_truncate(*(_QWORD *)(a1 + 16), *(_DWORD *)(*(_QWORD *)(a1 + 16) + 20) - 4);
            return 1;
          default:
            S_render_node_cold_1();
        }
    }
  }
  v12();
  return 1;
}

uint64_t houdini_escape_html0(_DWORD *a1, uint64_t a2, int a3, int a4)
{
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  int v14;

  if (a3 >= 1)
  {
    v8 = 0;
    v9 = a3;
    do
    {
      v10 = v8;
      while (1)
      {
        v11 = *(unsigned __int8 *)(a2 + v10);
        v12 = HTML_ESCAPE_TABLE[v11];
        if (HTML_ESCAPE_TABLE[v11])
          break;
        if (++v10 >= v9)
        {
          v13 = 0;
          goto LABEL_8;
        }
      }
      v13 = HTML_ESCAPE_TABLE[v11];
LABEL_8:
      if (v8 < (int)v10)
        cmark_strbuf_put(a1, (const void *)(a2 + v8), v10 - v8);
      if (!v12)
        return 1;
      v14 = *(unsigned __int8 *)(a2 + (int)v10);
      if (v14 == 47)
      {
        if (a4)
          goto LABEL_17;
      }
      else if (a4 || v14 != 39)
      {
LABEL_17:
        cmark_strbuf_puts(a1, (char *)*(&HTML_ESCAPES + v13));
        goto LABEL_18;
      }
      cmark_strbuf_putc((uint64_t)a1, v14);
LABEL_18:
      v8 = v10 + 1;
    }
    while ((int)v10 + 1 < a3);
  }
  return 1;
}

uint64_t houdini_escape_html(_DWORD *a1, uint64_t a2, int a3)
{
  houdini_escape_html0(a1, a2, a3, 1);
  return 1;
}

uint64_t cmark_version()
{
  return 1900544;
}

const char *cmark_version_string()
{
  return "0.29.0.gfm.0";
}

uint64_t cmark_markdown_to_html(_BYTE *a1, unint64_t a2, int a3)
{
  uint64_t (***v4)(uint64_t, uint64_t);
  uint64_t v5;

  v4 = (uint64_t (***)(uint64_t, uint64_t))cmark_parse_document(a1, a2, a3);
  v5 = cmark_render_html(v4, a3, 0);
  cmark_node_free(v4);
  return v5;
}

uint64_t cmark_render_html(uint64_t (***a1)(uint64_t, uint64_t), int a2, _QWORD *a3)
{
  return cmark_render_html_with_mem((uint64_t)a1, a2, a3, *a1);
}

uint64_t cmark_render_html_with_mem(uint64_t a1, int a2, _QWORD *a3, uint64_t (**a4)(uint64_t, uint64_t))
{
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t result;
  int v13;
  uint64_t node;
  uint64_t v15;
  _DWORD *v16;
  unsigned int v17;
  uint64_t v18;
  void (*v19)(void);
  _DWORD *v20;
  char v21;
  uint64_t v22;
  int start_line;
  int start_column;
  int end_line;
  int end_column;
  char *v27;
  _DWORD *v28;
  char *v29;
  const void *v30;
  int v31;
  uint64_t v32;
  int v33;
  int v34;
  uint64_t v35;
  _DWORD *v36;
  char *v37;
  uint64_t v38;
  _DWORD *v39;
  char *v40;
  uint64_t v41;
  int v42;
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
  int v53;
  int v54;
  int v55;
  int v56;
  uint64_t v57;
  int v58;
  int v59;
  int v60;
  int v61;
  int v62;
  _QWORD *v63;
  const void *v64;
  int v65;
  char *v66;
  size_t v67;
  _DWORD *v68;
  char *v69;
  char *v70;
  int64_t v71;
  _QWORD *v72;
  int v73;
  int v74;
  int v75;
  int v76;
  char *v77;
  int v78;
  int v79;
  int v80;
  int v81;
  _DWORD *v82;
  int v83;
  int v84;
  int v85;
  int v86;
  int v87;
  int v88;
  int v89;
  int v90;
  int v91;
  int v92;
  int v93;
  _DWORD *v94;
  __int128 v95;
  __int128 v96;
  _QWORD v97[3];
  char v98[8];
  char __s[4];
  char v100[100];
  char __str[100];
  uint64_t v102;

  v102 = *MEMORY[0x24BDAC8D0];
  v97[0] = a4;
  v97[1] = &cmark_strbuf__initbuf;
  v97[2] = 0;
  v95 = 0u;
  v96 = 0u;
  v94 = v97;
  v7 = cmark_iter_new(a1);
  if (a3)
  {
    v8 = 0;
    do
    {
      v9 = a3[1];
      if (*(_QWORD *)(v9 + 144))
      {
        v8 = cmark_llist_append(a4, v8, v9);
        *((_QWORD *)&v95 + 1) = v8;
      }
      a3 = (_QWORD *)*a3;
    }
    while (a3);
  }
  v10 = cmark_iter_next(v7);
  if (v10 != 1)
  {
    v13 = v10;
    v93 = a2;
    do
    {
      node = cmark_iter_get_node(v7);
      v15 = node;
      strcpy(__s, "<h0");
      strcpy(v98, "</h0");
      v16 = v94;
      if ((_QWORD)v95 == node)
      {
        *(_QWORD *)&v95 = 0;
      }
      else if ((_QWORD)v95)
      {
        v17 = *(unsigned __int16 *)(node + 100) - 49153;
        if (v17 <= 4)
        {
          if (((1 << v17) & 0x19) == 0)
          {
LABEL_23:
            v20 = v94;
            v21 = 32;
LABEL_24:
            cmark_strbuf_putc((uint64_t)v20, v21);
            goto LABEL_181;
          }
LABEL_15:
          houdini_escape_html0(v94, *(_QWORD *)(v15 + 144), *(_DWORD *)(v15 + 152), 0);
        }
        goto LABEL_181;
      }
      v18 = *(_QWORD *)(node + 112);
      if (!v18 || (v19 = *(void (**)(void))(v18 + 136)) == 0)
      {
        switch(*(_WORD *)(v15 + 100))
        {
          case 0xC001:
            goto LABEL_15;
          case 0xC002:
            if ((a2 & 4) != 0)
              goto LABEL_32;
            if ((a2 & 0x10) != 0)
              goto LABEL_23;
            goto LABEL_192;
          case 0xC003:
LABEL_32:
            v28 = v94;
            v29 = "<br />\n";
            goto LABEL_180;
          case 0xC004:
            cmark_strbuf_puts(v94, "<code>");
            houdini_escape_html0(v16, *(_QWORD *)(v15 + 144), *(_DWORD *)(v15 + 152), 0);
            v28 = v16;
            v29 = "</code>";
            goto LABEL_180;
          case 0xC005:
            if ((a2 & 0x20000) == 0)
            {
              v28 = v94;
              v29 = "<!-- raw HTML omitted -->";
              goto LABEL_180;
            }
            v63 = (_QWORD *)&v95 + 1;
            while (1)
            {
              v63 = (_QWORD *)*v63;
              if (!v63)
                break;
              if (!(*(unsigned int (**)(void))(v63[1] + 144))())
              {
                cmark_strbuf_puts(v16, "&lt;");
                v64 = (const void *)(*(_QWORD *)(v15 + 144) + 1);
                v65 = *(_DWORD *)(v15 + 152) - 1;
                goto LABEL_164;
              }
            }
            v64 = *(const void **)(v15 + 144);
            v65 = *(_DWORD *)(v15 + 152);
LABEL_164:
            cmark_strbuf_put(v16, v64, v65);
            goto LABEL_181;
          case 0xC006:
            if (v13 == 2)
            {
              v30 = *(const void **)(v15 + 144);
              v31 = *(_DWORD *)(v15 + 152);
            }
            else
            {
              v30 = *(const void **)(v15 + 160);
              v31 = *(_DWORD *)(v15 + 168);
            }
            cmark_strbuf_put(v94, v30, v31);
            goto LABEL_181;
          case 0xC007:
            v28 = v94;
            if (v13 == 2)
              v29 = "<em>";
            else
              v29 = "</em>";
            goto LABEL_180;
          case 0xC008:
            v32 = *(_QWORD *)(v15 + 40);
            if (v32 && *(unsigned __int16 *)(v32 + 100) == 49160)
              goto LABEL_181;
            v28 = v94;
            if (v13 == 2)
              v29 = "<strong>";
            else
              v29 = "</strong>";
            goto LABEL_180;
          case 0xC009:
            if (v13 == 2)
            {
              cmark_strbuf_puts(v94, "<a href=\"");
              if ((a2 & 0x20000) != 0
                || !_scan_at((uint64_t (*)(uint64_t))_scan_dangerous_url, (uint64_t *)(v15 + 144), 0))
              {
                houdini_escape_href(v16, *(_QWORD *)(v15 + 144), *(_DWORD *)(v15 + 152));
              }
              if (*(_DWORD *)(v15 + 168))
              {
                cmark_strbuf_puts(v16, "\" title=\"");
                houdini_escape_html0(v16, *(_QWORD *)(v15 + 160), *(_DWORD *)(v15 + 168), 0);
              }
              v28 = v16;
              v29 = "\">";
            }
            else
            {
              v28 = v94;
              v29 = "</a>";
            }
            goto LABEL_180;
          case 0xC00A:
            if (v13 == 2)
            {
              cmark_strbuf_puts(v94, "<img src=\"");
              if ((a2 & 0x20000) != 0
                || !_scan_at((uint64_t (*)(uint64_t))_scan_dangerous_url, (uint64_t *)(v15 + 144), 0))
              {
                houdini_escape_href(v16, *(_QWORD *)(v15 + 144), *(_DWORD *)(v15 + 152));
              }
              cmark_strbuf_puts(v16, "\" alt=\"");
              *(_QWORD *)&v95 = v15;
            }
            else
            {
              if (*(_DWORD *)(v15 + 168))
              {
                cmark_strbuf_puts(v94, "\" title=\"");
                houdini_escape_html0(v16, *(_QWORD *)(v15 + 160), *(_DWORD *)(v15 + 168), 0);
              }
              v28 = v16;
              v29 = "\" />";
LABEL_180:
              cmark_strbuf_puts(v28, v29);
            }
            goto LABEL_181;
          case 0xC00B:
            if (v13 != 2)
              goto LABEL_181;
            cmark_strbuf_puts(v94, "<sup class=\"footnote-ref\"><a href=\"#fn-");
            houdini_escape_href(v16, *(_QWORD *)(*(_QWORD *)(v15 + 136) + 144), *(_DWORD *)(*(_QWORD *)(v15 + 136) + 152));
            cmark_strbuf_puts(v16, "\" id=\"fnref-");
            houdini_escape_href(v16, *(_QWORD *)(*(_QWORD *)(v15 + 136) + 144), *(_DWORD *)(*(_QWORD *)(v15 + 136) + 152));
            if (*(int *)(v15 + 128) >= 2)
            {
              snprintf(__str, 0x20uLL, "%d", *(_DWORD *)(v15 + 128));
              cmark_strbuf_puts(v16, "-");
              cmark_strbuf_puts(v16, __str);
            }
            cmark_strbuf_puts(v16, "\" data-footnote-ref>");
            houdini_escape_href(v16, *(_QWORD *)(v15 + 144), *(_DWORD *)(v15 + 152));
            v28 = v16;
            v29 = "</a></sup>";
            goto LABEL_180;
          case 0xC00C:
            goto LABEL_181;
          default:
            switch(*(_WORD *)(v15 + 100))
            {
              case 0x8001:
                goto LABEL_181;
              case 0x8002:
                v22 = (int)v94[5];
                if ((_DWORD)v22 && *(_BYTE *)(v22 + *((_QWORD *)v94 + 1) - 1) != 10)
                  cmark_strbuf_putc((uint64_t)v94, 10);
                if (v13 != 2)
                {
                  v28 = v16;
                  v29 = "</blockquote>\n";
                  goto LABEL_180;
                }
                cmark_strbuf_puts(v16, "<blockquote");
                if ((a2 & 2) == 0)
                  goto LABEL_151;
                start_line = cmark_node_get_start_line(v15);
                start_column = cmark_node_get_start_column(v15);
                end_line = cmark_node_get_end_line(v15);
                end_column = cmark_node_get_end_column(v15);
                v87 = end_line;
                a2 = v93;
                snprintf(__str, 0x64uLL, " data-sourcepos=\"%d:%d-%d:%d\"", start_line, start_column, v87, end_column);
                v27 = __str;
                goto LABEL_150;
              case 0x8003:
                v33 = *(_DWORD *)(v15 + 144);
                if (v13 != 2)
                {
                  if (v33 == 1)
                    v29 = "</ul>\n";
                  else
                    v29 = "</ol>\n";
                  v28 = v94;
                  goto LABEL_180;
                }
                v34 = *(_DWORD *)(v15 + 156);
                v35 = (int)v94[5];
                if ((_DWORD)v35 && *(_BYTE *)(v35 + *((_QWORD *)v94 + 1) - 1) != 10)
                  cmark_strbuf_putc((uint64_t)v94, 10);
                if (v33 == 1)
                {
                  v36 = v16;
                  v37 = "<ul";
                }
                else if (v34 == 1)
                {
                  v36 = v16;
                  v37 = "<ol";
                }
                else
                {
                  snprintf(v100, 0x64uLL, "<ol start=\"%d\"", v34);
                  v37 = v100;
                  v36 = v16;
                }
                cmark_strbuf_puts(v36, v37);
                if ((a2 & 2) != 0)
                {
                  v83 = cmark_node_get_start_line(v15);
                  v84 = cmark_node_get_start_column(v15);
                  v85 = cmark_node_get_end_line(v15);
                  v86 = cmark_node_get_end_column(v15);
                  v92 = v85;
                  a2 = v93;
                  snprintf(__str, 0x64uLL, " data-sourcepos=\"%d:%d-%d:%d\"", v83, v84, v92, v86);
                  cmark_strbuf_puts(v16, __str);
                }
                cmark_strbuf_puts(v16, ">\n");
                goto LABEL_181;
              case 0x8004:
                if (v13 != 2)
                  goto LABEL_154;
                v38 = (int)v94[5];
                if ((_DWORD)v38 && *(_BYTE *)(v38 + *((_QWORD *)v94 + 1) - 1) != 10)
                  cmark_strbuf_putc((uint64_t)v94, 10);
                v39 = v16;
                v40 = "<li";
                goto LABEL_107;
              case 0x8005:
                v41 = (int)v94[5];
                if ((_DWORD)v41 && *(_BYTE *)(v41 + *((_QWORD *)v94 + 1) - 1) != 10)
                  cmark_strbuf_putc((uint64_t)v94, 10);
                v42 = *(_DWORD *)(v15 + 152);
                if (v42)
                {
                  if (v42 < 1)
                  {
                    LODWORD(v43) = 0;
                  }
                  else
                  {
                    v43 = 0;
                    do
                    {
                      if (cmark_isspace(*(_BYTE *)(*(_QWORD *)(v15 + 144) + v43)))
                        break;
                      ++v43;
                    }
                    while (v43 < *(int *)(v15 + 152));
                  }
                  cmark_strbuf_puts(v16, "<pre");
                  if ((a2 & 2) != 0)
                  {
                    v78 = cmark_node_get_start_line(v15);
                    v79 = cmark_node_get_start_column(v15);
                    v80 = cmark_node_get_end_line(v15);
                    v81 = cmark_node_get_end_column(v15);
                    v91 = v80;
                    a2 = v93;
                    snprintf(__str, 0x64uLL, " data-sourcepos=\"%d:%d-%d:%d\"", v78, v79, v91, v81);
                    cmark_strbuf_puts(v16, __str);
                  }
                  if ((a2 & 0x800) != 0)
                  {
                    cmark_strbuf_puts(v16, " lang=\"");
                    houdini_escape_html0(v16, *(_QWORD *)(v15 + 144), v43, 0);
                    if ((a2 & 0x10000) != 0)
                    {
                      v77 = "\"><code>";
                      if ((int)v43 >= *(_DWORD *)(v15 + 152))
                        goto LABEL_179;
                      cmark_strbuf_puts(v16, "\" data-meta=\"");
                      houdini_escape_html0(v16, *(_QWORD *)(v15 + 144) + v43 + 1, *(_DWORD *)(v15 + 152) + ~(_DWORD)v43, 0);
                    }
                    v77 = "\"><code>";
                  }
                  else
                  {
                    cmark_strbuf_puts(v16, "><code class=\"language-");
                    houdini_escape_html0(v16, *(_QWORD *)(v15 + 144), v43, 0);
                    if ((a2 & 0x10000) != 0)
                    {
                      v77 = "\">";
                      if ((int)v43 >= *(_DWORD *)(v15 + 152))
                        goto LABEL_179;
                      cmark_strbuf_puts(v16, "\" data-meta=\"");
                      houdini_escape_html0(v16, *(_QWORD *)(v15 + 144) + v43 + 1, *(_DWORD *)(v15 + 152) + ~(_DWORD)v43, 0);
                    }
                    v77 = "\">";
                  }
                }
                else
                {
                  cmark_strbuf_puts(v16, "<pre");
                  if ((a2 & 2) != 0)
                  {
                    v73 = cmark_node_get_start_line(v15);
                    v74 = cmark_node_get_start_column(v15);
                    v75 = cmark_node_get_end_line(v15);
                    v76 = cmark_node_get_end_column(v15);
                    v90 = v75;
                    a2 = v93;
                    snprintf(__str, 0x64uLL, " data-sourcepos=\"%d:%d-%d:%d\"", v73, v74, v90, v76);
                    cmark_strbuf_puts(v16, __str);
                  }
                  v77 = "><code>";
                }
LABEL_179:
                cmark_strbuf_puts(v16, v77);
                houdini_escape_html0(v16, *(_QWORD *)(v15 + 160), *(_DWORD *)(v15 + 168), 0);
                v28 = v16;
                v29 = "</code></pre>\n";
                goto LABEL_180;
              case 0x8006:
                v44 = (int)v94[5];
                if ((_DWORD)v44 && *(_BYTE *)(v44 + *((_QWORD *)v94 + 1) - 1) != 10)
                  cmark_strbuf_putc((uint64_t)v94, 10);
                if ((a2 & 0x20000) == 0)
                {
                  cmark_strbuf_puts(v16, "<!-- raw HTML omitted -->");
                  goto LABEL_190;
                }
                v66 = *(char **)(v15 + 144);
                v67 = *(int *)(v15 + 152);
                if (!*((_QWORD *)&v95 + 1))
                {
                  v82 = v16;
                  goto LABEL_189;
                }
                if (!(_DWORD)v67)
                  goto LABEL_190;
                v68 = v94;
                while (2)
                {
                  v69 = (char *)memchr(v66, 60, v67);
                  if (v69)
                  {
                    v70 = v69;
                    v71 = v69 - v66;
                    if (v69 != v66)
                    {
                      cmark_strbuf_put(v68, v66, v71);
                      v67 -= v71;
                      v66 = v70;
                    }
                    v72 = (_QWORD *)&v95 + 1;
                    a2 = v93;
                    while (1)
                    {
                      v72 = (_QWORD *)*v72;
                      if (!v72)
                        break;
                      if (!(*(unsigned int (**)(void))(v72[1] + 144))())
                      {
                        cmark_strbuf_puts(v68, "&lt;");
                        goto LABEL_147;
                      }
                    }
                    cmark_strbuf_putc((uint64_t)v68, 60);
LABEL_147:
                    ++v66;
                    if (!--v67)
                      goto LABEL_190;
                    continue;
                  }
                  break;
                }
                v82 = v68;
LABEL_189:
                cmark_strbuf_put(v82, v66, v67);
LABEL_190:
                v48 = (int)v16[5];
                if (!(_DWORD)v48)
                  goto LABEL_181;
LABEL_191:
                if (*(_BYTE *)(v48 + *((_QWORD *)v16 + 1) - 1) == 10)
                  goto LABEL_181;
LABEL_192:
                v20 = v16;
                v21 = 10;
                break;
              case 0x8007:
                v45 = (int)v94[5];
                if ((_DWORD)v45 && *(_BYTE *)(v45 + *((_QWORD *)v94 + 1) - 1) != 10)
                  cmark_strbuf_putc((uint64_t)v94, 10);
                v46 = 168;
                if (v13 == 2)
                  v46 = 152;
                v47 = 160;
                if (v13 == 2)
                  v47 = 144;
                cmark_strbuf_put(v16, *(const void **)(v15 + v47), *(_DWORD *)(v15 + v46));
                v48 = (int)v16[5];
                if (!(_DWORD)v48)
                  goto LABEL_181;
                goto LABEL_191;
              case 0x8008:
                v49 = cmark_node_parent(v15);
                v50 = cmark_node_parent(v49);
                if (v50 && *(unsigned __int16 *)(v50 + 100) == 32771 && *(_BYTE *)(v50 + 165))
                  goto LABEL_181;
                if (v13 == 2)
                {
                  v51 = (int)v16[5];
                  if ((_DWORD)v51 && *(_BYTE *)(v51 + *((_QWORD *)v16 + 1) - 1) != 10)
                    cmark_strbuf_putc((uint64_t)v16, 10);
                  v39 = v16;
                  v40 = "<p";
                  goto LABEL_107;
                }
                if (*(unsigned __int16 *)(v49 + 100) == 32779 && !*(_QWORD *)(v15 + 24))
                {
                  cmark_strbuf_putc((uint64_t)v16, 32);
                  S_put_footnote_backref((uint64_t)&v94, v16, v49);
                }
                v28 = v16;
                v29 = "</p>\n";
                goto LABEL_180;
              case 0x8009:
                if (v13 != 2)
                {
                  v98[3] = *(_BYTE *)(v15 + 144) + 48;
                  v27 = v98;
LABEL_150:
                  cmark_strbuf_puts(v16, v27);
LABEL_151:
                  v28 = v16;
                  v29 = ">\n";
                  goto LABEL_180;
                }
                v52 = (int)v94[5];
                if ((_DWORD)v52 && *(_BYTE *)(v52 + *((_QWORD *)v94 + 1) - 1) != 10)
                  cmark_strbuf_putc((uint64_t)v94, 10);
                __s[2] = *(_BYTE *)(v15 + 144) + 48;
                v40 = __s;
                v39 = v16;
LABEL_107:
                cmark_strbuf_puts(v39, v40);
                if ((a2 & 2) != 0)
                {
                  v53 = cmark_node_get_start_line(v15);
                  v54 = cmark_node_get_start_column(v15);
                  v55 = cmark_node_get_end_line(v15);
                  v56 = cmark_node_get_end_column(v15);
                  v88 = v55;
                  a2 = v93;
                  snprintf(__str, 0x64uLL, " data-sourcepos=\"%d:%d-%d:%d\"", v53, v54, v88, v56);
                  cmark_strbuf_puts(v16, __str);
                }
                v20 = v16;
                v21 = 62;
                goto LABEL_24;
              case 0x800A:
                v57 = (int)v94[5];
                if ((_DWORD)v57 && *(_BYTE *)(v57 + *((_QWORD *)v94 + 1) - 1) != 10)
                  cmark_strbuf_putc((uint64_t)v94, 10);
                cmark_strbuf_puts(v16, "<hr");
                if ((a2 & 2) != 0)
                {
                  v58 = cmark_node_get_start_line(v15);
                  v59 = cmark_node_get_start_column(v15);
                  v60 = cmark_node_get_end_line(v15);
                  v61 = cmark_node_get_end_column(v15);
                  v89 = v60;
                  a2 = v93;
                  snprintf(__str, 0x64uLL, " data-sourcepos=\"%d:%d-%d:%d\"", v58, v59, v89, v61);
                  cmark_strbuf_puts(v16, __str);
                }
                v28 = v16;
                v29 = " />\n";
                goto LABEL_180;
              case 0x800B:
                if (v13 == 2)
                {
                  v62 = v96;
                  if (!(_DWORD)v96)
                  {
                    cmark_strbuf_puts(v94, "<section class=\"footnotes\" data-footnotes>\n<ol>\n");
                    v62 = v96;
                  }
                  LODWORD(v96) = v62 + 1;
                  cmark_strbuf_puts(v16, "<li id=\"fn-");
                  houdini_escape_href(v16, *(_QWORD *)(v15 + 144), *(_DWORD *)(v15 + 152));
                  v28 = v16;
                  v29 = "\">\n";
                }
                else
                {
                  if (S_put_footnote_backref((uint64_t)&v94, v94, v15))
                    cmark_strbuf_putc((uint64_t)v16, 10);
LABEL_154:
                  v28 = v16;
                  v29 = "</li>\n";
                }
                goto LABEL_180;
              default:
                cmark_render_html_with_mem_cold_1();
            }
            return result;
        }
        goto LABEL_24;
      }
      v19();
LABEL_181:
      v13 = cmark_iter_next(v7);
    }
    while (v13 != 1);
  }
  if ((_DWORD)v96)
    cmark_strbuf_puts(v97, "</ol>\n</section>\n");
  v11 = cmark_strbuf_detach((uint64_t)v97);
  cmark_llist_free((uint64_t)a4, *((_QWORD **)&v95 + 1));
  cmark_iter_free(v7);
  return v11;
}

BOOL S_put_footnote_backref(uint64_t a1, _DWORD *a2, uint64_t a3)
{
  unsigned int v3;
  unsigned int v4;
  int v7;
  unsigned int v9;
  unsigned int v10;
  char __s[32];
  char __str[32];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = *(_DWORD *)(a1 + 24);
  v3 = *(_DWORD *)(a1 + 28);
  if (v3 < v4)
  {
    v10 = *(_DWORD *)(a1 + 28);
    *(_DWORD *)(a1 + 28) = v4;
    v9 = v4;
    snprintf(__str, 0x20uLL, "%d", v4);
    cmark_strbuf_puts(a2, "<a href=\"#fnref-");
    houdini_escape_href(a2, *(_QWORD *)(a3 + 144), *(_DWORD *)(a3 + 152));
    cmark_strbuf_puts(a2, "\" class=\"footnote-backref\" data-footnote-backref data-footnote-backref-idx=\"");
    cmark_strbuf_puts(a2, __str);
    cmark_strbuf_puts(a2, "\" aria-label=\"Back to reference ");
    cmark_strbuf_puts(a2, __str);
    cmark_strbuf_puts(a2, "\">↩</a>");
    if (*(int *)(a3 + 128) >= 2)
    {
      v7 = 1;
      do
      {
        snprintf(__s, 0x20uLL, "%d", ++v7);
        cmark_strbuf_puts(a2, " <a href=\"#fnref-");
        houdini_escape_href(a2, *(_QWORD *)(a3 + 144), *(_DWORD *)(a3 + 152));
        cmark_strbuf_puts(a2, "-");
        cmark_strbuf_puts(a2, __s);
        cmark_strbuf_puts(a2, "\" class=\"footnote-backref\" data-footnote-backref data-footnote-backref-idx=\"");
        cmark_strbuf_puts(a2, __str);
        cmark_strbuf_puts(a2, "-");
        cmark_strbuf_puts(a2, __s);
        cmark_strbuf_puts(a2, "\" aria-label=\"Back to reference ");
        cmark_strbuf_puts(a2, __str);
        cmark_strbuf_puts(a2, "-");
        cmark_strbuf_puts(a2, __s);
        cmark_strbuf_puts(a2, "\">↩<sup class=\"footnote-ref\">");
        cmark_strbuf_puts(a2, __s);
        cmark_strbuf_puts(a2, "</sup></a>");
      }
      while (v7 < *(_DWORD *)(a3 + 128));
    }
    v3 = v10;
    v4 = v9;
  }
  return v3 < v4;
}

BOOL cmark_ispunct(unsigned __int8 a1)
{
  return cmark_ctype_class[a1] == 2;
}

BOOL cmark_isalpha(unsigned __int8 a1)
{
  return cmark_ctype_class[a1] == 4;
}

uint64_t cmark_gfm_extensions_set_tasklist_item_checked(uint64_t result, char a2)
{
  uint64_t v2;
  const char *type_string;

  if (result)
  {
    v2 = result;
    if (*(_QWORD *)(result + 112)
      && (type_string = cmark_node_get_type_string(result), !strcmp(type_string, "tasklist")))
    {
      *(_BYTE *)(v2 + 166) = a2;
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t cmark_gfm_extensions_get_tasklist_item_checked(uint64_t result)
{
  uint64_t v1;
  const char *type_string;

  if (result)
  {
    v1 = result;
    if (*(_QWORD *)(result + 112)
      && (type_string = cmark_node_get_type_string(result), !strcmp(type_string, "tasklist")))
    {
      return *(_BYTE *)(v1 + 166) != 0;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t matches(int a1, uint64_t a2, char *__s, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  if (*(_DWORD *)(a2 + 56) >= *(_DWORD *)(a5 + 152) + *(_DWORD *)(a5 + 148))
  {
    v5 = 1;
    cmark_parser_advance_offset(a2, __s, *(_DWORD *)(a5 + 152) + *(_DWORD *)(a5 + 148), 1);
  }
  else if (*(_BYTE *)(a2 + 60) && *(_QWORD *)(a5 + 48))
  {
    cmark_parser_advance_offset(a2, __s, *(_DWORD *)(a2 + 44) - *(_DWORD *)(a2 + 36), 0);
    return 1;
  }
  else
  {
    return 0;
  }
  return v5;
}

const char *get_type_string()
{
  return "tasklist";
}

uint64_t open_tasklist_item(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char *a5, int a6)
{
  BOOL v11;

  if (cmark_node_get_type(a4) == 32772
    && _ext_scan_at((uint64_t (*)(uint64_t))_scan_tasklist, (uint64_t)a5, a6, 0))
  {
    cmark_node_set_syntax_extension(a4, a1);
    cmark_parser_advance_offset(a3, a5, 3, 0);
    if (strstr(a5, "[x]"))
      v11 = 1;
    else
      v11 = strstr(a5, "[X]") != 0;
    *(_BYTE *)(a4 + 166) = v11;
  }
  return 0;
}

BOOL can_contain(uint64_t a1, uint64_t a2)
{
  return *(unsigned __int16 *)(a2 + 100) == 32772;
}

_DWORD *commonmark_render(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  const char *v6;

  if (a4 == 2)
  {
    (*(void (**)(uint64_t))(a2 + 56))(a2);
    if (*(_BYTE *)(a3 + 166))
      v6 = "- [x] ";
    else
      v6 = "- [ ] ";
    (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a2 + 72))(a2, a3, v6, 0, 0);
    return cmark_strbuf_puts(*(_DWORD **)(a2 + 16), "  ");
  }
  else
  {
    cmark_strbuf_truncate(*(_QWORD *)(a2 + 16), *(_DWORD *)(*(_QWORD *)(a2 + 16) + 20) - 2);
    return (_DWORD *)(*(uint64_t (**)(uint64_t))(a2 + 56))(a2);
  }
}

_DWORD *html_render(uint64_t a1, uint64_t *a2, uint64_t a3, int a4, char a5)
{
  uint64_t v5;
  uint64_t v9;
  _DWORD *v10;
  int start_line;
  int start_column;
  int end_line;
  int end_column;
  char *v15;
  char __str[100];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = *a2;
  if (a4 != 2)
    return cmark_strbuf_puts((_DWORD *)v5, "</li>\n");
  v9 = *(int *)(v5 + 20);
  if ((_DWORD)v9 && *(_BYTE *)(v9 + *(_QWORD *)(v5 + 8) - 1) != 10)
  {
    cmark_strbuf_putc(v5, 10);
    v5 = *a2;
  }
  cmark_strbuf_puts((_DWORD *)v5, "<li");
  v10 = (_DWORD *)*a2;
  if ((a5 & 2) != 0)
  {
    start_line = cmark_node_get_start_line(a3);
    start_column = cmark_node_get_start_column(a3);
    end_line = cmark_node_get_end_line(a3);
    end_column = cmark_node_get_end_column(a3);
    snprintf(__str, 0x64uLL, " data-sourcepos=\"%d:%d-%d:%d\"", start_line, start_column, end_line, end_column);
    cmark_strbuf_puts(v10, __str);
    v10 = (_DWORD *)*a2;
  }
  cmark_strbuf_putc((uint64_t)v10, 62);
  if (*(_BYTE *)(a3 + 166))
    v15 = "<input type=\"checkbox\" checked=\"\" disabled=\"\" /> ";
  else
    v15 = "<input type=\"checkbox\" disabled=\"\" /> ";
  return cmark_strbuf_puts((_DWORD *)*a2, v15);
}

const char *xml_attr(uint64_t a1, uint64_t a2)
{
  if (*(_BYTE *)(a2 + 166))
    return " completed=\"true\"";
  else
    return " completed=\"false\"";
}

uint64_t cmark_render_man(uint64_t *a1, uint64_t a2, int a3)
{
  return cmark_render(*a1, (uint64_t)a1, a2, a3, (uint64_t)S_outc, (unsigned int (*)(uint64_t *, uint64_t, uint64_t, uint64_t))S_render_node_0);
}

uint64_t cmark_render_man_with_mem(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return cmark_render(a4, a1, a2, a3, (uint64_t)S_outc, (unsigned int (*)(uint64_t *, uint64_t, uint64_t, uint64_t))S_render_node_0);
}

_DWORD *S_outc(uint64_t a1, uint64_t a2, int a3, int a4)
{
  char *v4;
  unsigned int v6;

  if (!a3)
    goto LABEL_16;
  if (a4 > 91)
  {
    switch(a4)
    {
      case 8211:
        v4 = "\\[en]";
        return cmark_render_ascii(a1, v4);
      case 8212:
        v4 = "\\[em]";
        return cmark_render_ascii(a1, v4);
      case 8213:
      case 8214:
      case 8215:
      case 8218:
      case 8219:
        goto LABEL_16;
      case 8216:
        v4 = "\\[oq]";
        return cmark_render_ascii(a1, v4);
      case 8217:
        v4 = "\\[cq]";
        return cmark_render_ascii(a1, v4);
      case 8220:
        v4 = "\\[lq]";
        return cmark_render_ascii(a1, v4);
      case 8221:
        v4 = "\\[rq]";
        return cmark_render_ascii(a1, v4);
      default:
        if (a4 != 92)
          goto LABEL_16;
        v4 = "\\e";
        break;
    }
    return cmark_render_ascii(a1, v4);
  }
  if (a4 != 39)
  {
    if (a4 == 45)
    {
      v4 = "\\-";
      return cmark_render_ascii(a1, v4);
    }
    if (a4 == 46)
    {
      if (*(_BYTE *)(a1 + 40))
      {
        v4 = "\\&.";
        return cmark_render_ascii(a1, v4);
      }
      v6 = 46;
      return cmark_render_code_point(a1, v6);
    }
LABEL_16:
    v6 = a4;
    return cmark_render_code_point(a1, v6);
  }
  if (*(_BYTE *)(a1 + 40))
  {
    v4 = "\\&'";
    return cmark_render_ascii(a1, v4);
  }
  v6 = 39;
  return cmark_render_code_point(a1, v6);
}

uint64_t S_render_node_0(uint64_t a1, uint64_t a2, int a3, char a4)
{
  int v7;
  _BOOL8 v8;
  uint64_t v9;
  void (*v10)(void);
  void (*v11)(uint64_t, uint64_t, _BYTE *, _BOOL8, uint64_t);
  _BYTE *literal;
  void (*v13)(uint64_t, uint64_t, char *, _QWORD, _QWORD);
  char *v14;
  void (*v15)(uint64_t, uint64_t, _BYTE *, _BOOL8, uint64_t);
  _BYTE *v16;
  void (*v17)(uint64_t, uint64_t, const char *, _QWORD, _QWORD);
  void (*v18)(uint64_t, uint64_t, _BYTE *, _QWORD, _QWORD);
  _BYTE *v19;
  const char *v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t, _BYTE *, _BOOL8, uint64_t);
  _BYTE *url;
  void (*v24)(uint64_t, uint64_t, _BYTE *, _QWORD, uint64_t);
  _BYTE *v25;
  void (*v26)(uint64_t, uint64_t, const char *, _QWORD, _QWORD);
  const char *v27;
  uint64_t v28;
  const char *v29;
  int item_index;
  char __str[20];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v7 = *(_DWORD *)(a1 + 28);
  v8 = v7 > 0 && (a4 & 0x10) == 0;
  v9 = *(_QWORD *)(a2 + 112);
  if (v9 && (v10 = *(void (**)(void))(v9 + 128)) != 0)
  {
    v10();
  }
  else
  {
    switch(*(_WORD *)(a2 + 100))
    {
      case 0xC001:
      case 0xC00C:
        v11 = *(void (**)(uint64_t, uint64_t, _BYTE *, _BOOL8, uint64_t))(a1 + 72);
        literal = cmark_node_get_literal(a2);
        v11(a1, a2, literal, v8, 1);
        return 1;
      case 0xC002:
        if ((a4 & 4) != 0)
          goto LABEL_15;
        if (!(v7 | a4 & 0x10))
          goto LABEL_57;
        (*(void (**)(uint64_t, uint64_t, const char *, _BOOL8, _QWORD))(a1 + 72))(a1, a2, " ", v8, 0);
        return 1;
      case 0xC003:
LABEL_15:
        (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72))(a1, a2, ".PD 0\n.P\n.PD", 0, 0);
        goto LABEL_57;
      case 0xC004:
        (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72))(a1, a2, "\\f[C]", 0, 0);
        v15 = *(void (**)(uint64_t, uint64_t, _BYTE *, _BOOL8, uint64_t))(a1 + 72);
        v16 = cmark_node_get_literal(a2);
        v15(a1, a2, v16, v8, 1);
        v17 = *(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72);
        goto LABEL_25;
      case 0xC005:
      case 0xC00B:
        return 1;
      case 0xC006:
        v18 = *(void (**)(uint64_t, uint64_t, _BYTE *, _QWORD, _QWORD))(a1 + 72);
        if (a3 == 2)
          v19 = cmark_node_get_on_enter(a2);
        else
          v19 = cmark_node_get_on_exit(a2);
        v18(a1, a2, v19, 0, 0);
        return 1;
      case 0xC007:
        v17 = *(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72);
        if (a3 != 2)
          goto LABEL_25;
        v20 = "\\f[I]";
        break;
      case 0xC008:
        v21 = *(_QWORD *)(a2 + 40);
        if (v21 && *(unsigned __int16 *)(v21 + 100) == 49160)
          return 1;
        v17 = *(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72);
        if (a3 == 2)
          v20 = "\\f[B]";
        else
LABEL_25:
          v20 = "\\f[]";
        break;
      case 0xC009:
        if (a3 == 2)
          return 1;
        (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72))(a1, a2, " (", 0, 0);
        v22 = *(void (**)(uint64_t, uint64_t, _BYTE *, _BOOL8, uint64_t))(a1 + 72);
        url = cmark_node_get_url(a2);
        v22(a1, a2, url, v8, 3);
        v17 = *(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72);
        v20 = ")";
        break;
      case 0xC00A:
        v17 = *(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72);
        if (a3 == 2)
          v20 = "[IMAGE: ";
        else
          v20 = "]";
        break;
      default:
        switch(*(_WORD *)(a2 + 100))
        {
          case 0x8001:
          case 0x8003:
          case 0x8006:
          case 0x800B:
            return 1;
          case 0x8002:
            (*(void (**)(uint64_t))(a1 + 56))(a1);
            v13 = *(void (**)(uint64_t, uint64_t, char *, _QWORD, _QWORD))(a1 + 72);
            if (a3 == 2)
              v14 = ".RS";
            else
              v14 = ".RE";
            goto LABEL_56;
          case 0x8004:
            (*(void (**)(uint64_t))(a1 + 56))(a1);
            if (a3 != 2)
              return 1;
            (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72))(a1, a2, ".IP ", 0, 0);
            if (cmark_node_get_list_type(*(_QWORD *)(a2 + 40)) == 1)
            {
              (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72))(a1, a2, "\\[bu] 2", 0, 0);
            }
            else
            {
              item_index = cmark_node_get_item_index(a2);
              snprintf(__str, 0x14uLL, "\"%d.\" 4", item_index);
              v13 = *(void (**)(uint64_t, uint64_t, char *, _QWORD, _QWORD))(a1 + 72);
              v14 = __str;
LABEL_56:
              v13(a1, a2, v14, 0, 0);
            }
            break;
          case 0x8005:
            (*(void (**)(uint64_t))(a1 + 56))(a1);
            (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72))(a1, a2, ".IP\n.nf\n\\f[C]\n", 0, 0);
            v24 = *(void (**)(uint64_t, uint64_t, _BYTE *, _QWORD, uint64_t))(a1 + 72);
            v25 = cmark_node_get_literal(a2);
            v24(a1, a2, v25, 0, 1);
            (*(void (**)(uint64_t))(a1 + 56))(a1);
            (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72))(a1, a2, "\\f[]\n.fi", 0, 0);
            break;
          case 0x8007:
            (*(void (**)(uint64_t))(a1 + 56))(a1);
            v26 = *(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72);
            if (a3 == 2)
              v27 = cmark_node_get_on_enter(a2);
            else
              v27 = cmark_node_get_on_exit(a2);
            v29 = v27;
            goto LABEL_54;
          case 0x8008:
            if (a3 != 2)
              break;
            v28 = *(_QWORD *)(a2 + 40);
            if (v28 && *(unsigned __int16 *)(v28 + 100) == 32772 && !*(_QWORD *)(a2 + 32))
              return 1;
            (*(void (**)(uint64_t))(a1 + 56))(a1);
            (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72))(a1, a2, ".PP", 0, 0);
            break;
          case 0x8009:
            (*(void (**)(uint64_t))(a1 + 56))(a1);
            if (a3 != 2)
              return 1;
            v26 = *(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72);
            if (cmark_node_get_heading_level(a2) == 1)
              v29 = ".SH";
            else
              v29 = ".SS";
LABEL_54:
            v26(a1, a2, v29, 0, 0);
            break;
          case 0x800A:
            (*(void (**)(uint64_t))(a1 + 56))(a1);
            (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72))(a1, a2, ".PP\n  *  *  *  *  *", 0, 0);
            break;
          default:
            S_render_node_cold_1_0();
        }
LABEL_57:
        (*(void (**)(uint64_t))(a1 + 56))(a1);
        return 1;
    }
    v17(a1, a2, v20, 0, 0);
  }
  return 1;
}

uint64_t cmark_syntax_extension_free(uint64_t a1, uint64_t a2)
{
  void (*v4)(uint64_t);

  v4 = *(void (**)(uint64_t))(a2 + 64);
  if (v4 && *(_QWORD *)(a2 + 48))
    v4(a1);
  cmark_llist_free(a1, *(_QWORD **)(a2 + 32));
  (*(void (**)(_QWORD))(a1 + 16))(*(_QWORD *)(a2 + 40));
  return (*(uint64_t (**)(uint64_t))(a1 + 16))(a2);
}

uint64_t cmark_syntax_extension_set_private(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(result + 48) = a2;
  *(_QWORD *)(result + 64) = a3;
  return result;
}

uint64_t cmark_syntax_extension_get_private(uint64_t a1)
{
  return *(_QWORD *)(a1 + 48);
}

unint64_t check_domain(uint64_t a1, uint64_t a2, int a3)
{
  unint64_t v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  int v13;
  unint64_t v15;

  v4 = a2 - 1;
  if ((unint64_t)(a2 - 1) >= 2)
  {
    v5 = a2;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = a2 - 2;
    v11 = 1;
    while (1)
    {
      if (*(_BYTE *)(a1 + v11) == 92 && v11 < v10)
        ++v11;
      v13 = *(unsigned __int8 *)(a1 + v11);
      if (v13 == 46)
      {
        ++v9;
        v8 = v7;
        v7 = 0;
      }
      else if (v13 == 95)
      {
        ++v7;
      }
      else if (!is_valid_hostchar((unsigned __int8 *)(a1 + v11), v5 - v11) && *(_BYTE *)(a1 + v11) != 45)
      {
        goto LABEL_17;
      }
      if (++v11 >= v4)
        goto LABEL_17;
    }
  }
  v9 = 0;
  v8 = 0;
  v7 = 0;
  v11 = 1;
LABEL_17:
  if (v8 | v7 && v9 < 0xB)
    return 0;
  if (v9)
    v15 = v11;
  else
    v15 = 0;
  if (a3)
    return v11;
  else
    return v15;
}

unint64_t autolink_delim(uint64_t a1, unint64_t a2)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t result;
  int v6;
  unint64_t v7;
  int v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;

  if (!a2)
    return 0;
  v3 = 0;
  v4 = 0;
  for (result = 0; result != a2; ++result)
  {
    v6 = *(unsigned __int8 *)(a1 + result);
    switch(v6)
    {
      case '(':
        ++v3;
        break;
      case ')':
        ++v4;
        break;
      case '<':
        goto LABEL_11;
    }
  }
  result = a2;
LABEL_11:
  if (result)
  {
    while (1)
    {
      v7 = result - 1;
      v8 = *(unsigned __int8 *)(a1 + result - 1);
      v9 = (v8 - 33);
      if (v9 > 0x3E)
        goto LABEL_23;
      if (((1 << (v8 - 33)) & 0x4000000042002A43) != 0)
        goto LABEL_14;
      if (v9 != 8)
        break;
      if (v4 <= v3)
        return result;
      --v4;
LABEL_14:
      result = v7;
      if (!v7)
        return result;
    }
    if (v9 == 26)
    {
      v10 = result - 2;
      if (result == 2)
      {
        v11 = 0;
      }
      else
      {
        v11 = result - 2;
        do
        {
          if (!cmark_isalpha(*(_BYTE *)(a1 + v11)))
            break;
          --v11;
        }
        while (v11);
      }
      if (v11 < v10 && *(_BYTE *)(a1 + v11) == 38)
        v7 = v11;
      goto LABEL_14;
    }
LABEL_23:
    if (v8 != 126)
      return result;
    goto LABEL_14;
  }
  return result;
}

BOOL is_valid_hostchar(unsigned __int8 *a1, int a2)
{
  unsigned int v3;

  v3 = 0;
  return (cmark_utf8proc_iterate(a1, a2, &v3) & 0x80000000) == 0
      && !cmark_utf8proc_is_space(v3)
      && !cmark_utf8proc_is_punctuation(v3);
}

BOOL validate_protocol(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  size_t v8;
  size_t v9;
  size_t v10;

  v8 = strlen(a1);
  v9 = a4 - a3;
  if (v8 > v9)
    return 0;
  v10 = v8;
  if (memcmp((const void *)(a2 - a3 - v8), a1, v8))
    return 0;
  if (v10 == v9)
    return 1;
  return !cmark_isalnum(*(_BYTE *)(a2 + ~v10 - a3));
}

uint64_t cmark_release_plugins()
{
  pthread_once(&extensions_once, (void (*)(void))initialize_extensions);
  pthread_mutex_lock(&extensions_lock);
  if (syntax_extensions)
  {
    cmark_llist_free_full((uint64_t)&CMARK_DEFAULT_MEM_ALLOCATOR, (_QWORD *)syntax_extensions, (void (*)(uint64_t, _QWORD))cmark_syntax_extension_free);
    syntax_extensions = 0;
  }
  return pthread_mutex_unlock(&extensions_lock);
}

_QWORD *cmark_list_syntax_extensions(uint64_t (**a1)(uint64_t, uint64_t))
{
  _QWORD *v2;
  _QWORD *v3;

  pthread_once(&extensions_once, (void (*)(void))initialize_extensions);
  pthread_mutex_lock(&extensions_lock);
  v2 = (_QWORD *)syntax_extensions;
  if (syntax_extensions)
  {
    v3 = 0;
    do
    {
      v3 = cmark_llist_append(a1, v3, v2[1]);
      v2 = (_QWORD *)*v2;
    }
    while (v2);
  }
  else
  {
    v3 = 0;
  }
  pthread_mutex_unlock(&extensions_lock);
  return v3;
}

_DWORD *cmark_render_ascii(uint64_t a1, char *a2)
{
  _DWORD *v3;
  int v4;
  _DWORD *result;

  v3 = *(_DWORD **)(a1 + 8);
  v4 = v3[5];
  result = cmark_strbuf_puts(v3, a2);
  *(_DWORD *)(a1 + 24) += *(_DWORD *)(*(_QWORD *)(a1 + 8) + 20) - v4;
  return result;
}

_DWORD *cmark_render_code_point(uint64_t a1, unsigned int a2)
{
  _DWORD *result;

  result = cmark_utf8proc_encode_char(a2, *(_DWORD **)(a1 + 8));
  ++*(_DWORD *)(a1 + 24);
  return result;
}

uint64_t cmark_render(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, unsigned int (*a6)(uint64_t *, uint64_t, uint64_t, uint64_t))
{
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t node;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int list_start;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  int v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t);
  uint64_t (*v33)(uint64_t);
  uint64_t (*v34)(uint64_t, uint64_t, char *, int, uint64_t);
  uint64_t v35;
  _QWORD v36[3];
  _QWORD v37[3];

  v37[0] = a1;
  v37[1] = &cmark_strbuf__initbuf;
  v37[2] = 0;
  v36[0] = a1;
  v36[1] = &cmark_strbuf__initbuf;
  v36[2] = 0;
  v11 = cmark_iter_new(a2);
  v30 = 257;
  v35 = 0;
  v12 = v36;
  v24 = a1;
  v25 = v36;
  v26 = v37;
  v27 = 0;
  v28 = a4;
  v29 = 0;
  v31 = a5;
  v32 = S_cr;
  v33 = S_blankline;
  v34 = S_out;
  v13 = cmark_iter_next(v11);
  if ((_DWORD)v13 != 1)
  {
    v14 = v13;
    while (1)
    {
      node = cmark_iter_get_node(v11);
      v16 = node;
      v17 = *(_QWORD *)(node + 112);
      if (v17)
        goto LABEL_6;
      v18 = *(_QWORD *)(node + 40);
      if (v18)
        break;
LABEL_7:
      if (*(unsigned __int16 *)(node + 100) == 32772)
      {
        v19 = *(_QWORD *)(node + 32);
        if (v19)
          list_start = cmark_node_get_item_index(v19) + 1;
        else
          list_start = cmark_node_get_list_start(*(_QWORD *)(v16 + 40));
        cmark_node_set_item_index(v16, list_start);
      }
      if (!a6(&v24, v16, v14, a3))
        cmark_iter_reset(v11, v16, 3);
      v14 = cmark_iter_next(v11);
      if ((_DWORD)v14 == 1)
      {
        v12 = v25;
        goto LABEL_16;
      }
    }
    v17 = *(_QWORD *)(v18 + 120);
LABEL_6:
    *(_QWORD *)(node + 120) = v17;
    goto LABEL_7;
  }
LABEL_16:
  v21 = *((int *)v12 + 5);
  if (!(_DWORD)v21 || *(_BYTE *)(v21 + v12[1] - 1) != 10)
  {
    cmark_strbuf_putc((uint64_t)v12, 10);
    v12 = v25;
  }
  v22 = cmark_strbuf_detach((uint64_t)v12);
  cmark_iter_free(v11);
  cmark_strbuf_free((uint64_t)v26);
  cmark_strbuf_free((uint64_t)v25);
  return v22;
}

uint64_t S_cr(uint64_t result)
{
  if (*(int *)(result + 32) <= 0)
    *(_DWORD *)(result + 32) = 1;
  return result;
}

uint64_t S_blankline(uint64_t result)
{
  if (*(int *)(result + 32) <= 1)
    *(_DWORD *)(result + 32) = 2;
  return result;
}

uint64_t S_out(uint64_t a1, uint64_t a2, char *__s, int a4, uint64_t a5)
{
  char *v7;
  uint64_t result;
  int v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  int v15;
  int v16;
  unsigned int v17;
  int v18;
  char v19;
  int v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  int v24;
  char *v25;
  unsigned __int8 v26;
  int v27;
  char v28;
  int v29;
  uint64_t v30;
  const char *v31;
  int v32;
  void *v33;
  int v34;
  void *v35;
  char *v36;
  unsigned int v37;
  char *v38;
  char v39;
  unsigned int v40;

  v7 = __s;
  result = strlen(__s);
  v11 = result;
  v12 = *(_QWORD *)(a2 + 120);
  if (v12)
  {
    if (*(_QWORD *)(v12 + 176))
      v13 = *(_QWORD *)(a2 + 120);
    else
      v13 = 0;
  }
  else
  {
    v13 = 0;
  }
  if (a4)
    v14 = *(_BYTE *)(a1 + 42) == 0;
  else
    v14 = 0;
  v15 = *(_DWORD *)(*(_QWORD *)(a1 + 8) + 20);
  v40 = 0;
  v16 = *(_DWORD *)(a1 + 32);
  if (*(_BYTE *)(a1 + 43) && v16 >= 2)
  {
    v16 = 1;
    *(_DWORD *)(a1 + 32) = 1;
  }
  else if (!v16)
  {
    goto LABEL_21;
  }
  v17 = v15 - 1;
  do
  {
    if ((v17 & 0x80000000) != 0 || (result = *(_QWORD *)(a1 + 8), *(_BYTE *)(*(_QWORD *)(result + 8) + v17) == 10))
    {
      --v17;
    }
    else
    {
      result = cmark_strbuf_putc(result, 10);
      v16 = *(_DWORD *)(a1 + 32);
      if (v16 >= 2)
      {
        result = (uint64_t)cmark_strbuf_put(*(_DWORD **)(a1 + 8), *(const void **)(*(_QWORD *)(a1 + 16) + 8), *(_DWORD *)(*(_QWORD *)(a1 + 16) + 20));
        v16 = *(_DWORD *)(a1 + 32);
      }
    }
    *(_DWORD *)(a1 + 24) = 0;
    *(_WORD *)(a1 + 40) = 257;
    *(_QWORD *)(a1 + 32) = --v16;
  }
  while (v16);
LABEL_21:
  if (v11 >= 1)
  {
    v18 = 0;
    v38 = v7 + 1;
    v19 = !v14;
    v39 = v19;
    v37 = a5;
    v36 = v7;
    do
    {
      if (*(_BYTE *)(a1 + 40))
      {
        cmark_strbuf_put(*(_DWORD **)(a1 + 8), *(const void **)(*(_QWORD *)(a1 + 16) + 8), *(_DWORD *)(*(_QWORD *)(a1 + 16) + 20));
        *(_DWORD *)(a1 + 24) = *(_DWORD *)(*(_QWORD *)(a1 + 16) + 20);
      }
      result = cmark_utf8proc_iterate((unsigned __int8 *)&v7[v18], v11 - v18, &v40);
      if ((_DWORD)result == -1)
        return result;
      v20 = result;
      if (v13)
      {
        result = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v13 + 176))(v13, a2, v40);
        if ((_DWORD)result)
          result = cmark_strbuf_putc(*(_QWORD *)(a1 + 8), 92);
      }
      v21 = v18;
      if (v40 == 32)
        v22 = v19;
      else
        v22 = 1;
      if ((v22 & 1) != 0)
      {
        if ((_DWORD)a5)
        {
          result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 48))(a1, a2, a5);
LABEL_44:
          *(_BYTE *)(a1 + 40) = 0;
          v28 = *(_BYTE *)(a1 + 41);
          if (v28)
          {
            result = cmark_isdigit(v40);
            v28 = (_DWORD)result == 1;
          }
          *(_BYTE *)(a1 + 41) = v28;
          goto LABEL_47;
        }
        if (v40 != 10)
        {
          result = (uint64_t)cmark_utf8proc_encode_char(v40, *(_DWORD **)(a1 + 8));
          ++*(_DWORD *)(a1 + 24);
          goto LABEL_44;
        }
        result = cmark_strbuf_putc(*(_QWORD *)(a1 + 8), 10);
        *(_DWORD *)(a1 + 24) = 0;
        *(_WORD *)(a1 + 40) = 257;
        *(_DWORD *)(a1 + 36) = 0;
      }
      else if (!*(_BYTE *)(a1 + 40))
      {
        v23 = *(_QWORD *)(a1 + 8);
        v24 = *(_DWORD *)(v23 + 20);
        cmark_strbuf_putc(v23, 32);
        ++*(_DWORD *)(a1 + 24);
        *(_WORD *)(a1 + 40) = 0;
        --v18;
        v25 = &v38[v21];
        do
        {
          v27 = *v25++;
          v26 = v27;
          ++v18;
        }
        while (v27 == 32);
        result = cmark_isdigit(v26);
        if (!(_DWORD)result)
          *(_DWORD *)(a1 + 36) = v24;
        v19 = v39;
      }
LABEL_47:
      v29 = *(_DWORD *)(a1 + 28);
      if (v29 >= 1 && *(_DWORD *)(a1 + 24) > v29 && !*(_BYTE *)(a1 + 40))
      {
        v30 = *(unsigned int *)(a1 + 36);
        if ((int)v30 >= 1)
        {
          v31 = (const char *)(*(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) + v30 + 1);
          v32 = strlen(v31);
          v33 = (void *)(**(uint64_t (***)(_QWORD, uint64_t))a1)(v32 + 1, 1);
          v7 = v36;
          memcpy(v33, v31, v32 + 1);
          cmark_strbuf_truncate(*(_QWORD *)(a1 + 8), *(_DWORD *)(a1 + 36));
          cmark_strbuf_putc(*(_QWORD *)(a1 + 8), 10);
          cmark_strbuf_put(*(_DWORD **)(a1 + 8), *(const void **)(*(_QWORD *)(a1 + 16) + 8), *(_DWORD *)(*(_QWORD *)(a1 + 16) + 20));
          cmark_strbuf_put(*(_DWORD **)(a1 + 8), v33, v32);
          v34 = *(_DWORD *)(*(_QWORD *)(a1 + 16) + 20) + v32;
          a5 = v37;
          *(_DWORD *)(a1 + 24) = v34;
          v35 = v33;
          v19 = v39;
          result = (*(uint64_t (**)(void *))(*(_QWORD *)a1 + 16))(v35);
          *(_DWORD *)(a1 + 36) = 0;
          *(_WORD *)(a1 + 40) = 0;
        }
      }
      v18 += v20;
    }
    while (v18 < v11);
  }
  return result;
}

uint64_t _ext_scan_at(uint64_t (*a1)(uint64_t), uint64_t a2, int a3, int a4)
{
  char v6;
  uint64_t result;

  if (!a2 || a4 >= a3)
    return 0;
  v6 = *(_BYTE *)(a2 + a3);
  *(_BYTE *)(a2 + a3) = 0;
  result = a1(a2 + a4);
  *(_BYTE *)(a2 + a3) = v6;
  return result;
}

uint64_t _scan_table_start(unsigned __int8 *a1)
{
  unsigned int v1;
  unsigned __int8 *v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  BOOL v8;
  BOOL v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  int v16;

  v1 = *a1;
  if (v1 <= 0x20)
  {
    if (v1 > 0xA)
    {
      if (v1 - 32 >= 0xFFFFFFED)
        return 0;
    }
    else if (v1 != 9)
    {
      return 0;
    }
    goto LABEL_16;
  }
  if (v1 > 0x39)
  {
    if (v1 == 58)
    {
      v2 = a1;
      goto LABEL_34;
    }
    if (v1 == 124)
    {
LABEL_16:
      v2 = a1 + 1;
      v5 = a1[1];
      if ((_scan_table_start_yybm[v5] & 0x40) != 0)
      {
        do
        {
          v7 = *++v2;
          v6 = v7;
        }
        while ((_scan_table_start_yybm[v7] & 0x40) != 0);
        if (v6 != 58)
        {
          if (v6 == 45)
            goto LABEL_35;
          return 0;
        }
      }
      else
      {
        if ((_DWORD)v5 == 45)
          goto LABEL_35;
        if ((_DWORD)v5 != 58)
          return 0;
      }
LABEL_34:
      v10 = *++v2;
      if (_scan_table_start_yybm[v10] < 0)
        goto LABEL_35;
    }
    return 0;
  }
  if (v1 != 45)
    return 0;
  v2 = a1 + 1;
  v3 = a1[1];
  if (_scan_table_start_yybm[a1[1]] < 0)
    goto LABEL_35;
  if (v3 > 0x20)
  {
    v8 = v3 == 58;
    if (v3 <= 0x3A)
      goto LABEL_44;
LABEL_33:
    v9 = v3 == 124;
LABEL_49:
    while (v9)
    {
      while (1)
      {
        v15 = *++v2;
        v14 = v15;
        if (_scan_table_start_yybm[v15] < 0)
          break;
        if (v14 > 0xD)
        {
          v9 = v14 == 32;
          if (v14 <= 0x20)
            goto LABEL_49;
          if (v14 == 58)
            goto LABEL_34;
          return 0;
        }
        v9 = v14 == 9;
        if (v14 <= 9)
          goto LABEL_49;
        if (v14 == 10)
          return ((_DWORD)v2 - (_DWORD)a1 + 1);
        if (v14 >= 0xD)
          goto LABEL_61;
      }
      do
      {
LABEL_35:
        v12 = *++v2;
        v11 = v12;
      }
      while (_scan_table_start_yybm[v12] < 0);
      if (v11 <= 0x1F)
      {
        if (v11 <= 0xA)
        {
          if (v11 < 9)
            return 0;
          if (v11 == 9)
            goto LABEL_47;
          return ((_DWORD)v2 - (_DWORD)a1 + 1);
        }
        if (v11 < 0xD)
          goto LABEL_47;
        if (v11 != 13)
          return 0;
        goto LABEL_61;
      }
      if (v11 <= 0x3A)
      {
        if (v11 < 0x21)
          goto LABEL_47;
        v8 = v11 == 58;
        goto LABEL_44;
      }
      v9 = v11 == 124;
    }
    return 0;
  }
  v4 = 0;
  if (v3 < 9 || v3 - 14 < 0x12)
    return v4;
  while (1)
  {
    if (v3 > 0xD)
    {
      v8 = v3 == 32;
      if (v3 > 0x20)
        goto LABEL_33;
LABEL_44:
      if (!v8)
        return 0;
      goto LABEL_47;
    }
    v8 = v3 == 9;
    if (v3 <= 9)
      goto LABEL_44;
    if (v3 == 10)
      return ((_DWORD)v2 - (_DWORD)a1 + 1);
    if (v3 >= 0xD)
      break;
LABEL_47:
    v13 = *++v2;
    v3 = v13;
  }
LABEL_61:
  v16 = v2[1];
  LODWORD(v2) = (_DWORD)v2 + 1;
  if (v16 != 10)
    return 0;
  return ((_DWORD)v2 - (_DWORD)a1 + 1);
}

uint64_t _scan_table_cell(unsigned __int8 *a1)
{
  unsigned int v1;
  unsigned __int8 *v2;
  unsigned __int8 *v3;
  unsigned __int8 *v4;
  int v5;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  int v10;
  int v11;

  v1 = *a1;
  v2 = a1;
  if ((_scan_table_cell_yybm[*a1] & 0x40) != 0)
    goto LABEL_28;
  if (v1 > 0xEC)
  {
    if (v1 > 0xF0)
    {
      if (v1 >= 0xF4)
      {
        if (v1 != 244)
          return 0;
        v4 = a1 + 1;
        if ((char)a1[1] >= -112)
          return 0;
      }
      else
      {
        v4 = a1 + 1;
        if ((char)a1[1] >= -64)
          return 0;
      }
    }
    else
    {
      if (v1 < 0xEE)
      {
        v3 = a1 + 1;
        if ((char)a1[1] < -96)
          goto LABEL_26;
        return 0;
      }
      if (v1 < 0xF0)
      {
LABEL_25:
        v3 = a1 + 1;
        if ((char)a1[1] < -64)
          goto LABEL_26;
        return 0;
      }
      v4 = a1 + 1;
      if ((a1[1] + 112) >= 0x30u)
        return 0;
    }
    v5 = 1;
    LODWORD(v2) = (_DWORD)v4;
    goto LABEL_64;
  }
  if (v1 <= 0xC1)
  {
    v2 = a1;
    if (v1 - 14 < 0x4F)
      goto LABEL_32;
    return 0;
  }
  if (v1 >= 0xE0)
  {
    if (v1 == 224)
    {
      v3 = a1 + 1;
      if ((a1[1] & 0xE0) != 0xA0)
        return 0;
LABEL_26:
      v5 = 1;
      LODWORD(v2) = (_DWORD)v3;
      goto LABEL_65;
    }
    goto LABEL_25;
  }
  v2 = a1 + 1;
  if ((char)a1[1] >= -64)
    return 0;
  do
  {
    while (1)
    {
      do
      {
LABEL_28:
        v8 = *++v2;
        v7 = v8;
      }
      while ((_scan_table_cell_yybm[v8] & 0x40) != 0);
      if (v7 > 0xEC)
      {
        if (v7 <= 0xF0)
        {
          if (v7 < 0xEE)
            goto LABEL_44;
          v5 = 0;
          v4 = v2;
          if (v7 < 0xF0)
            goto LABEL_64;
LABEL_53:
          v5 = 0;
          v4 = v2 + 1;
          if ((v2[1] + 112) >= 0x30u)
            return ((_DWORD)v2 - (_DWORD)a1);
          goto LABEL_64;
        }
        goto LABEL_55;
      }
      if (v7 > 0xC1)
        break;
      if (v7 - 14 > 0x4E)
        return ((_DWORD)v2 - (_DWORD)a1);
      do
      {
LABEL_32:
        v9 = *++v2;
        v7 = v9;
      }
      while (_scan_table_cell_yybm[v9] < 0);
      if (v7 > 0xDF)
      {
        if (v7 <= 0xEF)
        {
          if (v7 < 0xE1)
            goto LABEL_62;
          v5 = 0;
          v4 = v2;
          if (v7 == 237)
          {
LABEL_44:
            v5 = 0;
            v3 = v2 + 1;
            if ((char)v2[1] >= -96)
              return ((_DWORD)v2 - (_DWORD)a1);
            goto LABEL_65;
          }
          goto LABEL_64;
        }
        if (v7 == 240)
          goto LABEL_53;
LABEL_55:
        if (v7 >= 0xF4)
        {
          if (v7 != 244)
            return ((_DWORD)v2 - (_DWORD)a1);
          v5 = 0;
          v4 = v2 + 1;
          if ((char)v2[1] >= -112)
            return ((_DWORD)v2 - (_DWORD)a1);
        }
        else
        {
          v5 = 0;
          v4 = v2 + 1;
          if ((char)v2[1] >= -64)
            return ((_DWORD)v2 - (_DWORD)a1);
        }
        goto LABEL_64;
      }
      if (v7 > 0xC)
      {
        if (v7 == 13)
          return ((_DWORD)v2 - (_DWORD)a1);
        if ((v7 & 0x80) != 0)
        {
          v5 = 0;
          v3 = v2;
          if (v7 < 0xC2)
            return ((_DWORD)v2 - (_DWORD)a1);
          goto LABEL_65;
        }
      }
      else if (v7 == 10)
      {
        return ((_DWORD)v2 - (_DWORD)a1);
      }
    }
    if (v7 < 0xE0)
    {
      v5 = 0;
      v3 = v2;
      goto LABEL_65;
    }
    v5 = 0;
    v4 = v2;
    if (v7 == 224)
    {
LABEL_62:
      v5 = 0;
      v3 = v2 + 1;
      if ((v2[1] & 0xE0) != 0xA0)
        return ((_DWORD)v2 - (_DWORD)a1);
      goto LABEL_65;
    }
LABEL_64:
    v10 = (char)v4[1];
    v3 = v4 + 1;
    v11 = (int)v2;
    if (v10 >= -64)
      break;
LABEL_65:
    v11 = (int)v2;
    v2 = v3 + 1;
  }
  while ((char)v3[1] <= -65);
  LODWORD(v2) = v11;
  if (v5)
    return 0;
  return ((_DWORD)v2 - (_DWORD)a1);
}

uint64_t _scan_table_cell_end(_BYTE *a1)
{
  uint64_t result;
  _BYTE *v3;
  int v4;

  if (*a1 != 124)
    return 0;
  result = 0;
  v3 = a1 + 1;
  do
    v4 = _scan_table_row_end_yybm[v3[result++]];
  while (v4 < 0);
  return result;
}

uint64_t _scan_table_row_end(unsigned __int8 *a1)
{
  unsigned int v1;
  unsigned __int8 *v2;
  uint64_t v3;
  int v4;
  int v5;

  v1 = *a1;
  if (v1 <= 0xC)
  {
    if (v1 < 9)
      return 0;
    LODWORD(v2) = (_DWORD)a1;
    if (v1 == 10)
      return ((_DWORD)v2 - (_DWORD)a1 + 1);
    goto LABEL_7;
  }
  if (v1 != 13)
  {
    if (v1 != 32)
      return 0;
LABEL_7:
    v2 = a1 + 1;
    v3 = a1[1];
    if (v3 < 9 || v3 >= 0xE && (_DWORD)v3 != 32)
      return 0;
    if (_scan_table_row_end_yybm[v3] < 0)
    {
      do
      {
        v4 = *++v2;
        LODWORD(v3) = v4;
      }
      while (_scan_table_row_end_yybm[v4] < 0);
      if (v3 < 9)
        return 0;
    }
    if (v3 < 0xB)
      return ((_DWORD)v2 - (_DWORD)a1 + 1);
    if (v3 > 0xD)
      return 0;
    goto LABEL_17;
  }
  v2 = a1;
LABEL_17:
  v5 = v2[1];
  LODWORD(v2) = (_DWORD)v2 + 1;
  if (v5 == 10)
    return ((_DWORD)v2 - (_DWORD)a1 + 1);
  return 0;
}

uint64_t _scan_tasklist(unsigned __int8 *a1)
{
  unsigned int v1;
  uint64_t v2;
  unsigned __int8 *v3;
  unsigned int v4;
  unsigned __int8 *v5;
  unsigned int v6;
  unsigned int v7;
  BOOL v8;
  unsigned int v9;
  BOOL v10;
  unsigned int v11;
  unsigned int v12;
  char v13;
  char v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v23;
  unsigned int v25;
  unsigned int v26;
  unsigned __int8 *i;
  unsigned int v28;

  v1 = *a1;
  if (v1 > 0x20)
  {
    if (v1 > 0x2C)
    {
      if (v1 != 45)
      {
        if (v1 - 48 >= 0xA)
          return 0;
        v3 = a1 + 1;
        v9 = a1[1];
        if (v9 > 0x1F)
        {
          if ((v9 & 0x80) != 0)
          {
            if ((v9 + 62) >= 0x33u)
              return 0;
          }
          else if (v9 < 0x21)
          {
            goto LABEL_74;
          }
        }
        else
        {
          v10 = v9 == 9;
          if (v9 <= 9)
            goto LABEL_41;
          if (v9 == 10)
            return 0;
          if (v9 < 0xD)
            goto LABEL_74;
        }
LABEL_45:
        if (_scan_tasklist_yybm[v9] < 0)
        {
          do
          {
            v12 = *++v3;
            v9 = v12;
          }
          while (_scan_tasklist_yybm[v12] < 0);
        }
        if (v9 <= 0xC1)
        {
          if (v9 <= 0xC)
          {
            if (v9 >= 9)
            {
              if (v9 != 10)
                goto LABEL_77;
              return 0;
            }
            goto LABEL_74;
          }
          if (v9 != 32)
          {
            if ((v9 & 0x80) != 0)
              return 0;
LABEL_74:
            v21 = *++v3;
            v20 = v21;
            if (v21 != 91)
              goto LABEL_78;
            return 0;
          }
          while (1)
          {
LABEL_77:
            while (1)
            {
              v23 = *++v3;
              v20 = v23;
LABEL_78:
              if (v20 > 0xC)
                break;
              if (v20 != 9 && v20 < 0xB)
                return 0;
            }
            v8 = v20 == 32;
            if (v20 > 0x20)
              break;
LABEL_85:
            if (!v8)
              return 0;
          }
          if (v20 != 91)
            return 0;
          v25 = v3[1];
          if (v25 > 0x57)
          {
            if ((v25 & 0xFFFFFFDF) != 0x58)
              return 0;
          }
          else if (v25 != 32)
          {
            return 0;
          }
          if (v3[2] == 93)
          {
            v26 = v3[3];
            if (v26 > 0xA)
            {
              if (v26 >= 0xD && v26 != 32)
                return 0;
LABEL_98:
              v2 = ((_DWORD)v3 - (_DWORD)a1 + 4);
              for (i = v3 + 4; ; ++i)
              {
                v28 = *i;
                if (v28 > 0xA)
                {
                  if (v28 >= 0xD && v28 != 32)
                    return v2;
                }
                else if (v28 != 9)
                {
                  return v2;
                }
                v2 = (v2 + 1);
              }
            }
            if (v26 == 9)
              goto LABEL_98;
          }
          return 0;
        }
        if (v9 > 0xED)
        {
          if (v9 > 0xF0)
          {
            if (v9 >= 0xF4)
            {
              if (v9 != 244)
                return 0;
              v17 = (char)*++v3;
              if (v17 >= -112)
                return 0;
            }
            else
            {
              v15 = (char)*++v3;
              if (v15 >= -64)
                return 0;
            }
          }
          else if (v9 == 240)
          {
            v14 = *++v3;
            if ((v14 + 112) >= 0x30u)
              return 0;
          }
        }
        else
        {
          if (v9 < 0xE0)
            goto LABEL_73;
          if (v9 == 224)
          {
            v13 = *++v3;
            if ((v13 & 0xE0) != 0xA0)
              return 0;
LABEL_73:
            v19 = (char)*++v3;
            if (v19 < -64)
              goto LABEL_74;
            return 0;
          }
          if (v9 >= 0xED)
          {
            v16 = (char)*++v3;
            if (v16 >= -96)
              return 0;
            goto LABEL_73;
          }
        }
        v18 = (char)*++v3;
        if (v18 >= -64)
          return 0;
        goto LABEL_73;
      }
    }
    else
    {
      v2 = 0;
      if (v1 < 0x2A || v1 == 44)
        return v2;
    }
    v3 = a1 + 1;
    v7 = a1[1];
    if (v7 <= 0xA)
    {
      v8 = v7 == 9;
      goto LABEL_85;
    }
    if (v7 >= 0xD)
    {
      v8 = v7 == 32;
      goto LABEL_85;
    }
    goto LABEL_77;
  }
  if (v1 > 0xA)
  {
    if (v1 - 32 >= 0xFFFFFFED)
      return 0;
  }
  else if (v1 != 9)
  {
    return 0;
  }
  v3 = a1 + 1;
  v4 = a1[1];
  if ((_scan_tasklist_yybm[a1[1]] & 0x40) != 0)
  {
    do
    {
      v6 = *++v3;
      v4 = v6;
    }
    while ((_scan_tasklist_yybm[v6] & 0x40) != 0);
    if (v4 > 0x2C)
    {
      if (v4 == 45)
        goto LABEL_74;
      if (v4 - 48 >= 0xA)
        return 0;
      v5 = v3 - 1;
      goto LABEL_34;
    }
  }
  else if (v4 > 0x2C)
  {
    if (v4 == 45)
      goto LABEL_74;
    v5 = a1;
    if (v4 - 48 >= 0xA)
      return 0;
LABEL_34:
    v11 = v5[2];
    v3 = v5 + 2;
    v9 = v11;
    if (v11 > 0xA)
    {
      if (v9 < 0xD)
        goto LABEL_74;
      v10 = v9 == 32;
    }
    else
    {
      v10 = v9 == 9;
    }
LABEL_41:
    if (v10)
      goto LABEL_74;
    goto LABEL_45;
  }
  v2 = 0;
  if (v4 >= 0x2A && v4 != 44)
    goto LABEL_74;
  return v2;
}

const char *get_type_string_0(uint64_t a1, uint64_t a2)
{
  if (CMARK_NODE_STRIKETHROUGH == *(unsigned __int16 *)(a2 + 100))
    return "strikethrough";
  else
    return "<unknown>";
}

BOOL can_contain_0(uint64_t a1, uint64_t a2, int a3)
{
  return (~a3 & 0xC000) == 0 && CMARK_NODE_STRIKETHROUGH == *(unsigned __int16 *)(a2 + 100);
}

uint64_t commonmark_render_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a2 + 72))(a2, a3, "~~", 0, 0);
}

uint64_t latex_render(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  const char *v5;

  if (a4 == 2)
    v5 = "\\sout{";
  else
    v5 = "}";
  return (*(uint64_t (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a2 + 72))(a2, a3, v5, 0, 0);
}

uint64_t man_render(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  if (a4 == 2)
  {
    (*(void (**)(uint64_t))(a2 + 56))(a2);
    return (*(uint64_t (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a2 + 72))(a2, a3, ".ST \"", 0, 0);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a2 + 72))(a2, a3, "\"", 0, 0);
    return (*(uint64_t (**)(uint64_t))(a2 + 56))(a2);
  }
}

_DWORD *html_render_0(uint64_t a1, _DWORD **a2, uint64_t a3, int a4)
{
  _DWORD *v4;
  char *v5;

  v4 = *a2;
  if (a4 == 2)
    v5 = "<del>";
  else
    v5 = "</del>";
  return cmark_strbuf_puts(v4, v5);
}

uint64_t plaintext_render(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a2 + 72))(a2, a3, "~", 0, 0);
}

uint64_t insert(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, _QWORD *a5)
{
  _QWORD *v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  BOOL v16;

  v5 = a5;
  v8 = a4[2];
  v9 = a5[1];
  if (*(_DWORD *)(v8 + 152) == *(_DWORD *)(a5[2] + 152) && cmark_node_set_type(a4[2], CMARK_NODE_STRIKETHROUGH))
  {
    cmark_node_set_syntax_extension(v8, a1);
    v11 = cmark_node_next(a4[2]);
    if (v11)
    {
      v12 = (_QWORD *)v11;
      do
      {
        if (v12 == (_QWORD *)v5[2])
          break;
        v13 = cmark_node_next((uint64_t)v12);
        cmark_node_append_child((_QWORD *)v8, v12);
        v12 = (_QWORD *)v13;
      }
      while (v13);
    }
    v14 = v5[2];
    *(_DWORD *)(v8 + 92) = *(_DWORD *)(v14 + 84) + *(_DWORD *)(v14 + 152) - 1;
    cmark_node_free((_QWORD *)v14);
  }
  if (v5 != a4)
  {
    do
    {
      v15 = (_QWORD *)*v5;
      cmark_inline_parser_remove_delimiter(a3, v5);
      if (v15)
        v16 = v15 == a4;
      else
        v16 = 1;
      v5 = v15;
    }
    while (!v16);
  }
  cmark_inline_parser_remove_delimiter(a3, a4);
  return v9;
}

uint64_t cmark_iter_reset(uint64_t a1, uint64_t a2, int a3)
{
  *(_DWORD *)(a1 + 32) = a3;
  *(_QWORD *)(a1 + 40) = a2;
  return cmark_iter_next(a1);
}

uint64_t cmark_iter_get_event_type(uint64_t a1)
{
  return *(unsigned int *)(a1 + 16);
}

uint64_t cmark_iter_get_root(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8);
}

_QWORD *cmark_node_own(_QWORD *result)
{
  _QWORD *v1;
  uint64_t (**v2)(uint64_t, uint64_t);
  uint64_t v3;
  int i;
  uint64_t v5;
  _DWORD *v6;
  _BYTE *v7;
  _BYTE *v8;
  size_t v9;
  _BYTE *v10;
  _BYTE *v11;
  size_t v12;
  _BYTE *v13;
  _BYTE *v14;
  size_t v15;

  if (result)
  {
    v1 = result;
    v2 = (uint64_t (**)(uint64_t, uint64_t))*result;
    v3 = (*(uint64_t (**)(uint64_t, uint64_t))*result)(1, 48);
    *(_QWORD *)v3 = v2;
    *(_QWORD *)(v3 + 8) = v1;
    *(_DWORD *)(v3 + 16) = 0;
    *(_QWORD *)(v3 + 24) = 0;
    *(_DWORD *)(v3 + 32) = 2;
    *(_QWORD *)(v3 + 40) = v1;
    for (i = cmark_iter_next(v3); i != 1; i = cmark_iter_next(v3))
    {
      if (i == 2)
      {
        v5 = *(_QWORD *)(v3 + 24);
        switch(*(_WORD *)(v5 + 100))
        {
          case 0xC001:
          case 0xC004:
          case 0xC005:
            goto LABEL_5;
          case 0xC002:
          case 0xC003:
          case 0xC007:
          case 0xC008:
            continue;
          case 0xC006:
          case 0xC009:
            if (!*(_DWORD *)(v5 + 156))
            {
              v10 = (_BYTE *)(**(uint64_t (***)(uint64_t, uint64_t))v3)(*(int *)(v5 + 152) + 1, 1);
              v11 = v10;
              v12 = *(unsigned int *)(v5 + 152);
              if ((int)v12 >= 1)
              {
                memcpy(v10, *(const void **)(v5 + 144), v12);
                LODWORD(v12) = *(_DWORD *)(v5 + 152);
              }
              v11[(int)v12] = 0;
              *(_QWORD *)(v5 + 144) = v11;
              *(_DWORD *)(v5 + 156) = 1;
            }
            v6 = (_DWORD *)(v5 + 172);
            if (*(_DWORD *)(v5 + 172))
              continue;
            v13 = (_BYTE *)(**(uint64_t (***)(uint64_t, uint64_t))v3)(*(int *)(v5 + 168) + 1, 1);
            v14 = v13;
            v15 = *(unsigned int *)(v5 + 168);
            if ((int)v15 >= 1)
            {
              memcpy(v13, *(const void **)(v5 + 160), v15);
              LODWORD(v15) = *(_DWORD *)(v5 + 168);
            }
            v14[(int)v15] = 0;
            *(_QWORD *)(v5 + 160) = v14;
            goto LABEL_17;
          default:
            if (*(unsigned __int16 *)(v5 + 100) != 32774)
              continue;
LABEL_5:
            v6 = (_DWORD *)(v5 + 156);
            if (*(_DWORD *)(v5 + 156))
              continue;
            v7 = (_BYTE *)(**(uint64_t (***)(uint64_t, uint64_t))v3)(*(int *)(v5 + 152) + 1, 1);
            v8 = v7;
            v9 = *(unsigned int *)(v5 + 152);
            if ((int)v9 >= 1)
            {
              memcpy(v7, *(const void **)(v5 + 144), v9);
              LODWORD(v9) = *(_DWORD *)(v5 + 152);
            }
            v8[(int)v9] = 0;
            *(_QWORD *)(v5 + 144) = v8;
LABEL_17:
            *v6 = 1;
            break;
        }
      }
    }
    return (_QWORD *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 16))(v3);
  }
  return result;
}

uint64_t cmark_render_latex(uint64_t *a1, uint64_t a2, int a3)
{
  return cmark_render(*a1, (uint64_t)a1, a2, a3, (uint64_t)outc_0, (unsigned int (*)(uint64_t *, uint64_t, uint64_t, uint64_t))S_render_node_1);
}

uint64_t cmark_render_latex_with_mem(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return cmark_render(a4, a1, a2, a3, (uint64_t)outc_0, (unsigned int (*)(uint64_t *, uint64_t, uint64_t, uint64_t))S_render_node_1);
}

_DWORD *outc_0(uint64_t a1, uint64_t a2, int a3, signed int a4, int a5)
{
  uint64_t v6;
  char *v7;
  unsigned int v8;

  v6 = a1;
  if (!a3)
  {
LABEL_19:
    a1 = v6;
    v8 = a4;
    return cmark_render_code_point(a1, v8);
  }
  if (a4 > 122)
  {
    if (a4 <= 8210)
    {
      switch(a4)
      {
        case '{':
        case '}':
LABEL_18:
          cmark_render_ascii(a1, "\\");
          goto LABEL_19;
        case '|':
          v7 = "\\textbar{}";
          return cmark_render_ascii(v6, v7);
        case '~':
          if (a3 == 1)
          {
            v7 = "\\textasciitilde{}";
            return cmark_render_ascii(v6, v7);
          }
          v8 = 126;
          break;
        default:
          if (a4 != 160)
            goto LABEL_19;
          v7 = "~";
          return cmark_render_ascii(v6, v7);
      }
    }
    else
    {
      switch(a4)
      {
        case 8211:
          if (a3 == 1)
          {
            v7 = "--";
            return cmark_render_ascii(v6, v7);
          }
          v8 = 8211;
          return cmark_render_code_point(a1, v8);
        case 8212:
          if (a3 == 1)
          {
            v7 = "---";
            return cmark_render_ascii(v6, v7);
          }
          v8 = 8212;
          return cmark_render_code_point(a1, v8);
        case 8213:
        case 8214:
        case 8215:
        case 8218:
        case 8219:
          goto LABEL_19;
        case 8216:
          if (a3 == 1)
          {
            return cmark_render_ascii(v6, v7);
          }
          v8 = 8216;
          return cmark_render_code_point(a1, v8);
        case 8217:
          if (a3 == 1)
          {
            v7 = "'";
            return cmark_render_ascii(v6, v7);
          }
          v8 = 8217;
          return cmark_render_code_point(a1, v8);
        case 8220:
          if (a3 == 1)
          {
            return cmark_render_ascii(v6, v7);
          }
          v8 = 8220;
          return cmark_render_code_point(a1, v8);
        case 8221:
          if (a3 == 1)
          {
            v7 = "''";
            return cmark_render_ascii(v6, v7);
          }
          v8 = 8221;
          break;
        default:
          if (a4 != 8230)
            goto LABEL_19;
          v7 = "\\ldots{}";
          return cmark_render_ascii(v6, v7);
      }
    }
    return cmark_render_code_point(a1, v8);
  }
  if (a4 <= 59)
  {
    switch(a4)
    {
      case '"':
        v7 = "\\textquotedbl{}";
        return cmark_render_ascii(v6, v7);
      case '#':
      case '%':
      case '&':
        goto LABEL_18;
      case '$':
        goto LABEL_17;
      case '\'':
        v7 = "\\textquotesingle{}";
        return cmark_render_ascii(v6, v7);
      case '-':
        if (a5 == 45)
          v7 = "-{}";
        else
          v7 = "-";
        return cmark_render_ascii(v6, v7);
      default:
        goto LABEL_19;
    }
  }
  switch(a4)
  {
    case '[':
    case ']':
      cmark_render_ascii(a1, "{");
      cmark_render_code_point(v6, a4);
      v7 = "}";
      return cmark_render_ascii(v6, v7);
    case '\\':
      if (a3 == 3)
        v7 = "/";
      else
        v7 = "\\textbackslash{}";
      return cmark_render_ascii(v6, v7);
    case '^':
      v7 = "\\^{}";
      return cmark_render_ascii(v6, v7);
    case '_':
LABEL_17:
      if (a3 == 1)
        goto LABEL_18;
      goto LABEL_19;
    default:
      if (a4 == 60)
      {
        v7 = "\\textless{}";
      }
      else
      {
        if (a4 != 62)
          goto LABEL_19;
        v7 = "\\textgreater{}";
      }
      break;
  }
  return cmark_render_ascii(v6, v7);
}

uint64_t S_render_node_1(uint64_t a1, uint64_t a2, int a3, char a4)
{
  int v7;
  _BOOL8 v8;
  uint64_t v9;
  void (*v10)(void);
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, _BYTE *, _BOOL8, uint64_t);
  _BYTE *literal;
  void (*v14)(uint64_t, uint64_t, const char *, _QWORD, _QWORD);
  const char *v15;
  void (*v16)(uint64_t, uint64_t, _BYTE *, _QWORD, uint64_t);
  _BYTE *v17;
  void (*v18)(uint64_t, uint64_t, _BYTE *, _QWORD, _QWORD);
  _BYTE *v19;
  void (*v20)(uint64_t, uint64_t, const char *, _QWORD, _QWORD);
  const char *v21;
  uint64_t v22;
  _BYTE *url;
  void (*v24)(uint64_t, uint64_t, _BYTE *, _QWORD, uint64_t);
  _BYTE *v25;
  int list_type;
  void (*v27)(uint64_t, uint64_t, const char *, _QWORD, _QWORD);
  const char *v28;
  int list_start;
  int v30;
  int enumlevel;
  int v32;
  const char *v33;
  void (*v34)(uint64_t, uint64_t, _BYTE *, _QWORD, _QWORD);
  _BYTE *v35;
  void (*v36)(uint64_t, uint64_t, _BYTE *, _QWORD, _QWORD);
  _BYTE *v37;
  unsigned int v38;
  const char *v39;
  char __str[20];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v7 = *(_DWORD *)(a1 + 28);
  v8 = v7 > 0 && (a4 & 0x10) == 0;
  v9 = *(_QWORD *)(a2 + 112);
  if (v9 && (v10 = *(void (**)(void))(v9 + 112)) != 0)
  {
    v10();
    return 1;
  }
  else
  {
    v11 = 1;
    switch(*(_WORD *)(a2 + 100))
    {
      case 0xC001:
        v12 = *(void (**)(uint64_t, uint64_t, _BYTE *, _BOOL8, uint64_t))(a1 + 72);
        literal = cmark_node_get_literal(a2);
        v12(a1, a2, literal, v8, 1);
        return v11;
      case 0xC002:
        if ((a4 & 4) != 0)
          goto LABEL_16;
        if (!(v7 | a4 & 0x10))
          goto LABEL_46;
        (*(void (**)(uint64_t, uint64_t, const char *, _BOOL8, uint64_t))(a1 + 72))(a1, a2, " ", v8, 1);
        return v11;
      case 0xC003:
LABEL_16:
        v14 = *(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72);
        v15 = "\\\\";
LABEL_17:
        v14(a1, a2, v15, 0, 0);
LABEL_46:
        (*(void (**)(uint64_t))(a1 + 56))(a1);
        return v11;
      case 0xC004:
        (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72))(a1, a2, "\\texttt{", 0, 0);
        v16 = *(void (**)(uint64_t, uint64_t, _BYTE *, _QWORD, uint64_t))(a1 + 72);
        v17 = cmark_node_get_literal(a2);
        v16(a1, a2, v17, 0, 1);
        goto LABEL_30;
      case 0xC005:
      case 0xC00B:
      case 0xC00C:
        return v11;
      case 0xC006:
        v18 = *(void (**)(uint64_t, uint64_t, _BYTE *, _QWORD, _QWORD))(a1 + 72);
        if (a3 == 2)
          v19 = cmark_node_get_on_enter(a2);
        else
          v19 = cmark_node_get_on_exit(a2);
        v18(a1, a2, v19, 0, 0);
        return 1;
      case 0xC007:
        v20 = *(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72);
        if (a3 != 2)
          goto LABEL_31;
        v21 = "\\emph{";
        goto LABEL_32;
      case 0xC008:
        v22 = *(_QWORD *)(a2 + 40);
        if (v22 && *(unsigned __int16 *)(v22 + 100) == 49160)
          return v11;
        v20 = *(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72);
        if (a3 != 2)
          goto LABEL_31;
        v21 = "\\textbf{";
        goto LABEL_32;
      case 0xC009:
        if (a3 == 2)
        {
          url = cmark_node_get_url(a2);
          switch(get_link_type(a2))
          {
            case 0u:
              (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72))(a1, a2, "{", 0, 0);
              return 1;
            case 1u:
              (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72))(a1, a2, "\\url{", 0, 0);
              (*(void (**)(uint64_t, uint64_t, _BYTE *, _QWORD, uint64_t))(a1 + 72))(a1, a2, url, 0, 3);
              goto LABEL_35;
            case 2u:
              (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72))(a1, a2, "\\href{", 0, 0);
              (*(void (**)(uint64_t, uint64_t, _BYTE *, _QWORD, uint64_t))(a1 + 72))(a1, a2, url, 0, 3);
              (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72))(a1, a2, "}\\nolinkurl{", 0, 0);
              return 1;
            case 3u:
              (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72))(a1, a2, "\\href{", 0, 0);
              (*(void (**)(uint64_t, uint64_t, _BYTE *, _QWORD, uint64_t))(a1 + 72))(a1, a2, url, 0, 3);
              break;
            case 4u:
              (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72))(a1, a2, "\\protect\\hyperlink{", 0, 0);
              (*(void (**)(uint64_t, uint64_t, _BYTE *, _QWORD, uint64_t))(a1 + 72))(a1, a2, url + 1, 0, 3);
              break;
            default:
              return 1;
          }
          (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72))(a1, a2, "}{", 0, 0);
          return 1;
        }
LABEL_30:
        v20 = *(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72);
LABEL_31:
        v21 = "}";
LABEL_32:
        v20(a1, a2, v21, 0, 0);
        break;
      case 0xC00A:
        if (a3 == 2)
        {
          (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72))(a1, a2, "\\protect\\includegraphics{", 0, 0);
          v24 = *(void (**)(uint64_t, uint64_t, _BYTE *, _QWORD, uint64_t))(a1 + 72);
          v25 = cmark_node_get_url(a2);
          v24(a1, a2, v25, 0, 3);
LABEL_35:
          (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72))(a1, a2, "}", 0, 0);
          return 0;
        }
        return v11;
      default:
        switch(*(_WORD *)(a2 + 100))
        {
          case 0x8001:
          case 0x8006:
          case 0x800B:
            return v11;
          case 0x8002:
            v14 = *(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72);
            if (a3 == 2)
            {
              v15 = "\\begin{quote}";
              goto LABEL_17;
            }
            v39 = "\\end{quote}";
            goto LABEL_66;
          case 0x8003:
            list_type = cmark_node_get_list_type(a2);
            v27 = *(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72);
            if (list_type == 2)
              v28 = "enumerate";
            else
              v28 = "itemize";
            if (a3 == 2)
            {
              v27(a1, a2, "\\begin{", 0, 0);
              (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72))(a1, a2, v28, 0, 0);
              (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72))(a1, a2, "}", 0, 0);
              (*(void (**)(uint64_t))(a1 + 56))(a1);
              list_start = cmark_node_get_list_start(a2);
              if (list_start >= 2)
              {
                v30 = list_start;
                enumlevel = S_get_enumlevel(a2);
                if ((enumlevel - 1) <= 4)
                {
                  v32 = enumlevel;
                  snprintf(__str, 0x14uLL, "%d", v30);
                  (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72))(a1, a2, "\\setcounter{enum", 0, 0);
                  if ((v32 - 2) > 3)
                    v33 = "i";
                  else
                    v33 = off_24CB965D8[v32 - 2];
                  (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72))(a1, a2, v33, 0, 0);
                  (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72))(a1, a2, "}{", 0, 0);
                  (*(void (**)(uint64_t, uint64_t, char *, _QWORD, uint64_t))(a1 + 72))(a1, a2, __str, 0, 1);
                  (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72))(a1, a2, "}", 0, 0);
                }
LABEL_64:
                (*(void (**)(uint64_t))(a1 + 56))(a1);
              }
            }
            else
            {
              v27(a1, a2, "\\end{", 0, 0);
              (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72))(a1, a2, v28, 0, 0);
              (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72))(a1, a2, "}", 0, 0);
LABEL_61:
              (*(void (**)(uint64_t))(a1 + 64))(a1);
            }
            return 1;
          case 0x8004:
            if (a3 != 2)
              goto LABEL_46;
            v20 = *(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72);
            v21 = "\\item ";
            goto LABEL_32;
          case 0x8005:
            (*(void (**)(uint64_t))(a1 + 56))(a1);
            (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72))(a1, a2, "\\begin{verbatim}", 0, 0);
            (*(void (**)(uint64_t))(a1 + 56))(a1);
            v34 = *(void (**)(uint64_t, uint64_t, _BYTE *, _QWORD, _QWORD))(a1 + 72);
            v35 = cmark_node_get_literal(a2);
            v34(a1, a2, v35, 0, 0);
            (*(void (**)(uint64_t))(a1 + 56))(a1);
            (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72))(a1, a2, "\\end{verbatim}", 0, 0);
            goto LABEL_61;
          case 0x8007:
            (*(void (**)(uint64_t))(a1 + 56))(a1);
            v36 = *(void (**)(uint64_t, uint64_t, _BYTE *, _QWORD, _QWORD))(a1 + 72);
            if (a3 == 2)
              v37 = cmark_node_get_on_enter(a2);
            else
              v37 = cmark_node_get_on_exit(a2);
            v36(a1, a2, v37, 0, 0);
            goto LABEL_64;
          case 0x8008:
            if (a3 == 2)
              return v11;
            goto LABEL_67;
          case 0x8009:
            if (a3 == 2)
            {
              v38 = cmark_node_get_heading_level(a2) - 1;
              if (v38 <= 4)
                (*(void (**)(uint64_t, uint64_t, char *, _QWORD, _QWORD))(a1 + 72))(a1, a2, off_24CB965F8[v38], 0, 0);
              v20 = *(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72);
              v21 = "{";
              goto LABEL_32;
            }
            v14 = *(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72);
            v39 = "}";
LABEL_66:
            v14(a1, a2, v39, 0, 0);
LABEL_67:
            (*(void (**)(uint64_t))(a1 + 64))(a1);
            break;
          case 0x800A:
            (*(void (**)(uint64_t))(a1 + 64))(a1);
            (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72))(a1, a2, "\\begin{center}\\rule{0.5\\linewidth}{\\linethickness}\\end{center}", 0, 0);
            goto LABEL_67;
          default:
            S_render_node_cold_1_1();
        }
        return v11;
    }
  }
  return v11;
}

uint64_t S_get_enumlevel(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  if (!a1)
    return 0;
  v2 = 0;
  v3 = a1;
  do
  {
    if (*(unsigned __int16 *)(v3 + 100) == 32771)
    {
      if (cmark_node_get_list_type(a1) == 2)
        v2 = (v2 + 1);
      else
        v2 = v2;
    }
    v3 = *(_QWORD *)(v3 + 40);
  }
  while (v3);
  return v2;
}

uint64_t get_link_type(uint64_t a1)
{
  const char *url;
  const char *v3;
  uint64_t v4;
  size_t v5;
  int v6;
  uint64_t v7;
  int v8;
  int v9;
  BOOL v10;
  uint64_t v11;
  const char *v12;
  unsigned int v13;
  const char *v15;
  uint64_t v16;

  if (*(unsigned __int16 *)(a1 + 100) != 49161)
    return 0;
  url = cmark_node_get_url(a1);
  v3 = url;
  if (url)
  {
    v15 = url;
    v16 = strlen(url);
    if (*v3 == 35)
      return 4;
  }
  else
  {
    v15 = 0;
    v16 = 0;
  }
  v5 = strlen(v3);
  if (!v5)
    return 0;
  v6 = v5;
  if (!_scan_at((uint64_t (*)(uint64_t))_scan_scheme, (uint64_t *)&v15, 0))
    return 0;
  if (*cmark_node_get_title(a1))
    return 3;
  v7 = *(_QWORD *)(a1 + 48);
  cmark_consolidate_text_nodes((_QWORD *)v7);
  if (!v7)
    return 0;
  v8 = strncmp(v3, "mailto:", 7uLL);
  v9 = v6 - 7;
  if (v8)
    v9 = v6;
  v4 = 3;
  if (v9 == *(_DWORD *)(v7 + 152))
  {
    v10 = v8 == 0;
    v11 = 7;
    if (v8)
      v11 = 0;
    v12 = &v3[v11];
    if (v10)
      v13 = 2;
    else
      v13 = 1;
    if (!strncmp(v12, *(const char **)(v7 + 144), v9))
      return v13;
    else
      return 3;
  }
  return v4;
}

uint64_t _scan_scheme(unsigned __int8 *a1)
{
  unsigned int v1;
  unsigned int v3;
  uint64_t v4;
  int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  unsigned int v32;
  unsigned int v33;
  unsigned int v34;
  unsigned int v35;

  v1 = *a1;
  if (v1 < 0x41)
    return 0;
  if (v1 >= 0x5B && v1 - 97 > 0x19)
    return 0;
  v3 = a1[1];
  if (v3 > 0x2F)
  {
    if (v3 > 0x5A)
    {
      if (v3 - 123 < 0xFFFFFFE6)
        return 0;
    }
    else if (v3 - 58 < 7)
    {
      return 0;
    }
LABEL_17:
    v5 = (_DWORD)a1 + 2;
    v6 = a1[2];
    if (v6 > 0x39)
    {
      if (v6 > 0x5A)
      {
        if (v6 - 97 > 0x19)
          return 0;
      }
      else
      {
        if (v6 < 0x3B)
          return (v5 - (_DWORD)a1 + 1);
        if (v6 <= 0x40)
          return 0;
      }
    }
    else if (v6 > 0x2C)
    {
      if (v6 == 47)
        return 0;
    }
    else if (v6 != 43)
    {
      return 0;
    }
    v5 = (_DWORD)a1 + 3;
    v7 = a1[3];
    if (v7 > 0x39)
    {
      if (v7 > 0x5A)
      {
        if (v7 - 97 >= 0x1A)
          return 0;
      }
      else
      {
        if (v7 < 0x3B)
          return (v5 - (_DWORD)a1 + 1);
        if (v7 < 0x41)
          return 0;
      }
    }
    else if (v7 > 0x2C)
    {
      if (v7 == 47)
        return 0;
    }
    else if (v7 != 43)
    {
      return 0;
    }
    v5 = (_DWORD)a1 + 4;
    v8 = a1[4];
    if (v8 > 0x39)
    {
      if (v8 > 0x5A)
      {
        if (v8 - 123 < 0xFFFFFFE6)
          return 0;
      }
      else
      {
        if (v8 < 0x3B)
          return (v5 - (_DWORD)a1 + 1);
        if (v8 < 0x41)
          return 0;
      }
    }
    else if (v8 > 0x2C)
    {
      if (v8 == 47)
        return 0;
    }
    else if (v8 != 43)
    {
      return 0;
    }
    v5 = (_DWORD)a1 + 5;
    v9 = a1[5];
    if (v9 > 0x39)
    {
      if (v9 > 0x5A)
      {
        if (v9 - 123 < 0xFFFFFFE6)
          return 0;
      }
      else
      {
        if (v9 < 0x3B)
          return (v5 - (_DWORD)a1 + 1);
        if (v9 < 0x41)
          return 0;
      }
    }
    else if (v9 > 0x2C)
    {
      if (v9 == 47)
        return 0;
    }
    else if (v9 != 43)
    {
      return 0;
    }
    v5 = (_DWORD)a1 + 6;
    v10 = a1[6];
    if (v10 > 0x39)
    {
      if (v10 > 0x5A)
      {
        if (v10 - 123 < 0xFFFFFFE6)
          return 0;
      }
      else
      {
        if (v10 < 0x3B)
          return (v5 - (_DWORD)a1 + 1);
        if (v10 < 0x41)
          return 0;
      }
    }
    else if (v10 > 0x2C)
    {
      if (v10 == 47)
        return 0;
    }
    else if (v10 != 43)
    {
      return 0;
    }
    v5 = (_DWORD)a1 + 7;
    v11 = a1[7];
    if (v11 > 0x39)
    {
      if (v11 > 0x5A)
      {
        if (v11 - 123 < 0xFFFFFFE6)
          return 0;
      }
      else
      {
        if (v11 < 0x3B)
          return (v5 - (_DWORD)a1 + 1);
        if (v11 < 0x41)
          return 0;
      }
    }
    else if (v11 > 0x2C)
    {
      if (v11 == 47)
        return 0;
    }
    else if (v11 != 43)
    {
      return 0;
    }
    v5 = (_DWORD)a1 + 8;
    v12 = a1[8];
    if (v12 > 0x39)
    {
      if (v12 > 0x5A)
      {
        if (v12 - 123 < 0xFFFFFFE6)
          return 0;
      }
      else
      {
        if (v12 < 0x3B)
          return (v5 - (_DWORD)a1 + 1);
        if (v12 < 0x41)
          return 0;
      }
    }
    else if (v12 > 0x2C)
    {
      if (v12 == 47)
        return 0;
    }
    else if (v12 != 43)
    {
      return 0;
    }
    v5 = (_DWORD)a1 + 9;
    v13 = a1[9];
    if (v13 > 0x39)
    {
      if (v13 > 0x5A)
      {
        if (v13 - 123 < 0xFFFFFFE6)
          return 0;
      }
      else
      {
        if (v13 < 0x3B)
          return (v5 - (_DWORD)a1 + 1);
        if (v13 < 0x41)
          return 0;
      }
    }
    else if (v13 > 0x2C)
    {
      if (v13 == 47)
        return 0;
    }
    else if (v13 != 43)
    {
      return 0;
    }
    v5 = (_DWORD)a1 + 10;
    v14 = a1[10];
    if (v14 > 0x39)
    {
      if (v14 > 0x5A)
      {
        if (v14 - 123 < 0xFFFFFFE6)
          return 0;
      }
      else
      {
        if (v14 < 0x3B)
          return (v5 - (_DWORD)a1 + 1);
        if (v14 < 0x41)
          return 0;
      }
    }
    else if (v14 > 0x2C)
    {
      if (v14 == 47)
        return 0;
    }
    else if (v14 != 43)
    {
      return 0;
    }
    v5 = (_DWORD)a1 + 11;
    v15 = a1[11];
    if (v15 > 0x39)
    {
      if (v15 > 0x5A)
      {
        if (v15 - 123 < 0xFFFFFFE6)
          return 0;
      }
      else
      {
        if (v15 < 0x3B)
          return (v5 - (_DWORD)a1 + 1);
        if (v15 < 0x41)
          return 0;
      }
    }
    else if (v15 > 0x2C)
    {
      if (v15 == 47)
        return 0;
    }
    else if (v15 != 43)
    {
      return 0;
    }
    v5 = (_DWORD)a1 + 12;
    v16 = a1[12];
    if (v16 > 0x39)
    {
      if (v16 > 0x5A)
      {
        if (v16 - 123 < 0xFFFFFFE6)
          return 0;
      }
      else
      {
        if (v16 < 0x3B)
          return (v5 - (_DWORD)a1 + 1);
        if (v16 < 0x41)
          return 0;
      }
    }
    else if (v16 > 0x2C)
    {
      if (v16 == 47)
        return 0;
    }
    else if (v16 != 43)
    {
      return 0;
    }
    v5 = (_DWORD)a1 + 13;
    v17 = a1[13];
    if (v17 > 0x39)
    {
      if (v17 > 0x5A)
      {
        if (v17 - 123 < 0xFFFFFFE6)
          return 0;
      }
      else
      {
        if (v17 < 0x3B)
          return (v5 - (_DWORD)a1 + 1);
        if (v17 < 0x41)
          return 0;
      }
    }
    else if (v17 > 0x2C)
    {
      if (v17 == 47)
        return 0;
    }
    else if (v17 != 43)
    {
      return 0;
    }
    v5 = (_DWORD)a1 + 14;
    v18 = a1[14];
    if (v18 > 0x39)
    {
      if (v18 > 0x5A)
      {
        if (v18 - 123 < 0xFFFFFFE6)
          return 0;
      }
      else
      {
        if (v18 < 0x3B)
          return (v5 - (_DWORD)a1 + 1);
        if (v18 < 0x41)
          return 0;
      }
    }
    else if (v18 > 0x2C)
    {
      if (v18 == 47)
        return 0;
    }
    else if (v18 != 43)
    {
      return 0;
    }
    v5 = (_DWORD)a1 + 15;
    v19 = a1[15];
    if (v19 > 0x39)
    {
      if (v19 > 0x5A)
      {
        if (v19 - 123 < 0xFFFFFFE6)
          return 0;
      }
      else
      {
        if (v19 < 0x3B)
          return (v5 - (_DWORD)a1 + 1);
        if (v19 < 0x41)
          return 0;
      }
    }
    else if (v19 > 0x2C)
    {
      if (v19 == 47)
        return 0;
    }
    else if (v19 != 43)
    {
      return 0;
    }
    v5 = (_DWORD)a1 + 16;
    v20 = a1[16];
    if (v20 > 0x39)
    {
      if (v20 > 0x5A)
      {
        if (v20 - 123 < 0xFFFFFFE6)
          return 0;
      }
      else
      {
        if (v20 < 0x3B)
          return (v5 - (_DWORD)a1 + 1);
        if (v20 < 0x41)
          return 0;
      }
    }
    else if (v20 > 0x2C)
    {
      if (v20 == 47)
        return 0;
    }
    else if (v20 != 43)
    {
      return 0;
    }
    v5 = (_DWORD)a1 + 17;
    v21 = a1[17];
    if (v21 > 0x39)
    {
      if (v21 > 0x5A)
      {
        if (v21 - 123 < 0xFFFFFFE6)
          return 0;
      }
      else
      {
        if (v21 < 0x3B)
          return (v5 - (_DWORD)a1 + 1);
        if (v21 < 0x41)
          return 0;
      }
    }
    else if (v21 > 0x2C)
    {
      if (v21 == 47)
        return 0;
    }
    else if (v21 != 43)
    {
      return 0;
    }
    v5 = (_DWORD)a1 + 18;
    v22 = a1[18];
    if (v22 > 0x39)
    {
      if (v22 > 0x5A)
      {
        if (v22 - 123 < 0xFFFFFFE6)
          return 0;
      }
      else
      {
        if (v22 < 0x3B)
          return (v5 - (_DWORD)a1 + 1);
        if (v22 < 0x41)
          return 0;
      }
    }
    else if (v22 > 0x2C)
    {
      if (v22 == 47)
        return 0;
    }
    else if (v22 != 43)
    {
      return 0;
    }
    v5 = (_DWORD)a1 + 19;
    v23 = a1[19];
    if (v23 > 0x39)
    {
      if (v23 > 0x5A)
      {
        if (v23 - 123 < 0xFFFFFFE6)
          return 0;
      }
      else
      {
        if (v23 < 0x3B)
          return (v5 - (_DWORD)a1 + 1);
        if (v23 < 0x41)
          return 0;
      }
    }
    else if (v23 > 0x2C)
    {
      if (v23 == 47)
        return 0;
    }
    else if (v23 != 43)
    {
      return 0;
    }
    v5 = (_DWORD)a1 + 20;
    v24 = a1[20];
    if (v24 > 0x39)
    {
      if (v24 > 0x5A)
      {
        if (v24 - 123 < 0xFFFFFFE6)
          return 0;
      }
      else
      {
        if (v24 < 0x3B)
          return (v5 - (_DWORD)a1 + 1);
        if (v24 < 0x41)
          return 0;
      }
    }
    else if (v24 > 0x2C)
    {
      if (v24 == 47)
        return 0;
    }
    else if (v24 != 43)
    {
      return 0;
    }
    v5 = (_DWORD)a1 + 21;
    v25 = a1[21];
    if (v25 > 0x39)
    {
      if (v25 > 0x5A)
      {
        if (v25 - 123 < 0xFFFFFFE6)
          return 0;
      }
      else
      {
        if (v25 < 0x3B)
          return (v5 - (_DWORD)a1 + 1);
        if (v25 < 0x41)
          return 0;
      }
    }
    else if (v25 > 0x2C)
    {
      if (v25 == 47)
        return 0;
    }
    else if (v25 != 43)
    {
      return 0;
    }
    v5 = (_DWORD)a1 + 22;
    v26 = a1[22];
    if (v26 > 0x39)
    {
      if (v26 > 0x5A)
      {
        if (v26 - 123 < 0xFFFFFFE6)
          return 0;
      }
      else
      {
        if (v26 < 0x3B)
          return (v5 - (_DWORD)a1 + 1);
        if (v26 < 0x41)
          return 0;
      }
    }
    else if (v26 > 0x2C)
    {
      if (v26 == 47)
        return 0;
    }
    else if (v26 != 43)
    {
      return 0;
    }
    v5 = (_DWORD)a1 + 23;
    v27 = a1[23];
    if (v27 > 0x39)
    {
      if (v27 > 0x5A)
      {
        if (v27 - 123 < 0xFFFFFFE6)
          return 0;
      }
      else
      {
        if (v27 < 0x3B)
          return (v5 - (_DWORD)a1 + 1);
        if (v27 < 0x41)
          return 0;
      }
    }
    else if (v27 > 0x2C)
    {
      if (v27 == 47)
        return 0;
    }
    else if (v27 != 43)
    {
      return 0;
    }
    v5 = (_DWORD)a1 + 24;
    v28 = a1[24];
    if (v28 > 0x39)
    {
      if (v28 > 0x5A)
      {
        if (v28 - 123 < 0xFFFFFFE6)
          return 0;
      }
      else
      {
        if (v28 < 0x3B)
          return (v5 - (_DWORD)a1 + 1);
        if (v28 < 0x41)
          return 0;
      }
    }
    else if (v28 > 0x2C)
    {
      if (v28 == 47)
        return 0;
    }
    else if (v28 != 43)
    {
      return 0;
    }
    v5 = (_DWORD)a1 + 25;
    v29 = a1[25];
    if (v29 > 0x39)
    {
      if (v29 > 0x5A)
      {
        if (v29 - 123 < 0xFFFFFFE6)
          return 0;
      }
      else
      {
        if (v29 < 0x3B)
          return (v5 - (_DWORD)a1 + 1);
        if (v29 < 0x41)
          return 0;
      }
    }
    else if (v29 > 0x2C)
    {
      if (v29 == 47)
        return 0;
    }
    else if (v29 != 43)
    {
      return 0;
    }
    v5 = (_DWORD)a1 + 26;
    v30 = a1[26];
    if (v30 > 0x39)
    {
      if (v30 > 0x5A)
      {
        if (v30 - 123 < 0xFFFFFFE6)
          return 0;
      }
      else
      {
        if (v30 < 0x3B)
          return (v5 - (_DWORD)a1 + 1);
        if (v30 < 0x41)
          return 0;
      }
    }
    else if (v30 > 0x2C)
    {
      if (v30 == 47)
        return 0;
    }
    else if (v30 != 43)
    {
      return 0;
    }
    v5 = (_DWORD)a1 + 27;
    v31 = a1[27];
    if (v31 > 0x39)
    {
      if (v31 > 0x5A)
      {
        if (v31 - 123 < 0xFFFFFFE6)
          return 0;
      }
      else
      {
        if (v31 < 0x3B)
          return (v5 - (_DWORD)a1 + 1);
        if (v31 < 0x41)
          return 0;
      }
    }
    else if (v31 > 0x2C)
    {
      if (v31 == 47)
        return 0;
    }
    else if (v31 != 43)
    {
      return 0;
    }
    v5 = (_DWORD)a1 + 28;
    v32 = a1[28];
    if (v32 > 0x39)
    {
      if (v32 > 0x5A)
      {
        if (v32 - 123 < 0xFFFFFFE6)
          return 0;
      }
      else
      {
        if (v32 < 0x3B)
          return (v5 - (_DWORD)a1 + 1);
        if (v32 < 0x41)
          return 0;
      }
    }
    else if (v32 > 0x2C)
    {
      if (v32 == 47)
        return 0;
    }
    else if (v32 != 43)
    {
      return 0;
    }
    v5 = (_DWORD)a1 + 29;
    v33 = a1[29];
    if (v33 > 0x39)
    {
      if (v33 > 0x5A)
      {
        if (v33 - 123 < 0xFFFFFFE6)
          return 0;
      }
      else
      {
        if (v33 < 0x3B)
          return (v5 - (_DWORD)a1 + 1);
        if (v33 < 0x41)
          return 0;
      }
    }
    else if (v33 > 0x2C)
    {
      if (v33 == 47)
        return 0;
    }
    else if (v33 != 43)
    {
      return 0;
    }
    v5 = (_DWORD)a1 + 30;
    v34 = a1[30];
    if (v34 > 0x39)
    {
      if (v34 > 0x5A)
      {
        if (v34 - 123 < 0xFFFFFFE6)
          return 0;
      }
      else
      {
        if (v34 < 0x3B)
          return (v5 - (_DWORD)a1 + 1);
        if (v34 < 0x41)
          return 0;
      }
    }
    else if (v34 > 0x2C)
    {
      if (v34 == 47)
        return 0;
    }
    else if (v34 != 43)
    {
      return 0;
    }
    v5 = (_DWORD)a1 + 31;
    v35 = a1[31];
    if (v35 <= 0x39)
    {
      if (v35 > 0x2C)
      {
        if (v35 == 47)
          return 0;
      }
      else if (v35 != 43)
      {
        return 0;
      }
LABEL_347:
      v5 = (_DWORD)a1 + 32;
      if (a1[32] == 58)
        return (v5 - (_DWORD)a1 + 1);
      return 0;
    }
    if (v35 > 0x5A)
    {
      if (v35 - 123 < 0xFFFFFFE6)
        return 0;
      goto LABEL_347;
    }
    if (v35 >= 0x3B)
    {
      if (v35 < 0x41)
        return 0;
      goto LABEL_347;
    }
    return (v5 - (_DWORD)a1 + 1);
  }
  if (v3 <= 0x2B)
  {
    if (v3 != 43)
      return 0;
    goto LABEL_17;
  }
  v4 = 0;
  if (v3 != 44 && v3 <= 0x2E)
    goto LABEL_17;
  return v4;
}

unsigned __int8 *_scan_autolink_uri(unsigned __int8 *a1)
{
  unsigned int v1;
  unsigned int v3;
  unsigned __int8 *v4;
  unsigned int v5;
  unsigned __int8 *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  unsigned int v32;
  unsigned int v33;
  unsigned int v34;
  unsigned int v35;
  unsigned int v36;
  unsigned int v37;
  unsigned __int8 *v38;
  unsigned __int8 v39;
  int v40;
  unsigned __int8 *v41;
  int v42;
  unsigned __int8 v43;
  int v44;
  int v45;
  int v46;

  v1 = *a1;
  if (v1 < 0x41)
    return 0;
  if (v1 >= 0x5B && v1 - 97 > 0x19)
    return 0;
  v3 = a1[1];
  if (v3 > 0x2F)
  {
    if (v3 > 0x5A)
    {
      if (v3 - 123 < 0xFFFFFFE6)
        return 0;
    }
    else if (v3 - 58 < 7)
    {
      return 0;
    }
    goto LABEL_17;
  }
  if (v3 <= 0x2B)
  {
    if (v3 != 43)
      return 0;
    goto LABEL_17;
  }
  v4 = 0;
  if (v3 != 44 && v3 <= 0x2E)
  {
LABEL_17:
    v6 = a1 + 2;
    v5 = a1[2];
    if (v5 > 0x39)
    {
      if (v5 > 0x5A)
      {
        if (v5 - 97 > 0x19)
          return 0;
      }
      else
      {
        if (v5 < 0x3B)
          goto LABEL_348;
        if (v5 <= 0x40)
          return 0;
      }
    }
    else if (v5 > 0x2C)
    {
      if (v5 == 47)
        return 0;
    }
    else if (v5 != 43)
    {
      return 0;
    }
    v6 = a1 + 3;
    v7 = a1[3];
    if (v7 > 0x39)
    {
      if (v7 > 0x5A)
      {
        if (v7 - 97 >= 0x1A)
          return 0;
      }
      else
      {
        if (v7 < 0x3B)
          goto LABEL_348;
        if (v7 < 0x41)
          return 0;
      }
    }
    else if (v7 > 0x2C)
    {
      if (v7 == 47)
        return 0;
    }
    else if (v7 != 43)
    {
      return 0;
    }
    v6 = a1 + 4;
    v8 = a1[4];
    if (v8 > 0x39)
    {
      if (v8 > 0x5A)
      {
        if (v8 - 97 >= 0x1A)
          return 0;
      }
      else
      {
        if (v8 < 0x3B)
          goto LABEL_348;
        if (v8 < 0x41)
          return 0;
      }
    }
    else if (v8 > 0x2C)
    {
      if (v8 == 47)
        return 0;
    }
    else if (v8 != 43)
    {
      return 0;
    }
    v6 = a1 + 5;
    v9 = a1[5];
    if (v9 > 0x39)
    {
      if (v9 > 0x5A)
      {
        if (v9 - 123 < 0xFFFFFFE6)
          return 0;
      }
      else
      {
        if (v9 < 0x3B)
          goto LABEL_348;
        if (v9 < 0x41)
          return 0;
      }
    }
    else if (v9 > 0x2C)
    {
      if (v9 == 47)
        return 0;
    }
    else if (v9 != 43)
    {
      return 0;
    }
    v6 = a1 + 6;
    v10 = a1[6];
    if (v10 > 0x39)
    {
      if (v10 > 0x5A)
      {
        if (v10 - 123 < 0xFFFFFFE6)
          return 0;
      }
      else
      {
        if (v10 < 0x3B)
          goto LABEL_348;
        if (v10 < 0x41)
          return 0;
      }
    }
    else if (v10 > 0x2C)
    {
      if (v10 == 47)
        return 0;
    }
    else if (v10 != 43)
    {
      return 0;
    }
    v6 = a1 + 7;
    v11 = a1[7];
    if (v11 > 0x39)
    {
      if (v11 > 0x5A)
      {
        if (v11 - 123 < 0xFFFFFFE6)
          return 0;
      }
      else
      {
        if (v11 < 0x3B)
          goto LABEL_348;
        if (v11 < 0x41)
          return 0;
      }
    }
    else if (v11 > 0x2C)
    {
      if (v11 == 47)
        return 0;
    }
    else if (v11 != 43)
    {
      return 0;
    }
    v6 = a1 + 8;
    v12 = a1[8];
    if (v12 > 0x39)
    {
      if (v12 > 0x5A)
      {
        if (v12 - 123 < 0xFFFFFFE6)
          return 0;
      }
      else
      {
        if (v12 < 0x3B)
          goto LABEL_348;
        if (v12 < 0x41)
          return 0;
      }
    }
    else if (v12 > 0x2C)
    {
      if (v12 == 47)
        return 0;
    }
    else if (v12 != 43)
    {
      return 0;
    }
    v6 = a1 + 9;
    v13 = a1[9];
    if (v13 > 0x39)
    {
      if (v13 > 0x5A)
      {
        if (v13 - 123 < 0xFFFFFFE6)
          return 0;
      }
      else
      {
        if (v13 < 0x3B)
          goto LABEL_348;
        if (v13 < 0x41)
          return 0;
      }
    }
    else if (v13 > 0x2C)
    {
      if (v13 == 47)
        return 0;
    }
    else if (v13 != 43)
    {
      return 0;
    }
    v6 = a1 + 10;
    v14 = a1[10];
    if (v14 > 0x39)
    {
      if (v14 > 0x5A)
      {
        if (v14 - 123 < 0xFFFFFFE6)
          return 0;
      }
      else
      {
        if (v14 < 0x3B)
          goto LABEL_348;
        if (v14 < 0x41)
          return 0;
      }
    }
    else if (v14 > 0x2C)
    {
      if (v14 == 47)
        return 0;
    }
    else if (v14 != 43)
    {
      return 0;
    }
    v6 = a1 + 11;
    v15 = a1[11];
    if (v15 > 0x39)
    {
      if (v15 > 0x5A)
      {
        if (v15 - 123 < 0xFFFFFFE6)
          return 0;
      }
      else
      {
        if (v15 < 0x3B)
          goto LABEL_348;
        if (v15 < 0x41)
          return 0;
      }
    }
    else if (v15 > 0x2C)
    {
      if (v15 == 47)
        return 0;
    }
    else if (v15 != 43)
    {
      return 0;
    }
    v6 = a1 + 12;
    v16 = a1[12];
    if (v16 > 0x39)
    {
      if (v16 > 0x5A)
      {
        if (v16 - 123 < 0xFFFFFFE6)
          return 0;
      }
      else
      {
        if (v16 < 0x3B)
          goto LABEL_348;
        if (v16 < 0x41)
          return 0;
      }
    }
    else if (v16 > 0x2C)
    {
      if (v16 == 47)
        return 0;
    }
    else if (v16 != 43)
    {
      return 0;
    }
    v6 = a1 + 13;
    v17 = a1[13];
    if (v17 > 0x39)
    {
      if (v17 > 0x5A)
      {
        if (v17 - 123 < 0xFFFFFFE6)
          return 0;
      }
      else
      {
        if (v17 < 0x3B)
          goto LABEL_348;
        if (v17 < 0x41)
          return 0;
      }
    }
    else if (v17 > 0x2C)
    {
      if (v17 == 47)
        return 0;
    }
    else if (v17 != 43)
    {
      return 0;
    }
    v6 = a1 + 14;
    v18 = a1[14];
    if (v18 > 0x39)
    {
      if (v18 > 0x5A)
      {
        if (v18 - 123 < 0xFFFFFFE6)
          return 0;
      }
      else
      {
        if (v18 < 0x3B)
          goto LABEL_348;
        if (v18 < 0x41)
          return 0;
      }
    }
    else if (v18 > 0x2C)
    {
      if (v18 == 47)
        return 0;
    }
    else if (v18 != 43)
    {
      return 0;
    }
    v6 = a1 + 15;
    v19 = a1[15];
    if (v19 > 0x39)
    {
      if (v19 > 0x5A)
      {
        if (v19 - 123 < 0xFFFFFFE6)
          return 0;
      }
      else
      {
        if (v19 < 0x3B)
          goto LABEL_348;
        if (v19 < 0x41)
          return 0;
      }
    }
    else if (v19 > 0x2C)
    {
      if (v19 == 47)
        return 0;
    }
    else if (v19 != 43)
    {
      return 0;
    }
    v6 = a1 + 16;
    v20 = a1[16];
    if (v20 > 0x39)
    {
      if (v20 > 0x5A)
      {
        if (v20 - 123 < 0xFFFFFFE6)
          return 0;
      }
      else
      {
        if (v20 < 0x3B)
          goto LABEL_348;
        if (v20 < 0x41)
          return 0;
      }
    }
    else if (v20 > 0x2C)
    {
      if (v20 == 47)
        return 0;
    }
    else if (v20 != 43)
    {
      return 0;
    }
    v6 = a1 + 17;
    v21 = a1[17];
    if (v21 > 0x39)
    {
      if (v21 > 0x5A)
      {
        if (v21 - 123 < 0xFFFFFFE6)
          return 0;
      }
      else
      {
        if (v21 < 0x3B)
          goto LABEL_348;
        if (v21 < 0x41)
          return 0;
      }
    }
    else if (v21 > 0x2C)
    {
      if (v21 == 47)
        return 0;
    }
    else if (v21 != 43)
    {
      return 0;
    }
    v6 = a1 + 18;
    v22 = a1[18];
    if (v22 > 0x39)
    {
      if (v22 > 0x5A)
      {
        if (v22 - 123 < 0xFFFFFFE6)
          return 0;
      }
      else
      {
        if (v22 < 0x3B)
          goto LABEL_348;
        if (v22 < 0x41)
          return 0;
      }
    }
    else if (v22 > 0x2C)
    {
      if (v22 == 47)
        return 0;
    }
    else if (v22 != 43)
    {
      return 0;
    }
    v6 = a1 + 19;
    v23 = a1[19];
    if (v23 > 0x39)
    {
      if (v23 > 0x5A)
      {
        if (v23 - 123 < 0xFFFFFFE6)
          return 0;
      }
      else
      {
        if (v23 < 0x3B)
          goto LABEL_348;
        if (v23 < 0x41)
          return 0;
      }
    }
    else if (v23 > 0x2C)
    {
      if (v23 == 47)
        return 0;
    }
    else if (v23 != 43)
    {
      return 0;
    }
    v6 = a1 + 20;
    v24 = a1[20];
    if (v24 > 0x39)
    {
      if (v24 > 0x5A)
      {
        if (v24 - 123 < 0xFFFFFFE6)
          return 0;
      }
      else
      {
        if (v24 < 0x3B)
          goto LABEL_348;
        if (v24 < 0x41)
          return 0;
      }
    }
    else if (v24 > 0x2C)
    {
      if (v24 == 47)
        return 0;
    }
    else if (v24 != 43)
    {
      return 0;
    }
    v6 = a1 + 21;
    v25 = a1[21];
    if (v25 > 0x39)
    {
      if (v25 > 0x5A)
      {
        if (v25 - 123 < 0xFFFFFFE6)
          return 0;
      }
      else
      {
        if (v25 < 0x3B)
          goto LABEL_348;
        if (v25 < 0x41)
          return 0;
      }
    }
    else if (v25 > 0x2C)
    {
      if (v25 == 47)
        return 0;
    }
    else if (v25 != 43)
    {
      return 0;
    }
    v6 = a1 + 22;
    v26 = a1[22];
    if (v26 > 0x39)
    {
      if (v26 > 0x5A)
      {
        if (v26 - 123 < 0xFFFFFFE6)
          return 0;
      }
      else
      {
        if (v26 < 0x3B)
          goto LABEL_348;
        if (v26 < 0x41)
          return 0;
      }
    }
    else if (v26 > 0x2C)
    {
      if (v26 == 47)
        return 0;
    }
    else if (v26 != 43)
    {
      return 0;
    }
    v6 = a1 + 23;
    v27 = a1[23];
    if (v27 > 0x39)
    {
      if (v27 > 0x5A)
      {
        if (v27 - 123 < 0xFFFFFFE6)
          return 0;
      }
      else
      {
        if (v27 < 0x3B)
          goto LABEL_348;
        if (v27 < 0x41)
          return 0;
      }
    }
    else if (v27 > 0x2C)
    {
      if (v27 == 47)
        return 0;
    }
    else if (v27 != 43)
    {
      return 0;
    }
    v6 = a1 + 24;
    v28 = a1[24];
    if (v28 > 0x39)
    {
      if (v28 > 0x5A)
      {
        if (v28 - 123 < 0xFFFFFFE6)
          return 0;
      }
      else
      {
        if (v28 < 0x3B)
          goto LABEL_348;
        if (v28 < 0x41)
          return 0;
      }
    }
    else if (v28 > 0x2C)
    {
      if (v28 == 47)
        return 0;
    }
    else if (v28 != 43)
    {
      return 0;
    }
    v6 = a1 + 25;
    v29 = a1[25];
    if (v29 > 0x39)
    {
      if (v29 > 0x5A)
      {
        if (v29 - 123 < 0xFFFFFFE6)
          return 0;
      }
      else
      {
        if (v29 < 0x3B)
          goto LABEL_348;
        if (v29 < 0x41)
          return 0;
      }
    }
    else if (v29 > 0x2C)
    {
      if (v29 == 47)
        return 0;
    }
    else if (v29 != 43)
    {
      return 0;
    }
    v6 = a1 + 26;
    v30 = a1[26];
    if (v30 > 0x39)
    {
      if (v30 > 0x5A)
      {
        if (v30 - 123 < 0xFFFFFFE6)
          return 0;
      }
      else
      {
        if (v30 < 0x3B)
          goto LABEL_348;
        if (v30 < 0x41)
          return 0;
      }
    }
    else if (v30 > 0x2C)
    {
      if (v30 == 47)
        return 0;
    }
    else if (v30 != 43)
    {
      return 0;
    }
    v6 = a1 + 27;
    v31 = a1[27];
    if (v31 > 0x39)
    {
      if (v31 > 0x5A)
      {
        if (v31 - 123 < 0xFFFFFFE6)
          return 0;
      }
      else
      {
        if (v31 < 0x3B)
          goto LABEL_348;
        if (v31 < 0x41)
          return 0;
      }
    }
    else if (v31 > 0x2C)
    {
      if (v31 == 47)
        return 0;
    }
    else if (v31 != 43)
    {
      return 0;
    }
    v6 = a1 + 28;
    v32 = a1[28];
    if (v32 > 0x39)
    {
      if (v32 > 0x5A)
      {
        if (v32 - 123 < 0xFFFFFFE6)
          return 0;
      }
      else
      {
        if (v32 < 0x3B)
          goto LABEL_348;
        if (v32 < 0x41)
          return 0;
      }
    }
    else if (v32 > 0x2C)
    {
      if (v32 == 47)
        return 0;
    }
    else if (v32 != 43)
    {
      return 0;
    }
    v6 = a1 + 29;
    v33 = a1[29];
    if (v33 > 0x39)
    {
      if (v33 > 0x5A)
      {
        if (v33 - 123 < 0xFFFFFFE6)
          return 0;
      }
      else
      {
        if (v33 < 0x3B)
          goto LABEL_348;
        if (v33 < 0x41)
          return 0;
      }
    }
    else if (v33 > 0x2C)
    {
      if (v33 == 47)
        return 0;
    }
    else if (v33 != 43)
    {
      return 0;
    }
    v6 = a1 + 30;
    v34 = a1[30];
    if (v34 > 0x39)
    {
      if (v34 > 0x5A)
      {
        if (v34 - 123 < 0xFFFFFFE6)
          return 0;
      }
      else
      {
        if (v34 < 0x3B)
          goto LABEL_348;
        if (v34 < 0x41)
          return 0;
      }
    }
    else if (v34 > 0x2C)
    {
      if (v34 == 47)
        return 0;
    }
    else if (v34 != 43)
    {
      return 0;
    }
    v6 = a1 + 31;
    v35 = a1[31];
    if (v35 > 0x39)
    {
      if (v35 > 0x5A)
      {
        if (v35 - 123 < 0xFFFFFFE6)
          return 0;
      }
      else
      {
        if (v35 < 0x3B)
          goto LABEL_348;
        if (v35 < 0x41)
          return 0;
      }
    }
    else if (v35 > 0x2C)
    {
      if (v35 == 47)
        return 0;
    }
    else if (v35 != 43)
    {
      return 0;
    }
    v6 = a1 + 32;
    if (a1[32] == 58)
    {
      while (1)
      {
        do
        {
LABEL_348:
          v4 = v6;
          v37 = *++v6;
          v36 = v37;
        }
        while (_scan_autolink_uri_yybm[v37] < 0);
        if (v36 > 0xEC)
          break;
        if (v36 <= 0xC1)
        {
          LODWORD(v4) = (_DWORD)v4 - (_DWORD)a1 + 2;
          if (v36 - 61 >= 2)
            return 0;
          else
            return (unsigned __int8 *)v4;
        }
        if (v36 >= 0xE0)
        {
          if (v36 != 224)
            goto LABEL_368;
          v39 = v4[2];
          v38 = v4 + 2;
          if ((v39 & 0xE0) != 0xA0)
            return 0;
LABEL_358:
          v6 = v38;
        }
LABEL_369:
        v4 = 0;
        v46 = (char)*++v6;
        if (v46 >= -64)
          return v4;
      }
      if (v36 > 0xF0)
      {
        if (v36 >= 0xF4)
        {
          if (v36 != 244)
            return 0;
          v44 = (char)v4[2];
          v41 = v4 + 2;
          if (v44 >= -112)
            return 0;
        }
        else
        {
          v42 = (char)v4[2];
          v41 = v4 + 2;
          if (v42 >= -64)
            return 0;
        }
LABEL_367:
        v6 = v41;
LABEL_368:
        v45 = (char)*++v6;
        if (v45 >= -64)
          return 0;
        goto LABEL_369;
      }
      if (v36 >= 0xEE)
      {
        if (v36 >= 0xF0)
        {
          v43 = v4[2];
          v41 = v4 + 2;
          if ((v43 + 112) >= 0x30u)
            return 0;
          goto LABEL_367;
        }
        goto LABEL_368;
      }
      v40 = (char)v4[2];
      v38 = v4 + 2;
      if (v40 >= -96)
        return 0;
      goto LABEL_358;
    }
    return 0;
  }
  return v4;
}

uint64_t _scan_autolink_email(unsigned __int8 *a1)
{
  unsigned int v1;
  uint64_t v2;
  uint64_t v3;
  unsigned __int8 *v4;
  unsigned int v5;
  unsigned __int8 *v6;
  unsigned int v7;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned __int8 *v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned __int8 *v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  unsigned __int8 *v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  unsigned __int8 *v32;
  unsigned int v33;
  unsigned int v34;
  unsigned int v35;
  unsigned int v36;
  unsigned __int8 *v37;
  unsigned int v38;
  unsigned int v39;
  unsigned int v40;
  unsigned __int8 *v41;
  unsigned int v42;
  unsigned int v43;
  unsigned int v44;
  unsigned int v45;
  unsigned __int8 *v46;
  unsigned int v47;
  unsigned int v48;
  unsigned int v49;
  unsigned __int8 *v50;
  unsigned int v51;
  unsigned int v52;
  unsigned int v53;
  unsigned int v54;
  unsigned __int8 *v55;
  unsigned int v56;
  unsigned int v57;
  unsigned int v58;
  unsigned __int8 *v59;
  unsigned int v60;
  unsigned int v61;
  unsigned int v62;
  unsigned int v63;
  unsigned __int8 *v64;
  unsigned int v65;
  unsigned int v66;
  unsigned int v67;
  unsigned __int8 *v68;
  unsigned int v69;
  unsigned int v70;
  unsigned int v71;
  unsigned int v72;
  unsigned __int8 *v73;
  unsigned int v74;
  unsigned int v75;
  unsigned int v76;
  unsigned __int8 *v77;
  unsigned int v78;
  unsigned int v79;
  unsigned int v80;
  unsigned int v81;
  unsigned __int8 *v82;
  unsigned int v83;
  unsigned int v84;
  unsigned int v85;
  unsigned __int8 *v86;
  unsigned int v87;
  unsigned int v88;
  unsigned int v89;
  unsigned int v90;
  unsigned __int8 *v91;
  unsigned int v92;
  unsigned int v93;
  unsigned int v94;
  unsigned __int8 *v95;
  unsigned int v96;
  unsigned int v97;
  unsigned int v98;
  unsigned int v99;
  unsigned __int8 *v100;
  unsigned int v101;
  unsigned int v102;
  unsigned int v103;
  unsigned __int8 *v104;
  unsigned int v105;
  unsigned int v106;
  unsigned int v107;
  unsigned int v108;
  unsigned __int8 *v109;
  unsigned int v110;
  unsigned int v111;
  unsigned int v112;
  unsigned __int8 *v113;
  unsigned int v114;
  unsigned int v115;
  unsigned int v116;
  unsigned int v117;
  unsigned __int8 *v118;
  unsigned int v119;
  unsigned int v120;
  unsigned int v121;
  unsigned __int8 *v122;
  unsigned int v123;
  unsigned int v124;
  unsigned int v125;
  unsigned int v126;
  unsigned __int8 *v127;
  unsigned int v128;
  unsigned int v129;
  unsigned int v130;
  unsigned __int8 *v131;
  unsigned int v132;
  unsigned int v133;
  unsigned int v134;
  unsigned int v135;
  unsigned __int8 *v136;
  unsigned int v137;
  unsigned int v138;
  unsigned int v139;
  unsigned __int8 *v140;
  unsigned int v141;
  unsigned int v142;
  unsigned int v143;
  unsigned int v144;
  unsigned __int8 *v145;
  unsigned int v146;
  unsigned int v147;
  unsigned int v148;
  unsigned __int8 *v149;
  unsigned int v150;
  unsigned int v151;
  unsigned int v152;
  unsigned int v153;
  unsigned __int8 *v154;
  unsigned int v155;
  unsigned int v156;
  unsigned int v157;
  unsigned __int8 *v158;
  unsigned int v159;
  unsigned int v160;
  unsigned int v161;
  unsigned int v162;
  unsigned __int8 *v163;
  unsigned int v164;
  unsigned int v165;
  unsigned int v166;
  unsigned __int8 *v167;
  unsigned int v168;
  unsigned int v169;
  unsigned int v170;
  unsigned int v171;
  unsigned __int8 *v172;
  unsigned int v173;
  unsigned int v174;
  unsigned int v175;
  unsigned __int8 *v176;
  unsigned int v177;
  unsigned int v178;
  unsigned int v179;
  unsigned int v180;
  unsigned __int8 *v181;
  unsigned int v182;
  unsigned int v183;
  unsigned int v184;
  unsigned __int8 *v185;
  unsigned int v186;
  unsigned int v187;
  unsigned int v188;
  unsigned int v189;
  unsigned __int8 *v190;
  unsigned int v191;
  unsigned int v192;
  unsigned int v193;
  unsigned __int8 *v194;
  unsigned int v195;
  unsigned int v196;
  unsigned int v197;
  unsigned int v198;
  unsigned __int8 *v199;
  unsigned int v200;
  unsigned int v201;
  unsigned int v202;
  unsigned __int8 *v203;
  unsigned int v204;
  unsigned int v205;
  unsigned int v206;
  unsigned int v207;
  unsigned __int8 *v208;
  unsigned int v209;
  unsigned int v210;
  unsigned int v211;
  unsigned __int8 *v212;
  unsigned int v213;
  unsigned int v214;
  unsigned int v215;
  unsigned int v216;
  unsigned __int8 *v217;
  unsigned int v218;
  unsigned int v219;
  unsigned int v220;
  unsigned __int8 *v221;
  unsigned int v222;
  unsigned int v223;
  unsigned int v224;
  unsigned int v225;
  unsigned __int8 *v226;
  unsigned int v227;
  unsigned int v228;
  unsigned int v229;
  unsigned __int8 *v230;
  unsigned int v231;
  unsigned int v232;
  unsigned int v233;
  unsigned int v234;
  unsigned __int8 *v235;
  unsigned int v236;
  unsigned int v237;
  unsigned int v238;
  unsigned __int8 *v239;
  unsigned int v240;
  unsigned int v241;
  unsigned int v242;
  unsigned int v243;
  unsigned __int8 *v244;
  unsigned int v245;
  unsigned int v246;
  unsigned int v247;
  unsigned __int8 *v248;
  unsigned int v249;
  unsigned int v250;
  unsigned int v251;
  BOOL v252;
  unsigned int v253;
  unsigned __int8 *v254;
  unsigned int v255;
  unsigned int v256;
  BOOL v257;
  unsigned int v258;
  unsigned int v259;
  unsigned int v260;
  unsigned int v261;
  BOOL v262;
  unsigned int v263;
  unsigned int v264;
  unsigned int v265;
  BOOL v266;
  unsigned int v267;
  unsigned int v268;
  unsigned int v269;
  unsigned int v270;
  BOOL v271;
  unsigned int v272;
  unsigned int v273;
  unsigned int v274;
  unsigned int v275;
  unsigned int v276;
  unsigned int v277;
  unsigned int v278;
  int v279;
  int v280;

  v1 = *a1;
  if (v1 <= 0x39)
  {
    if (v1 > 0x27)
    {
      v2 = 0;
      if (v1 < 0x2A || v1 == 44)
        return v2;
    }
    else if (v1 != 33 && v1 <= 0x22)
    {
      return 0;
    }
    goto LABEL_16;
  }
  if (v1 > 0x3F)
  {
    if (v1 > 0x5A)
    {
      if (v1 - 94 > 0x20)
        return 0;
    }
    else if (v1 <= 0x40)
    {
      return 0;
    }
  }
  else if ((v1 & 0xFFFFFFFD) != 0x3D)
  {
    return 0;
  }
LABEL_16:
  v4 = a1 + 1;
  v3 = a1[1];
  if (v3 > 0x2C)
  {
    if (v3 > 0x3E)
    {
      if (v3 >= 0x5B && (v3 - 94) > 0x20)
        return 0;
    }
    else if (v3 >= 0x3A && (_DWORD)v3 != 61)
    {
      return 0;
    }
  }
  else if (v3 > 0x22)
  {
    if (v3 >= 0x28 && (v3 & 0xFE) != 0x2A)
      return 0;
  }
  else if ((_DWORD)v3 != 33)
  {
    return 0;
  }
  if (_scan_autolink_email_yybm[v3] < 0)
  {
    do
    {
      v5 = *++v4;
      LODWORD(v3) = v5;
    }
    while (_scan_autolink_email_yybm[v5] < 0);
  }
  if ((v3 - 63) > 1)
    return 0;
  do
  {
    while (1)
    {
      do
      {
        while (1)
        {
          do
          {
            while (1)
            {
              do
              {
                while (1)
                {
                  do
                  {
                    while (1)
                    {
                      do
                      {
                        while (1)
                        {
                          do
                          {
                            while (1)
                            {
                              do
                              {
                                while (1)
                                {
                                  do
                                  {
                                    while (1)
                                    {
                                      do
                                      {
                                        while (1)
                                        {
                                          do
                                          {
                                            while (1)
                                            {
                                              do
                                              {
                                                while (1)
                                                {
                                                  do
                                                  {
                                                    while (1)
                                                    {
                                                      do
                                                      {
                                                        while (1)
                                                        {
                                                          do
                                                          {
                                                            while (1)
                                                            {
                                                              do
                                                              {
                                                                while (1)
                                                                {
                                                                  while (1)
                                                                  {
                                                                    while (1)
                                                                    {
                                                                      v6 = v4;
                                                                      v7 = v4[1];
                                                                      if (v7 > 0x40)
                                                                      {
                                                                        if (v7 >= 0x5B && v7 - 123 < 0xFFFFFFE6)
                                                                          return 0;
                                                                      }
                                                                      else if (v7 - 58 < 0xFFFFFFF6)
                                                                      {
                                                                        return 0;
                                                                      }
                                                                      v4 += 2;
                                                                      v9 = v6[2];
                                                                      if (v9 > 0x3D)
                                                                        break;
                                                                      if (v9 > 0x2E)
                                                                      {
                                                                        v2 = 0;
                                                                        if (v9 == 47 || v9 >= 0x3A)
                                                                          return v2;
                                                                        goto LABEL_56;
                                                                      }
                                                                      if (v9 < 0x2D)
                                                                        return 0;
                                                                      if (v9 == 45)
                                                                      {
                                                                        v10 = v6[3];
                                                                        if (v10 > 0x39)
                                                                        {
                                                                          if (v10 <= 0x5A)
                                                                          {
                                                                            if (v10 < 0x41)
                                                                              return 0;
                                                                            goto LABEL_73;
                                                                          }
                                                                          v13 = v10 - 97;
LABEL_72:
                                                                          if (v13 >= 0x1A)
                                                                            return 0;
                                                                          goto LABEL_73;
                                                                        }
                                                                        if (v10 != 45)
                                                                        {
                                                                          if (v10 < 0x30)
                                                                            return 0;
                                                                          goto LABEL_73;
                                                                        }
LABEL_60:
                                                                        v12 = v6[4];
                                                                        if (v12 > 0x39)
                                                                        {
                                                                          if (v12 <= 0x5A)
                                                                          {
                                                                            if (v12 < 0x41)
                                                                              return 0;
                                                                            goto LABEL_89;
                                                                          }
                                                                          v17 = v12 - 97;
LABEL_88:
                                                                          if (v17 >= 0x1A)
                                                                            return 0;
                                                                          goto LABEL_89;
                                                                        }
                                                                        if (v12 != 45)
                                                                        {
                                                                          if (v12 < 0x30)
                                                                            return 0;
                                                                          goto LABEL_89;
                                                                        }
LABEL_77:
                                                                        v16 = v6 + 5;
                                                                        v15 = v6[5];
                                                                        if (v15 <= 0x39)
                                                                        {
                                                                          if (v15 == 45)
                                                                          {
                                                                            v4 = v6 + 5;
                                                                            goto LABEL_93;
                                                                          }
                                                                          if (v15 < 0x30)
                                                                            return 0;
                                                                          goto LABEL_106;
                                                                        }
                                                                        if (v15 <= 0x5A)
                                                                        {
                                                                          if (v15 < 0x41)
                                                                            return 0;
                                                                          goto LABEL_106;
                                                                        }
                                                                        v20 = v15 - 97;
LABEL_105:
                                                                        if (v20 >= 0x1A)
                                                                          return 0;
LABEL_106:
                                                                        v4 = v6 + 6;
                                                                        v21 = v6[6];
                                                                        if (v21 > 0x3D)
                                                                        {
                                                                          if (v21 > 0x5A)
                                                                          {
                                                                            v25 = v21 - 97;
                                                                            goto LABEL_121;
                                                                          }
                                                                          if (v21 < 0x3F)
                                                                            return ((_DWORD)v4
                                                                                                - (_DWORD)a1
                                                                                                + 1);
                                                                          if (v21 < 0x41)
                                                                            return 0;
LABEL_122:
                                                                          v26 = v6[7];
                                                                          v4 = v6 + 7;
                                                                          if (v26 > 0x3D)
                                                                          {
                                                                            if (v26 <= 0x5A)
                                                                            {
                                                                              if (v26 < 0x3F)
                                                                                return ((_DWORD)v4 - (_DWORD)a1 + 1);
                                                                              v23 = v6 + 7;
                                                                              if (v26 < 0x41)
                                                                                return 0;
                                                                              goto LABEL_139;
                                                                            }
                                                                            v29 = v26 - 97;
                                                                            v23 = v6 + 7;
LABEL_138:
                                                                            if (v29 >= 0x1A)
                                                                              return 0;
                                                                            goto LABEL_139;
                                                                          }
                                                                          if (v26 > 0x2E)
                                                                          {
                                                                            v2 = 0;
                                                                            if (v26 == 47)
                                                                              return v2;
                                                                            v23 = v6 + 7;
                                                                            if (v26 >= 0x3A)
                                                                              return v2;
                                                                            goto LABEL_139;
                                                                          }
                                                                          if (v26 < 0x2D)
                                                                            return 0;
                                                                          if (v26 == 45)
                                                                          {
LABEL_126:
                                                                            v28 = v4 + 1;
                                                                            v27 = v4[1];
                                                                            if (v27 > 0x39)
                                                                            {
                                                                              if (v27 <= 0x5A)
                                                                              {
                                                                                if (v27 < 0x41)
                                                                                  return 0;
                                                                                goto LABEL_155;
                                                                              }
                                                                              v34 = v27 - 97;
LABEL_154:
                                                                              if (v34 >= 0x1A)
                                                                                return 0;
                                                                              goto LABEL_155;
                                                                            }
                                                                            v23 = v4;
                                                                            if (v27 != 45)
                                                                            {
                                                                              if (v27 < 0x30)
                                                                                return 0;
                                                                              goto LABEL_155;
                                                                            }
LABEL_143:
                                                                            v33 = v23[2];
                                                                            v32 = v23 + 2;
                                                                            v31 = v33;
                                                                            if (v33 <= 0x39)
                                                                            {
                                                                              if (v31 == 45)
                                                                              {
                                                                                v4 = v32;
                                                                                goto LABEL_159;
                                                                              }
                                                                              if (v31 < 0x30)
                                                                                return 0;
                                                                              goto LABEL_172;
                                                                            }
                                                                            if (v31 <= 0x5A)
                                                                            {
                                                                              if (v31 < 0x41)
                                                                                return 0;
                                                                              goto LABEL_172;
                                                                            }
                                                                            v38 = v31 - 97;
LABEL_171:
                                                                            if (v38 >= 0x1A)
                                                                              return 0;
LABEL_172:
                                                                            v4 = v32 + 1;
                                                                            v39 = v32[1];
                                                                            if (v39 > 0x3D)
                                                                            {
                                                                              if (v39 > 0x5A)
                                                                              {
                                                                                v43 = v39 - 97;
                                                                                v37 = v32 + 1;
                                                                                goto LABEL_187;
                                                                              }
                                                                              if (v39 < 0x3F)
                                                                                return ((_DWORD)v4 - (_DWORD)a1 + 1);
                                                                              v37 = v32 + 1;
                                                                              if (v39 < 0x41)
                                                                                return 0;
LABEL_188:
                                                                              v44 = v37[1];
                                                                              v4 = v37 + 1;
                                                                              if (v44 > 0x3D)
                                                                              {
                                                                                if (v44 <= 0x5A)
                                                                                {
                                                                                  if (v44 < 0x3F)
                                                                                    return ((_DWORD)v4 - (_DWORD)a1 + 1);
                                                                                  v41 = v37 + 1;
                                                                                  if (v44 < 0x41)
                                                                                    return 0;
                                                                                  goto LABEL_211;
                                                                                }
                                                                                v47 = v44 - 97;
                                                                                v41 = v37 + 1;
LABEL_210:
                                                                                if (v47 >= 0x1A)
                                                                                  return 0;
                                                                                goto LABEL_211;
                                                                              }
                                                                              if (v44 > 0x2E)
                                                                              {
                                                                                v2 = 0;
                                                                                if (v44 == 47)
                                                                                  return v2;
                                                                                v41 = v37 + 1;
                                                                                if (v44 >= 0x3A)
                                                                                  return v2;
                                                                                goto LABEL_211;
                                                                              }
                                                                              if (v44 < 0x2D)
                                                                                return 0;
                                                                              if (v44 == 45)
                                                                              {
LABEL_192:
                                                                                v46 = v4 + 1;
                                                                                v45 = v4[1];
                                                                                if (v45 > 0x39)
                                                                                {
                                                                                  if (v45 <= 0x5A)
                                                                                  {
                                                                                    if (v45 < 0x41)
                                                                                      return 0;
                                                                                    goto LABEL_230;
                                                                                  }
                                                                                  v52 = v45 - 97;
LABEL_229:
                                                                                  if (v52 >= 0x1A)
                                                                                    return 0;
                                                                                  goto LABEL_230;
                                                                                }
                                                                                v41 = v4;
                                                                                if (v45 != 45)
                                                                                {
                                                                                  if (v45 < 0x30)
                                                                                    return 0;
                                                                                  goto LABEL_230;
                                                                                }
LABEL_215:
                                                                                v51 = v41[2];
                                                                                v50 = v41 + 2;
                                                                                v49 = v51;
                                                                                if (v51 <= 0x39)
                                                                                {
                                                                                  if (v49 == 45)
                                                                                  {
                                                                                    v4 = v50;
                                                                                    goto LABEL_234;
                                                                                  }
                                                                                  if (v49 < 0x30)
                                                                                    return 0;
                                                                                  goto LABEL_250;
                                                                                }
                                                                                if (v49 <= 0x5A)
                                                                                {
                                                                                  if (v49 < 0x41)
                                                                                    return 0;
                                                                                  goto LABEL_250;
                                                                                }
                                                                                v56 = v49 - 97;
LABEL_249:
                                                                                if (v56 >= 0x1A)
                                                                                  return 0;
LABEL_250:
                                                                                v4 = v50 + 1;
                                                                                v57 = v50[1];
                                                                                if (v57 > 0x3D)
                                                                                {
                                                                                  if (v57 > 0x5A)
                                                                                  {
                                                                                    v61 = v57 - 97;
                                                                                    v55 = v50 + 1;
                                                                                    goto LABEL_268;
                                                                                  }
                                                                                  if (v57 < 0x3F)
                                                                                    return ((_DWORD)v4 - (_DWORD)a1 + 1);
                                                                                  v55 = v50 + 1;
                                                                                  if (v57 < 0x41)
                                                                                    return 0;
LABEL_269:
                                                                                  v62 = v55[1];
                                                                                  v4 = v55 + 1;
                                                                                  if (v62 > 0x3D)
                                                                                  {
                                                                                    if (v62 <= 0x5A)
                                                                                    {
                                                                                      if (v62 < 0x3F)
                                                                                        return ((_DWORD)v4 - (_DWORD)a1 + 1);
                                                                                      v59 = v55 + 1;
                                                                                      if (v62 < 0x41)
                                                                                        return 0;
                                                                                      goto LABEL_290;
                                                                                    }
                                                                                    v65 = v62 - 97;
                                                                                    v59 = v55 + 1;
LABEL_289:
                                                                                    if (v65 >= 0x1A)
                                                                                      return 0;
                                                                                    goto LABEL_290;
                                                                                  }
                                                                                  if (v62 > 0x2E)
                                                                                  {
                                                                                    v2 = 0;
                                                                                    if (v62 == 47)
                                                                                      return v2;
                                                                                    v59 = v55 + 1;
                                                                                    if (v62 >= 0x3A)
                                                                                      return v2;
                                                                                    goto LABEL_290;
                                                                                  }
                                                                                  if (v62 < 0x2D)
                                                                                    return 0;
                                                                                  if (v62 == 45)
                                                                                  {
LABEL_273:
                                                                                    v64 = v4 + 1;
                                                                                    v63 = v4[1];
                                                                                    if (v63 > 0x39)
                                                                                    {
                                                                                      if (v63 <= 0x5A)
                                                                                      {
                                                                                        if (v63 < 0x41)
                                                                                          return 0;
                                                                                        goto LABEL_313;
                                                                                      }
                                                                                      v70 = v63 - 97;
LABEL_312:
                                                                                      if (v70 >= 0x1A)
                                                                                        return 0;
                                                                                      goto LABEL_313;
                                                                                    }
                                                                                    v59 = v4;
                                                                                    if (v63 != 45)
                                                                                    {
                                                                                      if (v63 < 0x30)
                                                                                        return 0;
                                                                                      goto LABEL_313;
                                                                                    }
LABEL_294:
                                                                                    v69 = v59[2];
                                                                                    v68 = v59 + 2;
                                                                                    v67 = v69;
                                                                                    if (v69 <= 0x39)
                                                                                    {
                                                                                      if (v67 == 45)
                                                                                      {
                                                                                        v4 = v68;
                                                                                        goto LABEL_317;
                                                                                      }
                                                                                      if (v67 < 0x30)
                                                                                        return 0;
                                                                                      goto LABEL_334;
                                                                                    }
                                                                                    if (v67 <= 0x5A)
                                                                                    {
                                                                                      if (v67 < 0x41)
                                                                                        return 0;
                                                                                      goto LABEL_334;
                                                                                    }
                                                                                    v74 = v67 - 97;
LABEL_333:
                                                                                    if (v74 >= 0x1A)
                                                                                      return 0;
LABEL_334:
                                                                                    v4 = v68 + 1;
                                                                                    v75 = v68[1];
                                                                                    if (v75 > 0x3D)
                                                                                    {
                                                                                      if (v75 > 0x5A)
                                                                                      {
                                                                                        v79 = v75 - 97;
                                                                                        v73 = v68 + 1;
                                                                                        goto LABEL_355;
                                                                                      }
                                                                                      if (v75 < 0x3F)
                                                                                        return ((_DWORD)v4 - (_DWORD)a1 + 1);
                                                                                      v73 = v68 + 1;
                                                                                      if (v75 < 0x41)
                                                                                        return 0;
LABEL_356:
                                                                                      v80 = v73[1];
                                                                                      v4 = v73 + 1;
                                                                                      if (v80 > 0x3D)
                                                                                      {
                                                                                        if (v80 <= 0x5A)
                                                                                        {
                                                                                          if (v80 < 0x3F)
                                                                                            return ((_DWORD)v4 - (_DWORD)a1 + 1);
                                                                                          v77 = v73 + 1;
                                                                                          if (v80 < 0x41)
                                                                                            return 0;
                                                                                          goto LABEL_377;
                                                                                        }
                                                                                        v83 = v80 - 97;
                                                                                        v77 = v73 + 1;
LABEL_376:
                                                                                        if (v83 >= 0x1A)
                                                                                          return 0;
                                                                                        goto LABEL_377;
                                                                                      }
                                                                                      if (v80 > 0x2E)
                                                                                      {
                                                                                        v2 = 0;
                                                                                        if (v80 == 47)
                                                                                          return v2;
                                                                                        v77 = v73 + 1;
                                                                                        if (v80 >= 0x3A)
                                                                                          return v2;
                                                                                        goto LABEL_377;
                                                                                      }
                                                                                      if (v80 < 0x2D)
                                                                                        return 0;
                                                                                      if (v80 == 45)
                                                                                      {
LABEL_360:
                                                                                        v82 = v4 + 1;
                                                                                        v81 = v4[1];
                                                                                        if (v81 > 0x39)
                                                                                        {
                                                                                          if (v81 <= 0x5A)
                                                                                          {
                                                                                            if (v81 < 0x41)
                                                                                              return 0;
                                                                                            goto LABEL_399;
                                                                                          }
                                                                                          v88 = v81 - 97;
LABEL_398:
                                                                                          if (v88 >= 0x1A)
                                                                                            return 0;
                                                                                          goto LABEL_399;
                                                                                        }
                                                                                        v77 = v4;
                                                                                        if (v81 != 45)
                                                                                        {
                                                                                          if (v81 < 0x30)
                                                                                            return 0;
                                                                                          goto LABEL_399;
                                                                                        }
LABEL_381:
                                                                                        v87 = v77[2];
                                                                                        v86 = v77 + 2;
                                                                                        v85 = v87;
                                                                                        if (v87 <= 0x39)
                                                                                        {
                                                                                          if (v85 == 45)
                                                                                          {
                                                                                            v4 = v86;
                                                                                            goto LABEL_403;
                                                                                          }
                                                                                          if (v85 < 0x30)
                                                                                            return 0;
                                                                                          goto LABEL_420;
                                                                                        }
                                                                                        if (v85 <= 0x5A)
                                                                                        {
                                                                                          if (v85 < 0x41)
                                                                                            return 0;
                                                                                          goto LABEL_420;
                                                                                        }
                                                                                        v92 = v85 - 97;
LABEL_419:
                                                                                        if (v92 >= 0x1A)
                                                                                          return 0;
LABEL_420:
                                                                                        v4 = v86 + 1;
                                                                                        v93 = v86[1];
                                                                                        if (v93 > 0x3D)
                                                                                        {
                                                                                          if (v93 > 0x5A)
                                                                                          {
                                                                                            v97 = v93 - 97;
                                                                                            v91 = v86 + 1;
                                                                                            goto LABEL_441;
                                                                                          }
                                                                                          if (v93 < 0x3F)
                                                                                            return ((_DWORD)v4 - (_DWORD)a1 + 1);
                                                                                          v91 = v86 + 1;
                                                                                          if (v93 < 0x41)
                                                                                            return 0;
LABEL_442:
                                                                                          v98 = v91[1];
                                                                                          v4 = v91 + 1;
                                                                                          if (v98 > 0x3D)
                                                                                          {
                                                                                            if (v98 <= 0x5A)
                                                                                            {
                                                                                              if (v98 < 0x3F)
                                                                                                return ((_DWORD)v4 - (_DWORD)a1 + 1);
                                                                                              v95 = v91 + 1;
                                                                                              if (v98 < 0x41)
                                                                                                return 0;
                                                                                              goto LABEL_463;
                                                                                            }
                                                                                            v101 = v98 - 97;
                                                                                            v95 = v91 + 1;
LABEL_462:
                                                                                            if (v101 >= 0x1A)
                                                                                              return 0;
                                                                                            goto LABEL_463;
                                                                                          }
                                                                                          if (v98 > 0x2E)
                                                                                          {
                                                                                            v2 = 0;
                                                                                            if (v98 == 47)
                                                                                              return v2;
                                                                                            v95 = v91 + 1;
                                                                                            if (v98 >= 0x3A)
                                                                                              return v2;
                                                                                            goto LABEL_463;
                                                                                          }
                                                                                          if (v98 < 0x2D)
                                                                                            return 0;
                                                                                          if (v98 == 45)
                                                                                          {
LABEL_446:
                                                                                            v100 = v4 + 1;
                                                                                            v99 = v4[1];
                                                                                            if (v99 > 0x39)
                                                                                            {
                                                                                              if (v99 <= 0x5A)
                                                                                              {
                                                                                                if (v99 < 0x41)
                                                                                                  return 0;
                                                                                                goto LABEL_485;
                                                                                              }
                                                                                              v106 = v99 - 97;
LABEL_484:
                                                                                              if (v106 >= 0x1A)
                                                                                                return 0;
                                                                                              goto LABEL_485;
                                                                                            }
                                                                                            v95 = v4;
                                                                                            if (v99 != 45)
                                                                                            {
                                                                                              if (v99 < 0x30)
                                                                                                return 0;
                                                                                              goto LABEL_485;
                                                                                            }
LABEL_467:
                                                                                            v105 = v95[2];
                                                                                            v104 = v95 + 2;
                                                                                            v103 = v105;
                                                                                            if (v105 <= 0x39)
                                                                                            {
                                                                                              if (v103 == 45)
                                                                                              {
                                                                                                v4 = v104;
                                                                                                goto LABEL_489;
                                                                                              }
                                                                                              if (v103 < 0x30)
                                                                                                return 0;
                                                                                              goto LABEL_506;
                                                                                            }
                                                                                            if (v103 <= 0x5A)
                                                                                            {
                                                                                              if (v103 < 0x41)
                                                                                                return 0;
                                                                                              goto LABEL_506;
                                                                                            }
                                                                                            v110 = v103 - 97;
LABEL_505:
                                                                                            if (v110 >= 0x1A)
                                                                                              return 0;
LABEL_506:
                                                                                            v4 = v104 + 1;
                                                                                            v111 = v104[1];
                                                                                            if (v111 > 0x3D)
                                                                                            {
                                                                                              if (v111 > 0x5A)
                                                                                              {
                                                                                                v115 = v111 - 97;
                                                                                                v109 = v104 + 1;
                                                                                                goto LABEL_527;
                                                                                              }
                                                                                              if (v111 < 0x3F)
                                                                                                return ((_DWORD)v4 - (_DWORD)a1 + 1);
                                                                                              v109 = v104 + 1;
                                                                                              if (v111 < 0x41)
                                                                                                return 0;
LABEL_528:
                                                                                              v116 = v109[1];
                                                                                              v4 = v109 + 1;
                                                                                              if (v116 > 0x3D)
                                                                                              {
                                                                                                if (v116 <= 0x5A)
                                                                                                {
                                                                                                  if (v116 < 0x3F)
                                                                                                    return ((_DWORD)v4 - (_DWORD)a1 + 1);
                                                                                                  v113 = v109 + 1;
                                                                                                  if (v116 < 0x41)
                                                                                                    return 0;
                                                                                                  goto LABEL_549;
                                                                                                }
                                                                                                v119 = v116 - 97;
                                                                                                v113 = v109 + 1;
LABEL_548:
                                                                                                if (v119 >= 0x1A)
                                                                                                  return 0;
                                                                                                goto LABEL_549;
                                                                                              }
                                                                                              if (v116 > 0x2E)
                                                                                              {
                                                                                                v2 = 0;
                                                                                                if (v116 == 47)
                                                                                                  return v2;
                                                                                                v113 = v109 + 1;
                                                                                                if (v116 >= 0x3A)
                                                                                                  return v2;
                                                                                                goto LABEL_549;
                                                                                              }
                                                                                              if (v116 < 0x2D)
                                                                                                return 0;
                                                                                              if (v116 == 45)
                                                                                              {
LABEL_532:
                                                                                                v118 = v4 + 1;
                                                                                                v117 = v4[1];
                                                                                                if (v117 > 0x39)
                                                                                                {
                                                                                                  if (v117 <= 0x5A)
                                                                                                  {
                                                                                                    if (v117 < 0x41)
                                                                                                      return 0;
                                                                                                    goto LABEL_571;
                                                                                                  }
                                                                                                  v124 = v117 - 97;
LABEL_570:
                                                                                                  if (v124 >= 0x1A)
                                                                                                    return 0;
                                                                                                  goto LABEL_571;
                                                                                                }
                                                                                                v113 = v4;
                                                                                                if (v117 != 45)
                                                                                                {
                                                                                                  if (v117 < 0x30)
                                                                                                    return 0;
                                                                                                  goto LABEL_571;
                                                                                                }
LABEL_553:
                                                                                                v123 = v113[2];
                                                                                                v122 = v113 + 2;
                                                                                                v121 = v123;
                                                                                                if (v123 <= 0x39)
                                                                                                {
                                                                                                  if (v121 == 45)
                                                                                                  {
                                                                                                    v4 = v122;
                                                                                                    goto LABEL_575;
                                                                                                  }
                                                                                                  if (v121 < 0x30)
                                                                                                    return 0;
                                                                                                  goto LABEL_592;
                                                                                                }
                                                                                                if (v121 <= 0x5A)
                                                                                                {
                                                                                                  if (v121 < 0x41)
                                                                                                    return 0;
                                                                                                  goto LABEL_592;
                                                                                                }
                                                                                                v128 = v121 - 97;
LABEL_591:
                                                                                                if (v128 >= 0x1A)
                                                                                                  return 0;
LABEL_592:
                                                                                                v4 = v122 + 1;
                                                                                                v129 = v122[1];
                                                                                                if (v129 > 0x3D)
                                                                                                {
                                                                                                  if (v129 > 0x5A)
                                                                                                  {
                                                                                                    v133 = v129 - 97;
                                                                                                    v127 = v122 + 1;
                                                                                                    goto LABEL_613;
                                                                                                  }
                                                                                                  if (v129 < 0x3F)
                                                                                                    return ((_DWORD)v4 - (_DWORD)a1 + 1);
                                                                                                  v127 = v122 + 1;
                                                                                                  if (v129 < 0x41)
                                                                                                    return 0;
LABEL_614:
                                                                                                  v134 = v127[1];
                                                                                                  v4 = v127 + 1;
                                                                                                  if (v134 > 0x3D)
                                                                                                  {
                                                                                                    if (v134 <= 0x5A)
                                                                                                    {
                                                                                                      if (v134 < 0x3F)
                                                                                                        return ((_DWORD)v4 - (_DWORD)a1 + 1);
                                                                                                      v131 = v127 + 1;
                                                                                                      if (v134 < 0x41)
                                                                                                        return 0;
                                                                                                      goto LABEL_635;
                                                                                                    }
                                                                                                    v137 = v134 - 97;
                                                                                                    v131 = v127 + 1;
LABEL_634:
                                                                                                    if (v137 >= 0x1A)
                                                                                                      return 0;
                                                                                                    goto LABEL_635;
                                                                                                  }
                                                                                                  if (v134 > 0x2E)
                                                                                                  {
                                                                                                    v2 = 0;
                                                                                                    if (v134 == 47)
                                                                                                      return v2;
                                                                                                    v131 = v127 + 1;
                                                                                                    if (v134 >= 0x3A)
                                                                                                      return v2;
                                                                                                    goto LABEL_635;
                                                                                                  }
                                                                                                  if (v134 < 0x2D)
                                                                                                    return 0;
                                                                                                  if (v134 == 45)
                                                                                                  {
LABEL_618:
                                                                                                    v136 = v4 + 1;
                                                                                                    v135 = v4[1];
                                                                                                    if (v135 > 0x39)
                                                                                                    {
                                                                                                      if (v135 <= 0x5A)
                                                                                                      {
                                                                                                        if (v135 < 0x41)
                                                                                                          return 0;
                                                                                                        goto LABEL_657;
                                                                                                      }
                                                                                                      v142 = v135 - 97;
LABEL_656:
                                                                                                      if (v142 >= 0x1A)
                                                                                                        return 0;
                                                                                                      goto LABEL_657;
                                                                                                    }
                                                                                                    v131 = v4;
                                                                                                    if (v135 != 45)
                                                                                                    {
                                                                                                      if (v135 < 0x30)
                                                                                                        return 0;
                                                                                                      goto LABEL_657;
                                                                                                    }
LABEL_639:
                                                                                                    v141 = v131[2];
                                                                                                    v140 = v131 + 2;
                                                                                                    v139 = v141;
                                                                                                    if (v141 <= 0x39)
                                                                                                    {
                                                                                                      if (v139 == 45)
                                                                                                      {
                                                                                                        v4 = v140;
                                                                                                        goto LABEL_661;
                                                                                                      }
                                                                                                      if (v139 < 0x30)
                                                                                                        return 0;
                                                                                                      goto LABEL_678;
                                                                                                    }
                                                                                                    if (v139 <= 0x5A)
                                                                                                    {
                                                                                                      if (v139 < 0x41)
                                                                                                        return 0;
                                                                                                      goto LABEL_678;
                                                                                                    }
                                                                                                    v146 = v139 - 97;
LABEL_677:
                                                                                                    if (v146 >= 0x1A)
                                                                                                      return 0;
LABEL_678:
                                                                                                    v4 = v140 + 1;
                                                                                                    v147 = v140[1];
                                                                                                    if (v147 > 0x3D)
                                                                                                    {
                                                                                                      if (v147 > 0x5A)
                                                                                                      {
                                                                                                        v151 = v147 - 97;
                                                                                                        v145 = v140 + 1;
                                                                                                        goto LABEL_699;
                                                                                                      }
                                                                                                      if (v147 < 0x3F)
                                                                                                        return ((_DWORD)v4 - (_DWORD)a1 + 1);
                                                                                                      v145 = v140 + 1;
                                                                                                      if (v147 < 0x41)
                                                                                                        return 0;
LABEL_700:
                                                                                                      v152 = v145[1];
                                                                                                      v4 = v145 + 1;
                                                                                                      if (v152 > 0x3D)
                                                                                                      {
                                                                                                        if (v152 <= 0x5A)
                                                                                                        {
                                                                                                          if (v152 < 0x3F)
                                                                                                            return ((_DWORD)v4 - (_DWORD)a1 + 1);
                                                                                                          v149 = v145 + 1;
                                                                                                          if (v152 < 0x41)
                                                                                                            return 0;
                                                                                                          goto LABEL_721;
                                                                                                        }
                                                                                                        v155 = v152 - 97;
                                                                                                        v149 = v145 + 1;
LABEL_720:
                                                                                                        if (v155 >= 0x1A)
                                                                                                          return 0;
                                                                                                        goto LABEL_721;
                                                                                                      }
                                                                                                      if (v152 > 0x2E)
                                                                                                      {
                                                                                                        v2 = 0;
                                                                                                        if (v152 == 47)
                                                                                                          return v2;
                                                                                                        v149 = v145 + 1;
                                                                                                        if (v152 >= 0x3A)
                                                                                                          return v2;
                                                                                                        goto LABEL_721;
                                                                                                      }
                                                                                                      if (v152 < 0x2D)
                                                                                                        return 0;
                                                                                                      if (v152 == 45)
                                                                                                      {
LABEL_704:
                                                                                                        v154 = v4 + 1;
                                                                                                        v153 = v4[1];
                                                                                                        if (v153 > 0x39)
                                                                                                        {
                                                                                                          if (v153 <= 0x5A)
                                                                                                          {
                                                                                                            if (v153 < 0x41)
                                                                                                              return 0;
                                                                                                            goto LABEL_743;
                                                                                                          }
                                                                                                          v160 = v153 - 97;
LABEL_742:
                                                                                                          if (v160 >= 0x1A)
                                                                                                            return 0;
                                                                                                          goto LABEL_743;
                                                                                                        }
                                                                                                        v149 = v4;
                                                                                                        if (v153 != 45)
                                                                                                        {
                                                                                                          if (v153 < 0x30)
                                                                                                            return 0;
                                                                                                          goto LABEL_743;
                                                                                                        }
LABEL_725:
                                                                                                        v159 = v149[2];
                                                                                                        v158 = v149 + 2;
                                                                                                        v157 = v159;
                                                                                                        if (v159 <= 0x39)
                                                                                                        {
                                                                                                          if (v157 == 45)
                                                                                                          {
                                                                                                            v4 = v158;
                                                                                                            goto LABEL_747;
                                                                                                          }
                                                                                                          if (v157 < 0x30)
                                                                                                            return 0;
                                                                                                          goto LABEL_764;
                                                                                                        }
                                                                                                        if (v157 <= 0x5A)
                                                                                                        {
                                                                                                          if (v157 < 0x41)
                                                                                                            return 0;
                                                                                                          goto LABEL_764;
                                                                                                        }
                                                                                                        v164 = v157 - 97;
LABEL_763:
                                                                                                        if (v164 >= 0x1A)
                                                                                                          return 0;
LABEL_764:
                                                                                                        v4 = v158 + 1;
                                                                                                        v165 = v158[1];
                                                                                                        if (v165 > 0x3D)
                                                                                                        {
                                                                                                          if (v165 > 0x5A)
                                                                                                          {
                                                                                                            v169 = v165 - 97;
                                                                                                            v163 = v158 + 1;
                                                                                                            goto LABEL_785;
                                                                                                          }
                                                                                                          if (v165 < 0x3F)
                                                                                                            return ((_DWORD)v4 - (_DWORD)a1 + 1);
                                                                                                          v163 = v158 + 1;
                                                                                                          if (v165 < 0x41)
                                                                                                            return 0;
LABEL_786:
                                                                                                          v170 = v163[1];
                                                                                                          v4 = v163 + 1;
                                                                                                          if (v170 > 0x3D)
                                                                                                          {
                                                                                                            if (v170 <= 0x5A)
                                                                                                            {
                                                                                                              if (v170 < 0x3F)
                                                                                                                return ((_DWORD)v4 - (_DWORD)a1 + 1);
                                                                                                              v167 = v163 + 1;
                                                                                                              if (v170 < 0x41)
                                                                                                                return 0;
                                                                                                              goto LABEL_807;
                                                                                                            }
                                                                                                            v173 = v170 - 97;
                                                                                                            v167 = v163 + 1;
LABEL_806:
                                                                                                            if (v173 >= 0x1A)
                                                                                                              return 0;
                                                                                                            goto LABEL_807;
                                                                                                          }
                                                                                                          if (v170 > 0x2E)
                                                                                                          {
                                                                                                            v2 = 0;
                                                                                                            if (v170 == 47)
                                                                                                              return v2;
                                                                                                            v167 = v163 + 1;
                                                                                                            if (v170 >= 0x3A)
                                                                                                              return v2;
                                                                                                            goto LABEL_807;
                                                                                                          }
                                                                                                          if (v170 < 0x2D)
                                                                                                            return 0;
                                                                                                          if (v170 == 45)
                                                                                                          {
LABEL_790:
                                                                                                            v172 = v4 + 1;
                                                                                                            v171 = v4[1];
                                                                                                            if (v171 > 0x39)
                                                                                                            {
                                                                                                              if (v171 <= 0x5A)
                                                                                                              {
                                                                                                                if (v171 < 0x41)
                                                                                                                  return 0;
                                                                                                                goto LABEL_829;
                                                                                                              }
                                                                                                              v178 = v171 - 97;
LABEL_828:
                                                                                                              if (v178 >= 0x1A)
                                                                                                                return 0;
                                                                                                              goto LABEL_829;
                                                                                                            }
                                                                                                            v167 = v4;
                                                                                                            if (v171 != 45)
                                                                                                            {
                                                                                                              if (v171 < 0x30)
                                                                                                                return 0;
                                                                                                              goto LABEL_829;
                                                                                                            }
LABEL_811:
                                                                                                            v177 = v167[2];
                                                                                                            v176 = v167 + 2;
                                                                                                            v175 = v177;
                                                                                                            if (v177 <= 0x39)
                                                                                                            {
                                                                                                              if (v175 == 45)
                                                                                                              {
                                                                                                                v4 = v176;
                                                                                                                goto LABEL_833;
                                                                                                              }
                                                                                                              if (v175 < 0x30)
                                                                                                                return 0;
                                                                                                              goto LABEL_850;
                                                                                                            }
                                                                                                            if (v175 <= 0x5A)
                                                                                                            {
                                                                                                              if (v175 < 0x41)
                                                                                                                return 0;
                                                                                                              goto LABEL_850;
                                                                                                            }
                                                                                                            v182 = v175 - 97;
LABEL_849:
                                                                                                            if (v182 >= 0x1A)
                                                                                                              return 0;
LABEL_850:
                                                                                                            v4 = v176 + 1;
                                                                                                            v183 = v176[1];
                                                                                                            if (v183 > 0x3D)
                                                                                                            {
                                                                                                              if (v183 > 0x5A)
                                                                                                              {
                                                                                                                v187 = v183 - 97;
                                                                                                                v181 = v176 + 1;
                                                                                                                goto LABEL_871;
                                                                                                              }
                                                                                                              if (v183 < 0x3F)
                                                                                                                return ((_DWORD)v4 - (_DWORD)a1 + 1);
                                                                                                              v181 = v176 + 1;
                                                                                                              if (v183 < 0x41)
                                                                                                                return 0;
LABEL_872:
                                                                                                              v188 = v181[1];
                                                                                                              v4 = v181 + 1;
                                                                                                              if (v188 > 0x3D)
                                                                                                              {
                                                                                                                if (v188 <= 0x5A)
                                                                                                                {
                                                                                                                  if (v188 < 0x3F)
                                                                                                                    return ((_DWORD)v4 - (_DWORD)a1 + 1);
                                                                                                                  v185 = v181 + 1;
                                                                                                                  if (v188 < 0x41)
                                                                                                                    return 0;
                                                                                                                  goto LABEL_893;
                                                                                                                }
                                                                                                                v191 = v188 - 97;
                                                                                                                v185 = v181 + 1;
LABEL_892:
                                                                                                                if (v191 >= 0x1A)
                                                                                                                  return 0;
                                                                                                                goto LABEL_893;
                                                                                                              }
                                                                                                              if (v188 > 0x2E)
                                                                                                              {
                                                                                                                v2 = 0;
                                                                                                                if (v188 == 47)
                                                                                                                  return v2;
                                                                                                                v185 = v181 + 1;
                                                                                                                if (v188 >= 0x3A)
                                                                                                                  return v2;
                                                                                                                goto LABEL_893;
                                                                                                              }
                                                                                                              if (v188 < 0x2D)
                                                                                                                return 0;
                                                                                                              if (v188 == 45)
                                                                                                              {
LABEL_876:
                                                                                                                v190 = v4 + 1;
                                                                                                                v189 = v4[1];
                                                                                                                if (v189 > 0x39)
                                                                                                                {
                                                                                                                  if (v189 <= 0x5A)
                                                                                                                  {
                                                                                                                    if (v189 < 0x41)
                                                                                                                      return 0;
                                                                                                                    goto LABEL_915;
                                                                                                                  }
                                                                                                                  v196 = v189 - 97;
LABEL_914:
                                                                                                                  if (v196 >= 0x1A)
                                                                                                                    return 0;
                                                                                                                  goto LABEL_915;
                                                                                                                }
                                                                                                                v185 = v4;
                                                                                                                if (v189 != 45)
                                                                                                                {
                                                                                                                  if (v189 < 0x30)
                                                                                                                    return 0;
                                                                                                                  goto LABEL_915;
                                                                                                                }
LABEL_897:
                                                                                                                v195 = v185[2];
                                                                                                                v194 = v185 + 2;
                                                                                                                v193 = v195;
                                                                                                                if (v195 <= 0x39)
                                                                                                                {
                                                                                                                  if (v193 == 45)
                                                                                                                  {
                                                                                                                    v4 = v194;
                                                                                                                    goto LABEL_919;
                                                                                                                  }
                                                                                                                  if (v193 < 0x30)
                                                                                                                    return 0;
                                                                                                                  goto LABEL_936;
                                                                                                                }
                                                                                                                if (v193 <= 0x5A)
                                                                                                                {
                                                                                                                  if (v193 < 0x41)
                                                                                                                    return 0;
                                                                                                                  goto LABEL_936;
                                                                                                                }
                                                                                                                v200 = v193 - 97;
LABEL_935:
                                                                                                                if (v200 >= 0x1A)
                                                                                                                  return 0;
LABEL_936:
                                                                                                                v4 = v194 + 1;
                                                                                                                v201 = v194[1];
                                                                                                                if (v201 > 0x3D)
                                                                                                                {
                                                                                                                  if (v201 > 0x5A)
                                                                                                                  {
                                                                                                                    v205 = v201 - 97;
                                                                                                                    v199 = v194 + 1;
                                                                                                                    goto LABEL_957;
                                                                                                                  }
                                                                                                                  if (v201 < 0x3F)
                                                                                                                    return ((_DWORD)v4 - (_DWORD)a1 + 1);
                                                                                                                  v199 = v194 + 1;
                                                                                                                  if (v201 < 0x41)
                                                                                                                    return 0;
LABEL_958:
                                                                                                                  v206 = v199[1];
                                                                                                                  v4 = v199 + 1;
                                                                                                                  if (v206 > 0x3D)
                                                                                                                  {
                                                                                                                    if (v206 <= 0x5A)
                                                                                                                    {
                                                                                                                      if (v206 < 0x3F)
                                                                                                                        return ((_DWORD)v4 - (_DWORD)a1 + 1);
                                                                                                                      v203 = v199 + 1;
                                                                                                                      if (v206 < 0x41)
                                                                                                                        return 0;
                                                                                                                      goto LABEL_979;
                                                                                                                    }
                                                                                                                    v209 = v206 - 97;
                                                                                                                    v203 = v199 + 1;
LABEL_978:
                                                                                                                    if (v209 >= 0x1A)
                                                                                                                      return 0;
                                                                                                                    goto LABEL_979;
                                                                                                                  }
                                                                                                                  if (v206 > 0x2E)
                                                                                                                  {
                                                                                                                    v2 = 0;
                                                                                                                    if (v206 == 47)
                                                                                                                      return v2;
                                                                                                                    v203 = v199 + 1;
                                                                                                                    if (v206 >= 0x3A)
                                                                                                                      return v2;
                                                                                                                    goto LABEL_979;
                                                                                                                  }
                                                                                                                  if (v206 < 0x2D)
                                                                                                                    return 0;
                                                                                                                  if (v206 == 45)
                                                                                                                  {
LABEL_962:
                                                                                                                    v208 = v4 + 1;
                                                                                                                    v207 = v4[1];
                                                                                                                    if (v207 > 0x39)
                                                                                                                    {
                                                                                                                      if (v207 <= 0x5A)
                                                                                                                      {
                                                                                                                        if (v207 < 0x41)
                                                                                                                          return 0;
                                                                                                                        goto LABEL_1001;
                                                                                                                      }
                                                                                                                      v214 = v207 - 97;
LABEL_1000:
                                                                                                                      if (v214 >= 0x1A)
                                                                                                                        return 0;
                                                                                                                      goto LABEL_1001;
                                                                                                                    }
                                                                                                                    v203 = v4;
                                                                                                                    if (v207 != 45)
                                                                                                                    {
                                                                                                                      if (v207 < 0x30)
                                                                                                                        return 0;
                                                                                                                      goto LABEL_1001;
                                                                                                                    }
LABEL_983:
                                                                                                                    v213 = v203[2];
                                                                                                                    v212 = v203 + 2;
                                                                                                                    v211 = v213;
                                                                                                                    if (v213 <= 0x39)
                                                                                                                    {
                                                                                                                      if (v211 == 45)
                                                                                                                      {
                                                                                                                        v4 = v212;
                                                                                                                        goto LABEL_1005;
                                                                                                                      }
                                                                                                                      if (v211 < 0x30)
                                                                                                                        return 0;
                                                                                                                      goto LABEL_1022;
                                                                                                                    }
                                                                                                                    if (v211 <= 0x5A)
                                                                                                                    {
                                                                                                                      if (v211 < 0x41)
                                                                                                                        return 0;
                                                                                                                      goto LABEL_1022;
                                                                                                                    }
                                                                                                                    v218 = v211 - 97;
LABEL_1021:
                                                                                                                    if (v218 >= 0x1A)
                                                                                                                      return 0;
LABEL_1022:
                                                                                                                    v4 = v212 + 1;
                                                                                                                    v219 = v212[1];
                                                                                                                    if (v219 > 0x3D)
                                                                                                                    {
                                                                                                                      if (v219 > 0x5A)
                                                                                                                      {
                                                                                                                        v223 = v219 - 97;
                                                                                                                        v217 = v212 + 1;
                                                                                                                        goto LABEL_1043;
                                                                                                                      }
                                                                                                                      if (v219 < 0x3F)
                                                                                                                        return ((_DWORD)v4 - (_DWORD)a1 + 1);
                                                                                                                      v217 = v212 + 1;
                                                                                                                      if (v219 < 0x41)
                                                                                                                        return 0;
LABEL_1044:
                                                                                                                      v224 = v217[1];
                                                                                                                      v4 = v217 + 1;
                                                                                                                      if (v224 > 0x3D)
                                                                                                                      {
                                                                                                                        if (v224 <= 0x5A)
                                                                                                                        {
                                                                                                                          if (v224 < 0x3F)
                                                                                                                            return ((_DWORD)v4 - (_DWORD)a1 + 1);
                                                                                                                          v221 = v217 + 1;
                                                                                                                          if (v224 < 0x41)
                                                                                                                            return 0;
                                                                                                                          goto LABEL_1065;
                                                                                                                        }
                                                                                                                        v227 = v224 - 97;
                                                                                                                        v221 = v217 + 1;
LABEL_1064:
                                                                                                                        if (v227 >= 0x1A)
                                                                                                                          return 0;
                                                                                                                        goto LABEL_1065;
                                                                                                                      }
                                                                                                                      if (v224 > 0x2E)
                                                                                                                      {
                                                                                                                        v2 = 0;
                                                                                                                        if (v224 == 47)
                                                                                                                          return v2;
                                                                                                                        v221 = v217 + 1;
                                                                                                                        if (v224 >= 0x3A)
                                                                                                                          return v2;
                                                                                                                        goto LABEL_1065;
                                                                                                                      }
                                                                                                                      if (v224 < 0x2D)
                                                                                                                        return 0;
                                                                                                                      if (v224 == 45)
                                                                                                                      {
LABEL_1048:
                                                                                                                        v226 = v4 + 1;
                                                                                                                        v225 = v4[1];
                                                                                                                        if (v225 > 0x39)
                                                                                                                        {
                                                                                                                          if (v225 <= 0x5A)
                                                                                                                          {
                                                                                                                            if (v225 < 0x41)
                                                                                                                              return 0;
                                                                                                                            goto LABEL_1087;
                                                                                                                          }
                                                                                                                          v232 = v225 - 97;
LABEL_1086:
                                                                                                                          if (v232 >= 0x1A)
                                                                                                                            return 0;
                                                                                                                          goto LABEL_1087;
                                                                                                                        }
                                                                                                                        v221 = v4;
                                                                                                                        if (v225 != 45)
                                                                                                                        {
                                                                                                                          if (v225 < 0x30)
                                                                                                                            return 0;
                                                                                                                          goto LABEL_1087;
                                                                                                                        }
LABEL_1069:
                                                                                                                        v231 = v221[2];
                                                                                                                        v230 = v221 + 2;
                                                                                                                        v229 = v231;
                                                                                                                        if (v231 <= 0x39)
                                                                                                                        {
                                                                                                                          if (v229 == 45)
                                                                                                                          {
                                                                                                                            v4 = v230;
                                                                                                                            goto LABEL_1091;
                                                                                                                          }
                                                                                                                          if (v229 < 0x30)
                                                                                                                            return 0;
                                                                                                                          goto LABEL_1108;
                                                                                                                        }
                                                                                                                        if (v229 <= 0x5A)
                                                                                                                        {
                                                                                                                          if (v229 < 0x41)
                                                                                                                            return 0;
                                                                                                                          goto LABEL_1108;
                                                                                                                        }
                                                                                                                        v236 = v229 - 97;
LABEL_1107:
                                                                                                                        if (v236 >= 0x1A)
                                                                                                                          return 0;
LABEL_1108:
                                                                                                                        v4 = v230 + 1;
                                                                                                                        v237 = v230[1];
                                                                                                                        if (v237 > 0x3D)
                                                                                                                        {
                                                                                                                          if (v237 > 0x5A)
                                                                                                                          {
                                                                                                                            v241 = v237 - 97;
                                                                                                                            v235 = v230 + 1;
                                                                                                                            goto LABEL_1129;
                                                                                                                          }
                                                                                                                          if (v237 < 0x3F)
                                                                                                                            return ((_DWORD)v4 - (_DWORD)a1 + 1);
                                                                                                                          v235 = v230 + 1;
                                                                                                                          if (v237 < 0x41)
                                                                                                                            return 0;
LABEL_1130:
                                                                                                                          v242 = v235[1];
                                                                                                                          v4 = v235 + 1;
                                                                                                                          if (v242 > 0x3D)
                                                                                                                          {
                                                                                                                            if (v242 <= 0x5A)
                                                                                                                            {
                                                                                                                              if (v242 < 0x3F)
                                                                                                                                return ((_DWORD)v4 - (_DWORD)a1 + 1);
                                                                                                                              v239 = v235 + 1;
                                                                                                                              if (v242 < 0x41)
                                                                                                                                return 0;
                                                                                                                              goto LABEL_1151;
                                                                                                                            }
                                                                                                                            v245 = v242 - 97;
                                                                                                                            v239 = v235 + 1;
LABEL_1150:
                                                                                                                            if (v245 >= 0x1A)
                                                                                                                              return 0;
                                                                                                                            goto LABEL_1151;
                                                                                                                          }
                                                                                                                          if (v242 > 0x2E)
                                                                                                                          {
                                                                                                                            v2 = 0;
                                                                                                                            if (v242 == 47)
                                                                                                                              return v2;
                                                                                                                            v239 = v235 + 1;
                                                                                                                            if (v242 >= 0x3A)
                                                                                                                              return v2;
                                                                                                                            goto LABEL_1151;
                                                                                                                          }
                                                                                                                          if (v242 < 0x2D)
                                                                                                                            return 0;
                                                                                                                          if (v242 == 45)
                                                                                                                          {
LABEL_1134:
                                                                                                                            v244 = v4 + 1;
                                                                                                                            v243 = v4[1];
                                                                                                                            if (v243 > 0x39)
                                                                                                                            {
                                                                                                                              if (v243 <= 0x5A)
                                                                                                                              {
                                                                                                                                if (v243 < 0x41)
                                                                                                                                  return 0;
                                                                                                                                goto LABEL_1174;
                                                                                                                              }
                                                                                                                              v249 = v243 - 97;
LABEL_1173:
                                                                                                                              if (v249 >= 0x1A)
                                                                                                                                return 0;
                                                                                                                              goto LABEL_1174;
                                                                                                                            }
                                                                                                                            v239 = v4;
                                                                                                                            if (v243 != 45)
                                                                                                                            {
                                                                                                                              if (v243 < 0x30)
                                                                                                                                return 0;
                                                                                                                              goto LABEL_1174;
                                                                                                                            }
LABEL_1155:
                                                                                                                            v247 = v239[2];
                                                                                                                            v248 = v239 + 2;
                                                                                                                            if (v247 <= 0x39)
                                                                                                                            {
                                                                                                                              if (v247 == 45)
                                                                                                                                goto LABEL_1179;
                                                                                                                              if (v247 < 0x30)
                                                                                                                                return 0;
                                                                                                                              goto LABEL_1196;
                                                                                                                            }
                                                                                                                            if (v247 <= 0x5A)
                                                                                                                            {
                                                                                                                              if (v247 < 0x41)
                                                                                                                                return 0;
                                                                                                                              goto LABEL_1196;
                                                                                                                            }
                                                                                                                            v255 = v247 - 97;
LABEL_1195:
                                                                                                                            if (v255 >= 0x1A)
                                                                                                                              return 0;
LABEL_1196:
                                                                                                                            v254 = v248 + 1;
                                                                                                                            v256 = v248[1];
                                                                                                                            if (v256 > 0x3D)
                                                                                                                            {
                                                                                                                              if (v256 > 0x5A)
                                                                                                                              {
                                                                                                                                v259 = v256 - 97;
                                                                                                                                goto LABEL_1219;
                                                                                                                              }
                                                                                                                              if (v256 < 0x3F)
                                                                                                                                goto LABEL_1367;
                                                                                                                              if (v256 < 0x41)
                                                                                                                                return 0;
LABEL_1220:
                                                                                                                              v261 = *++v254;
                                                                                                                              v260 = v261;
                                                                                                                              if (v261 > 0x3D)
                                                                                                                              {
                                                                                                                                if (v260 <= 0x5A)
                                                                                                                                {
                                                                                                                                  if (v260 < 0x3F)
                                                                                                                                  {
LABEL_1367:
                                                                                                                                    LODWORD(v4) = (_DWORD)v254;
                                                                                                                                    return ((_DWORD)v4 - (_DWORD)a1 + 1);
                                                                                                                                  }
                                                                                                                                  if (v260 < 0x41)
                                                                                                                                    return 0;
                                                                                                                                  goto LABEL_1242;
                                                                                                                                }
                                                                                                                                v264 = v260 - 97;
LABEL_1241:
                                                                                                                                if (v264 >= 0x1A)
                                                                                                                                  return 0;
                                                                                                                                goto LABEL_1242;
                                                                                                                              }
                                                                                                                              if (v260 > 0x2E)
                                                                                                                              {
                                                                                                                                v2 = 0;
                                                                                                                                if (v260 == 47 || v260 >= 0x3A)
                                                                                                                                  return v2;
                                                                                                                                goto LABEL_1242;
                                                                                                                              }
                                                                                                                              v262 = v260 == 45;
                                                                                                                              if (v260 < 0x2D)
                                                                                                                                return 0;
                                                                                                                              v4 = v254;
                                                                                                                              if (v262)
                                                                                                                              {
LABEL_1225:
                                                                                                                                v248 = v254 + 1;
                                                                                                                                v263 = v254[1];
                                                                                                                                if (v263 > 0x39)
                                                                                                                                {
                                                                                                                                  if (v263 <= 0x5A)
                                                                                                                                  {
                                                                                                                                    if (v263 < 0x41)
                                                                                                                                      return 0;
                                                                                                                                    goto LABEL_1266;
                                                                                                                                  }
                                                                                                                                  v268 = v263 - 97;
LABEL_1265:
                                                                                                                                  if (v268 >= 0x1A)
                                                                                                                                    return 0;
                                                                                                                                  goto LABEL_1266;
                                                                                                                                }
                                                                                                                                if (v263 != 45)
                                                                                                                                {
                                                                                                                                  if (v263 < 0x30)
                                                                                                                                    return 0;
                                                                                                                                  goto LABEL_1266;
                                                                                                                                }
LABEL_1247:
                                                                                                                                v267 = v254[2];
                                                                                                                                v248 = v254 + 2;
                                                                                                                                if (v267 > 0x39)
                                                                                                                                {
                                                                                                                                  if (v267 <= 0x5A)
                                                                                                                                  {
                                                                                                                                    if (v267 < 0x41)
                                                                                                                                      return 0;
                                                                                                                                    goto LABEL_1288;
                                                                                                                                  }
                                                                                                                                  v273 = v267 - 97;
                                                                                                                                  goto LABEL_1287;
                                                                                                                                }
                                                                                                                                if (v267 == 45)
                                                                                                                                  goto LABEL_1271;
                                                                                                                                if (v267 < 0x30)
                                                                                                                                  return 0;
LABEL_1288:
                                                                                                                                v4 = v248 + 1;
                                                                                                                                v274 = v248[1];
                                                                                                                                if (v274 > 0x3D)
                                                                                                                                {
                                                                                                                                  if (v274 <= 0x5A)
                                                                                                                                  {
                                                                                                                                    if (v274 < 0x3F)
                                                                                                                                      return ((_DWORD)v4 - (_DWORD)a1 + 1);
                                                                                                                                    if (v274 < 0x41)
                                                                                                                                      return 0;
                                                                                                                                    goto LABEL_1310;
                                                                                                                                  }
                                                                                                                                  v276 = v274 - 97;
LABEL_1309:
                                                                                                                                  if (v276 >= 0x1A)
                                                                                                                                    return 0;
                                                                                                                                  goto LABEL_1310;
                                                                                                                                }
                                                                                                                                if (v274 > 0x2E)
                                                                                                                                {
                                                                                                                                  v2 = 0;
                                                                                                                                  if (v274 == 47 || v274 >= 0x3A)
                                                                                                                                    return v2;
                                                                                                                                  goto LABEL_1310;
                                                                                                                                }
                                                                                                                                if (v274 < 0x2D)
                                                                                                                                  return 0;
                                                                                                                                if (v274 == 45)
                                                                                                                                {
LABEL_1292:
                                                                                                                                  v275 = v248[2];
                                                                                                                                  v4 = v248 + 2;
                                                                                                                                  if (v275 > 0x40)
                                                                                                                                  {
                                                                                                                                    if (v275 >= 0x5B && v275 - 97 >= 0x1A)
                                                                                                                                      return 0;
                                                                                                                                  }
                                                                                                                                  else if (v275 - 48 >= 0xA)
                                                                                                                                  {
                                                                                                                                    return 0;
                                                                                                                                  }
                                                                                                                                  goto LABEL_1326;
                                                                                                                                }
                                                                                                                              }
                                                                                                                            }
                                                                                                                            else
                                                                                                                            {
                                                                                                                              if (v256 > 0x2E)
                                                                                                                              {
                                                                                                                                v2 = 0;
                                                                                                                                if (v256 == 47 || v256 >= 0x3A)
                                                                                                                                  return v2;
                                                                                                                                goto LABEL_1220;
                                                                                                                              }
                                                                                                                              v257 = v256 == 45;
                                                                                                                              if (v256 < 0x2D)
                                                                                                                                return 0;
                                                                                                                              v4 = v248 + 1;
                                                                                                                              if (v257)
                                                                                                                                goto LABEL_1201;
                                                                                                                            }
                                                                                                                          }
                                                                                                                        }
                                                                                                                        else
                                                                                                                        {
                                                                                                                          if (v237 > 0x2E)
                                                                                                                          {
                                                                                                                            v2 = 0;
                                                                                                                            if (v237 == 47)
                                                                                                                              return v2;
                                                                                                                            v235 = v230 + 1;
                                                                                                                            if (v237 >= 0x3A)
                                                                                                                              return v2;
                                                                                                                            goto LABEL_1130;
                                                                                                                          }
                                                                                                                          if (v237 < 0x2D)
                                                                                                                            return 0;
                                                                                                                          if (v237 == 45)
                                                                                                                            goto LABEL_1112;
                                                                                                                        }
                                                                                                                      }
                                                                                                                    }
                                                                                                                    else
                                                                                                                    {
                                                                                                                      if (v219 > 0x2E)
                                                                                                                      {
                                                                                                                        v2 = 0;
                                                                                                                        if (v219 == 47)
                                                                                                                          return v2;
                                                                                                                        v217 = v212 + 1;
                                                                                                                        if (v219 >= 0x3A)
                                                                                                                          return v2;
                                                                                                                        goto LABEL_1044;
                                                                                                                      }
                                                                                                                      if (v219 < 0x2D)
                                                                                                                        return 0;
                                                                                                                      if (v219 == 45)
                                                                                                                        goto LABEL_1026;
                                                                                                                    }
                                                                                                                  }
                                                                                                                }
                                                                                                                else
                                                                                                                {
                                                                                                                  if (v201 > 0x2E)
                                                                                                                  {
                                                                                                                    v2 = 0;
                                                                                                                    if (v201 == 47)
                                                                                                                      return v2;
                                                                                                                    v199 = v194 + 1;
                                                                                                                    if (v201 >= 0x3A)
                                                                                                                      return v2;
                                                                                                                    goto LABEL_958;
                                                                                                                  }
                                                                                                                  if (v201 < 0x2D)
                                                                                                                    return 0;
                                                                                                                  if (v201 == 45)
                                                                                                                    goto LABEL_940;
                                                                                                                }
                                                                                                              }
                                                                                                            }
                                                                                                            else
                                                                                                            {
                                                                                                              if (v183 > 0x2E)
                                                                                                              {
                                                                                                                v2 = 0;
                                                                                                                if (v183 == 47)
                                                                                                                  return v2;
                                                                                                                v181 = v176 + 1;
                                                                                                                if (v183 >= 0x3A)
                                                                                                                  return v2;
                                                                                                                goto LABEL_872;
                                                                                                              }
                                                                                                              if (v183 < 0x2D)
                                                                                                                return 0;
                                                                                                              if (v183 == 45)
                                                                                                                goto LABEL_854;
                                                                                                            }
                                                                                                          }
                                                                                                        }
                                                                                                        else
                                                                                                        {
                                                                                                          if (v165 > 0x2E)
                                                                                                          {
                                                                                                            v2 = 0;
                                                                                                            if (v165 == 47)
                                                                                                              return v2;
                                                                                                            v163 = v158 + 1;
                                                                                                            if (v165 >= 0x3A)
                                                                                                              return v2;
                                                                                                            goto LABEL_786;
                                                                                                          }
                                                                                                          if (v165 < 0x2D)
                                                                                                            return 0;
                                                                                                          if (v165 == 45)
                                                                                                            goto LABEL_768;
                                                                                                        }
                                                                                                      }
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      if (v147 > 0x2E)
                                                                                                      {
                                                                                                        v2 = 0;
                                                                                                        if (v147 == 47)
                                                                                                          return v2;
                                                                                                        v145 = v140 + 1;
                                                                                                        if (v147 >= 0x3A)
                                                                                                          return v2;
                                                                                                        goto LABEL_700;
                                                                                                      }
                                                                                                      if (v147 < 0x2D)
                                                                                                        return 0;
                                                                                                      if (v147 == 45)
                                                                                                        goto LABEL_682;
                                                                                                    }
                                                                                                  }
                                                                                                }
                                                                                                else
                                                                                                {
                                                                                                  if (v129 > 0x2E)
                                                                                                  {
                                                                                                    v2 = 0;
                                                                                                    if (v129 == 47)
                                                                                                      return v2;
                                                                                                    v127 = v122 + 1;
                                                                                                    if (v129 >= 0x3A)
                                                                                                      return v2;
                                                                                                    goto LABEL_614;
                                                                                                  }
                                                                                                  if (v129 < 0x2D)
                                                                                                    return 0;
                                                                                                  if (v129 == 45)
                                                                                                    goto LABEL_596;
                                                                                                }
                                                                                              }
                                                                                            }
                                                                                            else
                                                                                            {
                                                                                              if (v111 > 0x2E)
                                                                                              {
                                                                                                v2 = 0;
                                                                                                if (v111 == 47)
                                                                                                  return v2;
                                                                                                v109 = v104 + 1;
                                                                                                if (v111 >= 0x3A)
                                                                                                  return v2;
                                                                                                goto LABEL_528;
                                                                                              }
                                                                                              if (v111 < 0x2D)
                                                                                                return 0;
                                                                                              if (v111 == 45)
                                                                                                goto LABEL_510;
                                                                                            }
                                                                                          }
                                                                                        }
                                                                                        else
                                                                                        {
                                                                                          if (v93 > 0x2E)
                                                                                          {
                                                                                            v2 = 0;
                                                                                            if (v93 == 47)
                                                                                              return v2;
                                                                                            v91 = v86 + 1;
                                                                                            if (v93 >= 0x3A)
                                                                                              return v2;
                                                                                            goto LABEL_442;
                                                                                          }
                                                                                          if (v93 < 0x2D)
                                                                                            return 0;
                                                                                          if (v93 == 45)
                                                                                            goto LABEL_424;
                                                                                        }
                                                                                      }
                                                                                    }
                                                                                    else
                                                                                    {
                                                                                      if (v75 > 0x2E)
                                                                                      {
                                                                                        v2 = 0;
                                                                                        if (v75 == 47)
                                                                                          return v2;
                                                                                        v73 = v68 + 1;
                                                                                        if (v75 >= 0x3A)
                                                                                          return v2;
                                                                                        goto LABEL_356;
                                                                                      }
                                                                                      if (v75 < 0x2D)
                                                                                        return 0;
                                                                                      if (v75 == 45)
                                                                                        goto LABEL_338;
                                                                                    }
                                                                                  }
                                                                                }
                                                                                else
                                                                                {
                                                                                  if (v57 > 0x2E)
                                                                                  {
                                                                                    v2 = 0;
                                                                                    if (v57 == 47)
                                                                                      return v2;
                                                                                    v55 = v50 + 1;
                                                                                    if (v57 >= 0x3A)
                                                                                      return v2;
                                                                                    goto LABEL_269;
                                                                                  }
                                                                                  if (v57 < 0x2D)
                                                                                    return 0;
                                                                                  if (v57 == 45)
                                                                                    goto LABEL_254;
                                                                                }
                                                                              }
                                                                            }
                                                                            else
                                                                            {
                                                                              if (v39 > 0x2E)
                                                                              {
                                                                                v2 = 0;
                                                                                if (v39 == 47)
                                                                                  return v2;
                                                                                v37 = v32 + 1;
                                                                                if (v39 >= 0x3A)
                                                                                  return v2;
                                                                                goto LABEL_188;
                                                                              }
                                                                              if (v39 < 0x2D)
                                                                                return 0;
                                                                              if (v39 == 45)
                                                                                goto LABEL_176;
                                                                            }
                                                                          }
                                                                        }
                                                                        else
                                                                        {
                                                                          if (v21 > 0x2E)
                                                                          {
                                                                            v2 = 0;
                                                                            if (v21 == 47 || v21 >= 0x3A)
                                                                              return v2;
                                                                            goto LABEL_122;
                                                                          }
                                                                          if (v21 < 0x2D)
                                                                            return 0;
                                                                          if (v21 == 45)
                                                                            goto LABEL_110;
                                                                        }
                                                                      }
                                                                    }
                                                                    if (v9 > 0x5A)
                                                                    {
                                                                      if (v9 - 97 >= 0x1A)
                                                                        return 0;
                                                                    }
                                                                    else
                                                                    {
                                                                      if (v9 < 0x3F)
                                                                        return ((_DWORD)v4 - (_DWORD)a1 + 1);
                                                                      if (v9 < 0x41)
                                                                        return 0;
                                                                    }
LABEL_56:
                                                                    v4 = v6 + 3;
                                                                    v11 = v6[3];
                                                                    if (v11 > 0x3D)
                                                                      break;
                                                                    if (v11 > 0x2E)
                                                                    {
                                                                      v2 = 0;
                                                                      if (v11 == 47 || v11 >= 0x3A)
                                                                        return v2;
                                                                      goto LABEL_73;
                                                                    }
                                                                    if (v11 < 0x2D)
                                                                      return 0;
                                                                    if (v11 == 45)
                                                                      goto LABEL_60;
                                                                  }
                                                                  if (v11 > 0x5A)
                                                                  {
                                                                    v13 = v11 - 97;
                                                                    goto LABEL_72;
                                                                  }
                                                                  if (v11 < 0x3F)
                                                                    return ((_DWORD)v4 - (_DWORD)a1 + 1);
                                                                  if (v11 < 0x41)
                                                                    return 0;
LABEL_73:
                                                                  v4 = v6 + 4;
                                                                  v14 = v6[4];
                                                                  if (v14 > 0x3D)
                                                                    break;
                                                                  if (v14 > 0x2E)
                                                                  {
                                                                    v2 = 0;
                                                                    if (v14 == 47 || v14 >= 0x3A)
                                                                      return v2;
                                                                    goto LABEL_89;
                                                                  }
                                                                  if (v14 < 0x2D)
                                                                    return 0;
                                                                  if (v14 == 45)
                                                                    goto LABEL_77;
                                                                }
                                                                if (v14 > 0x5A)
                                                                {
                                                                  v17 = v14 - 97;
                                                                  goto LABEL_88;
                                                                }
                                                                if (v14 < 0x3F)
                                                                  return ((_DWORD)v4 - (_DWORD)a1 + 1);
                                                                if (v14 < 0x41)
                                                                  return 0;
LABEL_89:
                                                                v4 = v6 + 5;
                                                                v18 = v6[5];
                                                                if (v18 > 0x3D)
                                                                {
                                                                  if (v18 <= 0x5A)
                                                                  {
                                                                    if (v18 < 0x3F)
                                                                      return ((_DWORD)v4 - (_DWORD)a1 + 1);
                                                                    v16 = v6 + 5;
                                                                    if (v18 < 0x41)
                                                                      return 0;
                                                                    goto LABEL_106;
                                                                  }
                                                                  v20 = v18 - 97;
                                                                  v16 = v6 + 5;
                                                                  goto LABEL_105;
                                                                }
                                                                if (v18 > 0x2E)
                                                                {
                                                                  v2 = 0;
                                                                  if (v18 == 47)
                                                                    return v2;
                                                                  v16 = v6 + 5;
                                                                  if (v18 >= 0x3A)
                                                                    return v2;
                                                                  goto LABEL_106;
                                                                }
                                                                if (v18 < 0x2D)
                                                                  return 0;
                                                              }
                                                              while (v18 != 45);
LABEL_93:
                                                              v19 = v6[6];
                                                              if (v19 > 0x39)
                                                              {
                                                                if (v19 <= 0x5A)
                                                                {
                                                                  if (v19 < 0x41)
                                                                    return 0;
                                                                  goto LABEL_122;
                                                                }
                                                                v25 = v19 - 97;
LABEL_121:
                                                                if (v25 >= 0x1A)
                                                                  return 0;
                                                                goto LABEL_122;
                                                              }
                                                              v16 = v4;
                                                              if (v19 != 45)
                                                              {
                                                                if (v19 < 0x30)
                                                                  return 0;
                                                                goto LABEL_122;
                                                              }
LABEL_110:
                                                              v24 = v16[2];
                                                              v23 = v16 + 2;
                                                              v22 = v24;
                                                              if (v24 > 0x39)
                                                              {
                                                                if (v22 <= 0x5A)
                                                                {
                                                                  if (v22 < 0x41)
                                                                    return 0;
                                                                  goto LABEL_139;
                                                                }
                                                                v29 = v22 - 97;
                                                                goto LABEL_138;
                                                              }
                                                              if (v22 == 45)
                                                              {
                                                                v4 = v23;
                                                                goto LABEL_126;
                                                              }
                                                              if (v22 < 0x30)
                                                                return 0;
LABEL_139:
                                                              v4 = v23 + 1;
                                                              v30 = v23[1];
                                                              if (v30 > 0x3D)
                                                                break;
                                                              if (v30 > 0x2E)
                                                              {
                                                                v2 = 0;
                                                                if (v30 == 47)
                                                                  return v2;
                                                                v28 = v23 + 1;
                                                                if (v30 >= 0x3A)
                                                                  return v2;
                                                                goto LABEL_155;
                                                              }
                                                              if (v30 < 0x2D)
                                                                return 0;
                                                              if (v30 == 45)
                                                                goto LABEL_143;
                                                            }
                                                            if (v30 > 0x5A)
                                                            {
                                                              v34 = v30 - 97;
                                                              v28 = v23 + 1;
                                                              goto LABEL_154;
                                                            }
                                                            if (v30 < 0x3F)
                                                              return ((_DWORD)v4 - (_DWORD)a1 + 1);
                                                            v28 = v23 + 1;
                                                            if (v30 < 0x41)
                                                              return 0;
LABEL_155:
                                                            v35 = v28[1];
                                                            v4 = v28 + 1;
                                                            if (v35 > 0x3D)
                                                            {
                                                              if (v35 <= 0x5A)
                                                              {
                                                                if (v35 < 0x3F)
                                                                  return ((_DWORD)v4 - (_DWORD)a1 + 1);
                                                                v32 = v28 + 1;
                                                                if (v35 < 0x41)
                                                                  return 0;
                                                                goto LABEL_172;
                                                              }
                                                              v38 = v35 - 97;
                                                              v32 = v28 + 1;
                                                              goto LABEL_171;
                                                            }
                                                            if (v35 > 0x2E)
                                                            {
                                                              v2 = 0;
                                                              if (v35 == 47)
                                                                return v2;
                                                              v32 = v28 + 1;
                                                              if (v35 >= 0x3A)
                                                                return v2;
                                                              goto LABEL_172;
                                                            }
                                                            if (v35 < 0x2D)
                                                              return 0;
                                                          }
                                                          while (v35 != 45);
LABEL_159:
                                                          v37 = v4 + 1;
                                                          v36 = v4[1];
                                                          if (v36 > 0x39)
                                                          {
                                                            if (v36 <= 0x5A)
                                                            {
                                                              if (v36 < 0x41)
                                                                return 0;
                                                              goto LABEL_188;
                                                            }
                                                            v43 = v36 - 97;
LABEL_187:
                                                            if (v43 >= 0x1A)
                                                              return 0;
                                                            goto LABEL_188;
                                                          }
                                                          v32 = v4;
                                                          if (v36 != 45)
                                                          {
                                                            if (v36 < 0x30)
                                                              return 0;
                                                            goto LABEL_188;
                                                          }
LABEL_176:
                                                          v42 = v32[2];
                                                          v41 = v32 + 2;
                                                          v40 = v42;
                                                          if (v42 > 0x39)
                                                          {
                                                            if (v40 <= 0x5A)
                                                            {
                                                              if (v40 < 0x41)
                                                                return 0;
                                                              goto LABEL_211;
                                                            }
                                                            v47 = v40 - 97;
                                                            goto LABEL_210;
                                                          }
                                                          if (v40 == 45)
                                                          {
                                                            v4 = v41;
                                                            goto LABEL_192;
                                                          }
                                                          if (v40 < 0x30)
                                                            return 0;
LABEL_211:
                                                          v4 = v41 + 1;
                                                          v48 = v41[1];
                                                          if (v48 > 0x3D)
                                                            break;
                                                          if (v48 > 0x2E)
                                                          {
                                                            v2 = 0;
                                                            if (v48 == 47)
                                                              return v2;
                                                            v46 = v41 + 1;
                                                            if (v48 >= 0x3A)
                                                              return v2;
                                                            goto LABEL_230;
                                                          }
                                                          if (v48 < 0x2D)
                                                            return 0;
                                                          if (v48 == 45)
                                                            goto LABEL_215;
                                                        }
                                                        if (v48 > 0x5A)
                                                        {
                                                          v52 = v48 - 97;
                                                          v46 = v41 + 1;
                                                          goto LABEL_229;
                                                        }
                                                        if (v48 < 0x3F)
                                                          return ((_DWORD)v4 - (_DWORD)a1 + 1);
                                                        v46 = v41 + 1;
                                                        if (v48 < 0x41)
                                                          return 0;
LABEL_230:
                                                        v53 = v46[1];
                                                        v4 = v46 + 1;
                                                        if (v53 > 0x3D)
                                                        {
                                                          if (v53 <= 0x5A)
                                                          {
                                                            if (v53 < 0x3F)
                                                              return ((_DWORD)v4 - (_DWORD)a1 + 1);
                                                            v50 = v46 + 1;
                                                            if (v53 < 0x41)
                                                              return 0;
                                                            goto LABEL_250;
                                                          }
                                                          v56 = v53 - 97;
                                                          v50 = v46 + 1;
                                                          goto LABEL_249;
                                                        }
                                                        if (v53 > 0x2E)
                                                        {
                                                          v2 = 0;
                                                          if (v53 == 47)
                                                            return v2;
                                                          v50 = v46 + 1;
                                                          if (v53 >= 0x3A)
                                                            return v2;
                                                          goto LABEL_250;
                                                        }
                                                        if (v53 < 0x2D)
                                                          return 0;
                                                      }
                                                      while (v53 != 45);
LABEL_234:
                                                      v55 = v4 + 1;
                                                      v54 = v4[1];
                                                      if (v54 > 0x39)
                                                      {
                                                        if (v54 <= 0x5A)
                                                        {
                                                          if (v54 < 0x41)
                                                            return 0;
                                                          goto LABEL_269;
                                                        }
                                                        v61 = v54 - 97;
LABEL_268:
                                                        if (v61 >= 0x1A)
                                                          return 0;
                                                        goto LABEL_269;
                                                      }
                                                      v50 = v4;
                                                      if (v54 != 45)
                                                      {
                                                        if (v54 < 0x30)
                                                          return 0;
                                                        goto LABEL_269;
                                                      }
LABEL_254:
                                                      v60 = v50[2];
                                                      v59 = v50 + 2;
                                                      v58 = v60;
                                                      if (v60 > 0x39)
                                                      {
                                                        if (v58 <= 0x5A)
                                                        {
                                                          if (v58 < 0x41)
                                                            return 0;
                                                          goto LABEL_290;
                                                        }
                                                        v65 = v58 - 97;
                                                        goto LABEL_289;
                                                      }
                                                      if (v58 == 45)
                                                      {
                                                        v4 = v59;
                                                        goto LABEL_273;
                                                      }
                                                      if (v58 < 0x30)
                                                        return 0;
LABEL_290:
                                                      v4 = v59 + 1;
                                                      v66 = v59[1];
                                                      if (v66 > 0x3D)
                                                        break;
                                                      if (v66 > 0x2E)
                                                      {
                                                        v2 = 0;
                                                        if (v66 == 47)
                                                          return v2;
                                                        v64 = v59 + 1;
                                                        if (v66 >= 0x3A)
                                                          return v2;
                                                        goto LABEL_313;
                                                      }
                                                      if (v66 < 0x2D)
                                                        return 0;
                                                      if (v66 == 45)
                                                        goto LABEL_294;
                                                    }
                                                    if (v66 > 0x5A)
                                                    {
                                                      v70 = v66 - 97;
                                                      v64 = v59 + 1;
                                                      goto LABEL_312;
                                                    }
                                                    if (v66 < 0x3F)
                                                      return ((_DWORD)v4 - (_DWORD)a1 + 1);
                                                    v64 = v59 + 1;
                                                    if (v66 < 0x41)
                                                      return 0;
LABEL_313:
                                                    v71 = v64[1];
                                                    v4 = v64 + 1;
                                                    if (v71 > 0x3D)
                                                    {
                                                      if (v71 <= 0x5A)
                                                      {
                                                        if (v71 < 0x3F)
                                                          return ((_DWORD)v4 - (_DWORD)a1 + 1);
                                                        v68 = v64 + 1;
                                                        if (v71 < 0x41)
                                                          return 0;
                                                        goto LABEL_334;
                                                      }
                                                      v74 = v71 - 97;
                                                      v68 = v64 + 1;
                                                      goto LABEL_333;
                                                    }
                                                    if (v71 > 0x2E)
                                                    {
                                                      v2 = 0;
                                                      if (v71 == 47)
                                                        return v2;
                                                      v68 = v64 + 1;
                                                      if (v71 >= 0x3A)
                                                        return v2;
                                                      goto LABEL_334;
                                                    }
                                                    if (v71 < 0x2D)
                                                      return 0;
                                                  }
                                                  while (v71 != 45);
LABEL_317:
                                                  v73 = v4 + 1;
                                                  v72 = v4[1];
                                                  if (v72 > 0x39)
                                                  {
                                                    if (v72 <= 0x5A)
                                                    {
                                                      if (v72 < 0x41)
                                                        return 0;
                                                      goto LABEL_356;
                                                    }
                                                    v79 = v72 - 97;
LABEL_355:
                                                    if (v79 >= 0x1A)
                                                      return 0;
                                                    goto LABEL_356;
                                                  }
                                                  v68 = v4;
                                                  if (v72 != 45)
                                                  {
                                                    if (v72 < 0x30)
                                                      return 0;
                                                    goto LABEL_356;
                                                  }
LABEL_338:
                                                  v78 = v68[2];
                                                  v77 = v68 + 2;
                                                  v76 = v78;
                                                  if (v78 > 0x39)
                                                  {
                                                    if (v76 <= 0x5A)
                                                    {
                                                      if (v76 < 0x41)
                                                        return 0;
                                                      goto LABEL_377;
                                                    }
                                                    v83 = v76 - 97;
                                                    goto LABEL_376;
                                                  }
                                                  if (v76 == 45)
                                                  {
                                                    v4 = v77;
                                                    goto LABEL_360;
                                                  }
                                                  if (v76 < 0x30)
                                                    return 0;
LABEL_377:
                                                  v4 = v77 + 1;
                                                  v84 = v77[1];
                                                  if (v84 > 0x3D)
                                                    break;
                                                  if (v84 > 0x2E)
                                                  {
                                                    v2 = 0;
                                                    if (v84 == 47)
                                                      return v2;
                                                    v82 = v77 + 1;
                                                    if (v84 >= 0x3A)
                                                      return v2;
                                                    goto LABEL_399;
                                                  }
                                                  if (v84 < 0x2D)
                                                    return 0;
                                                  if (v84 == 45)
                                                    goto LABEL_381;
                                                }
                                                if (v84 > 0x5A)
                                                {
                                                  v88 = v84 - 97;
                                                  v82 = v77 + 1;
                                                  goto LABEL_398;
                                                }
                                                if (v84 < 0x3F)
                                                  return ((_DWORD)v4 - (_DWORD)a1 + 1);
                                                v82 = v77 + 1;
                                                if (v84 < 0x41)
                                                  return 0;
LABEL_399:
                                                v89 = v82[1];
                                                v4 = v82 + 1;
                                                if (v89 > 0x3D)
                                                {
                                                  if (v89 <= 0x5A)
                                                  {
                                                    if (v89 < 0x3F)
                                                      return ((_DWORD)v4 - (_DWORD)a1 + 1);
                                                    v86 = v82 + 1;
                                                    if (v89 < 0x41)
                                                      return 0;
                                                    goto LABEL_420;
                                                  }
                                                  v92 = v89 - 97;
                                                  v86 = v82 + 1;
                                                  goto LABEL_419;
                                                }
                                                if (v89 > 0x2E)
                                                {
                                                  v2 = 0;
                                                  if (v89 == 47)
                                                    return v2;
                                                  v86 = v82 + 1;
                                                  if (v89 >= 0x3A)
                                                    return v2;
                                                  goto LABEL_420;
                                                }
                                                if (v89 < 0x2D)
                                                  return 0;
                                              }
                                              while (v89 != 45);
LABEL_403:
                                              v91 = v4 + 1;
                                              v90 = v4[1];
                                              if (v90 > 0x39)
                                              {
                                                if (v90 <= 0x5A)
                                                {
                                                  if (v90 < 0x41)
                                                    return 0;
                                                  goto LABEL_442;
                                                }
                                                v97 = v90 - 97;
LABEL_441:
                                                if (v97 >= 0x1A)
                                                  return 0;
                                                goto LABEL_442;
                                              }
                                              v86 = v4;
                                              if (v90 != 45)
                                              {
                                                if (v90 < 0x30)
                                                  return 0;
                                                goto LABEL_442;
                                              }
LABEL_424:
                                              v96 = v86[2];
                                              v95 = v86 + 2;
                                              v94 = v96;
                                              if (v96 > 0x39)
                                              {
                                                if (v94 <= 0x5A)
                                                {
                                                  if (v94 < 0x41)
                                                    return 0;
                                                  goto LABEL_463;
                                                }
                                                v101 = v94 - 97;
                                                goto LABEL_462;
                                              }
                                              if (v94 == 45)
                                              {
                                                v4 = v95;
                                                goto LABEL_446;
                                              }
                                              if (v94 < 0x30)
                                                return 0;
LABEL_463:
                                              v4 = v95 + 1;
                                              v102 = v95[1];
                                              if (v102 > 0x3D)
                                                break;
                                              if (v102 > 0x2E)
                                              {
                                                v2 = 0;
                                                if (v102 == 47)
                                                  return v2;
                                                v100 = v95 + 1;
                                                if (v102 >= 0x3A)
                                                  return v2;
                                                goto LABEL_485;
                                              }
                                              if (v102 < 0x2D)
                                                return 0;
                                              if (v102 == 45)
                                                goto LABEL_467;
                                            }
                                            if (v102 > 0x5A)
                                            {
                                              v106 = v102 - 97;
                                              v100 = v95 + 1;
                                              goto LABEL_484;
                                            }
                                            if (v102 < 0x3F)
                                              return ((_DWORD)v4 - (_DWORD)a1 + 1);
                                            v100 = v95 + 1;
                                            if (v102 < 0x41)
                                              return 0;
LABEL_485:
                                            v107 = v100[1];
                                            v4 = v100 + 1;
                                            if (v107 > 0x3D)
                                            {
                                              if (v107 <= 0x5A)
                                              {
                                                if (v107 < 0x3F)
                                                  return ((_DWORD)v4 - (_DWORD)a1 + 1);
                                                v104 = v100 + 1;
                                                if (v107 < 0x41)
                                                  return 0;
                                                goto LABEL_506;
                                              }
                                              v110 = v107 - 97;
                                              v104 = v100 + 1;
                                              goto LABEL_505;
                                            }
                                            if (v107 > 0x2E)
                                            {
                                              v2 = 0;
                                              if (v107 == 47)
                                                return v2;
                                              v104 = v100 + 1;
                                              if (v107 >= 0x3A)
                                                return v2;
                                              goto LABEL_506;
                                            }
                                            if (v107 < 0x2D)
                                              return 0;
                                          }
                                          while (v107 != 45);
LABEL_489:
                                          v109 = v4 + 1;
                                          v108 = v4[1];
                                          if (v108 > 0x39)
                                          {
                                            if (v108 <= 0x5A)
                                            {
                                              if (v108 < 0x41)
                                                return 0;
                                              goto LABEL_528;
                                            }
                                            v115 = v108 - 97;
LABEL_527:
                                            if (v115 >= 0x1A)
                                              return 0;
                                            goto LABEL_528;
                                          }
                                          v104 = v4;
                                          if (v108 != 45)
                                          {
                                            if (v108 < 0x30)
                                              return 0;
                                            goto LABEL_528;
                                          }
LABEL_510:
                                          v114 = v104[2];
                                          v113 = v104 + 2;
                                          v112 = v114;
                                          if (v114 > 0x39)
                                          {
                                            if (v112 <= 0x5A)
                                            {
                                              if (v112 < 0x41)
                                                return 0;
                                              goto LABEL_549;
                                            }
                                            v119 = v112 - 97;
                                            goto LABEL_548;
                                          }
                                          if (v112 == 45)
                                          {
                                            v4 = v113;
                                            goto LABEL_532;
                                          }
                                          if (v112 < 0x30)
                                            return 0;
LABEL_549:
                                          v4 = v113 + 1;
                                          v120 = v113[1];
                                          if (v120 > 0x3D)
                                            break;
                                          if (v120 > 0x2E)
                                          {
                                            v2 = 0;
                                            if (v120 == 47)
                                              return v2;
                                            v118 = v113 + 1;
                                            if (v120 >= 0x3A)
                                              return v2;
                                            goto LABEL_571;
                                          }
                                          if (v120 < 0x2D)
                                            return 0;
                                          if (v120 == 45)
                                            goto LABEL_553;
                                        }
                                        if (v120 > 0x5A)
                                        {
                                          v124 = v120 - 97;
                                          v118 = v113 + 1;
                                          goto LABEL_570;
                                        }
                                        if (v120 < 0x3F)
                                          return ((_DWORD)v4 - (_DWORD)a1 + 1);
                                        v118 = v113 + 1;
                                        if (v120 < 0x41)
                                          return 0;
LABEL_571:
                                        v125 = v118[1];
                                        v4 = v118 + 1;
                                        if (v125 > 0x3D)
                                        {
                                          if (v125 <= 0x5A)
                                          {
                                            if (v125 < 0x3F)
                                              return ((_DWORD)v4 - (_DWORD)a1 + 1);
                                            v122 = v118 + 1;
                                            if (v125 < 0x41)
                                              return 0;
                                            goto LABEL_592;
                                          }
                                          v128 = v125 - 97;
                                          v122 = v118 + 1;
                                          goto LABEL_591;
                                        }
                                        if (v125 > 0x2E)
                                        {
                                          v2 = 0;
                                          if (v125 == 47)
                                            return v2;
                                          v122 = v118 + 1;
                                          if (v125 >= 0x3A)
                                            return v2;
                                          goto LABEL_592;
                                        }
                                        if (v125 < 0x2D)
                                          return 0;
                                      }
                                      while (v125 != 45);
LABEL_575:
                                      v127 = v4 + 1;
                                      v126 = v4[1];
                                      if (v126 > 0x39)
                                      {
                                        if (v126 <= 0x5A)
                                        {
                                          if (v126 < 0x41)
                                            return 0;
                                          goto LABEL_614;
                                        }
                                        v133 = v126 - 97;
LABEL_613:
                                        if (v133 >= 0x1A)
                                          return 0;
                                        goto LABEL_614;
                                      }
                                      v122 = v4;
                                      if (v126 != 45)
                                      {
                                        if (v126 < 0x30)
                                          return 0;
                                        goto LABEL_614;
                                      }
LABEL_596:
                                      v132 = v122[2];
                                      v131 = v122 + 2;
                                      v130 = v132;
                                      if (v132 > 0x39)
                                      {
                                        if (v130 <= 0x5A)
                                        {
                                          if (v130 < 0x41)
                                            return 0;
                                          goto LABEL_635;
                                        }
                                        v137 = v130 - 97;
                                        goto LABEL_634;
                                      }
                                      if (v130 == 45)
                                      {
                                        v4 = v131;
                                        goto LABEL_618;
                                      }
                                      if (v130 < 0x30)
                                        return 0;
LABEL_635:
                                      v4 = v131 + 1;
                                      v138 = v131[1];
                                      if (v138 > 0x3D)
                                        break;
                                      if (v138 > 0x2E)
                                      {
                                        v2 = 0;
                                        if (v138 == 47)
                                          return v2;
                                        v136 = v131 + 1;
                                        if (v138 >= 0x3A)
                                          return v2;
                                        goto LABEL_657;
                                      }
                                      if (v138 < 0x2D)
                                        return 0;
                                      if (v138 == 45)
                                        goto LABEL_639;
                                    }
                                    if (v138 > 0x5A)
                                    {
                                      v142 = v138 - 97;
                                      v136 = v131 + 1;
                                      goto LABEL_656;
                                    }
                                    if (v138 < 0x3F)
                                      return ((_DWORD)v4 - (_DWORD)a1 + 1);
                                    v136 = v131 + 1;
                                    if (v138 < 0x41)
                                      return 0;
LABEL_657:
                                    v143 = v136[1];
                                    v4 = v136 + 1;
                                    if (v143 > 0x3D)
                                    {
                                      if (v143 <= 0x5A)
                                      {
                                        if (v143 < 0x3F)
                                          return ((_DWORD)v4 - (_DWORD)a1 + 1);
                                        v140 = v136 + 1;
                                        if (v143 < 0x41)
                                          return 0;
                                        goto LABEL_678;
                                      }
                                      v146 = v143 - 97;
                                      v140 = v136 + 1;
                                      goto LABEL_677;
                                    }
                                    if (v143 > 0x2E)
                                    {
                                      v2 = 0;
                                      if (v143 == 47)
                                        return v2;
                                      v140 = v136 + 1;
                                      if (v143 >= 0x3A)
                                        return v2;
                                      goto LABEL_678;
                                    }
                                    if (v143 < 0x2D)
                                      return 0;
                                  }
                                  while (v143 != 45);
LABEL_661:
                                  v145 = v4 + 1;
                                  v144 = v4[1];
                                  if (v144 > 0x39)
                                  {
                                    if (v144 <= 0x5A)
                                    {
                                      if (v144 < 0x41)
                                        return 0;
                                      goto LABEL_700;
                                    }
                                    v151 = v144 - 97;
LABEL_699:
                                    if (v151 >= 0x1A)
                                      return 0;
                                    goto LABEL_700;
                                  }
                                  v140 = v4;
                                  if (v144 != 45)
                                  {
                                    if (v144 < 0x30)
                                      return 0;
                                    goto LABEL_700;
                                  }
LABEL_682:
                                  v150 = v140[2];
                                  v149 = v140 + 2;
                                  v148 = v150;
                                  if (v150 > 0x39)
                                  {
                                    if (v148 <= 0x5A)
                                    {
                                      if (v148 < 0x41)
                                        return 0;
                                      goto LABEL_721;
                                    }
                                    v155 = v148 - 97;
                                    goto LABEL_720;
                                  }
                                  if (v148 == 45)
                                  {
                                    v4 = v149;
                                    goto LABEL_704;
                                  }
                                  if (v148 < 0x30)
                                    return 0;
LABEL_721:
                                  v4 = v149 + 1;
                                  v156 = v149[1];
                                  if (v156 > 0x3D)
                                    break;
                                  if (v156 > 0x2E)
                                  {
                                    v2 = 0;
                                    if (v156 == 47)
                                      return v2;
                                    v154 = v149 + 1;
                                    if (v156 >= 0x3A)
                                      return v2;
                                    goto LABEL_743;
                                  }
                                  if (v156 < 0x2D)
                                    return 0;
                                  if (v156 == 45)
                                    goto LABEL_725;
                                }
                                if (v156 > 0x5A)
                                {
                                  v160 = v156 - 97;
                                  v154 = v149 + 1;
                                  goto LABEL_742;
                                }
                                if (v156 < 0x3F)
                                  return ((_DWORD)v4 - (_DWORD)a1 + 1);
                                v154 = v149 + 1;
                                if (v156 < 0x41)
                                  return 0;
LABEL_743:
                                v161 = v154[1];
                                v4 = v154 + 1;
                                if (v161 > 0x3D)
                                {
                                  if (v161 <= 0x5A)
                                  {
                                    if (v161 < 0x3F)
                                      return ((_DWORD)v4 - (_DWORD)a1 + 1);
                                    v158 = v154 + 1;
                                    if (v161 < 0x41)
                                      return 0;
                                    goto LABEL_764;
                                  }
                                  v164 = v161 - 97;
                                  v158 = v154 + 1;
                                  goto LABEL_763;
                                }
                                if (v161 > 0x2E)
                                {
                                  v2 = 0;
                                  if (v161 == 47)
                                    return v2;
                                  v158 = v154 + 1;
                                  if (v161 >= 0x3A)
                                    return v2;
                                  goto LABEL_764;
                                }
                                if (v161 < 0x2D)
                                  return 0;
                              }
                              while (v161 != 45);
LABEL_747:
                              v163 = v4 + 1;
                              v162 = v4[1];
                              if (v162 > 0x39)
                              {
                                if (v162 <= 0x5A)
                                {
                                  if (v162 < 0x41)
                                    return 0;
                                  goto LABEL_786;
                                }
                                v169 = v162 - 97;
LABEL_785:
                                if (v169 >= 0x1A)
                                  return 0;
                                goto LABEL_786;
                              }
                              v158 = v4;
                              if (v162 != 45)
                              {
                                if (v162 < 0x30)
                                  return 0;
                                goto LABEL_786;
                              }
LABEL_768:
                              v168 = v158[2];
                              v167 = v158 + 2;
                              v166 = v168;
                              if (v168 > 0x39)
                              {
                                if (v166 <= 0x5A)
                                {
                                  if (v166 < 0x41)
                                    return 0;
                                  goto LABEL_807;
                                }
                                v173 = v166 - 97;
                                goto LABEL_806;
                              }
                              if (v166 == 45)
                              {
                                v4 = v167;
                                goto LABEL_790;
                              }
                              if (v166 < 0x30)
                                return 0;
LABEL_807:
                              v4 = v167 + 1;
                              v174 = v167[1];
                              if (v174 > 0x3D)
                                break;
                              if (v174 > 0x2E)
                              {
                                v2 = 0;
                                if (v174 == 47)
                                  return v2;
                                v172 = v167 + 1;
                                if (v174 >= 0x3A)
                                  return v2;
                                goto LABEL_829;
                              }
                              if (v174 < 0x2D)
                                return 0;
                              if (v174 == 45)
                                goto LABEL_811;
                            }
                            if (v174 > 0x5A)
                            {
                              v178 = v174 - 97;
                              v172 = v167 + 1;
                              goto LABEL_828;
                            }
                            if (v174 < 0x3F)
                              return ((_DWORD)v4 - (_DWORD)a1 + 1);
                            v172 = v167 + 1;
                            if (v174 < 0x41)
                              return 0;
LABEL_829:
                            v179 = v172[1];
                            v4 = v172 + 1;
                            if (v179 > 0x3D)
                            {
                              if (v179 <= 0x5A)
                              {
                                if (v179 < 0x3F)
                                  return ((_DWORD)v4 - (_DWORD)a1 + 1);
                                v176 = v172 + 1;
                                if (v179 < 0x41)
                                  return 0;
                                goto LABEL_850;
                              }
                              v182 = v179 - 97;
                              v176 = v172 + 1;
                              goto LABEL_849;
                            }
                            if (v179 > 0x2E)
                            {
                              v2 = 0;
                              if (v179 == 47)
                                return v2;
                              v176 = v172 + 1;
                              if (v179 >= 0x3A)
                                return v2;
                              goto LABEL_850;
                            }
                            if (v179 < 0x2D)
                              return 0;
                          }
                          while (v179 != 45);
LABEL_833:
                          v181 = v4 + 1;
                          v180 = v4[1];
                          if (v180 > 0x39)
                          {
                            if (v180 <= 0x5A)
                            {
                              if (v180 < 0x41)
                                return 0;
                              goto LABEL_872;
                            }
                            v187 = v180 - 97;
LABEL_871:
                            if (v187 >= 0x1A)
                              return 0;
                            goto LABEL_872;
                          }
                          v176 = v4;
                          if (v180 != 45)
                          {
                            if (v180 < 0x30)
                              return 0;
                            goto LABEL_872;
                          }
LABEL_854:
                          v186 = v176[2];
                          v185 = v176 + 2;
                          v184 = v186;
                          if (v186 > 0x39)
                          {
                            if (v184 <= 0x5A)
                            {
                              if (v184 < 0x41)
                                return 0;
                              goto LABEL_893;
                            }
                            v191 = v184 - 97;
                            goto LABEL_892;
                          }
                          if (v184 == 45)
                          {
                            v4 = v185;
                            goto LABEL_876;
                          }
                          if (v184 < 0x30)
                            return 0;
LABEL_893:
                          v4 = v185 + 1;
                          v192 = v185[1];
                          if (v192 > 0x3D)
                            break;
                          if (v192 > 0x2E)
                          {
                            v2 = 0;
                            if (v192 == 47)
                              return v2;
                            v190 = v185 + 1;
                            if (v192 >= 0x3A)
                              return v2;
                            goto LABEL_915;
                          }
                          if (v192 < 0x2D)
                            return 0;
                          if (v192 == 45)
                            goto LABEL_897;
                        }
                        if (v192 > 0x5A)
                        {
                          v196 = v192 - 97;
                          v190 = v185 + 1;
                          goto LABEL_914;
                        }
                        if (v192 < 0x3F)
                          return ((_DWORD)v4 - (_DWORD)a1 + 1);
                        v190 = v185 + 1;
                        if (v192 < 0x41)
                          return 0;
LABEL_915:
                        v197 = v190[1];
                        v4 = v190 + 1;
                        if (v197 > 0x3D)
                        {
                          if (v197 <= 0x5A)
                          {
                            if (v197 < 0x3F)
                              return ((_DWORD)v4 - (_DWORD)a1 + 1);
                            v194 = v190 + 1;
                            if (v197 < 0x41)
                              return 0;
                            goto LABEL_936;
                          }
                          v200 = v197 - 97;
                          v194 = v190 + 1;
                          goto LABEL_935;
                        }
                        if (v197 > 0x2E)
                        {
                          v2 = 0;
                          if (v197 == 47)
                            return v2;
                          v194 = v190 + 1;
                          if (v197 >= 0x3A)
                            return v2;
                          goto LABEL_936;
                        }
                        if (v197 < 0x2D)
                          return 0;
                      }
                      while (v197 != 45);
LABEL_919:
                      v199 = v4 + 1;
                      v198 = v4[1];
                      if (v198 > 0x39)
                      {
                        if (v198 <= 0x5A)
                        {
                          if (v198 < 0x41)
                            return 0;
                          goto LABEL_958;
                        }
                        v205 = v198 - 97;
LABEL_957:
                        if (v205 >= 0x1A)
                          return 0;
                        goto LABEL_958;
                      }
                      v194 = v4;
                      if (v198 != 45)
                      {
                        if (v198 < 0x30)
                          return 0;
                        goto LABEL_958;
                      }
LABEL_940:
                      v204 = v194[2];
                      v203 = v194 + 2;
                      v202 = v204;
                      if (v204 > 0x39)
                      {
                        if (v202 <= 0x5A)
                        {
                          if (v202 < 0x41)
                            return 0;
                          goto LABEL_979;
                        }
                        v209 = v202 - 97;
                        goto LABEL_978;
                      }
                      if (v202 == 45)
                      {
                        v4 = v203;
                        goto LABEL_962;
                      }
                      if (v202 < 0x30)
                        return 0;
LABEL_979:
                      v4 = v203 + 1;
                      v210 = v203[1];
                      if (v210 > 0x3D)
                        break;
                      if (v210 > 0x2E)
                      {
                        v2 = 0;
                        if (v210 == 47)
                          return v2;
                        v208 = v203 + 1;
                        if (v210 >= 0x3A)
                          return v2;
                        goto LABEL_1001;
                      }
                      if (v210 < 0x2D)
                        return 0;
                      if (v210 == 45)
                        goto LABEL_983;
                    }
                    if (v210 > 0x5A)
                    {
                      v214 = v210 - 97;
                      v208 = v203 + 1;
                      goto LABEL_1000;
                    }
                    if (v210 < 0x3F)
                      return ((_DWORD)v4 - (_DWORD)a1 + 1);
                    v208 = v203 + 1;
                    if (v210 < 0x41)
                      return 0;
LABEL_1001:
                    v215 = v208[1];
                    v4 = v208 + 1;
                    if (v215 > 0x3D)
                    {
                      if (v215 <= 0x5A)
                      {
                        if (v215 < 0x3F)
                          return ((_DWORD)v4 - (_DWORD)a1 + 1);
                        v212 = v208 + 1;
                        if (v215 < 0x41)
                          return 0;
                        goto LABEL_1022;
                      }
                      v218 = v215 - 97;
                      v212 = v208 + 1;
                      goto LABEL_1021;
                    }
                    if (v215 > 0x2E)
                    {
                      v2 = 0;
                      if (v215 == 47)
                        return v2;
                      v212 = v208 + 1;
                      if (v215 >= 0x3A)
                        return v2;
                      goto LABEL_1022;
                    }
                    if (v215 < 0x2D)
                      return 0;
                  }
                  while (v215 != 45);
LABEL_1005:
                  v217 = v4 + 1;
                  v216 = v4[1];
                  if (v216 > 0x39)
                  {
                    if (v216 <= 0x5A)
                    {
                      if (v216 < 0x41)
                        return 0;
                      goto LABEL_1044;
                    }
                    v223 = v216 - 97;
LABEL_1043:
                    if (v223 >= 0x1A)
                      return 0;
                    goto LABEL_1044;
                  }
                  v212 = v4;
                  if (v216 != 45)
                  {
                    if (v216 < 0x30)
                      return 0;
                    goto LABEL_1044;
                  }
LABEL_1026:
                  v222 = v212[2];
                  v221 = v212 + 2;
                  v220 = v222;
                  if (v222 > 0x39)
                  {
                    if (v220 <= 0x5A)
                    {
                      if (v220 < 0x41)
                        return 0;
                      goto LABEL_1065;
                    }
                    v227 = v220 - 97;
                    goto LABEL_1064;
                  }
                  if (v220 == 45)
                  {
                    v4 = v221;
                    goto LABEL_1048;
                  }
                  if (v220 < 0x30)
                    return 0;
LABEL_1065:
                  v4 = v221 + 1;
                  v228 = v221[1];
                  if (v228 > 0x3D)
                    break;
                  if (v228 > 0x2E)
                  {
                    v2 = 0;
                    if (v228 == 47)
                      return v2;
                    v226 = v221 + 1;
                    if (v228 >= 0x3A)
                      return v2;
                    goto LABEL_1087;
                  }
                  if (v228 < 0x2D)
                    return 0;
                  if (v228 == 45)
                    goto LABEL_1069;
                }
                if (v228 > 0x5A)
                {
                  v232 = v228 - 97;
                  v226 = v221 + 1;
                  goto LABEL_1086;
                }
                if (v228 < 0x3F)
                  return ((_DWORD)v4 - (_DWORD)a1 + 1);
                v226 = v221 + 1;
                if (v228 < 0x41)
                  return 0;
LABEL_1087:
                v233 = v226[1];
                v4 = v226 + 1;
                if (v233 > 0x3D)
                {
                  if (v233 <= 0x5A)
                  {
                    if (v233 < 0x3F)
                      return ((_DWORD)v4 - (_DWORD)a1 + 1);
                    v230 = v226 + 1;
                    if (v233 < 0x41)
                      return 0;
                    goto LABEL_1108;
                  }
                  v236 = v233 - 97;
                  v230 = v226 + 1;
                  goto LABEL_1107;
                }
                if (v233 > 0x2E)
                {
                  v2 = 0;
                  if (v233 == 47)
                    return v2;
                  v230 = v226 + 1;
                  if (v233 >= 0x3A)
                    return v2;
                  goto LABEL_1108;
                }
                if (v233 < 0x2D)
                  return 0;
              }
              while (v233 != 45);
LABEL_1091:
              v235 = v4 + 1;
              v234 = v4[1];
              if (v234 > 0x39)
              {
                if (v234 <= 0x5A)
                {
                  if (v234 < 0x41)
                    return 0;
                  goto LABEL_1130;
                }
                v241 = v234 - 97;
LABEL_1129:
                if (v241 >= 0x1A)
                  return 0;
                goto LABEL_1130;
              }
              v230 = v4;
              if (v234 != 45)
              {
                if (v234 < 0x30)
                  return 0;
                goto LABEL_1130;
              }
LABEL_1112:
              v240 = v230[2];
              v239 = v230 + 2;
              v238 = v240;
              if (v240 > 0x39)
              {
                if (v238 <= 0x5A)
                {
                  if (v238 < 0x41)
                    return 0;
                  goto LABEL_1151;
                }
                v245 = v238 - 97;
                goto LABEL_1150;
              }
              if (v238 == 45)
              {
                v4 = v239;
                goto LABEL_1134;
              }
              if (v238 < 0x30)
                return 0;
LABEL_1151:
              v4 = v239 + 1;
              v246 = v239[1];
              if (v246 > 0x3D)
                break;
              if (v246 > 0x2E)
              {
                v2 = 0;
                if (v246 == 47)
                  return v2;
                v244 = v239 + 1;
                if (v246 >= 0x3A)
                  return v2;
                goto LABEL_1174;
              }
              if (v246 < 0x2D)
                return 0;
              if (v246 == 45)
                goto LABEL_1155;
            }
            if (v246 > 0x5A)
            {
              v249 = v246 - 97;
              v244 = v239 + 1;
              goto LABEL_1173;
            }
            if (v246 < 0x3F)
              return ((_DWORD)v4 - (_DWORD)a1 + 1);
            v244 = v239 + 1;
            if (v246 < 0x41)
              return 0;
LABEL_1174:
            v251 = v244[1];
            v248 = v244 + 1;
            v250 = v251;
            if (v251 > 0x3D)
            {
              if (v250 <= 0x5A)
              {
                if (v250 < 0x3F)
                  goto LABEL_1366;
                if (v250 < 0x41)
                  return 0;
                goto LABEL_1196;
              }
              v255 = v250 - 97;
              goto LABEL_1195;
            }
            if (v250 > 0x2E)
            {
              v2 = 0;
              if (v250 == 47 || v250 >= 0x3A)
                return v2;
              goto LABEL_1196;
            }
            v252 = v250 == 45;
            if (v250 < 0x2D)
              return 0;
            v4 = v248;
          }
          while (!v252);
LABEL_1179:
          v254 = v248 + 1;
          v253 = v248[1];
          if (v253 > 0x39)
          {
            if (v253 <= 0x5A)
            {
              if (v253 < 0x41)
                return 0;
              goto LABEL_1220;
            }
            v259 = v253 - 97;
LABEL_1219:
            if (v259 >= 0x1A)
              return 0;
            goto LABEL_1220;
          }
          if (v253 != 45)
          {
            if (v253 < 0x30)
              return 0;
            goto LABEL_1220;
          }
LABEL_1201:
          v258 = v248[2];
          v254 = v248 + 2;
          if (v258 > 0x39)
          {
            if (v258 <= 0x5A)
            {
              if (v258 < 0x41)
                return 0;
              goto LABEL_1242;
            }
            v264 = v258 - 97;
            goto LABEL_1241;
          }
          if (v258 == 45)
            goto LABEL_1225;
          if (v258 < 0x30)
            return 0;
LABEL_1242:
          v248 = v254 + 1;
          v265 = v254[1];
          if (v265 > 0x3D)
            break;
          if (v265 > 0x2E)
          {
            v2 = 0;
            if (v265 == 47 || v265 >= 0x3A)
              return v2;
            goto LABEL_1266;
          }
          v266 = v265 == 45;
          if (v265 < 0x2D)
            return 0;
          v4 = v254 + 1;
          if (v266)
            goto LABEL_1247;
        }
        if (v265 > 0x5A)
        {
          v268 = v265 - 97;
          goto LABEL_1265;
        }
        if (v265 < 0x3F)
          goto LABEL_1366;
        if (v265 < 0x41)
          return 0;
LABEL_1266:
        v270 = *++v248;
        v269 = v270;
        if (v270 > 0x3D)
        {
          if (v269 <= 0x5A)
          {
            if (v269 < 0x3F)
            {
LABEL_1366:
              LODWORD(v4) = (_DWORD)v248;
              return ((_DWORD)v4 - (_DWORD)a1 + 1);
            }
            if (v269 < 0x41)
              return 0;
            goto LABEL_1288;
          }
          v273 = v269 - 97;
LABEL_1287:
          if (v273 >= 0x1A)
            return 0;
          goto LABEL_1288;
        }
        if (v269 > 0x2E)
        {
          v2 = 0;
          if (v269 == 47 || v269 >= 0x3A)
            return v2;
          goto LABEL_1288;
        }
        v271 = v269 == 45;
        if (v269 < 0x2D)
          return 0;
        v4 = v248;
      }
      while (!v271);
LABEL_1271:
      v4 = v248 + 1;
      v272 = v248[1];
      if (v272 > 0x39)
      {
        if (v272 <= 0x5A)
        {
          if (v272 < 0x41)
            return 0;
          goto LABEL_1310;
        }
        v276 = v272 - 97;
        goto LABEL_1309;
      }
      if (v272 == 45)
        goto LABEL_1292;
      if (v272 < 0x30)
        return 0;
LABEL_1310:
      v278 = *++v4;
      v277 = v278;
      if (v278 > 0x3D)
        break;
      if (v277 > 0x2E)
      {
        v2 = 0;
        if (v277 == 47 || v277 > 0x39)
          return v2;
        goto LABEL_1326;
      }
      v2 = 0;
      if (v277 != 46)
        return v2;
    }
    if (v277 > 0x5A)
    {
      if (v277 - 123 < 0xFFFFFFE6)
        return 0;
    }
    else
    {
      if (v277 < 0x3F)
        return ((_DWORD)v4 - (_DWORD)a1 + 1);
      if (v277 < 0x41)
        return 0;
    }
LABEL_1326:
    v280 = *++v4;
    v279 = v280;
  }
  while (v280 == 46);
  if (v279 != 62)
    return 0;
  return ((_DWORD)v4 - (_DWORD)a1 + 1);
}

uint64_t _scan_html_tag(unsigned __int8 *a1)
{
  unsigned int v1;
  unsigned int v2;
  unsigned __int8 *i;
  unsigned int v5;
  unsigned int v6;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  unsigned __int8 *v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  BOOL v18;
  unsigned int v19;
  unsigned __int8 *v20;
  unsigned __int8 *v21;
  unsigned int v22;
  unsigned int v23;
  unsigned __int8 *v24;
  unsigned __int8 v25;
  int v26;
  unsigned __int8 *v27;
  int v28;
  unsigned __int8 v29;
  int v30;
  int v31;
  int v32;
  unsigned __int8 *v33;
  unsigned int v34;
  unsigned int v35;
  unsigned __int8 *v36;
  unsigned __int8 v37;
  int v38;
  unsigned __int8 *v39;
  int v40;
  unsigned __int8 v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  unsigned int v48;
  unsigned int v49;
  unsigned int v50;

  v1 = *a1;
  if (v1 <= 0x40)
  {
    if (v1 == 47)
    {
      v2 = a1[1];
      if (v2 >= 0x41 && (v2 < 0x5B || v2 - 97 <= 0x19))
      {
        i = a1 + 2;
        do
        {
          v6 = *i++;
          v5 = v6;
        }
        while ((_scan_html_tag_yybm[v6] & 4) != 0);
        if (v5 > 0x1F)
        {
          if (v5 == 32)
          {
            while (1)
            {
LABEL_176:
              v49 = *i;
              if (v49 > 0x1F)
              {
                if (v49 != 32)
                  goto LABEL_185;
              }
              else if (v49 - 9 > 4)
              {
                return 0;
              }
              ++i;
            }
          }
          if (v5 == 62)
          {
            LODWORD(i) = (_DWORD)i - 1;
            return ((_DWORD)i - (_DWORD)a1 + 1);
          }
        }
        else if (v5 - 9 < 5)
        {
          goto LABEL_176;
        }
      }
    }
    return 0;
  }
  if (v1 >= 0x5B && v1 - 97 >= 0x1A)
    return 0;
  i = a1 + 1;
  v8 = a1[1];
  if (v8 > 0x2E)
  {
    if (v8 > 0x40)
    {
      if (v8 >= 0x5B && (v8 - 97) >= 0x1A)
        return 0;
    }
    else if (v8 >= 0x3A && (_DWORD)v8 != 62)
    {
      return 0;
    }
  }
  else if (v8 > 0x1F)
  {
    if ((_DWORD)v8 != 45 && (_DWORD)v8 != 32)
      return 0;
  }
  else if ((v8 - 9) >= 5)
  {
    return 0;
  }
  if ((_scan_html_tag_yybm[v8] & 8) != 0)
    goto LABEL_44;
  do
  {
    if (v8 > 0x3D)
    {
      if (v8 > 0x5A)
      {
        if ((v8 - 97) >= 0x1A)
          return 0;
      }
      else
      {
        if (v8 < 0x3F)
          return ((_DWORD)i - (_DWORD)a1 + 1);
        if (v8 < 0x41)
          return 0;
      }
    }
    else if (v8 > 0x2E)
    {
      if ((_DWORD)v8 == 47)
        goto LABEL_184;
      if (v8 >= 0x3A)
        return 0;
    }
    else if ((_DWORD)v8 != 45)
    {
      return 0;
    }
    v9 = *++i;
    LODWORD(v8) = v9;
  }
  while ((_scan_html_tag_yybm[v9] & 8) == 0);
  do
  {
    do
    {
LABEL_44:
      v11 = *++i;
      v10 = v11;
    }
    while ((_scan_html_tag_yybm[v11] & 8) != 0);
    if (v10 <= 0x3E)
    {
      if (v10 > 0x39)
      {
        if (v10 != 58)
        {
          if (v10 < 0x3E)
            return 0;
          return ((_DWORD)i - (_DWORD)a1 + 1);
        }
        goto LABEL_54;
      }
      v18 = v10 == 47;
      goto LABEL_182;
    }
    if (v10 > 0x5E)
    {
      v12 = 0;
      if (v10 == 96 || v10 > 0x7A)
        return v12;
    }
    else if (v10 - 65 >= 0x1A)
    {
      return 0;
    }
    while (1)
    {
      do
      {
LABEL_54:
        v13 = i;
        v15 = *++i;
        v14 = v15;
      }
      while ((_scan_html_tag_yybm[v15] & 0x10) != 0);
      if (v14 > 0x2C)
        break;
      if (v14 > 0xD)
      {
        if (v14 != 32)
          return 0;
      }
      else if (v14 < 9)
      {
        return 0;
      }
      for (i = v13 + 2; ; ++i)
      {
        v16 = *i;
        if (v16 > 0x3C)
          break;
        if (v16 > 0x20)
        {
          v18 = v16 == 47;
          if (v16 > 0x2F)
          {
            v12 = 0;
            if (v16 != 58)
              return v12;
            goto LABEL_54;
          }
LABEL_182:
          if (!v18)
            return 0;
LABEL_184:
          v50 = i[1];
          LODWORD(i) = (_DWORD)i + 1;
          v49 = v50;
LABEL_185:
          if (v49 == 62)
            return ((_DWORD)i - (_DWORD)a1 + 1);
          return 0;
        }
        if (v16 < 9 || v16 - 14 < 0x12)
          return 0;
      }
      if (v16 > 0x5A)
      {
        if (v16 > 0x5F)
        {
          v12 = 0;
          if (v16 == 96 || v16 >= 0x7B)
            return v12;
        }
        else
        {
          v12 = 0;
          if (v16 != 95)
            return v12;
        }
      }
      else
      {
        if (v16 < 0x3E)
          goto LABEL_84;
        if (v16 == 62)
          return ((_DWORD)i - (_DWORD)a1 + 1);
        v12 = 0;
        if (v16 < 0x41)
          return v12;
      }
    }
    if (v14 <= 0x3C)
    {
      if (v14 >= 0x30)
        return 0;
      goto LABEL_184;
    }
    if (v14 != 61)
    {
      if (v14 >= 0x3F)
        return 0;
      return ((_DWORD)i - (_DWORD)a1 + 1);
    }
LABEL_84:
    ++i;
    do
    {
      v19 = *i;
      if ((_scan_html_tag_yybm[*i] & 0x20) != 0)
      {
        while (1)
        {
          do
          {
            v48 = *++i;
            v19 = v48;
          }
          while ((_scan_html_tag_yybm[v48] & 0x20) != 0);
          v33 = i - 1;
          if (v19 > 0xE0)
            goto LABEL_149;
          if (v19 <= 0x3D)
            break;
          if (v19 == 62)
            return ((_DWORD)i - (_DWORD)a1 + 1);
          if (v19 < 0xC2)
            return 0;
          if (v19 >= 0xE0)
            goto LABEL_147;
LABEL_162:
          v47 = (char)*++i;
          if (v47 > -65)
            return 0;
        }
        v12 = 0;
        if (v19 - 1 >= 0x20)
          return v12;
        goto LABEL_44;
      }
      if (v19 > 0xE0)
      {
        v33 = i - 1;
LABEL_149:
        if (v19 > 0xEF)
        {
          if (v19 == 240)
          {
            i = v33 + 2;
            if ((v33[2] + 112) >= 0x30u)
              return 0;
          }
          else if (v19 >= 0xF4)
          {
            if (v19 != 244)
              return 0;
            i = v33 + 2;
            if ((char)v33[2] >= -112)
              return 0;
          }
          else
          {
            i = v33 + 2;
            if ((char)v33[2] >= -64)
              return 0;
          }
        }
        else if (v19 == 237)
        {
          i = v33 + 2;
          if ((char)v33[2] >= -96)
            return 0;
          goto LABEL_162;
        }
        v46 = (char)*++i;
        if (v46 >= -64)
          return 0;
        goto LABEL_162;
      }
      if (v19 > 0x22)
      {
        if (v19 > 0x27)
        {
          if (v19 < 0xC2)
            return 0;
          if (v19 < 0xE0)
            goto LABEL_162;
          v33 = i - 1;
LABEL_147:
          i = v33 + 2;
          if ((v33[2] & 0xE0) != 0xA0)
            return 0;
          goto LABEL_162;
        }
        do
        {
LABEL_116:
          v21 = i;
          v35 = *++i;
          v34 = v35;
        }
        while (_scan_html_tag_yybm[v35] < 0);
        if (v34 > 0xEC)
        {
          if (v34 > 0xF0)
          {
            if (v34 >= 0xF4)
            {
              if (v34 != 244)
                return 0;
              v42 = (char)v21[2];
              v39 = v21 + 2;
              if (v42 >= -112)
                return 0;
            }
            else
            {
              v40 = (char)v21[2];
              v39 = v21 + 2;
              if (v40 >= -64)
                return 0;
            }
          }
          else
          {
            if (v34 < 0xEE)
            {
              v38 = (char)v21[2];
              v36 = v21 + 2;
              if (v38 >= -96)
                return 0;
              goto LABEL_126;
            }
            if (v34 < 0xF0)
              goto LABEL_136;
            v41 = v21[2];
            v39 = v21 + 2;
            if ((v41 + 112) >= 0x30u)
              return 0;
          }
          i = v39;
        }
        else
        {
          if (v34 <= 0xC1)
          {
            if (v34 - 1 >= 0x27)
              return 0;
            goto LABEL_145;
          }
          if (v34 < 0xE0)
            goto LABEL_137;
          if (v34 == 224)
          {
            v37 = v21[2];
            v36 = v21 + 2;
            if ((v37 & 0xE0) != 0xA0)
              return 0;
LABEL_126:
            i = v36;
LABEL_137:
            v12 = 0;
            v44 = (char)*++i;
            if (v44 >= -64)
              return v12;
            goto LABEL_116;
          }
        }
LABEL_136:
        v43 = (char)*++i;
        if (v43 >= -64)
          return 0;
        goto LABEL_137;
      }
      if (!*i)
        return 0;
      ++i;
    }
    while (v19 < 0x21);
    v20 = i - 1;
    while (1)
    {
      do
      {
        v21 = v20;
        v23 = *++v20;
        v22 = v23;
      }
      while ((_scan_html_tag_yybm[v23] & 0x40) != 0);
      if (v22 > 0xEC)
      {
        if (v22 > 0xF0)
        {
          if (v22 >= 0xF4)
          {
            if (v22 != 244)
              return 0;
            v30 = (char)v21[2];
            v27 = v21 + 2;
            if (v30 >= -112)
              return 0;
          }
          else
          {
            v28 = (char)v21[2];
            v27 = v21 + 2;
            if (v28 >= -64)
              return 0;
          }
LABEL_110:
          v20 = v27;
LABEL_111:
          v31 = (char)*++v20;
          if (v31 >= -64)
            return 0;
          goto LABEL_112;
        }
        if (v22 >= 0xEE)
        {
          if (v22 >= 0xF0)
          {
            v29 = v21[2];
            v27 = v21 + 2;
            if ((v29 + 112) >= 0x30u)
              return 0;
            goto LABEL_110;
          }
          goto LABEL_111;
        }
        v26 = (char)v21[2];
        v24 = v21 + 2;
        if (v26 >= -96)
          return 0;
        goto LABEL_101;
      }
      if (v22 <= 0xC1)
        break;
      if (v22 >= 0xE0)
      {
        if (v22 != 224)
          goto LABEL_111;
        v25 = v21[2];
        v24 = v21 + 2;
        if ((v25 & 0xE0) != 0xA0)
          return 0;
LABEL_101:
        v20 = v24;
      }
LABEL_112:
      v12 = 0;
      v32 = (char)*++v20;
      if (v32 >= -64)
        return v12;
    }
    if (v22 - 1 >= 0x22)
      return 0;
LABEL_145:
    v45 = v21[2];
    i = v21 + 2;
  }
  while ((_scan_html_tag_yybm[v21[2]] & 8) != 0);
  if (v45 == 47)
    goto LABEL_184;
  if (v45 != 62)
    return 0;
  return ((_DWORD)i - (_DWORD)a1 + 1);
}

uint64_t _scan_liberal_html_tag(unsigned __int8 *a1)
{
  unsigned int v1;
  BOOL v2;
  unsigned __int8 *v3;
  int v4;
  uint64_t v5;
  int v6;
  unsigned int v7;
  signed __int8 v8;
  char v9;
  unsigned __int8 *i;
  int v11;
  char v12;
  int v13;
  char v14;
  int v15;
  int v16;
  int v17;

  v1 = *a1;
  if (v1 > 0xE0)
  {
    if (v1 <= 0xEF)
    {
      v3 = a1 + 1;
      v4 = (char)a1[1];
      if (v1 == 237)
      {
        v5 = 0;
        v6 = (_DWORD)a1 + 1;
        if (v4 < -96)
          goto LABEL_68;
      }
      else
      {
        v5 = 0;
        v6 = (_DWORD)a1 + 1;
        if (v4 < -64)
          goto LABEL_68;
      }
      return v5;
    }
    if (v1 == 240)
    {
      v5 = 0;
      v3 = a1 + 1;
      if ((a1[1] + 112) >= 0x30u)
        return v5;
    }
    else if (v1 >= 0xF4)
    {
      if (v1 != 244)
        return 0;
      v5 = 0;
      v3 = a1 + 1;
      if ((char)a1[1] >= -112)
        return v5;
    }
    else
    {
      v5 = 0;
      v3 = a1 + 1;
      if ((char)a1[1] >= -64)
        return v5;
    }
    v6 = (int)v3;
    goto LABEL_67;
  }
  if (v1 <= 0xA)
  {
    if (*a1)
      v2 = v1 == 10;
    else
      v2 = 1;
    if (!v2)
      goto LABEL_13;
    return 0;
  }
  if ((v1 & 0x80) != 0)
  {
    if (v1 >= 0xC2)
    {
      v3 = a1 + 1;
      v8 = a1[1];
      if (v1 >= 0xE0)
      {
        v5 = 0;
        v6 = (_DWORD)a1 + 1;
        if ((v8 & 0xE0) == 0xA0)
          goto LABEL_68;
      }
      else
      {
        v5 = 0;
        v6 = (_DWORD)a1 + 1;
        if (v8 < -64)
          goto LABEL_39;
      }
      return v5;
    }
    return 0;
  }
LABEL_13:
  v3 = a1 + 1;
  v7 = a1[1];
  if (v7 <= 0xA)
  {
    v5 = 0;
    if (a1[1])
    {
      v6 = (_DWORD)a1 + 1;
      if (v7 != 10)
        goto LABEL_40;
    }
    return v5;
  }
  v5 = 0;
  if ((v7 & 0x80) == 0)
  {
    v6 = (_DWORD)a1 + 1;
    goto LABEL_40;
  }
  v6 = (_DWORD)a1 + 1;
  if ((v7 + 62) >= 0x33u)
    return v5;
  while (1)
  {
LABEL_40:
    if ((_scan_liberal_html_tag_yybm[v7] & 0x40) != 0)
      goto LABEL_39;
    if (v7 > 0xECu)
      break;
    if (v7 <= 0xC1u)
    {
      if ((v7 - 11) > 0x33u)
        goto LABEL_69;
      for (i = v3 + 1; ; ++i)
      {
        v3 = i;
        v7 = *i;
        if ((_scan_liberal_html_tag_yybm[*i] & 0x40) != 0)
        {
          v5 = 1;
          v6 = (int)v3;
          goto LABEL_39;
        }
        if (v7 > 0xEC)
          break;
        if (v7 > 0xC1)
        {
          v5 = 1;
          v6 = (int)v3;
          goto LABEL_55;
        }
        if (v7 - 11 >= 0x34)
          return ((_DWORD)v3 - (_DWORD)a1);
      }
      v5 = 1;
      v6 = (int)v3;
      if (v7 <= 0xF0)
        goto LABEL_51;
      if (v7 >= 0xF4)
      {
        if (v7 == 244)
          goto LABEL_66;
        return ((_DWORD)v3 - (_DWORD)a1);
      }
LABEL_60:
      v13 = (char)*++v3;
      if (v13 >= -64)
        goto LABEL_69;
      goto LABEL_67;
    }
    v7 = v7;
LABEL_55:
    if (v7 < 0xE0)
      goto LABEL_68;
    if (v7 == 224)
    {
      v12 = *++v3;
      if ((v12 & 0xE0) != 0xA0)
        goto LABEL_69;
      goto LABEL_68;
    }
LABEL_67:
    v16 = (char)*++v3;
    if (v16 >= -64)
      goto LABEL_69;
LABEL_68:
    v17 = (char)*++v3;
    if (v17 >= -64)
      goto LABEL_69;
LABEL_39:
    v9 = *++v3;
    LOBYTE(v7) = v9;
  }
  v7 = v7;
  if (v7 <= 0xF0u)
  {
LABEL_51:
    if (v7 < 0xEE)
    {
      v11 = (char)*++v3;
      if (v11 >= -96)
        goto LABEL_69;
      goto LABEL_68;
    }
    if (v7 >= 0xF0)
    {
      v14 = *++v3;
      if ((v14 + 112) >= 0x30u)
        goto LABEL_69;
    }
    goto LABEL_67;
  }
  if (v7 < 0xF4u)
    goto LABEL_60;
  if (v7 != 244)
    goto LABEL_69;
LABEL_66:
  v15 = (char)*++v3;
  if (v15 < -112)
    goto LABEL_67;
LABEL_69:
  LODWORD(v3) = v6;
  if (!(_DWORD)v5)
    return v5;
  return ((_DWORD)v3 - (_DWORD)a1);
}

uint64_t _scan_html_comment(_BYTE *a1)
{
  _BYTE *v1;
  _BYTE *v2;
  unsigned int v3;
  unsigned int v4;
  int v5;
  char v6;
  char v7;
  int v8;
  int v9;
  int v10;
  int v11;

  if (*a1 == 45)
  {
    v1 = a1 + 1;
    if (a1[1] == 45)
    {
      while (1)
      {
        do
        {
          while (1)
          {
            do
            {
              v2 = v1;
              v4 = *++v1;
              v3 = v4;
            }
            while (_scan_html_comment_yybm[v4] < 0);
            if (v3 > 0xEC)
            {
LABEL_16:
              if (v3 > 0xF0)
                goto LABEL_35;
              if (v3 >= 0xEE)
              {
                if (v3 >= 0xF0)
                {
LABEL_25:
                  v7 = *++v1;
                  if ((v7 + 112) >= 0x30u)
                    return 0;
                }
LABEL_40:
                v10 = (char)*++v1;
                if (v10 >= -64)
                  return 0;
                goto LABEL_41;
              }
              goto LABEL_18;
            }
            if (v3 <= 0xC1)
              break;
LABEL_20:
            if (v3 >= 0xE0)
            {
              if (v3 != 224)
                goto LABEL_40;
LABEL_22:
              v6 = *++v1;
              if ((v6 & 0xE0) != 0xA0)
                return 0;
            }
LABEL_41:
            v11 = (char)*++v1;
            if (v11 >= -64)
              return 0;
          }
          if (v3 - 1 >= 0x2D)
            return 0;
          v1 = v2 + 2;
          v3 = v2[2];
        }
        while (_scan_html_comment_yybm[v2[2]] < 0);
        if (v3 > 0xEC)
          goto LABEL_16;
        if (v3 > 0xC1)
          goto LABEL_20;
        if (v3 - 1 >= 0x2D)
          return 0;
        v1 = v2 + 3;
        v3 = v2[3];
        if (v3 > 0xE0)
        {
          if (v3 > 0xEF)
          {
            if (v3 == 240)
              goto LABEL_25;
LABEL_35:
            if (v3 >= 0xF4)
            {
              if (v3 != 244)
                return 0;
              v9 = (char)*++v1;
              if (v9 >= -112)
                return 0;
            }
            else
            {
              v8 = (char)*++v1;
              if (v8 >= -64)
                return 0;
            }
            goto LABEL_40;
          }
          if (v3 != 237)
            goto LABEL_40;
LABEL_18:
          v5 = (char)*++v1;
          if (v5 >= -96)
            return 0;
          goto LABEL_41;
        }
        if (v3 > 0x3E)
        {
          if ((v3 & 0x80) != 0)
          {
            if (v3 < 0xC2)
              return 0;
            if (v3 < 0xE0)
              goto LABEL_41;
            goto LABEL_22;
          }
        }
        else
        {
          if (!v2[3])
            return 0;
          if (v3 >= 0x3E)
            return ((_DWORD)v2 - (_DWORD)a1 + 4);
        }
      }
    }
  }
  return 0;
}

uint64_t _scan_html_pi(unsigned __int8 *a1)
{
  unsigned int v1;
  unsigned __int8 *v2;
  unsigned int v3;
  int i;
  unsigned __int8 *v5;
  char v7;
  unsigned int v8;
  int v9;
  int v10;
  char v11;
  int v12;
  char v13;
  int v14;
  int v15;

  v1 = *a1;
  v2 = a1;
  if (_scan_html_pi_yybm[*a1] < 0)
    goto LABEL_35;
  if (v1 > 0xEC)
  {
    if (v1 > 0xF0)
    {
      if (v1 >= 0xF4)
      {
        if (v1 != 244)
          return 0;
        v2 = a1 + 1;
        if ((char)a1[1] >= -112)
          return 0;
      }
      else
      {
        v2 = a1 + 1;
        if ((char)a1[1] >= -64)
          return 0;
      }
    }
    else
    {
      if (v1 < 0xEE)
      {
        v2 = a1 + 1;
        if ((char)a1[1] >= -96)
          return 0;
        goto LABEL_29;
      }
      if (v1 < 0xF0)
      {
LABEL_28:
        v2 = a1 + 1;
        if ((char)a1[1] >= -64)
          return 0;
LABEL_29:
        i = 1;
        LODWORD(v5) = (_DWORD)v2;
        goto LABEL_75;
      }
      v2 = a1 + 1;
      if ((a1[1] + 112) >= 0x30u)
        return 0;
    }
    i = 1;
    LODWORD(v5) = (_DWORD)v2;
    goto LABEL_74;
  }
  if (v1 > 0xC1)
  {
    if (v1 < 0xE0)
    {
      v2 = a1 + 1;
      if ((char)a1[1] < -64)
        goto LABEL_35;
      return 0;
    }
    if (v1 == 224)
    {
      v2 = a1 + 1;
      if ((a1[1] & 0xE0) != 0xA0)
        return 0;
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  if (v1 - 1 >= 0x3F)
    return 0;
  v2 = a1 + 1;
  v3 = a1[1];
  if (v3 > 0x3F)
  {
    i = 1;
    if ((v3 & 0x80) == 0)
      goto LABEL_36;
    v5 = a1 + 1;
    if ((v3 + 62) < 0x33u)
      goto LABEL_37;
    return 0;
  }
  if (!a1[1])
    return 0;
  if (v3 >= 0x3E)
  {
    if (v3 != 62)
      goto LABEL_35;
    return 0;
  }
  for (i = 1; ; i = 0)
  {
LABEL_36:
    v5 = v2;
LABEL_37:
    if (_scan_html_pi_yybm[v3] < 0)
    {
      v2 = v5;
      goto LABEL_35;
    }
    if (v3 > 0xECu)
    {
      if (v3 <= 0xF0u)
      {
        v2 = v5;
        if (v3 < 0xEEu)
          goto LABEL_49;
        v2 = v5;
        if (v3 < 0xF0u)
          goto LABEL_64;
        goto LABEL_73;
      }
      v2 = v5;
      if (v3 < 0xF4u)
        goto LABEL_54;
      v2 = v5;
      if (v3 != 244)
        return ((_DWORD)v5 - (_DWORD)a1);
LABEL_62:
      v12 = (char)*++v2;
      if (v12 >= -112)
        goto LABEL_76;
      goto LABEL_74;
    }
    if (v3 > 0xC1u)
    {
      if (v3 < 0xE0u)
      {
        v2 = v5;
        goto LABEL_75;
      }
      v2 = v5;
      if (v3 == 224)
        goto LABEL_59;
LABEL_64:
      v2 = v5;
      goto LABEL_74;
    }
    if ((v3 - 1) >= 0x3Fu)
      return ((_DWORD)v5 - (_DWORD)a1);
    v2 = v5 + 1;
    v8 = v5[1];
    if (v8 <= 0xE0)
      break;
    if (v8 <= 0xEF)
    {
      if (v8 == 237)
      {
LABEL_49:
        v9 = (char)*++v2;
        if (v9 >= -96)
          goto LABEL_76;
        goto LABEL_75;
      }
      goto LABEL_74;
    }
    if (v8 != 240)
    {
      if (v8 < 0xF4)
      {
LABEL_54:
        v10 = (char)*++v2;
        if (v10 >= -64)
          goto LABEL_76;
        goto LABEL_74;
      }
      if (v8 != 244)
        goto LABEL_76;
      goto LABEL_62;
    }
LABEL_73:
    v13 = *++v2;
    if ((v13 + 112) >= 0x30u)
      goto LABEL_76;
LABEL_74:
    v14 = (char)*++v2;
    if (v14 >= -64)
      goto LABEL_76;
LABEL_75:
    v15 = (char)*++v2;
    if (v15 >= -64)
      goto LABEL_76;
LABEL_35:
    v7 = *++v2;
    LOBYTE(v3) = v7;
  }
  if (v8 > 0x3E)
  {
    if ((v8 & 0x80) == 0)
      goto LABEL_35;
    if (v8 < 0xC2)
      goto LABEL_76;
    if (v8 < 0xE0)
      goto LABEL_75;
LABEL_59:
    v11 = *++v2;
    if ((v11 & 0xE0) != 0xA0)
      goto LABEL_76;
    goto LABEL_75;
  }
  if (v5[1] && v8 != 62)
    goto LABEL_35;
LABEL_76:
  if (i)
    return 0;
  return ((_DWORD)v5 - (_DWORD)a1);
}

uint64_t _scan_html_declaration(unsigned __int8 *a1)
{
  unsigned int i;
  unsigned __int8 *v2;
  unsigned int v3;
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  unsigned int v7;
  char v8;
  unsigned __int8 *v9;
  unsigned __int8 *v10;
  unsigned __int8 *v11;
  unsigned __int8 v12;
  unsigned __int8 *v13;
  unsigned __int8 v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;

  if (*a1 - 65 > 0x19)
    return 0;
  v2 = a1 + 1;
  for (i = a1[1]; _scan_html_declaration_yybm[i] < 0; i = v3)
    v3 = *++v2;
  if (i < 9 || i >= 0xE && i != 32)
    return 0;
  while (1)
  {
    do
    {
      v5 = v2;
      v6 = v2 + 1;
      v7 = v2[1];
      v8 = _scan_html_declaration_yybm[*++v2];
    }
    while ((v8 & 0x40) != 0);
    if (v7 > 0xED)
      break;
    if (v7 > 0xDF)
    {
      if (v7 == 224)
      {
        v14 = v5[2];
        v13 = v5 + 2;
        if ((v14 & 0xE0) != 0xA0)
          return ((_DWORD)v6 - (_DWORD)a1);
      }
      else
      {
        v10 = v6;
        if (v7 < 0xED)
          goto LABEL_30;
        v16 = (char)v5[2];
        v13 = v5 + 2;
        if (v16 >= -96)
          return ((_DWORD)v6 - (_DWORD)a1);
      }
      v9 = v13;
    }
    else
    {
      v9 = v6;
      if (v7 <= 0xC1)
        return ((_DWORD)v6 - (_DWORD)a1);
    }
LABEL_31:
    v19 = (char)v9[1];
    v2 = v9 + 1;
    if (v19 >= -64)
      return ((_DWORD)v6 - (_DWORD)a1);
  }
  if (v7 <= 0xF0)
  {
    v10 = v6;
    if (v7 != 240)
      goto LABEL_30;
    v12 = v5[2];
    v11 = v5 + 2;
    if ((v12 + 112) >= 0x30u)
      return ((_DWORD)v6 - (_DWORD)a1);
    goto LABEL_29;
  }
  if (v7 < 0xF4)
  {
    v15 = (char)v5[2];
    v11 = v5 + 2;
    if (v15 >= -64)
      return ((_DWORD)v6 - (_DWORD)a1);
    goto LABEL_29;
  }
  if (v7 == 244)
  {
    v17 = (char)v5[2];
    v11 = v5 + 2;
    if (v17 < -112)
    {
LABEL_29:
      v10 = v11;
LABEL_30:
      v18 = (char)v10[1];
      v9 = v10 + 1;
      if (v18 >= -64)
        return ((_DWORD)v6 - (_DWORD)a1);
      goto LABEL_31;
    }
  }
  return ((_DWORD)v6 - (_DWORD)a1);
}

uint64_t _scan_html_cdata(_BYTE *a1)
{
  _BYTE *v1;
  _BYTE *v2;
  _BYTE *v3;
  unsigned int v4;
  int v5;
  int v6;
  BOOL v7;
  char v8;
  BOOL v9;
  int v10;
  char v11;
  int v12;
  int v13;
  int v14;

  if ((*a1 & 0xDF) != 0x43)
    return 0;
  if ((a1[1] & 0xDF) != 0x44)
    return 0;
  if ((a1[2] & 0xDF) != 0x41)
    return 0;
  if ((a1[3] & 0xDF) != 0x54)
    return 0;
  if ((a1[4] & 0xDF) != 0x41)
    return 0;
  v1 = a1 + 5;
  if (a1[5] != 91)
    return 0;
  while (1)
  {
    do
    {
      v2 = v1;
      v3 = v1 + 1;
      v4 = v1[1];
      v5 = _scan_html_cdata_yybm[*++v1];
    }
    while (v5 < 0);
    if (v4 > 0xEC)
      break;
    if (v4 > 0xC1)
    {
      v1 = v3;
      v7 = v4 == 224;
      if (v4 >= 0xE0)
      {
        v1 = v3;
LABEL_26:
        if (!v7)
          goto LABEL_41;
LABEL_28:
        v8 = *++v1;
        if ((v8 & 0xE0) != 0xA0)
          return ((_DWORD)v3 - (_DWORD)a1);
      }
LABEL_42:
      v14 = (char)*++v1;
      if (v14 >= -64)
        return ((_DWORD)v3 - (_DWORD)a1);
    }
    else
    {
      if (v4 - 1 >= 0x5D)
        return ((_DWORD)v3 - (_DWORD)a1);
      v1 = v2 + 2;
      v4 = v2[2];
      if ((_scan_html_cdata_yybm[v2[2]] & 0x80000000) == 0)
      {
        if (v4 > 0xEC)
        {
          if (v4 > 0xF0)
            goto LABEL_57;
          if (v4 >= 0xEE)
            goto LABEL_34;
LABEL_22:
          v6 = (char)*++v1;
          if (v6 >= -96)
            return ((_DWORD)v3 - (_DWORD)a1);
          goto LABEL_42;
        }
        if (v4 > 0xC1)
        {
          v7 = v4 == 224;
          if (v4 >= 0xE0)
            goto LABEL_26;
          goto LABEL_42;
        }
        if (v4 - 1 >= 0x5D)
          return ((_DWORD)v3 - (_DWORD)a1);
        v4 = v2[3];
        v1 = v2 + 3;
        if (v4 > 0xE0)
        {
          if (v4 > 0xEF)
          {
            if (v4 != 240)
            {
LABEL_57:
              v9 = v4 == 244;
              if (v4 >= 0xF4)
                goto LABEL_38;
LABEL_31:
              v10 = (char)*++v1;
              if (v10 >= -64)
                return ((_DWORD)v3 - (_DWORD)a1);
              goto LABEL_41;
            }
LABEL_35:
            v11 = *++v1;
            if ((v11 + 112) >= 0x30u)
              return ((_DWORD)v3 - (_DWORD)a1);
            goto LABEL_41;
          }
          if (v4 != 237)
            goto LABEL_41;
          goto LABEL_22;
        }
        if (v4 > 0x3E)
        {
          if ((v4 & 0x80) != 0)
          {
            if (v4 < 0xC2)
              return ((_DWORD)v3 - (_DWORD)a1);
            if (v4 >= 0xE0)
              goto LABEL_28;
            goto LABEL_42;
          }
        }
        else if (!v2[3] || v4 == 62)
        {
          return ((_DWORD)v3 - (_DWORD)a1);
        }
      }
    }
  }
  v1 = v3;
  if (v4 <= 0xF0)
  {
    if (v4 >= 0xEE)
    {
      v1 = v3;
LABEL_34:
      if (v4 < 0xF0)
        goto LABEL_41;
      goto LABEL_35;
    }
    goto LABEL_22;
  }
  v9 = v4 == 244;
  if (v4 < 0xF4)
    goto LABEL_31;
  v1 = v3;
LABEL_38:
  if (v9)
  {
    v12 = (char)*++v1;
    if (v12 < -112)
    {
LABEL_41:
      v13 = (char)*++v1;
      if (v13 >= -64)
        return ((_DWORD)v3 - (_DWORD)a1);
      goto LABEL_42;
    }
  }
  return ((_DWORD)v3 - (_DWORD)a1);
}

uint64_t _scan_html_block_end_1(unsigned __int8 *a1)
{
  unsigned int v1;
  BOOL v2;
  uint64_t v3;
  unsigned __int8 *v4;
  int v5;
  unsigned int v6;
  int v7;
  char v8;
  BOOL v9;
  int v10;
  unsigned int v11;
  unsigned __int8 *v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned __int8 *v16;
  unsigned int v17;
  unsigned __int8 *v18;
  unsigned int v19;
  char v20;
  char v21;
  int v22;
  unsigned int v23;
  unsigned int v24;
  BOOL v25;
  BOOL v26;
  int v27;
  unsigned int v28;
  int v29;
  int v30;

  v1 = *a1;
  if (v1 > 0xDF)
  {
    if (v1 <= 0xEF)
    {
      if (v1 >= 0xE1)
      {
        v4 = a1 + 1;
        v7 = (char)a1[1];
        if (v1 == 237)
        {
          v3 = 0;
          v5 = (_DWORD)a1 + 1;
          if (v7 >= -96)
            return v3;
        }
        else
        {
          v3 = 0;
          v5 = (_DWORD)a1 + 1;
          if (v7 >= -64)
            return v3;
        }
        goto LABEL_55;
      }
      v3 = 0;
      v4 = a1 + 1;
      if ((a1[1] & 0xE0) != 0xA0)
        return v3;
      goto LABEL_12;
    }
    if (v1 == 240)
    {
      v3 = 0;
      v4 = a1 + 1;
      if ((a1[1] + 112) >= 0x30u)
        return v3;
    }
    else if (v1 >= 0xF4)
    {
      if (v1 != 244)
        return 0;
      v3 = 0;
      v4 = a1 + 1;
      if ((char)a1[1] >= -112)
        return v3;
    }
    else
    {
      v3 = 0;
      v4 = a1 + 1;
      if ((char)a1[1] >= -64)
        return v3;
    }
    v5 = (int)v4;
    goto LABEL_269;
  }
  if (v1 <= 0x3B)
  {
    if (*a1)
      v2 = v1 == 10;
    else
      v2 = 1;
    if (!v2)
      goto LABEL_25;
    return 0;
  }
  if (v1 != 60)
  {
    if ((v1 & 0x80) == 0)
    {
LABEL_25:
      v4 = a1 + 1;
      v6 = a1[1];
      if (v6 <= 0xA)
        goto LABEL_26;
      v3 = 0;
      if ((v6 & 0x80) == 0)
      {
        v5 = (_DWORD)a1 + 1;
        goto LABEL_45;
      }
      goto LABEL_33;
    }
    if (v1 > 0xC1)
    {
      v3 = 0;
      v4 = a1 + 1;
      if ((char)a1[1] < -64)
        goto LABEL_42;
      return v3;
    }
    return 0;
  }
  v4 = a1 + 1;
  v6 = a1[1];
  if (v6 <= 0x2E)
  {
LABEL_26:
    v3 = 0;
    if (v6)
    {
      v5 = (int)v4;
      if (v6 != 10)
        goto LABEL_45;
    }
    return v3;
  }
  v3 = 0;
  if ((v6 & 0x80) != 0)
  {
LABEL_33:
    v5 = (int)v4;
    if ((v6 + 62) < 0x33u)
      goto LABEL_45;
    return v3;
  }
  v5 = (_DWORD)a1 + 1;
  if (v6 < 0x30)
    goto LABEL_64;
LABEL_45:
  if ((_scan_html_block_end_1_yybm[v6] & 0x40) != 0)
    goto LABEL_44;
  if (v6 > 0xECu)
  {
    v6 = v6;
    if (v6 <= 0xF0u)
      goto LABEL_51;
    goto LABEL_267;
  }
  if (v6 > 0xC1u)
  {
    v9 = v6 == 224;
    if (v6 < 0xE0u)
      goto LABEL_55;
    goto LABEL_111;
  }
  if ((v6 - 11) >= 0x32u)
    goto LABEL_270;
  while (1)
  {
    while (1)
    {
      while (1)
      {
        do
        {
          v11 = *++v4;
          v6 = v11;
        }
        while (_scan_html_block_end_1_yybm[v11] < 0);
        if (v6 > 0xDF)
        {
LABEL_157:
          if (v6 <= 0xEF)
          {
            if (v6 >= 0xE1)
            {
              if (v6 != 237)
                goto LABEL_269;
              goto LABEL_168;
            }
            goto LABEL_159;
          }
          if (v6 != 240)
            goto LABEL_267;
          goto LABEL_162;
        }
        if (v6 <= 0x2E)
          goto LABEL_60;
        if (v6 != 47)
        {
LABEL_164:
          if ((v6 & 0x80) == 0)
            goto LABEL_44;
          if (v6 < 0xC2)
            goto LABEL_270;
          goto LABEL_55;
        }
LABEL_64:
        v12 = v4 + 1;
        v13 = v4[1];
        if ((_scan_html_block_end_1_yybm[v4[1]] & 0x80000000) == 0)
          break;
LABEL_237:
        v4 = v12;
      }
      if (v13 > 0x73)
        break;
      if (v13 <= 0x52)
      {
        if (v13 <= 0xA)
          goto LABEL_68;
        if (v13 != 80)
        {
LABEL_95:
          v4 = v12;
          goto LABEL_44;
        }
        goto LABEL_88;
      }
      if (v13 <= 0x6F)
      {
        if (v13 >= 0x54)
        {
          if (v13 != 84)
            goto LABEL_95;
          goto LABEL_79;
        }
        goto LABEL_96;
      }
      if (v13 == 112)
      {
LABEL_88:
        v14 = v4[2];
        v4 += 2;
        v6 = v14;
        if ((_scan_html_block_end_1_yybm[v14] & 0x80000000) == 0)
        {
          if (v6 > 0xC1)
            goto LABEL_259;
          if (v6 <= 0x51)
            goto LABEL_60;
          if (v6 > 0x71)
          {
            if (v6 != 114)
              goto LABEL_206;
          }
          else if (v6 >= 0x53)
          {
            goto LABEL_44;
          }
LABEL_117:
          v15 = *++v4;
          v6 = v15;
          if ((_scan_html_block_end_1_yybm[v15] & 0x80000000) == 0)
          {
            if (v6 > 0xC1)
              goto LABEL_259;
            if (v6 <= 0x44)
              goto LABEL_60;
            if (v6 > 0x64)
            {
              if (v6 != 101)
                goto LABEL_206;
            }
            else if (v6 >= 0x46)
            {
              goto LABEL_44;
            }
LABEL_148:
            v16 = v4;
            v17 = *++v4;
            v6 = v17;
            if ((_scan_html_block_end_1_yybm[v17] & 0x80000000) == 0)
            {
              if (v6 > 0xDF)
                goto LABEL_157;
              if (v6 <= 0x3D)
                goto LABEL_60;
              if (v6 != 62)
                goto LABEL_164;
              v19 = v16[2];
              v18 = v16 + 2;
              v6 = v19;
              v4 = v18;
              if ((_scan_html_block_end_1_yybm[v19] & 0x40) != 0)
              {
                v3 = 1;
LABEL_42:
                v5 = (int)v4;
LABEL_44:
                v8 = *++v4;
                LOBYTE(v6) = v8;
                goto LABEL_45;
              }
              if (v6 > 0xEC)
              {
                v3 = 1;
                v5 = (int)v18;
                if (v6 > 0xF0)
                {
                  if (v6 >= 0xF4)
                  {
                    if (v6 != 244)
                      return ((_DWORD)v4 - (_DWORD)a1);
LABEL_248:
                    v27 = (char)*++v4;
                    if (v27 >= -112)
                      goto LABEL_270;
LABEL_269:
                    v30 = (char)*++v4;
                    if (v30 >= -64)
                      goto LABEL_270;
LABEL_55:
                    v10 = (char)*++v4;
                    if (v10 < -64)
                      goto LABEL_44;
                    goto LABEL_270;
                  }
LABEL_268:
                  v29 = (char)*++v4;
                  if (v29 >= -64)
                    goto LABEL_270;
                  goto LABEL_269;
                }
LABEL_51:
                if (v6 >= 0xEE)
                {
                  if (v6 < 0xF0)
                    goto LABEL_269;
                  goto LABEL_162;
                }
LABEL_168:
                v22 = (char)*++v4;
                if (v22 >= -96)
                  goto LABEL_270;
                goto LABEL_55;
              }
              if (v6 > 0xC1)
              {
                v3 = 1;
                if (v6 >= 0xE0)
                {
                  v5 = (int)v18;
                  if (v6 != 224)
                    goto LABEL_269;
                  goto LABEL_159;
                }
LABEL_12:
                v5 = (int)v4;
                goto LABEL_55;
              }
              v3 = 1;
              v5 = (int)v18;
              if (v6 - 11 > 0x31)
                return ((_DWORD)v4 - (_DWORD)a1);
            }
          }
        }
      }
      else
      {
        if (v13 < 0x73)
          goto LABEL_95;
LABEL_96:
        v12 = v4 + 2;
        v13 = v4[2];
        if (_scan_html_block_end_1_yybm[v4[2]] < 0)
          goto LABEL_237;
        if (v13 > 0x74)
        {
          if (v13 <= 0xEC)
          {
            if (v13 <= 0xC1)
            {
LABEL_74:
              v4 = v12;
              if ((v13 & 0x80) == 0)
                goto LABEL_44;
              goto LABEL_270;
            }
LABEL_104:
            v9 = v13 == 224;
            if (v13 < 0xE0)
              goto LABEL_105;
            v4 = v12;
LABEL_111:
            if (!v9)
              goto LABEL_269;
            goto LABEL_159;
          }
LABEL_106:
          if (v13 > 0xF0)
            goto LABEL_245;
          v4 = v12;
          if (v13 < 0xEE)
            goto LABEL_168;
          if (v13 < 0xF0)
            goto LABEL_269;
LABEL_162:
          v21 = *++v4;
          if ((v21 + 112) >= 0x30u)
            goto LABEL_270;
          goto LABEL_269;
        }
        if (v13 > 0x43)
        {
          if (v13 > 0x62)
          {
            if (v13 == 99)
              goto LABEL_134;
            if (v13 < 0x74)
              goto LABEL_95;
          }
          else if (v13 != 84)
          {
            goto LABEL_95;
          }
          v12 = v4 + 3;
          v13 = v4[3];
          if (_scan_html_block_end_1_yybm[v4[3]] < 0)
            goto LABEL_237;
          if (v13 > 0xC1)
            goto LABEL_238;
          if (v13 <= 0x58)
            goto LABEL_68;
          if (v13 > 0x78)
          {
            if (v13 != 121)
              goto LABEL_74;
          }
          else if (v13 >= 0x5A)
          {
            goto LABEL_95;
          }
          v23 = v4[4];
          v4 += 4;
          v6 = v23;
          if ((_scan_html_block_end_1_yybm[v23] & 0x80000000) == 0)
          {
            if (v6 > 0xC1)
              goto LABEL_259;
            if (v6 <= 0x4B)
              goto LABEL_60;
            if (v6 > 0x6B)
            {
              if (v6 != 108)
                goto LABEL_206;
            }
            else if (v6 >= 0x4D)
            {
              goto LABEL_44;
            }
            goto LABEL_117;
          }
        }
        else
        {
          if (v13 <= 9)
          {
            v4 += 2;
            if (v13)
              goto LABEL_44;
            goto LABEL_270;
          }
          if (v13 == 10)
            goto LABEL_270;
          if (v13 < 0x43)
            goto LABEL_95;
LABEL_134:
          v12 = v4 + 3;
          v13 = v4[3];
          if (_scan_html_block_end_1_yybm[v4[3]] < 0)
            goto LABEL_237;
          if (v13 > 0xC1)
            goto LABEL_238;
          if (v13 <= 0x51)
            goto LABEL_68;
          if (v13 > 0x71)
          {
            if (v13 != 114)
              goto LABEL_74;
          }
          else if (v13 >= 0x53)
          {
            goto LABEL_95;
          }
          v12 = v4 + 4;
          v13 = v4[4];
          if (_scan_html_block_end_1_yybm[v4[4]] < 0)
            goto LABEL_237;
          if (v13 > 0xC1)
            goto LABEL_238;
          if (v13 <= 0x48)
            goto LABEL_68;
          if (v13 > 0x68)
          {
            if (v13 != 105)
              goto LABEL_74;
          }
          else if (v13 >= 0x4A)
          {
            goto LABEL_95;
          }
          v12 = v4 + 5;
          v13 = v4[5];
          if (_scan_html_block_end_1_yybm[v4[5]] < 0)
            goto LABEL_237;
          if (v13 > 0xC1)
            goto LABEL_238;
          if (v13 <= 0x4F)
            goto LABEL_68;
          if (v13 > 0x6F)
          {
            if (v13 != 112)
              goto LABEL_74;
          }
          else if (v13 >= 0x51)
          {
            goto LABEL_95;
          }
          v24 = v4[6];
          v4 += 6;
          v6 = v24;
          if ((_scan_html_block_end_1_yybm[v24] & 0x80000000) == 0)
          {
            if (v6 > 0xC1)
              goto LABEL_259;
            if (v6 <= 0x53)
            {
LABEL_60:
              if (v6 && v6 != 10)
                goto LABEL_44;
              goto LABEL_270;
            }
            if (v6 > 0x73)
            {
              if (v6 != 116)
                goto LABEL_206;
            }
            else if (v6 >= 0x55)
            {
              goto LABEL_44;
            }
            goto LABEL_148;
          }
        }
      }
    }
    if (v13 > 0xEC)
      goto LABEL_106;
    if (v13 > 0xC1)
      goto LABEL_104;
    if (v13 >= 0x75)
      goto LABEL_74;
LABEL_79:
    v12 = v4 + 2;
    v13 = v4[2];
    if (_scan_html_block_end_1_yybm[v4[2]] < 0)
      goto LABEL_237;
    if (v13 > 0xC1)
      goto LABEL_238;
    if (v13 <= 0x44)
      break;
    if (v13 > 0x64)
    {
      if (v13 != 101)
        goto LABEL_74;
    }
    else if (v13 >= 0x46)
    {
      goto LABEL_95;
    }
    v12 = v4 + 3;
    v13 = v4[3];
    if (_scan_html_block_end_1_yybm[v4[3]] < 0)
      goto LABEL_237;
    if (v13 > 0xC1)
      goto LABEL_238;
    if (v13 <= 0x57)
      break;
    if (v13 > 0x77)
    {
      if (v13 != 120)
        goto LABEL_74;
    }
    else if (v13 >= 0x59)
    {
      goto LABEL_95;
    }
    v12 = v4 + 4;
    v13 = v4[4];
    if (_scan_html_block_end_1_yybm[v4[4]] < 0)
      goto LABEL_237;
    if (v13 > 0xC1)
      goto LABEL_238;
    if (v13 <= 0x53)
      break;
    if (v13 > 0x73)
    {
      if (v13 != 116)
        goto LABEL_74;
    }
    else if (v13 >= 0x55)
    {
      goto LABEL_95;
    }
    v12 = v4 + 5;
    v13 = v4[5];
    if (_scan_html_block_end_1_yybm[v4[5]] < 0)
      goto LABEL_237;
    if (v13 > 0xC1)
      goto LABEL_238;
    if (v13 <= 0x40)
      break;
    if (v13 > 0x60)
    {
      if (v13 != 97)
        goto LABEL_74;
    }
    else if (v13 >= 0x42)
    {
      goto LABEL_95;
    }
    v12 = v4 + 6;
    v13 = v4[6];
    if (_scan_html_block_end_1_yybm[v4[6]] < 0)
      goto LABEL_237;
    if (v13 > 0xC1)
      goto LABEL_238;
    if (v13 <= 0x51)
      break;
    if (v13 > 0x71)
    {
      if (v13 != 114)
        goto LABEL_74;
    }
    else if (v13 > 0x52)
    {
      goto LABEL_95;
    }
    v12 = v4 + 7;
    v13 = v4[7];
    if (_scan_html_block_end_1_yybm[v4[7]] < 0)
      goto LABEL_237;
    if (v13 > 0xC1)
    {
LABEL_238:
      if (v13 <= 0xED)
      {
        if (v13 >= 0xE0)
        {
          v4 = v12;
          if (v13 != 224)
          {
            if (v13 < 0xED)
              goto LABEL_269;
            goto LABEL_168;
          }
          goto LABEL_159;
        }
LABEL_105:
        v4 = v12;
        goto LABEL_55;
      }
      v25 = v13 == 240;
      if (v13 <= 0xF0)
      {
        v4 = v12;
        goto LABEL_265;
      }
LABEL_245:
      v4 = v12;
      v26 = v13 == 244;
      if (v13 < 0xF4)
        goto LABEL_268;
      goto LABEL_246;
    }
    if (v13 <= 0x44)
      break;
    if (v13 > 0x64)
    {
      if (v13 != 101)
        goto LABEL_74;
    }
    else if (v13 > 0x45)
    {
      goto LABEL_95;
    }
    v28 = v4[8];
    v4 += 8;
    v6 = v28;
    if ((_scan_html_block_end_1_yybm[v28] & 0x80000000) == 0)
    {
      if (v6 <= 0xC1)
      {
        if (v6 <= 0x40)
          goto LABEL_60;
        if (v6 > 0x60)
        {
          if (v6 != 97)
          {
LABEL_206:
            if ((v6 & 0x80) == 0)
              goto LABEL_44;
            goto LABEL_270;
          }
        }
        else if (v6 >= 0x42)
        {
          goto LABEL_44;
        }
        goto LABEL_148;
      }
LABEL_259:
      if (v6 <= 0xED)
      {
        if (v6 < 0xE0)
          goto LABEL_55;
        if (v6 != 224)
        {
          if (v6 < 0xED)
            goto LABEL_269;
          goto LABEL_168;
        }
LABEL_159:
        v20 = *++v4;
        if ((v20 & 0xE0) != 0xA0)
          goto LABEL_270;
        goto LABEL_55;
      }
      v25 = v6 == 240;
      if (v6 <= 0xF0)
      {
LABEL_265:
        if (!v25)
          goto LABEL_269;
        goto LABEL_162;
      }
LABEL_267:
      v26 = v6 == 244;
      if (v6 < 0xF4)
        goto LABEL_268;
LABEL_246:
      if (!v26)
        goto LABEL_270;
      goto LABEL_248;
    }
  }
LABEL_68:
  if (v13)
  {
    v4 = v12;
    if (v13 != 10)
      goto LABEL_44;
  }
LABEL_270:
  LODWORD(v4) = v5;
  if ((_DWORD)v3)
    return ((_DWORD)v4 - (_DWORD)a1);
  return v3;
}

uint64_t _scan_html_block_end_2(unsigned __int8 *a1)
{
  unsigned int v1;
  BOOL v2;
  uint64_t v3;
  unsigned __int8 *v4;
  int v5;
  uint64_t v6;
  int v7;
  char v8;
  unsigned int v9;
  unsigned __int8 *v10;
  unsigned int v11;
  unsigned int v12;
  int v13;
  BOOL v14;
  unsigned int v15;
  int v16;
  int v17;
  BOOL v18;
  char v19;
  char v20;
  int v21;
  int v22;

  v1 = *a1;
  if (v1 > 0xDF)
  {
    if (v1 <= 0xEF)
    {
      if (v1 >= 0xE1)
      {
        v4 = a1 + 1;
        v7 = (char)a1[1];
        if (v1 == 237)
        {
          v3 = 0;
          v5 = (_DWORD)a1 + 1;
          if (v7 < -96)
            goto LABEL_93;
        }
        else
        {
          v3 = 0;
          v5 = (_DWORD)a1 + 1;
          if (v7 < -64)
            goto LABEL_93;
        }
      }
      else
      {
        v3 = 0;
        v4 = a1 + 1;
        if ((a1[1] & 0xE0) == 0xA0)
        {
          v5 = (_DWORD)a1 + 1;
          goto LABEL_93;
        }
      }
      return v3;
    }
    if (v1 == 240)
    {
      v3 = 0;
      v4 = a1 + 1;
      if ((a1[1] + 112) >= 0x30u)
        return v3;
    }
    else if (v1 >= 0xF4)
    {
      if (v1 != 244)
        return 0;
      v3 = 0;
      v4 = a1 + 1;
      if ((char)a1[1] >= -112)
        return v3;
    }
    else
    {
      v3 = 0;
      v4 = a1 + 1;
      if ((char)a1[1] >= -64)
        return v3;
    }
    v5 = (int)v4;
    goto LABEL_92;
  }
  if (v1 <= 0x2C)
  {
    if (*a1)
      v2 = v1 == 10;
    else
      v2 = 1;
    if (!v2)
      goto LABEL_23;
    return 0;
  }
  if (v1 != 45)
  {
    if ((v1 & 0x80) == 0)
    {
LABEL_23:
      v4 = a1 + 1;
      LODWORD(v6) = a1[1];
      goto LABEL_24;
    }
    if (v1 > 0xC1)
    {
      v3 = 0;
      v4 = a1 + 1;
      if ((char)a1[1] < -64)
      {
        v5 = (_DWORD)a1 + 1;
        goto LABEL_43;
      }
      return v3;
    }
    return 0;
  }
  v4 = a1 + 1;
  v6 = a1[1];
  if (_scan_html_block_end_2_yybm[v6] < 0)
  {
    v3 = 0;
    v5 = (_DWORD)a1 + 1;
    goto LABEL_52;
  }
LABEL_24:
  if (v6 > 0xA)
  {
    v3 = 0;
    if ((v6 & 0x80) == 0)
    {
      v5 = (int)v4;
      goto LABEL_44;
    }
    v5 = (int)v4;
    if ((v6 + 62) >= 0x33u)
      return v3;
    while (1)
    {
LABEL_44:
      if ((_scan_html_block_end_2_yybm[v6] & 0x40) != 0)
        goto LABEL_43;
      if (v6 > 0xECu)
        break;
      if (v6 <= 0xC1u)
      {
        if ((v6 - 11) >= 0x23u)
          goto LABEL_94;
        while (1)
        {
          v9 = *++v4;
          LODWORD(v6) = v9;
          if ((_scan_html_block_end_2_yybm[v9] & 0x40) != 0)
            goto LABEL_43;
          if (v6 > 0xEC)
          {
            if (v6 <= 0xF0)
              goto LABEL_64;
            goto LABEL_68;
          }
          if (v6 > 0xC1)
            goto LABEL_85;
          if ((v6 - 11) > 0x22)
            goto LABEL_94;
LABEL_52:
          v10 = v4 + 1;
          do
          {
            v12 = *v10++;
            v11 = v12;
          }
          while (_scan_html_block_end_2_yybm[v12] < 0);
          v4 = v10 - 1;
          if (v11 > 0xDF)
          {
            if (v11 <= 0xEF)
            {
              if (v11 < 0xE1)
                goto LABEL_88;
              if (v11 == 237)
                goto LABEL_65;
              goto LABEL_92;
            }
            if (v11 == 240)
              goto LABEL_91;
            v14 = v11 == 244;
            if (v11 >= 0xF4)
              goto LABEL_80;
            goto LABEL_78;
          }
          if (v11 <= 0x3D)
          {
            if (v11 && v11 != 10)
              goto LABEL_43;
            goto LABEL_94;
          }
          if (v11 != 62)
          {
            if ((v11 & 0x80) == 0)
              goto LABEL_43;
            if (v11 >= 0xC2)
              goto LABEL_93;
            goto LABEL_94;
          }
          v15 = *v10;
          if ((_scan_html_block_end_2_yybm[*v10] & 0x40) != 0)
          {
            v3 = 1;
            v4 = v10;
            v5 = (int)v10;
            goto LABEL_43;
          }
          if (v15 > 0xEC)
          {
            v3 = 1;
            v4 = v10;
            if (v15 <= 0xF0)
            {
              v5 = (int)v10;
              if (v15 < 0xEE)
                goto LABEL_65;
              if (v15 >= 0xF0)
                goto LABEL_91;
              goto LABEL_92;
            }
            if (v15 < 0xF4)
            {
              v5 = (int)v10;
              goto LABEL_78;
            }
            v5 = (int)v10;
            if (v15 == 244)
              goto LABEL_82;
            return ((_DWORD)v10 - (_DWORD)a1);
          }
          if (v15 > 0xC1)
          {
            v3 = 1;
            v4 = v10;
            v5 = (int)v10;
            v18 = v15 == 224;
            if (v15 >= 0xE0)
              goto LABEL_86;
            goto LABEL_93;
          }
          v3 = 1;
          v4 = v10;
          v5 = (int)v10;
          if (v15 - 11 >= 0x23)
            return ((_DWORD)v10 - (_DWORD)a1);
        }
      }
      LODWORD(v6) = v6;
LABEL_85:
      v18 = (_DWORD)v6 == 224;
      if (v6 >= 0xE0)
      {
LABEL_86:
        if (v18)
        {
LABEL_88:
          v19 = *++v4;
          if ((v19 & 0xE0) != 0xA0)
            goto LABEL_94;
          goto LABEL_93;
        }
        goto LABEL_92;
      }
LABEL_93:
      v22 = (char)*++v4;
      if (v22 >= -64)
        goto LABEL_94;
LABEL_43:
      v8 = *++v4;
      LOBYTE(v6) = v8;
    }
    LODWORD(v6) = v6;
    if (v6 > 0xF0u)
    {
LABEL_68:
      v14 = (_DWORD)v6 == 244;
      if (v6 < 0xF4)
      {
LABEL_78:
        v16 = (char)*++v4;
        if (v16 >= -64)
          goto LABEL_94;
      }
      else
      {
LABEL_80:
        if (!v14)
          goto LABEL_94;
LABEL_82:
        v17 = (char)*++v4;
        if (v17 >= -112)
        {
LABEL_94:
          LODWORD(v10) = v5;
          if ((_DWORD)v3)
            return ((_DWORD)v10 - (_DWORD)a1);
          return v3;
        }
      }
    }
    else
    {
LABEL_64:
      if (v6 < 0xEE)
      {
LABEL_65:
        v13 = (char)*++v4;
        if (v13 >= -96)
          goto LABEL_94;
        goto LABEL_93;
      }
      if (v6 >= 0xF0)
      {
LABEL_91:
        v20 = *++v4;
        if ((v20 + 112) >= 0x30u)
          goto LABEL_94;
      }
    }
LABEL_92:
    v21 = (char)*++v4;
    if (v21 >= -64)
      goto LABEL_94;
    goto LABEL_93;
  }
  v3 = 0;
  if ((_DWORD)v6)
  {
    v5 = (int)v4;
    if ((_DWORD)v6 != 10)
      goto LABEL_44;
  }
  return v3;
}

uint64_t _scan_html_block_end_3(unsigned __int8 *a1)
{
  unsigned int v1;
  BOOL v2;
  uint64_t v3;
  unsigned __int8 *v4;
  unsigned int v5;
  unsigned __int8 *v6;
  int v7;
  int v8;
  char v9;
  unsigned int v10;
  char v11;
  unsigned __int8 *v12;
  unsigned int v13;
  char v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;

  v1 = *a1;
  if (v1 > 0xDF)
  {
    if (v1 <= 0xEF)
    {
      if (v1 >= 0xE1)
      {
        v4 = a1 + 1;
        v7 = (char)a1[1];
        if (v1 == 237)
        {
          v3 = 0;
          v8 = (_DWORD)a1 + 1;
          if (v7 < -96)
            goto LABEL_99;
        }
        else
        {
          v3 = 0;
          v8 = (_DWORD)a1 + 1;
          if (v7 < -64)
            goto LABEL_99;
        }
      }
      else
      {
        v3 = 0;
        v4 = a1 + 1;
        if ((a1[1] & 0xE0) == 0xA0)
        {
LABEL_90:
          v8 = (int)v4;
          goto LABEL_99;
        }
      }
      return v3;
    }
    if (v1 == 240)
    {
      v3 = 0;
      v4 = a1 + 1;
      if ((a1[1] + 112) >= 0x30u)
        return v3;
    }
    else if (v1 >= 0xF4)
    {
      if (v1 != 244)
        return 0;
      v3 = 0;
      v4 = a1 + 1;
      if ((char)a1[1] >= -112)
        return v3;
    }
    else
    {
      v3 = 0;
      v4 = a1 + 1;
      if ((char)a1[1] >= -64)
        return v3;
    }
    v8 = (int)v4;
    goto LABEL_98;
  }
  if (v1 <= 0x3E)
  {
    if (*a1)
      v2 = v1 == 10;
    else
      v2 = 1;
    if (!v2)
      goto LABEL_25;
    return 0;
  }
  if (v1 == 63)
  {
    v4 = a1 + 1;
    v5 = a1[1];
    if (v5 <= 0x3D)
    {
LABEL_26:
      v3 = 0;
      if (!v5)
        return v3;
      v8 = (int)v4;
      if (v5 == 10)
        return v3;
      while (1)
      {
LABEL_47:
        if ((_scan_html_block_end_3_yybm[v5] & 0x40) != 0)
          goto LABEL_46;
        if (v5 > 0xECu)
        {
          v5 = v5;
          if (v5 > 0xF0u)
          {
LABEL_75:
            if (v5 < 0xF4)
            {
LABEL_92:
              v16 = (char)*++v4;
              if (v16 >= -64)
                goto LABEL_100;
            }
            else
            {
              if (v5 != 244)
                goto LABEL_100;
LABEL_97:
              v17 = (char)*++v4;
              if (v17 >= -112)
              {
LABEL_100:
                LODWORD(v4) = v8;
                if ((_DWORD)v3)
                  return ((_DWORD)v4 - (_DWORD)a1);
                return v3;
              }
            }
          }
          else
          {
LABEL_79:
            if (v5 < 0xEE)
            {
LABEL_84:
              v15 = (char)*++v4;
              if (v15 >= -96)
                goto LABEL_100;
              goto LABEL_99;
            }
            if (v5 >= 0xF0)
            {
LABEL_81:
              v14 = *++v4;
              if ((v14 + 112) >= 0x30u)
                goto LABEL_100;
            }
          }
        }
        else if (v5 > 0xC1u)
        {
          if (v5 < 0xE0u)
            goto LABEL_99;
          if (v5 == 224)
          {
LABEL_65:
            v11 = *++v4;
            if ((v11 & 0xE0) != 0xA0)
              goto LABEL_100;
            goto LABEL_99;
          }
        }
        else
        {
          if ((v5 - 11) >= 0x35u)
            goto LABEL_100;
          while (1)
          {
            do
            {
              v10 = *++v4;
              v5 = v10;
            }
            while (_scan_html_block_end_3_yybm[v10] < 0);
            if (v5 > 0xDF)
            {
              if (v5 > 0xEF)
              {
                if (v5 == 240)
                  goto LABEL_81;
                goto LABEL_75;
              }
              if (v5 < 0xE1)
                goto LABEL_65;
              if (v5 != 237)
                goto LABEL_98;
              goto LABEL_84;
            }
            if (v5 <= 0x3D)
            {
              if (v5 && v5 != 10)
                goto LABEL_46;
              goto LABEL_100;
            }
            v6 = v4 - 1;
            if (v5 != 62)
            {
              if ((v5 & 0x80) == 0)
                goto LABEL_46;
              if (v5 >= 0xC2)
                goto LABEL_99;
              goto LABEL_100;
            }
LABEL_68:
            v13 = v6[2];
            v12 = v6 + 2;
            v5 = v13;
            v4 = v12;
            if ((_scan_html_block_end_3_yybm[v13] & 0x40) != 0)
            {
              v3 = 1;
              goto LABEL_45;
            }
            if (v5 > 0xEC)
            {
              v3 = 1;
              v8 = (int)v12;
              if (v5 <= 0xF0)
                goto LABEL_79;
              if (v5 < 0xF4)
                goto LABEL_92;
              if (v5 != 244)
                return ((_DWORD)v4 - (_DWORD)a1);
              goto LABEL_97;
            }
            if (v5 > 0xC1)
              break;
            v3 = 1;
            v8 = (int)v12;
            if (v5 - 11 > 0x34)
              return ((_DWORD)v4 - (_DWORD)a1);
          }
          v3 = 1;
          if (v5 < 0xE0)
            goto LABEL_90;
          v8 = (int)v12;
          if (v5 == 224)
            goto LABEL_65;
        }
LABEL_98:
        v18 = (char)*++v4;
        if (v18 >= -64)
          goto LABEL_100;
LABEL_99:
        v19 = (char)*++v4;
        if (v19 >= -64)
          goto LABEL_100;
LABEL_46:
        v9 = *++v4;
        LOBYTE(v5) = v9;
      }
    }
    if ((v5 & 0x80) == 0)
    {
      v6 = a1;
      if (v5 < 0x3F)
        goto LABEL_68;
      v3 = 0;
      goto LABEL_33;
    }
    v3 = 0;
    goto LABEL_43;
  }
  if ((v1 & 0x80) != 0)
  {
    if (v1 > 0xC1)
    {
      v3 = 0;
      v4 = a1 + 1;
      if ((char)a1[1] < -64)
      {
LABEL_45:
        v8 = (int)v4;
        goto LABEL_46;
      }
      return v3;
    }
    return 0;
  }
LABEL_25:
  v4 = a1 + 1;
  v5 = a1[1];
  if (v5 <= 0xA)
    goto LABEL_26;
  v3 = 0;
  if ((v5 & 0x80) == 0)
  {
LABEL_33:
    v8 = (int)v4;
    goto LABEL_47;
  }
LABEL_43:
  v8 = (int)v4;
  if ((v5 + 62) < 0x33u)
    goto LABEL_47;
  return v3;
}

uint64_t _scan_html_block_end_4(unsigned __int8 *a1)
{
  unsigned int v1;
  unsigned __int8 *v2;
  uint64_t v3;
  int v4;
  int v5;
  unsigned int v6;
  signed __int8 v7;
  unsigned __int8 *i;
  int v10;
  char v11;
  int v12;
  int v13;
  char v14;
  char v15;
  int v16;
  int v17;

  v1 = *a1;
  v2 = a1;
  if ((_scan_html_block_end_4_yybm[*a1] & 0x40) != 0)
    goto LABEL_67;
  if (v1 > 0xE0)
  {
    if (v1 <= 0xEF)
    {
      v2 = a1 + 1;
      v4 = (char)a1[1];
      if (v1 == 237)
      {
        v3 = 0;
        v5 = (_DWORD)a1 + 1;
        if (v4 < -96)
          goto LABEL_78;
      }
      else
      {
        v3 = 0;
        v5 = (_DWORD)a1 + 1;
        if (v4 < -64)
          goto LABEL_78;
      }
      return v3;
    }
    if (v1 == 240)
    {
      v3 = 0;
      v2 = a1 + 1;
      if ((a1[1] + 112) >= 0x30u)
        return v3;
    }
    else if (v1 >= 0xF4)
    {
      if (v1 != 244)
        return 0;
      v3 = 0;
      v2 = a1 + 1;
      if ((char)a1[1] >= -112)
        return v3;
    }
    else
    {
      v3 = 0;
      v2 = a1 + 1;
      if ((char)a1[1] >= -64)
        return v3;
    }
    v5 = (int)v2;
    goto LABEL_77;
  }
  if (v1 <= 0xA)
  {
    v3 = 0;
    if (!*a1 || v1 == 10)
      return v3;
    goto LABEL_12;
  }
  if ((v1 & 0x80) != 0)
  {
    if (v1 >= 0xC2)
    {
      v2 = a1 + 1;
      v7 = a1[1];
      if (v1 >= 0xE0)
      {
        v3 = 0;
        v5 = (_DWORD)a1 + 1;
        if ((v7 & 0xE0) == 0xA0)
          goto LABEL_78;
      }
      else
      {
        v3 = 0;
        v5 = (_DWORD)a1 + 1;
        if (v7 < -64)
          goto LABEL_62;
      }
      return v3;
    }
    return 0;
  }
LABEL_12:
  v2 = a1 + 1;
  v6 = a1[1];
  if (v6 <= 0xA)
  {
    v3 = 0;
    if (a1[1])
    {
      v5 = (_DWORD)a1 + 1;
      if (v6 != 10)
        goto LABEL_63;
    }
    return v3;
  }
  v3 = 0;
  if ((v6 & 0x80) == 0)
  {
    v5 = (_DWORD)a1 + 1;
    goto LABEL_63;
  }
  v5 = (_DWORD)a1 + 1;
  if ((v6 + 62) >= 0x33u)
    return v3;
  while (1)
  {
LABEL_63:
    if (_scan_html_block_end_4_yybm[v6] < 0)
      goto LABEL_62;
    if (v6 > 0xECu)
      break;
    if (v6 <= 0xC1u)
    {
      if ((v6 - 11) > 0x33u)
        goto LABEL_79;
LABEL_67:
      for (i = v2 + 1; ; ++i)
      {
        v2 = i;
        v6 = *i;
        if (_scan_html_block_end_4_yybm[*i] < 0)
        {
          v3 = 1;
          v5 = (int)v2;
          goto LABEL_62;
        }
        if (v6 > 0xEC)
          break;
        if (v6 > 0xC1)
        {
          v3 = 1;
          v5 = (int)v2;
          goto LABEL_73;
        }
        if (v6 - 11 >= 0x34)
          return ((_DWORD)v2 - (_DWORD)a1);
      }
      if (v6 <= 0xF0)
      {
        v3 = 1;
        v5 = (int)v2;
        goto LABEL_52;
      }
      if (v6 < 0xF4)
      {
        v3 = 1;
        v5 = (int)v2;
LABEL_58:
        v12 = (char)*++v2;
        if (v12 >= -64)
          goto LABEL_79;
        goto LABEL_77;
      }
      if (v6 != 244)
        return ((_DWORD)v2 - (_DWORD)a1);
      v3 = 1;
      v5 = (int)v2;
      goto LABEL_60;
    }
    v6 = v6;
LABEL_73:
    if (v6 < 0xE0)
      goto LABEL_78;
    if (v6 == 224)
    {
      v15 = *++v2;
      if ((v15 & 0xE0) != 0xA0)
        goto LABEL_79;
      goto LABEL_78;
    }
LABEL_77:
    v16 = (char)*++v2;
    if (v16 >= -64)
      goto LABEL_79;
LABEL_78:
    v17 = (char)*++v2;
    if (v17 >= -64)
      goto LABEL_79;
LABEL_62:
    v14 = *++v2;
    LOBYTE(v6) = v14;
  }
  v6 = v6;
  if (v6 > 0xF0u)
  {
    if (v6 < 0xF4u)
      goto LABEL_58;
    if (v6 != 244)
      goto LABEL_79;
LABEL_60:
    v13 = (char)*++v2;
    if (v13 >= -112)
      goto LABEL_79;
    goto LABEL_77;
  }
LABEL_52:
  if (v6 < 0xEE)
  {
    v10 = (char)*++v2;
    if (v10 >= -96)
      goto LABEL_79;
    goto LABEL_78;
  }
  if (v6 < 0xF0)
    goto LABEL_77;
  v11 = *++v2;
  if ((v11 + 112) < 0x30u)
    goto LABEL_77;
LABEL_79:
  LODWORD(v2) = v5;
  if ((_DWORD)v3)
    return ((_DWORD)v2 - (_DWORD)a1);
  return v3;
}

uint64_t _scan_html_block_end_5(unsigned __int8 *a1)
{
  unsigned int v1;
  BOOL v2;
  uint64_t v3;
  unsigned __int8 *v4;
  int v5;
  uint64_t v6;
  int v7;
  char v8;
  unsigned int v9;
  unsigned __int8 *v10;
  unsigned int v11;
  unsigned int v12;
  int v13;
  BOOL v14;
  unsigned int v15;
  int v16;
  int v17;
  BOOL v18;
  char v19;
  char v20;
  int v21;
  int v22;

  v1 = *a1;
  if (v1 > 0xDF)
  {
    if (v1 <= 0xEF)
    {
      if (v1 >= 0xE1)
      {
        v4 = a1 + 1;
        v7 = (char)a1[1];
        if (v1 == 237)
        {
          v3 = 0;
          v5 = (_DWORD)a1 + 1;
          if (v7 < -96)
            goto LABEL_93;
        }
        else
        {
          v3 = 0;
          v5 = (_DWORD)a1 + 1;
          if (v7 < -64)
            goto LABEL_93;
        }
      }
      else
      {
        v3 = 0;
        v4 = a1 + 1;
        if ((a1[1] & 0xE0) == 0xA0)
        {
          v5 = (_DWORD)a1 + 1;
          goto LABEL_93;
        }
      }
      return v3;
    }
    if (v1 == 240)
    {
      v3 = 0;
      v4 = a1 + 1;
      if ((a1[1] + 112) >= 0x30u)
        return v3;
    }
    else if (v1 >= 0xF4)
    {
      if (v1 != 244)
        return 0;
      v3 = 0;
      v4 = a1 + 1;
      if ((char)a1[1] >= -112)
        return v3;
    }
    else
    {
      v3 = 0;
      v4 = a1 + 1;
      if ((char)a1[1] >= -64)
        return v3;
    }
    v5 = (int)v4;
    goto LABEL_92;
  }
  if (v1 <= 0x5C)
  {
    if (*a1)
      v2 = v1 == 10;
    else
      v2 = 1;
    if (!v2)
      goto LABEL_23;
    return 0;
  }
  if (v1 != 93)
  {
    if ((v1 & 0x80) == 0)
    {
LABEL_23:
      v4 = a1 + 1;
      LODWORD(v6) = a1[1];
      goto LABEL_24;
    }
    if (v1 > 0xC1)
    {
      v3 = 0;
      v4 = a1 + 1;
      if ((char)a1[1] < -64)
      {
        v5 = (_DWORD)a1 + 1;
        goto LABEL_43;
      }
      return v3;
    }
    return 0;
  }
  v4 = a1 + 1;
  v6 = a1[1];
  if (_scan_html_block_end_5_yybm[v6] < 0)
  {
    v3 = 0;
    v5 = (_DWORD)a1 + 1;
    goto LABEL_52;
  }
LABEL_24:
  if (v6 > 0xA)
  {
    v3 = 0;
    if ((v6 & 0x80) == 0)
    {
      v5 = (int)v4;
      goto LABEL_44;
    }
    v5 = (int)v4;
    if ((v6 + 62) >= 0x33u)
      return v3;
    while (1)
    {
LABEL_44:
      if ((_scan_html_block_end_5_yybm[v6] & 0x40) != 0)
        goto LABEL_43;
      if (v6 > 0xECu)
        break;
      if (v6 <= 0xC1u)
      {
        if ((v6 - 11) >= 0x53u)
          goto LABEL_94;
        while (1)
        {
          v9 = *++v4;
          LODWORD(v6) = v9;
          if ((_scan_html_block_end_5_yybm[v9] & 0x40) != 0)
            goto LABEL_43;
          if (v6 > 0xEC)
          {
            if (v6 <= 0xF0)
              goto LABEL_64;
            goto LABEL_68;
          }
          if (v6 > 0xC1)
            goto LABEL_85;
          if ((v6 - 11) > 0x52)
            goto LABEL_94;
LABEL_52:
          v10 = v4 + 1;
          do
          {
            v12 = *v10++;
            v11 = v12;
          }
          while (_scan_html_block_end_5_yybm[v12] < 0);
          v4 = v10 - 1;
          if (v11 > 0xDF)
          {
            if (v11 <= 0xEF)
            {
              if (v11 < 0xE1)
                goto LABEL_88;
              if (v11 == 237)
                goto LABEL_65;
              goto LABEL_92;
            }
            if (v11 == 240)
              goto LABEL_91;
            v14 = v11 == 244;
            if (v11 >= 0xF4)
              goto LABEL_80;
            goto LABEL_78;
          }
          if (v11 <= 0x3D)
          {
            if (v11 && v11 != 10)
              goto LABEL_43;
            goto LABEL_94;
          }
          if (v11 != 62)
          {
            if ((v11 & 0x80) == 0)
              goto LABEL_43;
            if (v11 >= 0xC2)
              goto LABEL_93;
            goto LABEL_94;
          }
          v15 = *v10;
          if ((_scan_html_block_end_5_yybm[*v10] & 0x40) != 0)
          {
            v3 = 1;
            v4 = v10;
            v5 = (int)v10;
            goto LABEL_43;
          }
          if (v15 > 0xEC)
          {
            v3 = 1;
            v4 = v10;
            if (v15 <= 0xF0)
            {
              v5 = (int)v10;
              if (v15 < 0xEE)
                goto LABEL_65;
              if (v15 >= 0xF0)
                goto LABEL_91;
              goto LABEL_92;
            }
            if (v15 < 0xF4)
            {
              v5 = (int)v10;
              goto LABEL_78;
            }
            v5 = (int)v10;
            if (v15 == 244)
              goto LABEL_82;
            return ((_DWORD)v10 - (_DWORD)a1);
          }
          if (v15 > 0xC1)
          {
            v3 = 1;
            v4 = v10;
            v5 = (int)v10;
            v18 = v15 == 224;
            if (v15 >= 0xE0)
              goto LABEL_86;
            goto LABEL_93;
          }
          v3 = 1;
          v4 = v10;
          v5 = (int)v10;
          if (v15 - 11 >= 0x53)
            return ((_DWORD)v10 - (_DWORD)a1);
        }
      }
      LODWORD(v6) = v6;
LABEL_85:
      v18 = (_DWORD)v6 == 224;
      if (v6 >= 0xE0)
      {
LABEL_86:
        if (v18)
        {
LABEL_88:
          v19 = *++v4;
          if ((v19 & 0xE0) != 0xA0)
            goto LABEL_94;
          goto LABEL_93;
        }
        goto LABEL_92;
      }
LABEL_93:
      v22 = (char)*++v4;
      if (v22 >= -64)
        goto LABEL_94;
LABEL_43:
      v8 = *++v4;
      LOBYTE(v6) = v8;
    }
    LODWORD(v6) = v6;
    if (v6 > 0xF0u)
    {
LABEL_68:
      v14 = (_DWORD)v6 == 244;
      if (v6 < 0xF4)
      {
LABEL_78:
        v16 = (char)*++v4;
        if (v16 >= -64)
          goto LABEL_94;
      }
      else
      {
LABEL_80:
        if (!v14)
          goto LABEL_94;
LABEL_82:
        v17 = (char)*++v4;
        if (v17 >= -112)
        {
LABEL_94:
          LODWORD(v10) = v5;
          if ((_DWORD)v3)
            return ((_DWORD)v10 - (_DWORD)a1);
          return v3;
        }
      }
    }
    else
    {
LABEL_64:
      if (v6 < 0xEE)
      {
LABEL_65:
        v13 = (char)*++v4;
        if (v13 >= -96)
          goto LABEL_94;
        goto LABEL_93;
      }
      if (v6 >= 0xF0)
      {
LABEL_91:
        v20 = *++v4;
        if ((v20 + 112) >= 0x30u)
          goto LABEL_94;
      }
    }
LABEL_92:
    v21 = (char)*++v4;
    if (v21 >= -64)
      goto LABEL_94;
    goto LABEL_93;
  }
  v3 = 0;
  if ((_DWORD)v6)
  {
    v5 = (int)v4;
    if ((_DWORD)v6 != 10)
      goto LABEL_44;
  }
  return v3;
}

uint64_t _scan_link_title(unsigned __int8 *a1)
{
  unsigned int v1;
  _BYTE *v2;
  unsigned int v3;
  uint64_t v4;
  int v5;
  int v6;
  char v7;
  char v8;
  int v9;
  BOOL v10;
  int v11;
  int v12;
  int v13;
  char v14;
  unsigned int v15;
  int v16;
  char v17;
  char v18;
  int v19;
  BOOL v20;
  int v21;
  int v22;
  int v23;
  char v24;
  unsigned int v25;
  int v27;
  char v28;
  char v29;
  int v30;
  BOOL v31;
  int v32;
  int v33;
  int v34;
  char v35;

  v1 = *a1;
  if (v1 <= 0x26)
  {
    if (v1 == 34)
    {
      v2 = a1 + 1;
      v3 = (char)a1[1];
      if (a1[1])
      {
        if ((v3 & 0x80000000) == 0 || (v3 + 62) <= 0x32u)
        {
          v4 = 0;
          v5 = (_DWORD)a1 + 1;
          while (1)
          {
            if ((_scan_link_title_yybm[v3] & 0x10) != 0)
              goto LABEL_45;
            if (v3 > 0xE0u)
              break;
            if (v3 > 0x5Cu)
            {
              v3 = v3;
              if (v3 < 0xC2u)
                goto LABEL_197;
LABEL_30:
              if (v3 >= 0xE0)
              {
LABEL_31:
                v7 = *++v2;
                if ((v7 & 0xE0) != 0xA0)
                  goto LABEL_197;
              }
              goto LABEL_44;
            }
            if (!(_BYTE)v3)
              goto LABEL_197;
            v3 = v3;
LABEL_12:
            if (v3 < 0x23)
              goto LABEL_199;
            ++v2;
            while (1)
            {
              v3 = *v2;
              if ((_scan_link_title_yybm[*v2] & 0x10) != 0)
                break;
              if (v3 > 0xE0)
              {
                if (v3 <= 0xEF)
                  goto LABEL_26;
                if (v3 == 240)
                  goto LABEL_34;
                v10 = v3 == 244;
                if (v3 < 0xF4)
                  goto LABEL_37;
                goto LABEL_40;
              }
              if (v3 > 0x5C)
              {
                if (v3 < 0xC2)
                  goto LABEL_197;
                if (v3 > 0xDF)
                  goto LABEL_31;
                goto LABEL_44;
              }
              if (!*v2)
                goto LABEL_197;
              ++v2;
              if (v3 < 0x23)
              {
                v3 = *v2;
                if ((_scan_link_title_yybm[*v2] & 0x10) != 0)
                {
                  v4 = 1;
                  v5 = (int)v2;
                  break;
                }
                if (v3 > 0xE0)
                {
                  if (v3 <= 0xEF)
                  {
                    v4 = 1;
                    v5 = (int)v2;
                    goto LABEL_26;
                  }
                  if (v3 == 240)
                  {
                    v4 = 1;
                    v5 = (int)v2;
                    goto LABEL_34;
                  }
                  if (v3 < 0xF4)
                  {
                    v4 = 1;
                    v5 = (int)v2;
                    goto LABEL_37;
                  }
                  if (v3 == 244)
                  {
                    v4 = 1;
                    v5 = (int)v2;
                    goto LABEL_42;
                  }
                  goto LABEL_200;
                }
                if (v3 <= 0x5C)
                {
                  if (!*v2)
                    goto LABEL_200;
                  v4 = 1;
                  v5 = (int)v2;
                  goto LABEL_12;
                }
                if (v3 < 0xC2)
                  goto LABEL_200;
                v4 = 1;
                v5 = (int)v2;
                goto LABEL_30;
              }
            }
LABEL_45:
            v14 = *++v2;
            LOBYTE(v3) = v14;
          }
          if (v3 > 0xEFu)
          {
            if (v3 == 240)
            {
LABEL_34:
              v8 = *++v2;
              if ((v8 + 112) >= 0x30u)
                goto LABEL_197;
            }
            else if (v3 >= 0xF4u)
            {
              v10 = v3 == 244;
LABEL_40:
              if (!v10)
                goto LABEL_197;
LABEL_42:
              v11 = (char)*++v2;
              if (v11 >= -112)
                goto LABEL_197;
            }
            else
            {
LABEL_37:
              v9 = (char)*++v2;
              if (v9 >= -64)
                goto LABEL_197;
            }
          }
          else
          {
            v3 = v3;
LABEL_26:
            if (v3 == 237)
            {
              v6 = (char)*++v2;
              if (v6 >= -96)
                goto LABEL_197;
              goto LABEL_44;
            }
          }
          v12 = (char)*++v2;
          if (v12 >= -64)
            goto LABEL_197;
LABEL_44:
          v13 = (char)*++v2;
          if (v13 >= -64)
            goto LABEL_197;
          goto LABEL_45;
        }
      }
    }
    return 0;
  }
  if (v1 == 39)
  {
    v2 = a1 + 1;
    v15 = (char)a1[1];
    if (!a1[1] || (v15 & 0x80000000) != 0 && (v15 + 62) > 0x32u)
      return 0;
    v4 = 0;
    v5 = (_DWORD)a1 + 1;
    while (1)
    {
      if ((_scan_link_title_yybm[v15] & 0x40) != 0)
        goto LABEL_107;
      if (v15 > 0xE0u)
        break;
      if (v15 > 0x5Cu)
      {
        v15 = v15;
        if (v15 < 0xC2u)
          goto LABEL_197;
LABEL_92:
        if (v15 >= 0xE0)
        {
LABEL_93:
          v17 = *++v2;
          if ((v17 & 0xE0) != 0xA0)
            goto LABEL_197;
        }
        goto LABEL_106;
      }
      if (!(_BYTE)v15)
        goto LABEL_197;
      v15 = v15;
LABEL_74:
      if (v15 < 0x28)
        goto LABEL_199;
      ++v2;
      while (1)
      {
        v15 = *v2;
        if ((_scan_link_title_yybm[*v2] & 0x40) != 0)
          break;
        if (v15 > 0xE0)
        {
          if (v15 <= 0xEF)
            goto LABEL_88;
          if (v15 == 240)
            goto LABEL_96;
          v20 = v15 == 244;
          if (v15 < 0xF4)
            goto LABEL_99;
          goto LABEL_102;
        }
        if (v15 > 0x5C)
        {
          if (v15 < 0xC2)
            goto LABEL_197;
          if (v15 > 0xDF)
            goto LABEL_93;
          goto LABEL_106;
        }
        if (!*v2)
          goto LABEL_197;
        ++v2;
        if (v15 < 0x28)
        {
          v15 = *v2;
          if ((_scan_link_title_yybm[*v2] & 0x40) != 0)
          {
            v4 = 2;
            v5 = (int)v2;
            break;
          }
          if (v15 > 0xE0)
          {
            if (v15 <= 0xEF)
            {
              v4 = 2;
              v5 = (int)v2;
              goto LABEL_88;
            }
            if (v15 == 240)
            {
              v4 = 2;
              v5 = (int)v2;
              goto LABEL_96;
            }
            if (v15 < 0xF4)
            {
              v4 = 2;
              v5 = (int)v2;
              goto LABEL_99;
            }
            if (v15 == 244)
            {
              v4 = 2;
              v5 = (int)v2;
              goto LABEL_104;
            }
            goto LABEL_200;
          }
          if (v15 <= 0x5C)
          {
            if (!*v2)
              goto LABEL_200;
            v4 = 2;
            v5 = (int)v2;
            goto LABEL_74;
          }
          if (v15 < 0xC2)
            goto LABEL_200;
          v4 = 2;
          v5 = (int)v2;
          goto LABEL_92;
        }
      }
LABEL_107:
      v24 = *++v2;
      LOBYTE(v15) = v24;
    }
    if (v15 > 0xEFu)
    {
      if (v15 == 240)
      {
LABEL_96:
        v18 = *++v2;
        if ((v18 + 112) >= 0x30u)
          goto LABEL_197;
      }
      else if (v15 >= 0xF4u)
      {
        v20 = v15 == 244;
LABEL_102:
        if (!v20)
          goto LABEL_197;
LABEL_104:
        v21 = (char)*++v2;
        if (v21 >= -112)
          goto LABEL_197;
      }
      else
      {
LABEL_99:
        v19 = (char)*++v2;
        if (v19 >= -64)
          goto LABEL_197;
      }
    }
    else
    {
      v15 = v15;
LABEL_88:
      if (v15 == 237)
      {
        v16 = (char)*++v2;
        if (v16 >= -96)
          goto LABEL_197;
        goto LABEL_106;
      }
    }
    v22 = (char)*++v2;
    if (v22 >= -64)
      goto LABEL_197;
LABEL_106:
    v23 = (char)*++v2;
    if (v23 >= -64)
      goto LABEL_197;
    goto LABEL_107;
  }
  if (v1 >= 0x29)
    return 0;
  v2 = a1 + 1;
  v25 = a1[1];
  if (v25 > 0x28)
  {
    if ((v25 & 0x80) != 0 && (v25 + 62) >= 0x33u)
      return 0;
  }
  else
  {
    v4 = 0;
    if (!a1[1] || v25 == 40)
      return v4;
  }
  v4 = 0;
  v5 = (_DWORD)a1 + 1;
LABEL_136:
  if (_scan_link_title_yybm[v25] < 0)
    goto LABEL_180;
  if (v25 > 0xE0u)
  {
    if (v25 > 0xEFu)
    {
      if (v25 != 240)
      {
        if (v25 >= 0xF4u)
        {
          v31 = v25 == 244;
LABEL_175:
          if (!v31)
            goto LABEL_197;
LABEL_177:
          v32 = (char)*++v2;
          if (v32 >= -112)
            goto LABEL_197;
          goto LABEL_178;
        }
        goto LABEL_166;
      }
LABEL_163:
      v29 = *++v2;
      if ((v29 + 112) >= 0x30u)
        goto LABEL_197;
    }
    else
    {
      v25 = v25;
LABEL_155:
      if (v25 == 237)
      {
        v27 = (char)*++v2;
        if (v27 >= -96)
          goto LABEL_197;
        goto LABEL_179;
      }
    }
LABEL_178:
    v33 = (char)*++v2;
    if (v33 >= -64)
      goto LABEL_197;
    goto LABEL_179;
  }
  v25 = v25;
  if (v25 > 0x5Cu)
  {
    if (v25 < 0xC2u)
      goto LABEL_197;
LABEL_159:
    if (v25 < 0xE0)
      goto LABEL_179;
    goto LABEL_160;
  }
  if (v25 < 0x29u)
    goto LABEL_197;
  if (v25 == 41)
    goto LABEL_199;
  while (2)
  {
    v2 += 2;
    while (1)
    {
      v25 = *(v2 - 1);
      if (v25 > 0xDF)
      {
        --v2;
        if (v25 <= 0xEF)
        {
          if (v25 >= 0xE1)
            goto LABEL_155;
LABEL_160:
          v28 = *++v2;
          if ((v28 & 0xE0) != 0xA0)
            goto LABEL_197;
          goto LABEL_179;
        }
        if (v25 == 240)
          goto LABEL_163;
        v31 = v25 == 244;
        if (v25 >= 0xF4)
          goto LABEL_175;
LABEL_166:
        v30 = (char)*++v2;
        if (v30 >= -64)
          goto LABEL_197;
        goto LABEL_178;
      }
      if (v25 <= 0x5B)
        break;
      ++v2;
      if (v25 != 92)
      {
        v2 -= 2;
        if ((v25 & 0x80) == 0)
          goto LABEL_180;
        if (v25 < 0xC2)
        {
LABEL_197:
          if ((_DWORD)v4)
            return (v5 - (_DWORD)a1);
          return v4;
        }
LABEL_179:
        v34 = (char)*++v2;
        if (v34 >= -64)
          goto LABEL_197;
LABEL_180:
        v35 = *++v2;
        LOBYTE(v25) = v35;
        goto LABEL_136;
      }
    }
    if (v25 != 41)
    {
      if (!*(v2 - 1))
        goto LABEL_197;
      --v2;
      goto LABEL_180;
    }
    v25 = *v2;
    if (_scan_link_title_yybm[*v2] < 0)
    {
      v4 = 3;
      v5 = (int)v2;
      goto LABEL_180;
    }
    if (v25 > 0xE0)
    {
      if (v25 <= 0xEF)
      {
        v4 = 3;
        v5 = (int)v2;
        goto LABEL_155;
      }
      if (v25 == 240)
      {
        v4 = 3;
        v5 = (int)v2;
        goto LABEL_163;
      }
      if (v25 < 0xF4)
      {
        v4 = 3;
        v5 = (int)v2;
        goto LABEL_166;
      }
      if (v25 == 244)
      {
        v4 = 3;
        v5 = (int)v2;
        goto LABEL_177;
      }
      goto LABEL_200;
    }
    if (v25 > 0x5C)
    {
      if (v25 >= 0xC2)
      {
        v4 = 3;
        v5 = (int)v2;
        goto LABEL_159;
      }
      goto LABEL_200;
    }
    if (v25 < 0x29)
    {
LABEL_200:
      v5 = (int)v2;
      return (v5 - (_DWORD)a1);
    }
    v4 = 3;
    v5 = (int)v2;
    if (v25 != 41)
      continue;
    break;
  }
LABEL_199:
  v5 = (_DWORD)v2 + 1;
  return (v5 - (_DWORD)a1);
}

uint64_t _scan_spacechars(unsigned __int8 *a1)
{
  uint64_t result;
  unsigned __int8 *v3;
  int v4;

  if ((_scan_spacechars_yybm[*a1] & 0x80000000) == 0)
    return 0;
  result = 0;
  v3 = a1 + 1;
  do
    v4 = _scan_spacechars_yybm[v3[result++]];
  while (v4 < 0);
  return result;
}

uint64_t _scan_setext_heading_line(unsigned __int8 *a1)
{
  int v1;
  unsigned __int8 *i;
  unsigned int v3;
  char v4;
  unsigned __int8 *v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  BOOL v12;
  unsigned int v14;

  v1 = *a1;
  if (v1 == 61)
  {
    v7 = a1[1];
    v5 = a1 + 1;
    v6 = v7;
    if ((_scan_setext_heading_line_yybm[v7] & 0x80000000) == 0)
    {
      if (v6 <= 0xC)
      {
        if (v6 - 9 < 2)
          goto LABEL_44;
        return 0;
      }
      if (v6 != 13 && v6 != 32)
        return 0;
      while (1)
      {
LABEL_44:
        if (v6 > 0xC)
        {
          if (v6 != 32)
            return v6 == 13;
        }
        else
        {
          if (v6 < 9)
            return 0;
          if (v6 != 9)
            return v6 <= 0xA;
        }
LABEL_43:
        v14 = *++v5;
        v6 = v14;
      }
    }
    do
    {
      v9 = *++v5;
      v8 = v9;
    }
    while (_scan_setext_heading_line_yybm[v9] < 0);
    if (v8 > 0xC)
    {
      if (v8 != 13)
      {
        if (v8 == 32)
          goto LABEL_43;
        return 0;
      }
    }
    else
    {
      if (v8 < 9)
        return 0;
      if (v8 == 9)
        goto LABEL_43;
      if (v8 >= 0xB)
        return 0;
    }
    return 1;
  }
  else
  {
    if (v1 != 45)
      return 0;
    i = a1 + 1;
    v3 = a1[1];
    v4 = _scan_setext_heading_line_yybm[a1[1]];
    if ((v4 & 0x40) != 0)
    {
      for (i = a1 + 2; ; ++i)
      {
        v10 = *i;
        if ((_scan_setext_heading_line_yybm[*i] & 0x20) != 0)
          goto LABEL_34;
        if (v10 <= 0xC)
          break;
        if (v10 != 45)
        {
          if (v10 == 13)
            return 2;
          return 0;
        }
      }
      if (v10 - 9 < 2)
        return 2;
      return 0;
    }
    if (v3 > 0xC)
    {
      if (v3 != 13 && v3 != 32)
        return 0;
    }
    else if (v3 - 9 >= 2)
    {
      return 0;
    }
    while ((v4 & 0x20) != 0)
    {
LABEL_34:
      v11 = *++i;
      v3 = v11;
      v4 = _scan_setext_heading_line_yybm[v11];
    }
    if (v3 >= 9 && (v3 >= 0xB ? (v12 = v3 == 13) : (v12 = 1), v12))
      return 2;
    else
      return 0;
  }
}

uint64_t _scan_close_code_fence(unsigned __int8 *a1)
{
  int v1;
  uint64_t v2;
  unsigned int v3;
  char v4;
  unsigned __int8 *v5;
  unsigned int v7;
  char v8;
  unsigned __int8 *v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v13;
  unsigned int v14;

  v1 = *a1;
  if (v1 == 126)
  {
    if (a1[1] != 126 || (_scan_close_code_fence_yybm[a1[2]] & 0x40) == 0)
      return 0;
    v2 = 3;
    do
    {
      v7 = a1[v2];
      v8 = _scan_close_code_fence_yybm[a1[v2++]];
    }
    while ((v8 & 0x40) != 0);
    v9 = &a1[v2];
    if (v7 <= 0xC)
    {
      if (v7 >= 9)
      {
        if (v7 == 9)
          goto LABEL_34;
        if (v7 < 0xB)
          return (v2 - 1);
      }
      return 0;
    }
    if (v7 != 13)
    {
      if (v7 == 32)
      {
        do
        {
LABEL_34:
          while (1)
          {
            v14 = *v9++;
            v13 = v14;
            if (v14 <= 0xC)
              break;
            if (v13 != 32)
            {
              if (v13 != 13)
                return 0;
              return (v2 - 1);
            }
          }
          if (v13 < 9)
            return 0;
        }
        while (v13 == 9);
        if (v13 > 0xA)
          return 0;
        return (v2 - 1);
      }
      return 0;
    }
  }
  else
  {
    if (v1 != 96 || a1[1] != 96 || (_scan_close_code_fence_yybm[a1[2]] & 0x20) == 0)
      return 0;
    v2 = 3;
    do
    {
      v3 = a1[v2];
      v4 = _scan_close_code_fence_yybm[a1[v2++]];
    }
    while ((v4 & 0x20) != 0);
    v5 = &a1[v2];
    if (v3 <= 0xC)
    {
      if (v3 < 9)
        return 0;
      if (v3 != 9)
      {
        if (v3 < 0xB)
          return (v2 - 1);
        return 0;
      }
      do
      {
LABEL_24:
        v11 = *v5++;
        v10 = v11;
      }
      while (_scan_close_code_fence_yybm[v11] < 0);
      if (v10 >= 9 && (v10 < 0xB || v10 == 13))
        return (v2 - 1);
      return 0;
    }
    if (v3 != 13)
    {
      if (v3 != 32)
        return 0;
      goto LABEL_24;
    }
  }
  return (v2 - 1);
}

uint64_t _scan_entity(_BYTE *a1)
{
  unsigned int v1;
  unsigned int v2;
  _BYTE *v3;
  unsigned int v4;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  BOOL v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  unsigned int v32;
  unsigned int v33;
  unsigned int v34;
  unsigned int v35;
  unsigned int v36;
  unsigned int v37;
  unsigned int v38;
  unsigned int v39;
  unsigned int v40;
  unsigned int v41;
  unsigned int v43;
  BOOL v44;
  unsigned int v45;

  if (*a1 != 38)
    return 0;
  v1 = a1[1];
  if (v1 <= 0x40)
  {
    if (v1 != 35)
      return 0;
    v2 = a1[2];
    if (v2 <= 0x57)
    {
      if (v2 - 48 >= 0xA)
        return 0;
      LODWORD(v3) = (_DWORD)a1 + 3;
      v4 = a1[3];
      if (v4 < 0x30)
        return 0;
      if (v4 >= 0x3A)
        goto LABEL_130;
      LODWORD(v3) = (_DWORD)a1 + 4;
      v4 = a1[4];
      if (v4 < 0x30)
        return 0;
      if (v4 >= 0x3A)
        goto LABEL_130;
      LODWORD(v3) = (_DWORD)a1 + 5;
      v4 = a1[5];
      if (v4 < 0x30)
        return 0;
      if (v4 >= 0x3A)
        goto LABEL_130;
      LODWORD(v3) = (_DWORD)a1 + 6;
      v4 = a1[6];
      if (v4 < 0x30)
        return 0;
      if (v4 >= 0x3A)
        goto LABEL_130;
      LODWORD(v3) = (_DWORD)a1 + 7;
      v4 = a1[7];
      if (v4 < 0x30)
        return 0;
      if (v4 >= 0x3A)
        goto LABEL_130;
      v3 = a1 + 8;
      v4 = a1[8];
      if (v4 < 0x30)
        return 0;
      if (v4 >= 0x3A)
        goto LABEL_130;
      goto LABEL_129;
    }
    if ((v2 & 0xFFFFFFDF) != 0x58)
      return 0;
    v7 = a1[3];
    if (v7 > 0x40)
    {
      if (v7 >= 0x47 && v7 - 97 >= 6)
        return 0;
    }
    else if (v7 - 48 >= 0xA)
    {
      return 0;
    }
    LODWORD(v3) = (_DWORD)a1 + 4;
    v11 = a1[4];
    if (v11 > 0x3B)
    {
      if (v11 > 0x46)
      {
        if (v11 - 97 >= 6)
          return 0;
      }
      else if (v11 < 0x41)
      {
        return 0;
      }
    }
    else
    {
      if (v11 < 0x30)
        return 0;
      v9 = v11 == 58;
      if (v11 >= 0x3A)
        goto LABEL_288;
    }
    LODWORD(v3) = (_DWORD)a1 + 5;
    v13 = a1[5];
    if (v13 > 0x3B)
    {
      if (v13 > 0x46)
      {
        if (v13 - 97 >= 6)
          return 0;
      }
      else if (v13 < 0x41)
      {
        return 0;
      }
    }
    else
    {
      if (v13 < 0x30)
        return 0;
      v9 = v13 == 58;
      if (v13 >= 0x3A)
        goto LABEL_288;
    }
    LODWORD(v3) = (_DWORD)a1 + 6;
    v15 = a1[6];
    if (v15 > 0x3B)
    {
      if (v15 > 0x46)
      {
        if (v15 - 97 >= 6)
          return 0;
      }
      else if (v15 < 0x41)
      {
        return 0;
      }
    }
    else
    {
      if (v15 < 0x30)
        return 0;
      v9 = v15 == 58;
      if (v15 >= 0x3A)
        goto LABEL_288;
    }
    LODWORD(v3) = (_DWORD)a1 + 7;
    v17 = a1[7];
    if (v17 > 0x3B)
    {
      if (v17 > 0x46)
      {
        if (v17 - 97 >= 6)
          return 0;
      }
      else if (v17 < 0x41)
      {
        return 0;
      }
    }
    else
    {
      if (v17 < 0x30)
        return 0;
      v9 = v17 == 58;
      if (v17 >= 0x3A)
        goto LABEL_288;
    }
    v3 = a1 + 8;
    v19 = a1[8];
    if (v19 <= 0x3B)
    {
      if (v19 < 0x30)
        return 0;
      v9 = v19 == 58;
      if (v19 >= 0x3A)
        goto LABEL_288;
LABEL_129:
      v21 = v3[1];
      LODWORD(v3) = (_DWORD)v3 + 1;
      v4 = v21;
LABEL_130:
      if (v4 == 59)
        return ((_DWORD)v3 - (_DWORD)a1 + 1);
      return 0;
    }
    if (v19 > 0x46)
    {
      if (v19 - 97 >= 6)
        return 0;
      goto LABEL_129;
    }
    goto LABEL_118;
  }
  if (v1 >= 0x5B && v1 - 97 >= 0x1A)
    return 0;
  v6 = a1[2];
  if (v6 > 0x40)
  {
    if (v6 >= 0x5B && v6 - 97 >= 0x1A)
      return 0;
  }
  else if (v6 - 48 >= 0xA)
  {
    return 0;
  }
  LODWORD(v3) = (_DWORD)a1 + 3;
  v8 = a1[3];
  if (v8 > 0x3B)
  {
    if (v8 > 0x5A)
    {
      if (v8 - 97 >= 0x1A)
        return 0;
    }
    else if (v8 < 0x41)
    {
      return 0;
    }
  }
  else
  {
    if (v8 < 0x30)
      return 0;
    v9 = v8 == 58;
    if (v8 >= 0x3A)
      goto LABEL_288;
  }
  LODWORD(v3) = (_DWORD)a1 + 4;
  v10 = a1[4];
  if (v10 > 0x3B)
  {
    if (v10 > 0x5A)
    {
      if (v10 - 97 >= 0x1A)
        return 0;
    }
    else if (v10 < 0x41)
    {
      return 0;
    }
  }
  else
  {
    if (v10 < 0x30)
      return 0;
    v9 = v10 == 58;
    if (v10 >= 0x3A)
      goto LABEL_288;
  }
  LODWORD(v3) = (_DWORD)a1 + 5;
  v12 = a1[5];
  if (v12 > 0x3B)
  {
    if (v12 > 0x5A)
    {
      if (v12 - 97 >= 0x1A)
        return 0;
    }
    else if (v12 < 0x41)
    {
      return 0;
    }
  }
  else
  {
    if (v12 < 0x30)
      return 0;
    v9 = v12 == 58;
    if (v12 >= 0x3A)
      goto LABEL_288;
  }
  LODWORD(v3) = (_DWORD)a1 + 6;
  v14 = a1[6];
  if (v14 > 0x3B)
  {
    if (v14 > 0x5A)
    {
      if (v14 - 97 >= 0x1A)
        return 0;
    }
    else if (v14 < 0x41)
    {
      return 0;
    }
  }
  else
  {
    if (v14 < 0x30)
      return 0;
    v9 = v14 == 58;
    if (v14 >= 0x3A)
      goto LABEL_288;
  }
  LODWORD(v3) = (_DWORD)a1 + 7;
  v16 = a1[7];
  if (v16 > 0x3B)
  {
    if (v16 > 0x5A)
    {
      if (v16 - 97 >= 0x1A)
        return 0;
    }
    else if (v16 < 0x41)
    {
      return 0;
    }
  }
  else
  {
    if (v16 < 0x30)
      return 0;
    v9 = v16 == 58;
    if (v16 >= 0x3A)
      goto LABEL_288;
  }
  LODWORD(v3) = (_DWORD)a1 + 8;
  v18 = a1[8];
  if (v18 > 0x3B)
  {
    if (v18 > 0x5A)
    {
      if (v18 - 97 >= 0x1A)
        return 0;
    }
    else if (v18 < 0x41)
    {
      return 0;
    }
  }
  else
  {
    if (v18 < 0x30)
      return 0;
    v9 = v18 == 58;
    if (v18 >= 0x3A)
      goto LABEL_288;
  }
  LODWORD(v3) = (_DWORD)a1 + 9;
  v20 = a1[9];
  if (v20 > 0x3B)
  {
    if (v20 > 0x5A)
    {
      if (v20 - 123 < 0xFFFFFFE6)
        return 0;
    }
    else if (v20 < 0x41)
    {
      return 0;
    }
  }
  else
  {
    if (v20 < 0x30)
      return 0;
    v9 = v20 == 58;
    if (v20 >= 0x3A)
      goto LABEL_288;
  }
  LODWORD(v3) = (_DWORD)a1 + 10;
  v22 = a1[10];
  if (v22 > 0x3B)
  {
    if (v22 > 0x5A)
    {
      if (v22 - 123 < 0xFFFFFFE6)
        return 0;
    }
    else if (v22 < 0x41)
    {
      return 0;
    }
  }
  else
  {
    if (v22 < 0x30)
      return 0;
    v9 = v22 == 58;
    if (v22 >= 0x3A)
      goto LABEL_288;
  }
  LODWORD(v3) = (_DWORD)a1 + 11;
  v23 = a1[11];
  if (v23 > 0x3B)
  {
    if (v23 > 0x5A)
    {
      if (v23 - 123 < 0xFFFFFFE6)
        return 0;
    }
    else if (v23 < 0x41)
    {
      return 0;
    }
  }
  else
  {
    if (v23 < 0x30)
      return 0;
    v9 = v23 == 58;
    if (v23 >= 0x3A)
      goto LABEL_288;
  }
  LODWORD(v3) = (_DWORD)a1 + 12;
  v24 = a1[12];
  if (v24 > 0x3B)
  {
    if (v24 > 0x5A)
    {
      if (v24 - 123 < 0xFFFFFFE6)
        return 0;
    }
    else if (v24 < 0x41)
    {
      return 0;
    }
  }
  else
  {
    if (v24 < 0x30)
      return 0;
    v9 = v24 == 58;
    if (v24 >= 0x3A)
      goto LABEL_288;
  }
  LODWORD(v3) = (_DWORD)a1 + 13;
  v25 = a1[13];
  if (v25 > 0x3B)
  {
    if (v25 > 0x5A)
    {
      if (v25 - 123 < 0xFFFFFFE6)
        return 0;
    }
    else if (v25 < 0x41)
    {
      return 0;
    }
  }
  else
  {
    if (v25 < 0x30)
      return 0;
    v9 = v25 == 58;
    if (v25 >= 0x3A)
      goto LABEL_288;
  }
  LODWORD(v3) = (_DWORD)a1 + 14;
  v26 = a1[14];
  if (v26 > 0x3B)
  {
    if (v26 > 0x5A)
    {
      if (v26 - 123 < 0xFFFFFFE6)
        return 0;
    }
    else if (v26 < 0x41)
    {
      return 0;
    }
  }
  else
  {
    if (v26 < 0x30)
      return 0;
    v9 = v26 == 58;
    if (v26 >= 0x3A)
      goto LABEL_288;
  }
  LODWORD(v3) = (_DWORD)a1 + 15;
  v27 = a1[15];
  if (v27 > 0x3B)
  {
    if (v27 > 0x5A)
    {
      if (v27 - 123 < 0xFFFFFFE6)
        return 0;
    }
    else if (v27 < 0x41)
    {
      return 0;
    }
  }
  else
  {
    if (v27 < 0x30)
      return 0;
    v9 = v27 == 58;
    if (v27 >= 0x3A)
      goto LABEL_288;
  }
  LODWORD(v3) = (_DWORD)a1 + 16;
  v28 = a1[16];
  if (v28 > 0x3B)
  {
    if (v28 > 0x5A)
    {
      if (v28 - 123 < 0xFFFFFFE6)
        return 0;
    }
    else if (v28 < 0x41)
    {
      return 0;
    }
  }
  else
  {
    if (v28 < 0x30)
      return 0;
    v9 = v28 == 58;
    if (v28 >= 0x3A)
      goto LABEL_288;
  }
  LODWORD(v3) = (_DWORD)a1 + 17;
  v29 = a1[17];
  if (v29 > 0x3B)
  {
    if (v29 > 0x5A)
    {
      if (v29 - 123 < 0xFFFFFFE6)
        return 0;
    }
    else if (v29 < 0x41)
    {
      return 0;
    }
  }
  else
  {
    if (v29 < 0x30)
      return 0;
    v9 = v29 == 58;
    if (v29 >= 0x3A)
      goto LABEL_288;
  }
  LODWORD(v3) = (_DWORD)a1 + 18;
  v30 = a1[18];
  if (v30 > 0x3B)
  {
    if (v30 > 0x5A)
    {
      if (v30 - 123 < 0xFFFFFFE6)
        return 0;
    }
    else if (v30 < 0x41)
    {
      return 0;
    }
  }
  else
  {
    if (v30 < 0x30)
      return 0;
    v9 = v30 == 58;
    if (v30 >= 0x3A)
      goto LABEL_288;
  }
  LODWORD(v3) = (_DWORD)a1 + 19;
  v31 = a1[19];
  if (v31 > 0x3B)
  {
    if (v31 > 0x5A)
    {
      if (v31 - 123 < 0xFFFFFFE6)
        return 0;
    }
    else if (v31 < 0x41)
    {
      return 0;
    }
  }
  else
  {
    if (v31 < 0x30)
      return 0;
    v9 = v31 == 58;
    if (v31 >= 0x3A)
      goto LABEL_288;
  }
  LODWORD(v3) = (_DWORD)a1 + 20;
  v32 = a1[20];
  if (v32 > 0x3B)
  {
    if (v32 > 0x5A)
    {
      if (v32 - 123 < 0xFFFFFFE6)
        return 0;
    }
    else if (v32 < 0x41)
    {
      return 0;
    }
  }
  else
  {
    if (v32 < 0x30)
      return 0;
    v9 = v32 == 58;
    if (v32 >= 0x3A)
      goto LABEL_288;
  }
  LODWORD(v3) = (_DWORD)a1 + 21;
  v33 = a1[21];
  if (v33 > 0x3B)
  {
    if (v33 > 0x5A)
    {
      if (v33 - 123 < 0xFFFFFFE6)
        return 0;
    }
    else if (v33 < 0x41)
    {
      return 0;
    }
  }
  else
  {
    if (v33 < 0x30)
      return 0;
    v9 = v33 == 58;
    if (v33 >= 0x3A)
      goto LABEL_288;
  }
  LODWORD(v3) = (_DWORD)a1 + 22;
  v34 = a1[22];
  if (v34 > 0x3B)
  {
    if (v34 > 0x5A)
    {
      if (v34 - 123 < 0xFFFFFFE6)
        return 0;
    }
    else if (v34 < 0x41)
    {
      return 0;
    }
  }
  else
  {
    if (v34 < 0x30)
      return 0;
    v9 = v34 == 58;
    if (v34 >= 0x3A)
      goto LABEL_288;
  }
  LODWORD(v3) = (_DWORD)a1 + 23;
  v35 = a1[23];
  if (v35 > 0x3B)
  {
    if (v35 > 0x5A)
    {
      if (v35 - 123 < 0xFFFFFFE6)
        return 0;
    }
    else if (v35 < 0x41)
    {
      return 0;
    }
  }
  else
  {
    if (v35 < 0x30)
      return 0;
    v9 = v35 == 58;
    if (v35 >= 0x3A)
      goto LABEL_288;
  }
  LODWORD(v3) = (_DWORD)a1 + 24;
  v36 = a1[24];
  if (v36 > 0x3B)
  {
    if (v36 > 0x5A)
    {
      if (v36 - 123 < 0xFFFFFFE6)
        return 0;
    }
    else if (v36 < 0x41)
    {
      return 0;
    }
  }
  else
  {
    if (v36 < 0x30)
      return 0;
    v9 = v36 == 58;
    if (v36 >= 0x3A)
      goto LABEL_288;
  }
  LODWORD(v3) = (_DWORD)a1 + 25;
  v37 = a1[25];
  if (v37 > 0x3B)
  {
    if (v37 > 0x5A)
    {
      if (v37 - 123 < 0xFFFFFFE6)
        return 0;
    }
    else if (v37 < 0x41)
    {
      return 0;
    }
  }
  else
  {
    if (v37 < 0x30)
      return 0;
    v9 = v37 == 58;
    if (v37 >= 0x3A)
      goto LABEL_288;
  }
  LODWORD(v3) = (_DWORD)a1 + 26;
  v38 = a1[26];
  if (v38 > 0x3B)
  {
    if (v38 > 0x5A)
    {
      if (v38 - 123 < 0xFFFFFFE6)
        return 0;
    }
    else if (v38 < 0x41)
    {
      return 0;
    }
  }
  else
  {
    if (v38 < 0x30)
      return 0;
    v9 = v38 == 58;
    if (v38 >= 0x3A)
      goto LABEL_288;
  }
  LODWORD(v3) = (_DWORD)a1 + 27;
  v39 = a1[27];
  if (v39 > 0x3B)
  {
    if (v39 > 0x5A)
    {
      if (v39 - 123 < 0xFFFFFFE6)
        return 0;
    }
    else if (v39 < 0x41)
    {
      return 0;
    }
  }
  else
  {
    if (v39 < 0x30)
      return 0;
    v9 = v39 == 58;
    if (v39 >= 0x3A)
      goto LABEL_288;
  }
  LODWORD(v3) = (_DWORD)a1 + 28;
  v40 = a1[28];
  if (v40 > 0x3B)
  {
    if (v40 > 0x5A)
    {
      if (v40 - 123 < 0xFFFFFFE6)
        return 0;
    }
    else if (v40 < 0x41)
    {
      return 0;
    }
  }
  else
  {
    if (v40 < 0x30)
      return 0;
    v9 = v40 == 58;
    if (v40 >= 0x3A)
      goto LABEL_288;
  }
  LODWORD(v3) = (_DWORD)a1 + 29;
  v41 = a1[29];
  if (v41 > 0x3B)
  {
    if (v41 > 0x5A)
    {
      if (v41 - 123 < 0xFFFFFFE6)
        return 0;
    }
    else if (v41 < 0x41)
    {
      return 0;
    }
  }
  else
  {
    if (v41 < 0x30)
      return 0;
    v9 = v41 == 58;
    if (v41 >= 0x3A)
    {
LABEL_288:
      if (!v9)
        return ((_DWORD)v3 - (_DWORD)a1 + 1);
      return 0;
    }
  }
  LODWORD(v3) = (_DWORD)a1 + 30;
  v43 = a1[30];
  if (v43 > 0x3B)
  {
    if (v43 > 0x5A)
    {
      if (v43 - 123 < 0xFFFFFFE6)
        return 0;
    }
    else if (v43 < 0x41)
    {
      return 0;
    }
  }
  else
  {
    if (v43 < 0x30)
      return 0;
    v44 = v43 == 58;
    if (v43 >= 0x3A)
      goto LABEL_314;
  }
  LODWORD(v3) = (_DWORD)a1 + 31;
  v45 = a1[31];
  if (v45 > 0x3B)
  {
    if (v45 > 0x5A)
    {
      if (v45 - 123 < 0xFFFFFFE6)
        return 0;
    }
    else if (v45 < 0x41)
    {
      return 0;
    }
  }
  else
  {
    if (v45 < 0x30)
      return 0;
    v44 = v45 == 58;
    if (v45 >= 0x3A)
      goto LABEL_314;
  }
  v3 = a1 + 32;
  v19 = a1[32];
  if (v19 > 0x3B)
  {
    if (v19 > 0x5A)
    {
      if (v19 - 97 >= 0x1A)
        return 0;
      goto LABEL_129;
    }
LABEL_118:
    if (v19 < 0x41)
      return 0;
    goto LABEL_129;
  }
  if (v19 < 0x30)
    return 0;
  v44 = v19 == 58;
  if (v19 < 0x3A)
    goto LABEL_129;
LABEL_314:
  if (v44)
    return 0;
  return ((_DWORD)v3 - (_DWORD)a1 + 1);
}

uint64_t _scan_dangerous_url(unsigned __int8 *a1)
{
  unsigned int v1;
  int v2;
  unsigned int v3;
  _BYTE *v4;
  unsigned __int8 *v5;
  int v7;
  uint64_t v8;

  v1 = *a1;
  if (v1 > 0x56)
  {
    if (v1 <= 0x66)
    {
      if (v1 != 100)
      {
        if (v1 <= 0x65)
          return 0;
        goto LABEL_33;
      }
LABEL_8:
      if ((a1[1] & 0xDF) != 0x41 || (a1[2] & 0xDF) != 0x54 || (a1[3] & 0xDF) != 0x41 || a1[4] != 58)
        return 0;
      v2 = (_DWORD)a1 + 5;
      if ((a1[5] & 0xDF) != 0x49
        || (a1[6] & 0xDF) != 0x4D
        || (a1[7] & 0xDF) != 0x41
        || (a1[8] & 0xDF) != 0x47
        || (a1[9] & 0xDF) != 0x45
        || a1[10] != 47)
      {
        return (v2 - (_DWORD)a1);
      }
      v3 = a1[11];
      if (v3 > 0x57)
      {
        if (v3 <= 0x6A)
        {
          if (v3 != 103)
          {
            if (v3 < 0x6A)
              return (v2 - (_DWORD)a1);
LABEL_61:
            if ((a1[12] & 0xDF) != 0x50 || (a1[13] & 0xDF) != 0x45)
              return (v2 - (_DWORD)a1);
            v8 = 13;
LABEL_64:
            if ((a1[v8 + 1] & 0xDF) == 0x47)
              return 0;
            return (v2 - (_DWORD)a1);
          }
LABEL_50:
          if ((a1[12] & 0xDF) == 0x49 && (a1[13] & 0xDF) == 0x46)
            return 0;
          return (v2 - (_DWORD)a1);
        }
        if (v3 > 0x70)
        {
          if (v3 != 119)
            return (v2 - (_DWORD)a1);
LABEL_67:
          if ((a1[12] & 0xDF) == 0x45 && (a1[13] & 0xDF) == 0x42 && (a1[14] & 0xDF) == 0x50)
            return 0;
          return (v2 - (_DWORD)a1);
        }
        if (v3 != 112)
          return (v2 - (_DWORD)a1);
      }
      else
      {
        if (v3 <= 0x4A)
        {
          if (v3 != 71)
          {
            if (v3 < 0x4A)
              return (v2 - (_DWORD)a1);
            goto LABEL_61;
          }
          goto LABEL_50;
        }
        if (v3 != 80)
        {
          if (v3 < 0x57)
            return (v2 - (_DWORD)a1);
          goto LABEL_67;
        }
      }
      if ((a1[12] & 0xDF) != 0x4E)
        return (v2 - (_DWORD)a1);
      v8 = 12;
      goto LABEL_64;
    }
    if (v1 > 0x6A)
    {
      if (v1 != 118)
        return 0;
      goto LABEL_40;
    }
    if (v1 != 106)
      return 0;
LABEL_28:
    if ((a1[1] & 0xDF) != 0x41)
      return 0;
    if ((a1[2] & 0xDF) != 0x56)
      return 0;
    v4 = a1 + 3;
    if ((a1[3] & 0xDF) != 0x41)
      return 0;
LABEL_41:
    if ((v4[1] & 0xDF) != 0x53)
      return 0;
    if ((v4[2] & 0xDF) != 0x43)
      return 0;
    if ((v4[3] & 0xDF) != 0x52)
      return 0;
    if ((v4[4] & 0xDF) != 0x49)
      return 0;
    if ((v4[5] & 0xDF) != 0x50)
      return 0;
    v7 = v4[6];
    v5 = v4 + 6;
    if ((v7 & 0xFFFFFFDF) != 0x54)
      return 0;
    goto LABEL_36;
  }
  if (v1 > 0x46)
  {
    if (v1 != 74)
    {
      if (v1 <= 0x55)
        return 0;
LABEL_40:
      v4 = a1 + 1;
      if ((a1[1] & 0xDF) != 0x42)
        return 0;
      goto LABEL_41;
    }
    goto LABEL_28;
  }
  if (v1 == 68)
    goto LABEL_8;
  if (v1 <= 0x45)
    return 0;
LABEL_33:
  if ((a1[1] & 0xDF) != 0x49)
    return 0;
  if ((a1[2] & 0xDF) != 0x4C)
    return 0;
  v5 = a1 + 3;
  if ((a1[3] & 0xDF) != 0x45)
    return 0;
LABEL_36:
  if (v5[1] == 58)
  {
    v2 = (_DWORD)v5 + 2;
    return (v2 - (_DWORD)a1);
  }
  return 0;
}

unint64_t _scan_footnote_definition(unint64_t result)
{
  _BYTE *v1;
  unsigned int v2;
  char v3;
  int v4;
  int v5;
  char v6;
  int v7;
  int v8;
  int v9;
  unsigned int v10;
  unsigned __int8 *v11;
  int v12;

  if (*(_BYTE *)result != 91)
    return 0;
  if (*(_BYTE *)(result + 1) != 94)
    return 0;
  v1 = (_BYTE *)(result + 2);
  v2 = *(unsigned __int8 *)(result + 2);
  if (v2 == 93)
    return 0;
  while (1)
  {
    if ((_scan_footnote_definition_yybm[v2] & 0x40) != 0)
      goto LABEL_26;
    if (v2 <= 0xEC)
      break;
    if (v2 > 0xF0)
    {
      if (v2 >= 0xF4)
      {
        if (v2 != 244)
          return 0;
        v7 = (char)*++v1;
        if (v7 >= -112)
          return 0;
      }
      else
      {
        v5 = (char)*++v1;
        if (v5 >= -64)
          return 0;
      }
    }
    else
    {
      if (v2 < 0xEE)
      {
        v4 = (char)*++v1;
        if (v4 >= -96)
          return 0;
        goto LABEL_25;
      }
      if (v2 >= 0xF0)
      {
        v6 = *++v1;
        if ((v6 + 112) >= 0x30u)
          return 0;
      }
    }
LABEL_24:
    v8 = (char)*++v1;
    if (v8 >= -64)
      return 0;
LABEL_25:
    v9 = (char)*++v1;
    if (v9 >= -64)
      return 0;
LABEL_26:
    v10 = *++v1;
    v2 = v10;
  }
  if (v2 > 0xC1)
  {
    if (v2 < 0xE0)
      goto LABEL_25;
    if (v2 == 224)
    {
      v3 = *++v1;
      if ((v3 & 0xE0) != 0xA0)
        return 0;
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if (v2 - 33 >= 0x3D || v1[1] != 58)
    return 0;
  LODWORD(result) = (_DWORD)v1 - result + 1;
  v11 = v1 + 2;
  do
  {
    v12 = *v11++;
    result = (result + 1);
  }
  while (_scan_footnote_definition_yybm[v12] < 0);
  return result;
}

_QWORD *cmark_footnote_create(uint64_t *a1, uint64_t a2)
{
  _QWORD *result;
  _QWORD *v5;
  uint64_t v6;

  result = normalize_map_label(*a1, a2 + 144);
  if (result)
  {
    if (a1[2])
      cmark_footnote_create_cold_1();
    v5 = result;
    result = (_QWORD *)(*(uint64_t (**)(uint64_t, uint64_t))*a1)(1, 48);
    result[4] = a2;
    v6 = a1[3];
    result[2] = v6;
    *result = a1[1];
    result[1] = v5;
    a1[1] = (uint64_t)result;
    a1[3] = v6 + 1;
  }
  return result;
}

uint64_t (***cmark_footnote_map_new(uint64_t (**a1)(uint64_t, uint64_t)))(uint64_t, uint64_t)
{
  return cmark_map_new(a1, (uint64_t (**)(uint64_t, uint64_t))footnote_free);
}

uint64_t footnote_free(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  _QWORD *v4;

  if (a2)
  {
    v3 = *(_QWORD *)result;
    (*(void (**)(_QWORD))(*(_QWORD *)result + 16))(*(_QWORD *)(a2 + 8));
    v4 = *(_QWORD **)(a2 + 32);
    if (v4)
      cmark_node_free(v4);
    return (*(uint64_t (**)(uint64_t))(v3 + 16))(a2);
  }
  return result;
}

_QWORD *cmark_unlink_footnotes_map(_QWORD *result)
{
  _QWORD *v1;

  v1 = (_QWORD *)result[1];
  while (v1)
  {
    result = (_QWORD *)v1[4];
    v1 = (_QWORD *)*v1;
    if (result)
      result = cmark_node_unlink(result);
  }
  return result;
}

_BYTE *normalize_map_label(uint64_t a1, uint64_t a2)
{
  int v2;
  _BYTE *result;
  _QWORD v5[3];

  v5[0] = a1;
  v5[1] = &cmark_strbuf__initbuf;
  v5[2] = 0;
  if (!a2)
    return 0;
  v2 = *(_DWORD *)(a2 + 8);
  if (!v2)
    return 0;
  cmark_utf8proc_case_fold(v5, *(unsigned __int8 **)a2, v2);
  cmark_strbuf_trim((uint64_t)v5);
  cmark_strbuf_normalize_whitespace((uint64_t)v5);
  result = (_BYTE *)cmark_strbuf_detach((uint64_t)v5);
  if (!result)
    normalize_map_label_cold_1();
  if (!*result)
  {
    (*(void (**)(void))(a1 + 16))();
    return 0;
  }
  return result;
}

_BYTE *cmark_map_lookup(uint64_t *a1, uint64_t a2)
{
  _BYTE *result;
  const void *v4;
  char *v5;
  size_t v6;
  _QWORD *v7;
  char *v8;
  char *v9;
  uint64_t v10;
  size_t v11;
  char *v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;

  result = 0;
  if (a1 && (*(_DWORD *)(a2 + 8) - 1001) >= 0xFFFFFC18)
  {
    if (a1[3])
    {
      result = normalize_map_label(*a1, a2);
      if (!result)
        return result;
      v4 = result;
      v5 = (char *)a1[2];
      v6 = a1[3];
      if (!v5)
      {
        v7 = (_QWORD *)a1[1];
        v8 = (char *)(*(uint64_t (**)(uint64_t, uint64_t))*a1)(a1[3], 8);
        v5 = v8;
        if (v7)
        {
          v9 = v8;
          do
          {
            *(_QWORD *)v9 = v7;
            v9 += 8;
            v7 = (_QWORD *)*v7;
          }
          while (v7);
        }
        qsort(v8, v6, 8uLL, (int (__cdecl *)(const void *, const void *))refcmp);
        if (v6 < 2)
        {
          v10 = 0;
        }
        else
        {
          v10 = 0;
          v11 = v6 - 1;
          v12 = v5 + 8;
          do
          {
            v13 = *(_QWORD *)v12;
            if (strcmp(*(const char **)(*(_QWORD *)v12 + 8), *(const char **)(*(_QWORD *)&v5[8 * v10] + 8)))
            {
              ++v10;
              *(_QWORD *)&v5[8 * v10] = v13;
            }
            v12 += 8;
            --v11;
          }
          while (v11);
        }
        v6 = v10 + 1;
        a1[2] = (uint64_t)v5;
        a1[3] = v10 + 1;
      }
      v14 = bsearch(v4, v5, v6, 8uLL, (int (__cdecl *)(const void *, const void *))refsearch);
      (*(void (**)(const void *))(*a1 + 16))(v4);
      if (v14)
      {
        result = *(_BYTE **)v14;
        v15 = *(_QWORD *)(*(_QWORD *)v14 + 24);
        v16 = a1[4];
        if (v15 <= a1[5] - v16)
        {
          a1[4] = v16 + v15;
          return result;
        }
      }
    }
    return 0;
  }
  return result;
}

uint64_t refsearch(const char *a1, uint64_t a2)
{
  return strcmp(a1, *(const char **)(*(_QWORD *)a2 + 8));
}

uint64_t refcmp(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = *a1;
  v3 = *a2;
  result = strcmp(*(const char **)(*a1 + 8), *(const char **)(*a2 + 8));
  if (!(_DWORD)result)
    return (*(_DWORD *)(v2 + 16) - *(_DWORD *)(v3 + 16));
  return result;
}

uint64_t cmark_strbuf_len(uint64_t a1)
{
  return *(unsigned int *)(a1 + 20);
}

char *cmark_strbuf_set(char *result, char *__src, size_t __len)
{
  uint64_t v3;
  unsigned int v4;
  char *v5;
  uint64_t v6;
  char *v7;

  v3 = (uint64_t)result;
  if (__src && (v4 = __len, (int)__len > 0))
  {
    v5 = __src;
    result = (char *)*((_QWORD *)result + 1);
    if (result == __src)
    {
      v6 = __len;
    }
    else
    {
      if (*(_DWORD *)(v3 + 16) <= (int)__len)
      {
        cmark_strbuf_grow(v3, __len);
        result = *(char **)(v3 + 8);
      }
      v6 = v4;
      result = (char *)memmove(result, v5, v4);
      v5 = *(char **)(v3 + 8);
    }
    *(_DWORD *)(v3 + 20) = v4;
    v7 = &v5[v6];
  }
  else
  {
    *((_DWORD *)result + 5) = 0;
    if (*((int *)result + 4) < 1)
      return result;
    v7 = (char *)*((_QWORD *)result + 1);
  }
  *v7 = 0;
  return result;
}

char *cmark_strbuf_sets(char *a1, char *__s)
{
  size_t v4;

  if (__s)
    v4 = strlen(__s);
  else
    v4 = 0;
  return cmark_strbuf_set(a1, __s, v4);
}

_DWORD *cmark_strbuf_puts(_DWORD *a1, char *__s)
{
  int v4;

  v4 = strlen(__s);
  return cmark_strbuf_put(a1, __s, v4);
}

_BYTE *cmark_strbuf_copy_cstr(_BYTE *__dst, int a2, uint64_t a3)
{
  _BYTE *v3;
  int v4;
  int v5;

  if (!a3)
    cmark_strbuf_copy_cstr_cold_1();
  v3 = __dst;
  if (__dst)
  {
    if (a2 >= 1)
    {
      *__dst = 0;
      v4 = *(_DWORD *)(a3 + 20);
      if (v4)
      {
        if (*(int *)(a3 + 16) >= 1)
        {
          if (v4 >= a2)
            v5 = a2 - 1;
          else
            v5 = *(_DWORD *)(a3 + 20);
          __dst = memmove(__dst, *(const void **)(a3 + 8), v5);
          v3[v5] = 0;
        }
      }
    }
  }
  return __dst;
}

__n128 cmark_strbuf_swap(__n128 *a1, __n128 *a2)
{
  unint64_t v2;
  __n128 result;
  unint64_t v4;

  v2 = a1[1].n128_u64[0];
  result = *a1;
  v4 = a2[1].n128_u64[0];
  *a1 = *a2;
  a1[1].n128_u64[0] = v4;
  *a2 = result;
  a2[1].n128_u64[0] = v2;
  return result;
}

uint64_t cmark_strbuf_cmp(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  BOOL v4;
  size_t v5;
  int v6;
  unsigned int v7;
  uint64_t result;

  v2 = *(_DWORD *)(a1 + 20);
  v3 = *(_DWORD *)(a2 + 20);
  v4 = v2 <= v3;
  if (v2 >= v3)
    v2 = *(_DWORD *)(a2 + 20);
  v5 = v2;
  v6 = !v4;
  if (v4)
    v7 = -1;
  else
    v7 = v6;
  LODWORD(result) = memcmp(*(const void **)(a1 + 8), *(const void **)(a2 + 8), v5);
  if ((_DWORD)result)
    return result;
  else
    return v7;
}

uint64_t cmark_strbuf_strchr(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;
  void *v5;

  v3 = *(_DWORD *)(a1 + 20);
  if (v3 <= a3)
    return 0xFFFFFFFFLL;
  v4 = *(_QWORD *)(a1 + 8);
  v5 = memchr((void *)(v4 + (a3 & ~(a3 >> 31))), a2, v3 - (a3 & ~(a3 >> 31)));
  if (v5)
    return ((_DWORD)v5 - v4);
  else
    return 0xFFFFFFFFLL;
}

uint64_t cmark_strbuf_strrchr(uint64_t a1, unsigned __int8 a2, unsigned int a3)
{
  int v4;
  uint64_t result;
  uint64_t v6;
  BOOL v7;

  if ((a3 & 0x80000000) != 0)
    return 0xFFFFFFFFLL;
  v4 = *(_DWORD *)(a1 + 20);
  if (!v4)
    return 0xFFFFFFFFLL;
  result = v4 <= (int)a3 ? (v4 - 1) : a3;
  if ((result & 0x80000000) != 0)
    return 0xFFFFFFFFLL;
  v6 = *(_QWORD *)(a1 + 8);
  while (*(unsigned __int8 *)(v6 + result) != a2)
  {
    v7 = (int)result <= 0;
    result = (result - 1);
    if (v7)
      return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t cmark_strbuf_truncate(uint64_t result, int a2)
{
  int v2;

  v2 = a2 & ~(a2 >> 31);
  if (v2 < *(_DWORD *)(result + 20))
  {
    *(_DWORD *)(result + 20) = v2;
    *(_BYTE *)(*(_QWORD *)(result + 8) + v2) = 0;
  }
  return result;
}

uint64_t cmark_strbuf_rtrim(uint64_t result)
{
  int v1;
  uint64_t v2;
  BOOL v3;

  v1 = *(_DWORD *)(result + 20);
  if (v1)
  {
    v2 = result;
    if (v1 >= 1)
    {
      do
      {
        result = cmark_isspace(*(_BYTE *)(*(_QWORD *)(v2 + 8) + (v1 - 1)));
        v1 = *(_DWORD *)(v2 + 20);
        if (!(_DWORD)result)
          break;
        v3 = __OFSUB__(v1--, 1);
        *(_DWORD *)(v2 + 20) = v1;
      }
      while (!((v1 < 0) ^ v3 | (v1 == 0)));
    }
    *(_BYTE *)(*(_QWORD *)(v2 + 8) + v1) = 0;
  }
  return result;
}

uint64_t cmark_strbuf_trim(uint64_t result)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_DWORD *)(result + 20);
  if (v1)
  {
    v2 = result;
    if (v1 < 1)
    {
      LODWORD(v3) = 0;
    }
    else
    {
      v3 = 0;
      do
      {
        if (!cmark_isspace(*(_BYTE *)(*(_QWORD *)(v2 + 8) + v3)))
          break;
        ++v3;
      }
      while (v3 < *(int *)(v2 + 20));
    }
    cmark_strbuf_drop((void *)v2, v3);
    return cmark_strbuf_rtrim(v2);
  }
  return result;
}

uint64_t cmark_strbuf_normalize_whitespace(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  BOOL v5;
  uint64_t v6;
  char v7;
  int v8;

  v1 = result;
  LODWORD(v2) = *(_DWORD *)(result + 20);
  if ((int)v2 >= 1)
  {
    v3 = 0;
    v4 = 0;
    v5 = 0;
    while (1)
    {
      result = cmark_isspace(*(_BYTE *)(*(_QWORD *)(v1 + 8) + v3));
      if (!(_DWORD)result)
        break;
      if (!v5)
      {
        v6 = *(_QWORD *)(v1 + 8);
        v7 = 32;
LABEL_7:
        *(_BYTE *)(v6 + v4++) = v7;
      }
      ++v3;
      v2 = *(int *)(v1 + 20);
      v5 = (_DWORD)result != 0;
      if (v3 >= v2)
        goto LABEL_11;
    }
    v6 = *(_QWORD *)(v1 + 8);
    v7 = *(_BYTE *)(v6 + v3);
    goto LABEL_7;
  }
  v4 = 0;
LABEL_11:
  v8 = v4 & ~(v4 >> 31);
  if (v8 < (int)v2)
  {
    *(_DWORD *)(v1 + 20) = v8;
    *(_BYTE *)(*(_QWORD *)(v1 + 8) + v8) = 0;
  }
  return result;
}

uint64_t cmark_strbuf_unescape(uint64_t result)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  int i;
  uint64_t v5;
  int v6;
  int v7;

  v1 = result;
  v2 = *(_DWORD *)(result + 20);
  if (v2 < 1)
  {
    v7 = 0;
  }
  else
  {
    v3 = 0;
    for (i = 0; i < v2; ++i)
    {
      v5 = *(_QWORD *)(v1 + 8);
      v6 = *(unsigned __int8 *)(v5 + i);
      if (v6 == 92)
      {
        result = cmark_ispunct(*(_BYTE *)(v5 + i + 1));
        if ((_DWORD)result)
          ++i;
        v5 = *(_QWORD *)(v1 + 8);
        LOBYTE(v6) = *(_BYTE *)(v5 + i);
      }
      v7 = v3 + 1;
      *(_BYTE *)(v5 + v3) = v6;
      v2 = *(_DWORD *)(v1 + 20);
      ++v3;
    }
  }
  if (v7 < v2)
  {
    *(_DWORD *)(v1 + 20) = v7;
    *(_BYTE *)(*(_QWORD *)(v1 + 8) + v7) = 0;
  }
  return result;
}

uint64_t cmark_reference_create(uint64_t *a1, uint64_t a2, uint64_t a3, unsigned __int8 **a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  result = (uint64_t)normalize_map_label(*a1, a2);
  if (result)
  {
    if (a1[2])
      cmark_reference_create_cold_1();
    v8 = result;
    v9 = (*(uint64_t (**)(uint64_t, uint64_t))*a1)(1, 88);
    *(_QWORD *)(v9 + 8) = v8;
    *(_BYTE *)(v9 + 32) = 0;
    *(_QWORD *)(v9 + 40) = cmark_clean_url(*a1, a3);
    *(_QWORD *)(v9 + 48) = v10;
    result = cmark_clean_title(*a1, a4);
    *(_QWORD *)(v9 + 56) = result;
    *(_QWORD *)(v9 + 64) = v11;
    *(_QWORD *)(v9 + 72) = &unk_21132FD7E;
    *(_QWORD *)(v9 + 80) = 0;
    v12 = a1[3];
    *(_QWORD *)v9 = a1[1];
    v13 = *(int *)(v9 + 48) + (uint64_t)(int)v11;
    *(_QWORD *)(v9 + 16) = v12;
    *(_QWORD *)(v9 + 24) = v13;
    a1[1] = v9;
    a1[3] = v12 + 1;
  }
  return result;
}

_BYTE *cmark_reference_create_attributes(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  _BYTE *result;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  result = normalize_map_label(*a1, a2);
  if (result)
  {
    if (a1[2])
      cmark_reference_create_attributes_cold_1();
    v6 = result;
    v7 = (*(uint64_t (**)(uint64_t, uint64_t))*a1)(1, 88);
    *(_QWORD *)(v7 + 8) = v6;
    *(_BYTE *)(v7 + 32) = 1;
    *(_QWORD *)(v7 + 40) = &unk_21132FD7E;
    *(_QWORD *)(v7 + 48) = 0;
    *(_QWORD *)(v7 + 56) = &unk_21132FD7E;
    *(_QWORD *)(v7 + 64) = 0;
    result = (_BYTE *)cmark_clean_attributes(*a1, a3);
    *(_QWORD *)(v7 + 72) = result;
    *(_QWORD *)(v7 + 80) = v8;
    v9 = a1[3];
    *(_QWORD *)(v7 + 16) = v9;
    *(_QWORD *)v7 = a1[1];
    a1[1] = v7;
    a1[3] = v9 + 1;
  }
  return result;
}

uint64_t reference_free(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;

  if (a2)
  {
    v3 = *(_QWORD *)result;
    (*(void (**)(_QWORD))(*(_QWORD *)result + 16))(*(_QWORD *)(a2 + 8));
    v4 = (_QWORD *)(a2 + 40);
    if (*(_DWORD *)(a2 + 52))
      (*(void (**)(_QWORD))(v3 + 16))(*v4);
    *v4 = 0;
    *(_QWORD *)(a2 + 48) = 0;
    v5 = (_QWORD *)(a2 + 56);
    if (*(_DWORD *)(a2 + 68))
      (*(void (**)(_QWORD))(v3 + 16))(*v5);
    *v5 = 0;
    *(_QWORD *)(a2 + 64) = 0;
    v6 = (_QWORD *)(a2 + 72);
    if (*(_DWORD *)(a2 + 84))
      (*(void (**)(_QWORD))(v3 + 16))(*v6);
    *v6 = 0;
    *(_QWORD *)(a2 + 80) = 0;
    return (*(uint64_t (**)(uint64_t))(v3 + 16))(a2);
  }
  return result;
}

uint64_t cmark_parse_file()
{
  FILE *v0;
  int v1;
  uint64_t v2;
  size_t v3;
  unint64_t v4;
  uint64_t v5;
  _BYTE __ptr[4096];
  uint64_t v8;

  v0 = (FILE *)MEMORY[0x24BDAC7A8]();
  v8 = *MEMORY[0x24BDAC8D0];
  v2 = cmark_parser_new_with_mem(v1, (uint64_t (**)(uint64_t, uint64_t))&CMARK_DEFAULT_MEM_ALLOCATOR);
  do
  {
    v3 = fread(__ptr, 1uLL, 0x1000uLL, v0);
    if (!v3)
      break;
    v4 = v3;
    S_parser_feed(v2, __ptr, v3, v3 < 0x1000);
  }
  while (v4 > 0xFFF);
  v5 = cmark_parser_finish(v2);
  cmark_parser_free(v2);
  return v5;
}

uint64_t cmark_parse_document(_BYTE *a1, unint64_t a2, int a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = cmark_parser_new_with_mem(a3, (uint64_t (**)(uint64_t, uint64_t))&CMARK_DEFAULT_MEM_ALLOCATOR);
  S_parser_feed(v5, a1, a2, 1);
  v6 = cmark_parser_finish(v5);
  cmark_parser_free(v5);
  return v6;
}

uint64_t cmark_parser_feed_reentrant(uint64_t a1, _BYTE *a2, unint64_t a3)
{
  uint64_t v7;
  char *__s;
  uint64_t v9;

  v7 = 0;
  __s = 0;
  v9 = 0;
  cmark_strbuf_init(*(_QWORD *)a1, &v7, 0);
  cmark_strbuf_puts(&v7, *(char **)(a1 + 104));
  cmark_strbuf_clear(a1 + 96);
  S_parser_feed(a1, a2, a3, 1);
  cmark_strbuf_sets((char *)(a1 + 96), __s);
  return cmark_strbuf_free((uint64_t)&v7);
}

uint64_t cmark_parser_get_line_number(uint64_t a1)
{
  return *(unsigned int *)(a1 + 32);
}

uint64_t cmark_parser_get_offset(uint64_t a1)
{
  return *(unsigned int *)(a1 + 36);
}

uint64_t cmark_parser_get_column(uint64_t a1)
{
  return *(unsigned int *)(a1 + 40);
}

uint64_t cmark_parser_get_first_nonspace(uint64_t a1)
{
  return *(unsigned int *)(a1 + 44);
}

uint64_t cmark_parser_get_first_nonspace_column(uint64_t a1)
{
  return *(unsigned int *)(a1 + 48);
}

uint64_t cmark_parser_get_indent(uint64_t a1)
{
  return *(unsigned int *)(a1 + 56);
}

uint64_t cmark_parser_is_blank(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 60);
}

uint64_t cmark_parser_has_partially_consumed_tab(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 61);
}

uint64_t cmark_parser_get_last_line_length(uint64_t a1)
{
  return *(unsigned int *)(a1 + 88);
}

uint64_t cmark_parser_advance_offset(uint64_t a1, char *__s, int a3, int a4)
{
  uint64_t v8;
  uint64_t v10[2];

  if (__s)
    v8 = strlen(__s);
  else
    v8 = 0;
  v10[0] = (uint64_t)__s;
  v10[1] = v8;
  return S_advance_offset(a1, v10, a3, a4 != 0);
}

uint64_t cmark_parser_set_backslash_ispunct_func(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 152) = a2;
  return result;
}

uint64_t cmark_parser_get_syntax_extensions(uint64_t a1)
{
  return *(_QWORD *)(a1 + 136);
}

uint64_t sort_footnote_by_ix(uint64_t a1, uint64_t a2)
{
  return (*(_DWORD *)(*(_QWORD *)a1 + 40) - *(_DWORD *)(*(_QWORD *)a2 + 40));
}

uint64_t cmark_enable_safety_checks(char a1)
{
  pthread_once(&safety_once, (void (*)(void))initialize_safety);
  pthread_mutex_lock(&safety_lock);
  enable_safety_checks = a1;
  return pthread_mutex_unlock(&safety_lock);
}

uint64_t cmark_node_new_with_mem_and_ext(unsigned __int16 a1, uint64_t (**a2)(uint64_t, uint64_t), uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t (**)(uint64_t, uint64_t), uint64_t);

  v6 = (*a2)(1, 184);
  cmark_strbuf_init((uint64_t)a2, (uint64_t *)v6, 0);
  *(_WORD *)(v6 + 100) = a1;
  *(_QWORD *)(v6 + 112) = a3;
  if (a1 == 32771)
  {
    *(_DWORD *)(v6 + 144) = 1;
    *(_DWORD *)(v6 + 156) = 0;
    *(_BYTE *)(v6 + 165) = 0;
    if (!a3)
      return v6;
    goto LABEL_7;
  }
  if (a1 == 32777)
    *(_DWORD *)(v6 + 144) = 1;
  if (a3)
  {
LABEL_7:
    v7 = *(void (**)(uint64_t, uint64_t (**)(uint64_t, uint64_t), uint64_t))(a3 + 160);
    if (v7)
      v7(a3, a2, v6);
  }
  return v6;
}

uint64_t cmark_node_new_with_ext(unsigned __int16 a1, uint64_t a2)
{
  return cmark_node_new_with_mem_and_ext(a1, (uint64_t (**)(uint64_t, uint64_t))&CMARK_DEFAULT_MEM_ALLOCATOR, a2);
}

uint64_t cmark_node_new_with_mem(unsigned __int16 a1, uint64_t (**a2)(uint64_t, uint64_t))
{
  return cmark_node_new_with_mem_and_ext(a1, a2, 0);
}

uint64_t cmark_node_new(unsigned __int16 a1)
{
  return cmark_node_new_with_mem_and_ext(a1, (uint64_t (**)(uint64_t, uint64_t))&CMARK_DEFAULT_MEM_ALLOCATOR, 0);
}

BOOL cmark_node_set_type(uint64_t a1, int a2)
{
  int v2;
  __int16 v3;
  _BOOL8 result;

  v2 = *(unsigned __int16 *)(a1 + 100);
  if (v2 != a2)
  {
    v3 = a2;
    *(_WORD *)(a1 + 100) = a2;
    result = S_can_contain(*(_QWORD **)(a1 + 40), a1);
    *(_WORD *)(a1 + 100) = v2;
    if (!result)
      return result;
    free_node_as(a1);
    *(_WORD *)(a1 + 100) = v3;
  }
  return 1;
}

BOOL S_can_contain(_QWORD *a1, uint64_t a2)
{
  int v5;
  _QWORD *v6;

  if (!a1 || !a2 || *a1 != *(_QWORD *)a2)
    return 0;
  pthread_once(&safety_once, (void (*)(void))initialize_safety);
  pthread_mutex_lock(&safety_lock);
  v5 = enable_safety_checks;
  pthread_mutex_unlock(&safety_lock);
  if (v5)
  {
    v6 = a1;
    while (v6 != (_QWORD *)a2)
    {
      v6 = (_QWORD *)v6[5];
      if (!v6)
        return cmark_node_can_contain_type((uint64_t)a1, *(unsigned __int16 *)(a2 + 100));
    }
    return 0;
  }
  return cmark_node_can_contain_type((uint64_t)a1, *(unsigned __int16 *)(a2 + 100));
}

const char *cmark_node_get_type_string(uint64_t a1)
{
  uint64_t v2;
  uint64_t (*v3)(void);
  const char *result;

  if (!a1)
    return "NONE";
  v2 = *(_QWORD *)(a1 + 112);
  if (v2)
  {
    v3 = *(uint64_t (**)(void))(v2 + 72);
    if (v3)
      return (const char *)v3();
  }
  switch(*(_WORD *)(a1 + 100))
  {
    case 0xC001:
      result = "text";
      break;
    case 0xC002:
      result = "softbreak";
      break;
    case 0xC003:
      result = "linebreak";
      break;
    case 0xC004:
      result = "code";
      break;
    case 0xC005:
      result = "html_inline";
      break;
    case 0xC006:
      result = "custom_inline";
      break;
    case 0xC007:
      result = "emph";
      break;
    case 0xC008:
      result = "strong";
      break;
    case 0xC009:
      result = "link";
      break;
    case 0xC00A:
      result = "image";
      break;
    case 0xC00B:
LABEL_13:
      result = "<unknown>";
      break;
    case 0xC00C:
      result = "attribute";
      break;
    default:
      switch(*(_WORD *)(a1 + 100))
      {
        case 0x8001:
          result = "document";
          break;
        case 0x8002:
          result = "block_quote";
          break;
        case 0x8003:
          result = "list";
          break;
        case 0x8004:
          result = "item";
          break;
        case 0x8005:
          result = "code_block";
          break;
        case 0x8006:
          result = "html_block";
          break;
        case 0x8007:
          result = "custom_block";
          break;
        case 0x8008:
          result = "paragraph";
          break;
        case 0x8009:
          result = "heading";
          break;
        case 0x800A:
          result = "thematic_break";
          break;
        default:
          if (*(_WORD *)(a1 + 100))
            goto LABEL_13;
          result = "none";
          break;
      }
      break;
  }
  return result;
}

uint64_t cmark_node_next(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 24);
  return result;
}

uint64_t cmark_node_previous(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 32);
  return result;
}

uint64_t cmark_node_parent(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 40);
  return result;
}

uint64_t cmark_node_first_child(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 48);
  return result;
}

uint64_t cmark_node_last_child(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 56);
  return result;
}

uint64_t cmark_node_nth_child(uint64_t result, int a2)
{
  int v3;
  BOOL v4;

  if (result)
  {
    result = *(_QWORD *)(result + 48);
    if (result && a2 >= 1)
    {
      v3 = 1;
      do
      {
        result = *(_QWORD *)(result + 24);
        if (result)
          v4 = v3 < a2;
        else
          v4 = 0;
        ++v3;
      }
      while (v4);
    }
  }
  return result;
}

uint64_t cmark_node_parent_footnote_def(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 136);
  return result;
}

uint64_t cmark_node_get_user_data(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 64);
  return result;
}

uint64_t cmark_node_set_user_data(uint64_t result, uint64_t a2)
{
  if (result)
  {
    *(_QWORD *)(result + 64) = a2;
    return 1;
  }
  return result;
}

uint64_t cmark_node_set_user_data_free_func(uint64_t result, uint64_t a2)
{
  if (result)
  {
    *(_QWORD *)(result + 72) = a2;
    return 1;
  }
  return result;
}

uint64_t cmark_node_get_backtick_count(uint64_t a1)
{
  return *(unsigned int *)(a1 + 104);
}

uint64_t cmark_node_set_literal(uint64_t result, char *__s)
{
  uint64_t v3;
  int v4;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;
  void *v10;
  uint64_t v11;
  int v12;

  if (result)
  {
    v3 = result;
    v4 = *(unsigned __int16 *)(result + 100);
    if ((v4 - 49153) > 0xA || ((1 << (v4 - 1)) & 0x419) == 0)
    {
      if (v4 == 32773)
      {
        v6 = *(_QWORD *)result;
        v7 = (uint64_t *)(result + 160);
        if (*(_DWORD *)(result + 172))
        {
          v8 = *v7;
          if (!__s)
            goto LABEL_22;
        }
        else
        {
          v8 = 0;
          if (!__s)
            goto LABEL_22;
        }
        v12 = strlen(__s);
        *(_DWORD *)(v3 + 168) = v12;
        v10 = (void *)(*(uint64_t (**)(_QWORD, uint64_t))v6)(v12 + 1, 1);
        *(_QWORD *)(v3 + 160) = v10;
        *(_DWORD *)(v3 + 172) = 1;
        v11 = *(int *)(v3 + 168);
        goto LABEL_14;
      }
      if (v4 != 32774)
        return 0;
    }
    v6 = *(_QWORD *)result;
    v7 = (uint64_t *)(result + 144);
    if (*(_DWORD *)(result + 156))
    {
      v8 = *v7;
      if (!__s)
      {
LABEL_22:
        *v7 = 0;
        v7[1] = 0;
        if (!v8)
          return 1;
        goto LABEL_15;
      }
    }
    else
    {
      v8 = 0;
      if (!__s)
        goto LABEL_22;
    }
    v9 = strlen(__s);
    *(_DWORD *)(v3 + 152) = v9;
    v10 = (void *)(*(uint64_t (**)(_QWORD, uint64_t))v6)(v9 + 1, 1);
    *(_QWORD *)(v3 + 144) = v10;
    *(_DWORD *)(v3 + 156) = 1;
    v11 = *(int *)(v3 + 152);
LABEL_14:
    memcpy(v10, __s, v11 + 1);
    if (!v8)
      return 1;
LABEL_15:
    (*(void (**)(uint64_t))(v6 + 16))(v8);
    return 1;
  }
  return result;
}

uint64_t cmark_node_get_string_content(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8);
}

uint64_t cmark_node_set_string_content(char *a1, char *a2)
{
  cmark_strbuf_sets(a1, a2);
  return 1;
}

uint64_t cmark_node_get_heading_level(uint64_t result)
{
  if (result)
  {
    if (*(unsigned __int16 *)(result + 100) == 32777)
      return *(unsigned int *)(result + 144);
    else
      return 0;
  }
  return result;
}

uint64_t cmark_node_set_heading_level(uint64_t a1, int a2)
{
  uint64_t result;

  result = 0;
  if (a1 && (a2 - 7) >= 0xFFFFFFFA)
  {
    if (*(unsigned __int16 *)(a1 + 100) == 32777)
    {
      *(_DWORD *)(a1 + 144) = a2;
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t cmark_node_get_list_type(uint64_t result)
{
  if (result)
  {
    if (*(unsigned __int16 *)(result + 100) == 32771)
      return *(unsigned int *)(result + 144);
    else
      return 0;
  }
  return result;
}

uint64_t cmark_node_set_list_type(uint64_t a1, int a2)
{
  uint64_t result;

  result = 0;
  if (a1 && (a2 - 3) >= 0xFFFFFFFE)
  {
    if (*(unsigned __int16 *)(a1 + 100) == 32771)
    {
      *(_DWORD *)(a1 + 144) = a2;
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t cmark_node_get_list_delim(uint64_t result)
{
  if (result)
  {
    if (*(unsigned __int16 *)(result + 100) == 32771)
      return *(unsigned int *)(result + 160);
    else
      return 0;
  }
  return result;
}

uint64_t cmark_node_set_list_delim(uint64_t a1, int a2)
{
  uint64_t result;

  result = 0;
  if (a1 && (a2 - 3) >= 0xFFFFFFFE)
  {
    if (*(unsigned __int16 *)(a1 + 100) == 32771)
    {
      *(_DWORD *)(a1 + 160) = a2;
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t cmark_node_get_list_start(uint64_t result)
{
  if (result)
  {
    if (*(unsigned __int16 *)(result + 100) == 32771)
      return *(unsigned int *)(result + 156);
    else
      return 0;
  }
  return result;
}

uint64_t cmark_node_set_list_start(uint64_t a1, int a2)
{
  uint64_t result;

  result = 0;
  if (a1 && (a2 & 0x80000000) == 0)
  {
    if (*(unsigned __int16 *)(a1 + 100) == 32771)
    {
      *(_DWORD *)(a1 + 156) = a2;
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t cmark_node_get_list_tight(uint64_t result)
{
  if (result)
  {
    if (*(unsigned __int16 *)(result + 100) == 32771)
      return *(unsigned __int8 *)(result + 165);
    else
      return 0;
  }
  return result;
}

uint64_t cmark_node_set_list_tight(uint64_t result, int a2)
{
  if (result)
  {
    if (*(unsigned __int16 *)(result + 100) == 32771)
    {
      *(_BYTE *)(result + 165) = a2 == 1;
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t cmark_node_get_item_index(uint64_t result)
{
  if (result)
  {
    if (*(unsigned __int16 *)(result + 100) == 32772)
      return *(unsigned int *)(result + 156);
    else
      return 0;
  }
  return result;
}

uint64_t cmark_node_set_item_index(uint64_t a1, int a2)
{
  uint64_t result;

  result = 0;
  if (a1 && (a2 & 0x80000000) == 0)
  {
    if (*(unsigned __int16 *)(a1 + 100) == 32772)
    {
      *(_DWORD *)(a1 + 156) = a2;
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

_BYTE *cmark_node_get_fence_info(uint64_t a1)
{
  _BYTE *v2;
  _BYTE *v4;
  size_t v5;

  if (!a1 || *(unsigned __int16 *)(a1 + 100) != 32773)
    return 0;
  if (*(_DWORD *)(a1 + 156))
    return *(_BYTE **)(a1 + 144);
  v4 = (_BYTE *)(**(uint64_t (***)(uint64_t, uint64_t))a1)(*(int *)(a1 + 152) + 1, 1);
  v2 = v4;
  v5 = *(unsigned int *)(a1 + 152);
  if ((int)v5 >= 1)
  {
    memcpy(v4, *(const void **)(a1 + 144), v5);
    LODWORD(v5) = *(_DWORD *)(a1 + 152);
  }
  v2[(int)v5] = 0;
  *(_QWORD *)(a1 + 144) = v2;
  *(_DWORD *)(a1 + 156) = 1;
  return v2;
}

uint64_t cmark_node_set_fence_info(uint64_t result, char *__s)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  int v7;
  void *v8;

  if (result)
  {
    v2 = result;
    if (*(unsigned __int16 *)(result + 100) == 32773)
    {
      v4 = *(_QWORD *)result;
      v5 = (uint64_t *)(result + 144);
      if (*(_DWORD *)(result + 156))
      {
        v6 = *v5;
        if (__s)
          goto LABEL_5;
      }
      else
      {
        v6 = 0;
        if (__s)
        {
LABEL_5:
          v7 = strlen(__s);
          *(_DWORD *)(v2 + 152) = v7;
          v8 = (void *)(*(uint64_t (**)(_QWORD, uint64_t))v4)(v7 + 1, 1);
          *(_QWORD *)(v2 + 144) = v8;
          *(_DWORD *)(v2 + 156) = 1;
          memcpy(v8, __s, *(int *)(v2 + 152) + 1);
          if (!v6)
            return 1;
LABEL_6:
          (*(void (**)(uint64_t))(v4 + 16))(v6);
          return 1;
        }
      }
      *v5 = 0;
      *(_QWORD *)(result + 152) = 0;
      if (!v6)
        return 1;
      goto LABEL_6;
    }
    return 0;
  }
  return result;
}

uint64_t cmark_node_get_fenced(uint64_t result, _DWORD *a2, _DWORD *a3, _BYTE *a4)
{
  if (result)
  {
    if (*(unsigned __int16 *)(result + 100) == 32773)
    {
      *a2 = *(unsigned __int8 *)(result + 176);
      *a3 = *(unsigned __int8 *)(result + 177);
      *a4 = *(_BYTE *)(result + 178);
      return *(char *)(result + 179);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t cmark_node_set_fenced(uint64_t a1, char a2, char a3, char a4, char a5)
{
  uint64_t v5;

  if (!a1 || *(unsigned __int16 *)(a1 + 100) != 32773)
    return 0;
  *(_BYTE *)(a1 + 179) = a2;
  *(_BYTE *)(a1 + 176) = a3;
  *(_BYTE *)(a1 + 177) = a4;
  v5 = 1;
  *(_BYTE *)(a1 + 178) = a5;
  return v5;
}

_BYTE *cmark_node_get_url(uint64_t a1)
{
  _BYTE *v2;
  _BYTE *v4;
  size_t v5;

  if (!a1 || (unsigned __int16)(*(_WORD *)(a1 + 100) + 16375) > 1u)
    return 0;
  if (*(_DWORD *)(a1 + 156))
    return *(_BYTE **)(a1 + 144);
  v4 = (_BYTE *)(**(uint64_t (***)(uint64_t, uint64_t))a1)(*(int *)(a1 + 152) + 1, 1);
  v2 = v4;
  v5 = *(unsigned int *)(a1 + 152);
  if ((int)v5 >= 1)
  {
    memcpy(v4, *(const void **)(a1 + 144), v5);
    LODWORD(v5) = *(_DWORD *)(a1 + 152);
  }
  v2[(int)v5] = 0;
  *(_QWORD *)(a1 + 144) = v2;
  *(_DWORD *)(a1 + 156) = 1;
  return v2;
}

uint64_t cmark_node_set_url(uint64_t result, char *__s)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  int v7;
  void *v8;

  if (result)
  {
    v2 = result;
    if ((unsigned __int16)(*(_WORD *)(result + 100) + 16375) <= 1u)
    {
      v4 = *(_QWORD *)result;
      v5 = (uint64_t *)(result + 144);
      if (*(_DWORD *)(result + 156))
      {
        v6 = *v5;
        if (__s)
          goto LABEL_5;
      }
      else
      {
        v6 = 0;
        if (__s)
        {
LABEL_5:
          v7 = strlen(__s);
          *(_DWORD *)(v2 + 152) = v7;
          v8 = (void *)(*(uint64_t (**)(_QWORD, uint64_t))v4)(v7 + 1, 1);
          *(_QWORD *)(v2 + 144) = v8;
          *(_DWORD *)(v2 + 156) = 1;
          memcpy(v8, __s, *(int *)(v2 + 152) + 1);
          if (!v6)
            return 1;
LABEL_6:
          (*(void (**)(uint64_t))(v4 + 16))(v6);
          return 1;
        }
      }
      *v5 = 0;
      *(_QWORD *)(result + 152) = 0;
      if (!v6)
        return 1;
      goto LABEL_6;
    }
    return 0;
  }
  return result;
}

_BYTE *cmark_node_get_title(uint64_t a1)
{
  _BYTE *v2;
  _BYTE *v4;
  size_t v5;

  if (!a1 || (unsigned __int16)(*(_WORD *)(a1 + 100) + 16375) > 1u)
    return 0;
  if (*(_DWORD *)(a1 + 172))
    return *(_BYTE **)(a1 + 160);
  v4 = (_BYTE *)(**(uint64_t (***)(uint64_t, uint64_t))a1)(*(int *)(a1 + 168) + 1, 1);
  v2 = v4;
  v5 = *(unsigned int *)(a1 + 168);
  if ((int)v5 >= 1)
  {
    memcpy(v4, *(const void **)(a1 + 160), v5);
    LODWORD(v5) = *(_DWORD *)(a1 + 168);
  }
  v2[(int)v5] = 0;
  *(_QWORD *)(a1 + 160) = v2;
  *(_DWORD *)(a1 + 172) = 1;
  return v2;
}

uint64_t cmark_node_set_title(uint64_t result, char *__s)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  int v7;
  void *v8;

  if (result)
  {
    v2 = result;
    if ((unsigned __int16)(*(_WORD *)(result + 100) + 16375) <= 1u)
    {
      v4 = *(_QWORD *)result;
      v5 = (uint64_t *)(result + 160);
      if (*(_DWORD *)(result + 172))
      {
        v6 = *v5;
        if (__s)
          goto LABEL_5;
      }
      else
      {
        v6 = 0;
        if (__s)
        {
LABEL_5:
          v7 = strlen(__s);
          *(_DWORD *)(v2 + 168) = v7;
          v8 = (void *)(*(uint64_t (**)(_QWORD, uint64_t))v4)(v7 + 1, 1);
          *(_QWORD *)(v2 + 160) = v8;
          *(_DWORD *)(v2 + 172) = 1;
          memcpy(v8, __s, *(int *)(v2 + 168) + 1);
          if (!v6)
            return 1;
LABEL_6:
          (*(void (**)(uint64_t))(v4 + 16))(v6);
          return 1;
        }
      }
      *v5 = 0;
      *(_QWORD *)(result + 168) = 0;
      if (!v6)
        return 1;
      goto LABEL_6;
    }
    return 0;
  }
  return result;
}

_BYTE *cmark_node_get_attributes(uint64_t a1)
{
  _BYTE *v2;
  _BYTE *v4;
  size_t v5;

  if (!a1 || *(unsigned __int16 *)(a1 + 100) != 49164)
    return 0;
  if (*(_DWORD *)(a1 + 156))
    return *(_BYTE **)(a1 + 144);
  v4 = (_BYTE *)(**(uint64_t (***)(uint64_t, uint64_t))a1)(*(int *)(a1 + 152) + 1, 1);
  v2 = v4;
  v5 = *(unsigned int *)(a1 + 152);
  if ((int)v5 >= 1)
  {
    memcpy(v4, *(const void **)(a1 + 144), v5);
    LODWORD(v5) = *(_DWORD *)(a1 + 152);
  }
  v2[(int)v5] = 0;
  *(_QWORD *)(a1 + 144) = v2;
  *(_DWORD *)(a1 + 156) = 1;
  return v2;
}

uint64_t cmark_node_set_attributes(uint64_t result, char *__s)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  int v7;
  void *v8;

  if (result)
  {
    v2 = result;
    if (*(unsigned __int16 *)(result + 100) == 49164)
    {
      v4 = *(_QWORD *)result;
      v5 = (uint64_t *)(result + 144);
      if (*(_DWORD *)(result + 156))
      {
        v6 = *v5;
        if (__s)
          goto LABEL_5;
      }
      else
      {
        v6 = 0;
        if (__s)
        {
LABEL_5:
          v7 = strlen(__s);
          *(_DWORD *)(v2 + 152) = v7;
          v8 = (void *)(*(uint64_t (**)(_QWORD, uint64_t))v4)(v7 + 1, 1);
          *(_QWORD *)(v2 + 144) = v8;
          *(_DWORD *)(v2 + 156) = 1;
          memcpy(v8, __s, *(int *)(v2 + 152) + 1);
          if (!v6)
            return 1;
LABEL_6:
          (*(void (**)(uint64_t))(v4 + 16))(v6);
          return 1;
        }
      }
      *v5 = 0;
      *(_QWORD *)(result + 152) = 0;
      if (!v6)
        return 1;
      goto LABEL_6;
    }
    return 0;
  }
  return result;
}

_BYTE *cmark_node_get_on_enter(uint64_t a1)
{
  int v2;
  _BYTE *v4;
  _BYTE *v5;
  size_t v6;

  if (!a1)
    return 0;
  v2 = *(unsigned __int16 *)(a1 + 100);
  if (v2 != 49158 && v2 != 32775)
    return 0;
  if (*(_DWORD *)(a1 + 156))
    return *(_BYTE **)(a1 + 144);
  v5 = (_BYTE *)(**(uint64_t (***)(uint64_t, uint64_t))a1)(*(int *)(a1 + 152) + 1, 1);
  v4 = v5;
  v6 = *(unsigned int *)(a1 + 152);
  if ((int)v6 >= 1)
  {
    memcpy(v5, *(const void **)(a1 + 144), v6);
    LODWORD(v6) = *(_DWORD *)(a1 + 152);
  }
  v4[(int)v6] = 0;
  *(_QWORD *)(a1 + 144) = v4;
  *(_DWORD *)(a1 + 156) = 1;
  return v4;
}

uint64_t cmark_node_set_on_enter(uint64_t result, char *__s)
{
  uint64_t v2;
  int v3;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;
  void *v10;

  if (result)
  {
    v2 = result;
    v3 = *(unsigned __int16 *)(result + 100);
    if (v3 != 49158 && v3 != 32775)
      return 0;
    v6 = *(_QWORD *)result;
    v7 = (uint64_t *)(result + 144);
    if (*(_DWORD *)(result + 156))
    {
      v8 = *v7;
      if (__s)
        goto LABEL_9;
    }
    else
    {
      v8 = 0;
      if (__s)
      {
LABEL_9:
        v9 = strlen(__s);
        *(_DWORD *)(v2 + 152) = v9;
        v10 = (void *)(*(uint64_t (**)(_QWORD, uint64_t))v6)(v9 + 1, 1);
        *(_QWORD *)(v2 + 144) = v10;
        *(_DWORD *)(v2 + 156) = 1;
        memcpy(v10, __s, *(int *)(v2 + 152) + 1);
        if (!v8)
          return 1;
LABEL_10:
        (*(void (**)(uint64_t))(v6 + 16))(v8);
        return 1;
      }
    }
    *v7 = 0;
    *(_QWORD *)(result + 152) = 0;
    if (!v8)
      return 1;
    goto LABEL_10;
  }
  return result;
}

_BYTE *cmark_node_get_on_exit(uint64_t a1)
{
  int v2;
  _BYTE *v4;
  _BYTE *v5;
  size_t v6;

  if (!a1)
    return 0;
  v2 = *(unsigned __int16 *)(a1 + 100);
  if (v2 != 49158 && v2 != 32775)
    return 0;
  if (*(_DWORD *)(a1 + 172))
    return *(_BYTE **)(a1 + 160);
  v5 = (_BYTE *)(**(uint64_t (***)(uint64_t, uint64_t))a1)(*(int *)(a1 + 168) + 1, 1);
  v4 = v5;
  v6 = *(unsigned int *)(a1 + 168);
  if ((int)v6 >= 1)
  {
    memcpy(v5, *(const void **)(a1 + 160), v6);
    LODWORD(v6) = *(_DWORD *)(a1 + 168);
  }
  v4[(int)v6] = 0;
  *(_QWORD *)(a1 + 160) = v4;
  *(_DWORD *)(a1 + 172) = 1;
  return v4;
}

uint64_t cmark_node_set_on_exit(uint64_t result, char *__s)
{
  uint64_t v2;
  int v3;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;
  void *v10;

  if (result)
  {
    v2 = result;
    v3 = *(unsigned __int16 *)(result + 100);
    if (v3 != 49158 && v3 != 32775)
      return 0;
    v6 = *(_QWORD *)result;
    v7 = (uint64_t *)(result + 160);
    if (*(_DWORD *)(result + 172))
    {
      v8 = *v7;
      if (__s)
        goto LABEL_9;
    }
    else
    {
      v8 = 0;
      if (__s)
      {
LABEL_9:
        v9 = strlen(__s);
        *(_DWORD *)(v2 + 168) = v9;
        v10 = (void *)(*(uint64_t (**)(_QWORD, uint64_t))v6)(v9 + 1, 1);
        *(_QWORD *)(v2 + 160) = v10;
        *(_DWORD *)(v2 + 172) = 1;
        memcpy(v10, __s, *(int *)(v2 + 168) + 1);
        if (!v8)
          return 1;
LABEL_10:
        (*(void (**)(uint64_t))(v6 + 16))(v8);
        return 1;
      }
    }
    *v7 = 0;
    *(_QWORD *)(result + 168) = 0;
    if (!v8)
      return 1;
    goto LABEL_10;
  }
  return result;
}

uint64_t cmark_node_get_syntax_extension(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 112);
  return result;
}

uint64_t cmark_node_set_syntax_extension(uint64_t result, uint64_t a2)
{
  if (result)
  {
    *(_QWORD *)(result + 112) = a2;
    return 1;
  }
  return result;
}

uint64_t cmark_node_get_start_line(uint64_t result)
{
  if (result)
    return *(unsigned int *)(result + 80);
  return result;
}

uint64_t cmark_node_get_start_column(uint64_t result)
{
  if (result)
    return *(unsigned int *)(result + 84);
  return result;
}

uint64_t cmark_node_get_end_line(uint64_t result)
{
  if (result)
    return *(unsigned int *)(result + 88);
  return result;
}

uint64_t cmark_node_get_end_column(uint64_t result)
{
  if (result)
    return *(unsigned int *)(result + 92);
  return result;
}

_QWORD *cmark_node_unlink(_QWORD *a1)
{
  _QWORD *result;

  result = S_node_unlink(a1);
  a1[3] = 0;
  a1[4] = 0;
  a1[5] = 0;
  return result;
}

uint64_t cmark_node_insert_before(uint64_t a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  result = 0;
  if (a1)
  {
    if (a2)
    {
      result = *(_QWORD *)(a1 + 40);
      if (result)
      {
        result = S_can_contain((_QWORD *)result, (uint64_t)a2);
        if ((_DWORD)result)
        {
          S_node_unlink(a2);
          v5 = *(_QWORD *)(a1 + 32);
          if (v5)
            *(_QWORD *)(v5 + 24) = a2;
          a2[3] = a1;
          a2[4] = v5;
          *(_QWORD *)(a1 + 32) = a2;
          v6 = *(_QWORD *)(a1 + 40);
          a2[5] = v6;
          result = 1;
          if (!v5)
          {
            if (v6)
              *(_QWORD *)(v6 + 48) = a2;
          }
        }
      }
    }
  }
  return result;
}

uint64_t cmark_node_insert_after(uint64_t a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  result = 0;
  if (a1)
  {
    if (a2)
    {
      result = *(_QWORD *)(a1 + 40);
      if (result)
      {
        result = S_can_contain((_QWORD *)result, (uint64_t)a2);
        if ((_DWORD)result)
        {
          S_node_unlink(a2);
          v5 = *(_QWORD *)(a1 + 24);
          if (v5)
            *(_QWORD *)(v5 + 32) = a2;
          a2[3] = v5;
          a2[4] = a1;
          *(_QWORD *)(a1 + 24) = a2;
          v6 = *(_QWORD *)(a1 + 40);
          a2[5] = v6;
          result = 1;
          if (!v5)
          {
            if (v6)
              *(_QWORD *)(v6 + 56) = a2;
          }
        }
      }
    }
  }
  return result;
}

uint64_t cmark_node_replace(_QWORD *a1, _QWORD *a2)
{
  uint64_t result;

  result = cmark_node_insert_before((uint64_t)a1, a2);
  if ((_DWORD)result)
  {
    S_node_unlink(a1);
    a1[3] = 0;
    a1[4] = 0;
    result = 1;
    a1[5] = 0;
  }
  return result;
}

BOOL cmark_node_prepend_child(_QWORD *a1, _QWORD *a2)
{
  _BOOL8 result;
  uint64_t v5;
  _QWORD *v6;

  result = S_can_contain(a1, (uint64_t)a2);
  if (result)
  {
    S_node_unlink(a2);
    v5 = a1[6];
    a2[3] = v5;
    a2[4] = 0;
    a2[5] = a1;
    a1[6] = a2;
    if (v5)
      v6 = (_QWORD *)(v5 + 32);
    else
      v6 = a1 + 7;
    *v6 = a2;
    return 1;
  }
  return result;
}

BOOL cmark_node_append_child(_QWORD *a1, _QWORD *a2)
{
  _BOOL8 result;
  uint64_t v5;
  _QWORD *v6;

  result = S_can_contain(a1, (uint64_t)a2);
  if (result)
  {
    S_node_unlink(a2);
    v5 = a1[7];
    a2[3] = 0;
    a2[4] = v5;
    a2[5] = a1;
    a1[7] = a2;
    if (v5)
      v6 = (_QWORD *)(v5 + 24);
    else
      v6 = a1 + 6;
    *v6 = a2;
    return 1;
  }
  return result;
}

uint64_t cmark_node_check(_QWORD *a1, FILE *a2)
{
  uint64_t v4;
  _QWORD *i;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  if (a1)
  {
    v4 = 0;
    for (i = a1; ; i = (_QWORD *)*v7)
    {
      v7 = i + 6;
      v6 = i[6];
      if (v6)
      {
        if (*(_QWORD *)(v6 + 32))
        {
          S_print_error(a2, v6, "prev");
          v6 = *v7;
          *(_QWORD *)(*v7 + 32) = 0;
          v4 = (v4 + 1);
        }
        if (*(_QWORD **)(v6 + 40) != i)
        {
          S_print_error(a2, v6, "parent");
LABEL_18:
          *(_QWORD *)(*v7 + 40) = i;
          v4 = (v4 + 1);
          continue;
        }
      }
      else
      {
        if (i == a1)
          return v4;
        while (1)
        {
          v8 = i[3];
          if (v8)
            break;
          v9 = i[5];
          if (*(_QWORD **)(v9 + 56) != i)
          {
            S_print_error(a2, v9, "last_child");
            v9 = i[5];
            *(_QWORD *)(v9 + 56) = i;
            v4 = (v4 + 1);
          }
          i = (_QWORD *)v9;
          if ((_QWORD *)v9 == a1)
            return v4;
        }
        if (*(_QWORD **)(v8 + 32) != i)
        {
          S_print_error(a2, v8, "prev");
          v8 = i[3];
          *(_QWORD *)(v8 + 32) = i;
          v4 = (v4 + 1);
        }
        v7 = i + 3;
        if (*(_QWORD *)(v8 + 40) != i[5])
        {
          S_print_error(a2, v8, "parent");
          i = (_QWORD *)i[5];
          goto LABEL_18;
        }
      }
    }
  }
  return 0;
}

FILE *S_print_error(FILE *result, uint64_t a2, const char *a3)
{
  FILE *v5;
  const char *type_string;

  if (result)
  {
    v5 = result;
    type_string = cmark_node_get_type_string(a2);
    return (FILE *)fprintf(v5, "Invalid '%s' in node type %s at %d:%d\n", a3, type_string, *(_DWORD *)(a2 + 80), *(_DWORD *)(a2 + 84));
  }
  return result;
}

uint64_t initialize_safety()
{
  return pthread_mutex_init(&safety_lock, 0);
}

uint64_t cmark_clean_url(uint64_t a1, uint64_t a2)
{
  unsigned __int8 *v3;
  int v4;
  int v5;
  _BOOL4 v6;
  BOOL v7;
  _QWORD v9[3];

  v9[0] = a1;
  v9[1] = &cmark_strbuf__initbuf;
  v9[2] = 0;
  if (*(_DWORD *)(a2 + 12))
    cmark_clean_url_cold_2();
  if (!*(_DWORD *)(a2 + 8))
    return 0;
  v3 = *(unsigned __int8 **)a2;
  do
  {
    if (!cmark_isspace(*v3))
      break;
    v3 = (unsigned __int8 *)(*(_QWORD *)a2 + 1);
    *(_QWORD *)a2 = v3;
    v4 = *(_DWORD *)(a2 + 8) - 1;
    *(_DWORD *)(a2 + 8) = v4;
  }
  while (v4);
  if (*(_DWORD *)(a2 + 12))
    S_process_line_cold_1();
  v5 = *(_DWORD *)(a2 + 8);
  if (v5 >= 1)
  {
    do
    {
      v6 = cmark_isspace(*(_BYTE *)(*(_QWORD *)a2 + (v5 - 1)));
      v5 = *(_DWORD *)(a2 + 8);
      if (!v6)
        break;
      v7 = __OFSUB__(v5--, 1);
      *(_DWORD *)(a2 + 8) = v5;
    }
    while (!((v5 < 0) ^ v7 | (v5 == 0)));
  }
  if (!v5)
    return 0;
  houdini_unescape_html_f(v9, *(const void **)a2, v5);
  cmark_strbuf_unescape((uint64_t)v9);
  return cmark_strbuf_detach((uint64_t)v9);
}

uint64_t cmark_clean_title(uint64_t a1, unsigned __int8 **a2)
{
  uint64_t v2;
  unsigned __int8 *v3;
  int v4;
  int v5;
  _QWORD v7[3];

  v7[0] = a1;
  v7[1] = &cmark_strbuf__initbuf;
  v7[2] = 0;
  v2 = *((int *)a2 + 2);
  if (!(_DWORD)v2)
    return 0;
  v3 = *a2;
  v4 = *v3;
  v5 = v3[v2 - 1];
  if (v4 == 39 && v5 == 39 || v4 == 40 && v5 == 41 || v4 == 34 && v5 == 34)
  {
    ++v3;
    LODWORD(v2) = v2 - 2;
  }
  houdini_unescape_html_f(v7, v3, v2);
  cmark_strbuf_unescape((uint64_t)v7);
  return cmark_strbuf_detach((uint64_t)v7);
}

_QWORD *remove_delimiter(_QWORD *result, _QWORD *a2)
{
  _QWORD *v2;
  uint64_t v3;

  if (a2)
  {
    v2 = (_QWORD *)a2[1];
    if (v2)
    {
      *v2 = *a2;
      v3 = *a2;
      if (!*a2)
        return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*result + 16))(a2);
    }
    else
    {
      if ((_QWORD *)result[7] != a2)
        remove_delimiter_cold_1();
      v3 = *a2;
      result[7] = *a2;
      if (!v3)
        return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*result + 16))(a2);
    }
    *(_QWORD *)(v3 + 8) = v2;
    return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*result + 16))(a2);
  }
  return result;
}

uint64_t cmark_parse_reference_inline(uint64_t a1, __int128 *a2, uint64_t *a3)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t result;
  int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  int v16;
  unsigned __int8 *v17;
  int v18;
  int v19;
  char v21;
  char v22;
  unsigned __int8 *v23;
  int v24;
  int v25;
  char v27;
  char v28;
  unsigned __int8 *v29;
  uint64_t v30;
  _QWORD v31[2];
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[360];

  memset(&v37[224], 0, 136);
  memset(v37, 0, 357);
  v32 = 0;
  v33 = 0;
  v31[0] = 0;
  v31[1] = 0;
  v29 = 0;
  v30 = 0;
  v34 = a1;
  v35 = *a2;
  v36 = xmmword_21132FB90;
  *(_DWORD *)v37 = 0;
  v37[357] = 1;
  v6 = link_label((uint64_t)&v34, (uint64_t)&v32, 0);
  result = 0;
  if (v6 && (_DWORD)v33)
  {
    if (SDWORD2(v36) >= SDWORD2(v35))
      return 0;
    if (*(_BYTE *)(v35 + SDWORD2(v36)) != 58)
    {
      if (!*(_BYTE *)(v35 + SDWORD2(v36)))
        cmark_parse_inlines_cold_1(0, v4, v5);
      return 0;
    }
    ++DWORD2(v36);
    spnl((uint64_t)&v34, v4, v5);
    v8 = manual_scan_link_url((uint64_t)&v35, SDWORD2(v36), (uint64_t)v31);
    if (v8 < 0)
      return 0;
    DWORD2(v36) += v8;
    v11 = DWORD2(v36);
    v12 = spnl((uint64_t)&v34, v9, v10);
    v14 = DWORD2(v36);
    if (DWORD2(v36) == v11
      || (v12 = _scan_at((uint64_t (*)(uint64_t))_scan_link_title, (uint64_t *)&v35, SDWORD2(v36)), !(_DWORD)v12))
    {
      DWORD2(v36) = v11;
      v29 = (unsigned __int8 *)&unk_21132FD7E;
      v30 = 0;
      v15 = 1;
      v16 = v11;
    }
    else
    {
      v15 = 0;
      v29 = (unsigned __int8 *)(v35 + SDWORD2(v36));
      v30 = v12;
      v16 = DWORD2(v36) + v12;
      DWORD2(v36) += v12;
    }
    if (v16 < SDWORD2(v35))
    {
      v17 = (unsigned __int8 *)(v35 + v16);
      while (1)
      {
        v19 = *v17++;
        v18 = v19;
        if (v19 != 32 && v18 != 9)
          break;
        DWORD2(v36) = ++v16;
        if (DWORD2(v35) == v16)
          goto LABEL_61;
      }
      if (!v18)
        cmark_parse_inlines_cold_1(v12, v13, v14);
    }
    if (v16 < SDWORD2(v35))
    {
      if (*(_BYTE *)(v35 + v16) == 13)
      {
        DWORD2(v36) = ++v16;
        v21 = 1;
LABEL_27:
        if (v16 < SDWORD2(v35))
        {
          if (*(_BYTE *)(v35 + v16) == 10)
            goto LABEL_60;
          if (!*(_BYTE *)(v35 + v16))
            cmark_parse_inlines_cold_1(v12, v13, v14);
        }
        if (v16 >= SDWORD2(v35))
          v22 = 1;
        else
          v22 = v21;
        if ((v22 & 1) != 0)
          goto LABEL_61;
        if ((v15 & 1) == 0)
        {
          DWORD2(v36) = v11;
          if (v11 < SDWORD2(v35))
          {
            v23 = (unsigned __int8 *)(v35 + v11);
            while (1)
            {
              v25 = *v23++;
              v24 = v25;
              if (v25 != 32 && v24 != 9)
                break;
              DWORD2(v36) = ++v11;
              if (DWORD2(v35) == v11)
                goto LABEL_61;
            }
            if (!v24)
              cmark_parse_inlines_cold_1(v12, v13, v14);
          }
          if (v11 < SDWORD2(v35))
          {
            if (*(_BYTE *)(v35 + v11) == 13)
            {
              DWORD2(v36) = ++v11;
              v27 = 1;
              goto LABEL_50;
            }
            if (!*(_BYTE *)(v35 + v11))
              cmark_parse_inlines_cold_1(v12, v13, v14);
          }
          v27 = 0;
LABEL_50:
          if (v11 >= SDWORD2(v35))
            goto LABEL_53;
          if (*(_BYTE *)(v35 + v11) != 10)
          {
            if (!*(_BYTE *)(v35 + v11))
              cmark_parse_inlines_cold_1(v12, v13, v14);
LABEL_53:
            if (v11 >= SDWORD2(v35))
              v28 = 1;
            else
              v28 = v27;
            if ((v28 & 1) == 0)
              return 0;
LABEL_61:
            cmark_reference_create(a3, (uint64_t)&v32, (uint64_t)v31, &v29);
            return DWORD2(v36);
          }
          v16 = v11;
LABEL_60:
          DWORD2(v36) = v16 + 1;
          goto LABEL_61;
        }
        return 0;
      }
      if (!*(_BYTE *)(v35 + v16))
        cmark_parse_inlines_cold_1(v12, v13, v14);
    }
    v21 = 0;
    goto LABEL_27;
  }
  return result;
}

uint64_t link_label(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v5;
  int v6;
  int v7;
  int v8;
  uint64_t result;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  int v16;
  unsigned __int8 v17;
  int v18;
  int v19;
  BOOL v20;
  uint64_t v21;
  unsigned __int8 *v22;
  int v23;
  int v24;
  int v25;
  BOOL v26;

  v3 = a3;
  v5 = a1;
  v6 = *(_DWORD *)(a1 + 32);
  v7 = *(_DWORD *)(a1 + 16);
  v8 = v6;
  if ((_DWORD)a3)
  {
    if (v6 >= v7)
      return 0;
    if (*(_BYTE *)(*(_QWORD *)(a1 + 8) + v6) != 94)
    {
      if (!*(_BYTE *)(*(_QWORD *)(a1 + 8) + v6))
        cmark_parse_inlines_cold_1(a1, a2, a3);
      return 0;
    }
    v8 = v6 + 1;
    *(_DWORD *)(a1 + 32) = v6 + 1;
  }
  if (v8 >= v7)
    return 0;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 8) + v8) != 91)
  {
    if (!*(_BYTE *)(*(_QWORD *)(a1 + 8) + v8))
      cmark_parse_inlines_cold_1(a1, a2, a3);
    return 0;
  }
  v10 = 0;
  *(_DWORD *)(a1 + 32) = v8 + 1;
  while (1)
  {
    v11 = *(_DWORD *)(v5 + 32);
    v12 = *(_DWORD *)(v5 + 16);
    if (v11 >= v12)
    {
LABEL_30:
      result = 0;
      goto LABEL_43;
    }
    v13 = v11;
    v14 = *(_QWORD *)(v5 + 8);
    v15 = *(unsigned __int8 *)(v14 + v11);
    v16 = 1;
    if (v15 <= 0x5B)
    {
      if (v15 == 91)
        goto LABEL_30;
      if (!*(_BYTE *)(v14 + v11))
        cmark_parse_inlines_cold_1(a1, a2, a3);
      goto LABEL_26;
    }
    if (v15 != 92)
      break;
    *(_DWORD *)(v5 + 32) = v11 + 1;
    if (v11 + 1 >= v12)
    {
      v17 = 0;
    }
    else
    {
      v17 = *(_BYTE *)(v14 + v11 + 1);
      if (!*(_BYTE *)(v14 + v13 + 1))
        cmark_parse_inlines_cold_1(a1, a2, a3);
    }
    a1 = cmark_ispunct(v17);
    if (!(_DWORD)a1)
    {
      ++v10;
      goto LABEL_27;
    }
    v11 = *(_DWORD *)(v5 + 32);
    v16 = 2;
LABEL_26:
    *(_DWORD *)(v5 + 32) = v11 + 1;
    v10 += v16;
LABEL_27:
    if (v10 > 1000)
      goto LABEL_30;
  }
  if (v15 != 93)
    goto LABEL_26;
  if (v3)
    v18 = 2;
  else
    v18 = 1;
  v19 = v6 + v18;
  v21 = (v11 - v19);
  v20 = v11 == v19;
  v22 = (unsigned __int8 *)(v14 + v19);
  *(_QWORD *)a2 = v22;
  *(_QWORD *)(a2 + 8) = v21;
  if (!v20)
  {
    do
    {
      if (!cmark_isspace(*v22))
        break;
      v22 = (unsigned __int8 *)(*(_QWORD *)a2 + 1);
      *(_QWORD *)a2 = v22;
      v23 = *(_DWORD *)(a2 + 8) - 1;
      *(_DWORD *)(a2 + 8) = v23;
    }
    while (v23);
    if (*(_DWORD *)(a2 + 12))
      S_process_line_cold_1();
    v24 = *(_DWORD *)(a2 + 8);
    if (v24 >= 1)
    {
      do
      {
        if (!cmark_isspace(*(_BYTE *)(*(_QWORD *)a2 + (v24 - 1))))
          break;
        v25 = *(_DWORD *)(a2 + 8);
        v26 = __OFSUB__(v25, 1);
        v24 = v25 - 1;
        *(_DWORD *)(a2 + 8) = v24;
      }
      while (!((v24 < 0) ^ v26 | (v24 == 0)));
    }
  }
  v6 = *(_DWORD *)(v5 + 32) + 1;
  result = 1;
LABEL_43:
  *(_DWORD *)(v5 + 32) = v6;
  return result;
}

uint64_t spnl(uint64_t result, uint64_t a2, uint64_t a3)
{
  int v3;
  int v4;
  unsigned __int8 *v5;
  int v6;
  int v7;
  int v9;
  unsigned __int8 *v10;
  int v11;
  int v12;

  v3 = *(_DWORD *)(result + 16);
  v4 = *(_DWORD *)(result + 32);
  if (v4 < v3)
  {
    v5 = (unsigned __int8 *)(*(_QWORD *)(result + 8) + v4);
    while (1)
    {
      v7 = *v5++;
      v6 = v7;
      if (v7 != 32 && v6 != 9)
        break;
      *(_DWORD *)(result + 32) = ++v4;
      if (v3 == v4)
        return result;
    }
    if (!v6)
      cmark_parse_inlines_cold_1(result, a2, a3);
  }
  if (v4 >= v3)
    goto LABEL_14;
  if (*(_BYTE *)(*(_QWORD *)(result + 8) + v4) != 13)
  {
    if (!*(_BYTE *)(*(_QWORD *)(result + 8) + v4))
      cmark_parse_inlines_cold_1(result, a2, a3);
LABEL_14:
    v9 = 0;
    goto LABEL_16;
  }
  *(_DWORD *)(result + 32) = ++v4;
  v9 = 1;
LABEL_16:
  if (v4 >= v3)
    goto LABEL_19;
  if (*(_BYTE *)(*(_QWORD *)(result + 8) + v4) != 10)
  {
    if (!*(_BYTE *)(*(_QWORD *)(result + 8) + v4))
      cmark_parse_inlines_cold_1(result, a2, a3);
LABEL_19:
    if (((v4 < v3) & ~v9) != 0)
      return result;
    goto LABEL_22;
  }
  *(_DWORD *)(result + 32) = ++v4;
LABEL_22:
  if (v4 < v3)
  {
    v10 = (unsigned __int8 *)(*(_QWORD *)(result + 8) + v4);
    while (1)
    {
      v12 = *v10++;
      v11 = v12;
      if (v12 != 32 && v11 != 9)
        break;
      *(_DWORD *)(result + 32) = ++v4;
      if (v3 == v4)
        return result;
    }
    if (!v11)
      cmark_parse_inlines_cold_1(result, a2, a3);
  }
  return result;
}

uint64_t manual_scan_link_url(uint64_t a1, int a2, uint64_t a3)
{
  int v6;
  int v7;
  _BYTE *v8;
  int i;
  unsigned int v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  _BYTE *v15;
  int v16;
  uint64_t result;

  v6 = *(_DWORD *)(a1 + 8);
  v7 = a2;
  if (v6 <= a2)
    goto LABEL_30;
  v8 = (_BYTE *)(*(_QWORD *)a1 + a2);
  if (*v8 != 60)
  {
    v12 = 0;
    v7 = a2;
    while (1)
    {
      v13 = *(unsigned __int8 *)(*(_QWORD *)a1 + v7);
      if (v13 != 92)
        goto LABEL_20;
      v14 = v7 + 1;
      if ((int)v14 >= v6)
        break;
      if (!cmark_ispunct(*(_BYTE *)(*(_QWORD *)a1 + v14)))
      {
        v13 = *(unsigned __int8 *)(*(_QWORD *)a1 + v7);
LABEL_20:
        if (v13 == 41)
        {
          if (!v12)
            goto LABEL_30;
          --v12;
          goto LABEL_28;
        }
        if (v13 == 40)
        {
          if ((unint64_t)++v12 > 0x20)
            return 0xFFFFFFFFLL;
LABEL_28:
          ++v7;
          goto LABEL_29;
        }
LABEL_24:
        if (cmark_isspace(v13))
        {
          if (v7 == a2)
            return 0xFFFFFFFFLL;
LABEL_30:
          if (v7 < *(_DWORD *)(a1 + 8))
          {
            v15 = (_BYTE *)(*(_QWORD *)a1 + a2);
            v16 = v7 - a2;
            result = (v7 - a2);
            goto LABEL_37;
          }
          return 0xFFFFFFFFLL;
        }
        goto LABEL_28;
      }
      v7 += 2;
LABEL_29:
      v6 = *(_DWORD *)(a1 + 8);
      if (v7 >= v6)
        goto LABEL_30;
    }
    LOBYTE(v13) = 92;
    goto LABEL_24;
  }
  for (i = a2 + 1; i < v6; i += v11)
  {
    v10 = *(unsigned __int8 *)(*(_QWORD *)a1 + i);
    if (v10 <= 0x5B)
    {
      if (v10 == 10 || v10 == 60)
        return 0xFFFFFFFFLL;
      if (v10 == 62)
      {
        ++i;
        break;
      }
    }
    else if (v10 == 92)
    {
      v11 = 2;
      continue;
    }
    v11 = 1;
  }
  if (i >= v6)
    return 0xFFFFFFFFLL;
  v15 = v8 + 1;
  result = (i - a2);
  v16 = result - 2;
LABEL_37:
  *(_QWORD *)a3 = v15;
  *(_DWORD *)(a3 + 8) = v16;
  *(_DWORD *)(a3 + 12) = 0;
  return result;
}

uint64_t cmark_parse_reference_attributes_inline(uint64_t a1, __int128 *a2, uint64_t *a3)
{
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
  int v15;
  int v17;
  int v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[360];

  memset(&v27[224], 0, 136);
  memset(v27, 0, 357);
  v22 = 0;
  v23 = 0;
  v20 = 0;
  v21 = 0;
  v24 = a1;
  v25 = *a2;
  v26 = xmmword_21132FB90;
  *(_DWORD *)v27 = 0;
  v27[357] = 1;
  v4 = link_label((uint64_t)&v24, (uint64_t)&v22, 1);
  v7 = 0;
  if ((_DWORD)v4 && (_DWORD)v23)
  {
    if (SDWORD2(v26) >= SDWORD2(v25))
      return 0;
    if (*(_BYTE *)(v25 + SDWORD2(v26)) != 58)
    {
      if (!*(_BYTE *)(v25 + SDWORD2(v26)))
        cmark_parse_inlines_cold_1(v4, v5, v6);
      return 0;
    }
    ++DWORD2(v26);
    spnl((uint64_t)&v24, v5, v6);
    if (SDWORD2(v25) <= SDWORD2(v26))
      return 0;
    v10 = 0;
    v11 = v25;
    v12 = (uint64_t)SDWORD2(v26) << 32;
    while (1)
    {
      v13 = *(unsigned __int8 *)(v25 + SDWORD2(v26) + v10);
      if ((_DWORD)v13 == 10 || (_DWORD)v13 == 13)
        break;
      if (!*(_BYTE *)(v25 + SDWORD2(v26) + v10))
        cmark_parse_inlines_cold_1(v13, v8, v9);
      ++v10;
      v12 += 0x100000000;
      if (!(DWORD2(v26) - DWORD2(v25) + (_DWORD)v10))
      {
        if (DWORD2(v25) == DWORD2(v26))
          return 0;
        v7 = (DWORD2(v26) + v10);
        v11 = v25;
        v20 = v25 + SDWORD2(v26);
        v21 = (DWORD2(v25) - DWORD2(v26));
        goto LABEL_27;
      }
    }
    if (!(_DWORD)v10)
      return 0;
    v20 = v25 + SDWORD2(v26);
    v21 = v10;
    v7 = v12 >> 32;
    while (1)
    {
      v15 = *(unsigned __int8 *)(v25 + v7);
      if (v15 != 32 && v15 != 9)
        break;
      if (DWORD2(v25) == (_DWORD)++v7)
      {
        v7 = DWORD2(v25);
        goto LABEL_27;
      }
    }
    if (!*(_BYTE *)(v25 + v7))
      cmark_parse_inlines_cold_1(v13, v8, v9);
LABEL_27:
    if ((int)v7 < SDWORD2(v25))
    {
      if (*(_BYTE *)(v11 + (int)v7) == 13)
      {
        v7 = (v7 + 1);
        v17 = 1;
LABEL_32:
        if ((int)v7 < SDWORD2(v25))
        {
          v18 = *(unsigned __int8 *)(v11 + (int)v7);
          if (v18 == 10)
          {
            v7 = (v7 + 1);
            goto LABEL_39;
          }
          if (!v18)
            cmark_parse_inlines_cold_1(v13, v8, v9);
        }
        if ((((int)v7 < SDWORD2(v25)) & ~v17) != 0)
          return 0;
LABEL_39:
        cmark_reference_create_attributes(a3, (uint64_t)&v22, (uint64_t)&v20);
        return v7;
      }
      if (!*(_BYTE *)(v11 + (int)v7))
        cmark_parse_inlines_cold_1(v13, v8, v9);
    }
    v17 = 0;
    goto LABEL_32;
  }
  return v7;
}

uint64_t cmark_inline_parser_peek_char(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  v3 = *(int *)(a1 + 32);
  if ((int)v3 >= *(_DWORD *)(a1 + 16))
    return 0;
  v4 = *(_QWORD *)(a1 + 8);
  result = *(unsigned __int8 *)(v4 + v3);
  if (!*(_BYTE *)(v4 + v3))
    cmark_parse_inlines_cold_1(result, a2, a3);
  return result;
}

uint64_t cmark_inline_parser_peek_at(uint64_t a1, int a2)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 8) + a2);
}

BOOL cmark_inline_parser_is_eof(uint64_t a1)
{
  return *(_DWORD *)(a1 + 32) >= *(_DWORD *)(a1 + 16);
}

_BYTE *cmark_inline_parser_take_while (uint64_t a1, unsigned int (*a2)(void), uint64_t a3)
{
  int v4;
  unsigned int v6;
  int v7;
  uint64_t v8;
  const char *v9;
  size_t v10;
  size_t v11;
  _BYTE *v12;
  _BYTE *v13;

  v4 = *(_DWORD *)(a1 + 32);
  if (v4 >= *(_DWORD *)(a1 + 16))
  {
    v6 = 0;
  }
  else
  {
    v6 = 0;
    v7 = *(_DWORD *)(a1 + 32);
    do
    {
      v8 = *(_QWORD *)(a1 + 8);
      if (!*(_BYTE *)(v8 + v7))
        cmark_parse_inlines_cold_1(*(unsigned __int8 *)(v8 + v7), (uint64_t)a2, a3);
      if (!a2())
        break;
      v7 = *(_DWORD *)(a1 + 32) + 1;
      *(_DWORD *)(a1 + 32) = v7;
      ++v6;
    }
    while (v7 < *(_DWORD *)(a1 + 16));
  }
  v9 = (const char *)(*(_QWORD *)(a1 + 8) + v4);
  v10 = v6;
  v11 = strlen(v9);
  if (v11 < v6)
    v10 = v11;
  v12 = malloc_type_malloc(v10 + 1, 0x45CADEA2uLL);
  v13 = v12;
  if (v12)
  {
    v12[v10] = 0;
    memcpy(v12, v9, v10);
  }
  return v13;
}

uint64_t cmark_inline_parser_push_delimiter(uint64_t a1, char a2, int a3, int a4, uint64_t a5)
{
  _BOOL4 v8;
  _BOOL4 v9;
  uint64_t result;
  uint64_t v11;

  v8 = a3 != 0;
  v9 = a4 != 0;
  result = (**(uint64_t (***)(uint64_t, uint64_t))a1)(1, 48);
  *(_BYTE *)(result + 32) = a2;
  *(_DWORD *)(result + 36) = v8;
  *(_DWORD *)(result + 40) = v9;
  *(_QWORD *)(result + 16) = a5;
  *(_DWORD *)(result + 24) = *(_DWORD *)(a1 + 32);
  *(_DWORD *)(result + 28) = *(_DWORD *)(a5 + 152);
  v11 = *(_QWORD *)(a1 + 56);
  *(_QWORD *)result = v11;
  *(_QWORD *)(result + 8) = 0;
  if (v11)
    *(_QWORD *)(v11 + 8) = result;
  *(_QWORD *)(a1 + 56) = result;
  return result;
}

uint64_t cmark_inline_parser_scan_delimiters(uint64_t a1, uint64_t a2, uint64_t a3, _BOOL4 *a4, _BOOL4 *a5, _DWORD *a6, _DWORD *a7)
{
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  int v23;
  int is_space;
  int v25;
  int v26;
  _BOOL4 v27;
  _BOOL4 v28;
  uint64_t v30;

  v11 = a3;
  v12 = a2;
  v13 = a1;
  v30 = 0;
  v14 = *(int *)(a1 + 32);
  if (!(_DWORD)v14)
    goto LABEL_6;
  v15 = 0;
  v16 = *(_QWORD *)(a1 + 8);
  do
  {
    v17 = v14 - 1;
    ++v15;
    if (v14 < 2)
      break;
    v18 = *(_BYTE *)(v16 + v14-- - 1) & 0xC0;
  }
  while (v18 == 128);
  a1 = cmark_utf8proc_iterate((unsigned __int8 *)(v16 + v17), v15, (unsigned int *)&v30);
  if ((_DWORD)a1 == -1)
LABEL_6:
    LODWORD(v30) = 10;
  v19 = 0;
  v20 = *(int *)(v13 + 16);
  v21 = *(int *)(v13 + 32);
  for (i = v21 << 32; ; i += 0x100000000)
  {
    if (v21 + v19 >= v20)
    {
      v23 = 0;
    }
    else
    {
      v23 = *(unsigned __int8 *)(*(_QWORD *)(v13 + 8) + v21 + v19);
      if (!*(_BYTE *)(*(_QWORD *)(v13 + 8) + v21 + v19))
        cmark_parse_inlines_cold_1(a1, a2, a3);
    }
    if (v23 != v11 || (int)v19 >= v12)
      break;
    *(_DWORD *)(v13 + 32) = v21 + 1 + v19++;
  }
  if (cmark_utf8proc_iterate((unsigned __int8 *)(*(_QWORD *)(v13 + 8) + (i >> 32)), (int)v20 - (int)v21 - (int)v19, (unsigned int *)&v30 + 1) == -1)HIDWORD(v30) = 10;
  *a6 = cmark_utf8proc_is_punctuation(v30);
  *a7 = cmark_utf8proc_is_punctuation(SHIDWORD(v30));
  is_space = cmark_utf8proc_is_space(v30);
  v25 = cmark_utf8proc_is_space(HIDWORD(v30));
  if ((_DWORD)v19)
  {
    v26 = v25;
    if (cmark_utf8proc_is_space(HIDWORD(v30)))
    {
      v27 = 0;
    }
    else
    {
      v27 = 1;
      if (*a7 && !is_space)
        v27 = *a6 != 0;
    }
    *a4 = v27;
    if (cmark_utf8proc_is_space(v30))
    {
      v28 = 0;
    }
    else
    {
      v28 = 1;
      if (*a6 && !v26)
        v28 = *a7 != 0;
    }
  }
  else
  {
    v28 = 0;
    *a4 = 0;
  }
  *a5 = v28;
  return v19;
}

uint64_t cmark_inline_parser_advance_offset(uint64_t result)
{
  ++*(_DWORD *)(result + 32);
  return result;
}

uint64_t cmark_inline_parser_set_offset(uint64_t result, int a2)
{
  *(_DWORD *)(result + 32) = a2;
  return result;
}

uint64_t cmark_node_unput(uint64_t result, int a2)
{
  uint64_t v2;
  int v3;
  BOOL v4;
  int v5;
  int v6;
  BOOL v7;

  if (a2 >= 1)
  {
    v2 = *(_QWORD *)(result + 56);
    if (v2)
    {
      do
      {
        if (*(unsigned __int16 *)(v2 + 100) != 49153)
          break;
        v3 = *(_DWORD *)(v2 + 152);
        v5 = v3 - a2;
        v4 = v3 < a2;
        a2 -= v3;
        v6 = v4 ? 0 : v5;
        *(_DWORD *)(v2 + 152) = v6;
        v2 = *(_QWORD *)(v2 + 32);
        v7 = !v4 || a2 < 1;
      }
      while (!v7 && v2 != 0);
    }
  }
  return result;
}

uint64_t cmark_inline_parser_get_last_delimiter(uint64_t a1)
{
  return *(_QWORD *)(a1 + 56);
}

uint64_t cmark_inline_parser_get_line(uint64_t a1)
{
  return *(unsigned int *)(a1 + 28);
}

uint64_t push_bracket(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;

  result = (**(uint64_t (***)(uint64_t, uint64_t))a1)(1, 32);
  v7 = *(_QWORD *)(a1 + 64);
  if (v7)
  {
    *(_BYTE *)(v7 + 25) = 1;
    *(_DWORD *)(result + 26) = *(_DWORD *)(v7 + 26);
    v7 = *(_QWORD *)(a1 + 64);
  }
  *(_WORD *)(result + 24) = 1;
  *(_QWORD *)result = v7;
  *(_QWORD *)(result + 8) = a3;
  *(_DWORD *)(result + 16) = *(_DWORD *)(a1 + 32);
  *(_DWORD *)(result + 20) = a2;
  *(_BYTE *)(result + a2 + 26) = 1;
  *(_QWORD *)(a1 + 64) = result;
  if (a2 != 1)
    *(_BYTE *)(a1 + 397) = 0;
  return result;
}

uint64_t adjust_subj_node_newlines(uint64_t result, uint64_t a2, int a3, int a4, char a5)
{
  int v5;
  int v6;
  int v7;
  unsigned __int8 *v8;
  int v9;

  if ((a5 & 2) != 0 && a3)
  {
    v5 = 0;
    v6 = 0;
    v7 = *(_DWORD *)(result + 32);
    v8 = (unsigned __int8 *)(*(_QWORD *)(result + 8) + v7 - (a4 + a3));
    do
    {
      v9 = *v8++;
      if (v9 == 10)
      {
        ++v6;
        v5 = 0;
      }
      else
      {
        ++v5;
      }
      --a3;
    }
    while (a3);
    if (v6)
    {
      *(_DWORD *)(result + 28) += v6;
      *(_DWORD *)(a2 + 88) += v6;
      *(_DWORD *)(a2 + 92) = v5;
      *(_DWORD *)(result + 40) = a4 - v7 + v5;
    }
  }
  return result;
}

uint64_t make_autolink(uint64_t a1, int a2, int a3, unsigned __int8 *a4, unint64_t a5, int a6)
{
  uint64_t (**v12)(uint64_t, uint64_t);
  uint64_t v13;
  int v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  int v20;
  int v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  int v25;
  int v26;
  uint64_t v27;
  uint64_t *v28;
  int v30;
  BOOL v31;
  uint64_t v32;
  uint64_t (**v33)(uint64_t, uint64_t);
  void *v34;
  uint64_t v35;

  v12 = *(uint64_t (***)(uint64_t, uint64_t))a1;
  v13 = (**(uint64_t (***)(uint64_t, uint64_t))a1)(1, 184);
  cmark_strbuf_init((uint64_t)v12, (uint64_t *)v13, 0);
  *(_WORD *)(v13 + 100) = -16375;
  v33 = *(uint64_t (***)(uint64_t, uint64_t))a1;
  v34 = &cmark_strbuf__initbuf;
  v35 = 0;
  if (HIDWORD(a5))
    cmark_clean_url_cold_2();
  v14 = a5;
  if (!(_DWORD)a5)
    goto LABEL_6;
  v15 = a5 + 0xFFFFFFFF;
  while (cmark_isspace(*a4))
  {
    ++a4;
    --v15;
    if (!--v14)
      goto LABEL_6;
  }
  if (v14 >= 1)
  {
    v30 = v15;
    while (cmark_isspace(a4[v30]))
    {
      --v15;
      --v30;
      v31 = __OFSUB__(v14--, 1);
      if ((v14 < 0) ^ v31 | (v14 == 0))
      {
        v14 = 0;
        v16 = 0;
        v17 = 0;
        goto LABEL_7;
      }
    }
    if (!a6)
      goto LABEL_23;
    goto LABEL_22;
  }
  if (!v14)
  {
LABEL_6:
    v16 = 0;
    v17 = 0;
    goto LABEL_7;
  }
  if (a6)
LABEL_22:
    cmark_strbuf_puts(&v33, "mailto:");
LABEL_23:
  houdini_unescape_html_f(&v33, a4, v14);
  v32 = HIDWORD(v35);
  v17 = cmark_strbuf_detach((uint64_t)&v33);
  v16 = v32 | 0x100000000;
LABEL_7:
  *(_QWORD *)(v13 + 144) = v17;
  *(_QWORD *)(v13 + 152) = v16;
  *(_QWORD *)(v13 + 160) = &unk_21132FD7E;
  *(_QWORD *)(v13 + 168) = 0;
  v18 = *(_DWORD *)(a1 + 28);
  *(_DWORD *)(v13 + 88) = v18;
  *(_DWORD *)(v13 + 80) = v18;
  v19 = a2 + 1;
  v21 = *(_DWORD *)(a1 + 36);
  v20 = *(_DWORD *)(a1 + 40);
  *(_DWORD *)(v13 + 84) = v21 + v20 + v19;
  *(_DWORD *)(v13 + 92) = a3 + v20 + v21 + 1;
  v33 = *(uint64_t (***)(uint64_t, uint64_t))a1;
  v34 = &cmark_strbuf__initbuf;
  v35 = 0;
  if (houdini_unescape_html(&v33, (uint64_t)a4, v14))
  {
    v22 = HIDWORD(v35);
    a4 = (unsigned __int8 *)cmark_strbuf_detach((uint64_t)&v33);
    v23 = v22 | 0x100000000;
  }
  else
  {
    v23 = a5 & 0xFFFFFFFF00000000 | v14;
  }
  v24 = (**(uint64_t (***)(uint64_t, uint64_t))a1)(1, 184);
  cmark_strbuf_init(*(_QWORD *)a1, (uint64_t *)v24, 0);
  *(_QWORD *)(v24 + 152) = v23;
  v25 = *(_DWORD *)(a1 + 40) + *(_DWORD *)(a1 + 36) + 1;
  *(_WORD *)(v24 + 100) = -16383;
  *(_QWORD *)(v24 + 144) = a4;
  v26 = *(_DWORD *)(a1 + 28);
  *(_DWORD *)(v24 + 80) = v26;
  *(_DWORD *)(v24 + 84) = v25 + v19;
  *(_DWORD *)(v24 + 88) = v26;
  *(_DWORD *)(v24 + 92) = a3 + v25 - 1;
  v27 = *(_QWORD *)(v13 + 56);
  *(_QWORD *)(v24 + 24) = 0;
  *(_QWORD *)(v24 + 32) = v27;
  *(_QWORD *)(v24 + 40) = v13;
  *(_QWORD *)(v13 + 56) = v24;
  if (v27)
    v28 = (uint64_t *)(v27 + 24);
  else
    v28 = (uint64_t *)(v13 + 48);
  *v28 = v24;
  return v13;
}

_BYTE *chunk_clone(uint64_t (**a1)(uint64_t, uint64_t), uint64_t a2)
{
  size_t v3;
  _BYTE *v4;
  _BYTE *v5;
  size_t v6;

  v3 = *(int *)(a2 + 8);
  v4 = (_BYTE *)(*a1)(v3 + 1, 1);
  v5 = v4;
  if ((_DWORD)v3)
  {
    memcpy(v4, *(const void **)a2, v3);
    v6 = v3;
  }
  else
  {
    v6 = 0;
  }
  v5[v6] = 0;
  return v5;
}

void OUTLINED_FUNCTION_0(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
  __assert_rtn(a1, a2, 221, a4);
}

uint64_t cmark_render_xml(uint64_t *a1, char a2)
{
  return cmark_render_xml_with_mem((uint64_t)a1, a2, *a1);
}

uint64_t cmark_render_xml_with_mem(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  uint64_t node;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  char *v12;
  int v13;
  uint64_t v14;
  uint64_t (*v15)(void);
  char *v16;
  char v17;
  char *v18;
  unsigned int v19;
  unsigned int v20;
  char *type_string;
  unsigned int v22;
  char *v23;
  uint64_t v24;
  int v25;
  int list_type;
  int list_start;
  int list_delim;
  char *v29;
  char *v30;
  uint64_t v31;
  _QWORD v33[3];
  char __str[100];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v33[0] = a3;
  v33[1] = &cmark_strbuf__initbuf;
  v33[2] = 0;
  v4 = cmark_iter_new(a1);
  cmark_strbuf_puts(v33, "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n");
  cmark_strbuf_puts(v33, "<!DOCTYPE document SYSTEM \"CommonMark.dtd\">\n");
  v5 = cmark_iter_next(v4);
  if (v5 != 1)
  {
    v6 = v5;
    v7 = 0;
    while (1)
    {
      node = cmark_iter_get_node(v4);
      v9 = node;
      if (v6 == 2)
        break;
      if (*(_QWORD *)(node + 48))
      {
        v19 = v7 - 3;
        if (v7 >= 3)
        {
          if (v19 >= 0x27)
            v19 = 39;
          v20 = v19 + 1;
          do
          {
            cmark_strbuf_putc((uint64_t)v33, 32);
            --v20;
          }
          while (v20);
        }
        v7 -= 2;
        cmark_strbuf_puts(v33, "</");
        type_string = (char *)cmark_node_get_type_string(v9);
        goto LABEL_54;
      }
LABEL_56:
      v6 = cmark_iter_next(v4);
      if (v6 == 1)
        goto LABEL_57;
    }
    v10 = v7 - 1;
    if (v7 >= 1)
    {
      if (v10 >= 0x27)
        v10 = 39;
      v11 = v10 + 1;
      do
      {
        cmark_strbuf_putc((uint64_t)v33, 32);
        --v11;
      }
      while (v11);
    }
    cmark_strbuf_putc((uint64_t)v33, 60);
    v12 = (char *)cmark_node_get_type_string(v9);
    cmark_strbuf_puts(v33, v12);
    if ((a2 & 2) != 0)
    {
      v13 = *(_DWORD *)(v9 + 80);
      if (v13)
      {
        snprintf(__str, 0x64uLL, " sourcepos=\"%d:%d-%d:%d\"", v13, *(_DWORD *)(v9 + 84), *(_DWORD *)(v9 + 88), *(_DWORD *)(v9 + 92));
        cmark_strbuf_puts(v33, __str);
      }
    }
    v14 = *(_QWORD *)(v9 + 112);
    if (v14)
    {
      v15 = *(uint64_t (**)(void))(v14 + 120);
      if (v15)
      {
        v16 = (char *)v15();
        if (v16)
          cmark_strbuf_puts(v33, v16);
      }
    }
    v17 = 0;
    switch(*(_WORD *)(v9 + 100))
    {
      case 0x8001:
        v18 = " xmlns=\"http://commonmark.org/xml/1.0\"";
        goto LABEL_48;
      case 0x8002:
      case 0x8004:
      case 0x8008:
        goto LABEL_50;
      case 0x8003:
        list_type = cmark_node_get_list_type(v9);
        if (list_type == 1)
        {
          v29 = " type=\"bullet\"";
        }
        else
        {
          if (list_type != 2)
            goto LABEL_46;
          cmark_strbuf_puts(v33, " type=\"ordered\"");
          list_start = cmark_node_get_list_start(v9);
          snprintf(__str, 0x64uLL, " start=\"%d\"", list_start);
          cmark_strbuf_puts(v33, __str);
          list_delim = cmark_node_get_list_delim(v9);
          if (list_delim == 2)
          {
            v29 = " delim=\"paren\"";
          }
          else
          {
            if (list_delim != 1)
              goto LABEL_46;
            v29 = " delim=\"period\"";
          }
        }
        cmark_strbuf_puts(v33, v29);
LABEL_46:
        cmark_node_get_list_tight(v9);
        snprintf(__str, 0x64uLL, " tight=\"%s\"");
LABEL_47:
        v18 = __str;
LABEL_48:
        cmark_strbuf_puts(v33, v18);
        goto LABEL_49;
      case 0x8005:
        if (*(int *)(v9 + 152) >= 1)
        {
          cmark_strbuf_puts(v33, " info=\"");
          houdini_escape_html0(v33, *(_QWORD *)(v9 + 144), *(_DWORD *)(v9 + 152), 0);
          cmark_strbuf_putc((uint64_t)v33, 34);
        }
        cmark_strbuf_puts(v33, " xml:space=\"preserve\">");
        v24 = *(_QWORD *)(v9 + 160);
        v25 = *(_DWORD *)(v9 + 168);
        goto LABEL_41;
      case 0x8006:
        goto LABEL_29;
      case 0x8007:
        goto LABEL_31;
      case 0x8009:
        snprintf(__str, 0x64uLL, " level=\"%d\"");
        goto LABEL_47;
      default:
        v22 = *(unsigned __int16 *)(v9 + 100) - 49153;
        if (v22 > 9)
          goto LABEL_50;
        if (((1 << v22) & 0x19) != 0)
        {
LABEL_29:
          cmark_strbuf_puts(v33, " xml:space=\"preserve\">");
          v24 = *(_QWORD *)(v9 + 144);
          v25 = *(_DWORD *)(v9 + 152);
LABEL_41:
          houdini_escape_html0(v33, v24, v25, 0);
          cmark_strbuf_puts(v33, "</");
          v30 = (char *)cmark_node_get_type_string(v9);
          cmark_strbuf_puts(v33, v30);
          v17 = 1;
        }
        else
        {
          if (((1 << v22) & 0x300) != 0)
          {
            cmark_strbuf_puts(v33, " destination=\"");
            houdini_escape_html0(v33, *(_QWORD *)(v9 + 144), *(_DWORD *)(v9 + 152), 0);
            cmark_strbuf_putc((uint64_t)v33, 34);
            v23 = " title=\"";
          }
          else
          {
            if (*(unsigned __int16 *)(v9 + 100) != 49158)
              goto LABEL_50;
LABEL_31:
            cmark_strbuf_puts(v33, " on_enter=\"");
            houdini_escape_html0(v33, *(_QWORD *)(v9 + 144), *(_DWORD *)(v9 + 152), 0);
            cmark_strbuf_putc((uint64_t)v33, 34);
            v23 = " on_exit=\"";
          }
          cmark_strbuf_puts(v33, v23);
          houdini_escape_html0(v33, *(_QWORD *)(v9 + 160), *(_DWORD *)(v9 + 168), 0);
          cmark_strbuf_putc((uint64_t)v33, 34);
LABEL_49:
          v17 = 0;
        }
LABEL_50:
        if (*(_QWORD *)(v9 + 48))
        {
          v7 += 2;
          goto LABEL_55;
        }
        if ((v17 & 1) != 0)
          goto LABEL_55;
        type_string = " /";
        break;
    }
LABEL_54:
    cmark_strbuf_puts(v33, type_string);
LABEL_55:
    cmark_strbuf_puts(v33, ">\n");
    goto LABEL_56;
  }
LABEL_57:
  v31 = cmark_strbuf_detach((uint64_t)v33);
  cmark_iter_free(v4);
  return v31;
}

uint64_t houdini_escape_href(_DWORD *a1, uint64_t a2, int a3)
{
  int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  unint64_t v15;
  _DWORD *v16;
  char *v17;
  _BYTE v19[3];

  v19[0] = 37;
  if (a3 >= 1)
  {
    v6 = 0;
    v7 = a3;
    do
    {
      v8 = 0;
      v9 = v6;
      v10 = v6;
      if (a3 <= v6 + 1)
        v11 = v6 + 1;
      else
        v11 = a3;
      v12 = a2 + v6;
      while (1)
      {
        v13 = *(unsigned __int8 *)(v12 + v8);
        v14 = HREF_SAFE[v13];
        if (!HREF_SAFE[v13])
          break;
        ++v8;
        if (v10 + v8 >= v7)
          goto LABEL_11;
      }
      v11 = v9 + v8;
LABEL_11:
      if (v11 > v9)
        cmark_strbuf_put(a1, (const void *)(a2 + v10), v11 - v10);
      if (v14)
        return 1;
      v15 = *(unsigned __int8 *)(a2 + v11);
      if ((_DWORD)v15 == 39)
      {
        v16 = a1;
        v17 = "&#x27;";
      }
      else
      {
        if ((_DWORD)v15 != 38)
        {
          v19[1] = houdini_escape_href_hex_chars[v15 >> 4];
          v19[2] = houdini_escape_href_hex_chars[v15 & 0xF];
          cmark_strbuf_put(a1, v19, 3);
          goto LABEL_20;
        }
        v16 = a1;
        v17 = "&amp;";
      }
      cmark_strbuf_puts(v16, v17);
LABEL_20:
      v6 = v11 + 1;
    }
    while (v11 + 1 < a3);
  }
  return 1;
}

uint64_t houdini_unescape_ent(_DWORD *a1, char *__s1, int a3)
{
  _DWORD *v5;
  int v6;
  signed int v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  size_t v13;
  int v14;
  int v15;
  int v16;
  int v17;
  uint64_t v18;
  const char *v19;
  int v20;
  int v21;
  int v22;
  int v23;
  uint64_t result;
  int v25;
  int v26;
  int v27;
  uint64_t v28;
  unsigned __int8 v29;

  v5 = a1;
  if (a3 < 3 || *__s1 != 35)
  {
    if (a3 >= 32)
      v12 = 32;
    else
      v12 = a3;
    if ((int)v12 >= 3)
    {
      v13 = 2;
      while (1)
      {
        v14 = __s1[v13];
        if (v14 == 32)
          break;
        if (v14 == 59)
        {
          v15 = 0;
          v16 = 2124;
          v17 = 1062;
          while (1)
          {
            v18 = v17;
            v19 = (&cmark_entities)[2 * v17];
            v20 = strncmp(__s1, v19, v13);
            v21 = v20;
            if (!v20 && !v19[v13])
              break;
            if ((int)v18 <= v15 || v20 > 0)
            {
              result = 0;
              if (v16 <= (int)v18 || v21 < 1)
                return result;
              v25 = v16 - v18;
              if (v16 >= (int)v18)
                v26 = v16 - v18;
              else
                v26 = v25 + 1;
              v27 = v18 + (v26 >> 1);
              if ((v25 + 1) >= 3)
                v17 = v27;
              else
                v17 = v27 + 1;
              v15 = v18 + 1;
            }
            else
            {
              v22 = v18 - v15;
              if ((int)v18 >= v15)
                v23 = v18 - v15;
              else
                v23 = v22 + 1;
              v17 = (__PAIR64__((int)v18 - (v23 >> 1), v22 + 1) - 3) >> 32;
              v16 = v18 - 1;
            }
          }
          cmark_strbuf_puts(v5, (char *)&(&cmark_entities)[2 * v18 + 1]);
          return (v13 + 1);
        }
        if (v12 == ++v13)
          return 0;
      }
    }
    return 0;
  }
  v6 = __s1[1];
  if ((v6 - 48) > 9)
  {
    if ((v6 | 0x20) != 0x78)
      return 0;
    v7 = 0;
    v28 = 2;
    while (1)
    {
      v29 = __s1[v28];
      if (!memchr("0123456789ABCDEFabcdef", v29, 0x17uLL))
        break;
      if ((int)(16 * v7 + (v29 | 0x20u) % 0x27 - 9) >= 1114112)
        v7 = 1114112;
      else
        v7 = 16 * v7 + (v29 | 0x20u) % 0x27 - 9;
      if (a3 == ++v28)
      {
        LODWORD(v8) = a3;
        goto LABEL_49;
      }
    }
    LODWORD(v8) = v28;
LABEL_49:
    v11 = v8 - 2;
    v5 = a1;
  }
  else
  {
    v7 = 0;
    v8 = 1;
    while (1)
    {
      v9 = __s1[v8];
      if ((v9 - 48) > 9)
        break;
      v10 = v9 + 10 * v7 - 48;
      if (v10 >= 1114112)
        v7 = 1114112;
      else
        v7 = v10;
      if (a3 == ++v8)
      {
        LODWORD(v8) = a3;
        break;
      }
    }
    v11 = v8 - 1;
  }
  result = 0;
  if ((int)v8 >= a3 || (v11 - 1) > 7)
    return result;
  if (__s1[v8] != 59)
    return 0;
  if (!v7 || v7 >= 1114112 || (v7 & 0xFFFFF800) == 0xD800)
    v7 = 65533;
  cmark_utf8proc_encode_char(v7, v5);
  return (v8 + 1);
}

uint64_t houdini_unescape_html(_DWORD *a1, uint64_t a2, int a3)
{
  int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;

  if (a3 < 1)
    return 1;
  v6 = 0;
  v7 = a3;
  while (1)
  {
    v8 = 0;
    v9 = v6;
    v10 = v6;
    if (a3 <= v6 + 1)
      v11 = v6 + 1;
    else
      v11 = a3;
    v12 = a2 + v6;
    while (1)
    {
      v13 = *(unsigned __int8 *)(v12 + v8);
      if (v13 == 38)
        break;
      ++v8;
      if (v10 + v8 >= v7)
        goto LABEL_11;
    }
    v11 = v9 + v8;
LABEL_11:
    if (v11 <= v9)
      goto LABEL_14;
    if (!v9)
      break;
LABEL_13:
    cmark_strbuf_put(a1, (const void *)(a2 + v10), v11 - v10);
LABEL_14:
    if (v13 == 38)
    {
      v14 = v11 + 1;
      v15 = houdini_unescape_ent(a1, (char *)(a2 + v14), a3 - v14);
      if (!v15)
        cmark_strbuf_putc((uint64_t)a1, 38);
      v6 = v15 + v14;
      if (v15 + v14 < a3)
        continue;
    }
    return 1;
  }
  if (v13 == 38)
  {
    cmark_strbuf_grow((uint64_t)a1, a3);
    goto LABEL_13;
  }
  return 0;
}

_DWORD *houdini_unescape_html_f(_DWORD *a1, const void *a2, int a3)
{
  _DWORD *result;

  result = (_DWORD *)houdini_unescape_html(a1, (uint64_t)a2, a3);
  if (!(_DWORD)result)
    return cmark_strbuf_put(a1, a2, a3);
  return result;
}

uint64_t cmark_render_plaintext(uint64_t *a1, uint64_t a2, int a3)
{
  uint64_t v5;

  v5 = *a1;
  if ((a2 & 4) != 0)
    a3 = 0;
  return cmark_render(v5, (uint64_t)a1, a2, a3, (uint64_t)outc_1, (unsigned int (*)(uint64_t *, uint64_t, uint64_t, uint64_t))S_render_node_2);
}

uint64_t cmark_render_plaintext_with_mem(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  if ((a2 & 4) != 0)
    a3 = 0;
  return cmark_render(a4, a1, a2, a3, (uint64_t)outc_1, (unsigned int (*)(uint64_t *, uint64_t, uint64_t, uint64_t))S_render_node_2);
}

_DWORD *outc_1(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  return cmark_render_code_point(a1, a4);
}

uint64_t S_render_node_2(uint64_t a1, uint64_t a2, int a3, char a4)
{
  int v7;
  _BOOL4 v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(void);
  void (*v13)(uint64_t, uint64_t, _BYTE *, _BOOL8, uint64_t);
  _BYTE *literal;
  uint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  void (*v21)(uint64_t, uint64_t, _BYTE *, _QWORD, _QWORD);
  _BYTE *v22;
  void (*v23)(uint64_t, uint64_t, _BYTE *, _QWORD, _QWORD);
  _BYTE *v24;
  int v25;
  void (*v26)(uint64_t, uint64_t, _BYTE *, _QWORD, _QWORD);
  _BYTE *v27;
  int item_index;
  int list_delim;
  const char *v30;
  const char *v31;
  char *v32;
  uint64_t result;
  _BYTE *v34;
  size_t v35;
  uint64_t v36;
  char __str[32];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v7 = *(_DWORD *)(a1 + 28);
  v8 = (a4 & 4) == 0;
  if (v7 < 1)
    v8 = 0;
  v9 = (a4 & 0x10) == 0 && v8;
  if (a3 == 2)
  {
    v10 = *(_QWORD *)(a2 + 40);
    if (v10 && *(unsigned __int16 *)(v10 + 100) == 32772)
    {
      LOBYTE(v10) = *(_BYTE *)(*(_QWORD *)(v10 + 40) + 165);
LABEL_15:
      *(_BYTE *)(a1 + 43) = v10;
    }
  }
  else if (*(unsigned __int16 *)(a2 + 100) == 32771)
  {
    v10 = *(_QWORD *)(a2 + 40);
    if (v10)
      LOBYTE(v10) = *(unsigned __int16 *)(v10 + 100) == 32772 && *(_BYTE *)(*(_QWORD *)(v10 + 40) + 165) != 0;
    goto LABEL_15;
  }
  v11 = *(_QWORD *)(a2 + 112);
  if (v11 && (v12 = *(void (**)(void))(v11 + 104)) != 0)
  {
    v12();
  }
  else
  {
    switch(*(_WORD *)(a2 + 100))
    {
      case 0xC001:
        v13 = *(void (**)(uint64_t, uint64_t, _BYTE *, _BOOL8, uint64_t))(a1 + 72);
        literal = cmark_node_get_literal(a2);
        v15 = a1;
        v16 = a2;
        v17 = v9;
        v18 = 1;
        goto LABEL_32;
      case 0xC002:
        if ((a4 & 4) != 0 || !(v7 | a4 & 0x10) && !*(_BYTE *)(a1 + 42))
          goto LABEL_60;
        (*(void (**)(uint64_t, uint64_t, const char *, _BOOL8, _QWORD))(a1 + 72))(a1, a2, " ", v9, 0);
        break;
      case 0xC003:
LABEL_60:
        (*(void (**)(uint64_t))(a1 + 56))(a1);
        break;
      case 0xC004:
        v13 = *(void (**)(uint64_t, uint64_t, _BYTE *, _BOOL8, uint64_t))(a1 + 72);
        literal = cmark_node_get_literal(a2);
        v15 = a1;
        v16 = a2;
        v17 = v9;
        v18 = 0;
LABEL_32:
        v13(v15, v16, literal, v17, v18);
        break;
      case 0xC005:
      case 0xC006:
      case 0xC007:
      case 0xC008:
      case 0xC009:
      case 0xC00A:
        return 1;
      case 0xC00B:
        if (a3 == 2)
        {
          (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72))(a1, a2, "[^", 0, 0);
          v21 = *(void (**)(uint64_t, uint64_t, _BYTE *, _QWORD, _QWORD))(a1 + 72);
          v22 = cmark_chunk_to_cstr(*(uint64_t (***)(uint64_t, uint64_t))a1, (int *)(a2 + 144));
          v21(a1, a2, v22, 0, 0);
          (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72))(a1, a2, "]", 0, 0);
        }
        break;
      case 0xC00C:
        v23 = *(void (**)(uint64_t, uint64_t, _BYTE *, _QWORD, _QWORD))(a1 + 72);
        if (*(_DWORD *)(a2 + 156))
        {
          v24 = *(_BYTE **)(a2 + 144);
        }
        else
        {
          v34 = (_BYTE *)(**(uint64_t (***)(uint64_t, uint64_t))a1)(*(int *)(a2 + 152) + 1, 1);
          v24 = v34;
          v35 = *(unsigned int *)(a2 + 152);
          if ((int)v35 >= 1)
          {
            memcpy(v34, *(const void **)(a2 + 144), v35);
            LODWORD(v35) = *(_DWORD *)(a2 + 152);
          }
          v24[(int)v35] = 0;
          *(_QWORD *)(a2 + 144) = v24;
          *(_DWORD *)(a2 + 156) = 1;
        }
        v23(a1, a2, v24, 0, 0);
        break;
      default:
        switch(*(_WORD *)(a2 + 100))
        {
          case 0x8001:
          case 0x8002:
          case 0x8006:
          case 0x8007:
            return 1;
          case 0x8003:
            if (a3 == 2)
              return 1;
            v19 = *(_QWORD *)(a2 + 24);
            if (!v19)
              return 1;
            v20 = *(unsigned __int16 *)(v19 + 100);
            if (v20 != 32773 && v20 != 32771)
              return 1;
            goto LABEL_60;
          case 0x8004:
            if (cmark_node_get_list_type(*(_QWORD *)(a2 + 40)) == 1)
            {
              v25 = 4;
            }
            else
            {
              item_index = cmark_node_get_item_index(a2);
              list_delim = cmark_node_get_list_delim(*(_QWORD *)(a2 + 40));
              v30 = ".";
              if (list_delim == 2)
                v30 = ")";
              v31 = " ";
              if (item_index < 10)
                v31 = "  ";
              snprintf(__str, 0x14uLL, "%d%s%s", item_index, v30, v31);
              v25 = strlen(__str);
            }
            if (a3 != 2)
            {
              cmark_strbuf_truncate(*(_QWORD *)(a1 + 16), *(_DWORD *)(*(_QWORD *)(a1 + 16) + 20) - v25);
              goto LABEL_60;
            }
            if (cmark_node_get_list_type(*(_QWORD *)(a2 + 40)) == 1)
              v32 = "  - ";
            else
              v32 = __str;
            (*(void (**)(uint64_t, uint64_t, char *, _QWORD, _QWORD))(a1 + 72))(a1, a2, v32, 0, 0);
            *(_BYTE *)(a1 + 41) = 1;
            while (v25)
            {
              --v25;
              cmark_strbuf_putc(*(_QWORD *)(a1 + 16), 32);
            }
            break;
          case 0x8005:
            if (*(_QWORD *)(a2 + 32) || (v36 = *(_QWORD *)(a2 + 40)) == 0 || *(unsigned __int16 *)(v36 + 100) != 32772)
              (*(void (**)(uint64_t))(a1 + 64))(a1);
            v26 = *(void (**)(uint64_t, uint64_t, _BYTE *, _QWORD, _QWORD))(a1 + 72);
            v27 = cmark_node_get_literal(a2);
            v26(a1, a2, v27, 0, 0);
            goto LABEL_57;
          case 0x8008:
            if (a3 == 2)
              return 1;
            goto LABEL_57;
          case 0x8009:
            if (a3 == 2)
            {
              *(_WORD *)(a1 + 41) = 257;
            }
            else
            {
              *(_BYTE *)(a1 + 42) = 0;
LABEL_57:
              (*(void (**)(uint64_t))(a1 + 64))(a1);
            }
            return 1;
          case 0x800A:
            goto LABEL_57;
          case 0x800B:
            if (a3 == 2)
            {
              ++*(_DWORD *)(a1 + 80);
              (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72))(a1, a2, "[^", 0, 0);
              snprintf(__str, 0x20uLL, "%d", *(_DWORD *)(a1 + 80));
              (*(void (**)(uint64_t, uint64_t, char *, _QWORD, _QWORD))(a1 + 72))(a1, a2, __str, 0, 0);
              (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a1 + 72))(a1, a2, "]: ", 0, 0);
              cmark_strbuf_puts(*(_DWORD **)(a1 + 16), "    ");
            }
            else
            {
              cmark_strbuf_truncate(*(_QWORD *)(a1 + 16), *(_DWORD *)(*(_QWORD *)(a1 + 16) + 20) - 4);
            }
            return 1;
          default:
            S_render_node_cold_1_2();
        }
        return result;
    }
  }
  return 1;
}

_BYTE *cmark_chunk_to_cstr(uint64_t (**a1)(uint64_t, uint64_t), int *a2)
{
  _BYTE *v3;
  _BYTE *v4;
  size_t v5;

  if (a2[3])
    return *(_BYTE **)a2;
  v4 = (_BYTE *)(*a1)(a2[2] + 1, 1);
  v3 = v4;
  v5 = a2[2];
  if ((int)v5 >= 1)
  {
    memcpy(v4, *(const void **)a2, v5);
    LODWORD(v5) = a2[2];
  }
  v3[(int)v5] = 0;
  *(_QWORD *)a2 = v3;
  a2[3] = 1;
  return v3;
}

BOOL matches_0(uint64_t a1, uint64_t *a2, uint64_t a3, int a4, uint64_t a5)
{
  uint64_t v8;
  int first_nonspace;
  unsigned __int16 *v10;
  unsigned __int16 *v11;
  _BOOL8 v12;
  uint64_t v13;

  if (cmark_node_get_type(a5) != CMARK_NODE_TABLE)
    return 0;
  cmark_arena_push();
  v8 = a3 + (int)cmark_parser_get_first_nonspace((uint64_t)a2);
  first_nonspace = cmark_parser_get_first_nonspace((uint64_t)a2);
  v10 = row_from_string(a2, v8, a4 - first_nonspace);
  if (v10)
  {
    v11 = v10;
    v12 = *v10 != 0;
    v13 = *a2;
    free_row_cells(v13, v10);
    (*(void (**)(unsigned __int16 *))(v13 + 16))(v11);
  }
  else
  {
    v12 = 0;
  }
  cmark_arena_pop();
  return v12;
}

const char *get_type_string_1(uint64_t a1, uint64_t a2)
{
  int v2;

  v2 = *(unsigned __int16 *)(a2 + 100);
  if (CMARK_NODE_TABLE == v2)
    return "table";
  if (CMARK_NODE_TABLE_ROW == v2)
  {
    if (**(_BYTE **)(a2 + 144))
      return "table_header";
    else
      return "table_row";
  }
  else if (CMARK_NODE_TABLE_CELL == v2)
  {
    return "table_cell";
  }
  else
  {
    return "<unknown>";
  }
}

BOOL can_contain_1(uint64_t a1, uint64_t a2, int a3)
{
  int v3;

  v3 = *(unsigned __int16 *)(a2 + 100);
  if (CMARK_NODE_TABLE == v3)
  {
    return CMARK_NODE_TABLE_ROW == a3;
  }
  else if (CMARK_NODE_TABLE_ROW == v3)
  {
    return CMARK_NODE_TABLE_CELL == a3;
  }
  else
  {
    if (CMARK_NODE_TABLE_CELL != v3)
      return 0;
    if ((a3 - 49153) < 0xC && ((0xBC9u >> (a3 - 1)) & 1) != 0)
      return 1;
    return a3 == 49157 || CMARK_NODE_STRIKETHROUGH == a3 || a3 == 49163;
  }
}

BOOL contains_inlines(uint64_t a1, uint64_t a2)
{
  return CMARK_NODE_TABLE_CELL == *(unsigned __int16 *)(a2 + 100);
}

uint64_t commonmark_render_1(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  int v6;
  uint64_t (*v7)(uint64_t);
  uint64_t result;
  const char *v10;
  int *v11;
  int v12;
  int v14;
  uint64_t (*v15)(uint64_t, uint64_t, const char *, _QWORD, _QWORD);
  uint64_t v16;
  uint64_t v17;
  unsigned __int8 *v18;
  uint64_t v19;
  int v20;
  int v21;
  const char *v22;

  v6 = *(unsigned __int16 *)(a3 + 100);
  if (CMARK_NODE_TABLE == v6)
  {
    v7 = *(uint64_t (**)(uint64_t))(a2 + 64);
    return v7(a2);
  }
  if (CMARK_NODE_TABLE_ROW != v6)
  {
    if (CMARK_NODE_TABLE_CELL != v6)
      commonmark_render_cold_1();
    v11 = *(int **)(a3 + 144);
    if (v11)
    {
      v12 = *v11;
      if (a4 == 2)
      {
        if (v12)
        {
          v14 = v11[1];
          result = (*(uint64_t (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a2 + 72))(a2, a3, " ", 0, 0);
          if (!v14)
          {
            v15 = *(uint64_t (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a2 + 72);
            if ((a5 & 0x200000) != 0)
              v10 = "\"";
            else
              v10 = "^";
            return v15(a2, a3, v10, 0, 0);
          }
        }
        return result;
      }
      if (!v12)
        goto LABEL_20;
    }
    else if (a4 == 2)
    {
      v10 = " ";
      goto LABEL_16;
    }
    (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a2 + 72))(a2, a3, " ", 0, 0);
LABEL_20:
    result = (*(uint64_t (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a2 + 72))(a2, a3, "|", 0, 0);
    v16 = *(_QWORD *)(a3 + 40);
    if (!**(_BYTE **)(v16 + 144) || *(_QWORD *)(a3 + 24))
      return result;
    v17 = *(_QWORD *)(v16 + 40);
    if (v17 && CMARK_NODE_TABLE == *(unsigned __int16 *)(v17 + 100))
      v18 = *(unsigned __int8 **)(*(_QWORD *)(v17 + 144) + 8);
    else
      v18 = 0;
    v19 = **(unsigned __int16 **)(v17 + 144);
    (*(void (**)(uint64_t))(a2 + 56))(a2);
    (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a2 + 72))(a2, a3, "|", 0, 0);
    if (!v19)
    {
LABEL_39:
      v7 = *(uint64_t (**)(uint64_t))(a2 + 56);
      return v7(a2);
    }
    while (1)
    {
      v21 = *v18++;
      v20 = v21;
      if (v21 > 107)
      {
        if (v20 == 114)
        {
          v22 = " --: |";
          goto LABEL_37;
        }
        if (v20 == 108)
        {
          v22 = " :-- |";
          goto LABEL_37;
        }
      }
      else
      {
        if (!v20)
        {
          v22 = " --- |";
          goto LABEL_37;
        }
        if (v20 == 99)
        {
          v22 = " :-: |";
LABEL_37:
          (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a2 + 72))(a2, a3, v22, 0, 0);
        }
      }
      if (!--v19)
        goto LABEL_39;
    }
  }
  if (a4 == 2)
  {
    (*(void (**)(uint64_t))(a2 + 56))(a2);
    v10 = "|";
LABEL_16:
    v15 = *(uint64_t (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a2 + 72);
    return v15(a2, a3, v10, 0, 0);
  }
  return result;
}

uint64_t latex_render_0(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int v6;
  unsigned __int8 *v7;
  unsigned __int16 *v8;
  uint64_t v9;
  int v10;
  int v11;
  const char *v12;
  uint64_t result;
  const char *v14;

  v6 = *(unsigned __int16 *)(a3 + 100);
  if (CMARK_NODE_TABLE == v6)
  {
    if (a4 == 2)
    {
      v7 = *(unsigned __int8 **)(*(_QWORD *)(a3 + 144) + 8);
      (*(void (**)(uint64_t))(a2 + 56))(a2);
      (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a2 + 72))(a2, a3, "\\begin{table}", 0, 0);
      (*(void (**)(uint64_t))(a2 + 56))(a2);
      (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a2 + 72))(a2, a3, "\\begin{tabular}{", 0, 0);
      v8 = *(unsigned __int16 **)(a3 + 144);
      v9 = *v8;
      if (*v8)
      {
        do
        {
          v11 = *v7++;
          v10 = v11;
          v12 = "l";
          if (v11 > 107)
          {
            if (v10 == 108)
              goto LABEL_11;
            if (v10 == 114)
            {
              v12 = "r";
              goto LABEL_11;
            }
          }
          else
          {
            if (!v10)
              goto LABEL_11;
            if (v10 == 99)
            {
              v12 = "c";
LABEL_11:
              (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a2 + 72))(a2, a3, v12, 0, 0);
            }
          }
          --v9;
        }
        while (v9);
      }
      (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a2 + 72))(a2, a3, "}", 0, 0);
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a2 + 72))(a2, a3, "\\end{tabular}", 0, 0);
      (*(void (**)(uint64_t))(a2 + 56))(a2);
      (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a2 + 72))(a2, a3, "\\end{table}", 0, 0);
    }
    return (*(uint64_t (**)(uint64_t))(a2 + 56))(a2);
  }
  if (CMARK_NODE_TABLE_ROW == v6)
  {
    if (a4 != 2)
      return (*(uint64_t (**)(uint64_t))(a2 + 56))(a2);
  }
  else
  {
    if (CMARK_NODE_TABLE_CELL != v6)
      latex_render_cold_1();
    if (a4 != 2)
    {
      if (*(_QWORD *)(a3 + 24))
        v14 = " & ";
      else
        v14 = " \\\\";
      return (*(uint64_t (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a2 + 72))(a2, a3, v14, 0, 0);
    }
  }
  return result;
}

char *xml_attr_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  char *result;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;
  BOOL v9;
  const char *v10;

  if (CMARK_NODE_TABLE_CELL != *(unsigned __int16 *)(a2 + 100))
    return 0;
  v2 = *(_QWORD *)(a2 + 40);
  if (v2 && CMARK_NODE_TABLE_ROW == *(unsigned __int16 *)(v2 + 100) && **(_BYTE **)(v2 + 144))
  {
    v3 = *(_QWORD *)(a2 + 144);
    if (v3)
    {
      v4 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 40) + 144) + 8) + *(int *)(v3 + 8));
      if (v4 == 114)
        return " align=\"right\"";
      if (v4 != 108)
      {
        if (v4 == 99)
          return " align=\"center\"";
        return 0;
      }
      return " align=\"left\"";
    }
    return 0;
  }
  v6 = *(unsigned int **)(a2 + 144);
  if (!v6)
    return 0;
  v7 = *v6;
  if (!*v6)
    return " colspan_filler";
  v8 = v6[1];
  if (!v8)
    return " rowspan_filler";
  v9 = v8 != 1 && v7 > 1;
  v10 = " colspan";
  if (v9)
    v10 = " colspan rowspan";
  result = v7 <= 1 ? " rowspan" : (char *)v10;
  if (v7 <= 1 && v8 == 1)
    return 0;
  return result;
}

uint64_t man_render_0(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int v6;
  unsigned __int8 *v7;
  uint64_t result;
  _WORD *v9;
  uint64_t v10;
  int v11;
  int v12;
  const char *v13;

  v6 = *(unsigned __int16 *)(a3 + 100);
  if (CMARK_NODE_TABLE != v6)
  {
    if (CMARK_NODE_TABLE_ROW != v6)
    {
      if (CMARK_NODE_TABLE_CELL != v6)
        man_render_cold_1();
      if (a4 != 2 && *(_QWORD *)(a3 + 24))
        return (*(uint64_t (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a2 + 72))(a2, a3, "@", 0, 0);
      return result;
    }
    if (a4 == 2)
      return result;
    return (*(uint64_t (**)(uint64_t))(a2 + 56))(a2);
  }
  if (a4 != 2)
  {
    (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a2 + 72))(a2, a3, ".TE", 0, 0);
    return (*(uint64_t (**)(uint64_t))(a2 + 56))(a2);
  }
  v7 = *(unsigned __int8 **)(*(_QWORD *)(a3 + 144) + 8);
  (*(void (**)(uint64_t))(a2 + 56))(a2);
  (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a2 + 72))(a2, a3, ".TS", 0, 0);
  (*(void (**)(uint64_t))(a2 + 56))(a2);
  (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a2 + 72))(a2, a3, "tab(@);", 0, 0);
  result = (*(uint64_t (**)(uint64_t))(a2 + 56))(a2);
  v9 = *(_WORD **)(a3 + 144);
  v10 = (unsigned __int16)*v9;
  if (*v9)
  {
    while (1)
    {
      v12 = *v7++;
      v11 = v12;
      if (v12 <= 107)
      {
        if (v11 && v11 != 99)
          goto LABEL_13;
        v13 = "c";
        goto LABEL_12;
      }
      if (v11 == 108)
        break;
      if (v11 == 114)
      {
        v13 = "r";
LABEL_12:
        (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a2 + 72))(a2, a3, v13, 0, 0);
      }
LABEL_13:
      if (!--v10)
      {
        (*(void (**)(uint64_t, uint64_t, const char *, _QWORD, _QWORD))(a2 + 72))(a2, a3, ".", 0, 0);
        return (*(uint64_t (**)(uint64_t))(a2 + 56))(a2);
      }
    }
    v13 = "l";
    goto LABEL_12;
  }
  return result;
}

void html_render_1(uint64_t a1, uint64_t a2, uint64_t a3, int a4, __int16 a5)
{
  uint64_t v8;
  int v9;
  uint64_t v10;
  int start_line;
  int start_column;
  int end_line;
  int end_column;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int *v22;
  unsigned int v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  int v29;
  char *v30;
  char *v31;
  uint64_t v32;
  char *v33;
  int v34;
  int v35;
  int v36;
  int v37;
  char __str[100];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v8 = *(_QWORD *)a2;
  v9 = *(unsigned __int16 *)(a3 + 100);
  if (CMARK_NODE_TABLE == v9)
  {
    if (a4 == 2)
    {
      v10 = *(int *)(v8 + 20);
      if ((_DWORD)v10 && *(_BYTE *)(v10 + *(_QWORD *)(v8 + 8) - 1) != 10)
        cmark_strbuf_putc(*(_QWORD *)a2, 10);
      cmark_strbuf_puts((_DWORD *)v8, "<table");
      if ((a5 & 2) != 0)
      {
        start_line = cmark_node_get_start_line(a3);
        start_column = cmark_node_get_start_column(a3);
        end_line = cmark_node_get_end_line(a3);
        end_column = cmark_node_get_end_column(a3);
        snprintf(__str, 0x64uLL, " data-sourcepos=\"%d:%d-%d:%d\"", start_line, start_column, end_line, end_column);
        cmark_strbuf_puts((_DWORD *)v8, __str);
      }
      cmark_strbuf_putc(v8, 62);
      v15 = *(_BYTE *)(a2 + 32) & 0xFE;
LABEL_43:
      *(_BYTE *)(a2 + 32) = v15;
      return;
    }
    if ((*(_BYTE *)(a2 + 32) & 1) != 0)
    {
      v18 = *(int *)(v8 + 20);
      if ((_DWORD)v18 && *(_BYTE *)(v18 + *(_QWORD *)(v8 + 8) - 1) != 10)
        cmark_strbuf_putc(*(_QWORD *)a2, 10);
      cmark_strbuf_puts((_DWORD *)v8, "</tbody>");
      v19 = *(int *)(v8 + 20);
      if ((_DWORD)v19 && *(_BYTE *)(v19 + *(_QWORD *)(v8 + 8) - 1) != 10)
        cmark_strbuf_putc(v8, 10);
    }
    *(_BYTE *)(a2 + 32) &= ~1u;
    v20 = *(int *)(v8 + 20);
    if ((_DWORD)v20 && *(_BYTE *)(v20 + *(_QWORD *)(v8 + 8) - 1) != 10)
      cmark_strbuf_putc(v8, 10);
    cmark_strbuf_puts((_DWORD *)v8, "</table>");
    v21 = *(int *)(v8 + 20);
    if ((_DWORD)v21 && *(_BYTE *)(v21 + *(_QWORD *)(v8 + 8) - 1) != 10)
      cmark_strbuf_putc(v8, 10);
    return;
  }
  if (CMARK_NODE_TABLE_ROW != v9)
  {
    if (CMARK_NODE_TABLE_CELL != v9)
      html_render_cold_1();
    v22 = *(unsigned int **)(a3 + 144);
    if (v22)
    {
      v24 = *v22;
      v23 = v22[1];
      if (!*v22)
        return;
    }
    else
    {
      v24 = 1;
      v23 = 1;
    }
    if (!v23)
      return;
    if (a4 != 2)
    {
      if ((*(_BYTE *)(a2 + 32) & 2) != 0)
        v31 = "</th>";
      else
        v31 = "</td>";
      cmark_strbuf_puts((_DWORD *)v8, v31);
      return;
    }
    v26 = *(int *)(v8 + 20);
    if ((_DWORD)v26 && *(_BYTE *)(v26 + *(_QWORD *)(v8 + 8) - 1) != 10)
      cmark_strbuf_putc(*(_QWORD *)a2, 10);
    if ((*(_BYTE *)(a2 + 32) & 2) != 0)
      v27 = "<th";
    else
      v27 = "<td";
    cmark_strbuf_puts((_DWORD *)v8, v27);
    if (CMARK_NODE_TABLE_CELL == *(unsigned __int16 *)(a3 + 100))
    {
      v28 = *(_QWORD *)(a3 + 144);
      if (v28)
      {
        v29 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 40) + 40) + 144) + 8)
                                 + *(int *)(v28 + 8));
        switch(v29)
        {
          case 'r':
            v30 = "right";
            goto LABEL_76;
          case 'l':
            v30 = "left";
            goto LABEL_76;
          case 'c':
            v30 = "center";
LABEL_76:
            html_table_add_align((_DWORD *)v8, v30, a5);
            break;
        }
      }
    }
    if (v24 >= 2)
    {
      snprintf(__str, 0x20uLL, "%d", v24);
      cmark_strbuf_puts((_DWORD *)v8, " colspan=\"");
      cmark_strbuf_puts((_DWORD *)v8, __str);
      cmark_strbuf_puts((_DWORD *)v8, "\"");
    }
    if (v23 < 2)
      goto LABEL_68;
    snprintf(__str, 0x20uLL, "%d", v23);
    cmark_strbuf_puts((_DWORD *)v8, " rowspan=\"");
    cmark_strbuf_puts((_DWORD *)v8, __str);
    v33 = "\"";
LABEL_67:
    cmark_strbuf_puts((_DWORD *)v8, v33);
LABEL_68:
    if ((a5 & 2) != 0)
    {
      v34 = cmark_node_get_start_line(a3);
      v35 = cmark_node_get_start_column(a3);
      v36 = cmark_node_get_end_line(a3);
      v37 = cmark_node_get_end_column(a3);
      snprintf(__str, 0x64uLL, " data-sourcepos=\"%d:%d-%d:%d\"", v34, v35, v36, v37);
      cmark_strbuf_puts((_DWORD *)v8, __str);
    }
    cmark_strbuf_putc(v8, 62);
    return;
  }
  v16 = *(int *)(v8 + 20);
  if (a4 == 2)
  {
    if ((_DWORD)v16 && *(_BYTE *)(v16 + *(_QWORD *)(v8 + 8) - 1) != 10)
      cmark_strbuf_putc(*(_QWORD *)a2, 10);
    if (**(_BYTE **)(a3 + 144))
    {
      *(_BYTE *)(a2 + 32) |= 2u;
      cmark_strbuf_puts((_DWORD *)v8, "<thead>");
      v17 = *(int *)(v8 + 20);
      if ((_DWORD)v17 && *(_BYTE *)(v17 + *(_QWORD *)(v8 + 8) - 1) != 10)
        cmark_strbuf_putc(v8, 10);
    }
    else if ((*(_BYTE *)(a2 + 32) & 1) == 0)
    {
      cmark_strbuf_puts((_DWORD *)v8, "<tbody>");
      v32 = *(int *)(v8 + 20);
      if ((_DWORD)v32 && *(_BYTE *)(v32 + *(_QWORD *)(v8 + 8) - 1) != 10)
        cmark_strbuf_putc(v8, 10);
      *(_BYTE *)(a2 + 32) |= 1u;
    }
    v33 = "<tr";
    goto LABEL_67;
  }
  if ((_DWORD)v16 && *(_BYTE *)(v16 + *(_QWORD *)(v8 + 8) - 1) != 10)
    cmark_strbuf_putc(*(_QWORD *)a2, 10);
  cmark_strbuf_puts((_DWORD *)v8, "</tr>");
  if (**(_BYTE **)(a3 + 144))
  {
    v25 = *(int *)(v8 + 20);
    if ((_DWORD)v25 && *(_BYTE *)(v25 + *(_QWORD *)(v8 + 8) - 1) != 10)
      cmark_strbuf_putc(v8, 10);
    cmark_strbuf_puts((_DWORD *)v8, "</thead>");
    v15 = *(_BYTE *)(a2 + 32) & 0xFD;
    goto LABEL_43;
  }
}

void opaque_alloc(uint64_t a1, uint64_t (**a2)(uint64_t, uint64_t), uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = *(unsigned __int16 *)(a3 + 100);
  if (CMARK_NODE_TABLE == v3)
  {
    v4 = 24;
  }
  else if (CMARK_NODE_TABLE_ROW == v3)
  {
    v4 = 1;
  }
  else
  {
    if (CMARK_NODE_TABLE_CELL != v3)
      return;
    v4 = 12;
  }
  *(_QWORD *)(a3 + 144) = (*a2)(1, v4);
}

uint64_t opaque_free(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t (**v5)(uint64_t);
  uint64_t result;

  v3 = *(unsigned __int16 *)(a3 + 100);
  if (CMARK_NODE_TABLE == v3)
  {
    v4 = *(_QWORD *)(a3 + 144);
    v5 = (uint64_t (**)(uint64_t))(a2 + 16);
    (*(void (**)(_QWORD))(a2 + 16))(*(_QWORD *)(v4 + 8));
    return (*v5)(v4);
  }
  else if (CMARK_NODE_TABLE_ROW == v3 || CMARK_NODE_TABLE_CELL == v3)
  {
    return (*(uint64_t (**)(_QWORD))(a2 + 16))(*(_QWORD *)(a3 + 144));
  }
  return result;
}

BOOL escape(uint64_t a1, uint64_t a2, int a3)
{
  int v3;

  v3 = *(unsigned __int16 *)(a2 + 100);
  return CMARK_NODE_TABLE != v3 && CMARK_NODE_TABLE_ROW != v3 && CMARK_NODE_TABLE_CELL != v3 && a3 == 124;
}

uint64_t cmark_gfm_extensions_get_table_columns(uint64_t a1)
{
  if (CMARK_NODE_TABLE == *(unsigned __int16 *)(a1 + 100))
    return **(unsigned __int16 **)(a1 + 144);
  else
    return 0;
}

uint64_t cmark_gfm_extensions_get_table_alignments(uint64_t a1)
{
  if (CMARK_NODE_TABLE == *(unsigned __int16 *)(a1 + 100))
    return *(_QWORD *)(*(_QWORD *)(a1 + 144) + 8);
  else
    return 0;
}

uint64_t cmark_gfm_extensions_set_table_columns(uint64_t result, __int16 a2)
{
  if (result)
  {
    if (CMARK_NODE_TABLE == *(unsigned __int16 *)(result + 100))
    {
      **(_WORD **)(result + 144) = a2;
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t cmark_gfm_extensions_set_table_alignments(uint64_t a1, unsigned int a2, const void *a3)
{
  size_t v5;
  void *v6;

  v5 = a2;
  v6 = (void *)(**(uint64_t (***)(uint64_t, _QWORD))a1)(1, a2);
  memcpy(v6, a3, v5);
  if (CMARK_NODE_TABLE != *(unsigned __int16 *)(a1 + 100))
    return 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) = v6;
  return 1;
}

uint64_t cmark_gfm_extensions_get_table_row_is_header(uint64_t result)
{
  if (result)
  {
    if (CMARK_NODE_TABLE_ROW == *(unsigned __int16 *)(result + 100))
      return **(unsigned __int8 **)(result + 144);
    else
      return 0;
  }
  return result;
}

uint64_t cmark_gfm_extensions_set_table_row_is_header(uint64_t result, int a2)
{
  if (result)
  {
    if (CMARK_NODE_TABLE_ROW == *(unsigned __int16 *)(result + 100))
    {
      **(_BYTE **)(result + 144) = a2 != 0;
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t cmark_gfm_extensions_get_table_cell_colspan(uint64_t a1)
{
  unsigned int *v1;

  if (!a1 || CMARK_NODE_TABLE_CELL != *(unsigned __int16 *)(a1 + 100))
    return 0xFFFFFFFFLL;
  v1 = *(unsigned int **)(a1 + 144);
  if (v1)
    return *v1;
  else
    return 1;
}

uint64_t cmark_gfm_extensions_get_table_cell_rowspan(uint64_t a1)
{
  uint64_t v1;

  if (!a1 || CMARK_NODE_TABLE_CELL != *(unsigned __int16 *)(a1 + 100))
    return 0xFFFFFFFFLL;
  v1 = *(_QWORD *)(a1 + 144);
  if (v1)
    return *(unsigned int *)(v1 + 4);
  else
    return 1;
}

uint64_t cmark_gfm_extensions_set_table_cell_colspan(uint64_t result, int a2)
{
  _DWORD *v2;

  if (result)
  {
    if (CMARK_NODE_TABLE_CELL == *(unsigned __int16 *)(result + 100) && (v2 = *(_DWORD **)(result + 144)) != 0)
    {
      *v2 = a2;
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t cmark_gfm_extensions_set_table_cell_rowspan(uint64_t result, int a2)
{
  uint64_t v2;

  if (result)
  {
    if (CMARK_NODE_TABLE_CELL == *(unsigned __int16 *)(result + 100) && (v2 = *(_QWORD *)(result + 144)) != 0)
    {
      *(_DWORD *)(v2 + 4) = a2;
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

unsigned __int16 *row_from_string(uint64_t *a1, uint64_t a2, int a3)
{
  uint64_t *v5;
  unsigned __int16 *v6;
  int v7;
  int v8;
  int v9;
  int v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  _DWORD *v16;
  int v17;
  int v18;
  unsigned __int8 *v19;
  int v20;
  int v21;
  int v22;
  _QWORD *v23;
  _DWORD *v24;
  uint64_t v25;
  _DWORD **v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  int v32;
  int v33;
  uint64_t v34;
  uint64_t *v36;
  int v37;
  uint64_t *v38;

  v5 = a1;
  v6 = (unsigned __int16 *)(*(uint64_t (**)(uint64_t, uint64_t))*a1)(1, 16);
  *v6 = 0;
  *((_QWORD *)v6 + 1) = 0;
  v7 = _ext_scan_at((uint64_t (*)(uint64_t))_scan_table_cell_end, a2, a3, 0);
  v38 = v5;
  if (v7 >= a3)
  {
LABEL_43:
    v33 = 0;
    goto LABEL_46;
  }
  while (1)
  {
    v8 = _ext_scan_at((uint64_t (*)(uint64_t))_scan_table_cell, a2, a3, v7);
    v9 = v8 + v7;
    v10 = _ext_scan_at((uint64_t (*)(uint64_t))_scan_table_cell_end, a2, a3, v8 + v7);
    if (!(v8 | v10))
    {
LABEL_37:
      v32 = _ext_scan_at((uint64_t (*)(uint64_t))_scan_table_row_end, a2, a3, v7);
      v7 += v32;
      if (!v32 || v7 == a3)
        goto LABEL_43;
      *((_DWORD *)v6 + 1) = v7;
      free_row_cells(*v5, v6);
      v7 += _ext_scan_at((uint64_t (*)(uint64_t))_scan_table_cell_end, a2, a3, v7);
      goto LABEL_40;
    }
    v37 = v10;
    v11 = unescape_pipes((uint64_t (**)(uint64_t, uint64_t))*v5, (const void *)(a2 + v7), v8);
    cmark_strbuf_trim((uint64_t)v11);
    v12 = *v6;
    v13 = v12 + 1;
    if ((((_DWORD)v12 + 1) & v12) != 0)
    {
      v14 = *((_QWORD *)v6 + 1);
    }
    else
    {
      if ((_DWORD)v12 == 0xFFFF)
        break;
      v14 = (*(uint64_t (**)(_QWORD, uint64_t))(*v38 + 8))(*((_QWORD *)v6 + 1), 32 * (2 * v13 - 1));
      *((_QWORD *)v6 + 1) = v14;
    }
    *v6 = v13;
    if (!v14)
      break;
    v15 = v14 + 32 * v12;
    *(_DWORD *)(v15 + 8) = v7;
    v16 = (_DWORD *)(v15 + 8);
    v17 = v9 - 1;
    if (v8 <= 0)
      v17 = v7;
    v16[1] = v17;
    v36 = (uint64_t *)(v14 + 32 * v12);
    *v36 = (uint64_t)v11;
    v16[2] = 0;
    v18 = *((_DWORD *)v6 + 1);
    if (v7 > v18)
    {
      v19 = (unsigned __int8 *)(a2 - 1 + v7);
      v20 = 1;
      v21 = v7;
      do
      {
        v22 = *v19--;
        if (v22 == 124)
          break;
        *v16 = --v21;
        v16[2] = v20++;
      }
      while (v18 != v21);
    }
    v5 = v38;
    v23 = (_QWORD *)(*(uint64_t (**)(uint64_t, uint64_t))*v38)(1, 12);
    v24 = v23;
    v25 = v14 + 32 * v12;
    *(_QWORD *)(v25 + 24) = v23;
    v26 = (_DWORD **)(v25 + 24);
    if ((*((_BYTE *)v38 + 122) & 0x10) == 0)
    {
      *v23 = 0x100000001;
      v27 = v9;
      goto LABEL_35;
    }
    if (!*v6)
      goto LABEL_28;
    if (cmark_strbuf_len(*v36))
    {
      v24 = *v26;
LABEL_28:
      *v24 = 1;
      goto LABEL_29;
    }
    v24 = *v26;
    if (*v16 != v16[1])
      goto LABEL_28;
    *v24 = 0;
    v28 = *v6;
    if (*v6)
    {
      v29 = 0;
      v30 = *((_QWORD *)v6 + 1);
      do
      {
        if (**(_DWORD **)(v30 + 24))
          v29 = v30;
        v30 += 32;
        --v28;
      }
      while (v28);
      v27 = v9;
      if (v29)
        ++**(_DWORD **)(v29 + 24);
      goto LABEL_30;
    }
LABEL_29:
    v27 = v9;
LABEL_30:
    v24[1] = 1;
    if ((*((_BYTE *)v38 + 122) & 0x20) != 0)
      v31 = "\"";
    else
      v31 = "^";
    if (!strcmp(*(const char **)(*v36 + 8), v31))
      v24[1] = 0;
LABEL_35:
    if ((__int16)*v6 == -1)
      goto LABEL_45;
    v7 = v27 + v37;
    if (!v37)
      goto LABEL_37;
LABEL_40:
    if (v7 >= a3)
      goto LABEL_43;
  }
  cmark_strbuf_free((uint64_t)v11);
  (*(void (**)(uint64_t *))(*v38 + 16))(v11);
LABEL_45:
  v33 = 1;
LABEL_46:
  if (v7 != a3 || ((*v6 != 0) & ~v33) == 0)
  {
    v34 = *v38;
    free_row_cells(*v38, v6);
    (*(void (**)(unsigned __int16 *))(v34 + 16))(v6);
    return 0;
  }
  return v6;
}

uint64_t *unescape_pipes(uint64_t (**a1)(uint64_t, uint64_t), const void *a2, int a3)
{
  uint64_t *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  int v10;
  int v11;

  v6 = (uint64_t *)(*a1)(1, 24);
  cmark_strbuf_init((uint64_t)a1, v6, a3 + 1);
  cmark_strbuf_put(v6, a2, a3);
  cmark_strbuf_putc((uint64_t)v6, 0);
  if (a3 < 1)
  {
    v11 = 0;
  }
  else
  {
    v7 = 0;
    v8 = 0;
    do
    {
      v9 = v6[1];
      v10 = *(unsigned __int8 *)(v9 + v8);
      if (v10 == 92)
      {
        if (*(_BYTE *)(v9 + v8 + 1) == 124)
          ++v8;
        LOBYTE(v10) = *(_BYTE *)(v9 + v8);
      }
      v11 = v7 + 1;
      *(_BYTE *)(v9 + v7) = v10;
      ++v8;
      ++v7;
    }
    while (v8 < a3);
  }
  cmark_strbuf_truncate((uint64_t)v6, v11);
  return v6;
}

uint64_t free_row_cells(uint64_t a1, unsigned __int16 *a2)
{
  unsigned __int16 i;
  uint64_t v5;
  unsigned __int16 v6;
  uint64_t *v7;
  uint64_t result;

  for (i = *a2; *a2; i = *a2)
  {
    v5 = *((_QWORD *)a2 + 1);
    v6 = i - 1;
    *a2 = v6;
    v7 = (uint64_t *)(v5 + 32 * v6);
    cmark_strbuf_free(*v7);
    (*(void (**)(uint64_t))(a1 + 16))(*v7);
    if (v7[3])
      (*(void (**)(void))(a1 + 16))();
  }
  result = (*(uint64_t (**)(_QWORD))(a1 + 16))(*((_QWORD *)a2 + 1));
  *((_QWORD *)a2 + 1) = 0;
  return result;
}

_DWORD *html_table_add_align(_DWORD *a1, char *a2, __int16 a3)
{
  char *v5;

  if (a3 < 0)
    v5 = " style=\"text-align: ";
  else
    v5 = " align=\"";
  cmark_strbuf_puts(a1, v5);
  cmark_strbuf_puts(a1, a2);
  return cmark_strbuf_puts(a1, "\"");
}

uint64_t cmark_arena_push()
{
  uint64_t v0;

  pthread_once(&arena_once, (void (*)(void))initialize_arena);
  pthread_mutex_lock(&arena_lock);
  v0 = A;
  if (A)
  {
    *(_BYTE *)(A + 16) = 1;
    A = (uint64_t)alloc_arena_chunk(0x2800uLL, v0);
  }
  return pthread_mutex_unlock(&arena_lock);
}

_QWORD *alloc_arena_chunk(size_t a1, uint64_t a2)
{
  _QWORD *v4;
  _QWORD *v5;
  void *v6;

  v4 = malloc_type_calloc(1uLL, 0x28uLL, 0x10A00400E795F94uLL);
  if (!v4 || (v5 = v4, *v4 = a1, v6 = malloc_type_calloc(1uLL, a1, 0xE98F317CuLL), (v5[3] = v6) == 0))
    abort();
  v5[4] = a2;
  return v5;
}

uint64_t cmark_arena_pop()
{
  uint64_t v0;
  uint64_t v1;

  pthread_once(&arena_once, (void (*)(void))initialize_arena);
  pthread_mutex_lock(&arena_lock);
  v0 = A;
  if (A)
  {
    while (!*(_BYTE *)(v0 + 16))
    {
      free(*(void **)(v0 + 24));
      v1 = *(_QWORD *)(v0 + 32);
      free((void *)v0);
      A = v1;
      v0 = v1;
      if (!v1)
        goto LABEL_6;
    }
    *(_BYTE *)(v0 + 16) = 0;
LABEL_6:
    v0 = 1;
  }
  pthread_mutex_unlock(&arena_lock);
  return v0;
}

uint64_t cmark_arena_reset()
{
  uint64_t v0;
  uint64_t v1;

  pthread_once(&arena_once, (void (*)(void))initialize_arena);
  pthread_mutex_lock(&arena_lock);
  v0 = A;
  if (A)
  {
    do
    {
      free(*(void **)(v0 + 24));
      v1 = *(_QWORD *)(v0 + 32);
      free((void *)v0);
      A = v1;
      v0 = v1;
    }
    while (v1);
  }
  return pthread_mutex_unlock(&arena_lock);
}

_QWORD *arena_calloc(uint64_t a1, uint64_t a2)
{
  size_t v4;
  _QWORD *v5;
  unint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  if (!A)
    init_arena();
  v4 = (a2 * a1 + 15) & 0xFFFFFFFFFFFFFFF8;
  pthread_once(&arena_once, (void (*)(void))initialize_arena);
  pthread_mutex_lock(&arena_lock);
  v5 = (_QWORD *)A;
  v6 = *(_QWORD *)A;
  if (v4 <= *(_QWORD *)A)
  {
    if (v4 > v6 - *(_QWORD *)(A + 8))
    {
      v5 = alloc_arena_chunk(v6 + (v6 >> 1), A);
      A = (uint64_t)v5;
    }
  }
  else
  {
    v5 = alloc_arena_chunk(v4, *(_QWORD *)(A + 32));
    *(_QWORD *)(A + 32) = v5;
  }
  v7 = v5[1];
  v8 = (_QWORD *)(v5[3] + v7);
  v5[1] = v7 + v4;
  *v8 = v4 - 8;
  pthread_mutex_unlock(&arena_lock);
  return v8 + 1;
}

_QWORD *arena_realloc(const void *a1, uint64_t a2)
{
  _QWORD *v4;
  _QWORD *v5;

  if (!A)
    init_arena();
  v4 = arena_calloc(1, a2);
  v5 = v4;
  if (a1)
    memcpy(v4, a1, *((_QWORD *)a1 - 1));
  return v5;
}

uint64_t (**cmark_get_arena_mem_allocator())()
{
  return &CMARK_ARENA_MEM_ALLOCATOR;
}

uint64_t initialize_arena()
{
  return pthread_mutex_init(&arena_lock, 0);
}

uint64_t init_arena()
{
  pthread_once(&arena_once, (void (*)(void))initialize_arena);
  pthread_mutex_lock(&arena_lock);
  A = (uint64_t)alloc_arena_chunk(0x400000uLL, 0);
  return pthread_mutex_unlock(&arena_lock);
}

void filter(void)
{
  _BYTE *v0;
  unint64_t v1;
  unint64_t v2;
  _BYTE *v3;
  char **v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  BOOL v9;
  int v10;
  const char *v11;

  v2 = v1;
  v3 = v0;
  v4 = blacklist;
  v5 = "title";
  do
  {
    if (v2 >= 3 && *v3 == 60)
    {
      v6 = 0;
      v7 = v3[1] == 47 ? 2 : 1;
      while (v5[v6])
      {
        v8 = v5[v6];
        v9 = __tolower(v3[v7 + v6]) != v8 || ~v7 + v2 == v6;
        ++v6;
        if (v9)
          goto LABEL_20;
      }
      if (v2 - v7 != v6)
      {
        if (cmark_isspace(v3[v7 + v6]))
          return;
        v10 = v3[v7 + v6];
        if (v10 == 47)
        {
          if (v7 + v6 + 2 > v2)
            goto LABEL_20;
          v10 = v3[v7 + 1 + v6];
        }
        if (v10 == 62)
          return;
      }
    }
LABEL_20:
    v11 = v4[1];
    ++v4;
    v5 = v11;
  }
  while (v11);
}

void cmark_utf8proc_encode_char_cold_1()
{
  __assert_rtn("cmark_utf8proc_encode_char", "utf8.c", 193, "uc >= 0");
}

void S_render_node_cold_1()
{
  __assert_rtn("S_render_node", "commonmark.c", 507, "false");
}

void xcalloc_cold_1()
{
  fwrite("[cmark] calloc returned null pointer, aborting\n", 0x2FuLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
  abort();
}

void xrealloc_cold_1()
{
  fwrite("[cmark] realloc returned null pointer, aborting\n", 0x30uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
  abort();
}

void cmark_render_html_with_mem_cold_1()
{
  __assert_rtn("S_render_node", "html.c", 474, "false");
}

void S_render_node_cold_1_0()
{
  __assert_rtn("S_render_node", "man.c", 265, "false");
}

void cmark_syntax_extension_add_node_cold_1()
{
  __assert_rtn("cmark_syntax_extension_add_node", "syntax_extension.c", 38, "false");
}

void postprocess_cold_1()
{
  __assert_rtn("postprocess_text", "autolink.c", 455, "!text->as.literal.alloc");
}

void postprocess_cold_2()
{
  __assert_rtn("postprocess_text", "autolink.c", 384, "data[start + offset + max_rewind] == '@'");
}

void cmark_iter_next_cold_1()
{
  __assert_rtn("cmark_iter_next", "iterator.c", 72, "false");
}

void S_render_node_cold_1_1()
{
  __assert_rtn("S_render_node", "latex.c", 456, "false");
}

void cmark_footnote_create_cold_1()
{
  __assert_rtn("cmark_footnote_create", "footnotes.c", 26, "map->sorted == NULL");
}

void normalize_map_label_cold_1()
{
  __assert_rtn("normalize_map_label", "map.c", 24, "result");
}

void cmark_strbuf_grow_cold_1()
{
  __assert_rtn("cmark_strbuf_grow", "buffer.c", 39, "target_size > 0");
}

void cmark_strbuf_grow_cold_2()
{
  fprintf((FILE *)*MEMORY[0x24BDAC8D8], "[cmark] cmark_strbuf_grow requests buffer with size > %d, aborting\n", 0x3FFFFFFF);
  abort();
}

void cmark_strbuf_copy_cstr_cold_1()
{
  __assert_rtn("cmark_strbuf_copy_cstr", "buffer.c", 126, "buf");
}

void cmark_reference_create_cold_1()
{
  __assert_rtn("cmark_reference_create", "references.c", 28, "map->sorted == NULL");
}

void cmark_reference_create_attributes_cold_1()
{
  __assert_rtn("cmark_reference_create_attributes", "references.c", 53, "map->sorted == NULL");
}

void S_process_line_cold_1()
{
  __assert_rtn("cmark_chunk_rtrim", "chunk.h", 39, "!c->alloc");
}

void S_process_line_cold_3()
{
  __assert_rtn("add_text_to_container", "blocks.c", 1454, "parser->current != NULL");
}

void S_process_line_cold_4()
{
  __assert_rtn("add_text_to_container", "blocks.c", 1412, "parser->current != NULL");
}

void S_process_line_cold_5()
{
  __assert_rtn("parse_html_block_prefix", "blocks.c", 1037, "html_block_type >= 1 && html_block_type <= 7");
}

void add_child_cold_1()
{
  __assert_rtn("add_child", "blocks.c", 422, "parent");
}

void finalize_cold_1()
{
  __assert_rtn("finalize", "blocks.c", 317, "b->flags & CMARK_NODE__OPEN");
}

void finalize_cold_2()
{
  __assert_rtn("finalize", "blocks.c", 362, "pos < node_content->size");
}

void add_line_cold_1()
{
  __assert_rtn("add_line", "blocks.c", 234, "node->flags & CMARK_NODE__OPEN");
}

void cmark_register_node_flag_cold_1()
{
  fwrite("too many flags in cmark_register_node_flag\n", 0x2BuLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
  abort();
}

void cmark_register_node_flag_cold_2()
{
  fwrite("flag initialization error in cmark_register_node_flag\n", 0x36uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
  abort();
}

void cmark_clean_url_cold_2()
{
  __assert_rtn("cmark_chunk_ltrim", "chunk.h", 30, "!c->alloc");
}

void cmark_parse_inlines_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0("peek_char_n", "inlines.c", a3, "!(subj->pos + n < subj->input.len && subj->input.data[subj->pos + n] == 0)");
}

void remove_delimiter_cold_1()
{
  __assert_rtn("remove_delimiter", "inlines.c", 522, "delim == subj->last_delim");
}

void S_render_node_cold_1_2()
{
  __assert_rtn("S_render_node", "plaintext.c", 204, "false");
}

void commonmark_render_cold_1()
{
  __assert_rtn("commonmark_render", "table.c", 763, "false");
}

void latex_render_cold_1()
{
  __assert_rtn("latex_render", "table.c", 819, "false");
}

void man_render_cold_1()
{
  __assert_rtn("man_render", "table.c", 905, "false");
}

void html_render_cold_1()
{
  __assert_rtn("html_render", "table.c", 1027, "false");
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t __memset_chk()
{
  return MEMORY[0x24BDAC858]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x24BDAC930](*(_QWORD *)&a1);
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

void *__cdecl bsearch(const void *__key, const void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  return (void *)MEMORY[0x24BDAD310](__key, __base, __nel, __width, __compar);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE448](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
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

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x24BDAF8C8](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x24BDAF910](a1, a2);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  MEMORY[0x24BDAFA18](__base, __nel, __width, __compar);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x24BDAFEE8](__s, *(_QWORD *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x24BDAFF00](__dst, __src);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x24BDAFF50](a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

