uint64_t __libunwind_Registers_arm64_jumpto(uint64_t a1)
{
  return *(_QWORD *)a1;
}

int unw_getcontext(unw_context_t *a1)
{
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
  uint64_t v64;

  a1->data[0] = (uint64_t)a1;
  a1->data[1] = v1;
  a1->data[2] = v2;
  a1->data[3] = v3;
  a1->data[4] = v4;
  a1->data[5] = v5;
  a1->data[6] = v6;
  a1->data[7] = v7;
  a1->data[8] = v8;
  a1->data[9] = v9;
  a1->data[10] = v10;
  a1->data[11] = v11;
  a1->data[12] = v12;
  a1->data[13] = v13;
  a1->data[14] = v14;
  a1->data[15] = v15;
  a1->data[16] = v16;
  a1->data[17] = v17;
  a1->data[18] = v18;
  a1->data[19] = v19;
  a1->data[20] = v20;
  a1->data[21] = v21;
  a1->data[22] = v22;
  a1->data[23] = v23;
  a1->data[24] = v24;
  a1->data[25] = v25;
  a1->data[26] = v26;
  a1->data[27] = v27;
  a1->data[28] = v28;
  a1->data[29] = v29;
  a1->data[30] = v30;
  a1->data[31] = (uint64_t)&v64;
  a1->data[32] = v30;
  a1->data[34] = v31;
  a1->data[35] = v32;
  a1->data[36] = v33;
  a1->data[37] = v34;
  a1->data[38] = v35;
  a1->data[39] = v36;
  a1->data[40] = v37;
  a1->data[41] = v38;
  a1->data[42] = v39;
  a1->data[43] = v40;
  a1->data[44] = v41;
  a1->data[45] = v42;
  a1->data[46] = v43;
  a1->data[47] = v44;
  a1->data[48] = v45;
  a1->data[49] = v46;
  a1->data[50] = v47;
  a1->data[51] = v48;
  a1->data[52] = v49;
  a1->data[53] = v50;
  a1->data[54] = v51;
  a1->data[55] = v52;
  a1->data[56] = v53;
  a1->data[57] = v54;
  a1->data[58] = v55;
  a1->data[59] = v56;
  a1->data[60] = v57;
  a1->data[61] = v58;
  a1->data[62] = v59;
  a1->data[63] = v60;
  a1->data[64] = v61;
  a1->data[65] = v62;
  return 0;
}

int unw_init_local(unw_cursor_t *a1, unw_context_t *a2)
{
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
  __int128 v15;

  a1->data[0] = (uint64_t)off_1EA9525E8;
  a1->data[1] = (uint64_t)&libunwind::LocalAddressSpace::sThisAddressSpace;
  memcpy(&a1->data[2], a2, 0x110uLL);
  v4 = *(_OWORD *)&a2->data[40];
  v6 = *(_OWORD *)&a2->data[34];
  v5 = *(_OWORD *)&a2->data[36];
  *(_OWORD *)&a1->data[40] = *(_OWORD *)&a2->data[38];
  *(_OWORD *)&a1->data[42] = v4;
  *(_OWORD *)&a1->data[36] = v6;
  *(_OWORD *)&a1->data[38] = v5;
  v7 = *(_OWORD *)&a2->data[48];
  v9 = *(_OWORD *)&a2->data[42];
  v8 = *(_OWORD *)&a2->data[44];
  *(_OWORD *)&a1->data[48] = *(_OWORD *)&a2->data[46];
  *(_OWORD *)&a1->data[50] = v7;
  *(_OWORD *)&a1->data[44] = v9;
  *(_OWORD *)&a1->data[46] = v8;
  v10 = *(_OWORD *)&a2->data[56];
  v12 = *(_OWORD *)&a2->data[50];
  v11 = *(_OWORD *)&a2->data[52];
  *(_OWORD *)&a1->data[56] = *(_OWORD *)&a2->data[54];
  *(_OWORD *)&a1->data[58] = v10;
  *(_OWORD *)&a1->data[52] = v12;
  *(_OWORD *)&a1->data[54] = v11;
  v13 = *(_OWORD *)&a2->data[64];
  v15 = *(_OWORD *)&a2->data[58];
  v14 = *(_OWORD *)&a2->data[60];
  *(_OWORD *)&a1->data[64] = *(_OWORD *)&a2->data[62];
  *(_OWORD *)&a1->data[66] = v13;
  *(_OWORD *)&a1->data[60] = v15;
  *(_OWORD *)&a1->data[62] = v14;
  *(_OWORD *)((char *)&a1->data[75] + 2) = 0u;
  *(_OWORD *)&a1->data[72] = 0u;
  *(_OWORD *)&a1->data[74] = 0u;
  *(_OWORD *)&a1->data[68] = 0u;
  *(_OWORD *)&a1->data[70] = 0u;
  libunwind::UnwindCursor<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::setInfoBasedOnIPRegister();
  return 0;
}

unint64_t libunwind::UnwindCursor<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::setInfoBasedOnIPRegister()
{
  uint64_t v0;
  unsigned int v1;
  unsigned int v2;
  uint64_t v3;
  unint64_t result;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _DWORD *v8;
  uint64_t v9;
  unint64_t v10;
  unsigned int v11;
  char *v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  int v23;
  char *v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  unint64_t v28;
  unint64_t v29;
  int v30;
  char *v31;
  unsigned int v32;
  unsigned int v33;
  unsigned int v34;
  unsigned int v35;
  unsigned int v36;
  char *v37;
  unsigned int *v38;
  unsigned int v39;
  unint64_t v40;
  unsigned int v42;
  uint64_t v43;
  int v44;
  unsigned int v45;
  uint64_t v46;
  unint64_t v48;
  unsigned int v49;
  char *v50;
  uint64_t v51;
  char *v52;
  unsigned int v53;
  unsigned int v54;
  unsigned int v55;
  unsigned int v56;
  unsigned int v57;
  __int128 *i;
  unsigned int *v59;
  unint64_t v60;
  unint64_t *v61;
  int v62;
  uint64_t v63;
  __int128 v64;
  __int128 v65;
  uint64_t v66;
  uint64_t v67;
  __int128 v68;
  uint64_t v69;
  _BYTE v70[40];
  __int128 v71;
  __int128 v72;
  uint64_t v73;

  v0 = MEMORY[0x1E0C86820]();
  v2 = v1;
  v3 = v0;
  result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v0 + 24))(v0, 0xFFFFFFFFLL);
  if (!result)
    goto LABEL_94;
  v5 = result - v2;
  memset(v70, 0, sizeof(v70));
  result = _dyld_find_unwind_sections();
  if ((_DWORD)result)
  {
    v6 = *((_QWORD *)&v71 + 1);
    v7 = v71;
    *(_OWORD *)v70 = v71;
    v8 = (_DWORD *)*((_QWORD *)&v72 + 1);
    *(_OWORD *)&v70[16] = v72;
    *(_QWORD *)&v70[32] = v73;
    if (!*((_QWORD *)&v72 + 1))
      goto LABEL_82;
  }
  else
  {
    pthread_rwlock_rdlock(&libunwind::findDynamicUnwindSectionsLock);
    if (!libunwind::numDynamicUnwindSectionsFinders)
    {
LABEL_9:
      pthread_rwlock_unlock(&libunwind::findDynamicUnwindSectionsLock);
      v7 = 0;
LABEL_84:
      pthread_rwlock_rdlock(&libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_lock);
      for (i = libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_buffer[0]; ; i += 2)
      {
        if (i >= libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_bufferUsed)
        {
          result = pthread_rwlock_unlock(&libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_lock);
          goto LABEL_94;
        }
        if (*((_QWORD *)i + 1) <= v5 && *((_QWORD *)i + 2) > v5)
          break;
      }
      v59 = (unsigned int *)*((_QWORD *)i + 3);
      result = pthread_rwlock_unlock(&libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_lock);
      if (v59)
      {
        result = (unint64_t)libunwind::CFI_Parser<libunwind::LocalAddressSpace>::decodeFDE(v59, &v66, (uint64_t)&v63, 0, v60, v61);
        if (!result)
        {
          bzero(&v71, 0x1218uLL);
          result = libunwind::CFI_Parser<libunwind::LocalAddressSpace>::parseFDEInstructions();
          if ((result & 1) != 0)
          {
            *(_QWORD *)(v3 + 560) = v69;
            *(_QWORD *)(v3 + 568) = *((_QWORD *)&v65 + 1);
            *(_QWORD *)(v3 + 576) = v72;
            *(_DWORD *)(v3 + 592) = 50331648;
            v62 = v67;
            *(_QWORD *)(v3 + 600) = v66;
            *(_OWORD *)(v3 + 544) = v68;
            *(_QWORD *)(v3 + 584) = 0;
            *(_DWORD *)(v3 + 596) = v62;
            *(_QWORD *)(v3 + 608) = v7;
            return result;
          }
        }
      }
      goto LABEL_94;
    }
    v9 = 0;
    while (!(*((unsigned int (**)(unint64_t, uint64_t *))&libunwind::dynamicUnwindSectionsFinders + v9))(v5, &v63))
    {
      if (++v9 == libunwind::numDynamicUnwindSectionsFinders)
        goto LABEL_9;
    }
    result = pthread_rwlock_unlock(&libunwind::findDynamicUnwindSectionsLock);
    v7 = v63;
    *(_QWORD *)v70 = v63;
    *(_OWORD *)&v70[8] = v64;
    *(_OWORD *)&v70[24] = v65;
    v6 = v64;
    v8 = (_DWORD *)v65;
    if (!(_QWORD)v65)
      goto LABEL_82;
  }
  if (*v8 != 1)
    goto LABEL_82;
  v10 = v5 - v7;
  v11 = v8[6];
  v12 = (char *)v8 + v8[5];
  if (!v11)
  {
    v15 = 0;
    goto LABEL_22;
  }
  v13 = 0;
  v14 = v11 - 1;
  while (1)
  {
    v15 = (v11 + v13) >> 1;
    if (v10 < *(unsigned int *)&v12[12 * v15])
    {
      v11 = (v11 + v13) >> 1;
      goto LABEL_15;
    }
    if (v15 == v14)
      break;
    v13 = v15 + 1;
    if (v10 < *(unsigned int *)&v12[12 * v15 + 12])
      goto LABEL_22;
LABEL_15:
    v15 = v13;
    if (v13 >= v11)
      goto LABEL_22;
  }
  v15 = v14;
LABEL_22:
  v16 = 12 * v15;
  v17 = &v12[v16];
  v18 = 12 * (v15 + 1);
  v19 = *(unsigned int *)&v12[v18];
  v20 = (char *)v8 + *(unsigned int *)&v12[v16 + 4];
  v21 = v12 + 8;
  v22 = *(unsigned int *)&v21[v16];
  v23 = *(_DWORD *)&v21[v18];
  if (*(_DWORD *)v20 == 3)
  {
    v30 = *(_DWORD *)v17;
    v31 = &v20[*((unsigned __int16 *)v20 + 2)];
    v32 = *((unsigned __int16 *)v20 + 3);
    v33 = v32 - 1;
    if (*((_WORD *)v20 + 3))
    {
      v34 = 0;
      v35 = v10 - v30;
      while (1)
      {
        v36 = (v32 + v34) >> 1;
        if ((*(_DWORD *)&v31[4 * v36] & 0xFFFFFFu) > v35)
        {
          v32 = (v32 + v34) >> 1;
        }
        else
        {
          if (v36 == v33)
          {
            v36 = v33;
LABEL_62:
            result = *(unsigned int *)&v31[4 * v36];
            v40 = v7 + (result & 0xFFFFFF) + v30;
            if (v36 < v33)
              LODWORD(v19) = (*(_DWORD *)&v31[4 * v36 + 4] & 0xFFFFFF) + v30;
            v29 = v7 + v19;
            if (v40 > v5 || v29 < v5)
              goto LABEL_82;
            v48 = result >> 24;
            v49 = v8[2];
            if (v49 <= (result >> 24))
            {
              v51 = 4 * (unsigned __int16)(v48 - v49);
              v50 = &v20[*((unsigned __int16 *)v20 + 4)];
            }
            else
            {
              v50 = (char *)v8[1];
              v51 = (uint64_t)&v8[v48];
            }
            v42 = *(_DWORD *)&v50[v51];
            if ((v42 & 0x40000000) == 0)
              goto LABEL_50;
            goto LABEL_73;
          }
          v34 = v36 + 1;
          if ((*(_DWORD *)&v31[4 * v36 + 4] & 0xFFFFFFu) > v35)
            goto LABEL_62;
        }
        v36 = v34;
        if (v34 >= v32)
          goto LABEL_62;
      }
    }
    v36 = 0;
    goto LABEL_62;
  }
  if (*(_DWORD *)v20 != 2)
    goto LABEL_82;
  v24 = &v20[*((unsigned __int16 *)v20 + 2)];
  v25 = *((unsigned __int16 *)v20 + 3);
  if (!*((_WORD *)v20 + 3))
  {
    v27 = 0;
    v29 = 0;
    goto LABEL_44;
  }
  v26 = 0;
  v27 = v25 - 1;
  while (2)
  {
    result = (v25 + v26) >> 1;
    if (v10 < *(unsigned int *)&v24[8 * result])
    {
      v25 = (v25 + v26) >> 1;
      goto LABEL_27;
    }
    if ((_DWORD)result != v27)
    {
      v26 = result + 1;
      v28 = *(unsigned int *)&v24[8 * (result + 1)];
      if (v10 < v28)
      {
        v29 = v7 + v28;
        v27 = result;
        goto LABEL_44;
      }
LABEL_27:
      if (v26 >= v25)
      {
        v29 = 0;
        v27 = v26;
        goto LABEL_44;
      }
      continue;
    }
    break;
  }
  v29 = v7 + v19;
LABEL_44:
  v37 = &v24[8 * v27];
  v39 = *(_DWORD *)v37;
  v38 = (unsigned int *)(v37 + 4);
  v40 = v7 + v39;
  if (v40 > v5 || v29 < v5)
  {
LABEL_82:
    if (!v6)
      goto LABEL_84;
    result = libunwind::UnwindCursor<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::getInfoFromDwarfSection();
    if ((result & 1) == 0)
      goto LABEL_84;
    return result;
  }
  v42 = *v38;
  if ((v42 & 0x40000000) == 0)
  {
LABEL_50:
    v43 = 0;
    goto LABEL_51;
  }
LABEL_73:
  v52 = (char *)v8 + v22;
  v53 = (_DWORD)v8 + v23 - (_DWORD)v52;
  if (v53 < 8)
    goto LABEL_82;
  v54 = 0;
  v55 = v40 - v7;
  v56 = v53 >> 3;
  while (1)
  {
    result = 8 * ((v56 + v54) >> 1);
    v57 = *(_DWORD *)&v52[result];
    if (v57 == v55)
      break;
    if (v57 >= v55)
      v56 = (v56 + v54) >> 1;
    else
      v54 = ((v56 + v54) >> 1) + 1;
    if (v54 >= v56)
      goto LABEL_82;
  }
  v43 = v7 + *(unsigned int *)&v52[result + 4];
  if (!v43)
    goto LABEL_82;
LABEL_51:
  v44 = (v42 >> 28) & 3;
  if (v44)
  {
    v45 = v44 - 1;
    if (v45 >= v8[4])
      goto LABEL_82;
    v46 = *(_QWORD *)(v7 + *(int *)((char *)&v8[v45] + v8[3]));
  }
  else
  {
    v46 = 0;
  }
  *(_QWORD *)(v3 + 544) = v40;
  *(_QWORD *)(v3 + 552) = v29;
  *(_QWORD *)(v3 + 560) = v43;
  *(_QWORD *)(v3 + 568) = v46;
  *(_QWORD *)(v3 + 584) = 0;
  *(_QWORD *)(v3 + 576) = 0;
  *(_DWORD *)(v3 + 592) = v42;
  *(_QWORD *)(v3 + 600) = 0;
  *(_DWORD *)(v3 + 596) = 0;
  *(_QWORD *)(v3 + 608) = v7;
  if (v6 && (v42 & 0xF000000) == 0x3000000)
  {
    result = libunwind::UnwindCursor<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::getInfoFromDwarfSection();
    if ((result & 1) != 0)
      return result;
    v42 = *(_DWORD *)(v3 + 592);
  }
  if (!v42)
LABEL_94:
    *(_BYTE *)(v3 + 616) = 1;
  return result;
}

uint64_t libunwind::UnwindCursor<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::getInfoFromDwarfSection()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  unsigned int v3;
  unsigned int v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  __int128 *i;
  unint64_t *v11;
  int FDE;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t *v17;
  int v18;
  char v19;
  unsigned __int8 v20[32];
  uint64_t v21;
  unint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  _BYTE v26[16];
  unsigned int v27;

  v0 = MEMORY[0x1E0C86820]();
  v4 = v3;
  v5 = v2;
  v6 = v1;
  v7 = v0;
  if (v3
    && (libunwind::CFI_Parser<libunwind::LocalAddressSpace>::findFDE(v1, *(unint64_t **)(v2 + 8), *(_QWORD *)(v2 + 16), (unint64_t *)(*(_QWORD *)(v2 + 8) + v3), &v22, v20) & 1) != 0)
  {
    v8 = 0;
LABEL_16:
    v14 = *(_QWORD *)v5;
    bzero(v26, 0x1218uLL);
    if ((libunwind::CFI_Parser<libunwind::LocalAddressSpace>::parseFDEInstructions() & 1) == 0)
      return 0;
    v15 = v24;
    *(_QWORD *)(v7 + 544) = v24;
    v16 = v25;
    *(_OWORD *)(v7 + 552) = v25;
    *(_QWORD *)(v7 + 568) = v21;
    *(_QWORD *)(v7 + 576) = v27;
    *(_QWORD *)(v7 + 584) = 0;
    *(_DWORD *)(v7 + 592) = 50331648;
    v17 = v22;
    v18 = v23;
    *(_QWORD *)(v7 + 600) = v22;
    *(_DWORD *)(v7 + 596) = v18;
    if (v4)
      v19 = 1;
    else
      v19 = v8;
    *(_QWORD *)(v7 + 608) = v14;
    if ((v19 & 1) == 0)
      libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::add(*(_QWORD *)v5, v15, v16, (uint64_t)v17);
    return 1;
  }
  v9 = *(_QWORD *)v5;
  pthread_rwlock_rdlock(&libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_lock);
  for (i = libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_buffer[0]; ; i += 2)
  {
    if (i >= libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_bufferUsed)
    {
      pthread_rwlock_unlock(&libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_lock);
      goto LABEL_15;
    }
    if ((v9 == -1 || *(_QWORD *)i == v9) && *((_QWORD *)i + 1) <= v6 && *((_QWORD *)i + 2) > v6)
      break;
  }
  v11 = (unint64_t *)*((_QWORD *)i + 3);
  pthread_rwlock_unlock(&libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_lock);
  if (v11
    && (libunwind::CFI_Parser<libunwind::LocalAddressSpace>::findFDE(v6, *(unint64_t **)(v5 + 8), *(_QWORD *)(v5 + 16), v11, &v22, v20) & 1) != 0)
  {
    v8 = 1;
    goto LABEL_16;
  }
LABEL_15:
  FDE = libunwind::CFI_Parser<libunwind::LocalAddressSpace>::findFDE(v6, *(unint64_t **)(v5 + 8), *(_QWORD *)(v5 + 16), 0, &v22, v20);
  v8 = 0;
  result = 0;
  if (FDE)
    goto LABEL_16;
  return result;
}

const char *libunwind::CFI_Parser<libunwind::LocalAddressSpace>::decodeFDE(unsigned int *a1, _QWORD *a2, uint64_t a3, int a4, unint64_t a5, unint64_t *a6)
{
  uint64_t v9;
  unsigned int *v10;
  uint64_t v11;
  unsigned int *v12;
  const char *result;
  unint64_t *v14;
  uint64_t EncodedP;
  unint64_t v16;
  unint64_t *v17;
  uint64_t v18;
  uint64_t ULEB128;
  unint64_t v20;
  unint64_t *v21;
  unint64_t *v22;
  unint64_t *v23;
  int v24;
  unint64_t v25;
  unint64_t *v26;
  unint64_t *v27;

  v10 = a1 + 1;
  v9 = *a1;
  if ((_DWORD)v9 != -1)
  {
    if (*a1)
      goto LABEL_3;
    return "FDE has zero length";
  }
  v9 = *(_QWORD *)(a1 + 1);
  v10 = a1 + 3;
  if (!v9)
    return "FDE has zero length";
LABEL_3:
  v11 = *v10;
  if (!(_DWORD)v11)
    return "FDE is really a CIE";
  v12 = (unsigned int *)((char *)v10 - v11);
  if (a4)
  {
    if (*(unsigned int **)a3 != v12)
      return "CIE start does not match";
  }
  else
  {
    result = libunwind::CFI_Parser<libunwind::LocalAddressSpace>::parseCIE(v12, a3);
    if (result)
      return result;
  }
  v14 = (unint64_t *)((char *)v10 + v9);
  v27 = (unint64_t *)(v10 + 1);
  EncodedP = libunwind::LocalAddressSpace::getEncodedP(&v27, v14, *(unsigned __int8 *)(a3 + 24), 0, a5, a6);
  v18 = libunwind::LocalAddressSpace::getEncodedP(&v27, v14, *(_BYTE *)(a3 + 24) & 0xF, 0, v16, v17);
  a2[5] = 0;
  if (*(_BYTE *)(a3 + 49))
  {
    ULEB128 = libunwind::LocalAddressSpace::getULEB128(&v27, v14);
    v22 = v27;
    v23 = (unint64_t *)((char *)v27 + ULEB128);
    v24 = *(unsigned __int8 *)(a3 + 25);
    if (v24 != 255)
    {
      if (libunwind::LocalAddressSpace::getEncodedP(&v27, v14, v24 & 0xF, 0, v20, v21))
      {
        v27 = v22;
        a2[5] = libunwind::LocalAddressSpace::getEncodedP(&v27, v14, *(unsigned __int8 *)(a3 + 25), 0, v25, v26);
      }
    }
  }
  else
  {
    v23 = v27;
  }
  result = 0;
  *a2 = a1;
  a2[1] = (char *)v14 - (char *)a1;
  a2[2] = v23;
  a2[3] = EncodedP;
  a2[4] = v18 + EncodedP;
  return result;
}

uint64_t libunwind::CFI_Parser<libunwind::LocalAddressSpace>::parseFDEInstructions()
{
  unint64_t v0;
  unint64_t *v1;
  uint64_t v2;
  _DWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t result;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _OWORD *v15;
  unint64_t **v16;
  unint64_t *v17;
  unint64_t *v18;
  unint64_t v19;
  unint64_t EncodedP;
  unint64_t *v23;
  int v24;
  unint64_t ULEB128;
  uint64_t v26;
  uint64_t v27;
  _DWORD *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  _DWORD *v33;
  _BYTE *v34;
  int v35;
  unint64_t v36;
  _DWORD *v37;
  _BYTE *v38;
  int v39;
  unint64_t v40;
  unint64_t v41;
  _DWORD *v42;
  unint64_t v43;
  int v44;
  unint64_t v45;
  unint64_t v46;
  _DWORD *v47;
  unint64_t *v48;
  int v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t *v52;
  unsigned int v53;
  char v54;
  unsigned int v55;
  unsigned int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _DWORD *v60;
  uint64_t v61;
  int v62;
  unint64_t v63;
  uint64_t v64;
  unint64_t *v65;
  unsigned int v66;
  char v67;
  unsigned int v68;
  unsigned int v69;
  uint64_t v70;
  int v71;
  uint64_t v72;
  unsigned int v73;
  char v74;
  unsigned int v75;
  unsigned int v76;
  uint64_t v77;
  int v78;
  unint64_t v79;
  uint64_t v80;
  uint64_t v81;
  int v82;
  unint64_t v83;
  uint64_t v84;
  unint64_t *v85;
  unsigned int v86;
  char v87;
  unsigned int v88;
  unsigned int v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  uint64_t v94;
  uint64_t v95;
  int v96;
  uint64_t v97;
  uint64_t v98;
  _DWORD *v99;
  _BYTE *v100;
  int v101;
  _DWORD *v102;
  unint64_t v103;
  unint64_t v104;
  uint64_t v105;
  uint64_t v106;
  FILE *v107;
  const char *v108;
  size_t v109;
  FILE **v110;
  uint64_t v111;
  uint64_t *v112;
  uint64_t *v113;
  int v114;
  _BYTE v115[568];
  uint64_t v116;
  unint64_t *v117;
  _QWORD v118[8];

  result = MEMORY[0x1E0C86820]();
  v3 = (_DWORD *)v2;
  v5 = v4;
  v6 = (_QWORD *)result;
  LODWORD(result) = 0;
  v8 = 0;
  v9 = 0;
  v118[6] = *MEMORY[0x1E0C874D8];
  v10 = v4[1] + *v4;
  v118[0] = v4[2];
  v118[1] = v10;
  v11 = v6[1] + *v6;
  v12 = v6[2];
  v14 = v13 - v6[3];
  v15 = (_OWORD *)(v2 + 568);
  v118[2] = -1;
  v118[3] = v12;
  v118[4] = v11;
  v118[5] = v14;
  v113 = &v116;
  while (1)
  {
    v114 = result;
    v16 = (unint64_t **)&v118[3 * v8];
    v17 = *v16;
    v18 = v16[1];
    v19 = (unint64_t)v16[2];
    if (*v16 < v18 && v19 != 0)
      break;
LABEL_2:
    result = 1;
    v8 = 1;
    if ((v114 & 1) != 0)
      return result;
  }
  EncodedP = 0;
  while (2)
  {
    v23 = (unint64_t *)((char *)v17 + 1);
    v24 = *(unsigned __int8 *)v17;
    v117 = (unint64_t *)((char *)v17 + 1);
    switch(v24)
    {
      case 0:
        goto LABEL_9;
      case 1:
        EncodedP = libunwind::LocalAddressSpace::getEncodedP(&v117, v18, *((unsigned __int8 *)v5 + 24), 0, v0, v1);
        goto LABEL_9;
      case 2:
        EncodedP += *((_DWORD *)v5 + 10) * *((unsigned __int8 *)v17 + 1);
        v117 = (unint64_t *)((char *)v17 + 2);
        goto LABEL_9;
      case 3:
        EncodedP += *((_DWORD *)v5 + 10) * *(unsigned __int16 *)((char *)v17 + 1);
        v117 = (unint64_t *)((char *)v17 + 3);
        goto LABEL_9;
      case 4:
        EncodedP += (*((_DWORD *)v5 + 10) * *(_DWORD *)((char *)v17 + 1));
        v117 = (unint64_t *)((char *)v17 + 5);
        goto LABEL_9;
      case 5:
        ULEB128 = libunwind::LocalAddressSpace::getULEB128(&v117, v18);
        v26 = libunwind::LocalAddressSpace::getULEB128(&v117, v18);
        if (ULEB128 >= 0x120)
        {
          v107 = (FILE *)*MEMORY[0x1E0C874E0];
          v108 = "libunwind: malformed DW_CFA_offset_extended DWARF unwind, reg too big\n";
          v109 = 70;
          goto LABEL_132;
        }
        v27 = *((int *)v5 + 11);
        v28 = &v3[4 * ULEB128];
        if (!*((_BYTE *)v28 + 28))
        {
          *(_OWORD *)&v115[16 * ULEB128 + 24] = *(_OWORD *)&v3[4 * ULEB128 + 6];
          *((_BYTE *)v28 + 28) = 1;
        }
        v29 = v26 * v27;
        goto LABEL_109;
      case 6:
        v30 = libunwind::LocalAddressSpace::getULEB128(&v117, v18);
        if (v30 < 0x120)
        {
          if (LOBYTE(v3[4 * v30 + 7]))
          {
            v31 = 4 * v30;
LABEL_114:
            *(_OWORD *)&v3[v31 + 6] = *(_OWORD *)&v115[v31 * 4 + 24];
          }
          goto LABEL_9;
        }
        v107 = (FILE *)*MEMORY[0x1E0C874E0];
        v108 = "libunwind: malformed DW_CFA_restore_extended DWARF unwind, reg too big\n";
        goto LABEL_122;
      case 7:
        v32 = libunwind::LocalAddressSpace::getULEB128(&v117, v18);
        if (v32 >= 0x120)
        {
          v107 = (FILE *)*MEMORY[0x1E0C874E0];
          v108 = "libunwind: malformed DW_CFA_undefined DWARF unwind, reg too big\n";
          goto LABEL_131;
        }
        v33 = &v3[4 * v32];
        v35 = *((unsigned __int8 *)v33 + 28);
        v34 = v33 + 7;
        if (!v35)
        {
          *(_OWORD *)&v115[16 * v32 + 24] = *(_OWORD *)&v3[4 * v32 + 6];
          *v34 = 1;
        }
        v3[4 * v32 + 6] = 1;
        goto LABEL_9;
      case 8:
        v36 = libunwind::LocalAddressSpace::getULEB128(&v117, v18);
        if (v36 >= 0x120)
        {
          v107 = (FILE *)*MEMORY[0x1E0C874E0];
          v108 = "libunwind: malformed DW_CFA_same_value DWARF unwind, reg too big\n";
          v109 = 65;
          goto LABEL_132;
        }
        v37 = &v3[4 * v36];
        v39 = *((unsigned __int8 *)v37 + 28);
        v38 = v37 + 7;
        if (!v39)
        {
          *(_OWORD *)&v115[16 * v36 + 24] = *(_OWORD *)&v3[4 * v36 + 6];
          *v38 = 1;
        }
        v3[4 * v36 + 6] = 0;
        goto LABEL_9;
      case 9:
        v40 = libunwind::LocalAddressSpace::getULEB128(&v117, v18);
        v41 = libunwind::LocalAddressSpace::getULEB128(&v117, v18);
        if (v40 >= 0x120)
        {
          v107 = (FILE *)*MEMORY[0x1E0C874E0];
          v108 = "libunwind: malformed DW_CFA_register DWARF unwind, reg too big\n";
          v109 = 63;
          goto LABEL_132;
        }
        if (v41 < 0x120)
        {
          v42 = &v3[4 * v40];
          if (!*((_BYTE *)v42 + 28))
          {
            *(_OWORD *)&v115[16 * v40 + 24] = *(_OWORD *)&v3[4 * v40 + 6];
            *((_BYTE *)v42 + 28) = 1;
          }
          v42[6] = 5;
          *((_QWORD *)v42 + 4) = v41;
LABEL_9:
          v17 = v117;
          if (v117 >= v18 || EncodedP >= v19)
            goto LABEL_2;
          continue;
        }
        v107 = (FILE *)*MEMORY[0x1E0C874E0];
        v108 = "libunwind: malformed DW_CFA_register DWARF unwind, reg2 too big\n";
LABEL_131:
        v109 = 64;
LABEL_132:
        fwrite(v108, v109, 1uLL, v107);
LABEL_133:
        fflush((FILE *)*MEMORY[0x1E0C874E0]);
        return 0;
      case 10:
        MEMORY[0x1E0C86820]();
        *(&v111 - 580) = (uint64_t)v9;
        memcpy(&v111 - 579, v3, 0x1218uLL);
        v9 = &v111 - 580;
        goto LABEL_9;
      case 11:
        if (!v9)
          return 0;
        memcpy(v3, v9 + 1, 0x1218uLL);
        v9 = (uint64_t *)*v9;
        goto LABEL_9;
      case 12:
        v43 = libunwind::LocalAddressSpace::getULEB128(&v117, v18);
        v44 = libunwind::LocalAddressSpace::getULEB128(&v117, v18);
        if (v43 >= 0x120)
        {
          v107 = (FILE *)*MEMORY[0x1E0C874E0];
          v108 = "libunwind: malformed DW_CFA_def_cfa DWARF unwind, reg too big\n";
          v109 = 62;
          goto LABEL_132;
        }
        *v3 = v43;
        v3[1] = v44;
        goto LABEL_9;
      case 13:
        v45 = libunwind::LocalAddressSpace::getULEB128(&v117, v18);
        if (v45 >= 0x120)
        {
          v107 = (FILE *)*MEMORY[0x1E0C874E0];
          v108 = "libunwind: malformed DW_CFA_def_cfa_register DWARF unwind, reg too big\n";
LABEL_122:
          v109 = 71;
          goto LABEL_132;
        }
        *v3 = v45;
        goto LABEL_9;
      case 14:
        v3[1] = libunwind::LocalAddressSpace::getULEB128(&v117, v18);
        goto LABEL_9;
      case 15:
        *v3 = 0;
        *((_QWORD *)v3 + 1) = v23;
        goto LABEL_95;
      case 16:
        v46 = libunwind::LocalAddressSpace::getULEB128(&v117, v18);
        if (v46 >= 0x120)
        {
          v107 = (FILE *)*MEMORY[0x1E0C874E0];
          v108 = "libunwind: malformed DW_CFA_expression DWARF unwind, reg too big\n";
          v109 = 65;
          goto LABEL_132;
        }
        v47 = &v3[4 * v46];
        if (!*((_BYTE *)v47 + 28))
        {
          *(_OWORD *)&v115[16 * v46 + 24] = *(_OWORD *)&v3[4 * v46 + 6];
          *((_BYTE *)v47 + 28) = 1;
        }
        v48 = v117;
        v49 = 6;
        goto LABEL_94;
      case 17:
        v50 = libunwind::LocalAddressSpace::getULEB128(&v117, v18);
        if (v50 >= 0x120)
        {
          v107 = (FILE *)*MEMORY[0x1E0C874E0];
          v108 = "libunwind: malformed DW_CFA_offset_extended_sf DWARF unwind, reg too big\n";
          v109 = 73;
          goto LABEL_132;
        }
        v51 = 0;
        v52 = v117;
        v53 = -7;
        do
        {
          if (v52 == v18)
            goto LABEL_136;
          v54 = v53;
          v53 += 7;
          v56 = *(unsigned __int8 *)v52;
          v52 = (unint64_t *)((char *)v52 + 1);
          v55 = v56;
          v51 |= (unint64_t)(v56 & 0x7F) << v53;
        }
        while ((v56 & 0x80) != 0);
        v57 = -1 << (v54 + 14);
        if (((v53 < 0x39) & (v55 >> 6)) != 0)
          v58 = v57;
        else
          v58 = 0;
        v117 = v52;
        v59 = *((int *)v5 + 11);
        v60 = &v3[4 * v50];
        if (!*((_BYTE *)v60 + 28))
        {
          *(_OWORD *)&v115[16 * v50 + 24] = *(_OWORD *)&v3[4 * v50 + 6];
          *((_BYTE *)v60 + 28) = 1;
        }
        v61 = (v51 | v58) * v59;
        v62 = 2;
        goto LABEL_89;
      case 18:
        v63 = libunwind::LocalAddressSpace::getULEB128(&v117, v18);
        v64 = 0;
        v65 = v117;
        v66 = -7;
        do
        {
          if (v65 == v18)
            goto LABEL_136;
          v67 = v66;
          v66 += 7;
          v69 = *(unsigned __int8 *)v65;
          v65 = (unint64_t *)((char *)v65 + 1);
          v68 = v69;
          v64 |= (unint64_t)(v69 & 0x7F) << v66;
        }
        while ((v69 & 0x80) != 0);
        v117 = v65;
        if (v63 >= 0x120)
        {
          v107 = (FILE *)*MEMORY[0x1E0C874E0];
          v108 = "libunwind: malformed DW_CFA_def_cfa_sf DWARF unwind, reg too big\n";
          v109 = 65;
          goto LABEL_132;
        }
        v70 = -1 << (v67 + 14);
        if (((v66 < 0x39) & (v68 >> 6)) == 0)
          LODWORD(v70) = 0;
        v71 = *((_DWORD *)v5 + 11) * (v64 | v70);
        *v3 = v63;
        v3[1] = v71;
        goto LABEL_9;
      case 19:
        v72 = 0;
        v73 = -7;
        do
        {
          if (v23 == v18)
            goto LABEL_136;
          v74 = v73;
          v73 += 7;
          v76 = *(unsigned __int8 *)v23;
          v23 = (unint64_t *)((char *)v23 + 1);
          v75 = v76;
          v72 |= (unint64_t)(v76 & 0x7F) << v73;
        }
        while ((v76 & 0x80) != 0);
        v77 = -1 << (v74 + 14);
        if (((v73 < 0x39) & (v75 >> 6)) != 0)
          v78 = v77;
        else
          v78 = 0;
        v117 = v23;
        v3[1] = *((_DWORD *)v5 + 11) * (v72 | v78);
        goto LABEL_9;
      case 20:
        v79 = libunwind::LocalAddressSpace::getULEB128(&v117, v18);
        if (v79 >= 0x120)
        {
          fprintf((FILE *)*MEMORY[0x1E0C874E0], "libunwind: malformed DW_CFA_val_offset DWARF unwind, reg (%llu) out of range\n\n", v79);
          goto LABEL_133;
        }
        v80 = libunwind::LocalAddressSpace::getULEB128(&v117, v18);
        v81 = *((int *)v5 + 11);
        v28 = &v3[4 * v79];
        if (!*((_BYTE *)v28 + 28))
        {
          *(_OWORD *)&v115[16 * v79 + 24] = *(_OWORD *)&v3[4 * v79 + 6];
          *((_BYTE *)v28 + 28) = 1;
        }
        v29 = v80 * v81;
        v82 = 4;
LABEL_110:
        v28[6] = v82;
        *((_QWORD *)v28 + 4) = v29;
        goto LABEL_9;
      case 21:
        v83 = libunwind::LocalAddressSpace::getULEB128(&v117, v18);
        if (v83 >= 0x120)
        {
          v107 = (FILE *)*MEMORY[0x1E0C874E0];
          v108 = "libunwind: malformed DW_CFA_val_offset_sf DWARF unwind, reg too big\n";
          v109 = 68;
          goto LABEL_132;
        }
        v84 = 0;
        v85 = v117;
        v86 = -7;
        do
        {
          if (v85 == v18)
          {
LABEL_136:
            v110 = (FILE **)MEMORY[0x1E0C874E0];
            fprintf((FILE *)*MEMORY[0x1E0C874E0], "libunwind: %s - %s\n", "getSLEB128", "truncated sleb128 expression");
            fflush(*v110);
            abort();
          }
          v87 = v86;
          v86 += 7;
          v89 = *(unsigned __int8 *)v85;
          v85 = (unint64_t *)((char *)v85 + 1);
          v88 = v89;
          v84 |= (unint64_t)(v89 & 0x7F) << v86;
        }
        while ((v89 & 0x80) != 0);
        v90 = -1 << (v87 + 14);
        if (((v86 < 0x39) & (v88 >> 6)) != 0)
          v91 = v90;
        else
          v91 = 0;
        v117 = v85;
        v92 = *((int *)v5 + 11);
        v60 = &v3[4 * v83];
        if (!*((_BYTE *)v60 + 28))
        {
          *(_OWORD *)&v115[16 * v83 + 24] = *(_OWORD *)&v3[4 * v83 + 6];
          *((_BYTE *)v60 + 28) = 1;
        }
        v61 = (v84 | v91) * v92;
        v62 = 4;
LABEL_89:
        v60[6] = v62;
        *((_QWORD *)v60 + 4) = v61;
        goto LABEL_9;
      case 22:
        v93 = libunwind::LocalAddressSpace::getULEB128(&v117, v18);
        if (v93 >= 0x120)
        {
          v107 = (FILE *)*MEMORY[0x1E0C874E0];
          v108 = "libunwind: malformed DW_CFA_val_expression DWARF unwind, reg too big\n";
          v109 = 69;
          goto LABEL_132;
        }
        v47 = &v3[4 * v93];
        if (!*((_BYTE *)v47 + 28))
        {
          *(_OWORD *)&v115[16 * v93 + 24] = *(_OWORD *)&v3[4 * v93 + 6];
          *((_BYTE *)v47 + 28) = 1;
        }
        v48 = v117;
        v49 = 7;
LABEL_94:
        v47[6] = v49;
        *((_QWORD *)v47 + 4) = v48;
LABEL_95:
        v94 = libunwind::LocalAddressSpace::getULEB128(&v117, v18);
        v117 = (unint64_t *)((char *)v117 + v94);
        goto LABEL_9;
      case 45:
        if (!*((_BYTE *)v3 + 572))
        {
          *(_OWORD *)v113 = *v15;
          *((_BYTE *)v3 + 572) = 1;
        }
        *((_QWORD *)v3 + 72) ^= 1uLL;
        goto LABEL_9;
      case 46:
        v3[4] = libunwind::LocalAddressSpace::getULEB128(&v117, v18);
        goto LABEL_9;
      case 47:
        v103 = libunwind::LocalAddressSpace::getULEB128(&v117, v18);
        if (v103 >= 0x120)
        {
          v107 = (FILE *)*MEMORY[0x1E0C874E0];
          v108 = "libunwind: malformed DW_CFA_GNU_negative_offset_extended DWARF unwind, reg too big\n";
          v109 = 83;
          goto LABEL_132;
        }
        v104 = v103;
        v105 = libunwind::LocalAddressSpace::getULEB128(&v117, v18);
        v106 = *((int *)v5 + 11);
        v28 = &v3[4 * v104];
        if (!*((_BYTE *)v28 + 28))
        {
          *(_OWORD *)&v115[16 * v104 + 24] = *(_OWORD *)&v3[4 * v104 + 6];
          *((_BYTE *)v28 + 28) = 1;
        }
        v29 = -(v105 * v106);
LABEL_109:
        v82 = 2;
        goto LABEL_110;
      default:
        v95 = v24 & 0x3F;
        v96 = v24 & 0xC0;
        if (v96 == 64)
        {
          EncodedP += (*((_DWORD *)v5 + 10) * v95);
          goto LABEL_9;
        }
        if (v96 != 192)
        {
          if (v96 != 128)
            return 0;
          v112 = v9;
          v97 = libunwind::LocalAddressSpace::getULEB128(&v117, v18);
          v98 = *((int *)v5 + 11);
          v99 = &v3[4 * v95];
          v101 = *((unsigned __int8 *)v99 + 28);
          v100 = v99 + 7;
          if (!v101)
          {
            *(_OWORD *)&v115[16 * v95 + 24] = *(_OWORD *)&v3[4 * v95 + 6];
            *v100 = 1;
          }
          v102 = &v3[4 * v95];
          v102[6] = 2;
          *((_QWORD *)v102 + 4) = v97 * v98;
          v9 = v112;
          goto LABEL_9;
        }
        if (!LOBYTE(v3[4 * v95 + 7]))
          goto LABEL_9;
        v31 = 4 * v95;
        goto LABEL_114;
    }
  }
}

uint64_t libunwind::LocalAddressSpace::getEncodedP(unint64_t **this, unint64_t *a2, unsigned int a3, uint64_t *a4, unint64_t a5, unint64_t *a6)
{
  uint64_t v8;
  uint64_t ULEB128;
  unint64_t *v10;
  uint64_t v11;
  unsigned int v12;
  char v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  FILE **v19;
  FILE *v20;
  const char *v21;
  const char *v22;

  v8 = (uint64_t)*this;
  switch(a3 & 0xF)
  {
    case 0u:
    case 4u:
    case 0xCu:
      v10 = (unint64_t *)(v8 + 8);
      ULEB128 = *(_QWORD *)v8;
      goto LABEL_15;
    case 1u:
      ULEB128 = libunwind::LocalAddressSpace::getULEB128(this, a2);
      goto LABEL_16;
    case 2u:
      v10 = (unint64_t *)(v8 + 2);
      ULEB128 = *(unsigned __int16 *)v8;
      goto LABEL_15;
    case 3u:
      v10 = (unint64_t *)(v8 + 4);
      ULEB128 = *(unsigned int *)v8;
      goto LABEL_15;
    case 9u:
      v11 = 0;
      v12 = -7;
      v10 = *this;
      do
      {
        if (v10 == a2)
        {
          v19 = (FILE **)MEMORY[0x1E0C874E0];
          v20 = (FILE *)*MEMORY[0x1E0C874E0];
          v21 = "truncated sleb128 expression";
          v22 = "getSLEB128";
LABEL_32:
          fprintf(v20, "libunwind: %s - %s\n", v22, v21);
          fflush(*v19);
          abort();
        }
        v13 = v12;
        v12 += 7;
        v15 = *(unsigned __int8 *)v10;
        v10 = (unint64_t *)((char *)v10 + 1);
        v14 = v15;
        v11 |= (unint64_t)(v15 & 0x7F) << v12;
      }
      while ((v15 & 0x80) != 0);
      v16 = -1 << (v13 + 14);
      if (((v12 < 0x39) & (v14 >> 6)) != 0)
        v17 = v16;
      else
        v17 = 0;
      ULEB128 = v11 | v17;
LABEL_15:
      *this = v10;
LABEL_16:
      switch((a3 >> 4) & 7)
      {
        case 0u:
          goto LABEL_18;
        case 1u:
          ULEB128 += v8;
LABEL_18:
          if ((a3 & 0x80) != 0)
          {
            if (a4)
              *a4 = ULEB128;
            return *(_QWORD *)ULEB128;
          }
          else if (a4)
          {
            *a4 = v8;
          }
          return ULEB128;
        case 2u:
          v19 = (FILE **)MEMORY[0x1E0C874E0];
          v20 = (FILE *)*MEMORY[0x1E0C874E0];
          v21 = "DW_EH_PE_textrel pointer encoding not supported";
          goto LABEL_31;
        case 3u:
          v19 = (FILE **)MEMORY[0x1E0C874E0];
          v20 = (FILE *)*MEMORY[0x1E0C874E0];
          v21 = "DW_EH_PE_datarel is invalid with a datarelBase of 0";
          goto LABEL_31;
        case 4u:
          v19 = (FILE **)MEMORY[0x1E0C874E0];
          v20 = (FILE *)*MEMORY[0x1E0C874E0];
          v21 = "DW_EH_PE_funcrel pointer encoding not supported";
          goto LABEL_31;
        case 5u:
          v19 = (FILE **)MEMORY[0x1E0C874E0];
          v20 = (FILE *)*MEMORY[0x1E0C874E0];
          v21 = "DW_EH_PE_aligned pointer encoding not supported";
          goto LABEL_31;
        default:
          goto LABEL_26;
      }
    case 0xAu:
      v10 = (unint64_t *)(v8 + 2);
      ULEB128 = *(__int16 *)v8;
      goto LABEL_15;
    case 0xBu:
      v10 = (unint64_t *)(v8 + 4);
      ULEB128 = *(int *)v8;
      goto LABEL_15;
    default:
LABEL_26:
      v19 = (FILE **)MEMORY[0x1E0C874E0];
      v20 = (FILE *)*MEMORY[0x1E0C874E0];
      v21 = "unknown pointer encoding";
LABEL_31:
      v22 = "getEncodedP";
      goto LABEL_32;
  }
}

uint64_t libunwind::LocalAddressSpace::getULEB128(unint64_t **this, unint64_t *a2)
{
  unint64_t *v2;
  unint64_t *v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  FILE **v15;
  FILE *v16;
  const char *v17;

  v2 = *this;
  if (*this == a2)
    goto LABEL_25;
  v3 = (unint64_t *)((char *)v2 + 1);
  v4 = *(_BYTE *)v2 & 0x7F;
  if ((*(_BYTE *)v2 & 0x80) != 0)
  {
    if (v3 == a2)
      goto LABEL_25;
    v5 = *((char *)v2 + 1);
    v4 |= (unint64_t)(v5 & 0x7F) << 7;
    v3 = (unint64_t *)((char *)v2 + 2);
    if (v5 < 0)
    {
      if (v3 == a2)
        goto LABEL_25;
      v6 = *((char *)v2 + 2);
      v4 |= (unint64_t)(v6 & 0x7F) << 14;
      v3 = (unint64_t *)((char *)v2 + 3);
      if (v6 < 0)
      {
        if (v3 == a2)
          goto LABEL_25;
        v7 = *((char *)v2 + 3);
        v4 |= (unint64_t)(v7 & 0x7F) << 21;
        v3 = (unint64_t *)((char *)v2 + 4);
        if (v7 < 0)
        {
          if (v3 == a2)
            goto LABEL_25;
          v8 = *((char *)v2 + 4);
          v4 |= (unint64_t)(v8 & 0x7F) << 28;
          v3 = (unint64_t *)((char *)v2 + 5);
          if (v8 < 0)
          {
            if (v3 == a2)
              goto LABEL_25;
            v9 = *((char *)v2 + 5);
            v4 |= (unint64_t)(v9 & 0x7F) << 35;
            v3 = (unint64_t *)((char *)v2 + 6);
            if (v9 < 0)
            {
              if (v3 == a2)
                goto LABEL_25;
              v10 = *((char *)v2 + 6);
              v4 |= (unint64_t)(v10 & 0x7F) << 42;
              v3 = (unint64_t *)((char *)v2 + 7);
              if (v10 < 0)
              {
                if (v3 == a2)
                  goto LABEL_25;
                v11 = *((char *)v2 + 7);
                v4 |= (unint64_t)(v11 & 0x7F) << 49;
                v3 = v2 + 1;
                if (v11 < 0)
                {
                  if (v3 == a2)
                    goto LABEL_25;
                  v12 = *((char *)v2 + 8);
                  v4 |= (unint64_t)(v12 & 0x7F) << 56;
                  v3 = (unint64_t *)((char *)v2 + 9);
                  if (v12 < 0)
                  {
                    if (v3 != a2)
                    {
                      v13 = *(unsigned __int8 *)v3;
                      if ((v13 & 0x7E) != 0)
                        goto LABEL_27;
                      v3 = (unint64_t *)((char *)v2 + 10);
                      if ((v13 & 0x80) == 0)
                      {
                        v4 |= v13 << 63;
                        goto LABEL_23;
                      }
                      if (v3 != a2)
                      {
LABEL_27:
                        v15 = (FILE **)MEMORY[0x1E0C874E0];
                        v16 = (FILE *)*MEMORY[0x1E0C874E0];
                        v17 = "malformed uleb128 expression";
LABEL_26:
                        fprintf(v16, "libunwind: %s - %s\n", "getULEB128", v17);
                        fflush(*v15);
                        abort();
                      }
                    }
LABEL_25:
                    v15 = (FILE **)MEMORY[0x1E0C874E0];
                    v16 = (FILE *)*MEMORY[0x1E0C874E0];
                    v17 = "truncated uleb128 expression";
                    goto LABEL_26;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_23:
  *this = v3;
  return v4;
}

const char *libunwind::CFI_Parser<libunwind::LocalAddressSpace>::parseCIE(unsigned int *a1, uint64_t a2)
{
  char v3;
  unsigned int *v4;
  uint64_t v5;
  unint64_t *v6;
  const char *result;
  uint64_t v8;
  int v9;
  _BYTE *v10;
  unint64_t *v11;
  int v12;
  int ULEB128;
  uint64_t v14;
  unint64_t *v15;
  unsigned int v16;
  char v17;
  unsigned int v18;
  unsigned int v19;
  uint64_t v20;
  int v21;
  char v22;
  unint64_t v23;
  unint64_t *v24;
  unint64_t *v25;
  unsigned int v26;
  unint64_t *v27;
  unint64_t *v28;
  unint64_t *v29;
  FILE **v30;
  uint64_t v31;
  unint64_t *v32;

  v3 = (char)a1;
  *(_DWORD *)(a2 + 24) = 65280;
  *(_WORD *)(a2 + 51) = 0;
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 40) = 0;
  *(_WORD *)(a2 + 48) = 0;
  *(_QWORD *)a2 = a1;
  v4 = a1 + 1;
  v5 = *a1;
  if ((_DWORD)v5 != -1)
  {
    v6 = (unint64_t *)((char *)v4 + v5);
    if (*a1)
      goto LABEL_3;
    return 0;
  }
  v8 = *(_QWORD *)(a1 + 1);
  v4 = a1 + 3;
  v6 = (unint64_t *)((char *)a1 + v8 + 12);
  if (!v8)
    return 0;
LABEL_3:
  if (*v4)
    return "CIE ID is not zero";
  v9 = *((unsigned __int8 *)v4 + 4);
  if ((v9 & 0xFFFFFFFD) != 1)
    return "CIE version is not 1 or 3";
  v10 = (char *)v4 + 5;
  v11 = (unint64_t *)((char *)v4 + 5);
  do
  {
    v12 = *(unsigned __int8 *)v11;
    v11 = (unint64_t *)((char *)v11 + 1);
  }
  while (v12);
  v32 = v11;
  ULEB128 = libunwind::LocalAddressSpace::getULEB128(&v32, v6);
  v14 = 0;
  *(_DWORD *)(a2 + 40) = ULEB128;
  v15 = v32;
  v16 = -7;
  do
  {
    if (v15 == v6)
    {
      v30 = (FILE **)MEMORY[0x1E0C874E0];
      fprintf((FILE *)*MEMORY[0x1E0C874E0], "libunwind: %s - %s\n", "getSLEB128", "truncated sleb128 expression");
      fflush(*v30);
      abort();
    }
    v17 = v16;
    v16 += 7;
    v19 = *(unsigned __int8 *)v15;
    v15 = (unint64_t *)((char *)v15 + 1);
    v18 = v19;
    v14 |= (unint64_t)(v19 & 0x7F) << v16;
  }
  while ((v19 & 0x80) != 0);
  v20 = -1 << (v17 + 14);
  if (((v16 < 0x39) & (v18 >> 6)) != 0)
    v21 = v20;
  else
    v21 = 0;
  v32 = v15;
  *(_DWORD *)(a2 + 44) = v14 | v21;
  if (v9 == 1)
  {
    v22 = *(_BYTE *)v15;
    v32 = (unint64_t *)((char *)v15 + 1);
  }
  else
  {
    v22 = libunwind::LocalAddressSpace::getULEB128(&v32, v6);
  }
  *(_BYTE *)(a2 + 50) = v22;
  v31 = 0;
  if (*v10 == 122)
  {
    libunwind::LocalAddressSpace::getULEB128(&v32, v6);
    while (1)
    {
      switch(*v10)
      {
        case 'B':
          *(_BYTE *)(a2 + 51) = 1;
          ++v10;
          continue;
        case 'C':
        case 'D':
        case 'E':
        case 'F':
        case 'H':
        case 'I':
        case 'J':
        case 'K':
        case 'M':
        case 'N':
        case 'O':
        case 'Q':
        case 'T':
        case 'U':
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
          goto LABEL_23;
        case 'G':
          *(_BYTE *)(a2 + 52) = 1;
          goto LABEL_23;
        case 'L':
          v25 = (unint64_t *)((char *)v32 + 1);
          *(_BYTE *)(a2 + 25) = *(_BYTE *)v32;
          v32 = v25;
          ++v10;
          continue;
        case 'P':
          v27 = (unint64_t *)((char *)v32 + 1);
          v26 = *(unsigned __int8 *)v32;
          *(_BYTE *)(a2 + 26) = v26;
          v32 = v27;
          *(_BYTE *)(a2 + 27) = (_BYTE)v27 - v3;
          *(_QWORD *)(a2 + 32) = libunwind::LocalAddressSpace::getEncodedP(&v32, v6, v26, &v31, v23, v24);
          ++v10;
          continue;
        case 'R':
          v28 = (unint64_t *)((char *)v32 + 1);
          *(_BYTE *)(a2 + 24) = *(_BYTE *)v32;
          v32 = v28;
          ++v10;
          continue;
        case 'S':
          *(_BYTE *)(a2 + 48) = 1;
          ++v10;
          continue;
        case 'z':
          *(_BYTE *)(a2 + 49) = 1;
          ++v10;
          continue;
        default:
          if (!*v10)
            goto LABEL_32;
LABEL_23:
          ++v10;
          break;
      }
    }
  }
LABEL_32:
  result = 0;
  v29 = v32;
  *(_QWORD *)(a2 + 8) = (char *)v6 - *(_QWORD *)a2;
  *(_QWORD *)(a2 + 16) = v29;
  return result;
}

uint64_t libunwind::CFI_Parser<libunwind::LocalAddressSpace>::findFDE(unint64_t a1, unint64_t *a2, uint64_t a3, unint64_t *a4, unint64_t **a5, unsigned __int8 *a6)
{
  unint64_t *v6;
  unint64_t v7;
  unint64_t *v12;
  uint64_t v13;
  unsigned int *v14;
  uint64_t v15;
  unsigned int *v16;
  unint64_t v18;
  unint64_t *v19;
  unint64_t EncodedP;
  unint64_t v21;
  unint64_t *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t ULEB128;
  unint64_t v26;
  unint64_t *v27;
  unint64_t *v28;
  unint64_t *v29;
  int v30;
  unint64_t v31;
  unint64_t *v32;
  uint64_t result;
  unint64_t *v34;

  if (a4)
    v6 = a4;
  else
    v6 = a2;
  if (a3 == -1)
    v7 = -1;
  else
    v7 = (unint64_t)a2 + a3;
  for (; (unint64_t)v6 < v7; v34 = v6)
  {
    v12 = v6;
    v14 = (unsigned int *)v6 + 1;
    v13 = *(unsigned int *)v6;
    if ((_DWORD)v13 == -1)
    {
      v13 = *(unint64_t *)((char *)v6 + 4);
      v14 = (unsigned int *)v6 + 3;
    }
    if (!v13)
      break;
    v15 = *v14;
    v6 = (unint64_t *)((char *)v14 + v13);
    if ((_DWORD)v15)
    {
      v16 = (unsigned int *)((char *)v14 - v15);
      if ((char *)v14 - v15 >= (char *)a2
        && (unint64_t)v16 < v7
        && !libunwind::CFI_Parser<libunwind::LocalAddressSpace>::parseCIE(v16, (uint64_t)a6))
      {
        v34 = (unint64_t *)(v14 + 1);
        EncodedP = libunwind::LocalAddressSpace::getEncodedP(&v34, v6, a6[24], 0, v18, v19);
        v23 = libunwind::LocalAddressSpace::getEncodedP(&v34, v6, a6[24] & 0xF, 0, v21, v22);
        if (EncodedP < a1)
        {
          v24 = v23 + EncodedP;
          if (v23 + EncodedP >= a1)
          {
            a5[5] = 0;
            if (a6[49])
            {
              ULEB128 = libunwind::LocalAddressSpace::getULEB128(&v34, v6);
              v28 = v34;
              v29 = (unint64_t *)((char *)v34 + ULEB128);
              v30 = a6[25];
              if (v30 != 255)
              {
                if (libunwind::LocalAddressSpace::getEncodedP(&v34, v6, v30 & 0xF, 0, v26, v27))
                {
                  v34 = v28;
                  a5[5] = (unint64_t *)libunwind::LocalAddressSpace::getEncodedP(&v34, v6, a6[25], 0, v31, v32);
                }
              }
            }
            else
            {
              v29 = v34;
            }
            *a5 = v12;
            a5[1] = (unint64_t *)((char *)v6 - (char *)v12);
            a5[2] = v29;
            a5[3] = (unint64_t *)EncodedP;
            result = 1;
            a5[4] = (unint64_t *)v24;
            return result;
          }
        }
      }
    }
  }
  return 0;
}

uint64_t libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::add(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __int128 *v8;
  size_t v9;
  int64_t v10;
  char *v11;
  __int128 *v12;
  int64_t v14;

  pthread_rwlock_wrlock(&libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_lock);
  v8 = libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_bufferUsed;
  if ((unint64_t)libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_bufferUsed >= libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_bufferEnd)
  {
    v9 = libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_bufferEnd
       - (unint64_t)libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_buffer[0];
    v10 = (int64_t)(libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_bufferEnd
                         - (unint64_t)libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_buffer[0]) >> 5;
    v14 = (int64_t)(libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_bufferEnd
                         - (unint64_t)libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_buffer[0]) >> 3;
    v11 = (char *)malloc_type_malloc(4* (libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_bufferEnd- (unint64_t)libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_buffer[0]), 0x1000040E0EAB150uLL);
    v12 = libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_buffer[0];
    memcpy(v11, libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_buffer[0], v9);
    if (v12 != &libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_initialBuffer)
      free(v12);
    libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_buffer[0] = (__int128 *)v11;
    v8 = (__int128 *)&v11[32 * v10];
    libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_bufferEnd = (uint64_t)&v11[32 * v14];
  }
  *(_QWORD *)v8 = a1;
  *((_QWORD *)v8 + 1) = a2;
  *((_QWORD *)v8 + 2) = a3;
  *((_QWORD *)v8 + 3) = a4;
  libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_bufferUsed = v8 + 2;
  if ((libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_registeredForDyldUnloads & 1) == 0)
  {
    _dyld_register_func_for_remove_image((void (__cdecl *)(const mach_header *, intptr_t))libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::dyldUnloadHook);
    libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_registeredForDyldUnloads = 1;
  }
  return pthread_rwlock_unlock(&libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_lock);
}

uint64_t libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::dyldUnloadHook(uint64_t a1)
{
  __int128 *v2;
  __int128 *v3;
  __int128 *v4;
  __int128 v5;

  pthread_rwlock_wrlock(&libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_lock);
  v2 = libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_buffer[0];
  v3 = libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_bufferUsed;
  if (libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_buffer[0] >= libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_bufferUsed)
  {
    v4 = libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_buffer[0];
  }
  else
  {
    v4 = libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_buffer[0];
    do
    {
      if (*(_QWORD *)v2 != a1)
      {
        if (v2 != v4)
        {
          v5 = v2[1];
          *v4 = *v2;
          v4[1] = v5;
        }
        v4 += 2;
      }
      v2 += 2;
    }
    while (v2 < v3);
  }
  libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_bufferUsed = v4;
  return pthread_rwlock_unlock(&libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_lock);
}

uint64_t libunwind::UnwindCursor<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::validReg(uint64_t a1, unsigned int a2)
{
  _BOOL4 v2;

  v2 = a2 == 34 || a2 - 64 < 0xFFFFFFE1;
  if (a2 > 0x5F)
    v2 = 0;
  return a2 > 0xFFFFFFFD || v2;
}

uint64_t libunwind::UnwindCursor<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::getReg(uint64_t a1, unsigned int a2)
{
  uint64_t v2;
  FILE **v4;

  switch(a2)
  {
    case 0xFFFFFFFE:
    case 0x1Fu:
      v2 = a1 + 264;
      break;
    case 0xFFFFFFFF:
    case 0x20u:
      v2 = a1 + 272;
      break;
    case 0x1Du:
      v2 = a1 + 248;
      break;
    case 0x1Eu:
      v2 = a1 + 256;
      break;
    case 0x22u:
      v2 = a1 + 280;
      break;
    default:
      if (a2 > 0x1C)
      {
        v4 = (FILE **)MEMORY[0x1E0C874E0];
        fprintf((FILE *)*MEMORY[0x1E0C874E0], "libunwind: %s - %s\n", "getRegister", "unsupported arm64 register");
        fflush(*v4);
        abort();
      }
      v2 = a1 + 16 + 8 * a2;
      break;
  }
  return *(_QWORD *)v2;
}

_QWORD *libunwind::UnwindCursor<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::setReg(_QWORD *result, unsigned int a2, uint64_t a3)
{
  _QWORD *v3;
  FILE **v4;

  switch(a2)
  {
    case 0xFFFFFFFE:
    case 0x1Fu:
      v3 = result + 33;
      break;
    case 0xFFFFFFFF:
    case 0x20u:
      v3 = result + 34;
      break;
    case 0x1Du:
      v3 = result + 31;
      break;
    case 0x1Eu:
      v3 = result + 32;
      break;
    case 0x22u:
      v3 = result + 35;
      break;
    default:
      if (a2 > 0x1C)
      {
        v4 = (FILE **)MEMORY[0x1E0C874E0];
        fprintf((FILE *)*MEMORY[0x1E0C874E0], "libunwind: %s - %s\n", "setRegister", "unsupported arm64 register");
        fflush(*v4);
        abort();
      }
      v3 = &result[a2 + 2];
      break;
  }
  *v3 = a3;
  return result;
}

BOOL libunwind::UnwindCursor<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::validFloatReg(uint64_t a1, int a2)
{
  return (a2 & 0xFFFFFFE0) == 64;
}

double libunwind::UnwindCursor<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::getFloatReg(uint64_t a1, int a2)
{
  return *(double *)(a1 + 8 * a2 - 224);
}

uint64_t libunwind::UnwindCursor<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::setFloatReg(uint64_t result, int a2, double a3)
{
  *(double *)(result + 8 * a2 - 224) = a3;
  return result;
}

uint64_t libunwind::UnwindCursor<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::step()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  unint64_t v3;
  int v4;
  int v5;
  unint64_t v6;
  unint64_t *v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  unint64_t v16;
  unint64_t v22;
  uint64_t SavedRegister;
  __int128 v24;
  __int128 *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  __int128 v33;
  unint64_t **v34;
  uint64_t *v35;
  uint64_t *v36;
  int v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  char v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  FILE **v59;
  FILE *v60;
  const char *v61;
  const char *v62;
  uint64_t *v63;
  uint64_t v64[34];
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _QWORD __dst[34];
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _DWORD v98[2];
  unint64_t *v99;
  uint64_t v100;
  int v101;
  unint64_t *v102;
  _BYTE v103[50];
  unsigned __int8 v104;
  char v105;
  uint64_t v106[7];

  v0 = MEMORY[0x1E0C86820]();
  if (*(_BYTE *)(v0 + 616))
    return 0;
  v2 = v0;
  v3 = *(unsigned int *)(v0 + 592);
  v4 = v3 & 0xF000000;
  if ((v3 & 0xF000000) == 0x2000000)
  {
    v10 = (_QWORD *)(*(_QWORD *)(v0 + 264) + ((v3 >> 8) & 0xFFF0));
    if ((v3 & 1) != 0)
    {
      *(_QWORD *)(v0 + 168) = *v10;
      *(_QWORD *)(v0 + 176) = *(v10 - 1);
      v10 -= 2;
      if ((v3 & 2) == 0)
      {
LABEL_11:
        if ((v3 & 4) == 0)
          goto LABEL_12;
        goto LABEL_26;
      }
    }
    else if ((v3 & 2) == 0)
    {
      goto LABEL_11;
    }
    *(_QWORD *)(v0 + 184) = *v10;
    *(_QWORD *)(v0 + 192) = *(v10 - 1);
    v10 -= 2;
    if ((v3 & 4) == 0)
    {
LABEL_12:
      if ((v3 & 8) == 0)
        goto LABEL_13;
      goto LABEL_27;
    }
LABEL_26:
    *(_QWORD *)(v0 + 200) = *v10;
    *(_QWORD *)(v0 + 208) = *(v10 - 1);
    v10 -= 2;
    if ((v3 & 8) == 0)
    {
LABEL_13:
      if ((v3 & 0x10) == 0)
        goto LABEL_14;
      goto LABEL_28;
    }
LABEL_27:
    *(_QWORD *)(v0 + 216) = *v10;
    *(_QWORD *)(v0 + 224) = *(v10 - 1);
    v10 -= 2;
    if ((v3 & 0x10) == 0)
    {
LABEL_14:
      if ((v3 & 0x100) == 0)
        goto LABEL_15;
      goto LABEL_29;
    }
LABEL_28:
    *(_QWORD *)(v0 + 232) = *v10;
    *(_QWORD *)(v0 + 240) = *(v10 - 1);
    v10 -= 2;
    if ((v3 & 0x100) == 0)
    {
LABEL_15:
      if ((v3 & 0x200) == 0)
        goto LABEL_16;
      goto LABEL_30;
    }
LABEL_29:
    *(_QWORD *)(v0 + 352) = *v10;
    *(_QWORD *)(v0 + 360) = *(v10 - 1);
    v10 -= 2;
    if ((v3 & 0x200) == 0)
    {
LABEL_16:
      if ((v3 & 0x400) == 0)
        goto LABEL_17;
      goto LABEL_31;
    }
LABEL_30:
    *(_QWORD *)(v0 + 368) = *v10;
    *(_QWORD *)(v0 + 376) = *(v10 - 1);
    v10 -= 2;
    if ((v3 & 0x400) == 0)
    {
LABEL_17:
      if ((v3 & 0x800) == 0)
      {
LABEL_19:
        v11 = *(_QWORD *)(v0 + 256);
        *(_QWORD *)(v0 + 264) = v10;
        *(_QWORD *)(v0 + 272) = v11;
        goto LABEL_44;
      }
LABEL_18:
      *(_QWORD *)(v0 + 400) = *v10;
      *(_QWORD *)(v0 + 408) = *(v10 - 1);
      v10 -= 2;
      goto LABEL_19;
    }
LABEL_31:
    *(_QWORD *)(v0 + 384) = *v10;
    *(_QWORD *)(v0 + 392) = *(v10 - 1);
    v10 -= 2;
    if ((v3 & 0x800) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
  if (v4 == 0x4000000)
  {
    v12 = *(_QWORD *)(v0 + 248);
    if ((v3 & 1) != 0)
    {
      *(_QWORD *)(v0 + 168) = *(_QWORD *)(v12 - 8);
      *(_QWORD *)(v0 + 176) = *(_QWORD *)(v12 - 16);
      v13 = (_QWORD *)(v12 - 24);
      if ((v3 & 2) == 0)
        goto LABEL_35;
    }
    else
    {
      v13 = (_QWORD *)(v12 - 8);
      if ((v3 & 2) == 0)
      {
LABEL_35:
        if ((v3 & 4) != 0)
        {
          *(_QWORD *)(v0 + 200) = *v13;
          *(_QWORD *)(v0 + 208) = *(v13 - 1);
          v13 -= 2;
          if ((v3 & 8) == 0)
          {
LABEL_37:
            if ((v3 & 0x10) == 0)
              goto LABEL_38;
            goto LABEL_49;
          }
        }
        else if ((v3 & 8) == 0)
        {
          goto LABEL_37;
        }
        *(_QWORD *)(v0 + 216) = *v13;
        *(_QWORD *)(v0 + 224) = *(v13 - 1);
        v13 -= 2;
        if ((v3 & 0x10) == 0)
        {
LABEL_38:
          if ((v3 & 0x100) == 0)
            goto LABEL_39;
          goto LABEL_50;
        }
LABEL_49:
        *(_QWORD *)(v0 + 232) = *v13;
        *(_QWORD *)(v0 + 240) = *(v13 - 1);
        v13 -= 2;
        if ((v3 & 0x100) == 0)
        {
LABEL_39:
          if ((v3 & 0x200) == 0)
            goto LABEL_40;
          goto LABEL_51;
        }
LABEL_50:
        *(_QWORD *)(v0 + 352) = *v13;
        *(_QWORD *)(v0 + 360) = *(v13 - 1);
        v13 -= 2;
        if ((v3 & 0x200) == 0)
        {
LABEL_40:
          if ((v3 & 0x400) == 0)
            goto LABEL_41;
          goto LABEL_52;
        }
LABEL_51:
        *(_QWORD *)(v0 + 368) = *v13;
        *(_QWORD *)(v0 + 376) = *(v13 - 1);
        v13 -= 2;
        if ((v3 & 0x400) == 0)
        {
LABEL_41:
          if ((v3 & 0x800) == 0)
          {
LABEL_43:
            *(_QWORD *)(v0 + 264) = (v12 & 0xFFFFFFFFFFFFFFLL) + 16;
            *(_QWORD *)(v0 + 248) = *(_QWORD *)(v12 & 0xFFFFFFFFFFFFFFLL);
            *(_QWORD *)(v0 + 272) = *(_QWORD *)((v12 & 0xFFFFFFFFFFFFFFLL) + 8);
            goto LABEL_44;
          }
LABEL_42:
          *(_QWORD *)(v0 + 400) = *v13;
          *(_QWORD *)(v0 + 408) = *(v13 - 1);
          goto LABEL_43;
        }
LABEL_52:
        *(_QWORD *)(v0 + 384) = *v13;
        *(_QWORD *)(v0 + 392) = *(v13 - 1);
        v13 -= 2;
        if ((v3 & 0x800) == 0)
          goto LABEL_43;
        goto LABEL_42;
      }
    }
    *(_QWORD *)(v0 + 184) = *v13;
    *(_QWORD *)(v0 + 192) = *(v13 - 1);
    v13 -= 2;
    goto LABEL_35;
  }
  if (v4 != 50331648)
  {
    v59 = (FILE **)MEMORY[0x1E0C874E0];
    v60 = (FILE *)*MEMORY[0x1E0C874E0];
    v61 = "invalid compact unwind encoding";
    v62 = "stepWithCompactEncoding";
    goto LABEL_110;
  }
  v5 = v1;
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v0 + 24))(v0, 0xFFFFFFFFLL);
  if (libunwind::CFI_Parser<libunwind::LocalAddressSpace>::decodeFDE(*(unsigned int **)(v2 + 600), v106, (uint64_t)v103, 0, v6, v7))
  {
    return 4294960750;
  }
  bzero(v98, 0x1218uLL);
  if ((libunwind::CFI_Parser<libunwind::LocalAddressSpace>::parseFDEInstructions() & 1) == 0)
    return 4294960750;
  v8 = v2 + 16;
  switch(v98[0])
  {
    case 0xFFFFFFFE:
    case 0x1F:
      v9 = (_QWORD *)(v2 + 264);
      goto LABEL_61;
    case 0xFFFFFFFF:
    case 0x20:
      v9 = (_QWORD *)(v2 + 272);
      goto LABEL_61;
    case 0:
      v16 = libunwind::DwarfInstructions<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::evaluateExpression(v99, (uint64_t *)(v2 + 16), 0);
      goto LABEL_62;
    case 0x1D:
      v9 = (_QWORD *)(v2 + 248);
      goto LABEL_61;
    case 0x1E:
      v9 = (_QWORD *)(v2 + 256);
      goto LABEL_61;
    case 0x22:
      v9 = (_QWORD *)(v2 + 280);
      goto LABEL_61;
    default:
      if (v98[0] > 0x1Cu)
      {
LABEL_109:
        v59 = (FILE **)MEMORY[0x1E0C874E0];
        v60 = (FILE *)*MEMORY[0x1E0C874E0];
        v61 = "unsupported arm64 register";
        v62 = "getRegister";
LABEL_110:
        fprintf(v60, "libunwind: %s - %s\n", v62, v61);
        fflush(*v59);
        abort();
      }
      v9 = (_QWORD *)(v8 + 8 * v98[0]);
LABEL_61:
      v16 = *v9 + v98[1];
LABEL_62:
      if (v5)
      {
        if (v105)
        {
          for (_X8 = *(_QWORD *)(v2 + 264) & 0xFFFFFFFFFFFFFFF0; _X8 < v16; _X8 += 16)
            __asm { STG             X8, [X8] }
        }
      }
      memcpy(__dst, (const void *)(v2 + 16), sizeof(__dst));
      v22 = 0;
      SavedRegister = 0;
      v24 = *(_OWORD *)(v2 + 496);
      v25 = (__int128 *)(v2 + 288);
      v94 = *(_OWORD *)(v2 + 480);
      v95 = v24;
      v26 = *(_OWORD *)(v2 + 528);
      v96 = *(_OWORD *)(v2 + 512);
      v97 = v26;
      v27 = *(_OWORD *)(v2 + 432);
      v90 = *(_OWORD *)(v2 + 416);
      v91 = v27;
      v28 = *(_OWORD *)(v2 + 464);
      v92 = *(_OWORD *)(v2 + 448);
      v93 = v28;
      v29 = *(_OWORD *)(v2 + 368);
      v86 = *(_OWORD *)(v2 + 352);
      v87 = v29;
      v30 = *(_OWORD *)(v2 + 400);
      v88 = *(_OWORD *)(v2 + 384);
      v89 = v30;
      v31 = *(_OWORD *)(v2 + 304);
      v82 = *(_OWORD *)(v2 + 288);
      v83 = v31;
      v32 = v104;
      v63 = (uint64_t *)(v8 + 8 * v104);
      v33 = *(_OWORD *)(v2 + 336);
      v34 = (unint64_t **)&v100;
      v84 = *(_OWORD *)(v2 + 320);
      v85 = v33;
      v35 = __dst;
      __dst[31] = v16;
      do
      {
        v37 = *((_DWORD *)v34 - 2);
        if (v37)
        {
          if ((v22 & 0x60) == 0x40)
          {
            if (v37 == 1)
            {
              v40 = 0;
            }
            else
            {
              if (v37 == 6)
              {
                v38 = (uint64_t *)libunwind::DwarfInstructions<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::evaluateExpression(*v34, (uint64_t *)(v2 + 16), v16);
              }
              else
              {
                if (v37 != 2)
                {
                  v59 = (FILE **)MEMORY[0x1E0C874E0];
                  v60 = (FILE *)*MEMORY[0x1E0C874E0];
                  v61 = "unsupported restore location for float register";
                  v62 = "getSavedFloatRegister";
                  goto LABEL_110;
                }
                v38 = (uint64_t *)((char *)*v34 + v16);
              }
              v40 = *v38;
            }
            __dst[(v22 - 64) + 34] = v40;
          }
          else if (v32 == v22)
          {
            SavedRegister = libunwind::DwarfInstructions<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::getSavedRegister((uint64_t *)(v2 + 16), v16, v37, *v34);
          }
          else if (v22 == 34)
          {
            v39 = libunwind::DwarfInstructions<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::getSavedRegister((uint64_t *)(v2 + 16), v16, v37, *v34);
LABEL_83:
            __dst[33] = v39;
          }
          else
          {
            if ((v22 - 64) > 0xFFFFFFE0)
              return 4294960754;
            v39 = libunwind::DwarfInstructions<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::getSavedRegister((uint64_t *)(v2 + 16), v16, v37, *v34);
            v41 = &__dst[31];
            switch((int)v22)
            {
              case 29:
                __dst[29] = v39;
                break;
              case 30:
                __dst[30] = v39;
                break;
              case 31:
                goto LABEL_99;
              case 32:
                v41 = &__dst[32];
                goto LABEL_99;
              case 34:
                goto LABEL_83;
              default:
                v41 = v35;
                if (v22 >= 0x1D)
                {
                  v59 = (FILE **)MEMORY[0x1E0C874E0];
                  v60 = (FILE *)*MEMORY[0x1E0C874E0];
                  v61 = "unsupported arm64 register";
                  v62 = "setRegister";
                  goto LABEL_110;
                }
LABEL_99:
                *v41 = v39;
                break;
            }
          }
        }
        else if (v32 == v22)
        {
          v36 = (uint64_t *)(v2 + 272);
          switch((int)v32)
          {
            case 29:
              v36 = (uint64_t *)(v2 + 248);
              goto LABEL_68;
            case 30:
              v36 = (uint64_t *)(v2 + 256);
              goto LABEL_68;
            case 31:
              v36 = (uint64_t *)(v2 + 264);
              goto LABEL_68;
            case 32:
              goto LABEL_68;
            case 34:
              v36 = (uint64_t *)(v2 + 280);
              goto LABEL_68;
            default:
              v36 = v63;
              if (v32 >= 0x1D)
                goto LABEL_109;
LABEL_68:
              SavedRegister = *v36;
              break;
          }
        }
        ++v22;
        v34 += 2;
        ++v35;
      }
      while (v22 != 96);
      *(_BYTE *)(v2 + 617) = v103[48];
      memcpy(v64, (const void *)(v2 + 16), sizeof(v64));
      v42 = *(_OWORD *)(v2 + 496);
      v77 = *(_OWORD *)(v2 + 480);
      v78 = v42;
      v43 = *(_OWORD *)(v2 + 528);
      v79 = *(_OWORD *)(v2 + 512);
      v80 = v43;
      v44 = *(_OWORD *)(v2 + 432);
      v73 = *(_OWORD *)(v2 + 416);
      v74 = v44;
      v45 = *(_OWORD *)(v2 + 464);
      v75 = *(_OWORD *)(v2 + 448);
      v76 = v45;
      v46 = *(_OWORD *)(v2 + 368);
      v69 = *(_OWORD *)(v2 + 352);
      v70 = v46;
      v47 = *(_OWORD *)(v2 + 400);
      v71 = *(_OWORD *)(v2 + 384);
      v72 = v47;
      v48 = *(_OWORD *)(v2 + 304);
      v65 = *v25;
      v66 = v48;
      v49 = *(_OWORD *)(v2 + 336);
      v67 = *(_OWORD *)(v2 + 320);
      v68 = v49;
      v50 = (char)v102;
      if (v101)
        v50 = libunwind::DwarfInstructions<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::getSavedRegister(v64, v16, v101, v102);
      if ((v50 & 1) != 0 && SavedRegister)
        return 4294960746;
      __dst[32] = SavedRegister;
      memcpy((void *)(v2 + 16), __dst, 0x110uLL);
      v51 = v95;
      *(_OWORD *)(v2 + 480) = v94;
      *(_OWORD *)(v2 + 496) = v51;
      v52 = v97;
      *(_OWORD *)(v2 + 512) = v96;
      *(_OWORD *)(v2 + 528) = v52;
      v53 = v91;
      *(_OWORD *)(v2 + 416) = v90;
      *(_OWORD *)(v2 + 432) = v53;
      v54 = v93;
      *(_OWORD *)(v2 + 448) = v92;
      *(_OWORD *)(v2 + 464) = v54;
      v55 = v87;
      *(_OWORD *)(v2 + 352) = v86;
      *(_OWORD *)(v2 + 368) = v55;
      v56 = v89;
      *(_OWORD *)(v2 + 384) = v88;
      *(_OWORD *)(v2 + 400) = v56;
      v57 = v83;
      *v25 = v82;
      *(_OWORD *)(v2 + 304) = v57;
      v58 = v85;
      *(_OWORD *)(v2 + 320) = v84;
      *(_OWORD *)(v2 + 336) = v58;
      break;
  }
LABEL_44:
  v14 = 1;
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v2 + 104))(v2, 1);
  if (*(_BYTE *)(v2 + 616))
    return 0;
  return v14;
}

__n128 libunwind::UnwindCursor<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::getInfo(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  if (*(_BYTE *)(a1 + 616))
  {
    *(_QWORD *)(a2 + 64) = 0;
    result.n128_u64[0] = 0;
    *(_OWORD *)(a2 + 32) = 0u;
    *(_OWORD *)(a2 + 48) = 0u;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  else
  {
    *(_OWORD *)a2 = *(_OWORD *)(a1 + 544);
    result = *(__n128 *)(a1 + 560);
    v3 = *(_OWORD *)(a1 + 576);
    v4 = *(_OWORD *)(a1 + 592);
    *(_QWORD *)(a2 + 64) = *(_QWORD *)(a1 + 608);
    *(_OWORD *)(a2 + 32) = v3;
    *(_OWORD *)(a2 + 48) = v4;
    *(__n128 *)(a2 + 16) = result;
  }
  return result;
}

uint64_t libunwind::UnwindCursor<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::jumpto(uint64_t a1)
{
  return __libunwind_Registers_arm64_jumpto(a1 + 16);
}

uint64_t libunwind::UnwindCursor<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::isSignalFrame(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 617);
}

uint64_t libunwind::UnwindCursor<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::getFunctionName(uint64_t a1, char *a2, size_t a3, _QWORD *a4)
{
  const void *v7;
  BOOL v8;
  uint64_t v9;
  Dl_info v11;

  v7 = (const void *)(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 24))(a1, 0xFFFFFFFFLL);
  if (dladdr(v7, &v11))
    v8 = v11.dli_sname == 0;
  else
    v8 = 1;
  v9 = !v8;
  if (!v8)
  {
    strlcpy(a2, v11.dli_sname, a3);
    *a4 = (_BYTE *)v7 - (char *)v11.dli_saddr;
  }
  return v9;
}

const char *libunwind::UnwindCursor<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::getRegisterName(uint64_t a1, int a2)
{
  if ((a2 + 2) > 0x61)
    return "unknown register";
  else
    return (&off_1EA952660)[a2 + 2];
}

uint64_t libunwind::DwarfInstructions<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::evaluateExpression(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t ULEB128;
  unint64_t *v6;
  unint64_t *v7;
  uint64_t *v8;
  uint64_t v9;
  unint64_t *v10;
  int v11;
  uint64_t *v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  char v16;
  unsigned int v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  unint64_t *v22;
  uint64_t v23;
  unsigned int v24;
  char v25;
  unsigned int v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t *v38;
  _QWORD *v40;
  _QWORD *v41;
  _QWORD *v42;
  unint64_t v43;
  _QWORD *v44;
  unint64_t v45;
  _QWORD *v46;
  unint64_t v47;
  _QWORD *v48;
  unint64_t v49;
  unsigned int v50;
  uint64_t v51;
  unint64_t *v52;
  unsigned int v53;
  char v54;
  unsigned int v55;
  unsigned int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t *v60;
  uint64_t v61;
  _QWORD *v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  _QWORD *v71;
  uint64_t v72;
  _QWORD *v73;
  uint64_t v74;
  _QWORD *v75;
  unint64_t v76;
  _QWORD *v77;
  uint64_t v78;
  _QWORD *v79;
  _QWORD *v80;
  unsigned int v81;
  FILE **v83;
  FILE *v84;
  const char *v85;
  const char *v86;
  unint64_t *v87;
  _QWORD v88[100];

  v88[99] = *MEMORY[0x1E0C874D8];
  v87 = a1;
  ULEB128 = libunwind::LocalAddressSpace::getULEB128(&v87, (unint64_t *)((char *)a1 + 20));
  v6 = v87;
  v7 = (unint64_t *)((char *)v87 + ULEB128);
  v88[0] = a3;
  if (v87 < (unint64_t *)((char *)v87 + ULEB128))
  {
    v8 = v88;
    while (1)
    {
      v10 = (unint64_t *)((char *)v6 + 1);
      v11 = *(unsigned __int8 *)v6;
      v87 = (unint64_t *)((char *)v6 + 1);
      switch(v11)
      {
        case 3:
        case 14:
        case 15:
          v9 = *(unint64_t *)((char *)v6 + 1);
          v22 = (unint64_t *)((char *)v6 + 9);
          goto LABEL_66;
        case 6:
          v60 = (uint64_t *)*v8;
LABEL_63:
          *v8 = *v60;
          goto LABEL_5;
        case 8:
          v9 = *((unsigned __int8 *)v6 + 1);
          goto LABEL_29;
        case 9:
          v9 = *((char *)v6 + 1);
LABEL_29:
          v22 = (unint64_t *)((char *)v6 + 2);
          goto LABEL_66;
        case 10:
          v9 = *(unsigned __int16 *)((char *)v6 + 1);
          goto LABEL_65;
        case 11:
          v9 = *(__int16 *)((char *)v6 + 1);
LABEL_65:
          v22 = (unint64_t *)((char *)v6 + 3);
          goto LABEL_66;
        case 12:
          v9 = *(unsigned int *)((char *)v6 + 1);
          v22 = (unint64_t *)((char *)v6 + 5);
          goto LABEL_66;
        case 13:
          v9 = *(int *)((char *)v6 + 1);
          v22 = (unint64_t *)((char *)v6 + 5);
LABEL_66:
          v87 = v22;
          goto LABEL_4;
        case 16:
          v8[1] = libunwind::LocalAddressSpace::getULEB128(&v87, v7);
          ++v8;
          goto LABEL_5;
        case 17:
          v23 = 0;
          v24 = -7;
          do
          {
            if (v10 == v7)
              goto LABEL_106;
            v25 = v24;
            v24 += 7;
            v27 = *(unsigned __int8 *)v10;
            v10 = (unint64_t *)((char *)v10 + 1);
            v26 = v27;
            v23 |= (unint64_t)(v27 & 0x7F) << v24;
          }
          while ((v27 & 0x80) != 0);
          v28 = -1 << (v25 + 14);
          if (((v24 < 0x39) & (v26 >> 6)) != 0)
            v29 = v28;
          else
            v29 = 0;
          v87 = v10;
          v8[1] = v23 | v29;
          ++v8;
          goto LABEL_5;
        case 18:
          v9 = *v8;
          goto LABEL_4;
        case 19:
          --v8;
          goto LABEL_5;
        case 20:
          v9 = *(v8 - 1);
          goto LABEL_4;
        case 21:
          v61 = *((unsigned __int8 *)v6 + 1);
          v87 = (unint64_t *)((char *)v6 + 2);
          v12 = &v8[-v61];
          goto LABEL_11;
        case 22:
          *(int8x16_t *)(v8 - 1) = vextq_s8(*(int8x16_t *)(v8 - 1), *(int8x16_t *)(v8 - 1), 8uLL);
          goto LABEL_5;
        case 23:
          v62 = (_QWORD *)*v8;
          *(_OWORD *)(v8 - 1) = *((_OWORD *)v8 - 1);
          *(v8 - 2) = (uint64_t)v62;
          goto LABEL_5;
        case 24:
          *(v8 - 1) = *(_QWORD *)*v8;
          --v8;
          goto LABEL_5;
        case 25:
          v30 = *v8;
          if (*v8 < 0)
            goto LABEL_77;
          goto LABEL_5;
        case 26:
          v31 = *v8;
          v32 = *--v8;
          *v8 = v32 & v31;
          goto LABEL_5;
        case 27:
          v63 = *v8;
          v64 = *--v8;
          *v8 = v64 / v63;
          goto LABEL_5;
        case 28:
          v65 = (_QWORD *)*v8;
          v66 = *--v8;
          *v8 = v66 - (_QWORD)v65;
          goto LABEL_5;
        case 29:
          v33 = *v8;
          v34 = *--v8;
          *v8 = v34 % v33;
          goto LABEL_5;
        case 30:
          v67 = *v8;
          v68 = *--v8;
          *v8 = v68 * v67;
          goto LABEL_5;
        case 31:
          v30 = *v8;
LABEL_77:
          *v8 = -v30;
          goto LABEL_5;
        case 32:
          *v8 = ~*v8;
          goto LABEL_5;
        case 33:
          v69 = *v8;
          v70 = *--v8;
          *v8 = v70 | v69;
          goto LABEL_5;
        case 34:
          v71 = (_QWORD *)*v8;
          v72 = *--v8;
          *v8 = (uint64_t)v71 + v72;
          goto LABEL_5;
        case 35:
          *v8 += libunwind::LocalAddressSpace::getULEB128(&v87, v7);
          goto LABEL_5;
        case 36:
          v73 = (_QWORD *)*v8;
          v74 = *--v8;
          *v8 = v74 << (char)v73;
          goto LABEL_5;
        case 37:
          v75 = (_QWORD *)*v8;
          v76 = *--v8;
          *v8 = v76 >> (char)v75;
          goto LABEL_5;
        case 38:
          v77 = (_QWORD *)*v8;
          v78 = *--v8;
          *v8 = v78 >> (char)v77;
          goto LABEL_5;
        case 39:
          v35 = *v8;
          v36 = *--v8;
          *v8 = v36 ^ v35;
          goto LABEL_5;
        case 40:
          v37 = *(__int16 *)((char *)v6 + 1);
          v38 = (unint64_t *)((char *)v6 + 3);
          v87 = v38;
          if (*v8--)
            v87 = (unint64_t *)((char *)v38 + v37);
          goto LABEL_5;
        case 41:
          v40 = (_QWORD *)*v8;
          v41 = (_QWORD *)*--v8;
          *v8 = v41 == v40;
          goto LABEL_5;
        case 42:
          v42 = (_QWORD *)*v8;
          v43 = *--v8;
          *v8 = v43 >= (unint64_t)v42;
          goto LABEL_5;
        case 43:
          v44 = (_QWORD *)*v8;
          v45 = *--v8;
          *v8 = v45 > (unint64_t)v44;
          goto LABEL_5;
        case 44:
          v46 = (_QWORD *)*v8;
          v47 = *--v8;
          *v8 = v47 <= (unint64_t)v46;
          goto LABEL_5;
        case 45:
          v48 = (_QWORD *)*v8;
          v49 = *--v8;
          *v8 = v49 < (unint64_t)v48;
          goto LABEL_5;
        case 46:
          v79 = (_QWORD *)*v8;
          v80 = (_QWORD *)*--v8;
          *v8 = v80 != v79;
          goto LABEL_5;
        case 47:
          v87 = (unint64_t *)((char *)v6 + *(__int16 *)((char *)v6 + 1) + 3);
          goto LABEL_5;
        case 48:
        case 49:
        case 50:
        case 51:
        case 52:
        case 53:
        case 54:
        case 55:
        case 56:
        case 57:
        case 58:
        case 59:
        case 60:
        case 61:
        case 62:
        case 63:
        case 64:
        case 65:
        case 66:
        case 67:
        case 68:
        case 69:
        case 70:
        case 71:
        case 72:
        case 73:
        case 74:
        case 75:
        case 76:
        case 77:
        case 78:
        case 79:
          v9 = (v11 - 48);
          goto LABEL_4;
        case 80:
        case 81:
        case 82:
        case 83:
        case 84:
        case 85:
        case 86:
        case 87:
        case 88:
        case 89:
        case 90:
        case 91:
        case 92:
        case 93:
        case 94:
        case 95:
        case 96:
        case 97:
        case 98:
        case 99:
        case 100:
        case 101:
        case 102:
        case 103:
        case 104:
        case 105:
        case 106:
        case 107:
        case 108:
        case 109:
        case 110:
        case 111:
          v12 = a2 + 31;
          if (v11 != 111)
          {
            v12 = a2 + 30;
            if (v11 != 110)
            {
              v12 = &a2[v11 - 80];
              if (v11 == 109)
                v12 = a2 + 29;
            }
          }
          goto LABEL_11;
        case 112:
        case 113:
        case 114:
        case 115:
        case 116:
        case 117:
        case 118:
        case 119:
        case 120:
        case 121:
        case 122:
        case 123:
        case 124:
        case 125:
        case 126:
        case 127:
        case 128:
        case 129:
        case 130:
        case 131:
        case 132:
        case 133:
        case 134:
        case 135:
        case 136:
        case 137:
        case 138:
        case 139:
        case 140:
        case 141:
        case 142:
        case 143:
          v13 = 0;
          v14 = v11 - 112;
          v15 = -7;
          do
          {
            if (v10 == v7)
              goto LABEL_106;
            v16 = v15;
            v15 += 7;
            v18 = *(unsigned __int8 *)v10;
            v10 = (unint64_t *)((char *)v10 + 1);
            v17 = v18;
            v13 |= (unint64_t)(v18 & 0x7F) << v15;
          }
          while ((v18 & 0x80) != 0);
          v19 = -1 << (v16 + 14);
          if (((v15 < 0x39) & (v17 >> 6)) != 0)
            v20 = v19;
          else
            v20 = 0;
          v87 = v10;
          v21 = a2 + 32;
          switch(v11)
          {
            case 110:
            case 143:
              v21 = a2 + 31;
              goto LABEL_25;
            case 111:
            case 144:
              goto LABEL_25;
            case 141:
              v21 = a2 + 29;
              goto LABEL_25;
            case 142:
              v21 = a2 + 30;
              goto LABEL_25;
            case 146:
              v21 = a2 + 33;
              goto LABEL_25;
            default:
              if (v14 > 0x1C)
                goto LABEL_108;
              v21 = &a2[v14];
LABEL_25:
              v9 = *v21 + (v13 | v20);
              break;
          }
          goto LABEL_4;
        case 144:
          v81 = libunwind::LocalAddressSpace::getULEB128(&v87, v7);
          v12 = a2 + 32;
          switch(v81)
          {
            case 0xFFFFFFFE:
            case 0x1Fu:
              v12 = a2 + 31;
              break;
            case 0xFFFFFFFF:
            case 0x20u:
              break;
            case 0x1Du:
              v12 = a2 + 29;
              break;
            case 0x1Eu:
              v12 = a2 + 30;
              break;
            case 0x22u:
              v12 = a2 + 33;
              break;
            default:
              if (v81 > 0x1C)
                goto LABEL_108;
              v12 = &a2[v81];
              break;
          }
LABEL_11:
          v9 = *v12;
          goto LABEL_4;
        case 145:
          v83 = (FILE **)MEMORY[0x1E0C874E0];
          v84 = (FILE *)*MEMORY[0x1E0C874E0];
          v85 = "DW_OP_fbreg not implemented";
          goto LABEL_113;
        case 146:
          v50 = libunwind::LocalAddressSpace::getULEB128(&v87, v7);
          v51 = 0;
          v52 = v87;
          v53 = -7;
          break;
        case 147:
          v83 = (FILE **)MEMORY[0x1E0C874E0];
          v84 = (FILE *)*MEMORY[0x1E0C874E0];
          v85 = "DW_OP_piece not implemented";
          goto LABEL_113;
        case 148:
          v60 = (uint64_t *)*v8;
          v87 = (unint64_t *)((char *)v6 + 2);
          switch(*((_BYTE *)v6 + 1))
          {
            case 1:
              *v8 = *(unsigned __int8 *)v60;
              goto LABEL_5;
            case 2:
              *v8 = *(unsigned __int16 *)v60;
              goto LABEL_5;
            case 4:
              *v8 = *(unsigned int *)v60;
              goto LABEL_5;
            case 8:
              goto LABEL_63;
            default:
              v83 = (FILE **)MEMORY[0x1E0C874E0];
              v84 = (FILE *)*MEMORY[0x1E0C874E0];
              v85 = "DW_OP_deref_size with bad size";
              goto LABEL_113;
          }
        default:
          v83 = (FILE **)MEMORY[0x1E0C874E0];
          v84 = (FILE *)*MEMORY[0x1E0C874E0];
          v85 = "DWARF opcode not implemented";
LABEL_113:
          v86 = "evaluateExpression";
          goto LABEL_107;
      }
      do
      {
        if (v52 == v7)
        {
LABEL_106:
          v83 = (FILE **)MEMORY[0x1E0C874E0];
          v84 = (FILE *)*MEMORY[0x1E0C874E0];
          v85 = "truncated sleb128 expression";
          v86 = "getSLEB128";
          goto LABEL_107;
        }
        v54 = v53;
        v53 += 7;
        v56 = *(unsigned __int8 *)v52;
        v52 = (unint64_t *)((char *)v52 + 1);
        v55 = v56;
        v51 |= (unint64_t)(v56 & 0x7F) << v53;
      }
      while ((v56 & 0x80) != 0);
      v57 = -1 << (v54 + 14);
      if (((v53 < 0x39) & (v55 >> 6)) != 0)
        v58 = v57;
      else
        v58 = 0;
      v87 = v52;
      v59 = a2 + 32;
      switch(v50)
      {
        case 0xFFFFFFFE:
        case 0x1Fu:
          v59 = a2 + 31;
          goto LABEL_103;
        case 0xFFFFFFFF:
        case 0x20u:
          goto LABEL_103;
        case 0x1Du:
          v59 = a2 + 29;
          goto LABEL_103;
        case 0x1Eu:
          v59 = a2 + 30;
          goto LABEL_103;
        case 0x22u:
          v59 = a2 + 33;
          goto LABEL_103;
        default:
          if (v50 > 0x1C)
          {
LABEL_108:
            v83 = (FILE **)MEMORY[0x1E0C874E0];
            v84 = (FILE *)*MEMORY[0x1E0C874E0];
            v85 = "unsupported arm64 register";
            v86 = "getRegister";
LABEL_107:
            fprintf(v84, "libunwind: %s - %s\n", v86, v85);
            fflush(*v83);
            abort();
          }
          v59 = &a2[v50];
LABEL_103:
          v9 = *v59 + (v51 | v58);
LABEL_4:
          v8[1] = v9;
          ++v8;
LABEL_5:
          v6 = v87;
          if (v87 >= v7)
            return *v8;
          break;
      }
    }
  }
  return a3;
}

uint64_t libunwind::DwarfInstructions<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::getSavedRegister(uint64_t *a1, uint64_t a2, int a3, unint64_t *a4)
{
  uint64_t result;
  FILE **v7;
  FILE *v8;
  const char *v9;
  const char *v10;

  result = 0;
  switch(a3)
  {
    case 1:
      return result;
    case 2:
    case 3:
      return *(unint64_t *)((char *)a4 + a2);
    case 5:
      switch((int)a4)
      {
        case -2:
        case 31:
          return a1[31];
        case -1:
        case 32:
          return a1[32];
        case 29:
          return a1[29];
        case 30:
          return a1[30];
        case 34:
          return a1[33];
        default:
          if (a4 > 0x1C)
          {
            v7 = (FILE **)MEMORY[0x1E0C874E0];
            v8 = (FILE *)*MEMORY[0x1E0C874E0];
            v9 = "unsupported arm64 register";
            v10 = "getRegister";
LABEL_15:
            fprintf(v8, "libunwind: %s - %s\n", v10, v9);
            fflush(*v7);
            abort();
          }
          return a1[a4];
      }
    case 6:
      return *(_QWORD *)libunwind::DwarfInstructions<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::evaluateExpression(a4, a1, a2);
    case 7:
      return libunwind::DwarfInstructions<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::evaluateExpression(a4, a1, a2);
    default:
      v7 = (FILE **)MEMORY[0x1E0C874E0];
      v8 = (FILE *)*MEMORY[0x1E0C874E0];
      v9 = "unsupported restore location for register";
      v10 = "getSavedRegister";
      goto LABEL_15;
  }
}

int unw_get_reg(unw_cursor_t *a1, unw_regnum_t a2, unw_word_t *a3)
{
  uint64_t v4;
  unw_word_t v6;
  int result;

  v4 = *(_QWORD *)&a2;
  if (!(*(unsigned int (**)(unw_cursor_t *))(a1->data[0] + 16))(a1))
    return -6542;
  v6 = (*(uint64_t (**)(unw_cursor_t *, uint64_t))(a1->data[0] + 24))(a1, v4);
  result = 0;
  *a3 = v6;
  return result;
}

int unw_set_reg(unw_cursor_t *a1, unw_regnum_t a2, unw_word_t a3)
{
  uint64_t v4;
  uint64_t v7;
  _BYTE v8[32];
  uint64_t v9;

  v4 = *(_QWORD *)&a2;
  if (!(*(unsigned int (**)(unw_cursor_t *))(a1->data[0] + 16))(a1))
    return -6542;
  if ((_DWORD)v4 == -1)
  {
    (*(void (**)(unw_cursor_t *, _BYTE *))(a1->data[0] + 72))(a1, v8);
    v7 = (*(uint64_t (**)(unw_cursor_t *, uint64_t))(a1->data[0] + 24))(a1, 4294967294);
    if (v9)
      (*(void (**)(unw_cursor_t *, uint64_t, uint64_t))(a1->data[0] + 32))(a1, 4294967294, v9 + v7);
    (*(void (**)(unw_cursor_t *, uint64_t, unw_word_t))(a1->data[0] + 32))(a1, 0xFFFFFFFFLL, a3);
    (*(void (**)(unw_cursor_t *, _QWORD))(a1->data[0] + 104))(a1, 0);
  }
  else
  {
    (*(void (**)(unw_cursor_t *, uint64_t, unw_word_t))(a1->data[0] + 32))(a1, v4, a3);
  }
  return 0;
}

int unw_get_fpreg(unw_cursor_t *a1, unw_regnum_t a2, unw_fpreg_t *a3)
{
  uint64_t v4;
  unw_fpreg_t v6;
  int result;

  v4 = *(_QWORD *)&a2;
  if (!(*(unsigned int (**)(unw_cursor_t *))(a1->data[0] + 40))(a1))
    return -6542;
  v6 = (*(double (**)(unw_cursor_t *, uint64_t))(a1->data[0] + 48))(a1, v4);
  result = 0;
  *a3 = v6;
  return result;
}

int unw_set_fpreg(unw_cursor_t *a1, unw_regnum_t a2, unw_fpreg_t a3)
{
  uint64_t v4;

  v4 = *(_QWORD *)&a2;
  if (!(*(unsigned int (**)(unw_cursor_t *))(a1->data[0] + 40))(a1))
    return -6542;
  (*(void (**)(unw_cursor_t *, uint64_t, unw_fpreg_t))(a1->data[0] + 56))(a1, v4, a3);
  return 0;
}

int unw_step(unw_cursor_t *a1)
{
  return (*(uint64_t (**)(unw_cursor_t *, _QWORD))(a1->data[0] + 64))(a1, 0);
}

int unw_get_proc_info(unw_cursor_t *a1, unw_proc_info_t *a2)
{
  (*(void (**)(unw_cursor_t *))(a1->data[0] + 72))(a1);
  if (a2->end_ip)
    return 0;
  else
    return -6549;
}

int unw_resume(unw_cursor_t *a1)
{
  (*(void (**)(unw_cursor_t *))(a1->data[0] + 80))(a1);
  return -6540;
}

int unw_get_proc_name(unw_cursor_t *a1, char *a2, size_t a3, unw_word_t *a4)
{
  if ((*(unsigned int (**)(unw_cursor_t *, char *, size_t, unw_word_t *))(a1->data[0] + 96))(a1, a2, a3, a4))
    return 0;
  else
    return -6540;
}

int unw_is_fpreg(unw_cursor_t *a1, unw_regnum_t a2)
{
  return (*(uint64_t (**)(unw_cursor_t *, _QWORD))(a1->data[0] + 40))(a1, *(_QWORD *)&a2);
}

const char *__cdecl unw_regname(unw_cursor_t *a1, unw_regnum_t a2)
{
  return (const char *)(*(uint64_t (**)(unw_cursor_t *, _QWORD))(a1->data[0] + 112))(a1, *(_QWORD *)&a2);
}

int unw_is_signal_frame(unw_cursor_t *a1)
{
  return (*(uint64_t (**)(unw_cursor_t *))(a1->data[0] + 88))(a1);
}

uint64_t unw_iterate_dwarf_unwind_cache(void (*a1)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  __int128 *i;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  pthread_rwlock_wrlock(&libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_lock);
  for (i = libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_buffer[0];
        i < libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_bufferUsed;
        i += 2)
  {
    v3 = *((_QWORD *)i + 2);
    v4 = *((_QWORD *)i + 3);
    v6 = *(_QWORD *)i;
    v5 = *((_QWORD *)i + 1);
    a1(v5, v3, v4, v6);
  }
  return pthread_rwlock_unlock(&libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_lock);
}

const char *__unw_add_dynamic_fde(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, unint64_t *a6)
{
  const char *result;
  _BYTE v7[56];
  uint64_t v8[6];

  result = libunwind::CFI_Parser<libunwind::LocalAddressSpace>::decodeFDE(a1, v8, (uint64_t)v7, 0, a5, a6);
  if (!result)
    return (const char *)libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::add(v8[0], v8[3], v8[4], v8[0]);
  return result;
}

uint64_t __unw_remove_dynamic_fde(uint64_t a1)
{
  __int128 *v2;
  __int128 *v3;
  __int128 *v4;
  __int128 v5;

  pthread_rwlock_wrlock(&libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_lock);
  v2 = libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_buffer[0];
  v3 = libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_bufferUsed;
  if (libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_buffer[0] >= libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_bufferUsed)
  {
    v4 = libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_buffer[0];
  }
  else
  {
    v4 = libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_buffer[0];
    do
    {
      if (*(_QWORD *)v2 != a1)
      {
        if (v2 != v4)
        {
          v5 = v2[1];
          *v4 = *v2;
          v4[1] = v5;
        }
        v4 += 2;
      }
      v2 += 2;
    }
    while (v2 < v3);
  }
  libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_bufferUsed = v4;
  return pthread_rwlock_unlock(&libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_lock);
}

unsigned int *__unw_add_dynamic_eh_frame_section(unsigned int *result, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, unint64_t *a6)
{
  uint64_t v6;
  unsigned int *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10[5];
  _BYTE v11[8];
  uint64_t v12;

  if (*result)
  {
    v6 = (uint64_t)result;
    v7 = result;
    do
    {
      if (libunwind::CFI_Parser<libunwind::LocalAddressSpace>::decodeFDE(v7, &v9, (uint64_t)v11, 1, a5, a6))
      {
        result = (unsigned int *)libunwind::CFI_Parser<libunwind::LocalAddressSpace>::parseCIE(v7, (uint64_t)v11);
        v8 = &v12;
        if (result)
          return result;
      }
      else
      {
        result = (unsigned int *)libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::add(v6, v10[2], v10[3], v9);
        v8 = v10;
      }
      v7 = (unsigned int *)((char *)v7 + *v8);
    }
    while (*v7);
  }
  return result;
}

uint64_t __unw_remove_dynamic_eh_frame_section(uint64_t a1)
{
  __int128 *v2;
  __int128 *v3;
  __int128 *v4;
  __int128 v5;

  pthread_rwlock_wrlock(&libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_lock);
  v2 = libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_buffer[0];
  v3 = libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_bufferUsed;
  if (libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_buffer[0] >= libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_bufferUsed)
  {
    v4 = libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_buffer[0];
  }
  else
  {
    v4 = libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_buffer[0];
    do
    {
      if (*(_QWORD *)v2 != a1)
      {
        if (v2 != v4)
        {
          v5 = v2[1];
          *v4 = *v2;
          v4[1] = v5;
        }
        v4 += 2;
      }
      v2 += 2;
    }
    while (v2 < v3);
  }
  libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_bufferUsed = v4;
  return pthread_rwlock_unlock(&libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_lock);
}

BOOL libunwind::findDynamicUnwindSections(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int v5;
  _BOOL8 v6;

  pthread_rwlock_rdlock(&libunwind::findDynamicUnwindSectionsLock);
  if (libunwind::numDynamicUnwindSectionsFinders)
  {
    v4 = 0;
    while (1)
    {
      v5 = (*((uint64_t (**)(uint64_t, uint64_t))&libunwind::dynamicUnwindSectionsFinders + v4))(a1, a2);
      v6 = v5 != 0;
      if (v5)
        break;
      if (++v4 == libunwind::numDynamicUnwindSectionsFinders)
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    v6 = 0;
  }
  pthread_rwlock_unlock(&libunwind::findDynamicUnwindSectionsLock);
  return v6;
}

uint64_t __unw_add_find_dynamic_unwind_sections(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  __int128 *v4;
  uint64_t v5;

  pthread_rwlock_wrlock(&libunwind::findDynamicUnwindSectionsLock);
  v2 = libunwind::numDynamicUnwindSectionsFinders;
  if (libunwind::numDynamicUnwindSectionsFinders)
  {
    if (libunwind::numDynamicUnwindSectionsFinders == 8)
    {
      v3 = 4294960755;
    }
    else
    {
      v4 = &libunwind::dynamicUnwindSectionsFinders;
      v5 = libunwind::numDynamicUnwindSectionsFinders;
      while (*(_QWORD *)v4 != a1)
      {
        v4 = (__int128 *)((char *)v4 + 8);
        if (!--v5)
          goto LABEL_7;
      }
      v3 = 4294960749;
    }
  }
  else
  {
LABEL_7:
    v3 = 0;
    ++libunwind::numDynamicUnwindSectionsFinders;
    *((_QWORD *)&libunwind::dynamicUnwindSectionsFinders + v2) = a1;
  }
  pthread_rwlock_unlock(&libunwind::findDynamicUnwindSectionsLock);
  return v3;
}

uint64_t __unw_remove_find_dynamic_unwind_sections(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _OWORD *v4;
  uint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  __int128 v11;
  _QWORD *v12;
  uint64_t v13;

  pthread_rwlock_wrlock(&libunwind::findDynamicUnwindSectionsLock);
  v2 = libunwind::numDynamicUnwindSectionsFinders;
  if (libunwind::numDynamicUnwindSectionsFinders)
  {
    v3 = 0;
    v4 = &unk_1F044CFF0;
    while (*((_QWORD *)v4 - 2) != a1)
    {
      ++v3;
      v4 = (_OWORD *)((char *)v4 + 8);
      if (libunwind::numDynamicUnwindSectionsFinders == v3)
        goto LABEL_7;
    }
    if (libunwind::numDynamicUnwindSectionsFinders != v3)
    {
      v7 = libunwind::numDynamicUnwindSectionsFinders - 1;
      v8 = libunwind::numDynamicUnwindSectionsFinders - 1 - v3;
      if (libunwind::numDynamicUnwindSectionsFinders - 1 != v3)
      {
        if (v8 > 3)
        {
          v9 = v8 & 0xFFFFFFFFFFFFFFFCLL;
          v10 = (~v3 + libunwind::numDynamicUnwindSectionsFinders) & 0xFFFFFFFFFFFFFFFCLL;
          do
          {
            v11 = *(_OWORD *)((char *)v4 + 8);
            *(v4 - 1) = *(_OWORD *)((char *)v4 - 8);
            *v4 = v11;
            v4 += 2;
            v10 -= 4;
          }
          while (v10);
          if (v8 == v9)
            goto LABEL_17;
          v3 += v9;
        }
        v12 = (_QWORD *)&libunwind::dynamicUnwindSectionsFinders + v3 + 1;
        v13 = ~v3 + v2;
        do
        {
          *(v12 - 1) = *v12;
          ++v12;
          --v13;
        }
        while (v13);
      }
LABEL_17:
      v5 = 0;
      libunwind::numDynamicUnwindSectionsFinders = v7;
      *((_QWORD *)&libunwind::dynamicUnwindSectionsFinders + v7) = 0;
      goto LABEL_8;
    }
  }
LABEL_7:
  v5 = 4294960749;
LABEL_8:
  pthread_rwlock_unlock(&libunwind::findDynamicUnwindSectionsLock);
  return v5;
}

_Unwind_Reason_Code _Unwind_RaiseException(_Unwind_Exception *exception_object)
{
  int v2;
  int v3;
  uintptr_t v4;
  _QWORD v6[2];
  _BYTE v7[272];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[26];
  unw_context_t __src;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;

  memset(&__src, 0, 512);
  unw_getcontext(&__src);
  exception_object->private_1 = 0;
  exception_object->private_2 = 0;
  v6[0] = off_1EA9525E8;
  v6[1] = &libunwind::LocalAddressSpace::sThisAddressSpace;
  memcpy(v7, &__src, sizeof(v7));
  v20 = *(_OWORD *)&__src.data[58];
  v21 = *(_OWORD *)&__src.data[60];
  v22 = *(_OWORD *)&__src.data[62];
  v23 = *(_OWORD *)&__src.data[64];
  v16 = *(_OWORD *)&__src.data[50];
  v17 = *(_OWORD *)&__src.data[52];
  v18 = *(_OWORD *)&__src.data[54];
  v19 = *(_OWORD *)&__src.data[56];
  v12 = *(_OWORD *)&__src.data[42];
  v13 = *(_OWORD *)&__src.data[44];
  v14 = *(_OWORD *)&__src.data[46];
  v15 = *(_OWORD *)&__src.data[48];
  v8 = *(_OWORD *)&__src.data[34];
  v9 = *(_OWORD *)&__src.data[36];
  v10 = *(_OWORD *)&__src.data[38];
  v11 = *(_OWORD *)&__src.data[40];
  v26 = 0u;
  memset(v27, 0, sizeof(v27));
  v24 = 0u;
  v25 = 0u;
  libunwind::UnwindCursor<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::setInfoBasedOnIPRegister();
  while (1)
  {
    v2 = (*(uint64_t (**)(_QWORD *, _QWORD))(v6[0] + 64))(v6, 0);
    if (!v2)
      return 5;
    if ((v2 & 0x80000000) == 0)
    {
      v33 = 0;
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      (*(void (**)(_QWORD *, __int128 *))(v6[0] + 72))(v6, &v29);
      if (*((_QWORD *)&v29 + 1))
        continue;
    }
    return 3;
    if (*((_QWORD *)&v30 + 1))
    {
      v3 = (*((uint64_t (**)(uint64_t, uint64_t, _Unwind_Exception_Class, _Unwind_Exception *, _QWORD *))&v30 + 1))(1, 1, exception_object->exception_class, exception_object, v6);
      if (v3 != 8)
        break;
    }
  }
  if (v3 != 6)
    return 3;
  if ((*(unsigned int (**)(_QWORD *, uint64_t))(v6[0] + 16))(v6, 4294967294))
    v4 = (*(uint64_t (**)(_QWORD *, uint64_t))(v6[0] + 24))(v6, 4294967294);
  else
    v4 = 0;
  exception_object->private_2 = v4;
  return unwind_phase2(&__src, (uint64_t)v6, exception_object);
}

uint64_t unwind_phase2(void *__src, uint64_t a2, _QWORD *a3)
{
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  FILE **v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  *(_QWORD *)a2 = off_1EA9525E8;
  *(_QWORD *)(a2 + 8) = &libunwind::LocalAddressSpace::sThisAddressSpace;
  memcpy((void *)(a2 + 16), __src, 0x110uLL);
  v6 = *((_OWORD *)__src + 20);
  v8 = *((_OWORD *)__src + 17);
  v7 = *((_OWORD *)__src + 18);
  *(_OWORD *)(a2 + 320) = *((_OWORD *)__src + 19);
  *(_OWORD *)(a2 + 336) = v6;
  *(_OWORD *)(a2 + 288) = v8;
  *(_OWORD *)(a2 + 304) = v7;
  v9 = *((_OWORD *)__src + 24);
  v11 = *((_OWORD *)__src + 21);
  v10 = *((_OWORD *)__src + 22);
  *(_OWORD *)(a2 + 384) = *((_OWORD *)__src + 23);
  *(_OWORD *)(a2 + 400) = v9;
  *(_OWORD *)(a2 + 352) = v11;
  *(_OWORD *)(a2 + 368) = v10;
  v12 = *((_OWORD *)__src + 28);
  v14 = *((_OWORD *)__src + 25);
  v13 = *((_OWORD *)__src + 26);
  *(_OWORD *)(a2 + 448) = *((_OWORD *)__src + 27);
  *(_OWORD *)(a2 + 464) = v12;
  *(_OWORD *)(a2 + 416) = v14;
  *(_OWORD *)(a2 + 432) = v13;
  v15 = *((_OWORD *)__src + 32);
  v17 = *((_OWORD *)__src + 29);
  v16 = *((_OWORD *)__src + 30);
  *(_OWORD *)(a2 + 512) = *((_OWORD *)__src + 31);
  *(_OWORD *)(a2 + 528) = v15;
  *(_OWORD *)(a2 + 480) = v17;
  *(_OWORD *)(a2 + 496) = v16;
  *(_OWORD *)(a2 + 602) = 0u;
  *(_OWORD *)(a2 + 576) = 0u;
  *(_OWORD *)(a2 + 592) = 0u;
  *(_OWORD *)(a2 + 544) = 0u;
  *(_OWORD *)(a2 + 560) = 0u;
  libunwind::UnwindCursor<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::setInfoBasedOnIPRegister();
  while (1)
  {
    v18 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a2 + 64))(a2, 1);
    if (!v18)
      break;
    if (v18 < 0)
      return 2;
    v28 = 0;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v19 = 0;
    if ((*(unsigned int (**)(uint64_t, uint64_t))(*(_QWORD *)a2 + 16))(a2, 4294967294))
      v19 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a2 + 24))(a2, 4294967294);
    (*(void (**)(uint64_t, __int128 *))(*(_QWORD *)a2 + 72))(a2, &v24);
    if (!*((_QWORD *)&v24 + 1))
      return 2;
    if (*((_QWORD *)&v25 + 1))
    {
      if (v19 == a3[3])
        v20 = 6;
      else
        v20 = 2;
      v21 = (*((uint64_t (**)(uint64_t, uint64_t, _QWORD, _QWORD *, uint64_t))&v25 + 1))(1, v20, *a3, a3, a2);
      if (v21 != 8)
      {
        if (v21 == 7)
          (*(void (**)(uint64_t))(*(_QWORD *)a2 + 80))(a2);
        return 2;
      }
      if (v19 == a3[3])
      {
        v22 = (FILE **)MEMORY[0x1E0C874E0];
        fprintf((FILE *)*MEMORY[0x1E0C874E0], "libunwind: %s - %s\n", "unwind_phase2", "during phase1 personality function said it would stop here, but now in phase2 it did not stop here");
        fflush(*v22);
        abort();
      }
    }
  }
  return 5;
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  uint64_t (*private_1)(uint64_t, uint64_t, _QWORD, _QWORD *, uint64_t, uint64_t);
  FILE **v3;
  _OWORD v4[102];
  unw_context_t __src;

  memset(&__src, 0, 512);
  memset(v4, 0, 512);
  unw_getcontext(&__src);
  private_1 = (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD *, uint64_t, uint64_t))exception_object->private_1;
  if (private_1)
    unwind_phase2_forced(&__src, (uint64_t)v4, exception_object, private_1, exception_object->private_2);
  else
    unwind_phase2(&__src, (uint64_t)v4, exception_object);
  v3 = (FILE **)MEMORY[0x1E0C874E0];
  fprintf((FILE *)*MEMORY[0x1E0C874E0], "libunwind: %s - %s\n", "_Unwind_Resume", "_Unwind_Resume() can't return");
  fflush(*v3);
  abort();
}

uint64_t unwind_phase2_forced(void *__src, uint64_t a2, _QWORD *a3, uint64_t (*a4)(uint64_t, uint64_t, _QWORD, _QWORD *, uint64_t, uint64_t), uint64_t a5)
{
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t result;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  *(_QWORD *)a2 = off_1EA9525E8;
  *(_QWORD *)(a2 + 8) = &libunwind::LocalAddressSpace::sThisAddressSpace;
  memcpy((void *)(a2 + 16), __src, 0x110uLL);
  v10 = *((_OWORD *)__src + 20);
  v12 = *((_OWORD *)__src + 17);
  v11 = *((_OWORD *)__src + 18);
  *(_OWORD *)(a2 + 320) = *((_OWORD *)__src + 19);
  *(_OWORD *)(a2 + 336) = v10;
  *(_OWORD *)(a2 + 288) = v12;
  *(_OWORD *)(a2 + 304) = v11;
  v13 = *((_OWORD *)__src + 24);
  v15 = *((_OWORD *)__src + 21);
  v14 = *((_OWORD *)__src + 22);
  *(_OWORD *)(a2 + 384) = *((_OWORD *)__src + 23);
  *(_OWORD *)(a2 + 400) = v13;
  *(_OWORD *)(a2 + 352) = v15;
  *(_OWORD *)(a2 + 368) = v14;
  v16 = *((_OWORD *)__src + 28);
  v18 = *((_OWORD *)__src + 25);
  v17 = *((_OWORD *)__src + 26);
  *(_OWORD *)(a2 + 448) = *((_OWORD *)__src + 27);
  *(_OWORD *)(a2 + 464) = v16;
  *(_OWORD *)(a2 + 416) = v18;
  *(_OWORD *)(a2 + 432) = v17;
  v19 = *((_OWORD *)__src + 32);
  v21 = *((_OWORD *)__src + 29);
  v20 = *((_OWORD *)__src + 30);
  *(_OWORD *)(a2 + 512) = *((_OWORD *)__src + 31);
  *(_OWORD *)(a2 + 528) = v19;
  *(_OWORD *)(a2 + 480) = v21;
  *(_OWORD *)(a2 + 496) = v20;
  *(_OWORD *)(a2 + 602) = 0u;
  *(_OWORD *)(a2 + 576) = 0u;
  *(_OWORD *)(a2 + 592) = 0u;
  *(_OWORD *)(a2 + 544) = 0u;
  *(_OWORD *)(a2 + 560) = 0u;
  libunwind::UnwindCursor<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::setInfoBasedOnIPRegister();
  while ((*(int (**)(uint64_t, uint64_t))(*(_QWORD *)a2 + 64))(a2, 1) >= 1)
  {
    v27 = 0;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    result = (*(uint64_t (**)(uint64_t, __int128 *))(*(_QWORD *)a2 + 72))(a2, &v23);
    if (!*((_QWORD *)&v23 + 1))
      return result;
    result = a4(1, 10, *a3, a3, a2, a5);
    if ((_DWORD)result)
      return result;
    if (*((_QWORD *)&v24 + 1))
    {
      result = (*((uint64_t (**)(uint64_t, uint64_t, _QWORD, _QWORD *, uint64_t))&v24 + 1))(1, 10, *a3, a3, a2);
      if ((_DWORD)result != 8)
      {
        if ((_DWORD)result != 7)
          return result;
        (*(void (**)(uint64_t))(*(_QWORD *)a2 + 80))(a2);
      }
    }
  }
  return a4(1, 26, *a3, a3, a2, a5);
}

_Unwind_Reason_Code _Unwind_ForcedUnwind(_Unwind_Exception *exception_object, _Unwind_Stop_Fn stop, void *stop_parameter)
{
  _OWORD v7[102];
  unw_context_t __src;

  memset(&__src, 0, 512);
  memset(v7, 0, 512);
  unw_getcontext(&__src);
  exception_object->private_1 = (uintptr_t)stop;
  exception_object->private_2 = (uintptr_t)stop_parameter;
  unwind_phase2_forced(&__src, (uint64_t)v7, exception_object, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD *, uint64_t, uint64_t))stop, (uint64_t)stop_parameter);
  return 2;
}

uintptr_t _Unwind_GetLanguageSpecificData(_Unwind_Context *context)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  uint64_t v6;

  v6 = 0;
  v4 = 0u;
  v5 = 0u;
  v2 = 0u;
  v3 = 0u;
  (*(void (**)(_Unwind_Context *, __int128 *))(*(_QWORD *)context + 72))(context, &v2);
  if (*((_QWORD *)&v2 + 1))
    return v3;
  else
    return 0;
}

uintptr_t _Unwind_GetRegionStart(_Unwind_Context *context)
{
  _OWORD v2[4];
  uint64_t v3;

  v3 = 0;
  memset(v2, 0, sizeof(v2));
  (*(void (**)(_Unwind_Context *, _OWORD *))(*(_QWORD *)context + 72))(context, v2);
  if (*((_QWORD *)&v2[0] + 1))
    return *(_QWORD *)&v2[0];
  else
    return 0;
}

void _Unwind_DeleteException(_Unwind_Exception *exception_object)
{
  void (__cdecl *exception_cleanup)(_Unwind_Reason_Code, _Unwind_Exception *);

  exception_cleanup = exception_object->exception_cleanup;
  if (exception_cleanup)
    ((void (*)(uint64_t, _Unwind_Exception *))exception_cleanup)(1, exception_object);
}

uintptr_t _Unwind_GetGR(_Unwind_Context *context, int index)
{
  uint64_t v2;

  v2 = *(_QWORD *)&index;
  if ((*(unsigned int (**)(_Unwind_Context *))(*(_QWORD *)context + 16))(context))
    return (*(uint64_t (**)(_Unwind_Context *, uint64_t))(*(_QWORD *)context + 24))(context, v2);
  else
    return 0;
}

void _Unwind_SetGR(_Unwind_Context *context, int index, uintptr_t new_value)
{
  uint64_t v4;
  uint64_t v6;
  _BYTE v7[32];
  uint64_t v8;

  v4 = *(_QWORD *)&index;
  if ((*(unsigned int (**)(_Unwind_Context *))(*(_QWORD *)context + 16))(context))
  {
    if ((_DWORD)v4 == -1)
    {
      (*(void (**)(_Unwind_Context *, _BYTE *))(*(_QWORD *)context + 72))(context, v7);
      v6 = (*(uint64_t (**)(_Unwind_Context *, uint64_t))(*(_QWORD *)context + 24))(context, 4294967294);
      if (v8)
        (*(void (**)(_Unwind_Context *, uint64_t, uint64_t))(*(_QWORD *)context + 32))(context, 4294967294, v8 + v6);
      (*(void (**)(_Unwind_Context *, uint64_t, uintptr_t))(*(_QWORD *)context + 32))(context, 0xFFFFFFFFLL, new_value);
      (*(void (**)(_Unwind_Context *, _QWORD))(*(_QWORD *)context + 104))(context, 0);
    }
    else
    {
      (*(void (**)(_Unwind_Context *, uint64_t, uintptr_t))(*(_QWORD *)context + 32))(context, v4, new_value);
    }
  }
}

uintptr_t _Unwind_GetIP(_Unwind_Context *context)
{
  if ((*(unsigned int (**)(_Unwind_Context *, uint64_t))(*(_QWORD *)context + 16))(context, 0xFFFFFFFFLL))
    return (*(uint64_t (**)(_Unwind_Context *, uint64_t))(*(_QWORD *)context + 24))(context, 0xFFFFFFFFLL);
  else
    return 0;
}

void _Unwind_SetIP(_Unwind_Context *a1, uintptr_t new_value)
{
  uint64_t v4;
  _BYTE v5[32];
  uint64_t v6;

  if ((*(unsigned int (**)(_Unwind_Context *, uint64_t))(*(_QWORD *)a1 + 16))(a1, 0xFFFFFFFFLL))
  {
    (*(void (**)(_Unwind_Context *, _BYTE *))(*(_QWORD *)a1 + 72))(a1, v5);
    v4 = (*(uint64_t (**)(_Unwind_Context *, uint64_t))(*(_QWORD *)a1 + 24))(a1, 4294967294);
    if (v6)
      (*(void (**)(_Unwind_Context *, uint64_t, uint64_t))(*(_QWORD *)a1 + 32))(a1, 4294967294, v6 + v4);
    (*(void (**)(_Unwind_Context *, uint64_t, uintptr_t))(*(_QWORD *)a1 + 32))(a1, 0xFFFFFFFFLL, new_value);
    (*(void (**)(_Unwind_Context *, _QWORD))(*(_QWORD *)a1 + 104))(a1, 0);
  }
}

_Unwind_Reason_Code _Unwind_Resume_or_Rethrow(_Unwind_Exception *exception_object)
{
  if (exception_object->private_1)
    _Unwind_Resume(exception_object);
  return _Unwind_RaiseException(exception_object);
}

uintptr_t _Unwind_GetDataRelBase(_Unwind_Context *context)
{
  FILE **v1;

  v1 = (FILE **)MEMORY[0x1E0C874E0];
  fprintf((FILE *)*MEMORY[0x1E0C874E0], "libunwind: %s - %s\n", "_Unwind_GetDataRelBase", "_Unwind_GetDataRelBase() not implemented");
  fflush(*v1);
  abort();
}

uintptr_t _Unwind_GetTextRelBase(_Unwind_Context *context)
{
  FILE **v1;

  v1 = (FILE **)MEMORY[0x1E0C874E0];
  fprintf((FILE *)*MEMORY[0x1E0C874E0], "libunwind: %s - %s\n", "_Unwind_GetTextRelBase", "_Unwind_GetTextRelBase() not implemented");
  fflush(*v1);
  abort();
}

void *__cdecl _Unwind_FindEnclosingFunction(void *pc)
{
  uint64_t v2;
  _OWORD v4[4];
  uint64_t v5;
  unw_context_t __src;
  _QWORD v7[2];
  _BYTE v8[272];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
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
  _BYTE v28[26];
  _BYTE v29[32];
  uint64_t v30;

  memset(&__src, 0, 512);
  v5 = 0;
  memset(v4, 0, sizeof(v4));
  unw_getcontext(&__src);
  v7[0] = off_1EA9525E8;
  v7[1] = &libunwind::LocalAddressSpace::sThisAddressSpace;
  memcpy(v8, &__src, sizeof(v8));
  v21 = *(_OWORD *)&__src.data[58];
  v22 = *(_OWORD *)&__src.data[60];
  v23 = *(_OWORD *)&__src.data[62];
  v24 = *(_OWORD *)&__src.data[64];
  v17 = *(_OWORD *)&__src.data[50];
  v18 = *(_OWORD *)&__src.data[52];
  v19 = *(_OWORD *)&__src.data[54];
  v20 = *(_OWORD *)&__src.data[56];
  v13 = *(_OWORD *)&__src.data[42];
  v14 = *(_OWORD *)&__src.data[44];
  v15 = *(_OWORD *)&__src.data[46];
  v16 = *(_OWORD *)&__src.data[48];
  v9 = *(_OWORD *)&__src.data[34];
  v10 = *(_OWORD *)&__src.data[36];
  v11 = *(_OWORD *)&__src.data[38];
  v12 = *(_OWORD *)&__src.data[40];
  v27 = 0u;
  memset(v28, 0, sizeof(v28));
  v25 = 0u;
  v26 = 0u;
  libunwind::UnwindCursor<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::setInfoBasedOnIPRegister();
  if ((*(unsigned int (**)(uint64_t, unsigned int))(v7[0] + 16))((uint64_t)v7, 0xFFFFFFFF))
  {
    (*(void (**)(uint64_t, uint64_t))(v7[0] + 72))((uint64_t)v7, (uint64_t)v29);
    v2 = (*(uint64_t (**)(uint64_t, unsigned int))(v7[0] + 24))((uint64_t)v7, 0xFFFFFFFE);
    if (v30)
      (*(void (**)(_QWORD *, unsigned int, uint64_t))(v7[0] + 32))(v7, 0xFFFFFFFE, v30 + v2);
    (*(void (**)(_QWORD *, unsigned int, uint64_t))(v7[0] + 32))(v7, 0xFFFFFFFF, (uint64_t)pc);
    (*(void (__cdecl **)())(v7[0] + 104))();
  }
  (*(void (**)(uint64_t, uint64_t))(v7[0] + 72))((uint64_t)v7, (uint64_t)v4);
  if (*((_QWORD *)&v4[0] + 1))
    return *(void **)&v4[0];
  else
    return 0;
}

_Unwind_Reason_Code _Unwind_Backtrace(_Unwind_Trace_Fn a1, void *a2)
{
  _Unwind_Reason_Code result;
  unw_context_t v5;
  _QWORD v6[2];
  _BYTE v7[272];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[26];

  memset(&v5, 0, 512);
  unw_getcontext(&v5);
  v6[0] = off_1EA9525E8;
  v6[1] = &libunwind::LocalAddressSpace::sThisAddressSpace;
  memcpy(v7, &v5, sizeof(v7));
  v20 = *(_OWORD *)&v5.data[58];
  v21 = *(_OWORD *)&v5.data[60];
  v22 = *(_OWORD *)&v5.data[62];
  v23 = *(_OWORD *)&v5.data[64];
  v16 = *(_OWORD *)&v5.data[50];
  v17 = *(_OWORD *)&v5.data[52];
  v18 = *(_OWORD *)&v5.data[54];
  v19 = *(_OWORD *)&v5.data[56];
  v12 = *(_OWORD *)&v5.data[42];
  v13 = *(_OWORD *)&v5.data[44];
  v14 = *(_OWORD *)&v5.data[46];
  v15 = *(_OWORD *)&v5.data[48];
  v8 = *(_OWORD *)&v5.data[34];
  v9 = *(_OWORD *)&v5.data[36];
  v10 = *(_OWORD *)&v5.data[38];
  v11 = *(_OWORD *)&v5.data[40];
  memset(v27, 0, sizeof(v27));
  v26 = 0u;
  v25 = 0u;
  v24 = 0u;
  libunwind::UnwindCursor<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::setInfoBasedOnIPRegister();
  while ((*(int (__cdecl **)())(v6[0] + 64))() >= 1)
  {
    result = ((unsigned int (*)(_QWORD *, void *))a1)(v6, a2);
    if (result)
      return result;
  }
  return 5;
}

const void *__cdecl _Unwind_Find_FDE(const void *pc, dwarf_eh_bases *a2)
{
  uint64_t v4;
  const void *result;
  _OWORD v6[3];
  __int128 v7;
  uintptr_t v8;
  unw_context_t __src;
  _QWORD v10[2];
  _BYTE v11[272];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
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
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[26];
  _BYTE v32[32];
  uint64_t v33;

  memset(&__src, 0, 512);
  v8 = 0;
  v7 = 0u;
  memset(v6, 0, sizeof(v6));
  unw_getcontext(&__src);
  v10[0] = off_1EA9525E8;
  v10[1] = &libunwind::LocalAddressSpace::sThisAddressSpace;
  memcpy(v11, &__src, sizeof(v11));
  v24 = *(_OWORD *)&__src.data[58];
  v25 = *(_OWORD *)&__src.data[60];
  v26 = *(_OWORD *)&__src.data[62];
  v27 = *(_OWORD *)&__src.data[64];
  v20 = *(_OWORD *)&__src.data[50];
  v21 = *(_OWORD *)&__src.data[52];
  v22 = *(_OWORD *)&__src.data[54];
  v23 = *(_OWORD *)&__src.data[56];
  v16 = *(_OWORD *)&__src.data[42];
  v17 = *(_OWORD *)&__src.data[44];
  v18 = *(_OWORD *)&__src.data[46];
  v19 = *(_OWORD *)&__src.data[48];
  v12 = *(_OWORD *)&__src.data[34];
  v13 = *(_OWORD *)&__src.data[36];
  v14 = *(_OWORD *)&__src.data[38];
  v15 = *(_OWORD *)&__src.data[40];
  v30 = 0u;
  memset(v31, 0, sizeof(v31));
  v28 = 0u;
  v29 = 0u;
  libunwind::UnwindCursor<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::setInfoBasedOnIPRegister();
  if ((*(unsigned int (**)(uint64_t, unsigned int))(v10[0] + 16))((uint64_t)v10, 0xFFFFFFFF))
  {
    (*(void (**)(uint64_t, uint64_t))(v10[0] + 72))((uint64_t)v10, (uint64_t)v32);
    v4 = (*(uint64_t (**)(uint64_t, unsigned int))(v10[0] + 24))((uint64_t)v10, 0xFFFFFFFE);
    if (v33)
      (*(void (**)(_QWORD *, unsigned int, uint64_t))(v10[0] + 32))(v10, 0xFFFFFFFE, v33 + v4);
    (*(void (**)(_QWORD *, unsigned int, uint64_t))(v10[0] + 32))(v10, 0xFFFFFFFF, (uint64_t)pc);
    (*(void (__cdecl **)())(v10[0] + 104))();
  }
  (*(void (**)(uint64_t, uint64_t))(v10[0] + 72))((uint64_t)v10, (uint64_t)v6);
  result = (const void *)*((_QWORD *)&v7 + 1);
  a2->tbase = v8;
  a2->dbase = 0;
  a2->func = *(_QWORD *)&v6[0];
  return result;
}

uintptr_t _Unwind_GetCFA(_Unwind_Context *a1)
{
  if ((*(unsigned int (**)(_Unwind_Context *, uint64_t))(*(_QWORD *)a1 + 16))(a1, 4294967294))
    return (*(uint64_t (**)(_Unwind_Context *, uint64_t))(*(_QWORD *)a1 + 24))(a1, 4294967294);
  else
    return 0;
}

uintptr_t _Unwind_GetIPInfo(_Unwind_Context *context, int *ipBefore)
{
  *ipBefore = (*(uint64_t (**)(_Unwind_Context *))(*(_QWORD *)context + 88))(context);
  if ((*(unsigned int (**)(_Unwind_Context *, uint64_t))(*(_QWORD *)context + 16))(context, 0xFFFFFFFFLL))
    return (*(uint64_t (**)(_Unwind_Context *, uint64_t))(*(_QWORD *)context + 24))(context, 0xFFFFFFFFLL);
  else
    return 0;
}

void __register_frame(const void *fde)
{
  unint64_t v1;
  unint64_t *v2;
  _BYTE v3[56];
  uint64_t v4[6];

  if (!libunwind::CFI_Parser<libunwind::LocalAddressSpace>::decodeFDE((unsigned int *)fde, v4, (uint64_t)v3, 0, v1, v2))
    libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::add(v4[0], v4[3], v4[4], v4[0]);
}

void __deregister_frame(const void *fde)
{
  __int128 *v2;
  __int128 *v3;
  __int128 *v4;
  __int128 v5;

  pthread_rwlock_wrlock(&libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_lock);
  v2 = libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_buffer[0];
  v3 = libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_bufferUsed;
  if (libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_buffer[0] >= libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_bufferUsed)
  {
    v4 = libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_buffer[0];
  }
  else
  {
    v4 = libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_buffer[0];
    do
    {
      if (*(const void **)v2 != fde)
      {
        if (v2 != v4)
        {
          v5 = v2[1];
          *v4 = *v2;
          v4[1] = v5;
        }
        v4 += 2;
      }
      v2 += 2;
    }
    while (v2 < v3);
  }
  libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_bufferUsed = v4;
  pthread_rwlock_unlock(&libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_lock);
}

uint64_t _dyld_find_unwind_sections()
{
  return MEMORY[0x1E0C872B8]();
}

void _dyld_register_func_for_remove_image(void (__cdecl *func)(const mach_header *, intptr_t))
{
  MEMORY[0x1E0C87320](func);
}

void abort(void)
{
  MEMORY[0x1E0C87558]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C87668](a1, a2);
}

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x1E0C87338](a1, a2);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1E0C876E8](a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C87730](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C88920](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C87798](__ptr, __size, __nitems, __stream);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C88978](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C87830](__dst, __src, __n);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C88DA0](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C88DA8](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C88DB0](a1);
}

