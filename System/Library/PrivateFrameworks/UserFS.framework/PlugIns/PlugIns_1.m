uint64_t bt_remove_internal(uint64_t a1, uint64_t a2, int a3, unint64_t *a4, unsigned int a5, void *a6, unsigned int *a7, void *a8, unsigned int *a9, uint64_t a10)
{
  uint64_t v18;
  _QWORD *v19;
  size_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  void *v30;
  uint64_t v31;
  BOOL v32;
  BOOL *v33;
  uint64_t v34;
  __int16 v35;
  __int16 v36;
  __int16 v37;
  __int16 v38;
  uint64_t v39;
  unsigned __int16 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  BOOL v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  int v54;
  uint64_t v55;
  __int128 *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unsigned int v63;
  unsigned int *v64;
  unsigned int v65;
  size_t v66;
  uint64_t v67;
  unsigned int v68;
  unsigned int v69;
  unsigned int *v70;
  unsigned int v71;
  size_t v72;
  uint64_t v73;
  unint64_t *v74;
  unint64_t v75;
  BOOL v76;
  int is_underused;
  uint64_t v78;
  int v79;
  uint64_t v80;
  __int128 v81;
  uint64_t v82;
  _BOOL4 v83;
  uint64_t v84;
  uint64_t v85;
  _BOOL4 v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t *v90;
  uint64_t v91;
  uint64_t v92;
  unsigned int v93;
  int v94;
  int v95;
  uint64_t v96;
  _BOOL4 v97;
  NSObject *v98;
  __int16 v99;
  uint64_t v100;
  uint64_t v101;
  _BOOL4 v102;
  uint64_t v103;
  unint64_t *v104;
  unsigned __int16 v105;
  unsigned __int16 v106;
  unint64_t *v107;
  uint64_t v108;
  uint64_t v109;
  unsigned int *v110;
  unsigned int *v111;
  BOOL *v112;
  _WORD *v113;
  BOOL *v114;
  _WORD *v115;
  int v116;
  int v117;
  void *v118;
  uint64_t *v119;
  void *v120;
  __int128 *v121;
  __int128 *v122;
  _WORD *v123;
  int v124;
  uint64_t v125;
  unint64_t *v126;
  uint64_t v127;
  __int128 v128;
  uint64_t v129;
  BOOL *v130;
  __int16 v131;
  unsigned __int16 v132;
  unsigned __int16 v133;
  unsigned __int16 v134;
  unsigned __int16 v135;
  unsigned __int16 v136;
  const void *v137[3];
  uint64_t v138;
  _BYTE buf[12];
  __int16 v140;
  int v141;
  __int16 v142;
  uint64_t v143;
  __int16 v144;
  int v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  uint64_t v149;

  v149 = *MEMORY[0x24BDAC8D0];
  v147 = 0u;
  v148 = 0u;
  v146 = 0u;
  v138 = 0;
  MEMORY[0x24BDAC7A8]();
  v19 = (uint64_t *)((char *)&v109 - v18);
  bzero((char *)&v109 - v18, v20);
  memset(v137, 170, sizeof(v137));
  v136 = a5;
  v135 = -21846;
  v134 = -21846;
  v133 = -21846;
  if (!*(_QWORD *)(a1 + 416))
    return 22;
  v21 = *(_QWORD *)(a1 + 400);
  v22 = (v21 >> 9) & 0x3FFF;
  if (!v22)
  {
    if (((unsigned __int16)((((v21 >> 27) & 0xF000) - 160) & 0xFFE0) >> 2) - 72 >= a5)
      goto LABEL_4;
    return 22;
  }
  if ((_DWORD)v22 != a5)
    return 22;
LABEL_4:
  v124 = *(unsigned __int16 *)(*(_QWORD *)(a1 + 392) + 16);
  v120 = a8;
  v129 = a2;
  obj_lock(a1, 2);
  v23 = obj_modify(a1, (*(_DWORD *)(a1 + 400) >> 3) & 2, a10);
  if ((_DWORD)v23)
  {
    v24 = v23;
    obj_unlock(a1, 2);
    return v24;
  }
  v118 = a6;
  v127 = a10;
  v119 = &v109;
  *(_QWORD *)&v146 = a1;
  obj_retain((char *)a1);
  v26 = btri_search_node(v146, a3, 1, a4, &v136, (unsigned __int16)a5, (_WORD *)&v146 + 4, (BOOL *)((unint64_t)&v146 | 0xA));
  if ((_DWORD)v26)
  {
LABEL_10:
    v24 = v26;
    v27 = 0;
    v28 = 0;
    goto LABEL_107;
  }
  v130 = (BOOL *)((unint64_t)&v146 | 0xA);
  v123 = (_WORD *)&v146 + 4;
  v27 = 0;
  v125 = 0;
  v117 = 0;
  v29 = 0;
  v110 = a9;
  v121 = &v147;
  v115 = (_WORD *)&v147 + 4;
  v116 = (v124 + 7) & 0x1FFF8;
  v122 = &v148;
  v113 = (_WORD *)&v148 + 4;
  v114 = (BOOL *)&v147 + 10;
  v112 = (BOOL *)&v148 + 10;
  v126 = a4;
  v111 = a7;
  v30 = v118;
  while (1)
  {
    if ((v29 & 1) != 0)
    {
      LODWORD(v128) = 1;
      v31 = v147;
    }
    else
    {
      v31 = v147;
      if (BYTE10(v146))
        v32 = WORD4(v146) == 0;
      else
        v32 = 0;
      if (v32)
      {
        v117 = WORD4(v147);
        LODWORD(v128) = 1;
        v27 = v146;
        v125 = v147;
      }
      else
      {
        LODWORD(v128) = 0;
      }
    }
    v33 = v130;
    if (!v31 || (*(_DWORD *)(a1 + 400) & 0x7FFE00) != 0)
      goto LABEL_92;
    *(_QWORD *)buf = 0;
    if (BYTE10(v146))
    {
      v34 = btree_node_key_ptr(v31, WORD4(v147), &v137[2], &v133);
      if ((_DWORD)v34)
        goto LABEL_104;
      v35 = v124;
      if ((*(_QWORD *)(v147 + 400) & 0x40) == 0)
        v35 = v116;
      v36 = v133;
      if ((*(_QWORD *)(v147 + 400) & 0x40) == 0)
        v36 = (v133 + 7) & 0xFFF8;
      v37 = v35 - v36;
      if (v37 < 0)
        v38 = 0;
      else
        v38 = v37;
    }
    else
    {
      v38 = 0;
    }
    v132 = btree_node_largest_key_len(v146);
    v39 = v147;
    v131 = (*(_WORD *)(v146 + 406) & 0x7F) + 8;
    if (btree_node_has_room(v147, 1u, (__int16 *)&v132, &v131, v38, 0, 0))
    {
      a4 = v126;
LABEL_34:
      v33 = v130;
      goto LABEL_92;
    }
    v40 = WORD4(v147);
    if (!BYTE10(v147))
      v40 = WORD4(v147) + 1;
    v41 = v136;
    v34 = bt_shift_or_split(a1, v148, WORD4(v148), v39, v40, v126);
    if ((_DWORD)v34)
    {
LABEL_104:
      v24 = v34;
      goto LABEL_105;
    }
    v42 = *(_QWORD *)buf;
    v33 = v130;
    if (!*(_QWORD *)buf)
    {
      a4 = v126;
      goto LABEL_92;
    }
    v43 = v147;
    v109 = v147;
    if ((_QWORD)v148)
    {
      ++WORD4(v148);
      if (!(_QWORD)v147)
      {
        v47 = 0;
        goto LABEL_56;
      }
      if (v125 == (_QWORD)v147 || (_QWORD)v147 == v27)
      {
        v47 = v147;
        goto LABEL_56;
      }
      v44 = v147;
      obj_unlock(v147, 2);
      obj_release(v44);
      goto LABEL_55;
    }
    *(_QWORD *)&v148 = v147;
    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)buf + 56) + 36))
    {
      v34 = btree_node_key_ptr(*(uint64_t *)buf, 0, &v137[2], &v133);
      if ((_DWORD)v34)
        goto LABEL_104;
      v43 = v148;
      v45 = (unint64_t *)v137[2];
      v46 = v133;
LABEL_54:
      v24 = bt_search_node(v43, v45, v46, v113, v112);
      if ((_DWORD)v24)
        goto LABEL_105;
LABEL_55:
      v47 = 0;
      goto LABEL_56;
    }
    if ((a3 & 1) == 0)
    {
      v45 = v126;
      v46 = v41;
      goto LABEL_54;
    }
    if (!*(_DWORD *)(*(_QWORD *)(v147 + 56) + 36))
      goto LABEL_147;
    v47 = 0;
    WORD4(v148) = 0;
    BYTE10(v148) = 1;
LABEL_56:
    v48 = v125 != (_QWORD)v148 || v125 == 0;
    v49 = v117;
    if (!v48)
      v49 = WORD4(v148);
    v117 = v49;
    *(_QWORD *)&v147 = v42;
    if (a3)
    {
      if (!*(_DWORD *)(*(_QWORD *)(v42 + 56) + 36))
      {
LABEL_147:
        v24 = 2;
LABEL_105:
        v138 = v27;
        goto LABEL_106;
      }
      WORD4(v147) = 0;
      BYTE10(v147) = 1;
    }
    else
    {
      v34 = bt_search_node(v42, v126, v41, v115, v114);
      if ((_DWORD)v34)
        goto LABEL_104;
    }
    v50 = v146;
    obj_unlock(v146, 2);
    obj_release(v50);
    *(_QWORD *)&v146 = 0;
    v34 = btree_node_child_val(v147, WORD4(v147), v19);
    if ((_DWORD)v34)
      goto LABEL_104;
    v34 = btree_node_get((_QWORD *)a1, v19, v129, 3, *(_WORD *)(*(_QWORD *)(v147 + 56) + 34) - 1, v127, (uint64_t *)&v146);
    if ((_DWORD)v34)
      goto LABEL_104;
    v51 = v146;
    if ((*(_BYTE *)(a1 + 400) & 0x10) != 0)
    {
      a4 = v126;
      if (*(_QWORD *)(v146 + 112) != *v19)
      {
        btree_node_child_id_update(v147, WORD4(v147), (unint64_t *)(v146 + 112), v127);
        v51 = v146;
      }
    }
    else
    {
      a4 = v126;
    }
    v34 = btri_search_node(v51, a3, 1, a4, &v136, (unsigned __int16)a5, v123, v130);
    if ((_DWORD)v34)
      goto LABEL_104;
    if (v125 == v109)
    {
      v54 = WORD4(v147);
      v52 = v47;
      if (v125 == a1 && !WORD4(v147))
      {
        v27 = v147;
        v125 = a1;
        v33 = v130;
        v30 = v118;
        goto LABEL_92;
      }
      v53 = v128;
      v30 = v118;
      if (!WORD4(v147))
      {
        v117 = WORD4(v148);
        goto LABEL_83;
      }
      goto LABEL_87;
    }
    v52 = v47;
    if ((v128 & 1) != 0)
    {
      v53 = 1;
      v30 = v118;
      goto LABEL_88;
    }
    v54 = WORD4(v147);
    v30 = v118;
    if (BYTE10(v147) && !WORD4(v147))
    {
      v117 = WORD4(v148);
      v53 = 1;
LABEL_83:
      v125 = v148;
      v27 = v147;
      goto LABEL_88;
    }
    v53 = 0;
    if (BYTE10(v146) && !WORD4(v146))
    {
      v53 = 1;
LABEL_87:
      v125 = v147;
      v27 = v146;
      v117 = v54;
    }
LABEL_88:
    LODWORD(v128) = v53;
    if (!v52)
      goto LABEL_34;
    v33 = v130;
    if (v52 != v125 && v52 != v27)
    {
      obj_unlock(v52, 2);
      obj_release(v52);
      goto LABEL_34;
    }
LABEL_92:
    if ((*(_WORD *)(*(_QWORD *)(v146 + 56) + 32) & 2) != 0)
      break;
    v55 = v148;
    if ((_QWORD)v148 && (_QWORD)v148 != v125 && (_QWORD)v148 != v27)
    {
      obj_unlock(v148, 2);
      obj_release(v55);
    }
    v56 = v121;
    *v122 = *v121;
    *v56 = v146;
    *(_QWORD *)&v146 = 0;
    v34 = btree_node_child_val(v147, WORD4(v147), v19);
    if (!(_DWORD)v34)
    {
      v34 = btree_node_get((_QWORD *)a1, v19, v129, 3, *(_WORD *)(*(_QWORD *)(v147 + 56) + 34) - 1, v127, (uint64_t *)&v146);
      if (!(_DWORD)v34)
      {
        v57 = v146;
        if ((*(_BYTE *)(a1 + 400) & 0x10) != 0)
        {
          a4 = v126;
          if (*(_QWORD *)(v146 + 112) != *v19)
          {
            btree_node_child_id_update(v147, WORD4(v147), (unint64_t *)(v146 + 112), v127);
            v57 = v146;
          }
        }
        else
        {
          a4 = v126;
        }
        v34 = btri_search_node(v57, a3, 1, a4, &v136, (unsigned __int16)a5, v123, v130);
        v29 = v128;
        if (!(_DWORD)v34)
          continue;
      }
    }
    goto LABEL_104;
  }
  v138 = v27;
  v62 = btri_search_node(v146, a3, 1, a4, &v136, (unsigned __int16)a5, v123, v33);
  if ((_DWORD)v62)
    goto LABEL_134;
  if (!BYTE10(v146))
  {
    v24 = 2;
LABEL_106:
    v28 = v125;
    goto LABEL_107;
  }
  if (v30)
  {
    v62 = btree_node_key_ptr(v146, 0, &v137[1], &v135);
    if ((_DWORD)v62)
    {
LABEL_134:
      v24 = v62;
      goto LABEL_106;
    }
    v63 = v135;
    v64 = v111;
    v65 = *v111;
    v66 = *v111 >= v135 ? v135 : v65;
    memcpy(v30, v137[1], v66);
    *v64 = v63;
    if (v65 < v63)
    {
      v24 = 34;
      goto LABEL_106;
    }
  }
  v28 = v125;
  if (v120)
  {
    v67 = btree_node_val_ptr((_QWORD *)v146, 0, v137, (__int16 *)&v134);
    if ((_DWORD)v67)
      goto LABEL_146;
    v68 = v134;
    v69 = v134 == 65534 ? 0 : v134;
    v70 = v110;
    v71 = *v110;
    v72 = *v110 >= v69 ? v69 : v71;
    memcpy(v120, v137[0], v72);
    *v70 = v68;
    if (v71 < v69)
    {
      v24 = 34;
      goto LABEL_107;
    }
  }
  v73 = v127;
  btree_node_remove(v146, WORD4(v146), v127);
  v74 = (unint64_t *)(*(_QWORD *)(a1 + 392) + 24);
  do
    v75 = __ldxr(v74);
  while (__stxr(v75 - 1, v74));
  obj_dirty(a1, v73, 0);
  if (WORD4(v146) || (*(_DWORD *)(*(_QWORD *)(v146 + 56) + 36) ? (v76 = (_QWORD)v147 == 0) : (v76 = 1), v76))
  {
    v24 = 0;
  }
  else
  {
    v84 = btree_node_key_ptr(v146, 0, &v137[2], &v133);
    v24 = v84;
    if ((_DWORD)v84
      || (v24 = btree_node_entry_update(v147, WORD4(v147), (void *)v137[2], v133, 0, 0, v127), (_DWORD)v24))
    {
      v85 = *(_QWORD *)(a1 + 8);
      v86 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v85)
      {
        if (v86)
          bt_remove_internal_cold_6();
      }
      else if (v86)
      {
        bt_remove_internal_cold_5();
      }
    }
    v28 = v125;
  }
  is_underused = btree_node_is_underused(a1, v146);
  v78 = v148;
  v79 = v128;
  if ((_QWORD)v148)
  {
    if ((_QWORD)v148 != v28 && (_QWORD)v148 != v27)
    {
      obj_unlock(v148, 2);
      obj_release(v78);
      v79 = v128;
    }
    *(_QWORD *)&v148 = 0;
  }
  v80 = v147;
  if ((_QWORD)v147)
  {
    if ((_QWORD)v147 != v28 && (_QWORD)v147 != v27)
    {
      obj_unlock(v147, 2);
      obj_release(v80);
      v79 = v128;
    }
    *(_QWORD *)&v147 = 0;
  }
  if (v79 && *(_DWORD *)(*(_QWORD *)(v146 + 56) + 36))
  {
    v67 = btree_node_key_ptr(v146, 0, &v137[2], &v133);
    if ((_DWORD)v67)
    {
LABEL_146:
      v24 = v67;
      goto LABEL_107;
    }
    if (v28)
    {
      v24 = btree_node_entry_update(v125, (unsigned __int16)v117, (void *)v137[2], v133, 0, 0, v127);
      if ((_DWORD)v24)
      {
        v82 = *(_QWORD *)(a1 + 8);
        v83 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v82)
        {
          if (v83)
            bt_remove_internal_cold_4();
        }
        else if (v83)
        {
          bt_remove_internal_cold_3();
        }
      }
      if (v125 != (_QWORD)v148 && v125 != (_QWORD)v147 && v125 != (_QWORD)v146)
      {
        v87 = v125;
        obj_unlock(v125, 2);
        obj_release(v87);
      }
    }
    else
    {
      v24 = 0;
    }
    v88 = v138;
    v89 = v138 + 56;
    v90 = v126;
    if ((*(_WORD *)(*(_QWORD *)(v138 + 56) + 32) & 2) == 0)
    {
      v91 = v136;
      v130 = (BOOL *)v137[2];
      *(_QWORD *)&v81 = 136315906;
      v128 = v81;
      while (1)
      {
        v132 = -21846;
        LOBYTE(v131) = -86;
        v27 = v88;
        v92 = bt_search_node(v88, v90, v91, &v132, (BOOL *)&v131);
        if ((_DWORD)v92)
        {
          v24 = v92;
          goto LABEL_254;
        }
        if (!(_BYTE)v131)
        {
          v24 = 0;
          break;
        }
        if (*(_WORD *)(*(_QWORD *)v89 + 34) == 1)
        {
          v101 = *(_QWORD *)(a1 + 8);
          v102 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          if (v101)
          {
            if (v102)
              bt_remove_internal_cold_2(v101, v27);
          }
          else if (v102)
          {
            bt_remove_internal_cold_1();
          }
          v24 = 0;
          break;
        }
        v93 = v132;
        v94 = btree_node_entry_update(v27, v132, v130, v133, 0, 0, v127);
        if (v94)
        {
          v95 = v94;
          v96 = *(_QWORD *)(a1 + 8);
          v97 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          if (v96)
          {
            if (v97)
            {
              *(_DWORD *)buf = v128;
              *(_QWORD *)&buf[4] = "bt_remove_internal";
              v140 = 1024;
              v141 = 5111;
              v142 = 2080;
              v143 = v96 + 3720;
              v144 = 1024;
              v145 = v95;
              v98 = MEMORY[0x24BDACB70];
LABEL_222:
              _os_log_error_impl(&dword_21F566000, v98, OS_LOG_TYPE_ERROR, "%s:%d: %s btree_node_key_update failed: %d\n", buf, 0x22u);
            }
          }
          else if (v97)
          {
            v100 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 392) + 384) + 208;
            *(_DWORD *)buf = v128;
            *(_QWORD *)&buf[4] = "bt_remove_internal";
            v140 = 1024;
            v141 = 5111;
            v142 = 2080;
            v143 = v100;
            v144 = 1024;
            v145 = v95;
            v98 = MEMORY[0x24BDACB70];
            goto LABEL_222;
          }
        }
        v24 = btree_node_child_val(v27, v93, v19);
        v99 = *(_WORD *)(*(_QWORD *)v89 + 34);
        v138 = 0;
        if (!(_DWORD)v24)
          v24 = btree_node_get((_QWORD *)a1, v19, v129, 3, v99 - 1, v127, &v138);
        v90 = v126;
        if (v27 != (_QWORD)v148 && v27 != (_QWORD)v147 && v27 != (_QWORD)v146)
        {
          obj_unlock(v27, 2);
          obj_release(v27);
        }
        if (!(_DWORD)v24)
        {
          v88 = v138;
          v89 = v138 + 56;
          if ((*(_WORD *)(*(_QWORD *)(v138 + 56) + 32) & 2) == 0)
            continue;
        }
        break;
      }
    }
  }
  else if (v28 && v28 != (_QWORD)v148 && v28 != (_QWORD)v146)
  {
    obj_unlock(v28, 2);
    obj_release(v28);
  }
  v103 = v138;
  if (v138)
  {
    if (v138 != (_QWORD)v148 && v138 != (_QWORD)v147 && v138 != (_QWORD)v146)
    {
      obj_unlock(v138, 2);
      obj_release(v103);
    }
    v138 = 0;
  }
  if (is_underused)
  {
    if (WORD4(v146))
    {
      v104 = 0;
      v105 = 0;
    }
    else if (*(_DWORD *)(*(_QWORD *)(v146 + 56) + 36))
    {
      v26 = btree_node_key_ptr(v146, 0, &v137[2], &v133);
      if ((_DWORD)v26)
        goto LABEL_10;
      v105 = v133;
      v107 = (unint64_t *)_apfs_malloc(v133);
      v104 = v107;
      if (v107)
        memcpy(v107, v137[2], v133);
      v24 = 0;
    }
    else
    {
      v104 = 0;
      v105 = 0;
    }
    if (v104)
    {
      v106 = v105;
    }
    else
    {
      v104 = v126;
      v106 = v136;
    }
  }
  else
  {
    v104 = 0;
    v106 = 0;
  }
  v108 = v146;
  obj_unlock(v146, 2);
  obj_release(v108);
  *(_QWORD *)&v146 = 0;
  if (is_underused)
  {
    bt_merge_up(a1, v129, v104, v106, v127);
    if (v104 != v126)
      _apfs_free(v104, v106);
  }
  v27 = 0;
LABEL_254:
  v28 = 0;
LABEL_107:
  v58 = v148;
  if ((_QWORD)v148)
  {
    if ((_QWORD)v148 != v28 && (_QWORD)v148 != v27)
    {
      obj_unlock(v148, 2);
      obj_release(v58);
    }
    *(_QWORD *)&v148 = 0;
  }
  v60 = v147;
  if ((_QWORD)v147)
  {
    if ((_QWORD)v147 != v28 && (_QWORD)v147 != v27)
    {
      obj_unlock(v147, 2);
      obj_release(v60);
    }
    *(_QWORD *)&v147 = 0;
  }
  v61 = v146;
  if ((_QWORD)v146)
  {
    if ((_QWORD)v146 != v28 && (_QWORD)v146 != v27)
    {
      obj_unlock(v146, 2);
      obj_release(v61);
    }
    *(_QWORD *)&v146 = 0;
  }
  if (v28 && v28 != (_QWORD)v148 && v28 != (_QWORD)v147)
  {
    obj_unlock(v28, 2);
    obj_release(v28);
    v27 = v138;
  }
  if (v27 && v27 != (_QWORD)v148 && v27 != (_QWORD)v147 && v27 != (_QWORD)v146)
  {
    obj_unlock(v27, 2);
    obj_release(v27);
  }
  return v24;
}

uint64_t btri_search_node(uint64_t a1, char a2, int a3, unint64_t *a4, _WORD *a5, unsigned int a6, _WORD *a7, BOOL *a8)
{
  uint64_t v10;
  size_t v12;
  unsigned __int16 v14;
  void *__src;

  if ((a2 & 1) == 0)
    return bt_search_node(a1, a4, (unsigned __int16)*a5, a7, a8);
  if (!*(_DWORD *)(*(_QWORD *)(a1 + 56) + 36))
    return 2;
  v10 = 0;
  *a7 = 0;
  *a8 = 1;
  if (a3)
  {
    __src = (void *)0xAAAAAAAAAAAAAAAALL;
    v14 = -21846;
    v10 = btree_node_key_ptr(a1, 0, &__src, &v14);
    if (!(_DWORD)v10)
    {
      if (v14 >= a6)
        v12 = a6;
      else
        v12 = v14;
      *a5 = v12;
      memcpy(a4, __src, v12);
    }
  }
  return v10;
}

void btree_node_remove(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v6;
  int v7;
  unsigned int v8;
  uint64_t v9;
  unsigned __int16 *v10;
  unsigned __int16 *v11;
  unsigned __int16 *v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int16 v15;
  int v16;
  unsigned __int16 v17;
  _WORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned __int16 *v22;
  unint64_t v23;
  unsigned __int16 v24;
  unsigned __int16 v25;
  int v26;
  unsigned __int16 v27;
  _WORD *v28;
  unsigned int v29;
  __int16 v30;
  unsigned int v31;
  unsigned int v32;
  __int16 v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unsigned __int16 v37;
  int v38;
  __int16 v39;
  unsigned __int16 v40;
  uint64_t v41;

  v6 = *(_QWORD *)(a1 + 56);
  v7 = *(_WORD *)(v6 + 32) & 4;
  if (v7)
    v8 = (*(_DWORD *)(a1 + 400) >> 9) & 0x3FFF;
  else
    v8 = *(unsigned __int16 *)(*(_QWORD *)(a1 + 376) + 8 * a2 + 2);
  if (*(unsigned __int16 *)(a1 + 440) <= v8)
  {
    *(_WORD *)(a1 + 440) = 0;
    v7 = *(_WORD *)(v6 + 32) & 4;
  }
  v9 = *(_QWORD *)(a1 + 376);
  v10 = (unsigned __int16 *)(v9 + 4 * a2);
  v11 = (unsigned __int16 *)(v9 + 8 * a2);
  if (v7)
    v12 = v10;
  else
    v12 = v11;
  v13 = *v12;
  v14 = *(_QWORD *)(a1 + 400);
  if ((v14 & 0x40) != 0)
    v15 = v8;
  else
    v15 = (v8 + 7) & 0xFFF8;
  if (v13 != 0xFFFF)
  {
    v16 = btree_node_key_range_validate(a1, v13, v15);
    v6 = *(_QWORD *)(a1 + 56);
    v14 = *(_QWORD *)(a1 + 400);
    if (!v16)
    {
      v17 = (v15 + 7) & 0xFFF8;
      if ((v14 & 0x40) != 0)
        v17 = v15;
      if (v17 >= 4u)
      {
        v18 = (_WORD *)(*(_QWORD *)(a1 + 384) + v13);
        v18[1] = v17;
        *v18 = *(_WORD *)(v6 + 48);
        *(_WORD *)(v6 + 48) = v13;
      }
      *(_WORD *)(v6 + 50) += v17;
      v14 = *(_QWORD *)(a1 + 400);
    }
  }
  v19 = *(_QWORD *)(a1 + 376);
  v20 = v19 + 4 * a2 + 2;
  v21 = v19 + 8 * a2 + 4;
  if ((*(_WORD *)(v6 + 32) & 4) != 0)
    v22 = (unsigned __int16 *)v20;
  else
    v22 = (unsigned __int16 *)v21;
  v23 = *v22;
  v24 = btree_node_val_len(a1, a2);
  if ((v14 & 0x40) != 0)
    v25 = v24;
  else
    v25 = (v24 + 7) & 0xFFF8;
  if (v23 <= 0xFFFD)
  {
    v26 = btree_node_val_range_validate(a1, v23, v25);
    v6 = *(_QWORD *)(a1 + 56);
    if (!v26)
    {
      if ((*(_BYTE *)(a1 + 400) & 0x40) != 0)
        v27 = v25;
      else
        v27 = (v25 + 7) & 0xFFF8;
      if (v27 >= 4u)
      {
        v28 = (_WORD *)(*(_QWORD *)(a1 + 392) - v23);
        v28[1] = v27;
        *v28 = *(_WORD *)(v6 + 52);
        *(_WORD *)(v6 + 52) = v23;
      }
      *(_WORD *)(v6 + 54) += v27;
    }
  }
  v29 = *(_DWORD *)(v6 + 36) - 1;
  if (v29 > a2)
  {
    btree_node_toc_shift(a1, a2, -1);
    v6 = *(_QWORD *)(a1 + 56);
    v29 = *(_DWORD *)(v6 + 36) - 1;
  }
  *(_DWORD *)(v6 + 36) = v29;
  v30 = *(_WORD *)(v6 + 32);
  if ((v30 & 4) != 0)
  {
    if ((*(_BYTE *)(a1 + 400) & 4) == 0)
      goto LABEL_50;
    v31 = 4;
  }
  else
  {
    v31 = 8;
  }
  v32 = *(unsigned __int16 *)(v6 + 42) / v31;
  if (v32 - v29 >= 0x10)
  {
    if ((v30 & 4) == 0)
    {
      v33 = 8;
LABEL_49:
      v40 = v33 * v31;
      memmove((void *)(*(_QWORD *)(a1 + 384) - (unsigned __int16)(v33 * v31)), *(const void **)(a1 + 384), *(unsigned __int16 *)(v6 + 44));
      *(_QWORD *)(a1 + 384) -= v40;
      v41 = *(_QWORD *)(a1 + 56);
      *(_WORD *)(v41 + 42) -= v40;
      *(_WORD *)(v41 + 46) += v40;
      goto LABEL_50;
    }
    v34 = *(_QWORD *)(a1 + 400);
    if ((v30 & 2) != 0)
      v35 = v34 >> 23;
    else
      LODWORD(v35) = (HIWORD(v34) & 0x7F) + 8;
    v36 = (((v34 >> 27) & 0x1F000) - 56) / (((v34 >> 9) & 0x3FFF) + (unsigned __int16)v35 + 4);
    if (v32 > (v36 & 0xFFFE))
    {
      v37 = v36 & 0xFFFE;
      v38 = v32 - 8;
      v39 = v32 - v37;
      if (v38 >= v37)
        v33 = 8;
      else
        v33 = v39;
      goto LABEL_49;
    }
  }
LABEL_50:
  obj_dirty(a1, a3, 0);
}

uint64_t btree_node_is_underused(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  unsigned int v4;
  __int16 v7;
  __int16 v8;

  v2 = *(_QWORD *)(a2 + 56);
  v3 = *(unsigned __int16 *)(v2 + 32);
  if ((~v3 & 3) == 0)
    return 0;
  v4 = *(_DWORD *)(v2 + 36);
  if (!v4)
    return 1;
  if (*(_QWORD *)(a1 + 432) == *(_QWORD *)(a2 + 112))
    return 0;
  if ((v3 & 4) != 0 && (*(_BYTE *)(a2 + 400) & 4) == 0)
    return v4 < *(unsigned __int16 *)(v2 + 42) >> 3;
  v7 = obj_size_phys(a2);
  if ((*(_WORD *)(*(_QWORD *)(a2 + 56) + 32) & 1) != 0)
    v8 = -96;
  else
    v8 = -56;
  return btree_node_free_space_total(a2) > (unsigned __int16)((v8 + v7) & 0xFFFE) >> 1;
}

void bt_merge_up(uint64_t a1, uint64_t a2, unint64_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  _QWORD *v11;
  size_t v12;
  uint64_t v13;
  __int128 v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t *v24;
  unsigned __int16 v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  unsigned __int16 *v31;
  int v32;
  unsigned __int16 v33;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  int v38;
  uint64_t v39;
  void *v40;
  int v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  _BOOL4 v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _WORD *v49;
  char v50;
  unsigned __int16 v51;
  unsigned __int16 v52;
  int v53;
  unint64_t v54;
  unint64_t v55;
  _QWORD v56[2];
  _OWORD v57[4];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  MEMORY[0x24BDAC7A8]();
  v11 = (uint64_t *)((char *)&v46 - v10);
  bzero((char *)&v46 - v10, v12);
  v56[0] = 0xAAAAAAAAAAAAAAAALL;
  v56[1] = 0xAAAAAAAAAAAAAAAALL;
  v13 = *(_QWORD *)(a1 + 56);
  if (v13)
  {
    *(_QWORD *)&v14 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v57[2] = v14;
    v57[3] = v14;
    v57[0] = v14;
    v57[1] = v14;
    v53 = -1431655766;
    v52 = -21846;
    v51 = -21846;
    v15 = *(unsigned __int16 *)(v13 + 34);
    if (v15 >= 6)
    {
      v16 = v15 + 11;
      v18 = (unsigned __int16)(v15 + 11);
      v17 = (uint64_t *)_apfs_malloc(8 * v18);
      v49 = _apfs_malloc(2 * v18);
    }
    else
    {
      v16 = 8;
      v49 = v56;
      v17 = (uint64_t *)v57;
    }
    obj_lock(a1, 2);
    if (obj_modify(a1, (*(_DWORD *)(a1 + 400) >> 3) & 2, a5))
    {
      obj_unlock(a1, 2);
      return;
    }
    *v17 = a1;
    obj_retain((char *)a1);
    v19 = *v17;
    if ((*(_WORD *)(*(_QWORD *)(*v17 + 56) + 32) & 2) != 0)
    {
      LOWORD(v21) = 0;
    }
    else
    {
      v47 = v16;
      v48 = a2;
      v20 = 0;
      v21 = 0;
      v54 = 0xAAAAAAAAAAAAAAAALL;
      v55 = 0xAAAAAAAAAAAAAAAALL;
      v50 = -86;
      v22 = v16;
      if ((v16 & 0xFFFE) == 0)
        v22 = 1;
      v23 = (unsigned __int16)(v22 - 1);
      v24 = v17 + 1;
      do
      {
        if (bt_search_node(v19, a3, a4, &v49[v20], (BOOL *)&v50))
          goto LABEL_61;
        if (v23 == v21)
        {
          LOWORD(v16) = v47;
          LOWORD(v21) = v47 - 1;
          goto LABEL_62;
        }
        *v11 = 0;
        if (btree_node_child_val(*(v24 - 1), (unsigned __int16)v49[v21], v11)
          || btree_node_get((_QWORD *)a1, v11, v48, 3, *(_WORD *)(*(_QWORD *)(*(v24 - 1) + 56) + 34) - 1, a5, v24))
        {
          goto LABEL_61;
        }
        v19 = *v24;
        if ((*(_BYTE *)(a1 + 400) & 0x10) != 0 && *(_QWORD *)(v19 + 112) != *v11)
        {
          btree_node_child_id_update(*(v24 - 1), (unsigned __int16)v49[v21], (unint64_t *)(v19 + 112), a5);
          v19 = *v24;
        }
        ++v20;
        ++v24;
        ++v21;
      }
      while ((*(_WORD *)(*(_QWORD *)(v19 + 56) + 32) & 2) == 0);
      if ((_WORD)v21)
      {
        v25 = v21;
        LOWORD(v16) = v47;
        while (1)
        {
          v26 = ((__int16)v25 - 1);
          if ((__int16)v25 < 1)
            break;
          if ((int)v21 <= (__int16)v25)
            v27 = 0;
          else
            v27 = v17[(__int16)v25 + 1];
          bt_merge_nodes(a1, v17[v26], (unsigned __int16)v49[v26], v17[v25], (unsigned __int16)v49[v25], v27, v48, a5);
          v28 = *(_DWORD *)(*(_QWORD *)(v17[v25] + 56) + 36);
          if ((__int16)v25 < 2 || v28)
          {
            if (v28)
            {
              if (btree_node_key_ptr(v17[v26], (unsigned __int16)v49[v26], &v54, &v51))
                goto LABEL_62;
              v53 = 0;
              if (btree_node_key_ptr(v17[v25], 0, &v55, &v52))
                goto LABEL_62;
              v39 = *(_QWORD *)(a1 + 8);
              if (!v39)
                v39 = *(_QWORD *)(*(_QWORD *)a1 + 392);
              v40 = (void *)v55;
              v41 = (*(uint64_t (**)(uint64_t, unint64_t, _QWORD, unint64_t, _QWORD, int *))(a1 + 416))(v39, v55, v52, v54, v51, &v53);
              if (!v41 && v53)
                v41 = btree_node_entry_update(v17[v26], (unsigned __int16)v49[v26], v40, v52, 0, 0, a5);
              if (v41)
                goto LABEL_62;
            }
          }
          else if (!v49[v26])
          {
            v29 = (unsigned __int16)(v25 - 1);
            if (v25 != 1)
            {
              v30 = v17[(unsigned __int16)(v25 - 1)];
              if (*(_DWORD *)(*(_QWORD *)(v30 + 56) + 36))
              {
                v31 = &v49[v29];
                v32 = v29 - 1;
                v33 = v25 - 1;
                while (1)
                {
                  if (*v31--)
                    goto LABEL_25;
                  if (btree_node_key_ptr(v30, 0, &v55, &v52))
                    goto LABEL_67;
                  v53 = 0;
                  if (btree_node_key_ptr(v17[v32], (unsigned __int16)v49[v32], &v54, &v51))
                    goto LABEL_67;
                  v35 = v26;
                  v36 = *(_QWORD *)(a1 + 8);
                  if (!v36)
                    v36 = *(_QWORD *)(*(_QWORD *)a1 + 392);
                  v37 = (void *)v55;
                  v38 = (*(uint64_t (**)(uint64_t, unint64_t, _QWORD, unint64_t, _QWORD, int *))(a1 + 416))(v36, v55, v52, v54, v51, &v53);
                  if (!v38 && v53)
                    v38 = btree_node_entry_update(v17[v32], (unsigned __int16)v49[v32], v37, v52, 0, 0, a5);
                  if (v38)
                  {
LABEL_67:
                    v44 = *(_QWORD *)(a1 + 8);
                    v45 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
                    LOWORD(v16) = v47;
                    if (v44)
                    {
                      if (v45)
                        bt_merge_up_cold_2();
                    }
                    else if (v45)
                    {
                      bt_merge_up_cold_1();
                    }
                    goto LABEL_62;
                  }
                  --v33;
                  v26 = v35;
                  if (v33)
                  {
                    v30 = v17[v33];
                    --v32;
                    if (*(_DWORD *)(*(_QWORD *)(v30 + 56) + 36))
                      continue;
                  }
                  goto LABEL_25;
                }
              }
            }
          }
          --v25;
LABEL_56:
          if ((btree_node_is_underused(a1, v17[v25]) & 1) == 0)
            goto LABEL_62;
        }
        bt_merge_nodes(a1, 0, 0, *v17, (unsigned __int16)*v49, v17[1], v48, a5);
LABEL_25:
        if ((v26 & 0x8000) != 0)
          goto LABEL_61;
        v25 = v26;
        LOWORD(v16) = v47;
        goto LABEL_56;
      }
      LOWORD(v21) = 0;
LABEL_61:
      LOWORD(v16) = v47;
    }
LABEL_62:
    v42 = 0;
    do
    {
      v43 = v17[(__int16)v42];
      obj_unlock(v43, 2);
      obj_release(v43);
      ++v42;
    }
    while ((unsigned __int16)v21 >= (__int16)v42);
    if ((unsigned __int16)v16 >= 9u)
    {
      _apfs_free(v17, 8 * (unsigned __int16)v16);
      _apfs_free(v49, 2 * (unsigned __int16)v16);
    }
  }
}

uint64_t bt_remove(uint64_t a1, uint64_t a2, unint64_t *a3, unsigned int a4, uint64_t a5)
{
  return bt_remove_internal(a1, a2, 0, a3, a4, 0, 0, 0, 0, a5);
}

uint64_t bt_remove_first(uint64_t a1, uint64_t a2, void *a3, unsigned int *a4, void *a5, unsigned int *a6, uint64_t a7)
{
  size_t v14;
  unint64_t *v15;
  unint64_t *v16;
  uint64_t v17;

  v14 = *(unsigned int *)(*(_QWORD *)(a1 + 392) + 16);
  v15 = (unint64_t *)_apfs_malloc(v14);
  if (!v15)
    return 12;
  v16 = v15;
  v17 = bt_remove_internal(a1, a2, 1, v15, v14, a3, a4, a5, a6, a7);
  _apfs_free(v16, v14);
  return v17;
}

uint64_t bt_lookup_first(uint64_t a1, uint64_t a2, void *a3, _DWORD *a4, void *a5, unsigned int *a6)
{
  unint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  size_t v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  unsigned int v21;
  unsigned int v22;
  int v23;
  size_t v24;
  size_t v26;
  _BYTE v28[12];
  unsigned __int16 v29;
  unsigned __int16 v30;
  const void *v31;
  const void *v32;
  uint64_t v33[2];

  v33[1] = *MEMORY[0x24BDAC8D0];
  v12 = *(_QWORD *)(a1 + 400);
  MEMORY[0x24BDAC7A8]();
  v14 = &v28[-v13];
  bzero(&v28[-v13], v15);
  v33[0] = 0;
  if (!*(_QWORD *)(a1 + 416))
    return 22;
  v16 = (v12 >> 9) & 0x3FFF;
  if (v16)
  {
    if (*a4 != v16)
      return 22;
  }
  if ((unsigned __int16)(v12 >> 23) && *a6 != (unsigned __int16)(v12 >> 23))
    return 22;
  v30 = -21846;
  v29 = -21846;
  obj_lock(a1, 1);
  obj_retain((char *)a1);
  v18 = a1 + 56;
  v17 = *(_QWORD *)(a1 + 56);
  if ((*(_WORD *)(v17 + 32) & 2) != 0)
  {
    v19 = (_QWORD *)a1;
LABEL_15:
    if (*(_DWORD *)(v17 + 36))
    {
      v32 = (const void *)0xAAAAAAAAAAAAAAAALL;
      v20 = btree_node_key_ptr((uint64_t)v19, 0, &v32, &v30);
      if (!(_DWORD)v20)
      {
        v31 = (const void *)0xAAAAAAAAAAAAAAAALL;
        v20 = btree_node_val_ptr(v19, 0, &v31, (__int16 *)&v29);
        if (!(_DWORD)v20)
        {
          v21 = v29;
          if (v29 == 65534)
            v22 = 0;
          else
            v22 = v29;
          v23 = v30;
          if (*a4 >= v30)
            v24 = v30;
          else
            v24 = *a4;
          if (*a4 >= v30 && *a6 >= v22)
            v20 = 0;
          else
            v20 = 34;
          memcpy(a3, v32, v24);
          if (*a6 >= v22)
            v26 = v22;
          else
            v26 = *a6;
          memcpy(a5, v31, v26);
          *a4 = v23;
          *a6 = v21;
        }
      }
    }
    else
    {
      v20 = 2;
    }
    obj_unlock((uint64_t)v19, 1);
    obj_release(v19);
  }
  else
  {
    v19 = (_QWORD *)a1;
    while (1)
    {
      *v14 = 0;
      v20 = btree_node_child_val((uint64_t)v19, 0, v14);
      if (!(_DWORD)v20)
        v20 = btree_node_get((_QWORD *)a1, v14, a2, 2, *(_WORD *)(*(_QWORD *)v18 + 34) - 1, 0, v33);
      obj_unlock((uint64_t)v19, 1);
      obj_release(v19);
      if ((_DWORD)v20)
        break;
      v19 = (_QWORD *)v33[0];
      v18 = v33[0] + 56;
      v17 = *(_QWORD *)(v33[0] + 56);
      if ((*(_WORD *)(v17 + 32) & 2) != 0)
        goto LABEL_15;
    }
  }
  return v20;
}

uint64_t bt_lookup_variant(uint64_t a1, uint64_t a2, unint64_t *a3, unsigned int *a4, unsigned int a5, void *a6, unsigned int *a7, unsigned int a8, int a9, uint64_t *a10)
{
  unint64_t v17;
  unsigned int v18;
  unsigned int v19;
  uint64_t v20;
  char *v22;
  uint64_t v23;
  unsigned __int16 v24;
  char *v25;

  if (!*(_QWORD *)(a1 + 416))
    return 22;
  v17 = *(_QWORD *)(a1 + 400);
  v18 = (v17 >> 9) & 0x3FFF;
  if (v18)
  {
    if (*a4 != v18)
      return 22;
  }
  if ((unsigned __int16)(v17 >> 23) && *a7 != (unsigned __int16)(v17 >> 23))
    return 22;
  v19 = *a4;
  if ((v17 & 0x7FFE00) == 0 && v19 > ((unsigned __int16)((((v17 >> 27) & 0xF000) - 160) & 0xFFE0) >> 2) - 72)
    return 22;
  v25 = (char *)0xAAAAAAAAAAAAAAAALL;
  v24 = -21846;
  v20 = bt_lookup_internal((char *)a1, a2, a3, (unsigned __int16)v19, a8, a9, a10, &v25, &v24);
  if (!(_DWORD)v20)
  {
    v22 = v25;
    v23 = bt_lookup_copy_out(a1, v25, v24, a3, a4, a5, a6, a7, a8);
    v20 = v23;
    if (a10 && !(_DWORD)v23)
    {
      *a10 = obj_oid((uint64_t)v22);
      a10[1] = a1;
    }
    obj_unlock((uint64_t)v22, 1);
    obj_release(v22);
  }
  return v20;
}

uint64_t bt_lookup_internal(char *a1, uint64_t a2, unint64_t *a3, unsigned int a4, unsigned int a5, int a6, uint64_t *a7, char **a8, unsigned __int16 *a9)
{
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  size_t v15;
  uint64_t v16;
  char *v17;
  BOOL v18;
  BOOL v19;
  unsigned __int16 v20;
  char *v21;
  char *v22;
  char *v23;
  uint64_t v24;
  unsigned int v25;
  char *v26;
  uint64_t v27;
  unsigned int v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  char **v32;
  int v33;
  _BYTE v35[12];
  unsigned int v36;
  char **v37;
  unsigned int v38;
  int v39;
  uint64_t v40;
  unint64_t *v41;
  unsigned int v42;
  char v43;
  unsigned __int16 v44;
  char *v45;
  char *v46[2];

  v37 = a8;
  v39 = a6;
  v42 = a4;
  v40 = a2;
  v41 = a3;
  v46[1] = *(char **)MEMORY[0x24BDAC8D0];
  v12 = *((_QWORD *)a1 + 50);
  MEMORY[0x24BDAC7A8]();
  v14 = &v35[-v13];
  bzero(&v35[-v13], v15);
  v45 = 0;
  v46[0] = (char *)0xAAAAAAAAAAAAAAAALL;
  v44 = -21846;
  v43 = -86;
  if (!a7)
    goto LABEL_9;
  v16 = *a7;
  if (!*a7)
    goto LABEL_9;
  if ((v12 & 0x10) != 0)
    goto LABEL_9;
  if ((char *)a7[1] != a1)
    goto LABEL_9;
  *v14 = v16;
  if (v16 == obj_oid((uint64_t)a1)
    || btree_node_get(a1, v14, v40, (((*(unsigned __int16 *)(*((_QWORD *)a1 + 7) + 32) >> 3) & 1) << 6) | 6u, 0, 0, (uint64_t *)v46))
  {
    goto LABEL_9;
  }
  v17 = v46[0];
  if ((*(_WORD *)(*((_QWORD *)v46[0] + 7) + 32) & 2) == 0)
    goto LABEL_8;
  v33 = bt_search_node_insert((uint64_t)v46[0], v41, v42, &v44, (BOOL *)&v43);
  if (!v33 && v43)
  {
    if (a5 != 4)
    {
      if (a5 != 2)
        goto LABEL_79;
      if (v44)
      {
        --v44;
        goto LABEL_79;
      }
LABEL_82:
      v43 = 0;
      goto LABEL_8;
    }
    if (*(_DWORD *)(*((_QWORD *)v17 + 7) + 36) <= ++v44)
      goto LABEL_82;
LABEL_79:
    v32 = v37;
LABEL_80:
    v31 = 0;
    *v32 = v17;
    *a9 = v44;
    return v31;
  }
  if (!(v33 | a5))
  {
    if (v44 && *(_DWORD *)(*((_QWORD *)v17 + 7) + 36) > v44)
    {
      v23 = 0;
      v31 = 2;
      v32 = v37;
      goto LABEL_52;
    }
    goto LABEL_8;
  }
  if (!v33 && a5 - 3 <= 1 && v44 && *(_DWORD *)(*((_QWORD *)v17 + 7) + 36) > v44)
    goto LABEL_79;
LABEL_8:
  obj_unlock((uint64_t)v17, 1);
  obj_release(v17);
LABEL_9:
  v18 = a5 == 2;
  v36 = a5 - 3;
  v19 = a5 - 3 < 2;
  obj_lock((uint64_t)a1, 1);
  v46[0] = a1;
  obj_retain(a1);
  v20 = 0;
  v21 = a1;
  v38 = a5;
  while (1)
  {
    v43 = 0;
    v22 = v21 + 56;
    if ((*(_WORD *)(*((_QWORD *)v21 + 7) + 32) & 2) == 0)
    {
      v23 = 0;
      while (1)
      {
        v24 = bt_search_node((uint64_t)v21, v41, v42, &v44, (BOOL *)&v43);
        if ((_DWORD)v24)
          break;
        v25 = v44;
        if (v18 && v44 != 0 || v19 && *(_DWORD *)(*(_QWORD *)v22 + 36) - 1 > v44)
        {
          if (v23)
          {
            obj_unlock((uint64_t)v23, 1);
            obj_release(v23);
            v25 = v44;
          }
          v23 = v46[0];
          obj_retain(v46[0]);
          v20 = v19 - v18 + v25;
        }
        v26 = v46[0];
        if ((v39 & 0x100) != 0)
        {
          v27 = *((_QWORD *)v46[0] + 7);
          if (*(_WORD *)(v27 + 34) == 1
            && *(_DWORD *)(v27 + 36) - 1 > v25
            && !btree_node_child_val((uint64_t)v46[0], (unsigned __int16)(v25 + 1), v14))
          {
            btree_node_get(a1, v14, v40, 256, *(_WORD *)(*((_QWORD *)v26 + 7) + 34) - 1, 0, (uint64_t *)&v45);
          }
        }
        v24 = btree_node_child_val((uint64_t)v26, v25, v14);
        if ((_DWORD)v24)
          break;
        v24 = btree_node_get(a1, v14, v40, 2, *(_WORD *)(*((_QWORD *)v26 + 7) + 34) - 1, 0, (uint64_t *)&v45);
        if ((_DWORD)v24)
          break;
        btree_node_release((uint64_t)v26, v26 != v23);
        v21 = v45;
        v46[0] = v45;
        v22 = v45 + 56;
        if ((*(_BYTE *)(*((_QWORD *)v45 + 7) + 32) & 2) != 0)
          goto LABEL_29;
      }
LABEL_47:
      v31 = v24;
      goto LABEL_48;
    }
    v23 = 0;
LABEL_29:
    v24 = bt_search_node_insert((uint64_t)v21, v41, v42, &v44, (BOOL *)&v43);
    if ((_DWORD)v24)
      goto LABEL_47;
    if (v43)
      break;
    if (!v38)
    {
      v31 = 2;
      goto LABEL_48;
    }
    v28 = v44;
    if (v38 <= 2 && v44)
    {
      v31 = 0;
      v43 = 1;
      goto LABEL_68;
    }
    if (v36 <= 1)
    {
      v29 = *(_DWORD *)(*(_QWORD *)v22 + 36);
      goto LABEL_42;
    }
LABEL_43:
    if (!v23)
    {
      v31 = 2;
      v17 = v46[0];
      v32 = v37;
      if (v46[0])
        goto LABEL_52;
      goto LABEL_53;
    }
    btree_node_release((uint64_t)v21, v21 != v23);
    v30 = btree_node_child_val((uint64_t)v23, v20, v14);
    if ((_DWORD)v30
      || (v30 = btree_node_get(a1, v14, v40, 2, *(_WORD *)(*((_QWORD *)v23 + 7) + 34) - 1, 0, (uint64_t *)v46),
          (_DWORD)v30))
    {
      v31 = v30;
      v46[0] = 0;
      v32 = v37;
      goto LABEL_49;
    }
    obj_unlock((uint64_t)v23, 1);
    obj_release(v23);
    v18 = 0;
    v19 = 0;
    v21 = v46[0];
  }
  if (v38 != 2)
  {
    if (v38 != 4 || (++v44, v29 = *(_DWORD *)(*(_QWORD *)v22 + 36), v29 > v44))
    {
      v31 = 0;
      goto LABEL_48;
    }
    v28 = v44;
    v43 = 0;
LABEL_42:
    if (v29 > v28)
    {
      v31 = 0;
      v43 = 1;
      goto LABEL_48;
    }
    goto LABEL_43;
  }
  LOWORD(v28) = v44;
  if (!v44)
  {
    v43 = 0;
    goto LABEL_43;
  }
  v31 = 0;
LABEL_68:
  v44 = v28 - 1;
LABEL_48:
  v32 = v37;
  if (!v23)
    goto LABEL_50;
LABEL_49:
  obj_unlock((uint64_t)v23, 1);
  obj_release(v23);
LABEL_50:
  v17 = v46[0];
  if (!(_DWORD)v31)
    goto LABEL_80;
  if (!v46[0])
    goto LABEL_53;
LABEL_52:
  btree_node_release((uint64_t)v17, v17 != v23);
LABEL_53:
  *v32 = 0;
  return v31;
}

uint64_t bt_lookup_copy_out(uint64_t a1, _QWORD *a2, unsigned __int16 a3, void *a4, _DWORD *a5, unsigned int a6, void *a7, unsigned int *a8, int a9)
{
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  int v24;
  size_t v25;
  size_t v26;
  unsigned __int16 v28;
  unsigned __int16 v29;
  int v30;
  void *v31;
  void *__src;

  __src = (void *)0xAAAAAAAAAAAAAAAALL;
  v30 = 0;
  v29 = -21846;
  v28 = -21846;
  if (!(a9 | a6))
  {
    __src = 0;
    v29 = 0;
    goto LABEL_22;
  }
  v17 = btree_node_key_ptr((uint64_t)a2, a3, &__src, &v29);
  v18 = v17;
  if (a9)
    v19 = (_DWORD)v17 == 0;
  else
    v19 = 0;
  if (!v19)
  {
LABEL_19:
    if ((_DWORD)v18)
      return v18;
    goto LABEL_22;
  }
  v20 = *(_QWORD *)(a1 + 8);
  if (!v20)
    v20 = *(_QWORD *)(*(_QWORD *)a1 + 392);
  v18 = (*(uint64_t (**)(uint64_t, void *, _QWORD, void *, _QWORD, int *))(a1 + 416))(v20, __src, v29, a4, *a5, &v30);
  if (!(_DWORD)v18)
  {
    if (a9 == 2 && (v30 & 0x80000000) == 0 || a9 == 1 && v30 > 0 || a9 == 3 && v30 < 0 || a9 == 4 && v30 <= 0)
    {
      v18 = nx_corruption_detected_int(*(_QWORD *)(*(_QWORD *)a1 + 392), (uint64_t)"bt_lookup_copy_out", 5510);
      goto LABEL_19;
    }
LABEL_22:
    v31 = (void *)0xAAAAAAAAAAAAAAAALL;
    v18 = btree_node_val_ptr(a2, a3, &v31, (__int16 *)&v28);
    if (!(_DWORD)v18)
    {
      v21 = v28;
      if (v28 == 65534)
        v22 = 0;
      else
        v22 = v28;
      v23 = *a8;
      if (*a8 < v22 || (v18 = 0, a6) && v29 > a6)
        v18 = 34;
      if (a6)
      {
        v24 = v29;
        if (v29 >= a6)
          v25 = a6;
        else
          v25 = v29;
        memcpy(a4, __src, v25);
        *a5 = v24;
        v23 = *a8;
      }
      if (v23 >= v22)
        v26 = v22;
      else
        v26 = v23;
      memcpy(a7, v31, v26);
      *a8 = v21;
    }
  }
  return v18;
}

__n128 bt_iterator_init_with_hint(uint64_t a1, uint64_t a2, uint64_t a3, int a4, unint64_t *a5, int a6, unsigned int a7, void *a8, unsigned int a9, _OWORD *a10)
{
  int v16;
  uint64_t *v17;
  unsigned int v18;
  int v19;
  __n128 result;
  int v21;

  *(_QWORD *)a1 = a2;
  *(_QWORD *)(a1 + 8) = a3;
  v16 = a4 & 0x180;
  *(_DWORD *)(a1 + 16) = a4;
  *(_DWORD *)(a1 + 20) = a7;
  *(_QWORD *)(a1 + 32) = a5;
  *(_QWORD *)(a1 + 40) = a8;
  *(_QWORD *)(a1 + 24) = a9;
  v17 = (uint64_t *)(a1 + 56);
  if (a10)
  {
    *(_OWORD *)v17 = *a10;
  }
  else
  {
    *v17 = 0;
    *(_QWORD *)(a1 + 64) = 0;
  }
  *(_DWORD *)(a1 + 48) = a6;
  *(_DWORD *)(a1 + 52) = a9;
  if ((a4 & 4) != 0)
  {
    v18 = 4;
  }
  else if ((a4 & 2) != 0)
  {
    v21 = a4 & 0x180;
    v19 = bt_lookup_variant(a2, a3, a5, (unsigned int *)(a1 + 48), a7, a8, (unsigned int *)(a1 + 52), 1u, v16, (uint64_t *)(a1 + 56));
    if (v19 != 2)
      goto LABEL_11;
    v18 = 3;
    v16 = v21;
  }
  else
  {
    v18 = 3;
  }
  v19 = bt_lookup_variant(a2, a3, a5, (unsigned int *)(a1 + 48), a7, a8, (unsigned int *)(a1 + 52), v18, v16, v17);
LABEL_11:
  if (v19)
  {
    *(_DWORD *)(a1 + 16) |= 1u;
    if (v19 != 2)
      *(_DWORD *)(a1 + 28) = v19;
  }
  else if (a10)
  {
    result = *(__n128 *)v17;
    *a10 = *(_OWORD *)v17;
  }
  return result;
}

double bt_iterator_init(uint64_t a1, uint64_t a2, uint64_t a3, int a4, unint64_t *a5, int a6, unsigned int a7, void *a8, unsigned int a9)
{
  double result;

  *(_QWORD *)&result = bt_iterator_init_with_hint(a1, a2, a3, a4, a5, a6, a7, a8, a9, 0).n128_u64[0];
  return result;
}

uint64_t bt_iterator_ended(uint64_t a1)
{
  uint64_t result;

  result = *(unsigned int *)(a1 + 28);
  if (!(_DWORD)result)
    return *(_DWORD *)(a1 + 16) & 1;
  return result;
}

uint64_t bt_iterator_next(uint64_t a1)
{
  uint64_t result;
  int v3;
  unsigned int v4;
  unsigned int v5;

  result = *(unsigned int *)(a1 + 28);
  if (!(_DWORD)result)
  {
    v3 = *(_DWORD *)(a1 + 16);
    result = 2;
    if ((v3 & 1) == 0)
    {
      v4 = *(_DWORD *)(a1 + 20);
      *(_DWORD *)(a1 + 52) = *(_DWORD *)(a1 + 24);
      if ((v3 & 0x1000) != 0)
        v5 = 2;
      else
        v5 = 4;
      result = bt_lookup_variant(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(unint64_t **)(a1 + 32), (unsigned int *)(a1 + 48), v4, *(void **)(a1 + 40), (unsigned int *)(a1 + 52), v5, v3 & 0x180, (uint64_t *)(a1 + 56));
      if ((_DWORD)result == 2)
      {
        result = 0;
        *(_DWORD *)(a1 + 16) |= 1u;
      }
      *(_DWORD *)(a1 + 28) = result;
    }
  }
  return result;
}

uint64_t bt_iterate_individual(uint64_t a1, uint64_t a2, int a3, void *__src, size_t __n, _OWORD *a6, uint64_t (*a7)(_QWORD, _QWORD, _QWORD, _QWORD, uint64_t, __n128), uint64_t a8, void *a9, void *a10)
{
  unsigned int v10;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unsigned int v15;
  __int128 v16;
  unsigned int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  unsigned int v25;
  void *v26;
  uint64_t v27;
  void *v28;
  unsigned int v29;
  __n128 v30;
  __int128 v31;
  unsigned int v34;
  uint64_t v35;
  void *v36;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  unint64_t v46;

  v10 = __n;
  v12 = *(_QWORD *)(a1 + 400);
  v13 = v12 >> 27;
  v14 = (v12 >> 27) & 0x1F000;
  v15 = (v12 >> 9) & 0x3FFF;
  if (v15)
  {
    v46 = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v16 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v44 = v16;
    v45 = v16;
    v42 = v16;
    v43 = v16;
    v17 = __n;
    if (v15 == (_DWORD)__n)
      goto LABEL_3;
    return 34;
  }
  v17 = (unsigned __int16)(((unsigned __int16)(v14 - 160) >> 2) - 72);
  v46 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v31 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v31 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v44 = v31;
  v45 = v31;
  v42 = v31;
  v43 = v31;
  if ((v12 & 0x7FFE00) == 0 && v17 < __n)
    return 34;
LABEL_3:
  v18 = a9;
  if (!a9)
  {
    v19 = __src;
    v20 = _apfs_calloc(1uLL, v17);
    __src = v19;
    v18 = v20;
  }
  v21 = a10;
  if (!a10)
  {
    v22 = __src;
    v23 = _apfs_calloc(1uLL, v13 & 0x1F000);
    __src = v22;
    v21 = v23;
  }
  v24 = 0;
  v25 = 12;
  if (v18 && v21)
  {
    v26 = v21;
    memcpy(v18, __src, v10);
    v27 = a1;
    v28 = v26;
    v30 = bt_iterator_init_with_hint((uint64_t)&v42, v27, a2, a3, (unint64_t *)v18, v10, v17, v26, v14, a6);
    if (v29)
    {
LABEL_10:
      v25 = v29;
      v24 = 0;
    }
    else
    {
      while (1)
      {
        if (HIDWORD(v43) || (v43 & 1) != 0)
        {
          v24 = 0;
          goto LABEL_23;
        }
        v34 = a7(v44, v45, *((_QWORD *)&v44 + 1), DWORD1(v45), a8, v30);
        if (v34)
          break;
        v29 = bt_iterator_next((uint64_t)&v42);
        if (v29)
          goto LABEL_10;
      }
      v24 = v34;
LABEL_23:
      v25 = 0;
    }
    v21 = v28;
  }
  if (a9)
  {
    if (a10)
      goto LABEL_27;
  }
  else
  {
    v35 = v17;
    v36 = v21;
    _apfs_free(v18, v35);
    v21 = v36;
    if (a10)
      goto LABEL_27;
  }
  _apfs_free(v21, v13 & 0x1F000);
LABEL_27:
  if (v25)
    return v25;
  else
    return v24;
}

uint64_t bt_iterate_bulk(uint64_t a1, uint64_t a2, __int16 a3, unint64_t *a4, unsigned int a5, uint64_t *a6, uint64_t (*a7)(_QWORD, uint64_t, _QWORD, _QWORD, uint64_t), uint64_t a8)
{
  unint64_t v8;
  unsigned int v9;
  BOOL v10;
  unsigned __int16 v14;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  __int128 v24;
  unint64_t *v25;
  char *v26;
  int v27;
  unsigned int *v28;
  _QWORD *v29;
  unsigned int *v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  unsigned int v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t *v38;
  unsigned int v39;
  uint64_t v40;
  __int16 v42;
  unsigned int v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  int v47;
  unsigned int v48;
  __int128 v49;
  _OWORD v50[4];
  _OWORD v51[4];
  _OWORD v52[8];
  _OWORD v53[8];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v8 = *(_QWORD *)(a1 + 400);
  v49 = 0uLL;
  v48 = 4;
  v9 = (v8 >> 9) & 0x3FFF;
  if (v9)
    v10 = v9 == a5;
  else
    v10 = 1;
  if (!v10)
    return 34;
  v14 = a5;
  v19 = v8 >> 27;
  v20 = (v8 >> 27) & 0x1F000;
  if ((v8 & 0x7FFE00) == 0 && a5 > (unsigned __int16)(((unsigned __int16)(v20 - 160) >> 2) - 72))
    return 34;
  v22 = v19 & 0x1F000;
  v23 = (char *)_apfs_calloc(1uLL, v19 & 0x1F000);
  if (!v23)
    return 12;
  *(_QWORD *)&v24 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v53[6] = v24;
  v53[7] = v24;
  v53[4] = v24;
  v53[5] = v24;
  v53[2] = v24;
  v53[3] = v24;
  v53[0] = v24;
  v53[1] = v24;
  v52[1] = v24;
  v52[2] = v24;
  v52[3] = v24;
  v52[4] = v24;
  v52[5] = v24;
  v52[6] = v24;
  v52[7] = v24;
  v51[0] = v24;
  v51[1] = v24;
  v51[2] = v24;
  v51[3] = v24;
  v52[0] = v24;
  v50[2] = v24;
  v50[3] = v24;
  v50[0] = v24;
  v50[1] = v24;
  v25 = a4;
  v26 = v23;
  v21 = bt_lookup_multiple((char *)a1, a2, v25, v14, a3, a6, v23, v20, (int *)&v48, (uint64_t)v53, (uint64_t)v51, (uint64_t)v52, (uint64_t)v50);
  if (!(_DWORD)v21)
  {
    v46 = v26;
    if (a6)
      v49 = *(_OWORD *)a6;
    v42 = a3 & 0xFFF9 | 4;
    v43 = v20;
    v27 = 4;
    v44 = a2;
    v45 = v22;
    while (1)
    {
      v47 = v48;
      if ((int)v48 >= 1)
        break;
LABEL_18:
      v37 = v47 - 1;
      v38 = (unint64_t *)*((_QWORD *)v53 + v37);
      v39 = *((unsigned __int16 *)v51 + 2 * v37);
      v48 = v27;
      v40 = bt_lookup_multiple((char *)a1, v44, v38, v39, v42, (uint64_t *)&v49, v46, v43, (int *)&v48, (uint64_t)v53, (uint64_t)v51, (uint64_t)v52, (uint64_t)v50);
      v27 <<= v27 < 16;
      v22 = v45;
      if ((_DWORD)v40)
      {
        v21 = v40;
        v26 = v46;
        if ((_DWORD)v40 == 2)
          v21 = 0;
        goto LABEL_23;
      }
    }
    v28 = (unsigned int *)v50;
    v29 = v52;
    v30 = (unsigned int *)v51;
    v31 = v53;
    v32 = v48;
    while (1)
    {
      v34 = *v30++;
      v33 = v34;
      v35 = *v28++;
      v36 = a7(*v31, v33, *v29, v35, a8);
      if ((_DWORD)v36)
        break;
      ++v29;
      ++v31;
      if (!--v32)
        goto LABEL_18;
    }
    v21 = v36;
    v22 = v45;
    v26 = v46;
  }
LABEL_23:
  _apfs_free(v26, v22);
  return v21;
}

uint64_t bt_lookup_multiple(char *a1, uint64_t a2, unint64_t *a3, unsigned int a4, __int16 a5, uint64_t *a6, char *a7, unsigned int a8, int *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  int v15;
  uint64_t v16;
  char *v17;
  int v18;
  unsigned int v19;
  uint64_t v21;
  int v22;
  size_t v23;
  int v24;
  unsigned int v25;
  BOOL v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  unsigned __int16 v31;
  size_t __n[3];
  unsigned __int16 v33;
  char *v34;

  v15 = *a9;
  v34 = 0;
  v33 = -21846;
  v16 = bt_iterate_lookup(a1, a2, a3, a4, a5, a6, &v34, &v33);
  v17 = v34;
  if (!(_DWORD)v16)
  {
    v18 = 0;
    v19 = v33;
    *a9 = 0;
    if (*(_DWORD *)(*((_QWORD *)v17 + 7) + 36) <= v19 || v15 < 1)
    {
LABEL_17:
      if (v18)
        v16 = 0;
      else
        v16 = 34;
    }
    else
    {
      while (1)
      {
        memset(__n, 170, 18);
        v31 = -21846;
        v21 = btree_node_key_ptr((uint64_t)v17, (unsigned __int16)v19, (size_t *)((char *)&__n[1] + 2), __n);
        if ((_DWORD)v21)
          break;
        v21 = btree_node_val_ptr(v17, (unsigned __int16)v19, (size_t *)((char *)__n + 2), (__int16 *)&v31);
        if ((_DWORD)v21)
          break;
        v22 = v31;
        if (v31 == 65534)
          v23 = 0;
        else
          v23 = v31;
        v24 = LOWORD(__n[0]);
        v25 = v23 + LOWORD(__n[0]);
        v26 = a8 >= v25;
        a8 -= v25;
        if (!v26)
        {
          v18 = *a9;
          goto LABEL_17;
        }
        memcpy(a7, *(const void **)((char *)&__n[1] + 2), LOWORD(__n[0]));
        v27 = *a9;
        *(_QWORD *)(a10 + 8 * v27) = a7;
        *(_DWORD *)(a11 + 4 * v27) = v24;
        v28 = &a7[v24];
        memcpy(v28, *(const void **)((char *)__n + 2), v23);
        v29 = *a9;
        *(_QWORD *)(a12 + 8 * v29) = v28;
        *(_DWORD *)(a13 + 4 * v29) = v22;
        LOWORD(v19) = v19 + 1;
        v18 = *a9 + 1;
        *a9 = v18;
        if (*(_DWORD *)(*((_QWORD *)v17 + 7) + 36) > (unsigned __int16)v19)
        {
          a7 = &v28[v23];
          if (v18 < v15)
            continue;
        }
        goto LABEL_17;
      }
      v16 = v21;
    }
  }
  if (v17)
  {
    obj_unlock((uint64_t)v17, 1);
    obj_release((uint64_t *)v17);
  }
  return v16;
}

uint64_t bt_iterate_per_node(uint64_t a1, uint64_t a2, __int16 a3, unint64_t *a4, unsigned int a5, uint64_t *a6, uint64_t (*a7)(unint64_t, _QWORD, unint64_t, _QWORD, uint64_t), uint64_t a8)
{
  unsigned __int16 v11;
  unint64_t v16;
  unsigned int v17;
  unsigned int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  uint64_t *v25;
  __int16 v28;
  const void *v29;
  uint64_t *v30;
  unsigned __int16 v31;
  unsigned int v32;
  unsigned int v33;
  size_t v34;
  unsigned int v35;
  __int16 v36;
  unsigned __int16 v37;
  unsigned __int16 v38;
  unint64_t v39;
  unint64_t v40;
  unsigned __int16 v41;
  char *v42;

  v11 = a5;
  v16 = *(_QWORD *)(a1 + 400);
  v17 = (v16 >> 9) & 0x3FFF;
  if (v17)
  {
    v42 = 0;
    v41 = -21846;
    v18 = a5;
    if (v17 == a5)
      goto LABEL_3;
    return 34;
  }
  v18 = ((unsigned __int16)((((v16 >> 27) & 0xF000) - 160) & 0xFFE0) >> 2) - 72;
  v42 = 0;
  v41 = -21846;
  if ((v16 & 0x7FFE00) == 0 && v18 < a5)
    return 34;
LABEL_3:
  v19 = v18;
  v20 = _apfs_calloc(1uLL, v18);
  if (!v20)
    return 12;
  v21 = v20;
  v22 = bt_iterate_lookup((char *)a1, a2, a4, v11, a3, a6, &v42, &v41);
  if (!v22)
  {
    v28 = a3 & 0xFFF9 | 4;
    v36 = v28;
    while (1)
    {
      v29 = (const void *)0xAAAAAAAAAAAAAAAALL;
      v39 = 0xAAAAAAAAAAAAAAAALL;
      v40 = 0xAAAAAAAAAAAAAAAALL;
      v38 = 0;
      v37 = -21846;
      v30 = (uint64_t *)v42;
      v31 = v41;
      if (*(_DWORD *)(*((_QWORD *)v42 + 7) + 36) > v41)
        break;
      v33 = 0;
LABEL_26:
      v41 = v31;
      if (v19 >= v33)
        v34 = v33;
      else
        v34 = v19;
      memcpy(v21, v29, v34);
      obj_unlock((uint64_t)v30, 1);
      obj_release(v30);
      v42 = 0;
      v35 = bt_iterate_lookup((char *)a1, a2, (unint64_t *)v21, v38, v28, 0, &v42, &v41);
      if (v35)
      {
        v24 = 0;
        if (v35 == 2)
          v23 = 0;
        else
          v23 = v35;
        goto LABEL_6;
      }
    }
    while (1)
    {
      v22 = btree_node_key_ptr((uint64_t)v30, v31, &v40, &v38);
      if (v22)
        break;
      v22 = btree_node_val_ptr(v30, v31, &v39, (__int16 *)&v37);
      if (v22)
        break;
      v29 = (const void *)v40;
      v32 = a7(v40, v38, v39, v37, a8);
      if (v32)
      {
        v24 = v32;
        v23 = 0;
        goto LABEL_6;
      }
      if (*(_DWORD *)(v30[7] + 36) <= ++v31)
      {
        v33 = v38;
        v28 = v36;
        goto LABEL_26;
      }
    }
  }
  v23 = v22;
  v24 = 0;
LABEL_6:
  v25 = (uint64_t *)v42;
  if (v42)
  {
    obj_unlock((uint64_t)v42, 1);
    obj_release(v25);
  }
  _apfs_free(v21, v19);
  if (v23)
    return v23;
  else
    return v24;
}

uint64_t bt_iterate_lookup(char *a1, uint64_t a2, unint64_t *a3, unsigned int a4, __int16 a5, uint64_t *a6, char **a7, unsigned __int16 *a8)
{
  int v15;
  uint64_t v16;
  unsigned int v17;

  v15 = a5 & 0x180;
  if ((a5 & 4) != 0)
  {
    v17 = 4;
    goto LABEL_6;
  }
  if ((a5 & 2) == 0 || (v16 = bt_lookup_internal(a1, a2, a3, a4, 1u, v15, a6, a7, a8), (_DWORD)v16 == 2))
  {
    v17 = 3;
LABEL_6:
    v16 = bt_lookup_internal(a1, a2, a3, a4, v17, v15, a6, a7, a8);
  }
  if (a6 && !(_DWORD)v16)
  {
    *a6 = obj_oid((uint64_t)*a7);
    a6[1] = (uint64_t)a1;
  }
  return v16;
}

uint64_t btree_create_extended(pthread_mutex_t **a1, unsigned int a2, unsigned int a3, unsigned int a4, int a5, uint64_t *a6, uint64_t a7, unint64_t *a8)
{
  unsigned __int16 v11;
  __int16 v12;
  unsigned int v13;
  unsigned int v15;
  unsigned int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  unsigned int v21;
  unint64_t v22;
  uint64_t v23;
  __int16 v24;
  uint64_t result;
  unint64_t *v26;
  unint64_t v27;
  uint64_t v28;
  unsigned int v29;
  unsigned int v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v11 = a5;
  v12 = a4;
  v13 = a3;
  v33 = 0;
  v15 = *((_DWORD *)a6 + 5);
  v16 = a2 >> 30;
  v17 = (v15 << 26) & 0x40000000 | ((v15 >> 3) << 31) | (((v15 >> 5) & 1) << 27) | a2;
  if ((v15 & 0x18) == 0)
    v17 = a2;
  v18 = v15 | (a2 >> 26) & 0x10;
  if ((a2 & 0x80000000) != 0)
    v18 |= 8u;
  v19 = v18 | (a2 >> 22) & 0x20;
  if (v16)
    v20 = a2;
  else
    v20 = v17;
  if (v16)
    v21 = v19;
  else
    v21 = *((_DWORD *)a6 + 5);
  if (!a3)
    v13 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*a1)[6].__opaque + 376) + 36);
  if (v13 - 65537 < 0xFFFF0060
    || a4 != 8 && (v21 & 1) != 0
    || a4 > (unsigned __int16)(((unsigned __int16)(v13 - 160) >> 2) - 72)
    || a5 + a4 > btree_entry_max_size(v21, v13, (unsigned __int16)a4, (unsigned __int16)a5)
    || v21 > 0x1FF)
  {
    return 22;
  }
  v22 = ((unsigned __int16)(v12 & 0x3FFF) << 9) | ((unint64_t)v11 << 23) | v21 & 0x1FF | ((unint64_t)(v13 >> 12) << 39);
  v23 = *a6;
  v32 = v22;
  v34 = v23;
  v31 = 0x300086583;
  if ((v21 & 0x80) == 0)
  {
    v24 = 19;
    if ((v21 & 0x100) == 0)
      goto LABEL_22;
    goto LABEL_21;
  }
  if (authapfs_valid_hash_type(*((_DWORD *)a6 + 6)))
    return 22;
  v29 = *((_DWORD *)a6 + 6);
  if (v29 > 0xF)
    return 22;
  v30 = *((_DWORD *)a6 + 7);
  v32 = v22 & 0xFF800FFFFFFFFFFFLL | ((unint64_t)(v29 & 0xF) << 44) | ((unint64_t)(v30 & 0x7F) << 48);
  if (v30 > 0x7F)
    return 22;
  WORD2(v31) = 11;
  v24 = 27;
  if ((v21 & 0x100) != 0)
LABEL_21:
    WORD2(v31) = v24;
LABEL_22:
  result = btree_node_create(a1, v20, *((_DWORD *)a6 + 4), (uint64_t)&v31, a7, a8);
  if (!(_DWORD)result)
  {
    v26 = (unint64_t *)(*(_QWORD *)(*a8 + 392) + 32);
    do
      v27 = __ldxr(v26);
    while (__stxr(v27 + 1, v26));
    v28 = a6[1];
    if (v28)
      *(_QWORD *)(*a8 + 424) = v28;
    obj_unlock(*a8, 2);
    return 0;
  }
  return result;
}

uint64_t btree_node_create(pthread_mutex_t **a1, int a2, int a3, uint64_t a4, uint64_t a5, unint64_t *a6)
{
  __int16 v10;
  int v11;
  int v12;
  pthread_mutex_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v18;
  unint64_t v19;

  v18 = btree_node_desc;
  DWORD2(v18) = (*(_QWORD *)(a4 + 8) >> 27) & 0x1F000;
  v10 = *(_WORD *)(a4 + 4);
  if ((v10 & 1) != 0)
    LODWORD(v18) = 2;
  v19 = 0xAAAAAAAAAAAAAAAALL;
  DWORD1(v18) = a3;
  if ((v10 & 0x10) != 0)
    v11 = 536870916;
  else
    v11 = 4;
  v12 = v11 | a2;
  v13 = *a1;
  if (obj_type((uint64_t)a1) == 13)
    v14 = (uint64_t)a1;
  else
    v14 = 0;
  v15 = obj_create(v13, v12, 0, (int *)&v18, a4, v14, a5, &v19);
  if (!(_DWORD)v15)
  {
    v16 = v19;
    *a6 = v19;
    obj_dirty(v16, a5, 0);
  }
  return v15;
}

uint64_t btree_create(pthread_mutex_t **a1, unsigned int a2, int a3, int a4, unsigned int a5, unsigned int a6, int a7, uint64_t a8, uint64_t a9, unint64_t *a10)
{
  uint64_t v11[2];
  int v12;
  int v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v11[1] = 0;
  v14 = 0u;
  v18 = 0;
  v16 = 0u;
  v17 = 0u;
  v15 = 0u;
  v11[0] = a8;
  v12 = a4;
  v13 = a3;
  return btree_create_extended(a1, a2, a5, a6, a7, v11, a9, a10);
}

uint64_t btree_get_extended(uint64_t a1, unsigned int a2, unint64_t a3, unint64_t a4, int a5, uint64_t a6, unint64_t a7, uint64_t *a8)
{
  unsigned int v14;
  size_t v15;
  uint64_t v16;
  char *v17;
  unsigned int v18;
  unsigned int v19;
  int v20;
  int v21;
  int v22;
  unsigned int v23;
  unsigned int v24;
  uint64_t v25;
  int v26;
  int v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t result;
  uint64_t v31;
  unsigned int v32;
  unint64_t v33;
  unsigned int v34;
  size_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  char v39;
  uint64_t *v40;
  unint64_t v41;
  __int128 v42;
  uint64_t v43[2];

  v40 = a8;
  v41 = a7;
  v43[1] = *MEMORY[0x24BDAC8D0];
  v14 = *(_DWORD *)(a6 + 28);
  if (v14 >= 0x40)
    v14 = 64;
  v15 = v14 + 32;
  MEMORY[0x24BDAC7A8]();
  v17 = (char *)&v40 - v16;
  bzero((char *)&v40 - v16, v15);
  v43[0] = 0;
  v42 = btree_node_desc;
  v18 = *(_DWORD *)(a6 + 20);
  v19 = a2 >> 30;
  v20 = (v18 << 26) & 0x40000000 | ((v18 >> 3) << 31) | (((v18 >> 5) & 1) << 27) | a2;
  if ((v18 & 0x18) == 0)
    v20 = a2;
  v21 = v18 | (a2 >> 26) & 0x10;
  if ((a2 & 0x80000000) != 0)
    v21 |= 8u;
  v22 = v21 | (a2 >> 22) & 0x20;
  if (v19)
    v23 = a2;
  else
    v23 = v20;
  if (v19)
    v24 = v22;
  else
    v24 = *(_DWORD *)(a6 + 20);
  *(_WORD *)v17 = 25987;
  *((_WORD *)v17 + 1) = v15;
  if (v24 > 0x1FF)
    return 22;
  v25 = *(_QWORD *)a1;
  *((_QWORD *)v17 + 1) = *((_QWORD *)v17 + 1) & 0xFFFFF07FFFFFFE00 | v24 & 0x1FF | ((unint64_t)((*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 392) + 376) + 36) >> 12) & 0x1F) << 39);
  *((_QWORD *)v17 + 3) = *(_QWORD *)a6;
  *((_DWORD *)v17 + 1) = -267452416;
  if ((v24 & 0x80) == 0)
    goto LABEL_15;
  if (authapfs_valid_hash_type(*(_DWORD *)(a6 + 24)))
    return 22;
  v32 = *(_DWORD *)(a6 + 24);
  if (v32 > 0xF)
    return 22;
  v33 = *((_QWORD *)v17 + 1) & 0xFF800FFFFFFFFFFFLL | ((unint64_t)(v32 & 0xF) << 44);
  v34 = *(_DWORD *)(a6 + 28);
  *((_QWORD *)v17 + 1) = v33 | ((unint64_t)(v34 & 0x7F) << 48);
  if (v34 > 0x7F)
    return 22;
  if (v34 >= 0x40)
    v35 = 64;
  else
    v35 = v34;
  memcpy(v17 + 32, (const void *)(a6 + 32), v35);
  v25 = *(_QWORD *)a1;
LABEL_15:
  v26 = *(_DWORD *)(a6 + 16);
  LODWORD(v42) = (v24 << 21) & 0x20000000 | v23 & 0xFFFF0000 | 2;
  DWORD1(v42) = v26;
  if ((v23 & 0x40000000) != 0)
    v27 = 3;
  else
    v27 = 1;
  v28 = (2 * (a5 & 2)) & 0xDF | (32 * (((a5 & 4) >> 2) & 1)) | (a5 << 31 >> 31) & v27 | (v24 << 21) & 0x20000000 | v23;
  if (obj_type(a1) == 13)
    v29 = a1;
  else
    v29 = 0;
  result = obj_get(v25, v28, a3, (int *)&v42, v17, v29, a4, v41, v43);
  if ((a5 & 4) == 0 || (_DWORD)result)
  {
    v31 = v43[0];
    if ((_DWORD)result)
      v36 = 0;
    else
      v36 = v43[0];
    *v40 = v36;
    if (!(_DWORD)result)
      goto LABEL_38;
  }
  else
  {
    v31 = v43[0];
    if ((*(_BYTE *)(v43[0] + 16) & 0x10) == 0)
    {
      *v40 = v43[0];
LABEL_38:
      v37 = *(_QWORD *)(a6 + 8);
      result = 0;
      if (v37)
        *(_QWORD *)(v31 + 424) = v37;
      return result;
    }
    if ((a5 & 1) != 0)
      v38 = 2;
    else
      v38 = 1;
    if ((a5 & 2) != 0)
      v39 = v38;
    else
      v39 = 0;
    btree_node_release(v43[0], v39);
    *v40 = 0;
    return 2;
  }
  return result;
}

uint64_t btree_get(uint64_t a1, unsigned int a2, unint64_t a3, unint64_t a4, int a5, int a6, int a7, uint64_t a8, unint64_t a9, uint64_t *a10)
{
  _QWORD v11[2];
  int v12;
  int v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v11[1] = 0;
  v14 = 0u;
  v18 = 0;
  v16 = 0u;
  v17 = 0u;
  v15 = 0u;
  v11[0] = a8;
  v12 = a7;
  v13 = a5;
  return btree_get_extended(a1, a2, a3, a4, a6, (uint64_t)v11, a9, a10);
}

uint64_t btree_iterate_nodes(uint64_t a1, uint64_t a2, int a3, uint64_t (*a4)(void), uint64_t a5, unint64_t a6)
{
  __int128 *v8;
  __int128 v9;
  uint64_t v10;
  uint64_t *v11;
  size_t v12;
  int v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  int v20;
  int v21;
  unsigned __int16 v22;
  uint64_t v23;
  int v24;
  unsigned __int16 v26;
  unsigned int v27;
  _BOOL4 v28;
  _BOOL4 v29;
  unsigned __int16 v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  __int128 *v34;
  unsigned int v35;
  _WORD *v36;
  unsigned int v37;
  uint64_t v38;
  __int128 *v39;
  uint64_t v40;
  _BOOL4 v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  NSObject *v46;
  __int128 *v47;
  unsigned int v48;
  uint64_t v49;
  uint64_t *v50;
  size_t v51;
  unsigned int v52;
  uint64_t v53;
  _BOOL4 v54;
  int v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  NSObject *v59;
  uint64_t v61;
  uint64_t v62;
  _QWORD *v63;
  unsigned int v64;
  uint64_t v65;
  uint64_t v66;
  int v67;
  uint64_t v68;
  uint64_t v69;
  int v70;
  int v71;
  uint64_t v72;
  int v73;
  uint64_t v74;
  uint64_t v75;
  _BOOL4 v76;
  int v77;
  uint64_t v78;
  int v79;
  NSObject *v80;
  const char *v81;
  uint64_t v82;
  _BOOL4 v83;
  uint64_t v84;
  _BOOL4 v85;
  uint64_t v86;
  int v87;
  uint64_t v88;
  int v89;
  uint64_t v90;
  NSObject *v91;
  uint64_t v92;
  int v93;
  uint64_t v94;
  int v95;
  uint32_t v96;
  uint64_t v97;
  _BOOL4 v98;
  uint64_t v99;
  int v100;
  uint64_t v101;
  int v102;
  uint64_t v103;
  NSObject *v104;
  uint64_t v105;
  _BOOL4 v106;
  int v107;
  uint64_t v108;
  int v109;
  uint64_t v110;
  int v111;
  uint64_t v112;
  int v113;
  uint64_t v114;
  int v115;
  uint64_t v116;
  int v117;
  uint64_t v118;
  uint64_t v119;
  int v120;
  uint64_t v121;
  int v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  int v126;
  int v127;
  unsigned int v128;
  __int128 v129;
  unsigned int v130;
  uint64_t *v131;
  unsigned int v132;
  uint64_t *v133;
  _BOOL4 v134;
  unsigned __int16 *v135;
  unsigned int v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  int v140;
  uint64_t *v141;
  uint64_t v142;
  unint64_t v143;
  uint64_t v144;
  _BOOL4 v145;
  uint64_t (*v146)(void);
  uint64_t v147;
  int buf;
  const char *v149;
  __int16 v150;
  int v151;
  __int16 v152;
  uint64_t v153;
  __int16 v154;
  int v155;
  __int16 v156;
  uint64_t v157;
  __int16 v158;
  int v159;
  __int16 v160;
  _BYTE v161[10];
  int v162;
  __int16 v163;
  int v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  uint64_t v173;

  v143 = a6;
  v144 = a5;
  v146 = a4;
  v142 = a2;
  v8 = &v165;
  v173 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v9 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v171 = v9;
  v172 = v9;
  v169 = v9;
  v170 = v9;
  v168 = v9;
  v166 = v9;
  v167 = v9;
  v165 = v9;
  MEMORY[0x24BDAC7A8]();
  v11 = (uint64_t *)((char *)&v124 - v10);
  bzero((char *)&v124 - v10, v12);
  v140 = a3 & 0x180;
  v13 = v140 != 0;
  if ((a3 & 1) != 0)
    v14 = 2;
  else
    v14 = 1;
  obj_lock(a1, v14);
  v15 = *(_QWORD *)(a1 + 56);
  if (!v15)
  {
    obj_unlock(a1, v14);
    return 22;
  }
  v16 = *(unsigned __int16 *)(v15 + 34);
  v17 = v16 + 1;
  v138 = v16;
  if (v16 < 8)
  {
    v171 = 0u;
    v172 = 0u;
    v169 = 0u;
    v170 = 0u;
    v168 = 0u;
    v166 = 0u;
    v167 = 0u;
    v165 = 0u;
  }
  else
  {
    v8 = (__int128 *)_apfs_calloc(v16 + 1, 0x10uLL);
    if (!v8)
    {
      obj_unlock(a1, v14);
      return 12;
    }
  }
  *(_QWORD *)v8 = a1;
  *((_WORD *)v8 + 4) = 0;
  obj_retain((char *)a1);
  v18 = 0;
  if ((a3 & 1) != 0)
  {
    v18 = obj_modify((_QWORD *)a1, 2, v143);
    if (!(_DWORD)v18)
    {
      if ((*(_BYTE *)(a1 + 400) & 0x80) != 0)
        obj_dirty(a1, v143, 0);
      v18 = 0;
    }
  }
  v137 = v17;
  v20 = a3 & 0x20;
  if (v146 && !(v18 | v20) && ((a3 & 0x10) == 0 || *(_WORD *)(*(_QWORD *)(a1 + 56) + 34)))
    v18 = ((uint64_t (*)(uint64_t, uint64_t))v146)(a1, v144);
  if (!(_DWORD)v18)
  {
    v26 = 0;
    v128 = a3 & 0xFFFFFE4F;
    v27 = a3 & 0xFFFFFE4D | 2;
    v132 = a3 & 0xFFFFFE4C;
    if (v140)
      v27 = a3 & 0xFFFFFE4C;
    v28 = v20 != 0;
    if (!v146)
      v28 = 0;
    v145 = v28;
    v127 = v13 << 7;
    v136 = (v13 << 7) | v27;
    v130 = v27 | 0x100;
    if (v146)
      v29 = v20 == 0;
    else
      v29 = 0;
    v134 = v29;
    *(_QWORD *)&v19 = 136317186;
    v129 = v19;
    v131 = &v124;
    while (1)
    {
      v30 = v26;
      v31 = (uint64_t *)&v8[v26];
      v32 = *v31;
      v33 = *(_QWORD *)(*v31 + 56);
      if ((*(_WORD *)(v33 + 32) & 2) != 0
        || (v34 = &v8[v26],
            v37 = *((unsigned __int16 *)v34 + 4),
            v36 = (_WORD *)v34 + 4,
            v35 = v37,
            *(_DWORD *)(v33 + 36) <= v37)
        || (a3 & 0x10) != 0 && *(_WORD *)(v33 + 34) == 1)
      {
        if (v145)
        {
          v18 = v146();
          v32 = *v31;
        }
        else
        {
          v18 = 0;
        }
        btree_node_release(v32, v14);
        *v31 = 0;
        v26 = v30 - 1;
        goto LABEL_45;
      }
      *v11 = 0;
      v38 = btree_node_child_val(v32, v35, v11);
      if ((_DWORD)v38)
      {
        v18 = v38;
        v75 = *(_QWORD *)(a1 + 8);
        v76 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v75)
        {
          if (!v76)
            goto LABEL_21;
          v77 = *(unsigned __int16 *)(*(_QWORD *)(*v31 + 56) + 34);
          v78 = obj_oid(*v31);
          v79 = (unsigned __int16)*v36;
          buf = 136316674;
          v149 = "btree_iterate_nodes";
          v150 = 1024;
          v151 = 6342;
          v152 = 2080;
          v153 = v75 + 3720;
          v154 = 1024;
          v155 = v77;
          v156 = 2048;
          v157 = v78;
          v158 = 1024;
          v159 = v79;
          v160 = 1024;
          *(_DWORD *)v161 = v18;
          v80 = MEMORY[0x24BDACB70];
          v81 = "%s:%d: %s level %d node 0x%llx: error getting index %d child oid: %d\n";
        }
        else
        {
          if (!v76)
            goto LABEL_21;
          v92 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 392) + 384) + 208;
          v93 = *(unsigned __int16 *)(*(_QWORD *)(*v31 + 56) + 34);
          v94 = obj_oid(*v31);
          v95 = (unsigned __int16)*v36;
          buf = 136316674;
          v149 = "btree_iterate_nodes";
          v150 = 1024;
          v151 = 6342;
          v152 = 2080;
          v153 = v92;
          v154 = 1024;
          v155 = v93;
          v156 = 2048;
          v157 = v94;
          v158 = 1024;
          v159 = v95;
          v160 = 1024;
          *(_DWORD *)v161 = v18;
          v80 = MEMORY[0x24BDACB70];
          v81 = "%s:%d: %s level %d node 0x%llx: error getting index %d child oid: %d\n";
        }
        v96 = 56;
        goto LABEL_116;
      }
      ++*v36;
      v26 = v30 + 1;
      if (v138 < (__int16)(v30 + 1))
      {
        v82 = *(_QWORD *)(a1 + 8);
        v83 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v82)
        {
          if (v83)
            btree_iterate_nodes_cold_2(v82, (__int16)v26, (uint64_t)v8);
        }
        else if (v83)
        {
          btree_iterate_nodes_cold_1(a1, (__int16)v26, (uint64_t)v8);
        }
        v18 = 22;
        goto LABEL_21;
      }
      v39 = &v8[(__int16)v26];
      *((_WORD *)v39 + 4) = 0;
      v139 = (__int16)v26 - 1;
      v141 = (uint64_t *)&v8[v139];
      v18 = btree_node_get((_QWORD *)a1, v11, v142, v136, *(_WORD *)(*(_QWORD *)(*v141 + 56) + 34) - 1, v143, (uint64_t *)v39);
      if ((_DWORD)v18)
        break;
      if (v140)
        goto LABEL_59;
      if ((a3 & 1) != 0)
        goto LABEL_78;
LABEL_80:
      if (v134)
        v18 = ((uint64_t (*)(_QWORD, uint64_t))v146)(*(_QWORD *)v39, v144);
      else
        v18 = 0;
LABEL_45:
      if ((_DWORD)v18 || (v26 & 0x8000) != 0)
        goto LABEL_21;
    }
    v40 = *(_QWORD *)(a1 + 8);
    v41 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v40)
    {
      if (!v41)
        goto LABEL_58;
      v42 = *(unsigned __int16 *)(*(_QWORD *)(*v141 + 56) + 34);
      v43 = obj_oid(*v141);
      v44 = *v11;
      v45 = WORD4(v8[v139]) - 1;
      buf = v129;
      v149 = "btree_iterate_nodes";
      v150 = 1024;
      v151 = 6364;
      v152 = 2080;
      v153 = v40 + 3720;
      v154 = 1024;
      v155 = v42;
      v156 = 2048;
      v157 = v43;
      v158 = 1024;
      v159 = v45;
      v160 = 2048;
      *(_QWORD *)v161 = v44;
      *(_WORD *)&v161[8] = 1024;
      v162 = v136;
      v163 = 1024;
      v164 = v18;
      v46 = MEMORY[0x24BDACB70];
    }
    else
    {
      if (!v41)
        goto LABEL_58;
      v66 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 392) + 384) + 208;
      v67 = *(unsigned __int16 *)(*(_QWORD *)(*v141 + 56) + 34);
      v68 = obj_oid(*v141);
      v69 = *v11;
      v70 = WORD4(v8[v139]) - 1;
      buf = v129;
      v149 = "btree_iterate_nodes";
      v150 = 1024;
      v151 = 6364;
      v152 = 2080;
      v153 = v66;
      v154 = 1024;
      v155 = v67;
      v156 = 2048;
      v157 = v68;
      v158 = 1024;
      v159 = v70;
      v160 = 2048;
      *(_QWORD *)v161 = v69;
      *(_WORD *)&v161[8] = 1024;
      v162 = v136;
      v163 = 1024;
      v164 = v18;
      v46 = MEMORY[0x24BDACB70];
    }
    _os_log_error_impl(&dword_21F566000, v46, OS_LOG_TYPE_ERROR, "%s:%d: %s level %d node 0x%llx: error getting index %d child 0x%llx flags 0x%x: %d\n", (uint8_t *)&buf, 0x48u);
LABEL_58:
    if (!v140)
      goto LABEL_110;
LABEL_59:
    v47 = &v8[v139];
    v48 = *((unsigned __int16 *)v47 + 4);
    v135 = (unsigned __int16 *)v47 + 4;
    if (*(_DWORD *)(*(_QWORD *)(*v141 + 56) + 36) <= v48)
      goto LABEL_67;
    v133 = &v124;
    MEMORY[0x24BDAC7A8]();
    v50 = (uint64_t *)((char *)&v124 - v49);
    bzero((char *)&v124 - v49, v51);
    v52 = *v135;
    if (*(_DWORD *)(*(_QWORD *)(*v141 + 56) + 36) <= v52)
      goto LABEL_67;
    v126 = btree_node_child_val(*v141, v52, v50);
    if (!v126)
    {
      v126 = btree_node_get((_QWORD *)a1, v50, v142, v130, *(_WORD *)(*(_QWORD *)(*v141 + 56) + 34) - 1, v143, &v147);
      if (!v126)
        goto LABEL_67;
    }
    v53 = *(_QWORD *)(a1 + 8);
    v54 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v53)
    {
      if (v54)
      {
        v125 = v53 + 3720;
        v55 = *(unsigned __int16 *)(*(_QWORD *)(*v141 + 56) + 34);
        v56 = obj_oid(*v141);
        v57 = *v135;
        v58 = *v50;
        buf = v129;
        v149 = "btree_iterate_nodes";
        v150 = 1024;
        v151 = 6383;
        v152 = 2080;
        v153 = v125;
        v154 = 1024;
        v155 = v55;
        v156 = 2048;
        v157 = v56;
        v158 = 1024;
        v159 = v57;
        v160 = 2048;
        *(_QWORD *)v161 = v58;
        *(_WORD *)&v161[8] = 1024;
        v162 = v130;
        v163 = 1024;
        v164 = v126;
        v59 = MEMORY[0x24BDACB70];
LABEL_86:
        _os_log_error_impl(&dword_21F566000, v59, OS_LOG_TYPE_ERROR, "%s:%d: %s level %d node 0x%llx: error prefetching index %d child 0x%llx flags 0x%x: %d\n", (uint8_t *)&buf, 0x48u);
      }
    }
    else if (v54)
    {
      v125 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 392) + 384) + 208;
      v71 = *(unsigned __int16 *)(*(_QWORD *)(*v141 + 56) + 34);
      v72 = obj_oid(*v141);
      v73 = *v135;
      v74 = *v50;
      buf = v129;
      v149 = "btree_iterate_nodes";
      v150 = 1024;
      v151 = 6383;
      v152 = 2080;
      v153 = v125;
      v154 = 1024;
      v155 = v71;
      v156 = 2048;
      v157 = v72;
      v158 = 1024;
      v159 = v73;
      v160 = 2048;
      *(_QWORD *)v161 = v74;
      *(_WORD *)&v161[8] = 1024;
      v162 = v130;
      v163 = 1024;
      v164 = v126;
      v59 = MEMORY[0x24BDACB70];
      goto LABEL_86;
    }
LABEL_67:
    if ((_DWORD)v18)
    {
      if ((_DWORD)v18 != 45 && (_DWORD)v18 != 16)
        goto LABEL_110;
      v61 = btree_node_get((_QWORD *)a1, v11, v142, v132, *(_WORD *)(*(_QWORD *)(*v141 + 56) + 34) - 1, v143, (uint64_t *)&v8[(__int16)v26]);
      if ((_DWORD)v61)
      {
        v18 = v61;
        goto LABEL_110;
      }
    }
    else
    {
      v62 = obj_async_wait(*(_QWORD *)v39);
      if ((_DWORD)v62)
      {
        v18 = v62;
        v97 = *(_QWORD *)(a1 + 8);
        v98 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v97)
        {
          if (v98)
          {
            v99 = v97 + 3720;
            v100 = *(unsigned __int16 *)(*(_QWORD *)(*(_QWORD *)v39 + 56) + 34);
            v101 = obj_oid(*v141);
            v102 = *v135 - 1;
            v103 = obj_oid(*(_QWORD *)v39);
            buf = v129;
            v149 = "btree_iterate_nodes";
            v150 = 1024;
            v151 = 6396;
            v152 = 2080;
            v153 = v99;
            v154 = 1024;
            v155 = v100;
            v156 = 2048;
            v157 = v101;
            v158 = 1024;
            v159 = v102;
            v160 = 2048;
            *(_QWORD *)v161 = v103;
            *(_WORD *)&v161[8] = 1024;
            v162 = v136;
            v163 = 1024;
            v164 = v18;
            v104 = MEMORY[0x24BDACB70];
            goto LABEL_120;
          }
        }
        else if (v98)
        {
          v119 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 392) + 384) + 208;
          v120 = *(unsigned __int16 *)(*(_QWORD *)(*(_QWORD *)v39 + 56) + 34);
          v121 = obj_oid(*v141);
          v122 = *v135 - 1;
          v123 = obj_oid(*(_QWORD *)v39);
          buf = v129;
          v149 = "btree_iterate_nodes";
          v150 = 1024;
          v151 = 6396;
          v152 = 2080;
          v153 = v119;
          v154 = 1024;
          v155 = v120;
          v156 = 2048;
          v157 = v121;
          v158 = 1024;
          v159 = v122;
          v160 = 2048;
          *(_QWORD *)v161 = v123;
          *(_WORD *)&v161[8] = 1024;
          v162 = v136;
          v163 = 1024;
          v164 = v18;
          v104 = MEMORY[0x24BDACB70];
LABEL_120:
          _os_log_error_impl(&dword_21F566000, v104, OS_LOG_TYPE_ERROR, "%s:%d: %s level %d node 0x%llx: error ON WAIT getting index %d child 0x%llx flags 0x%x: %d\n", (uint8_t *)&buf, 0x48u);
        }
        obj_release(*(uint64_t **)v39);
        goto LABEL_109;
      }
    }
    obj_lock(*(_QWORD *)v39, v14);
    if ((a3 & 1) == 0)
      goto LABEL_80;
    v63 = *(_QWORD **)v39;
    v64 = obj_type_and_flags(*(_QWORD *)v39);
    v65 = obj_modify(v63, (v64 >> 29) & 2, v143);
    if ((_DWORD)v65)
    {
      v18 = v65;
      v84 = *(_QWORD *)(a1 + 8);
      v85 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v84)
      {
        if (v85)
        {
          v86 = v84 + 3720;
          v87 = *(unsigned __int16 *)(*(_QWORD *)(*(_QWORD *)v39 + 56) + 34);
          v88 = obj_oid(*v141);
          v89 = *v135 - 1;
          v90 = obj_oid(*(_QWORD *)v39);
          buf = v129;
          v149 = "btree_iterate_nodes";
          v150 = 1024;
          v151 = 6410;
          v152 = 2080;
          v153 = v86;
          v154 = 1024;
          v155 = v87;
          v156 = 2048;
          v157 = v88;
          v158 = 1024;
          v159 = v89;
          v160 = 2048;
          *(_QWORD *)v161 = v90;
          *(_WORD *)&v161[8] = 1024;
          v162 = v136;
          v163 = 1024;
          v164 = v18;
          v91 = MEMORY[0x24BDACB70];
          goto LABEL_118;
        }
      }
      else if (v85)
      {
        v114 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 392) + 384) + 208;
        v115 = *(unsigned __int16 *)(*(_QWORD *)(*(_QWORD *)v39 + 56) + 34);
        v116 = obj_oid(*v141);
        v117 = *v135 - 1;
        v118 = obj_oid(*(_QWORD *)v39);
        buf = v129;
        v149 = "btree_iterate_nodes";
        v150 = 1024;
        v151 = 6410;
        v152 = 2080;
        v153 = v114;
        v154 = 1024;
        v155 = v115;
        v156 = 2048;
        v157 = v116;
        v158 = 1024;
        v159 = v117;
        v160 = 2048;
        *(_QWORD *)v161 = v118;
        *(_WORD *)&v161[8] = 1024;
        v162 = v136;
        v163 = 1024;
        v164 = v18;
        v91 = MEMORY[0x24BDACB70];
LABEL_118:
        _os_log_error_impl(&dword_21F566000, v91, OS_LOG_TYPE_ERROR, "%s:%d: %s level %d node 0x%llx: error MODIFYING index %d child 0x%llx flags 0x%x: %d\n", (uint8_t *)&buf, 0x48u);
      }
      btree_node_release(*(_QWORD *)v39, 2);
LABEL_109:
      *(_QWORD *)v39 = 0;
LABEL_110:
      v105 = *(_QWORD *)(a1 + 8);
      v106 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v105)
      {
        if (!v106)
          goto LABEL_21;
        v107 = *(unsigned __int16 *)(*(_QWORD *)(*v141 + 56) + 34);
        v108 = obj_oid(*v141);
        v109 = WORD4(v8[v139]) - 1;
        buf = 136316930;
        v149 = "btree_iterate_nodes";
        v150 = 1024;
        v151 = 6419;
        v152 = 2080;
        v153 = v105 + 3720;
        v154 = 1024;
        v155 = v107;
        v156 = 2048;
        v157 = v108;
        v158 = 1024;
        v159 = v109;
        v160 = 1024;
        *(_DWORD *)v161 = v128 | v127 | 2;
        *(_WORD *)&v161[4] = 1024;
        *(_DWORD *)&v161[6] = v18;
        v80 = MEMORY[0x24BDACB70];
        v81 = "%s:%d: %s level %d node 0x%llx: error getting index %d child flags 0x%x: %d\n";
      }
      else
      {
        if (!v106)
          goto LABEL_21;
        v110 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 392) + 384) + 208;
        v111 = *(unsigned __int16 *)(*(_QWORD *)(*v141 + 56) + 34);
        v112 = obj_oid(*v141);
        v113 = WORD4(v8[v139]) - 1;
        buf = 136316930;
        v149 = "btree_iterate_nodes";
        v150 = 1024;
        v151 = 6419;
        v152 = 2080;
        v153 = v110;
        v154 = 1024;
        v155 = v111;
        v156 = 2048;
        v157 = v112;
        v158 = 1024;
        v159 = v113;
        v160 = 1024;
        *(_DWORD *)v161 = v128 | v127 | 2;
        *(_WORD *)&v161[4] = 1024;
        *(_DWORD *)&v161[6] = v18;
        v80 = MEMORY[0x24BDACB70];
        v81 = "%s:%d: %s level %d node 0x%llx: error getting index %d child flags 0x%x: %d\n";
      }
      v96 = 62;
LABEL_116:
      _os_log_error_impl(&dword_21F566000, v80, OS_LOG_TYPE_ERROR, v81, (uint8_t *)&buf, v96);
      goto LABEL_21;
    }
LABEL_78:
    if (obj_oid(*(_QWORD *)v39) != *v11)
      btree_node_child_id_update(*v141, (unsigned __int16)(WORD4(v8[v139]) - 1), (unint64_t *)(*(_QWORD *)v39 + 112), v143);
    goto LABEL_80;
  }
LABEL_21:
  v21 = v137;
  if ((((_WORD)v137 - 1) & 0x8000) == 0)
  {
    v22 = v137 - 1;
    do
    {
      v23 = *(_QWORD *)&v8[v22];
      if (v23)
        btree_node_release(v23, v14);
      v24 = (__int16)v22--;
    }
    while (v24 > 0);
  }
  if (v8 != &v165)
    _apfs_free(v8, (16 * v21));
  return v18;
}

uint64_t btree_level_count(uint64_t a1, _DWORD *a2)
{
  uint64_t v2;
  uint64_t result;

  if (!a1)
    return 22;
  v2 = *(_QWORD *)(a1 + 56);
  if (!v2)
    return 22;
  result = 0;
  *a2 = *(unsigned __int16 *)(v2 + 34) + 1;
  return result;
}

uint64_t btree_node_checkpoint_traverse(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  _QWORD *v11;
  size_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int16 v15;
  void *v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  MEMORY[0x24BDAC7A8]();
  v11 = (uint64_t *)((char *)v22 - v10);
  bzero((char *)v22 - v10, v12);
  if ((_DWORD)a5 == 2)
  {
    if (obj_type(a1) == 13)
      v14 = a1;
    else
      v14 = 0;
    *(_QWORD *)(a4 + 8) = v14;
    v15 = obj_subtype(a4);
    v16 = tree_key_compare_function_for_type(v15);
    if (!v16)
      return 22;
    *(_QWORD *)(a4 + 416) = v16;
    if (a4 != a3)
      *(_OWORD *)(a4 + 400) = *(_OWORD *)(a3 + 400);
    v13 = obj_checkpoint_known(a4);
    goto LABEL_11;
  }
  if ((_DWORD)a5 == 1)
  {
    v13 = obj_checkpoint_start((unsigned int *)a4);
LABEL_11:
    v17 = v13;
    goto LABEL_13;
  }
  v17 = 0;
LABEL_13:
  if (!(*(_WORD *)(*(_QWORD *)(a4 + 56) + 32) & 2 | v17))
  {
    v18 = 0;
    v22[0] = 0xAAAAAAAAAAAAAAAALL;
    while (v18 < *(_DWORD *)(*(_QWORD *)(a4 + 56) + 36))
    {
      *v11 = 0;
      v19 = btree_node_child_val(a4, (unsigned __int16)v18, v11);
      if ((_DWORD)v19)
        return v19;
      v19 = btree_node_get((_QWORD *)a3, v11, 0, 2, *(_WORD *)(*(_QWORD *)(a4 + 56) + 34) - 1, 0, v22);
      if ((_DWORD)v19)
        return v19;
      v20 = (uint64_t *)v22[0];
      v17 = btree_node_checkpoint_traverse(a1, a2, a3, v22[0], a5);
      obj_unlock((uint64_t)v20, 1);
      obj_release(v20);
      ++v18;
      if ((_DWORD)v17)
        return v17;
    }
    return 0;
  }
  return v17;
}

uint64_t btree_checkpoint_traverse(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return btree_node_checkpoint_traverse(a1, a2, a3, a3, a4);
}

uint64_t btree_node_copy(_QWORD *a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t *a7)
{
  uint64_t v14;
  _QWORD *v15;
  size_t v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  uint64_t inserted;
  void *v25;
  const void *v26;
  unsigned int v27;
  uint64_t v28;
  int *v29;
  uint64_t v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _BOOL4 v37;
  NSObject *v38;
  uint64_t v39;
  __int128 v41;
  uint64_t *v42;
  unsigned int v43;
  unsigned __int16 v44;
  const void *v45;
  _OWORD v46[2];
  uint64_t v47;
  uint64_t v48;
  uint8_t buf[4];
  const char *v50;
  __int16 v51;
  int v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  int v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  MEMORY[0x24BDAC7A8]();
  v15 = (_QWORD *)((char *)&v41 - v14);
  bzero((char *)&v41 - v14, v16);
  v47 = 0;
  memset(v46, 0, sizeof(v46));
  v17 = (a3 >> 26) & 0x10 | a4;
  if ((int)a3 < 0)
    v17 |= 8u;
  LODWORD(v46[0]) = 2123139;
  *(_OWORD *)((char *)v46 + 8) = *(_OWORD *)(a2 + 400);
  v43 = v17 | (a3 >> 22) & 0x20;
  v18 = *(_QWORD *)(a2 + 416);
  *((_QWORD *)&v46[0] + 1) = *((_QWORD *)&v46[0] + 1) & 0xFFFFFFFFFFFFFE00 | BYTE8(v46[0]) & 0x47 | v17 & 0x1B8 | (a3 >> 22) & 0x20;
  *((_QWORD *)&v46[1] + 1) = v18;
  v19 = *(_QWORD *)(a2 + 56);
  WORD2(v46[0]) = *(_WORD *)(v19 + 32) & 0x1B;
  WORD3(v46[0]) = *(_WORD *)(v19 + 34);
  v20 = *(_QWORD *)(a2 + 8);
  if (!v20)
    v20 = *(_QWORD *)(*(_QWORD *)a2 + 392);
  v44 = -21846;
  v21 = obj_subtype(a2);
  v22 = btree_node_create(v20, a3, v21, v46, a5, a7);
  inserted = v22;
  if (!(_DWORD)a6 || *(_WORD *)(*(_QWORD *)(a2 + 56) + 32) & 2 | v22)
  {
    if (!(_DWORD)v22)
    {
      v25 = (void *)(*(_QWORD *)(*a7 + 56) + 32);
      v26 = (const void *)(*(_QWORD *)(a2 + 56) + 32);
      v27 = obj_size_phys(a2);
      memcpy(v25, v26, v27 - 32);
      v28 = *a7;
      if ((*(_WORD *)(*(_QWORD *)(a2 + 56) + 32) & 1) != 0)
      {
        v29 = *(int **)(v28 + 392);
        *v29 = WORD4(v46[0]) & 0x1FF;
        v29[1] = (*((_QWORD *)&v46[0] + 1) >> 27) & 0x1F000;
        v29[2] = (DWORD2(v46[0]) >> 9) & 0x3FFF;
        v29[3] = (unsigned __int16)(*((_QWORD *)&v46[0] + 1) >> 23);
      }
      btree_node_init_ext(v28, (uint64_t)v46);
      inserted = 0;
      goto LABEL_31;
    }
    return inserted;
  }
  v30 = a6;
  v42 = a7;
  v31 = 0;
  v48 = 0xAAAAAAAAAAAAAAAALL;
  v45 = (const void *)0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v23 = 136315906;
  v41 = v23;
  while (1)
  {
    if (v31 >= *(_DWORD *)(*(_QWORD *)(a2 + 56) + 36))
    {
      inserted = 0;
      goto LABEL_30;
    }
    *v15 = 0;
    v32 = btree_node_child_val(a2, (unsigned __int16)v31, v15);
    if ((_DWORD)v32
      || (v32 = btree_node_get(a1, v15, 0, 2, *(_WORD *)(*(_QWORD *)(a2 + 56) + 34) - 1, 0, &v48), (_DWORD)v32))
    {
      inserted = v32;
      goto LABEL_30;
    }
    v33 = v48;
    v34 = btree_node_copy(a1, v48, a3, v43, a5, v30, &v47);
    if ((_DWORD)v34)
      break;
    v35 = v30;
    inserted = btree_node_key_ptr(a2, (unsigned __int16)v31, &v45, &v44);
    if (!(_DWORD)inserted)
    {
      *v15 = *(_QWORD *)(v47 + 112);
      inserted = btree_node_insert_internal(*v42, (unsigned __int16)v31, v45, v44, v15, (*(_WORD *)(*v42 + 406) & 0x7Fu) + 8, a5);
      if (!(_DWORD)inserted)
        goto LABEL_22;
    }
    v36 = a1[1];
    v37 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v36)
    {
      if (v37)
      {
        *(_DWORD *)buf = v41;
        v50 = "btree_node_copy";
        v51 = 1024;
        v52 = 6601;
        v53 = 2080;
        v54 = v36 + 3720;
        v55 = 1024;
        v56 = inserted;
        v38 = MEMORY[0x24BDACB70];
LABEL_25:
        _os_log_error_impl(&dword_21F566000, v38, OS_LOG_TYPE_ERROR, "%s:%d: %s btree_node_insert_internal failed: %d\n", buf, 0x22u);
      }
    }
    else if (v37)
    {
      v39 = *(_QWORD *)(*(_QWORD *)(*a1 + 392) + 384) + 208;
      *(_DWORD *)buf = v41;
      v50 = "btree_node_copy";
      v51 = 1024;
      v52 = 6601;
      v53 = 2080;
      v54 = v39;
      v55 = 1024;
      v56 = inserted;
      v38 = MEMORY[0x24BDACB70];
      goto LABEL_25;
    }
LABEL_22:
    v30 = v35;
    obj_release(v47);
    obj_unlock(v33, 1);
    obj_release(v33);
    v47 = 0;
    ++v31;
    if ((_DWORD)inserted)
      goto LABEL_30;
  }
  inserted = v34;
  obj_unlock(v33, 1);
  obj_release(v33);
  if (v47)
    obj_release(v47);
LABEL_30:
  a7 = v42;
  obj_dirty(*v42, a5, 0);
LABEL_31:
  obj_unlock(*a7, 2);
  return inserted;
}

uint64_t btree_copy(_QWORD *a1, unsigned int a2, unsigned int a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  unint64_t v16;

  *a5 = 0;
  if ((a3 & 0x18) != 0)
    v9 = (a3 << 26) & 0x40000000 | ((a3 >> 3) << 31) | (((a3 >> 5) & 1) << 27) | a2;
  else
    v9 = a2;
  obj_lock((uint64_t)a1, 1);
  v10 = btree_node_copy(a1, (uint64_t)a1, v9, a3, a4, 1, a5);
  if ((_DWORD)v10)
  {
    v11 = *a5;
    if (*a5)
    {
      v16 = 0xAAAAAAAAAAAAAAAALL;
      btree_delete(v11, a4, &v16);
      obj_release((uint64_t *)*a5);
      *a5 = 0;
    }
  }
  else
  {
    v12 = a1[49];
    v13 = *(_QWORD *)(*a5 + 392);
    v14 = *(_OWORD *)(v12 + 16);
    *(_QWORD *)(v13 + 32) = *(_QWORD *)(v12 + 32);
    *(_OWORD *)(v13 + 16) = v14;
  }
  obj_unlock((uint64_t)a1, 1);
  return v10;
}

uint64_t btree_delete(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BOOL4 v16;

  obj_lock(a1, 2);
  if ((*(_BYTE *)(a1 + 19) & 0x80) != 0 || (*(_BYTE *)(a1 + 400) & 0x80) != 0)
  {
    v8 = btree_delete_node((_QWORD *)a1, a1, a2);
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 8);
    if (v6)
      v7 = obj_oid(v6);
    else
      v7 = 0;
    v10 = *(_QWORD **)(*(_QWORD *)a1 + 392);
    v11 = obj_type_and_flags(a1);
    v12 = obj_size_phys(a1);
    v13 = obj_oid(a1);
    if (a3)
      v14 = nx_reaper_add(v10, v11, v12, v7, v13, a2, 0, a3);
    else
      v14 = nx_reaper_add_sub_object(v10, v11, v12, v7, v13, a2, 0);
    v8 = v14;
    if ((_DWORD)v14)
    {
      v15 = *(_QWORD *)(a1 + 8);
      v16 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v15)
      {
        if (v16)
          btree_delete_cold_2(v15, a1);
      }
      else if (v16)
      {
        btree_delete_cold_1();
      }
    }
  }
  obj_unlock(a1, 2);
  return v8;
}

uint64_t btree_delete_node(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  _QWORD *v7;
  size_t v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  MEMORY[0x24BDAC7A8]();
  v7 = (uint64_t *)((char *)v14 - v6);
  bzero((char *)v14 - v6, v8);
  if ((*(_WORD *)(*(_QWORD *)(a2 + 56) + 32) & 2) == 0)
  {
    v9 = 0;
    v14[0] = 0xAAAAAAAAAAAAAAAALL;
    while (v9 < *(_DWORD *)(*(_QWORD *)(a2 + 56) + 36))
    {
      *v7 = 0;
      v10 = btree_node_child_val(a2, (unsigned __int16)v9, v7);
      if ((_DWORD)v10
        || (v10 = btree_node_get(a1, v7, 0, 0, *(_WORD *)(*(_QWORD *)(a2 + 56) + 34) - 1, 0, v14), (_DWORD)v10))
      {
        v12 = v10;
        goto LABEL_10;
      }
      v11 = v14[0];
      obj_lock(v14[0], 2);
      v12 = btree_delete_node(a1, v11, a3);
      obj_unlock(v11, 2);
      obj_release(v11);
      ++v9;
      if ((_DWORD)v12)
        goto LABEL_10;
    }
  }
  v12 = 0;
LABEL_10:
  obj_delete_and_free(a2, a3);
  return v12;
}

uint64_t btree_node_count(uint64_t a1, _QWORD *a2)
{
  uint64_t result;

  if (!a1)
    return 22;
  if (obj_type(a1) != 2)
    return 22;
  result = 0;
  *a2 = *(_QWORD *)(*(_QWORD *)(a1 + 392) + 32);
  return result;
}

uint64_t btree_key_count(uint64_t a1, _QWORD *a2)
{
  uint64_t result;

  if (!a1)
    return 22;
  if (obj_type(a1) != 2)
    return 22;
  result = 0;
  *a2 = *(_QWORD *)(*(_QWORD *)(a1 + 392) + 24);
  return result;
}

uint64_t btree_node_init_ext(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v4 = *(_QWORD *)(a1 + 56);
  v5 = btree_node_sanity_check((_QWORD *)a1, a2);
  if (!(_DWORD)v5)
  {
    if (a2)
    {
      *(_OWORD *)(a1 + 400) = *(_OWORD *)(a2 + 8);
      *(_QWORD *)(a1 + 416) = *(_QWORD *)(a2 + 24);
    }
    v6 = v4 + 56 + *(unsigned __int16 *)(v4 + 42);
    *(_QWORD *)(a1 + 376) = v4 + 56;
    *(_QWORD *)(a1 + 384) = v6;
    v7 = obj_size_phys(a1);
    v8 = *(_WORD *)(v4 + 32);
    v9 = -40;
    if ((v8 & 1) == 0)
      v9 = 0;
    v10 = v4 + v7 + v9;
    *(_QWORD *)(a1 + 392) = v10;
    if ((v8 & 1) != 0)
    {
      v11 = *(_QWORD *)(a1 + 400) & 0xFFFFFFFFFFFFFE00 | *(_DWORD *)v10 & 0x1FF;
      *(_QWORD *)(a1 + 400) = v11;
      v12 = v11 & 0xFFFFF07FFFFFFFFFLL | ((unint64_t)((*(_DWORD *)(v10 + 4) >> 12) & 0x1F) << 39);
      *(_QWORD *)(a1 + 400) = v12;
      v13 = v12 & 0xFFFFFFFFFF8001FFLL | ((*(_DWORD *)(v10 + 8) & 0x3FFFLL) << 9);
      *(_QWORD *)(a1 + 400) = v13;
      *(_QWORD *)(a1 + 400) = v13 & 0xFFFFFF80007FFFFFLL | ((unint64_t)*(unsigned __int16 *)(v10 + 12) << 23);
      *(_QWORD *)(a1 + 408) = obj_oid(a1);
    }
  }
  return v5;
}

uint64_t btree_node_free_space_total(uint64_t a1)
{
  _WORD *v1;
  __int16 v2;
  __int16 v3;
  unsigned int v4;
  __int16 v5;

  v1 = *(_WORD **)(a1 + 56);
  if ((v1[16] & 4) != 0)
  {
    if ((*(_BYTE *)(a1 + 400) & 4) == 0)
    {
      v3 = 0;
      return (unsigned __int16)(v1[23] + v3 + v1[25] + v1[27]);
    }
    v2 = 4;
  }
  else
  {
    v2 = 8;
  }
  v4 = (unsigned __int16)v1[21];
  v5 = btree_node_toc_required_capacity(a1, 0);
  v3 = v4 - v5 * v2;
  if (v4 < (unsigned __int16)(v5 * v2))
    v3 = 0;
  return (unsigned __int16)(v1[23] + v3 + v1[25] + v1[27]);
}

uint64_t btree_node_space_free_list_search(uint64_t result, int a2, unsigned __int16 a3, __int16 *a4, unsigned __int16 *a5)
{
  unsigned __int16 v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  unsigned __int16 v9;
  uint64_t v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  unsigned int v15;
  BOOL v16;
  unsigned int v17;
  uint64_t v18;
  __int16 v19;
  int v20;
  int v21;
  unsigned int v22;
  uint64_t v23;
  unsigned __int16 *v24;
  __int16 *v25;
  unsigned __int16 *v26;

  if ((*(_BYTE *)(result + 400) & 0x40) != 0)
    v5 = a3;
  else
    v5 = (a3 + 7) & 0xFFF8;
  v6 = 48;
  if (a2 != 1)
    v6 = 52;
  v7 = 392;
  if (a2 == 1)
    v7 = 384;
  v8 = *(unsigned __int16 *)(*(_QWORD *)(result + 56) + v6);
  v9 = -1;
  if (v8 == 0xFFFF)
  {
    v13 = -1;
    if (a4)
      goto LABEL_42;
    goto LABEL_43;
  }
  v11 = result;
  v25 = a4;
  v26 = a5;
  v12 = *(_QWORD *)(result + v7);
  v13 = -1;
  do
  {
    v9 = v8;
    v14 = (unsigned __int16)v8;
    if (a2 == 1)
    {
      v15 = *(unsigned __int16 *)(*(_QWORD *)(v11 + 56) + 44);
      v16 = v15 >= v9;
      v17 = v15 - v9;
      if (v17 != 0 && v16)
      {
        if (v17 >= 4)
        {
          v21 = *(unsigned __int16 *)(*(_QWORD *)(v11 + 384) + v14 + 2);
          if (v21 >= 4)
          {
            if ((*(_BYTE *)(v11 + 400) & 0x40) == 0)
              v21 = (v21 + 7) & 0x1FFF8;
            if (v21 <= (int)v17)
              goto LABEL_35;
            v20 = 1244;
          }
          else
          {
            v20 = 1241;
          }
        }
        else
        {
          v20 = 1237;
        }
      }
      else
      {
        v20 = 1234;
      }
    }
    else
    {
      result = obj_size_phys(v11);
      v18 = *(_QWORD *)(v11 + 56);
      if ((*(_BYTE *)(v18 + 32) & 1) != 0)
        v19 = -96;
      else
        v19 = -56;
      if (v9 <= (unsigned __int16)(result
                                                - *(_WORD *)(v18 + 42)
                                                + v19
                                                - (*(_WORD *)(v18 + 46)
                                                 + *(_WORD *)(v18 + 44))))
      {
        if (v9 >= 4u)
        {
          v22 = *(unsigned __int16 *)(*(_QWORD *)(v11 + 392) - v14 + 2);
          if (v22 >= 4)
          {
            if ((*(_BYTE *)(v11 + 400) & 0x40) == 0)
              v22 = (v22 + 7) & 0x1FFF8;
            if (v22 <= v9)
              goto LABEL_35;
            v20 = 1270;
          }
          else
          {
            v20 = 1267;
          }
        }
        else
        {
          v20 = 1263;
        }
      }
      else
      {
        v20 = 1260;
      }
    }
    result = nx_corruption_detected_int(*(_QWORD *)(*(_QWORD *)v11 + 392), (uint64_t)"btree_node_free_list_entry_validate", v20);
    if ((_DWORD)result)
      break;
LABEL_35:
    if (a2 == 1)
      v23 = v14;
    else
      v23 = -v14;
    v24 = (unsigned __int16 *)(v12 + v23);
    if (v24[1] >= v5)
      goto LABEL_41;
    v8 = *v24;
    v13 = v9;
  }
  while (v8 != 0xFFFF);
  v9 = -1;
  v13 = -1;
LABEL_41:
  a4 = v25;
  a5 = v26;
  if (v25)
LABEL_42:
    *a4 = v13;
LABEL_43:
  if (a5)
    *a5 = v9;
  return result;
}

uint64_t btree_node_compact(uint64_t a1, __int16 a2, uint64_t a3)
{
  uint64_t v6;
  __int16 v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _OWORD *v16;
  _OWORD *v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  _BOOL4 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  int v26;
  char v27;
  _QWORD *v28;
  uint64_t v29;
  unsigned __int16 v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;
  unsigned __int16 *v34;
  unsigned __int16 *v35;
  int v36;
  uint64_t v37;
  unsigned __int16 *v38;
  uint64_t v39;
  uint64_t v40;
  unsigned int v41;
  uint64_t inserted;
  const void *v43;
  const void *v44;
  _QWORD *v45;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  int v51;
  __int16 v52;
  __int16 v53;
  __int128 v54;
  uint64_t v55;
  _QWORD *v56;
  uint8_t buf[4];
  const char *v58;
  __int16 v59;
  int v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  uint64_t v64;
  __int16 v65;
  uint64_t v66;
  __int16 v67;
  uint64_t v68;
  __int16 v69;
  int v70;
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v56 = (_QWORD *)0xAAAAAAAAAAAAAAAALL;
  v6 = *(_QWORD *)(a1 + 56);
  v7 = *(_WORD *)(v6 + 32);
  if ((v7 & 1) != 0)
  {
    v10 = btree_node_copy(0, a1, 2281701376, (16 * v7) & 0x180, a3, 0, (uint64_t *)&v56);
    if ((_DWORD)v10)
      return v10;
    v11 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)(v11 + 36) = 0;
    *(_WORD *)(v11 + 44) = 0;
    v12 = *(_QWORD *)(a1 + 392) - *(_QWORD *)(a1 + 384);
    *(_WORD *)(v11 + 46) = v12;
    *(_QWORD *)(v11 + 48) = 0xFFFF0000FFFFLL;
    bzero(*(void **)(a1 + 376), *(unsigned __int16 *)(v11 + 42) + (unint64_t)(unsigned __int16)v12);
    v13 = v56;
    v14 = v56[7];
    goto LABEL_11;
  }
  v50 = btree_node_desc;
  v51 = 2123139;
  v54 = *(_OWORD *)(a1 + 400);
  v55 = *(_QWORD *)(a1 + 416);
  v52 = v7;
  v53 = *(_WORD *)(v6 + 34);
  v8 = *(_DWORD *)(a1 + 40);
  LODWORD(v50) = *(unsigned __int16 *)(a1 + 36);
  DWORD1(v50) = v8;
  DWORD2(v50) = (*(_QWORD *)(a1 + 400) >> 27) & 0x1F000;
  v9 = obj_create(*(_QWORD *)a1, -2013265920, 0, (int)&v50, (int)&v51, *(_QWORD *)(a1 + 8), a3, (uint64_t)&v56);
  if (!(_DWORD)v9)
  {
    v15 = v56;
    v16 = (_OWORD *)v56[7];
    v17 = *(_OWORD **)(a1 + 56);
    v18 = v17[1];
    *v16 = *v17;
    v16[1] = v18;
    v19 = obj_exchange_phys((uint64_t *)a1, (uint64_t)v15);
    if ((_DWORD)v19)
    {
      v10 = v19;
      v20 = *(_QWORD *)(a1 + 8);
      v21 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v20)
      {
        if (v21)
        {
          v22 = v20 + 3720;
          v23 = obj_oid(a1);
          v24 = obj_oid((uint64_t)v56);
          *(_DWORD *)buf = 136316674;
          v58 = "btree_node_compact";
          v59 = 1024;
          v60 = 1563;
          v61 = 2080;
          v62 = v22;
          v63 = 2048;
          v64 = v23;
          v65 = 2048;
          v66 = v24;
          v67 = 2048;
          v68 = a3;
          v69 = 1024;
          v70 = v10;
          v25 = MEMORY[0x24BDACB70];
LABEL_39:
          _os_log_error_impl(&dword_21F566000, v25, OS_LOG_TYPE_ERROR, "%s:%d: %s obj_exchange_phys (%llx, %llx) with xid %llu failed: %d\n", buf, 0x40u);
        }
      }
      else if (v21)
      {
        v47 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 392) + 384) + 208;
        v48 = obj_oid(a1);
        v49 = obj_oid((uint64_t)v56);
        *(_DWORD *)buf = 136316674;
        v58 = "btree_node_compact";
        v59 = 1024;
        v60 = 1563;
        v61 = 2080;
        v62 = v47;
        v63 = 2048;
        v64 = v48;
        v65 = 2048;
        v66 = v49;
        v67 = 2048;
        v68 = a3;
        v69 = 1024;
        v70 = v10;
        v25 = MEMORY[0x24BDACB70];
        goto LABEL_39;
      }
LABEL_36:
      obj_free((uint64_t)v56);
      obj_release(v56);
      obj_dirty(a1, a3, 0);
      return v10;
    }
    btree_node_init_ext(a1, (uint64_t)&v51);
    btree_node_init_ext((uint64_t)v56, (uint64_t)&v51);
    v13 = v56;
    v14 = v56[7];
    *(_WORD *)(*(_QWORD *)(a1 + 56) + 32) |= *(_WORD *)(v14 + 32) & 0x8000;
LABEL_11:
    v26 = btree_node_toc_required_capacity((uint64_t)v13, a2);
    v27 = 2;
    if ((*(_WORD *)(v14 + 32) & 4) == 0)
      v27 = 3;
    btree_node_toc_resize(a1, (v26 << v27) & 0xFFFC);
    v28 = v56;
    v29 = v56[7];
    if (*(_DWORD *)(v29 + 36))
    {
      v30 = 0;
      while (1)
      {
        v31 = *(_WORD *)(v29 + 32);
        v32 = v28[47];
        v33 = v30;
        v34 = (unsigned __int16 *)(v32 + 4 * v30);
        v35 = (unsigned __int16 *)(v32 + 8 * v30);
        if ((v31 & 4) != 0)
        {
          v35 = v34;
          v36 = (*((_DWORD *)v28 + 100) >> 9) & 0x3FFF;
        }
        else
        {
          v36 = *(unsigned __int16 *)(v32 + 8 * v33 + 2);
        }
        v37 = *v35;
        v38 = (unsigned __int16 *)(v32 + 4 * v33 + 2);
        v39 = v32 + 8 * v33 + 4;
        if ((v31 & 4) == 0)
          v38 = (unsigned __int16 *)v39;
        v40 = *v38;
        v41 = btree_node_val_len((uint64_t)v28, v33);
        if ((_DWORD)v37 == 0xFFFF)
        {
          v43 = 0;
        }
        else
        {
          inserted = btree_node_key_range_validate((uint64_t)v28, v37, v36);
          if ((_DWORD)inserted)
            break;
          v28 = v56;
          v43 = (const void *)(v56[48] + v37);
        }
        if (v40 > 0xFFFD)
        {
          v44 = 0;
        }
        else
        {
          inserted = btree_node_val_range_validate((uint64_t)v28, v40, v41);
          if ((_DWORD)inserted)
            break;
          v44 = (const void *)(v56[49] - v40);
        }
        inserted = btree_node_insert_internal(a1, v33, v43, v36, v44, v41, a3);
        if ((_DWORD)inserted)
          break;
        v30 = v33 + 1;
        v28 = v56;
        v29 = v56[7];
        if (*(_DWORD *)(v29 + 36) <= (unsigned __int16)(v33 + 1))
          goto LABEL_30;
      }
      v10 = inserted;
      if ((v7 & 1) != 0)
      {
        memcpy((void *)(*(_QWORD *)(a1 + 56) + 32), (const void *)(v56[7] + 32), v56[49] - v56[7] - 32);
        v45 = (_QWORD *)a1;
      }
      else
      {
        obj_exchange_phys((uint64_t *)a1, (uint64_t)v56);
        btree_node_init_ext(a1, 0);
        v45 = v56;
      }
      btree_node_init_ext((uint64_t)v45, 0);
    }
    else
    {
LABEL_30:
      v10 = 0;
    }
    goto LABEL_36;
  }
  return v9;
}

uint64_t btree_node_space_free_list_alloc(uint64_t a1, int a2, unsigned __int16 a3, int a4, int a5)
{
  unsigned __int16 v5;
  uint64_t v6;
  _WORD *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t result;
  int v13;
  int v14;
  _WORD *v15;
  unsigned __int16 v16;
  int v17;
  _WORD *v18;

  if (a5 == 0xFFFF)
    return 22;
  if ((*(_QWORD *)(a1 + 400) & 0x40) != 0)
    v5 = a3;
  else
    v5 = (a3 + 7) & 0xFFF8;
  v6 = *(_QWORD *)(a1 + 56);
  v7 = (_WORD *)(v6 + 48);
  v8 = 48;
  if (a2 != 1)
  {
    v8 = 52;
    v7 = (_WORD *)(v6 + 52);
  }
  v9 = 392;
  if (a2 == 1)
  {
    v9 = 384;
    v10 = 1;
  }
  else
  {
    v10 = -1;
  }
  v11 = *(_QWORD *)(a1 + v9);
  v7[1] -= v5;
  if (a4 != 0xFFFF || (result = 0, *(unsigned __int16 *)(v6 + v8) == a5))
  {
    v13 = v5;
    v14 = v10;
    v15 = (_WORD *)(v11 + a5 * (uint64_t)v10);
    v16 = v15[1] - v13;
    if (v16 < 5u)
    {
      v18 = (_WORD *)(v11 + v10 * (uint64_t)a4);
      if (a4 != 0xFFFF)
        v7 = v18;
    }
    else
    {
      if (a4 != 0xFFFF)
        v7 = (_WORD *)(v11 + v10 * (uint64_t)a4);
      v17 = v10 * v13 + a5;
      *v7 = v17;
      v7 = (_WORD *)(v11 + v14 * (uint64_t)v17);
      v7[1] = v16;
    }
    result = 0;
    *v7 = *v15;
  }
  return result;
}

uint64_t btree_node_space_alloc(uint64_t a1, int a2, unsigned __int16 a3, _WORD *a4)
{
  uint64_t result;
  int v9;
  unsigned __int16 v10;
  uint64_t v11;
  unsigned int v12;
  unsigned __int16 v13;
  unsigned __int16 v14;

  v14 = -1;
  v13 = -1;
  btree_node_space_free_list_search(a1, a2, a3, (__int16 *)&v13, &v14);
  if (v14 == 0xFFFF)
  {
    if ((*(_BYTE *)(a1 + 400) & 0x40) != 0)
      v10 = a3;
    else
      v10 = (a3 + 7) & 0xFFF8;
    v11 = *(_QWORD *)(a1 + 56);
    v12 = *(unsigned __int16 *)(v11 + 46);
    if (v12 < v10)
      return 28;
    if (a2 == 1)
    {
      LOWORD(v9) = *(_WORD *)(v11 + 44);
      *(_WORD *)(v11 + 44) = v9 + v10;
      *(_WORD *)(v11 + 46) = v12 - v10;
    }
    else
    {
      *(_WORD *)(v11 + 46) = v12 - v10;
      if (a2 == 2)
        v9 = *(_DWORD *)(a1 + 392)
           - *(unsigned __int16 *)(v11 + 44)
           - (*(_DWORD *)(a1 + 384)
            + (unsigned __int16)(v12 - v10));
      else
        LOWORD(v9) = -1;
    }
  }
  else
  {
    result = btree_node_space_free_list_alloc(a1, a2, a3, v13, v14);
    if ((_DWORD)result)
      return result;
    LOWORD(v9) = v14;
  }
  result = 0;
  *a4 = v9;
  return result;
}

void btree_node_toc_resize(uint64_t a1, unsigned int a2)
{
  uint64_t v3;
  unsigned int v4;
  unsigned __int16 v5;
  unsigned __int16 v6;
  uint64_t v7;
  __int16 v8;

  v3 = *(_QWORD *)(a1 + 56);
  v4 = *(unsigned __int16 *)(v3 + 42);
  v5 = v4 - a2;
  if (v4 >= a2)
  {
    if (v4 <= a2)
      return;
    memmove((void *)(*(_QWORD *)(a1 + 384) - v5), *(const void **)(a1 + 384), *(unsigned __int16 *)(v3 + 44));
    *(_QWORD *)(a1 + 384) -= v5;
    v7 = *(_QWORD *)(a1 + 56);
    *(_WORD *)(v7 + 46) += v5;
    v8 = *(_WORD *)(v7 + 42) - v5;
  }
  else
  {
    v6 = a2 - v4;
    memmove((void *)(*(_QWORD *)(a1 + 384) + (unsigned __int16)(a2 - v4)), *(const void **)(a1 + 384), *(unsigned __int16 *)(v3 + 44));
    bzero(*(void **)(a1 + 384), v6);
    *(_QWORD *)(a1 + 384) += v6;
    v7 = *(_QWORD *)(a1 + 56);
    *(_WORD *)(v7 + 46) -= v6;
    v8 = *(_WORD *)(v7 + 42) + v6;
  }
  *(_WORD *)(v7 + 42) = v8;
}

void *btree_node_toc_shift(uint64_t a1, int a2, int a3)
{
  uint64_t v3;
  __int16 v4;
  char v5;
  unsigned int v6;
  int v7;
  char v8;
  uint64_t v9;

  v3 = *(_QWORD *)(a1 + 56);
  v4 = *(_WORD *)(v3 + 32);
  if ((v4 & 4) != 0)
    v5 = 2;
  else
    v5 = 3;
  v6 = (a2 + (unsigned __int16)a3) << v5;
  v7 = a2 + (__int16)-(__int16)a3;
  if ((v4 & 4) != 0)
    v8 = 2;
  else
    v8 = 3;
  v9 = v7 << v8;
  if (a3 >= 0)
    v7 = a2;
  else
    v6 = a2 << v8;
  if (a3 >= 0)
  {
    v8 = v5;
    v9 = (a2 << v5);
  }
  return memmove((void *)(*(_QWORD *)(a1 + 376) + v6), (const void *)(*(_QWORD *)(a1 + 376) + v9), ((*(_DWORD *)(v3 + 36) - v7) << v8) & 0xFFFC);
}

uint64_t btree_node_child_id_update_cb(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, uint64_t a6, _QWORD *a7, int a8)
{
  uint64_t result;

  if (a8 != 8)
    return 22;
  result = 0;
  *a5 = *a7;
  return result;
}

uint64_t bt_move_entries(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _WORD *v11;
  __int16 v12;
  unsigned __int16 v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int16 v24;
  unsigned __int16 v25;
  unsigned __int16 *v26;
  uint64_t v27;
  _WORD *v28;
  unsigned __int16 v29;
  unsigned __int16 v30;
  unsigned __int16 v31;
  uint64_t v32;
  unsigned __int16 *v33;
  uint64_t v34;
  _WORD *v35;
  uint64_t v36;
  __int16 v37;
  int v38;
  uint64_t inserted;
  _WORD *v40;
  uint64_t v41;
  __int16 v42;
  unsigned __int16 v43;
  unsigned __int16 *v44;
  uint64_t v45;
  _WORD *v46;
  unsigned __int16 v47;
  unsigned __int16 v48;
  unsigned __int16 v49;
  uint64_t v50;
  unsigned __int16 *v51;
  uint64_t v52;
  _WORD *v53;
  uint64_t v54;
  __int16 v55;
  __int16 v56;
  unsigned __int16 v58;
  _BYTE __n[18];

  if (a3 >= 0)
    LOWORD(v7) = a3;
  else
    v7 = -a3;
  v8 = (__int16)v7;
  if (a3 >= 0)
    v9 = a1;
  else
    v9 = a2;
  if (a3 >= 0)
    v10 = a2;
  else
    v10 = a1;
  v11 = *(_WORD **)(v10 + 56);
  if ((v11[16] & 4) != 0)
  {
    if ((*(_BYTE *)(v10 + 400) & 4) == 0)
      goto LABEL_19;
    v12 = 4;
  }
  else
  {
    v12 = 8;
  }
  v13 = btree_node_toc_required_capacity(v10, (__int16)v7) * v12;
  v14 = (unsigned __int16)v11[21];
  if (v14 >= v13)
    goto LABEL_19;
  if (v13 - v14 <= (unsigned __int16)v11[23])
  {
    btree_node_toc_resize(v10, v13);
    goto LABEL_19;
  }
  v15 = btree_node_compact(v10, v8, a4);
  if (!(_DWORD)v15)
  {
LABEL_19:
    memset(__n, 170, sizeof(__n));
    v58 = -21846;
    if (v9 == a2)
    {
      if (v8 < 1)
      {
        v37 = 0;
        v38 = 0;
LABEL_60:
        v15 = 0;
      }
      else
      {
        v36 = btree_node_key_ptr(a2, 0, &__n[10], __n);
        if ((_DWORD)v36)
        {
          v15 = v36;
          v37 = 0;
          v38 = 0;
        }
        else
        {
          v38 = 0;
          do
          {
            inserted = btree_node_val_ptr((_QWORD *)a2, (unsigned __int16)v38, &__n[2], (__int16 *)&v58);
            if ((_DWORD)inserted)
              break;
            inserted = btree_node_insert_internal(a1, *(unsigned __int16 *)(*(_QWORD *)(a1 + 56) + 36), *(const void **)&__n[10], *(unsigned __int16 *)__n, *(const void **)&__n[2], v58, a4);
            if ((_DWORD)inserted)
              break;
            v40 = *(_WORD **)(a2 + 56);
            v41 = *(_QWORD *)(a2 + 376);
            if ((*(_BYTE *)(a2 + 400) & 0x40) != 0)
              v42 = *(_WORD *)__n;
            else
              v42 = (*(_WORD *)__n + 7) & 0xFFF8;
            v43 = (v42 + 7) & 0xFFF8;
            if ((*(_BYTE *)(a2 + 400) & 0x40) != 0)
              v43 = *(_WORD *)__n;
            if (v43 >= 4u)
            {
              if ((v40[16] & 4) != 0)
                v44 = (unsigned __int16 *)(v41 + 4 * (unsigned __int16)v38);
              else
                v44 = (unsigned __int16 *)(v41 + 8 * (unsigned __int16)v38);
              v45 = *v44;
              v46 = (_WORD *)(*(_QWORD *)(a2 + 384) + v45);
              v46[1] = v43;
              *v46 = v40[24];
              v40[24] = v45;
            }
            v40[25] += v43;
            v47 = v58;
            if (v58 && v58 != 65534)
            {
              if ((*(_BYTE *)(a2 + 400) & 0x40) != 0)
                v48 = v58;
              else
                v48 = (v58 + 7) & 0xFFF8;
              v49 = (v48 + 7) & 0xFFF8;
              if ((*(_BYTE *)(a2 + 400) & 0x40) == 0)
                v47 = v49;
              if (v47 >= 4u)
              {
                v50 = v41 + 8 * (unsigned __int16)v38 + 4;
                v51 = (unsigned __int16 *)(v41 + 4 * (unsigned __int16)v38 + 2);
                if ((v40[16] & 4) == 0)
                  v51 = (unsigned __int16 *)v50;
                v52 = *v51;
                v53 = (_WORD *)(*(_QWORD *)(a2 + 392) - v52);
                v53[1] = v47;
                *v53 = v40[26];
                v40[26] = v52;
              }
              v40[27] += v47;
            }
            v37 = ++v38;
            if ((__int16)v38 >= v8)
              goto LABEL_60;
            inserted = btree_node_key_ptr(a2, (unsigned __int16)v38, &__n[10], __n);
          }
          while (!(_DWORD)inserted);
          v15 = inserted;
          v37 = v38;
        }
      }
      btree_node_toc_shift(a2, 0, (__int16)-v37);
      *(_DWORD *)(*(_QWORD *)(a2 + 56) + 36) -= v38;
    }
    else if (v8 < 1)
    {
      v15 = 0;
    }
    else
    {
      btree_node_toc_shift(a2, 0, v8);
      v16 = 0;
      v17 = *(_QWORD *)(a2 + 56);
      *(_DWORD *)(v17 + 36) += (unsigned __int16)v8;
      *(_WORD *)(v17 + 32) |= 0x8000u;
      v18 = *(_QWORD *)(a2 + 376);
      do
      {
        if ((*(_WORD *)(v17 + 32) & 4) != 0)
          *(_DWORD *)(v18 + 4 * v16) = -1;
        else
          *(_QWORD *)(v18 + 8 * v16) = 0xFFFF0000FFFFLL;
        ++v16;
      }
      while (v8 > (__int16)v16);
      LOWORD(v19) = 0;
      v20 = *(_DWORD *)(*(_QWORD *)(a1 + 56) + 36);
      while (1)
      {
        v21 = btree_node_key_ptr(a1, (unsigned __int16)(v20 - 1), &__n[10], __n);
        if ((_DWORD)v21)
          break;
        v21 = btree_node_val_ptr((_QWORD *)a1, (unsigned __int16)(*(_WORD *)(*(_QWORD *)(a1 + 56) + 36) - 1), &__n[2], (__int16 *)&v58);
        if ((_DWORD)v21)
          break;
        v21 = btree_node_entry_update(a2, (unsigned __int16)(v8 + ~(_WORD)v19), *(void **)&__n[10], *(unsigned __int16 *)__n, *(void **)&__n[2], v58, a4);
        if ((_DWORD)v21)
          break;
        v22 = *(_QWORD *)(a1 + 56);
        v20 = *(_DWORD *)(v22 + 36) - 1;
        *(_DWORD *)(v22 + 36) = v20;
        v23 = *(_QWORD *)(a1 + 376);
        if ((*(_BYTE *)(a1 + 400) & 0x40) != 0)
          v24 = *(_WORD *)__n;
        else
          v24 = (*(_WORD *)__n + 7) & 0xFFF8;
        v25 = (v24 + 7) & 0xFFF8;
        if ((*(_BYTE *)(a1 + 400) & 0x40) != 0)
          v25 = *(_WORD *)__n;
        if (v25 >= 4u)
        {
          if ((*(_WORD *)(v22 + 32) & 4) != 0)
            v26 = (unsigned __int16 *)(v23 + 4 * (unsigned __int16)v20);
          else
            v26 = (unsigned __int16 *)(v23 + 8 * (unsigned __int16)v20);
          v27 = *v26;
          v28 = (_WORD *)(*(_QWORD *)(a1 + 384) + v27);
          v28[1] = v25;
          *v28 = *(_WORD *)(v22 + 48);
          *(_WORD *)(v22 + 48) = v27;
        }
        *(_WORD *)(v22 + 50) += v25;
        v29 = v58;
        if (v58 && v58 != 65534)
        {
          if ((*(_BYTE *)(a1 + 400) & 0x40) != 0)
            v30 = v58;
          else
            v30 = (v58 + 7) & 0xFFF8;
          v31 = (v30 + 7) & 0xFFF8;
          if ((*(_BYTE *)(a1 + 400) & 0x40) == 0)
            v29 = v31;
          if (v29 >= 4u)
          {
            v32 = v23 + 8 * (unsigned __int16)v20 + 4;
            v33 = (unsigned __int16 *)(v23 + 4 * (unsigned __int16)v20 + 2);
            if ((*(_WORD *)(v22 + 32) & 4) == 0)
              v33 = (unsigned __int16 *)v32;
            v34 = *v33;
            v35 = (_WORD *)(*(_QWORD *)(a1 + 392) - v34);
            v35[1] = v29;
            *v35 = *(_WORD *)(v22 + 52);
            *(_WORD *)(v22 + 52) = v34;
          }
          *(_WORD *)(v22 + 54) += v29;
        }
        v19 = (__int16)(v19 + 1);
        if (v19 >= v8)
        {
          v15 = 0;
          *(_WORD *)(*(_QWORD *)(a2 + 56) + 32) &= ~0x8000u;
          goto LABEL_90;
        }
      }
      v15 = v21;
      *(_WORD *)(*(_QWORD *)(a2 + 56) + 32) &= ~0x8000u;
      btree_node_toc_shift(a2, 0, (__int16)(v19 - v8));
    }
LABEL_90:
    v54 = *(_QWORD *)(v9 + 56);
    if ((*(_WORD *)(v54 + 32) & 4) != 0)
    {
      if ((*(_BYTE *)(v9 + 400) & 4) == 0)
      {
LABEL_96:
        *(_WORD *)(v9 + 440) = 0;
        obj_dirty(a1, a4, 0);
        obj_dirty(a2, a4, 0);
        return v15;
      }
      v55 = 4;
    }
    else
    {
      v55 = 8;
    }
    v56 = btree_node_toc_required_capacity(v9, 8);
    if (*(unsigned __int16 *)(v54 + 42) > (unsigned __int16)(v56 * v55))
      btree_node_toc_resize(v9, (unsigned __int16)(v56 * v55));
    goto LABEL_96;
  }
  return v15;
}

void btree_node_reinit_root(uint64_t a1, int a2, uint64_t a3)
{
  __int16 v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  int v9;
  __int16 v10;
  __int16 v11;
  __int128 v12;
  uint64_t v13;

  v9 = 2123139;
  if (a2)
    v5 = 1;
  else
    v5 = 3;
  v6 = *(_QWORD *)(a1 + 56);
  v10 = *(_WORD *)(v6 + 32) & 0x18 | v5;
  v11 = a2;
  v12 = *(_OWORD *)(a1 + 400);
  v13 = *(_QWORD *)(a1 + 416);
  bzero((void *)(v6 + 32), ((*(_QWORD *)(a1 + 400) >> 27) & 0x1F000) - 72);
  v7 = *(_QWORD *)(a1 + 56);
  v8 = obj_size_phys(a1);
  btree_node_init_phys(v7, v8, (uint64_t)&v9);
  btree_node_init_ext(a1, (uint64_t)&v9);
  obj_dirty(a1, a3, 0);
}

void bt_update_last_leaf(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  size_t v8;
  uint64_t v9;
  _BOOL4 v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 432) == *(_QWORD *)(a3 + 112))
  {
    v5 = *(_QWORD *)(a2 + 56);
    if ((*(_WORD *)(v5 + 32) & 2) != 0 || !*(_DWORD *)(v5 + 36))
    {
      *(_QWORD *)(a1 + 432) = *(_QWORD *)(a2 + 112);
    }
    else
    {
      MEMORY[0x24BDAC7A8]();
      v7 = (_QWORD *)((char *)v12 - v6);
      bzero((char *)v12 - v6, v8);
      if (btree_node_child_val(a2, (unsigned __int16)(*(_WORD *)(*(_QWORD *)(a2 + 56) + 36) - 1), v7))
      {
        v9 = *(_QWORD *)(a1 + 8);
        v10 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v9)
        {
          if (v10)
            bt_update_last_leaf_cold_2();
        }
        else if (v10)
        {
          bt_update_last_leaf_cold_1();
        }
        v11 = 0;
      }
      else
      {
        v11 = *v7;
      }
      *(_QWORD *)(a1 + 432) = v11;
    }
  }
}

void bt_merge_nodes(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  uint64_t v16;
  _QWORD *v17;
  size_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int16 v22;
  unsigned int v23;
  _QWORD *v24;
  int v25;
  unsigned int v26;
  int v27;
  unsigned int v28;
  unsigned int v29;
  uint64_t v30;
  int v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  __int16 v35;
  unsigned int v36;
  unsigned int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  uint64_t v45;
  unint64_t *v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _BOOL4 v50;
  unsigned int v51;
  unsigned int v52;
  int v53;
  int v54;
  uint64_t v55;
  unsigned int v56;
  unsigned int v57;
  _BOOL4 has_room;
  _QWORD *v59;
  uint64_t v60;
  _BOOL4 v61;
  unint64_t *v62;
  unint64_t v63;
  unint64_t *v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  int v68;
  unsigned int v69;
  uint64_t v70;
  uint64_t v71;
  unsigned __int16 v72;
  void *v73;
  _QWORD *v74;
  uint64_t v75[2];

  v10 = a6;
  v75[1] = *MEMORY[0x24BDAC8D0];
  v75[0] = a6;
  MEMORY[0x24BDAC7A8]();
  v17 = (uint64_t *)((char *)&v66 - v16);
  bzero((char *)&v66 - v16, v18);
  v73 = (void *)0xAAAAAAAAAAAAAAAALL;
  v72 = -21846;
  v19 = *(_QWORD *)(a4 + 56);
  if (!a2)
  {
    if ((*(_WORD *)(v19 + 32) & 2) != 0 || *(_DWORD *)(v19 + 36) != 1)
      return;
    if (a5 || v10 && (*(_BYTE *)(v10 + 16) & 0x10) != 0)
    {
      if (btree_node_child_val(a4, 0, v17)
        || btree_node_get((_QWORD *)a1, v17, a7, 3, *(_WORD *)(*(_QWORD *)(a4 + 56) + 34) - 1, a8, v75))
      {
        return;
      }
      v10 = v75[0];
      if ((*(_BYTE *)(a1 + 400) & 0x10) != 0 && *(_QWORD *)(v75[0] + 112) != *v17)
        btree_node_child_id_update(a4, 0, (unint64_t *)(v75[0] + 112), a8);
      v44 = 1;
    }
    else
    {
      v44 = 0;
    }
    if (btree_node_free_space_total(v10) > 0x27)
    {
      v48 = *(_QWORD *)(v10 + 56);
      if (*(unsigned __int16 *)(v48 + 46) > 0x27u
        || ((*(_WORD *)(v48 + 32) & 4) == 0 || (*(_BYTE *)(v10 + 400) & 4) != 0)
        && (btree_node_compact(v10, 0, a8), *(unsigned __int16 *)(*(_QWORD *)(v10 + 56) + 46) > 0x27u))
      {
        btree_node_remove(a4, 0, a8);
        btree_node_reinit_root(a4, (unsigned __int16)(*(_WORD *)(*(_QWORD *)(a4 + 56) + 34) - 1), a8);
        if (!bt_move_entries(a4, v10, (__int16)-*(_WORD *)(*(_QWORD *)(v10 + 56) + 36), a8))
        {
          bt_update_last_leaf(a1, a4, v10);
          obj_delete_and_free(v10, a8);
          if (v44)
          {
            obj_unlock(v10, 2);
            obj_release(v10);
          }
          v62 = (unint64_t *)(*(_QWORD *)(a1 + 392) + 32);
          do
            v63 = __ldxr(v62);
          while (__stxr(v63 - 1, v62));
          goto LABEL_51;
        }
        v49 = *(_QWORD *)(a1 + 8);
        v50 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v49)
        {
          if (v50)
            bt_merge_nodes_cold_2();
        }
        else if (v50)
        {
          bt_merge_nodes_cold_1();
        }
        bt_move_entries(a4, v10, *(__int16 *)(*(_QWORD *)(a4 + 56) + 36), a8);
        btree_node_reinit_root(a4, (unsigned __int16)(*(_WORD *)(*(_QWORD *)(a4 + 56) + 34) + 1), a8);
        if (!btree_node_key_ptr(v10, 0, &v73, &v72))
        {
          *v17 = *(_QWORD *)(v10 + 112);
          btree_node_insert_internal(a4, 0, v73, v72, v17, (*(_WORD *)(a4 + 406) & 0x7F) + 8, a8);
        }
      }
    }
    if (!v44)
      return;
    obj_unlock(v10, 2);
    v59 = (_QWORD *)v10;
    goto LABEL_108;
  }
  if (!*(_DWORD *)(v19 + 36))
  {
    btree_node_remove(a2, a3, a8);
    v45 = *(_QWORD *)(a2 + 56);
    if ((*(_WORD *)(v45 + 32) & 1) != 0 && !*(_DWORD *)(v45 + 36))
      btree_node_reinit_root(a2, 0, a8);
    bt_update_last_leaf(a1, a2, a4);
    obj_delete_and_free(a4, a8);
    v46 = (unint64_t *)(*(_QWORD *)(a1 + 392) + 32);
    do
      v47 = __ldxr(v46);
    while (__stxr(v47 - 1, v46));
LABEL_51:
    obj_dirty(a1, a8, 0);
    return;
  }
  if (*(_DWORD *)(*(_QWORD *)(a2 + 56) + 36) - 1 > a3)
  {
    v20 = a3 + 1;
    if (!btree_node_child_val(a2, (unsigned __int16)v20, v17))
    {
      v74 = (_QWORD *)0xAAAAAAAAAAAAAAAALL;
      if (!btree_node_get((_QWORD *)a1, v17, a7, 3, *(_WORD *)(*(_QWORD *)(a2 + 56) + 34) - 1, a8, (uint64_t *)&v74))
      {
        if ((*(_BYTE *)(a1 + 400) & 0x10) != 0 && v74[14] != *v17)
          btree_node_child_id_update(a2, (unsigned __int16)v20, v74 + 14, a8);
        v21 = *(_QWORD *)(a4 + 56);
        if ((*(_WORD *)(v21 + 32) & 4) != 0)
        {
          v51 = *(_DWORD *)(v21 + 36);
          v24 = v74;
          v70 = v74[7];
          v43 = *(_DWORD *)(v70 + 36);
          v52 = v43 + v51;
          if (v43 + v51 <= btree_node_toc_required_capacity(a4, 0))
          {
            v71 = 0;
            LOWORD(v30) = v43;
          }
          else
          {
            if (v51 >= (unsigned __int16)(v52 >> 1))
              v30 = 0;
            else
              v30 = (v52 >> 1) - v51;
            v71 = v30;
          }
        }
        else
        {
          v67 = v20;
          v22 = btree_node_toc_required_capacity(a4, 0);
          v23 = btree_node_free_space_total(a4);
          v24 = v74;
          v25 = btree_node_free_space_total((uint64_t)v74);
          v26 = 0;
          v27 = 0;
          v70 = v24[7];
          v71 = 0;
          v28 = *(_DWORD *)(v70 + 36);
          v29 = 8 * (v22 & 0x1FFF);
          v68 = v23 - ((v25 + v23) >> 1);
          v69 = v28;
          do
          {
            LODWORD(v30) = v26;
            if (v69 <= (unsigned __int16)v26)
              break;
            if (!(_WORD)v71 && (_WORD)v26)
            {
              v31 = btree_node_toc_required_capacity(a4, (__int16)v26);
              v32 = (8 * (_WORD)v31 - (_WORD)v29) & 0xFFF8;
              if (((8 * v31) & 0xFFF8u) <= v29)
                v32 = 0;
              if (v32 + (unsigned __int16)v27 <= v68)
                v33 = 0;
              else
                v33 = v26;
              v71 = v33;
            }
            v34 = v24[50];
            v35 = *(_WORD *)(v70 + 32);
            if ((v34 & 0x40) != 0)
            {
              if ((v35 & 4) != 0)
                v37 = (v34 >> 9) & 0x3FFF;
              else
                v37 = *(unsigned __int16 *)(v24[47] + 8 * (unsigned __int16)v30 + 2);
            }
            else
            {
              if ((v35 & 4) != 0)
                v36 = (v34 >> 9) & 0x3FFF;
              else
                v36 = *(unsigned __int16 *)(v24[47] + 8 * (unsigned __int16)v30 + 2);
              v37 = (v36 + 7) & 0x1FFF8;
            }
            v38 = v37 + v27;
            v39 = btree_node_val_len((uint64_t)v24, (unsigned __int16)v30);
            if (v39 == 65534)
              v40 = 0;
            else
              v40 = v39;
            if ((v34 & 0x40) == 0)
              v40 = (v40 + 7) & 0x1FFF8;
            v27 = v38 + v40;
            v26 = v30 + 1;
            v41 = btree_node_toc_required_capacity(a4, (__int16)(v30 + 1));
            v42 = (8 * (_WORD)v41 - (_WORD)v29) & 0xFFF8;
            if (((8 * v41) & 0xFFF8u) <= v29)
              v42 = 0;
          }
          while (v42 + (unsigned __int16)v27 <= v23);
          LOWORD(v20) = v67;
          v43 = v69;
        }
        if (v43 != (unsigned __int16)v30)
        {
          if ((*(_WORD *)(*(_QWORD *)(a2 + 56) + 32) & 4) != 0)
            v53 = (*(_DWORD *)(a2 + 400) >> 9) & 0x3FFF;
          else
            v53 = *(unsigned __int16 *)(*(_QWORD *)(a2 + 376) + 8 * (unsigned __int16)v20 + 2);
          if ((*(_WORD *)(v70 + 32) & 4) != 0)
            v54 = (*((_DWORD *)v24 + 100) >> 9) & 0x3FFF;
          else
            v54 = *(unsigned __int16 *)(v24[47] + 8 * (unsigned __int16)v71 + 2);
          v72 = v54;
          v55 = *(_QWORD *)(a2 + 400);
          if ((v55 & 0x40) != 0)
            v56 = v53;
          else
            v56 = (v53 + 7) & 0x1FFF8;
          v57 = (v54 + 7) & 0x1FFF8;
          if ((v55 & 0x40) != 0)
            v57 = v54;
          if (v56 >= v57)
          {
            LOWORD(v30) = v71;
          }
          else
          {
            if ((v55 & 0x40) == 0)
            {
              LOWORD(v54) = (v54 + 7) & 0xFFF8;
              LOWORD(v53) = (v53 + 7) & 0xFFF8;
            }
            has_room = btree_node_has_room(a2, 0, 0, 0, v54 - v53, 0, 0);
            LOWORD(v30) = v71;
            if (!has_room)
              goto LABEL_90;
          }
        }
        if ((_WORD)v30 && !bt_move_entries(a4, (uint64_t)v24, (__int16)-(__int16)v30, a8))
        {
          if (*(_DWORD *)(v24[7] + 36))
          {
            if (btree_node_key_ptr((uint64_t)v24, 0, &v73, &v72)
              || btree_node_entry_update(a2, (unsigned __int16)v20, v73, v72, 0, 0, a8))
            {
              v60 = *(_QWORD *)(a1 + 8);
              v61 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
              if (v60)
              {
                if (v61)
                  bt_merge_nodes_cold_4();
              }
              else if (v61)
              {
                bt_merge_nodes_cold_3();
              }
            }
          }
          else
          {
            btree_node_remove(a2, (unsigned __int16)v20, a8);
            bt_update_last_leaf(a1, a2, (uint64_t)v24);
            obj_delete_and_free(v24, a8);
            v64 = (unint64_t *)(*(_QWORD *)(a1 + 392) + 32);
            do
              v65 = __ldxr(v64);
            while (__stxr(v65 - 1, v64));
            obj_dirty(a1, a8, 0);
          }
        }
LABEL_90:
        obj_unlock((uint64_t)v24, 2);
        v59 = v24;
LABEL_108:
        obj_release(v59);
      }
    }
  }
}

uint64_t OUTLINED_FUNCTION_23_5(uint64_t a1, int a2, uint64_t a3)
{
  return obj_oid(*(_QWORD *)(a3 + 16 * a2 - 16));
}

uint64_t OUTLINED_FUNCTION_24_0(uint64_t a1, uint64_t a2)
{
  return obj_oid(a2);
}

void OUTLINED_FUNCTION_28_1(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 40) = a1;
}

uint64_t OUTLINED_FUNCTION_30_0()
{
  uint64_t v0;

  return obj_subtype(v0);
}

uint64_t userfs_fd_is_apfs(int a1)
{
  uint64_t v1;
  unsigned int v2;
  size_t v3;
  void *v4;
  int8x16_t v5;
  int8x16_t v6;
  uint64_t v8;

  v8 = 0;
  if (dev_init_with_fd(a1, &v8))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      userfs_fd_is_apfs_cold_4();
    return 0;
  }
  v2 = dev_block_size(v8);
  if (v2 <= 0x1000)
    v3 = 4096;
  else
    v3 = v2;
  v4 = _apfs_malloc(v3);
  if (v4)
  {
    if (dev_read(v8, 0))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        userfs_fd_is_apfs_cold_3();
    }
    else
    {
      if (!nx_check_superblock((uint64_t)v4, 0x10001u, 0, v5, v6))
      {
        v1 = 1;
        goto LABEL_18;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        userfs_fd_is_apfs_cold_2();
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    userfs_fd_is_apfs_cold_1();
  }
  v1 = 0;
LABEL_18:
  if (v8)
    dev_close(v8);
  if (v4)
    _apfs_free(v4, v3);
  return v1;
}

uint64_t userfs_apfs_get_next_vol(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3;
  _QWORD *v5;
  unint64_t v6;
  uint64_t v7;

  v3 = *a2;
  *a3 = 0;
  if (v3 > 0x63)
    return 4294966295;
  v5 = (_QWORD *)(a1 + 376);
  while (1)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 376) + 184 + 8 * v3);
    if (v6)
      break;
    if (++v3 == 100)
      return 4294966295;
  }
  v7 = obj_get(*(_QWORD *)(a1 + 392), 0, v6, (int *)&apfs_desc, 0, 0, 0, 0, a3);
  if ((_DWORD)v7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      userfs_apfs_get_next_vol_cold_1(v5, v3, v7);
  }
  else
  {
    *a2 = v3;
  }
  return v7;
}

uint64_t userfs_volume_is_mountable(uint64_t a1, _BYTE *a2)
{
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  _BOOL4 v7;
  uint64_t result;
  NSObject *v9;
  const char *v10;
  _BOOL4 v11;
  _BOOL4 v12;
  uint32_t v13;
  _BOOL4 v14;
  _BOOL4 v15;
  _BOOL4 v16;
  uint64_t v17;
  _BOOL4 v18;
  int v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  unsigned int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  *a2 = 0;
  v4 = *(_QWORD *)(a1 + 376);
  v5 = *(unsigned __int16 *)(v4 + 964);
  if (v5 >= 3 && v5 != 64 && v5 != 576)
  {
    v12 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v12)
      return result;
    v19 = 136315650;
    v20 = "userfs_volume_is_mountable";
    v21 = 1024;
    v22 = 125;
    v23 = 1024;
    v24 = v5;
    v9 = MEMORY[0x24BDACB70];
    v10 = "%s:%d: Refusing to mount volume with role: %u\n";
    v13 = 24;
    goto LABEL_27;
  }
  if ((*(_BYTE *)(v4 + 48) & 2) != 0)
  {
    v11 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v11)
      return result;
    v19 = 136315394;
    v20 = "userfs_volume_is_mountable";
    v21 = 1024;
    v22 = 132;
    v9 = MEMORY[0x24BDACB70];
    v10 = "%s:%d: Refusing to mount conformance volume.\n";
    goto LABEL_26;
  }
  v6 = *(_QWORD *)(v4 + 56);
  if ((v6 & 9) == 0)
  {
    v14 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v14)
      return result;
    v19 = 136315394;
    v20 = "userfs_volume_is_mountable";
    v21 = 1024;
    v22 = 139;
    v9 = MEMORY[0x24BDACB70];
    v10 = "%s:%d: Refusing to mount fully sensitive volume.\n";
    goto LABEL_26;
  }
  if ((v6 & 0x10) != 0)
  {
    v15 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v15)
      return result;
    v19 = 136315394;
    v20 = "userfs_volume_is_mountable";
    v21 = 1024;
    v22 = 146;
    v9 = MEMORY[0x24BDACB70];
    v10 = "%s:%d: Refusing to mount incomplete volume.\n";
    goto LABEL_26;
  }
  if (v5 == 1 && !uuid_is_null((const unsigned __int8 *)(v4 + 1008)))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v19 = 136315394;
      v20 = "userfs_volume_is_mountable";
      v21 = 1024;
      v22 = 154;
      _os_log_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s:%d: Allowing read-only mount of read-only system volume.\n", (uint8_t *)&v19, 0x12u);
    }
    *a2 = 1;
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 376) + 56) & 0x20) != 0)
  {
    v16 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v16)
      return result;
    v19 = 136315394;
    v20 = "userfs_volume_is_mountable";
    v21 = 1024;
    v22 = 161;
    v9 = MEMORY[0x24BDACB70];
    v10 = "%s:%d: Refusing to mount sealed volume.\n";
    goto LABEL_26;
  }
  if (apfs_has_secondary_fsroot(a1))
  {
    v7 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v7)
      return result;
    v19 = 136315394;
    v20 = "userfs_volume_is_mountable";
    v21 = 1024;
    v22 = 168;
    v9 = MEMORY[0x24BDACB70];
    v10 = "%s:%d: Refusing to mount a volume formatted with a secondary fs_root tree.\n";
    goto LABEL_26;
  }
  v17 = *(_QWORD *)(a1 + 376);
  if ((*(_BYTE *)(v17 + 57) & 2) != 0)
  {
    v18 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (v18)
    {
      v19 = 136315394;
      v20 = "userfs_volume_is_mountable";
      v21 = 1024;
      v22 = 175;
      v9 = MEMORY[0x24BDACB70];
      v10 = "%s:%d: Refusing to mount a volume formatted with expanded records.\n";
LABEL_26:
      v13 = 18;
LABEL_27:
      _os_log_impl(&dword_21F566000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v19, v13);
      return 0;
    }
  }
  else if ((*(_BYTE *)(v17 + 48) & 8) != 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v19 = 136315394;
      v20 = "userfs_volume_is_mountable";
      v21 = 1024;
      v22 = 182;
      _os_log_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s:%d: Allowing read-only mount of a volume with attribution tag records.\n", (uint8_t *)&v19, 0x12u);
    }
    result = 1;
    *a2 = 1;
  }
  else
  {
    return 1;
  }
  return result;
}

uint64_t userfs_apfs_mount(uint64_t a1, unint64_t a2, uint64_t a3, int a4, uint64_t *a5)
{
  uint64_t v5;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  _BYTE *v14;
  _BYTE *v15;
  _BYTE *v16;
  uint64_t v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v18 = 0;
  if (a2 <= 0x63)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 376) + 8 * a2 + 184);
    if (a4)
      LODWORD(v18) = 1;
    v8 = apfs_mount(a1, v7, &v18, a3, 0, a5);
    if ((_DWORD)v8)
    {
      v5 = v8;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        userfs_apfs_mount_cold_7();
      goto LABEL_37;
    }
    if (*(_QWORD *)(*(_QWORD *)(*a5 + 376) + 160))
    {
      v9 = revert_to_snapshot(*a5, 0);
      if ((_DWORD)v9)
      {
        v5 = v9;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          userfs_apfs_mount_cold_6();
LABEL_36:
        apfs_unmount(*a5);
LABEL_37:
        *a5 = 0;
        return v5;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v20 = "userfs_apfs_mount";
        v21 = 1024;
        v22 = 276;
        _os_log_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s:%d: Successfully reverted to snapshot.\n", buf, 0x12u);
      }
    }
    v10 = (uint64_t *)*a5;
    if (*(_QWORD *)(*a5 + 480))
      goto LABEL_41;
    v11 = fs_lookup_name((uint64_t *)*a5, 0, "root", 4uLL);
    if (!v11)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        userfs_apfs_mount_cold_2();
      goto LABEL_29;
    }
    v12 = (_BYTE *)v11;
    v10[60] = fs_get_inode((uint64_t)v10, *(_QWORD *)(v11 + 16));
    jobj_release((uint64_t)v10, v12);
    if (v10[60])
    {
LABEL_41:
      if (v10[61])
      {
LABEL_16:
        cleanup_purgatory_dir(*a5);
        return 0;
      }
      v13 = fs_lookup_name(v10, 0, "private-dir", 0xBuLL);
      if (v13)
      {
        v14 = (_BYTE *)v13;
        v10[61] = fs_get_inode((uint64_t)v10, *(_QWORD *)(v13 + 16));
        jobj_release((uint64_t)v10, v14);
        if (v10[61])
          goto LABEL_16;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          userfs_apfs_mount_cold_5();
      }
      else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        userfs_apfs_mount_cold_4();
      }
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      userfs_apfs_mount_cold_3();
    }
LABEL_29:
    v15 = (_BYTE *)v10[61];
    if (v15)
    {
      jobj_release((uint64_t)v10, v15);
      v10[61] = 0;
    }
    v16 = (_BYTE *)v10[60];
    if (v16)
    {
      jobj_release((uint64_t)v10, v16);
      v10[60] = 0;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      userfs_apfs_mount_cold_1();
    v5 = 22;
    goto LABEL_36;
  }
  return 22;
}

void userfs_apfs_unmount(uint64_t a1)
{
  _BYTE *v2;

  v2 = *(_BYTE **)(a1 + 488);
  if (v2)
  {
    jobj_release(a1, v2);
    *(_QWORD *)(a1 + 488) = 0;
  }
  apfs_unmount(a1);
}

uint64_t userfs_nx_mount(int a1, int a2, _QWORD *a3, uint64_t **a4)
{
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  int *v11;
  _OWORD v12[2];

  *(_QWORD *)&v7 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v12[0] = v7;
  v12[1] = v7;
  v11 = 0;
  v8 = dev_init_with_fd(a1, &v11);
  if ((_DWORD)v8)
  {
    v9 = v8;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      userfs_nx_mount_cold_2();
  }
  else
  {
    parse_nx_mount_options(0, (int *)v12);
    WORD4(v12[0]) |= 3u;
    if (a2)
      LODWORD(v12[0]) |= 1u;
    v9 = nx_mount(v11, (uint64_t)v12, a4);
    if ((_DWORD)v9)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        userfs_nx_mount_cold_1();
    }
    else
    {
      *a3 = v11;
    }
  }
  return v9;
}

unint64_t fletcher64_set_cksum(unint64_t *a1, uint32x4_t *a2, unint64_t a3, unint64_t a4, int8x16_t a5, int8x16_t a6)
{
  unint64_t result;
  unint64_t v8;

  result = fletcher64(a2, a3, a4, a5, a6);
  v8 = (HIDWORD(result)
      + result
      - 0xFFFFFFFF
      * ((unint64_t)(((HIDWORD(result) + result) * (unsigned __int128)0x200000003uLL) >> 64) >> 1)) ^ 0xFFFFFFFF;
  *a1 = v8 | ((unint64_t)~((_DWORD)v8
                                + (_DWORD)result
                                + ((unint64_t)(((v8 + result)
                                                                   * (unsigned __int128)0x200000003uLL) >> 64) >> 1)) << 32);
  return result;
}

unint64_t fletcher64_verify_cksum(_QWORD *a1, uint32x4_t *a2, unint64_t a3, unint64_t a4, int8x16_t a5, int8x16_t a6)
{
  unint64_t v7;
  unint64_t v8;

  v7 = fletcher64(a2, a3, a4, a5, a6);
  v8 = (HIDWORD(v7)
      + v7
      - 0xFFFFFFFF
      * ((unint64_t)(((HIDWORD(v7) + v7) * (unsigned __int128)0x200000003uLL) >> 64) >> 1)) ^ 0xFFFFFFFF;
  return (v8 | ((unint64_t)~((_DWORD)v8
                                  + (_DWORD)v7
                                  + ((unint64_t)(((v8 + v7)
                                                                     * (unsigned __int128)0x200000003uLL) >> 64) >> 1)) << 32)) ^ *a1;
}

BOOL nx_is_panic_on_corruption_enabled(uint64_t a1)
{
  if (a1)
    return *(_BYTE *)(a1 + 637) != 0;
  else
    return apfs_corruption_panics & 1;
}

uint64_t nx_calculate_metadata_parameters(unsigned int a1, unint64_t a2, unint64_t a3, unsigned int a4, uint64_t a5)
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;

  *(_QWORD *)(a5 + 208) = 0;
  *(_OWORD *)(a5 + 176) = 0u;
  *(_OWORD *)(a5 + 192) = 0u;
  *(_OWORD *)(a5 + 144) = 0u;
  *(_OWORD *)(a5 + 160) = 0u;
  *(_OWORD *)(a5 + 112) = 0u;
  *(_OWORD *)(a5 + 128) = 0u;
  *(_OWORD *)(a5 + 80) = 0u;
  *(_OWORD *)(a5 + 96) = 0u;
  *(_OWORD *)(a5 + 48) = 0u;
  *(_OWORD *)(a5 + 64) = 0u;
  *(_OWORD *)(a5 + 16) = 0u;
  *(_OWORD *)(a5 + 32) = 0u;
  v5 = 22;
  *(_OWORD *)a5 = 0u;
  if (a1 - 65537 < 0xFFFF0FFF || !a2)
    return v5;
  v6 = 8 * a1;
  v7 = a1 - 40;
  *(_QWORD *)(a5 + 88) = v7 >> 5;
  *(_QWORD *)(a5 + 96) = v7 >> 3;
  *(_QWORD *)(a5 + 8) = a1;
  *(_QWORD *)(a5 + 16) = a2;
  v8 = (a2 + v6 - 1) / v6;
  v9 = (v7 >> 5) - 1;
  v10 = (v9 + v8) / (v7 >> 5);
  *(_QWORD *)(a5 + 24) = v8;
  *(_QWORD *)(a5 + 32) = v10;
  v11 = (v7 >> 3) - 1;
  v12 = (v11 + v10) / (v7 >> 3);
  if (v12 == 1)
    v13 = 0;
  else
    v13 = (v11 + v10) / (v7 >> 3);
  *(_QWORD *)(a5 + 40) = v13;
  *(_QWORD *)(a5 + 48) = a3;
  v14 = (a3 + v6 - 1) / v6;
  v15 = (v9 + v14) / (v7 >> 5);
  *(_QWORD *)(a5 + 56) = v14;
  *(_QWORD *)(a5 + 64) = v15;
  v16 = (v11 + v15) / (v7 >> 3);
  if (v16 == 1)
    v17 = 0;
  else
    v17 = v16;
  *(_QWORD *)(a5 + 72) = v17;
  *(_QWORD *)(a5 + 80) = v6;
  v18 = 3 * (v10 + v8 + v14 + v15 + v13 + v17);
  *(_QWORD *)(a5 + 104) = v18;
  v19 = (unint64_t)(v18 + 63) >> 6;
  v20 = (a1 - 1 + 8 * v19) / a1;
  if (HIDWORD(v20))
    return 27;
  *(_QWORD *)(a5 + 112) = v20;
  *(_QWORD *)(a5 + 120) = 16;
  if (v20 < 0x1000)
  {
    v21 = 16 * v20;
    goto LABEL_14;
  }
  if (v20 >> 13)
    return 27;
  v21 = 65534;
LABEL_14:
  *(_QWORD *)(a5 + 128) = v21;
  v22 = (2 * v21 + 6) & 0x7FFFFFFFFFFFFFF8;
  if (v13)
    v10 = v12;
  if (v17)
    v23 = v16;
  else
    v23 = v15;
  v24 = ((2 * v20 + 6) & 0x7FFFFFFFFFFFFFF8) + 8 * (v20 + v10 + v23) + v22 + 2520;
  if (v24 > 0x100000)
    return 27;
  if (v24 % a1)
    v24 = a1 - 1 + v24 - (a1 - 1 + v24) % a1;
  *(_QWORD *)(a5 + 136) = v24;
  v26 = (a1 - 96 - (((((18725 * ((unsigned __int16)(a1 - 96) >> 2)) >> 15) & 0x3FFC) + 28) & 0x7FE0))
      / 0x30uLL;
  v27 = 0x200000 / a1;
  v28 = 15;
  if (a2 >= 0x100000)
    v29 = 15;
  else
    v29 = 31;
  if (a2 >= 0x100000)
    v30 = 4;
  else
    v30 = 5;
  if (a2 < 0x40000)
  {
    v29 = 63;
    v30 = 6;
  }
  v31 = (v29 + a2) >> v30;
  v32 = v26 - 1;
  v33 = (v26 - 1 + v31) / v26;
  if (v33 >= v27)
    v33 = 0x200000 / a1;
  if (v33 == 2)
    v33 = 3;
  if (a3 >= 0x100000)
  {
    v34 = 4;
  }
  else
  {
    v28 = 31;
    v34 = 5;
  }
  if (a3 < 0x40000)
  {
    v28 = 63;
    v34 = 6;
  }
  v35 = (v32 + ((v28 + a3) >> v34)) / v26;
  if (v35 >= v27)
    v35 = 0x200000 / a1;
  if (v35 == 2)
    v35 = 3;
  *(_QWORD *)(a5 + 152) = v33;
  *(_QWORD *)(a5 + 160) = v35;
  v36 = a3 + a2;
  if ((a3 + a2) >> 18)
  {
    if (v36 >> 20)
      v19 = (unint64_t)(v18 + 15) >> 4;
    else
      v19 = (unint64_t)(v18 + 31) >> 5;
  }
  v37 = (v32 + v19) / v26;
  if (v37 >= v27)
    v37 = 0x200000 / a1;
  if (v37 == 2)
    v37 = 3;
  *(_QWORD *)(a5 + 144) = v37;
  v38 = v24 / a1;
  v39 = v38 - 1;
  if (v38 <= 1)
    v39 = 0;
  v40 = 8;
  if (v33 < 8)
    v40 = v33;
  *(_QWORD *)(a5 + 192) = 4;
  *(_QWORD *)(a5 + 200) = v40;
  if (a4)
  {
    if (a4 > 0x64)
      return 22;
  }
  else
  {
    v41 = v36 * a1;
    v42 = (v36 * a1) >> 29;
    if ((v41 & 0x1FFFFFFF) != 0)
      v43 = v42 + 1;
    else
      v43 = v42;
    if (v43 >= 0x64)
      a4 = 100;
    else
      a4 = v43;
  }
  *(_QWORD *)(a5 + 184) = a4;
  v44 = v40 * a4;
  v45 = 2;
  if (a3)
    v45 = 3;
  v46 = v45 + v33 + v35 + v37 + v38 + v39 + 8 * v44;
  *(_QWORD *)(a5 + 168) = 4
                        * ((unsigned __int16)(v46 + (unsigned __int16)(a1 - 40) / 0x28u - 1)
                         / ((unsigned __int16)(a1 - 40)
                          / 0x28u))
                        + 4;
  *(_QWORD *)(a5 + 176) = 4 * v46;
  *(_QWORD *)(a5 + 208) = 0;
  v5 = 0;
  if (a3)
  {
    v47 = 0x100000000;
    if (0x800000000uLL / a1 < a2)
      v47 = 0x200000000;
    v48 = v47 / a1;
    if (v48 >= a2 / 5)
      v48 = a2 / 5;
    *(_QWORD *)(a5 + 208) = v48;
  }
  return v5;
}

uint64_t nx_get_evict_mapping_tree(uint64_t a1, unsigned int a2, unint64_t a3, int a4, int a5, uint64_t *a6)
{
  uint64_t result;
  uint64_t (*v12)(uint64_t, _QWORD *, uint64_t, _QWORD *, uint64_t, int *);
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v13 = 0;
  v14 = 0u;
  v18 = 0;
  v16 = 0u;
  v17 = 0u;
  v15 = 0u;
  v12 = evict_mapping_key_compare;
  DWORD2(v13) = 33;
  HIDWORD(v13) = a4;
  result = btree_get_extended(a1, a2, a3, 0, 0, (uint64_t)&v12, 0, a6);
  if ((_DWORD)result == 92)
  {
    if (a5)
    {
      v13 = 0u;
      v14 = 0u;
      v18 = 0;
      v16 = 0u;
      v17 = 0u;
      v15 = 0u;
      v12 = evict_mapping_key_compare;
      HIDWORD(v13) = a4;
      result = btree_get_extended(a1, 0, a3, 0, 0, (uint64_t)&v12, 0, a6);
      if (!(_DWORD)result)
      {
        result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
        if ((_DWORD)result)
        {
          nx_get_evict_mapping_tree_cold_1();
          return 0;
        }
      }
    }
  }
  return result;
}

uint64_t nx_init_phys(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v5;
  uint64_t v6;
  const unsigned __int8 *v7;
  uint64_t result;

  if (!a3)
    return 22;
  v5 = *(_DWORD *)(a3 + 4);
  *(_DWORD *)(a1 + 32) = 1112758350;
  *(_DWORD *)(a1 + 36) = v5;
  *(_QWORD *)(a1 + 1264) = 0;
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a3 + 8);
  *(_OWORD *)(a1 + 56) = xmmword_21F61EBF0;
  v6 = *(_QWORD *)(a3 + 32);
  *(_QWORD *)(a1 + 88) = 1024;
  *(_QWORD *)(a1 + 96) = v6;
  uuid_copy((unsigned __int8 *)(a1 + 72), (const unsigned __int8 *)(a3 + 64));
  v7 = (const unsigned __int8 *)(a3 + 80);
  if (uuid_is_null(v7))
    return 0;
  uuid_copy((unsigned __int8 *)(a1 + 1280), v7);
  result = 0;
  *(_QWORD *)(a1 + 64) |= 0x100uLL;
  return result;
}

uint64_t nx_init(uint64_t a1, unsigned int *a2)
{
  uint64_t v3;
  unsigned int v4;
  uint64_t v5;

  if (!a2)
    return 22;
  v3 = *(_QWORD *)(a1 + 56);
  v4 = *a2;
  *(_DWORD *)(a1 + 648) = *a2;
  *(_DWORD *)(a1 + 652) = *(_DWORD *)(v3 + 36) / v4;
  v5 = *((_QWORD *)a2 + 3);
  *(_QWORD *)(a1 + 376) = v3;
  *(_QWORD *)(a1 + 384) = v5;
  LODWORD(v5) = a2[11];
  *(_BYTE *)(a1 + 627) = a2[10] != 0;
  *(_BYTE *)(a1 + 628) = (_DWORD)v5 != 0;
  LODWORD(v5) = a2[13];
  *(_BYTE *)(a1 + 629) = a2[12] != 0;
  *(_BYTE *)(a1 + 631) = (_DWORD)v5 != 0;
  LODWORD(v5) = a2[15];
  *(_BYTE *)(a1 + 632) = a2[14] != 0;
  *(_BYTE *)(a1 + 633) = (_DWORD)v5 != 0;
  *(_QWORD *)(a1 + 392) = *(_QWORD *)a1;
  new_lock((pthread_mutex_t *)(a1 + 656));
  new_lock((pthread_mutex_t *)(a1 + 848));
  *(_QWORD *)(a1 + 912) = nx_keybag_init(a1);
  *(_QWORD *)(a1 + 920) = 0;
  new_rwlock((pthread_rwlock_t *)(a1 + 928));
  *(_QWORD *)(a1 + 1128) = 0;
  *(_QWORD *)(a1 + 1336) = 0;
  *(_BYTE *)(a1 + 635) = 0;
  new_lock((pthread_mutex_t *)(a1 + 1808));
  new_rwlock((pthread_rwlock_t *)(a1 + 1136));
  new_lock((pthread_mutex_t *)(a1 + 736));
  *(_QWORD *)(a1 + 812) = 0;
  *(_QWORD *)(a1 + 800) = 0;
  *(_WORD *)(a1 + 808) = 0;
  new_lock((pthread_mutex_t *)(a1 + 504));
  new_cv((pthread_cond_t *)(a1 + 568));
  return 0;
}

uint64_t nx_destroy(uint64_t a1)
{
  uint64_t *v2;

  v2 = *(uint64_t **)(a1 + 720);
  if (v2 && !*(_DWORD *)(*(_QWORD *)a1 + 912))
    obj_release(v2);
  free_rwlock((pthread_rwlock_t *)(a1 + 928));
  free_rwlock((pthread_rwlock_t *)(a1 + 1136));
  free_lock((pthread_mutex_t *)(a1 + 848));
  free_lock((pthread_mutex_t *)(a1 + 656));
  nx_keybag_free(*(_QWORD *)(a1 + 912));
  free_lock((pthread_mutex_t *)(a1 + 1808));
  free_lock((pthread_mutex_t *)(a1 + 736));
  free_lock((pthread_mutex_t *)(a1 + 504));
  free_cv((pthread_cond_t *)(a1 + 568));
  return 0;
}

uint64_t nx_fusion_superblock_write(uint64_t a1, const void *a2)
{
  uint64_t v2;
  _BYTE *v6;
  int8x16_t v7;
  int8x16_t v8;
  uint64_t v9;

  v2 = *(_QWORD *)(a1 + 376);
  if ((*(_BYTE *)(v2 + 65) & 1) == 0)
    return 0;
  v6 = _apfs_malloc(*(unsigned int *)(v2 + 36));
  memcpy(v6, a2, *(unsigned int *)(*(_QWORD *)(a1 + 376) + 36));
  v6[1295] |= 1u;
  obj_checksum_set_phys(a1, (uint64_t)v6, *(_DWORD *)(*(_QWORD *)(a1 + 376) + 36), v7, v8);
  v9 = dev_write(*(_QWORD *)(a1 + 384), 0x4000000000000000uLL >> __clz(__rbit64(*(unsigned int *)(*(_QWORD *)(a1 + 376) + 36))));
  _apfs_free(v6, *(unsigned int *)(*(_QWORD *)(a1 + 376) + 36));
  return v9;
}

uint64_t nx_checkpoint_traverse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  unsigned int v57;
  uint64_t *v58;
  _QWORD v59[2];
  uint64_t *v60;
  uint64_t *v61;
  char *v62;
  char *v63;
  uint8_t buf[4];
  const char *v65;
  __int16 v66;
  int v67;
  __int16 v68;
  uint64_t v69;
  __int16 v70;
  _BYTE v71[30];
  __int16 v72;
  int v73;
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v62 = 0;
  v63 = 0;
  v60 = 0;
  v61 = 0;
  v6 = spaceman_get((_QWORD *)a1, &v63);
  if ((_DWORD)v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)(a1 + 400);
    if (v8 && *(_DWORD *)(v8 + 76))
      return v7;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v15 = *(_QWORD *)(a1 + 384) + 208;
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 376) + 152);
      v17 = "<UNKNOWN>";
      v65 = "nx_checkpoint_traverse";
      if ((_DWORD)a3 == 2)
        v17 = "FIXUP";
      v67 = 831;
      *(_DWORD *)buf = 136316418;
      v66 = 1024;
      if ((_DWORD)a3 == 1)
        v17 = "START";
      v68 = 2080;
      v69 = v15;
      v70 = 2048;
      *(_QWORD *)v71 = v16;
      *(_WORD *)&v71[8] = 2080;
      *(_QWORD *)&v71[10] = v17;
      *(_WORD *)&v71[18] = 1024;
      *(_DWORD *)&v71[20] = v7;
      _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: %s failed to get spaceman oid %lld for checkpoint %s traverse: %d\n", buf, 0x36u);
      v8 = *(_QWORD *)(a1 + 400);
      if (!v8)
        return v7;
    }
    else if (!v8)
    {
      return v7;
    }
    v9 = 831;
    goto LABEL_13;
  }
  v7 = spaceman_checkpoint_traverse(a1, a2, (uint64_t)v63, a3);
  obj_release((uint64_t *)v63);
  if ((_DWORD)v7)
  {
    v8 = *(_QWORD *)(a1 + 400);
    if (v8 && *(_DWORD *)(v8 + 76))
      return v7;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v21 = *(_QWORD *)(a1 + 384);
      v22 = "<UNKNOWN>";
      v65 = "nx_checkpoint_traverse";
      *(_DWORD *)buf = 136316162;
      v23 = v21 + 208;
      if ((_DWORD)a3 == 2)
        v22 = "FIXUP";
      v67 = 838;
      v69 = v23;
      v24 = "START";
      v66 = 1024;
      v68 = 2080;
      if ((_DWORD)a3 != 1)
        v24 = v22;
      v70 = 2080;
      *(_QWORD *)v71 = v24;
      *(_WORD *)&v71[8] = 1024;
      *(_DWORD *)&v71[10] = v7;
      _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: %s spaceman checkpoint %s traverse failed: %d\n", buf, 0x2Cu);
      v8 = *(_QWORD *)(a1 + 400);
      if (!v8)
        return v7;
    }
    else if (!v8)
    {
      return v7;
    }
    v9 = 838;
    goto LABEL_13;
  }
  v11 = *(_QWORD *)(a1 + 376);
  v12 = *(_QWORD *)(v11 + 160);
  if (v12 && !*(_DWORD *)(a1 + 728))
  {
    v14 = obj_get(*(_QWORD *)(a1 + 392), 0x40000000u, v12, (int *)&om_desc, 0, 0, 0, 0, (uint64_t *)&v61);
    if ((_DWORD)v14)
    {
      v7 = v14;
      v8 = *(_QWORD *)(a1 + 400);
      if (v8 && *(_DWORD *)(v8 + 76))
        return v7;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        v29 = *(_QWORD *)(a1 + 384);
        v30 = "<UNKNOWN>";
        v65 = "nx_checkpoint_traverse";
        *(_DWORD *)buf = 136316162;
        v31 = v29 + 208;
        if ((_DWORD)a3 == 2)
          v30 = "FIXUP";
        v67 = 848;
        v69 = v31;
        v32 = "START";
        v66 = 1024;
        v68 = 2080;
        if ((_DWORD)a3 != 1)
          v32 = v30;
        v70 = 2080;
        *(_QWORD *)v71 = v32;
        *(_WORD *)&v71[8] = 1024;
        *(_DWORD *)&v71[10] = v7;
        _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: %s failed to get omap for checkpoint %s traverse: %d\n", buf, 0x2Cu);
        v8 = *(_QWORD *)(a1 + 400);
        if (!v8)
          return v7;
      }
      else if (!v8)
      {
        return v7;
      }
      v9 = 848;
    }
    else
    {
      v7 = omap_checkpoint_traverse(a1, a2, (uint64_t)v61, a3);
      obj_release(v61);
      if (!(_DWORD)v7)
      {
        v11 = *(_QWORD *)(a1 + 376);
        goto LABEL_17;
      }
      v8 = *(_QWORD *)(a1 + 400);
      if (v8 && *(_DWORD *)(v8 + 76))
        return v7;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        v48 = *(_QWORD *)(a1 + 384);
        v49 = "<UNKNOWN>";
        v65 = "nx_checkpoint_traverse";
        *(_DWORD *)buf = 136316162;
        v50 = v48 + 208;
        if ((_DWORD)a3 == 2)
          v49 = "FIXUP";
        v67 = 854;
        v69 = v50;
        v51 = "START";
        v66 = 1024;
        v68 = 2080;
        if ((_DWORD)a3 != 1)
          v51 = v49;
        v70 = 2080;
        *(_QWORD *)v71 = v51;
        *(_WORD *)&v71[8] = 1024;
        *(_DWORD *)&v71[10] = v7;
        _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: %s omap checkpoint %s traverse failed: %d\n", buf, 0x2Cu);
        v8 = *(_QWORD *)(a1 + 400);
        if (!v8)
          return v7;
      }
      else if (!v8)
      {
        return v7;
      }
      v9 = 854;
    }
LABEL_13:
    *(_DWORD *)(v8 + 76) = v9;
    ++*(_WORD *)(v8 + 80);
    return v7;
  }
LABEL_17:
  if (*(_QWORD *)(v11 + 168))
  {
    v13 = nx_reaper_get((_QWORD *)a1, &v62);
    if ((_DWORD)v13)
    {
      v7 = v13;
      v8 = *(_QWORD *)(a1 + 400);
      if (v8 && *(_DWORD *)(v8 + 76))
        return v7;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        v25 = *(_QWORD *)(a1 + 384);
        v26 = "<UNKNOWN>";
        v65 = "nx_checkpoint_traverse";
        *(_DWORD *)buf = 136316162;
        v27 = v25 + 208;
        if ((_DWORD)a3 == 2)
          v26 = "FIXUP";
        v67 = 867;
        v69 = v27;
        v28 = "START";
        v66 = 1024;
        v68 = 2080;
        if ((_DWORD)a3 != 1)
          v28 = v26;
        v70 = 2080;
        *(_QWORD *)v71 = v28;
        *(_WORD *)&v71[8] = 1024;
        *(_DWORD *)&v71[10] = v7;
        _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: %s failed to get reaper for checkpoint %s traverse: %d\n", buf, 0x2Cu);
        v8 = *(_QWORD *)(a1 + 400);
        if (!v8)
          return v7;
      }
      else if (!v8)
      {
        return v7;
      }
      v9 = 867;
      goto LABEL_13;
    }
    v7 = nx_reaper_checkpoint_traverse((uint64_t *)a1, a2, (uint64_t)v62, a3);
    obj_release((uint64_t *)v62);
    if ((_DWORD)v7)
    {
      v8 = *(_QWORD *)(a1 + 400);
      if (v8 && *(_DWORD *)(v8 + 76))
        return v7;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        v33 = *(_QWORD *)(a1 + 384);
        v34 = "<UNKNOWN>";
        v65 = "nx_checkpoint_traverse";
        *(_DWORD *)buf = 136316162;
        v35 = v33 + 208;
        if ((_DWORD)a3 == 2)
          v34 = "FIXUP";
        v67 = 874;
        v69 = v35;
        v36 = "START";
        v66 = 1024;
        v68 = 2080;
        if ((_DWORD)a3 != 1)
          v36 = v34;
        v70 = 2080;
        *(_QWORD *)v71 = v36;
        *(_WORD *)&v71[8] = 1024;
        *(_DWORD *)&v71[10] = v7;
        _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: %s nx reaper checkpoint %s traverse failed: %d\n", buf, 0x2Cu);
        v8 = *(_QWORD *)(a1 + 400);
        if (!v8)
          return v7;
      }
      else if (!v8)
      {
        return v7;
      }
      v9 = 874;
      goto LABEL_13;
    }
    v11 = *(_QWORD *)(a1 + 376);
  }
  if (!*(_DWORD *)(v11 + 180))
  {
LABEL_56:
    if (!*(_QWORD *)(v11 + 1344) || !obj_type_is_or_contains_ephemeral(*(_DWORD *)(v11 + 176)))
      return 0;
    v59[0] = 0;
    v59[1] = 0;
    v58 = 0;
    v57 = 0;
    v7 = obj_descriptor_and_flags_for_type(*(_DWORD *)(*(_QWORD *)(a1 + 376) + 176), &v57, (uint64_t)v59);
    HIDWORD(v59[0]) = 255;
    if ((_DWORD)v7
      || (v7 = obj_get(*(_QWORD *)(a1 + 392), v57, *(_QWORD *)(*(_QWORD *)(a1 + 376) + 1344), (int *)v59, 0, 0, 0, 0, (uint64_t *)&v58), (_DWORD)v7))
    {
      v8 = *(_QWORD *)(a1 + 400);
      if (v8 && *(_DWORD *)(v8 + 76))
        return v7;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        v37 = *(_QWORD *)(a1 + 376);
        v38 = *(_QWORD *)(a1 + 384) + 208;
        v39 = *(_QWORD *)(v37 + 1344);
        v40 = *(_DWORD *)(v37 + 176);
        v41 = "<UNKNOWN>";
        if ((_DWORD)a3 == 2)
          v41 = "FIXUP";
        *(_DWORD *)buf = 136316930;
        v65 = "nx_checkpoint_traverse";
        if ((_DWORD)a3 == 1)
          v41 = "START";
        v66 = 1024;
        v67 = 925;
        v68 = 2080;
        v69 = v38;
        v70 = 2048;
        *(_QWORD *)v71 = v39;
        *(_WORD *)&v71[8] = 1024;
        *(_DWORD *)&v71[10] = v40;
        *(_WORD *)&v71[14] = 1024;
        *(_DWORD *)&v71[16] = 255;
        *(_WORD *)&v71[20] = 2080;
        *(_QWORD *)&v71[22] = v41;
        v72 = 1024;
        v73 = v7;
        _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: %s unable to get test object 0x%llx of type 0x%x/0x%x for checkpoint %s traverse: %d\n", buf, 0x42u);
        v8 = *(_QWORD *)(a1 + 400);
        if (!v8)
          return v7;
      }
      else if (!v8)
      {
        return v7;
      }
      v9 = 925;
    }
    else
    {
      v7 = obj_checkpoint_traverse(a1, a2, (uint64_t)v58, a3);
      obj_release(v58);
      if (!(_DWORD)v7)
        return v7;
      v8 = *(_QWORD *)(a1 + 400);
      if (v8)
      {
        if (*(_DWORD *)(v8 + 76))
          return v7;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        v52 = "<UNKNOWN>";
        v53 = *(_QWORD *)(a1 + 376);
        v54 = *(_QWORD *)(a1 + 384) + 208;
        v55 = *(_QWORD *)(v53 + 1344);
        if ((_DWORD)a3 == 2)
          v52 = "FIXUP";
        v56 = *(_DWORD *)(v53 + 176);
        *(_DWORD *)buf = 136316930;
        v65 = "nx_checkpoint_traverse";
        if ((_DWORD)a3 == 1)
          v52 = "START";
        v66 = 1024;
        v67 = 931;
        v68 = 2080;
        v69 = v54;
        v70 = 2080;
        *(_QWORD *)v71 = v52;
        *(_WORD *)&v71[8] = 2048;
        *(_QWORD *)&v71[10] = v55;
        *(_WORD *)&v71[18] = 1024;
        *(_DWORD *)&v71[20] = v56;
        *(_WORD *)&v71[24] = 1024;
        *(_DWORD *)&v71[26] = 255;
        v72 = 1024;
        v73 = v7;
        _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: %s failed to checkpoint %s traverse test object 0x%llx of type 0x%x/0x%x: %d\n", buf, 0x42u);
        v8 = *(_QWORD *)(a1 + 400);
        if (!v8)
          return v7;
      }
      else if (!v8)
      {
        return v7;
      }
      v9 = 931;
    }
    goto LABEL_13;
  }
  v18 = 0;
  while (1)
  {
    v19 = *(_QWORD *)(v11 + 8 * v18 + 184);
    if (v19)
      break;
LABEL_55:
    if (++v18 >= (unint64_t)*(unsigned int *)(v11 + 180))
      goto LABEL_56;
  }
  v20 = obj_get(*(_QWORD *)(a1 + 392), 0, v19, (int *)&apfs_desc, 0, 0, 0, 0, (uint64_t *)&v60);
  if ((_DWORD)v20)
  {
    v7 = v20;
    v8 = *(_QWORD *)(a1 + 400);
    if (v8 && *(_DWORD *)(v8 + 76))
      return v7;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v42 = *(_QWORD *)(a1 + 384);
      v43 = "<UNKNOWN>";
      v65 = "nx_checkpoint_traverse";
      v67 = 898;
      *(_DWORD *)buf = 136316674;
      if ((_DWORD)a3 == 2)
        v43 = "FIXUP";
      v66 = 1024;
      v68 = 2080;
      v69 = v42 + 208;
      v44 = "START";
      if ((_DWORD)a3 != 1)
        v44 = v43;
      v70 = 1024;
      *(_DWORD *)v71 = v18;
      *(_WORD *)&v71[4] = 2048;
      *(_QWORD *)&v71[6] = v19;
      *(_WORD *)&v71[14] = 2080;
      *(_QWORD *)&v71[16] = v44;
      *(_WORD *)&v71[24] = 1024;
      *(_DWORD *)&v71[26] = v7;
      _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: %s failed to get fs[%d] oid %lld for checkpoint %s traverse: %d\n", buf, 0x3Cu);
      v8 = *(_QWORD *)(a1 + 400);
      if (!v8)
        return v7;
    }
    else if (!v8)
    {
      return v7;
    }
    v9 = 898;
    goto LABEL_13;
  }
  v7 = apfs_checkpoint_traverse(a1, a2, (uint64_t)v60, a3);
  obj_release(v60);
  if (!(_DWORD)v7)
  {
    v11 = *(_QWORD *)(a1 + 376);
    goto LABEL_55;
  }
  v8 = *(_QWORD *)(a1 + 400);
  if (v8 && *(_DWORD *)(v8 + 76))
    return v7;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v45 = *(_QWORD *)(a1 + 384);
    v46 = "<UNKNOWN>";
    v65 = "nx_checkpoint_traverse";
    v67 = 904;
    *(_DWORD *)buf = 136316418;
    if ((_DWORD)a3 == 2)
      v46 = "FIXUP";
    v66 = 1024;
    v68 = 2080;
    v69 = v45 + 208;
    v47 = "START";
    if ((_DWORD)a3 != 1)
      v47 = v46;
    v70 = 1024;
    *(_DWORD *)v71 = v18;
    *(_WORD *)&v71[4] = 2080;
    *(_QWORD *)&v71[6] = v47;
    *(_WORD *)&v71[14] = 1024;
    *(_DWORD *)&v71[16] = v7;
    _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: %s fs[%d] checkpoint %s traverse failed: %d\n", buf, 0x32u);
    v8 = *(_QWORD *)(a1 + 400);
    if (!v8)
      return v7;
LABEL_75:
    v9 = 904;
    goto LABEL_13;
  }
  if (v8)
    goto LABEL_75;
  return v7;
}

uint64_t nx_reaper_get(_QWORD *a1, char **a2)
{
  char *v3;
  uint64_t result;

  v3 = (char *)a1[53];
  *a2 = v3;
  if (v3)
    goto LABEL_2;
  result = obj_get(a1[49], 0x80000000, *(_QWORD *)(a1[47] + 168), &nx_reaper_desc, 0, 0, 0, 0, a2);
  if (!(_DWORD)result)
  {
    a1[53] = *a2;
    v3 = *a2;
LABEL_2:
    obj_retain(v3);
    return 0;
  }
  return result;
}

uint64_t nx_reaper_checkpoint_traverse(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  int v19;
  int *v20;
  int v21;
  int v22;
  uint64_t v23;
  _QWORD *v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  NSObject *v32;
  int v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v43;
  _QWORD *v44;
  int v46;
  unsigned int v47;
  unint64_t v48;
  uint64_t *v49;
  char *v50;
  unsigned int *v51;
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  int v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  _BYTE v59[10];
  int v60;
  uint64_t v61;

  v4 = a4;
  v61 = *MEMORY[0x24BDAC8D0];
  v6 = *(_QWORD *)(a3 + 376);
  v49 = 0;
  if ((_DWORD)a4 == 2)
  {
    v7 = obj_checkpoint_known(a3);
LABEL_5:
    v8 = v7;
    if ((_DWORD)v7)
      return v8;
    goto LABEL_6;
  }
  if ((_DWORD)a4 == 1)
  {
    v7 = obj_checkpoint_start((unsigned int *)a3);
    goto LABEL_5;
  }
LABEL_6:
  v50 = (char *)0xAAAAAAAAAAAAAAAALL;
  v51 = (unsigned int *)0xAAAAAAAAAAAAAAAALL;
  if (*(_QWORD *)(v6 + 88) && obj_type_is_or_contains_ephemeral(*(_DWORD *)(v6 + 72)))
  {
    v8 = 0;
    if ((*(_DWORD *)(v6 + 104) & 0x10) == 0 && (*(_DWORD *)(v6 + 104) & 6) != 2)
    {
      v9 = nx_reaper_obj_get(a1, *(_DWORD *)(v6 + 72), *(_DWORD *)(v6 + 76), *(_QWORD *)(v6 + 80), *(_QWORD *)(v6 + 88), &v49, &v50);
      if ((_DWORD)v9)
      {
        v8 = v9;
        v10 = a1[50];
        if ((!v10 || !*(_DWORD *)(v10 + 76)) && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          nx_reaper_checkpoint_traverse_cold_2();
      }
      else
      {
        if (v49)
          v43 = v49;
        else
          v43 = a1;
        v8 = obj_checkpoint_traverse((uint64_t)v43, a2, (uint64_t)v50, v4);
        obj_release((uint64_t *)v50);
      }
      if (v49)
      {
        obj_release(v49);
        v49 = 0;
      }
    }
  }
  else
  {
    v8 = 0;
  }
  if ((_DWORD)v8)
    return v8;
  v11 = *(_QWORD *)(v6 + 48);
  if (!v11)
    return v8;
  v44 = a1 + 48;
  v46 = *(_DWORD *)(v6 + 68);
  v47 = v4;
  do
  {
    v12 = obj_get(a1[49], 0x80000000, v11, (int *)&nx_reap_list_desc, 0, 0, 0, 0, (uint64_t *)&v51);
    if ((_DWORD)v12)
    {
      v8 = v12;
      v41 = a1[50];
      if ((!v41 || !*(_DWORD *)(v41 + 76)) && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        nx_reaper_checkpoint_traverse_cold_1();
      return v8;
    }
    v13 = *((_QWORD *)v51 + 47);
    if ((_DWORD)v4 == 2)
    {
      v14 = obj_checkpoint_known((uint64_t)v51);
      goto LABEL_24;
    }
    if ((_DWORD)v4 == 1)
    {
      v14 = obj_checkpoint_start(v51);
LABEL_24:
      v8 = v14;
      goto LABEL_26;
    }
    v8 = 0;
LABEL_26:
    v48 = *(_QWORD *)(v13 + 32);
    if ((_DWORD)v8)
      goto LABEL_59;
    v15 = *(unsigned int *)(v13 + 52);
    if (v15 == 0xFFFFFFFF)
      goto LABEL_59;
    v16 = 0xFFFFFFFFLL;
    while (1)
    {
      v17 = *(unsigned int *)(v13 + 40 * v15 + 64);
      if ((_DWORD)v17 != -1 && v17 > *(unsigned int *)(v13 + 44))
        break;
      v18 = v13 + 40 * v15;
      v21 = *(_DWORD *)(v18 + 72);
      v20 = (int *)(v18 + 72);
      v19 = v21;
      if ((v21 != *(_DWORD *)(v6 + 72) || *(_QWORD *)(v13 + 40 * v15 + 88) != *(_QWORD *)(v6 + 88))
        && (v16 == 0xFFFFFFFFLL
         || v19 != *(_DWORD *)(v13 + 40 * v16 + 72)
         || *(_QWORD *)(v13 + 64 + 40 * v15 + 24) != *(_QWORD *)(v13 + 64 + 40 * v16 + 24)))
      {
        v8 = 0;
        if ((*(_DWORD *)(v13 + 40 * v15 + 68) & 0x10) != 0 || (*(_DWORD *)(v13 + 40 * v15 + 68) & 6) == 2)
          goto LABEL_51;
        if (obj_type_is_or_contains_ephemeral(v19))
        {
          v22 = *v20;
          v23 = v13 + 40 * v15;
          v25 = *(_QWORD *)(v23 + 88);
          v24 = (_QWORD *)(v23 + 88);
          v26 = nx_reaper_obj_get(a1, v22, *((_DWORD *)v24 - 3), *(v24 - 1), v25, &v49, &v50);
          if ((_DWORD)v26)
          {
            v8 = v26;
            v27 = a1[50];
            if ((!v27 || !*(_DWORD *)(v27 + 76)) && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            {
              v28 = *v44 + 208;
              v29 = *v24;
              *(_DWORD *)buf = 136316162;
              v53 = "nx_reaper_checkpoint_traverse";
              v54 = 1024;
              v55 = 1287;
              v56 = 2080;
              v57 = v28;
              v58 = 2048;
              *(_QWORD *)v59 = v29;
              *(_WORD *)&v59[8] = 1024;
              v60 = v8;
              _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: %s failed to get object oid %lld: %d\n", buf, 0x2Cu);
            }
          }
          else
          {
            if (v49)
              v30 = v49;
            else
              v30 = a1;
            v8 = obj_checkpoint_traverse((uint64_t)v30, a2, (uint64_t)v50, v47);
            obj_release((uint64_t *)v50);
          }
          if (v49)
          {
            obj_release(v49);
            v49 = 0;
          }
          goto LABEL_51;
        }
      }
      v8 = 0;
LABEL_51:
      if (!(_DWORD)v8)
      {
        v16 = v15;
        v15 = v17;
        if (v17 != 0xFFFFFFFF)
          continue;
      }
      goto LABEL_59;
    }
    v31 = a1[50];
    v32 = MEMORY[0x24BDACB70];
    if ((!v31 || !*(_DWORD *)(v31 + 76)) && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v40 = *v44 + 208;
      *(_DWORD *)buf = 136316162;
      v53 = "nx_reaper_checkpoint_traverse";
      v54 = 1024;
      v55 = 1249;
      v56 = 2080;
      v57 = v40;
      v58 = 1024;
      *(_DWORD *)v59 = v15;
      *(_WORD *)&v59[4] = 1024;
      *(_DWORD *)&v59[6] = v17;
      _os_log_error_impl(&dword_21F566000, v32, OS_LOG_TYPE_ERROR, "%s:%d: %s Invalid reap list entry nrl_entries[%d].nrle_next = %d\n", buf, 0x28u);
    }
    obj_release((uint64_t *)v51);
    v8 = nx_corruption_detected_int((uint64_t)a1, (uint64_t)"nx_reaper_checkpoint_traverse", 1252);
LABEL_59:
    v33 = *(_DWORD *)(v6 + 68);
    if (v33)
    {
      v34 = v46 - 1;
      v11 = v48;
      if (v48 && v46 == 1)
      {
        v35 = a1[50];
        if ((!v35 || !*(_DWORD *)(v35 + 76)) && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          v39 = *v44 + 208;
          *(_DWORD *)buf = 136315906;
          v53 = "nx_reaper_checkpoint_traverse";
          v54 = 1024;
          v55 = 1303;
          v56 = 2080;
          v57 = v39;
          v58 = 1024;
          *(_DWORD *)v59 = v33;
          _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: %s reap list expected %u objects, but haven't seen last reap list object yet\n", buf, 0x22u);
        }
        v8 = nx_corruption_detected_int((uint64_t)a1, (uint64_t)"nx_reaper_checkpoint_traverse", 1305);
        v46 = 0;
      }
      else
      {
        --v46;
        if (!v48)
        {
          if (v34)
          {
            v36 = a1[50];
            if (!v36 || !*(_DWORD *)(v36 + 76))
            {
              v37 = MEMORY[0x24BDACB70];
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
              {
                v38 = *v44 + 208;
                *(_DWORD *)buf = 136316162;
                v53 = "nx_reaper_checkpoint_traverse";
                v54 = 1024;
                v55 = 1308;
                v56 = 2080;
                v57 = v38;
                v58 = 1024;
                *(_DWORD *)v59 = v33;
                *(_WORD *)&v59[4] = 1024;
                *(_DWORD *)&v59[6] = v46;
                _os_log_impl(&dword_21F566000, v37, OS_LOG_TYPE_DEFAULT, "%s:%d: %s reap list expected %u objects, but got last reap list object with %u more objects left\n", buf, 0x28u);
              }
            }
          }
        }
      }
    }
    else
    {
      v11 = v48;
    }
    obj_release((uint64_t *)v51);
    LODWORD(v4) = v47;
  }
  while (!(_DWORD)v8 && v11);
  return v8;
}

uint64_t nx_reaper_init_phys(uint64_t a1, int a2)
{
  *(_QWORD *)(a1 + 32) = 1;
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 56) = 0;
  *(_DWORD *)(a1 + 64) = 1;
  *(_DWORD *)(a1 + 108) = (a2 & 0xFFFFFFFC) - 112;
  return 0;
}

uint64_t nx_reaper_init(_QWORD *a1)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  int v7;
  _BOOL4 v8;
  int v9;
  BOOL v10;
  uint64_t result;
  unsigned int v13;

  v2 = a1[7];
  v4 = *(_QWORD *)(v2 + 32);
  v3 = *(_QWORD *)(v2 + 40);
  v5 = *(unsigned int *)(v2 + 108);
  v6 = (obj_size_phys((uint64_t)a1) & 0xFFFFFFFCLL) - 112;
  if (v3 < v4)
    v7 = 1;
  else
    v7 = 2;
  if (v6 >= v5)
    v8 = v3 >= v4;
  else
    v8 = v7;
  v9 = *(_DWORD *)(v2 + 68);
  if (v9 == 1)
  {
    v10 = *(_QWORD *)(v2 + 48) == *(_QWORD *)(v2 + 56);
  }
  else
  {
    if (v9)
    {
      if (v8)
        goto LABEL_19;
      goto LABEL_20;
    }
    if (*(_QWORD *)(v2 + 48))
      goto LABEL_19;
    v10 = *(_QWORD *)(v2 + 56) == 0;
  }
  if (!v10 || v8)
  {
LABEL_19:
    result = nx_corruption_detected_int(*(_QWORD *)(*a1 + 392), (uint64_t)"nx_reaper_sanity_check", 979);
    if ((_DWORD)result)
      return result;
  }
LABEL_20:
  a1[47] = v2;
  v13 = obj_size_phys((uint64_t)a1);
  result = 0;
  a1[48] = v2 + v13 - *(unsigned int *)(v2 + 108);
  return result;
}

uint64_t nx_reap_list_init_phys(uint64_t a1, unsigned int a2)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _DWORD *v5;

  v2 = ((unint64_t)a2 - 64) / 0x28;
  *(_DWORD *)(a1 + 44) = v2;
  *(_QWORD *)(a1 + 52) = -1;
  *(_DWORD *)(a1 + 60) = 0;
  v3 = (v2 - 1);
  if ((_DWORD)v3)
  {
    v4 = 0;
    v5 = (_DWORD *)(a1 + 64);
    do
    {
      *v5 = ++v4;
      v5 += 10;
    }
    while (v3 != v4);
  }
  else
  {
    LODWORD(v3) = 0;
  }
  *(_DWORD *)(a1 + 40 * v3 + 64) = -1;
  return 0;
}

uint64_t nx_reap_list_init(_QWORD *a1)
{
  _DWORD *v2;
  unsigned int v3;
  BOOL v4;
  unsigned int v5;
  unsigned int v6;
  int v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v13;
  int v15;
  BOOL v16;
  uint64_t result;

  v2 = (_DWORD *)a1[7];
  v3 = v2[11];
  v4 = v3 > (((unint64_t)obj_size_phys((uint64_t)a1) - 64) / 0x28);
  v6 = v2[11];
  v5 = v2[12];
  if (v4)
    v7 = 2;
  else
    v7 = 1;
  if (v5 <= v6)
    v8 = v4;
  else
    v8 = v7;
  v9 = v2[13];
  v10 = v2[14];
  if (v9 != -1 && v9 >= v6)
    ++v8;
  if (v10 != -1 && v10 >= v6)
    ++v8;
  v13 = v2[15];
  if (v13 != -1 && v13 >= v6)
    v15 = v8 + 1;
  else
    v15 = v8;
  if (v5 == 1)
  {
    v16 = v9 == v10;
  }
  else
  {
    if (v5)
    {
      if (v15)
        goto LABEL_36;
      goto LABEL_37;
    }
    v16 = v9 == -1 && v10 == -1;
  }
  if (!v16 || v15 != 0)
  {
LABEL_36:
    result = nx_corruption_detected_int(*(_QWORD *)(*a1 + 392), (uint64_t)"nx_reap_list_sanity_check", 1045);
    if ((_DWORD)result)
      return result;
  }
LABEL_37:
  result = 0;
  a1[47] = v2;
  return result;
}

uint64_t nx_reaper_obj_get(uint64_t *a1, int a2, int a3, unint64_t a4, unint64_t a5, uint64_t **a6, char **a7)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t *v21;

  v21 = 0;
  v20 = 0;
  v18 = 0;
  v19 = 0;
  *a7 = 0;
  *a6 = 0;
  if (a4)
  {
    v13 = obj_get(a1[49], 0, a4, (int *)&apfs_desc, 0, 0, 0, 0, (uint64_t *)&v21);
    if ((_DWORD)v13)
    {
      v14 = v13;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        nx_reaper_obj_get_cold_2();
      return v14;
    }
    v15 = v21;
  }
  else
  {
    v15 = 0;
  }
  *a6 = v15;
  if ((a2 & 0x4000FFFF) == 0x4000000B)
  {
    v16 = (uint64_t)(v15 ? v15 : a1);
    if (!omap_obj_get(v16, 0, 0, a7))
      return 0;
  }
  v14 = obj_descriptor_and_flags_for_type(a2, &v20, (uint64_t)&v18);
  if ((_DWORD)v14
    || (LODWORD(v19) = a3,
        v14 = obj_get(a1[49], v20, a5, (int *)&v18, 0, (uint64_t)v21, 0, 0, (uint64_t *)a7),
        (_DWORD)v14))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      nx_reaper_obj_get_cold_1();
    if (v21)
      obj_release(v21);
    *a7 = 0;
    *a6 = 0;
  }
  return v14;
}

uint64_t nx_reaper_add(_QWORD *a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, _QWORD *a8)
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _DWORD *v24;
  _DWORD *v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  int v30;
  _DWORD *v31;
  _DWORD *v32;
  int v33;
  int v34;
  int v35;
  int v36;
  _DWORD *v37;
  int v38;
  _DWORD *v39;
  int v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  uint64_t v46[3];

  v45 = 0;
  memset(v46, 170, sizeof(v46));
  v16 = nx_reaper_get(a1, (char **)&v46[2]);
  if ((_DWORD)v16)
    return v16;
  v17 = *(_QWORD *)(v46[2] + 376);
  v16 = obj_descriptor_funcs_for_type(a2, &v45);
  if ((_DWORD)v16)
    goto LABEL_3;
  if (!*(_QWORD *)(v45 + 24))
  {
    v16 = 22;
LABEL_3:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      nx_reaper_add_cold_1();
    goto LABEL_9;
  }
  obj_lock(v46[2], 2);
  v18 = obj_modify(v46[2], 0, a6);
  if ((_DWORD)v18)
  {
    v16 = v18;
LABEL_8:
    obj_unlock(v46[2], 2);
LABEL_9:
    obj_release(v46[2]);
    return v16;
  }
  v20 = a1[49];
  if (*(_OWORD *)(v17 + 48) == 0)
  {
    v21 = obj_create(v20, 0x80000000, 0, (int)&nx_reap_list_desc, 0, 0, a6, (uint64_t)&v46[1]);
    if ((_DWORD)v21)
    {
      v16 = v21;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        nx_reaper_add_cold_4();
      goto LABEL_8;
    }
    v23 = obj_oid(v46[1]);
    *(_QWORD *)(v17 + 48) = v23;
    *(_QWORD *)(v17 + 56) = v23;
    v24 = (_DWORD *)(v17 + 68);
    goto LABEL_20;
  }
  v22 = obj_get(v20, 2147483649, *(_QWORD *)(v17 + 56), &nx_reap_list_desc, 0, 0, 0, a6, &v46[1]);
  if ((_DWORD)v22)
  {
    v16 = v22;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      nx_reaper_add_cold_5();
    goto LABEL_8;
  }
  v24 = (_DWORD *)(v17 + 68);
  if (!*(_DWORD *)(v17 + 68) && *(_QWORD *)(v17 + 48) == *(_QWORD *)(v17 + 56))
  {
LABEL_20:
    *v24 = 1;
    obj_dirty(v46[2], a6, 0);
  }
  v25 = *(_DWORD **)(v46[1] + 376);
  if (v25[12] > (v25[11] - 2))
  {
    v26 = obj_create(a1[49], 0x80000000, 0, (int)&nx_reap_list_desc, 0, 0, a6, (uint64_t)v46);
    if ((_DWORD)v26)
    {
      v16 = v26;
      obj_unlock(v46[2], 2);
      obj_release(v46[1]);
      goto LABEL_9;
    }
    v27 = obj_oid(v46[0]);
    *(_QWORD *)(*(_QWORD *)(v46[1] + 376) + 32) = v27;
    *(_QWORD *)(v17 + 56) = obj_oid(v46[0]);
    v28 = *(_DWORD *)(v17 + 68);
    if (v28)
      *(_DWORD *)(v17 + 68) = v28 + 1;
    obj_dirty(v46[2], a6, 0);
    obj_release(v46[1]);
    v46[1] = v46[0];
    v25 = *(_DWORD **)(v46[0] + 376);
  }
  v29 = *(_QWORD *)(v17 + 32);
  *(_QWORD *)(v17 + 32) = v29 + 1;
  v30 = v25[15];
  if (v30 == -1)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      nx_reaper_add_cold_2();
    obj_unlock(v46[2], 2);
    obj_release(v46[1]);
    obj_release(v46[2]);
    v43 = (uint64_t)a1;
    v44 = 1431;
    return nx_corruption_detected_int(v43, (uint64_t)"nx_reaper_add", v44);
  }
  v31 = &v25[10 * v30];
  v34 = v31[16];
  v32 = v31 + 16;
  v33 = v34;
  v25[15] = v34;
  v35 = v25[14];
  if (v35 != -1)
    v25[10 * v35 + 16] = v30;
  if (v25[13] == -1)
    v25[13] = v30;
  v25[14] = v30;
  v36 = v25[12];
  v25[12] = v36 + 1;
  *v32 = -1;
  v37 = &v25[10 * v30];
  if ((a7 & 2) != 0)
    v38 = 21;
  else
    v38 = 5;
  v37[17] = v38;
  v37[18] = a2;
  v37[19] = a3;
  *((_QWORD *)v37 + 10) = a4;
  *((_QWORD *)v37 + 11) = a5;
  *((_QWORD *)v37 + 12) = a6;
  if (v33 == -1)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      nx_reaper_add_cold_3();
    obj_unlock(v46[2], 2);
    obj_release(v46[1]);
    obj_release(v46[2]);
    v43 = (uint64_t)a1;
    v44 = 1462;
    return nx_corruption_detected_int(v43, (uint64_t)"nx_reaper_add", v44);
  }
  v39 = &v25[10 * v33];
  v40 = v39[16];
  *v32 = v33;
  v25[14] = v33;
  v25[15] = v40;
  v25[12] = v36 + 2;
  if ((a7 & 2) != 0)
    v41 = 19;
  else
    v41 = 3;
  if ((a7 & 1) != 0)
    v41 |= 0xCu;
  v39[16] = -1;
  v39[17] = v41;
  v39[18] = a2;
  v39[19] = a3;
  *((_QWORD *)v39 + 10) = a4;
  *((_QWORD *)v39 + 11) = a5;
  *((_QWORD *)v39 + 12) = v29;
  obj_dirty(v46[1], a6, 0);
  obj_unlock(v46[2], 2);
  obj_release(v46[1]);
  obj_release(v46[2]);
  if (!a8)
    return 0;
  v42 = v29;
  v16 = 0;
  *a8 = v42;
  return v16;
}

uint64_t nx_reaper_add_sub_object(_QWORD *a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _DWORD *v20;
  uint64_t v21;
  uint64_t v22;
  _DWORD *v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  int v27;
  _DWORD *v28;
  int v29;
  int v30;
  _DWORD *v31;
  int v32;
  _DWORD *v33;
  int v34;
  _DWORD *v35;
  int v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  _QWORD v40[3];

  v39 = 0;
  memset(v40, 170, sizeof(v40));
  v14 = nx_reaper_get(a1, (char **)&v40[2]);
  if ((_DWORD)v14)
    return v14;
  v15 = *(_QWORD *)(v40[2] + 376);
  v14 = obj_descriptor_funcs_for_type(a2, &v39);
  if ((_DWORD)v14)
    goto LABEL_3;
  if (!*(_QWORD *)(v39 + 24))
  {
    v14 = 22;
LABEL_3:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      nx_reaper_add_sub_object_cold_1();
    goto LABEL_17;
  }
  obj_lock(v40[2], 2);
  v16 = obj_modify(v40[2], 0, a6);
  if ((_DWORD)v16)
  {
    v14 = v16;
LABEL_16:
    obj_unlock(v40[2], 2);
LABEL_17:
    obj_release(v40[2]);
    return v14;
  }
  v17 = *(_QWORD *)(v15 + 48);
  if (!v17 && !*(_QWORD *)(v15 + 56))
  {
    v21 = obj_create(a1[49], 0x80000000, 0, (int)&nx_reap_list_desc, 0, 0, a6, (uint64_t)&v40[1]);
    if ((_DWORD)v21)
    {
      v14 = v21;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        nx_reaper_add_sub_object_cold_5();
      goto LABEL_14;
    }
    v22 = obj_oid(v40[1]);
    *(_QWORD *)(v15 + 48) = v22;
    *(_QWORD *)(v15 + 56) = v22;
    v20 = (_DWORD *)(v15 + 68);
    goto LABEL_26;
  }
  v18 = obj_get(a1[49], 2147483649, v17, &nx_reap_list_desc, 0, 0, 0, a6, &v40[1]);
  if ((_DWORD)v18)
  {
    v14 = v18;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      nx_reaper_add_sub_object_cold_6();
LABEL_14:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      nx_reaper_add_sub_object_cold_4();
    goto LABEL_16;
  }
  v20 = (_DWORD *)(v15 + 68);
  if (!*(_DWORD *)(v15 + 68) && *(_QWORD *)(v15 + 48) == *(_QWORD *)(v15 + 56))
  {
LABEL_26:
    *v20 = 1;
    obj_dirty(v40[2], a6, 0);
  }
  v23 = *(_DWORD **)(v40[1] + 376);
  if (v23[12] > v23[11] + ~(a7 & 1u))
  {
    v24 = obj_create(a1[49], 0x80000000, 0, (int)&nx_reap_list_desc, 0, 0, a6, (uint64_t)v40);
    if ((_DWORD)v24)
    {
      v14 = v24;
      obj_unlock(v40[2], 2);
      obj_release(v40[1]);
      goto LABEL_17;
    }
    v25 = v40[0];
    *(_QWORD *)(*(_QWORD *)(v40[0] + 376) + 32) = *(_QWORD *)(v15 + 48);
    *(_QWORD *)(v15 + 48) = obj_oid(v25);
    v26 = *(_DWORD *)(v15 + 68);
    if (v26)
      *(_DWORD *)(v15 + 68) = v26 + 1;
    obj_dirty(v40[2], a6, 0);
    obj_release(v40[1]);
    v40[1] = v40[0];
    v23 = *(_DWORD **)(v40[0] + 376);
  }
  v27 = v23[15];
  if ((a7 & 1) != 0)
  {
    if (v27 == -1)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        nx_reaper_add_sub_object_cold_3();
      obj_unlock(v40[2], 2);
      obj_release(v40[1]);
      obj_release(v40[2]);
      v37 = (uint64_t)a1;
      v38 = 1612;
      return nx_corruption_detected_int(v37, (uint64_t)"nx_reaper_add_sub_object", v38);
    }
    v28 = &v23[10 * v27];
    v29 = v28[16];
    v23[15] = v29;
    v30 = v23[14];
    v28[16] = v23[13];
    v23[13] = v27;
    if (v30 == -1)
      v23[14] = v27;
    ++v23[12];
    v31 = &v23[10 * v27];
    if ((a7 & 2) != 0)
      v32 = 29;
    else
      v32 = 13;
    v31[17] = v32;
    v31[18] = a2;
    v31[19] = a3;
    *((_QWORD *)v31 + 10) = a4;
    *((_QWORD *)v31 + 11) = a5;
    *((_QWORD *)v31 + 12) = a6;
    v27 = v29;
  }
  if (v27 == -1)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      nx_reaper_add_sub_object_cold_2();
    obj_unlock(v40[2], 2);
    obj_release(v40[1]);
    obj_release(v40[2]);
    v37 = (uint64_t)a1;
    v38 = 1640;
    return nx_corruption_detected_int(v37, (uint64_t)"nx_reaper_add_sub_object", v38);
  }
  v33 = &v23[10 * v27];
  v23[15] = v33[16];
  v34 = v23[14];
  v33[16] = v23[13];
  v23[13] = v27;
  if (v34 == -1)
    v23[14] = v27;
  ++v23[12];
  v35 = &v23[10 * v27];
  if ((a7 & 2) != 0)
    v36 = 21;
  else
    v36 = 5;
  v35[17] = v36;
  v35[18] = a2;
  v35[19] = a3;
  *((_QWORD *)v35 + 10) = a4;
  *((_QWORD *)v35 + 11) = a5;
  *((_QWORD *)v35 + 12) = a6;
  obj_dirty(v40[1], a6, 0);
  obj_unlock(v40[2], 2);
  obj_release(v40[1]);
  obj_release(v40[2]);
  return 0;
}

void nx_reaper_check_for_work(uint64_t *a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  char *v6;

  v5 = (uint64_t *)0xAAAAAAAAAAAAAAAALL;
  v6 = (char *)0xAAAAAAAAAAAAAAAALL;
  if (!nx_reaper_get(a1, &v6))
  {
    v2 = *((_QWORD *)v6 + 47);
    obj_lock((uint64_t)v6, 2);
    if (!*(_QWORD *)(v2 + 88))
    {
      v3 = *(_QWORD *)(v2 + 48);
      if (!v3
        || obj_get(a1[49], 0x80000000, v3, (int *)&nx_reap_list_desc, 0, 0, 0, 0, (uint64_t *)&v5))
      {
        goto LABEL_4;
      }
      v4 = v5[47];
      if (!*(_DWORD *)(v4 + 48) && !*(_QWORD *)(v4 + 32))
      {
        obj_release(v5);
        goto LABEL_4;
      }
      obj_release(v5);
    }
    obj_unlock((uint64_t)v6, 2);
    nx_reaper(a1);
    obj_lock((uint64_t)v6, 2);
LABEL_4:
    obj_unlock((uint64_t)v6, 2);
    obj_release((uint64_t *)v6);
  }
}

uint64_t nx_reaper(uint64_t *a1)
{
  uint64_t result;
  uint64_t v3;
  char *v4;
  int v5;
  NSObject *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int record;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t *v25;
  char *v26;
  uint64_t v27;
  unint64_t v28;
  char *v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  _BYTE v37[10];
  int v38;
  __int16 v39;
  int v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v28 = 0;
  v29 = (char *)0xAAAAAAAAAAAAAAAALL;
  v26 = (char *)0xAAAAAAAAAAAAAAAALL;
  v27 = 0;
  v25 = 0;
  result = nx_reaper_get(a1, &v29);
  if ((_DWORD)result)
    return result;
  v3 = *((_QWORD *)v29 + 47);
  obj_lock((uint64_t)v29, 2);
  v4 = v29;
  if (*((_DWORD *)v29 + 98) || *((_DWORD *)v29 + 99))
  {
    obj_unlock((uint64_t)v29, 2);
    obj_release((uint64_t *)v29);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      nx_reaper_cold_1();
    return 16;
  }
  v5 = 0;
  *((_DWORD *)v29 + 98) = 1;
  v6 = MEMORY[0x24BDACB70];
  while (1)
  {
    v23 = 0xAAAAAAAAAAAAAAAALL;
    v24 = 0xAAAAAAAAAAAAAAAALL;
    obj_unlock((uint64_t)v4, 2);
    v28 = 0;
    v7 = tx_enter((uint64_t)a1, (uint64_t *)&v28);
    obj_lock((uint64_t)v29, 2);
    v4 = v29;
    if (v7)
    {
LABEL_43:
      v22 = 0;
      goto LABEL_47;
    }
    v8 = obj_modify(v29, 0, v28);
    v4 = v29;
    if (v8)
    {
      v7 = v8;
LABEL_46:
      v22 = 1;
      goto LABEL_47;
    }
    if (*(_QWORD *)(v3 + 88))
      goto LABEL_15;
    if (*((_DWORD *)v29 + 99))
      goto LABEL_45;
    record = nx_reaper_next_record((uint64_t)a1, (uint64_t)v29, v28);
    if (record)
      break;
    v4 = v29;
    if (!*(_QWORD *)(v3 + 88))
    {
LABEL_45:
      v7 = 0;
      goto LABEL_46;
    }
LABEL_15:
    obj_unlock((uint64_t)v4, 2);
    if ((*(_BYTE *)(v3 + 104) & 4) == 0)
      goto LABEL_20;
    v10 = obj_descriptor_funcs_for_type(*(_DWORD *)(v3 + 72), &v27);
    if (v10)
      goto LABEL_17;
    if (!*(_QWORD *)(v27 + 24))
    {
      v10 = 22;
LABEL_17:
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v17 = a1[48] + 208;
        v18 = *(_DWORD *)(v3 + 72);
        *(_DWORD *)buf = 136316162;
        v31 = "nx_reaper";
        v32 = 1024;
        v33 = 1833;
        v34 = 2080;
        v35 = v17;
        v36 = 1024;
        *(_DWORD *)v37 = v18;
        *(_WORD *)&v37[4] = 1024;
        *(_DWORD *)&v37[6] = v10;
        _os_log_error_impl(&dword_21F566000, v6, OS_LOG_TYPE_ERROR, "%s:%d: %s object type 0x%x not reapable?: %d\n", buf, 0x28u);
      }
      v5 = 1;
LABEL_20:
      obj_lock((uint64_t)v29, 2);
      goto LABEL_21;
    }
    v11 = nx_reaper_obj_get(a1, *(_DWORD *)(v3 + 72), *(_DWORD *)(v3 + 76), *(_QWORD *)(v3 + 80), *(_QWORD *)(v3 + 88), &v25, &v26);
    if (v11)
    {
      v12 = v11;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v13 = a1[48] + 208;
        v14 = *(_QWORD *)(v3 + 88);
        v15 = *(_DWORD *)(v3 + 72);
        *(_DWORD *)buf = 136316418;
        v31 = "nx_reaper";
        v32 = 1024;
        v33 = 1838;
        v34 = 2080;
        v35 = v13;
        v36 = 2048;
        *(_QWORD *)v37 = v14;
        *(_WORD *)&v37[8] = 1024;
        v38 = v15;
        v39 = 1024;
        v40 = v12;
        _os_log_error_impl(&dword_21F566000, v6, OS_LOG_TYPE_ERROR, "%s:%d: %s unable to get object 0x%llx of type 0x%x: %d\n", buf, 0x32u);
      }
    }
    else
    {
      if ((*(_BYTE *)(v3 + 64) & 2) == 0)
        bzero(*((void **)v29 + 48), *(unsigned int *)(v3 + 108));
      v16 = (*(uint64_t (**)(char *, _QWORD, _QWORD, _QWORD, unint64_t))(v27 + 24))(v26, (*(_DWORD *)(v3 + 104) >> 3) & 3, *((_QWORD *)v29 + 48), *(unsigned int *)(v3 + 108), v28);
      v12 = v16;
      if (v16 && v16 != 36 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v19 = a1[48] + 208;
        v20 = *(_QWORD *)(v3 + 88);
        v21 = *(_DWORD *)(v3 + 72);
        *(_DWORD *)buf = 136316418;
        v31 = "nx_reaper";
        v32 = 1024;
        v33 = 1852;
        v34 = 2080;
        v35 = v19;
        v36 = 2048;
        *(_QWORD *)v37 = v20;
        *(_WORD *)&v37[8] = 1024;
        v38 = v21;
        v39 = 1024;
        v40 = v12;
        _os_log_error_impl(&dword_21F566000, v6, OS_LOG_TYPE_ERROR, "%s:%d: %s error reaping object 0x%llx of type 0x%x: %d\n", buf, 0x32u);
      }
      obj_release((uint64_t *)v26);
      if (v25)
      {
        obj_release(v25);
        v25 = 0;
      }
    }
    obj_lock((uint64_t)v29, 2);
    if (v12 == 36)
    {
      *(_DWORD *)(v3 + 64) |= 2u;
      v5 = 1;
      goto LABEL_24;
    }
    v5 = 1;
LABEL_21:
    if ((*(_BYTE *)(v3 + 104) & 2) != 0)
      *(_QWORD *)(v3 + 40) = *(_QWORD *)(v3 + 96);
    *(_DWORD *)(v3 + 64) &= ~2u;
    *(_QWORD *)(v3 + 88) = 0;
LABEL_24:
    obj_dirty((uint64_t)v29, v28, 0);
    obj_unlock((uint64_t)v29, 2);
    spaceman_currently_available_space((uint64_t)a1, &v24, &v23, 0, 0);
    v7 = tx_leave((uint64_t)a1, v28, (v23 < 0x3E8) | (4 * (v23 < 0x7D0)));
    obj_lock((uint64_t)v29, 2);
    v4 = v29;
    if (v7)
      goto LABEL_43;
    if (*((_DWORD *)v29 + 99))
    {
      v22 = 0;
      v7 = 0;
      goto LABEL_47;
    }
  }
  v7 = record;
  v22 = 1;
  v4 = v29;
LABEL_47:
  *((_DWORD *)v4 + 98) = 0;
  obj_unlock((uint64_t)v4, 2);
  obj_release((uint64_t *)v29);
  if (v22)
    tx_leave((uint64_t)a1, v28, 0);
  if (v7 | v5)
    return v7;
  else
    return 2;
}

void nx_reaper_shut_down(_QWORD *a1)
{
  char *v2;
  uint64_t *v3;
  char *v4;

  v4 = (char *)0xAAAAAAAAAAAAAAAALL;
  if (!nx_reaper_get(a1, &v4))
  {
    obj_lock((uint64_t)v4, 2);
    v2 = v4;
    ++*((_DWORD *)v4 + 99);
    obj_unlock((uint64_t)v2, 2);
    v3 = (uint64_t *)a1[53];
    if (v3)
    {
      obj_release(v3);
      a1[53] = 0;
    }
    obj_release((uint64_t *)v4);
  }
}

uint64_t nx_reaper_wait(uint64_t *a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char *v8;

  v8 = (char *)0xAAAAAAAAAAAAAAAALL;
  v4 = nx_reaper_get(a1, &v8);
  if (!(_DWORD)v4)
  {
    v5 = *((_QWORD *)v8 + 7);
    obj_lock((uint64_t)v8, 2);
    v6 = *(_QWORD *)(v5 + 32);
    if (a2 == -1)
      a2 = v6 - 1;
    if (a2 >= v6)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        nx_reaper_wait_cold_1();
      v4 = 22;
    }
    else
    {
      while (*(_QWORD *)(v5 + 40) < a2)
      {
        obj_unlock((uint64_t)v8, 2);
        v4 = nx_reaper(a1);
        obj_lock((uint64_t)v8, 2);
        if ((_DWORD)v4)
          goto LABEL_12;
      }
      v4 = 0;
    }
LABEL_12:
    obj_unlock((uint64_t)v8, 2);
    obj_release((uint64_t *)v8);
  }
  return v4;
}

uint64_t extent_list_key_cmp(uint64_t a1, _QWORD *a2, int a3, _QWORD *a4, int a5, int *a6)
{
  uint64_t result;
  int v7;

  result = 22;
  if (a3 == 8 && a5 == 8)
  {
    result = 0;
    v7 = *a2 > *a4;
    if (*a2 < *a4)
      v7 = -1;
    *a6 = v7;
  }
  return result;
}

uint64_t nx_metadata_fragmented_extent_list_tree_get(uint64_t a1, uint64_t a2, char **a3)
{
  uint64_t i;
  char *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;

  if (!a2)
    return 22;
  for (i = 432; i != 464; i += 8)
  {
    v7 = *(char **)(a1 + i);
    if (v7 && obj_oid(*(_QWORD *)(a1 + i)) == a2)
    {
      obj_retain(v7);
      v12 = 0;
      *a3 = v7;
      return v12;
    }
  }
  obj_lock(a1, 2);
  v8 = 0;
  v9 = -1;
  do
  {
    v10 = a1 + 8 * v8;
    v11 = *(char **)(v10 + 432);
    if (v11)
    {
      if (obj_oid(*(_QWORD *)(v10 + 432)) == a2)
      {
        obj_retain(v11);
        *a3 = v11;
        obj_unlock(a1, 2);
        return 0;
      }
    }
    else if (v9 == -1)
    {
      v9 = v8;
    }
    ++v8;
  }
  while (v8 != 4);
  if (a2 < 0)
  {
    v12 = btree_get(a1, 2281701376, a2 & 0x7FFFFFFFFFFFFFFFLL, 0, 0, 0, 10, extent_list_key_cmp, 0, a3);
  }
  else
  {
    v12 = btree_get(a1, 0x40000000, a2, 0, 0, 0, 10, extent_list_key_cmp, 0, a3);
    if (!(_DWORD)v12 && v9 != -1)
    {
      *(_QWORD *)(a1 + 8 * v9 + 432) = *a3;
      obj_retain(*a3);
      v12 = 0;
    }
  }
  obj_unlock(a1, 2);
  return v12;
}

uint64_t nx_metadata_fragmented_sanity_check(uint64_t a1, uint64_t a2, unsigned int a3)
{
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  _OWORD v14[4];
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char *v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v19 = (char *)0xAAAAAAAAAAAAAAAALL;
  v16 = 0xAAAAAAAAAAAAAAAALL;
  v17 = 0xAAAAAAAAAAAAAAAALL;
  v15 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v14[2] = v5;
  v14[3] = v5;
  v14[0] = v5;
  v14[1] = v5;
  v6 = nx_metadata_fragmented_extent_list_tree_get(a1, a2, &v19);
  if (!(_DWORD)v6)
  {
    v18 = 0;
    bt_iterator_init((uint64_t)v14, (uint64_t)v19, 0, 0, &v18, 8, 8u, &v16, 0x10u);
    v6 = v7;
    if (!(_DWORD)v7)
    {
      v9 = 0;
      do
      {
        if (bt_iterator_ended((uint64_t)v14))
        {
          if (a3 == v9)
            v6 = 0;
          else
            v6 = nx_corruption_detected_int(a1, (uint64_t)"nx_metadata_fragmented_sanity_check", 2451);
          goto LABEL_3;
        }
        if (v18 == v9)
          v6 = 0;
        else
          v6 = nx_corruption_detected_int(a1, (uint64_t)"nx_metadata_fragmented_sanity_check", 2431);
        if (nx_superblock_sanity_check_extent(*(_QWORD *)(a1 + 376), 0, v16, v17, 0))
          v6 = nx_corruption_detected_int(a1, (uint64_t)"nx_metadata_fragmented_sanity_check", 2435);
        v10 = v17;
        if (v17 > (unint64_t)a3 - v9)
        {
          v6 = nx_corruption_detected_int(a1, (uint64_t)"nx_metadata_fragmented_sanity_check", 2439);
          v10 = v17;
        }
        if ((_DWORD)v6)
          goto LABEL_3;
        v9 += v10;
        v11 = bt_iterator_next((uint64_t)v14);
      }
      while (!(_DWORD)v11);
      v6 = v11;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        v12 = *(_QWORD *)(a1 + 384) + 208;
        v13 = strerror(v6);
        *(_DWORD *)buf = 136316162;
        v21 = "nx_metadata_fragmented_sanity_check";
        v22 = 1024;
        v23 = 2445;
        v24 = 2080;
        v25 = v12;
        v26 = 2080;
        v27 = v13;
        v28 = 1024;
        v29 = v6;
        _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: %s failed to get next extent in metadata fragmented extent list tree, error %s(%d)\n", buf, 0x2Cu);
      }
    }
LABEL_3:
    obj_release((uint64_t *)v19);
  }
  return v6;
}

uint64_t nx_metadata_fragmented_block_address_lookup(uint64_t a1, uint64_t a2, unint64_t a3, _QWORD *a4, unint64_t *a5)
{
  uint64_t v8;
  unint64_t v9;
  unsigned int v11;
  unsigned int v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char *v16;

  v16 = (char *)0xAAAAAAAAAAAAAAAALL;
  v13 = 0xAAAAAAAAAAAAAAAALL;
  v14 = 0xAAAAAAAAAAAAAAAALL;
  v8 = nx_metadata_fragmented_extent_list_tree_get(a1, a2, &v16);
  if (!(_DWORD)v8)
  {
    v15 = a3;
    v11 = 16;
    v12 = 8;
    v8 = bt_lookup_variant((uint64_t)v16, 0, &v15, &v12, 8u, &v13, &v11, 1u, 0, 0);
    if (!(_DWORD)v8)
    {
      v9 = v14 - (a3 - v15);
      if (v14 <= a3 - v15)
      {
        v8 = 2;
      }
      else
      {
        *a4 = v13 + a3 - v15;
        v8 = 0;
        if (a5)
          *a5 = v9;
      }
    }
    obj_release(v16);
  }
  return v8;
}

uint64_t nx_metadata_range_overlap_check(_QWORD *a1, unint64_t a2, unint64_t a3, unint64_t *a4)
{
  uint64_t v8;
  uint64_t result;
  unint64_t v10;
  unsigned int v11;
  unsigned int v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;

  v13 = 0xAAAAAAAAAAAAAAAALL;
  v14 = 0xAAAAAAAAAAAAAAAALL;
  v8 = a1[60];
  if (!v8)
  {
    v15 = a2;
    v12 = 8;
    v11 = 16;
    LODWORD(result) = bt_lookup_variant(a1[58], 0, &v15, &v12, 8u, &v13, &v11, 1u, 0, 0);
    if ((_DWORD)result || (v10 = v15, a2 - v15 >= v14))
    {
      if ((_DWORD)result == 2)
        result = 0;
      else
        result = result;
      if (a3 < 2 || (_DWORD)result)
        return result;
      v15 = a2;
      v11 = 16;
      v12 = 8;
      LODWORD(result) = bt_lookup_variant(a1[58], 0, &v15, &v12, 8u, &v13, &v11, 4u, 0, 0);
      if ((_DWORD)result || (v10 = v15, v15 - a2 >= a3))
      {
        if ((_DWORD)result == 2)
          return 0;
        else
          return result;
      }
    }
    if (a4)
      *a4 = v10;
    return 17;
  }
  if (calc_overlap_range(a1[59], v8, a2, a3, a4))
    return 17;
  if ((((uint64_t)0xBFFFFFFFFFFFFFFFLL >> __clz(__rbit64(*(unsigned int *)(a1[47] + 36)))) & a2) == 0)
  {
    if (a4)
      *a4 = a2;
    return 17;
  }
  return 0;
}

uint64_t nx_metadata_range_add(_QWORD *a1, unint64_t a2, int a3, char a4, int a5)
{
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  _OWORD v12[4];
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char *v17;

  v14 = 0xAAAAAAAAAAAAAAAALL;
  v15 = 0xAAAAAAAAAAAAAAAALL;
  if ((a4 & 1) == 0)
    return nx_metadata_range_check_and_insert(a1, a2, a3 & 0x7FFFFFFF, a5);
  v17 = (char *)0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v12[0] = v6;
  v12[1] = v6;
  v12[2] = v6;
  v12[3] = v6;
  v13 = 0xAAAAAAAAAAAAAAAALL;
  v7 = nx_metadata_fragmented_extent_list_tree_get((uint64_t)a1, a2, &v17);
  if (!(_DWORD)v7)
  {
    v8 = btree_iterate_nodes((uint64_t)v17, 0, 0, (uint64_t (*)(void))nx_metadata_range_add_btree_callback, 0, 0);
    if (!(_DWORD)v8)
    {
      v16 = 0;
      bt_iterator_init((uint64_t)v12, (uint64_t)v17, 0, 0, &v16, 8, 8u, &v14, 0x10u);
      v7 = v10;
      if (bt_iterator_ended((uint64_t)v12))
        goto LABEL_7;
      while (1)
      {
        v8 = nx_metadata_range_check_and_insert(a1, v14, v15, 0);
        if ((_DWORD)v8)
          break;
        v11 = bt_iterator_next((uint64_t)v12);
        if ((_DWORD)v11)
        {
          v7 = v11;
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            nx_metadata_range_add_cold_1((uint64_t)a1, v7);
          goto LABEL_7;
        }
        if (bt_iterator_ended((uint64_t)v12))
        {
          v7 = 0;
          goto LABEL_7;
        }
      }
    }
    v7 = v8;
LABEL_7:
    obj_release((uint64_t *)v17);
  }
  return v7;
}

uint64_t nx_metadata_range_check_and_insert(_QWORD *a1, unint64_t a2, unint64_t a3, int a4)
{
  uint64_t result;
  _QWORD v8[2];
  unint64_t v9;

  if (nx_superblock_sanity_check_extent(a1[47], 0, a2, a3, a4))
    return 22;
  if (a1[58])
  {
    result = nx_metadata_range_overlap_check(a1, a2, a3, 0);
    if ((_DWORD)result)
      return result;
    goto LABEL_5;
  }
  result = btree_create((pthread_mutex_t **)a1, 0x88000000, 0, 10, 0, 8u, 16, (uint64_t)extent_list_key_cmp, 0, a1 + 58);
  if (!(_DWORD)result)
  {
LABEL_5:
    v8[1] = a3;
    v9 = a2;
    v8[0] = a2;
    return bt_insert((_QWORD *)a1[58], 0, &v9, 8, (uint64_t)v8, 0x10u, 0);
  }
  return result;
}

uint64_t nx_metadata_range_add_btree_callback(uint64_t a1)
{
  _QWORD *v2;
  unint64_t v3;
  unint64_t v4;

  v2 = *(_QWORD **)(*(_QWORD *)a1 + 392);
  v3 = obj_oid(a1);
  v4 = (obj_size_phys(a1) + *(_DWORD *)(v2[47] + 36) - 1) / *(_DWORD *)(v2[47] + 36);
  return nx_metadata_range_check_and_insert(v2, v3, v4, 0);
}

void nx_metadata_range_optimize(_QWORD *a1)
{
  uint64_t v1;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _OWORD v8[4];
  unint64_t v9;
  unint64_t v10[3];
  __int128 v11;
  unint64_t v12;

  *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v10[0] = 0xAAAAAAAAAAAAAAAALL;
  a1[59] = 0;
  a1[60] = 0;
  v1 = a1[58];
  if (!v1)
    return;
  v9 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v8[2] = v3;
  v8[3] = v3;
  v8[0] = v3;
  v8[1] = v3;
  v10[1] = 0;
  v12 = 0;
  bt_iterator_init((uint64_t)v8, v1, 0, 0, &v12, 8, 8u, &v11, 0x10u);
  if (bt_iterator_ended((uint64_t)v8))
    return;
  v4 = 0;
  while (1)
  {
    v5 = v11;
    if ((((uint64_t)0xBFFFFFFFFFFFFFFFLL >> __clz(__rbit64(*(unsigned int *)(a1[47] + 36)))) & (unint64_t)v11) != 0)
    {
      v6 = *((_QWORD *)&v11 + 1);
      if (!*((_QWORD *)&v11 + 1))
        goto LABEL_15;
    }
    else
    {
      v5 = v11 + 1;
      v6 = *((_QWORD *)&v11 + 1) - 1;
      *(_QWORD *)&v11 = v11 + 1;
      *((_QWORD *)&v11 + 1) = v6;
      if (!v6)
        goto LABEL_15;
    }
    if (!v10[1] || v10[0] + v10[1] != v5)
    {
      ++v4;
      *(_OWORD *)v10 = v11;
      goto LABEL_15;
    }
    v10[1] += v6;
    if (bt_update((uint64_t *)a1[58], 0, v10, 8, v10, 0x10u, 0))
      break;
    if (bt_remove(a1[58], 0, (unint64_t *)&v11, 8u, 0))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        nx_metadata_range_optimize_cold_1();
      return;
    }
LABEL_15:
    bt_iterator_next((uint64_t)v8);
    if (bt_iterator_ended((uint64_t)v8))
    {
      if (v4 == 1)
        *(_OWORD *)(a1 + 59) = *(_OWORD *)v10;
      return;
    }
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    nx_metadata_range_optimize_cold_2();
}

uint64_t nx_checkpoint_desc_block_address(uint64_t a1, unint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v7;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 376);
  v4 = *(_DWORD *)(v3 + 104);
  if ((v4 & 0x7FFFFFFFu) <= a2)
    return 22;
  v7 = *(_QWORD *)(v3 + 112);
  if (v4 < 0)
    return nx_metadata_fragmented_block_address_lookup(a1, v7, a2, a3, 0);
  result = 0;
  *a3 = v7 + a2;
  return result;
}

uint64_t nx_checkpoint_data_block_address(uint64_t a1, unint64_t a2, _QWORD *a3, unint64_t *a4)
{
  uint64_t v4;
  int v5;
  unint64_t v6;
  uint64_t v10;
  uint64_t result;

  v4 = *(_QWORD *)(a1 + 376);
  v5 = *(_DWORD *)(v4 + 108);
  v6 = (v5 & 0x7FFFFFFF) - a2;
  if ((v5 & 0x7FFFFFFFu) <= a2)
    return 22;
  v10 = *(_QWORD *)(v4 + 120);
  if (v5 < 0)
    return nx_metadata_fragmented_block_address_lookup(a1, v10, a2, a3, a4);
  *a3 = v10 + a2;
  result = 0;
  if (a4)
    *a4 = v6;
  return result;
}

uint64_t nx_unblock_physical_range(_QWORD *a1)
{
  uint64_t v2;
  uint64_t evict_mapping_tree;
  uint64_t v4;
  unint64_t v6;
  uint64_t *v7;
  unint64_t v8;

  if (!*(_QWORD *)(a1[47] + 1256))
    goto LABEL_10;
  v6 = 0xAAAAAAAAAAAAAAAALL;
  v7 = (uint64_t *)0xAAAAAAAAAAAAAAAALL;
  v8 = 0;
  v2 = tx_enter((uint64_t)a1, (uint64_t *)&v8);
  if ((_DWORD)v2)
    return v2;
  evict_mapping_tree = nx_get_evict_mapping_tree((uint64_t)a1, 0x40000000u, *(_QWORD *)(a1[47] + 1256), 1, 1, (uint64_t *)&v7);
  if (!(_DWORD)evict_mapping_tree)
  {
    v2 = btree_delete((uint64_t)v7, v8, &v6);
    obj_release(v7);
    if ((_DWORD)v2)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        nx_unblock_physical_range_cold_3();
      goto LABEL_14;
    }
    *(_QWORD *)(a1[47] + 1256) = 0;
    v2 = tx_leave((uint64_t)a1, v8, 0);
    if ((_DWORD)v2)
      return v2;
LABEL_10:
    v8 = 0;
    v2 = tx_enter((uint64_t)a1, (uint64_t *)&v8);
    if ((_DWORD)v2)
      return v2;
    v4 = spaceman_unset_block_out_range(a1, v8);
    if (!(_DWORD)v4)
      return tx_leave((uint64_t)a1, v8, 0);
    v2 = v4;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      nx_unblock_physical_range_cold_2();
    goto LABEL_14;
  }
  v2 = evict_mapping_tree;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    nx_unblock_physical_range_cold_4();
LABEL_14:
  if (tx_leave((uint64_t)a1, v8, 0) && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    nx_unblock_physical_range_cold_1();
  return v2;
}

uint64_t nx_ratelimit_log_allowed(uint64_t a1)
{
  uint64_t timestamp;
  unint64_t v3;

  if (!a1)
    return 1;
  timestamp = get_timestamp();
  if ((unint64_t)(timestamp - *(_QWORD *)(a1 + 1792)) >= 0x3B9ACA01)
  {
    v3 = 0;
    *(_QWORD *)(a1 + 1792) = timestamp;
LABEL_6:
    *(_QWORD *)(a1 + 1800) = v3 + 1;
    return 1;
  }
  v3 = *(_QWORD *)(a1 + 1800);
  if (v3 <= 0xF)
    goto LABEL_6;
  return 0;
}

uint64_t nx_reaper_next_record(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  _DWORD *v14;
  int v15;
  _DWORD *v16;
  int v17;
  unint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t *v22;
  uint64_t *v23;

  v4 = *(_QWORD *)(a2 + 376);
  v5 = *(_QWORD *)(v4 + 48);
  if (!v5)
    return 0;
  v22 = (uint64_t *)0xAAAAAAAAAAAAAAAALL;
  v23 = (uint64_t *)0xAAAAAAAAAAAAAAAALL;
  v8 = obj_get(*(_QWORD *)(a1 + 392), 0x80000001, v5, (int *)&nx_reap_list_desc, 0, 0, 0, a3, (uint64_t *)&v23);
  if ((_DWORD)v8)
  {
    v9 = v8;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      nx_reaper_next_record_cold_1();
    return v9;
  }
  v10 = v23;
  if (*(_QWORD *)(v4 + 88))
  {
LABEL_22:
    obj_release(v10);
    return 0;
  }
  v11 = v23[47];
  while (1)
  {
    while (1)
    {
      v12 = *(_DWORD *)(v11 + 52);
      if (v12 == -1)
        break;
      v13 = v11 + 40 * v12;
      v14 = (_DWORD *)(v13 + 68);
      *(_DWORD *)(v4 + 104) = *(_DWORD *)(v13 + 68);
      *(_QWORD *)(v4 + 72) = *(_QWORD *)(v13 + 72);
      *(_OWORD *)(v4 + 80) = *(_OWORD *)(v13 + 80);
      *(_QWORD *)(v4 + 96) = *(_QWORD *)(v13 + 96);
      obj_dirty(a2, a3, 0);
      v17 = *(_DWORD *)(v13 + 64);
      v16 = (_DWORD *)(v13 + 64);
      v15 = v17;
      if (*(_DWORD *)(v11 + 52) == *(_DWORD *)(v11 + 56))
        *(_DWORD *)(v11 + 56) = v15;
      *v14 = 0;
      *v16 = *(_DWORD *)(v11 + 60);
      *(_DWORD *)(v11 + 60) = v12;
      --*(_DWORD *)(v11 + 48);
      *(_DWORD *)(v11 + 52) = v15;
      obj_dirty((uint64_t)v23, a3, 0);
      if (*(_QWORD *)(v4 + 88))
        goto LABEL_21;
    }
    v18 = *(_QWORD *)(v11 + 32);
    if (!v18)
    {
      if (!*(_DWORD *)(v4 + 68) && *(_QWORD *)(v4 + 48) == *(_QWORD *)(v4 + 56))
      {
        *(_DWORD *)(v4 + 68) = 1;
        obj_dirty(a2, a3, 0);
      }
LABEL_21:
      v10 = v23;
      goto LABEL_22;
    }
    v19 = obj_get(*(_QWORD *)(a1 + 392), 0x80000000, v18, (int *)&nx_reap_list_desc, 0, 0, 0, a3, (uint64_t *)&v22);
    if ((_DWORD)v19)
      break;
    *(_QWORD *)(v4 + 48) = *(_QWORD *)(v11 + 32);
    v20 = *(_DWORD *)(v4 + 68);
    if (v20)
      *(_DWORD *)(v4 + 68) = v20 - 1;
    obj_dirty(a2, a3, 0);
    obj_free((uint64_t)v23);
    obj_release(v23);
    v10 = v22;
    v22 = 0;
    v23 = v10;
    v11 = v10[47];
    if (*(_QWORD *)(v4 + 88))
      goto LABEL_22;
  }
  v9 = v19;
  obj_release(v23);
  return v9;
}

char *OUTLINED_FUNCTION_33_1@<X0>(int __errnum@<W1>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 24) = a2;
  return strerror(__errnum);
}

uint64_t apfs_udirop_rmdir_internal(unint64_t **a1, const char *a2)
{
  unint64_t *v2;
  uint64_t v3;
  uint64_t v5;
  _QWORD *v7;
  _QWORD *v8;
  int v9;
  uint64_t v10;
  uint64_t inode;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17[4];
  _QWORD v18[4];
  _BYTE *v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v19 = 0;
  v2 = *a1;
  if (*((_DWORD *)*a1 + 275))
    return 30;
  v5 = (uint64_t)a1[1];
  memset(v17, 170, sizeof(v17));
  v3 = userfs_check_name(a2, 0, (size_t *)&v17[1]);
  if ((_DWORD)v3)
    return v3;
  v7 = _apfs_calloc(1uLL, 0x10uLL);
  if (!v7)
    return 12;
  v8 = v7;
  v9 = pthread_rwlock_wrlock((pthread_rwlock_t *)(v5 + 128));
  if (v9)
    panic("%s:%d: wrlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_dirops.c", 54, v9);
  v18[0] = v2;
  v18[1] = v5;
  v18[2] = a2;
  v18[3] = v17[1];
  v10 = userfs_internal_lookup((uint64_t)v18, 0, (uint64_t *)&v19, &v17[3], &v17[2]);
  if ((_DWORD)v10)
  {
    v3 = v10;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      apfs_udirop_rmdir_internal_cold_5();
LABEL_15:
    _apfs_free(v8, 16);
    goto LABEL_16;
  }
  inode = userfs_load_inode((uint64_t)v2, v5, v17[3], v17[2], v8);
  if ((_DWORD)inode)
  {
    v3 = inode;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      apfs_udirop_rmdir_internal_cold_4();
    goto LABEL_15;
  }
  v13 = v8[1];
  if ((*(_BYTE *)(v13 + 120) & 0x18) == 0)
  {
    if ((*(_WORD *)(v13 + 104) & 0xF000) != 0x4000)
    {
      v3 = 20;
      goto LABEL_24;
    }
    if (*(int *)(v13 + 80) > 0)
    {
      v3 = 66;
      goto LABEL_24;
    }
    v14 = fs_tx_enter((uint64_t)v2, 2, 4, 0, v17);
    if ((_DWORD)v14)
    {
      v3 = v14;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        apfs_udirop_rmdir_internal_cold_3();
      goto LABEL_24;
    }
    v15 = remove_dir_entry(v2, v5, v13, (uint64_t)v19, v17[0]);
    if ((_DWORD)v15)
    {
      v3 = v15;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        apfs_udirop_rmdir_internal_cold_2();
    }
    else
    {
      apfs_increment_num_objects((uint64_t)v2, v13, -1);
      v3 = fs_delete_inode_with_xid((uint64_t)v2, v13, v17[0]);
      if ((_DWORD)v3)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v21 = "apfs_udirop_rmdir_internal";
          v22 = 1024;
          v23 = 114;
          v24 = 1024;
          v25 = v3;
          _os_log_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s:%d: fs_delete_inode_with_xid failed with err %d\n", buf, 0x18u);
        }
        v3 = move_inode_to_purgatory((uint64_t)v2, v13, v5, v17[0]);
        if ((_DWORD)v3)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            apfs_udirop_rmdir_internal_cold_1(v13, v5, v3);
          goto LABEL_40;
        }
        v16 = *(_QWORD *)(v13 + 120) | 0x20000000;
      }
      else
      {
        size_tracking_ino_moved((uint64_t)v2, v13, v5, 0, v17[0]);
        v16 = *(_QWORD *)(v13 + 120) | 0x20000010;
      }
      *(_QWORD *)(v13 + 120) = v16;
    }
LABEL_40:
    fs_tx_leave((uint64_t)v2, 2, 4, 0, v17[0]);
    goto LABEL_24;
  }
  v3 = 2;
LABEL_24:
  userfs_internal_reclaim((uint64_t)v8);
LABEL_16:
  jobj_release((uint64_t)v2, v19);
  v12 = pthread_rwlock_unlock((pthread_rwlock_t *)(v5 + 128));
  if (v12)
    panic("%s:%d: unlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_dirops.c", 143, v12);
  return v3;
}

uint64_t apfs_udirop_rmdir(unint64_t **a1, const char *a2)
{
  if (a1 && a2)
    return apfs_udirop_rmdir_internal(a1, a2);
  else
    return 22;
}

uint64_t apfs_udirop_mkdir(uint64_t *a1, char *__s1, uint64_t a3, uint64_t *a4)
{
  uint64_t common;
  uint64_t v9;
  uint64_t v11;

  common = 22;
  if (a1)
  {
    if (__s1)
    {
      if (a3)
      {
        if (a4)
        {
          v9 = *a1;
          common = userfs_create_common(a1, __s1, a3, a4, 2, 0);
          if (!(_DWORD)common)
          {
            if ((*(_QWORD *)(a3 + 8) & 0xFFFFFFFFFFFFFFE5) != 0)
            {
              v11 = *a4;
              common = userfs_set_ufa_common(v9, *(_QWORD *)(*a4 + 8), a3, 0);
              if ((_DWORD)common)
              {
                if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                  apfs_udirop_mkdir_cold_2();
                if (apfs_udirop_rmdir_internal((unint64_t **)a1, __s1)
                  && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                {
                  apfs_udirop_mkdir_cold_1();
                }
                userfs_internal_reclaim(v11);
                *a4 = 0;
              }
            }
            else
            {
              return 0;
            }
          }
        }
      }
    }
  }
  return common;
}

uint64_t apfs_udirop_readdir(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t *a6)
{
  uint64_t v6;
  _QWORD v8[6];

  v6 = 22;
  if (a1 && a6 && a5 && a2 && *(_QWORD *)(a1 + 8))
  {
    v8[0] = a2;
    v8[1] = a3;
    v8[2] = 0;
    v8[3] = a5;
    v8[4] = a6;
    v8[5] = 0xAAAAAAAAAAAAAA00;
    return apfs_udir_iterate_dir(a1, a4, *a6, (uint64_t)v8, 0);
  }
  return v6;
}

uint64_t apfs_udir_iterate_dir(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _BOOL4 v9;
  uint64_t *v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t *v14;
  unint64_t v15;
  int v16;
  char v17;
  _BOOL4 v18;
  int v19;
  uint64_t dir_iterator;
  int v21;
  char v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  char v30;
  uint64_t v31;
  unsigned int v32;
  int v33;
  int v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t *v37;
  uint64_t v38;
  int v39;
  char v40;
  uint64_t v42;
  char v43;
  pthread_rwlock_t *v44;
  _QWORD v45[5];
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _OWORD v51[3];
  __int128 v52;
  void *v53;

  v53 = 0;
  v52 = 0u;
  memset(v51, 0, sizeof(v51));
  v49 = a2;
  v50 = 0;
  if (!a4)
  {
    if (a5)
    {
      v10 = 0;
      v11 = 1;
      v9 = 1;
      goto LABEL_9;
    }
    return 22;
  }
  v9 = *(_BYTE *)(a4 + 40) != 0;
  if (a5)
    return 22;
  v10 = *(uint64_t **)(a4 + 24);
  if (v10)
  {
    v11 = 0;
    *v10 = 0;
  }
  else
  {
    v11 = 1;
  }
LABEL_9:
  if (a2 == -1)
    return 4294966295;
  v14 = *(unint64_t **)a1;
  v13 = *(_QWORD *)(a1 + 8);
  if (!a2 && a3)
    return 4294966296;
  if (!a2 && a4)
  {
    v15 = *(_QWORD *)(a4 + 8);
    if (v9)
    {
      if (v15 >= 0x3C6)
        goto LABEL_18;
      return 7;
    }
    if (v15 < 0x313)
      return 7;
  }
LABEL_18:
  if ((*(_BYTE *)(v13 + 120) & 0x10) != 0)
    return 2;
  if ((*(_WORD *)(v13 + 104) & 0xF000) != 0x4000)
    return 20;
  v44 = (pthread_rwlock_t *)(v13 + 128);
  v16 = pthread_rwlock_rdlock((pthread_rwlock_t *)(v13 + 128));
  if (v16)
    panic("%s:%d: rdlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_dirops.c", 322, v16);
  if (a4)
    v17 = v9;
  else
    v17 = 1;
  if ((v17 & 1) != 0 || (v49 = readdir_handle_dotpacking(v13, *(_QWORD *)a4, *(_QWORD *)(a4 + 8), a2, &v50)) != 0)
  {
    v18 = a2 > 1;
    if (v9)
      v18 = a2 != 0;
    if (v18)
    {
      v19 = pthread_rwlock_unlock(v44);
      if (v19)
        panic("%s:%d: unlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_dirops.c", 339, v19);
      dir_iterator = find_dir_iterator(v13, a2);
      v21 = pthread_rwlock_rdlock(v44);
      if (v21)
        panic("%s:%d: rdlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_dirops.c", 341, v21);
      if (dir_iterator)
      {
        v43 = 1;
      }
      else
      {
        v35 = readdir_process_cookie(v13, a2, v9);
        if (v35 == -1)
        {
          v22 = 0;
          dir_iterator = 0;
          v12 = 4294966294;
          goto LABEL_85;
        }
        v42 = v35;
        v36 = _apfs_calloc(1uLL, 0x358uLL);
        dir_iterator = (uint64_t)v36;
        if (!v36)
        {
LABEL_65:
          v22 = 0;
          goto LABEL_66;
        }
        v43 = 0;
        *v36 = a2;
        v36[1] = v42;
        v36[4] = v42;
      }
    }
    else
    {
      dir_iterator = (uint64_t)_apfs_calloc(1uLL, 0x358uLL);
      v22 = 0;
      if (!dir_iterator)
      {
LABEL_66:
        v12 = 12;
        goto LABEL_85;
      }
      v43 = 0;
    }
    LODWORD(v51[0]) = 4718601;
    *((_QWORD *)&v51[0] + 1) = *(_QWORD *)(v13 + 8);
    if (!*(_BYTE *)(dir_iterator + 56))
      goto LABEL_45;
    v23 = *(_QWORD *)(dir_iterator + 48);
    WORD1(v51[0]) = v23 + 72;
    HIWORD(v52) = v23;
    DWORD2(v52) = *(_DWORD *)(dir_iterator + 44);
    v24 = _apfs_malloc((unsigned __int16)v23);
    v53 = v24;
    if (v24)
    {
      strlcpy((char *)v24, (const char *)(dir_iterator + 56), *(_QWORD *)(dir_iterator + 48));
LABEL_45:
      v48 = 0xAAAAAAAAAAAAAAAALL;
      if (a4)
      {
        v25 = 0;
        v26 = *(_QWORD *)(a4 + 8);
        v27 = v50;
        if (v50)
          v28 = v50 - 24;
        else
          v28 = -1;
        v29 = (_QWORD *)a4;
        v30 = v9;
      }
      else
      {
        v27 = 0;
        v29 = (_QWORD *)(*(_QWORD *)(a5 + 8) + 8);
        v30 = 1;
        v26 = -1;
        v25 = a5;
        v28 = -1;
      }
      v45[0] = *v29;
      v45[1] = v26;
      v45[2] = dir_iterator;
      v45[3] = a1;
      v45[4] = v25;
      v46 = v28;
      v47 = v27;
      LOBYTE(v48) = v30;
      v32 = iterate_jobjs(v14, 1, 0, (unsigned __int8 *)v51, (uint64_t (*)(__int128 *, uint64_t))userfs_process_dirent_cb, (uint64_t)v45);
      if (v32)
      {
        v33 = pthread_rwlock_unlock(v44);
        if (v33)
          panic("%s:%d: unlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_dirops.c", 426, v33);
        save_dir_iterator(v13, dir_iterator, &v49);
        v34 = pthread_rwlock_rdlock(v44);
        if (v34)
          panic("%s:%d: rdlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_dirops.c", 428, v34);
        v22 = 0;
        dir_iterator = 0;
        if (v32 == 0x80000000)
          v12 = 0;
        else
          v12 = v32;
      }
      else if ((v43 & 1) != 0)
      {
        v12 = 0;
        v22 = 1;
      }
      else
      {
        _apfs_free((void *)dir_iterator, 856);
        v12 = 0;
        v22 = 0;
        dir_iterator = 0;
      }
      if (v46 == -1)
      {
        if ((_DWORD)v12)
          v12 = v12;
        else
          v12 = 4294966295;
      }
      else
      {
        v37 = (uint64_t *)a4;
        if (!a4)
          v37 = (uint64_t *)(*(_QWORD *)(a5 + 8) + 8);
        if (v32)
          v38 = v49;
        else
          v38 = -1;
        readdir_mark_dirent_as_end(*v37, v46, v38, v9);
      }
      if ((v11 & 1) == 0)
      {
        v31 = v47;
        if (a4)
        {
          if (v47 >= *(_QWORD *)(a4 + 8))
            v31 = *(_QWORD *)(a4 + 8);
          goto LABEL_82;
        }
        *v10 = v47;
LABEL_87:
        *(_QWORD *)(*(_QWORD *)(a5 + 8) + 16) = *(unsigned int *)(v13 + 88);
        goto LABEL_88;
      }
LABEL_85:
      if (a4)
        goto LABEL_86;
      goto LABEL_87;
    }
    goto LABEL_65;
  }
  dir_iterator = 0;
  v22 = 0;
  v12 = 0;
  v31 = v50;
LABEL_82:
  *v10 = v31;
LABEL_86:
  **(_QWORD **)(a4 + 32) = *(unsigned int *)(v13 + 88);
LABEL_88:
  v39 = pthread_rwlock_unlock(v44);
  if (v39)
    panic("%s:%d: unlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_dirops.c", 480, v39);
  v40 = v22 ^ 1;
  if (!dir_iterator)
    v40 = 1;
  if ((v40 & 1) == 0)
    remove_selected_and_stale_dir_iterators(v13, dir_iterator);
  if (v53)
    _apfs_free(v53, HIWORD(v52));
  return v12;
}

uint64_t apfs_udirop_readdirattr(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t *a6)
{
  uint64_t v6;
  _QWORD v8[6];

  v6 = 22;
  if (a1 && a6 && a5 && a2 && *(_QWORD *)(a1 + 8))
  {
    v8[0] = a2;
    v8[1] = a3;
    v8[2] = 0;
    v8[3] = a5;
    v8[4] = a6;
    v8[5] = 0xAAAAAAAAAAAAAA01;
    return apfs_udir_iterate_dir(a1, a4, *a6, (uint64_t)v8, 0);
  }
  return v6;
}

uint64_t apfs_udirop_scandir(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD v5[3];

  v3 = 22;
  if (a1 && a3 && a2 && *(_QWORD *)(a1 + 8))
  {
    v5[1] = a3;
    v5[2] = 0xAAAAAAAAAAAAAA00;
    v5[0] = a2;
    return apfs_udir_iterate_dir(a1, *(_QWORD *)(a2 + 24), *(_QWORD *)(a2 + 32), 0, (uint64_t)v5);
  }
  return v3;
}

uint64_t apfs_udirop_scanids(uint64_t *a1, unint64_t a2, uint64_t a3, unsigned int a4, uint64_t a5)
{
  uint64_t v5;
  __int128 v7;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _OWORD v18[4];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  unint64_t v26;

  v5 = 22;
  if (a1 && a3)
  {
    v26 = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v7 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v24 = v7;
    v25 = v7;
    v22 = v7;
    v23 = v7;
    v20 = v7;
    v21 = v7;
    v18[3] = v7;
    v19 = v7;
    v18[1] = v7;
    v18[2] = v7;
    v18[0] = v7;
    if (a2 >= 0x4000)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        apfs_udirop_scanids_cold_1();
    }
    else
    {
      v10 = *a1;
      v11 = _apfs_malloc(0x2FEuLL);
      if (v11)
      {
        v12 = v11;
        if (a4)
        {
          v13 = 0;
          v14 = a4;
          do
          {
            bzero(v12, 0x2FEuLL);
            v15 = *(_QWORD *)(a3 + 8 * v13);
            if (v15 != 1)
            {
              v16 = apfs_getinfo_from_id(v10, *(_QWORD *)(a3 + 8 * v13), (uint64_t)v18, (char *)v12, 0x2FEuLL);
              if ((_DWORD)v16 != 2)
              {
                v5 = v16;
                if ((_DWORD)v16)
                  goto LABEL_15;
                if (v15 == 2)
                  *((_QWORD *)&v19 + 1) = v19;
                (*(void (**)(uint64_t, uint64_t, _OWORD *, void *))(a5 + 16))(a5, v13, v18, v12);
              }
            }
            ++v13;
          }
          while (v14 != v13);
        }
        v5 = 0;
LABEL_15:
        _apfs_free(v12, 766);
      }
      else
      {
        return 12;
      }
    }
  }
  return v5;
}

uint64_t apfs_ufileop_getattr(uint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  int v7;

  result = 22;
  if (a1 && a2)
  {
    v5 = *a1;
    v6 = a1[1];
    v7 = pthread_rwlock_rdlock((pthread_rwlock_t *)(v6 + 128));
    if (v7)
      panic("%s:%d: rdlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 42, v7);
    userfs_pack_ufa_common(v5, v6, a2);
    result = pthread_rwlock_unlock((pthread_rwlock_t *)(v6 + 128));
    if ((_DWORD)result)
      panic("%s:%d: unlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 44, result);
  }
  return result;
}

uint64_t apfs_ufileop_setattr(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;

  v3 = 22;
  if (a1 && a2 && a3)
  {
    v6 = a1[1];
    if ((*(_BYTE *)(v6 + 73) & 8) != 0)
      return 45;
    v7 = *a1;
    if ((userfs_file_is_compressed(*a1, v6) & 1) != 0)
    {
      return 45;
    }
    else
    {
      v3 = userfs_set_ufa_common(v7, v6, a2, a3);
      if ((_DWORD)v3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        apfs_ufileop_setattr_cold_1();
    }
  }
  return v3;
}

uint64_t apfs_ufileop_lookup(uint64_t *a1, char *__s1, uint64_t **a3)
{
  __int128 v3;
  uint64_t inode;
  uint64_t v8;
  uint64_t v9;
  size_t v10;
  size_t v11;
  int v12;
  uint64_t *v13;
  unsigned int v14;
  int v15;
  uint64_t v16;
  int v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25[3];
  int v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  _BYTE v32[14];
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v23 = v3;
  v24 = v3;
  inode = 22;
  if (!a1 || !__s1 || !a3)
    return inode;
  v26 = -1431655766;
  memset(v25, 170, sizeof(v25));
  v8 = *a1;
  v9 = a1[1];
  v10 = strnlen(__s1, 0x2FEuLL);
  *a3 = 0;
  if ((*(_WORD *)(a1[1] + 104) & 0xF000) != 0x8000)
  {
    v11 = v10;
    switch(v10)
    {
      case 0uLL:
        return 2;
      case 2uLL:
        if (*__s1 != 46)
          goto LABEL_16;
        v12 = __s1[1];
        break;
      case 1uLL:
        v12 = *__s1;
        break;
      default:
        goto LABEL_16;
    }
    if (v12 == 46)
      return 1;
LABEL_16:
    v13 = (uint64_t *)_apfs_calloc(1uLL, 0x10uLL);
    v14 = apfs_check_name((uint64_t)__s1, v11, 0, &v26);
    if (v14 != 63 || v26)
    {
      v15 = pthread_rwlock_rdlock((pthread_rwlock_t *)(v9 + 128));
      if (v15)
        panic("%s:%d: rdlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 179, v15);
      if ((*(_BYTE *)(v9 + 120) & 0x18) != 0)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          v16 = *(_QWORD *)(a1[1] + 8);
          *(_DWORD *)buf = 136315650;
          v28 = "apfs_ufileop_lookup";
          v29 = 1024;
          v30 = 187;
          v31 = 2048;
          *(_QWORD *)v32 = v16;
          _os_log_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s:%d: Parent directory %llu is deleted.\n", buf, 0x1Cu);
        }
        inode = 2;
      }
      else
      {
        *(_QWORD *)&v23 = v8;
        *((_QWORD *)&v23 + 1) = v9;
        *(_QWORD *)&v24 = __s1;
        *((_QWORD *)&v24 + 1) = v11;
        v25[0] = 0;
        v19 = userfs_internal_lookup((uint64_t)&v23, v14, v25, &v25[2], &v25[1]);
        if ((_DWORD)v19)
        {
          inode = v19;
          if ((_DWORD)v19 != 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            v20 = *(_QWORD *)(a1[1] + 8);
            v21 = *(_QWORD *)(v8 + 400);
            *(_DWORD *)buf = 136316674;
            v28 = "apfs_ufileop_lookup";
            v29 = 1024;
            v30 = 215;
            v31 = 1040;
            *(_DWORD *)v32 = v11;
            *(_WORD *)&v32[4] = 2080;
            *(_QWORD *)&v32[6] = __s1;
            v33 = 2048;
            v34 = v20;
            v35 = 2080;
            v36 = v21;
            v37 = 1024;
            v38 = inode;
            _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: failed to find directory entry with name(%.*s) inside directory with ino: %llu, inside volume %s. Error %d \n", buf, 0x3Cu);
          }
        }
        else
        {
          inode = userfs_load_inode(v8, v9, v25[2], v25[1], v13);
          if (!(_DWORD)inode)
          {
            v22 = v13[1];
            if (v25[0])
            {
              jobj_release(v8, (_BYTE *)v25[0]);
              v25[0] = 0;
            }
            inode = 0;
            if (!*(_DWORD *)(v8 + 1100))
              *(_BYTE *)(v22 + 16) = 1;
          }
        }
      }
      v17 = pthread_rwlock_unlock((pthread_rwlock_t *)(v9 + 128));
      if (v17)
        panic("%s:%d: unlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 243, v17);
      if (!(_DWORD)inode)
        goto LABEL_30;
    }
    else
    {
      inode = 63;
    }
    if (v13)
    {
      _apfs_free(v13, 16);
      v13 = 0;
    }
LABEL_30:
    *a3 = v13;
    return inode;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    apfs_ufileop_lookup_cold_1();
  return 20;
}

uint64_t apfs_ufileop_reclaim(uint64_t a1, char a2)
{
  if (a1)
    return userfs_reclaim_with_flags(a1, a2);
  else
    return 22;
}

uint64_t apfs_ufileop_readlink(uint64_t *a1, char *a2, size_t a3, size_t *a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  pthread_rwlock_t *v13;
  pthread_rwlock_t *v14;
  int v15;
  const char *v16;
  size_t v17;
  int v18;
  char *v19;
  int v20;
  int v21;
  uint64_t v22;
  _BYTE *v23;
  char v24;

  v24 = 0;
  v5 = 22;
  if (!a1 || !a2 || !a4 || !a5)
    return v5;
  v9 = *a1;
  v10 = a1[1];
  *a4 = 0;
  *a2 = 0;
  v23 = 0;
  if ((*(_WORD *)(v10 + 104) & 0xF000) != 0xA000 || (*(_BYTE *)(v10 + 120) & 0x18) != 0)
    return 22;
  v13 = (pthread_rwlock_t *)(v10 + 128);
  v22 = *(_QWORD *)(v10 + 360);
  v14 = (pthread_rwlock_t *)(v10 + 128);
  if (!v22)
  {
    v18 = pthread_rwlock_wrlock(v14);
    if (v18)
      panic("%s:%d: wrlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 373, v18);
    goto LABEL_16;
  }
  v15 = pthread_rwlock_rdlock(v14);
  if (v15)
    panic("%s:%d: rdlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 361, v15);
  v16 = *(const char **)(v10 + 360);
  if (!v16)
  {
LABEL_16:
    if (fs_get_xattr(v9, *(_QWORD *)(v10 + 8), (uint64_t *)(v10 + 328), "com.apple.fs.symlink", &v23))
    {
      v23 = 0;
      v16 = &v24;
      v17 = 1;
    }
    else
    {
      v16 = &v23[*((unsigned __int16 *)v23 + 10) + 24];
      v17 = *((unsigned __int16 *)v23 + 11);
      if (!v22 && !*(_QWORD *)(v10 + 360))
      {
        v19 = (char *)_apfs_calloc(1uLL, *((unsigned __int16 *)v23 + 11));
        *(_QWORD *)(v10 + 360) = v19;
        if (v19)
        {
          strlcpy(v19, v16, v17);
          *(_DWORD *)(v10 + 368) = v17;
        }
      }
    }
    goto LABEL_22;
  }
  v17 = *(int *)(v10 + 368);
LABEL_22:
  if (v17 <= a3)
  {
    strlcpy(a2, v16, v17);
    *a4 = v17;
    userfs_pack_ufa_common(v9, v10, a5);
    v5 = 0;
  }
  else
  {
    v5 = 55;
  }
  v20 = pthread_rwlock_unlock(v13);
  if (v20)
  {
    v21 = 431;
    if (!v22)
      v21 = 429;
    panic("%s:%d: unlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", v21, v20);
  }
  jobj_release(v9, v23);
  return v5;
}

uint64_t apfs_ufileop_symlink(uint64_t *a1, char *__s1, char *a3, uint64_t a4, uint64_t **a5)
{
  uint64_t common;
  uint64_t v9;
  uint64_t *v11;

  common = 22;
  if (a1 && __s1 && a3 && a4 && a5)
  {
    v9 = *a1;
    if (*(_QWORD *)(a1[1] + 8) == *(_QWORD *)(*(_QWORD *)(*a1 + 488) + 8))
    {
      return 13;
    }
    else
    {
      common = userfs_create_common(a1, __s1, a4, a5, 3, a3);
      if (!(_DWORD)common)
      {
        if ((*(_QWORD *)(a4 + 8) & 0xFFFFFFFFFFFFFFE5) != 0)
        {
          v11 = *a5;
          common = userfs_set_ufa_common(v9, (*a5)[1], a4, 0);
          if ((_DWORD)common)
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              apfs_ufileop_symlink_cold_2();
            if (userfs_internal_remove(v11, __s1, 0, 0)
              && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            {
              apfs_ufileop_symlink_cold_1();
            }
            userfs_internal_reclaim((uint64_t)v11);
            *a5 = 0;
          }
        }
        else
        {
          return 0;
        }
      }
    }
  }
  return common;
}

uint64_t apfs_ufileop_link(uint64_t **a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5)
{
  uint64_t inserted;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  int v14;
  int v15;
  int v16;
  int v17;
  uint64_t v18;
  size_t v19;
  uint64_t v20;
  unsigned __int8 *v21;
  uint64_t sibling_link;
  uint64_t *v23;
  _OWORD v24[3];
  uint64_t v25;
  uint64_t v26;
  int v27;
  int v28;
  size_t v29[4];
  _BYTE *v30;
  _BYTE *v31;

  v30 = 0;
  v31 = 0;
  inserted = 22;
  if (!a1 || !a2 || !a3 || !a4 || !a5)
    return inserted;
  v9 = *a1;
  if (*((_DWORD *)*a1 + 275))
    return 30;
  v10 = (uint64_t)a1[1];
  if ((*(_WORD *)(v10 + 104) & 0xF000) == 0x4000)
    return 21;
  v11 = *(_QWORD *)(a2 + 8);
  if ((*(_WORD *)(v11 + 104) & 0xF000) != 0x4000)
    return 21;
  v12 = (uint64_t *)(v11 + 8);
  if (*(_QWORD *)(v11 + 8) == *(_QWORD *)(v9[61] + 8))
    return 13;
  memset(v29, 170, sizeof(v29));
  v27 = -1431655766;
  v28 = -1431655766;
  v26 = 0xAAAAAAAAAAAAAAAALL;
  inserted = userfs_check_name(a3, 1, v29);
  if ((_DWORD)inserted)
    return inserted;
  v14 = pthread_rwlock_wrlock((pthread_rwlock_t *)(v11 + 128));
  if (v14)
    panic("%s:%d: wrlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 560, v14);
  v15 = pthread_rwlock_wrlock((pthread_rwlock_t *)(v10 + 128));
  if (v15)
    panic("%s:%d: wrlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 561, v15);
  if ((*(_BYTE *)(v11 + 120) & 0x18) != 0 || (*(_BYTE *)(v10 + 120) & 0x18) != 0)
  {
    inserted = 22;
    goto LABEL_22;
  }
  v18 = fs_name_exists_with_parent_id(v9, *(_QWORD *)(v11 + 8), a3, v29[0], (uint64_t *)(v11 + 344), &v28);
  if ((v18 + 1) < 2)
  {
    inserted = 17;
    goto LABEL_22;
  }
  inserted = v18;
  if ((_DWORD)v18 == 2)
  {
    v23 = (uint64_t *)(v10 + 8);
    inserted = dir_rec_alloc_with_hash((uint64_t)v9, 1, a3, v29[0], v28, *v12, *(_QWORD *)(v10 + 8), &v30);
    if (!(_DWORD)inserted)
    {
      inserted = 22;
      if (!xf_get_ptr_and_size((unsigned __int16 *)(v10 + 416), 4, 0, &v29[3], &v27) && v27 >= 1)
      {
        v19 = strlen((const char *)v29[3]);
        v20 = fs_lookup_name_with_parent_id(v9, *(_QWORD *)(v10 + 24), (const char *)v29[3], v19, 0, 0, &v31);
        if ((_DWORD)v20)
        {
          inserted = v20;
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            apfs_ufileop_link_cold_4();
          goto LABEL_22;
        }
        inserted = fs_tx_enter((uint64_t)v9, 1, 4, 0, &v26);
        if (!(_DWORD)inserted)
        {
          if (xf_get((unsigned __int16 *)v31 + 16, 1, 0, (char *)&v29[2], 8uLL))
          {
            v29[2] = get_next_apfs_obj_id((uint64_t)v9);
            if (xf_set((unsigned __int16 *)v31 + 16, 1, 2, &v29[2], 8uLL))
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                apfs_ufileop_link_cold_3();
              inserted = 5;
LABEL_51:
              fs_tx_leave((uint64_t)v9, 1, 4, 0, v26);
              goto LABEL_22;
            }
            v21 = v31;
            v31[1] = 2;
            update_jobj((uint64_t)v9, 1, v21, v26);
            sibling_link = create_sibling_link((uint64_t)v9, *v23, v29[2], *((_QWORD *)v31 + 1), *((const void **)v31 + 8), *((unsigned __int16 *)v31 + 31), v26);
            if ((_DWORD)sibling_link)
            {
              inserted = sibling_link;
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                apfs_ufileop_link_cold_2();
              goto LABEL_51;
            }
          }
          *((_QWORD *)v30 + 3) = get_timestamp();
          *((_WORD *)v30 + 30) = file_type_to_dirent_type(*(unsigned __int16 *)(v10 + 104));
          v29[1] = get_next_apfs_obj_id((uint64_t)v9);
          xf_set((unsigned __int16 *)v30 + 16, 1, 2, &v29[1], 8uLL);
          inserted = insert_jobj((uint64_t)v9, 1, v30, v26);
          if (!(_DWORD)inserted)
          {
            update_time((uint64_t)v9, (_QWORD *)v10, 2);
            ++*(_DWORD *)(v10 + 80);
            inserted = update_jobj((uint64_t)v9, 1, (unsigned __int8 *)v10, v26);
            if (!(_DWORD)inserted)
            {
              update_time((uint64_t)v9, (_QWORD *)v11, 3);
              v25 = 0;
              memset(v24, 0, sizeof(v24));
              update_size_tracking((uint64_t)v9, v11, v24, v26);
              ++*(_DWORD *)(v11 + 80);
              ++*(_DWORD *)(v11 + 88);
              inserted = update_jobj((uint64_t)v9, 1, (unsigned __int8 *)v11, v26);
              if (!(_DWORD)inserted)
              {
                inserted = create_sibling_link((uint64_t)v9, *v23, v29[1], *v12, *((const void **)v30 + 8), *((unsigned __int16 *)v30 + 31), v26);
                if (!(_DWORD)inserted)
                {
                  fs_tx_leave((uint64_t)v9, 1, 4, 0, v26);
                  userfs_pack_ufa_common((uint64_t)v9, v10, a4);
                  userfs_pack_ufa_common((uint64_t)v9, v11, a5);
                  goto LABEL_22;
                }
                if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                  apfs_ufileop_link_cold_1();
              }
            }
          }
          goto LABEL_51;
        }
      }
    }
  }
LABEL_22:
  v16 = pthread_rwlock_unlock((pthread_rwlock_t *)(v10 + 128));
  if (v16)
    panic("%s:%d: unlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 696, v16);
  v17 = pthread_rwlock_unlock((pthread_rwlock_t *)(v11 + 128));
  if (v17)
    panic("%s:%d: unlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 697, v17);
  jobj_release((uint64_t)v9, v31);
  jobj_release((uint64_t)v9, v30);
  return inserted;
}

uint64_t apfs_ufileop_read(uint64_t *a1, unint64_t a2, unint64_t a3, char *a4, _QWORD *a5)
{
  uint64_t v5;
  char *v6;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int block_size;
  int v15;
  unsigned int v16;
  uint64_t v18;
  _BOOL4 v19;
  char *v20;
  _QWORD *v21;
  pthread_rwlock_t *v22;
  int v23;
  int v24;
  int v25;
  char v26;
  unint64_t v27;
  uint64_t data;
  size_t v29;
  size_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  size_t v36;
  size_t v37;
  int v38;
  int v39;
  uint64_t dstream;
  unint64_t *v41;
  unint64_t v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  size_t v51;
  unint64_t v52;
  _QWORD *v53;
  unint64_t v54;
  int v55;
  size_t __n[4];
  unint64_t v57;
  _BYTE buf[40];
  __int128 v59;
  unint64_t v60;
  __int16 v61;
  unint64_t v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v5 = 22;
  if (!a1)
    return v5;
  v6 = a4;
  if (!a4 || !a5)
    return v5;
  v12 = *a1;
  v11 = a1[1];
  v13 = *(_QWORD *)(*a1 + 392);
  block_size = apfs_get_block_size(*a1);
  *a5 = 0;
  v15 = *(_WORD *)(v11 + 104) & 0xF000;
  if (v15 == 0x4000)
    return 21;
  if (v15 != 0x8000)
    return 1;
  if (!a3)
    return 0;
  if ((*(_BYTE *)(v11 + 73) & 8) != 0)
    return 45;
  v16 = block_size;
  if ((userfs_file_is_compressed(v12, v11) & 1) != 0)
    return 45;
  v57 = 0xAAAAAAAAAAAAAAAALL;
  v18 = v16;
  v50 = v16 - 1;
  if ((v50 & a2) != 0)
  {
    v19 = 1;
    goto LABEL_18;
  }
  if (a3 % v16)
  {
    v19 = v16 >= a3;
LABEL_18:
    v55 = v19;
    v54 = calculate_num_complete_blocks(a2, a3, v16);
    v20 = (char *)_apfs_malloc(v16);
    if (!v20)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        apfs_ufileop_read_cold_3();
      return 12;
    }
    goto LABEL_23;
  }
  v54 = calculate_num_complete_blocks(a2, a3, v16);
  v55 = 0;
  v20 = 0;
LABEL_23:
  v47 = v20;
  if ((*(_BYTE *)(*(_QWORD *)(v12 + 376) + 264) & 1) != 0)
  {
    v21 = 0;
  }
  else
  {
    v21 = userfs_crypto_alloc_cst(v12);
    if (!v21)
    {
      v53 = 0;
      v5 = 12;
      goto LABEL_89;
    }
  }
  v46 = v13;
  v53 = v21;
  apfs_io_lock_shared(v12, v11);
  v22 = (pthread_rwlock_t *)(v11 + 128);
  v23 = pthread_rwlock_rdlock((pthread_rwlock_t *)(v11 + 128));
  if (v23)
    panic("%s:%d: rdlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 879, v23);
  userfs_get_file_sizes(v12, v11, &v57, 0);
  if ((*(_BYTE *)(v11 + 120) & 0x10) != 0 && v57)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      apfs_ufileop_read_cold_1();
    v24 = pthread_rwlock_unlock((pthread_rwlock_t *)(v11 + 128));
    if (v24)
      panic("%s:%d: unlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 887, v24);
    v5 = 22;
    goto LABEL_89;
  }
  v25 = pthread_rwlock_unlock((pthread_rwlock_t *)(v11 + 128));
  if (v25)
    panic("%s:%d: unlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 890, v25);
  if (v57 <= a2 || a3 + a2 > v57 && (a3 = v57 - a2, v57 == a2))
  {
    v5 = 0;
    goto LABEL_89;
  }
  v26 = __clz(__rbit32(v16));
  if (!v16)
    v26 = -1;
  v48 = v16;
  v49 = v26;
  v27 = a3;
  while (1)
  {
    memset(__n, 170, sizeof(__n));
    *(_QWORD *)buf = a1;
    *(_QWORD *)&buf[8] = a2;
    v52 = v27;
    *(_QWORD *)&buf[16] = v27;
    *(_QWORD *)&buf[24] = &__n[2];
    *(_QWORD *)&buf[32] = __n;
    *(_QWORD *)&v59 = &__n[3];
    *((_QWORD *)&v59 + 1) = &__n[1];
    v60 = 0xAAAAAAAA00000001;
    data = userfs_internal_blockmap((uint64_t)buf);
    if ((_DWORD)data)
      break;
    v29 = __n[0];
    v30 = (__n[3] + v50 + __n[0]) >> v49;
    if ((v55 & 1) != 0 && v30 >= 2)
    {
      v29 = v48 - __n[3];
      __n[0] = v48 - __n[3];
      v30 = 1;
    }
    else if ((v55 & 1) == 0 && v30 > v54)
    {
      if (__n[3])
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          apfs_ufileop_read_cold_2();
        v5 = 5;
        v18 = v48;
        goto LABEL_78;
      }
      v29 = v54 << v49;
      __n[0] = v54 << v49;
      v30 = v54;
    }
    v31 = __n[2];
    v51 = v30;
    if (__n[2] == -1)
    {
      v36 = v30 << v49;
      if ((v55 & 1) == 0)
      {
        bzero(v6, v36);
        v18 = v48;
        goto LABEL_64;
      }
      v33 = v47;
      bzero(v47, v36);
      v35 = v48;
    }
    else
    {
      if (v53)
        *(_QWORD *)(v53[9] + 8) = __n[1];
      v32 = *(_QWORD *)(v46 + 384);
      if ((v55 & 1) == 0)
      {
        data = dev_read_data(v32, v31);
        v18 = v48;
        if ((_DWORD)data)
          break;
        v29 = __n[0];
        goto LABEL_64;
      }
      v33 = v47;
      v34 = dev_read_data(v32, v31);
      v35 = v48;
      if ((_DWORD)v34)
      {
        v5 = v34;
        v18 = v48;
        v22 = (pthread_rwlock_t *)(v11 + 128);
        goto LABEL_72;
      }
    }
    v29 = __n[0];
    memcpy(v6, &v33[__n[3]], __n[0]);
    v18 = v35;
    v22 = (pthread_rwlock_t *)(v11 + 128);
LABEL_64:
    v37 = v51;
    a2 += v29;
    v6 += v29;
    v38 = v55;
    if ((v55 & 1) != 0)
    {
      v38 = 0;
      v37 = 0;
    }
    v54 -= v37;
    if (!v54)
      v38 = 1;
    v55 = v38;
    v27 = v52 - v29;
    if (v52 == v29)
    {
      v52 = 0;
      v5 = 0;
LABEL_81:
      v39 = pthread_rwlock_rdlock(v22);
      if (v39)
        panic("%s:%d: rdlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 1062, v39);
      if (!(_DWORD)v5)
      {
        dstream = fs_get_dstream(v12, v11);
        *a5 = a3 - v52;
        if (dstream)
        {
          v41 = (unint64_t *)(dstream + 32);
          do
            v42 = __ldxr(v41);
          while (__stxr(v42 + a3 - v52, v41));
        }
      }
      v43 = pthread_rwlock_unlock(v22);
      if (v43)
        panic("%s:%d: unlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 1077, v43);
      goto LABEL_89;
    }
  }
  v5 = data;
LABEL_72:
  if (v5 <= 0x23 && ((1 << v5) & 0x800000042) != 0)
    goto LABEL_81;
LABEL_78:
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v44 = *(_QWORD *)(v11 + 8);
    v45 = *(_QWORD *)(v11 + 32);
    *(_DWORD *)buf = 136316930;
    *(_QWORD *)&buf[4] = "apfs_ufileop_read";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1055;
    *(_WORD *)&buf[18] = 2048;
    *(_QWORD *)&buf[20] = v44;
    *(_WORD *)&buf[28] = 2048;
    *(_QWORD *)&buf[30] = v45;
    *(_WORD *)&buf[38] = 1024;
    LODWORD(v59) = v5;
    WORD2(v59) = 2048;
    *(_QWORD *)((char *)&v59 + 6) = v57;
    HIWORD(v59) = 2048;
    v60 = a2;
    v61 = 2048;
    v62 = v52;
    _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: ### obj-id %lld/%lld error %d filesize %lld offset %lld resid %zu ###\n", buf, 0x4Au);
  }
  if ((_DWORD)v5 != 9)
    goto LABEL_81;
LABEL_89:
  apfs_io_unlock_shared(v12, v11);
  if (v47)
    _apfs_free(v47, v18);
  if (v53)
    crypto_obj_release(v53);
  return v5;
}

uint64_t apfs_ufileop_write(uint64_t *a1, unint64_t a2, unint64_t a3, char *a4, unint64_t *a5)
{
  uint64_t result;
  char *v7;
  uint64_t v11;
  uint64_t v12;
  unsigned int block_size;
  uint64_t v14;
  int v15;
  unsigned int v16;
  uint64_t v17;
  _BOOL4 v18;
  BOOL v19;
  int v20;
  BOOL v21;
  int v22;
  unint64_t v23;
  char v24;
  char *v25;
  unsigned int v26;
  int i;
  int v28;
  _QWORD *dstream;
  unint64_t v30;
  int v31;
  int v32;
  int v33;
  uint64_t v34;
  unint64_t v35;
  _BOOL4 v36;
  int v37;
  char *v38;
  uint64_t v39;
  int v41;
  _QWORD *v42;
  _BOOL4 v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  int v51;
  _QWORD *v52;
  unint64_t v53;
  BOOL v54;
  size_t v55;
  unint64_t v56;
  _QWORD *v57;
  unsigned int v58;
  unsigned int v59;
  unsigned int v60;
  int v61;
  int v62;
  uint64_t v63;
  unint64_t *v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  _BOOL4 v70;
  _QWORD *v71;
  unint64_t v72;
  uint64_t v73;
  char v74;
  BOOL v75;
  unint64_t v76;
  unint64_t v77;
  BOOL v78;
  char *v79;
  uint64_t v80;
  int v81;
  unint64_t v82;
  pthread_rwlock_t *v83;
  _QWORD v84[4];
  _OWORD v85[3];
  uint64_t v86;
  unsigned int v87;
  unint64_t v88;
  unint64_t __dst;
  unint64_t __src;
  _QWORD *v91;
  _BYTE buf[40];
  __int128 v93;
  unint64_t v94;
  __int16 v95;
  unint64_t v96;
  uint64_t v97;

  v97 = *MEMORY[0x24BDAC8D0];
  v88 = 0;
  __dst = 0xAAAAAAAAAAAAAAAALL;
  v87 = 0;
  result = 22;
  if (!a1)
    return result;
  v7 = a4;
  if (!a4 || !a5)
    return result;
  v12 = *a1;
  v11 = a1[1];
  block_size = apfs_get_block_size(*a1);
  v14 = 0x80000000000000;
  if (!__CFADD__(a2, a3))
    v14 = a2 + a3;
  *a5 = 0;
  if (*(_DWORD *)(v12 + 1100))
    return 30;
  v15 = *(_WORD *)(v11 + 104) & 0xF000;
  if (v15 == 0x4000)
    return 21;
  if (v15 != 0x8000)
    return 1;
  if ((*(_BYTE *)(v11 + 73) & 8) != 0)
    return 45;
  v16 = block_size;
  v82 = v14;
  if ((userfs_file_is_compressed(v12, v11) & 1) != 0)
    return 45;
  if (v82 >> 55)
    return 27;
  if (!a3)
    return 0;
  v17 = v16 - 1;
  v18 = (v17 & a2) == 0;
  v80 = v16;
  if (v16 <= a3)
    v18 = 0;
  v19 = (v17 & a2) != 0 || v16 > a3;
  v20 = !v18;
  if ((v82 & v17) != 0)
    v21 = v19;
  else
    v21 = (v17 & a2) != 0;
  if ((v82 & v17) != 0)
    v22 = v20;
  else
    v22 = 0;
  __src = 0xAAAAAAAAAAAAAAAALL;
  v91 = (_QWORD *)0xAAAAAAAAAAAAAAAALL;
  v23 = calculate_num_complete_blocks(a2, a3, v16);
  v24 = v22;
  v77 = v23;
  v78 = v21;
  if (v21 || v22)
  {
    v25 = (char *)_apfs_calloc(1uLL, v16);
    v75 = v21;
    v24 = v22;
    v79 = v25;
    if (!v25)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        apfs_ufileop_write_cold_1();
      return 12;
    }
  }
  else
  {
    v79 = 0;
    v75 = 0;
  }
  v74 = v24;
  v26 = 0;
  v83 = (pthread_rwlock_t *)(v11 + 128);
  for (i = 1; ; i = v31 ^ 1)
  {
    if ((i & 1) != 0)
      apfs_io_lock_exclusive(v12, v11);
    else
      apfs_io_lock_shared(v12, v11);
    v28 = pthread_rwlock_wrlock(v83);
    if (v28)
      panic("%s:%d: wrlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 1230, v28);
    if ((*(_BYTE *)(v11 + 120) & 0x10) != 0)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        apfs_ufileop_write_cold_9();
      v34 = 0;
      v35 = 0;
      v36 = 0;
      v87 = 22;
      goto LABEL_63;
    }
    clear_ino_purgeable_state_(v12, v11, 0);
    dstream = (_QWORD *)fs_get_dstream(v12, v11);
    v91 = dstream;
    v30 = dstream ? *dstream : 0;
    __src = v30;
    v81 = i;
    v31 = i | (v82 <= v30);
    if ((v31 & 1) != 0)
      break;
    v33 = pthread_rwlock_unlock(v83);
    if (v33)
      panic("%s:%d: unlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 1259, v33);
    apfs_io_unlock_shared(v12, v11);
LABEL_55:
    ++v26;
  }
  if (v26 <= 2 && ((v81 ^ 1) & 1) == 0 && v82 <= v30)
  {
    v32 = pthread_rwlock_unlock(v83);
    if (v32)
      panic("%s:%d: unlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 1268, v32);
    apfs_io_unlock_exclusive(v12, v11);
    goto LABEL_55;
  }
  v87 = clone_extents_if_needed(v12, v11, 0);
  if (v87)
  {
    LOBYTE(i) = v81;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      apfs_ufileop_write_cold_8();
    v34 = 0;
    v35 = 0;
    v36 = 0;
LABEL_63:
    v37 = 1;
    v38 = v79;
    goto LABEL_64;
  }
  v42 = (_QWORD *)fs_get_dstream(v12, v11);
  v91 = v42;
  v43 = v42 == 0;
  if (v42)
  {
    v72 = 0;
    v73 = 0;
    v37 = 0;
    goto LABEL_85;
  }
  v48 = (a3 + v16 - 1) / v16;
  v37 = 1;
  v72 = v48;
  v73 = v48 / 0x32 + 3;
  v87 = fs_tx_enter(v12, 1, v73, v48, (uint64_t *)&v88);
  if (v87)
  {
LABEL_92:
    v36 = 0;
    goto LABEL_93;
  }
  v42 = (_QWORD *)fs_create_dstream(v12, v11, v88, (int *)&v87);
  v91 = v42;
  if (!v42)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      apfs_ufileop_write_cold_2();
    goto LABEL_92;
  }
LABEL_85:
  v45 = *v42;
  v44 = v42[1];
  __src = *v42;
  *(_QWORD *)(v11 + 120) |= 0x10000000uLL;
  v46 = v82;
  if (v82 <= v44)
  {
LABEL_100:
    v69 = v45;
    if (v46 > v45)
    {
      v50 = v45;
      if (!v88)
      {
        v87 = fs_tx_enter(v12, 1, 1, 0, (uint64_t *)&v88);
        v36 = v37 != 0;
        if (v87)
        {
          v35 = 0;
          v37 = 1;
          v38 = v79;
          LOBYTE(i) = v81;
          v34 = 1;
          goto LABEL_64;
        }
        v50 = __src;
        v72 = 0;
        v73 = 1;
        v46 = v82;
      }
      *(_QWORD *)(v11 + 368) = v50;
      *(_QWORD *)(v11 + 120) |= 0x4000000000000uLL;
      *v91 = v46;
      if (xf_get((unsigned __int16 *)(v11 + 416), 5, 0, (char *)&__dst, 8uLL) || __dst > __src)
      {
        xf_set((unsigned __int16 *)(v11 + 416), 5, 0, &__src, 8uLL);
        *(_QWORD *)(v11 + 120) |= 0x100uLL;
        v91 = 0;
      }
    }
    v86 = 0;
    memset(v85, 0, sizeof(v85));
    update_size_tracking(v12, v11, v85, v88);
    ++*(_DWORD *)(v11 + 88);
    v70 = v88 == 0;
    if (v88)
    {
      update_jobj(v12, 1, (unsigned __int8 *)v11, v88);
      fs_tx_leave(v12, 1, v73, v72, v88);
      v88 = 0;
    }
    v51 = pthread_rwlock_unlock(v83);
    if (v51)
      panic("%s:%d: unlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 1396, v51);
    if ((*(_BYTE *)(*(_QWORD *)(v12 + 376) + 264) & 1) != 0)
    {
      v52 = 0;
    }
    else
    {
      v52 = userfs_crypto_alloc_cst(v12);
      if (!v52)
        return 12;
    }
    if (v87)
    {
      v76 = a3;
    }
    else
    {
      v71 = v52;
      v53 = a3;
      v54 = v75;
      while (1)
      {
        memset(v84, 170, sizeof(v84));
        *(_QWORD *)buf = a1;
        *(_QWORD *)&buf[8] = a2;
        *(_QWORD *)&buf[16] = v53;
        *(_QWORD *)&buf[24] = &v84[3];
        *(_QWORD *)&buf[32] = &v84[1];
        v94 = 0xAAAAAAAA00000002;
        *(_QWORD *)&v93 = v84;
        *((_QWORD *)&v93 + 1) = &v84[2];
        v87 = userfs_internal_blockmap((uint64_t)buf);
        v76 = v53;
        if (v87)
          break;
        if (v54)
        {
          if (v78)
          {
            if ((unint64_t)v16 - v84[0] >= v53)
              v55 = v53;
            else
              v55 = v16 - v84[0];
          }
          else
          {
            v55 = v82 - a2;
          }
          v84[1] = v55;
          v87 = userfs_combine_block_and_buf(a1, a2, v7, v55, __src <= a2 / v16 * v16, v79);
          if (v87)
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              apfs_ufileop_write_cold_5();
            goto LABEL_144;
          }
          v56 = 0;
          v57 = v71;
        }
        else
        {
          v56 = ((unint64_t)v16 - 1 + v84[1]) / v16;
          v57 = v71;
          if (v56 > v77)
          {
            v84[1] = v77 * v16;
            v56 = v77;
          }
        }
        if (v57)
          *(_QWORD *)(v57[9] + 8) = v84[2];
        v87 = dev_write_data(*(_QWORD **)(*(_QWORD *)(v12 + 392) + 384), v84[3]);
        if (v87)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            apfs_ufileop_write_cold_4();
          goto LABEL_144;
        }
        v78 = 0;
        a2 += v84[1];
        v7 += v84[1];
        v77 -= v56;
        if (v77)
          v54 = 0;
        else
          v54 = v74;
        v53 -= v84[1];
        if (v76 == v84[1])
        {
          v76 = 0;
          goto LABEL_144;
        }
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        apfs_ufileop_write_cold_6();
LABEL_144:
      v52 = v71;
    }
    if (v52)
      crypto_obj_release(v52);
    v58 = v87;
    if (v87)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        v67 = *(_QWORD *)(v11 + 8);
        v68 = *(_QWORD *)(v11 + 32);
        *(_DWORD *)buf = 136316930;
        *(_QWORD *)&buf[4] = "apfs_ufileop_write";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 1571;
        *(_WORD *)&buf[18] = 2048;
        *(_QWORD *)&buf[20] = v67;
        *(_WORD *)&buf[28] = 2048;
        *(_QWORD *)&buf[30] = v68;
        *(_WORD *)&buf[38] = 1024;
        LODWORD(v93) = v58;
        WORD2(v93) = 2048;
        *(_QWORD *)((char *)&v93 + 6) = __src;
        HIWORD(v93) = 2048;
        v94 = a2;
        v95 = 2048;
        v96 = v76;
        _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: ### obj-id %lld/%lld error %d filesize %llu offset %lld resid %zu ###\n", buf, 0x4Au);
        v58 = v87;
      }
      if (v58 == 9)
        goto LABEL_151;
    }
    if (v82 <= v69)
    {
      v62 = pthread_rwlock_wrlock(v83);
      if (v62)
        panic("%s:%d: wrlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 1598, v62);
    }
    else
    {
      v59 = apfs_remove_prev_fsize(v12, v11, 0);
      if (v59)
      {
        v60 = v59;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          apfs_ufileop_write_cold_3();
        if (v60 == 9 || !v87)
        {
          v87 = v60;
          if (v60 == 9)
          {
LABEL_151:
            v37 = 0;
LABEL_172:
            v38 = v79;
            LOBYTE(i) = v81;
            v35 = v72;
            v34 = v73;
            v36 = v70;
            goto LABEL_64;
          }
        }
      }
      v61 = pthread_rwlock_wrlock(v83);
      if (v61)
        panic("%s:%d: wrlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 1595, v61);
      *(_QWORD *)(v11 + 120) &= ~0x4000000000000uLL;
    }
    if (v82 > *(_QWORD *)(v11 + 368))
      *(_QWORD *)(v11 + 368) = v82;
    update_time(v12, (_QWORD *)v11, 3);
    v63 = fs_get_dstream(v12, v11);
    v91 = (_QWORD *)v63;
    if (v63)
    {
      v64 = (unint64_t *)(v63 + 24);
      v65 = a3 - v76;
      do
        v66 = __ldxr(v64);
      while (__stxr(v66 + v65, v64));
    }
    else
    {
      v65 = a3 - v76;
    }
    *a5 = v65;
    v37 = 1;
    goto LABEL_172;
  }
  v70 = v43;
  v47 = v88;
  if (v88)
    goto LABEL_87;
  v49 = (a3 + v16 - 1) / v16;
  v37 = 1;
  v72 = v49;
  v73 = v49 / 0x32 + 3;
  v87 = fs_tx_enter(v12, 1, v73, v49, (uint64_t *)&v88);
  if (v87)
    goto LABEL_172;
  v47 = v88;
  v46 = v82;
LABEL_87:
  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  v87 = alloc_space_for_write((_QWORD *)v12, v11, &v91, 16, v46, 0, (uint64_t *)buf, v47);
  if (!v87)
  {
    v37 = 1;
    v45 = __src;
    v46 = v82;
    goto LABEL_100;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    apfs_ufileop_write_cold_7();
  v37 = 1;
  v36 = 1;
LABEL_93:
  v38 = v79;
  LOBYTE(i) = v81;
  v35 = v72;
  v34 = v73;
LABEL_64:
  v39 = v88;
  if (v88)
  {
    if (v87 != 9 && v36)
    {
      update_jobj(v12, 1, (unsigned __int8 *)v11, v88);
      v39 = v88;
    }
    fs_tx_leave(v12, 1, v34, v35, v39);
    v88 = 0;
  }
  if (v37)
  {
    v41 = pthread_rwlock_unlock(v83);
    if (v41)
      panic("%s:%d: unlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 1635, v41);
  }
  if ((i & 1) != 0)
    apfs_io_unlock_exclusive(v12, v11);
  else
    apfs_io_unlock_shared(v12, v11);
  if (v38)
    _apfs_free(v38, v80);
  return v87;
}

uint64_t apfs_ufileop_getxattr(uint64_t *a1, char *a2, void *a3, unint64_t a4, size_t *a5)
{
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;

  if (!a1)
    return 22;
  v9 = *a1;
  v10 = a1[1];
  v11 = pthread_rwlock_rdlock((pthread_rwlock_t *)(v10 + 128));
  if (v11)
    panic("%s:%d: rdlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 1862, v11);
  v12 = apfs_ufileop_getxattr_data(v9, v10, a2, a3, a4, a5);
  v13 = pthread_rwlock_unlock((pthread_rwlock_t *)(v10 + 128));
  if (v13)
    panic("%s:%d: unlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 1864, v13);
  return v12;
}

uint64_t apfs_ufileop_getxattr_data(uint64_t a1, uint64_t a2, char *a3, void *a4, unint64_t a5, size_t *a6)
{
  uint64_t v6;
  int v13;
  _BYTE *v14;
  int v15;
  size_t v17;
  _BYTE *v18;

  v18 = 0;
  v6 = 22;
  if (a3 && a6)
  {
    v13 = xattr_name_to_kind(a3);
    if (v13 == 1)
    {
      if ((*(_BYTE *)(a2 + 72) & 0x40) == 0)
        return 93;
    }
    else if (v13 == 4 || v13 == 3 && (*(_BYTE *)(a2 + 73) & 1) == 0)
    {
      return 93;
    }
    if (fs_get_xattr(a1, *(_QWORD *)(a2 + 8), (uint64_t *)(a2 + 328), a3, &v18))
      goto LABEL_15;
    v14 = v18;
    v15 = *((_DWORD *)v18 + 4);
    if ((v15 & 4) != 0)
      goto LABEL_15;
    if ((v15 & 2) != 0)
    {
      v17 = *((unsigned __int16 *)v18 + 11);
    }
    else
    {
      if ((v15 & 1) == 0)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          apfs_ufileop_getxattr_data_cold_1();
LABEL_15:
        v6 = 93;
LABEL_16:
        jobj_release(a1, v18);
        return v6;
      }
      v17 = *(_QWORD *)&v18[*((unsigned __int16 *)v18 + 10) + 32];
    }
    v6 = 0;
    *a6 = v17;
    if (a4 && v17)
    {
      if (v17 <= a5)
      {
        if ((v15 & 2) != 0)
        {
          memcpy(a4, &v14[*((unsigned __int16 *)v14 + 10) + 24], *((unsigned __int16 *)v14 + 11));
          v6 = 0;
        }
        else
        {
          v6 = apfs_ufile_getxattr_stream(a1, (uint64_t)v14, v17, (char *)a4, a5);
        }
      }
      else
      {
        v6 = 34;
      }
    }
    goto LABEL_16;
  }
  return v6;
}

uint64_t apfs_ufile_getxattr_stream(uint64_t a1, uint64_t a2, size_t a3, char *a4, unint64_t a5)
{
  unsigned int block_size;
  size_t v11;
  uint64_t v12;
  size_t v13;
  unint64_t v14;
  unint64_t v15;
  __int128 v16;
  uint64_t v17;
  size_t v18;
  uint64_t v19;
  size_t v20;
  unint64_t v21;
  size_t v22;
  void *v23;
  void *v24;
  size_t v26;
  unint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  unint64_t v31;

  block_size = apfs_get_block_size(a1);
  v11 = block_size;
  v12 = block_size - 1;
  if ((v12 + a3) / block_size * block_size <= a5)
    v13 = (v12 + a3) / block_size * block_size;
  else
    v13 = a3;
  if (!v13)
    return 0;
  v26 = a3;
  v27 = (v12 + a3) / block_size * block_size;
  v14 = 0;
  v15 = *(_QWORD *)(a2 + *(unsigned __int16 *)(a2 + 20) + 24);
  v31 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v16 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v29 = v16;
  v30 = v16;
  v28 = v16;
  while (1)
  {
    v17 = lookup_file_extent(a1, v15, v14, 0, 0, (uint64_t)&v28);
    if ((_DWORD)v17)
      return v17;
    v18 = *((_QWORD *)&v30 + 1);
    if (*((_QWORD *)&v30 + 1) + v14 >= a5)
      break;
    if (v13 >= *((_QWORD *)&v30 + 1) + v14)
    {
      v14 += *((_QWORD *)&v30 + 1);
    }
    else
    {
      v18 = (v12 + v13) / v11 * v11;
      v14 += v18;
      v13 = v18;
    }
    v19 = apfs_ufile_xattr_read(a1, a4, (uint64_t)&v28, v18, v11);
    if (!(_DWORD)v19)
    {
      a4 += v18;
      v13 -= v18;
      if (v13)
        continue;
    }
    return v19;
  }
  if (v27 <= a5)
    return apfs_ufile_xattr_read(a1, a4, (uint64_t)&v28, v27 - v14, v11);
  if (!*((_QWORD *)&v29 + 1))
  {
    bzero(a4, v26 - v14);
    return 0;
  }
  v20 = v27 - v14;
  v21 = (v27 - v14) / v11;
  if (v21 >= 2)
  {
    v22 = v20 - v11;
    v19 = apfs_ufile_xattr_read(a1, a4, (uint64_t)&v28, v22, v11);
    if ((_DWORD)v19)
      return v19;
    a4 += v22;
    v13 -= v22;
    *((_QWORD *)&v29 + 1) = v21 + *((_QWORD *)&v29 + 1) - 1;
    v20 = v11;
  }
  v23 = _apfs_malloc(v11);
  if (!v23)
    return 12;
  v24 = v23;
  v19 = apfs_ufile_xattr_read(a1, v23, (uint64_t)&v28, v20, v11);
  if (!(_DWORD)v19)
    memcpy(a4, v24, v13);
  _apfs_free(v24, v11);
  return v19;
}

uint64_t apfs_ufileop_setxattr(uint64_t **a1, char *__s1, void *a3, unint64_t a4, int a5)
{
  __int128 v5;
  uint64_t v6;
  uint64_t *v8;
  uint64_t v12;
  size_t v13;
  size_t v14;
  int v15;
  int v17;
  uint64_t tree;
  size_t v19;
  _BOOL4 v20;
  _WORD *v21;
  _WORD *v22;
  unsigned int v23;
  const void *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  pthread_rwlock_t *v28;
  int v29;
  uint64_t v30;
  _BOOL4 v31;
  uint64_t v32;
  unsigned int v33;
  char *v34;
  uint64_t v35;
  _BOOL4 v36;
  uint64_t v37;
  uint64_t dstream;
  __int128 v39;
  __int128 v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  unint64_t v51;
  int updated;
  int v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  unsigned int v58;
  _WORD *v59;
  size_t v60;
  char v61;
  _OWORD v62[3];
  __int128 v63;
  __int128 v64;
  unint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  unint64_t v68;
  unsigned int v69;
  unsigned int v70;
  int buf;
  const char *v72;
  __int16 v73;
  int v74;
  __int16 v75;
  _BYTE v76[44];
  __int16 v77;
  uint64_t v78;
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v65 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v63 = v5;
  v64 = v5;
  v62[1] = v5;
  v62[2] = v5;
  v62[0] = v5;
  v6 = 22;
  if (!a1 || !__s1)
    return v6;
  v67 = 0;
  v68 = 0;
  v66 = 0;
  v8 = *a1;
  if (*((_DWORD *)*a1 + 275))
    return 30;
  v12 = (uint64_t)a1[1];
  v13 = strnlen(__s1, 0x80uLL);
  if (v13 > 0x7F)
    return 63;
  v14 = v13;
  if ((userfs_file_is_compressed((uint64_t)v8, v12) & 1) != 0)
    return 45;
  v15 = xattr_name_to_kind(__s1);
  if (v15 == 4)
    return 45;
  if (a5 != 3)
  {
    v17 = v15;
    if ((v15 - 5) < 3 || a4 != 32 && v15 == 3)
      return v6;
    if (a4 >> 55)
      return 27;
    v70 = -1431655766;
    v69 = -1431655766;
    v61 = -86;
    tree = jfs_get_tree((uint64_t)v8, 1, 0, (uint64_t *)&v66);
    if ((_DWORD)tree)
    {
      v6 = tree;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        apfs_ufileop_setxattr_cold_6();
      return v6;
    }
    v19 = v14 + 1;
    v20 = should_embed_xattr((uint64_t)v66, v17, v14 + 1, a4);
    v70 = v14 + 11;
    v60 = (v14 + 11);
    v21 = _apfs_malloc(v60);
    if (!v21)
    {
      v6 = 12;
      goto LABEL_84;
    }
    v22 = v21;
    v23 = a4 + 4;
    if (!v20)
      v23 = 52;
    v58 = v23;
    v59 = _apfs_malloc(v23);
    if (!v59)
    {
      v6 = 12;
LABEL_83:
      _apfs_free(v22, v60);
LABEL_84:
      if (v66)
        obj_release(v66);
      return v6;
    }
    v57 = (uint64_t *)(v12 + 8);
    *(_QWORD *)v22 = *(_QWORD *)(v12 + 8) & 0xFFFFFFFFFFFFFFFLL | 0x4000000000000000;
    v22[4] = v19;
    memcpy(v22 + 5, __s1, v19);
    if (v20)
    {
      *v59 = 2;
      v59[1] = a4;
      v24 = a3;
      v25 = a4;
      memcpy(v59 + 2, v24, a4);
    }
    else
    {
      *(_DWORD *)v59 = 3145745;
      v32 = alloc_xattr_tmp_ino(v8, v12, a4, &v67);
      if ((_DWORD)v32)
      {
        v6 = v32;
        v33 = 52;
LABEL_82:
        _apfs_free(v59, v33);
        goto LABEL_83;
      }
      v34 = (char *)a3;
      v25 = a4;
      v35 = userfs_write_xattr(v8, v67, v34, a4);
      if ((_DWORD)v35)
      {
        v6 = v35;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          v47 = *v57;
          v48 = *(_QWORD *)(v67 + 8);
          buf = 136316930;
          v72 = "apfs_ufileop_setxattr";
          v73 = 1024;
          v74 = 2636;
          v75 = 1024;
          *(_DWORD *)v76 = v6;
          *(_WORD *)&v76[4] = 2048;
          *(_QWORD *)&v76[6] = 0;
          *(_WORD *)&v76[14] = 2048;
          *(_QWORD *)&v76[16] = a4;
          *(_WORD *)&v76[24] = 2048;
          *(_QWORD *)&v76[26] = v47;
          *(_WORD *)&v76[34] = 2080;
          *(_QWORD *)&v76[36] = __s1;
          v77 = 2048;
          v78 = v48;
          _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: I/O failed with %d for I/O %llu:+%zu to ino %llu, xattr '%s', tmp ino %llu\n", (uint8_t *)&buf, 0x4Au);
        }
        v27 = 0;
        v36 = 0;
        v56 = -1;
        goto LABEL_73;
      }
      v37 = *(_QWORD *)(v67 + 32);
      dstream = fs_get_dstream((uint64_t)v8, v67);
      if (!dstream)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          apfs_ufileop_setxattr_cold_5();
        v27 = 0;
        v36 = 0;
        v56 = -1;
        v6 = 92;
        goto LABEL_73;
      }
      v40 = *(_OWORD *)(dstream + 16);
      v63 = *(_OWORD *)dstream;
      v39 = v63;
      v64 = v40;
      v65 = *(_QWORD *)(dstream + 32);
      v41 = v65;
      *(_QWORD *)(v59 + 2) = v37;
      *(_OWORD *)(v59 + 6) = v39;
      *(_OWORD *)(v59 + 14) = v40;
      *(_QWORD *)(v59 + 22) = v41;
    }
    v69 = 3808;
    v26 = _apfs_malloc(0xEE0uLL);
    if (!v26)
    {
      v6 = 12;
LABEL_81:
      v33 = v58;
      goto LABEL_82;
    }
    v27 = v26;
    v28 = (pthread_rwlock_t *)(v12 + 128);
    v29 = pthread_rwlock_wrlock((pthread_rwlock_t *)(v12 + 128));
    if (v29)
      panic("%s:%d: wrlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 2684, v29);
    v30 = bt_lookup_variant((uint64_t)v66, v8[54], (unint64_t *)v22, &v70, 0, v27, &v69, 0, 0, (uint64_t *)(v12 + 328));
    v6 = v30;
    if ((v30 | 2) == 2)
    {
      v61 = (_DWORD)v30 == 0;
      if (a5 == 1 && !(_DWORD)v30)
      {
        v31 = 0;
        v56 = -1;
        v6 = 17;
LABEL_70:
        v46 = pthread_rwlock_unlock(v28);
        if (v46)
          panic("%s:%d: unlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 2889, v46);
        v36 = v31;
LABEL_73:
        if (v67
          && free_xattr_tmp_ino(v8, v67, 0, v36, v68)
          && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          apfs_ufileop_setxattr_cold_1();
        }
        if (v68)
        {
          fs_tx_leave((uint64_t)v8, 1, v56, 0, v68);
          v68 = 0;
        }
        if (v27)
          _apfs_free(v27, 3808);
        goto LABEL_81;
      }
      if (a5 == 2 && (_DWORD)v30)
      {
        v31 = 0;
        v56 = -1;
        v6 = 93;
        goto LABEL_70;
      }
      if ((_DWORD)v30)
        goto LABEL_60;
      v43 = validate_stream_xattr((uint64_t)v27, v69, v62, &v61);
      if (!(_DWORD)v43)
      {
        if (v61)
        {
          v42 = *((_QWORD *)&v62[0] + 1) / 0x32uLL + 6;
          goto LABEL_61;
        }
LABEL_60:
        v42 = 6;
LABEL_61:
        v56 = v42;
        v44 = fs_tx_enter((uint64_t)v8, 1, v42, 0, (uint64_t *)&v68);
        if ((_DWORD)v44)
        {
          v6 = v44;
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
            apfs_ufileop_setxattr_cold_4();
LABEL_69:
          v31 = 0;
          goto LABEL_70;
        }
        if (v17 == 3 && !(*(_QWORD *)(v59 + 2) | *(_QWORD *)(v59 + 6) | *(_QWORD *)(v59 + 10) | *(_QWORD *)(v59 + 14)))
        {
          bt_remove((uint64_t)v66, v8[54], (unint64_t *)v22, v60, v68);
          v31 = 0;
          v50 = (_QWORD *)(v12 + 72);
          v51 = -257;
        }
        else
        {
          v45 = bt_insert(v66, v8[54], (unint64_t *)v22, v60, (uint64_t)v59, v58, v68);
          if ((_DWORD)v45)
          {
            v6 = v45;
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            {
              v54 = *v57;
              buf = 136316674;
              v72 = "apfs_ufileop_setxattr";
              v73 = 1024;
              v74 = 2814;
              v75 = 2048;
              *(_QWORD *)v76 = v54;
              *(_WORD *)&v76[8] = 2048;
              *(_QWORD *)&v76[10] = 0;
              *(_WORD *)&v76[18] = 2048;
              *(_QWORD *)&v76[20] = v25;
              *(_WORD *)&v76[28] = 2080;
              *(_QWORD *)&v76[30] = __s1;
              *(_WORD *)&v76[38] = 1024;
              *(_DWORD *)&v76[40] = v6;
              _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: ino %llu, I/O %llu:+%zu, xattr '%s': tree insert failed with %d\n", (uint8_t *)&buf, 0x40u);
            }
            goto LABEL_69;
          }
          v31 = v67 != 0;
          if (v61)
          {
            if (userfs_free_old_xattr((uint64_t)v8, v12, (uint64_t *)v62, v68)
              && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            {
              apfs_ufileop_setxattr_cold_3();
            }
            v61 = 0;
          }
          if ((v17 | 2) == 3)
          {
            v49 = 256;
            if (v17 == 1)
              v49 = 64;
            *(_QWORD *)(v12 + 72) |= v49;
          }
          v50 = (_QWORD *)(v12 + 120);
          v51 = 0xFFFFFFFDFFFFFFFFLL;
        }
        *v50 &= v51;
        update_time((uint64_t)v8, (_QWORD *)v12, 2);
        updated = update_jobj((uint64_t)v8, 1, (unsigned __int8 *)v12, v68);
        if (updated)
        {
          v53 = updated;
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            v55 = *v57;
            buf = 136316418;
            v72 = "apfs_ufileop_setxattr";
            v73 = 1024;
            v74 = 2882;
            v75 = 2048;
            *(_QWORD *)v76 = v55;
            *(_WORD *)&v76[8] = 2080;
            *(_QWORD *)&v76[10] = __s1;
            *(_WORD *)&v76[18] = 2048;
            *(_QWORD *)&v76[20] = v25;
            *(_WORD *)&v76[28] = 1024;
            *(_DWORD *)&v76[30] = v53;
            _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: update ino %llu, xattr '%s' size %zu failed, err%d\n", (uint8_t *)&buf, 0x36u);
          }
        }
        v6 = 0;
        goto LABEL_70;
      }
      v6 = v43;
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      apfs_ufileop_setxattr_cold_2();
    }
    v31 = 0;
    v56 = -1;
    goto LABEL_70;
  }
  return userfs_removexattr_internal((uint64_t)v8, v12, __s1);
}

uint64_t userfs_removexattr_internal(uint64_t a1, uint64_t a2, char *a3)
{
  pthread_rwlock_t *v6;
  int v7;
  uint64_t v8;
  unsigned int v9;
  int v10;
  uint64_t v12;

  v6 = (pthread_rwlock_t *)(a2 + 128);
  v7 = pthread_rwlock_wrlock((pthread_rwlock_t *)(a2 + 128));
  if (v7)
    panic("%s:%d: wrlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 1959, v7);
  v12 = 0xAAAAAAAAAAAAAAAALL;
  v8 = fs_tx_enter(a1, 2, 4, 0, &v12);
  if (!(_DWORD)v8)
  {
    v9 = fs_remove_xattr(a1, a2, (uint64_t *)(a2 + 328), a3, 0, v12);
    if (v9)
    {
      if (v9 == 2)
        v8 = 93;
      else
        v8 = v9;
    }
    else
    {
      update_time(a1, (_QWORD *)a2, 2);
      if (!strcmp(a3, "com.apple.FinderInfo"))
        *(_QWORD *)(a2 + 72) &= ~0x100uLL;
      update_jobj(a1, 1, (unsigned __int8 *)a2, v12);
      v8 = 0;
    }
    fs_tx_leave(a1, 2, 4, 0, v12);
  }
  v10 = pthread_rwlock_unlock(v6);
  if (v10)
    panic("%s:%d: unlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 1992, v10);
  return v8;
}

uint64_t userfs_write_xattr(_QWORD *a1, uint64_t a2, char *a3, unint64_t a4)
{
  unsigned int block_size;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  _QWORD *v12;
  char v13;
  unint64_t v14;
  unsigned __int8 v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  unint64_t v22;
  size_t v23;
  unint64_t v24;
  size_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  unint64_t v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  unint64_t v37;
  uint64_t v38;
  void *__dst;
  _QWORD *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  unint64_t v44;
  int v45;
  _QWORD *dstream;
  unint64_t v47;
  _BYTE buf[12];
  __int16 v49;
  int v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  int v56;
  __int16 v57;
  unint64_t v58;
  __int16 v59;
  unint64_t v60;
  __int16 v61;
  unint64_t v62;
  __int16 v63;
  _QWORD *v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  block_size = apfs_get_block_size((uint64_t)a1);
  dstream = (_QWORD *)fs_get_dstream((uint64_t)a1, a2);
  if (!a4)
    return 0;
  v38 = a1[49];
  v47 = 0xAAAAAAAAAAAAAAAALL;
  userfs_get_file_sizes((uint64_t)a1, a2, &v47, 0);
  if (v47 < a4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      userfs_write_xattr_cold_1();
    return 34;
  }
  v10 = a4 % block_size;
  if (v10)
  {
    v11 = _apfs_calloc(1uLL, block_size);
    if (!v11)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        userfs_write_xattr_cold_5();
      return 12;
    }
  }
  else
  {
    v11 = 0;
  }
  v12 = 0;
  v13 = __clz(__rbit32(block_size));
  v14 = a4 - v10;
  if (!block_size)
    v13 = -1;
  v15 = block_size > a4;
  v36 = v13;
  v16 = v14 >> v13;
  if (block_size <= a4)
    v17 = v16;
  else
    v17 = 0;
  if ((*(_BYTE *)(a1[47] + 264) & 1) == 0)
  {
    v12 = userfs_crypto_alloc_cst((uint64_t)a1);
    if (!v12)
      return 12;
  }
  __dst = v11;
  v40 = v12;
  v37 = block_size;
  v18 = 0;
  v19 = block_size - 1;
  v35 = a2;
  while (1)
  {
    v44 = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v20 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v42 = v20;
    v43 = v20;
    v41 = v20;
    v45 = 0;
    v21 = fs_map_file_offset(a1, a2, (uint64_t *)&dstream, v18, a4, 2, 0, (uint64_t)&v41, &v45);
    if ((_DWORD)v21)
      break;
    if (!*((_QWORD *)&v42 + 1))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        userfs_write_xattr_cold_2();
      goto LABEL_52;
    }
    if ((v18 & v19) != 0)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        userfs_write_xattr_cold_4();
      goto LABEL_52;
    }
    v22 = *((_QWORD *)&v43 + 1);
    if (v18 > (unint64_t)v42)
    {
      v22 = v42 - v18 + *((_QWORD *)&v43 + 1);
      *((_QWORD *)&v43 + 1) = v22;
      *((_QWORD *)&v42 + 1) += (v18 - (unint64_t)v42) / v37;
    }
    if (v22 >= a4)
      v23 = a4;
    else
      v23 = v22;
    v24 = (v23 + v19) >> v36;
    if ((v15 & (v24 > 1)) == 1)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        userfs_write_xattr_cold_3();
LABEL_52:
      v9 = 5;
      goto LABEL_54;
    }
    if (v15 & 1 | (v24 <= v17))
    {
      v25 = v23;
    }
    else
    {
      v24 = v17;
      v25 = v17 << v36;
    }
    if ((v15 & 1) != 0)
      memcpy(__dst, a3, v25);
    if (v40)
    {
      *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
      get_fext_crypto_logic((uint64_t)a1, (uint64_t)&v41, (uint64_t *)buf);
      *(_QWORD *)(v40[9] + 8) = *(_QWORD *)buf / v37;
    }
    v26 = dev_write_data(*(_QWORD **)(v38 + 384), *((uint64_t *)&v42 + 1));
    if ((_DWORD)v26)
    {
      v9 = v26;
      a2 = v35;
      goto LABEL_54;
    }
    v18 += v25;
    a3 += v25;
    if ((v15 & 1) != 0)
      v27 = 0;
    else
      v27 = v24;
    v17 -= v27;
    v15 |= v17 == 0;
    a4 -= v25;
    a2 = v35;
    if (!a4)
    {
      v9 = 0;
      goto LABEL_54;
    }
  }
  v9 = v21;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v28 = *(_QWORD *)(a2 + 8);
    v29 = *(_QWORD *)(a2 + 32);
    v30 = dstream;
    if (dstream)
    {
      v31 = *dstream;
      v30 = (_QWORD *)dstream[1];
    }
    else
    {
      v31 = 0;
    }
    *(_DWORD *)buf = 136317186;
    *(_QWORD *)&buf[4] = "userfs_write_xattr";
    v49 = 1024;
    v50 = 2161;
    v51 = 2048;
    v52 = v28;
    v53 = 2048;
    v54 = v29;
    v55 = 1024;
    v56 = v9;
    v57 = 2048;
    v58 = v18;
    v59 = 2048;
    v60 = a4;
    v61 = 2048;
    v62 = v31;
    v63 = 2048;
    v64 = v30;
    _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: ### obj-id %lld/%lld,  error %d, offset %lld, resid %zu, dstream %lld/%lld ###\n", buf, 0x54u);
  }
LABEL_54:
  if (v40)
    crypto_obj_release(v40);
  if ((v9 > 0x23 || ((1 << v9) & 0x800000003) == 0)
    && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v33 = *(_QWORD *)(a2 + 8);
    v34 = *(_QWORD *)(a2 + 32);
    *(_DWORD *)buf = 136316930;
    *(_QWORD *)&buf[4] = "userfs_write_xattr";
    v49 = 1024;
    v50 = 2281;
    v51 = 2048;
    v52 = v33;
    v53 = 2048;
    v54 = v34;
    v55 = 1024;
    v56 = v9;
    v57 = 2048;
    v58 = v47;
    v59 = 2048;
    v60 = v18;
    v61 = 2048;
    v62 = a4;
    _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: ### obj-id %lld/%lld error %d filesize %lld offset %lld resid %zu ###\n", buf, 0x4Au);
  }
  if (__dst)
    _apfs_free(__dst, v37);
  return v9;
}

uint64_t userfs_free_old_xattr(uint64_t a1, uint64_t a2, uint64_t *a3, unint64_t a4)
{
  uint64_t v7;
  _QWORD v9[4];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[8];
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  bzero(v17, 0x290uLL);
  v18 = *a3;
  v19 = v18;
  v16 = 0u;
  v15 = 0u;
  v14 = 0u;
  v13 = 0u;
  v9[2] = 0;
  v10 = 0u;
  v9[0] = a1;
  v9[1] = v17;
  v9[3] = v18;
  v11 = (unint64_t)(a3 + 1);
  v12 = a4;
  v7 = do_iterative_file_extent_removal((uint64_t)v9);
  if ((_DWORD)v7 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    userfs_free_old_xattr_cold_1();
  return v7;
}

uint64_t apfs_ufileop_listxattr(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v4;
  unint64_t *v6;
  uint64_t v7;
  int v8;
  int v9;
  _QWORD v11[2];
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v15 = 0;
  v16 = 0;
  v17 = 0;
  v4 = 22;
  v12 = 0;
  v13 = 0;
  if (a1 && a4)
  {
    v6 = *(unint64_t **)a1;
    v7 = *(_QWORD *)(a1 + 8);
    v14 = v7;
    v11[0] = a2;
    v11[1] = a3;
    BYTE4(v13) = 1;
    LODWORD(v15) = 1572868;
    v16 = *(_QWORD *)(v7 + 8);
    v8 = pthread_rwlock_rdlock((pthread_rwlock_t *)(v7 + 128));
    if (v8)
      panic("%s:%d: rdlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 2971, v8);
    iterate_jobjs_with_hint(v6, 1, 0, (unsigned __int8 *)&v15, (uint64_t (*)(__int128 *, uint64_t))xattr_collector, (uint64_t)v11, (_OWORD *)(v7 + 328), 4u);
    v9 = pthread_rwlock_unlock((pthread_rwlock_t *)(v7 + 128));
    if (v9)
      panic("%s:%d: unlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 2974, v9);
    v4 = v13;
    *a4 = v12;
  }
  return v4;
}

uint64_t apfs_ufileop_remove(uint64_t *a1, const char *a2, uint64_t a3)
{
  if (a1 && a2)
    return userfs_internal_remove(a1, a2, 1, a3);
  else
    return 22;
}

uint64_t apfs_ufileop_create(uint64_t *a1, char *__s1, uint64_t a3, uint64_t *a4)
{
  uint64_t common;
  uint64_t v9;
  uint64_t v11;

  common = 22;
  if (a1)
  {
    if (__s1)
    {
      if (a3)
      {
        if (a4)
        {
          v9 = *a1;
          common = userfs_create_common(a1, __s1, a3, a4, 1, 0);
          if (!(_DWORD)common)
          {
            if ((*(_QWORD *)(a3 + 8) & 0xFFFFFFFFFFFFFFE5) != 0)
            {
              v11 = *a4;
              common = userfs_set_ufa_common(v9, *(_QWORD *)(*a4 + 8), a3, 0);
              if ((_DWORD)common)
              {
                if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                  apfs_ufileop_create_cold_2();
                if (userfs_internal_remove(a1, __s1, 0, 0)
                  && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                {
                  apfs_ufileop_create_cold_1();
                }
                userfs_internal_reclaim(v11);
                *a4 = 0;
              }
            }
            else
            {
              return 0;
            }
          }
        }
      }
    }
  }
  return common;
}

uint64_t apfs_ufileop_rename(uint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4, unint64_t *a5, unint64_t a6)
{
  __int128 v6;
  uint64_t sibling_link;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t *v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  _BOOL4 v31;
  _BOOL4 v32;
  _BOOL4 v33;
  uint64_t *v34;
  int v35;
  int v36;
  int v37;
  int v38;
  uint64_t v39;
  int v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t inode;
  BOOL v45;
  int v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  int v52;
  int v53;
  int v54;
  int v55;
  uint64_t v56;
  int v57;
  int v58;
  int v59;
  int v60;
  _BOOL4 v61;
  uint64_t v62;
  int v63;
  int v64;
  char *v65;
  _BOOL4 v66;
  uint64_t v67;
  int v68;
  int v69;
  uint64_t v70;
  _BYTE *v71;
  _BYTE *v72;
  unint64_t v73;
  int v74;
  unint64_t v75;
  int v76;
  int v77;
  uint64_t updated;
  uint64_t timestamp;
  uint64_t v80;
  unint64_t v81;
  int v82;
  int v83;
  unsigned __int8 *v84;
  uint64_t inserted;
  int v86;
  int v87;
  int v88;
  uint64_t v89;
  int v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  uint64_t v95;
  NSObject *v96;
  const char *v97;
  uint32_t v98;
  uint64_t v99;
  unint64_t v100;
  uint64_t v101;
  int v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  unint64_t v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  int v111;
  int v112;
  int v113;
  uint64_t *v114;
  _BOOL4 v115;
  uint64_t *v116;
  uint64_t *v117;
  unint64_t v118;
  _OWORD v119[2];
  uint64_t v120;
  char *__s1;
  __int128 v122;
  __int128 v123;
  _BYTE *v124;
  _BYTE *v125;
  unint64_t v126;
  unint64_t v127;
  unint64_t __dst[3];
  unint64_t v129;
  size_t v130;
  size_t v131;
  uint64_t v132;
  int v133;
  char v134;
  const char *v135;
  uint8_t buf[4];
  const char *v137;
  __int16 v138;
  int v139;
  __int16 v140;
  uint64_t v141;
  __int16 v142;
  unint64_t v143;
  __int16 v144;
  _BYTE v145[30];
  _BYTE v146[10];
  uint64_t v147;

  v147 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v122 = v6;
  v123 = v6;
  sibling_link = 22;
  if (!a1 || !a3 || !a4 || !a6)
    return sibling_link;
  v126 = 0;
  v127 = 0;
  v132 = 0;
  v124 = 0;
  v125 = 0;
  v135 = 0;
  v133 = 0;
  v129 = 0;
  v12 = *a1;
  if (a2)
  {
    v13 = a2[1];
    if (a5)
    {
LABEL_7:
      v14 = a5[1];
      goto LABEL_10;
    }
  }
  else
  {
    v13 = 0;
    if (a5)
      goto LABEL_7;
  }
  v14 = 0;
LABEL_10:
  if (*(_DWORD *)(v12 + 1100))
    return 30;
  v15 = a1[1];
  v16 = *(_QWORD *)(a4 + 8);
  v17 = *(_QWORD *)(*(_QWORD *)(v12 + 376) + 56);
  v134 = -86;
  v131 = 0xAAAAAAAAAAAAAAAALL;
  v130 = 0xAAAAAAAAAAAAAAAALL;
  memset(__dst, 170, sizeof(__dst));
  if (*(_BYTE *)v16 == 1)
    return 13;
  v118 = v15;
  sibling_link = userfs_check_name((const char *)a3, 0, &v131);
  if (!(_DWORD)sibling_link)
  {
    sibling_link = userfs_check_name((const char *)a6, 1, &v130);
    if (!(_DWORD)sibling_link)
    {
      if (*(_BYTE *)a3 == 46 && (v131 == 1 || v131 == 2 && *(_BYTE *)(a3 + 1) == 46)
        || *(_BYTE *)a6 == 46 && (v130 == 1 || v130 == 2 && *(_BYTE *)(a6 + 1) == 46))
      {
        return 22;
      }
      v19 = *(_QWORD *)(v12 + 488);
      if (v19)
      {
        v20 = *(_QWORD *)(v19 + 8);
        if (*(_QWORD *)(v118 + 8) == v20 || *(_QWORD *)(v16 + 8) == v20)
          return 13;
      }
      v21 = (uint64_t *)a2;
      if (a2 || (v21 = (uint64_t *)_apfs_calloc(1uLL, 0x10uLL)) != 0)
      {
        v117 = v21;
        v22 = (uint64_t *)a5;
        if (a5 || (v22 = (uint64_t *)_apfs_calloc(1uLL, 0x10uLL)) != 0)
        {
          v116 = v22;
          if (v118 == v16)
          {
            v26 = pthread_rwlock_wrlock((pthread_rwlock_t *)(v118 + 128));
            if (!v26)
              goto LABEL_55;
            v112 = v26;
            v25 = 3384;
          }
          else
          {
            if (*(_QWORD *)(v118 + 24) == *(_QWORD *)(v16 + 8))
            {
              v23 = pthread_rwlock_wrlock((pthread_rwlock_t *)(v16 + 128));
              if (v23)
                panic("%s:%d: wrlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 3367, v23);
              v24 = pthread_rwlock_wrlock((pthread_rwlock_t *)(v118 + 128));
              if (v24)
              {
                v112 = v24;
                v25 = 3368;
                goto LABEL_54;
              }
LABEL_55:
              if ((*(_BYTE *)(v118 + 120) & 0x18) != 0 || (*(_BYTE *)(v16 + 120) & 0x18) != 0)
              {
                v31 = 0;
                v32 = 0;
                v33 = 0;
                sibling_link = 22;
                goto LABEL_58;
              }
              *(_QWORD *)&v122 = v12;
              *((_QWORD *)&v122 + 1) = v118;
              *(_QWORD *)&v123 = a3;
              *((_QWORD *)&v123 + 1) = v131;
              v39 = userfs_internal_lookup((uint64_t)&v122, 0, (uint64_t *)&v125, &v129, &__dst[1]);
              if ((_DWORD)v39)
              {
                sibling_link = v39;
                if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                  apfs_ufileop_rename_cold_15();
LABEL_92:
                v31 = 0;
                v32 = 0;
                v33 = 0;
                goto LABEL_58;
              }
              v115 = v13 == 0;
              if (!v13)
              {
                inode = userfs_load_inode(v12, v118, v129, __dst[1], v117);
                if ((_DWORD)inode)
                {
                  sibling_link = inode;
                  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                    apfs_ufileop_rename_cold_14();
                  goto LABEL_92;
                }
                v13 = v117[1];
              }
              v42 = *(_QWORD *)(v13 + 8);
              v114 = (uint64_t *)(v13 + 8);
              if (v42 == v129)
              {
                v43 = *(_QWORD *)(v12 + 488);
                if (v43 && v42 == *(_QWORD *)(v43 + 8) || *(_BYTE *)v13 == 1)
                {
                  v32 = 0;
LABEL_103:
                  v33 = 0;
                  sibling_link = 1;
LABEL_108:
                  v31 = v115;
LABEL_58:
                  if (v125)
                  {
                    jobj_release(v12, v125);
                    v125 = 0;
                  }
                  v34 = v117;
                  if (a2)
                    goto LABEL_64;
                  goto LABEL_61;
                }
                if (v125)
                {
                  if ((*(_WORD *)(v13 + 104) & 0xF000) != 0x4000
                    || !userfs_check_parent_chain(v12, v16, v13))
                  {
                    *(_QWORD *)&v122 = v12;
                    *((_QWORD *)&v122 + 1) = v16;
                    *(_QWORD *)&v123 = a6;
                    *((_QWORD *)&v123 + 1) = v130;
                    if (userfs_internal_lookup((uint64_t)&v122, 0, (uint64_t *)&v124, &__dst[2], 0))
                    {
                      v113 = 0;
                      v14 = 0;
                      v45 = 1;
                      goto LABEL_118;
                    }
                    v32 = v14 == 0;
                    if (v14)
                    {
                      v113 = 0;
                    }
                    else
                    {
                      v50 = userfs_load_inode(v12, v16, __dst[2], __dst[1], v116);
                      if ((_DWORD)v50)
                      {
                        sibling_link = v50;
                        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                          apfs_ufileop_rename_cold_12();
                        v14 = 0;
                        v32 = 0;
                        goto LABEL_209;
                      }
                      v14 = v116[1];
                      v113 = 1;
                    }
                    v48 = *(_QWORD *)(v14 + 8);
                    if (v48 == __dst[2])
                    {
                      if (*(_BYTE *)v14 == 1)
                        goto LABEL_103;
                      v49 = *v114;
                      if (*(_QWORD *)(v118 + 8) == *(_QWORD *)(v16 + 8) && v49 == v48)
                      {
                        if (!utf8_normalizeOptCaseFoldAndCompare(*((_QWORD *)v125 + 8), *((unsigned __int16 *)v125 + 31) - 1, a6, v130, (v17 & 1) == 0, (BOOL *)&v134)&& v134)
                        {
                          jobj_release(v12, v124);
                          v14 = 0;
                          v124 = 0;
                          goto LABEL_210;
                        }
                        v49 = *v114;
                        v48 = *(_QWORD *)(v14 + 8);
                      }
                      if (v49 != v48)
                      {
LABEL_210:
                        if (v14 == v118)
                        {
                          v33 = 0;
                          sibling_link = 66;
                          v14 = v118;
                          goto LABEL_108;
                        }
                        if (v14)
                        {
                          v67 = *(_QWORD *)(v12 + 488);
                          if (v67)
                          {
                            if (*(_QWORD *)(v14 + 8) == *(_QWORD *)(v67 + 8))
                            {
                              v33 = 0;
                              sibling_link = 13;
                              goto LABEL_108;
                            }
                          }
                        }
                        v45 = v14 == 0;
                        if (v14 && v13 != v14)
                        {
                          if (v13 >= v14)
                          {
                            v76 = pthread_rwlock_wrlock((pthread_rwlock_t *)(v14 + 128));
                            if (v76)
                              panic("%s:%d: wrlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 3605, v76);
                            v77 = pthread_rwlock_wrlock((pthread_rwlock_t *)(v13 + 128));
                            if (v77)
                              panic("%s:%d: wrlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 3606, v77);
                          }
                          else
                          {
                            v68 = pthread_rwlock_wrlock((pthread_rwlock_t *)(v13 + 128));
                            if (v68)
                              panic("%s:%d: wrlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 3602, v68);
                            v69 = pthread_rwlock_wrlock((pthread_rwlock_t *)(v14 + 128));
                            if (v69)
                              panic("%s:%d: wrlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 3603, v69);
                          }
                          v45 = 0;
LABEL_120:
                          if ((*(_BYTE *)(v13 + 120) & 0x18) != 0)
                          {
                            v47 = 0;
                            sibling_link = 2;
                            goto LABEL_169;
                          }
                          if (xf_get((unsigned __int16 *)v125 + 16, 1, 0, (char *)__dst, 8uLL))
                          {
                            if ((*(_WORD *)(v13 + 104) & 0xF000) != 0x4000
                              && *(int *)(v13 + 80) >= 2
                              && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                            {
                              apfs_ufileop_rename_cold_11();
                            }
                            __dst[0] = 0;
                          }
                          if (v45)
                          {
                            v14 = 0;
                          }
                          else
                          {
                            v51 = *(_WORD *)(v13 + 104) & 0xF000;
                            if (*((_QWORD *)v124 + 2) == *(_QWORD *)(v13 + 8))
                            {
                              if (v51 != 0x8000 || (v52 = 0, *(_DWORD *)(v13 + 80) == 1))
                              {
                                v47 = 0;
                                sibling_link = 22;
                                goto LABEL_169;
                              }
                            }
                            else if (v51 == 0x4000)
                            {
                              if ((*(_WORD *)(v14 + 104) & 0xF000) != 0x4000)
                              {
                                v47 = 0;
                                sibling_link = 20;
                                goto LABEL_169;
                              }
                              v52 = 1;
                            }
                            else
                            {
                              v52 = 0;
                            }
                            if ((*(_BYTE *)(v14 + 120) & 0x18) != 0)
                            {
                              v53 = pthread_rwlock_unlock((pthread_rwlock_t *)(v14 + 128));
                              if (v53)
                                panic("%s:%d: unlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 3662, v53);
                              jobj_release(v12, v124);
                              v14 = 0;
                              v124 = 0;
                            }
                            else if ((*(_WORD *)(v14 + 104) & 0xF000) == 0x4000)
                            {
                              if (!v52)
                              {
                                v47 = 0;
                                sibling_link = 21;
                                goto LABEL_169;
                              }
                              if (!apfs_is_dir_empty((unint64_t *)v12, v14))
                              {
                                v47 = 0;
                                sibling_link = 66;
                                goto LABEL_169;
                              }
                            }
                          }
                          v54 = set_dir_stats_for_rename(v12, v13, v16, &v132);
                          if (v54)
                          {
                            v55 = v54;
                            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                              apfs_ufileop_rename_cold_10((int)v114, v16, v55);
                          }
                          v56 = fs_tx_enter(v12, 1, 9, 0, (uint64_t *)&v126);
                          if ((_DWORD)v56)
                          {
                            sibling_link = v56;
LABEL_168:
                            v47 = 0;
                            goto LABEL_169;
                          }
                          if (!v14)
                          {
                            v62 = dir_rec_alloc(v12, 1, (const char *)a6, v130, *(_QWORD *)(v16 + 8), *v114, &v124);
                            if ((_DWORD)v62)
                            {
                              sibling_link = v62;
                              v14 = 0;
                              goto LABEL_168;
                            }
                            v72 = v124;
                            v71 = v125;
                            *((_WORD *)v124 + 30) = *((_WORD *)v125 + 30);
                            if (v118 == v16)
                            {
                              v47 = 0;
                              v75 = v16;
                              goto LABEL_251;
                            }
                            v47 = 0;
                            v73 = v118;
                            --*(_DWORD *)(v118 + 80);
                            v74 = 1;
                            v75 = v16;
LABEL_249:
                            ++*(_DWORD *)(v73 + 88);
LABEL_250:
                            *(_DWORD *)(v75 + 80) += v74;
LABEL_251:
                            ++*(_DWORD *)(v75 + 88);
                            if (v118 == v16)
                            {
                              *((_QWORD *)v72 + 3) = *((_QWORD *)v71 + 3);
                            }
                            else
                            {
                              timestamp = get_timestamp();
                              v71 = v125;
                              *((_QWORD *)v124 + 3) = timestamp;
                            }
                            v71[1] = 3;
                            v80 = remove_jobj(v12, 1, v71, v126);
                            if ((_DWORD)v80)
                            {
                              sibling_link = v80;
                              if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                                goto LABEL_256;
                              v99 = *((_QWORD *)v125 + 2);
                              if (v14)
                                v100 = *(_QWORD *)(v14 + 8);
                              else
                                v100 = 0;
                              *(_DWORD *)buf = 136316162;
                              v137 = "apfs_ufileop_rename";
                              v138 = 1024;
                              v139 = 3902;
                              v140 = 2048;
                              v141 = v99;
                              v142 = 2048;
                              v143 = v100;
                              v144 = 1024;
                              *(_DWORD *)v145 = sibling_link;
                              v96 = MEMORY[0x24BDACB70];
                              v97 = "%s:%d: *** failed to remove the from drec for ino %lld to_ino %lld: error %d\n";
                              v98 = 44;
                            }
                            else
                            {
                              if (__dst[0])
                              {
                                v82 = remove_sibling_link(v12, *v114, __dst[0], v126);
                                if (v82)
                                {
                                  v83 = v82;
                                  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                                  {
                                    v101 = *(_QWORD *)(v13 + 8);
                                    v102 = *(_DWORD *)(v13 + 80);
                                    v103 = *((_QWORD *)v125 + 1);
                                    v104 = *((_QWORD *)v125 + 8);
                                    if (v14)
                                      v105 = *(_QWORD *)(v14 + 8);
                                    else
                                      v105 = 0;
                                    *(_DWORD *)buf = 136317186;
                                    v137 = "apfs_ufileop_rename";
                                    v138 = 1024;
                                    v139 = 3919;
                                    v140 = 2048;
                                    v141 = v101;
                                    v142 = 2048;
                                    v143 = __dst[0];
                                    v144 = 1024;
                                    *(_DWORD *)v145 = v102;
                                    *(_WORD *)&v145[4] = 2048;
                                    *(_QWORD *)&v145[6] = v103;
                                    *(_WORD *)&v145[14] = 2080;
                                    *(_QWORD *)&v145[16] = v104;
                                    *(_WORD *)&v145[24] = 1024;
                                    *(_DWORD *)&v145[26] = v83;
                                    *(_WORD *)v146 = 2048;
                                    *(_QWORD *)&v146[2] = v105;
                                    _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: failed to remove the FROM sibling hard link (ino %lld, sib-id %lld, nlink %d) and drec %lld/%s (error %d) (to_ino %lld)\n", buf, 0x50u);
                                  }
                                }
                              }
                              if ((*(_WORD *)(v13 + 104) & 0xF000) == 0x4000 || *(int *)(v13 + 80) < 2)
                              {
                                xf_remove((unsigned __int16 *)v124 + 16, 1);
                              }
                              else
                              {
                                if (!__dst[0])
                                  __dst[0] = get_next_apfs_obj_id(v12);
                                if (xf_set((unsigned __int16 *)v124 + 16, 1, 2, __dst, 8uLL)
                                  && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                                {
                                  apfs_ufileop_rename_cold_6();
                                }
                              }
                              v84 = v124;
                              v124[1] = 2;
                              inserted = insert_jobj(v12, 1, v84, v126);
                              if ((_DWORD)inserted)
                              {
                                sibling_link = inserted;
                                if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                                  apfs_ufileop_rename_cold_5();
                                v86 = insert_jobj(v12, 1, v125, v126);
                                *(_QWORD *)(v13 + 24) = *(_QWORD *)(v118 + 8);
                                if (v86 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                                {
                                  apfs_ufileop_rename_cold_4();
                                  if (!v14)
                                    goto LABEL_169;
                                }
                                else if (!v14)
                                {
                                  goto LABEL_169;
                                }
                                *(_QWORD *)(v14 + 120) &= 0xFFFFFFFF7FFFFFF7;
                                goto LABEL_169;
                              }
                              size_tracking_ino_moved(v12, v13, v118, v16, v126);
                              if ((*(_WORD *)(v13 + 104) & 0xF000) == 0x4000 || *(int *)(v13 + 80) < 2)
                              {
                                sibling_link = 0;
                                goto LABEL_256;
                              }
                              sibling_link = create_sibling_link(v12, *v114, __dst[0], *((_QWORD *)v124 + 1), *((const void **)v124 + 8), *((unsigned __int16 *)v124 + 31), v126);
                              if (!(_DWORD)sibling_link || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                                goto LABEL_256;
                              v93 = *(_QWORD *)(v16 + 8);
                              v94 = *((_QWORD *)v124 + 8);
                              v95 = *v114;
                              *(_DWORD *)buf = 136316418;
                              v137 = "apfs_ufileop_rename";
                              v138 = 1024;
                              v139 = 3995;
                              v140 = 2048;
                              v141 = v93;
                              v142 = 2080;
                              v143 = v94;
                              v144 = 2048;
                              *(_QWORD *)v145 = v95;
                              *(_WORD *)&v145[8] = 1024;
                              *(_DWORD *)&v145[10] = sibling_link;
                              v96 = MEMORY[0x24BDACB70];
                              v97 = "%s:%d: failed to create sibling link entry for %lld/%s hardlink key %lld error %d\n";
                              v98 = 54;
                            }
                            _os_log_error_impl(&dword_21F566000, v96, OS_LOG_TYPE_ERROR, v97, buf, v98);
LABEL_256:
                            v133 = 0;
                            if (xf_get_ptr_and_size((unsigned __int16 *)(v13 + 416), 4, 0, &v135, &v133)|| v133 <= 0)
                            {
                              v135 = 0;
                            }
                            if (*((_QWORD *)v125 + 1) == *(_QWORD *)(v13 + 24)
                              && (!v135 || !strcmp(*((const char **)v125 + 8), v135)))
                            {
                              *(_QWORD *)(v13 + 24) = *(_QWORD *)(v16 + 8);
                              xf_set((unsigned __int16 *)(v13 + 416), 4, 2, *((void **)v124 + 8), *((unsigned __int16 *)v124 + 31));
                            }
                            *(_BYTE *)(v13 + 1) = 2;
                            update_jobj(v12, 1, (unsigned __int8 *)v13, v126);
                            *(_BYTE *)(v118 + 1) = 2;
                            update_jobj(v12, 1, (unsigned __int8 *)v118, v126);
                            v81 = v118;
                            if (v118 == v16
                              || (*(_BYTE *)(v16 + 1) = 2,
                                  update_jobj(v12, 1, (unsigned __int8 *)v16, v126),
                                  ++*(_DWORD *)(v118 + 384),
                                  v81 = v16,
                                  v14))
                            {
                              ++*(_DWORD *)(v81 + 384);
                            }
                            if (!(_DWORD)sibling_link)
                            {
                              if (v14 && v14 != v13)
                                update_time(v12, (_QWORD *)v14, 2);
                              if (v14 != v13)
                                update_time(v12, (_QWORD *)v13, 2);
                              update_time(v12, (_QWORD *)v16, 3);
                              if (v118 != v16)
                                update_time(v12, (_QWORD *)v118, 3);
                              sibling_link = 0;
                            }
LABEL_169:
                            if (v126)
                            {
                              fs_tx_leave(v12, 1, 9, 0, v126);
                              v126 = 0;
                            }
                            if ((_DWORD)sibling_link
                              && v132
                              && (v57 = set_dir_stats_for_rename_cleanup(v12, v13)) != 0
                              && (v58 = v57, os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR)))
                            {
                              apfs_ufileop_rename_cold_3((int)v114, v58);
                              if (v14)
                                goto LABEL_176;
                            }
                            else if (v14)
                            {
LABEL_176:
                              if (v14 != v13)
                              {
                                v59 = pthread_rwlock_unlock((pthread_rwlock_t *)(v14 + 128));
                                if (v59)
                                  panic("%s:%d: unlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 4076, v59);
                              }
                            }
                            v60 = pthread_rwlock_unlock((pthread_rwlock_t *)(v13 + 128));
                            if (v60)
                              panic("%s:%d: unlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 4079, v60);
                            v32 = v113 != 0;
                            v33 = v47 != 0;
                            goto LABEL_108;
                          }
                          if ((*(_WORD *)(v14 + 104) & 0xF000) == 0x4000)
                          {
                            v61 = 0;
                          }
                          else
                          {
                            v63 = *(_DWORD *)(v14 + 80);
                            v61 = v63 > 1;
                            *(_DWORD *)(v14 + 80) = v63 - 1;
                            if (v63 <= 0)
                            {
                              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                                apfs_ufileop_rename_cold_9();
                              v61 = 0;
                              *(_DWORD *)(v14 + 80) = 0;
                            }
                          }
                          if (v14 == v13)
                            goto LABEL_245;
                          __s1 = (char *)0xAAAAAAAAAAAAAAAALL;
                          v133 = 0;
                          if ((*(_WORD *)(v14 + 104) & 0xF000) == 0x4000 || !*(_DWORD *)(v14 + 80))
                          {
                            v70 = move_inode_to_purgatory(v12, v14, v16, v126);
                            if ((_DWORD)v70)
                            {
                              sibling_link = v70;
                              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                                apfs_ufileop_rename_cold_7();
                              goto LABEL_168;
                            }
                            apfs_increment_num_objects(v12, v14, -1);
                            *(_QWORD *)(v14 + 120) |= 0x80000000uLL;
                            v47 = 1;
LABEL_246:
                            if (xf_get((unsigned __int16 *)v124 + 16, 1, 0, (char *)&v127, 8uLL))
                            {
                              v127 = 0;
                            }
                            else if (v127)
                            {
                              v87 = remove_sibling_link(v12, *(_QWORD *)(v14 + 8), v127, v126);
                              if (v87)
                              {
                                v88 = v87;
                                if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                                {
                                  v89 = *(_QWORD *)(v14 + 8);
                                  v90 = *(_DWORD *)(v14 + 80);
                                  v91 = *((_QWORD *)v124 + 1);
                                  v92 = *((_QWORD *)v124 + 8);
                                  *(_DWORD *)buf = 136316930;
                                  v137 = "apfs_ufileop_rename";
                                  v138 = 1024;
                                  v139 = 3839;
                                  v140 = 2048;
                                  v141 = v89;
                                  v142 = 2048;
                                  v143 = v127;
                                  v144 = 1024;
                                  *(_DWORD *)v145 = v90;
                                  *(_WORD *)&v145[4] = 2048;
                                  *(_QWORD *)&v145[6] = v91;
                                  *(_WORD *)&v145[14] = 2080;
                                  *(_QWORD *)&v145[16] = v92;
                                  *(_WORD *)&v145[24] = 1024;
                                  *(_DWORD *)&v145[26] = v88;
                                  _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: failed to remove the TO sibling hard link from ino %lld sib-id %lld (nlink %d) for drec %lld/%s error %d\n", buf, 0x46u);
                                }
                              }
                            }
                            v72 = v124;
                            v71 = v125;
                            *((_QWORD *)v124 + 2) = *v114;
                            *((_WORD *)v72 + 30) = *((_WORD *)v71 + 30);
                            v74 = -1;
                            v73 = v16;
                            v75 = v118;
                            if (v118 == v16)
                              goto LABEL_250;
                            goto LABEL_249;
                          }
                          if (xf_get_ptr_and_size((unsigned __int16 *)(v14 + 416), 4, 0, &__s1, &v133)
                            || v133 <= 0)
                          {
                            __s1 = 0;
                          }
                          if (v61
                            && *(_QWORD *)(v14 + 24) == *((_QWORD *)v124 + 1)
                            && (!__s1 || !strcmp(__s1, *((const char **)v124 + 8))))
                          {
                            v120 = 0;
                            memset(v119, 0, sizeof(v119));
                            LOBYTE(v119[0]) = 5;
                            *((_QWORD *)&v119[0] + 1) = *(_QWORD *)(v14 + 8);
                            WORD1(v119[0]) = 40;
                            v64 = iterate_jobjs((unint64_t *)v12, 1, v126, (unsigned __int8 *)v119, (uint64_t (*)(__int128 *, uint64_t))fixup_ino_with_sibling, v14);
                            if (xf_get_ptr_and_size((unsigned __int16 *)(v14 + 416), 4, 0, &__s1, &v133)|| v133 <= 0)
                            {
                              v65 = 0;
                              __s1 = 0;
                              v66 = 1;
                            }
                            else
                            {
                              v65 = __s1;
                              v66 = __s1 == 0;
                              if (__s1 && v64)
                                goto LABEL_242;
                            }
                            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                            {
                              v106 = *(_QWORD *)(v14 + 8);
                              v107 = *((_QWORD *)v124 + 1);
                              v108 = *((_QWORD *)v124 + 8);
                              v109 = "no-name";
                              v110 = *(_QWORD *)(v14 + 24);
                              if (!v66)
                                v109 = v65;
                              v111 = *(_DWORD *)(v14 + 80);
                              *(_DWORD *)buf = 136317186;
                              v137 = "apfs_ufileop_rename";
                              v138 = 1024;
                              v139 = 3804;
                              v140 = 2048;
                              v141 = v106;
                              v142 = 2048;
                              v143 = v107;
                              v144 = 2080;
                              *(_QWORD *)v145 = v108;
                              *(_WORD *)&v145[8] = 2048;
                              *(_QWORD *)&v145[10] = v110;
                              *(_WORD *)&v145[18] = 2080;
                              *(_QWORD *)&v145[20] = v109;
                              *(_WORD *)&v145[28] = 1024;
                              *(_DWORD *)v146 = v111;
                              *(_WORD *)&v146[4] = 1024;
                              *(_DWORD *)&v146[6] = v64;
                              _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: !!! failed to fixup to_ino %lld (to_drec ino %lld name %s; to_ino parent/name %ll"
                                "d/%s nlink %d; iret %d)\n",
                                buf,
                                0x50u);
                            }
                          }
LABEL_242:
                          updated = update_jobj(v12, 1, (unsigned __int8 *)v14, v126);
                          if ((_DWORD)updated)
                          {
                            sibling_link = updated;
                            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                              apfs_ufileop_rename_cold_8();
                            goto LABEL_168;
                          }
LABEL_245:
                          v47 = 0;
                          goto LABEL_246;
                        }
LABEL_118:
                        v46 = pthread_rwlock_wrlock((pthread_rwlock_t *)(v13 + 128));
                        if (v46)
                          panic("%s:%d: wrlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 3600, v46);
                        goto LABEL_120;
                      }
                      sibling_link = 0;
LABEL_209:
                      v33 = 0;
                      goto LABEL_108;
                    }
LABEL_107:
                    v33 = 0;
                    sibling_link = 22;
                    goto LABEL_108;
                  }
                }
                else
                {
                  if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                  {
                    v33 = 0;
                    v32 = 0;
                    sibling_link = 22;
                    v34 = v117;
                    v31 = v115;
                    if (a2)
                    {
LABEL_64:
                      if (v124)
                      {
                        jobj_release(v12, v124);
                        v124 = 0;
                      }
                      if (!a5)
                      {
                        if (v32)
                          userfs_internal_reclaim((uint64_t)v116);
                        else
                          _apfs_free(v116, 16);
                      }
                      if (v118 >= v16)
                      {
                        v37 = pthread_rwlock_unlock((pthread_rwlock_t *)(v118 + 128));
                        if (v118 <= v16)
                        {
                          if (v37)
                            panic("%s:%d: unlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 4135, v37);
                        }
                        else
                        {
                          if (v37)
                            panic("%s:%d: unlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 4132, v37);
                          v38 = pthread_rwlock_unlock((pthread_rwlock_t *)(v16 + 128));
                          if (v38)
                            panic("%s:%d: unlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 4133, v38);
                        }
                      }
                      else
                      {
                        v35 = pthread_rwlock_unlock((pthread_rwlock_t *)(v16 + 128));
                        if (v35)
                          panic("%s:%d: unlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 4129, v35);
                        v36 = pthread_rwlock_unlock((pthread_rwlock_t *)(v118 + 128));
                        if (v36)
                          panic("%s:%d: unlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 4130, v36);
                      }
                      if (a5 && !(_DWORD)sibling_link && v33)
                      {
                        if (fs_delete_inode((unint64_t *)v12, v14)
                          && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                        {
                          apfs_ufileop_rename_cold_1();
                        }
                        sibling_link = 0;
                        *(_QWORD *)(v14 + 120) |= 0x10uLL;
                      }
                      return sibling_link;
                    }
LABEL_61:
                    if (v31)
                      userfs_internal_reclaim((uint64_t)v34);
                    else
                      _apfs_free(v34, 16);
                    goto LABEL_64;
                  }
                  apfs_ufileop_rename_cold_2();
                }
              }
              else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              {
                apfs_ufileop_rename_cold_13();
              }
              v32 = 0;
              goto LABEL_107;
            }
            if (*(_QWORD *)(v16 + 24) == *(_QWORD *)(v118 + 8))
            {
              v27 = pthread_rwlock_wrlock((pthread_rwlock_t *)(v118 + 128));
              if (v27)
                panic("%s:%d: wrlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 3370, v27);
              v28 = pthread_rwlock_wrlock((pthread_rwlock_t *)(v16 + 128));
              if (!v28)
                goto LABEL_55;
              v112 = v28;
              v25 = 3371;
            }
            else
            {
              if (v118 >= v16)
              {
                v40 = pthread_rwlock_wrlock((pthread_rwlock_t *)(v16 + 128));
                if (v40)
                  panic("%s:%d: wrlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 3376, v40);
                v41 = pthread_rwlock_wrlock((pthread_rwlock_t *)(v118 + 128));
                if (v41)
                  panic("%s:%d: wrlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 3377, v41);
                goto LABEL_55;
              }
              v29 = pthread_rwlock_wrlock((pthread_rwlock_t *)(v118 + 128));
              if (v29)
                panic("%s:%d: wrlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 3373, v29);
              v30 = pthread_rwlock_wrlock((pthread_rwlock_t *)(v16 + 128));
              if (!v30)
                goto LABEL_55;
              v112 = v30;
              v25 = 3374;
            }
          }
LABEL_54:
          panic("%s:%d: wrlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", v25, v112);
        }
        if (!a2)
          _apfs_free(v117, 16);
      }
      return 12;
    }
  }
  return sibling_link;
}

uint64_t userfs_check_parent_chain(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t result;
  char v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;

  v8 = 0xAAAAAAAAAAAAAAAALL;
  v9 = 0xAAAAAAAAAAAAAAAALL;
  if (*(_QWORD *)(a2 + 8) == *(_QWORD *)(a3 + 8))
    return 22;
  v6 = 0;
  do
  {
    if (*(_QWORD *)(a2 + 8) == 2)
      break;
    v7 = *(_QWORD *)(a2 + 24);
    if (v7 == *(_QWORD *)(a3 + 8))
      return 22;
    if ((v6 & 1) != 0)
      userfs_free_inode(&v8);
    result = userfs_load_inode(a1, 0, v7, 0, &v8);
    if ((_DWORD)result)
      return result;
    a2 = v9;
    v6 = 1;
  }
  while (v9);
  return 0;
}

uint64_t apfs_ufileop_stream_lookup(uint64_t *a1, _QWORD *a2)
{
  __int128 v2;
  uint64_t xattr_dstream;
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  char *v10;
  uint64_t xattr;
  int v12;
  _OWORD v14[3];
  _BYTE *v15;

  v15 = 0;
  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v14[1] = v2;
  v14[2] = v2;
  v14[0] = v2;
  xattr_dstream = 22;
  if (a1 && a2)
  {
    v6 = a1[1];
    v7 = *(_WORD *)(v6 + 104) & 0xF000;
    if (v7 == 0x8000)
    {
      v8 = *a1;
      v9 = pthread_rwlock_rdlock((pthread_rwlock_t *)(v6 + 128));
      if (v9)
        panic("%s:%d: rdlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 4188, v9);
      if ((*(_BYTE *)(v6 + 92) & 0x20) != 0)
      {
        v10 = (char *)_apfs_calloc(1uLL, 0x18uLL);
        if (v10)
        {
          xattr = fs_get_xattr(v8, *(_QWORD *)(v6 + 8), (uint64_t *)(v6 + 328), "com.apple.ResourceFork", &v15);
          if ((_DWORD)xattr)
          {
            xattr_dstream = xattr;
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              apfs_ufileop_stream_lookup_cold_2();
          }
          else
          {
            xattr_dstream = fs_get_xattr_dstream(v8, (uint64_t)v15, v14);
            if ((_DWORD)xattr_dstream)
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                apfs_ufileop_stream_lookup_cold_1();
            }
            else
            {
              *(_QWORD *)v10 = a1;
              *(_OWORD *)(v10 + 8) = v14[0];
              *a2 = v10;
            }
          }
        }
        else
        {
          xattr_dstream = 12;
        }
      }
      else
      {
        v10 = 0;
        xattr_dstream = 79;
      }
      v12 = pthread_rwlock_unlock((pthread_rwlock_t *)(v6 + 128));
      if (v12)
        panic("%s:%d: unlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 4222, v12);
      if (v15)
      {
        jobj_release(v8, v15);
        v15 = 0;
      }
      if (v10 && (_DWORD)xattr_dstream)
        _apfs_free(v10, 24);
    }
    else if (v7 == 0x4000)
    {
      return 21;
    }
    else
    {
      return 22;
    }
  }
  return xattr_dstream;
}

uint64_t apfs_ufileop_stream_reclaim(void *a1)
{
  if (!a1)
    return 22;
  _apfs_free(a1, 24);
  return 0;
}

uint64_t apfs_ufileop_stream_read(uint64_t **a1, unint64_t a2, size_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t **v7;
  __int128 v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int block_size;
  size_t v13;
  char *v14;
  char *v15;
  int v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t **v21;
  unint64_t v22;
  size_t v23;
  char *v24;
  size_t v25;
  uint64_t data;
  size_t v27;
  uint64_t v28;
  pthread_rwlock_t *v29;
  int v30;
  uint64_t *v32;
  size_t v33;
  pthread_rwlock_t *v34;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  unint64_t v44;
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  uint64_t *v50;
  __int16 v51;
  unint64_t v52;
  __int16 v53;
  unint64_t v54;
  __int16 v55;
  size_t v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 22;
  v7 = a1;
  v44 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v42 = v8;
  v43 = v8;
  v41 = v8;
  v9 = *a1;
  v10 = **a1;
  v11 = v9[1];
  v38 = *(_QWORD *)(v10 + 392);
  v39 = v10;
  block_size = apfs_get_block_size(v10);
  v13 = 4 * block_size;
  v14 = (char *)_apfs_calloc(1uLL, v13);
  if (v14)
  {
    v15 = v14;
    v34 = (pthread_rwlock_t *)(v11 + 128);
    v16 = pthread_rwlock_rdlock((pthread_rwlock_t *)(v11 + 128));
    if (v16)
      panic("%s:%d: rdlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 4294, v16);
    if (a3)
    {
      v33 = 4 * block_size;
      v17 = 0;
      v36 = block_size - 1;
      v37 = (uint64_t *)(v11 + 328);
      while (1)
      {
        v18 = (unint64_t)v7[2];
        if (a2 >= v18)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            v32 = v7[1];
            *(_DWORD *)buf = 136316418;
            v46 = "apfs_ufileop_stream_read";
            v47 = 1024;
            v48 = 4298;
            v49 = 2048;
            v50 = v32;
            v51 = 2048;
            v52 = v18;
            v53 = 2048;
            v54 = a2;
            v55 = 2048;
            v56 = a3;
            _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: request to read beyond the compressed xdstream end: xds id %lld size %lld smaller than offset %lld len %lu\n", buf, 0x3Au);
          }
          v28 = 0xFFFFFFFFLL;
          goto LABEL_28;
        }
        v19 = lookup_file_extent(v39, (unint64_t)v7[1], a2, 0, v37, (uint64_t)&v41);
        if ((_DWORD)v19)
          break;
        v20 = a2 - v42;
        v21 = v7;
        v22 = (unint64_t)v7[2] - v42;
        if (v22 >= *((_QWORD *)&v43 + 1) * (unint64_t)block_size)
          v22 = *((_QWORD *)&v43 + 1) * block_size;
        v23 = v22 - v20;
        v24 = v15;
        if (a3 >= v23)
          v25 = v23;
        else
          v25 = a3;
        data = dev_read_data(*(_QWORD *)(v38 + 384), v20 / block_size + *((_QWORD *)&v42 + 1));
        if ((_DWORD)data)
        {
          v28 = data;
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            apfs_ufileop_stream_read_cold_2();
          v13 = v33;
          v15 = v24;
          goto LABEL_38;
        }
        if ((v20 + v25 - 1) / block_size - v20 / block_size + 1 <= 4)
          v27 = v25;
        else
          v27 = 4 * block_size - (v20 & v36);
        memcpy((void *)(a4 + v17), &v24[v20 & v36], v27);
        v17 += v27;
        a2 += v27;
        a3 -= v27;
        v15 = v24;
        v7 = v21;
        if (!a3)
        {
          v28 = 0;
LABEL_28:
          v13 = v33;
          goto LABEL_29;
        }
      }
      v28 = v19;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        apfs_ufileop_stream_read_cold_3();
      v13 = v33;
LABEL_38:
      v29 = v34;
    }
    else
    {
      v17 = 0;
      v28 = 0;
LABEL_29:
      v29 = v34;
      if (a5)
        *a5 = v17;
    }
    v30 = pthread_rwlock_unlock(v29);
    if (v30)
      panic("%s:%d: unlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 4348, v30);
    _apfs_free(v15, v13);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      apfs_ufileop_stream_read_cold_1();
    return 12;
  }
  return v28;
}

uint64_t apfs_get_fs_representation(const char *a1, uint64_t a2, unint64_t a3, int a4)
{
  size_t v8;
  uint64_t result;
  unint64_t v10;

  v8 = strnlen(a1, 0x2FEuLL);
  v10 = 0;
  if (v8 > 0x2FD)
    return 63;
  result = utf8_normalizeOptCaseFoldToUTF8((unint64_t)a1, v8, a4, a2, a3, &v10);
  if (!(_DWORD)result)
  {
    if (v10 >= a3)
    {
      return 12;
    }
    else
    {
      result = 0;
      *(_BYTE *)(a2 + v10) = 0;
    }
  }
  return result;
}

uint64_t apfs_ufile_xattr_read(uint64_t a1, void *a2, uint64_t a3, size_t a4, unsigned int a5)
{
  uint64_t v6;
  unint64_t v8;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t data;
  unint64_t v14;

  v6 = *(_QWORD *)(a3 + 24);
  if (v6)
  {
    v8 = a5;
    if ((*(_BYTE *)(*(_QWORD *)(a1 + 376) + 264) & 1) != 0)
    {
      v11 = 0;
    }
    else
    {
      v14 = 0xAAAAAAAAAAAAAAAALL;
      v10 = userfs_crypto_alloc_cst(a1);
      if (!v10)
        return 12;
      v11 = v10;
      get_fext_crypto_logic(a1, a3, (uint64_t *)&v14);
      *(_QWORD *)(v11[9] + 8) = v14 / v8;
      v6 = *(_QWORD *)(a3 + 24);
    }
    data = dev_read_data(*(_QWORD *)(*(_QWORD *)(a1 + 392) + 384), v6);
    if (v11)
      crypto_obj_release(v11);
  }
  else
  {
    bzero(a2, a4);
    return 0;
  }
  return data;
}

void OUTLINED_FUNCTION_28_2(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

BOOL purgeable_file_has_tracked_size(uint64_t a1, uint64_t a2, int a3)
{
  int v3;
  BOOL v4;

  if ((*(_QWORD *)(a2 + 72) & 0x180000) != 0x80000)
    return 0;
  if ((*(_WORD *)(a2 + 104) & 0xF000) == 0x4000)
    return 1;
  v3 = *(_DWORD *)(a2 + 80);
  v4 = v3 <= 1;
  if (v3 == 1)
    a3 = 1;
  return v4 && a3 != 0;
}

unint64_t get_ino_purgeable_size_and_compressed(uint64_t a1, uint64_t a2, BOOL *a3)
{
  int v3;
  BOOL v4;
  unint64_t result;

  v3 = *(_DWORD *)(a2 + 92) & 0x40000020;
  v4 = v3 == 32;
  if ((*(_WORD *)(a2 + 104) & 0xF000) != 0x8000)
    return 0;
  if (v3 == 32)
  {
    if ((*(_QWORD *)(*(_QWORD *)(a1 + 376) + 56) & 0x200) != 0)
    {
      result = ino_rsrc_fork_phys_size(a1, a2);
      if (!a3)
        return result;
    }
    else
    {
      result = 0;
      if (!a3)
        return result;
    }
  }
  else
  {
    result = ino_phys_size(a1, a2);
    if (!a3)
      return result;
  }
  *a3 = v4;
  return result;
}

unint64_t filter_purgeable_flags_for_vol(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  int v4;
  uint64_t v5;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  unint64_t v14;
  uint64_t v15;

  v2 = a2;
  v15 = *MEMORY[0x24BDAC8D0];
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 376) + 57) & 2) != 0)
  {
    if (HIDWORD(a2) && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315906;
      v8 = "filter_purgeable_flags_for_vol";
      v9 = 1024;
      v10 = 666;
      v11 = 2080;
      v12 = a1 + 3720;
      v13 = 2048;
      v14 = v2;
      _os_log_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s:%d: %s Unsupported flags being used on purgeable record: %llx. Truncating...\n", (uint8_t *)&v7, 0x26u);
    }
    v4 = 1900543;
  }
  else
  {
    if (a2 >= 0x10000 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315906;
      v8 = "filter_purgeable_flags_for_vol";
      v9 = 1024;
      v10 = 661;
      v11 = 2080;
      v12 = a1 + 3720;
      v13 = 2048;
      v14 = v2;
      _os_log_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s:%d: %s Unsupported flags being used on purgeable drec: %llx. Truncating...\n", (uint8_t *)&v7, 0x26u);
    }
    v2 = (unsigned __int16)v2;
    v4 = 0xFFFF;
  }
  v5 = v2 & v4;
  if ((_DWORD)v2 == (_DWORD)v5)
    return v2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315906;
    v8 = "filter_purgeable_flags_for_vol";
    v9 = 1024;
    v10 = 677;
    v11 = 2080;
    v12 = a1 + 3720;
    v13 = 1024;
    LODWORD(v14) = v2;
    _os_log_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s:%d: %s Unknown flags being used on purgeable record: %x. Truncating...\n", (uint8_t *)&v7, 0x22u);
  }
  return v5;
}

uint64_t get_pending_purgeable_flags_from_ino(uint64_t a1)
{
  unint64_t __dst;

  __dst = 0xAAAAAAAAAAAAAAAALL;
  if (xf_get((unsigned __int16 *)(a1 + 416), 15, 0, (char *)&__dst, 8uLL))
    return 66048;
  else
    return __dst;
}

uint64_t get_purgeable_dir_size(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  int v3;
  uint64_t result;
  unsigned __int16 *v7;
  unsigned __int16 *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v3 = *(_DWORD *)(*(_QWORD *)(a1 + 376) + 56);
  *a3 = -1;
  if ((*(_WORD *)(a2 + 104) & 0xF000) != 0x4000)
    return 20;
  if ((*(_BYTE *)(a2 + 72) & 4) != 0)
  {
    v8 = 0;
    if (!get_dir_stats(a1, a2, &v8))
    {
      v7 = v8;
      *a3 = *((_QWORD *)v8 + 4);
      jobj_release(a1, v7);
    }
    return 0;
  }
  else
  {
    v10 = 0u;
    v11 = 0u;
    v9 = 0u;
    v8 = (unsigned __int16 *)a1;
    BYTE4(v11) = 1;
    BYTE6(v11) = (v3 & 0x200) != 0;
    BYTE7(v11) = BYTE6(v11);
    fs_iterate_dir((unint64_t *)a1, a2, (uint64_t)child_size_calculator_cb, (uint64_t)&v8);
    result = v11;
    if (!(_DWORD)v11)
      *a3 = v9;
  }
  return result;
}

uint64_t lookup_purgeable_record(uint64_t a1, uint64_t a2, char a3, unint64_t a4, char a5, unsigned __int16 **a6)
{
  uint64_t result;

  if ((*(_BYTE *)(*(_QWORD *)(a1 + 376) + 57) & 2) != 0)
  {
    result = lookup_expanded_purgeable_record(a1, a2, a3, a6);
    if (!(_DWORD)result)
      return result;
    goto LABEL_5;
  }
  result = lookup_purgeable_drec_as_record(a1, a2, a4, a5, a3, a6);
  if ((_DWORD)result)
LABEL_5:
    *a6 = 0;
  return result;
}

uint64_t set_ino_purgeable_state(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v17;
  char v18;
  __int16 v19;
  unint64_t v20;
  int v21;
  uint64_t v22;
  int v23;
  char v24;
  unsigned __int16 *v25;
  char v26;
  unsigned int dir_stats;
  uint64_t v28;
  char *v29;
  NSObject *v30;
  const char *v31;
  int v32;
  uint64_t v33;
  char *v34;
  unint64_t v35;
  uint64_t timestamp;
  int v37;
  unsigned int v38;
  _BOOL4 v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  int v44;
  unint64_t v45;
  uint64_t v46;
  unsigned int v47;
  unsigned int v48;
  unsigned int v49;
  uint64_t v50;
  char *v51;
  NSObject *v52;
  const char *v53;
  __int16 v54;
  char v55;
  BOOL v56;
  char v57;
  unint64_t v58;
  int v59;
  unsigned int v60;
  unint64_t v61;
  void *v62;
  uint64_t v63;
  unsigned int v64;
  int v65;
  char v66;
  __int16 v67;
  unsigned int v68;
  int v69;
  unsigned int v70;
  int v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  char v75;
  uint64_t v76;
  unsigned int updated;
  int v78;
  uint64_t v79;
  unint64_t v80;
  _BOOL4 has_secondary_fsroot;
  int v82;
  _BOOL4 v83;
  int v84;
  unsigned int v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v90;
  char *v91;
  int v92;
  char v93;
  char v94;
  unint64_t ino_purgeable_size_and_compressed;
  int v96;
  int v97;
  int v98;
  unsigned int inserted;
  uint64_t v100;
  uint64_t __src;
  unint64_t v102;
  _BYTE v103[12];
  uint64_t v104;
  uint64_t v105;
  __int16 v106;
  uint64_t v107;
  _BYTE buf[40];
  _BYTE v109[24];
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;

  v5 = 0;
  v112 = *MEMORY[0x24BDAC8D0];
  __src = a4;
  v102 = a3;
  v100 = 0;
  v6 = *(_QWORD *)(a2 + 72);
  v7 = v6 & 0x180000;
  if ((a4 & 0x10000) != 0)
    v8 = "marking";
  else
    v8 = "clearing";
  v9 = *(_DWORD *)(a2 + 92);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 376) + 56) & 0x200;
  if (v10)
    v11 = 4;
  else
    v11 = 2;
  v12 = *(_QWORD *)(a2 + 120);
  inserted = 0;
  if (a4 & 0x10000 | v7)
  {
    if (*(_DWORD *)(a1 + 1100))
      return 30;
    if ((a4 & 0x100000) != 0 || a5 && *(_BYTE *)(a5 + 24) && (a3 || (*(_WORD *)(a2 + 104) & 0xF000) != 0x8000))
      return 22;
    if ((a4 & 0x10000) != 0)
      v17 = 1;
    else
      v17 = 2;
    v98 = v17;
    if (v7 == 0x80000 && ((*(_WORD *)(a2 + 104) & 0xF000) == 0x4000 || *(_DWORD *)(a2 + 80) == 1)
      || (v18 = 0, (a4 & 0x10000) == 0) && (v12 & 0x80000000000) != 0)
    {
      v18 = 1;
    }
    v19 = *(_WORD *)(a2 + 104);
    if ((v19 & 0xF000) == 0x8000)
    {
      LOBYTE(v20) = v6;
      if (*(int *)(a2 + 80) >= 2)
      {
        if ((a4 & 0x1C0000) != 0)
          return 22;
        v94 = v18;
        v97 = v12;
        v25 = (unsigned __int16 *)(a2 + 416);
        if ((a4 & 0x10000) != 0)
        {
          v5 = xf_set(v25, 15, 2, &__src, 8uLL);
          inserted = v5;
          if (!(_DWORD)v5)
          {
            v20 = *(_QWORD *)(a2 + 72) | 0x100000;
            goto LABEL_168;
          }
        }
        else
        {
          v5 = xf_remove(v25, 15);
          inserted = v5;
          if (!(_DWORD)v5)
          {
            v20 = *(_QWORD *)(a2 + 72) & 0xFFFFFFFFFFEFFFFFLL;
LABEL_168:
            *(_QWORD *)(a2 + 72) = v20;
            v19 = *(_WORD *)(a2 + 104);
            LODWORD(v12) = v97;
            v18 = v94;
            goto LABEL_29;
          }
        }
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          return v5;
        v28 = *(_QWORD *)(a2 + 8);
        v29 = strerror(v5);
        *(_DWORD *)buf = 136316674;
        *(_QWORD *)&buf[4] = "set_ino_purgeable_state";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 2547;
        *(_WORD *)&buf[18] = 2080;
        *(_QWORD *)&buf[20] = a1 + 3720;
        *(_WORD *)&buf[28] = 2080;
        *(_QWORD *)&buf[30] = v8;
        *(_WORD *)&buf[38] = 2048;
        *(_QWORD *)v109 = v28;
        *(_WORD *)&v109[8] = 1024;
        *(_DWORD *)&v109[10] = v5;
        *(_WORD *)&v109[14] = 2080;
        *(_QWORD *)&v109[16] = v29;
        v30 = MEMORY[0x24BDACB70];
        v31 = "%s:%d: %s Failed to update extended fields when %s WANTS_TO_BE_PURGEABLE on ino %llu: %d (%s)\n";
        goto LABEL_67;
      }
    }
    else
    {
      LOBYTE(v20) = v6;
    }
LABEL_29:
    v21 = v9 & 0x40000020;
    v22 = (a4 >> 16) & 1;
    v23 = v19 & 0xF000;
    v96 = v12;
    v93 = v18;
    if (v23 == 0x4000 && (v12 & 0x10000) != 0 && !(_DWORD)v22)
    {
      ino_purgeable_size_and_compressed = 0;
      goto LABEL_68;
    }
    if (v23 != 0x4000)
    {
      if (v23 == 0x8000)
      {
        if ((a4 & 0x10000) != 0 && v21 == 32 && !v10)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            set_ino_purgeable_state_cold_6();
          return 22;
        }
        ino_purgeable_size_and_compressed = get_ino_purgeable_size_and_compressed(a1, a2, 0);
        if (v21 == 32)
          v26 = BYTE2(a4) & 1;
        else
          v26 = 0;
        if (v10)
          LOBYTE(v22) = v26;
        else
          LOBYTE(v22) = 0;
LABEL_68:
        v92 = v21;
        v35 = v102;
        if (!v102)
        {
          if (a5 && *(_BYTE *)(a5 + 24))
            v102 = -1;
          inserted = fs_tx_enter(a1, v98, v11, 0, (uint64_t *)&v102);
          if (inserted)
            return inserted;
        }
        timestamp = *(_QWORD *)(a2 + 64);
        if (!timestamp)
        {
          timestamp = get_timestamp();
          *(_QWORD *)(a2 + 64) = timestamp;
        }
        v37 = *(_WORD *)(a2 + 104) & 0xF000;
        if (v37 != 0x4000 || (__src & 0x2000) == 0)
        {
          if ((a4 & 0x10000) == 0)
          {
            if (!v10)
            {
              *(_OWORD *)buf = xmmword_21F61EC00;
              *(_DWORD *)buf = 5243152;
              v46 = *(_QWORD *)(a2 + 8);
              *(_QWORD *)&buf[16] = timestamp;
              *(_QWORD *)&buf[24] = v46;
              *(_QWORD *)&buf[32] = ino_purgeable_size_and_compressed;
              *(_QWORD *)v109 = 0;
              LODWORD(v46) = *(_DWORD *)(a2 + 96);
              *(_DWORD *)&v109[8] = 0;
              *(_DWORD *)&v109[12] = v46;
              v110 = 0;
              v111 = 0;
              *(_QWORD *)&v109[16] = 0;
              v47 = remove_purgeable_record(a1, a2, (uint64_t)buf, v102);
              v39 = v47 == 2;
              if (v47 == 2)
                v48 = 0;
              else
                v48 = v47;
              inserted = v48;
              if (v48)
                goto LABEL_189;
              goto LABEL_172;
            }
            *(_QWORD *)buf = 0;
            v38 = lookup_and_remove_purgeable_record(a1, a2, ino_purgeable_size_and_compressed, v102, (unsigned __int16 **)buf);
            inserted = v38;
            if ((v6 & 0x100000) != 0)
            {
              squash((int *)&inserted, 2);
              v38 = inserted;
            }
            else if (v38 == 2)
            {
              inserted = 0;
              v39 = 1;
              goto LABEL_104;
            }
            if (!v38)
            {
              v39 = 0;
LABEL_104:
              v54 = *(_WORD *)(a2 + 104);
              v55 = v93;
              if ((v54 & 0xF000) == 0x4000 && (*(_BYTE *)(a2 + 72) & 4) != 0)
              {
                dir_stats_unmark_purgeable(a1, a2, v102);
                v55 = v93;
                v54 = *(_WORD *)(a2 + 104);
              }
              v56 = (v54 & 0xF000) == 0x8000;
              v57 = v55 ^ 1;
              if (!v56)
                v57 = 1;
              if ((v57 & 1) == 0)
              {
                v58 = ino_purgeable_size_and_compressed;
                if (*(_QWORD *)buf)
                  v58 = *(_QWORD *)(*(_QWORD *)buf + 32);
                if (v92 == 32)
                  v59 = (*(unsigned __int8 *)(*(_QWORD *)buf + 50) >> 4) & 1;
                else
                  v59 = 0;
                update_size_tracking_purgeable_size(a1, a2, -(uint64_t)v58, v59, v102);
                *(_QWORD *)(a2 + 120) &= ~0x80000000000uLL;
              }
              jobj_release(a1, *(_BYTE **)buf);
LABEL_172:
              *(_QWORD *)(a2 + 72) &= 0xFFFFFFFFFFE7FFFFLL;
              *(_QWORD *)(a2 + 64) = get_timestamp();
              goto LABEL_187;
            }
            goto LABEL_154;
          }
          *(_OWORD *)buf = xmmword_21F61EC00;
          *(_DWORD *)buf = 5243152;
          v40 = *(_QWORD *)(a2 + 8);
          *(_QWORD *)&buf[16] = 0;
          *(_QWORD *)&buf[24] = v40;
          v41 = *(_QWORD *)(a2 + 32);
          *(_QWORD *)&buf[32] = ino_purgeable_size_and_compressed;
          *(_QWORD *)v109 = v41;
          LODWORD(v41) = *(_DWORD *)(a2 + 96);
          *(_DWORD *)&v109[8] = 0;
          *(_DWORD *)&v109[12] = v41;
          v110 = 0;
          v111 = 0;
          *(_QWORD *)&v109[16] = 0;
          v42 = __src;
          if ((__src & 0x8E00) == 0)
          {
            v42 = __src | 0x200;
            __src |= 0x200uLL;
          }
          if ((v42 & 0x20000) != 0)
          {
            if (!HIDWORD(v42))
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v103 = 136315906;
                *(_QWORD *)&v103[4] = "set_ino_purgeable_state";
                v104 = 0x82000000ACA0400;
                v105 = a1 + 3720;
                v106 = 2048;
                v107 = v40;
                _os_log_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s:%d: %s checking the generation count was specified but the generation count of ino %llu is zero.\n", v103, 0x26u);
              }
              inserted = 22;
              if (v35)
                return inserted;
              goto LABEL_155;
            }
            v43 = (*(_BYTE *)(a2 + 72) & 4) != 0 ? v100 : *(_DWORD *)(a2 + 88);
            if (v43 != HIDWORD(v42))
            {
              inserted = 35;
              goto LABEL_154;
            }
          }
          *(_QWORD *)&buf[16] = timestamp;
          *(_DWORD *)&v109[8] = (unsigned __int16)v42;
          if (v37 == 0x8000 && *(int *)(a2 + 80) >= 2)
            *(_DWORD *)&v109[8] = (unsigned __int16)v42 | 0x1000;
          if (ever_cloned_bit_is_ok(a1, a2)
            && (*(_BYTE *)(a2 + 73) & 4) != 0
            && get_ino_dstream_id_refcnt(a1, a2) >= 2)
          {
            *(_DWORD *)&v109[8] |= 0x4000u;
          }
          v60 = __src & 0x1C0000 | *(_DWORD *)&v109[8];
          if ((v22 & 1) != 0)
            v61 = v60 | 0x100000;
          else
            v61 = v60;
          *(_DWORD *)&v109[8] = v61;
          *(_DWORD *)&v109[8] = filter_purgeable_flags_for_vol(a1, v61);
          xf_init((uint64_t)&v109[16], 0);
          if ((*(_BYTE *)(a2 + 72) & 4) != 0
            && (inserted = xf_set((unsigned __int16 *)&v109[16], 1, 2, &v100, 8uLL)) != 0)
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              set_ino_purgeable_state_cold_5();
          }
          else
          {
            if (!a5
              || (*(_DWORD *)&v109[8] & 0x80000) == 0
              || (v63 = *(_QWORD *)(a5 + 16), v62 = (void *)(a5 + 16), !v63)
              || (v64 = xf_set((unsigned __int16 *)&v109[16], 2, 2, v62, 8uLL), (inserted = v64) == 0))
            {
              inserted = insert_purgeable_record(a1, a2, (uint64_t)buf, v102);
              xf_release((uint64_t)&v109[16]);
              if (!inserted)
              {
                v66 = v93;
                if (v10)
                {
                  if (*(_DWORD *)(a2 + 80) == 1)
                    inserted = 0;
                  v67 = *(_WORD *)(a2 + 104);
                  if ((v67 & 0xF000) == 0x4000 && (*(_BYTE *)(a2 + 72) & 4) != 0)
                  {
                    v68 = dir_stats_mark_purgeable(a1, a2, v102);
                    inserted = v68;
                    if (v68)
                    {
                      v69 = v68;
                      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                        set_ino_purgeable_state_cold_3(a1, a2 + 8, v69);
                      remove_purgeable_record(a1, a2, (uint64_t)buf, v102);
                      if (v35)
                        return inserted;
                      goto LABEL_155;
                    }
                    v67 = *(_WORD *)(a2 + 104);
                    v66 = v93;
                  }
                  if ((v67 & 0xF000) == 0x8000)
                  {
                    v75 = *(_DWORD *)(a2 + 80) == 1 ? v66 : 1;
                    if ((v75 & 1) == 0)
                      update_size_tracking_purgeable_size(a1, a2, ino_purgeable_size_and_compressed, v92 == 32, v102);
                  }
                }
                v76 = *(_QWORD *)(a2 + 72) | 0x80000;
                *(_QWORD *)(a2 + 72) = v76;
                if ((*(_WORD *)(a2 + 104) & 0xF000) == 0x8000 && *(_DWORD *)(a2 + 80) == 1)
                  *(_QWORD *)(a2 + 72) = v76 & 0xFFFFFFFFFFEFFFFFLL;
                v39 = 0;
LABEL_187:
                updated = update_jobj(a1, 1, (unsigned __int8 *)a2, v102);
                inserted = updated;
                if (updated)
                {
                  v78 = updated;
                  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                  {
                    v90 = *(_QWORD *)(a2 + 8);
                    v91 = strerror(v78);
                    *(_DWORD *)buf = 136316674;
                    *(_QWORD *)&buf[4] = "set_ino_purgeable_state";
                    *(_WORD *)&buf[12] = 1024;
                    *(_DWORD *)&buf[14] = 3073;
                    *(_WORD *)&buf[18] = 2080;
                    *(_QWORD *)&buf[20] = a1 + 3720;
                    *(_WORD *)&buf[28] = 2048;
                    *(_QWORD *)&buf[30] = v90;
                    *(_WORD *)&buf[38] = 2080;
                    *(_QWORD *)v109 = v8;
                    *(_WORD *)&v109[8] = 1024;
                    *(_DWORD *)&v109[10] = v78;
                    *(_WORD *)&v109[14] = 2080;
                    *(_QWORD *)&v109[16] = v91;
                    _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: %s Failed to update_jobj(ino %llu) after %s purgeability: %d (%s)\n", buf, 0x40u);
                    if (v35)
                      goto LABEL_191;
                    goto LABEL_190;
                  }
                }
LABEL_189:
                if (!v35)
                  goto LABEL_190;
LABEL_191:
                if (v39 && !inserted)
                {
                  if ((v96 & 0x10000) == 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                    set_ino_purgeable_state_cold_2();
                  v79 = *(_QWORD *)(a2 + 8);
                  v80 = v102;
                  *(_QWORD *)buf = a1;
                  *(_QWORD *)&buf[8] = v79;
                  *(_QWORD *)&buf[16] = v102;
                  *(_QWORD *)&buf[24] = 0x200000000;
                  has_secondary_fsroot = apfs_has_secondary_fsroot(a1);
                  if ((*(_BYTE *)(*(_QWORD *)(a1 + 376) + 57) & 2) != 0)
                  {
                    v83 = apfs_has_secondary_fsroot(a1);
                    if ((*(_BYTE *)(*(_QWORD *)(a1 + 376) + 57) & 2) != 0)
                    {
                      *(_QWORD *)v103 = 0xE000000000000007;
                      *(_DWORD *)&v103[8] = 16;
                      if (v83)
                        v84 = 8;
                      else
                        v84 = 1;
                      v105 = 0;
                      v104 = 0;
                      iterate_raw_jobjs_with_hint(a1, v84, v80, v103, 0x1CuLL, (uint64_t)_remove_purgeable_record_cb, (uint64_t)buf, 0, 0, 2048);
                    }
                    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                    {
                      set_ino_purgeable_state_cold_1();
                    }
                  }
                  else
                  {
                    if (has_secondary_fsroot)
                      v82 = 8;
                    else
                      v82 = 1;
                    *(_DWORD *)&v103[8] = 0;
                    *(_QWORD *)v103 = 0x9000000000000007;
                    iterate_raw_jobjs_with_hint(a1, v82, v80, v103, 0xCuLL, (uint64_t)_remove_purgeable_record_cb, (uint64_t)buf, 0, 0, 2048);
                  }
                  v85 = *(_DWORD *)&buf[28];
                  inserted = *(_DWORD *)&buf[28];
                  if (*(_DWORD *)&buf[28]
                    && (v96 & 0x10000) == 0
                    && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
                  {
                    v86 = *(_QWORD *)(a2 + 8);
                    v87 = *(_QWORD *)(a2 + 24);
                    v88 = *(_QWORD *)(a2 + 72);
                    *(_DWORD *)buf = 136316674;
                    *(_QWORD *)&buf[4] = "set_ino_purgeable_state";
                    *(_WORD *)&buf[12] = 1024;
                    *(_DWORD *)&buf[14] = 3092;
                    *(_WORD *)&buf[18] = 2080;
                    *(_QWORD *)&buf[20] = a1 + 3720;
                    *(_WORD *)&buf[28] = 2048;
                    *(_QWORD *)&buf[30] = v86;
                    *(_WORD *)&buf[38] = 2048;
                    *(_QWORD *)v109 = v87;
                    *(_WORD *)&v109[8] = 2048;
                    *(_QWORD *)&v109[10] = v88;
                    *(_WORD *)&v109[18] = 1024;
                    *(_DWORD *)&v109[20] = v85;
                    _os_log_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s:%d: %s Failed to remove purgeable record for ino %llu (parent id %llu, internal_flags %#llx) iteratively (err %d).\n", buf, 0x40u);
                    v85 = inserted;
                  }
                  if (v85 == 2)
                    return 0;
                }
                return inserted;
              }
LABEL_154:
              if (!v35)
              {
LABEL_155:
                v39 = 0;
LABEL_190:
                fs_tx_leave(a1, v98, v11, 0, v102);
                v102 = 0;
                goto LABEL_191;
              }
              return inserted;
            }
            v65 = v64;
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              set_ino_purgeable_state_cold_4(a1, a2 + 8, v65);
          }
          xf_release((uint64_t)&v109[16]);
          if (!v35)
            goto LABEL_155;
          return inserted;
        }
        if ((a4 & 0x10000) != 0)
        {
          *(_QWORD *)buf = __src & 0xFFFFFFFFFFFFDFFFLL;
          v49 = xf_set((unsigned __int16 *)(a2 + 416), 15, 2, buf, 8uLL);
          inserted = v49;
          if (!v49)
          {
            v45 = *(_QWORD *)(a2 + 72) | 0x2000000;
LABEL_157:
            *(_QWORD *)(a2 + 72) = v45;
            v70 = update_jobj(a1, 1, (unsigned __int8 *)a2, v102);
            inserted = v70;
            if (!v70 || (v71 = v70, !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR)))
            {
LABEL_159:
              v39 = 0;
              if (!v35)
                goto LABEL_190;
              goto LABEL_191;
            }
            v73 = *(_QWORD *)(a2 + 8);
            v74 = strerror(v71);
            *(_DWORD *)buf = 136316674;
            *(_QWORD *)&buf[4] = "set_ino_purgeable_state";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 2730;
            *(_WORD *)&buf[18] = 2080;
            *(_QWORD *)&buf[20] = a1 + 3720;
            *(_WORD *)&buf[28] = 2048;
            *(_QWORD *)&buf[30] = v73;
            *(_WORD *)&buf[38] = 2080;
            *(_QWORD *)v109 = v8;
            *(_WORD *)&v109[8] = 1024;
            *(_DWORD *)&v109[10] = v71;
            *(_WORD *)&v109[14] = 2080;
            *(_QWORD *)&v109[16] = v74;
            v52 = MEMORY[0x24BDACB70];
            v53 = "%s:%d: %s Failed to update_jobj(ino %llu) after %s purgeability: %d (%s)\n";
LABEL_174:
            _os_log_error_impl(&dword_21F566000, v52, OS_LOG_TYPE_ERROR, v53, buf, 0x40u);
            if (!v35)
              goto LABEL_155;
            return inserted;
          }
          v44 = v49;
        }
        else
        {
          v44 = xf_remove((unsigned __int16 *)(a2 + 416), 15);
          inserted = v44;
          if (!v44)
          {
            v45 = *(_QWORD *)(a2 + 72) & 0xFFFFFFFFFDFFFFFFLL;
            goto LABEL_157;
          }
        }
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_159;
        v50 = *(_QWORD *)(a2 + 8);
        v51 = strerror(v44);
        *(_DWORD *)buf = 136316674;
        *(_QWORD *)&buf[4] = "set_ino_purgeable_state";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 2723;
        *(_WORD *)&buf[18] = 2080;
        *(_QWORD *)&buf[20] = a1 + 3720;
        *(_WORD *)&buf[28] = 2080;
        *(_QWORD *)&buf[30] = v8;
        *(_WORD *)&buf[38] = 2048;
        *(_QWORD *)v109 = v50;
        *(_WORD *)&v109[8] = 1024;
        *(_DWORD *)&v109[10] = v44;
        *(_WORD *)&v109[14] = 2080;
        *(_QWORD *)&v109[16] = v51;
        v52 = MEMORY[0x24BDACB70];
        v53 = "%s:%d: %s Failed to update extended fields when %s APFS_PURGEABLE_MARK_CHILDREN on ino %llu: %d (%s)\n";
        goto LABEL_174;
      }
LABEL_45:
      ino_purgeable_size_and_compressed = 0;
      LOBYTE(v22) = 0;
      goto LABEL_68;
    }
    if ((__src & 0x2000) != 0)
      goto LABEL_45;
    if ((v20 & 4) != 0)
    {
      *(_QWORD *)buf = 0;
      dir_stats = get_dir_stats(a1, a2, (unsigned __int16 **)buf);
      inserted = dir_stats;
      if (dir_stats)
      {
        ino_purgeable_size_and_compressed = 0;
      }
      else
      {
        ino_purgeable_size_and_compressed = *(_QWORD *)(*(_QWORD *)buf + 32);
        v100 = *(_QWORD *)(*(_QWORD *)buf + 48);
        jobj_release(a1, *(_BYTE **)buf);
        dir_stats = 0;
        if (a5)
        {
          v72 = *(_QWORD *)(a5 + 8);
          if (v72)
          {
            if (v72 != v100)
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                set_ino_purgeable_state_cold_7();
              dir_stats = 70;
              inserted = 70;
            }
          }
        }
      }
      LOBYTE(v22) = 0;
      goto LABEL_64;
    }
    *(_OWORD *)v109 = 0u;
    v22 = v10 >> 9;
    memset(&buf[8], 0, 32);
    *(_QWORD *)buf = a1;
    v109[6] = v10 >> 9;
    v109[7] = v109[6];
    if ((a4 & 0x10000) != 0)
    {
      v24 = 1;
      v109[4] = 1;
      if (*(_QWORD *)(*(_QWORD *)(a1 + 376) + 56) & 0x200 | v20 & 2)
      {
LABEL_63:
        fs_iterate_dir((unint64_t *)a1, a2, (uint64_t)child_size_calculator_cb, (uint64_t)buf);
        ino_purgeable_size_and_compressed = *(_QWORD *)&buf[8];
        dir_stats = *(_DWORD *)v109;
        inserted = *(_DWORD *)v109;
LABEL_64:
        if (!dir_stats)
          goto LABEL_68;
        v32 = dir_stats;
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          return inserted;
        v33 = *(_QWORD *)(a2 + 8);
        v34 = strerror(v32);
        *(_DWORD *)buf = 136316674;
        *(_QWORD *)&buf[4] = "set_ino_purgeable_state";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 2656;
        *(_WORD *)&buf[18] = 2080;
        *(_QWORD *)&buf[20] = a1 + 3720;
        *(_WORD *)&buf[28] = 2080;
        *(_QWORD *)&buf[30] = v8;
        *(_WORD *)&buf[38] = 2048;
        *(_QWORD *)v109 = v33;
        *(_WORD *)&v109[8] = 1024;
        *(_DWORD *)&v109[10] = v32;
        *(_WORD *)&v109[14] = 2080;
        *(_QWORD *)&v109[16] = v34;
        v30 = MEMORY[0x24BDACB70];
        v31 = "%s:%d: %s Failed %s purgeability on directory %llu: %d (%s)\n";
LABEL_67:
        _os_log_error_impl(&dword_21F566000, v30, OS_LOG_TYPE_ERROR, v31, buf, 0x40u);
        return inserted;
      }
    }
    else
    {
      v24 = 0;
      LOBYTE(v22) = 0;
    }
    v109[5] = v24;
    goto LABEL_63;
  }
  return v5;
}

uint64_t child_size_calculator_cb(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t inode;
  uint64_t v9;
  int v10;
  int v11;
  unint64_t ino_purgeable_size_and_compressed;
  int v13;
  _QWORD *v14;
  int v15;
  BOOL v17;
  int v18;
  char *__s1;

  v4 = *(_QWORD *)a2;
  v5 = *(_WORD *)(a1 + 60);
  if (!needs_ctx())
  {
    if ((v5 & 0xF) != 8 && (v5 & 0xF) != 4)
      return 0;
    inode = fs_get_inode(v4, *(_QWORD *)(a1 + 16));
    if (!inode)
      return 0;
    v9 = inode;
    v10 = *(_WORD *)(inode + 104) & 0xF000;
    if (*(_BYTE *)(a2 + 45) && v10 == 0x8000 && *(int *)(inode + 80) >= 2)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        child_size_calculator_cb_cold_1();
LABEL_32:
      v6 = 22;
      *(_DWORD *)(a2 + 40) = 22;
LABEL_47:
      _release_inode_carefully(v4, (_BYTE *)v9);
      return v6;
    }
    if (v10 == 0x4000)
    {
      if (*(_BYTE *)(a2 + 44))
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          child_size_calculator_cb_cold_2();
        goto LABEL_32;
      }
    }
    else if (v10 == 0x8000)
    {
      v11 = pthread_rwlock_rdlock((pthread_rwlock_t *)(inode + 128));
      if (v11)
        panic("%s:%d: rdlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/fscommon/purging.c", 2063, v11);
      if (*(int *)(v9 + 80) >= 2 && *(_BYTE *)(a2 + 46))
      {
        if (*(_QWORD *)(v9 + 24) == *(_QWORD *)(a1 + 8))
        {
          __s1 = 0;
          v18 = 0;
          if (!xf_get_ptr_and_size((unsigned __int16 *)(v9 + 416), 4, 0, &__s1, &v18)
            && v18 >= 1
            && __s1
            && !strcmp(__s1, *(const char **)(a1 + 64)))
          {
            *(_QWORD *)(a2 + 8) += get_ino_purgeable_size_and_compressed(v4, v9, 0);
          }
        }
LABEL_44:
        v15 = pthread_rwlock_unlock((pthread_rwlock_t *)(v9 + 128));
        if (v15)
          panic("%s:%d: unlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/fscommon/purging.c", 2120, v15);
        goto LABEL_46;
      }
      v17 = 0;
      ino_purgeable_size_and_compressed = get_ino_purgeable_size_and_compressed(v4, v9, &v17);
      *(_QWORD *)(a2 + 8) += ino_purgeable_size_and_compressed;
      if ((*(_QWORD *)(v9 + 72) & 0x180000) == 0x80000)
      {
        if ((*(_WORD *)(v9 + 104) & 0xF000) != 0x4000)
        {
          v13 = *(_DWORD *)(v9 + 80);
          if (v13 != 1)
          {
LABEL_42:
            if (v13 <= 1)
              *(_QWORD *)(a2 + 16) += ino_purgeable_size_and_compressed;
            goto LABEL_44;
          }
        }
        if (v17 && *(_BYTE *)(a2 + 47))
          v14 = (_QWORD *)(a2 + 32);
        else
          v14 = (_QWORD *)(a2 + 24);
        *v14 += ino_purgeable_size_and_compressed;
      }
      v13 = *(_DWORD *)(v9 + 80);
      goto LABEL_42;
    }
LABEL_46:
    v6 = 0;
    goto LABEL_47;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    child_size_calculator_cb_cold_3();
  v6 = 4;
  *(_DWORD *)(a2 + 40) = 4;
  return v6;
}

uint64_t insert_purgeable_record(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  int v8;
  uint64_t inserted;
  unint64_t v10;
  unsigned __int16 *v11;
  uint64_t v12;
  unint64_t v14;
  uint64_t v15;
  uint64_t __dst;

  if (apfs_has_secondary_fsroot(a1))
    v8 = 8;
  else
    v8 = 1;
  if (*(_QWORD *)(a3 + 16))
  {
    if ((*(_BYTE *)(*(_QWORD *)(a1 + 376) + 57) & 2) != 0)
    {
      inserted = insert_jobj(a1, v8, (unsigned __int8 *)a3, a4);
      if ((_DWORD)inserted && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        insert_purgeable_record_cold_6(a1, inserted);
    }
    else
    {
      v14 = 0xAAAAAAAAAAAAAAAALL;
      inserted = make_purgeable_drec(a1, *(_DWORD *)(a3 + 52), *(_QWORD *)(a3 + 32), *(_QWORD *)(a3 + 24), *(_QWORD *)(a2 + 8), &v14);
      if ((_DWORD)inserted)
        goto LABEL_26;
      v10 = v14;
      *(_WORD *)(v14 + 60) = *(_DWORD *)(a3 + 48);
      *(_QWORD *)(v10 + 24) = *(_QWORD *)(a3 + 16);
      v15 = 0;
      __dst = 0;
      v11 = (unsigned __int16 *)(a3 + 56);
      if (!xf_get(v11, 1, 0, (char *)&__dst, 8uLL))
      {
        v12 = xf_set((unsigned __int16 *)(v10 + 32), 2, 0, &__dst, 8uLL);
        if ((_DWORD)v12)
        {
          inserted = v12;
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            insert_purgeable_record_cold_5();
LABEL_25:
          jobj_release(a1, (_BYTE *)v10);
LABEL_26:
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            insert_purgeable_record_cold_3(a1, inserted);
          return inserted;
        }
      }
      if (xf_get(v11, 2, 0, (char *)&v15, 8uLL) != 2)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          insert_purgeable_record_cold_4();
        inserted = 22;
        goto LABEL_25;
      }
      inserted = insert_jobj(a1, v8, (unsigned __int8 *)v10, a4);
      if ((_DWORD)inserted && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        insert_purgeable_record_cold_2(a1, inserted);
      jobj_release(a1, (_BYTE *)v10);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      insert_purgeable_record_cold_1();
    return 9;
  }
  return inserted;
}

uint64_t remove_purgeable_record(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  int v8;
  uint64_t purgeable_drec;
  uint64_t v10;
  unsigned __int8 *v11;
  unsigned __int8 *v13;

  if (apfs_has_secondary_fsroot(a1))
    v8 = 8;
  else
    v8 = 1;
  if (*(_QWORD *)(a3 + 16))
  {
    if ((*(_BYTE *)(*(_QWORD *)(a1 + 376) + 57) & 2) != 0)
    {
      v10 = remove_jobj(a1, v8, (unsigned __int8 *)a3, a4);
      if ((v10 & 0xFFFFFFFD) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        remove_purgeable_record_cold_4(a1, v10);
    }
    else
    {
      v13 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
      purgeable_drec = make_purgeable_drec(a1, *(_DWORD *)(a2 + 96), *(_QWORD *)(a3 + 32), *(_QWORD *)(a3 + 24), *(_QWORD *)(a2 + 8), (unint64_t *)&v13);
      if ((_DWORD)purgeable_drec)
      {
        v10 = purgeable_drec;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          remove_purgeable_record_cold_3(a1, v10);
      }
      else
      {
        v11 = v13;
        v13[1] = 3;
        v10 = remove_jobj(a1, v8, v11, a4);
        if ((v10 & 0xFFFFFFFD) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          remove_purgeable_record_cold_2(a1, v10);
        jobj_release(a1, v11);
      }
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      remove_purgeable_record_cold_1();
    return 9;
  }
  return v10;
}

uint64_t lookup_and_remove_purgeable_record(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4, unsigned __int16 **a5)
{
  uint64_t v9;
  uint64_t v10;

  if ((*(_BYTE *)(*(_QWORD *)(a1 + 376) + 57) & 2) != 0)
    v9 = lookup_expanded_purgeable_record(a1, a2, 0, a5);
  else
    v9 = lookup_purgeable_drec_as_record(a1, a2, a3, 1, 0, a5);
  v10 = v9;
  if ((_DWORD)v9)
  {
    if ((_DWORD)v9 != 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      lookup_and_remove_purgeable_record_cold_1();
  }
  else
  {
    v10 = remove_purgeable_record(a1, a2, (uint64_t)*a5, a4);
    if ((_DWORD)v10)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        lookup_and_remove_purgeable_record_cold_2();
      jobj_release(a1, *a5);
      *a5 = 0;
    }
  }
  return v10;
}

uint64_t clear_ino_purgeable_state_(uint64_t a1, uint64_t a2, unint64_t a3)
{
  return set_ino_purgeable_state(a1, a2, a3, 0, 0);
}

uint64_t merge_ino_purgeable_flags(uint64_t a1, uint64_t a2, unsigned int a3, int a4, char a5, uint64_t a6)
{
  uint64_t inserted;
  uint64_t v11;
  _BOOL4 v12;
  int v13;
  unint64_t v14;
  unsigned __int16 *v15;
  int v16;
  uint64_t purgeable_drec;
  _BOOL4 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  _BYTE *v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v29;
  char *v30;
  unsigned __int16 *v31;
  uint64_t v32;
  _BYTE buf[12];
  __int16 v34;
  int v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  int v41;
  __int16 v42;
  int v43;
  __int16 v44;
  char *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v31 = 0;
  v32 = a6;
  if (*(_DWORD *)(a1 + 1100))
    return 0;
  v11 = lookup_purgeable_record(a1, a2, a5, 0, 0, &v31);
  if ((_DWORD)v11)
  {
    inserted = v11;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      merge_ino_purgeable_flags_cold_6();
    return inserted;
  }
  v12 = v32 == 0;
  if (v32 || (v20 = fs_tx_enter(a1, 1, 2, 0, &v32), !(_DWORD)v20))
  {
    v13 = filter_purgeable_flags_for_vol(a1, *((_DWORD *)v31 + 12) & ~a4 | a3);
    v15 = v31;
    v14 = v32;
    *((_DWORD *)v31 + 12) = v13;
    if (apfs_has_secondary_fsroot(a1))
      v16 = 8;
    else
      v16 = 1;
    if ((*(_BYTE *)(*(_QWORD *)(a1 + 376) + 57) & 2) != 0)
    {
      v18 = *((_QWORD *)v15 + 3) != *(_QWORD *)(a2 + 8);
      *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
      v19 = lookup_expanded_purgeable_record(a1, a2, v18, (unsigned __int16 **)buf);
      if ((_DWORD)v19)
      {
        inserted = v19;
        if ((_DWORD)v19 != 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          merge_ino_purgeable_flags_cold_3(a1, (uint64_t)(v15 + 12), inserted);
LABEL_37:
        if (!(_DWORD)inserted)
          goto LABEL_40;
LABEL_38:
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          v29 = *(_QWORD *)(a2 + 8);
          v30 = strerror(inserted);
          *(_DWORD *)buf = 136316674;
          *(_QWORD *)&buf[4] = "merge_ino_purgeable_flags";
          v34 = 1024;
          v35 = 3180;
          v36 = 2080;
          v37 = a1 + 3720;
          v38 = 2048;
          v39 = v29;
          v40 = 1024;
          v41 = v13;
          v42 = 1024;
          v43 = inserted;
          v44 = 2080;
          v45 = v30;
          _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: %s Failed to update purgeable flags on ino %llu (new flags %u):%d (%s)\n", buf, 0x3Cu);
        }
        goto LABEL_40;
      }
      v25 = remove_jobj(a1, v16, *(unsigned __int8 **)buf, v14);
      if ((_DWORD)v25)
      {
        inserted = v25;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
          merge_ino_purgeable_flags_cold_5();
      }
      else
      {
        v26 = *(_QWORD *)buf;
        *(_QWORD *)(*(_QWORD *)buf + 16) = *((_QWORD *)v15 + 2);
        v27 = *((_DWORD *)v15 + 12);
        if (v27)
          *(_DWORD *)(v26 + 48) = v27;
        inserted = insert_jobj(a1, v16, (unsigned __int8 *)v26, v14);
        if ((_DWORD)inserted)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            merge_ino_purgeable_flags_cold_4(a1, (uint64_t)(v15 + 12), inserted);
          *(_QWORD *)(a2 + 72) &= ~0x80000uLL;
        }
      }
      v24 = *(_BYTE **)buf;
      v23 = a1;
    }
    else
    {
      *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
      purgeable_drec = make_purgeable_drec(a1, *((_DWORD *)v15 + 13), *((_QWORD *)v15 + 4), *((_QWORD *)v15 + 3), *(_QWORD *)(a2 + 8), (unint64_t *)buf);
      if ((_DWORD)purgeable_drec)
      {
        inserted = purgeable_drec;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          merge_ino_purgeable_flags_cold_2(a1, (uint64_t)(v15 + 12), inserted);
        goto LABEL_38;
      }
      v21 = *(_QWORD *)buf;
      *(_QWORD *)(*(_QWORD *)buf + 24) = *((_QWORD *)v15 + 2);
      v22 = *((_DWORD *)v15 + 12);
      if (v22)
        *(_WORD *)(v21 + 60) = v22;
      *(_BYTE *)(v21 + 1) = 4;
      inserted = insert_jobj(a1, v16, (unsigned __int8 *)v21, v14);
      if ((_DWORD)inserted && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        merge_ino_purgeable_flags_cold_1(a1, (uint64_t)(v15 + 12), inserted);
      v23 = a1;
      v24 = (_BYTE *)v21;
    }
    jobj_release(v23, v24);
    goto LABEL_37;
  }
  inserted = v20;
  v12 = 0;
LABEL_40:
  if (v31)
    jobj_release(a1, v31);
  if (v12)
    fs_tx_leave(a1, 1, 2, 0, v32);
  return inserted;
}

uint64_t lookup_purgeable_drec_as_record(uint64_t a1, uint64_t a2, unint64_t a3, char a4, char a5, _QWORD *a6)
{
  unint64_t v8;
  uint64_t purgeable_dir_size;
  unint64_t purgeable_record_id_for_lookup;
  uint64_t inode;
  unsigned __int8 *v14;
  _QWORD *v15;
  _QWORD *v16;
  unsigned __int16 *v17;
  unsigned __int16 *v18;
  _BYTE *v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unsigned int v23;
  BOOL v24;
  uint64_t v25;
  _BYTE *v27;
  unsigned __int8 *v28;
  int v29;
  _BYTE *v30;
  int v31;
  uint64_t v32;
  unint64_t v34;
  unsigned __int16 *v35;
  unint64_t v36;
  unsigned __int8 *v37;

  v8 = a3;
  v35 = (unsigned __int16 *)0xAAAAAAAAAAAAAAAALL;
  v36 = a3;
  v34 = 0xAAAAAAAAAAAAAAAALL;
  if ((a4 & 1) == 0)
  {
    if ((*(_WORD *)(a2 + 104) & 0xF000) == 0x4000)
    {
      purgeable_dir_size = get_purgeable_dir_size(a1, a2, &v36);
      if ((_DWORD)purgeable_dir_size)
        return purgeable_dir_size;
      v8 = v36;
    }
    else
    {
      v8 = ino_phys_size(a1, a2);
      v36 = v8;
    }
  }
  purgeable_record_id_for_lookup = get_purgeable_record_id_for_lookup(a1, a2, a5);
  inode = a2;
  if (purgeable_record_id_for_lookup != *(_QWORD *)(a2 + 8))
  {
    inode = fs_get_inode(a1, purgeable_record_id_for_lookup);
    if (!inode)
    {
      inode = a2;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        lookup_purgeable_drec_as_record_cold_4();
        inode = a2;
      }
    }
  }
  v37 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  purgeable_dir_size = make_purgeable_drec(a1, *(_DWORD *)(inode + 96), v8, purgeable_record_id_for_lookup, *(_QWORD *)(inode + 8), (unint64_t *)&v37);
  if (inode != a2)
    jobj_release(a1, (_BYTE *)inode);
  if ((_DWORD)purgeable_dir_size)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      lookup_purgeable_drec_as_record_cold_3(a1, purgeable_dir_size);
  }
  else
  {
    v14 = v37;
    purgeable_dir_size = lookup_jobj(a1, 1, 0, v37, &v35);
    if ((_DWORD)purgeable_dir_size)
      v35 = 0;
    jobj_release(a1, v14);
  }
  if ((_DWORD)purgeable_dir_size)
  {
    if ((_DWORD)purgeable_dir_size != 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      lookup_purgeable_drec_as_record_cold_1();
  }
  else
  {
    v15 = _apfs_calloc(1uLL, 0x50uLL);
    if (v15)
    {
      v16 = v15;
      *(_DWORD *)v15 = 5243152;
      v15[1] = 7;
      v17 = v35;
      v15[2] = *((_QWORD *)v35 + 3);
      *((_DWORD *)v15 + 12) = filter_purgeable_flags_for_vol(a1, v17[30]);
      v18 = v35;
      v16[3] = *((_QWORD *)v35 + 2);
      v16[5] = *(_QWORD *)(a2 + 32);
      v19 = (_BYTE *)*((_QWORD *)v18 + 8);
      v20 = v18[31];
      *((_DWORD *)v16 + 13) = 0;
      if (v20 >= 3 && *v19 == 48 && v19[1] == 120)
      {
        v21 = (unint64_t)&v19[v20];
        v22 = (unint64_t)(v19 + 2);
        do
        {
          if (!*(_BYTE *)v22)
            break;
          if ((*(_BYTE *)v22 - 48) >= 0xAu)
          {
            v23 = *(unsigned __int8 *)v22 - 65;
            v24 = v23 > 0x25;
            v25 = (1 << v23) & 0x3F0000003FLL;
            if (v24 || v25 == 0)
              break;
          }
          ++v22;
        }
        while (v22 < v21);
        if (v22 < v21)
        {
          v27 = &v19[v20 - v22];
          while (*(_BYTE *)v22 && *(_BYTE *)v22 != 58)
          {
            ++v22;
            if (!--v27)
            {
              v22 = (unint64_t)&v19[v20];
              break;
            }
          }
        }
        v28 = (unsigned __int8 *)(v22 + 1);
        if (v22 + 1 < v21 && *(_BYTE *)v22 == 58)
        {
          v29 = 0;
          v30 = &v19[v20 + ~v22];
          do
          {
            v31 = *v28;
            if ((v31 - 48) > 9)
              break;
            v29 = v31 + 10 * v29 - 48;
            ++v28;
            --v30;
          }
          while (v30);
          *((_DWORD *)v16 + 13) = v29;
        }
      }
      v16[4] = v8;
      if (xf_get(v18 + 16, 2, 0, (char *)&v34, 8uLL)
        || (v32 = xf_set((unsigned __int16 *)v16 + 28, 1, 0, &v34, 8uLL), !(_DWORD)v32))
      {
        purgeable_dir_size = 0;
        *a6 = v16;
      }
      else
      {
        purgeable_dir_size = v32;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          lookup_purgeable_drec_as_record_cold_2();
        jobj_release(a1, v16);
      }
    }
    else
    {
      purgeable_dir_size = 12;
    }
    jobj_release(a1, v35);
  }
  return purgeable_dir_size;
}

uint64_t lookup_expanded_purgeable_record(uint64_t a1, uint64_t a2, int a3, unsigned __int16 **a4)
{
  _BOOL4 has_secondary_fsroot;
  unint64_t purgeable_record_id_for_lookup;
  unint64_t v10;
  uint64_t inode;
  uint64_t v12;
  int v13;
  __int128 v15;
  uint64_t v16;
  unint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  unint64_t v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  has_secondary_fsroot = apfs_has_secondary_fsroot(a1);
  v15 = xmmword_21F61EC00;
  LODWORD(v15) = 5242896;
  v16 = *(_QWORD *)(a2 + 64);
  purgeable_record_id_for_lookup = get_purgeable_record_id_for_lookup(a1, a2, a3);
  v17 = purgeable_record_id_for_lookup;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  if (a3)
  {
    v10 = purgeable_record_id_for_lookup;
    inode = fs_get_inode(a1, purgeable_record_id_for_lookup);
    if (inode)
    {
      v16 = *(_QWORD *)(inode + 64);
      jobj_release(a1, (_BYTE *)inode);
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a2 + 8);
      *(_DWORD *)buf = 136316162;
      v22 = "lookup_expanded_purgeable_record";
      v23 = 1024;
      v24 = 1063;
      v25 = 2080;
      v26 = a1 + 3720;
      v27 = 2048;
      v28 = v10;
      v29 = 2048;
      v30 = v12;
      _os_log_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s:%d: %s failed to find host inode (id %llu) for purgeable rec lookup, falling back to ino %llu's atime\n", buf, 0x30u);
    }
  }
  if (has_secondary_fsroot)
    v13 = 8;
  else
    v13 = 1;
  return lookup_jobj(a1, v13, 0, (unsigned __int8 *)&v15, a4);
}

unint64_t get_purgeable_record_id_for_lookup(uint64_t a1, uint64_t a2, char a3)
{
  unint64_t *p_dst;
  uint64_t v6;
  unint64_t __dst;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if ((a3 & 1) != 0)
  {
    __dst = 0xAAAAAAAAAAAAAAAALL;
    p_dst = &__dst;
    if (xf_get((unsigned __int16 *)(a2 + 416), 18, 0, (char *)&__dst, 8uLL))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(_QWORD *)(a2 + 8);
        *(_DWORD *)buf = 136315906;
        v10 = "get_purgeable_record_id_for_lookup";
        v11 = 1024;
        v12 = 577;
        v13 = 2080;
        v14 = a1 + 3720;
        v15 = 2048;
        v16 = v6;
        _os_log_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s:%d: %s ino %lld did not have a source-purge-id\n", buf, 0x26u);
      }
      p_dst = (unint64_t *)(a2 + 32);
    }
  }
  else
  {
    p_dst = (unint64_t *)(a2 + 8);
  }
  return *p_dst;
}

uint64_t make_purgeable_drec(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t *a6)
{
  __int128 v9;
  int v10;
  size_t v11;
  uint64_t result;
  unint64_t v13;
  char __str[16];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v13 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v9 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v20 = v9;
  v21 = v9;
  v18 = v9;
  v19 = v9;
  v16 = v9;
  v17 = v9;
  *(_OWORD *)__str = v9;
  v15 = v9;
  v10 = snprintf(__str, 0x80uLL, "0x%llx-0x%llx:%d", a3, a4, a2);
  if (v10 <= 0)
    v11 = v10;
  else
    v11 = (v10 + 1);
  if ((int)v11 < 1)
    return 12;
  result = dir_rec_alloc(a1, 1, __str, v11, 7, a5, &v13);
  if (!(_DWORD)result)
    *a6 = v13;
  return result;
}

uint64_t _remove_purgeable_record_cb(uint64_t a1, unsigned int a2, _QWORD *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  int v16;
  unint64_t v17;
  int tree;
  uint64_t result;
  uint64_t *v20;
  _BYTE buf[12];
  __int16 v22;
  int v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v9 = *(_QWORD *)a5;
  if ((*(_QWORD *)(*(_QWORD *)(*(_QWORD *)a5 + 376) + 56) & 0x200) != 0)
    v10 = 16;
  else
    v10 = 9;
  v11 = jobj_type_from_possibly_large_key(*(_QWORD *)a5, a1);
  if (*(_QWORD *)(a5 + 16))
  {
    v12 = *(_DWORD *)(a5 + 24) + 1;
    *(_DWORD *)(a5 + 24) = v12;
    if ((v12 & 0x3F) == 0)
    {
      if (tx_is_closing(*(_QWORD *)(v9 + 392)))
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          v13 = *(_QWORD *)(a5 + 8);
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)&buf[4] = "_remove_purgeable_record_cb";
          v22 = 1024;
          v23 = 1579;
          v24 = 2080;
          v25 = v9 + 3720;
          v26 = 2048;
          v27 = v13;
          _os_log_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s:%d: %s Aborting iterative purgeable record removal for id %llu because transaction is closing\n", buf, 0x26u);
        }
        return 0x80000000;
      }
    }
  }
  if (v11 != v10)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      _remove_purgeable_record_cb_cold_3();
    return 0x80000000;
  }
  v14 = *(_QWORD *)a1 >> 60;
  if (v14 == 14)
    LODWORD(v14) = *(unsigned __int8 *)(a1 + 8);
  if ((_DWORD)v14 != 9)
  {
    if ((_DWORD)v14 != 16)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        _remove_purgeable_record_cb_cold_2();
      goto LABEL_33;
    }
    a3 = (_QWORD *)(a1 + 20);
  }
  if (*a3)
  {
    if (*a3 == *(_QWORD *)(a5 + 8))
    {
      v15 = *(_QWORD *)(a5 + 16);
      *(_QWORD *)buf = v15;
      if (apfs_has_secondary_fsroot(v9))
        v16 = 8;
      else
        v16 = 1;
      v20 = (uint64_t *)0xAAAAAAAAAAAAAAAALL;
      v17 = v15;
      if (!v15)
      {
        tree = fs_tx_enter(v9, 2, 1, 0, (uint64_t *)buf);
        if (tree)
        {
LABEL_38:
          *(_DWORD *)(a5 + 28) = tree;
          return 0x80000000;
        }
        v17 = *(_QWORD *)buf;
      }
      tree = jfs_get_tree(v9, v16, v17, (uint64_t *)&v20);
      if (!tree)
      {
        tree = bt_remove((uint64_t)v20, *(_QWORD *)(v9 + 432), (unint64_t *)a1, a2, *(uint64_t *)buf);
        obj_release(v20);
      }
      if (!v15)
        fs_tx_leave(v9, 2, 1, 0, *(uint64_t *)buf);
      goto LABEL_38;
    }
    return 0;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "get_purgeable_record_details";
    v22 = 1024;
    v23 = 1823;
    v24 = 2080;
    v25 = v9 + 3720;
    _os_log_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s:%d: %s Found purgeable record with file ID 0!\n", buf, 0x1Cu);
  }
LABEL_33:
  result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  if (!(_DWORD)result)
    return result;
  _remove_purgeable_record_cb_cold_1();
  return 0;
}

void OUTLINED_FUNCTION_25_1(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

uint64_t tx_mgr_init(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  pthread_mutex_t *v7;
  uint64_t v8;
  uint64_t inited;
  uint64_t v10;
  uint64_t v12;
  int v13;
  int v14;

  v6 = *(unsigned int *)(*(_QWORD *)(a1 + 376) + 36);
  v7 = (pthread_mutex_t *)_apfs_calloc(1uLL, 0x130uLL);
  if (!v7)
    return 12;
  v8 = (uint64_t)v7;
  v7[1].__sig = a2;
  *(_QWORD *)v7[1].__opaque = 0;
  *(_QWORD *)&v7[1].__opaque[40] = 0;
  *(_DWORD *)&v7[1].__opaque[8] = 0;
  *(_DWORD *)&v7[1].__opaque[12] = (v6 - 40) / 0x28uLL;
  *(_QWORD *)&v7[1].__opaque[48] = (char *)v7 + 112;
  v7[2].__sig = 0;
  *(_QWORD *)v7[2].__opaque = v7 + 2;
  inited = new_lock(v7);
  if (!(_DWORD)inited)
  {
    v10 = new_cv((pthread_cond_t *)(v8 + 256));
    if ((_DWORD)v10)
    {
      inited = v10;
      free_lock((pthread_mutex_t *)v8);
    }
    else if (*(_BYTE *)(a1 + 627) || (inited = tx_mgr_init_tx(v8, v6), !(_DWORD)inited))
    {
      inited = 0;
      v12 = *(_QWORD *)(a1 + 376);
      v13 = *(_DWORD *)(v12 + 104) & 0x7FFFFFFF;
      v14 = *(_DWORD *)(v12 + 108) & 0x7FFFFFFF;
      *(_DWORD *)(v8 + 88) = v13;
      *(_DWORD *)(v8 + 92) = v14;
      *(_QWORD *)(v8 + 96) = *(_QWORD *)(v12 + 128);
      *(_DWORD *)(v8 + 104) = v13;
      *(_DWORD *)(v8 + 108) = v14;
      *a3 = v8;
      return inited;
    }
  }
  _apfs_free((void *)v8, 304);
  return inited;
}

uint64_t tx_mgr_init_tx(uint64_t a1, unsigned int a2)
{
  size_t v3;
  int v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  uint64_t *v13;

  v3 = a2;
  v4 = 4;
  while (1)
  {
    v5 = _apfs_calloc(1uLL, 0x78uLL);
    if (!v5)
      break;
    v6 = v5;
    v5[7] = _apfs_malloc(v3);
    v6[8] = _apfs_malloc(v3);
    v7 = *(_QWORD **)(a1 + 120);
    *v6 = 0;
    v6[1] = v7;
    *v7 = v6;
    *(_QWORD *)(a1 + 120) = v6;
    if (!v6[7] || !v6[8])
      break;
    if (!--v4)
      return 0;
  }
  while (1)
  {
    v13 = *(uint64_t **)(a1 + 112);
    if (!v13)
      break;
    v9 = *v13;
    v10 = (_QWORD *)v13[1];
    if (*v13)
    {
      *(_QWORD *)(v9 + 8) = v10;
      v10 = (_QWORD *)v13[1];
    }
    else
    {
      *(_QWORD *)(a1 + 120) = v10;
    }
    *v10 = v9;
    v11 = (void *)v13[7];
    if (v11)
      _apfs_free(v11, v3);
    v12 = (void *)v13[8];
    if (v12)
      _apfs_free(v12, v3);
    _apfs_free(v13, 120);
  }
  return 12;
}

void tx_mgr_free_tx(uint64_t a1, _QWORD *a2, unsigned int a3)
{
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = (_QWORD *)a2[18];
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v14 = *(_QWORD *)(a1 + 384) + 208;
      v15 = v6[2];
      v19 = 136315906;
      v20 = "tx_mgr_free_tx";
      v21 = 1024;
      v22 = 189;
      v23 = 2080;
      v24 = v14;
      v25 = 2048;
      v26 = v15;
      _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: %s Trash unfinished tx xid=0x%llx\n", (uint8_t *)&v19, 0x26u);
      v6 = (_QWORD *)a2[18];
    }
    *v6 = 0;
    v7 = (_QWORD *)a2[15];
    v6[1] = v7;
    *v7 = v6;
    a2[15] = a2[18];
    a2[18] = 0;
  }
  v8 = a2[16];
  if (v8)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v16 = *(_QWORD *)(a1 + 384) + 208;
    v17 = *(_QWORD *)(v8 + 16);
    v18 = *(_QWORD *)(**(_QWORD **)(a2[17] + 8) + 16);
    v19 = 136316162;
    v20 = "tx_mgr_free_tx";
    v21 = 1024;
    v22 = 197;
    v23 = 2080;
    v24 = v16;
    v25 = 2048;
    v26 = v17;
    v27 = 2048;
    v28 = v18;
    _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: %s Trash unfinished pending tx, xid range = 0x%llx - 0x%llx\n", (uint8_t *)&v19, 0x30u);
    v8 = a2[16];
    if (v8)
    {
LABEL_7:
      *(_QWORD *)a2[15] = v8;
      *(_QWORD *)(a2[16] + 8) = a2[15];
      a2[15] = a2[17];
      a2[16] = 0;
      a2[17] = a2 + 16;
    }
  }
  v9 = (_QWORD *)a2[14];
  if (v9)
  {
    do
    {
      v11 = (_QWORD *)*v9;
      v10 = (_QWORD *)v9[1];
      if (*v9)
      {
        v11[1] = v10;
        v10 = (_QWORD *)v9[1];
      }
      else
      {
        a2[15] = v10;
      }
      *v10 = v11;
      v12 = (void *)v9[7];
      if (v12)
        _apfs_free(v12, a3);
      v13 = (void *)v9[8];
      if (v13)
        _apfs_free(v13, a3);
      _apfs_free(v9, 120);
      v9 = v11;
    }
    while (v11);
  }
}

void tx_mgr_destroy(uint64_t a1, uint64_t a2, unsigned int a3)
{
  tx_mgr_free_tx(a1, (_QWORD *)a2, a3);
  free_lock((pthread_mutex_t *)a2);
  free_cv((pthread_cond_t *)(a2 + 256));
  _apfs_free((void *)a2, 304);
}

BOOL xid_is_current_tx(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  if (*(_BYTE *)(a1 + 624))
  {
    v2 = (_QWORD *)(*(_QWORD *)(a1 + 376) + 96);
    return *v2 == a2;
  }
  v3 = *(_QWORD *)(a1 + 400);
  if (v3)
  {
    v4 = *(_QWORD *)(v3 + 144);
    if (v4)
    {
      v2 = (_QWORD *)(v4 + 16);
      return *v2 == a2;
    }
  }
  return 0;
}

uint64_t tx_checkpoint_space_check(uint64_t a1, uint64_t a2, int a3)
{
  int v4;
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  _BOOL4 v15;
  unsigned int v16;
  uint64_t v18;
  uint64_t v19;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  unsigned int v29;
  __int16 v30;
  unsigned int v31;
  __int16 v32;
  unsigned int v33;
  __int16 v34;
  unsigned int v35;
  __int16 v36;
  unsigned int v37;
  __int16 v38;
  unsigned int v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  unsigned int v43;
  __int16 v44;
  unsigned int v45;
  uint64_t v46;

  v4 = 0;
  v46 = *MEMORY[0x24BDAC8D0];
  v5 = *(_QWORD *)(a1 + 400);
  while (1)
  {
    v6 = *(_DWORD *)(v5 + 96);
    v7 = *(_DWORD *)(v5 + 104);
    v8 = v7;
    if (v6 > v7)
      v8 = *(_DWORD *)(v5 + 88) + v7;
    v9 = *(_DWORD *)(v5 + 100);
    v10 = *(_DWORD *)(v5 + 108);
    v11 = v10;
    if (v9 > v10)
      v11 = *(_DWORD *)(v5 + 92) + v10;
    v12 = v8 - v6;
    v13 = v11 - v9;
    v14 = *(_DWORD *)(a2 + 40) + 1;
    v15 = v14 > v8 - v6;
    v16 = *(_DWORD *)(a2 + 48) + a3;
    if (v16 <= v11 - v9 && ((v4 | v15) & 1) == 0)
      return 0;
    if ((v4 & 1) != 0 || !*(_QWORD *)(v5 + 128))
      break;
    tx_barrier_internal(a1, 0x50u, 0);
    v4 = 1;
  }
  if (!*(_WORD *)(v5 + 82) && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v18 = *(_QWORD *)(a1 + 384) + 208;
    v19 = *(_QWORD *)(a2 + 16);
    *(_DWORD *)buf = 136317954;
    v23 = "tx_checkpoint_space_check";
    v24 = 1024;
    v25 = 495;
    v26 = 2080;
    v27 = v18;
    v28 = 1024;
    v29 = v7;
    v30 = 1024;
    v31 = v10;
    v32 = 1024;
    v33 = v6;
    v34 = 1024;
    v35 = v9;
    v36 = 1024;
    v37 = v12;
    v38 = 1024;
    v39 = v13;
    v40 = 2048;
    v41 = v19;
    v42 = 1024;
    v43 = v14;
    v44 = 1024;
    v45 = v16;
    _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: %s checkpoint area out of space: stable: %d %d - next %d %d available %d %d tx[%lld] %d %d\n", buf, 0x56u);
  }
  *(_WORD *)(v5 + 82) = 1;
  return 28;
}

uint64_t tx_barrier_internal(uint64_t a1, unsigned int a2, int a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v10;
  uint64_t *v11;
  int v12;
  __darwin_time_t v13;
  __darwin_time_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  timespec v20;

  v6 = *(_QWORD *)(a1 + 400);
  if ((a2 & 0x40) != 0)
  {
    v7 = *(_QWORD *)(v6 + 128);
    if (!v7 || (*(_BYTE *)(v7 + 24) & 0x40) == 0)
      return 0;
  }
  if (a3)
    pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 400));
  v8 = dev_barrier(*(_QWORD *)(a1 + 384), (a2 >> 4) & 1);
  if (a3)
    pthread_mutex_lock((pthread_mutex_t *)v6);
  if ((_DWORD)v8 == 25 || (_DWORD)v8 == 0)
  {
    v10 = *(uint64_t **)(v6 + 128);
    if (v10)
    {
      do
      {
        v11 = (uint64_t *)*v10;
        v12 = *((_DWORD *)v10 + 6);
        if ((v12 & 0x40) != 0)
        {
          *((_DWORD *)v10 + 6) = v12 & 0xFFFFFFBF;
          v20.tv_sec = 0xAAAAAAAAAAAAAAAALL;
          v20.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
          clock_gettime(_CLOCK_UPTIME_RAW_APPROX, &v20);
          v13 = 1000000 * v20.tv_sec + SLODWORD(v20.tv_nsec) / 1000;
          v14 = v13 - v10[9];
          v10[9] = v13;
          v10[13] += v14;
          v15 = v10[2];
          if (!*(_BYTE *)(a1 + 632) || v15 < *(_QWORD *)(*(_QWORD *)(a1 + 376) + 1408))
          {
            *(_DWORD *)(v6 + 104) = *((_DWORD *)v10 + 9);
            *(_DWORD *)(v6 + 108) = *((_DWORD *)v10 + 11);
          }
          spaceman_tx_complete((_QWORD *)a1, v15);
          v16 = *v10;
          v17 = (_QWORD *)v10[1];
          if (*v10)
          {
            *(_QWORD *)(v16 + 8) = v17;
            v17 = (_QWORD *)v10[1];
          }
          else
          {
            *(_QWORD *)(v6 + 136) = v17;
          }
          *v17 = v16;
          *v10 = 0;
          v18 = *(_QWORD **)(v6 + 120);
          v10[1] = (uint64_t)v18;
          *v18 = v10;
          *(_QWORD *)(v6 + 120) = v10;
          cv_wakeup((pthread_cond_t *)(v6 + 256));
        }
        v10 = v11;
      }
      while (v11);
    }
    return 0;
  }
  return v8;
}

uint64_t tx_checkpoint_write_prepare(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  int8x16_t v8;
  int8x16_t v9;
  _QWORD *v10;
  uint64_t v11;

  v5 = (*(_DWORD *)(*(_QWORD *)(a1 + 376) + 36) + *(_DWORD *)(a3 + 48) - 1)
     / *(_DWORD *)(*(_QWORD *)(a1 + 376) + 36);
  v6 = *(_QWORD *)(a2 + 64);
  if (*(_DWORD *)(v6 + 36) == *(_DWORD *)(*(_QWORD *)(a1 + 400) + 84))
  {
    ++*(_DWORD *)(a2 + 40);
    *(_DWORD *)(v6 + 36) = 0;
  }
  v7 = tx_checkpoint_space_check(a1, a2, v5);
  if (!(_DWORD)v7)
  {
    if ((*(_BYTE *)(a3 + 19) & 0x20) == 0)
    {
      v10 = *(_QWORD **)(a3 + 56);
      v8.i64[0] = *(_QWORD *)(a3 + 36);
      v10[3] = v8.i64[0];
      v11 = *(_QWORD *)(a2 + 16);
      v10[1] = *(_QWORD *)(a3 + 112);
      v10[2] = v11;
      obj_checksum_set(a3, v8, v9);
    }
    *(_QWORD *)(a3 + 120) = *(_QWORD *)(a2 + 16);
    *(_QWORD *)(a3 + 144) = 0;
    ++*(_DWORD *)(*(_QWORD *)(a2 + 64) + 36);
    *(_DWORD *)(a2 + 48) += v5;
  }
  return v7;
}

uint64_t tx_checkpoint_write(_QWORD *a1, uint64_t a2, uint64_t a3, int8x16_t a4, int8x16_t a5)
{
  _DWORD *v8;
  size_t v9;
  int v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  signed int v20;
  unsigned int *v21;
  unsigned int v22;
  unsigned int v23;
  char *v24;
  int v25;
  unint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int v31;
  uint64_t v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  unsigned int v37;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;

  v8 = (_DWORD *)a1[50];
  v44 = 0xAAAAAAAAAAAAAAAALL;
  v42 = 0xAAAAAAAAAAAAAAAALL;
  v9 = *(unsigned int *)(a1[47] + 36);
  v10 = *(_DWORD *)(a3 + 48);
  v12 = (uint64_t *)(a2 + 64);
  v11 = *(_QWORD *)(a2 + 64);
  if (*(_DWORD *)(v11 + 36) == v8[21])
  {
    obj_checksum_set_phys((uint64_t)a1, v11, *(_DWORD *)(a1[47] + 36), a4, a5);
    v13 = dev_write(a1[48], *(_QWORD *)(*v12 + 8));
    if ((_DWORD)v13)
    {
      v14 = v13;
      if (!v8[19] && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        tx_checkpoint_write_cold_4();
      return v14;
    }
    v15 = (*(_DWORD *)(a2 + 40) + v8[24]) % v8[22];
    v44 = -1;
    v16 = nx_checkpoint_desc_block_address((uint64_t)a1, v15, &v44);
    if ((_DWORD)v16)
    {
      v14 = v16;
      if (!v8[19] && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        tx_checkpoint_write_cold_3();
      return v14;
    }
    bzero(*(void **)(a2 + 64), v9);
    v17 = *(_QWORD *)(a2 + 64);
    *(_DWORD *)(v17 + 24) = 1073741836;
    *(_QWORD *)(v17 + 8) = v44;
    *(_QWORD *)(v17 + 16) = *(_QWORD *)(a2 + 16);
    ++*(_DWORD *)(a2 + 40);
  }
  v18 = (*(_DWORD *)(a2 + 48) + v8[25]) % v8[23];
  v43 = -1;
  v19 = nx_checkpoint_data_block_address((uint64_t)a1, v18, &v43, &v42);
  if ((_DWORD)v19)
  {
    v14 = v19;
    if (!v8[19] && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      tx_checkpoint_write_cold_2();
  }
  else
  {
    v20 = ((int)v9 + v10 - 1) / v9;
    pthread_mutex_lock((pthread_mutex_t *)(a1[49] + 328));
    v21 = (unsigned int *)(a3 + 32);
    do
      v22 = __ldxr(v21);
    while (__stxr(v22 | 8, v21));
    if ((v22 & 8) != 0)
    {
      do
      {
        pthread_mutex_unlock((pthread_mutex_t *)(a1[49] + 328));
        pthread_mutex_lock((pthread_mutex_t *)(a1[49] + 328));
        do
          v23 = __ldxr(v21);
        while (__stxr(v23 | 8, v21));
      }
      while ((v23 & 8) != 0);
    }
    v39 = a2;
    v40 = a3;
    v41 = *(char **)(a3 + 64);
    *(_QWORD *)(a3 + 128) = v43;
    if (v20 < 1)
    {
LABEL_33:
      if (v41 == *(char **)(v40 + 56))
        v28 = 0;
      else
        v28 = v41;
      *(_QWORD *)(v40 + 64) = 0;
      v29 = a1[49];
      v30 = *(_QWORD *)(*(_QWORD *)(v29 + 848) + 104);
      *(_QWORD *)(v29 + 848) = v30;
      if (!v30)
        *(_QWORD *)(v29 + 856) = v29 + 848;
      *(_QWORD *)(v40 + 104) = 3735928559;
      do
        v31 = __ldxr(v21);
      while (__stxr(v31 & 0xFFFFFFF7, v21));
      pthread_mutex_unlock((pthread_mutex_t *)(a1[49] + 328));
      v32 = *v12;
      v33 = *(_DWORD *)(*v12 + 36);
      v34 = *v12 + 40 * v33;
      *(_QWORD *)(v34 + 40) = *(_QWORD *)(v40 + 36);
      *(_QWORD *)(v34 + 48) = *(unsigned int *)(v40 + 48);
      v35 = *(_QWORD *)(v40 + 8);
      if (v35)
      {
        v35 = obj_oid(v35);
        v32 = *v12;
        v33 = *(_DWORD *)(*v12 + 36);
      }
      v36 = (_QWORD *)(v32 + 40 * v33);
      v36[7] = v35;
      v36[8] = *(_QWORD *)(v40 + 112);
      v36[9] = *(_QWORD *)(v40 + 128);
      *(_DWORD *)(v32 + 36) = v33 + 1;
      *(_DWORD *)(v39 + 48) += v20;
      if (v28)
        fs_obj_zfree_oc(v28, *(unsigned int *)(v40 + 48), *(_QWORD *)(v40 + 16), a1[49]);
      return 0;
    }
    else
    {
      v24 = v41;
      v25 = v20;
      while (1)
      {
        v26 = v42 >= v25 ? v25 : v42;
        v27 = dev_write(a1[48], v43);
        if ((_DWORD)v27)
          break;
        v25 -= v26;
        if (!v25)
          goto LABEL_33;
        v18 = (int)v18 + (int)v26 >= (*(_DWORD *)(a1[47] + 108) & 0x7FFFFFFFu) ? 0 : (v18 + v26);
        v27 = nx_checkpoint_data_block_address((uint64_t)a1, v18, &v43, &v42);
        if ((_DWORD)v27)
          break;
        v24 += v26 * v9;
        if (v25 <= 0)
          goto LABEL_33;
      }
      v14 = v27;
      do
        v37 = __ldxr(v21);
      while (__stxr(v37 & 0xFFFFFFF7, v21));
      pthread_mutex_unlock((pthread_mutex_t *)(a1[49] + 328));
      if (!v8[19] && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        tx_checkpoint_write_cold_1();
    }
  }
  return v14;
}

uint64_t tx_barrier(uint64_t a1, unsigned int a2)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *(_QWORD *)(a1 + 400);
  if ((a2 & 0x80) != 0 && (v5 = *(_QWORD *)(v4 + 144)) != 0 && (*(_BYTE *)(v5 + 24) & 8) != 0)
  {
    v6 = 0;
    if ((a2 & 0x40) == 0)
      goto LABEL_11;
  }
  else
  {
    pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 400));
    v6 = 1;
    if ((a2 & 0x40) == 0)
      goto LABEL_11;
  }
  v7 = *(_QWORD *)(v4 + 128);
  if (!v7 || (*(_BYTE *)(v7 + 24) & 0x40) == 0)
  {
    if (v6)
      pthread_mutex_unlock((pthread_mutex_t *)v4);
    return 0;
  }
LABEL_11:
  v8 = tx_barrier_internal(a1, a2, 0);
  if (v6)
    pthread_mutex_unlock((pthread_mutex_t *)v4);
  return v8;
}

void tx_unmount(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  int8x16_t v6;
  int8x16_t v7;
  _BYTE *v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 400);
  pthread_mutex_lock((pthread_mutex_t *)v2);
  *(_DWORD *)(v2 + 72) |= 1u;
  pthread_mutex_unlock((pthread_mutex_t *)v2);
  v3 = MEMORY[0x24BDACB70];
  while (1)
  {
    v4 = tx_finish(a1, 8);
    if (v4 != 16)
      break;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v5 = *(_QWORD *)(a1 + 384) + 208;
      *(_DWORD *)buf = 136315650;
      v10 = "tx_unmount";
      v11 = 1024;
      v12 = 1869;
      v13 = 2080;
      v14 = v5;
      _os_log_debug_impl(&dword_21F566000, v3, OS_LOG_TYPE_DEBUG, "%s:%d: %s waiting for transaction to finish\n", buf, 0x1Cu);
    }
    sleep(1u);
  }
  if (!v4)
  {
    if (*(_BYTE *)(a1 + 629))
      return;
    pthread_mutex_lock((pthread_mutex_t *)v2);
    if ((*(_BYTE *)(v2 + 72) & 2) != 0)
    {
      if (tx_barrier_internal(a1, 0x10u, 0)
        && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        tx_unmount_cold_5();
      }
      obj_checksum_set(a1, v6, v7);
      if (dev_write(*(_QWORD *)(a1 + 384), 0)
        && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        tx_unmount_cold_4();
      }
      v8 = *(_BYTE **)(a1 + 376);
      if ((v8[65] & 1) != 0
        && nx_fusion_superblock_write(a1, v8)
        && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        tx_unmount_cold_3();
      }
      if (tx_barrier_internal(a1, 0x10u, 0)
        && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        tx_unmount_cold_2();
      }
    }
    goto LABEL_26;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    tx_unmount_cold_1();
  if (!*(_BYTE *)(a1 + 629))
  {
    pthread_mutex_lock((pthread_mutex_t *)v2);
LABEL_26:
    pthread_mutex_unlock((pthread_mutex_t *)v2);
  }
}

uint64_t tx_finish(uint64_t a1, __int16 a2)
{
  uint64_t v2;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  int v11;
  int v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  int v18;
  uint64_t v19;
  int v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  unint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 627))
    return 30;
  v5 = *(_QWORD *)(a1 + 400);
  pthread_mutex_lock((pthread_mutex_t *)v5);
  v6 = *(_DWORD *)(v5 + 72);
  if ((a2 & 8) != 0 || (v6 & 1) == 0)
  {
    while (1)
    {
      v7 = *(_QWORD *)(v5 + 144);
      if ((v6 & 0x40) == 0)
        break;
      if (v7)
        *(_DWORD *)(v7 + 24) |= 0x100000u;
      if ((a2 & 0x100) != 0)
      {
        *(_DWORD *)(v5 + 72) = v6 & 0xFFFFFFF3;
        cv_wakeup((pthread_cond_t *)(v5 + 256));
        v7 = *(_QWORD *)(v5 + 144);
      }
      if (v7)
      {
        v2 = *(unsigned int *)(v7 + 52);
        if ((_DWORD)v2)
          goto LABEL_66;
      }
      cv_wait((pthread_cond_t *)(v5 + 256), (pthread_mutex_t *)v5, 8, (uint64_t)"nx_tx_finish_wait_for_dirty_data", 0);
      v8 = *(_QWORD *)(v5 + 144);
      if (v8)
      {
        v9 = *(_DWORD *)(v8 + 52);
        if (v9 | a2 & 0x100)
        {
          if (v9)
            v2 = v9;
          else
            v2 = 35;
          goto LABEL_66;
        }
      }
      else if ((a2 & 0x100) != 0)
      {
        v2 = 35;
LABEL_66:
        pthread_mutex_unlock((pthread_mutex_t *)v5);
        return v2;
      }
      v6 = *(_DWORD *)(v5 + 72);
      if ((a2 & 8) == 0 && (v6 & 1) != 0)
        goto LABEL_18;
    }
    if (!v7)
    {
      v7 = **(_QWORD **)(*(_QWORD *)(v5 + 136) + 8);
      if (!v7 || (*(_BYTE *)(v7 + 24) & 0x30) == 0)
      {
        if ((a2 & 0x11) != 0)
          v2 = tx_barrier_internal(a1, a2 & 0x10, 0);
        else
          v2 = 0;
        goto LABEL_66;
      }
    }
    if ((a2 & 2) == 0 && (v6 & 0xC) == 8)
    {
      pthread_mutex_unlock((pthread_mutex_t *)v5);
      return 16;
    }
    v10 = *(_QWORD *)(v7 + 16);
    if ((a2 & 8) == 0)
      ++*(_QWORD *)(v5 + 176);
    v11 = *(_DWORD *)(v7 + 24);
    v12 = a2 & 1;
    if (v11 & 0x100000 | a2 & 0x10 | v12 | a2 & 0x20)
      *(_DWORD *)(v7 + 24) = ((a2 & 0x30) << 14) | (v12 << 17) | v11 & 0xFFEFFFFF;
    if ((v11 & 1) != 0)
      tx_transition(v7, 1, 2);
    if (*(_DWORD *)(v7 + 28))
    {
      v2 = (16 * v12) ^ 0x10u;
    }
    else
    {
      if ((*(_BYTE *)(v7 + 24) & 2) != 0)
      {
        v13 = tx_transition(v7, 2, 4);
        if (v13 >= 0xF4241 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          v14 = *(_QWORD *)(a1 + 384) + 208;
          v15 = *(_QWORD *)(v7 + 16);
          v21 = 136316162;
          v22 = "tx_finish";
          v23 = 1024;
          v24 = 2138;
          v25 = 2080;
          v26 = v14;
          v27 = 2048;
          v28 = v15;
          v29 = 2048;
          v30 = v13;
          _os_log_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s:%d: %s tx xid %lld took %lld us to close\n", (uint8_t *)&v21, 0x30u);
        }
        *(_QWORD *)(v5 + 248) = (*(_QWORD *)(v5 + 248) + v13) >> 1;
      }
      v2 = tx_flush_initiate(a1);
      if (!(_DWORD)v2)
      {
        v16 = *(_DWORD *)(v5 + 72);
        if ((v16 & 0x40) != 0)
        {
          *(_DWORD *)(v5 + 72) = v16 & 0xFFFFFFF3;
          if ((a2 & 0x100) != 0)
          {
LABEL_68:
            pthread_mutex_unlock((pthread_mutex_t *)v5);
            return 35;
          }
          cv_wakeup((pthread_cond_t *)(v5 + 256));
        }
        v2 = 0;
      }
    }
    if ((a2 & 9) != 0)
    {
      if ((a2 & 1) != 0)
        v17 = 126;
      else
        v17 = 62;
      do
      {
        if (*(_QWORD *)(v7 + 16) != v10 || (*(_DWORD *)(v7 + 24) & v17) == 0)
          break;
        if (!(_DWORD)v2)
          cv_wait((pthread_cond_t *)(v5 + 256), (pthread_mutex_t *)v5, 8, (uint64_t)"nx_tx_finish_wait", 0);
        v18 = *(_DWORD *)(v5 + 72);
        if ((a2 & 8) == 0 && (v18 & 1) != 0)
          goto LABEL_18;
        if ((a2 & 0x100) != 0 && (v18 & 4) == 0)
          goto LABEL_68;
      }
      while (!*(_DWORD *)(v5 + 76));
      v19 = **(_QWORD **)(*(_QWORD *)(v5 + 136) + 8);
      if (!v19 || (v2 = *(unsigned int *)(v19 + 52), !(_DWORD)v2))
        v2 = *(unsigned int *)(v7 + 52);
    }
    goto LABEL_66;
  }
LABEL_18:
  pthread_mutex_unlock((pthread_mutex_t *)v5);
  return 1;
}

uint64_t tx_enter_internal(uint64_t a1, uint64_t *a2, char a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  BOOL v12;
  int8x16_t v13;
  int8x16_t v14;
  const char *v15;
  const char *v16;
  int v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t *v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  _BYTE *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  BOOL v39;
  unsigned int v40;
  uint64_t v42;
  uint64_t v43;
  int v44;
  _BYTE __tp[18];
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  unint64_t v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  const char *v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 627))
    return 30;
  v7 = *(_QWORD *)(a1 + 400);
  pthread_mutex_lock((pthread_mutex_t *)v7);
  if ((*(_DWORD *)(v7 + 72) & 1) != 0)
  {
LABEL_37:
    pthread_mutex_unlock((pthread_mutex_t *)v7);
    return 1;
  }
  v8 = *a2;
  if (*a2 != -1)
  {
    if (v8)
      goto LABEL_6;
    goto LABEL_15;
  }
  v11 = *(_QWORD *)(v7 + 144);
  if (v11)
    v12 = (*(_DWORD *)(v7 + 72) & 0xC) == 8;
  else
    v12 = 1;
  if (v12 || (*(_BYTE *)(v11 + 24) & 0x1C) != 0)
  {
    *a2 = 0;
LABEL_15:
    memset(__tp, 170, 16);
    clock_gettime(_CLOCK_UPTIME_RAW_APPROX, (timespec *)__tp);
    v15 = 0;
    v42 = *(_DWORD *)&__tp[8] / 1000;
    v43 = *(_QWORD *)__tp;
    while (1)
    {
      v9 = *(_QWORD *)(v7 + 144);
      if (v9 && (*(_BYTE *)(v9 + 24) & 0x1E) != 0)
      {
        if (*(_WORD *)(v7 + 80))
          goto LABEL_79;
        v16 = "nx_tx_wait";
        if ((a3 & 2) != 0)
        {
LABEL_20:
          v17 = *(_DWORD *)(v9 + 24);
          v15 = "nx_tx_wait_closing";
          if ((v17 & 2) == 0)
          {
            if ((v17 & 4) != 0)
            {
              v18 = **(_QWORD **)(*(_QWORD *)(v7 + 136) + 8);
              if (!v18 || (v15 = "nx_tx_wait_closed_prev_flushing", (*(_BYTE *)(v18 + 24) & 0x30) == 0))
                v15 = "nx_tx_wait_closed";
            }
            else if ((v17 & 0x18) != 0)
            {
              v15 = "nx_tx_wait_flush";
            }
            else
            {
              v15 = v16;
            }
          }
          goto LABEL_36;
        }
      }
      else
      {
        if ((a3 & 2) != 0 || (*(_BYTE *)(v7 + 72) & 8) == 0)
        {
          v3 = 0;
          v44 = 0;
          v19 = MEMORY[0x24BDACB70];
          v13.i64[0] = 136316162;
          if (!v9)
            goto LABEL_42;
LABEL_40:
          if ((*(_BYTE *)(v9 + 24) & 1) != 0)
          {
            if (!(_DWORD)v3)
            {
              ++*(_DWORD *)(v9 + 28);
              *a2 = *(_QWORD *)(v9 + 16);
              if (v15)
              {
                v10 = v44;
                if (v44)
                {
                  if (strcmp(v15, "nx_tx_wait_frozen"))
                  {
                    memset(__tp, 170, 16);
                    clock_gettime(_CLOCK_UPTIME_RAW_APPROX, (timespec *)__tp);
                    v34 = 1000000 * (*(_QWORD *)__tp - v43) - v42 + *(_DWORD *)&__tp[8] / 1000;
                    *(_QWORD *)(v7 + 168) += v34;
                    if (v34 > 0xF4240
                      && nx_ratelimit_log_allowed(a1)
                      && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
                    {
                      v35 = *(_QWORD *)(a1 + 384) + 208;
                      v36 = *(_QWORD *)(v9 + 16);
                      *(_DWORD *)__tp = 136316418;
                      *(_QWORD *)&__tp[4] = "tx_enter_internal";
                      *(_WORD *)&__tp[12] = 1024;
                      *(_DWORD *)&__tp[14] = 2403;
                      v46 = 2080;
                      v47 = v35;
                      v48 = 2048;
                      v49 = v34;
                      v50 = 2048;
                      v51 = v36;
                      v52 = 2080;
                      v53 = v15;
                      _os_log_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s:%d: %s waited %lld us to open tx xid %lld (%s)\n", __tp, 0x3Au);
                    }
                    ++*(_QWORD *)(v7 + 160);
                  }
                  v10 = 1;
                }
              }
              else
              {
                v10 = v44;
              }
LABEL_94:
              ++*(_DWORD *)(v9 + 32);
              pthread_mutex_unlock((pthread_mutex_t *)v7);
              if (v10)
                spaceman_manage_free_queues((pthread_mutex_t **)a1, v9);
              return 0;
            }
LABEL_92:
            pthread_mutex_unlock((pthread_mutex_t *)v7);
            return v3;
          }
          while (1)
          {
            v24 = *(_DWORD *)(v9 + 24);
            if ((v24 & 1) == 0)
              break;
            do
            {
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
              {
                v32 = *(_QWORD *)(a1 + 384) + 208;
                v33 = *(_QWORD *)(v7 + 64);
                *(_DWORD *)__tp = 136315906;
                *(_QWORD *)&__tp[4] = "tx_enter_internal";
                *(_WORD *)&__tp[12] = 1024;
                *(_DWORD *)&__tp[14] = 2388;
                v46 = 2080;
                v47 = v32;
                v48 = 2048;
                v49 = v33;
                _os_log_debug_impl(&dword_21F566000, v19, OS_LOG_TYPE_DEBUG, "%s:%d: %s waiting for available tx to open: xid %lld\n", __tp, 0x26u);
              }
              cv_wait((pthread_cond_t *)(v7 + 256), (pthread_mutex_t *)v7, 8, (uint64_t)"nx_tx_wait_open", 0);
LABEL_67:
              v9 = *(_QWORD *)(v7 + 144);
              if (v9)
                goto LABEL_40;
LABEL_42:
              v20 = *(uint64_t **)(v7 + 112);
            }
            while (!v20);
            *(_QWORD *)(v7 + 144) = v20;
            v21 = *v20;
            v22 = (_QWORD *)v20[1];
            if (*v20)
            {
              *(_QWORD *)(v21 + 8) = v22;
              v22 = (_QWORD *)v20[1];
            }
            else
            {
              *(_QWORD *)(v7 + 120) = v22;
            }
            *v22 = v21;
            v23 = *(_QWORD *)(v7 + 64);
            *(_QWORD *)(v7 + 64) = v23 + 1;
            v9 = *(_QWORD *)(v7 + 144);
            *(_QWORD *)(v9 + 16) = v23;
            *(_QWORD *)(v9 + 24) = 0;
            *(_DWORD *)(v9 + 32) = 0;
            *(_DWORD *)(v9 + 52) = 0;
          }
          if (*(_BYTE *)(a1 + 626))
          {
            obj_checksum_set(a1, v13, v14);
            v3 = dev_write(*(_QWORD *)(a1 + 384), 0);
            if ((_DWORD)v3)
              goto LABEL_50;
            v29 = *(_BYTE **)(a1 + 376);
            if ((v29[65] & 1) != 0)
            {
              v30 = nx_fusion_superblock_write(a1, v29);
              if ((_DWORD)v30)
              {
                v3 = v30;
                if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
                {
                  v31 = *(_QWORD *)(a1 + 384) + 208;
                  *(_DWORD *)__tp = 136315906;
                  *(_QWORD *)&__tp[4] = "tx_enter_internal";
                  *(_WORD *)&__tp[12] = 1024;
                  *(_DWORD *)&__tp[14] = 2360;
                  v46 = 2080;
                  v47 = v31;
                  v48 = 1024;
                  LODWORD(v49) = v3;
                  _os_log_error_impl(&dword_21F566000, v19, OS_LOG_TYPE_ERROR, "%s:%d: %s failed to write superblock to fusion tier2 device block 0: %d\n", __tp, 0x22u);
                }
LABEL_50:
                if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
                {
                  v25 = *(_QWORD *)(a1 + 384) + 208;
                  v26 = *(_QWORD *)(*(_QWORD *)(v7 + 144) + 16);
                  *(_DWORD *)__tp = 136316162;
                  *(_QWORD *)&__tp[4] = "tx_enter_internal";
                  *(_WORD *)&__tp[12] = 1024;
                  *(_DWORD *)&__tp[14] = 2366;
                  v46 = 2080;
                  v47 = v25;
                  v48 = 2048;
                  v49 = v26;
                  v50 = 1024;
                  LODWORD(v51) = v3;
                  _os_log_error_impl(&dword_21F566000, v19, OS_LOG_TYPE_ERROR, "%s:%d: %s Error: tx[%lld] failed to unclean superblock: %d\n", __tp, 0x2Cu);
                }
LABEL_56:
                if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
                {
                  v27 = *(_QWORD *)(a1 + 384) + 208;
                  v28 = *(_QWORD *)(*(_QWORD *)(v7 + 144) + 16);
                  *(_DWORD *)__tp = 136316162;
                  *(_QWORD *)&__tp[4] = "tx_enter_internal";
                  *(_WORD *)&__tp[12] = 1024;
                  *(_DWORD *)&__tp[14] = 2370;
                  v46 = 2080;
                  v47 = v27;
                  v48 = 2048;
                  v49 = v28;
                  v50 = 1024;
                  LODWORD(v51) = v3;
                  _os_log_error_impl(&dword_21F566000, v19, OS_LOG_TYPE_ERROR, "%s:%d: %s Error: tx[%lld] failed to start: %d\n", __tp, 0x2Cu);
                }
                goto LABEL_67;
              }
            }
            *(_BYTE *)(a1 + 626) = 0;
            v9 = *(_QWORD *)(v7 + 144);
            v24 = *(_DWORD *)(v9 + 24);
            if ((v24 & 1) != 0)
              panic("bad transition tx flags 0x%x to 0x%x (expected 0x%x)\n", v24, 1, 0);
          }
          else if ((_DWORD)v3)
          {
            goto LABEL_56;
          }
          *(_DWORD *)(v9 + 24) = v24 | 1;
          memset(__tp, 170, 16);
          clock_gettime(_CLOCK_UPTIME_RAW_APPROX, (timespec *)__tp);
          *(_QWORD *)(v9 + 72) = 1000000 * *(_QWORD *)__tp + *(_DWORD *)&__tp[8] / 1000;
          if ((a3 & 2) != 0)
            *(_DWORD *)(*(_QWORD *)(v7 + 144) + 24) |= 0x10000u;
          cv_wakeup((pthread_cond_t *)(v7 + 256));
          v3 = 0;
          v44 = 1;
          goto LABEL_67;
        }
        if (*(_WORD *)(v7 + 80))
        {
LABEL_79:
          v37 = **(_QWORD **)(*(_QWORD *)(v7 + 136) + 8);
          if (v37)
          {
            if (*(_DWORD *)(v37 + 24) & 0x30)
            {
              v39 = 0;
            }
            else
            {
              v37 = *(_QWORD *)(v7 + 144);
              v39 = v9 == 0;
            }
            if (!v39)
            {
              v9 = v37;
              goto LABEL_88;
            }
          }
          else if (v9)
          {
LABEL_88:
            v40 = *(_DWORD *)(v9 + 52);
            if (v40)
              v3 = v40;
            else
              v3 = 5;
            goto LABEL_92;
          }
          v3 = 5;
          goto LABEL_92;
        }
      }
      if ((*(_DWORD *)(v7 + 72) & 8) != 0)
        v16 = "nx_tx_wait_frozen";
      else
        v16 = "nx_tx_wait";
      if (v9)
        goto LABEL_20;
      v15 = v16;
LABEL_36:
      cv_wait((pthread_cond_t *)(v7 + 256), (pthread_mutex_t *)v7, 8, (uint64_t)v15, 0);
      if ((*(_BYTE *)(v7 + 72) & 1) != 0)
        goto LABEL_37;
    }
  }
  v8 = *(_QWORD *)(v11 + 16);
  *a2 = v8;
  if (!v8)
    goto LABEL_15;
LABEL_6:
  v9 = *(_QWORD *)(v7 + 144);
  if (v9 && v8 == *(_QWORD *)(v9 + 16))
  {
    v10 = 0;
    ++*(_DWORD *)(v9 + 28);
    goto LABEL_94;
  }
  pthread_mutex_unlock((pthread_mutex_t *)v7);
  return 22;
}

__darwin_time_t tx_transition(uint64_t a1, int a2, int a3)
{
  int v4;
  int v5;
  __darwin_time_t v6;
  __darwin_time_t result;
  timespec __tp;

  if (a2)
  {
    v4 = *(_DWORD *)(a1 + 24);
    if ((v4 & a2) == 0)
      panic("can't transition from tx flags 0x%x to 0x%x (expected 0x%x)\n", v4, a3, a2);
  }
  if (a3)
  {
    v5 = *(_DWORD *)(a1 + 24);
    if ((v5 & a3) != 0)
      panic("bad transition tx flags 0x%x to 0x%x (expected 0x%x)\n", v5, a3, a2);
  }
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a1 + 24) & ~a2 | a3;
  __tp.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  __tp.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  clock_gettime(_CLOCK_UPTIME_RAW_APPROX, &__tp);
  v6 = 1000000 * __tp.tv_sec + SLODWORD(__tp.tv_nsec) / 1000;
  result = v6 - *(_QWORD *)(a1 + 72);
  *(_QWORD *)(a1 + 72) = v6;
  return result;
}

uint64_t tx_flush_initiate(uint64_t a1)
{
  uint64_t v2;
  int i;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  int v8;

  v2 = *(_QWORD *)(a1 + 400);
  for (i = *(_DWORD *)(v2 + 72); (i & 0x10) != 0; i = *(_DWORD *)(v2 + 72))
  {
    *(_DWORD *)(v2 + 72) = i | 0x20;
    cv_wait((pthread_cond_t *)(v2 + 256), (pthread_mutex_t *)v2, 8, (uint64_t)"nx_tx_flush_busy", 0);
  }
  *(_DWORD *)(v2 + 72) = i | 0x10;
  v4 = **(_QWORD **)(*(_QWORD *)(v2 + 136) + 8);
  if (!v4 || (v5 = *(_DWORD *)(v4 + 24), (v5 & 0x10) == 0))
  {
    v4 = *(_QWORD *)(v2 + 144);
    if (!v4)
      goto LABEL_9;
    v5 = *(_DWORD *)(v4 + 24);
  }
  if ((v5 & 0x14) == 0 || (v6 = tx_flush(a1, v4), !(_DWORD)v6))
  {
LABEL_9:
    v7 = *(_QWORD *)(v2 + 144);
    if (v7 && (*(_BYTE *)(v7 + 24) & 4) != 0)
      v6 = tx_flush(a1, v7);
    else
      v6 = 0;
  }
  v8 = *(_DWORD *)(v2 + 72);
  *(_DWORD *)(v2 + 72) = v8 & 0xFFFFFFCF;
  if ((v8 & 0x20) != 0)
    cv_wakeup((pthread_cond_t *)(v2 + 256));
  return v6;
}

uint64_t tx_enter(uint64_t a1, uint64_t *a2)
{
  return tx_enter_internal(a1, a2, 0);
}

uint64_t tx_enter_frozen(uint64_t a1, uint64_t *a2)
{
  return tx_enter_internal(a1, a2, 2);
}

uint64_t tx_leave(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  _BOOL4 v10;
  int v11;
  int v12;
  int v13;
  int v14;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int started;
  _BYTE __tp[18];
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  unint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (!*(_BYTE *)(a1 + 627))
  {
    v7 = *(_QWORD *)(a1 + 400);
    pthread_mutex_lock((pthread_mutex_t *)v7);
    v8 = *(_QWORD *)(v7 + 144);
    if ((*(_BYTE *)(v8 + 24) & 1) == 0)
      goto LABEL_22;
    if ((a3 & 4) != 0)
    {
      v9 = 0;
      ++*(_QWORD *)(v7 + 176);
    }
    else
    {
      if (*(_DWORD *)(v8 + 32) <= 0x186A0u && !obj_cache_tx_start_closing(*(_QWORD *)(a1 + 392)))
      {
        started = spaceman_tx_start_closing((pthread_mutex_t **)a1);
        v9 = started == 0;
        v10 = started != 0;
LABEL_10:
        if ((*(_BYTE *)(v7 + 72) & 0x40) != 0)
        {
          if (!v9)
            *(_DWORD *)(v8 + 24) |= 0x100000u;
        }
        else
        {
          v11 = *(_DWORD *)(v8 + 24);
          if ((v11 & 0x100000) != 0)
          {
            v11 &= ~0x100000u;
            *(_DWORD *)(v8 + 24) = v11;
          }
          else if (!v10)
          {
            goto LABEL_22;
          }
          if ((v11 & 1) == 0)
            panic("can't transition from tx flags 0x%x to 0x%x (expected 0x%x)\n", v11, 2, 1);
          if ((v11 & 2) != 0)
            panic("bad transition tx flags 0x%x to 0x%x (expected 0x%x)\n", v11, 2, 1);
          *(_DWORD *)(v8 + 24) = v11 & 0xFFFFFFFC | 2;
          memset(__tp, 170, 16);
          clock_gettime(_CLOCK_UPTIME_RAW_APPROX, (timespec *)__tp);
          *(_QWORD *)(v8 + 72) = 1000000 * *(_QWORD *)__tp + *(_DWORD *)&__tp[8] / 1000;
        }
LABEL_22:
        if ((~a3 & 5) != 0)
        {
          if ((a3 & 0x10) != 0)
          {
LABEL_24:
            *(_DWORD *)(v8 + 24) |= 0x40000u;
            if ((a3 & 0x20) == 0)
              goto LABEL_29;
            goto LABEL_28;
          }
        }
        else
        {
          *(_DWORD *)(v8 + 24) |= 0x20000u;
          if ((a3 & 0x10) != 0)
            goto LABEL_24;
        }
        if ((a3 & 0x20) == 0)
        {
LABEL_29:
          v12 = *(_DWORD *)(v8 + 28) - 1;
          *(_DWORD *)(v8 + 28) = v12;
          if (!v12 && (v13 = *(_DWORD *)(v8 + 24), (v13 & 2) != 0))
          {
            if ((v13 & 4) != 0)
              panic("bad transition tx flags 0x%x to 0x%x (expected 0x%x)\n", v13, 4, 2);
            *(_DWORD *)(v8 + 24) = v13 & 0xFFFFFFF9 | 4;
            memset(__tp, 170, 16);
            clock_gettime(_CLOCK_UPTIME_RAW_APPROX, (timespec *)__tp);
            v16 = 1000000 * *(_QWORD *)__tp + *(_DWORD *)&__tp[8] / 1000;
            v17 = v16 - *(_QWORD *)(v8 + 72);
            *(_QWORD *)(v8 + 72) = v16;
            if (v17 > 0xF4240 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
            {
              v18 = *(_QWORD *)(a1 + 384) + 208;
              v19 = *(_QWORD *)(v8 + 16);
              *(_DWORD *)__tp = 136316162;
              *(_QWORD *)&__tp[4] = "tx_leave";
              *(_WORD *)&__tp[12] = 1024;
              *(_DWORD *)&__tp[14] = 2534;
              v22 = 2080;
              v23 = v18;
              v24 = 2048;
              v25 = v19;
              v26 = 2048;
              v27 = v17;
              _os_log_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s:%d: %s tx xid %lld took %lld us to close\n", __tp, 0x30u);
            }
            *(_QWORD *)(v7 + 248) = (*(_QWORD *)(v7 + 248) + v17) >> 1;
            v3 = tx_flush_initiate(a1);
            if ((a3 & 1) == 0)
              goto LABEL_41;
          }
          else
          {
            v3 = 0;
            if ((a3 & 1) == 0)
            {
LABEL_41:
              pthread_mutex_unlock((pthread_mutex_t *)v7);
              return v3;
            }
          }
          if ((a3 & 4) != 0)
            v14 = 127;
          else
            v14 = 63;
          do
          {
            if (*(_QWORD *)(v8 + 16) != a2 || (*(_DWORD *)(v8 + 24) & v14) == 0)
              break;
            if (!(_DWORD)v3)
              cv_wait((pthread_cond_t *)(v7 + 256), (pthread_mutex_t *)v7, 8, (uint64_t)"nx_tx_finish_wait", 0);
          }
          while (!*(_DWORD *)(v7 + 76));
          v3 = *(unsigned int *)(v8 + 52);
          goto LABEL_41;
        }
LABEL_28:
        *(_DWORD *)(v8 + 24) |= 0x80000u;
        goto LABEL_29;
      }
      v9 = 0;
    }
    v10 = 1;
    goto LABEL_10;
  }
  return 30;
}

uint64_t tx_is_closing(uint64_t a1)
{
  return (*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 400) + 144) + 24) >> 1) & 1;
}

uint64_t tx_flush(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t i;
  int v20;
  pthread_cond_t *v21;
  int v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  int v28;
  uint64_t *v29;
  uint64_t v30;
  int8x16_t v31;
  int8x16_t v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  int v48;
  int v49;
  unsigned int v50;
  uint64_t v51;
  int v52;
  _DWORD *v53;
  int v54;
  int v55;
  _DWORD *v57;
  int v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  int v64;
  uint64_t v65;
  uint64_t v66;
  int v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unsigned int v71;
  uint64_t v72;
  int v73;
  int v74;
  uint64_t v75;
  int8x16_t v76;
  int8x16_t v77;
  uint64_t v78;
  uint64_t v79;
  int v80;
  int v81;
  unsigned int v82;
  unsigned int v83;
  unsigned int v84;
  unsigned int v85;
  unsigned int v86;
  unsigned int v87;
  _BOOL4 v88;
  int v89;
  _BOOL4 v90;
  uint64_t v91;
  int v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  int v98;
  uint64_t v99;
  int v100;
  uint64_t v101;
  int64x2_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  unint64_t v106;
  unint64_t v107;
  unint64_t v108;
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
  int v121;
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
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  int v139;
  int v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  unsigned int v147;
  unsigned int v148;
  unint64_t v149;
  _BYTE __tp[18];
  __int16 v151;
  uint64_t v152;
  __int16 v153;
  uint64_t v154;
  __int16 v155;
  _BYTE v156[10];
  _BYTE v157[10];
  unint64_t v158;
  __int16 v159;
  uint64_t v160;
  __int16 v161;
  uint64_t v162;
  __int16 v163;
  uint64_t v164;
  __int16 v165;
  uint64_t v166;
  __int16 v167;
  uint64_t v168;
  __int16 v169;
  uint64_t v170;
  __int16 v171;
  uint64_t v172;
  __int16 v173;
  uint64_t v174;
  __int16 v175;
  uint64_t v176;
  __int16 v177;
  uint64_t v178;
  uint64_t v179;

  v179 = *MEMORY[0x24BDAC8D0];
  v5 = *(_QWORD *)(a1 + 392);
  v4 = *(_QWORD *)(a1 + 400);
  v149 = 0xAAAAAAAAAAAAAAAALL;
  v6 = **(_QWORD **)(*(_QWORD *)(v4 + 136) + 8);
  if (v6 && (*(_BYTE *)(v6 + 24) & 0x10) != 0)
  {
    if (v6 != a2)
      panic("not handling the flushing tx!\n");
  }
  else
  {
    if (*(_QWORD *)(v4 + 144) != a2)
      panic("not handling the current tx!\n");
    if ((*(_BYTE *)(a2 + 24) & 0x14) == 0)
      panic("current tx not closed/flushing?!\n");
  }
  v7 = *(_DWORD *)(a2 + 24);
  if ((v7 & 0x10) != 0)
  {
LABEL_47:
    if (*(_BYTE *)(a1 + 629))
    {
      v28 = *(_DWORD *)(a2 + 24);
      if ((v28 & 0x10) == 0)
        panic("can't transition from tx flags 0x%x to 0x%x (expected 0x%x)\n", v28, 1, 16);
      if ((v28 & 1) != 0)
        panic("bad transition tx flags 0x%x to 0x%x (expected 0x%x)\n", v28, 1, 16);
      *(_DWORD *)(a2 + 24) = v28 & 0xFFFFFFEE | 1;
      memset(__tp, 170, 16);
      clock_gettime(_CLOCK_UPTIME_RAW_APPROX, (timespec *)__tp);
      *(_QWORD *)(a2 + 72) = 1000000 * *(_QWORD *)__tp + *(_DWORD *)&__tp[8] / 1000;
      *(_DWORD *)(a2 + 32) = 0;
      *(_DWORD *)(a2 + 52) = 0;
    }
    else if (*(_QWORD *)(v4 + 144) == a2)
    {
      *(_QWORD *)a2 = 0;
      v29 = *(uint64_t **)(v4 + 136);
      *(_QWORD *)(a2 + 8) = v29;
      *v29 = a2;
      *(_QWORD *)(v4 + 136) = a2;
      *(_QWORD *)(v4 + 144) = 0;
    }
    pthread_mutex_unlock((pthread_mutex_t *)v4);
    cv_wakeup((pthread_cond_t *)(v4 + 256));
    v30 = obj_cache_flush_write((pthread_mutex_t *)v5, 2 * (*(_BYTE *)(a1 + 629) == 0));
    if (*(_BYTE *)(a1 + 629))
    {
      pthread_mutex_lock((pthread_mutex_t *)v4);
      obj_cache_flush_unprepare(v5);
      tx_barrier_internal(a1, 0, 0);
      cv_wakeup((pthread_cond_t *)(v4 + 256));
      v14 = 0;
      *(_DWORD *)(a2 + 52) = 0;
      return v14;
    }
    v14 = v30;
    if ((_DWORD)v30)
    {
      pthread_mutex_lock((pthread_mutex_t *)v4);
      if (!*(_DWORD *)(v4 + 76) && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        tx_flush_cold_5();
      v33 = 1111;
      goto LABEL_79;
    }
    while (1)
    {
      v35 = *(_QWORD *)(v5 + 848);
      if (!v35)
        break;
      v34 = tx_checkpoint_write((_QWORD *)a1, a2, *(_QWORD *)(v5 + 848), v31, v32);
      if ((_DWORD)v34)
      {
        v14 = v34;
        pthread_mutex_lock((pthread_mutex_t *)v4);
        if (!*(_DWORD *)(v4 + 76) && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          v125 = *(_QWORD *)(a1 + 384) + 208;
          v126 = *(_QWORD *)(a2 + 16);
          v127 = *(_QWORD *)(v35 + 128);
          *(_DWORD *)__tp = 136316418;
          *(_QWORD *)&__tp[4] = "tx_flush";
          *(_WORD *)&__tp[12] = 1024;
          *(_DWORD *)&__tp[14] = 1125;
          v151 = 2080;
          v152 = v125;
          v153 = 2048;
          v154 = v126;
          v155 = 2048;
          *(_QWORD *)v156 = v127;
          *(_WORD *)&v156[8] = 1024;
          *(_DWORD *)v157 = v14;
          _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: %s xid %lld failed to write checkpoint data @ 0x%llx: %d\n", __tp, 0x36u);
        }
        v33 = 1127;
        goto LABEL_79;
      }
      obj_checkpoint_done((unsigned int *)v35);
      obj_release((uint64_t *)v35);
    }
    v36 = *(_QWORD *)(a2 + 64);
    *(_DWORD *)(v36 + 32) |= 1u;
    obj_checksum_set_phys(a1, v36, *(_DWORD *)(*(_QWORD *)(a1 + 376) + 36), v31, v32);
    v37 = (uint64_t *)(a1 + 384);
    v38 = dev_write(*(_QWORD *)(a1 + 384), *(_QWORD *)(*(_QWORD *)(a2 + 64) + 8));
    if ((_DWORD)v38)
    {
      v14 = v38;
      pthread_mutex_lock((pthread_mutex_t *)v4);
      if (!*(_DWORD *)(v4 + 76) && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        v122 = *v37 + 208;
        v123 = *(_QWORD *)(a2 + 16);
        v124 = *(_QWORD *)(*(_QWORD *)(a2 + 64) + 8);
        *(_DWORD *)__tp = 136316418;
        *(_QWORD *)&__tp[4] = "tx_flush";
        *(_WORD *)&__tp[12] = 1024;
        *(_DWORD *)&__tp[14] = 1144;
        v151 = 2080;
        v152 = v122;
        v153 = 2048;
        v154 = v123;
        v155 = 2048;
        *(_QWORD *)v156 = v124;
        *(_WORD *)&v156[8] = 1024;
        *(_DWORD *)v157 = v14;
        _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: %s xid %lld failed to write last checkpoint map block %lld: %d\n", __tp, 0x36u);
      }
      v33 = 1146;
LABEL_79:
      *(_DWORD *)(v4 + 76) = v33;
      ++*(_WORD *)(v4 + 80);
LABEL_80:
      v21 = (pthread_cond_t *)(v4 + 256);
      goto LABEL_81;
    }
    ++*(_DWORD *)(a2 + 40);
    pthread_mutex_lock((pthread_mutex_t *)v4);
    v52 = *(_DWORD *)(a2 + 40);
    v53 = *(_DWORD **)(a2 + 56);
    v54 = *(_DWORD *)(a2 + 48);
    v55 = v53[37];
    if (v52 != v53[35] || v54 != v55)
      panic("flush phase checkpoint lengths (%d %d) don't match prepare phase (%d %d)\n", v52, v54, v53[35], v55);
    v57 = *(_DWORD **)(a1 + 376);
    v57[34] = v53[34];
    v57[35] = v52;
    v57[36] = v53[36];
    v57[37] = v54;
    v58 = *(_DWORD *)(a2 + 24);
    if ((v58 & 0x10) == 0)
      panic("can't transition from tx flags 0x%x to 0x%x (expected 0x%x)\n", v58, 32, 16);
    if ((v58 & 0x20) != 0)
      panic("bad transition tx flags 0x%x to 0x%x (expected 0x%x)\n", v58, 32, 16);
    *(_DWORD *)(a2 + 24) = v58 & 0xFFFFFFCF | 0x20;
    memset(__tp, 170, 16);
    clock_gettime(_CLOCK_UPTIME_RAW_APPROX, (timespec *)__tp);
    v59 = 1000000 * *(_QWORD *)__tp + *(_DWORD *)&__tp[8] / 1000;
    v60 = v59 - *(_QWORD *)(a2 + 72);
    *(_QWORD *)(a2 + 72) = v59;
    if (v60 > 0xF4240 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v61 = *v37 + 208;
      v62 = *(_QWORD *)(a2 + 16);
      *(_DWORD *)__tp = 136316162;
      *(_QWORD *)&__tp[4] = "tx_flush";
      *(_WORD *)&__tp[12] = 1024;
      *(_DWORD *)&__tp[14] = 1173;
      v151 = 2080;
      v152 = v61;
      v153 = 2048;
      v154 = v62;
      v155 = 2048;
      *(_QWORD *)v156 = v60;
      _os_log_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s:%d: %s tx xid %lld took %lld us to flush\n", __tp, 0x30u);
    }
    *(_QWORD *)(a2 + 104) = v60;
    cv_wakeup((pthread_cond_t *)(v4 + 256));
    v63 = tx_barrier_internal(a1, 0, 1);
    if ((_DWORD)v63)
    {
      v14 = v63;
      if (!*(_DWORD *)(v4 + 76) && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        tx_flush_cold_4();
      v64 = 1184;
      goto LABEL_123;
    }
    pthread_mutex_unlock((pthread_mutex_t *)v4);
    if (*(_BYTE *)(a1 + 632))
    {
      *(_DWORD *)(a2 + 24) |= 0x80000u;
      bzero(*(void **)(a2 + 64), *(unsigned int *)(*(_QWORD *)(a1 + 376) + 36));
    }
    v65 = dev_write(*v37, *(_QWORD *)(a2 + 112));
    if ((_DWORD)v65)
    {
      v14 = v65;
      pthread_mutex_lock((pthread_mutex_t *)v4);
      if (!*(_DWORD *)(v4 + 76) && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        v129 = *v37 + 208;
        v130 = *(_QWORD *)(a2 + 16);
        v131 = *(_QWORD *)(a2 + 112);
        *(_DWORD *)__tp = 136316418;
        *(_QWORD *)&__tp[4] = "tx_flush";
        *(_WORD *)&__tp[12] = 1024;
        *(_DWORD *)&__tp[14] = 1211;
        v151 = 2080;
        v152 = v129;
        v153 = 2048;
        v154 = v130;
        v155 = 2048;
        *(_QWORD *)v156 = v131;
        *(_WORD *)&v156[8] = 1024;
        *(_DWORD *)v157 = v14;
        _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: %s xid %lld failed to write checkpoint superblock %lld: %d\n", __tp, 0x36u);
      }
      v64 = 1213;
      goto LABEL_123;
    }
    if ((*(_BYTE *)(a2 + 26) & 8) == 0)
    {
LABEL_126:
      pthread_mutex_lock((pthread_mutex_t *)v4);
      v68 = tx_transition(a2, 32, 64);
      if (v68 > 0xF4240 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v69 = *v37 + 208;
        v70 = *(_QWORD *)(a2 + 16);
        *(_DWORD *)__tp = 136316162;
        *(_QWORD *)&__tp[4] = "tx_flush";
        *(_WORD *)&__tp[12] = 1024;
        *(_DWORD *)&__tp[14] = 1274;
        v151 = 2080;
        v152 = v69;
        v153 = 2048;
        v154 = v70;
        v155 = 2048;
        *(_QWORD *)v156 = v68;
        _os_log_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s:%d: %s tx xid %lld took %lld us to sync and write superblock\n", __tp, 0x30u);
      }
      *(_QWORD *)(a2 + 104) += v68;
      v71 = *(_DWORD *)(a2 + 24);
      if ((v71 & 0x20000) == 0)
        goto LABEL_166;
      ++*(_QWORD *)(v4 + 184);
      if ((v71 & 0x40000) != 0)
        ++*(_QWORD *)(v4 + 192);
      v72 = tx_barrier_internal(a1, (v71 >> 14) & 0x10, 0);
      if (!(_DWORD)v72)
      {
LABEL_166:
        *(_DWORD *)(a2 + 52) = 0;
        *(_DWORD *)(v4 + 72) |= 2u;
        *(_QWORD *)(v4 + 76) = 0;
        v97 = *(_QWORD *)(a2 + 56);
        v98 = *(_DWORD *)(v97 + 128);
        v99 = *(_QWORD *)(a1 + 376);
        *(_DWORD *)(v99 + 128) = v98;
        *(_DWORD *)(v4 + 96) = v98;
        v100 = *(_DWORD *)(v97 + 132);
        *(_DWORD *)(v99 + 132) = v100;
        *(_DWORD *)(v4 + 100) = v100;
        *(_QWORD *)(v99 + 16) = *(_QWORD *)(v97 + 16);
        v101 = *(_QWORD *)(v4 + 152);
        *(_QWORD *)(v4 + 152) = v101 + 1;
        if (v101)
        {
          v102.i64[0] = *(unsigned int *)(a2 + 32);
          v102.i64[1] = *(_QWORD *)(a2 + 80);
          *(uint64x2_t *)(v4 + 200) = vshrq_n_u64((uint64x2_t)vaddq_s64(*(int64x2_t *)(v4 + 200), v102), 1uLL);
          *(uint64x2_t *)(v4 + 216) = vshrq_n_u64((uint64x2_t)vaddq_s64(*(int64x2_t *)(a2 + 88), *(int64x2_t *)(v4 + 216)), 1uLL);
          *(_QWORD *)(v4 + 240) = (*(_QWORD *)(a2 + 104) + *(_QWORD *)(v4 + 240)) >> 1;
          if (__ROR8__(0xCCCCCCCCCCCCCCCDLL * (v101 + 1), 2) <= 0xCCCCCCCCCCCCCCCuLL
            && nx_ratelimit_log_allowed(a1)
            && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
          {
            v103 = *v37 + 208;
            v104 = *(_QWORD *)(a2 + 16);
            v105 = *(_QWORD *)(v4 + 152);
            v106 = *(_QWORD *)(v4 + 160);
            if (v106 <= 1)
              v107 = 1;
            else
              v107 = *(_QWORD *)(v4 + 160);
            v108 = *(_QWORD *)(v4 + 168);
            v109 = *(_QWORD *)(v4 + 176);
            v110 = *(_QWORD *)(v4 + 184);
            v111 = *(_QWORD *)(v4 + 192);
            v112 = *(_QWORD *)(v4 + 216);
            v113 = *(_QWORD *)(v4 + 224);
            v114 = *(_QWORD *)(v4 + 200);
            v115 = *(_QWORD *)(v4 + 208);
            v117 = *(_QWORD *)(v4 + 240);
            v116 = *(_QWORD *)(v4 + 248);
            *(_QWORD *)&__tp[4] = "tx_flush";
            *(_WORD *)&__tp[12] = 1024;
            *(_DWORD *)&__tp[14] = 1338;
            v151 = 2080;
            v118 = *(_QWORD *)(v4 + 232);
            *(_DWORD *)__tp = 136319234;
            v152 = v103;
            v153 = 2048;
            v154 = v104;
            v155 = 2048;
            *(_QWORD *)v156 = v105;
            *(_WORD *)&v156[8] = 2048;
            *(_QWORD *)v157 = v106;
            *(_WORD *)&v157[8] = 2048;
            v158 = v108 / v107;
            v159 = 2048;
            v160 = v109;
            v161 = 2048;
            v162 = v110;
            v163 = 2048;
            v164 = v111;
            v165 = 2048;
            v166 = v114;
            v167 = 2048;
            v168 = v112;
            v169 = 2048;
            v170 = v113;
            v171 = 2048;
            v172 = v115;
            v173 = 2048;
            v174 = v116;
            v175 = 2048;
            v176 = v118;
            v177 = 2048;
            v178 = v117;
            _os_log_debug_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%s:%d: %s xid %llu tx stats: # %llu owait %llu %lluus finish %llu bar2 %lld f %lld enter %llu fq %llu %llu %lluus close %lluus prep %lluus flush %lluus\n", __tp, 0xA8u);
          }
        }
        else
        {
          *(_QWORD *)(v4 + 200) = *(unsigned int *)(a2 + 32);
          *(_OWORD *)(v4 + 208) = *(_OWORD *)(a2 + 80);
          *(_QWORD *)(v4 + 224) = *(_QWORD *)(a2 + 96);
          *(_QWORD *)(v4 + 240) = *(_QWORD *)(a2 + 104);
        }
        cv_wakeup((pthread_cond_t *)(v4 + 256));
        return 0;
      }
      v14 = v72;
      if (!*(_DWORD *)(v4 + 76) && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        tx_flush_cold_1();
      *(_DWORD *)(v4 + 76) = 1288;
      ++*(_WORD *)(v4 + 80);
      --*(_DWORD *)(a2 + 40);
      v66 = a2;
      v67 = 64;
LABEL_124:
      *(_QWORD *)(a2 + 104) += tx_transition(v66, v67, 16);
      goto LABEL_80;
    }
    v96 = dev_write(*v37, 0);
    if ((_DWORD)v96)
    {
      v14 = v96;
      if (!*(_DWORD *)(v4 + 76) && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        tx_flush_cold_3();
    }
    else
    {
      if ((*(_BYTE *)(*(_QWORD *)(a1 + 376) + 65) & 1) == 0)
        goto LABEL_126;
      v128 = nx_fusion_superblock_write(a1, *(const void **)(a2 + 56));
      if (!(_DWORD)v128)
        goto LABEL_126;
      v14 = v128;
      if (!*(_DWORD *)(v4 + 76) && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        tx_flush_cold_2();
    }
    pthread_mutex_lock((pthread_mutex_t *)v4);
    v64 = 1248;
LABEL_123:
    *(_DWORD *)(v4 + 76) = v64;
    ++*(_WORD *)(v4 + 80);
    --*(_DWORD *)(a2 + 40);
    v66 = a2;
    v67 = 32;
    goto LABEL_124;
  }
  if ((v7 & 4) == 0)
    panic("can't transition from tx flags 0x%x to 0x%x (expected 0x%x)\n", v7, 8, 4);
  if ((v7 & 8) != 0)
    panic("bad transition tx flags 0x%x to 0x%x (expected 0x%x)\n", v7, 8, 4);
  *(_DWORD *)(a2 + 24) = v7 & 0xFFFFFFF3 | 8;
  memset(__tp, 170, 16);
  clock_gettime(_CLOCK_UPTIME_RAW_APPROX, (timespec *)__tp);
  v8 = 1000000 * *(_QWORD *)__tp + *(_DWORD *)&__tp[8] / 1000;
  v9 = v8 - *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a2 + 72) = v8;
  if (v9 > 0xF4240 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(a1 + 384) + 208;
    v11 = *(_QWORD *)(a2 + 16);
    *(_DWORD *)__tp = 136316162;
    *(_QWORD *)&__tp[4] = "tx_flush";
    *(_WORD *)&__tp[12] = 1024;
    *(_DWORD *)&__tp[14] = 853;
    v151 = 2080;
    v152 = v10;
    v153 = 2048;
    v154 = v11;
    v155 = 2048;
    *(_QWORD *)v156 = v9;
    _os_log_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s:%d: %s tx xid %lld was closed for %lld us waiting to prepare to flush\n", __tp, 0x30u);
  }
  v12 = (uint64_t *)(a2 + 16);
  v13 = obj_cache_flush_prepare(v5, 0, 2 * (*(_BYTE *)(a1 + 629) == 0), *(_QWORD *)(a2 + 16));
  if ((_DWORD)v13)
  {
    v14 = v13;
    if (!*(_DWORD *)(v4 + 76) && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      tx_flush_cold_6();
    v15 = 861;
    goto LABEL_22;
  }
  if (*(_BYTE *)(a1 + 629))
  {
    v22 = *(_DWORD *)(a2 + 24);
    if ((v22 & 8) == 0)
      panic("can't transition from tx flags 0x%x to 0x%x (expected 0x%x)\n", v22, 16, 8);
    if ((v22 & 0x10) != 0)
      panic("bad transition tx flags 0x%x to 0x%x (expected 0x%x)\n", v22, 16, 8);
    *(_DWORD *)(a2 + 24) = v22 & 0xFFFFFFE7 | 0x10;
    memset(__tp, 170, 16);
    clock_gettime(_CLOCK_UPTIME_RAW_APPROX, (timespec *)__tp);
    v23 = 1000000 * *(_QWORD *)__tp + *(_DWORD *)&__tp[8] / 1000;
    v24 = v23 - *(_QWORD *)(a2 + 72);
    *(_QWORD *)(a2 + 72) = v23;
    if (v24 <= 0xF4240 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_46;
    v25 = *(_QWORD *)(a1 + 384) + 208;
    v26 = *v12;
    *(_DWORD *)__tp = 136316162;
    *(_QWORD *)&__tp[4] = "tx_flush";
    *(_WORD *)&__tp[12] = 1024;
    *(_DWORD *)&__tp[14] = 871;
    v151 = 2080;
    v152 = v25;
    v153 = 2048;
    v154 = v26;
    v155 = 2048;
    *(_QWORD *)v156 = v24;
    v27 = MEMORY[0x24BDACB70];
LABEL_45:
    _os_log_impl(&dword_21F566000, v27, OS_LOG_TYPE_DEFAULT, "%s:%d: %s tx xid %lld took %lld us to prepare to flush\n", __tp, 0x30u);
LABEL_46:
    *(_QWORD *)(v4 + 232) = (*(_QWORD *)(v4 + 232) + v24) >> 1;
    goto LABEL_47;
  }
  *(_DWORD *)(a2 + 36) = *(_DWORD *)(v4 + 96);
  *(_DWORD *)(a2 + 44) = *(_DWORD *)(v4 + 100);
  *(_DWORD *)(a2 + 48) = 0;
  *(_DWORD *)(a2 + 40) = 0;
  v149 = -1;
  v39 = nx_checkpoint_desc_block_address(a1, *(unsigned int *)(*(_QWORD *)(a1 + 376) + 128), &v149);
  if ((_DWORD)v39)
  {
    v14 = v39;
    if (!*(_DWORD *)(v4 + 76) && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v119 = *(_QWORD *)(a1 + 384) + 208;
      v120 = *v12;
      v121 = *(_DWORD *)(*(_QWORD *)(a1 + 376) + 128);
      *(_DWORD *)__tp = 136316418;
      *(_QWORD *)&__tp[4] = "tx_flush";
      *(_WORD *)&__tp[12] = 1024;
      *(_DWORD *)&__tp[14] = 891;
      v151 = 2080;
      v152 = v119;
      v153 = 2048;
      v154 = v120;
      v155 = 1024;
      *(_DWORD *)v156 = v121;
      *(_WORD *)&v156[4] = 1024;
      *(_DWORD *)&v156[6] = v14;
      _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: %s xid %lld error getting first checkpoint map block address %d: %d\n", __tp, 0x32u);
    }
    v15 = 893;
    goto LABEL_22;
  }
  bzero(*(void **)(a2 + 64), *(unsigned int *)(*(_QWORD *)(a1 + 376) + 36));
  v41 = *(_QWORD *)(a2 + 64);
  *(_DWORD *)(v41 + 24) = 1073741836;
  *(_QWORD *)(v41 + 8) = v149;
  *(_QWORD *)(v41 + 16) = *(_QWORD *)(a2 + 16);
  ++*(_DWORD *)(a2 + 40);
  v14 = nx_checkpoint_traverse(a1, a2, 1);
  if ((_DWORD)v14)
    goto LABEL_23;
  v42 = *(_QWORD *)(v5 + 736);
  if (!v42)
  {
LABEL_94:
    v49 = *(_DWORD *)(v4 + 96);
    *(_QWORD *)(a2 + 112) = -1;
    v50 = (*(_DWORD *)(a2 + 40) + v49) % *(_DWORD *)(v4 + 88);
    v51 = nx_checkpoint_desc_block_address(a1, v50, (_QWORD *)(a2 + 112));
    if ((_DWORD)v51)
    {
      v14 = v51;
      if (!*(_DWORD *)(v4 + 76) && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        v132 = *(_QWORD *)(a1 + 384) + 208;
        v133 = *v12;
        *(_DWORD *)__tp = 136316418;
        *(_QWORD *)&__tp[4] = "tx_flush";
        *(_WORD *)&__tp[12] = 1024;
        *(_DWORD *)&__tp[14] = 940;
        v151 = 2080;
        v152 = v132;
        v153 = 2048;
        v154 = v133;
        v155 = 1024;
        *(_DWORD *)v156 = v50;
        *(_WORD *)&v156[4] = 1024;
        *(_DWORD *)&v156[6] = v14;
        _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: %s xid %lld error getting next checkpoint superblock address %d: %d\n", __tp, 0x32u);
      }
      v15 = 942;
      goto LABEL_22;
    }
    ++*(_DWORD *)(a2 + 40);
    v73 = *(_DWORD *)(a2 + 48);
    v74 = *(_DWORD *)(v5 + 900) - 1;
    if (v73 != v74 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v134 = *(_QWORD *)(a1 + 384) + 208;
      v135 = *v12;
      *(_DWORD *)__tp = 136316418;
      *(_QWORD *)&__tp[4] = "tx_flush";
      *(_WORD *)&__tp[12] = 1024;
      *(_DWORD *)&__tp[14] = 981;
      v151 = 2080;
      v152 = v134;
      v153 = 2048;
      v154 = v135;
      v155 = 1024;
      *(_DWORD *)v156 = v73;
      *(_WORD *)&v156[4] = 1024;
      *(_DWORD *)&v156[6] = v74;
      _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: %s xid %lld checkpoint data block count is not value tracked by cache: %d != %d\n", __tp, 0x32u);
    }
    v75 = *(_QWORD *)(a1 + 376);
    *(_QWORD *)(v75 + 88) = *(_QWORD *)(v5 + 400);
    *(_QWORD *)(v75 + 96) = *(_QWORD *)(v4 + 64);
    memcpy(*(void **)(a2 + 56), (const void *)v75, *(unsigned int *)(v75 + 36));
    v78 = *(_QWORD *)(a2 + 16);
    v79 = *(_QWORD *)(a2 + 56);
    *(_QWORD *)(v79 + 16) = v78;
    v80 = *(_DWORD *)(v4 + 96);
    *(_DWORD *)(v79 + 136) = v80;
    v81 = *(_DWORD *)(v4 + 100);
    *(_DWORD *)(v79 + 144) = v81;
    v82 = *(_DWORD *)(a2 + 40);
    *(_DWORD *)(v79 + 140) = v82;
    v83 = *(_DWORD *)(a2 + 48);
    *(_DWORD *)(v79 + 148) = v83;
    v85 = *(_DWORD *)(v4 + 88);
    v84 = *(_DWORD *)(v4 + 92);
    v86 = (v82 + v80) % v85;
    v87 = (v83 + v81) % v84;
    if (!*(_DWORD *)(v4 + 76))
    {
      v147 = (v83 + v81) % v84;
      v148 = v86;
      if (v82 > v85 >> 2)
      {
        v146 = v78;
        v88 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        v87 = v147;
        v86 = v148;
        if (v88)
        {
          v141 = *(_QWORD *)(a1 + 384) + 208;
          *(_DWORD *)__tp = 136316418;
          *(_QWORD *)&__tp[4] = "tx_flush";
          *(_WORD *)&__tp[12] = 1024;
          *(_DWORD *)&__tp[14] = 1006;
          v151 = 2080;
          v152 = v141;
          v153 = 2048;
          v154 = v146;
          v155 = 1024;
          *(_DWORD *)v156 = v82;
          *(_WORD *)&v156[4] = 1024;
          *(_DWORD *)&v156[6] = v85 >> 2;
          _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: %s xid %lld checkpoint descriptor count is larger than expected: %d > %d\n", __tp, 0x32u);
          v87 = v147;
          v86 = v148;
          v83 = *(_DWORD *)(a2 + 48);
          v84 = *(_DWORD *)(v4 + 92);
        }
      }
      if (v83 > v84 >> 2)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          v142 = *(_QWORD *)(a1 + 384) + 208;
          v143 = *(_QWORD *)(a2 + 16);
          *(_DWORD *)__tp = 136316418;
          *(_QWORD *)&__tp[4] = "tx_flush";
          *(_WORD *)&__tp[12] = 1024;
          *(_DWORD *)&__tp[14] = 1010;
          v151 = 2080;
          v152 = v142;
          v153 = 2048;
          v154 = v143;
          v155 = 1024;
          *(_DWORD *)v156 = v83;
          *(_WORD *)&v156[4] = 1024;
          *(_DWORD *)&v156[6] = v84 >> 2;
          _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: %s xid %lld checkpoint data block count is larger than expected: %d > %d\n", __tp, 0x32u);
          v83 = *(_DWORD *)(a2 + 48);
        }
        v87 = v147;
        v86 = v148;
      }
      v89 = *(_DWORD *)(v5 + 900) - 1;
      if (v83 != v89)
      {
        v90 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        v87 = v147;
        v86 = v148;
        if (v90)
        {
          v144 = *(_QWORD *)(a1 + 384) + 208;
          v145 = *v12;
          *(_DWORD *)__tp = 136316418;
          *(_QWORD *)&__tp[4] = "tx_flush";
          *(_WORD *)&__tp[12] = 1024;
          *(_DWORD *)&__tp[14] = 1014;
          v151 = 2080;
          v152 = v144;
          v153 = 2048;
          v154 = v145;
          v155 = 1024;
          *(_DWORD *)v156 = v83;
          *(_WORD *)&v156[4] = 1024;
          *(_DWORD *)&v156[6] = v89;
          _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: %s xid %lld checkpoint data block count is not value tracked by cache: %d != %d\n", __tp, 0x32u);
          v87 = v147;
          v86 = v148;
        }
      }
    }
    v91 = *(_QWORD *)(a2 + 56);
    *(_DWORD *)(v91 + 128) = v86;
    *(_DWORD *)(v91 + 132) = v87;
    obj_checksum_set_phys(a1, v91, *(_DWORD *)(*(_QWORD *)(a1 + 376) + 36), v76, v77);
    *(_DWORD *)(a2 + 48) = 0;
    *(_DWORD *)(a2 + 40) = 1;
    *(_DWORD *)(*(_QWORD *)(a2 + 64) + 36) = 0;
    v92 = *(_DWORD *)(a2 + 24);
    if ((v92 & 8) == 0)
      panic("can't transition from tx flags 0x%x to 0x%x (expected 0x%x)\n", v92, 16, 8);
    if ((v92 & 0x10) != 0)
      panic("bad transition tx flags 0x%x to 0x%x (expected 0x%x)\n", v92, 16, 8);
    *(_DWORD *)(a2 + 24) = v92 & 0xFFFFFFE7 | 0x10;
    memset(__tp, 170, 16);
    clock_gettime(_CLOCK_UPTIME_RAW_APPROX, (timespec *)__tp);
    v93 = 1000000 * *(_QWORD *)__tp + *(_DWORD *)&__tp[8] / 1000;
    v24 = v93 - *(_QWORD *)(a2 + 72);
    *(_QWORD *)(a2 + 72) = v93;
    if (v24 <= 0xF4240 || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_46;
    v94 = *(_QWORD *)(a1 + 384) + 208;
    v95 = *v12;
    *(_DWORD *)__tp = 136316162;
    *(_QWORD *)&__tp[4] = "tx_flush";
    *(_WORD *)&__tp[12] = 1024;
    *(_DWORD *)&__tp[14] = 1037;
    v151 = 2080;
    v152 = v94;
    v153 = 2048;
    v154 = v95;
    v155 = 2048;
    *(_QWORD *)v156 = v24;
    v27 = MEMORY[0x24BDACB70];
    goto LABEL_45;
  }
  v43 = MEMORY[0x24BDACB70];
  while (v42 == a1)
  {
LABEL_93:
    v42 = *(_QWORD *)(v42 + 88);
    if (!v42)
      goto LABEL_94;
  }
  v44 = tx_checkpoint_write_prepare(a1, a2, v42);
  if (!(_DWORD)v44)
  {
    obj_retain_ephemeral_no_ref(v42);
    if ((*(_BYTE *)(v42 + 32) & 4) == 0
      && (*(_BYTE *)(v42 + 20) & 0x20) == 0
      && os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      v45 = *(_QWORD *)(a1 + 384) + 208;
      v46 = *(_QWORD *)(v42 + 112);
      v47 = *(_DWORD *)(v42 + 36);
      v48 = *(_DWORD *)(v42 + 40);
      *(_DWORD *)__tp = 136316418;
      *(_QWORD *)&__tp[4] = "tx_flush";
      *(_WORD *)&__tp[12] = 1024;
      *(_DWORD *)&__tp[14] = 928;
      v151 = 2080;
      v152 = v45;
      v153 = 2048;
      v154 = v46;
      v155 = 1024;
      *(_DWORD *)v156 = v47;
      *(_WORD *)&v156[4] = 1024;
      *(_DWORD *)&v156[6] = v48;
      _os_log_impl(&dword_21F566000, v43, OS_LOG_TYPE_DEFAULT, "%s:%d: %s Unknown NEW persistent ephemeral object found: oid 0x%llx type 0x%x/0x%x\n", __tp, 0x32u);
    }
    *(_QWORD *)(v42 + 64) = *(_QWORD *)(v42 + 56);
    *(_QWORD *)(v42 + 104) = 0;
    **(_QWORD **)(v5 + 856) = v42;
    *(_QWORD *)(v5 + 856) = v42 + 104;
    goto LABEL_93;
  }
  v14 = v44;
  if (!*(_DWORD *)(v4 + 76) && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v136 = *(_QWORD *)(a1 + 384) + 208;
    v137 = *v12;
    v138 = *(_QWORD *)(v42 + 112);
    v139 = *(_DWORD *)(v42 + 36);
    v140 = *(_DWORD *)(v42 + 40);
    *(_DWORD *)__tp = 136316930;
    *(_QWORD *)&__tp[4] = "tx_flush";
    *(_WORD *)&__tp[12] = 1024;
    *(_DWORD *)&__tp[14] = 919;
    v151 = 2080;
    v152 = v136;
    v153 = 2048;
    v154 = v137;
    v155 = 2048;
    *(_QWORD *)v156 = v138;
    *(_WORD *)&v156[8] = 1024;
    *(_DWORD *)v157 = v139;
    *(_WORD *)&v157[4] = 1024;
    *(_DWORD *)&v157[6] = v140;
    LOWORD(v158) = 1024;
    *(_DWORD *)((char *)&v158 + 2) = v14;
    _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: %s xid %lld error preparing ephemeral object (oid 0x%llx type 0x%x/0x%x): %d\n", __tp, 0x42u);
  }
  v15 = 921;
LABEL_22:
  *(_DWORD *)(v4 + 76) = v15;
  ++*(_WORD *)(v4 + 80);
LABEL_23:
  obj_cache_flush_unprepare(v5);
  v16 = *(_QWORD *)(v5 + 848);
  if (v16)
  {
    v17 = (uint64_t *)(v5 + 848);
    do
    {
      v18 = *(_QWORD *)(v16 + 104);
      *v17 = v18;
      if (!v18)
        *(_QWORD *)(v5 + 856) = v17;
      *(_QWORD *)(v16 + 104) = 3735928559;
      *(_QWORD *)(v16 + 64) = 0;
      obj_checkpoint_done((unsigned int *)v16);
      obj_release((uint64_t *)v16);
      v16 = *v17;
    }
    while (*v17);
  }
  for (i = *(_QWORD *)(v5 + 736); i; i = *(_QWORD *)(i + 88))
  {
    if ((*(_BYTE *)(i + 32) & 4) != 0)
      obj_checkpoint_done((unsigned int *)i);
  }
  v20 = *(_DWORD *)(a2 + 24);
  if ((v20 & 8) == 0)
    panic("can't transition from tx flags 0x%x to 0x%x (expected 0x%x)\n", v20, 1, 8);
  if ((v20 & 1) != 0)
    panic("bad transition tx flags 0x%x to 0x%x (expected 0x%x)\n", v20, 1, 8);
  *(_DWORD *)(a2 + 24) = v20 & 0xFFFFFFF6 | 1;
  memset(__tp, 170, 16);
  clock_gettime(_CLOCK_UPTIME_RAW_APPROX, (timespec *)__tp);
  *(_QWORD *)(a2 + 72) = 1000000 * *(_QWORD *)__tp + *(_DWORD *)&__tp[8] / 1000;
  v21 = (pthread_cond_t *)(v4 + 256);
LABEL_81:
  cv_wakeup(v21);
  *(_DWORD *)(a2 + 52) = v14;
  return v14;
}

void OUTLINED_FUNCTION_6_7(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_12_2(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

uint64_t fv_get_effective_info_size()
{
  return 8;
}

uint64_t fv_kek_global_policy_eval(uint64_t result)
{
  int v1;
  uint64_t v2;

  v1 = *(_DWORD *)(result + 120);
  if ((v1 & 0x20) == 0)
  {
    v2 = result;
    if (*(_QWORD *)(result + 8) == 0xAA11000064C0C6EBLL && *(_QWORD *)(result + 16) == 0xACEC4365300011AALL)
    {
      result = fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s personal recovery key%s\n", "aks", "", "", "", "fv_kek_global_policy_eval");
    }
    else if (*(_QWORD *)(result + 8) == 0xD64E18B6D92A1CECLL && *(_QWORD *)(result + 16) == 0x775C261F3508DBDLL)
    {
      result = fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s icloud recovery key%s\n", "aks", "", "", "", "fv_kek_global_policy_eval");
    }
    else
    {
      if (*(_QWORD *)(result + 8) != 0xE74DFFBA0014A32FLL || *(_QWORD *)(result + 16) != 0x40D31F6EAAC32AAELL)
        goto LABEL_19;
      result = fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s institutional recovery key%s\n", "aks", "", "", "", "fv_kek_global_policy_eval");
    }
    v1 = *(_DWORD *)(v2 + 120) | 0x10;
LABEL_19:
    *(_DWORD *)(v2 + 120) = v1 | 0x20;
  }
  return result;
}

uint64_t fv_encode_vek_blob(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  _OWORD v7[3];
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  memset(v7, 0, sizeof(v7));
  v5 = *a1;
  v4 = a1[1];
  if (*(_BYTE *)(a2 + 37))
    platform_read_random((uint64_t)&v8 + 8, 8u);
  else
    *((_QWORD *)&v8 + 1) = *(_QWORD *)a2;
  if (*(_QWORD *)(a2 + 8) || *(_BYTE *)(a2 + 37))
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s error %d%s\n", "aks", "", "", "", "fv_encode_vek_blob", ":", 765, "", 0, "", -12, "");
    return 0;
  }
  else
  {
    result = MEMORY[0x2207CA940](a1, 0x8000000000000003, 40, a2 + 56);
    if ((_DWORD)result)
    {
      result = MEMORY[0x2207CA940](a1, 0x8000000000000002, 8, a2 + 32);
      if ((_DWORD)result)
      {
        result = MEMORY[0x2207CA940](a1, 0x8000000000000001, 16, a2 + 16);
        if ((_DWORD)result)
        {
          result = ccder_blob_encode_implicit_uint64();
          if ((_DWORD)result)
          {
            result = ccder_blob_encode_tl();
            if ((_DWORD)result)
            {
              result = _encode_blob_header((uint64_t)a1, v7, *(_DWORD *)(a2 + 32), v5 + a1[1] - *a1, v4 - a1[1]);
              if ((_DWORD)result)
                return ccder_blob_encode_tl();
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t _encode_blob_header(uint64_t a1, _QWORD *a2, char a3, uint64_t a4, uint64_t a5)
{
  if (!*a2
    && (a2[1] = a4, a2[2] = a5, _blob_digest(a2, a3))
    && MEMORY[0x2207CA940](a1, 0x8000000000000002, 8, a2 + 7)
    && MEMORY[0x2207CA940](a1, 0x8000000000000001, 32, a2 + 3))
  {
    return ccder_blob_encode_implicit_uint64();
  }
  else
  {
    return 0;
  }
}

uint64_t fv_decode_info(uint64_t a1, uint64_t a2, int *a3, _OWORD *a4, _QWORD *a5, _OWORD *a6, _QWORD *a7, int a8)
{
  uint64_t v14;
  unint64_t v15;
  char *v16;
  size_t v17;
  int v18;
  uint64_t result;
  int v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  unint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  void *__src[2];
  __int128 v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v22 = a1;
  *((_QWORD *)&v22 + 1) = a2;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  if (a1 == a2)
    return 4294967277;
  v21 = 0;
  v25 = 0uLL;
  if (!ccder_blob_decode_range())
    return 4294967277;
  if ((der_utils_decode_implicit_uint64(&v22, 0x8000000000000000, &v26) & 1) != 0)
  {
    if ((_QWORD)v26)
      return 4294967277;
  }
  else
  {
    *(_QWORD *)&v26 = 0;
  }
  if (!der_utils_decode_implicit_raw_octet_string_copy(&v22, 0x8000000000000001, (uint64_t)&v27 + 8, 32))
    return 4294967277;
  if (!der_utils_decode_implicit_raw_octet_string_copy(&v22, 0x8000000000000002, (uint64_t)&v29 + 8, 8))
    return 4294967277;
  v14 = v22;
  __src[0] = 0;
  v24 = 0;
  if (!ccder_blob_decode_tag())
    return 4294967277;
  if (!ccder_blob_decode_len())
    return 4294967277;
  if ((v24 & 0xFFFFFFFFFFFFFFEFLL) != 0xA000000000000003)
    return 4294967277;
  *((_QWORD *)&v26 + 1) = v14;
  *(_QWORD *)&v27 = (char *)__src[0] + v22 - v14;
  if (!der_utils_decode_implicit_uint64(&v22, 0x8000000000000000, &v21))
    return 4294967277;
  if (!der_utils_decode_implicit_raw_octet_string_copy(&v22, 0x8000000000000001, (uint64_t)&v25, 16))
    return 4294967277;
  v24 = 0;
  *(_OWORD *)__src = v22;
  if (!ccder_blob_decode_tl())
    return 4294967277;
  v15 = v24;
  if (v24 > 4)
  {
    v16 = (char *)__src[0];
    if (v24 >= 0x16)
      v17 = 22;
    else
      v17 = v24;
    memcpy(a3, __src[0], v17);
    *(_QWORD *)&v22 = &v16[v15];
  }
  else
  {
    v23 = 0;
    if (der_utils_decode_implicit_uint64(&v22, 0x8000000000000002, &v23))
      *a3 = v23;
  }
  v18 = *a3;
  *(_OWORD *)__src = 0u;
  v31 = 0u;
  if ((_QWORD)v26)
  {
    result = 4294967284;
  }
  else
  {
    v20 = _blob_digest(&v26, v18);
    result = 4294967290;
    if (v20)
    {
      if ((uint64_t)__src[0] ^ *((_QWORD *)&v27 + 1) | (unint64_t)__src[1] ^ (unint64_t)v28 | (unint64_t)v31 ^ *((_QWORD *)&v28 + 1) | *((_QWORD *)&v31 + 1) ^ (unint64_t)v29)
        result = 4294967290;
      else
        result = 0;
    }
  }
  if ((((_DWORD)result == -6) & ~a8) != 0 || !(_DWORD)result)
  {
    if (a5)
      *a5 = v21;
    if (a6)
      *a6 = v25;
    if (a4)
      *a4 = v22;
    if (a7)
    {
      if ((_QWORD)v26)
      {
        return 4294967284;
      }
      else
      {
        result = 0;
        *a7 = *((_QWORD *)&v29 + 1);
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t fv_decode_vek_blob_opts(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  _BYTE *v5;
  _QWORD *v6;
  uint64_t result;
  __int128 v8;

  v8 = 0uLL;
  if (a1 == a2)
    return 4294967277;
  v5 = (_BYTE *)(a3 + 32);
  v6 = (_QWORD *)(a3 + 8);
  result = fv_decode_info(a1, a2, (int *)(a3 + 32), &v8, (_QWORD *)(a3 + 8), (_OWORD *)(a3 + 16), (_QWORD *)a3, a4);
  if ((_DWORD)result)
    return result;
  if (*(_BYTE *)(a3 + 36))
  {
    if (*(_BYTE *)(a3 + 36) == 1)
      goto LABEL_7;
    return 4294967277;
  }
  if ((*v5 & 4) != 0)
    return 4294967277;
  *(_BYTE *)(a3 + 36) = 1;
LABEL_7:
  if (*v6 || *(_BYTE *)(a3 + 37))
    return 4294967284;
  if (der_utils_decode_implicit_raw_octet_string_copy(&v8, 0x8000000000000003, a3 + 56, 40))
    return 0;
  return 4294967277;
}

uint64_t fv_decode_vek_blob(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return fv_decode_vek_blob_opts(a1, a2, a3, 1);
}

uint64_t fv_encode_kek_blob(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v11[0] = 0;
  v9 = 0u;
  v10 = 0u;
  v8 = 0u;
  v5 = *a1;
  v4 = a1[1];
  v7 = 0;
  platform_read_random((uint64_t)v11, 8u);
  if (*(_QWORD *)a2)
    return 0;
  if ((*(_BYTE *)(a2 + 24) & 0x80) == 0 || (result = ccder_blob_encode_implicit_uint64(), (_DWORD)result))
  {
    if (*(_BYTE *)(a2 + 29) == 1)
    {
      result = MEMORY[0x2207CA940](a1, 0x8000000000000003, 40, a2 + 48);
      if (!(_DWORD)result)
        return result;
      goto LABEL_12;
    }
    if (*(_BYTE *)(a2 + 29))
      return 0;
    result = MEMORY[0x2207CA940](a1, 0x8000000000000005, 16, a2 + 96);
    if ((_DWORD)result)
    {
      result = ccder_blob_encode_implicit_uint64();
      if ((_DWORD)result)
      {
        if ((MEMORY[0x2207CA940](a1, 0x8000000000000003, 40, a2 + 48) & 1) == 0)
          return 0;
LABEL_12:
        result = MEMORY[0x2207CA940](a1, 0x8000000000000002, 8, a2 + 24);
        if ((_DWORD)result)
        {
          result = MEMORY[0x2207CA940](a1, 0x8000000000000001, 16, a2 + 8);
          if ((_DWORD)result)
          {
            result = ccder_blob_encode_implicit_uint64();
            if ((_DWORD)result)
            {
              result = ccder_blob_encode_tl();
              if ((_DWORD)result)
              {
                result = _encode_blob_header((uint64_t)a1, &v7, *(_DWORD *)(a2 + 24), v5 + a1[1] - *a1, v4 - a1[1]);
                if ((_DWORD)result)
                  return ccder_blob_encode_tl();
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t fv_decode_kek_blob_opts(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int *v5;
  uint64_t result;
  int v7;
  int v8;
  __int128 v9;

  v9 = 0uLL;
  if (a1 == a2)
    return 4294967277;
  v5 = (int *)(a3 + 24);
  result = fv_decode_info(a1, a2, (int *)(a3 + 24), &v9, (_QWORD *)a3, (_OWORD *)(a3 + 8), 0, a4);
  if ((_DWORD)result)
    return result;
  if (*(_BYTE *)(a3 + 28))
  {
    if (*(_BYTE *)(a3 + 28) != 2)
      return 4294967277;
  }
  else
  {
    *(_BYTE *)(a3 + 28) = 2;
    v7 = *(_DWORD *)(a3 + 24);
    if (!*(_BYTE *)(a3 + 29) && (v7 & 4) != 0)
      *(_BYTE *)(a3 + 29) = 1;
    if ((v7 & 2) == 0)
      *(_DWORD *)(a3 + 120) |= 1u;
  }
  if (*(_QWORD *)a3)
    return 4294967284;
  if (*(_BYTE *)(a3 + 29) == 1)
  {
    if (!der_utils_decode_implicit_raw_octet_string_copy(&v9, 0x8000000000000003, a3 + 48, 40))
      return 4294967277;
  }
  else
  {
    if (*(_BYTE *)(a3 + 29))
      return 4294967284;
    if (!der_utils_decode_implicit_raw_octet_string_copy(&v9, 0x8000000000000003, a3 + 48, 40)
      || !der_utils_decode_implicit_uint64(&v9, 0x8000000000000004, (_QWORD *)(a3 + 88))
      || (der_utils_decode_implicit_raw_octet_string_copy(&v9, 0x8000000000000005, a3 + 96, 16) & 1) == 0)
    {
      return 4294967277;
    }
  }
  v8 = *v5;
  if ((*v5 & 0x80) != 0)
  {
    if (!der_utils_decode_implicit_uint64(&v9, 0x8000000000000006, (_QWORD *)(a3 + 112)))
      return 4294967277;
    v8 = *v5;
  }
  if ((v8 & 0x100) != 0)
  {
    if ((v8 & 2) != 0)
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s kek constraint violation 1%s\n", "aks", "", "", "", "fv_decode_kek_blob_opts");
    }
    else
    {
      if ((v8 & 1) != 0)
        goto LABEL_25;
      fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s kek constraint violation 2%s\n", "aks", "", "", "", "fv_decode_kek_blob_opts");
    }
    return 4294967277;
  }
LABEL_25:
  fv_kek_global_policy_eval(a3);
  return 0;
}

uint64_t fv_decode_kek_blob(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return fv_decode_kek_blob_opts(a1, a2, a3, 1);
}

uint64_t fv_get_size(uint64_t a1, int a2, uint64_t *a3)
{
  uint64_t v4;
  uint64_t v5;

  if ((a2 - 2) >= 2)
  {
    if (a2 != 1)
      return 0xFFFFFFFFLL;
    v4 = ccder_sizeof_vek_blob_message_length;
    if (!ccder_sizeof_vek_blob_message_length)
    {
      ccder_sizeof_implicit_uint64();
      ccder_sizeof_raw_octet_string();
      ccder_sizeof_raw_octet_string();
      ccder_sizeof_raw_octet_string();
      ccder_sizeof_raw_octet_string();
      ccder_sizeof_implicit_uint64();
      ccder_sizeof_raw_octet_string();
      ccder_sizeof();
      ccder_sizeof_raw_octet_string();
      v4 = ccder_sizeof_blob_header();
      ccder_sizeof_vek_blob_message_length = v4;
    }
  }
  else
  {
    v4 = ccder_sizeof_kek_blob_message_length;
    if (!ccder_sizeof_kek_blob_message_length)
    {
      ccder_sizeof_implicit_uint64();
      ccder_sizeof_raw_octet_string();
      ccder_sizeof_raw_octet_string();
      ccder_sizeof_raw_octet_string();
      ccder_sizeof_implicit_uint64();
      ccder_sizeof_implicit_uint64();
      v4 = ccder_sizeof_blob_header();
      ccder_sizeof_kek_blob_message_length = v4;
    }
  }
  v5 = 0xFFFFFFFFLL;
  if (a3 && v4)
  {
    v5 = 0;
    *a3 = v4;
  }
  return v5;
}

uint64_t _blob_digest(_QWORD *a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  size_t v7;
  uint64_t v8;
  _DWORD v10[3];
  __int16 v11;
  _OWORD __s[2];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v11 = 1301;
  v10[2] = 387978753;
  memset(__s, 0, sizeof(__s));
  v4 = ccsha256_di();
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)v10 - v5;
  bzero((char *)v10 - v5, v7);
  if (*a1
    || (ccdigest_init(),
        ccdigest_update(),
        ccdigest_update(),
        (*(void (**)(uint64_t, char *, _OWORD *))(v4 + 56))(v4, v6, __s),
        cc_clear(),
        (a2 & 1) != 0)
    && !fv_hw_crypt(1, &firebloom_null_iv, __s, __s, 32))
  {
    v8 = 0;
  }
  else
  {
    cchmac();
    v8 = 1;
  }
  memset_s(__s, 0x20uLL, 0, 0x20uLL);
  return v8;
}

uint64_t ccder_sizeof_blob_header()
{
  ccder_sizeof();
  ccder_sizeof_implicit_uint64();
  ccder_sizeof_raw_octet_string();
  ccder_sizeof_raw_octet_string();
  return ccder_sizeof();
}

uint64_t der_utils_decode_implicit_raw_octet_string_copy(__int128 *a1, uint64_t a2, uint64_t a3, int a4)
{
  __int128 v8;

  v8 = *a1;
  if ((ccder_blob_decode_range() & 1) == 0 || a3 && a4)
    return 0;
  *a1 = v8;
  return 1;
}

uint64_t der_utils_decode_implicit_uint64(__int128 *a1, uint64_t a2, _QWORD *a3)
{
  uint64_t result;
  __int128 v6;

  if (a3)
    *a3 = 0;
  v6 = *a1;
  result = ccder_blob_decode_range();
  if ((_DWORD)result)
  {
    if (ccn_read_uint())
    {
      return 0;
    }
    else
    {
      *a1 = v6;
      if (a3)
        *a3 = 0;
      return 1;
    }
  }
  return result;
}

uint64_t platform_rng()
{
  REQUIRE_func(&lib_platform_callbacks != 0, 62, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(lib_platform_rng != 0, 63, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return lib_platform_rng();
}

uint64_t platform_read_random(uint64_t a1, unsigned int a2)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 70, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(lib_platform_read_random != 0, 71, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return lib_platform_read_random(a1, a2);
}

uint64_t lib_platform_rng()
{
  uint64_t v0;

  v0 = ccrng();
  REQUIRE_func(v0 != 0, 22, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform_lib.c");
  REQUIRE_func(0, 23, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform_lib.c");
  return v0;
}

uint64_t lib_platform_read_random(uint64_t a1, unsigned int a2)
{
  unsigned int (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t v5;
  _BOOL8 v6;

  v4 = *(unsigned int (**)(uint64_t, _QWORD, uint64_t))platform_rng();
  v5 = platform_rng();
  v6 = v4(v5, a2, a1) == 0;
  return REQUIRE_func(v6, 31, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform_lib.c");
}

unint64_t time_absolute_to_nanoseconds(uint64_t a1)
{
  mach_timebase_info info;

  info = 0;
  mach_timebase_info(&info);
  return (unint64_t)info.numer * a1 / info.denom;
}

BOOL is_non_zero(unsigned __int8 *a1, uint64_t a2)
{
  int v2;
  int v3;

  if (!a2)
    return 0;
  v2 = 0;
  do
  {
    v3 = *a1++;
    v2 |= v3;
    --a2;
  }
  while (a2);
  return v2 != 0;
}

uint64_t dump_bytes_internal(const char *a1, uint64_t a2, unint64_t a3)
{
  unint64_t v3;
  const char *v4;
  FILE **v5;
  unint64_t v6;
  FILE **v7;
  uint64_t v8;
  unsigned __int8 *v9;
  char *v10;
  uint64_t v11;
  int v12;
  unint64_t v15;
  char __str[16];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  char v24;
  uint64_t v25;

  v3 = a3;
  v4 = a1;
  v25 = *MEMORY[0x24BDAC8D0];
  v24 = 0;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  *(_OWORD *)__str = 0u;
  v17 = 0u;
  v5 = (FILE **)MEMORY[0x24BDAC8E8];
  if (a3 >= 0x41)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s %sdump %s (len = %zd)%s%s\n", "aks", "", "", "", "dump_bytes_internal", ":", 786, "", 0, "", "", a1, a3, "", "");
    v4 = "";
  }
  else if (!a3)
  {
    return memset_s(__str, 0x81uLL, 0, 0x81uLL);
  }
  v6 = 0;
  v15 = v3;
  do
  {
    v7 = v5;
    if (v3 - v6 >= 0x40)
      v8 = 64;
    else
      v8 = v3 - v6;
    if (v8)
    {
      v9 = (unsigned __int8 *)(a2 + v6);
      v10 = __str;
      v11 = v8;
      do
      {
        v12 = *v9++;
        snprintf(v10, 3uLL, "%02x", v12);
        v10 += 2;
        --v11;
      }
      while (v11);
    }
    v5 = v7;
    fprintf(*v7, "%s%s:%s%s%s%s%u:%s%u:%s %s%s%s[%04zu,%04zu): %s%s%s%s\n", "aks", "", "", "", "dump_bytes_internal", ":", 796, "", 0, "", "", v4, "", v6, v8 + v6, "", __str,
      "",
      "");
    v6 += v8;
    v3 = v15;
  }
  while (v6 < v15);
  return memset_s(__str, 0x81uLL, 0, 0x81uLL);
}

_BYTE *bytes_to_str_hint(unsigned __int8 *a1, unint64_t a2)
{
  uint64_t v2;
  char *v4;
  uint64_t v5;
  int v6;

  if (a2 >= 0x10)
    v2 = 16;
  else
    v2 = a2;
  if (v2)
  {
    v4 = bytes_to_str_hint_buf;
    v5 = v2;
    do
    {
      v6 = *a1++;
      snprintf(v4, 3uLL, "%02x", v6);
      v4 += 2;
      --v5;
    }
    while (v5);
  }
  bytes_to_str_hint_buf[2 * v2] = 0;
  return bytes_to_str_hint_buf;
}

uint64_t err_sks_to_aks(uint64_t result)
{
  if ((_DWORD)result == 0 || result >= 0xFFFFFFDA)
    return dword_21F61EC30[(int)result + 38];
  return result;
}

uint64_t fv_init_cred_from_secret(_QWORD *a1, uint64_t a2, char a3)
{
  uint64_t result;
  size_t v7;
  void *v8;
  const void *v9;

  memset_s(a1, 0x10uLL, 0, 0x10uLL);
  if ((a3 & 1) != 0)
    return 4294967285;
  if (a2 && *(_QWORD *)a2 && (v7 = *(_QWORD *)(a2 + 8)) != 0)
  {
    v8 = calloc(v7, 1uLL);
    if (v8)
    {
      *a1 = v8;
      v9 = *(const void **)a2;
      a1[1] = *(_QWORD *)(a2 + 8);
      memcpy(v8, v9, *(_QWORD *)(a2 + 8));
      return 0;
    }
    else
    {
      return 4294967279;
    }
  }
  else
  {
    result = 0;
    *a1 = 0;
    a1[1] = 0;
  }
  return result;
}

uint64_t REQUIRE_func(uint64_t result, int a2, const char *a3)
{
  if ((result & 1) == 0)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s failed REQUIRE condition (%s:%d)\n%s\n", "aks", "", "", "", "REQUIRE_func", ":", 1047, "", 0, "", a3, a2, "");
    abort();
  }
  return result;
}

uint64_t lib_fv_new_sibling_vek()
{
  return 3758097126;
}

uint64_t fv_stash_create()
{
  return 4294967284;
}

uint64_t lib_get_file_vault_services(_QWORD *a1)
{
  uint64_t result;

  if (!a1)
    return 0xFFFFFFFFLL;
  result = 0;
  *a1 = _g_lib_fv_services;
  return result;
}

uint64_t lib_fv_new_vek(uint64_t a1, void *a2, uint64_t *a3, unsigned __int8 *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[2];

  if (a1)
    v6 = *(_QWORD *)(a1 + 8);
  else
    v6 = 0;
  v9[0] = v6;
  v9[1] = 0;
  if (!a2)
    a2 = &empty_fv_data;
  v7 = fv_new_vek(v9, (uint64_t)a2, a3, a4, a5, a6);
  return err_sks_to_aks(v7);
}

uint64_t lib_fv_unwrap_vek(uint64_t a1, void *a2, uint64_t *a3, uint64_t *a4, uint64_t a5)
{
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v12[2];

  if (a1)
    v8 = *(_QWORD *)(a1 + 8);
  else
    v8 = 0;
  v12[0] = v8;
  v12[1] = 0;
  if (a2)
    v9 = a2;
  else
    v9 = &empty_fv_data;
  v10 = fv_unwrap_vek(v12, 0, (uint64_t)v9, a3, a4, 0, a5);
  return err_sks_to_aks(v10);
}

uint64_t lib_fv_new_kek(uint64_t a1, unsigned int a2, void *a3, const unsigned __int8 *a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[2];

  if (a1)
    v5 = *(_QWORD *)(a1 + 8);
  else
    v5 = 0;
  v8[0] = v5;
  v8[1] = 0;
  if (!a3)
    a3 = &empty_fv_data;
  v6 = fv_new_kek(v8, a2, (uint64_t)a3, a4, a5);
  return err_sks_to_aks(v6);
}

uint64_t lib_fv_rewrap_kek(uint64_t a1, void *a2, uint64_t *a3, const unsigned __int8 *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[2];

  if (a1)
    v6 = *(_QWORD *)(a1 + 8);
  else
    v6 = 0;
  v9[0] = v6;
  v9[1] = 0;
  if (!a2)
    a2 = &empty_fv_data;
  v7 = fv_rewrap_kek(v9, (uint64_t)a2, a3, a4, a5, a6);
  return err_sks_to_aks(v7);
}

uint64_t lib_fv_get_size(uint64_t a1, int a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t size;
  _QWORD v6[2];

  if (a1)
    v3 = *(_QWORD *)(a1 + 8);
  else
    v3 = 0;
  v6[0] = v3;
  v6[1] = 0;
  size = fv_get_size((uint64_t)v6, a2, a3);
  return err_sks_to_aks(size);
}

uint64_t lib_fv_new_media_key()
{
  return 3758097126;
}

uint64_t lib_fv_unwrap_media_key()
{
  return 3758097126;
}

uint64_t lib_fv_get_blob_state(uint64_t a1, uint64_t *a2, char *a3)
{
  uint64_t v3;
  uint64_t blob_state;
  _QWORD v6[2];

  if (a1)
    v3 = *(_QWORD *)(a1 + 8);
  else
    v3 = 0;
  v6[0] = v3;
  v6[1] = 0;
  blob_state = fv_get_blob_state((int)v6, a2, a3);
  return err_sks_to_aks(blob_state);
}

uint64_t lib_fv_set_protection(uint64_t a1, int a2, uint64_t a3, void *a4, uint64_t a5, uint64_t *a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v10[2];

  if (a1)
    v7 = *(_QWORD *)(a1 + 8);
  else
    v7 = 0;
  v10[0] = v7;
  v10[1] = 0;
  if (!a4)
    a4 = &empty_fv_data;
  v8 = fv_set_protection(v10, a2, a3, (uint64_t)a4, a5, a6, a7);
  return err_sks_to_aks(v8);
}

uint64_t lib_fv_unwrap_vek_opts(uint64_t a1, unsigned int a2, void *a3, uint64_t *a4, uint64_t *a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v9[2];

  if (a1)
    v6 = *(_QWORD *)(a1 + 8);
  else
    v6 = 0;
  v9[0] = v6;
  v9[1] = 0;
  if (!a3)
    a3 = &empty_fv_data;
  v7 = fv_unwrap_vek(v9, a2, (uint64_t)a3, a4, a5, 0, a6);
  return err_sks_to_aks(v7);
}

uint64_t fv_decrypt_vek(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  char v14;
  __int128 v15;
  _OWORD *v16;
  unsigned int v17;
  __int128 v18;
  unsigned int v19;
  uint64_t (*v20)();
  char v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  size_t v25;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  unint64_t v30;
  int v31;
  _OWORD v32[2];
  __int128 __s;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  memset(v32, 0, sizeof(v32));
  v31 = 32;
  v4 = *(_DWORD *)(a3 + 32);
  if ((v4 & 2) != 0)
    v5 = 24;
  else
    v5 = 40;
  if (*(_QWORD *)(a3 + 8))
    goto LABEL_5;
  if (*(_BYTE *)(a3 + 37) == 1)
  {
    *(double *)&v12 = ((double (*)(void))MEMORY[0x24BDAC7A8])();
    v29 = 0;
    v27 = v12;
    v28 = v12;
    LODWORD(__s) = 0;
    v6 = 4294967285;
    if (!rfc3394_unwrapped_size_legacy(0x28u, (unsigned int *)&__s) || __s > 0x20)
      goto LABEL_44;
    if (a1)
    {
      v13 = *(_OWORD *)(a3 + 112);
      v27 = *(_OWORD *)(a3 + 96);
      v28 = v13;
      v29 = *(_QWORD *)(a3 + 128);
      if ((*(_BYTE *)(a3 + 32) & 1) != 0)
      {
        v14 = needs_ctx();
        v6 = 0xFFFFFFFFLL;
        if (HIDWORD(a2) || (v14 & 1) == 0)
          goto LABEL_44;
LABEL_28:
        if (a1)
          v19 = a2;
        else
          v19 = 0;
        if (a1)
          v20 = 0;
        else
          v20 = _fv_hw_crypt;
        if (rfc3394_unwrap_legacy(a1, v19, 0xA6A6A6A6A6A6A6A6, (uint64_t (*)(_QWORD, void *, unint64_t *, unint64_t *, uint64_t))v20, &v27, 0x28u, (_QWORD *)a4, &v31))
        {
          fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s kek failed to unwrap vek; mix-n-match?%s\n",
            "aks",
            "",
            "",
            "",
            "fv_decrypt_vek",
            ":",
            568,
            "",
            0,
            "",
            "");
          v6 = 4294967294;
          goto LABEL_44;
        }
        goto LABEL_40;
      }
    }
    else
    {
      v18 = *(_OWORD *)(a3 + 72);
      v27 = *(_OWORD *)(a3 + 56);
      v28 = v18;
      v29 = *(_QWORD *)(a3 + 88);
    }
    if (HIDWORD(a2))
    {
      v6 = 0xFFFFFFFFLL;
      goto LABEL_44;
    }
    goto LABEL_28;
  }
  if (*(_BYTE *)(a3 + 37))
  {
LABEL_5:
    v6 = 4294967284;
    goto LABEL_44;
  }
  if ((v4 & 0x1000) != 0)
  {
    v30 = 0;
    v6 = 4294967285;
    if (rfc3394_unwrapped_size(v5, &v30) && v30 <= 0x20)
    {
      v15 = *(_OWORD *)(a3 + 72);
      __s = *(_OWORD *)(a3 + 56);
      v34 = v15;
      v35 = *(_QWORD *)(a3 + 88);
      if (_volume_entropy_d_derive_from_vek_data(a3, v32))
        goto LABEL_45;
      v16 = v32;
      v17 = 32;
LABEL_39:
      if (!rfc3394_unwrap_legacy((uint64_t)v16, v17, 0xA6A6A6A6A6A6A6A6, 0, &__s, v5, (_QWORD *)a4, &v31))
      {
LABEL_40:
        if ((*(_BYTE *)(a3 + 32) & 2) == 0)
        {
LABEL_43:
          v6 = 0;
          goto LABEL_44;
        }
        if (v31 == 16)
        {
          v22 = ccsha256_di();
          MEMORY[0x24BDAC7A8]();
          v24 = (char *)&v30 - v23;
          bzero((char *)&v30 - v23, v25);
          __s = 0u;
          v34 = 0u;
          ccdigest_init();
          ccdigest_update();
          ccdigest_update();
          (*(void (**)(uint64_t, char *, __int128 *))(v22 + 56))(v22, v24, &__s);
          cc_clear();
          *(_OWORD *)(a4 + 16) = __s;
          memset_s(&__s, 0x20uLL, 0, 0x20uLL);
          goto LABEL_43;
        }
LABEL_45:
        v6 = 0xFFFFFFFFLL;
        goto LABEL_44;
      }
LABEL_46:
      v6 = 4294967294;
    }
  }
  else
  {
    if (!a1)
      goto LABEL_46;
    LODWORD(v30) = 0;
    v6 = 4294967285;
    if (rfc3394_unwrapped_size_legacy(v5, (unsigned int *)&v30) && v30 <= 0x20)
    {
      v11 = *(_OWORD *)(a3 + 72);
      __s = *(_OWORD *)(a3 + 56);
      v34 = v11;
      v35 = *(_QWORD *)(a3 + 88);
      if ((v4 & 1) == 0)
      {
        if (HIDWORD(a2))
          goto LABEL_45;
        goto LABEL_38;
      }
      v21 = needs_ctx();
      v6 = 0xFFFFFFFFLL;
      if (!HIDWORD(a2) && (v21 & 1) != 0)
      {
LABEL_38:
        v16 = (_OWORD *)a1;
        v17 = a2;
        goto LABEL_39;
      }
    }
  }
LABEL_44:
  memset_s(v32, 0x20uLL, 0, 0x20uLL);
  return v6;
}

uint64_t _volume_entropy_d_derive_from_vek_data(uint64_t a1, _OWORD *a2)
{
  uint64_t v2;
  __int128 v5;
  __int128 __s;
  __int128 v8;
  _OWORD v9[2];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v14 = 0;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  memset(v9, 0, sizeof(v9));
  __s = 0u;
  v8 = 0u;
  if (*(_BYTE *)(a1 + 37))
  {
    v2 = 4294967284;
  }
  else
  {
    DWORD1(v10) = 32;
    *(_QWORD *)&v9[0] = *(_QWORD *)a1;
    ccsha256_di();
    if (cchkdf() || (*(_BYTE *)(a1 + 32) & 1) != 0 && !needs_ctx())
    {
      v2 = 0xFFFFFFFFLL;
    }
    else
    {
      v2 = 0;
      v5 = v8;
      *a2 = __s;
      a2[1] = v5;
    }
  }
  memset_s(&__s, 0x20uLL, 0, 0x20uLL);
  memset_s(v9, 0x20uLL, 0, 0x20uLL);
  return v2;
}

uint64_t fv_get_kek_from_blob(char a1, int a2, uint64_t a3, uint64_t *a4, void *a5, size_t *a6, _DWORD *a7, unsigned __int8 *a8, unsigned __int8 *a9, void **a10)
{
  uint64_t v10;
  uint64_t v17;
  uint64_t v19;
  int v20;
  unsigned int v21;
  int v22;
  _OWORD v24[7];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = 4294967285;
  memset(v24, 0, sizeof(v24));
  if (a4)
  {
    if (a9)
    {
      if (a3)
      {
        if (a5)
        {
          if (a6)
          {
            if (a7)
            {
              if (a8)
              {
                if (*a4)
                {
                  v17 = a4[1];
                  if (v17)
                  {
                    v19 = fv_decode_kek_blob(*a4, *a4 + v17, (uint64_t)v24);
                    if (!(_DWORD)v19)
                    {
                      uuid_copy(a8, (const unsigned __int8 *)v24 + 8);
                      uuid_copy(a9, (const unsigned __int8 *)&v24[1] + 14);
                      v20 = DWORD2(v25);
                      *a7 = DWORD2(v24[1]);
                      v21 = v20 & 0xFFFFFFF7;
                      if (a2)
                        v22 = 0;
                      else
                        v22 = 8;
                      DWORD2(v25) = v21 | v22;
                      v19 = _fv_verify_secret_opts(a3, (uint64_t)v24, a5, a6, a1, a10);
                    }
                    v10 = v19;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  memset_s(v24, 0xB0uLL, 0, 0xB0uLL);
  return v10;
}

uint64_t filevault_purge_group(int a1, unsigned __int8 *uu)
{
  char out[40];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  memset(out, 0, 37);
  uuid_to_string(uu, out);
  return fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s purging %s%s\n", "aks", "", "", "", "filevault_purge_group", ":", 2951, "", 0, "", out, "");
}

uint64_t fv_set_protection(uint64_t *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v13;
  uint64_t size;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const unsigned __int8 *__attribute__((__org_typedef(uuid_t))) v22;
  uint64_t v23;
  uint64_t v25;
  char *v26;
  char *v27;
  char *v28;
  size_t v29;
  void *v30;
  uint64_t v31;
  char *v32;
  char *v33;
  int v34;
  size_t __count;
  void *v36;
  rsize_t __n;
  size_t v38;
  int v39;
  __int128 v40;
  uuid_t dst;
  _OWORD v42[2];
  rsize_t __smax[2];
  __int128 v44;
  __int128 __s;
  __int128 v46;
  _OWORD v47[2];
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v7 = 4294967284;
  switch(a2)
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 12:
      v13 = *a1;
      v38 = 0;
      v62 = 0u;
      v63 = 0u;
      *(_OWORD *)__smax = 0u;
      v44 = 0u;
      v61 = 0;
      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v48 = 0u;
      v46 = 0u;
      memset(v47, 0, sizeof(v47));
      __s = 0u;
      memset(v42, 0, sizeof(v42));
      v36 = 0;
      __n = 0;
      __count = 0;
      memset(dst, 0, sizeof(dst));
      v40 = 0uLL;
      v34 = 0;
      size = fv_get_size(0, 1, (uint64_t *)&__count);
      if ((_DWORD)size)
        goto LABEL_99;
      if (!__count)
        goto LABEL_111;
      if (!a6 || !*a6)
        goto LABEL_50;
      v7 = 4294967285;
      if (!a7)
        goto LABEL_51;
      v15 = a6[1];
      if (!v15)
        goto LABEL_51;
      size = fv_decode_vek_blob(*a6, *a6 + v15, (uint64_t)&__s);
      if ((_DWORD)size)
        goto LABEL_99;
      if ((v13 & 0x40) != 0)
      {
        if (!a5 || *(_QWORD *)(a5 + 8) != 16)
        {
LABEL_50:
          v7 = 4294967285;
          goto LABEL_51;
        }
        uuid_copy(dst, *(const unsigned __int8 **)a5);
        goto LABEL_49;
      }
      size = fv_get_kek_from_blob(v13, 1, a4, (uint64_t *)a5, &v62, &v38, &v34, dst, (unsigned __int8 *)&v40, &v36);
      if ((_DWORD)size)
        goto LABEL_99;
      if (a2 != 3)
      {
        if (a2 == 2)
        {
          if (BYTE5(v47[0]) != 1)
            fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s unsupported vek type for sys disable%s\n", "aks", "", "", "", "_cmd_handle_vek");
        }
        else if (a2 == 1 && BYTE5(v47[0]) != 1)
        {
          fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s unsupported vek type for sys enable%s\n", "aks", "", "", "", "_cmd_handle_vek");
        }
        goto LABEL_49;
      }
      if (BYTE5(v47[0]) != 1)
      {
        if (BYTE5(v47[0]))
          goto LABEL_49;
        if ((v47[0] & 0x1000) != 0)
        {
          if ((v47[0] & 2) == 0)
          {
            if (((v34 ^ LODWORD(v47[0])) & 1) == 0)
            {
              size = fv_decrypt_vek(0, 0, (uint64_t)&__s, (uint64_t)__smax);
              if (!(_DWORD)size)
              {
                size = _bind_unmanaged_vek((uint64_t)&__s, (unsigned __int8 *)&v62, v38, (unsigned __int8 *)__smax);
                if (!(_DWORD)size)
                {
                  *(_OWORD *)((char *)v47 + 6) = v40;
                  goto LABEL_74;
                }
              }
LABEL_99:
              v7 = size;
              goto LABEL_51;
            }
            fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s kek and unmanaged vek device protection mismatch%s\n", "aks", "", "", "", "_cmd_handle_vek", ":", 2672, "", 0, "", "");
LABEL_108:
            v7 = 4294967287;
            goto LABEL_51;
          }
LABEL_49:
          v7 = 4294967284;
LABEL_51:
          fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s cmd: %d, result: %d%s\n", "aks", "", "", "", "_cmd_handle_vek", ":", 2867, "", 0, "", a2, v7, "");
          goto LABEL_52;
        }
LABEL_104:
        v7 = 4294967288;
        goto LABEL_51;
      }
      if ((v61 & 2) != 0)
        goto LABEL_104;
      if ((v34 & 1) == 0)
        goto LABEL_108;
      size = fv_decrypt_vek(0, 0, (uint64_t)&__s, (uint64_t)__smax);
      if ((_DWORD)size)
        goto LABEL_99;
      LODWORD(v32) = 0;
      if (!is_non_zero((unsigned __int8 *)&v62, 32))
      {
        fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s Internal Error: Null KEK, file radar%s\n", "aks", "", "", "", "_enable_user_kek");
LABEL_111:
        v7 = 4294967286;
        goto LABEL_51;
      }
      if (!is_non_zero((unsigned __int8 *)__smax, 32))
      {
        fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s Internal Error: Null VEK, file radar%s\n", "aks", "", "", "", "_enable_user_kek");
        goto LABEL_111;
      }
      if (*((_QWORD *)&__s + 1))
        goto LABEL_49;
      LODWORD(v61) = v61 | 2;
      v39 = 40;
      v7 = 4294967285;
      if (!rfc3394_wrapped_size_legacy(0x20u, &v32) || v32 > 0x28)
        goto LABEL_51;
      if (rfc3394_wrap_legacy((uint64_t)&v62, 0x20u, 0xA6A6A6A6A6A6A6A6, 0, (uint64_t *)__smax, 0x20u, &v50, &v39)|| (v47[0] & 1) != 0 && (needs_ctx() & 1) == 0)
      {
        v7 = 0xFFFFFFFFLL;
        goto LABEL_51;
      }
      *(_OWORD *)((char *)v47 + 6) = v40;
      if (*((_QWORD *)&__s + 1))
        goto LABEL_49;
      LODWORD(v61) = v61 & 0xFFFFFFFE;
LABEL_74:
      v26 = (char *)calloc(__count, 1uLL);
      if (!v26)
      {
        v7 = 4294967279;
        goto LABEL_51;
      }
      v27 = v26;
      v32 = v26;
      v33 = &v26[__count];
      if (!fv_encode_vek_blob((uint64_t *)&v32, (uint64_t)&__s))
      {
        v31 = 4294967273;
        goto LABEL_98;
      }
      v28 = v33;
      v29 = &v27[__count] - v33;
      v30 = *(void **)a7;
      if (!*(_QWORD *)a7)
      {
        v30 = calloc(&v27[__count] - v33, 1uLL);
        if (!v30)
        {
          v31 = 4294967279;
          goto LABEL_98;
        }
        *(_QWORD *)a7 = v30;
        v28 = v33;
        goto LABEL_97;
      }
      if (v29 <= *(_QWORD *)(a7 + 8))
      {
LABEL_97:
        *(_QWORD *)(a7 + 8) = v29;
        memcpy(v30, &v27[v28 - v32], v29);
        v31 = 0;
        goto LABEL_98;
      }
      v31 = 0xFFFFFFFFLL;
LABEL_98:
      fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s cmd: %d, result: %d%s\n", "aks", "", "", "", "_cmd_handle_vek", ":", 2867, "", 0, "", 3, v31, "");
      memset_s(v27, __count, 0, __count);
      free(v27);
      v7 = v31;
LABEL_52:
      memset_s(&v62, 0x20uLL, 0, 0x20uLL);
      memset_s(__smax, 0x20uLL, 0, 0x20uLL);
      memset_s(v42, 0x20uLL, 0, 0x20uLL);
      if (v36)
      {
        memset_s(v36, __n, 0, __n);
        free(v36);
      }
      return v7;
    case 5:
      v61 = 0;
      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v48 = 0u;
      v46 = 0u;
      memset(v47, 0, sizeof(v47));
      __s = 0u;
      if (!a6)
        return 4294967285;
      if (!*a6)
        return 4294967285;
      v18 = a6[1];
      if (!v18)
        return 4294967285;
      v19 = fv_decode_vek_blob(*a6, *a6 + v18, (uint64_t)&__s);
      if ((_DWORD)v19)
        return v19;
      if (BYTE5(v47[0]) == 1)
        return 0;
      else
        return 4294967285;
    case 6:
      v61 = 0;
      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v48 = 0u;
      v46 = 0u;
      memset(v47, 0, sizeof(v47));
      __s = 0u;
      if (!a6)
        return 4294967285;
      if (!*a6)
        return 4294967285;
      v20 = a6[1];
      if (!v20)
        return 4294967285;
      return fv_decode_vek_blob_opts(*a6, *a6 + v20, (uint64_t)&__s, 1);
    case 7:
      v21 = *a1;
      *(_QWORD *)&v42[0] = 0;
      v62 = 0u;
      v63 = 0u;
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v48 = 0u;
      v46 = 0u;
      memset(v47, 0, sizeof(v47));
      __s = 0u;
      __smax[0] = 0;
      __smax[1] = 0;
      if (a4 && *(_QWORD *)a4 && *(_QWORD *)(a4 + 8))
      {
        if (!a5)
          goto LABEL_40;
        v22 = *(const unsigned __int8 **)a5;
        if (!*(_QWORD *)a5)
          goto LABEL_40;
        v23 = *(_QWORD *)(a5 + 8);
        if (!v23)
          goto LABEL_40;
      }
      else
      {
        if (!a5)
          goto LABEL_63;
        v22 = *(const unsigned __int8 **)a5;
        if (!*(_QWORD *)a5)
          goto LABEL_63;
        v23 = *(_QWORD *)(a5 + 8);
        if (!v23)
          goto LABEL_63;
        if (!a4)
        {
LABEL_40:
          v7 = 4294967285;
          goto LABEL_64;
        }
      }
      v25 = fv_decode_kek_blob((uint64_t)v22, (uint64_t)&v22[v23], (uint64_t)&__s);
      if ((_DWORD)v25
        || (v25 = _fv_verify_secret_opts(a4, (uint64_t)&__s, &v62, (size_t *)v42, v21, (void **)__smax), (_DWORD)v25)
        || (v21 & 8) != 0 && (v25 = fv_stash_create(), (_DWORD)v25))
      {
        v7 = v25;
LABEL_64:
        memset_s(&v62, 0x20uLL, 0, 0x20uLL);
        if (__smax[0])
        {
          memset_s((void *)__smax[0], __smax[1], 0, __smax[1]);
          free((void *)__smax[0]);
        }
        goto LABEL_21;
      }
LABEL_63:
      v7 = 0;
      goto LABEL_64;
    case 10:
      return 0;
    case 11:
    case 15:
    case 22:
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v48 = 0u;
      v46 = 0u;
      memset(v47, 0, sizeof(v47));
      __s = 0u;
      if (a5)
      {
        if (*(_QWORD *)a5
          && (v16 = *(_QWORD *)(a5 + 8)) != 0
          && (v17 = fv_decode_kek_blob_opts(*(_QWORD *)a5, *(_QWORD *)a5 + v16, (uint64_t)&__s, 1), (_DWORD)v17))
        {
          v7 = v17;
        }
        else
        {
          v7 = 0;
        }
      }
      else
      {
        v7 = 0xFFFFFFFFLL;
      }
LABEL_21:
      memset_s(&__s, 0xB0uLL, 0, 0xB0uLL);
      return v7;
    case 28:
      if (!a4 || !*(_QWORD *)a4 || *(_QWORD *)(a4 + 8) != 16)
        return 4294967285;
      __s = *(_OWORD *)*(_QWORD *)a4;
      filevault_purge_group(0, (unsigned __int8 *)&__s);
      return 0;
    default:
      return v7;
  }
}

uint64_t fv_get_blob_state(int a1, uint64_t *a2, char *__s)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  __int16 v8;
  int v9;
  uint64_t v11;
  uint64_t v12;
  int v13;
  char v14;
  int v15;
  int v16[6];
  __int128 __sa;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[4];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v44 = 0;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v29 = 0u;
  v27 = 0u;
  memset(v28, 0, sizeof(v28));
  v25 = 0u;
  v26 = 0u;
  v24 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  __sa = 0u;
  memset(v16, 0, 22);
  if (!a2 || !*a2)
  {
    v5 = 4294967285;
    goto LABEL_13;
  }
  v5 = 4294967285;
  if (__s && a2[1])
  {
    memset_s(__s, 0x58uLL, 0, 0x58uLL);
    v6 = fv_decode_info(*a2, *a2 + a2[1], v16, 0, 0, __s + 4, 0, 1);
    v7 = v6;
    v5 = v6;
    if ((_DWORD)v6 == -6)
    {
      *((_DWORD *)__s + 9) |= 0x2000000u;
      v5 = fv_decode_info(*a2, *a2 + a2[1], v16, 0, 0, __s + 4, 0, 0);
    }
    if ((_DWORD)v5)
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s failed to decode blob%s\n", "aks", "", "", "", "fv_get_blob_state");
      goto LABEL_13;
    }
    *(_OWORD *)(__s + 20) = *(_OWORD *)((char *)&v16[1] + 2);
    v8 = v16[0];
    v9 = LOBYTE(v16[1]);
    if (!LOBYTE(v16[1]))
    {
      if (!fv_decode_kek_blob_opts(*a2, *a2 + a2[1], (uint64_t)&__sa, v7 != -6))
      {
        LOBYTE(v16[1]) = 2;
LABEL_18:
        v11 = fv_decode_kek_blob_opts(*a2, *a2 + a2[1], (uint64_t)&__sa, v7 != -6);
        if ((_DWORD)v11)
        {
          v5 = v11;
          fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s failed to decode kek%s\n", "aks", "", "", "", "fv_get_blob_state");
          goto LABEL_13;
        }
        *(_DWORD *)__s = 2;
        *((_DWORD *)__s + 10) = __sa;
        __s[65] = BYTE13(v18);
LABEL_31:
        if ((v8 & 0x40) != 0)
        {
          *((_DWORD *)__s + 9) |= 0x80u;
          if ((v8 & 0x20) == 0)
          {
LABEL_33:
            if ((v8 & 0x800) == 0)
              goto LABEL_34;
            goto LABEL_46;
          }
        }
        else if ((v8 & 0x20) == 0)
        {
          goto LABEL_33;
        }
        *((_DWORD *)__s + 9) |= 0x40u;
        if ((v8 & 0x800) == 0)
        {
LABEL_34:
          if ((v8 & 2) == 0)
            goto LABEL_35;
          goto LABEL_47;
        }
LABEL_46:
        *((_DWORD *)__s + 9) |= 0x1000000u;
        if ((v8 & 2) == 0)
        {
LABEL_35:
          if ((v8 & 1) == 0)
            goto LABEL_36;
          goto LABEL_48;
        }
LABEL_47:
        *((_DWORD *)__s + 9) |= 0x10u;
        if ((v8 & 1) == 0)
        {
LABEL_36:
          if ((v8 & 8) == 0)
            goto LABEL_37;
          goto LABEL_49;
        }
LABEL_48:
        *((_DWORD *)__s + 9) |= 1u;
        if ((v8 & 8) == 0)
        {
LABEL_37:
          if ((v8 & 0x80) == 0)
            goto LABEL_38;
          goto LABEL_50;
        }
LABEL_49:
        *((_DWORD *)__s + 9) |= 0x20u;
        if ((v8 & 0x80) == 0)
        {
LABEL_38:
          if ((v8 & 0x10) == 0)
            goto LABEL_39;
          goto LABEL_51;
        }
LABEL_50:
        *((_DWORD *)__s + 9) |= 0x400u;
        *((_QWORD *)__s + 9) = v24;
        if ((v8 & 0x10) == 0)
        {
LABEL_39:
          if ((v8 & 4) == 0)
            goto LABEL_40;
          goto LABEL_52;
        }
LABEL_51:
        __s[64] |= 1u;
        if ((v8 & 4) == 0)
        {
LABEL_40:
          if ((v8 & 0x400) == 0)
            goto LABEL_42;
          goto LABEL_41;
        }
LABEL_52:
        __s[64] |= 2u;
        if ((v8 & 0x400) == 0)
        {
LABEL_42:
          v5 = 0;
          if ((v8 & 0x200) != 0)
            *((_DWORD *)__s + 9) |= 0x80000u;
          goto LABEL_13;
        }
LABEL_41:
        *((_DWORD *)__s + 9) |= 0x100000u;
        goto LABEL_42;
      }
      if (!fv_decode_vek_blob_opts(*a2, *a2 + a2[1], (uint64_t)v28, v7 != -6))
      {
        LOBYTE(v16[1]) = 1;
        goto LABEL_21;
      }
      v9 = LOBYTE(v16[1]);
    }
    if (v9 != 1)
    {
      if (v9 != 2)
      {
        fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s unknown blob type %i%s\n", "aks", "", "", "", "fv_get_blob_state", ":", 3477, "", 0, "", v9, "");
        v5 = 0xFFFFFFFFLL;
        goto LABEL_13;
      }
      goto LABEL_18;
    }
LABEL_21:
    v12 = fv_decode_vek_blob_opts(*a2, *a2 + a2[1], (uint64_t)v28, v7 != -6);
    if ((_DWORD)v12)
    {
      v5 = v12;
      fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s failed to decode vek%s\n", "aks", "", "", "", "fv_get_blob_state");
      goto LABEL_13;
    }
    *(_DWORD *)__s = 1;
    v13 = BYTE5(v29);
    __s[65] = BYTE5(v29);
    *((_DWORD *)__s + 10) = v28[1];
    if (v13)
    {
      if (v13 != 1)
        goto LABEL_31;
      v14 = v44;
      if ((v44 & 1) != 0)
        *((_DWORD *)__s + 9) |= 8u;
      if ((v14 & 2) == 0)
        goto LABEL_31;
      v15 = *((_DWORD *)__s + 9) | 4;
    }
    else
    {
      if ((BYTE1(v29) & 0x10) == 0)
        goto LABEL_31;
      v15 = *((_DWORD *)__s + 9) | 0x8000000;
    }
    *((_DWORD *)__s + 9) = v15;
    goto LABEL_31;
  }
LABEL_13:
  memset_s(&__sa, 0xB0uLL, 0, 0xB0uLL);
  return v5;
}

uint64_t fv_new_vek(_QWORD *a1, uint64_t a2, uint64_t *a3, unsigned __int8 *a4, uint64_t a5, uint64_t a6)
{
  _BOOL4 v12;
  uint64_t size;
  uint64_t vek_data;
  uint64_t v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;
  size_t v20;
  _OWORD *v21;
  __int128 v22;
  uint64_t v24;
  char *v25;
  size_t __count;
  size_t v27;
  _OWORD __s[11];
  _OWORD v29[17];
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _OWORD v35[2];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  memset(v35, 0, sizeof(v35));
  v27 = 32;
  v30 = 0;
  memset(v29, 0, sizeof(v29));
  memset(__s, 0, sizeof(__s));
  __count = 0;
  v12 = a3 && *a3 && a3[1] != 0;
  v33 = 0uLL;
  v34 = 0uLL;
  v31 = 0uLL;
  v32 = 0uLL;
  size = fv_get_size(0, 1, (uint64_t *)&__count);
  if ((_DWORD)size)
  {
LABEL_30:
    vek_data = size;
    goto LABEL_20;
  }
  if (!__count)
  {
    vek_data = 4294967286;
    goto LABEL_20;
  }
  vek_data = 4294967285;
  if (!a4 || !a5 || !*(_QWORD *)a5 || __count > *(_QWORD *)(a5 + 8))
    goto LABEL_20;
  if (v12)
  {
    if (!a3)
      goto LABEL_20;
    if (!*a3)
      goto LABEL_20;
    v15 = a3[1];
    if (!v15)
      goto LABEL_20;
    size = fv_decode_kek_blob(*a3, *a3 + v15, (uint64_t)__s);
    if (!(_DWORD)size)
    {
      size = _fv_verify_secret_opts(a2, (uint64_t)__s, v35, &v27, *a1, 0);
      if (!(_DWORD)size)
      {
        size = _create_vek_data(a4, BYTE8(__s[1]) & 9, (unsigned __int8 *)v35, v27, (uint64_t)v29, (unsigned __int8 *)&v31);
        if (!(_DWORD)size)
        {
          *(_OWORD *)((char *)&v29[2] + 6) = *(_OWORD *)((char *)&__s[1] + 14);
          goto LABEL_21;
        }
      }
    }
    goto LABEL_30;
  }
  vek_data = _create_vek_data(a4, 0, 0, 0, (uint64_t)v29, (unsigned __int8 *)&v31);
  if ((_DWORD)vek_data)
  {
LABEL_20:
    memset_s(__s, 0xB0uLL, 0, 0xB0uLL);
    goto LABEL_29;
  }
LABEL_21:
  v16 = (char *)calloc(__count, 1uLL);
  if (!v16)
  {
    vek_data = 4294967279;
    goto LABEL_20;
  }
  v17 = v16;
  v24 = (uint64_t)v16;
  v25 = &v16[__count];
  if (fv_encode_vek_blob(&v24, (uint64_t)v29))
  {
    v18 = v25;
    v19 = v24;
    v20 = &v17[__count] - v25;
    *(_QWORD *)(a5 + 8) = v20;
    memcpy(*(void **)a5, &v18[(_QWORD)v17 - v19], v20);
    if (a6)
    {
      v21 = *(_OWORD **)a6;
      if (*(_QWORD *)a6 && *(_QWORD *)(a6 + 8) >= 0x20uLL)
      {
        vek_data = 0;
        *(_QWORD *)(a6 + 8) = 32;
        v22 = v32;
        *v21 = v31;
        v21[1] = v22;
      }
      else
      {
        vek_data = 0xFFFFFFFFLL;
      }
    }
    else
    {
      vek_data = 0;
    }
  }
  else
  {
    vek_data = 4294967273;
  }
  memset_s(__s, 0xB0uLL, 0, 0xB0uLL);
  memset_s(v17, __count, 0, __count);
  free(v17);
LABEL_29:
  memset_s(v35, 0x20uLL, 0, 0x20uLL);
  memset_s(&v31, 0x40uLL, 0, 0x40uLL);
  return vek_data;
}

uint64_t _create_vek_data(unsigned __int8 *src, int a2, unsigned __int8 *a3, unsigned int a4, uint64_t a5, unsigned __int8 *a6)
{
  uint64_t v10;
  uint64_t v12;
  int v13;
  unsigned int v14;
  _OWORD __s[2];
  _OWORD v16[2];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  memset(v16, 0, sizeof(v16));
  v14 = 0;
  memset(__s, 0, sizeof(__s));
  *(_OWORD *)a5 = 0u;
  *(_OWORD *)(a5 + 32) = 0u;
  *(_OWORD *)(a5 + 48) = 0u;
  *(_OWORD *)(a5 + 64) = 0u;
  *(_OWORD *)(a5 + 80) = 0u;
  *(_OWORD *)(a5 + 96) = 0u;
  *(_OWORD *)(a5 + 112) = 0u;
  *(_OWORD *)(a5 + 128) = 0u;
  *(_OWORD *)(a5 + 144) = 0u;
  *(_OWORD *)(a5 + 160) = 0u;
  *(_OWORD *)(a5 + 176) = 0u;
  *(_OWORD *)(a5 + 192) = 0u;
  *(_OWORD *)(a5 + 208) = 0u;
  *(_OWORD *)(a5 + 224) = 0u;
  *(_OWORD *)(a5 + 240) = 0u;
  *(_OWORD *)(a5 + 256) = 0u;
  *(_QWORD *)(a5 + 272) = 0;
  *(_OWORD *)(a5 + 16) = 0u;
  *(_BYTE *)(a5 + 36) = 1;
  *(_DWORD *)(a5 + 32) = a2 & 0xFFFFFFFD;
  uuid_copy((unsigned __int8 *)(a5 + 16), src);
  platform_read_random(a5, 8u);
  platform_read_random((uint64_t)a6, 0x20u);
  if (*(_QWORD *)(a5 + 8) || *(_BYTE *)(a5 + 37))
  {
    v10 = 4294967284;
    goto LABEL_4;
  }
  if (a3)
  {
    if (_bind_unmanaged_vek(a5, a3, a4, a6))
    {
LABEL_14:
      v10 = 0xFFFFFFFFLL;
      goto LABEL_4;
    }
LABEL_13:
    v10 = 0;
    goto LABEL_4;
  }
  v13 = 40;
  v10 = 4294967285;
  if (rfc3394_wrapped_size_legacy(0x20u, &v14) && v14 <= 0x28)
  {
    v12 = _volume_entropy_d_derive_from_vek_data(a5, __s);
    if ((_DWORD)v12)
    {
      v10 = v12;
      goto LABEL_4;
    }
    if (rfc3394_wrap_legacy((uint64_t)__s, 0x20u, 0xA6A6A6A6A6A6A6A6, 0, (uint64_t *)a6, 0x20u, (_QWORD *)(a5 + 56), &v13))goto LABEL_14;
    *(_DWORD *)(a5 + 32) |= 0x1000u;
    goto LABEL_13;
  }
LABEL_4:
  memset_s(__s, 0x20uLL, 0, 0x20uLL);
  memset_s(v16, 0x20uLL, 0, 0x20uLL);
  return v10;
}

uint64_t fv_unwrap_vek(uint64_t *a1, unsigned int a2, uint64_t a3, uint64_t *a4, uint64_t *a5, uint64_t a6, uint64_t a7)
{
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t kek_from_blob;
  _BYTE *v13;
  unint64_t v14;
  _OWORD *v15;
  __int128 v16;
  uint64_t v17;
  int v18;
  FILE *v19;
  unsigned __int8 *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  uint64_t v25;
  int v26;
  void *v27;
  rsize_t __n;
  size_t v29;
  uuid_t v30;
  uuid_t dst;
  __int128 v32;
  __int128 v33;
  _OWORD v34[15];
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE __s[40];
  uint64_t v41;
  _QWORD v42[2];
  __int128 v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  memset(__s, 0, 32);
  v29 = 32;
  v35 = 0;
  v33 = 0u;
  memset(v34, 0, sizeof(v34));
  v32 = 0u;
  v9 = a4 && *a4 && a4[1] != 0;
  v38 = 0uLL;
  v39 = 0uLL;
  v36 = 0uLL;
  v37 = 0uLL;
  v27 = 0;
  __n = 0;
  memset(dst, 0, sizeof(dst));
  memset(v30, 0, sizeof(v30));
  v26 = 0;
  if (!a5)
    goto LABEL_48;
  if (!*a5)
    goto LABEL_48;
  v10 = a5[1];
  if (!v10)
    goto LABEL_48;
  if (v9)
  {
    v11 = *a1;
    if ((v11 & 0x40) == 0)
    {
      kek_from_blob = fv_get_kek_from_blob(v11, (a2 >> 1) & 1, a3, a4, __s, &v29, &v26, v30, dst, &v27);
      if (!(_DWORD)kek_from_blob)
      {
        kek_from_blob = fv_decode_vek_blob(*a5, *a5 + a5[1], (uint64_t)&v32);
        if (!(_DWORD)kek_from_blob)
        {
          v13 = __s;
          goto LABEL_15;
        }
      }
LABEL_49:
      v17 = kek_from_blob;
      goto LABEL_39;
    }
    if (a4 && a4[1] == 16)
    {
      uuid_copy(v30, (const unsigned __int8 *)*a4);
      v17 = 4294967284;
      goto LABEL_39;
    }
LABEL_48:
    v17 = 4294967285;
    goto LABEL_39;
  }
  kek_from_blob = fv_decode_vek_blob(*a5, *a5 + v10, (uint64_t)&v32);
  if ((_DWORD)kek_from_blob)
    goto LABEL_49;
  uuid_copy(dst, (const unsigned __int8 *)v34 + 6);
  v13 = 0;
LABEL_15:
  if (v9)
    v14 = v29;
  else
    v14 = 0;
  kek_from_blob = fv_decrypt_vek((uint64_t)v13, v14, (uint64_t)&v32, (uint64_t)&v36);
  if ((_DWORD)kek_from_blob)
    goto LABEL_49;
  if (!a7)
  {
LABEL_23:
    v17 = 0;
    v18 = 1;
LABEL_24:
    v43 = v33;
    goto LABEL_25;
  }
  v15 = *(_OWORD **)a7;
  if (*(_QWORD *)a7 && *(_QWORD *)(a7 + 8) >= 0x20uLL)
  {
    *(_QWORD *)(a7 + 8) = 32;
    v16 = v37;
    *v15 = v36;
    v15[1] = v16;
    goto LABEL_23;
  }
  v17 = 0xFFFFFFFFLL;
LABEL_39:
  v43 = 0uLL;
  if ((_akslog_filter & 1) == 0)
  {
    v18 = 0;
    goto LABEL_24;
  }
  v41 = 0;
  v42[0] = 0;
  *(_QWORD *)((char *)v42 + 6) = 0;
  if (v9)
    dump_bytes_internal("kek group", (uint64_t)dst, 0x10uLL);
  if (a5)
  {
    if (*a5)
    {
      v25 = a5[1];
      if (v25)
      {
        fv_decode_info(*a5, *a5 + v25, (int *)&v41, 0, 0, &v43, 0, 1);
        dump_bytes_internal("vek group", (uint64_t)&v41 + 6, 0x10uLL);
      }
    }
  }
  v18 = 0;
LABEL_25:
  v19 = (FILE *)*MEMORY[0x24BDAC8E8];
  if (v9)
    v20 = v30;
  else
    v20 = (unsigned __int8 *)&v43;
  if (v9)
    v21 = "user";
  else
    v21 = "volume";
  v22 = bytes_to_str_hint(v20, 0x10uLL);
  v23 = "failed";
  if (v18)
    v23 = "successful";
  fprintf(v19, "%s%s:%s%s%s%s%u:%s%u:%s %s %s unlock %s (%d)%s\n", "aks", "", "", "", "_unlock_result", ":", 3843, "", 0, "", v21, v22, v23, v17, "");
  memset_s(__s, 0x20uLL, 0, 0x20uLL);
  memset_s(&v36, 0x40uLL, 0, 0x40uLL);
  if (v27)
  {
    memset_s(v27, __n, 0, __n);
    free(v27);
  }
  return v17;
}

uint64_t fv_new_kek(_BYTE *a1, unsigned int a2, uint64_t a3, const unsigned __int8 *a4, uint64_t a5)
{
  return fv_create_kek(a1, a2, a3, a4, UUID_NULL, 0, a5);
}

uint64_t fv_create_kek(_BYTE *a1, unsigned int a2, uint64_t a3, const unsigned __int8 *a4, const unsigned __int8 *a5, __int128 *a6, uint64_t a7)
{
  uint64_t size;
  char *v15;
  char *v16;
  char *v17;
  uint64_t v18;
  size_t v19;
  uint64_t v20;
  uint64_t v22;
  char *v23;
  size_t __count;
  _OWORD __s[11];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  memset(__s, 0, sizeof(__s));
  __count = 0;
  size = fv_get_size(0, 2, (uint64_t *)&__count);
  if ((_DWORD)size)
    goto LABEL_13;
  if (!__count)
  {
    v20 = 4294967286;
    goto LABEL_16;
  }
  if (!a7 || !*(_QWORD *)a7 || __count > *(_QWORD *)(a7 + 8))
  {
    v20 = 4294967285;
LABEL_16:
    memset_s(__s, 0xB0uLL, 0, 0xB0uLL);
    return v20;
  }
  size = _create_kek_data(a5, a4, a2 & 1 | (((a2 >> 2) & 1) << 11), a3, a6, (uint64_t)__s, *a1 & 4);
  if ((_DWORD)size)
  {
LABEL_13:
    v20 = size;
    goto LABEL_16;
  }
  v15 = (char *)calloc(__count, 1uLL);
  if (!v15)
  {
    v20 = 4294967279;
    goto LABEL_16;
  }
  v16 = v15;
  v22 = (uint64_t)v15;
  v23 = &v15[__count];
  if (fv_encode_kek_blob(&v22, (uint64_t)__s))
  {
    v17 = v23;
    v18 = v22;
    v19 = &v16[__count] - v23;
    *(_QWORD *)(a7 + 8) = v19;
    memcpy(*(void **)a7, &v17[(_QWORD)v16 - v18], v19);
    v20 = 0;
  }
  else
  {
    v20 = 4294967273;
  }
  memset_s(__s, 0xB0uLL, 0, 0xB0uLL);
  memset_s(v16, __count, 0, __count);
  free(v16);
  return v20;
}

uint64_t _create_kek_data(const unsigned __int8 *a1, const unsigned __int8 *a2, int a3, uint64_t a4, __int128 *a5, uint64_t a6, char a7)
{
  uint64_t inited;
  __int128 v13;
  _BYTE *v14;
  _OWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  _QWORD *v22;
  unsigned int v23;
  unsigned int effective_info_size;
  unsigned int v26;
  void *v27;
  rsize_t __n;
  size_t v29;
  __int128 v30;
  __int128 v31;
  _OWORD v32[2];
  _OWORD __s[2];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  memset(v32, 0, sizeof(v32));
  __n = 0;
  v29 = 32;
  v30 = 0u;
  v31 = 0u;
  v27 = 0;
  v26 = 0;
  if (!a2)
  {
    v16 = 0xFFFFFFFFLL;
    goto LABEL_39;
  }
  if (!a6)
  {
    v16 = 4294967285;
    goto LABEL_37;
  }
  inited = fv_init_cred_from_secret(&v27, a4, (a7 & 4) != 0);
  if ((_DWORD)inited)
    goto LABEL_40;
  if (a5)
  {
    v13 = a5[1];
    v30 = *a5;
    v31 = v13;
  }
  else
  {
    platform_read_random((uint64_t)&v30, 0x20u);
  }
  *(_OWORD *)a6 = 0u;
  *(_OWORD *)(a6 + 16) = 0u;
  *(_DWORD *)(a6 + 24) = (8 * a3) & 0x10 | a3 & 0xFFFFF9BD;
  v14 = (_BYTE *)(a6 + 24);
  *(_OWORD *)(a6 + 144) = 0u;
  *(_OWORD *)(a6 + 160) = 0u;
  *(_OWORD *)(a6 + 112) = 0u;
  *(_OWORD *)(a6 + 128) = 0u;
  *(_OWORD *)(a6 + 80) = 0u;
  *(_OWORD *)(a6 + 96) = 0u;
  *(_OWORD *)(a6 + 48) = 0u;
  *(_OWORD *)(a6 + 64) = 0u;
  *(_OWORD *)(a6 + 32) = 0u;
  *(_BYTE *)(a6 + 28) = 2;
  v15 = (_OWORD *)(a6 + 30);
  if (uuid_compare(UUID_NULL, a1))
  {
    *v15 = *(_OWORD *)a1;
  }
  else
  {
    v17 = 16;
    while (1)
    {
      MEMORY[0x2207CAD48](a6 + 30);
      if (*(_BYTE *)v15 || *(_BYTE *)(a6 + 31))
        break;
      if (!--v17)
      {
        fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s failed to generate valid kek group uuid after 16 attempts%s\n", "aks", "", "", "", "_create_kek_data", ":", 4168, "", 0, "", "");
        v16 = 4294967286;
        goto LABEL_37;
      }
    }
  }
  uuid_copy((unsigned __int8 *)(a6 + 8), a2);
  fv_kek_global_policy_eval(a6);
  if (*(_QWORD *)a6)
    goto LABEL_10;
  if (*(_BYTE *)(a6 + 29) != 1)
  {
    if (*(_BYTE *)(a6 + 29))
    {
LABEL_10:
      v16 = 4294967284;
      goto LABEL_37;
    }
    platform_read_random(a6 + 96, 0x10u);
    memset(__s, 0, sizeof(__s));
    v18 = mach_continuous_time();
    ccsha256_di();
    if (ccpbkdf2_hmac())
    {
      v21 = 0;
    }
    else
    {
      v19 = mach_continuous_time();
      memset_s(__s, 0x20uLL, 0, 0x20uLL);
      v20 = time_absolute_to_nanoseconds(v19 - v18);
      v21 = 100000;
      if (v20)
        v21 = 0x174876E800 / v20;
    }
    if (v21 <= 0x186A0)
      v21 = 100000;
    *(_QWORD *)(a6 + 88) = v21;
    inited = _fv_master_key_derive(a6, v27, __n, v32, &v29);
    if (!(_DWORD)inited)
    {
      LODWORD(__s[0]) = 40;
      v16 = 4294967285;
      if (rfc3394_wrapped_size_legacy(0x20u, &v26) && v26 <= 0x28)
      {
        v22 = (_QWORD *)(a6 + 48);
        v23 = v29;
LABEL_31:
        if (rfc3394_wrap_legacy((uint64_t)v32, v23, 0xA6A6A6A6A6A6A6A6, 0, (uint64_t *)&v30, 0x20u, v22, __s)|| (*v14 & 1) != 0 && (needs_ctx() & 1) == 0)
        {
          v16 = 0xFFFFFFFFLL;
        }
        else
        {
          effective_info_size = fv_get_effective_info_size();
          if (effective_info_size <= 0x15)
            bzero(&v14[effective_info_size], 22 - effective_info_size);
          v16 = 0;
        }
        goto LABEL_37;
      }
      goto LABEL_37;
    }
LABEL_40:
    v16 = inited;
    goto LABEL_37;
  }
  inited = _fv_master_key_derive(a6, v27, __n, v32, &v29);
  if ((_DWORD)inited)
    goto LABEL_40;
  LODWORD(__s[0]) = 40;
  v16 = 4294967285;
  if (rfc3394_wrapped_size_legacy(0x20u, &v26) && v26 <= 0x28)
  {
    v23 = v29;
    v22 = (_QWORD *)(a6 + 48);
    goto LABEL_31;
  }
LABEL_37:
  if (v27)
  {
    memset_s(v27, __n, 0, __n);
    free(v27);
  }
LABEL_39:
  memset_s(v32, 0x20uLL, 0, 0x20uLL);
  memset_s(&v30, 0x20uLL, 0, 0x20uLL);
  return v16;
}

uint64_t fv_rewrap_kek(_QWORD *a1, uint64_t a2, uint64_t *a3, const unsigned __int8 *a4, uint64_t a5, uint64_t a6)
{
  uint64_t size;
  int v13;
  char *v14;
  uint64_t v15;
  size_t v16;
  uint64_t v17;
  uint64_t kek_data;
  char *v19;
  char *v20;
  uint64_t v21;
  size_t v22;
  uint64_t v24;
  char *v25;
  size_t __count;
  size_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _OWORD __s[7];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _OWORD v44[2];
  __int128 v45[2];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  memset(v45, 0, sizeof(v45));
  memset(v44, 0, sizeof(v44));
  __count = 0;
  v27 = 32;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  memset(__s, 0, sizeof(__s));
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  size = fv_get_size(0, 2, (uint64_t *)&__count);
  if ((_DWORD)size)
    goto LABEL_26;
  if (!__count)
  {
    v14 = 0;
    v13 = 0;
    v15 = 4294967286;
    goto LABEL_21;
  }
  v13 = 0;
  v14 = 0;
  v15 = 4294967285;
  if (a4 && a5 && a6)
  {
    if (!*(_QWORD *)a6)
      goto LABEL_27;
    v16 = *(_QWORD *)(a6 + 8);
    if (!v16)
      goto LABEL_27;
    v13 = 0;
    v14 = 0;
    v15 = 4294967285;
    if (a3 && __count <= v16)
    {
      if (*a3)
      {
        v17 = a3[1];
        if (v17)
        {
          size = fv_decode_kek_blob(*a3, *a3 + v17, (uint64_t)__s);
          if (!(_DWORD)size)
          {
            if ((BYTE8(__s[1]) & 0x80) != 0 && (_QWORD)v40)
            {
              v14 = 0;
              v13 = 0;
              v15 = 4294967263;
              goto LABEL_21;
            }
            size = _fv_verify_secret_opts(a2, (uint64_t)__s, v45, &v27, *a1, 0);
            if (!(_DWORD)size)
            {
              v13 = DWORD2(__s[1]);
              kek_data = _create_kek_data((const unsigned __int8 *)&__s[1] + 14, a4, SDWORD2(__s[1]), a5, v45, (uint64_t)&v28, *a1);
              if ((_DWORD)kek_data)
              {
                v15 = kek_data;
                v14 = 0;
              }
              else
              {
                v19 = (char *)calloc(__count, 1uLL);
                v14 = v19;
                if (v19)
                {
                  v24 = (uint64_t)v19;
                  v25 = &v19[__count];
                  if (fv_encode_kek_blob(&v24, (uint64_t)&v28))
                  {
                    v20 = v25;
                    v21 = v24;
                    v22 = &v14[__count] - v25;
                    *(_QWORD *)(a6 + 8) = v22;
                    memcpy(*(void **)a6, &v20[(_QWORD)v14 - v21], v22);
                    v15 = 0;
                  }
                  else
                  {
                    v15 = 4294967273;
                  }
                }
                else
                {
                  v15 = 4294967279;
                }
              }
              goto LABEL_21;
            }
          }
LABEL_26:
          v15 = size;
          v14 = 0;
          v13 = 0;
          goto LABEL_21;
        }
      }
LABEL_27:
      v14 = 0;
      v13 = 0;
      v15 = 4294967285;
    }
  }
LABEL_21:
  if ((_akslog_filter & 1) != 0)
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s %sresult: %d; passcode_change: %d; cf: 0x%x; of: 0x%x; nf: 0x%x%s\n",
      "aks",
      "",
      "",
      "",
      "fv_rewrap_kek",
      ":",
      4580,
      "",
      0,
      "",
      "",
      v15,
      0,
      v13,
      DWORD2(__s[1]),
      DWORD2(v29),
      "");
  memset_s(__s, 0xB0uLL, 0, 0xB0uLL);
  memset_s(&v28, 0xB0uLL, 0, 0xB0uLL);
  if (v14)
  {
    memset_s(v14, __count, 0, __count);
    free(v14);
  }
  memset_s(v45, 0x20uLL, 0, 0x20uLL);
  memset_s(v44, 0x20uLL, 0, 0x20uLL);
  return v15;
}

uint64_t _fv_verify_secret_opts(uint64_t a1, uint64_t a2, void *a3, size_t *a4, char a5, void **a6)
{
  uint64_t v6;
  uint64_t inited;
  size_t v12;
  rsize_t v13;
  void *v15;
  rsize_t __smax;
  _DWORD __n[3];
  __int128 __src;
  __int128 v19;
  _OWORD __s[2];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  memset(__s, 0, sizeof(__s));
  *(_QWORD *)&__n[1] = 32;
  __src = 0u;
  v19 = 0u;
  __n[0] = 32;
  v15 = 0;
  __smax = 0;
  v6 = 4294967285;
  if (a1 && a2)
  {
    inited = fv_init_cred_from_secret(&v15, a1, (a5 & 4) != 0);
    if ((_DWORD)inited
      || (inited = _fv_master_key_derive(a2, v15, __smax, __s, (size_t *)&__n[1]), (_DWORD)inited)
      || (inited = _fv_decrypt_kek(a2, (uint64_t)__s, __n[1], &__src, __n), (_DWORD)inited))
    {
      v6 = inited;
    }
    else
    {
      if (a3 && a4)
      {
        if ((*(_BYTE *)(a2 + 120) & 1) != 0 && !is_non_zero((unsigned __int8 *)&v19, 16))
          *(_DWORD *)(a2 + 24) |= 0x10u;
        if ((*(_BYTE *)(a2 + 24) & 0x10) != 0)
        {
          v12 = 16;
          __n[0] = 16;
        }
        else
        {
          v12 = __n[0];
        }
        memcpy(a3, &__src, v12);
        *a4 = v12;
      }
      v6 = 0;
      if (a6)
      {
        v13 = __smax;
        *a6 = v15;
        a6[1] = (void *)v13;
        v15 = 0;
        __smax = 0;
      }
    }
  }
  memset_s(__s, 0x20uLL, 0, 0x20uLL);
  memset_s(&__src, 0x20uLL, 0, 0x20uLL);
  if (v15)
  {
    memset_s(v15, __smax, 0, __smax);
    free(v15);
  }
  return v6;
}

uint64_t _fv_master_key_derive(uint64_t a1, void *__src, size_t __n, void *a4, size_t *a5)
{
  int v10;
  size_t v11;
  uint64_t v12;
  size_t v13;
  uint64_t v14;
  uint64_t v15;
  size_t v16;
  _OWORD v18[2];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  memset(v18, 0, sizeof(v18));
  if (*(_BYTE *)(a1 + 28) != 2 || *a5 != 32)
  {
    v14 = 4294967285;
    goto LABEL_24;
  }
  v10 = *(_DWORD *)(a1 + 24);
  if ((v10 & 2) != 0)
    v11 = 16;
  else
    v11 = 32;
  if ((v10 & 1) != 0)
  {
    v12 = ccsha256_di();
    if (__src)
      v13 = __n;
    else
      v13 = 0;
    if (firebloom_ccpbkdf2_hmac(v12, v13, __src, 16, a1 + 96, 1, v11, v18))
      goto LABEL_20;
    if (!needs_ctx())
      goto LABEL_26;
  }
  if (!*(_QWORD *)a1)
  {
    if (*(_BYTE *)(a1 + 29) != 1)
    {
      if (*(_BYTE *)(a1 + 29))
        goto LABEL_13;
      v15 = ccsha256_di();
      if (__src)
        v16 = __n;
      else
        v16 = 0;
      if (firebloom_ccpbkdf2_hmac(v15, v16, __src, 16, a1 + 96, *(_QWORD *)(a1 + 88), v11, v18))
      {
LABEL_20:
        v14 = 4294967274;
        goto LABEL_24;
      }
LABEL_23:
      memcpy(a4, v18, v11);
      v14 = 0;
      *a5 = v11;
      goto LABEL_24;
    }
    if (__n <= 0x20)
    {
      memcpy(v18, __src, __n);
      v11 = __n;
      goto LABEL_23;
    }
LABEL_26:
    v14 = 0xFFFFFFFFLL;
    goto LABEL_24;
  }
LABEL_13:
  v14 = 4294967284;
LABEL_24:
  memset_s(v18, 0x20uLL, 0, 0x20uLL);
  return v14;
}

uint64_t _fv_decrypt_kek(uint64_t a1, uint64_t a2, unsigned int a3, _QWORD *a4, _DWORD *a5)
{
  unsigned int v10;
  uint64_t result;
  size_t v12;
  unsigned int v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (*a5 != 32)
    return 4294967285;
  if (*(_QWORD *)a1 || *(unsigned __int8 *)(a1 + 29) > 1u)
    return 4294967284;
  if ((*(_BYTE *)(a1 + 24) & 2) != 0)
  {
    *a5 = 16;
    v10 = 24;
  }
  else
  {
    v10 = 40;
  }
  v12 = v10;
  v13 = MEMORY[0x24BDAC7A8]();
  v15 = (char *)&v16 - v14;
  HIDWORD(v16) = 0;
  if (!rfc3394_unwrapped_size_legacy(v13, (unsigned int *)&v16 + 1) || HIDWORD(v16) > *a5)
    return 4294967285;
  memcpy(v15, (const void *)(a1 + 48), v12);
  if ((*(_BYTE *)(a1 + 24) & 1) != 0 && !needs_ctx())
    return 0xFFFFFFFFLL;
  result = rfc3394_unwrap_legacy(a2, a3, 0xA6A6A6A6A6A6A6A6, 0, v15, v12, a4, a5);
  if ((_DWORD)result)
    return 4294967291;
  return result;
}

uint64_t _bind_unmanaged_vek(uint64_t a1, unsigned __int8 *a2, unsigned int a3, unsigned __int8 *a4)
{
  uint64_t result;
  int v9;
  int v10;
  unsigned int v11;

  v11 = 0;
  if (!is_non_zero(a2, 32))
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s Internal Error: Null KEK, file radar%s\n", "aks", "", "", "", "_bind_unmanaged_vek");
    return 4294967286;
  }
  if (!is_non_zero(a4, 32))
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s Internal Error: Null VEK, file radar%s\n", "aks", "", "", "", "_bind_unmanaged_vek");
    return 4294967286;
  }
  if (*(_QWORD *)(a1 + 8))
    return 4294967284;
  v9 = rfc3394_wrapped_size_legacy(0x20u, &v11);
  result = 4294967285;
  if (v9 && v11 <= 0x28)
  {
    if (!rfc3394_wrap_legacy((uint64_t)a2, a3, 0xA6A6A6A6A6A6A6A6, 0, (uint64_t *)a4, 0x20u, (_QWORD *)(a1 + 56), &v11))
    {
      v10 = *(_DWORD *)(a1 + 32);
      if ((v10 & 1) == 0)
      {
LABEL_11:
        result = 0;
        *(_DWORD *)(a1 + 32) = v10 & 0xFFFFEFFF;
        return result;
      }
      if (needs_ctx())
      {
        v10 = *(_DWORD *)(a1 + 32);
        goto LABEL_11;
      }
    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t firebloom_cbc_update_f()
{
  return cccbc_update();
}

uint64_t rfc3394_wrap(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, void *, uint64_t *, uint64_t *, uint64_t), uint64_t *a5, unint64_t a6, _QWORD *a7, unint64_t *a8)
{
  size_t v14;
  size_t v15;
  uint64_t v16;
  unint64_t v17;
  BOOL v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  unint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v34;
  unint64_t v35;
  _QWORD *v36;
  uint64_t *v37;
  unint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  _OWORD __s[4];
  uint64_t v43;

  v39 = a1;
  v40 = a3;
  v43 = *MEMORY[0x24BDAC8D0];
  memset(__s, 0, sizeof(__s));
  ccaes_cbc_encrypt_mode();
  MEMORY[0x24BDAC7A8]();
  v41 = (char *)&v34 - v14;
  bzero((char *)&v34 - v14, v14);
  MEMORY[0x24BDAC7A8]();
  bzero((char *)&v34 - v15, v15);
  v16 = 0xFFFFFFFFLL;
  if (HIDWORD(a6) || (a6 - 40) < 0xFFFFFFE0)
    goto LABEL_30;
  v37 = &v34;
  v38 = a8;
  v36 = a7;
  if (!a4)
  {
    v18 = (a2 & 0xFFFFFFFFFFFFFFF7) == 0x10 || a2 == 32;
    if (!v18 || !a8 || *a8 < a6 + 8)
    {
      memset_s(__s, 0x40uLL, 0, 0x40uLL);
      goto LABEL_31;
    }
    v35 = a6 + 8;
    cccbc_init();
    goto LABEL_15;
  }
  if (a8)
  {
    v17 = *v38;
    v35 = a6 + 8;
    if (v17 >= a6 + 8)
    {
LABEL_15:
      v19 = 0;
      v20 = a6 >> 3;
      if (a6 >> 3 <= 1)
        v21 = 1;
      else
        v21 = v20;
      do
      {
        v22 = *a5++;
        *((_QWORD *)&__s[v19++] + 1) = v22;
      }
      while (v21 != v19);
      v23 = 0;
      *(_QWORD *)&__s[0] = v40;
      v24 = 1;
      v39 = v20;
      do
      {
        v40 = v23;
        v25 = 0;
        v26 = (uint64_t *)__s;
        do
        {
          if (a4)
          {
            if ((a4(1, &firebloom_null_iv, v26, v26, 16) & 1) == 0)
              goto LABEL_6;
          }
          else
          {
            cccbc_clear_iv();
            firebloom_cbc_update_f();
          }
          v27 = *v26;
          v26 += 2;
          v28 = v27 ^ bswap64(v24 + v25++);
          *(_QWORD *)&__s[v25 % v20] = v28;
        }
        while (v21 != v25);
        v23 = v40 + 1;
        v24 += v39;
      }
      while (v40 != 5);
      v29 = v36;
      *v36 = *(_QWORD *)&__s[0];
      v30 = v29 + 1;
      v31 = (uint64_t *)__s + 1;
      do
      {
        v32 = *v31;
        v31 += 2;
        *v30++ = v32;
        --v21;
      }
      while (v21);
      v16 = 0;
      *v38 = v35 & 0xFFFFFFF8;
LABEL_30:
      memset_s(__s, 0x40uLL, 0, 0x40uLL);
      if (a4)
        return v16;
LABEL_31:
      cc_clear();
      return v16;
    }
  }
LABEL_6:
  memset_s(__s, 0x40uLL, 0, 0x40uLL);
  return 0xFFFFFFFFLL;
}

uint64_t rfc3394_wrap_legacy(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t (*a4)(uint64_t, void *, uint64_t *, uint64_t *, uint64_t), uint64_t *a5, unsigned int a6, _QWORD *a7, _DWORD *a8)
{
  uint64_t v9;
  unint64_t v11;

  v11 = *a8;
  v9 = rfc3394_wrap(a1, a2, a3, a4, a5, a6, a7, &v11);
  REQUIRE_func(HIDWORD(v11) == 0, 171, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/aeskeywrap.c");
  *a8 = v11;
  return v9;
}

uint64_t rfc3394_unwrap(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD, void *, unint64_t *, unint64_t *, uint64_t), _QWORD *a5, unint64_t a6, _QWORD *a7, _QWORD *a8)
{
  size_t v14;
  size_t v15;
  uint64_t v16;
  unsigned int v17;
  BOOL v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  int v25;
  unint64_t *v26;
  int v27;
  unsigned int v28;
  BOOL v29;
  _QWORD *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t *v38;
  _QWORD *v39;
  unint64_t *v40;
  uint64_t v41;
  unint64_t v42;
  _QWORD *v43;
  char *v44;
  _OWORD __s[4];
  uint64_t v46;

  v43 = a5;
  v41 = a1;
  v46 = *MEMORY[0x24BDAC8D0];
  memset(__s, 0, sizeof(__s));
  ccaes_cbc_decrypt_mode();
  MEMORY[0x24BDAC7A8]();
  v44 = (char *)&v35 - v14;
  bzero((char *)&v35 - v14, v14);
  MEMORY[0x24BDAC7A8]();
  bzero((char *)&v35 - v15, v15);
  v16 = 0xFFFFFFFFLL;
  if (HIDWORD(a6))
    goto LABEL_33;
  v37 = a3;
  v17 = a6 >> 3;
  if ((a6 >> 3) - 6 < 0xFFFFFFFC)
    goto LABEL_33;
  v38 = &v35;
  v39 = a8;
  v36 = a7;
  v42 = a6;
  if (!a4)
  {
    v18 = (a2 & 0xFFFFFFFFFFFFFFF7) == 0x10 || a2 == 32;
    if (!v18 || !a8 || *a8 < a6 - 8)
    {
      memset_s(__s, 0x40uLL, 0, 0x40uLL);
      goto LABEL_34;
    }
    cccbc_init();
    goto LABEL_15;
  }
  if (a8 && *v39 >= v42 - 8)
  {
LABEL_15:
    *(_QWORD *)&__s[0] = *v43;
    v19 = v17 - 1;
    if (v17 != 1)
    {
      v20 = (_QWORD *)__s + 1;
      v21 = v43 + 1;
      v22 = v17 - 1;
      do
      {
        v23 = *v21++;
        *v20 = v23;
        v20 += 2;
        --v22;
      }
      while (v22);
    }
    v24 = 6 * v17 - 6;
    LODWORD(v41) = 1 - v17;
    v25 = 5;
    v40 = (unint64_t *)&__s[v17 - 2];
    do
    {
      LODWORD(v43) = v25;
      if (v42 >= 0x10)
      {
        v26 = v40;
        v27 = v19;
        v28 = v24;
        do
        {
          *v26 = *(_QWORD *)&__s[v27 % v19] ^ bswap64(v28);
          if (a4)
          {
            if ((a4(0, &firebloom_null_iv, v26, v26, 16) & 1) == 0)
              goto LABEL_6;
          }
          else
          {
            cccbc_clear_iv();
            firebloom_cbc_update_f();
          }
          --v28;
          v26 -= 2;
          v29 = __OFSUB__(v27--, 1);
        }
        while (!((v27 < 0) ^ v29 | (v27 == 0)));
      }
      v25 = (_DWORD)v43 - 1;
      v24 += v41;
    }
    while ((_DWORD)v43);
    if (*(_QWORD *)&__s[0] == v37)
    {
      v30 = v36;
      if ((_DWORD)v19)
      {
        v31 = (uint64_t *)__s + 1;
        v32 = v19;
        do
        {
          v33 = *v31;
          v31 += 2;
          *v30++ = v33;
          --v32;
        }
        while (v32);
      }
      v16 = 0;
      *v39 = (8 * v19);
    }
    else
    {
      v16 = 0xFFFFFFFFLL;
    }
LABEL_33:
    memset_s(__s, 0x40uLL, 0, 0x40uLL);
    if (a4)
      return v16;
LABEL_34:
    cc_clear();
    return v16;
  }
LABEL_6:
  memset_s(__s, 0x40uLL, 0, 0x40uLL);
  return 0xFFFFFFFFLL;
}

uint64_t rfc3394_unwrap_legacy(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t (*a4)(_QWORD, void *, unint64_t *, unint64_t *, uint64_t), _QWORD *a5, unsigned int a6, _QWORD *a7, _DWORD *a8)
{
  uint64_t v9;
  uint64_t v11;

  v11 = *a8;
  v9 = rfc3394_unwrap(a1, a2, a3, a4, a5, a6, a7, &v11);
  REQUIRE_func(HIDWORD(v11) == 0, 261, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/aeskeywrap.c");
  *a8 = v11;
  return v9;
}

uint64_t rfc3394_wrapped_size_legacy(unsigned int a1, _DWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  int v5;

  v2 = a1 + 15;
  v3 = v2 << 31 >> 31;
  v4 = v3 != v2 || v3 < 0;
  v5 = v4;
  if (!v4)
    *a2 = v3 & 0xFFFFFFF8;
  return v5 ^ 1u;
}

BOOL rfc3394_unwrapped_size_legacy(unsigned int a1, unsigned int *a2)
{
  unsigned int v2;
  _BOOL8 result;

  v2 = a1 - 8;
  result = a1 > 7;
  *a2 = v2;
  return result;
}

BOOL rfc3394_unwrapped_size(unint64_t a1, unint64_t *a2)
{
  unint64_t v2;
  _BOOL8 result;

  v2 = a1 - 8;
  result = a1 > 7;
  *a2 = v2;
  return result;
}

void authapfs_valid_hash_type_cold_1(int a1)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v1 = 136315650;
  v2 = "authapfs_valid_hash_type";
  v3 = 1024;
  v4 = 50;
  v5 = 1024;
  v6 = a1;
  _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: Invalid or unknown hash type: %d\n", (uint8_t *)&v1, 0x18u);
}

void io_get_device_features_cold_1()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21F566000, MEMORY[0x24BDACB70], v1, "%s:%d: can't get solidstate for device (%s)\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

void io_get_device_features_cold_2(_WORD *a1, unsigned int *a2, int a3)
{
  int v3;
  unsigned int v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  int v10;
  __int16 v11;
  int v12;
  __int16 v13;
  unsigned int v14;
  __int16 v15;
  unsigned int v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = *a1 & 0xF000;
  v4 = *a2;
  v5 = 136316674;
  v6 = "io_get_device_features";
  v7 = 1024;
  v8 = 230;
  v9 = 1024;
  v10 = a3;
  v11 = 1024;
  v12 = v3;
  v13 = 1024;
  v14 = v4;
  v15 = 1024;
  v16 = HIBYTE(v4);
  v17 = 1024;
  v18 = v4 & 0xFFFFFF;
  _os_log_debug_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%s:%d: fd %d is type %o rdev %d (%d, %d): I/O registry entry not found\n", (uint8_t *)&v5, 0x30u);
}

void io_get_device_features_cold_3()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21F566000, MEMORY[0x24BDACB70], v1, "%s:%d: can't get features for device (%s)\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

void container_keybag_operation_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: unable to wipe %s keybag (%d)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void container_keybag_operation_cold_2()
{
  _WORD v0[10];
  const char *v1;
  __int16 v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  *(_DWORD *)v0 = 136315906;
  OUTLINED_FUNCTION_1();
  *(_DWORD *)&v0[7] = 466;
  v0[9] = 2080;
  v1 = "APFS/container";
  v2 = 2080;
  v3 = "";
  _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: malformed %s keybag%s\n", (uint8_t *)v0, 0x26u);
  OUTLINED_FUNCTION_4();
}

void apfs_keybag_init_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: failed to initialize volume keybag, err = %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void apfs_keybag_init_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: failed to get apfs volume keybag, err = %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void container_kb_get_cold_1()
{
  __int16 v0;
  int v1;
  uint64_t v2;
  int v3[6];
  __int16 v4;
  uint64_t v5;
  __int16 v6;
  int v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3[0] = 136316418;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  v4 = 2048;
  v5 = 16;
  v6 = v0;
  v7 = v1;
  v8 = 2048;
  v9 = v2;
  _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: %d >= %lu && %d <= %lu\n", (uint8_t *)v3, 0x32u);
}

void container_kb_get_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: Checksum failure\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void container_kb_get_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: dev_read_data failed with error %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void apfs_keybag_load_class_keys_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: call to load volume class keys does not exist\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void apfs_keybag_load_class_keys_cold_2()
{
  _DWORD v0[6];
  uint64_t v1;

  v1 = *MEMORY[0x24BDAC8D0];
  v0[0] = 136315394;
  OUTLINED_FUNCTION_1();
  *(_DWORD *)((char *)&v0[3] + 2) = 3349;
  _os_log_debug_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%s:%d: successfully loaded volume class keys\n", (uint8_t *)v0, 0x12u);
  OUTLINED_FUNCTION_3_0();
}

void apfs_keybag_load_class_keys_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: failed to load volume class keys, error = %x\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void apfs_keybag_load_class_keys_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: failed to find volume key to load class keys, error = %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void apfs_keybag_load_class_keys_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: failed to find unlock record to load class keys, error = %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void apfs_keybag_unlock_record_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: failed to unwrap volume key, err = %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void apfs_keybag_unlock_record_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: failed to unwrap proposed volume key, err = %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void apfs_keybag_unlock_record_tag_cold_1()
{
  __int16 v0;
  int v1;
  int v2[6];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315906;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  v3 = v0;
  v4 = v1;
  _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: failed to unwrap volume key, err = 0x%x (tag = %u)\n", (uint8_t *)v2, 0x1Eu);
  OUTLINED_FUNCTION_4();
}

void apfs_is_dir_empty_cold_1(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a2 + 8);
  v4 = 136316162;
  v5 = "apfs_is_dir_empty";
  v6 = 1024;
  v7 = 115;
  v8 = 2080;
  v9 = a1 + 3720;
  v10 = 2048;
  v11 = v3;
  v12 = 1024;
  v13 = a3;
  _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: %s Failed to iterate directory %lld, error %d\n", (uint8_t *)&v4, 0x2Cu);
}

void apfs_set_file_size_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  const char *v3;
  __int16 v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a2 + 8);
  v3 = "no";
  v4 = *(_WORD *)(a2 + 104);
  v6 = "apfs_set_file_size";
  v7 = 1024;
  v5 = 136316162;
  v8 = 358;
  if ((v4 & 0xF000) == 0x8000)
    v3 = "yes";
  v9 = 2080;
  v10 = a1 + 3720;
  v11 = 2048;
  v12 = v2;
  v13 = 2080;
  v14 = v3;
  _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: %s failed to create dstream on ino %lld (isreg: %s)\n", (uint8_t *)&v5, 0x30u);
}

void doc_id_tree_create_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s doc-id tree creation failed: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void doc_id_tree_destroy_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to leave tx, error %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void doc_id_tree_destroy_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to enter tx, error %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void doc_id_tree_destroy_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to enter tx, error %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void doc_id_tree_destroy_cold_4()
{
  uint64_t v0;
  _WORD v1[10];
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  *(_DWORD *)v1 = 136315650;
  OUTLINED_FUNCTION_1();
  *(_DWORD *)&v1[7] = 175;
  v1[9] = 2080;
  v2 = v0;
  _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: %s not enough space to enter transaction\n", (uint8_t *)v1, 0x1Cu);
  OUTLINED_FUNCTION_4();
}

void doc_id_tree_destroy_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to leave tx, error %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void doc_id_tree_destroy_cold_6()
{
  uint64_t v0;
  __int16 v1;
  int v2;
  _WORD v3[10];
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  *(_DWORD *)v3 = 136315906;
  OUTLINED_FUNCTION_2_0();
  *(_DWORD *)&v3[7] = 155;
  v3[9] = 2080;
  v4 = v0;
  v5 = v1;
  v6 = v2;
  _os_log_debug_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%s:%d: %s stop background work requested, stopping tree destroy, prev %d\n", (uint8_t *)v3, 0x22u);
  OUTLINED_FUNCTION_4();
}

void doc_id_tree_destroy_cold_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to leave tx, error %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void doc_id_tree_destroy_cold_8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to enter tx, error %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void doc_id_tree_destroy_cold_9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to get doc-id tree, error %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void doc_id_tree_destroy_cold_10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to get doc-id tree key count, error %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void doc_id_tree_destroy_cold_11(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  obj_type(*a2);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s unsupported tree type, %d\n", v3, v4, v5, v6, 2u);
}

void userfs_data_cryptor_cold_1(char a1, int a2)
{
  const char *v2;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = "Decryption";
  v4 = "userfs_data_cryptor";
  v6 = 200;
  v7 = 2080;
  v3 = 136315906;
  v5 = 1024;
  if ((a1 & 1) != 0)
    v2 = "Encryption";
  v8 = v2;
  v9 = 1024;
  v10 = a2;
  _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: %s failed (E%d)\n", (uint8_t *)&v3, 0x22u);
}

void userfs_data_cryptor_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], a3, "%s:%d: CCCryptorCreateWithMode failed (E%d)\n", a5, a6, a7, a8, 2u);
}

void AKS_FV_service_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], a3, "%s:%d: lib_get_file_vault_services failed (E%d)\n", a5, a6, a7, a8, 2u);
}

void userfs_meta_crypto_state_unwrap_cold_1(uint64_t a1)
{
  uint64_t v1;
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 400);
  v2 = 136315906;
  v3 = "userfs_meta_crypto_state_unwrap";
  v4 = 1024;
  v5 = 262;
  v6 = 2080;
  v7 = a1 + 3720;
  v8 = 2080;
  v9 = v1;
  _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: %s Failed to unlock volume '%s'\n", (uint8_t *)&v2, 0x26u);
}

void btree_node_check_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_20(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s btree_node is null\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void btree_node_check_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s btree_node is null\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void btree_node_check_cold_3(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v1, "%s:%d: %s oid 0x%llx (level %d): non-leaf node has no children?\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_4_2(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s oid 0x%llx (level %d): non-leaf node has no children?\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_5(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v1, "%s:%d: %s oid 0x%llx (level %d): node's max key is not less than next sibling's entry in parent\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_6(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_4_2(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s oid 0x%llx (level %d): node's max key is not less than next sibling's entry in parent\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_6_0(v0, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_12(&dword_21F566000, MEMORY[0x24BDACB70], v1, "%s:%d: %s oid 0x%llx (level %d): key %d compare error: %d\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_7_0();
}

void btree_node_check_cold_8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_6_0(v0, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_12(&dword_21F566000, MEMORY[0x24BDACB70], v1, "%s:%d: %s oid 0x%llx (level %d): can't get key %d: %d\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_7_0();
}

void btree_node_check_cold_9(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v1, "%s:%d: %s oid 0x%llx (level %d): minkey not correct\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_10(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_4_2(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s oid 0x%llx (level %d): minkey not correct\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_11(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v1, "%s:%d: %s oid 0x%llx (level %d): minkey not in sync\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_12(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_4_2(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s oid 0x%llx (level %d): minkey not in sync\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_13()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_6_0(v0, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_10(&dword_21F566000, MEMORY[0x24BDACB70], v1, "%s:%d: %s oid 0x%llx (level %d): minkey compare error: %d\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_7_0();
}

void btree_node_check_cold_14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_6_0(v0, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_12(&dword_21F566000, MEMORY[0x24BDACB70], v1, "%s:%d: %s oid 0x%llx (level %d): can't get key %d: %d\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_7_0();
}

void btree_node_check_cold_15(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v1, "%s:%d: %s oid 0x%llx (level %d): table space length smaller than minimum\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_16(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_4_2(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s oid 0x%llx (level %d): table space length smaller than minimum\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_17(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v1, "%s:%d: %s oid 0x%llx (level %d): key count larger than TOC space\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_18(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_4_2(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s oid 0x%llx (level %d): key count larger than TOC space\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_19(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v1, "%s:%d: %s oid 0x%llx (level %d): invalid key offset\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_20(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_4_2(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s oid 0x%llx (level %d): invalid key offset\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_21(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v1, "%s:%d: %s oid 0x%llx (level %d): val location extends beyond val space\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_22(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_4_2(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s oid 0x%llx (level %d): val location extends beyond val space\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_23(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v1, "%s:%d: %s oid 0x%llx (level %d): invalid val offset has non-zero length\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_24(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_4_2(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s oid 0x%llx (level %d): invalid val offset has non-zero length\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_25(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v1, "%s:%d: %s oid 0x%llx (level %d): invalid key offset\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_26(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_4_2(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s oid 0x%llx (level %d): invalid key offset\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_27(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v1, "%s:%d: %s oid 0x%llx (level %d): val location extends beyond val space\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_28(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_4_2(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s oid 0x%llx (level %d): val location extends beyond val space\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_29(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v1, "%s:%d: %s oid 0x%llx (level %d): tree says kv sizes are fixed, but leaf says kv size is variable\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_30(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_4_2(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s oid 0x%llx (level %d): tree says kv sizes are fixed, but leaf says kv size is variable\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_31(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v1, "%s:%d: %s oid 0x%llx (level %d): node says kv size is fixed, but tree says val size is variable\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_32(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_4_2(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s oid 0x%llx (level %d): node says kv size is fixed, but tree says val size is variable\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_33(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v1, "%s:%d: %s oid 0x%llx (level %d): tree says key size is fixed, but node says kv size is variable\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_34(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_4_2(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s oid 0x%llx (level %d): tree says key size is fixed, but node says kv size is variable\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_35(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v1, "%s:%d: %s oid 0x%llx (level %d): node says kv size is fixed, but tree says key size is variable\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_36(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_4_2(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s oid 0x%llx (level %d): node says kv size is fixed, but tree says key size is variable\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_37(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v1, "%s:%d: %s oid 0x%llx (level %d): val free list entry extends beyond val space available\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_38(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_4_2(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s oid 0x%llx (level %d): val free list entry extends beyond val space available\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_39(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v1, "%s:%d: %s oid 0x%llx (level %d): val free list entry overlaps with other free space\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_40(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_4_2(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s oid 0x%llx (level %d): val free list entry overlaps with other free space\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_41(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v1, "%s:%d: %s oid 0x%llx (level %d): key free list entry len value too small\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_42(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_4_2(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s oid 0x%llx (level %d): key free list entry len value too small\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_43(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v1, "%s:%d: %s oid 0x%llx (level %d): key free list entry starts beyond key space available\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_44(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_4_2(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s oid 0x%llx (level %d): key free list entry starts beyond key space available\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_45(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v1, "%s:%d: %s oid 0x%llx (level %d): key free list entry extends beyond key space available\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_46(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_4_2(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s oid 0x%llx (level %d): key free list entry extends beyond key space available\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_47(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v1, "%s:%d: %s oid 0x%llx (level %d): key free list entry overlaps with other free space\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_48(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_4_2(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s oid 0x%llx (level %d): key free list entry overlaps with other free space\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_49(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v1, "%s:%d: %s oid 0x%llx (level %d): key free list entry len value too small\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_50(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_4_2(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s oid 0x%llx (level %d): key free list entry len value too small\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_51(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v1, "%s:%d: %s oid 0x%llx (level %d): couldn't allocate bitmap to check btree node space usage\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_52(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_4_2(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s oid 0x%llx (level %d): couldn't allocate bitmap to check btree node space usage\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_53(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v1, "%s:%d: %s oid 0x%llx (level %d): val free list head beyond end of node\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_54(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_4_2(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s oid 0x%llx (level %d): val free list head beyond end of node\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_55(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v1, "%s:%d: %s oid 0x%llx (level %d): val free list head beyond val space available\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_56(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_4_2(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s oid 0x%llx (level %d): val free list head beyond val space available\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_57(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v1, "%s:%d: %s oid 0x%llx (level %d): val free list space larger than val space available\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_58(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_4_2(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s oid 0x%llx (level %d): val free list space larger than val space available\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_59(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v1, "%s:%d: %s oid 0x%llx (level %d): key free list head beyond key space available\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_60(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_4_2(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s oid 0x%llx (level %d): key free list head beyond key space available\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_61(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v1, "%s:%d: %s oid 0x%llx (level %d): key free list space larger than key space available\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_62(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_4_2(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s oid 0x%llx (level %d): key free list space larger than key space available\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_63(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v1, "%s:%d: %s oid 0x%llx (level %d): invalid vals[] pointer\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_64(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_4_2(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s oid 0x%llx (level %d): invalid vals[] pointer\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_65(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v1, "%s:%d: %s oid 0x%llx (level %d): invalid vals[] pointer\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_66(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_4_2(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s oid 0x%llx (level %d): invalid vals[] pointer\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_67(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v1, "%s:%d: %s oid 0x%llx (level %d): invalid keys[] pointer\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_68(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_4_2(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s oid 0x%llx (level %d): invalid keys[] pointer\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_69(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v1, "%s:%d: %s oid 0x%llx (level %d): invalid TOC[] pointer\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_70(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_4_2(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s oid 0x%llx (level %d): invalid TOC[] pointer\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_71(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v1, "%s:%d: %s oid 0x%llx (level %d): key count larger than gross key space\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_72(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_4_2(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s oid 0x%llx (level %d): key count larger than gross key space\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_73(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v1, "%s:%d: %s oid 0x%llx (level %d): key count larger than possible\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_74(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_4_2(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s oid 0x%llx (level %d): key count larger than possible\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_75(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v1, "%s:%d: %s oid 0x%llx (level %d): free space extends beyond end of node\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_76(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_4_2(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s oid 0x%llx (level %d): free space extends beyond end of node\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_77(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v1, "%s:%d: %s oid 0x%llx (level %d): free space offset too large\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_78(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_4_2(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s oid 0x%llx (level %d): free space offset too large\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_79(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v1, "%s:%d: %s oid 0x%llx (level %d): table space length larger than available data space\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_80(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_4_2(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s oid 0x%llx (level %d): table space length larger than available data space\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_81(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v1, "%s:%d: %s oid 0x%llx (level %d): invalid table space offset\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_82(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_4_2(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s oid 0x%llx (level %d): invalid table space offset\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_83(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6_0(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_10(&dword_21F566000, MEMORY[0x24BDACB70], v1, "%s:%d: %s oid 0x%llx (level %d): node level greater than root level %d\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_7_0();
}

void btree_node_check_cold_84(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v1, "%s:%d: %s oid 0x%llx (level %d): leaf node has non-zero level\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_85(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_4_2(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s oid 0x%llx (level %d): leaf node has non-zero level\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_check_cold_86(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  int v9;
  int v10[5];
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  int v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 392) + 384) + 208;
  v6 = obj_oid(a1);
  LODWORD(a2) = *(unsigned __int16 *)(*(_QWORD *)a2 + 34);
  obj_oid(a3);
  v10[0] = 136316674;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_16();
  v11 = v5;
  v12 = 2048;
  v13 = v6;
  v14 = v7;
  v15 = a2;
  v16 = 2048;
  v17 = v8;
  v18 = v7;
  v19 = v9;
  _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: %s oid 0x%llx (level %d): root node has a parent 0x%llx (level %d)\n", (uint8_t *)v10, 0x3Cu);
}

void btree_check_ext_cold_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int16 v4;
  int v5;
  _WORD v6[10];
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  int v13;

  OUTLINED_FUNCTION_6_0(a1, *MEMORY[0x24BDAC8D0]);
  *(_DWORD *)v6 = 136316418;
  OUTLINED_FUNCTION_14();
  *(_DWORD *)&v6[7] = 681;
  v6[9] = 2080;
  v7 = v1;
  v8 = 2048;
  v9 = v2;
  v10 = 2048;
  v11 = v3;
  v12 = v4;
  v13 = v5;
  _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: %s oid 0x%llx: btree key count (%llu) doesn't match # leaf entries (%u)\n", (uint8_t *)v6, 0x36u);
  OUTLINED_FUNCTION_7_0();
}

void btree_check_ext_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_20(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s btree check called with non-root btree node: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void btree_check_ext_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s btree check called with non-root btree node: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void btree_check_recent_sanity_cold_1(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_22(a1, a2, a3);
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10(&dword_21F566000, MEMORY[0x24BDACB70], v3, "%s:%d: %s node 0x%llx (level %d) index %d: more levels than expected\n", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_check_recent_sanity_cold_2(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_22(a1, a2, a3);
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10(&dword_21F566000, MEMORY[0x24BDACB70], v3, "%s:%d: %s node 0x%llx (level %d) index %d: more levels than expected\n", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_3_1();
}

void gbitmap_reap_cold_1(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  obj_oid(*a1);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v1, "%s:%d: %s Tree delete oid %llu threw %d\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_1();
}

void gbitmap_reap_cold_2(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  obj_oid(*a2);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s Tree delete oid %llu threw %d\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3_1();
}

void gbitmap_reap_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], a3, "%s:%d: %s Tree iteration threw %d at cursor %llu\n", a5, a6, a7, a8, 2u);
}

void gbitmap_reap_cold_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], a3, "%s:%d: %s Tree iteration threw %d at cursor %llu\n", a5, a6, a7, a8, 2u);
}

void gbitmap_reap_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s Can't get tree: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void gbitmap_reap_cold_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s Can't get tree: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void gbitmap_reap_cold_7(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  obj_oid(a1);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v1, "%s:%d: %s obj_modify(fs %lld) failed: %d\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_1();
}

void gbitmap_reap_cold_8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  obj_oid(a1);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v1, "%s:%d: %s obj_modify(fs %lld) failed: %d\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_1();
}

void should_embed_xattr_cold_1(int a1, int a2, int a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  int v8;
  __int16 v9;
  int v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = 136316162;
  v4 = "should_embed_xattr";
  v5 = 1024;
  v6 = 326;
  v7 = 1024;
  v8 = a1;
  v9 = 1024;
  v10 = a2;
  v11 = 1024;
  v12 = a3;
  _os_log_debug_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%s:%d: error, %d, when checking tree entry size %u, %u\n", (uint8_t *)&v3, 0x24u);
}

void alloc_xattr_tmp_ino_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2_2(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s can't remove xattr inode %llu from disk, %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void alloc_xattr_tmp_ino_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  _WORD v2[10];
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  *(_DWORD *)v2 = 136315906;
  OUTLINED_FUNCTION_14();
  *(_DWORD *)&v2[7] = 756;
  v2[9] = 2080;
  v3 = v0;
  v4 = 2048;
  v5 = v1;
  _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: %s couldn't find drec for ino %llu\n", (uint8_t *)v2, 0x26u);
}

void alloc_xattr_tmp_ino_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2_2(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s can't remove drec ino %llu, err %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void alloc_xattr_tmp_ino_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2_2(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to decrement dstream_id for deletion for ino %llu, err %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void alloc_xattr_tmp_ino_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _WORD v3[10];
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;

  OUTLINED_FUNCTION_2_2(*MEMORY[0x24BDAC8D0]);
  *(_DWORD *)v3 = 136316162;
  OUTLINED_FUNCTION_14();
  *(_DWORD *)&v3[7] = 713;
  v3[9] = 2080;
  v4 = v0;
  v5 = 2048;
  v6 = v1;
  v7 = 2048;
  v8 = v2;
  _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: %s cannot allocate %llu bytes under %llu\n", (uint8_t *)v3, 0x30u);
  OUTLINED_FUNCTION_4_3();
}

void alloc_xattr_tmp_ino_cold_6()
{
  int v0[14];
  uint64_t v1;

  v1 = *MEMORY[0x24BDAC8D0];
  v0[0] = 136316162;
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_2();
  _os_log_debug_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%s:%d: %s failed to create temporary inode under %llu with %d\n", (uint8_t *)v0, 0x2Cu);
  OUTLINED_FUNCTION_4_3();
}

void fs_insert_snapshot_metadata_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s Inserting snap_name failed, %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void fs_insert_snapshot_metadata_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s Inserting snap_meta failed, %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void fs_lookup_snapshot_metadata_by_xid_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s Couldn't find snap_meta for xid %llu: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void fs_remove_snapshot_metadata_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s Failed to remove snap_meta record!\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void fs_remove_snapshot_metadata_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s Failed to remove snap_name record!\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void fs_remove_snapshot_metadata_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_15(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s Couldn't find name for snap_xid %llu\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void fs_rename_snapshot_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s fs_update_snap_metadata() returned %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void fs_rename_snapshot_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s remove_jobj(old-snap-name) returned %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void revert_extents_to_snapshot_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_21_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s free'ing extents in main extentref tree %lld\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void revert_extents_to_snapshot_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s fs extentref tree creation failed: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void create_empty_extentref_tree_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s tree creation failed: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void free_allocated_snapshot_extents_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_23_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s processed %d extents and free'd %lld blocks\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void free_allocated_snapshot_extents_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_15(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to get the snapshot blockref tree for delta_tree_oid %lld!\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void revert_to_snapshot_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_21_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s DONE reverting to snapshot w/xid %lld\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void revert_to_snapshot_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_27(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s waiting for snapshot deletion to finish (id %lld) failed: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_3();
}

void revert_to_snapshot_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to check if doc-id index is stale (error %d)\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void revert_to_snapshot_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to mark doc-id index for rebuild (error %d)\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void revert_to_snapshot_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unable to modify the apfs object (err %d) to be able to revert the fs.\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void revert_to_snapshot_cold_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_23_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s could not start txn to revert to snapshot w/xid %lld : txerr %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void revert_to_snapshot_cold_7()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = 136316162;
  v3 = "revert_to_snapshot";
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_19();
  v4 = 2048;
  v5 = v0;
  v6 = 2048;
  v7 = v1;
  _os_log_debug_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%s:%d: %s Reverting to snapshot w/xid %lld and old sblock oid %lld.\n", (uint8_t *)&v2, 0x30u);
  OUTLINED_FUNCTION_4_3();
}

void revert_to_snapshot_cold_8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s must mount read-write after revert to unsealed snapshot\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void revert_to_snapshot_cold_9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_21_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s could not locate old super block w/sblock_oid %lld\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void revert_to_snapshot_cold_10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s was asked to revert to snapshot w/xid %llu but got error %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void revert_to_snapshot_cold_11()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_21_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s volume was marked for revert while mounted RO, skip revert to xid %lld\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void move_snapshot_to_purgatory_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_27(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_26(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s Couldn't rename snap %llx to %s\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_3();
}

void orphan_snap_check_iterator_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_27(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s Couldn't move snap xid %llu to purgatory, err %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_3();
}

void orphan_snap_check_iterator_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_15(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s snap xid %llu is an orphan... moving it to purgatory\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void orphan_snap_check_iterator_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s find_next_snap(%llu) returned %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void nx_check_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s omap check failed with error: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_check_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unable to get omap: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_check_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s reaper check failed with error: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_check_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to get reap list head: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_check_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unable to get reaper: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_check_cold_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unable to get spaceman: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_check_omap_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unable to get spaceman: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_check_omap_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unable to get spaceman: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_check_recent_sanity_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_8_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s omap check failed for omap %lld: %d\n", v1, v2, v3, v4, 2u);
}

void nx_check_recent_sanity_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_8_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unable to get omap %lld: %d\n", v1, v2, v3, v4, 2u);
}

void nx_check_recent_sanity_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s omap check failed with error: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_check_recent_sanity_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unable to get omap: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_check_recent_sanity_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unable to get spaceman: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_check_recent_sanity_omap_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unable to get omap snapshot tree: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_check_recent_sanity_omap_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unable to get omap snapshot tree: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_check_recent_sanity_omap_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unable to get omap tree: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_check_recent_sanity_omap_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unable to get omap tree: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_corruption_detected_int_cold_1()
{
  uint64_t v0;
  __int16 v1;
  int v2;
  _WORD v3[10];
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  *(_DWORD *)v3 = 136315906;
  OUTLINED_FUNCTION_1();
  *(_DWORD *)&v3[7] = 39;
  v3[9] = 2080;
  v4 = v0;
  v5 = v1;
  v6 = v2;
  _os_log_fault_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "%s:%d: Container corruption detected by %s:%u!\n", (uint8_t *)v3, 0x22u);
  OUTLINED_FUNCTION_4();
}

void nx_corruption_detected_int_cold_2(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 384) + 208;
  v4 = 136316162;
  v5 = "nx_corruption_detected_int";
  v6 = 1024;
  v7 = 37;
  v8 = 2080;
  v9 = v3;
  v10 = 2080;
  v11 = a2;
  v12 = 1024;
  v13 = a3;
  _os_log_fault_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "%s:%d: %s Container corruption detected by %s:%u!\n", (uint8_t *)&v4, 0x2Cu);
}

void obj_checksum_verify_phys_cold_1(uint64_t *a1, uint64_t *a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = *a2;
  v5 = *((_DWORD *)a1 + 6);
  v6 = *((_DWORD *)a1 + 7);
  v7 = 136316674;
  v8 = "obj_checksum_verify_phys";
  v9 = 1024;
  v10 = 52;
  v11 = 2048;
  v12 = v3;
  v13 = 2048;
  v14 = v4;
  v15 = 1024;
  v16 = v5;
  v17 = 1024;
  v18 = v6;
  v19 = 1024;
  v20 = a3;
  _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: failed: cksum 0x%016llx, oid 0x%llx, type 0x%x/0x%x, size %d\n", (uint8_t *)&v7, 0x38u);
}

void apfs_release_objects_cold_1()
{
  _DWORD v0[6];
  uint64_t v1;

  v1 = *MEMORY[0x24BDAC8D0];
  v0[0] = 136315394;
  OUTLINED_FUNCTION_1();
  *(_DWORD *)((char *)&v0[3] + 2) = 300;
  _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: obj is NULL or not apfs object!", (uint8_t *)v0, 0x12u);
}

void apfs_release_objects_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s ROSV: failed to delete shadow fs_root: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void apfs_release_objects_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_21_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s ROSV: Deleting the shadow_fs_root tree 0x%llx\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void apfs_reap_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s bogus phase, %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void apfs_reap_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s omap_destroy returned %d!\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void apfs_reap_cold_3(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_14_0(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s supplemental_tree_destroy(pfkur_tree) failed: %d (%s)\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3_1();
}

void apfs_reap_cold_4(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_14_0(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s supplemental_tree_destroy(fext_tree) failed: %d (%s)\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3_1();
}

void apfs_reap_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to modify the apfs_t before reaping (error %d).\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void apfs_checkpoint_traverse_cold_1()
{
  __int16 v0;
  int v1;
  int v2[8];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136316162;
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_1_1();
  v3 = v0;
  v4 = v1;
  _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: %s omap checkpoint traverse (op %d) failed: %d\n", (uint8_t *)v2, 0x28u);
  OUTLINED_FUNCTION_4();
}

void apfs_checkpoint_traverse_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to get omap %lld: %d\n", v1, v2, v3, v4, 2u);
}

void apfs_update_cow_exempt_file_count_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed with err %d while getting the cow-exempt-file-count xattr on the root dir\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void apfs_update_cow_exempt_file_count_cold_2()
{
  uint64_t v0;
  __int16 v1;
  uint64_t v2;
  _WORD v3[10];
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  *(_DWORD *)v3 = 136316162;
  OUTLINED_FUNCTION_11_0();
  *(_DWORD *)&v3[7] = 1416;
  v3[9] = 2080;
  v4 = v0;
  OUTLINED_FUNCTION_10_0();
  v5 = v1;
  v6 = v2;
  _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: %s COW exempt file count underflow: %lld (delta %lld).  capping to zero.\n", (uint8_t *)v3, 0x30u);
}

void apfs_update_cow_exempt_file_count_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to add initial cow-exempt-count xattr! err %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void apfs_create_doc_id_tree_if_needed_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_21_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s created doc-id tree, oid %llu\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void apfs_create_doc_id_tree_if_needed_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to create doc-id tree, error %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void apfs_reap_snapshots_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s Hit %d looking up first snapshot\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void apfs_reap_snapshots_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s lookup_next_snapshot() returned %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void apfs_reap_snapshots_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_15(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s Couldn't find snapshot metadata for xid %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void apfs_reap_extentref_blocks_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s iter_next returned %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void apfs_reap_extentref_blocks_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s tree_iter_init() returned %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void apfs_reap_extentref_blocks_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: apfs_get_extentref_tree(oid=%llu) returned %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void scandir_strstr_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: Failed to find substring in input name, error %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void scandir_strstr_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: Failed to normalizeOptCaseFold substring, error %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void userfs_process_dirent_cb_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: no memory for a new directory entry\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void userfs_process_dirent_cb_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: no memory for a new directory entry\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void userfs_process_dirent_cb_cold_3(uint64_t *a1, int a2)
{
  uint64_t v2;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = 136315906;
  v4 = "userfs_process_dirent_cb";
  v5 = 1024;
  v6 = 459;
  v7 = 2048;
  v8 = v2;
  v9 = 1024;
  v10 = a2;
  _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: failed to load inode %llu (error %d), skipping entry\n", (uint8_t *)&v3, 0x22u);
}

void add_entry_to_dir_stack_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: failed to allocate %d dir stack entries (%zu bytes)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void jobj_release_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_97();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: *** Can't release unknown obj type %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void apfs_unlock_stream_id_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_15(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unlocking stream_id %llu, which is not locked\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void apfs_unlock_dir_stats_id_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_15(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unlocking dir_stats_id %llu, which is not locked\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void make_jkey_from_jobj_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_91();
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_36(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s ***: expanded obj type %d (obj_id %llu) found on unsupported volume\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void make_jkey_from_jobj_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_50(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s ***: expanded type seen on in-memory obj!\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void make_jkey_from_jobj_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_91();
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_36(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s Cannot make large jkey from unknown type %d (obj_id %llu)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void jobj_to_key_val_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s expanded obj type %hhu found on unsupported volume\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void jobj_to_key_val_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_36(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s large key size (%u) on record (%llu) is too small\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void jobj_to_key_val_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_27(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to serialize purgeable %llu into jval of size %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_3();
}

void jobj_to_key_val_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_27(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to serialize dir-stats %lld into jval of size %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_3();
}

void jobj_to_key_val_cold_5()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_89();
  OUTLINED_FUNCTION_86();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x28u);
  OUTLINED_FUNCTION_4();
}

void jobj_to_key_val_cold_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_27(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_23_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to serialize ino %lld into jval of size %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_3();
}

void jobj_to_key_val_cold_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_99(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_105();
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_23_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: failed to serialize drec %lld/%s into jval of size %u\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void jobj_to_key_val_cold_8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_27(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_23_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to serialize file info with obj_id <%lld> into jval of size <%u>\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_3();
}

void jobj_to_key_val_cold_9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_50(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s ***: expanded type seen on in-memory obj!\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void key_size_for_jobj_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_57(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s ***: expanded obj type %d found on unsupported volume\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void key_size_for_jobj_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_97();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: ***: unknown obj type %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void key_size_for_jobj_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_50(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s ***: expanded type seen on in-memory obj!\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void val_size_for_jobj_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_57(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s ***: expanded obj type %d found on unsupported volume\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void val_size_for_jobj_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_97();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: ***: unknown obj type %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void val_size_for_jobj_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: Unknown subtype %d for file info object %lld\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void val_size_for_jobj_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s ***: expanded type seen on in-memory obj\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void jobj_validate_key_val_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_66();
  OUTLINED_FUNCTION_26(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s key size (%zu) on expanded record (%llu) is too small\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void jobj_validate_large_key_val_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s ***: expanded obj type found on unsupported volume\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void jobj_validate_large_key_val_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_26(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s value size (%zu) on unknown record (%llu) is too small\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void jobj_validate_large_key_val_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_26(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s key size (%zu) on purgeable record (%llu) is too small\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void jobj_validate_large_key_val_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_26(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s value size (%zu) on purgeable record (%llu) is too small\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void jobj_validate_large_key_val_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_26(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s key size (%zu) on purgeable tombstone (%llu) is too small\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void jobj_validate_large_key_val_cold_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_26(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s value size (%zu) on purgeable tombstone (%llu) is too small\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void jobj_validate_large_key_val_cold_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_26(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s value size (%zu) on dir stats (%llu) is too small\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void jobj_validate_large_key_val_cold_8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_26(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s key size (%zu) on clone mapping (%llu) is too small\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void jobj_validate_large_key_val_cold_9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_26(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s value size (%zu) on clone mapping (%llu) is too small\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void fs_destroy_shadow_fs_root_tree_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s Shadow fs_root does not exist\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void fs_destroy_shadow_fs_root_tree_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_21_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s Deleted the shadow_fs_root tree %p\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void fs_obj_create_name_checked_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_43(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_15(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s ino %llu is flagged to maintain dir-stats but has no dir-stats key\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void fs_obj_create_name_checked_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_27(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s *** failed to set rdev as an extended field of ino %lld (ret %d)\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_3();
}

void jobj_refcnt_merge_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: don't know how to merge refcounts on objects of type %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void jobj_refcnt_merge_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: don't know how to merge refcounts on objects of file info type %llu\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void jobj_refcnt_merge_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: don't know how to merge refcounts on objects of expanded type %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void jobj_refcnt_merge_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_107(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_15(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s fixing DIR_STATS_IS_SHADOW flag for dir-stats %llu\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void jobj_refcnt_merge_cold_5(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_55(a3, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_31(&dword_21F566000, MEMORY[0x24BDACB70], v3, "%s:%d: %s could not update purgeable rsrc size for dir-stats %llu: %s (%d)\n", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_7_0();
}

void jobj_refcnt_merge_cold_6(int a1, int a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_75(a1, a2, a3);
  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_31(&dword_21F566000, MEMORY[0x24BDACB70], v3, "%s:%d: %s could not update purgeable rsrc size for dir-stats %llu: %s (%d)\n", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_7_0();
}

void jobj_refcnt_merge_cold_7(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_55(a3, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_31(&dword_21F566000, MEMORY[0x24BDACB70], v3, "%s:%d: %s could not update purgeable size for dir-stats %llu: %s (%d)\n", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_7_0();
}

void jobj_refcnt_merge_cold_8(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_55(a3, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_31(&dword_21F566000, MEMORY[0x24BDACB70], v3, "%s:%d: %s could not update clone size for dir-stats %llu: %s (%d)\n", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_7_0();
}

void jobj_refcnt_merge_cold_9(int a1, int a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_75(a1, a2, a3);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_59();
  OUTLINED_FUNCTION_95(&dword_21F566000, MEMORY[0x24BDACB70], v3, "%s:%d: %s clone mapping <%llu, %llu>: failed to update attribution tag: %s (%d)\n", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_87();
}

void jobj_refcnt_merge_cold_10(int a1, int a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_75(a1, a2, a3);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_59();
  OUTLINED_FUNCTION_95(&dword_21F566000, MEMORY[0x24BDACB70], v3, "%s:%d: %s clone mapping <%llu, %llu>: failed to update dir-stats key: %s (%d)\n", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_87();
}

void match_jobj_type_to_tree_type_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s expanded obj type %hhu found on unsupported volume\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void insert_jobj_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to insert fext in fext_tree: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void insert_jobj_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s X %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void update_jobj_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s fext_tree_update returned %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void remove_jobj_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s fext_tree_remove returned %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void key_val_to_jobj_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: *** unknown obj type %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void key_val_to_jobj_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: *** Can't allocate unknown obj type %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void key_val_to_jobj_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_67(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_28(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: failed to init extended fields on inode %lld from blob (xfret %d).\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void key_val_to_jobj_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_67(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_25_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: failed to init extended fields on drec %lld from blob.\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void key_val_to_jobj_cold_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], a3, "%s:%d: %s size (%d) of FILE_INFO_TAG_EXT_TYPE_SIGNING_ID in attribution tag record with s_hash <%llu> <= 0 \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_3();
}

void key_val_to_jobj_cold_6(int a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_62(a1, a2);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_23_0(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: failed to init extended fields on attribution tag record with objid <%lld> from blob due to error <%d> %s\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3_1();
}

void key_val_to_jobj_cold_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_92(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s s_hash <%llu> finfo attribution tag value <%zu> is less than sizeof(j_file_attribution_tag_val_t) <%lu\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_48();
}

void key_val_to_jobj_cold_8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_34(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_15(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s cannot translate key-val (%llu) into valid jobj\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void key_val_to_jobj_cold_9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_106();
  OUTLINED_FUNCTION_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: *** Unknown file info type %llu\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void key_val_to_jobj_cold_10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_88();
  OUTLINED_FUNCTION_93(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: unknown expanded type (%hhu) on record (%u)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void key_val_to_jobj_cold_11()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_57(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s *** unknown expanded obj type %hhu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void large_key_val_to_jobj_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_27(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_80(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unknown expanded type (%hhu) on record (%u)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void large_key_val_to_jobj_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_43(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_15(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to init extended fields on purgeable %llu from blob\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void large_key_val_to_jobj_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_43(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_15(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to init extended fields on dir-stats %llu from blob\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void large_key_val_to_jobj_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_26_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_26(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to init extended fields on clone mapping <%llu/%llu> from blob\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void update_file_extent_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s fext_tree_update returned %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void apfs_update_phys_range_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s invalid ref count %d for non NULL zero ref tree\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void apfs_update_phys_range_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_15(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s invalid zero len, paddr %llu\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void apfs_update_phys_range_cold_3(int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  strerror(a1);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v1, "%s:%d: %s failed to get next physical extent, error %s(%d)\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_1();
}

void apfs_update_phys_range_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_15(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s tree_remove(%llu) failed\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void apfs_update_phys_range_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_15(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s tree_remove(%llu) failed\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void insert_phys_extent_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s Couldn't insert extent, err=%d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void insert_phys_extent_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s key.hdr.kind != NEW && numsnapshots == 0\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void insert_phys_extent_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_27(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s Couldn't remove extent at pbn %llu, err=%d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void insert_phys_extent_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_27(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s Couldn't remove extent at pbn %llu, err=%d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void jobj_type_from_possibly_large_key_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_50(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s expanded record found on unsupported volume\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void get_new_crypto_id_cold_1()
{
  uint64_t v0;

  OUTLINED_FUNCTION_24();
  if (!v0)
    panic("assertion failed: %s", "ino");
  panic("assertion failed: %s", "ino_has_vnode(ino)");
}

#error "21F5FF538: call analysis failed (funcsize=24)"

void cp_get_ek2_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_49(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_23_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: cannot get ino %llu ek %llu, %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void cp_get_ek2_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_49(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_28(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: cannot get ino %llu ekwk %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void legacy_get_ek_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s Only CRYPTO_ONEKEY_ID supported under UserFS!\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void legacy_get_ek_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s Init does not have a cpx!\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void fext_collector_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_106();
  OUTLINED_FUNCTION_25_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: DANGER! got the same extent for logical addr %lld twice!\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void retain_xdstream_crypto_states_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s get_cp_class_for_crypto_id failed (crypto id %llu, error %d)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void ino_phys_size_ext_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_43(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_15(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s inode %llu was marked sparse but didn't have a sparse bytes extended field?\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void fs_create_dstream_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_54(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s *** failed to fetch the dstream pointer for %lld (ret %d)\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_3();
}

void fs_create_dstream_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_27(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to insert new dstream_id %llu (ret %d)", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_3();
}

void fs_create_dstream_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_54(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s *** failed to set dstream as an extended field of ino %lld (ret %d)\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_3();
}

void move_inode_to_purgatory_ext_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_27(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s Failed to insert drec associated with purgatory_dir and ino %llu, error = %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_3();
}

void remove_purgatory_entry_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_108(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_84();
  OUTLINED_FUNCTION_102();
  OUTLINED_FUNCTION_96(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s error %d removing purgatory entry %lld/%s for ino %lld\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_48();
}

void remove_purgatory_entry_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s update of the purgatory dir failed! err %d xid %lld\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void insert_linkid_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: couldn't allocate memory for link origin\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void child_remover_cb_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_34(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_26_0();
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_58(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to get ino %lld in dir %lld\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void child_remover_cb_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: failed to move ino %lld from dir %lld to purgatory : %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void child_remover_cb_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_54(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s link count == %d for inum %lld?!\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_3();
}

void fs_delete_inode_internal_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_26(&dword_21F566000, MEMORY[0x24BDACB70], a3, "%s:%d: %s parent is %lld name is %s\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_3();
}

void fs_delete_inode_internal_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_109(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_26_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_58(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s decrement dstream id returned ENOENT for private-id %lld (ino %lld)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void fs_delete_inode_internal_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_109(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_26_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_58(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s removing xattrs returned ENOENT for private-id %lld (ino %lld)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void remove_extent_of_file_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to decrement crypto state = %llu, err %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void remove_extent_of_file_cold_2()
{
  __int16 v0;
  uint64_t v1;
  __int16 v2;
  int v3;
  uint8_t v4[14];
  int v5;
  __int16 v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_84();
  v5 = 11960;
  v6 = 2080;
  OUTLINED_FUNCTION_65();
  v7 = v0;
  v8 = v1;
  v9 = v2;
  v10 = v3;
  _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: %s failed to remove extent for extent-id %lld @ logical offset %lld:%lld err %d\n", v4, 0x40u);
  OUTLINED_FUNCTION_48();
}

void remove_hash_file_info_record_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_26_0();
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_31(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to remove hash file info for id %llu @ logical offset %llu err %u\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void update_sparse_bytes_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_49(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: Sparse bytes removed from inode %lld that didn't have an extended field.\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void update_sparse_bytes_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_49(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: Failed to remove sparse bytes attribute from ino %lld, but it was successfully got, errro %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void update_sparse_bytes_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_49(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: Couldn't set sparse bytes extended attribute on ino %lld, error %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void fs_delete_inode_with_name_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_15(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to fetch sub-dir ino %lld\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void get_dstream_id_refcnt_cold_1(int a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_62(a1, a2);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_31(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s Error looking up dstream id %llu: %d (%s)\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_7_0();
}

void decrement_dstream_id_for_deletion_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_27(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_36(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to restore refcnt on dstream id %llu, err: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_3();
}

void decrement_dstream_id_for_deletion_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_34(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_21_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s trying to restore refcnt on dstream id %llu\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void decrement_dstream_id_for_deletion_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_27(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to update dstream id %lld err %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_3();
}

void alloc_tmp_ino_helper_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_54(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s can't remove xattr inode %llu from disk, %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_3();
}

void alloc_tmp_ino_helper_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_43(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_15(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s couldn't find drec for ino %llu\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void alloc_tmp_ino_helper_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_54(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s can't remove drec ino %llu, err %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_3();
}

void alloc_tmp_ino_helper_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_54(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s cannot add new dstream to %llu, err %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_3();
}

void alloc_tmp_ino_helper_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_54(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s cannot persist dstream to %llu, err %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_3();
}

void alloc_tmp_ino_helper_cold_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_54(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s cannot set dstream on %llu, err %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_3();
}

void alloc_tmp_ino_helper_cold_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_66();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to create temporary inode under %llu with %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_3();
}

void alloc_tmp_ino_helper_cold_8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_66();
  OUTLINED_FUNCTION_31(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s can't enter transaction for %llu records, %llu blocks, err %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_3();
}

void free_tmp_ino_helper_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_27(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s can't remove dstream id %lld, %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_3();
}

void free_tmp_ino_helper_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_43(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_81(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s couldn't find drec for ino %llu\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void free_tmp_ino_helper_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_57(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s couldn't find name from tmp ino %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void free_tmp_ino_helper_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_54(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s can't enter transaction to delete tmp xattr inode %llu, err %d!\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_3();
}

void iterative_fext_cloner_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_73(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_26_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_26(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to insert extent for ino %lld @ logical offset %lld\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void get_new_crypto_id_if_needed_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_15(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s proposed crypto id %llu already in use, making a new one\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void is_non_iterative_extent_manipulation_faster_cold_1(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_14_0(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s lookup_file_extent failed: %s (%d)\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3_1();
}

void remove_dstream_id_and_fexts_copy_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to remove extents of dstream %llu (err %d)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void remove_dstream_id_and_fexts_copy_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_27(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to remove dstream_id %llu (err %d)\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_3();
}

void clone_extents_if_needed_with_gst_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_54(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_36(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s cannot update ino %llu, %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_3();
}

void clone_extents_if_needed_with_gst_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_36(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to restore refcnt on dstream id %llu, err: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void clone_extents_if_needed_with_gst_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_54(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to restore clone attributes for ino %llu (err %d)\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_3();
}

void clone_extents_if_needed_with_gst_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_36(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to restore refcnt on cloned dstream id %llu, err: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void clone_extents_if_needed_with_gst_cold_5()
{
  int v0;
  __int16 v1;
  int v2;
  _WORD v3[20];
  int v4;
  __int16 v5;
  int v6;

  OUTLINED_FUNCTION_101(*MEMORY[0x24BDAC8D0]);
  *(_DWORD *)v3 = 136316418;
  OUTLINED_FUNCTION_26_0();
  *(_DWORD *)&v3[7] = 15423;
  v3[9] = 2080;
  OUTLINED_FUNCTION_70();
  v4 = v0;
  v5 = v1;
  v6 = v2;
  _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: %s failed to get new crypto id for clone ino %lld (cret %d; clone prot class %d)\n",
    (uint8_t *)v3,
    0x32u);
  OUTLINED_FUNCTION_4_3();
}

void clone_extents_if_needed_with_gst_cold_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_36(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to decrement refcnt from cloned dstream id %llu, err: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void clone_extents_if_needed_with_gst_cold_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_110(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_26_0();
  OUTLINED_FUNCTION_70();
  OUTLINED_FUNCTION_94(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s couldn't find drec for tmp_ino %llu (%s)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void clone_extents_if_needed_with_gst_cold_8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_57(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s couldn't find name from tmp ino %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void clone_extents_if_needed_with_gst_cold_9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s can't enter the cleanup transaction... ret %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void clone_extents_if_needed_with_gst_cold_10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_27(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_36(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to decrement refcnt from cloned dstream id %llu, err: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_3();
}

void clone_extents_if_needed_with_gst_cold_11()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_34(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_81(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s dstream id %llu had refcount == 0\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void clone_extents_if_needed_with_gst_cold_12()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s cloning extents failed with %d (base_xid %lld)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void fs_get_inode_with_hint_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_31(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to load inode %lld ret %d on volume: %s\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void jdev_fext_read_data_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_15(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s Failed to fetch crypto for crypto_id %lld\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void jdev_fext_write_data_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_15(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s Failed to fetch crypto for crypto_id %lld\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void alloc_space_for_write_with_hint_and_spino_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to allocate temporary block memory\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void alloc_space_for_write_with_hint_and_spino_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to allocate temporary block memory\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void zero_tail_of_last_block_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_26(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to lookup pos %lld in obj-id %lld\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void fs_map_file_offset_ext_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_26_0();
  OUTLINED_FUNCTION_92(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s Unexpected unwritten extent for offset %lld of data stream %lld in inode %lld\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_48();
}

void fs_map_file_offset_ext_cold_2(int a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_62(a1, a2);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_31(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s Cannot start transaction with XID %lld: %s(%d)\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_7_0();
}

void _fs_add_xattr_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_15(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to get a new default crypto-id, ino %lld\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void fs_tx_enter_internal_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to compare currently available space: error %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void fs_tx_enter_internal_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_68(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s tx_enter() failed: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void fs_tx_enter_internal_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_68(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s tx_enter_frozen() failed: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void fs_tx_leave_ext_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s tx_leave failed: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void mark_doc_id_index_for_rebuild_if_needed_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to leave tx, error %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void mark_doc_id_index_for_rebuild_if_needed_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to enter tx, error %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void check_stale_doc_id_index_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to delete prev doc-id tree (no tracked files), error %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void check_stale_doc_id_index_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to leave tx, error %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void check_stale_doc_id_index_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to create doc-id tree, error %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void check_stale_doc_id_index_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to enter tx, error %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void check_stale_doc_id_index_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to delete prev doc-id tree, error %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void check_stale_doc_id_index_cold_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to delete doc-id tree, error %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void check_stale_doc_id_index_cold_7()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_86();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x42u);
  OUTLINED_FUNCTION_48();
}

void check_stale_doc_id_index_cold_8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to clean up doc-id trees, error %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void check_stale_doc_id_index_cold_9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to delete prev doc-id tree, error %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void check_stale_doc_id_index_cold_10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to delete doc-id tree, error %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void check_stale_doc_id_index_cold_11()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to mark doc-id index for rebuild, error %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void apfs_mount_livefs_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_21_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s set cloneinfo_id_epoch to %llu\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void apfs_mount_livefs_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_28(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s couldn't enter transaction to set apfs_cloneinfo_id_epoch, %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void apfs_mount_livefs_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to check if doc-id index is stale (error %d)\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void apfs_mount_livefs_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to fetch the pfkur tree (error %d)\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void apfs_mount_livefs_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to fetch the extentref tree (error %d)\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void apfs_mount_livefs_cold_6(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_14_0(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_23_0(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s Cannot load the secondary filesystem root tree: %s(%d)\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3_1();
}

void apfs_mount_livefs_cold_7(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_14_0(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_23_0(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s Cannot load the filesystem root tree: %s(%d)\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3_1();
}

void apfs_mount_livefs_cold_8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_25_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s overprovisioning volume can only mount r/o\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void apfs_mount_livefs_cold_9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_21_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unsupported apfs_readonly_compatible_features (%llx): mount r/o\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void apfs_mount_livefs_cold_10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unable to mount livefs as volume is restoring or mounted\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void setup_demo_mode_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s Couldn't create extentref tree for demo mode: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void setup_demo_mode_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s Couldn't enter TX on mount for demo mode: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void apfs_mount_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_15(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unsupported apfs_incompatible_features (%llx): unable to mount\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void apfs_mount_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_23_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s Failed to unwrap metadata crypto state: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void apfs_mount_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_23_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_25_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s resizing will be cancelled as the user volume is encrypted and is changing mount state to mounted\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void apfs_mount_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s Volume is incompletely restored and needs to be cleaned up\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void apfs_mount_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_15(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s encryption type %llx unsupported\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void apfs_mount_cold_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_23_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s Can't mount a volume undergoing restore/livefs-create\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void apfs_mount_cold_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_15(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s EALREADY; rooted from snap, apfs %p\n",
    v1,
    v2,
    v3,
    v4,
    2u);
  OUTLINED_FUNCTION_4();
}

void apfs_mount_cold_8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_103();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to get fsys oid %lld: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_3();
}

void get_unwrapped_ekwk_snap_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_89();
  OUTLINED_FUNCTION_28(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: cannot get on-disk ekwk %llu, %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void icp_dec_ref_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_34(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_78();
  OUTLINED_FUNCTION_23_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s danger - crypto id %lld had refcnt %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void icp_dec_ref_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_23_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s was NOT able to update/decrement crypto state %lld, err = %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void free_fext_resources_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s cannot deref crypto id %llu, %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void clone_file_fexts_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_23_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: cannot deref ino %llu old ekwk %llu, %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void clone_file_fexts_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s can't enter the cleanup transaction, ret %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void clone_file_fexts_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_49(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_28(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: cannot get unwrapped ekwk ino %llu, %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void clone_fexts__cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s can't enter the cleanup transaction, ret %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void clone_fexts__cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_99(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_23_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: cannot clone split fext %llu -> %llu, %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void apfs_mark_inconsistent__cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s Volume inconsistency detected by %s:%u!\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void extent_remover_callback_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_34(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_15(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s can't add dir %llu for recursive extent deletion\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void extent_remover_callback_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_34(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_21_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to get ino %lld\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void extent_remover_callback_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_54(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s error %d while removing extents on %lld\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_3();
}

void ino_get_ekwk_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_49(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_26_0();
  OUTLINED_FUNCTION_85();
  OUTLINED_FUNCTION_23_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: failed to load ekwk for ino %llu, id %llu, class %d, decode error\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void ino_get_ekwk_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_49(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_25_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: ino %llu has no ekwk id\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void clone_split_fext_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_67(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_26_0();
  OUTLINED_FUNCTION_85();
  OUTLINED_FUNCTION_31(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: cannot free fext %llu %llu:+%llu, %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void userfs_get_file_sizes_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_67(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: could not determine allocated size for compressed file ino %lld: error %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void userfs_combine_block_and_buf_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_67(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: failed to read block at pbn %llu, err %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void userfs_combine_block_and_buf_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: blockmap failed: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void userfs_internal_blockmap_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: NULL blockmap args.\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void userfs_internal_blockmap_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: NULL blockmap arguments.\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void userfs_internal_blockmap_cold_3()
{
  __int16 v0;
  uint64_t v1;
  int v2;
  const char *v3;
  __int16 v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = 136316162;
  v3 = "userfs_internal_blockmap";
  v4 = 1024;
  OUTLINED_FUNCTION_8_2();
  v5 = v0;
  v6 = v1;
  _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: Unexpected unwritten extent for offset %lld in data stream %lld of the inode %lld\n", (uint8_t *)&v2, 0x30u);
  OUTLINED_FUNCTION_4_3();
}

void userfs_set_file_size_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: No file extent found during truncate up: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void userfs_set_file_size_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: failed to zero-fill tail during truncate up: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void userfs_set_file_size_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: failed to remove prev_fsize after truncation: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void userfs_set_file_size_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: no txn for remove_prev_fsize: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void userfs_set_file_size_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: failed to zero-fill tail during truncate down: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void userfs_set_file_size_cold_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: No file extent found during truncate down: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void userfs_set_file_size_cold_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: failed to remove file extents: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void userfs_zero_tail_of_block_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_67(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: failed to write 1 block to disk at pbn %llu, err %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void userfs_zero_tail_of_block_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: zero-filling blockmap failed: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void userfs_set_ufa_common_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: failed to update inode attributes: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void userfs_set_ufa_common_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: failed to set file size: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void userfs_reclaim_with_flags_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: fs_delete_inode failed with error %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void userfs_create_common_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_67(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: failed to create symlink xattr on ino %llu, error %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void userfs_create_common_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: failed to create object named %s in dir w/obj-id %lld error %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void userfs_create_common_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_49(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: Inode %llu not a directory. Aborting.\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void userfs_internal_remove_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_49(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: Failed to move ino %lld to purgatory from dir %lld : %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void userfs_internal_remove_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: fs_delete_inode_with_xid failed with err %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void userfs_internal_remove_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_49(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: link count == %d for inum %lld?!\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void userfs_internal_remove_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: remove_dir_entry failed, err %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void userfs_internal_remove_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: failed to enter a delete transaction, err %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void userfs_internal_remove_cold_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: userfs_load_inode returned %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void userfs_internal_remove_cold_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: userfs_internal_lookup returned %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void apfs_get_node_name_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_67(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: ino %lld does not have a NAME!\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void apfs_getinfo_from_id_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_67(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: Failed to get name for ino %lld, error %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void apfs_getinfo_from_id_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: userfs_load_inode returned %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void userfs_apfs_preallocate_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_49(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: failed to clone extents for ino %llu, err %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void io_get_device_block_size_cold_1()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21F566000, MEMORY[0x24BDACB70], v1, "%s:%d: can't get the device block size (%s). assuming 512\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

void dev_write_data_cold_1()
{
  uint64_t v0;
  _WORD v1[10];
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  *(_DWORD *)v1 = 136315650;
  OUTLINED_FUNCTION_1();
  *(_DWORD *)&v1[7] = 338;
  v1[9] = 2048;
  v2 = v0;
  _os_log_fault_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "%s:%d: data write (%zu blocks) over superblock!\n", (uint8_t *)v1, 0x1Cu);
  OUTLINED_FUNCTION_4();
}

void fd_dev_close_cold_1()
{
  __int16 v0;
  int v1;
  uint64_t v2;
  _WORD v3[10];
  int v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  *(_DWORD *)v3 = 136315906;
  OUTLINED_FUNCTION_1();
  *(_DWORD *)&v3[7] = 370;
  v3[9] = v0;
  v4 = v1;
  v5 = 2080;
  v6 = v2;
  _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: Hit an error flushing the cache, %d dev_name = %s\n", (uint8_t *)v3, 0x22u);
  OUTLINED_FUNCTION_4();
}

void dev_init_common_cold_1()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21F566000, MEMORY[0x24BDACB70], v1, "%s:%d: can't get block count (%s)\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4();
}

void dev_init_common_cold_2(int *a1, int a2)
{
  int v2;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  int v8;
  __int16 v9;
  int v10;
  __int16 v11;
  _DWORD *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = 136316162;
  v4 = "dev_init_common";
  v5 = 1024;
  v6 = 983;
  v7 = 1024;
  v8 = v2;
  v9 = 1024;
  v10 = a2;
  v11 = 2080;
  v12 = a1 + 52;
  _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: Couldn't fstat dev_fd (%d), err %d dev_name = %s\n", (uint8_t *)&v3, 0x28u);
  OUTLINED_FUNCTION_4();
}

void dev_init_cold_1(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_8_3(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_15(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: failed to open volume device %s: %s\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_4_3();
}

void dev_init_cold_2(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_8_3(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_15(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: failed to open container device %s: %s\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_4_3();
}

void fd_dev_read_helper_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_31(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: blknum %lld size %zu blksize %u invalid, dev_name = %s\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void _fd_dev_write_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_31(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: blknum %lld size %zu blksize %u invalid, dev_name = %s\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void nx_superblock_agrees_with_main_superblock_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8_4();
  OUTLINED_FUNCTION_26(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s<->superblock mismatch on checkpoint data base address: %lld %lld\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void nx_superblock_agrees_with_main_superblock_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8_4();
  OUTLINED_FUNCTION_26(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s<->superblock mismatch on checkpoint descriptor base address: %lld %lld\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void nx_superblock_agrees_with_main_superblock_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_80(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s<->superblock mismatch on checkpoint data block count: %d %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_superblock_agrees_with_main_superblock_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_80(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s<->superblock mismatch on checkpoint descriptor block count: %d %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_superblock_agrees_with_main_superblock_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8_4();
  OUTLINED_FUNCTION_26(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s<->superblock mismatch on block count: %lld %lld\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void nx_superblock_agrees_with_main_superblock_cold_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_80(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s<->superblock mismatch on block size: %d %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_superblock_agrees_with_main_superblock_cold_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8_4();
  OUTLINED_FUNCTION_26(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: the %s superblock has a lower XID %lld than the main superblock %lld\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void nx_superblock_agrees_with_main_superblock_cold_8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s<->superblock mismatch on fusion uuid, tier2=%d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_superblock_agrees_with_main_superblock_cold_9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s<->superblock mismatch on uuid\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_checkpoint_find_valid_checkpoint_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_15(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unsupported nx_incompatible_features (0x%llx): unable to mount\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_checkpoint_load_data_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s couldn't allocate memory for checkpoint map block\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_checkpoint_load_data_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_67(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_103();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_26(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unexpected checkpoint map entry address: 0x%llx, expected 0x%llx\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_3();
}

void nx_dev_init_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s couldn't allocate memory for superblock of size %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_dev_init_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s superblock failed sanity checks: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_dev_init_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s couldn't allocate memory for superblock of size %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_dev_init_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s tier2 device superblock doesn't agree with main superblock\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_dev_init_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s couldn't read tier2 device superblock of size %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_dev_init_cold_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_67(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_103();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_80(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s container block size too small for tier2 device block size (%d < %d)\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void nx_dev_init_cold_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to set tier2 device: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_dev_init_cold_8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_67(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_103();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_80(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s container block size too small for device block size (%d < %d)\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void nx_dev_init_cold_9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s couldn't read superblock of size %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_dev_init_cold_10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_67(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_103();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_80(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s block size %d is not an even multiple of device block size %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void nx_dev_init_cold_11()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: tier2 device initialization failed: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void nx_dev_init_cold_12()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: device initialization failed: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void nx_mount_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: device initialization failed: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void nx_mount_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_68(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to allocate buffer for checkpoint superblock\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_mount_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_68(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s No temporary checkpoint start xid!  Aborting!\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_mount_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_68(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s checkpoint descriptor block %d doesn't agree with main superblock\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_mount_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_68(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s nx_unblock_physical_range failed with error: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_mount_cold_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_68(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to set up sm allocation metadata: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_mount_cold_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_20_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to write superblock to block %lld: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void nx_mount_cold_8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_68(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed nx_check sanity: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_mount_cold_9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_68(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s tx manager initialization failed: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_mount_cold_10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_68(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to set up spaceman for demo mode: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_mount_cold_11()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_20_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s checkpoint xid %lld failed to load spaceman metadata ranges (overlap?): %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void nx_mount_cold_12()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_20_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s checkpoint xid %lld failed to get spaceman: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void nx_mount_cold_13()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_68(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s sanity check of recently-changed structures failed: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_mount_cold_14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_68(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to fix up checkpoint data: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_mount_cold_15()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_26_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_80(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s data for checkpoint at index %d couldn't be loaded: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_mount_cold_16()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_26_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_80(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s validation failed for checkpoint at index %d: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_mount_cold_17()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_68(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_80(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s checkpoint superblock index %d doesn't match index block was found at: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_mount_cold_18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_68(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_15(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unsupported nx_incompatible_features (0x%llx): unable to mount\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_mount_cold_19()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_68(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_80(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s checkpoint descriptor block %d superblock failed sanity checks: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_mount_cold_20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_68(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to find valid checkpoint: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_mount_cold_21()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_68(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to scan checkpoint descriptor area for largest xid: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_mount_cold_22()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s checkpoint descriptor length is bad.  Container cleanly-unmounted flag ignored\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_mount_cold_23()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s checkpoint data length is bad.  Container cleanly-unmounted flag ignored\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_mount_cold_24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s storage is untrusted. Container cleanly-unmounted flag ignored\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_mount_cold_25()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_68(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s fragmented checkpoint area failed sanity check: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_mount_cold_26()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s object cache bootstrap failed: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_mount_cold_27()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s object cache initialization failed: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_mount_cold_28()
{
  uint64_t v0;
  __int16 v1;
  _WORD v2[10];
  uint64_t v3;
  __int16 v4;
  int v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  *(_DWORD *)v2 = 136316162;
  OUTLINED_FUNCTION_2_0();
  *(_DWORD *)&v2[7] = 1285;
  v2[9] = 2080;
  v3 = v0;
  v4 = v1;
  v5 = 256;
  v6 = v1;
  v7 = 4096;
  _os_log_debug_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%s:%d: %s initializing cache w/hash_size %u and cache size %u\n", (uint8_t *)v2, 0x28u);
  OUTLINED_FUNCTION_4();
}

void nx_mount_cold_29()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: conflicting mount options: load from temporary checkpoint AND checkpoint descriptor index %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void nx_mount_cold_30()
{
  _DWORD v0[6];
  uint64_t v1;

  v1 = *MEMORY[0x24BDAC8D0];
  v0[0] = 136315394;
  OUTLINED_FUNCTION_1();
  *(_DWORD *)((char *)&v0[3] + 2) = 1086;
  _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: conflicting mount options: is_system_graft but not is_graft\n", (uint8_t *)v0, 0x12u);
  OUTLINED_FUNCTION_3_0();
}

void nx_mount_initiate_free_space_trims_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s *** trim'ing free blocks returned: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void obj_mem_mgr_init_cold_1()
{
  __int16 v0;
  int v1;
  uint64_t v2;
  _WORD v3[10];
  int v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  *(_DWORD *)v3 = 136315906;
  OUTLINED_FUNCTION_2_0();
  *(_DWORD *)&v3[7] = 7170;
  v3[9] = v0;
  v4 = v1;
  v5 = 2048;
  v6 = v2;
  _os_log_debug_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%s:%d: object memory manager initialized with feature flags: 0x%x, apfs_mem_max: %lld\n", (uint8_t *)v3, 0x22u);
  OUTLINED_FUNCTION_4();
}

void obj_mem_mgr_init_cold_2()
{
  __int16 v0;
  int v1;
  _WORD v2[10];
  int v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  *(_DWORD *)v2 = 136315650;
  OUTLINED_FUNCTION_1();
  *(_DWORD *)&v2[7] = 7149;
  v2[9] = v0;
  v3 = v1;
  _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: object memory manager failed to create lock, error: %d\n", (uint8_t *)v2, 0x18u);
}

void obj_cache_flush_prepare_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_8_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_6_4(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s oid 0x%llx flags 0x%llx 0x%x type 0x%x/0x%x error preparing for write: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_48();
}

void obj_cache_flush_prepare_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_6_4(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s oid 0x%llx flags 0x%llx 0x%x type 0x%x/0x%x error preparing for write: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_48();
}

void obj_cache_flush_prepare_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_8_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_6_4(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s oid 0x%llx flags 0x%llx 0x%x type 0x%x/0x%x error preparing for write: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_48();
}

void obj_cache_flush_prepare_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_6_4(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s oid 0x%llx flags 0x%llx 0x%x type 0x%x/0x%x error preparing for write: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_48();
}

void obj_write_prepare_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_4_6(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s oid 0x%llx flags 0x%llx 0x%x type 0x%x/0x%x non-virtual object missing paddr!\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_48();
}

void obj_write_prepare_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_27_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_4_6(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s oid 0x%llx flags 0x%llx 0x%x type 0x%x/0x%x non-virtual object missing paddr!\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_48();
}

void obj_cache_remove_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s error unreserving tier2 space, %lld blocks: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void obj_cache_remove_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_26_2(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_103();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s error unreserving tier2 space, %lld blocks: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_3();
}

void obj_cache_remove_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s error unreserving space, %lld blocks: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void obj_cache_remove_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_26_2(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_103();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s error unreserving space, %lld blocks: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_3();
}

void obj_cache_remove_reverted_fs_objects_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_13_1();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s error unreserving tier2 space, %lld blocks: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void obj_cache_remove_reverted_fs_objects_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_21_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unreserving %lld blocks for reverted fs objects\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void obj_cache_remove_reverted_fs_objects_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_13_1();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s error unreserving space, %lld blocks: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void obj_cache_remove_reverted_fs_objects_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_21_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unreserving %lld blocks for reverted fs objects\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void obj_cache_remove_reverted_fs_objects_cold_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 112);
  v4 = 136316418;
  v5 = "obj_cache_remove_reverted_fs_objects";
  v6 = 1024;
  v7 = 1781;
  v8 = 2080;
  v9 = a1 + 3720;
  v10 = 2048;
  v11 = v3;
  v12 = 2048;
  v13 = a2;
  v14 = 2048;
  v15 = a3;
  _os_log_debug_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%s:%d: %s removing reverted fs objects for fs %lld: %lld - %lld\n", (uint8_t *)&v4, 0x3Au);
  OUTLINED_FUNCTION_48();
}

void obj_cache_remove_new_fs_objects_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s error unreserving tier2 space, %lld blocks: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void obj_cache_remove_new_fs_objects_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s error unreserving space, %lld blocks: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void obj_alloc_cold_1()
{
  __int16 v0;
  int v1;
  int v2;
  _WORD v3[10];
  int v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  *(_DWORD *)v3 = 136315906;
  OUTLINED_FUNCTION_1();
  *(_DWORD *)&v3[7] = 2153;
  v3[9] = v0;
  v4 = v1;
  v5 = v0;
  v6 = v2;
  _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: invalid object size: %d size_phys %d\n", (uint8_t *)v3, 0x1Eu);
  OUTLINED_FUNCTION_4();
}

void obj_alloc_cold_2()
{
  uint64_t v0;
  __int16 v1;
  int v2;
  int v3;
  uint8_t v4[14];
  int v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  int v9;
  __int16 v10;
  int v11;

  OUTLINED_FUNCTION_26_2(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_103();
  OUTLINED_FUNCTION_2_0();
  v5 = 2151;
  v6 = 2080;
  v7 = v0;
  v8 = v1;
  v9 = v2;
  v10 = v1;
  v11 = v3;
  _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: %s invalid object size: %d size_phys %d\n", v4, 0x28u);
  OUTLINED_FUNCTION_4();
}

void obj_alloc_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_14_2(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_6_4(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s oid 0x%llx flags 0x%llx 0x%x type 0x%x/0x%x error destroying: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_48();
}

void obj_alloc_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_8_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_6_4(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s oid 0x%llx flags 0x%llx 0x%x type 0x%x/0x%x error destroying: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_48();
}

void obj_delete_and_free_by_oid_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_26_2(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_103();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unable to get fs object 0x%llx: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_3();
}

void obj_read_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_14_2(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_4_6(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s oid 0x%llx flags 0x%llx 0x%x type 0x%x/0x%x object missing paddr!\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_48();
}

void obj_read_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_8_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_4_6(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s oid 0x%llx flags 0x%llx 0x%x type 0x%x/0x%x object missing paddr!\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_48();
}

void obj_modify_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_16_2();
  OUTLINED_FUNCTION_21_1();
  OUTLINED_FUNCTION_4_6(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s oid 0x%llx flags 0x%llx 0x%x type 0x%x/0x%x can't modify object before read completes\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_48();
}

void obj_modify_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_27_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_21_1();
  OUTLINED_FUNCTION_4_6(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s oid 0x%llx flags 0x%llx 0x%x type 0x%x/0x%x can't modify object before read completes\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_48();
}

void obj_destroy_complete_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_23_2();
  OUTLINED_FUNCTION_4_6(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s oid 0x%llx flags 0x%llx type 0x%x/0x%x error destroying: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_48();
}

void obj_destroy_complete_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_16_2();
  OUTLINED_FUNCTION_23_2();
  OUTLINED_FUNCTION_4_6(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s oid 0x%llx flags 0x%llx type 0x%x/0x%x error destroying: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_48();
}

void omap_reap_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s tree_delete() failed: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void omap_reap_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s tree_delete() failed: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void omap_reap_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to get omap snapshot tree for reaping: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void omap_reap_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to get omap snapshot tree for reaping: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void omap_reap_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s tree_delete() failed: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void omap_reap_cold_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s tree_delete() failed: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void omap_reap_cold_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to get omap tree for reaping: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void omap_reap_cold_8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to get omap tree for reaping: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void omap_reap_cold_9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s obj_modify() failed: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void omap_reap_cold_10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s obj_modify() failed: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void omap_reap_cold_11()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s error searching snapshot tree: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void omap_reap_cold_12()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s error searching snapshot tree: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void omap_reap_cold_13()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s error searching snapshot tree: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void omap_reap_cold_14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s error searching snapshot tree: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void omap_reap_cold_15()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s error searching snapshot tree: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void omap_reap_cold_16()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s error searching snapshot tree: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void omap_reap_cold_17()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s error deleting empty snapshot tree: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void omap_reap_cold_18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s error deleting empty snapshot tree: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void omap_reap_cold_19()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s error updating snapshot tree: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void omap_reap_cold_20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s error updating snapshot tree: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void omap_reap_cold_21()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unable to get snapshot tree: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void omap_reap_cold_22()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unable to get snapshot tree: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void omap_reap_cold_23()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s lookup returned unexpected error while iterating: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void omap_reap_cold_24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s lookup returned unexpected error while iterating: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void omap_reap_cold_25()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_22_2();
  OUTLINED_FUNCTION_58(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s started cleaning snapshots %lld-%lld\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void omap_reap_cold_26()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_22_2();
  OUTLINED_FUNCTION_58(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s started cleaning snapshots %lld-%lld\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void omap_reap_cold_27()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unable to get snapshot tree: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void omap_reap_cold_28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unable to get snapshot tree: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void omap_reap_cold_29()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s error getting mapping tree: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void omap_reap_cold_30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s error getting mapping tree: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void omap_reap_cold_31()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s error modifying omap: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void omap_reap_cold_32()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s error modifying omap: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void omap_destroy_cold_1()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_23_3(v0, v1);
  OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_4_7();
  OUTLINED_FUNCTION_10(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s error adding omap 0x%llx type 0x%x to reap list: %d\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_7_0();
}

void omap_destroy_cold_2()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_23_3(v0, v1);
  OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_4_7();
  OUTLINED_FUNCTION_10(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s error adding omap 0x%llx type 0x%x to reap list: %d\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_7_0();
}

void omap_set_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unable to get spaceman: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void omap_set_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unable to get spaceman: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void omap_find_next_snapshot_xid_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s error searching snapshot tree: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void omap_find_next_snapshot_xid_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s error searching snapshot tree: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void omap_find_next_snapshot_xid_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unable to get snapshot tree: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void omap_find_next_snapshot_xid_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unable to get snapshot tree: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void omap_find_next_snapshot_xid_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unable to get omap: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void omap_find_next_snapshot_xid_cold_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unable to get omap: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void _omap_snapshot_create_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s error adding snapshot: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void _omap_snapshot_create_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s error adding snapshot: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void _omap_snapshot_create_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unable to create snapshot tree: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void _omap_snapshot_create_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unable to create snapshot tree: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void _omap_snapshot_create_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unable to get snapshot tree: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void _omap_snapshot_create_cold_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unable to get snapshot tree: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void _omap_snapshot_delete_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s error searching snapshot tree: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void _omap_snapshot_delete_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s error searching snapshot tree: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void _omap_snapshot_delete_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s error searching snapshot tree: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void _omap_snapshot_delete_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s error searching snapshot tree: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void _omap_snapshot_delete_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s error searching snapshot tree: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void _omap_snapshot_delete_cold_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s error searching snapshot tree: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void _omap_snapshot_delete_cold_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_24();
  obj_oid(v0);
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_4_7();
  OUTLINED_FUNCTION_10(&dword_21F566000, MEMORY[0x24BDACB70], v1, "%s:%d: %s error adding omap 0x%llx type 0x%x to reap list for cleaning: %d\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_7_0();
}

void _omap_snapshot_delete_cold_8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_24();
  obj_oid(v0);
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_4_7();
  OUTLINED_FUNCTION_10(&dword_21F566000, MEMORY[0x24BDACB70], v1, "%s:%d: %s error adding omap 0x%llx type 0x%x to reap list for cleaning: %d\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_7_0();
}

void _omap_snapshot_delete_cold_9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s error updating snapshot tree: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void _omap_snapshot_delete_cold_10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s error updating snapshot tree: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void _omap_snapshot_delete_cold_11()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_17_1();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unable to find snapshot %lld: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void _omap_snapshot_delete_cold_12()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_17_1();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unable to find snapshot %lld: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void _omap_snapshot_delete_cold_13()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unable to get snapshot tree: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void _omap_snapshot_delete_cold_14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unable to get snapshot tree: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void omap_revert_to_snapshot_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s error searching snapshot tree: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void omap_revert_to_snapshot_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s error searching snapshot tree: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void omap_revert_to_snapshot_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s Unable to look up any snapshot greater than %lld ?: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_3();
}

void omap_revert_to_snapshot_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s Unable to look up any snapshot greater than %lld ?: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void omap_revert_to_snapshot_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unable to create snapshot for reversion: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void omap_revert_to_snapshot_cold_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unable to create snapshot for reversion: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void omap_revert_to_snapshot_cold_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unable to get snapshot tree: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void omap_revert_to_snapshot_cold_8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unable to get snapshot tree: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void omap_revert_to_snapshot_cold_9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_29_0();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s can't revert because a revert is still pending to be cleaned up: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void omap_revert_to_snapshot_cold_10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_29_0();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s can't revert because a revert is still pending to be cleaned up: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void omap_revert_to_snapshot_cold_11()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s Manually managed omaps don't support snapshots\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void omap_revert_to_snapshot_cold_12()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s Manually managed omaps don't support snapshots\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void supplemental_tree_node_count_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unsupported tree type: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void supplemental_tree_get_descriptor_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unsupported tree type: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void supplemental_tree_destroy_cold_1(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_5_3(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_10(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s Failed to delete supplemental tree (type %d): %d (%s)\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_7_0();
}

void supplemental_tree_copy_cold_1(int a1, int __errnum)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  strerror(__errnum);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_10(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s Failed to copy supplemental tree (type %d): %d (%s)\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_7_0();
}

void supplemental_tree_copy_cold_2(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_5_3(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_10(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s Failed to copy supplemental tree (type %d): %d (%s)\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_7_0();
}

void apfs_uvfsop_mount_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: no memory for root node, exiting\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void apfs_uvfsop_mount_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: userfs_apfs_mount failed: error %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void apfs_uvfsop_mount_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: userfs_nx_mount failed: error %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void apfs_uvfsop_sync_cold_1(uint64_t a1, int __errnum)
{
  uint64_t v3;
  uint64_t v4;
  __int16 v5;
  _WORD v6[10];
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 384) + 208;
  strerror(__errnum);
  *(_DWORD *)v6 = 136316162;
  OUTLINED_FUNCTION_1();
  *(_DWORD *)&v6[7] = 578;
  v6[9] = 2080;
  v7 = v3;
  v8 = 2080;
  v9 = v4;
  v10 = v5;
  v11 = __errnum;
  _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: %s: failed to finish all transactions in apfs_uvfsop_sync() - %s(%d)\n", (uint8_t *)v6, 0x2Cu);
}

void apfs_uvfsop_getfsattr_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: spaceman_size_info failed: error %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void apfs_uvfsop_getfsattr_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], a3, "%s:%d: Failed to get name for ino %lld, error %d\n", a5, a6, a7, a8, 2u);
}

void apfs_uvfsop_getfsattr_cold_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a2 + 8);
  v4 = *(_QWORD *)(a3 + 400);
  v5 = 136316162;
  v6 = "apfs_uvfsop_getfsattr";
  v7 = 1024;
  v8 = 671;
  v9 = 2080;
  v10 = a1;
  v11 = 2048;
  v12 = v3;
  v13 = 2080;
  v14 = v4;
  _os_log_debug_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%s:%d: Getting file-system attribute(%s) on node with ino: %llu, inside volume %s\n", (uint8_t *)&v5, 0x30u);
  OUTLINED_FUNCTION_4_3();
}

void apfs_uvfsop_setfsattr_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: Asked to set empty volume name, exiting...\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void apfs_uvfsop_setfsattr_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: Failed to finish transaction to rename volume: error %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void apfs_uvfsop_check_cold_1()
{
  uint64_t v0;
  _WORD v1[10];
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  *(_DWORD *)v1 = 136315650;
  OUTLINED_FUNCTION_1();
  *(_DWORD *)&v1[7] = 279;
  v1[9] = 2048;
  v2 = v0;
  _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: Passed-in vol_id %llu is invalid\n", (uint8_t *)v1, 0x1Cu);
}

void apfs_uvfsop_check_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: posix_spawnattr_destroy returned error: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void apfs_uvfsop_check_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: posix_spawn_file_actions_destroy returned error: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void apfs_uvfsop_check_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: waitpid returned with error %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void apfs_uvfsop_check_cold_5(int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  strsignal(a1);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6_5();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v1, "%s:%d: fsck_apfs killed by signal %d (%s)", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4_3();
}

void apfs_uvfsop_check_cold_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: fsck_apfs exited with error %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void apfs_uvfsop_check_cold_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: fsck_apfs status unknown %d", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void apfs_uvfsop_check_cold_8(int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  strsignal(a1 >> 8);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6_5();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v1, "%s:%d: fsck_apfs stopped by signal %d (%s)", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4_3();
}

void apfs_uvfsop_check_cold_9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: invalid how flag set for check, proceeding with quick check\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void apfs_uvfsop_scanvols_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: failed to get next vol: error %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void apfs_uvfsop_scanvols_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: userfs_nx_mount failed: error %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void dir_stats_op_ext_cold_1()
{
  int v0[10];
  uint64_t v1;

  v1 = *MEMORY[0x24BDAC8D0];
  v0[0] = 136315906;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8_0();
  _os_log_fault_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "%s:%d: %s invalid op_flags for setting dir-stats: 0x%llx\n", (uint8_t *)v0, 0x26u);
  OUTLINED_FUNCTION_4();
}

void dir_stats_op_ext_cold_2(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_6_6(a3, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_31(&dword_21F566000, MEMORY[0x24BDACB70], v3, "%s:%d: %s failed to set fast-path SAF dir-stats %llu: %s (%d)\n", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_7_0();
}

void dir_stats_op_ext_cold_3(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_5_4(a3, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_31(&dword_21F566000, MEMORY[0x24BDACB70], v3, "%s:%d: %s failed to enter tx to set the SAF flag on dir-stats for ino %llu: %s (%d)\n", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_7_0();
}

void dir_stats_op_ext_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_43(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_15(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s cannot set dir-stats for ino %llu because its current dir-stats has unknown flags\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void dir_stats_set_purgeable_state_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_43(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_15(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s ino %llu is flagged as dir-stats origin but has no dir-stats key\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void dir_stats_get_all_ancestors_attributes_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s stopped updating dir-stats due to chain being too long\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void get_dir_stats_by_key_cold_1(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_6_6(a3, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_31(&dword_21F566000, MEMORY[0x24BDACB70], v3, "%s:%d: %s failed to look up shadow dir-stats %llu: %s (%d)\n", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_7_0();
}

void get_dir_stats_by_key_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_15(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s dir-stats key %llu is busy even though we hold the inode lock\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void get_dir_stats_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_43(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_15(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s ino %llu is flagged as dir-stats origin but has no dir-stats key\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void init_dir_stats_xfields_cold_1(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_5_4(a3, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_18_2();
  OUTLINED_FUNCTION_15_3();
  OUTLINED_FUNCTION_22_3(&dword_21F566000, MEMORY[0x24BDACB70], v3, "%s:%d: %s failed to init xfield %d for dir-stats %llu: %s (%d)\n", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_87();
}

void init_dir_stats_xfields_cold_2(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_5_4(a3, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_18_2();
  OUTLINED_FUNCTION_15_3();
  OUTLINED_FUNCTION_22_3(&dword_21F566000, MEMORY[0x24BDACB70], v3, "%s:%d: %s failed to init xfield %d for dir-stats %llu: %s (%d)\n", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_87();
}

void init_dir_stats_xfields_cold_3(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_5_4(a3, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_18_2();
  OUTLINED_FUNCTION_15_3();
  OUTLINED_FUNCTION_22_3(&dword_21F566000, MEMORY[0x24BDACB70], v3, "%s:%d: %s failed to init xfield %d for dir-stats %llu: %s (%d)\n", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_87();
}

void size_tracking_ino_moved_cold_1(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_5_4(a3, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_31(&dword_21F566000, MEMORY[0x24BDACB70], v3, "%s:%d: %s failed to init extended fields for dir-stats object on ino %llu: %s (%d); size tracking may go out of sync\n",
    v4,
    v5,
    v6,
    v7,
    2u);
  OUTLINED_FUNCTION_7_0();
}

void size_tracking_ino_moved_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_43(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_15(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s ino %llu is flagged to maintain dir-stats but has no dir-stats key\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void size_tracking_ino_moved_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_43(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_15(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s ino %llu is flagged as dir-stats origin but has no dir-stats key\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void size_tracking_untrack_inode_cold_1(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_6_6(a3, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_31(&dword_21F566000, MEMORY[0x24BDACB70], v3, "%s:%d: %s failed to remove shadow dir-stats object (id %llu): %s (%d)\n", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_7_0();
}

void size_tracking_untrack_inode_cold_2(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_6_6(a3, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_31(&dword_21F566000, MEMORY[0x24BDACB70], v3, "%s:%d: %s failed to remove dir-stats object (id %llu): %s (%d)\n", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_7_0();
}

void update_size_tracking_cold_1(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_5_4(a3, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_31(&dword_21F566000, MEMORY[0x24BDACB70], v3, "%s:%d: %s failed to enter tx to update size tracking for ino %llu: %s (%d); size tracking may go out of sync\n",
    v4,
    v5,
    v6,
    v7,
    2u);
  OUTLINED_FUNCTION_7_0();
}

void update_dir_stats_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_43(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_15(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s ino %llu is flagged to maintain dir-stats but has no dir-stats key\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void update_size_tracking_purgeable_size_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_43(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_15(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s ino %llu is flagged to maintain dir-stats but has no dir-stats key\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void update_dir_stats_by_key_ext_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s stopped updating dir-stats due to chain being too long\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void sanitize_op_flags_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s dir-stats can either be set or unset, but not both and not neither\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void sanitize_op_flags_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s no special dir-stats op flags are allowed on non-expanded volumes\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void sanitize_op_flags_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s DS_OP_ONLY_SPACE_ATTRIBUTION can't be specified alone\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void sanitize_op_flags_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s DS_OP_SET_BY_SPACE_ATTRIBUTION cannot be passed along with DS_OP_UNSET_BY_SPACE_ATTRIBUTION\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void sanitize_op_flags_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s DS_OP_SET_FOR_SPACE_ATTRIBUTION cannot be passed along with DS_OP_UNSET_FOR_SPACE_ATTRIBUTION\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void sanitize_op_flags_cold_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s DS_OP_SET_BY_SPACE_ATTRIBUTION cannot be passed without DS_OP_SET_FOR_SPACE_ATTRIBUTION\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void sanitize_op_flags_cold_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s DS_OP_[UN]SET_BY_SPACE_ATTRIBUTION can't be used internally\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void sanitize_op_flags_cold_8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s DS_OP_TRACK_PURGEABLE_RSRC_SIZE can only be used with DS_OP_TRACK_RSRC_FORKS and DS_OP_TRACK_PURGEABLE_SIZE\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void sanitize_op_flags_cold_9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s DS_OP_ONLY_SPACE_ATTRIBUTION can only be used with SAF flags\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void sanitize_op_flags_cold_10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s DS_OP_ONLY_SPACE_ATTRIBUTION can't be used externally\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void sanitize_op_flags_cold_11()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_15(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s invalid dir-stats UNSET flags: 0x%llx\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void sanitize_op_flags_cold_12()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_15(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unknown dir-stats op flags: 0x%llx\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void set_dir_stats_cold_1(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_6_6(a3, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_31(&dword_21F566000, MEMORY[0x24BDACB70], v3, "%s:%d: %s failed to update ino %llu as dir-stats origin: %s (%d)\n", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_7_0();
}

void set_dir_stats_cold_2(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_14_0(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s failed to enter tx to finalize calculation: %s (%d)\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3_1();
}

void set_dir_stats_cold_3(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_6_6(a3, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_31(&dword_21F566000, MEMORY[0x24BDACB70], v3, "%s:%d: %s failed to set up dir-stats for ino %llu: %s (%d);  size tracking may be out of sync\n",
    v4,
    v5,
    v6,
    v7,
    2u);
  OUTLINED_FUNCTION_7_0();
}

void set_dir_stats_cold_4(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_6_6(a3, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_31(&dword_21F566000, MEMORY[0x24BDACB70], v3, "%s:%d: %s failed to make dir-stats %llu shadow: %s (%d)\n", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_7_0();
}

void set_dir_stats_cold_5(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_6_6(a3, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_31(&dword_21F566000, MEMORY[0x24BDACB70], v3, "%s:%d: %s failed to update dir-stats key for ino %llu: %s (%d)\n", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_7_0();
}

void set_dir_stats_cold_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_15(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to insert dir-stats object on ino %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void set_dir_stats_cold_7(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_14_0(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s failed to set shadow dir-stats key new dir-stats: %s (%d)\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3_1();
}

void set_dir_stats_cold_8(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_6_6(a3, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_31(&dword_21F566000, MEMORY[0x24BDACB70], v3, "%s:%d: %s failed to retrieve existing dir-stats %llu: %s (%d)\n", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_7_0();
}

void set_dir_stats_cold_9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_15(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s ino %llu is flagged as dir-stats origin but has no dir-stats key\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void unset_dir_stats_cold_1(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_5_4(a3, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_31(&dword_21F566000, MEMORY[0x24BDACB70], v3, "%s:%d: %s failed to remove dir-stats for unsetting %llu: %s (%d)\n", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_7_0();
}

void unset_dir_stats_cold_2(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_5_4(a3, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_31(&dword_21F566000, MEMORY[0x24BDACB70], v3, "%s:%d: %s failed to enter tx to remove dir-stats for unsetting %llu: %s (%d)\n", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_7_0();
}

void unset_dir_stats_cold_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a2 + 8);
  v4 = 136316162;
  v5 = "unset_dir_stats";
  v6 = 1024;
  v7 = 2452;
  v8 = 2080;
  v9 = a1 + 3720;
  v10 = 2048;
  v11 = v3;
  v12 = 2048;
  v13 = a3;
  _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: %s can't UNSET dir-stats for inode (id %llu, internal_flags 0x%llx) that is not origin\n", (uint8_t *)&v4, 0x30u);
}

void unset_dir_stats_cold_4(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_5_4(a3, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_31(&dword_21F566000, MEMORY[0x24BDACB70], v3, "%s:%d: %s failed to unset dir-stats for ino %llu: %s (%d);  size tracking may be out of sync\n",
    v4,
    v5,
    v6,
    v7,
    2u);
  OUTLINED_FUNCTION_7_0();
}

void unset_dir_stats_cold_5(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_5_4(a3, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_31(&dword_21F566000, MEMORY[0x24BDACB70], v3, "%s:%d: %s failed to update dir-stats state for ino %llu: %s (%d)\n", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_7_0();
}

void unset_dir_stats_cold_6(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_5_4(a3, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_31(&dword_21F566000, MEMORY[0x24BDACB70], v3, "%s:%d: %s failed to enter tx to unset dir-stats for ino %llu: %s (%d)\n", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_7_0();
}

void unset_dir_stats_cold_7(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_6_6(a3, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_31(&dword_21F566000, MEMORY[0x24BDACB70], v3, "%s:%d: %s failed to retrieve existing dir-stats %llu: %s (%d)\n", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_7_0();
}

void unset_dir_stats_cold_8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_43(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_15(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s ino %llu is flagged as dir-stats origin but has no dir-stats key\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void unset_dir_stats_cold_9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_15(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s ino %llu is flagged as dir-stats origin but has no dir-stats key\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void dir_stats_get_flags_cold_1(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_5_3(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_16_3();
  OUTLINED_FUNCTION_31(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s could not get dir-stats %llu: %s (%d)\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_7_0();
}

void _setup_dir_stats_cb_cold_1(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_5_4(a3, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_31(&dword_21F566000, MEMORY[0x24BDACB70], v3, "%s:%d: %s failed to update dir-stats state for ino %llu: %s (%d)\n", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_7_0();
}

void _setup_dir_stats_cb_cold_2(uint64_t a1, char a2, uint64_t a3)
{
  const char *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = 136316162;
  v5 = "_setup_dir_stats_cb";
  v3 = "setting";
  v6 = 1024;
  v7 = 2008;
  v9 = a1 + 3720;
  v8 = 2080;
  if ((a2 & 1) != 0)
    v3 = "unsetting";
  v10 = 2080;
  v11 = v3;
  v12 = 2048;
  v13 = a3;
  _os_log_fault_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "%s:%d: %s invalid op_flags for %s dir-stats: 0x%llx\n", (uint8_t *)&v4, 0x30u);
}

void set_dir_stats_handle_origin_cold_1(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_6_6(a3, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_31(&dword_21F566000, MEMORY[0x24BDACB70], v3, "%s:%d: %s failed to make dir-stats %llu shadow: %s (%d)\n", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_7_0();
}

void set_dir_stats_handle_origin_cold_2(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_6_6(a3, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_31(&dword_21F566000, MEMORY[0x24BDACB70], v3, "%s:%d: %s failed to update ino %llu on-disk: %s (%d)\n", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_7_0();
}

void set_dir_stats_handle_origin_cold_3(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_6_6(a3, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_31(&dword_21F566000, MEMORY[0x24BDACB70], v3, "%s:%d: %s failed to insert new dir-stats object on ino %llu: %s (%d)\n", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_7_0();
}

void set_dir_stats_handle_origin_cold_4(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_6_6(a3, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_31(&dword_21F566000, MEMORY[0x24BDACB70], v3, "%s:%d: %s failed to init set shadow key for dir-stats object on ino %llu: %s (%d)\n", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_7_0();
}

void set_dir_stats_handle_origin_cold_5(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_6_6(a3, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_31(&dword_21F566000, MEMORY[0x24BDACB70], v3, "%s:%d: %s failed to init extended fields for dir-stats object on ino %llu: %s (%d)\n", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_7_0();
}

void set_dir_stats_handle_origin_cold_6(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_5_4(a3, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_31(&dword_21F566000, MEMORY[0x24BDACB70], v3, "%s:%d: %s failed to init extended fields for dir-stats object on ino %llu: %s (%d)\n", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_7_0();
}

void unset_dir_stats_handle_origin_cold_1(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_5_4(a3, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_31(&dword_21F566000, MEMORY[0x24BDACB70], v3, "%s:%d: %s failed to unset SAF flag for ino %llu: %s (%d)\n", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_7_0();
}

void delta_from_dir_stats_cold_1(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_5_4(a3, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_21_2(&dword_21F566000, MEMORY[0x24BDACB70], v3, "%s:%d: %s dir-stats %llu maintains purgeable rsrc size but failed to get the xfield: %s (%d); size tracking may go out of sync\n",
    v4,
    v5,
    v6,
    v7,
    2u);
  OUTLINED_FUNCTION_7_0();
}

void delta_from_dir_stats_cold_2(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_5_4(a3, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_21_2(&dword_21F566000, MEMORY[0x24BDACB70], v3, "%s:%d: %s dir-stats %llu maintains purgeable size but failed to get the xfield: %s (%d); size tracking may go out of sync\n",
    v4,
    v5,
    v6,
    v7,
    2u);
  OUTLINED_FUNCTION_7_0();
}

void delta_from_dir_stats_cold_3(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_5_4(a3, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_21_2(&dword_21F566000, MEMORY[0x24BDACB70], v3, "%s:%d: %s dir-stats %llu maintains clone size but failed to get the xfield: %s (%d); size tracking may go out of sync\n",
    v4,
    v5,
    v6,
    v7,
    2u);
  OUTLINED_FUNCTION_7_0();
}

void dir_stats_move_regular_origin_cold_1(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_5_3(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_16_3();
  OUTLINED_FUNCTION_31(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s failed to init extended fields for dir-stats object on ino %llu: %s (%d); size tracking may go out of sync\n",
    v3,
    v4,
    v5,
    v6,
    2u);
  OUTLINED_FUNCTION_7_0();
}

void spaceman_metazone_init_cold_1()
{
  uint64_t v0;
  _WORD v1[10];
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  *(_DWORD *)v1 = 136315650;
  OUTLINED_FUNCTION_2_0();
  *(_DWORD *)&v1[7] = 72;
  v1[9] = 2080;
  v2 = v0;
  _os_log_debug_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%s:%d: %s Skipping metazone_init() as backing store is sparse\n", (uint8_t *)v1, 0x1Cu);
  OUTLINED_FUNCTION_4();
}

void spaceman_get_metazone_alloc_index_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_20(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s tried to get metazone alloc index for unknown type: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void spaceman_get_metazone_alloc_index_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s tried to get metazone alloc index for unknown type: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void spaceman_allocation_init_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_103();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to initialize data zone for allocations of size %llu, error %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_3();
}

void spaceman_datazone_init_cold_1(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 384) + 208;
  v4 = *a2;
  v5 = 136316418;
  v6 = "spaceman_datazone_init";
  v7 = 1024;
  v8 = 611;
  v9 = 2080;
  v10 = v3;
  v11 = 1024;
  v12 = 0;
  v13 = 2048;
  v14 = a3;
  v15 = 2048;
  v16 = v4;
  _os_log_debug_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%s:%d: %s allocation zone on dev %d for allocations of %llu blocks starting at paddr %llu\n", (uint8_t *)&v5, 0x36u);
  OUTLINED_FUNCTION_4_3();
}

void spaceman_datazone_init_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_26_2(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_103();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to initialize allocation zone for allocations of %llu blocks from disk: error %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_3();
}

void spaceman_initialize_allocation_zone_from_disk_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_20(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to update allocation zone boundaries: error %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void spaceman_initialize_allocation_zone_from_disk_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to update allocation zone boundaries: error %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void spaceman_evaluate_chunk_for_disabled_allocation_zones_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_20(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_8();
  OUTLINED_FUNCTION_26(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to assign chunk %llu to allocation zone %llu\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void spaceman_evaluate_chunk_for_disabled_allocation_zones_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4_8();
  OUTLINED_FUNCTION_26(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to assign chunk %llu to allocation zone %llu\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void spaceman_get_new_chunk_for_allocation_zone_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_26_2(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_103();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to update allocate zone %llu: error %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_3();
}

void spaceman_get_new_chunk_for_allocation_zone_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_26_2(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_103();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_80(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s error getting cib %d: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void spaceman_get_new_chunk_for_allocation_zone_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_26_2(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_103();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_80(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s error getting cab %d: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void spaceman_free_extent_cache_reset_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_68(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5_5();
  OUTLINED_FUNCTION_10(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s dev %d Error reinitializing %s free extent cache: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void spaceman_free_extent_cache_insert_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_10_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_80(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s dev %d Error %d, reinitializing\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void spaceman_free_extent_cache_insert_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_10_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_80(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s dev %d Failed to find successor node in length tree: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void spaceman_fxc_tree_node_recycle_smallest_if_full_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_80(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s dev %d Failed to find smallest extent in paddr tree: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void spaceman_fxc_tree_node_recycle_smallest_if_full_cold_2()
{
  __int16 v0;
  int v1;
  int v2;
  int v3[8];
  __int16 v4;
  int v5;
  __int16 v6;
  int v7;

  OUTLINED_FUNCTION_1_5(*MEMORY[0x24BDAC8D0]);
  v3[0] = 136316418;
  OUTLINED_FUNCTION_26_0();
  OUTLINED_FUNCTION_8_6();
  v4 = v0;
  v5 = v1;
  v6 = v0;
  v7 = v2;
  _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: %s dev %d Failed to find smallest extent %d in length tree: %d\n", (uint8_t *)v3, 0x2Eu);
  OUTLINED_FUNCTION_4_3();
}

void spaceman_fxc_tree_node_recycle_smallest_if_full_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_80(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s dev %d Failed to find next smallest extent in length tree: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void spaceman_fxc_update_length_cold_1()
{
  uint64_t v0;
  __int16 v1;
  int v2;
  _WORD v3[10];
  uint64_t v4;
  __int16 v5;
  int v6;

  OUTLINED_FUNCTION_1_5(*MEMORY[0x24BDAC8D0]);
  *(_DWORD *)v3 = 136315906;
  OUTLINED_FUNCTION_14();
  *(_DWORD *)&v3[7] = 1463;
  v3[9] = 2080;
  v4 = v0;
  v5 = v1;
  v6 = v2;
  _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: %s dev %d Failed to find length tree predecessor for node that wasn't the smallest\n", (uint8_t *)v3, 0x22u);
  OUTLINED_FUNCTION_4();
}

void spaceman_fxc_update_smallest_with_successor_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_80(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s dev %d Failed to find successor node from length tree while updating smallest: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void spaceman_free_extent_cache_remove_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_80(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s dev %d Error %d, reinitializing\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void spaceman_free_extent_cache_remove_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_80(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s dev %d Failed to update partially-covered node in length tree: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void spaceman_free_extent_cache_remove_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_80(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s dev %d Failed to get next extent: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void spaceman_free_extent_cache_remove_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_80(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s dev %d Failed to delete covered node from length tree: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void spaceman_free_extent_cache_search_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_68(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_26_0();
  OUTLINED_FUNCTION_5_5();
  OUTLINED_FUNCTION_10(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s dev %d Error searching %s free extent cache: %d; Reinitializing.\n",
    v1,
    v2,
    v3,
    v4,
    2u);
  OUTLINED_FUNCTION_4_3();
}

void spaceman_fxtp_add_child_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_26_0();
  OUTLINED_FUNCTION_8_6();
  OUTLINED_FUNCTION_10(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s dev %d %s tree: PATH TOO LONG: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void spaceman_ip_block_alloc_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unable to find free IP block or to free pending free IP blocks\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void spaceman_scan_free_blocks_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_29_1(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s trims dropped: %lld blocks %lld extents, avg %lld.%02lld \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_48();
}

void spaceman_scan_free_blocks_cold_2()
{
  __int16 v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;

  OUTLINED_FUNCTION_4_5(*MEMORY[0x24BDAC8D0]);
  v5 = 136317186;
  v6 = "spaceman_scan_free_blocks";
  v7 = 1024;
  v8 = 4122;
  v9 = 2080;
  OUTLINED_FUNCTION_65();
  v10 = v0;
  v11 = v1;
  v12 = v0;
  v13 = v2;
  v14 = v0;
  v15 = v3;
  v16 = v0;
  v17 = v4;
  _os_log_debug_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%s:%d: %s trim distribution 1:%lld 2+:%lld 4+:%lld 16+:%lld 64+:%lld 256+:%lld\n", (uint8_t *)&v5, 0x58u);
}

void spaceman_scan_free_blocks_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_67(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_23_4();
  OUTLINED_FUNCTION_29_1(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s %lld blocks free in %lld extents, avg %lld.%02lld\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_48();
}

void spaceman_scan_free_blocks_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_33_0();
  OUTLINED_FUNCTION_58(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s scan took %lld.%06lld s (no trims)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void spaceman_fq_tree_find_overlap_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s error searching spaceman free queue tree: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void spaceman_ip_block_index_cold_1(int a1, int __errnum)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  strerror(__errnum);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s failed to get next internal pool reverse mapping, error %s(%d)\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_48();
}

void spaceman_alloc_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_67(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_58(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s Space outside soft block-out range seems fragmented (requested %llu, but could alloc only %llu), disable soft block-out range\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void spaceman_alloc_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_33_0();
  OUTLINED_FUNCTION_58(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s Space outside soft block-out range seems fragmented (requested %llu, but could alloc only %llu), disable soft block-out range\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void spaceman_alloc_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_25_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s Found enough data to allocate outside the soft block-out range, re-enable soft block-out range\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void spaceman_alloc_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_25_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s Found enough data to allocate outside the soft block-out range, re-enable soft block-out range\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void spaceman_alloc_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_80(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to update chunk for alloc zone %d: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void spaceman_alloc_cold_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_67(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_103();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_80(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to update chunk for alloc zone %d: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void spaceman_alloc_cold_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_80(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to move roving pointer for dev %d error %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void spaceman_alloc_cold_8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_67(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_103();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_80(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to move roving pointer for dev %d error %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void spaceman_modify_bits_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_67(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_103();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to free internal pool block %lld: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_3();
}

void spaceman_modify_bits_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_67(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_103();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to create bitmap object %lld: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_3();
}

void spaceman_modify_bits_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to allocate block from internal pool: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

uint64_t spaceman_modify_bits_cold_4(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v10;

  OUTLINED_FUNCTION_103();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v4, "%s:%d: %s failed to allocate block from internal pool: %d\n", v5, v6, v7, v8, v10);
  return a3 & 1;
}

void spaceman_modify_bits_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_67(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_103();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to free internal pool block %lld: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_3();
}

void spaceman_modify_bits_cold_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to allocate block from internal pool: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void spaceman_free_fs_deduct_block_counts_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_26(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s spaceman fs reserve alloc count underflow: %lld (%lld)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void spaceman_fq_tree_insert_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s removal of replaced free extent failed: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void spaceman_unreserve_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_21_3();
  OUTLINED_FUNCTION_23_4();
  OUTLINED_FUNCTION_26(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s fs reserved space underflow: %lld (%lld)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void spaceman_unreserve_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_33_0();
  OUTLINED_FUNCTION_21_3();
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_26(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s fs reserved space underflow: %lld (%lld)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void spaceman_fs_bounds_clear_cold_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_32_0(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_18_3();
  OUTLINED_FUNCTION_92(&dword_21F566000, MEMORY[0x24BDACB70], v1, "%s:%d: %s file system %lld fs reserve alloc count %lld larger than global fs reserve alloc count %lld\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_87();
}

void spaceman_fs_bounds_clear_cold_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_32_0(a1, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_18_3();
  OUTLINED_FUNCTION_92(&dword_21F566000, MEMORY[0x24BDACB70], v1, "%s:%d: %s file system %lld fs reserve block count %lld larger than global fs reserve block count %lld\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_87();
}

void spaceman_ip_freed_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_26_2(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_103();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_26(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s attempt to free block(s) outside of internal pool: 0x%llx:0x%llx\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_3();
}

void btree_node_reap_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_24_0(a1, a2);
  OUTLINED_FUNCTION_18_4();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s obj_modify(fs %lld) failed: %d\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3_1();
}

void btree_node_reap_cold_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_24_0(a1, a2);
  OUTLINED_FUNCTION_18_4();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s obj_modify(fs %lld) failed: %d\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3_1();
}

void bt_insert_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_20(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s btree_node_key_update failed: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void bt_insert_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s btree_node_key_update failed: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void bt_insert_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_20(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s btree_node_key_update failed: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void bt_insert_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s btree_node_key_update failed: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void bt_insert_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_20(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s bt_shift_or_split failed with error: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void bt_insert_cold_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s bt_shift_or_split failed with error: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void bt_insert_cold_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_20(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s bt_shift_or_split failed with error: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void bt_insert_cold_8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s bt_shift_or_split failed with error: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void bt_insert_cold_9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_20(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s bt_shift_or_split failed with error: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void bt_insert_cold_10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s bt_shift_or_split failed with error: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void btree_node_entry_update_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_20(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unable allocate space that should be there: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void btree_node_entry_update_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unable allocate space that should be there: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void btree_node_entry_update_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_20(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unable allocate space that should be there: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void btree_node_entry_update_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unable allocate space that should be there: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void btree_node_entry_update_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_20(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unable to reclaim just-freed val space on error path: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void btree_node_entry_update_cold_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unable to reclaim just-freed val space on error path: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void btree_node_entry_update_cold_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_20(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unable to reclaim just-freed key space on error path: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void btree_node_entry_update_cold_8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unable to reclaim just-freed key space on error path: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void btree_node_insert_internal_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_20(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unable allocate space that should be there: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void btree_node_insert_internal_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unable allocate space that should be there: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void btree_node_insert_internal_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_20(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unable allocate space that should be there: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void btree_node_insert_internal_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unable allocate space that should be there: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void btree_node_child_id_update_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_20(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_26(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s invalid relative OID: %llu < root OID: %llu\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void btree_node_child_id_update_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_26(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s invalid relative OID: %llu < root OID: %llu\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void bt_shift_or_split_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_20(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_80(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s btree_node_key_update() failed (%d) while trying to revert changes due to error: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void bt_shift_or_split_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_80(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s btree_node_key_update() failed (%d) while trying to revert changes due to error: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void bt_shift_or_split_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_20(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_80(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s bt_move_entries() failed (%d) while trying to revert changes due to error: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void bt_shift_or_split_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_80(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s bt_move_entries() failed (%d) while trying to revert changes due to error: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void bt_shift_or_split_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_20(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_80(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s btree_node_insert() failed (%d) while trying to revert changes due to error: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void bt_shift_or_split_cold_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_80(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s btree_node_insert() failed (%d) while trying to revert changes due to error: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void bt_shift_or_split_cold_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_20(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_80(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s btree_node_key_update() failed (%d) while trying to revert changes due to error: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void bt_shift_or_split_cold_8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_80(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s btree_node_key_update() failed (%d) while trying to revert changes due to error: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void bt_shift_or_split_cold_9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_20(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_80(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s btree_node_key_update() failed (%d) while trying to revert changes due to error: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void bt_shift_or_split_cold_10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_80(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s btree_node_key_update() failed (%d) while trying to revert changes due to error: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void bt_shift_or_split_cold_11()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_20(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_80(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s bt_move_entries() failed (%d) while trying to revert changes due to error: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void bt_shift_or_split_cold_12()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_80(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s bt_move_entries() failed (%d) while trying to revert changes due to error: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void bt_shift_or_split_cold_13()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_20(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_80(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s bt_move_entries() failed (%d) while trying to revert changes due to error: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void bt_shift_or_split_cold_14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_80(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s bt_move_entries() failed (%d) while trying to revert changes due to error: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void bt_shift_or_split_cold_15()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_20(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_17_2();
  OUTLINED_FUNCTION_80(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s bt_move_entries %d failed: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void bt_shift_or_split_cold_16()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_17_2();
  OUTLINED_FUNCTION_80(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s bt_move_entries %d failed: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void bt_shift_or_split_cold_17()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_20(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s reverting on error: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void bt_shift_or_split_cold_18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s reverting on error: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void bt_shift_or_split_cold_19()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_20(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s btree_node_insert failed: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void bt_shift_or_split_cold_20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s btree_node_insert failed: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void bt_shift_or_split_cold_21()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_20(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to get newnode minkey: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void bt_shift_or_split_cold_22()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to get newnode minkey: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void bt_shift_or_split_cold_23()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_20(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_16_4();
  OUTLINED_FUNCTION_80(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s bt_move_entries %d failed: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void bt_shift_or_split_cold_24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_16_4();
  OUTLINED_FUNCTION_80(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s bt_move_entries %d failed: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void bt_shift_or_split_cold_25()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_20(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s btree_node_insert failed: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void bt_shift_or_split_cold_26()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s btree_node_insert failed: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void bt_shift_or_split_cold_27()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_20(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s btree_node_insert failed: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void bt_shift_or_split_cold_28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s btree_node_insert failed: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void bt_shift_or_split_cold_29()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_20(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_80(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s bt_move_entries %d failed: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void bt_shift_or_split_cold_30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_80(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s bt_move_entries %d failed: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void bt_shift_or_split_cold_31()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_20(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s btree_node_key_update failed: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void bt_shift_or_split_cold_32()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s btree_node_key_update failed: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void bt_shift_or_split_cold_33()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_20(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s btree_node_key_update failed: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void bt_shift_or_split_cold_34()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s btree_node_key_update failed: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void bt_shift_or_split_cold_35()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_20(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_80(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s bt_move_entries %d failed: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void bt_shift_or_split_cold_36()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_80(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s bt_move_entries %d failed: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void bt_shift_or_split_cold_37()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_20(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s btree_node_key_update failed: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void bt_shift_or_split_cold_38()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s btree_node_key_update failed: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void bt_shift_or_split_cold_39()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_20(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_80(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s bt_move_entries %d failed: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void bt_shift_or_split_cold_40()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_80(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s bt_move_entries %d failed: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void btree_node_insert_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_20(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_26(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s invalid relative OID: %llu < root OID: %llu\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void btree_node_insert_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_26(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s invalid relative OID: %llu < root OID: %llu\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void bt_remove_internal_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_28_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_24_0(v0, v1);
  OUTLINED_FUNCTION_30_0();
  OUTLINED_FUNCTION_13_2();
  OUTLINED_FUNCTION_10(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s minkey update traversal unexpectedly found the removed key in level 1 node; oid %llu subtype 0x%x level %d\n",
    v3,
    v4,
    v5,
    v6,
    2u);
  OUTLINED_FUNCTION_7_0();
}

void bt_remove_internal_cold_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_24_0(a1, a2);
  OUTLINED_FUNCTION_30_0();
  OUTLINED_FUNCTION_13_2();
  OUTLINED_FUNCTION_10(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s minkey update traversal unexpectedly found the removed key in level 1 node; oid %llu subtype 0x%x level %d\n",
    v3,
    v4,
    v5,
    v6,
    2u);
  OUTLINED_FUNCTION_7_0();
}

void bt_remove_internal_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_20(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s btree_node_key_update failed: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void bt_remove_internal_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s btree_node_key_update failed: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void bt_remove_internal_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_20(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s btree_node_key_update failed: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void bt_remove_internal_cold_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s btree_node_key_update failed: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void bt_merge_up_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_20(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s updating grandparent failed w/%d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void bt_merge_up_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s updating grandparent failed w/%d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void btree_iterate_nodes_cold_1(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_23_5(a1, a2, a3);
  OUTLINED_FUNCTION_14_3();
  OUTLINED_FUNCTION_10(&dword_21F566000, MEMORY[0x24BDACB70], v3, "%s:%d: %s level %d node 0x%llx index %d: more levels than expected\n", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_7_0();
}

void btree_iterate_nodes_cold_2(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_23_5(a1, a2, a3);
  OUTLINED_FUNCTION_14_3();
  OUTLINED_FUNCTION_10(&dword_21F566000, MEMORY[0x24BDACB70], v3, "%s:%d: %s level %d node 0x%llx index %d: more levels than expected\n", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_7_0();
}

void btree_delete_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_28_1(*MEMORY[0x24BDAC8D0]);
  obj_oid(v0);
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_15_4();
  OUTLINED_FUNCTION_10(&dword_21F566000, MEMORY[0x24BDACB70], v1, "%s:%d: %s error adding btree 0x%llx type 0x%x to reap list: %d\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_7_0();
}

void btree_delete_cold_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_24_0(a1, a2);
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_15_4();
  OUTLINED_FUNCTION_10(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s error adding btree 0x%llx type 0x%x to reap list: %d\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_7_0();
}

void bt_update_last_leaf_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_20(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to update rightmost leaf field: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void bt_update_last_leaf_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to update rightmost leaf field: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void bt_merge_nodes_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_20(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to move all entries: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void bt_merge_nodes_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to move all entries: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void bt_merge_nodes_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_20(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s btree_node_key_update failed: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void bt_merge_nodes_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s btree_node_key_update failed: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void userfs_fd_is_apfs_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: couldn't allocate memory for superblock of size %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void userfs_fd_is_apfs_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: superblock does not look reasonable: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void userfs_fd_is_apfs_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: couldn't read superblock of size %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void userfs_fd_is_apfs_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: failed to initialize device: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void userfs_apfs_get_next_vol_cold_1(_QWORD *a1, uint64_t a2, int a3)
{
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(*a1 + 8 * a2 + 184);
  v4 = 136315906;
  v5 = "userfs_apfs_get_next_vol";
  v6 = 1024;
  v7 = 103;
  v8 = 2048;
  v9 = v3;
  v10 = 1024;
  v11 = a3;
  _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: failed to get fs oid %lld: %d\n", (uint8_t *)&v4, 0x22u);
}

void userfs_apfs_mount_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: userfs_apfs_load_nodes failed, err: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void userfs_apfs_mount_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: No entry for root dir!\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void userfs_apfs_mount_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: FAILED TO LOAD THE ROOT INODE!\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void userfs_apfs_mount_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: No entry for private metadata dir!\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void userfs_apfs_mount_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: FAILED TO LOAD THE PRIVATE DIR INODE!\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void userfs_apfs_mount_cold_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: failed to revert snapshot, err: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void userfs_apfs_mount_cold_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: apfs_mount failed, err: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void userfs_nx_mount_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: nx_mount failed: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void userfs_nx_mount_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: device initialization failed: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void nx_get_evict_mapping_tree_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_25_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s found mapping tree with old subtype\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_reaper_checkpoint_traverse_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_67(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_103();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to get reap list object oid %lld: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_3();
}

void nx_reaper_checkpoint_traverse_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to get object oid %lld: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void nx_reaper_obj_get_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_26_2(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_103();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unable to get object 0x%llx: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_3();
}

void nx_reaper_obj_get_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_26_2(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_103();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s unable to get fs object 0x%llx: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_3();
}

void nx_reaper_add_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_26_2(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_103();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_80(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s object type 0x%x not reapable: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void nx_reaper_add_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s reap list object free list erroneously empty?\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_reaper_add_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s reap list object free list erroneously empty?\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_reaper_add_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to create reap list: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_reaper_add_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to get reap list tail: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_reaper_add_sub_object_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_26_2(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_103();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_80(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s object type 0x%x not reapable: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void nx_reaper_add_sub_object_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s reap list object free list erroneously empty?\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_reaper_add_sub_object_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s reap list object free list erroneously empty?\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_reaper_add_sub_object_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to get reap list head: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_reaper_add_sub_object_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to create reap list: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_reaper_add_sub_object_cold_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to get reap list head: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_reaper_cold_1()
{
  _DWORD v0[6];
  uint64_t v1;

  v1 = *MEMORY[0x24BDAC8D0];
  v0[0] = 136315394;
  OUTLINED_FUNCTION_1();
  *(_DWORD *)((char *)&v0[3] + 2) = 1792;
  _os_log_debug_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%s:%d: reaper thread is exiting, returning EBUSY\n", (uint8_t *)v0, 0x12u);
}

void nx_reaper_wait_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_26_2(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_103();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_26(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s invalid reap_id (%llu), must be smaller than nr_next_reap_id (%llu)\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_3();
}

void nx_metadata_range_add_cold_1(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_33_1(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s failed to get next extent in metadata fragmented extent list tree, error %s(%d)\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3_1();
}

void nx_metadata_range_optimize_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s error removing coalesced extent from metadata ranges tree: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_metadata_range_optimize_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s error updating metadata ranges tree: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_unblock_physical_range_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s tx_leave failed with error: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_unblock_physical_range_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s spaceman_unset_block_out_range failed with error %u\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_unblock_physical_range_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to delete mapping, error: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_unblock_physical_range_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to get mapping tree, error: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void nx_reaper_next_record_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to get reap list head: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void apfs_udirop_rmdir_internal_cold_1(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a2 + 8);
  v5 = 136316162;
  v6 = "apfs_udirop_rmdir_internal";
  v7 = 1024;
  v8 = 119;
  v9 = 2048;
  v10 = v3;
  v11 = 2048;
  v12 = v4;
  v13 = 1024;
  v14 = a3;
  _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: Failed to move ino %lld to purgatory from dir %lld : %d\n", (uint8_t *)&v5, 0x2Cu);
}

void apfs_udirop_rmdir_internal_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: remove_dir_entry failed, err %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void apfs_udirop_rmdir_internal_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: failed to enter delete txn for removal of directory, err %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void apfs_udirop_rmdir_internal_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: userfs_load_inode returned %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void apfs_udirop_rmdir_internal_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: userfs_internal_lookup returned %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void apfs_udirop_mkdir_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: apfs_udirop_rmdir_internal failed with error %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void apfs_udirop_mkdir_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: userfs_set_ufa_common failed with error %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void apfs_udirop_scanids_cold_1()
{
  uint64_t v0;
  _WORD v1[10];
  uint64_t v2;
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  *(_DWORD *)v1 = 136315906;
  OUTLINED_FUNCTION_1();
  *(_DWORD *)&v1[7] = 620;
  v1[9] = 2048;
  v2 = v0;
  v3 = 2048;
  v4 = 0x3FFFLL;
  _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: File-system does not support some of the requested attributes 0x%llx, supported attributes 0x%llu\n", (uint8_t *)v1, 0x26u);
}

void apfs_ufileop_setattr_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: userfs_set_ufa_common failed: error %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void apfs_ufileop_lookup_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_49(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: Inode %llu not a directory. Aborting.\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void apfs_ufileop_symlink_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: userfs_internal_remove failed with error %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void apfs_ufileop_symlink_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: userfs_set_ufa_common failed with error %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void apfs_ufileop_link_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_99(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_14_4();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: failed to create sibling link entry on child of %llu pointing to %llu, error %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void apfs_ufileop_link_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_67(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: failed to create sibling link for ino %llu, error %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void apfs_ufileop_link_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_67(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: failed to set the sibling id on ino %llu\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void apfs_ufileop_link_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_67(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: failed to look up drec for inode %llu, error %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void apfs_ufileop_read_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_49(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: Read: danger! read on a dead inode (%llu)!\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void apfs_ufileop_read_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_49(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_26(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: Unaligned read starts at non zero offset %llu for obj-id %lld/%lld\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void apfs_ufileop_read_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_49(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: Failed to allocate read block buffer while attempting to read inode (%llu)!\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void apfs_ufileop_write_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_49(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: No memory for unaligned write buffer (for inode %llu)!\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void apfs_ufileop_write_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_49(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: failed to create dstream (ino %llu), error %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void apfs_ufileop_write_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: failed to remove prev_fsize: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void apfs_ufileop_write_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_67(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_20_2();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: failed to write %llu blocks to disk at pbn %llu, err %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void apfs_ufileop_write_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: failed to read-modify during write: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void apfs_ufileop_write_cold_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: write blockmap failed: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void apfs_ufileop_write_cold_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: alloc_space_for_write failed with error %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void apfs_ufileop_write_cold_8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: clone_extents_if_needed failed with error %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void apfs_ufileop_write_cold_9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_49(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: Cannot write to dead inode (%llu)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void apfs_ufileop_getxattr_data_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: unknown style of xattr (flags 0x%x) on xattr %s\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void apfs_ufileop_setxattr_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_67(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: ino %llu, xattr '%s', xattr tmp inode deallocation failed, err %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void apfs_ufileop_setxattr_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_67(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: tree_lookup() under ino %llu, xattr '%s' failed, err %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void apfs_ufileop_setxattr_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_67(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: ino %llu, xattr '%s', removing the old xattr failed with %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void apfs_ufileop_setxattr_cold_4()
{
  int v0[14];

  OUTLINED_FUNCTION_67(*MEMORY[0x24BDAC8D0]);
  v0[0] = 136316162;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_20_2();
  _os_log_debug_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%s:%d: failed to enter transaction sized %llu on ino %llu, err %d\n", (uint8_t *)v0, 0x2Cu);
  OUTLINED_FUNCTION_4_3();
}

void apfs_ufileop_setxattr_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_67(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_22_4();
  OUTLINED_FUNCTION_15(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: couldn't get dstream from tmp inode %llu, owner %llu\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void apfs_ufileop_setxattr_cold_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_49(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: ino %llu, xattr '%s', couldn't look up the fsroot tree, err %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void userfs_write_xattr_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_49(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_26(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: attempting to write past (%zu bytes) the allocated size (%llu bytes) of a temporary xattr inode: %llu\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void userfs_write_xattr_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_49(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_15(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: xattr-dstream-obj-id %lld has a hole at offset %lld\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void userfs_write_xattr_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_106();
  OUTLINED_FUNCTION_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: mapped %llu blocks for writing the partial last block, expencted 1 block.\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void userfs_write_xattr_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_23_6();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: write offset (%llu bytes) not aligned to file-system block size (%u bytes)", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void userfs_write_xattr_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_49(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: failed to allocate write block buffer while attempting to write xattr temporary inode (%llu)!\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void userfs_free_old_xattr_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_49(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_14_4();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: removing xattr extents under ino %llu, id %llu, failed with %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void apfs_ufileop_create_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: userfs_internal_remove failed with error %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void apfs_ufileop_create_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: userfs_set_ufa_common failed with error %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void apfs_ufileop_rename_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_49(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: failed to delete target inode (%llu) that was renamed-over: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void apfs_ufileop_rename_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_106();
  OUTLINED_FUNCTION_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: there is no drec for ino %lld\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void apfs_ufileop_rename_cold_3(int a1, int __errnum)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  strerror(__errnum);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_27_2();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: could not re-set dir-stats on ino %llu after rename failure: %s (%d); space tracking may go out of sync\n",
    v3,
    v4,
    v5,
    v6,
    2u);
}

void apfs_ufileop_rename_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_28_2(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_26_0();
  OUTLINED_FUNCTION_16_5();
  OUTLINED_FUNCTION_31(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: failed to RE-insert orig from_drec %lld:%s ino %lld error %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void apfs_ufileop_rename_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_28_2(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_26_0();
  OUTLINED_FUNCTION_16_5();
  OUTLINED_FUNCTION_31(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: failed to insert updated to_drec %lld:%s ino %lld error %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void apfs_ufileop_rename_cold_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_99(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_22_4();
  OUTLINED_FUNCTION_15(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: failed to set the drec SIBLING id %lld for ino %lld\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void apfs_ufileop_rename_cold_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_49(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_14_4();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: Failed to move ino %lld to purgatory from dir %lld : %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void apfs_ufileop_rename_cold_8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_49(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: failed to update ino %lld error %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void apfs_ufileop_rename_cold_9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_49(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: *** to ino %lld has nlink %d!\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void apfs_ufileop_rename_cold_10(int a1, int a2, int __errnum)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  strerror(__errnum);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_27_2();
  OUTLINED_FUNCTION_31(&dword_21F566000, MEMORY[0x24BDACB70], v3, "%s:%d: could not set dir-stats on ino %llu before it is moved to dir %llu: %s (%d); space tracking may go out of sync\n",
    v4,
    v5,
    v6,
    v7,
    2u);
}

void apfs_ufileop_rename_cold_11()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_99(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_26_0();
  OUTLINED_FUNCTION_31(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: *#*#*#* from_ino %lld has nlink %d but no sibling link on the drec %lld:%s\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void apfs_ufileop_rename_cold_12()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: userfs_load_inode returned %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void apfs_ufileop_rename_cold_13()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_106();
  OUTLINED_FUNCTION_15(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: the source inode for rename has been deleted and does not match the looked up inode, source ino %llu, looked up ino %llu\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void apfs_ufileop_rename_cold_14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: userfs_load_inode returned %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void apfs_ufileop_rename_cold_15()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: userfs_internal_lookup returned %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void apfs_ufileop_stream_lookup_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: fs_get_xattr_dstream(): error %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void apfs_ufileop_stream_lookup_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_67(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: fs_get_xattr(%lld, %s): error %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void apfs_ufileop_stream_read_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: fs_calloc of %d failed\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void apfs_ufileop_stream_read_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_23_6();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: dev_read_data of %lu blocks failed: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void apfs_ufileop_stream_read_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: lookup_file_extent failed: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_3_0();
}

void set_ino_purgeable_state_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_23_7();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s Volume has unsupported purgeable record type: %u\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void set_ino_purgeable_state_cold_2()
{
  __int16 v0;
  uint64_t v1;
  int v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136316418;
  OUTLINED_FUNCTION_26_0();
  OUTLINED_FUNCTION_18();
  v3 = v0;
  v4 = v1;
  _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: %s did not find purgeable record for ino %lld (parent id %lld) (fsize %lld)\n", (uint8_t *)v2, 0x3Au);
}

void set_ino_purgeable_state_cold_3(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_6_6(a3, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_31(&dword_21F566000, MEMORY[0x24BDACB70], v3, "%s:%d: %s Failed to mark the dir-stats record for ino %llu as purgeable: error %d (%s)\n", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_7_0();
}

void set_ino_purgeable_state_cold_4(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_6_6(a3, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_31(&dword_21F566000, MEMORY[0x24BDACB70], v3, "%s:%d: %s Failed to set purgeable start time for ino %lld: error %d (%s)\n", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_7_0();
}

void set_ino_purgeable_state_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_27(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to set the dir-gen-count xf field on the purgeable rec for ino %lld : err %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_3();
}

void set_ino_purgeable_state_cold_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_43(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_15(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s ino %llu is compressed and this volume does not support compressed purgeable files.\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void set_ino_purgeable_state_cold_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_43(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_15(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s The directory hierarchy rooted at ino %llu was modified - please retry.\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void child_size_calculator_cb_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_25_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_26_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_26(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s directory has an illegal hardlinked child (dir: %lld ; child ino %lld)\n",
    v1,
    v2,
    v3,
    v4,
    2u);
  OUTLINED_FUNCTION_4_3();
}

void child_size_calculator_cb_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_25_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_26_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_26(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s directory has an illegal sub-directory (dir: %lld ; sub-dir ino %lld)\n",
    v1,
    v2,
    v3,
    v4,
    2u);
  OUTLINED_FUNCTION_4_3();
}

void child_size_calculator_cb_cold_3()
{
  int v0[10];

  OUTLINED_FUNCTION_43(*MEMORY[0x24BDAC8D0]);
  v0[0] = 136315906;
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_5_1();
  _os_log_debug_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%s:%d: %s directory sizing aborted (dir: %lld)\n", (uint8_t *)v0, 0x26u);
  OUTLINED_FUNCTION_4();
}

void insert_purgeable_record_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_43(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_15(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s Cannot insert purgeable record with zero atime (ino %llu).\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void insert_purgeable_record_cold_2(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_14_0(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s Failed to insert purgeable record (drec): %d (%s)\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3_1();
}

void insert_purgeable_record_cold_3(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_14_0(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s Failed to create purgeable record (drec): %d (%s)\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3_1();
}

void insert_purgeable_record_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_15(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s Purgeable start time (%llu) is unsupported on purgeable drecs.\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void insert_purgeable_record_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s Failed to set purgeable drec's dir gen-count: error %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void insert_purgeable_record_cold_6(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_14_0(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s Failed to insert purgeable record (record): %d (%s)\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3_1();
}

void remove_purgeable_record_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_43(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_15(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s Cannot remove purgeable record with zero atime (ino %llu).\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void remove_purgeable_record_cold_2(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_14_0(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s Failed to remove purgeable record (drec): %d (%s)\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3_1();
}

void remove_purgeable_record_cold_3(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_14_0(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s Failed to create purgeable record (drec) for removal: %d (%s)\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3_1();
}

void remove_purgeable_record_cold_4(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_14_0(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s Failed to remove purgeable record (record): %d (%s)\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3_1();
}

void lookup_and_remove_purgeable_record_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s Failed to lookup purgeable record for removal (ino %llu): error %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_3();
}

void lookup_and_remove_purgeable_record_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s Failed to remove purgeable record (ino %llu): error %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_3();
}

void merge_ino_purgeable_flags_cold_1(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_6_6(a3, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_31(&dword_21F566000, MEMORY[0x24BDACB70], v3, "%s:%d: %s Failed to update purgeable record (drec) time/flags (ino %llu): %d (%s)\n", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_7_0();
}

void merge_ino_purgeable_flags_cold_2(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_6_6(a3, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_31(&dword_21F566000, MEMORY[0x24BDACB70], v3, "%s:%d: %s Failed to create purgeable record (drec) for time/flags modification (ino %llu): %d (%s)\n", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_7_0();
}

void merge_ino_purgeable_flags_cold_3(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_6_6(a3, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_31(&dword_21F566000, MEMORY[0x24BDACB70], v3, "%s:%d: %s Failed to lookup purgeable record (record) for time/flags modification (ino %llu): %d (%s)\n", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_7_0();
}

void merge_ino_purgeable_flags_cold_4(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_6_6(a3, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_31(&dword_21F566000, MEMORY[0x24BDACB70], v3, "%s:%d: %s Failed to insert purgeable record (record) for time/flags modification (ino %llu): %d (%s)\n", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_7_0();
}

void merge_ino_purgeable_flags_cold_5()
{
  uint8_t v0[56];

  OUTLINED_FUNCTION_27(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_2();
  _os_log_debug_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%s:%d: %s Failed to remove existing purgeable record (ino %llu): %d\n", v0, 0x2Cu);
  OUTLINED_FUNCTION_4_3();
}

void merge_ino_purgeable_flags_cold_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s Failed to find purgeable record (ino %llu) for flags merging: %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_3();
}

void lookup_purgeable_drec_as_record_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_27(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s Failed to lookup purgeable drec (id %llu): error %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_3();
}

void lookup_purgeable_drec_as_record_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s Failed to set purgeable rec's dir gen-count: error %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void lookup_purgeable_drec_as_record_cold_3(int a1, int __errnum)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  strerror(__errnum);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_31(&dword_21F566000, MEMORY[0x24BDACB70], v2, "%s:%d: %s Failed to create purgeable record (drec) for lookup (ino %llu): %d (%s)\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_7_0();
}

void lookup_purgeable_drec_as_record_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_27(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_23_7();
  OUTLINED_FUNCTION_26(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s Failed to find host inode (id %llu) for purgeable drec lookup, falling back to ino %llu\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_3();
}

void _remove_purgeable_record_cb_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s Failed to get file ID from purgeable record key/val: error %d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void _remove_purgeable_record_cb_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s Unknown purgeable record type (%hhu)\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void _remove_purgeable_record_cb_cold_3()
{
  __int16 v0;
  int v1;
  int v2;
  const char *v3;
  __int16 v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = 136316162;
  v3 = "_remove_purgeable_record_cb";
  v4 = 1024;
  OUTLINED_FUNCTION_1_1();
  v5 = v0;
  v6 = v1;
  _os_log_error_impl(&dword_21F566000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: %s Invalid purgeable record type %u found on volume expecting type %u\n", (uint8_t *)&v2, 0x28u);
  OUTLINED_FUNCTION_4();
}

void tx_checkpoint_write_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_12_2(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to write checkpoint data block %lld: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void tx_checkpoint_write_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_80(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s error getting next checkpoint data block address %d: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void tx_checkpoint_write_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_80(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s error getting next checkpoint map block address %d: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void tx_checkpoint_write_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_12_2(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to write checkpoint map block %lld: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void tx_unmount_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s tx_finish() failed, %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void tx_unmount_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s Final sync/barrier failed: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void tx_unmount_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to write superblock to fusion tier2 device block 0: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void tx_unmount_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s failed to write superblock to block 0: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void tx_unmount_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s First sync/barrier failed: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void tx_flush_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6_7(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s xid %lld second sync/barrier failed: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void tx_flush_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6_7(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s xid %lld failed to write superblock to fusion tier2 device block 0: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void tx_flush_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6_7(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s xid %lld failed to write block 0 superblock: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void tx_flush_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6_7(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s xid %lld sync/barrier failed: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void tx_flush_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s xid %lld error flushing objects from the cache: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

void tx_flush_cold_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_1_2(&dword_21F566000, MEMORY[0x24BDACB70], v0, "%s:%d: %s xid %lld error preparing to flush object cache: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_3();
}

CCCryptorStatus CCCryptorCreateWithMode(CCOperation op, CCMode mode, CCAlgorithm alg, CCPadding padding, const void *iv, const void *key, size_t keyLength, const void *tweak, size_t tweakLength, int numRounds, CCModeOptions options, CCCryptorRef *cryptorRef)
{
  return MEMORY[0x24BDAC118](*(_QWORD *)&op, *(_QWORD *)&mode, *(_QWORD *)&alg, *(_QWORD *)&padding, iv, key, keyLength, tweak);
}

uint64_t CCCryptorDecryptDataBlock()
{
  return MEMORY[0x24BDAC120]();
}

uint64_t CCCryptorEncryptDataBlock()
{
  return MEMORY[0x24BDAC128]();
}

CCCryptorStatus CCCryptorRelease(CCCryptorRef cryptorRef)
{
  return MEMORY[0x24BDAC188](cryptorRef);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

CFMutableDictionaryRef IOBSDNameMatching(mach_port_t mainPort, uint32_t options, const char *bsdName)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD7EB0](*(_QWORD *)&mainPort, *(_QWORD *)&options, bsdName);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x24BDD8668](*(_QWORD *)&iterator);
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return MEMORY[0x24BDD86B8](*(_QWORD *)&object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x24BDD8700](*(_QWORD *)&object);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return MEMORY[0x24BDD88F0](*(_QWORD *)&entry, plane, parent);
}

kern_return_t IORegistryEntryGetParentIterator(io_registry_entry_t entry, const io_name_t plane, io_iterator_t *iterator)
{
  return MEMORY[0x24BDD88F8](*(_QWORD *)&entry, plane, iterator);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD8928](*(_QWORD *)&entry, plane, key, allocator, *(_QWORD *)&options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x24BDAC848]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x24BDAC910]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

int aio_error(const aiocb *aiocbp)
{
  return MEMORY[0x24BDAD130](aiocbp);
}

int aio_read(aiocb *aiocbp)
{
  return MEMORY[0x24BDAD138](aiocbp);
}

ssize_t aio_return(aiocb *aiocbp)
{
  return MEMORY[0x24BDAD140](aiocbp);
}

int aio_suspend(const aiocb *const aiocblist[], int nent, const timespec *timeoutp)
{
  return MEMORY[0x24BDAD148](aiocblist, *(_QWORD *)&nent, timeoutp);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x24BDAD328](__count, __size);
}

uint64_t cc_clear()
{
  return MEMORY[0x24BDAD348]();
}

uint64_t ccaes_cbc_decrypt_mode()
{
  return MEMORY[0x24BDAD358]();
}

uint64_t ccaes_cbc_encrypt_mode()
{
  return MEMORY[0x24BDAD360]();
}

uint64_t cccbc_clear_iv()
{
  return MEMORY[0x24BDAD398]();
}

uint64_t cccbc_init()
{
  return MEMORY[0x24BDAD3A0]();
}

uint64_t cccbc_update()
{
  return MEMORY[0x24BDAD3B8]();
}

uint64_t ccder_blob_decode_len()
{
  return MEMORY[0x24BDAD408]();
}

uint64_t ccder_blob_decode_range()
{
  return MEMORY[0x24BDAD418]();
}

uint64_t ccder_blob_decode_tag()
{
  return MEMORY[0x24BDAD428]();
}

uint64_t ccder_blob_decode_tl()
{
  return MEMORY[0x24BDAD430]();
}

uint64_t ccder_blob_encode_implicit_raw_octet_string()
{
  return MEMORY[0x24BDAD450]();
}

uint64_t ccder_blob_encode_implicit_uint64()
{
  return MEMORY[0x24BDAD458]();
}

uint64_t ccder_blob_encode_tl()
{
  return MEMORY[0x24BDAD460]();
}

uint64_t ccder_sizeof()
{
  return MEMORY[0x24BDAD4E0]();
}

uint64_t ccder_sizeof_implicit_uint64()
{
  return MEMORY[0x24BDAD4F0]();
}

uint64_t ccder_sizeof_raw_octet_string()
{
  return MEMORY[0x24BDAD510]();
}

uint64_t ccdigest_init()
{
  return MEMORY[0x24BDAD540]();
}

uint64_t ccdigest_update()
{
  return MEMORY[0x24BDAD548]();
}

uint64_t cchkdf()
{
  return MEMORY[0x24BDAD690]();
}

uint64_t cchmac()
{
  return MEMORY[0x24BDAD6A8]();
}

uint64_t ccn_read_uint()
{
  return MEMORY[0x24BDAD720]();
}

uint64_t ccpbkdf2_hmac()
{
  return MEMORY[0x24BDAD750]();
}

uint64_t ccrng()
{
  return MEMORY[0x24BDAD758]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x24BDAD828]();
}

int clock_gettime(clockid_t __clock_id, timespec *__tp)
{
  return MEMORY[0x24BDAD9B8](*(_QWORD *)&__clock_id, __tp);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x24BDAE2E8](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint64_t freemntopts()
{
  return MEMORY[0x24BEDE4F0]();
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x24BDAE508](*(_QWORD *)&a1, a2);
}

int fstatfs(int a1, statfs *a2)
{
  return MEMORY[0x24BDAE518](*(_QWORD *)&a1, a2);
}

int fsync(int a1)
{
  return MEMORY[0x24BDAE528](*(_QWORD *)&a1);
}

uint64_t getmntoptnum()
{
  return MEMORY[0x24BEDE500]();
}

uint64_t getmntopts()
{
  return MEMORY[0x24BEDE508]();
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x24BDAE8C8](*(_QWORD *)&a1, a2);
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x24BDAEB48]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
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

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x24BDAEEB0](__b, __pattern16, __len);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x24BDAEEC8](__s, __smax, *(_QWORD *)&__c, __n);
}

int nanosleep(const timespec *__rqtp, timespec *__rmtp)
{
  return MEMORY[0x24BDAF010](__rqtp, __rmtp);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void panic(const char *a1, ...)
{
  MEMORY[0x24BDAF580](a1);
}

int posix_spawn(pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return MEMORY[0x24BDAF600](a1, a2, a3, a4, __argv, __envp);
}

int posix_spawn_file_actions_addinherit_np(posix_spawn_file_actions_t *a1, int a2)
{
  return MEMORY[0x24BDAF620](a1, *(_QWORD *)&a2);
}

int posix_spawn_file_actions_destroy(posix_spawn_file_actions_t *a1)
{
  return MEMORY[0x24BDAF630](a1);
}

int posix_spawn_file_actions_init(posix_spawn_file_actions_t *a1)
{
  return MEMORY[0x24BDAF638](a1);
}

int posix_spawnattr_destroy(posix_spawnattr_t *a1)
{
  return MEMORY[0x24BDAF640](a1);
}

int posix_spawnattr_init(posix_spawnattr_t *a1)
{
  return MEMORY[0x24BDAF650](a1);
}

int posix_spawnattr_setflags(posix_spawnattr_t *a1, __int16 a2)
{
  return MEMORY[0x24BDAF660](a1, a2);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x24BDAF698](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x24BDAF7C8](a1);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x24BDAF7D0](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x24BDAF7D8](a1, a2);
}

int pthread_cond_timedwait(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return MEMORY[0x24BDAF7F0](a1, a2, a3);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x24BDAF800](a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8C0](a1);
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

int pthread_rwlock_destroy(pthread_rwlock_t *a1)
{
  return MEMORY[0x24BDAF930](a1);
}

int pthread_rwlock_init(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2)
{
  return MEMORY[0x24BDAF938](a1, a2);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x24BDAF940](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x24BDAF958](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x24BDAF960](a1);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x24BDAFA00](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  MEMORY[0x24BDAFA18](__base, __nel, __width, __compar);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x24BDAFE38](*(_QWORD *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAFEA8](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x24BDAFED0](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x24BDAFEE8](__s, *(_QWORD *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x24BDAFF10](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x24BDAFF38](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x24BDAFF70](__dst, __src, __n);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x24BDAFF78](__s1, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x24BDAFF80](__s1, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x24BDAFFA8](__s, *(_QWORD *)&__c);
}

char *__cdecl strsignal(int __sig)
{
  return (char *)MEMORY[0x24BDAFFB8](*(_QWORD *)&__sig);
}

char *__cdecl strtok_r(char *__str, const char *__sep, char **__lasts)
{
  return (char *)MEMORY[0x24BDAFFF8](__str, __sep, __lasts);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0030](__str, __endptr, *(_QWORD *)&__base);
}

void uuid_clear(uuid_t uu)
{
  MEMORY[0x24BDB0300](uu);
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x24BDB0308](uu1, uu2);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
  MEMORY[0x24BDB0310](dst, src);
}

void uuid_generate(uuid_t out)
{
  MEMORY[0x24BDB0318](out);
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x24BDB0328](uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x24BDB0338](uu, out);
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return MEMORY[0x24BDB0478](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

